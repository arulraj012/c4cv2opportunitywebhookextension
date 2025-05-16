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
      const { entity, currentImage } = req.data;

      console.log('Payload posthook currentImage received:', JSON.stringify(currentImage));

      if (!Utils.isValidPayload(entity, currentImage)) {
        console.log('Missing required data or items');
        return { noChanges: true };
      }

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

      console.log('Payload Prehook currentImage received:', JSON.stringify(currentImage));

      if (!currentImage || !Array.isArray(currentImage.items) || currentImage.items.length === 0) {
        console.log('Missing required data or items');
        return { data: currentImage, noChanges: true };
      }

      const opptQuantityDB = beforeImage?.extensions?.QuantOpp?.content || 0;
      let opptQuantity = 0;
      let opptQuantityUnit ;

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