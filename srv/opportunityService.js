const cds = require('@sap/cds');

module.exports = async function (srv) {
  srv.on('posthookValidation', async (req) => {
    try {
      const { entity, currentImage } = req.data;

      console.log('Payload currentImage received:', JSON.stringify(currentImage));

      if (!isValidPayload(entity, currentImage)) {
        console.log('Missing required data or items');
        return { noChanges: true };
      }

      const validationErrors = [];
      const validationInfomsg = [];

      for (const item of currentImage.items) {
        console.log('Item:', JSON.stringify(item));

        const { errors, info } = validateItem(item);
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
};

// ─── Helper Functions ────────────────────────────────────────────────

function isValidPayload(entity, currentImage) {
  return entity && currentImage && Array.isArray(currentImage.items) && currentImage.items.length > 0;
}

function validateItem(item) {
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
