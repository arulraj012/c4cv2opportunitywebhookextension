const cds = require("@sap/cds");

class v2AccountService extends cds.ApplicationService {
  async init() {

    this.on("getAccountById", async (request) => {
      try {
        const accountId = request?.data?.id;
        if (!accountId) return request.reject(400, "Account ID is required.");
        console.log("account id :", accountId);
        // Connect to the external REST service
        const accountApi = await cds.connect.to("Account.Service");

       // console.log("account api :", accountApi);

        // Call the REST endpoint: GET /accounts/{accountId}
        const accountData = await accountApi.send("GET", `/accounts/${accountId}`);
         
        console.log("account data :", accountData);

        if (accountData && accountData.value) {
          return accountData.value;
        }

        return request.reject(404, "Account not found.");
      } catch (err) {
        console.error("Error fetching account:", err.message);
        return request.reject(500, "Error fetching account details.");
      }
    });

    return super.init();
  }
}

module.exports = v2AccountService;
