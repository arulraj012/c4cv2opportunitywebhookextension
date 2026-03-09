/* checksum : 2e34c8feee9d12dec73bad46ef0a27bb */
@Capabilities.BatchSupported : false
@Capabilities.KeyAsSegmentSupported : true
@Core.Description : 'Account Service'
@Core.SchemaVersion : '1.0.0'
@Core.LongDescription : 'Account management offers a holistic view of the customer, and allows you to capture, monitor, store and track all critical business information about customers and prospects.'
service Account.Service {};

@Common.Label : 'Account'
@Core.Description : 'Query accounts in the system.'
@Core.LongDescription : 'Specify query parameters to return desired account records from the system.'
@openapi.path : '/sap/c4c/api/v1/account-service/accounts'
function Account.Service.sap_c4c_api_v1_account_service_accounts(
  @description : 'Skip the first n accounts.'
  @openapi.in : 'query'
  @openapi.name : '$skip'
  _skip : Integer,
  @description : 'Show only the first n accounts.'
  @openapi.in : 'query'
  @openapi.name : '$top'
  _top : Integer,
  @description : 'Search for a string within accounts.'
  @openapi.in : 'query'
  @openapi.name : '$search'
  _search : String,
  @description : 'Filter accounts by attribute.'
  @openapi.in : 'query'
  @openapi.name : '$filter'
  _filter : String,
  @description : 'Order accounts by attribute.'
  @openapi.in : 'query'
  @openapi.name : '$orderby'
  _orderby : String,
  @description : 'Select attributes to be returned.'
  @openapi.in : 'query'
  @openapi.name : '$select'
  _select : String,
  @description : 'Exclude attributes from response.'
  @openapi.in : 'query'
  @openapi.name : '$exclude'
  _exclude : String,
  @description : 'Indicates if count of accounts to be returned.'
  @openapi.in : 'query'
  @openapi.name : '$count'
  _count : Boolean,
  @description : 'Run a specific query in account service.'
  @openapi.in : 'query'
  @openapi.name : '$query'
  _query : String
) returns Account.Service_types.Accountqueryresponse;

@Common.Label : 'Account'
@Core.Description : 'Create a new account.'
@Core.LongDescription : 'Send account information to the system to create a new account.'
@openapi.path : '/sap/c4c/api/v1/account-service/accounts'
action Account.Service.sap_c4c_api_v1_account_service_accounts_post(
  @description : 'Do not use'
  @openapi.in : 'query'
  @openapi.name : '$sourceid'
  _sourceid : UUID,
  @description : 'Do not use'
  @openapi.in : 'query'
  @openapi.name : '$sourcetype'
  _sourcetype : String,
  @openapi.in : 'body'
  body : Account.Service_types.Accountcreaterequest
) returns Account.Service_types.Accountfile;

@Common.Label : 'Account'
@Core.Description : 'Read account information'
@Core.LongDescription : 'Read a specific account using the account ID.'
@openapi.path : '/sap/c4c/api/v1/account-service/accounts/{id}'
function Account.Service.sap_c4c_api_v1_account_service_accounts_(
  @description : 'Account ID'
  @openapi.in : 'path'
  id : UUID
) returns Account.Service_types.Accountfile;

@Common.Label : 'Account'
@Core.Description : 'Update or Modify data'
@Core.LongDescription : 'Update account attributes in the system.'
@openapi.method : 'PATCH'
@openapi.path : '/sap/c4c/api/v1/account-service/accounts/{id}'
action Account.Service.sap_c4c_api_v1_account_service_accounts__patch(
  @description : 'Account ID'
  @openapi.in : 'path'
  id : UUID,
  @openapi.contentType : 'application/merge-patch+json'
  @openapi.in : 'body'
  body : Account.Service_types.Accountpatchupdaterequest
);

type Account.Service_types.error {
  error : {
    code : String;
    details : many {
      message : String;
      code : String;
      target : String;
    };
    message : String;
    target : String;
  };
};

@title : 'Account query response'
type Account.Service_types.Accountqueryresponse {
  count : Integer;
  value : many {
    @title : 'Technical ID'
    id : UUID;
    @title : 'Account ID'
    displayId : String(10);
    isProspect : Boolean;
    @title : 'Role'
    customerRole : String(6);
    @title : 'Role'
    customerRoleDescription : String(255);
    @title : 'Full Name'
    formattedName : String(255);
    @title : 'ABC - Classification'
    customerABCClassification : String(1);
    @title : 'ABC - Classification'
    customerABCClassificationDescription : String(255);
    @title : 'Nielsen ID'
    nielsenRegion : String(2);
    @title : 'Nielsen ID'
    nielsenRegionDescription : String(255);
    @title : 'Status'
    lifeCycleStatus : String(14);
    @title : 'Status'
    lifeCycleStatusDescription : String(255);
    isNaturalPerson : Boolean;
    blockingReasons : {
      @title : 'Billing Block'
      invoicingBlockingReason : String(2);
      @title : 'Billing Block'
      invoicingBlockingReasonDescription : String(255);
      @title : 'Delivery Block'
      deliveryBlockingReason : String(2);
      @title : 'Delivery Block'
      deliveryBlockingReasonDescription : String(255);
      @title : 'Order Block'
      orderBlockingReason : String(2);
      @title : 'Order Block'
      orderBlockingReasonDescription : String(255);
      isSalesSupportBlocked : Boolean;
    };
    @title : 'Name'
    firstLineName : String(40);
    @title : 'Additional Name'
    secondLineName : String(40);
    @title : 'Additional Name 2'
    thirdLineName : String(40);
    @title : 'Additional Name 3'
    fourthLineName : String(40);
    @title : 'Industry'
    industrialSector : String(10);
    @title : 'Industry'
    industrialSectorDescription : String(255);
    @title : 'Legal Form'
    companyLegalForm : String(2);
    @title : 'Legal Form'
    companyLegalFormDescription : String(255);
    @title : 'Contact Permission'
    contactAllowed : String(2);
    @title : 'Contact Permission'
    contactAllowedDescription : String(255);
    @title : 'D-U-N-S'
    dunAndBradstreetId : String(60);
    @title : 'Main Contact Technical ID'
    primaryContactId : UUID;
    @title : 'Main Contact ID'
    primaryContactDisplayId : String(10);
    @title : 'Main Contact'
    primaryContactformattedName : String(255);
    @title : 'Owner Technical ID'
    ownerId : UUID;
    @title : 'Owner'
    ownerFormattedName : String(255);
    @title : 'Default External Business Partner ID'
    defaultExternalBusinessPartnerId : String(100);
    @title : 'Default External Customerid'
    defaultExternalCustomerId : String(100);
    defaultAddress : {
      @title : 'Country/Region'
      country : String(3);
      @title : 'Country/Region'
      countryDescription : String(255);
      region : {
        @title : 'Country/Region'
        country : String(3);
        @title : 'State'
        region : String(6);
      };
      @title : 'State'
      regionDescription : String(255);
      @title : 'Postal Code'
      postalCode : String(10);
      @title : 'City'
      cityName : String(40);
      @title : 'Street'
      streetName : String(80);
      @title : 'House Number'
      houseId : String(10);
      @title : 'County'
      countyName : String(40);
      @title : 'District'
      districtName : String(40);
      @title : 'Address Line 1'
      streetPrefixName : String(40);
      @title : 'Address Line 2'
      additionalStreetPrefixName : String(40);
      @title : 'Address Line 4'
      streetSuffixName : String(40);
      @title : 'Address Line 5'
      additionalStreetSuffixName : String(40);
      @title : 'P.O. Box'
      postOfficeBoxId : String(10);
      isPostOfficeBoxAddress : Boolean;
      latitudeMeasure : Decimal;
      longitudeMeasure : Decimal;
      isInternalGeoLocation : Boolean;
      @title : 'Language'
      correspondenceLanguage : String(5);
      @title : 'Language'
      correspondenceLanguageDescription : String(255);
      @title : 'Best Reached By'
      preferredCommunicationMediumType : String(3);
      @title : 'Best Reached By'
      preferredCommunicationMediumTypeDescription : String(255);
      @title : 'Anubhav'
      formattedPostalAddressDescription : String(255);
      @title : 'Different City'
      additionalCityName : String(40);
      @title : 'Additional House Number'
      additionalHouseId : String(10);
      @title : 'C/O'
      careOfName : String(40);
    };
    defaultCommunication : {
      @title : 'Email'
      eMail : String(255);
      @title : 'Website'
      web : String(1280);
      @title : 'Fax'
      facsimileFormattedNumber : String(40);
      @title : 'Phone'
      phoneFormattedNumber : String(40);
      @title : 'Normalized Phone'
      phoneNormalisedNumber : String(40);
      @title : 'Mobile'
      mobileFormattedNumber : String(40);
      @title : 'Normalized Mobile'
      mobileNormalisedNumber : String(40);
    };
    isBusinessPurposeCompleted : Boolean;
    adminData : {
      createdOn : Timestamp;
      @title : 'Created By'
      createdBy : UUID;
      @title : 'Created By Name'
      createdByName : String;
      updatedOn : Timestamp;
      @title : 'Changed By'
      updatedBy : UUID;
      @title : 'Changed By Name'
      updatedByName : String;
    };
    addresses : many {
      @title : 'Technical ID'
      id : UUID;
      @title : 'Parent Technical ID'
      parentId : UUID;
      @title : 'Address Technical ID'
      addressId : UUID;
      isDefaultAddress : Boolean;
      @title : 'Country/Region'
      country : String(3);
      @title : 'Country/Region'
      countryDescription : String(255);
      region : {
        @title : 'Country/Region'
        country : String(3);
        @title : 'State'
        region : String(6);
      };
      @title : 'State'
      regionDescription : String(255);
      @title : 'City'
      cityName : String(40);
      @title : 'Street'
      streetName : String(80);
      @title : 'House Number'
      houseId : String(10);
      @title : 'Postal Code'
      postalCode : String(10);
      @title : 'County'
      countyName : String(40);
      @title : 'District'
      districtName : String(40);
      @title : 'Address Line 1'
      streetPrefixName : String(40);
      @title : 'Address Line 2'
      additionalStreetPrefixName : String(40);
      @title : 'Address Line 4'
      streetSuffixName : String(40);
      @title : 'Address Line 5'
      additionalStreetSuffixName : String(40);
      @title : 'P.O. Box'
      postOfficeBoxId : String(10);
      isPostOfficeBoxAddress : Boolean;
      @title : 'Anubhav'
      formattedPostalAddressDescription : String(255);
      @title : 'Different City'
      additionalCityName : String(40);
      @title : 'Additional House Number'
      additionalHouseId : String(10);
      @title : 'C/O'
      careOfName : String(40);
      latitudeMeasure : Double;
      longitudeMeasure : Double;
      isInternalGeoLocation : Boolean;
      @title : 'Language'
      correspondenceLanguage : String(5);
      @title : 'Language'
      correspondenceLanguageDescription : String(255);
      @title : 'Best Reached By'
      preferredCommunicationMediumType : String(3);
      @title : 'Best Reached By'
      preferredCommunicationMediumTypeDescription : String(255);
      @title : 'Email'
      eMail : String(255);
      @title : 'Website'
      web : String(1280);
      @title : 'Fax'
      facsimileFormattedNumber : String(40);
      @title : 'Phone'
      phoneFormattedNumber : String(40);
      @title : 'Normalized Phone'
      phoneNormalisedNumber : String(40);
      @title : 'Mobile'
      mobileFormattedNumber : String(40);
      @title : 'Normalized Mobile'
      mobileNormalisedNumber : String(40);
    };
    identifications : many {
      @title : 'Technical ID'
      id : UUID;
      @title : 'ID Type'
      type : String(6);
      @title : 'ID Type'
      typeDescription : String(255);
      @title : 'ID Number'
      identificationId : String(60);
      validFrom : Date;
      validTo : Date;
      @title : 'Institution Responsible'
      identifierIssuingAgencyName : String(40);
      entryDate : Date;
      @title : 'Country/Region'
      areaOfValidityCountry : String(3);
      @title : 'Country/Region'
      areaOfValidityCountryDescription : String(255);
      areaOfValidityRegion : {
        @title : 'Country/Region'
        country : String(3);
        @title : 'State'
        region : String(6);
      };
      @title : 'State'
      areaOfValidityRegionDescription : String(255);
    };
    salesArrangements : many {
      @title : 'Technical ID'
      id : UUID;
      @title : 'Sales Organization Technical ID'
      salesOrganizationId : UUID;
      @title : 'Sales Organization ID'
      salesOrganizationDisplayId : String(50);
      @title : 'Sales Organization Name'
      salesOrganizationName : String(40);
      @title : 'Distribution Channel'
      distributionChannel : String(2);
      @title : 'Distribution Channel'
      distributionChannelDescription : String(50);
      @title : 'Division'
      division : String(2);
      @title : 'Division'
      divisionDescription : String(50);
      isMarkedForDeletion : Boolean;
      @title : 'Sales Office Technical ID'
      salesOfficeId : UUID;
      @title : 'Sales Office ID'
      salesOfficeDisplayId : String(50);
      @title : 'Sales Office'
      salesOfficeName : String(40);
      @title : 'Sales Group Technical ID'
      salesGroupId : UUID;
      @title : 'Sales Group ID'
      salesGroupDisplayId : String(50);
      @title : 'Sales Group'
      salesGroupName : String(40);
      @title : 'Delivery Priority'
      deliveryPriority : String(2);
      @title : 'Delivery Priority'
      deliveryPriorityDescription : String(255);
      isCompleteDeliveryRequested : Boolean;
      @title : 'Currency'
      currency : String(3);
      @title : 'Currency'
      currencyDescription : String(50);
      @title : 'Customer Group'
      customerGroup : String(2);
      @title : 'Customer Group'
      customerGroupDescription : String(255);
      @title : 'Price List'
      customerPriceListType : String(2);
      @title : 'Price List'
      customerPriceListTypeDescription : String(255);
      @title : 'Price Group'
      priceSpecificationCustomerGroup : String(2);
      @title : 'Price Group'
      priceSpecificationCustomerGroupDescription : String(255);
      @title : 'Cash Discount Terms'
      cashDiscountTerms : String(4);
      @title : 'Cash Discount Terms'
      cashDiscountTermsDescription : String(255);
      incoterms : {
        @title : 'Incoterms'
        classification : String(3);
        @title : 'Incoterms'
        classificationDescription : String(255);
        @title : 'Incoterms Location'
        transferLocationName : String(28);
      };
      blockingReasons : {
        @title : 'Billing Block'
        invoicingBlockingReason : String(2);
        @title : 'Billing Block'
        invoicingBlockingReasonDescription : String(255);
        @title : 'Delivery Block'
        deliveryBlockingReason : String(2);
        @title : 'Delivery Block'
        deliveryBlockingReasonDescription : String(255);
        @title : 'Order Block'
        orderBlockingReason : String(2);
        @title : 'Order Block'
        orderBlockingReasonDescription : String(255);
        isSalesSupportBlocked : Boolean;
      };
    };
    hasContactPersons : many {
      @title : 'Technical ID'
      id : UUID;
      @title : 'Contact Technical ID'
      contactId : UUID;
      @title : 'Contact ID'
      contactDisplayId : String(10);
      @title : 'Contact Name'
      contactFormattedName : String(255);
      isDefault : Boolean;
    };
    relationships : many {
      @title : 'Technical ID'
      id : UUID;
      @title : 'Business Partner Relationship Technical ID'
      relationshipId : UUID;
      @title : 'Business Partner Relationship Role'
      directedRelationshipRole : String(8);
      @title : 'Business Partner Relationship Role'
      directedRelationshipRoleDescription : String(255);
      @title : 'Business Partner Technical ID'
      businessPartnerId : UUID;
      @title : 'Business Partner ID'
      businessPartnerDisplayId : String(10);
      @title : 'Business Partner - Formatted Name'
      businessPartnerFormattedName : String(255);
      @title : 'Sales Organization Technical ID'
      salesOrganizationId : UUID;
      @title : 'Sales Organization ID'
      salesOrganizationDisplayId : String(50);
      @title : 'Sales Organization Name'
      salesOrganizationName : String(40);
      @title : 'Distribution Channel'
      distributionChannel : String(2);
      @title : 'Distribution Channel'
      distributionChannelDescription : String(255);
      @title : 'Division'
      division : String(2);
      @title : 'Division'
      divisionDescription : String(255);
      isDefault : Boolean;
      adminData : {
        createdOn : Timestamp;
        @title : 'Created By'
        createdBy : UUID;
        @title : 'Created By Name'
        createdByName : String;
        updatedOn : Timestamp;
        @title : 'Changed By'
        updatedBy : UUID;
        @title : 'Changed By Name'
        updatedByName : String;
      };
    };
    accountTeamMembers : many {
      @title : 'Technical ID'
      id : UUID;
      @title : 'Employee Technical ID'
      employeeId : UUID;
      @title : 'Employee ID'
      employeeDisplayId : String(20);
      @title : 'Employee Name'
      employeeFormattedName : String(255);
      @title : 'Role'
      role : String;
      @title : 'Role'
      roleDescription : String(255);
      @title : 'Sales Organization Technical ID'
      salesOrganizationId : UUID;
      @title : 'Sales Organization ID'
      salesOrganizationDisplayId : String(50);
      @title : 'Sales Organization Name'
      salesOrganizationName : String(40);
      @title : 'Distribution Channel'
      distributionChannel : String(2);
      @title : 'Distribution Channel'
      distributionChannelDescription : String(50);
      @title : 'Division'
      division : String(2);
      @title : 'Division'
      divisionDescription : String(50);
      isDefault : Boolean;
      validFrom : Date;
      validTo : Date;
    };
    salesTerritories : many {
      @title : 'Technical ID'
      id : UUID;
      @title : 'Territory Technical ID'
      salesTerritoryId : UUID;
      @title : 'Territory ID'
      salesTerritoryDisplayId : String(6);
      @title : 'Territory Name'
      salesTerritoryName : String(40);
      isBlockedForRealignmentRun : Boolean;
      isDefault : Boolean;
    };
    attachments : many {
      @title : 'Technical ID'
      id : UUID;
      @title : 'Title'
      title : String;
      @title : 'Type'
      type : String;
      @title : 'Category'
      category : String;
      fileSize : Decimal;
      @title : 'File Name'
      fileName : String;
      @title : 'Content Type'
      contentType : String;
      @title : 'URL'
      url : String;
    };
    externalIds : many {
      id : UUID;
      externalId : String(100);
      communicationSystemId : UUID;
      communicationSystemDisplayId : String;
      type : String(15);
      isDefault : Boolean;
    };
  };
};

@title : 'Account file'
type Account.Service_types.Accountfile {
  value : {
    @title : 'Technical ID'
    id : UUID;
    @title : 'Account ID'
    displayId : String(10);
    isProspect : Boolean;
    @title : 'Role'
    customerRole : String(6);
    @title : 'Role'
    customerRoleDescription : String(255);
    @title : 'Full Name'
    formattedName : String(255);
    @title : 'ABC - Classification'
    customerABCClassification : String(1);
    @title : 'ABC - Classification'
    customerABCClassificationDescription : String(255);
    @title : 'Nielsen ID'
    nielsenRegion : String(2);
    @title : 'Nielsen ID'
    nielsenRegionDescription : String(255);
    @title : 'Status'
    lifeCycleStatus : String(14);
    @title : 'Status'
    lifeCycleStatusDescription : String(255);
    isNaturalPerson : Boolean;
    blockingReasons : {
      @title : 'Billing Block'
      invoicingBlockingReason : String(2);
      @title : 'Billing Block'
      invoicingBlockingReasonDescription : String(255);
      @title : 'Delivery Block'
      deliveryBlockingReason : String(2);
      @title : 'Delivery Block'
      deliveryBlockingReasonDescription : String(255);
      @title : 'Order Block'
      orderBlockingReason : String(2);
      @title : 'Order Block'
      orderBlockingReasonDescription : String(255);
      isSalesSupportBlocked : Boolean;
    };
    @title : 'Name'
    firstLineName : String(40);
    @title : 'Additional Name'
    secondLineName : String(40);
    @title : 'Additional Name 2'
    thirdLineName : String(40);
    @title : 'Additional Name 3'
    fourthLineName : String(40);
    @title : 'Industry'
    industrialSector : String(10);
    @title : 'Industry'
    industrialSectorDescription : String(255);
    @title : 'Legal Form'
    companyLegalForm : String(2);
    @title : 'Legal Form'
    companyLegalFormDescription : String(255);
    @title : 'Contact Permission'
    contactAllowed : String(2);
    @title : 'Contact Permission'
    contactAllowedDescription : String(255);
    @title : 'D-U-N-S'
    dunAndBradstreetId : String(60);
    @title : 'Main Contact Technical ID'
    primaryContactId : UUID;
    @title : 'Main Contact ID'
    primaryContactDisplayId : String(10);
    @title : 'Main Contact'
    primaryContactformattedName : String(255);
    @title : 'Owner Technical ID'
    ownerId : UUID;
    @title : 'Owner'
    ownerFormattedName : String(255);
    @title : 'Default External Business Partner ID'
    defaultExternalBusinessPartnerId : String(100);
    @title : 'Default External Customerid'
    defaultExternalCustomerId : String(100);
    defaultAddress : {
      @title : 'Country/Region'
      country : String(3);
      @title : 'Country/Region'
      countryDescription : String(255);
      region : {
        @title : 'Country/Region'
        country : String(3);
        @title : 'State'
        region : String(6);
      };
      @title : 'State'
      regionDescription : String(255);
      @title : 'Postal Code'
      postalCode : String(10);
      @title : 'City'
      cityName : String(40);
      @title : 'Street'
      streetName : String(80);
      @title : 'House Number'
      houseId : String(10);
      @title : 'County'
      countyName : String(40);
      @title : 'District'
      districtName : String(40);
      @title : 'Address Line 1'
      streetPrefixName : String(40);
      @title : 'Address Line 2'
      additionalStreetPrefixName : String(40);
      @title : 'Address Line 4'
      streetSuffixName : String(40);
      @title : 'Address Line 5'
      additionalStreetSuffixName : String(40);
      @title : 'P.O. Box'
      postOfficeBoxId : String(10);
      isPostOfficeBoxAddress : Boolean;
      latitudeMeasure : Decimal;
      longitudeMeasure : Decimal;
      isInternalGeoLocation : Boolean;
      @title : 'Language'
      correspondenceLanguage : String(5);
      @title : 'Language'
      correspondenceLanguageDescription : String(255);
      @title : 'Best Reached By'
      preferredCommunicationMediumType : String(3);
      @title : 'Best Reached By'
      preferredCommunicationMediumTypeDescription : String(255);
      @title : 'Anubhav'
      formattedPostalAddressDescription : String(255);
      @title : 'Different City'
      additionalCityName : String(40);
      @title : 'Additional House Number'
      additionalHouseId : String(10);
      @title : 'C/O'
      careOfName : String(40);
    };
    defaultCommunication : {
      @title : 'Email'
      eMail : String(255);
      @title : 'Website'
      web : String(1280);
      @title : 'Fax'
      facsimileFormattedNumber : String(40);
      @title : 'Phone'
      phoneFormattedNumber : String(40);
      @title : 'Normalized Phone'
      phoneNormalisedNumber : String(40);
      @title : 'Mobile'
      mobileFormattedNumber : String(40);
      @title : 'Normalized Mobile'
      mobileNormalisedNumber : String(40);
    };
    isBusinessPurposeCompleted : Boolean;
    adminData : {
      createdOn : Timestamp;
      @title : 'Created By'
      createdBy : UUID;
      @title : 'Created By Name'
      createdByName : String;
      updatedOn : Timestamp;
      @title : 'Changed By'
      updatedBy : UUID;
      @title : 'Changed By Name'
      updatedByName : String;
    };
    addresses : many {
      @title : 'Technical ID'
      id : UUID;
      @title : 'Parent Technical ID'
      parentId : UUID;
      @title : 'Address Technical ID'
      addressId : UUID;
      isDefaultAddress : Boolean;
      @title : 'Country/Region'
      country : String(3);
      @title : 'Country/Region'
      countryDescription : String(255);
      region : {
        @title : 'Country/Region'
        country : String(3);
        @title : 'State'
        region : String(6);
      };
      @title : 'State'
      regionDescription : String(255);
      @title : 'City'
      cityName : String(40);
      @title : 'Street'
      streetName : String(80);
      @title : 'House Number'
      houseId : String(10);
      @title : 'Postal Code'
      postalCode : String(10);
      @title : 'County'
      countyName : String(40);
      @title : 'District'
      districtName : String(40);
      @title : 'Address Line 1'
      streetPrefixName : String(40);
      @title : 'Address Line 2'
      additionalStreetPrefixName : String(40);
      @title : 'Address Line 4'
      streetSuffixName : String(40);
      @title : 'Address Line 5'
      additionalStreetSuffixName : String(40);
      @title : 'P.O. Box'
      postOfficeBoxId : String(10);
      isPostOfficeBoxAddress : Boolean;
      @title : 'Anubhav'
      formattedPostalAddressDescription : String(255);
      @title : 'Different City'
      additionalCityName : String(40);
      @title : 'Additional House Number'
      additionalHouseId : String(10);
      @title : 'C/O'
      careOfName : String(40);
      latitudeMeasure : Double;
      longitudeMeasure : Double;
      isInternalGeoLocation : Boolean;
      @title : 'Language'
      correspondenceLanguage : String(5);
      @title : 'Language'
      correspondenceLanguageDescription : String(255);
      @title : 'Best Reached By'
      preferredCommunicationMediumType : String(3);
      @title : 'Best Reached By'
      preferredCommunicationMediumTypeDescription : String(255);
      @title : 'Email'
      eMail : String(255);
      @title : 'Website'
      web : String(1280);
      @title : 'Fax'
      facsimileFormattedNumber : String(40);
      @title : 'Phone'
      phoneFormattedNumber : String(40);
      @title : 'Normalized Phone'
      phoneNormalisedNumber : String(40);
      @title : 'Mobile'
      mobileFormattedNumber : String(40);
      @title : 'Normalized Mobile'
      mobileNormalisedNumber : String(40);
    };
    identifications : many {
      @title : 'Technical ID'
      id : UUID;
      @title : 'ID Type'
      type : String(6);
      @title : 'ID Type'
      typeDescription : String(255);
      @title : 'ID Number'
      identificationId : String(60);
      validFrom : Date;
      validTo : Date;
      @title : 'Institution Responsible'
      identifierIssuingAgencyName : String(40);
      entryDate : Date;
      @title : 'Country/Region'
      areaOfValidityCountry : String(3);
      @title : 'Country/Region'
      areaOfValidityCountryDescription : String(255);
      areaOfValidityRegion : {
        @title : 'Country/Region'
        country : String(3);
        @title : 'State'
        region : String(6);
      };
      @title : 'State'
      areaOfValidityRegionDescription : String(255);
    };
    salesArrangements : many {
      @title : 'Technical ID'
      id : UUID;
      @title : 'Sales Organization Technical ID'
      salesOrganizationId : UUID;
      @title : 'Sales Organization ID'
      salesOrganizationDisplayId : String(50);
      @title : 'Sales Organization Name'
      salesOrganizationName : String(40);
      @title : 'Distribution Channel'
      distributionChannel : String(2);
      @title : 'Distribution Channel'
      distributionChannelDescription : String(50);
      @title : 'Division'
      division : String(2);
      @title : 'Division'
      divisionDescription : String(50);
      isMarkedForDeletion : Boolean;
      @title : 'Sales Office Technical ID'
      salesOfficeId : UUID;
      @title : 'Sales Office ID'
      salesOfficeDisplayId : String(50);
      @title : 'Sales Office'
      salesOfficeName : String(40);
      @title : 'Sales Group Technical ID'
      salesGroupId : UUID;
      @title : 'Sales Group ID'
      salesGroupDisplayId : String(50);
      @title : 'Sales Group'
      salesGroupName : String(40);
      @title : 'Delivery Priority'
      deliveryPriority : String(2);
      @title : 'Delivery Priority'
      deliveryPriorityDescription : String(255);
      isCompleteDeliveryRequested : Boolean;
      @title : 'Currency'
      currency : String(3);
      @title : 'Currency'
      currencyDescription : String(50);
      @title : 'Customer Group'
      customerGroup : String(2);
      @title : 'Customer Group'
      customerGroupDescription : String(255);
      @title : 'Price List'
      customerPriceListType : String(2);
      @title : 'Price List'
      customerPriceListTypeDescription : String(255);
      @title : 'Price Group'
      priceSpecificationCustomerGroup : String(2);
      @title : 'Price Group'
      priceSpecificationCustomerGroupDescription : String(255);
      @title : 'Cash Discount Terms'
      cashDiscountTerms : String(4);
      @title : 'Cash Discount Terms'
      cashDiscountTermsDescription : String(255);
      incoterms : {
        @title : 'Incoterms'
        classification : String(3);
        @title : 'Incoterms'
        classificationDescription : String(255);
        @title : 'Incoterms Location'
        transferLocationName : String(28);
      };
      blockingReasons : {
        @title : 'Billing Block'
        invoicingBlockingReason : String(2);
        @title : 'Billing Block'
        invoicingBlockingReasonDescription : String(255);
        @title : 'Delivery Block'
        deliveryBlockingReason : String(2);
        @title : 'Delivery Block'
        deliveryBlockingReasonDescription : String(255);
        @title : 'Order Block'
        orderBlockingReason : String(2);
        @title : 'Order Block'
        orderBlockingReasonDescription : String(255);
        isSalesSupportBlocked : Boolean;
      };
    };
    hasContactPersons : many {
      @title : 'Technical ID'
      id : UUID;
      @title : 'Contact Technical ID'
      contactId : UUID;
      @title : 'Contact ID'
      contactDisplayId : String(10);
      @title : 'Contact Name'
      contactFormattedName : String(255);
      isDefault : Boolean;
    };
    relationships : many {
      @title : 'Technical ID'
      id : UUID;
      @title : 'Business Partner Relationship Technical ID'
      relationshipId : UUID;
      @title : 'Business Partner Relationship Role'
      directedRelationshipRole : String(8);
      @title : 'Business Partner Relationship Role'
      directedRelationshipRoleDescription : String(255);
      @title : 'Business Partner Technical ID'
      businessPartnerId : UUID;
      @title : 'Business Partner ID'
      businessPartnerDisplayId : String(10);
      @title : 'Business Partner - Formatted Name'
      businessPartnerFormattedName : String(255);
      @title : 'Sales Organization Technical ID'
      salesOrganizationId : UUID;
      @title : 'Sales Organization ID'
      salesOrganizationDisplayId : String(50);
      @title : 'Sales Organization Name'
      salesOrganizationName : String(40);
      @title : 'Distribution Channel'
      distributionChannel : String(2);
      @title : 'Distribution Channel'
      distributionChannelDescription : String(255);
      @title : 'Division'
      division : String(2);
      @title : 'Division'
      divisionDescription : String(255);
      isDefault : Boolean;
      adminData : {
        createdOn : Timestamp;
        @title : 'Created By'
        createdBy : UUID;
        @title : 'Created By Name'
        createdByName : String;
        updatedOn : Timestamp;
        @title : 'Changed By'
        updatedBy : UUID;
        @title : 'Changed By Name'
        updatedByName : String;
      };
    };
    accountTeamMembers : many {
      @title : 'Technical ID'
      id : UUID;
      @title : 'Employee Technical ID'
      employeeId : UUID;
      @title : 'Employee ID'
      employeeDisplayId : String(20);
      @title : 'Employee Name'
      employeeFormattedName : String(255);
      @title : 'Role'
      role : String;
      @title : 'Role'
      roleDescription : String(255);
      @title : 'Sales Organization Technical ID'
      salesOrganizationId : UUID;
      @title : 'Sales Organization ID'
      salesOrganizationDisplayId : String(50);
      @title : 'Sales Organization Name'
      salesOrganizationName : String(40);
      @title : 'Distribution Channel'
      distributionChannel : String(2);
      @title : 'Distribution Channel'
      distributionChannelDescription : String(50);
      @title : 'Division'
      division : String(2);
      @title : 'Division'
      divisionDescription : String(50);
      isDefault : Boolean;
      validFrom : Date;
      validTo : Date;
    };
    salesTerritories : many {
      @title : 'Technical ID'
      id : UUID;
      @title : 'Territory Technical ID'
      salesTerritoryId : UUID;
      @title : 'Territory ID'
      salesTerritoryDisplayId : String(6);
      @title : 'Territory Name'
      salesTerritoryName : String(40);
      isBlockedForRealignmentRun : Boolean;
      isDefault : Boolean;
    };
    attachments : many {
      @title : 'Technical ID'
      id : UUID;
      @title : 'Title'
      title : String;
      @title : 'Type'
      type : String;
      @title : 'Category'
      category : String;
      fileSize : Decimal;
      @title : 'File Name'
      fileName : String;
      @title : 'Content Type'
      contentType : String;
      @title : 'URL'
      url : String;
    };
    externalIds : many {
      id : UUID;
      externalId : String(100);
      communicationSystemId : UUID;
      communicationSystemDisplayId : String;
      type : String(15);
      isDefault : Boolean;
    };
  };
};

@title : 'Account create request'
type Account.Service_types.Accountcreaterequest {
  @title : 'Technical ID'
  id : UUID;
  @title : 'Account ID'
  displayId : String(10);
  @title : 'Role'
  customerRole : String(6);
  @title : 'ABC - Classification'
  customerABCClassification : String(1);
  @title : 'Nielsen ID'
  nielsenRegion : String(2);
  @title : 'Status'
  lifeCycleStatus : String(14);
  isNaturalPerson : Boolean;
  blockingReasons : {
    @title : 'Billing Block'
    invoicingBlockingReason : String(2);
    @title : 'Billing Block'
    invoicingBlockingReasonDescription : String(255);
    @title : 'Delivery Block'
    deliveryBlockingReason : String(2);
    @title : 'Delivery Block'
    deliveryBlockingReasonDescription : String(255);
    @title : 'Order Block'
    orderBlockingReason : String(2);
    @title : 'Order Block'
    orderBlockingReasonDescription : String(255);
    isSalesSupportBlocked : Boolean;
  };
  @title : 'Name'
  firstLineName : String(40);
  @title : 'Additional Name'
  secondLineName : String(40);
  @title : 'Additional Name 2'
  thirdLineName : String(40);
  @title : 'Additional Name 3'
  fourthLineName : String(40);
  @title : 'Industry'
  industrialSector : String(10);
  @title : 'Legal Form'
  companyLegalForm : String(2);
  @title : 'Contact Permission'
  contactAllowed : String(2);
  @title : 'D-U-N-S'
  dunAndBradstreetId : String(60);
  @title : 'Owner Technical ID'
  ownerId : UUID;
  defaultAddress : {
    @title : 'Country/Region'
    country : String(3);
    @title : 'Country/Region'
    countryDescription : String(255);
    region : {
      @title : 'Country/Region'
      country : String(3);
      @title : 'State'
      region : String(6);
    };
    @title : 'State'
    regionDescription : String(255);
    @title : 'Postal Code'
    postalCode : String(10);
    @title : 'City'
    cityName : String(40);
    @title : 'Street'
    streetName : String(80);
    @title : 'House Number'
    houseId : String(10);
    @title : 'County'
    countyName : String(40);
    @title : 'District'
    districtName : String(40);
    @title : 'Address Line 1'
    streetPrefixName : String(40);
    @title : 'Address Line 2'
    additionalStreetPrefixName : String(40);
    @title : 'Address Line 4'
    streetSuffixName : String(40);
    @title : 'Address Line 5'
    additionalStreetSuffixName : String(40);
    @title : 'P.O. Box'
    postOfficeBoxId : String(10);
    isPostOfficeBoxAddress : Boolean;
    latitudeMeasure : Decimal;
    longitudeMeasure : Decimal;
    isInternalGeoLocation : Boolean;
    @title : 'Language'
    correspondenceLanguage : String(5);
    @title : 'Language'
    correspondenceLanguageDescription : String(255);
    @title : 'Best Reached By'
    preferredCommunicationMediumType : String(3);
    @title : 'Best Reached By'
    preferredCommunicationMediumTypeDescription : String(255);
    @title : 'Anubhav'
    formattedPostalAddressDescription : String(255);
    @title : 'Different City'
    additionalCityName : String(40);
    @title : 'Additional House Number'
    additionalHouseId : String(10);
    @title : 'C/O'
    careOfName : String(40);
  };
  defaultCommunication : {
    @title : 'Email'
    eMail : String(255);
    @title : 'Website'
    web : String(1280);
    @title : 'Fax'
    facsimileFormattedNumber : String(40);
    @title : 'Phone'
    phoneFormattedNumber : String(40);
    @title : 'Normalized Phone'
    phoneNormalisedNumber : String(40);
    @title : 'Mobile'
    mobileFormattedNumber : String(40);
    @title : 'Normalized Mobile'
    mobileNormalisedNumber : String(40);
  };
  addresses : many {
    @title : 'Technical ID'
    id : UUID;
    @title : 'Parent Technical ID'
    parentId : UUID;
    @title : 'Address Technical ID'
    addressId : UUID;
    isDefaultAddress : Boolean;
    @title : 'Country/Region'
    country : String(3);
    @title : 'Country/Region'
    countryDescription : String(255);
    region : {
      @title : 'Country/Region'
      country : String(3);
      @title : 'State'
      region : String(6);
    };
    @title : 'State'
    regionDescription : String(255);
    @title : 'City'
    cityName : String(40);
    @title : 'Street'
    streetName : String(80);
    @title : 'House Number'
    houseId : String(10);
    @title : 'Postal Code'
    postalCode : String(10);
    @title : 'County'
    countyName : String(40);
    @title : 'District'
    districtName : String(40);
    @title : 'Address Line 1'
    streetPrefixName : String(40);
    @title : 'Address Line 2'
    additionalStreetPrefixName : String(40);
    @title : 'Address Line 4'
    streetSuffixName : String(40);
    @title : 'Address Line 5'
    additionalStreetSuffixName : String(40);
    @title : 'P.O. Box'
    postOfficeBoxId : String(10);
    isPostOfficeBoxAddress : Boolean;
    @title : 'Anubhav'
    formattedPostalAddressDescription : String(255);
    @title : 'Different City'
    additionalCityName : String(40);
    @title : 'Additional House Number'
    additionalHouseId : String(10);
    @title : 'C/O'
    careOfName : String(40);
    latitudeMeasure : Double;
    longitudeMeasure : Double;
    isInternalGeoLocation : Boolean;
    @title : 'Language'
    correspondenceLanguage : String(5);
    @title : 'Language'
    correspondenceLanguageDescription : String(255);
    @title : 'Best Reached By'
    preferredCommunicationMediumType : String(3);
    @title : 'Best Reached By'
    preferredCommunicationMediumTypeDescription : String(255);
    @title : 'Email'
    eMail : String(255);
    @title : 'Website'
    web : String(1280);
    @title : 'Fax'
    facsimileFormattedNumber : String(40);
    @title : 'Phone'
    phoneFormattedNumber : String(40);
    @title : 'Normalized Phone'
    phoneNormalisedNumber : String(40);
    @title : 'Mobile'
    mobileFormattedNumber : String(40);
    @title : 'Normalized Mobile'
    mobileNormalisedNumber : String(40);
  };
  identifications : many {
    @title : 'Technical ID'
    id : UUID;
    @title : 'ID Type'
    type : String(6);
    @title : 'ID Type'
    typeDescription : String(255);
    @title : 'ID Number'
    identificationId : String(60);
    validFrom : Date;
    validTo : Date;
    @title : 'Institution Responsible'
    identifierIssuingAgencyName : String(40);
    entryDate : Date;
    @title : 'Country/Region'
    areaOfValidityCountry : String(3);
    @title : 'Country/Region'
    areaOfValidityCountryDescription : String(255);
    areaOfValidityRegion : {
      @title : 'Country/Region'
      country : String(3);
      @title : 'State'
      region : String(6);
    };
    @title : 'State'
    areaOfValidityRegionDescription : String(255);
  };
  salesArrangements : many {
    @title : 'Technical ID'
    id : UUID;
    @title : 'Sales Organization Technical ID'
    salesOrganizationId : UUID;
    @title : 'Sales Organization ID'
    salesOrganizationDisplayId : String(50);
    @title : 'Sales Organization Name'
    salesOrganizationName : String(40);
    @title : 'Distribution Channel'
    distributionChannel : String(2);
    @title : 'Distribution Channel'
    distributionChannelDescription : String(50);
    @title : 'Division'
    division : String(2);
    @title : 'Division'
    divisionDescription : String(50);
    isMarkedForDeletion : Boolean;
    @title : 'Sales Office Technical ID'
    salesOfficeId : UUID;
    @title : 'Sales Office ID'
    salesOfficeDisplayId : String(50);
    @title : 'Sales Office'
    salesOfficeName : String(40);
    @title : 'Sales Group Technical ID'
    salesGroupId : UUID;
    @title : 'Sales Group ID'
    salesGroupDisplayId : String(50);
    @title : 'Sales Group'
    salesGroupName : String(40);
    @title : 'Delivery Priority'
    deliveryPriority : String(2);
    @title : 'Delivery Priority'
    deliveryPriorityDescription : String(255);
    isCompleteDeliveryRequested : Boolean;
    @title : 'Currency'
    currency : String(3);
    @title : 'Currency'
    currencyDescription : String(50);
    @title : 'Customer Group'
    customerGroup : String(2);
    @title : 'Customer Group'
    customerGroupDescription : String(255);
    @title : 'Price List'
    customerPriceListType : String(2);
    @title : 'Price List'
    customerPriceListTypeDescription : String(255);
    @title : 'Price Group'
    priceSpecificationCustomerGroup : String(2);
    @title : 'Price Group'
    priceSpecificationCustomerGroupDescription : String(255);
    @title : 'Cash Discount Terms'
    cashDiscountTerms : String(4);
    @title : 'Cash Discount Terms'
    cashDiscountTermsDescription : String(255);
    incoterms : {
      @title : 'Incoterms'
      classification : String(3);
      @title : 'Incoterms'
      classificationDescription : String(255);
      @title : 'Incoterms Location'
      transferLocationName : String(28);
    };
    blockingReasons : {
      @title : 'Billing Block'
      invoicingBlockingReason : String(2);
      @title : 'Billing Block'
      invoicingBlockingReasonDescription : String(255);
      @title : 'Delivery Block'
      deliveryBlockingReason : String(2);
      @title : 'Delivery Block'
      deliveryBlockingReasonDescription : String(255);
      @title : 'Order Block'
      orderBlockingReason : String(2);
      @title : 'Order Block'
      orderBlockingReasonDescription : String(255);
      isSalesSupportBlocked : Boolean;
    };
  };
  hasContactPersons : many {
    @title : 'Technical ID'
    id : UUID;
    @title : 'Contact Technical ID'
    contactId : UUID;
    @title : 'Contact ID'
    contactDisplayId : String(10);
    @title : 'Contact Name'
    contactFormattedName : String(255);
    isDefault : Boolean;
  };
  relationships : many {
    @title : 'Technical ID'
    id : UUID;
    @title : 'Business Partner Relationship Technical ID'
    relationshipId : UUID;
    @title : 'Business Partner Relationship Role'
    directedRelationshipRole : String(8);
    @title : 'Business Partner Relationship Role'
    directedRelationshipRoleDescription : String(255);
    @title : 'Business Partner Technical ID'
    businessPartnerId : UUID;
    @title : 'Business Partner ID'
    businessPartnerDisplayId : String(10);
    @title : 'Business Partner - Formatted Name'
    businessPartnerFormattedName : String(255);
    @title : 'Sales Organization Technical ID'
    salesOrganizationId : UUID;
    @title : 'Sales Organization ID'
    salesOrganizationDisplayId : String(50);
    @title : 'Sales Organization Name'
    salesOrganizationName : String(40);
    @title : 'Distribution Channel'
    distributionChannel : String(2);
    @title : 'Distribution Channel'
    distributionChannelDescription : String(255);
    @title : 'Division'
    division : String(2);
    @title : 'Division'
    divisionDescription : String(255);
    isDefault : Boolean;
    adminData : {
      createdOn : Timestamp;
      @title : 'Created By'
      createdBy : UUID;
      @title : 'Created By Name'
      createdByName : String;
      updatedOn : Timestamp;
      @title : 'Changed By'
      updatedBy : UUID;
      @title : 'Changed By Name'
      updatedByName : String;
    };
  };
  accountTeamMembers : many {
    @title : 'Technical ID'
    id : UUID;
    @title : 'Employee Technical ID'
    employeeId : UUID;
    @title : 'Employee ID'
    employeeDisplayId : String(20);
    @title : 'Employee Name'
    employeeFormattedName : String(255);
    @title : 'Role'
    role : String;
    @title : 'Role'
    roleDescription : String(255);
    @title : 'Sales Organization Technical ID'
    salesOrganizationId : UUID;
    @title : 'Sales Organization ID'
    salesOrganizationDisplayId : String(50);
    @title : 'Sales Organization Name'
    salesOrganizationName : String(40);
    @title : 'Distribution Channel'
    distributionChannel : String(2);
    @title : 'Distribution Channel'
    distributionChannelDescription : String(50);
    @title : 'Division'
    division : String(2);
    @title : 'Division'
    divisionDescription : String(50);
    isDefault : Boolean;
    validFrom : Date;
    validTo : Date;
  };
  salesTerritories : many {
    @title : 'Technical ID'
    id : UUID;
    @title : 'Territory Technical ID'
    salesTerritoryId : UUID;
    @title : 'Territory ID'
    salesTerritoryDisplayId : String(6);
    @title : 'Territory Name'
    salesTerritoryName : String(40);
    isBlockedForRealignmentRun : Boolean;
    isDefault : Boolean;
  };
  externalIds : many {
    id : UUID;
    externalId : String(100);
    communicationSystemId : UUID;
    communicationSystemDisplayId : String;
    type : String(15);
    isDefault : Boolean;
  };
};

@title : 'Account patchupdate request'
type Account.Service_types.Accountpatchupdaterequest {
  @title : 'Role'
  customerRole : String(6);
  @title : 'ABC - Classification'
  customerABCClassification : String(1);
  @title : 'Nielsen ID'
  nielsenRegion : String(2);
  @title : 'Status'
  lifeCycleStatus : String(14);
  isNaturalPerson : Boolean;
  blockingReasons : {
    @title : 'Billing Block'
    invoicingBlockingReason : String(2);
    @title : 'Billing Block'
    invoicingBlockingReasonDescription : String(255);
    @title : 'Delivery Block'
    deliveryBlockingReason : String(2);
    @title : 'Delivery Block'
    deliveryBlockingReasonDescription : String(255);
    @title : 'Order Block'
    orderBlockingReason : String(2);
    @title : 'Order Block'
    orderBlockingReasonDescription : String(255);
    isSalesSupportBlocked : Boolean;
  };
  @title : 'Name'
  firstLineName : String(40);
  @title : 'Additional Name'
  secondLineName : String(40);
  @title : 'Additional Name 2'
  thirdLineName : String(40);
  @title : 'Additional Name 3'
  fourthLineName : String(40);
  @title : 'Industry'
  industrialSector : String(10);
  @title : 'Legal Form'
  companyLegalForm : String(2);
  @title : 'Contact Permission'
  contactAllowed : String(2);
  @title : 'Owner Technical ID'
  ownerId : UUID;
  defaultAddress : {
    @title : 'Country/Region'
    country : String(3);
    @title : 'Country/Region'
    countryDescription : String(255);
    region : {
      @title : 'Country/Region'
      country : String(3);
      @title : 'State'
      region : String(6);
    };
    @title : 'State'
    regionDescription : String(255);
    @title : 'Postal Code'
    postalCode : String(10);
    @title : 'City'
    cityName : String(40);
    @title : 'Street'
    streetName : String(80);
    @title : 'House Number'
    houseId : String(10);
    @title : 'County'
    countyName : String(40);
    @title : 'District'
    districtName : String(40);
    @title : 'Address Line 1'
    streetPrefixName : String(40);
    @title : 'Address Line 2'
    additionalStreetPrefixName : String(40);
    @title : 'Address Line 4'
    streetSuffixName : String(40);
    @title : 'Address Line 5'
    additionalStreetSuffixName : String(40);
    @title : 'P.O. Box'
    postOfficeBoxId : String(10);
    isPostOfficeBoxAddress : Boolean;
    latitudeMeasure : Decimal;
    longitudeMeasure : Decimal;
    isInternalGeoLocation : Boolean;
    @title : 'Language'
    correspondenceLanguage : String(5);
    @title : 'Language'
    correspondenceLanguageDescription : String(255);
    @title : 'Best Reached By'
    preferredCommunicationMediumType : String(3);
    @title : 'Best Reached By'
    preferredCommunicationMediumTypeDescription : String(255);
    @title : 'Anubhav'
    formattedPostalAddressDescription : String(255);
    @title : 'Different City'
    additionalCityName : String(40);
    @title : 'Additional House Number'
    additionalHouseId : String(10);
    @title : 'C/O'
    careOfName : String(40);
  };
  defaultCommunication : {
    @title : 'Email'
    eMail : String(255);
    @title : 'Website'
    web : String(1280);
    @title : 'Fax'
    facsimileFormattedNumber : String(40);
    @title : 'Phone'
    phoneFormattedNumber : String(40);
    @title : 'Normalized Phone'
    phoneNormalisedNumber : String(40);
    @title : 'Mobile'
    mobileFormattedNumber : String(40);
    @title : 'Normalized Mobile'
    mobileNormalisedNumber : String(40);
  };
  addresses : many {
    @title : 'Technical ID'
    id : UUID;
    @title : 'Parent Technical ID'
    parentId : UUID;
    @title : 'Address Technical ID'
    addressId : UUID;
    isDefaultAddress : Boolean;
    @title : 'Country/Region'
    country : String(3);
    @title : 'Country/Region'
    countryDescription : String(255);
    region : {
      @title : 'Country/Region'
      country : String(3);
      @title : 'State'
      region : String(6);
    };
    @title : 'State'
    regionDescription : String(255);
    @title : 'City'
    cityName : String(40);
    @title : 'Street'
    streetName : String(80);
    @title : 'House Number'
    houseId : String(10);
    @title : 'Postal Code'
    postalCode : String(10);
    @title : 'County'
    countyName : String(40);
    @title : 'District'
    districtName : String(40);
    @title : 'Address Line 1'
    streetPrefixName : String(40);
    @title : 'Address Line 2'
    additionalStreetPrefixName : String(40);
    @title : 'Address Line 4'
    streetSuffixName : String(40);
    @title : 'Address Line 5'
    additionalStreetSuffixName : String(40);
    @title : 'P.O. Box'
    postOfficeBoxId : String(10);
    isPostOfficeBoxAddress : Boolean;
    @title : 'Anubhav'
    formattedPostalAddressDescription : String(255);
    @title : 'Different City'
    additionalCityName : String(40);
    @title : 'Additional House Number'
    additionalHouseId : String(10);
    @title : 'C/O'
    careOfName : String(40);
    latitudeMeasure : Double;
    longitudeMeasure : Double;
    isInternalGeoLocation : Boolean;
    @title : 'Language'
    correspondenceLanguage : String(5);
    @title : 'Language'
    correspondenceLanguageDescription : String(255);
    @title : 'Best Reached By'
    preferredCommunicationMediumType : String(3);
    @title : 'Best Reached By'
    preferredCommunicationMediumTypeDescription : String(255);
    @title : 'Email'
    eMail : String(255);
    @title : 'Website'
    web : String(1280);
    @title : 'Fax'
    facsimileFormattedNumber : String(40);
    @title : 'Phone'
    phoneFormattedNumber : String(40);
    @title : 'Normalized Phone'
    phoneNormalisedNumber : String(40);
    @title : 'Mobile'
    mobileFormattedNumber : String(40);
    @title : 'Normalized Mobile'
    mobileNormalisedNumber : String(40);
  };
  identifications : many {
    @title : 'Technical ID'
    id : UUID;
    @title : 'ID Type'
    type : String(6);
    @title : 'ID Type'
    typeDescription : String(255);
    @title : 'ID Number'
    identificationId : String(60);
    validFrom : Date;
    validTo : Date;
    @title : 'Institution Responsible'
    identifierIssuingAgencyName : String(40);
    entryDate : Date;
    @title : 'Country/Region'
    areaOfValidityCountry : String(3);
    @title : 'Country/Region'
    areaOfValidityCountryDescription : String(255);
    areaOfValidityRegion : {
      @title : 'Country/Region'
      country : String(3);
      @title : 'State'
      region : String(6);
    };
    @title : 'State'
    areaOfValidityRegionDescription : String(255);
  };
  salesArrangements : many {
    @title : 'Technical ID'
    id : UUID;
    @title : 'Sales Organization Technical ID'
    salesOrganizationId : UUID;
    @title : 'Sales Organization ID'
    salesOrganizationDisplayId : String(50);
    @title : 'Sales Organization Name'
    salesOrganizationName : String(40);
    @title : 'Distribution Channel'
    distributionChannel : String(2);
    @title : 'Distribution Channel'
    distributionChannelDescription : String(50);
    @title : 'Division'
    division : String(2);
    @title : 'Division'
    divisionDescription : String(50);
    isMarkedForDeletion : Boolean;
    @title : 'Sales Office Technical ID'
    salesOfficeId : UUID;
    @title : 'Sales Office ID'
    salesOfficeDisplayId : String(50);
    @title : 'Sales Office'
    salesOfficeName : String(40);
    @title : 'Sales Group Technical ID'
    salesGroupId : UUID;
    @title : 'Sales Group ID'
    salesGroupDisplayId : String(50);
    @title : 'Sales Group'
    salesGroupName : String(40);
    @title : 'Delivery Priority'
    deliveryPriority : String(2);
    @title : 'Delivery Priority'
    deliveryPriorityDescription : String(255);
    isCompleteDeliveryRequested : Boolean;
    @title : 'Currency'
    currency : String(3);
    @title : 'Currency'
    currencyDescription : String(50);
    @title : 'Customer Group'
    customerGroup : String(2);
    @title : 'Customer Group'
    customerGroupDescription : String(255);
    @title : 'Price List'
    customerPriceListType : String(2);
    @title : 'Price List'
    customerPriceListTypeDescription : String(255);
    @title : 'Price Group'
    priceSpecificationCustomerGroup : String(2);
    @title : 'Price Group'
    priceSpecificationCustomerGroupDescription : String(255);
    @title : 'Cash Discount Terms'
    cashDiscountTerms : String(4);
    @title : 'Cash Discount Terms'
    cashDiscountTermsDescription : String(255);
    incoterms : {
      @title : 'Incoterms'
      classification : String(3);
      @title : 'Incoterms'
      classificationDescription : String(255);
      @title : 'Incoterms Location'
      transferLocationName : String(28);
    };
    blockingReasons : {
      @title : 'Billing Block'
      invoicingBlockingReason : String(2);
      @title : 'Billing Block'
      invoicingBlockingReasonDescription : String(255);
      @title : 'Delivery Block'
      deliveryBlockingReason : String(2);
      @title : 'Delivery Block'
      deliveryBlockingReasonDescription : String(255);
      @title : 'Order Block'
      orderBlockingReason : String(2);
      @title : 'Order Block'
      orderBlockingReasonDescription : String(255);
      isSalesSupportBlocked : Boolean;
    };
  };
  hasContactPersons : many {
    @title : 'Technical ID'
    id : UUID;
    @title : 'Contact Technical ID'
    contactId : UUID;
    @title : 'Contact ID'
    contactDisplayId : String(10);
    @title : 'Contact Name'
    contactFormattedName : String(255);
    isDefault : Boolean;
  };
  relationships : many {
    @title : 'Technical ID'
    id : UUID;
    @title : 'Business Partner Relationship Technical ID'
    relationshipId : UUID;
    @title : 'Business Partner Relationship Role'
    directedRelationshipRole : String(8);
    @title : 'Business Partner Relationship Role'
    directedRelationshipRoleDescription : String(255);
    @title : 'Business Partner Technical ID'
    businessPartnerId : UUID;
    @title : 'Business Partner ID'
    businessPartnerDisplayId : String(10);
    @title : 'Business Partner - Formatted Name'
    businessPartnerFormattedName : String(255);
    @title : 'Sales Organization Technical ID'
    salesOrganizationId : UUID;
    @title : 'Sales Organization ID'
    salesOrganizationDisplayId : String(50);
    @title : 'Sales Organization Name'
    salesOrganizationName : String(40);
    @title : 'Distribution Channel'
    distributionChannel : String(2);
    @title : 'Distribution Channel'
    distributionChannelDescription : String(255);
    @title : 'Division'
    division : String(2);
    @title : 'Division'
    divisionDescription : String(255);
    isDefault : Boolean;
    adminData : {
      createdOn : Timestamp;
      @title : 'Created By'
      createdBy : UUID;
      @title : 'Created By Name'
      createdByName : String;
      updatedOn : Timestamp;
      @title : 'Changed By'
      updatedBy : UUID;
      @title : 'Changed By Name'
      updatedByName : String;
    };
  };
  accountTeamMembers : many {
    @title : 'Technical ID'
    id : UUID;
    @title : 'Employee Technical ID'
    employeeId : UUID;
    @title : 'Employee ID'
    employeeDisplayId : String(20);
    @title : 'Employee Name'
    employeeFormattedName : String(255);
    @title : 'Role'
    role : String;
    @title : 'Role'
    roleDescription : String(255);
    @title : 'Sales Organization Technical ID'
    salesOrganizationId : UUID;
    @title : 'Sales Organization ID'
    salesOrganizationDisplayId : String(50);
    @title : 'Sales Organization Name'
    salesOrganizationName : String(40);
    @title : 'Distribution Channel'
    distributionChannel : String(2);
    @title : 'Distribution Channel'
    distributionChannelDescription : String(50);
    @title : 'Division'
    division : String(2);
    @title : 'Division'
    divisionDescription : String(50);
    isDefault : Boolean;
    validFrom : Date;
    validTo : Date;
  };
  salesTerritories : many {
    @title : 'Technical ID'
    id : UUID;
    @title : 'Territory Technical ID'
    salesTerritoryId : UUID;
    @title : 'Territory ID'
    salesTerritoryDisplayId : String(6);
    @title : 'Territory Name'
    salesTerritoryName : String(40);
    isBlockedForRealignmentRun : Boolean;
    isDefault : Boolean;
  };
  attachments : many {
    @title : 'Technical ID'
    id : UUID;
    @title : 'Title'
    title : String;
    @title : 'Type'
    type : String;
    @title : 'Category'
    category : String;
    fileSize : Decimal;
    @title : 'File Name'
    fileName : String;
    @title : 'Content Type'
    contentType : String;
    @title : 'URL'
    url : String;
  };
  externalIds : many {
    id : UUID;
    externalId : String(100);
    communicationSystemId : UUID;
    communicationSystemDisplayId : String;
    type : String(15);
    isDefault : Boolean;
  };
};

