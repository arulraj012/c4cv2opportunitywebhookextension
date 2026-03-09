service opportunityService @(path: '/opportunityV2Ext/api/v1') {
    @open
    type object {};

    action prehook(entity : String, beforeImage : object, currentImage : object, context : object, userId : String, skipValidations : Boolean, isDryRun : Boolean, employeeId : String) returns object;

    action posthookValidation(entity : String,
                              beforeImage : object,
                              currentImage : object,
                              context : object,
                              userId : String,
                              skipValidations : Boolean,
                              isDryRun : Boolean,
                              employeeId : String) returns object;


}
