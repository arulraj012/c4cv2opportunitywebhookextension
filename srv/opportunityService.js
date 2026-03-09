const cds = require('@sap/cds');

module.exports = async function (srv) {

  class Utils {
    static isValidPayload(entity, currentImage) {
      return entity && currentImage && Array.isArray(currentImage.items) && currentImage.items.length > 0;
    }

    static validateItem(item) {
      const errors = [];
      const info = [];


      const netAmount = item?.netAmount?.content;
      const marketingCampaignId = item?.extensions?.ZMarketingCampaignID;

      if (!marketingCampaignId || marketingCampaignId.trim() === '') {
        console.log('Item validation error: marketingCampaignId is missing');
        errors.push({
          code: 'Opportunity_Item_Validation.10002',
          message: 'Marketing campaign ID is missing',
          target: '{marketingCampaignId}'
        });
      }

      if (netAmount === 0 || netAmount === null || netAmount === undefined) {
        console.log('Item validation error: netAmount cannot be zero or null');
        info.push({
          code: 'Opportunity_Item_Validation.10001',
          message: 'Opportunity netAmount is missing',
          target: '{netAmount}',
          severity: 'INFO'
        });
      }

      return { errors, info };
    }
  }

  srv.on('posthookValidation', async (req) => {
    try {
      const { entity, beforeImage, currentImage } = req.data;
      console.log('Payload posthook beforeImage received:', JSON.stringify(beforeImage));
      console.log('Payload posthook currentImage received:', JSON.stringify(currentImage));

      //current Image
      if (!Utils.isValidPayload(entity, currentImage) || currentImage.draftMode === true) {
        console.log('Missing required data or items');
        return { noChanges: true };
      }
      //before image
      if (!Utils.isValidPayload(entity, beforeImage) || beforeImage.draftMode === true)  {
        console.log('New Opportunity without items');
        return { noChanges: true };
      }
      if (
        !currentImage ||
        !currentImage.account ||
        !currentImage.account.id ||
        currentImage.account.id === ''
      ) {
        console.log('Account ID is missing or empty');
        return { noChanges: true };
      }

      // RULE: Check if the Account has 'Prospect' Role
      try {
        const v2AccountSrv = await cds.connect.to('v2AccountService');

        const accountData = await v2AccountSrv.getAccountById(currentImage.account.id);

        const accountRole = accountData?.customerRole;
        if (accountRole !== 'BUP002') {
          console.log('Account is not a Prospect (BUP002). Skipping further processing.');
          return { noChanges: true };
        }
      } catch (err) {
        console.error('Error while checking account role:', err.message);
        return { noChanges: true };

      }
      console.log('Account is a Prospect, further processing.');
      const validationErrors = [];
      const validationInfomsg = [];

      for (const item of currentImage.items) {
        console.log('Item:', JSON.stringify(item));

        const { errors, info } = Utils.validateItem(item);
        if (errors.length > 0) validationErrors.push(...errors);
        if (info.length > 0) validationInfomsg.push(...info);
      }

      if (validationErrors.length > 0 || validationInfomsg.length > 0) {
        return {
          noChanges: true,
          error: validationErrors,
          info: validationInfomsg
        };
      }
      if (validationErrors.length === 0) {

        const marketingCampaignId = item?.extensions?.ZMarketingCampaignID;
        if (marketingCampaignId !== null) {
          console.log('Marketing Campaign ID exists');
          return { noChanges: false, data: currentImage }
        }
        console.log('Validation passed, proceeding with further processing');
      }

      return { noChanges: true };

    } catch (error) {
      console.error('Exception in posthookValidation:', error);
      return {
        noChanges: true,
        error: [{
          code: 'Opportunity_Item_Validation.99999',
          message: 'An unexpected error occurred during validation',
          target: 'posthookValidation'
        }]
      };
    }
  });

  //
  this.on("prehook", async request => {
    try {
      const { currentImage, beforeImage } = request.data;
      console.log('Payload Prehook beforeImage received:', JSON.stringify(beforeImage));

      if (!currentImage || !Array.isArray(currentImage.items) || currentImage.items.length === 0) {
        console.log('Missing required data or items');
        return { data: currentImage, noChanges: true };
      }

      const opptQuantityDB = beforeImage?.extensions?.QuantOpp?.content || 0;
      let opptQuantity = 0;
      let opptQuantityUnit;

      for (const item of currentImage.items) {
        const quantity = item?.quantity?.content;
        if (quantity != null) {
          opptQuantity += quantity;
          opptQuantityUnit = item?.quantity?.uomCode;
        }
        console.log('Quantity Extensions updated using SalesCycle' + opptQuantity);
      }

      // Compare and set new value if changed
      if (opptQuantity !== opptQuantityDB) {
        currentImage.extensions = currentImage.extensions || {};
        currentImage.extensions.QuantOpp = {
          content: opptQuantity,
          uomCode: opptQuantityUnit
        };

        return { data: currentImage, noChanges: false };
      }


      return { data: currentImage, noChanges: true };

    } catch (error) {
      console.error('Exception in prehook:', error);
      return { data: request.data.currentImage, noChanges: true };
    }
  });

};