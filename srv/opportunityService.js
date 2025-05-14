const cds = require('@sap/cds');

class OpportunityV2Service extends cds.ApplicationService {
  init() {
    this.on('posthookValidation', async (req) => {
      try {
        const { entity, currentImage } = req.data;

        console.log('Payload currentImage received:', JSON.stringify(currentImage));

        if (!entity || !currentImage || !currentImage.items || !Array.isArray(currentImage.items)) {
          console.log('Missing required data or items');
          return { noChanges: true };
        }

        const validationErrors = [];

        for (const item of currentImage.items) {
          console.log('Item:', JSON.stringify(item));

          const netAmount = item?.netAmount?.content;

          if (netAmount === 0 || netAmount === null || netAmount === undefined) {
            console.log('Item validation error: netAmount cannot be zero or null');

            validationErrors.push({
              code: 'Opportunity_Item_Validation.10001',
              message: 'Opportunity netAmount is missing',
              target: 'netAmount'
            });
          }
        }

        if (validationErrors.length > 0) {
          return {
            noChanges: true,
            error: validationErrors
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

    return super.init();
  }
}

module.exports = OpportunityV2Service;
