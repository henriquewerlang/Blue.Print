unit Blue.Print.Open.API.Schema.v20;

interface

{$M+}
{$SCOPEDENUMS ON}

// File generated from https://spec.openapis.org/oas/2.0/schema/2017-08-27;

uses Blue.Print.Types, Blue.Print.JSON.Draft4.Schema, System.Rtti;

type
  // Forward class declaration
  TOpenAPIDefinition = class;

  // Types alias
  any = System.Rtti.TValue;

  TOpenAPIDefinition = class
  public type
    schemesListArrayItem = (http, https, ws, wss);

    collectionFormat = (csv, ssv, tsv, pipes);

    collectionFormatWithMulti = (csv, ssv, tsv, pipes, multi);

    // Forward class declaration
    info = class;
    contact = class;
    license = class;
    paths = class;
    definitions = class;
    parameterDefinitions = class;
    responseDefinitions = class;
    externalDocs = class;
    examples = class;
    operation = class;
    pathItem = class;
    responses = class;
    responseValue = class;
    response = class;
    headers = class;
    header = class;
    vendorExtension = class;
    bodyParameter = class;
    headerParameterSubSchema = class;
    queryParameterSubSchema = class;
    formDataParameterSubSchema = class;
    pathParameterSubSchema = class;
    nonBodyParameter = class;
    parameter = class;
    schema = class;
    fileSchema = class;
    primitivesItems = class;
    securityRequirement = class;
    xml = class;
    tag = class;
    securityDefinitions = class;
    basicAuthenticationSecurity = class;
    apiKeySecurity = class;
    oauth2ImplicitSecurity = class;
    oauth2PasswordSecurity = class;
    oauth2ApplicationSecurity = class;
    oauth2AccessCodeSecurity = class;
    oauth2Scopes = class;
    parametersListArrayItem = class;
    jsonReference = class;
    TOpenAPIDefinition = class;

    // Types alias
    mimeType = System.String;
    security = TArray<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.securityRequirement>;
    mediaTypeList = TArray<System.String>;
    parametersList = TArray<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.parametersListArrayItem>;
    schemesList = TArray<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.schemesListArrayItem>;
    title = System.String;
    description = System.String;
    default = System.Rtti.TValue;
    multipleOf = System.Double;
    maximum = System.Double;
    exclusiveMaximum = System.Boolean;
    minimum = System.Double;
    exclusiveMinimum = System.Boolean;
    maxLength = System.Integer;
    pattern = System.String;
    maxItems = System.Integer;
    uniqueItems = System.Boolean;
    enum = TArray<System.Rtti.TValue>;

    info = class
    private
      FTitle: System.String;
      FVersion: System.String;
      FDescription: System.String;
      FTermsOfService: System.String;
      FContact: TOpenAPIDefinition.contact;
      FLicense: TOpenAPIDefinition.license;
      FVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;

      function GetContact: TOpenAPIDefinition.contact;
      function GetLicense: TOpenAPIDefinition.license;
      function GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
      function GetDescriptionStored: Boolean;
      function GetTermsOfServiceStored: Boolean;
      function GetContactStored: Boolean;
      function GetLicenseStored: Boolean;
      function GetVendorExtensionStored: Boolean;
    public
      destructor Destroy; override;

      property IsDescriptionStored: Boolean read GetDescriptionStored;
      property IsTermsOfServiceStored: Boolean read GetTermsOfServiceStored;
      property IsContactStored: Boolean read GetContactStored;
      property IsLicenseStored: Boolean read GetLicenseStored;
      property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
    published
      property title: System.String read FTitle write FTitle;
      property version: System.String read FVersion write FVersion;
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      property termsOfService: System.String read FTermsOfService write FTermsOfService stored GetTermsOfServiceStored;
      property contact: TOpenAPIDefinition.contact read GetContact write FContact stored GetContactStored;
      property license: TOpenAPIDefinition.license read GetLicense write FLicense stored GetLicenseStored;
      [PatternProperty('^x-')]
      property vendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
    end;

    contact = class
    private
      FName: System.String;
      FUrl: System.String;
      FEmail: System.String;
      FVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;

      function GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
      function GetNameStored: Boolean;
      function GetUrlStored: Boolean;
      function GetEmailStored: Boolean;
      function GetVendorExtensionStored: Boolean;
    public
      destructor Destroy; override;

      property IsNameStored: Boolean read GetNameStored;
      property IsUrlStored: Boolean read GetUrlStored;
      property IsEmailStored: Boolean read GetEmailStored;
      property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
    published
      property name: System.String read FName write FName stored GetNameStored;
      property url: System.String read FUrl write FUrl stored GetUrlStored;
      property email: System.String read FEmail write FEmail stored GetEmailStored;
      [PatternProperty('^x-')]
      property vendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
    end;

    license = class
    private
      FName: System.String;
      FUrl: System.String;
      FVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;

      function GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
      function GetUrlStored: Boolean;
      function GetVendorExtensionStored: Boolean;
    public
      destructor Destroy; override;

      property IsUrlStored: Boolean read GetUrlStored;
      property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
    published
      property name: System.String read FName write FName;
      property url: System.String read FUrl write FUrl stored GetUrlStored;
      [PatternProperty('^x-')]
      property vendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
    end;

    paths = class
    private
      FVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
      FPathItem: TDynamicProperty<TOpenAPIDefinition.pathItem>;

      function GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
      function GetPathItem: TDynamicProperty<TOpenAPIDefinition.pathItem>;
      function GetVendorExtensionStored: Boolean;
      function GetPathItemStored: Boolean;
    public
      destructor Destroy; override;

      property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
      property IsPathItemStored: Boolean read GetPathItemStored;
    published
      [PatternProperty('^x-')]
      property vendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
      [PatternProperty('^/')]
      property pathItem: TDynamicProperty<TOpenAPIDefinition.pathItem> read GetPathItem write FPathItem stored GetPathItemStored;
    end;

    definitions = class
    private
      FAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.schema>;

      function GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.schema>;
      function GetAdditionalPropertiesStored: Boolean;
    public
      destructor Destroy; override;

      property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
    published
      property additionalProperties: TDynamicProperty<TOpenAPIDefinition.schema> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
    end;

    parameterDefinitions = class
    private
      FAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.parameter>;

      function GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.parameter>;
      function GetAdditionalPropertiesStored: Boolean;
    public
      destructor Destroy; override;

      property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
    published
      property additionalProperties: TDynamicProperty<TOpenAPIDefinition.parameter> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
    end;

    responseDefinitions = class
    private
      FAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.response>;

      function GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.response>;
      function GetAdditionalPropertiesStored: Boolean;
    public
      destructor Destroy; override;

      property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
    published
      property additionalProperties: TDynamicProperty<TOpenAPIDefinition.response> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
    end;

    externalDocs = class
    private
      FDescription: System.String;
      FUrl: System.String;
      FVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;

      function GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
      function GetDescriptionStored: Boolean;
      function GetVendorExtensionStored: Boolean;
    public
      destructor Destroy; override;

      property IsDescriptionStored: Boolean read GetDescriptionStored;
      property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
    published
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      property url: System.String read FUrl write FUrl;
      [PatternProperty('^x-')]
      property vendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
    end;

    examples = class
    end;

    operation = class
    public type
      // Forward class declaration
      ProducesProperty = class;
      ConsumesProperty = class;

      [Flat]
      ProducesProperty = class
      private
        FMediaTypeList: TOpenAPIDefinition.mediaTypeList;

        function GetMediaTypeListStored: Boolean;
      public
        property IsMediaTypeListStored: Boolean read GetMediaTypeListStored;
      published
        property mediaTypeList: TOpenAPIDefinition.mediaTypeList read FMediaTypeList write FMediaTypeList stored GetMediaTypeListStored;
      end;

      [Flat]
      ConsumesProperty = class
      private
        FMediaTypeList: TOpenAPIDefinition.mediaTypeList;

        function GetMediaTypeListStored: Boolean;
      public
        property IsMediaTypeListStored: Boolean read GetMediaTypeListStored;
      published
        property mediaTypeList: TOpenAPIDefinition.mediaTypeList read FMediaTypeList write FMediaTypeList stored GetMediaTypeListStored;
      end;
    private
      FTags: TArray<System.String>;
      FSummary: System.String;
      FDescription: System.String;
      FExternalDocs: TOpenAPIDefinition.externalDocs;
      FOperationId: System.String;
      FProduces: TOpenAPIDefinition.operation.ProducesProperty;
      FConsumes: TOpenAPIDefinition.operation.ConsumesProperty;
      FParameters: TOpenAPIDefinition.parametersList;
      FResponses: TOpenAPIDefinition.responses;
      FSchemes: TOpenAPIDefinition.schemesList;
      FDeprecated: System.Boolean;
      FSecurity: TOpenAPIDefinition.security;
      FVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;

      function GetExternalDocs: TOpenAPIDefinition.externalDocs;
      function GetProduces: TOpenAPIDefinition.operation.ProducesProperty;
      function GetConsumes: TOpenAPIDefinition.operation.ConsumesProperty;
      function GetResponses: TOpenAPIDefinition.responses;
      function GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
      function GetTagsStored: Boolean;
      function GetSummaryStored: Boolean;
      function GetDescriptionStored: Boolean;
      function GetExternalDocsStored: Boolean;
      function GetOperationIdStored: Boolean;
      function GetProducesStored: Boolean;
      function GetConsumesStored: Boolean;
      function GetParametersStored: Boolean;
      function GetSchemesStored: Boolean;
      function GetDeprecatedStored: Boolean;
      function GetSecurityStored: Boolean;
      function GetVendorExtensionStored: Boolean;
    public
      destructor Destroy; override;

      function AddParameters: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.parametersListArrayItem;
      function AddSecurity: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.securityRequirement;

      property IsTagsStored: Boolean read GetTagsStored;
      property IsSummaryStored: Boolean read GetSummaryStored;
      property IsDescriptionStored: Boolean read GetDescriptionStored;
      property IsExternalDocsStored: Boolean read GetExternalDocsStored;
      property IsOperationIdStored: Boolean read GetOperationIdStored;
      property IsProducesStored: Boolean read GetProducesStored;
      property IsConsumesStored: Boolean read GetConsumesStored;
      property IsParametersStored: Boolean read GetParametersStored;
      property IsSchemesStored: Boolean read GetSchemesStored;
      property IsDeprecatedStored: Boolean read GetDeprecatedStored;
      property IsSecurityStored: Boolean read GetSecurityStored;
      property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
    published
      property tags: TArray<System.String> read FTags write FTags stored GetTagsStored;
      property summary: System.String read FSummary write FSummary stored GetSummaryStored;
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      property externalDocs: TOpenAPIDefinition.externalDocs read GetExternalDocs write FExternalDocs stored GetExternalDocsStored;
      property operationId: System.String read FOperationId write FOperationId stored GetOperationIdStored;
      property produces: TOpenAPIDefinition.operation.ProducesProperty read GetProduces write FProduces stored GetProducesStored;
      property consumes: TOpenAPIDefinition.operation.ConsumesProperty read GetConsumes write FConsumes stored GetConsumesStored;
      property parameters: TOpenAPIDefinition.parametersList read FParameters write FParameters stored GetParametersStored;
      property responses: TOpenAPIDefinition.responses read GetResponses write FResponses;
      property schemes: TOpenAPIDefinition.schemesList read FSchemes write FSchemes stored GetSchemesStored;
      property deprecated: System.Boolean read FDeprecated write FDeprecated stored GetDeprecatedStored;
      property security: TOpenAPIDefinition.security read FSecurity write FSecurity stored GetSecurityStored;
      [PatternProperty('^x-')]
      property vendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
    end;

    pathItem = class
    private
      FRef: System.String;
      FGet: TOpenAPIDefinition.operation;
      FPut: TOpenAPIDefinition.operation;
      FPost: TOpenAPIDefinition.operation;
      FDelete: TOpenAPIDefinition.operation;
      FOptions: TOpenAPIDefinition.operation;
      FHead: TOpenAPIDefinition.operation;
      FPatch: TOpenAPIDefinition.operation;
      FParameters: TOpenAPIDefinition.parametersList;
      FVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;

      function GetGet: TOpenAPIDefinition.operation;
      function GetPut: TOpenAPIDefinition.operation;
      function GetPost: TOpenAPIDefinition.operation;
      function GetDelete: TOpenAPIDefinition.operation;
      function GetOptions: TOpenAPIDefinition.operation;
      function GetHead: TOpenAPIDefinition.operation;
      function GetPatch: TOpenAPIDefinition.operation;
      function GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
      function GetRefStored: Boolean;
      function GetGetStored: Boolean;
      function GetPutStored: Boolean;
      function GetPostStored: Boolean;
      function GetDeleteStored: Boolean;
      function GetOptionsStored: Boolean;
      function GetHeadStored: Boolean;
      function GetPatchStored: Boolean;
      function GetParametersStored: Boolean;
      function GetVendorExtensionStored: Boolean;
    public
      destructor Destroy; override;

      function AddParameters: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.parametersListArrayItem;

      property IsRefStored: Boolean read GetRefStored;
      property IsGetStored: Boolean read GetGetStored;
      property IsPutStored: Boolean read GetPutStored;
      property IsPostStored: Boolean read GetPostStored;
      property IsDeleteStored: Boolean read GetDeleteStored;
      property IsOptionsStored: Boolean read GetOptionsStored;
      property IsHeadStored: Boolean read GetHeadStored;
      property IsPatchStored: Boolean read GetPatchStored;
      property IsParametersStored: Boolean read GetParametersStored;
      property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
    published
      [FieldName('$ref')]
      property ref: System.String read FRef write FRef stored GetRefStored;
      property get: TOpenAPIDefinition.operation read GetGet write FGet stored GetGetStored;
      property put: TOpenAPIDefinition.operation read GetPut write FPut stored GetPutStored;
      property post: TOpenAPIDefinition.operation read GetPost write FPost stored GetPostStored;
      property delete: TOpenAPIDefinition.operation read GetDelete write FDelete stored GetDeleteStored;
      property options: TOpenAPIDefinition.operation read GetOptions write FOptions stored GetOptionsStored;
      property head: TOpenAPIDefinition.operation read GetHead write FHead stored GetHeadStored;
      property patch: TOpenAPIDefinition.operation read GetPatch write FPatch stored GetPatchStored;
      property parameters: TOpenAPIDefinition.parametersList read FParameters write FParameters stored GetParametersStored;
      [PatternProperty('^x-')]
      property vendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
    end;

    responses = class
    private
      FResponseValue: TDynamicProperty<TOpenAPIDefinition.responseValue>;
      FVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;

      function GetResponseValue: TDynamicProperty<TOpenAPIDefinition.responseValue>;
      function GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
      function GetResponseValueStored: Boolean;
      function GetVendorExtensionStored: Boolean;
    public
      destructor Destroy; override;

      property IsResponseValueStored: Boolean read GetResponseValueStored;
      property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
    published
      [PatternProperty('^([0-9]{3})$|^(default)$')]
      property responseValue: TDynamicProperty<TOpenAPIDefinition.responseValue> read GetResponseValue write FResponseValue stored GetResponseValueStored;
      [PatternProperty('^x-')]
      property vendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
    end;

    [Flat]
    responseValue = class
    private
      FResponse: TOpenAPIDefinition.response;
      FJsonReference: TOpenAPIDefinition.jsonReference;

      function GetResponse: TOpenAPIDefinition.response;
      function GetJsonReference: TOpenAPIDefinition.jsonReference;
      function GetResponseStored: Boolean;
      function GetJsonReferenceStored: Boolean;
    public
      destructor Destroy; override;

      property IsResponseStored: Boolean read GetResponseStored;
      property IsJsonReferenceStored: Boolean read GetJsonReferenceStored;
    published
      property response: TOpenAPIDefinition.response read GetResponse write FResponse stored GetResponseStored;
      property jsonReference: TOpenAPIDefinition.jsonReference read GetJsonReference write FJsonReference stored GetJsonReferenceStored;
    end;

    response = class
    public type
      // Forward class declaration
      SchemaProperty = class;

      [Flat]
      SchemaProperty = class
      private
        FSchema: TOpenAPIDefinition.schema;
        FFileSchema: TOpenAPIDefinition.fileSchema;

        function GetSchema: TOpenAPIDefinition.schema;
        function GetFileSchema: TOpenAPIDefinition.fileSchema;
        function GetSchemaStored: Boolean;
        function GetFileSchemaStored: Boolean;
      public
        destructor Destroy; override;

        property IsSchemaStored: Boolean read GetSchemaStored;
        property IsFileSchemaStored: Boolean read GetFileSchemaStored;
      published
        property schema: TOpenAPIDefinition.schema read GetSchema write FSchema stored GetSchemaStored;
        property fileSchema: TOpenAPIDefinition.fileSchema read GetFileSchema write FFileSchema stored GetFileSchemaStored;
      end;
    private
      FDescription: System.String;
      FSchema: TOpenAPIDefinition.response.SchemaProperty;
      FHeaders: TOpenAPIDefinition.headers;
      FExamples: TOpenAPIDefinition.examples;
      FVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;

      function GetSchema: TOpenAPIDefinition.response.SchemaProperty;
      function GetHeaders: TOpenAPIDefinition.headers;
      function GetExamples: TOpenAPIDefinition.examples;
      function GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
      function GetSchemaStored: Boolean;
      function GetHeadersStored: Boolean;
      function GetExamplesStored: Boolean;
      function GetVendorExtensionStored: Boolean;
    public
      destructor Destroy; override;

      property IsSchemaStored: Boolean read GetSchemaStored;
      property IsHeadersStored: Boolean read GetHeadersStored;
      property IsExamplesStored: Boolean read GetExamplesStored;
      property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
    published
      property description: System.String read FDescription write FDescription;
      property schema: TOpenAPIDefinition.response.SchemaProperty read GetSchema write FSchema stored GetSchemaStored;
      property headers: TOpenAPIDefinition.headers read GetHeaders write FHeaders stored GetHeadersStored;
      property examples: TOpenAPIDefinition.examples read GetExamples write FExamples stored GetExamplesStored;
      [PatternProperty('^x-')]
      property vendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
    end;

    headers = class
    private
      FAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.header>;

      function GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.header>;
      function GetAdditionalPropertiesStored: Boolean;
    public
      destructor Destroy; override;

      property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
    published
      property additionalProperties: TDynamicProperty<TOpenAPIDefinition.header> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
    end;

    header = class
    public type
      [EnumValue('string, number, integer, boolean, array')]
      TypeProperty = (&string, number, integer, boolean, &array);
    private
      FType: TOpenAPIDefinition.header.TypeProperty;
      FFormat: System.String;
      FItems: TOpenAPIDefinition.primitivesItems;
      FCollectionFormat: TOpenAPIDefinition.collectionFormat;
      FDefault: TOpenAPIDefinition.default;
      FMaximum: TOpenAPIDefinition.maximum;
      FExclusiveMaximum: TOpenAPIDefinition.exclusiveMaximum;
      FMinimum: TOpenAPIDefinition.minimum;
      FExclusiveMinimum: TOpenAPIDefinition.exclusiveMinimum;
      FMaxLength: TOpenAPIDefinition.maxLength;
      FMinLength: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0;
      FPattern: TOpenAPIDefinition.pattern;
      FMaxItems: TOpenAPIDefinition.maxItems;
      FMinItems: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0;
      FUniqueItems: TOpenAPIDefinition.uniqueItems;
      FEnum: TOpenAPIDefinition.enum;
      FMultipleOf: TOpenAPIDefinition.multipleOf;
      FDescription: System.String;
      FVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
      FCollectionFormatIsStored: Boolean;

      function GetItems: TOpenAPIDefinition.primitivesItems;
      function GetMinLength: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0;
      function GetMinItems: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0;
      function GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
      function GetFormatStored: Boolean;
      function GetItemsStored: Boolean;
      function GetDefaultStored: Boolean;
      function GetMaximumStored: Boolean;
      function GetExclusiveMaximumStored: Boolean;
      function GetMinimumStored: Boolean;
      function GetExclusiveMinimumStored: Boolean;
      function GetMaxLengthStored: Boolean;
      function GetMinLengthStored: Boolean;
      function GetPatternStored: Boolean;
      function GetMaxItemsStored: Boolean;
      function GetMinItemsStored: Boolean;
      function GetUniqueItemsStored: Boolean;
      function GetEnumStored: Boolean;
      function GetMultipleOfStored: Boolean;
      function GetDescriptionStored: Boolean;
      function GetVendorExtensionStored: Boolean;
      procedure SetCollectionFormat(const Value: TOpenAPIDefinition.collectionFormat);
    public
      destructor Destroy; override;

      property IsFormatStored: Boolean read GetFormatStored;
      property IsItemsStored: Boolean read GetItemsStored;
      property IsCollectionFormatStored: Boolean read FCollectionFormatIsStored;
      property IsDefaultStored: Boolean read GetDefaultStored;
      property IsMaximumStored: Boolean read GetMaximumStored;
      property IsExclusiveMaximumStored: Boolean read GetExclusiveMaximumStored;
      property IsMinimumStored: Boolean read GetMinimumStored;
      property IsExclusiveMinimumStored: Boolean read GetExclusiveMinimumStored;
      property IsMaxLengthStored: Boolean read GetMaxLengthStored;
      property IsMinLengthStored: Boolean read GetMinLengthStored;
      property IsPatternStored: Boolean read GetPatternStored;
      property IsMaxItemsStored: Boolean read GetMaxItemsStored;
      property IsMinItemsStored: Boolean read GetMinItemsStored;
      property IsUniqueItemsStored: Boolean read GetUniqueItemsStored;
      property IsEnumStored: Boolean read GetEnumStored;
      property IsMultipleOfStored: Boolean read GetMultipleOfStored;
      property IsDescriptionStored: Boolean read GetDescriptionStored;
      property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
    published
      [FieldName('type')]
      property &type: TOpenAPIDefinition.header.TypeProperty read FType write FType;
      property format: System.String read FFormat write FFormat stored GetFormatStored;
      property items: TOpenAPIDefinition.primitivesItems read GetItems write FItems stored GetItemsStored;
      property collectionFormat: TOpenAPIDefinition.collectionFormat read FCollectionFormat write SetCollectionFormat stored FCollectionFormatIsStored;
      property default: TOpenAPIDefinition.default read FDefault write FDefault stored GetDefaultStored;
      property maximum: TOpenAPIDefinition.maximum read FMaximum write FMaximum stored GetMaximumStored;
      property exclusiveMaximum: TOpenAPIDefinition.exclusiveMaximum read FExclusiveMaximum write FExclusiveMaximum stored GetExclusiveMaximumStored;
      property minimum: TOpenAPIDefinition.minimum read FMinimum write FMinimum stored GetMinimumStored;
      property exclusiveMinimum: TOpenAPIDefinition.exclusiveMinimum read FExclusiveMinimum write FExclusiveMinimum stored GetExclusiveMinimumStored;
      property maxLength: TOpenAPIDefinition.maxLength read FMaxLength write FMaxLength stored GetMaxLengthStored;
      property minLength: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0 read GetMinLength write FMinLength stored GetMinLengthStored;
      property pattern: TOpenAPIDefinition.pattern read FPattern write FPattern stored GetPatternStored;
      property maxItems: TOpenAPIDefinition.maxItems read FMaxItems write FMaxItems stored GetMaxItemsStored;
      property minItems: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0 read GetMinItems write FMinItems stored GetMinItemsStored;
      property uniqueItems: TOpenAPIDefinition.uniqueItems read FUniqueItems write FUniqueItems stored GetUniqueItemsStored;
      property enum: TOpenAPIDefinition.enum read FEnum write FEnum stored GetEnumStored;
      property multipleOf: TOpenAPIDefinition.multipleOf read FMultipleOf write FMultipleOf stored GetMultipleOfStored;
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      [PatternProperty('^x-')]
      property vendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
    end;

    vendorExtension = class
    end;

    bodyParameter = class
    public type
      InProperty = (body);
    private
      FDescription: System.String;
      FName: System.String;
      FIn: TOpenAPIDefinition.bodyParameter.InProperty;
      FRequired: System.Boolean;
      FSchema: TOpenAPIDefinition.schema;
      FVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;

      function GetSchema: TOpenAPIDefinition.schema;
      function GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
      function GetDescriptionStored: Boolean;
      function GetRequiredStored: Boolean;
      function GetVendorExtensionStored: Boolean;
    public
      destructor Destroy; override;

      property IsDescriptionStored: Boolean read GetDescriptionStored;
      property IsRequiredStored: Boolean read GetRequiredStored;
      property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
    published
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      property name: System.String read FName write FName;
      [FieldName('in')]
      property &in: TOpenAPIDefinition.bodyParameter.InProperty read FIn write FIn;
      property required: System.Boolean read FRequired write FRequired stored GetRequiredStored;
      property schema: TOpenAPIDefinition.schema read GetSchema write FSchema;
      [PatternProperty('^x-')]
      property vendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
    end;

    headerParameterSubSchema = class
    public type
      InProperty = (header);

      [EnumValue('string, number, boolean, integer, array')]
      TypeProperty = (&string, number, boolean, integer, &array);
    private
      FRequired: System.Boolean;
      FIn: TOpenAPIDefinition.headerParameterSubSchema.InProperty;
      FDescription: System.String;
      FName: System.String;
      FType: TOpenAPIDefinition.headerParameterSubSchema.TypeProperty;
      FFormat: System.String;
      FItems: TOpenAPIDefinition.primitivesItems;
      FCollectionFormat: TOpenAPIDefinition.collectionFormat;
      FDefault: TOpenAPIDefinition.default;
      FMaximum: TOpenAPIDefinition.maximum;
      FExclusiveMaximum: TOpenAPIDefinition.exclusiveMaximum;
      FMinimum: TOpenAPIDefinition.minimum;
      FExclusiveMinimum: TOpenAPIDefinition.exclusiveMinimum;
      FMaxLength: TOpenAPIDefinition.maxLength;
      FMinLength: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0;
      FPattern: TOpenAPIDefinition.pattern;
      FMaxItems: TOpenAPIDefinition.maxItems;
      FMinItems: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0;
      FUniqueItems: TOpenAPIDefinition.uniqueItems;
      FEnum: TOpenAPIDefinition.enum;
      FMultipleOf: TOpenAPIDefinition.multipleOf;
      FVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
      FInIsStored: Boolean;
      FTypeIsStored: Boolean;
      FCollectionFormatIsStored: Boolean;

      function GetItems: TOpenAPIDefinition.primitivesItems;
      function GetMinLength: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0;
      function GetMinItems: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0;
      function GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
      function GetRequiredStored: Boolean;
      function GetDescriptionStored: Boolean;
      function GetNameStored: Boolean;
      function GetFormatStored: Boolean;
      function GetItemsStored: Boolean;
      function GetDefaultStored: Boolean;
      function GetMaximumStored: Boolean;
      function GetExclusiveMaximumStored: Boolean;
      function GetMinimumStored: Boolean;
      function GetExclusiveMinimumStored: Boolean;
      function GetMaxLengthStored: Boolean;
      function GetMinLengthStored: Boolean;
      function GetPatternStored: Boolean;
      function GetMaxItemsStored: Boolean;
      function GetMinItemsStored: Boolean;
      function GetUniqueItemsStored: Boolean;
      function GetEnumStored: Boolean;
      function GetMultipleOfStored: Boolean;
      function GetVendorExtensionStored: Boolean;
      procedure SetIn(const Value: TOpenAPIDefinition.headerParameterSubSchema.InProperty);
      procedure SetType(const Value: TOpenAPIDefinition.headerParameterSubSchema.TypeProperty);
      procedure SetCollectionFormat(const Value: TOpenAPIDefinition.collectionFormat);
    public
      destructor Destroy; override;

      property IsRequiredStored: Boolean read GetRequiredStored;
      property IsInStored: Boolean read FInIsStored;
      property IsDescriptionStored: Boolean read GetDescriptionStored;
      property IsNameStored: Boolean read GetNameStored;
      property IsTypeStored: Boolean read FTypeIsStored;
      property IsFormatStored: Boolean read GetFormatStored;
      property IsItemsStored: Boolean read GetItemsStored;
      property IsCollectionFormatStored: Boolean read FCollectionFormatIsStored;
      property IsDefaultStored: Boolean read GetDefaultStored;
      property IsMaximumStored: Boolean read GetMaximumStored;
      property IsExclusiveMaximumStored: Boolean read GetExclusiveMaximumStored;
      property IsMinimumStored: Boolean read GetMinimumStored;
      property IsExclusiveMinimumStored: Boolean read GetExclusiveMinimumStored;
      property IsMaxLengthStored: Boolean read GetMaxLengthStored;
      property IsMinLengthStored: Boolean read GetMinLengthStored;
      property IsPatternStored: Boolean read GetPatternStored;
      property IsMaxItemsStored: Boolean read GetMaxItemsStored;
      property IsMinItemsStored: Boolean read GetMinItemsStored;
      property IsUniqueItemsStored: Boolean read GetUniqueItemsStored;
      property IsEnumStored: Boolean read GetEnumStored;
      property IsMultipleOfStored: Boolean read GetMultipleOfStored;
      property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
    published
      property required: System.Boolean read FRequired write FRequired stored GetRequiredStored;
      [FieldName('in')]
      property &in: TOpenAPIDefinition.headerParameterSubSchema.InProperty read FIn write SetIn stored FInIsStored;
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      property name: System.String read FName write FName stored GetNameStored;
      [FieldName('type')]
      property &type: TOpenAPIDefinition.headerParameterSubSchema.TypeProperty read FType write SetType stored FTypeIsStored;
      property format: System.String read FFormat write FFormat stored GetFormatStored;
      property items: TOpenAPIDefinition.primitivesItems read GetItems write FItems stored GetItemsStored;
      property collectionFormat: TOpenAPIDefinition.collectionFormat read FCollectionFormat write SetCollectionFormat stored FCollectionFormatIsStored;
      property default: TOpenAPIDefinition.default read FDefault write FDefault stored GetDefaultStored;
      property maximum: TOpenAPIDefinition.maximum read FMaximum write FMaximum stored GetMaximumStored;
      property exclusiveMaximum: TOpenAPIDefinition.exclusiveMaximum read FExclusiveMaximum write FExclusiveMaximum stored GetExclusiveMaximumStored;
      property minimum: TOpenAPIDefinition.minimum read FMinimum write FMinimum stored GetMinimumStored;
      property exclusiveMinimum: TOpenAPIDefinition.exclusiveMinimum read FExclusiveMinimum write FExclusiveMinimum stored GetExclusiveMinimumStored;
      property maxLength: TOpenAPIDefinition.maxLength read FMaxLength write FMaxLength stored GetMaxLengthStored;
      property minLength: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0 read GetMinLength write FMinLength stored GetMinLengthStored;
      property pattern: TOpenAPIDefinition.pattern read FPattern write FPattern stored GetPatternStored;
      property maxItems: TOpenAPIDefinition.maxItems read FMaxItems write FMaxItems stored GetMaxItemsStored;
      property minItems: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0 read GetMinItems write FMinItems stored GetMinItemsStored;
      property uniqueItems: TOpenAPIDefinition.uniqueItems read FUniqueItems write FUniqueItems stored GetUniqueItemsStored;
      property enum: TOpenAPIDefinition.enum read FEnum write FEnum stored GetEnumStored;
      property multipleOf: TOpenAPIDefinition.multipleOf read FMultipleOf write FMultipleOf stored GetMultipleOfStored;
      [PatternProperty('^x-')]
      property vendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
    end;

    queryParameterSubSchema = class
    public type
      InProperty = (query);

      [EnumValue('string, number, boolean, integer, array')]
      TypeProperty = (&string, number, boolean, integer, &array);
    private
      FRequired: System.Boolean;
      FIn: TOpenAPIDefinition.queryParameterSubSchema.InProperty;
      FDescription: System.String;
      FName: System.String;
      FAllowEmptyValue: System.Boolean;
      FType: TOpenAPIDefinition.queryParameterSubSchema.TypeProperty;
      FFormat: System.String;
      FItems: TOpenAPIDefinition.primitivesItems;
      FCollectionFormat: TOpenAPIDefinition.collectionFormatWithMulti;
      FDefault: TOpenAPIDefinition.default;
      FMaximum: TOpenAPIDefinition.maximum;
      FExclusiveMaximum: TOpenAPIDefinition.exclusiveMaximum;
      FMinimum: TOpenAPIDefinition.minimum;
      FExclusiveMinimum: TOpenAPIDefinition.exclusiveMinimum;
      FMaxLength: TOpenAPIDefinition.maxLength;
      FMinLength: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0;
      FPattern: TOpenAPIDefinition.pattern;
      FMaxItems: TOpenAPIDefinition.maxItems;
      FMinItems: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0;
      FUniqueItems: TOpenAPIDefinition.uniqueItems;
      FEnum: TOpenAPIDefinition.enum;
      FMultipleOf: TOpenAPIDefinition.multipleOf;
      FVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
      FInIsStored: Boolean;
      FTypeIsStored: Boolean;
      FCollectionFormatIsStored: Boolean;

      function GetItems: TOpenAPIDefinition.primitivesItems;
      function GetMinLength: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0;
      function GetMinItems: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0;
      function GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
      function GetRequiredStored: Boolean;
      function GetDescriptionStored: Boolean;
      function GetNameStored: Boolean;
      function GetAllowEmptyValueStored: Boolean;
      function GetFormatStored: Boolean;
      function GetItemsStored: Boolean;
      function GetDefaultStored: Boolean;
      function GetMaximumStored: Boolean;
      function GetExclusiveMaximumStored: Boolean;
      function GetMinimumStored: Boolean;
      function GetExclusiveMinimumStored: Boolean;
      function GetMaxLengthStored: Boolean;
      function GetMinLengthStored: Boolean;
      function GetPatternStored: Boolean;
      function GetMaxItemsStored: Boolean;
      function GetMinItemsStored: Boolean;
      function GetUniqueItemsStored: Boolean;
      function GetEnumStored: Boolean;
      function GetMultipleOfStored: Boolean;
      function GetVendorExtensionStored: Boolean;
      procedure SetIn(const Value: TOpenAPIDefinition.queryParameterSubSchema.InProperty);
      procedure SetType(const Value: TOpenAPIDefinition.queryParameterSubSchema.TypeProperty);
      procedure SetCollectionFormat(const Value: TOpenAPIDefinition.collectionFormatWithMulti);
    public
      destructor Destroy; override;

      property IsRequiredStored: Boolean read GetRequiredStored;
      property IsInStored: Boolean read FInIsStored;
      property IsDescriptionStored: Boolean read GetDescriptionStored;
      property IsNameStored: Boolean read GetNameStored;
      property IsAllowEmptyValueStored: Boolean read GetAllowEmptyValueStored;
      property IsTypeStored: Boolean read FTypeIsStored;
      property IsFormatStored: Boolean read GetFormatStored;
      property IsItemsStored: Boolean read GetItemsStored;
      property IsCollectionFormatStored: Boolean read FCollectionFormatIsStored;
      property IsDefaultStored: Boolean read GetDefaultStored;
      property IsMaximumStored: Boolean read GetMaximumStored;
      property IsExclusiveMaximumStored: Boolean read GetExclusiveMaximumStored;
      property IsMinimumStored: Boolean read GetMinimumStored;
      property IsExclusiveMinimumStored: Boolean read GetExclusiveMinimumStored;
      property IsMaxLengthStored: Boolean read GetMaxLengthStored;
      property IsMinLengthStored: Boolean read GetMinLengthStored;
      property IsPatternStored: Boolean read GetPatternStored;
      property IsMaxItemsStored: Boolean read GetMaxItemsStored;
      property IsMinItemsStored: Boolean read GetMinItemsStored;
      property IsUniqueItemsStored: Boolean read GetUniqueItemsStored;
      property IsEnumStored: Boolean read GetEnumStored;
      property IsMultipleOfStored: Boolean read GetMultipleOfStored;
      property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
    published
      property required: System.Boolean read FRequired write FRequired stored GetRequiredStored;
      [FieldName('in')]
      property &in: TOpenAPIDefinition.queryParameterSubSchema.InProperty read FIn write SetIn stored FInIsStored;
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      property name: System.String read FName write FName stored GetNameStored;
      property allowEmptyValue: System.Boolean read FAllowEmptyValue write FAllowEmptyValue stored GetAllowEmptyValueStored;
      [FieldName('type')]
      property &type: TOpenAPIDefinition.queryParameterSubSchema.TypeProperty read FType write SetType stored FTypeIsStored;
      property format: System.String read FFormat write FFormat stored GetFormatStored;
      property items: TOpenAPIDefinition.primitivesItems read GetItems write FItems stored GetItemsStored;
      property collectionFormat: TOpenAPIDefinition.collectionFormatWithMulti read FCollectionFormat write SetCollectionFormat stored FCollectionFormatIsStored;
      property default: TOpenAPIDefinition.default read FDefault write FDefault stored GetDefaultStored;
      property maximum: TOpenAPIDefinition.maximum read FMaximum write FMaximum stored GetMaximumStored;
      property exclusiveMaximum: TOpenAPIDefinition.exclusiveMaximum read FExclusiveMaximum write FExclusiveMaximum stored GetExclusiveMaximumStored;
      property minimum: TOpenAPIDefinition.minimum read FMinimum write FMinimum stored GetMinimumStored;
      property exclusiveMinimum: TOpenAPIDefinition.exclusiveMinimum read FExclusiveMinimum write FExclusiveMinimum stored GetExclusiveMinimumStored;
      property maxLength: TOpenAPIDefinition.maxLength read FMaxLength write FMaxLength stored GetMaxLengthStored;
      property minLength: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0 read GetMinLength write FMinLength stored GetMinLengthStored;
      property pattern: TOpenAPIDefinition.pattern read FPattern write FPattern stored GetPatternStored;
      property maxItems: TOpenAPIDefinition.maxItems read FMaxItems write FMaxItems stored GetMaxItemsStored;
      property minItems: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0 read GetMinItems write FMinItems stored GetMinItemsStored;
      property uniqueItems: TOpenAPIDefinition.uniqueItems read FUniqueItems write FUniqueItems stored GetUniqueItemsStored;
      property enum: TOpenAPIDefinition.enum read FEnum write FEnum stored GetEnumStored;
      property multipleOf: TOpenAPIDefinition.multipleOf read FMultipleOf write FMultipleOf stored GetMultipleOfStored;
      [PatternProperty('^x-')]
      property vendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
    end;

    formDataParameterSubSchema = class
    public type
      InProperty = (formData);

      [EnumValue('string, number, boolean, integer, array, file')]
      TypeProperty = (&string, number, boolean, integer, &array, &file);
    private
      FRequired: System.Boolean;
      FIn: TOpenAPIDefinition.formDataParameterSubSchema.InProperty;
      FDescription: System.String;
      FName: System.String;
      FAllowEmptyValue: System.Boolean;
      FType: TOpenAPIDefinition.formDataParameterSubSchema.TypeProperty;
      FFormat: System.String;
      FItems: TOpenAPIDefinition.primitivesItems;
      FCollectionFormat: TOpenAPIDefinition.collectionFormatWithMulti;
      FDefault: TOpenAPIDefinition.default;
      FMaximum: TOpenAPIDefinition.maximum;
      FExclusiveMaximum: TOpenAPIDefinition.exclusiveMaximum;
      FMinimum: TOpenAPIDefinition.minimum;
      FExclusiveMinimum: TOpenAPIDefinition.exclusiveMinimum;
      FMaxLength: TOpenAPIDefinition.maxLength;
      FMinLength: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0;
      FPattern: TOpenAPIDefinition.pattern;
      FMaxItems: TOpenAPIDefinition.maxItems;
      FMinItems: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0;
      FUniqueItems: TOpenAPIDefinition.uniqueItems;
      FEnum: TOpenAPIDefinition.enum;
      FMultipleOf: TOpenAPIDefinition.multipleOf;
      FVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
      FInIsStored: Boolean;
      FTypeIsStored: Boolean;
      FCollectionFormatIsStored: Boolean;

      function GetItems: TOpenAPIDefinition.primitivesItems;
      function GetMinLength: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0;
      function GetMinItems: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0;
      function GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
      function GetRequiredStored: Boolean;
      function GetDescriptionStored: Boolean;
      function GetNameStored: Boolean;
      function GetAllowEmptyValueStored: Boolean;
      function GetFormatStored: Boolean;
      function GetItemsStored: Boolean;
      function GetDefaultStored: Boolean;
      function GetMaximumStored: Boolean;
      function GetExclusiveMaximumStored: Boolean;
      function GetMinimumStored: Boolean;
      function GetExclusiveMinimumStored: Boolean;
      function GetMaxLengthStored: Boolean;
      function GetMinLengthStored: Boolean;
      function GetPatternStored: Boolean;
      function GetMaxItemsStored: Boolean;
      function GetMinItemsStored: Boolean;
      function GetUniqueItemsStored: Boolean;
      function GetEnumStored: Boolean;
      function GetMultipleOfStored: Boolean;
      function GetVendorExtensionStored: Boolean;
      procedure SetIn(const Value: TOpenAPIDefinition.formDataParameterSubSchema.InProperty);
      procedure SetType(const Value: TOpenAPIDefinition.formDataParameterSubSchema.TypeProperty);
      procedure SetCollectionFormat(const Value: TOpenAPIDefinition.collectionFormatWithMulti);
    public
      destructor Destroy; override;

      property IsRequiredStored: Boolean read GetRequiredStored;
      property IsInStored: Boolean read FInIsStored;
      property IsDescriptionStored: Boolean read GetDescriptionStored;
      property IsNameStored: Boolean read GetNameStored;
      property IsAllowEmptyValueStored: Boolean read GetAllowEmptyValueStored;
      property IsTypeStored: Boolean read FTypeIsStored;
      property IsFormatStored: Boolean read GetFormatStored;
      property IsItemsStored: Boolean read GetItemsStored;
      property IsCollectionFormatStored: Boolean read FCollectionFormatIsStored;
      property IsDefaultStored: Boolean read GetDefaultStored;
      property IsMaximumStored: Boolean read GetMaximumStored;
      property IsExclusiveMaximumStored: Boolean read GetExclusiveMaximumStored;
      property IsMinimumStored: Boolean read GetMinimumStored;
      property IsExclusiveMinimumStored: Boolean read GetExclusiveMinimumStored;
      property IsMaxLengthStored: Boolean read GetMaxLengthStored;
      property IsMinLengthStored: Boolean read GetMinLengthStored;
      property IsPatternStored: Boolean read GetPatternStored;
      property IsMaxItemsStored: Boolean read GetMaxItemsStored;
      property IsMinItemsStored: Boolean read GetMinItemsStored;
      property IsUniqueItemsStored: Boolean read GetUniqueItemsStored;
      property IsEnumStored: Boolean read GetEnumStored;
      property IsMultipleOfStored: Boolean read GetMultipleOfStored;
      property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
    published
      property required: System.Boolean read FRequired write FRequired stored GetRequiredStored;
      [FieldName('in')]
      property &in: TOpenAPIDefinition.formDataParameterSubSchema.InProperty read FIn write SetIn stored FInIsStored;
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      property name: System.String read FName write FName stored GetNameStored;
      property allowEmptyValue: System.Boolean read FAllowEmptyValue write FAllowEmptyValue stored GetAllowEmptyValueStored;
      [FieldName('type')]
      property &type: TOpenAPIDefinition.formDataParameterSubSchema.TypeProperty read FType write SetType stored FTypeIsStored;
      property format: System.String read FFormat write FFormat stored GetFormatStored;
      property items: TOpenAPIDefinition.primitivesItems read GetItems write FItems stored GetItemsStored;
      property collectionFormat: TOpenAPIDefinition.collectionFormatWithMulti read FCollectionFormat write SetCollectionFormat stored FCollectionFormatIsStored;
      property default: TOpenAPIDefinition.default read FDefault write FDefault stored GetDefaultStored;
      property maximum: TOpenAPIDefinition.maximum read FMaximum write FMaximum stored GetMaximumStored;
      property exclusiveMaximum: TOpenAPIDefinition.exclusiveMaximum read FExclusiveMaximum write FExclusiveMaximum stored GetExclusiveMaximumStored;
      property minimum: TOpenAPIDefinition.minimum read FMinimum write FMinimum stored GetMinimumStored;
      property exclusiveMinimum: TOpenAPIDefinition.exclusiveMinimum read FExclusiveMinimum write FExclusiveMinimum stored GetExclusiveMinimumStored;
      property maxLength: TOpenAPIDefinition.maxLength read FMaxLength write FMaxLength stored GetMaxLengthStored;
      property minLength: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0 read GetMinLength write FMinLength stored GetMinLengthStored;
      property pattern: TOpenAPIDefinition.pattern read FPattern write FPattern stored GetPatternStored;
      property maxItems: TOpenAPIDefinition.maxItems read FMaxItems write FMaxItems stored GetMaxItemsStored;
      property minItems: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0 read GetMinItems write FMinItems stored GetMinItemsStored;
      property uniqueItems: TOpenAPIDefinition.uniqueItems read FUniqueItems write FUniqueItems stored GetUniqueItemsStored;
      property enum: TOpenAPIDefinition.enum read FEnum write FEnum stored GetEnumStored;
      property multipleOf: TOpenAPIDefinition.multipleOf read FMultipleOf write FMultipleOf stored GetMultipleOfStored;
      [PatternProperty('^x-')]
      property vendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
    end;

    pathParameterSubSchema = class
    public type
      RequiredProperty = (True);

      InProperty = (path);

      [EnumValue('string, number, boolean, integer, array')]
      TypeProperty = (&string, number, boolean, integer, &array);
    private
      FRequired: TOpenAPIDefinition.pathParameterSubSchema.RequiredProperty;
      FIn: TOpenAPIDefinition.pathParameterSubSchema.InProperty;
      FDescription: System.String;
      FName: System.String;
      FType: TOpenAPIDefinition.pathParameterSubSchema.TypeProperty;
      FFormat: System.String;
      FItems: TOpenAPIDefinition.primitivesItems;
      FCollectionFormat: TOpenAPIDefinition.collectionFormat;
      FDefault: TOpenAPIDefinition.default;
      FMaximum: TOpenAPIDefinition.maximum;
      FExclusiveMaximum: TOpenAPIDefinition.exclusiveMaximum;
      FMinimum: TOpenAPIDefinition.minimum;
      FExclusiveMinimum: TOpenAPIDefinition.exclusiveMinimum;
      FMaxLength: TOpenAPIDefinition.maxLength;
      FMinLength: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0;
      FPattern: TOpenAPIDefinition.pattern;
      FMaxItems: TOpenAPIDefinition.maxItems;
      FMinItems: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0;
      FUniqueItems: TOpenAPIDefinition.uniqueItems;
      FEnum: TOpenAPIDefinition.enum;
      FMultipleOf: TOpenAPIDefinition.multipleOf;
      FVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
      FInIsStored: Boolean;
      FTypeIsStored: Boolean;
      FCollectionFormatIsStored: Boolean;

      function GetItems: TOpenAPIDefinition.primitivesItems;
      function GetMinLength: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0;
      function GetMinItems: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0;
      function GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
      function GetDescriptionStored: Boolean;
      function GetNameStored: Boolean;
      function GetFormatStored: Boolean;
      function GetItemsStored: Boolean;
      function GetDefaultStored: Boolean;
      function GetMaximumStored: Boolean;
      function GetExclusiveMaximumStored: Boolean;
      function GetMinimumStored: Boolean;
      function GetExclusiveMinimumStored: Boolean;
      function GetMaxLengthStored: Boolean;
      function GetMinLengthStored: Boolean;
      function GetPatternStored: Boolean;
      function GetMaxItemsStored: Boolean;
      function GetMinItemsStored: Boolean;
      function GetUniqueItemsStored: Boolean;
      function GetEnumStored: Boolean;
      function GetMultipleOfStored: Boolean;
      function GetVendorExtensionStored: Boolean;
      procedure SetIn(const Value: TOpenAPIDefinition.pathParameterSubSchema.InProperty);
      procedure SetType(const Value: TOpenAPIDefinition.pathParameterSubSchema.TypeProperty);
      procedure SetCollectionFormat(const Value: TOpenAPIDefinition.collectionFormat);
    public
      destructor Destroy; override;

      property IsInStored: Boolean read FInIsStored;
      property IsDescriptionStored: Boolean read GetDescriptionStored;
      property IsNameStored: Boolean read GetNameStored;
      property IsTypeStored: Boolean read FTypeIsStored;
      property IsFormatStored: Boolean read GetFormatStored;
      property IsItemsStored: Boolean read GetItemsStored;
      property IsCollectionFormatStored: Boolean read FCollectionFormatIsStored;
      property IsDefaultStored: Boolean read GetDefaultStored;
      property IsMaximumStored: Boolean read GetMaximumStored;
      property IsExclusiveMaximumStored: Boolean read GetExclusiveMaximumStored;
      property IsMinimumStored: Boolean read GetMinimumStored;
      property IsExclusiveMinimumStored: Boolean read GetExclusiveMinimumStored;
      property IsMaxLengthStored: Boolean read GetMaxLengthStored;
      property IsMinLengthStored: Boolean read GetMinLengthStored;
      property IsPatternStored: Boolean read GetPatternStored;
      property IsMaxItemsStored: Boolean read GetMaxItemsStored;
      property IsMinItemsStored: Boolean read GetMinItemsStored;
      property IsUniqueItemsStored: Boolean read GetUniqueItemsStored;
      property IsEnumStored: Boolean read GetEnumStored;
      property IsMultipleOfStored: Boolean read GetMultipleOfStored;
      property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
    published
      property required: TOpenAPIDefinition.pathParameterSubSchema.RequiredProperty read FRequired write FRequired;
      [FieldName('in')]
      property &in: TOpenAPIDefinition.pathParameterSubSchema.InProperty read FIn write SetIn stored FInIsStored;
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      property name: System.String read FName write FName stored GetNameStored;
      [FieldName('type')]
      property &type: TOpenAPIDefinition.pathParameterSubSchema.TypeProperty read FType write SetType stored FTypeIsStored;
      property format: System.String read FFormat write FFormat stored GetFormatStored;
      property items: TOpenAPIDefinition.primitivesItems read GetItems write FItems stored GetItemsStored;
      property collectionFormat: TOpenAPIDefinition.collectionFormat read FCollectionFormat write SetCollectionFormat stored FCollectionFormatIsStored;
      property default: TOpenAPIDefinition.default read FDefault write FDefault stored GetDefaultStored;
      property maximum: TOpenAPIDefinition.maximum read FMaximum write FMaximum stored GetMaximumStored;
      property exclusiveMaximum: TOpenAPIDefinition.exclusiveMaximum read FExclusiveMaximum write FExclusiveMaximum stored GetExclusiveMaximumStored;
      property minimum: TOpenAPIDefinition.minimum read FMinimum write FMinimum stored GetMinimumStored;
      property exclusiveMinimum: TOpenAPIDefinition.exclusiveMinimum read FExclusiveMinimum write FExclusiveMinimum stored GetExclusiveMinimumStored;
      property maxLength: TOpenAPIDefinition.maxLength read FMaxLength write FMaxLength stored GetMaxLengthStored;
      property minLength: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0 read GetMinLength write FMinLength stored GetMinLengthStored;
      property pattern: TOpenAPIDefinition.pattern read FPattern write FPattern stored GetPatternStored;
      property maxItems: TOpenAPIDefinition.maxItems read FMaxItems write FMaxItems stored GetMaxItemsStored;
      property minItems: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0 read GetMinItems write FMinItems stored GetMinItemsStored;
      property uniqueItems: TOpenAPIDefinition.uniqueItems read FUniqueItems write FUniqueItems stored GetUniqueItemsStored;
      property enum: TOpenAPIDefinition.enum read FEnum write FEnum stored GetEnumStored;
      property multipleOf: TOpenAPIDefinition.multipleOf read FMultipleOf write FMultipleOf stored GetMultipleOfStored;
      [PatternProperty('^x-')]
      property vendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
    end;

    [Flat('in')]
    nonBodyParameter = class
    private
      FHeaderParameterSubSchema: TOpenAPIDefinition.headerParameterSubSchema;
      FFormDataParameterSubSchema: TOpenAPIDefinition.formDataParameterSubSchema;
      FQueryParameterSubSchema: TOpenAPIDefinition.queryParameterSubSchema;
      FPathParameterSubSchema: TOpenAPIDefinition.pathParameterSubSchema;

      function GetHeaderParameterSubSchema: TOpenAPIDefinition.headerParameterSubSchema;
      function GetFormDataParameterSubSchema: TOpenAPIDefinition.formDataParameterSubSchema;
      function GetQueryParameterSubSchema: TOpenAPIDefinition.queryParameterSubSchema;
      function GetPathParameterSubSchema: TOpenAPIDefinition.pathParameterSubSchema;
      function GetHeaderParameterSubSchemaStored: Boolean;
      function GetFormDataParameterSubSchemaStored: Boolean;
      function GetQueryParameterSubSchemaStored: Boolean;
      function GetPathParameterSubSchemaStored: Boolean;
    public
      destructor Destroy; override;

      property IsHeaderParameterSubSchemaStored: Boolean read GetHeaderParameterSubSchemaStored;
      property IsFormDataParameterSubSchemaStored: Boolean read GetFormDataParameterSubSchemaStored;
      property IsQueryParameterSubSchemaStored: Boolean read GetQueryParameterSubSchemaStored;
      property IsPathParameterSubSchemaStored: Boolean read GetPathParameterSubSchemaStored;
    published
      property headerParameterSubSchema: TOpenAPIDefinition.headerParameterSubSchema read GetHeaderParameterSubSchema write FHeaderParameterSubSchema stored GetHeaderParameterSubSchemaStored;
      property formDataParameterSubSchema: TOpenAPIDefinition.formDataParameterSubSchema read GetFormDataParameterSubSchema write FFormDataParameterSubSchema stored GetFormDataParameterSubSchemaStored;
      property queryParameterSubSchema: TOpenAPIDefinition.queryParameterSubSchema read GetQueryParameterSubSchema write FQueryParameterSubSchema stored GetQueryParameterSubSchemaStored;
      property pathParameterSubSchema: TOpenAPIDefinition.pathParameterSubSchema read GetPathParameterSubSchema write FPathParameterSubSchema stored GetPathParameterSubSchemaStored;
    end;

    [Flat('in')]
    parameter = class
    private
      FBodyParameter: TOpenAPIDefinition.bodyParameter;
      FNonBodyParameter: TOpenAPIDefinition.nonBodyParameter;

      function GetBodyParameter: TOpenAPIDefinition.bodyParameter;
      function GetNonBodyParameter: TOpenAPIDefinition.nonBodyParameter;
      function GetBodyParameterStored: Boolean;
      function GetNonBodyParameterStored: Boolean;
    public
      destructor Destroy; override;

      property IsBodyParameterStored: Boolean read GetBodyParameterStored;
      property IsNonBodyParameterStored: Boolean read GetNonBodyParameterStored;
    published
      property bodyParameter: TOpenAPIDefinition.bodyParameter read GetBodyParameter write FBodyParameter stored GetBodyParameterStored;
      property nonBodyParameter: TOpenAPIDefinition.nonBodyParameter read GetNonBodyParameter write FNonBodyParameter stored GetNonBodyParameterStored;
    end;

    schema = class
    public type
      // Forward class declaration
      AdditionalPropertiesProperty = class;
      ItemsProperty = class;
      PropertiesProperty = class;

      [Flat]
      AdditionalPropertiesProperty = class
      private
        FSchema: TOpenAPIDefinition.schema;
        FBoolean: System.Boolean;

        function GetSchema: TOpenAPIDefinition.schema;
        function GetSchemaStored: Boolean;
        function GetBooleanStored: Boolean;
      public
        destructor Destroy; override;

        property IsSchemaStored: Boolean read GetSchemaStored;
        property IsBooleanStored: Boolean read GetBooleanStored;
      published
        property schema: TOpenAPIDefinition.schema read GetSchema write FSchema stored GetSchemaStored;
        property boolean: System.Boolean read FBoolean write FBoolean stored GetBooleanStored;
      end;

      [Flat]
      ItemsProperty = class
      private
        FSchema: TOpenAPIDefinition.schema;
        FArray: TArray<TOpenAPIDefinition.schema>;

        function GetSchema: TOpenAPIDefinition.schema;
        function GetSchemaStored: Boolean;
        function GetArrayStored: Boolean;
      public
        destructor Destroy; override;

        function AddArray: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.schema;

        property IsSchemaStored: Boolean read GetSchemaStored;
        property IsArrayStored: Boolean read GetArrayStored;
      published
        property schema: TOpenAPIDefinition.schema read GetSchema write FSchema stored GetSchemaStored;
        [FieldName('array')]
        property &array: TArray<TOpenAPIDefinition.schema> read FArray write FArray stored GetArrayStored;
      end;

      PropertiesProperty = class
      private
        FAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.schema>;

        function GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.schema>;
        function GetAdditionalPropertiesStored: Boolean;
      public
        destructor Destroy; override;

        property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
      published
        property additionalProperties: TDynamicProperty<TOpenAPIDefinition.schema> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
      end;
    private
      FRef: System.String;
      FFormat: System.String;
      FTitle: System.String;
      FDescription: System.String;
      FDefault: Blue.Print.JSON.Draft4.Schema.any;
      FMultipleOf: System.Double;
      FMaximum: System.Double;
      FExclusiveMaximum: System.Boolean;
      FMinimum: System.Double;
      FExclusiveMinimum: System.Boolean;
      FMaxLength: Blue.Print.JSON.Draft4.Schema.Schema.positiveInteger;
      FMinLength: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0;
      FPattern: System.String;
      FMaxItems: Blue.Print.JSON.Draft4.Schema.Schema.positiveInteger;
      FMinItems: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0;
      FUniqueItems: System.Boolean;
      FMaxProperties: Blue.Print.JSON.Draft4.Schema.Schema.positiveInteger;
      FMinProperties: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0;
      FRequired: Blue.Print.JSON.Draft4.Schema.Schema.stringArray;
      FEnum: TArray<Blue.Print.JSON.Draft4.Schema.any>;
      FAdditionalProperties: TOpenAPIDefinition.schema.AdditionalPropertiesProperty;
      FType: Blue.Print.JSON.Draft4.Schema.Schema.Schema.TypeProperty;
      FItems: TOpenAPIDefinition.schema.ItemsProperty;
      FAllOf: TArray<TOpenAPIDefinition.schema>;
      FProperties: TOpenAPIDefinition.schema.PropertiesProperty;
      FDiscriminator: System.String;
      FReadOnly: System.Boolean;
      FXml: TOpenAPIDefinition.xml;
      FExternalDocs: TOpenAPIDefinition.externalDocs;
      FExample: any;
      FVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;

      function GetMinLength: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0;
      function GetMinItems: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0;
      function GetMinProperties: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0;
      function GetAdditionalProperties: TOpenAPIDefinition.schema.AdditionalPropertiesProperty;
      function GetType: Blue.Print.JSON.Draft4.Schema.Schema.Schema.TypeProperty;
      function GetItems: TOpenAPIDefinition.schema.ItemsProperty;
      function GetProperties: TOpenAPIDefinition.schema.PropertiesProperty;
      function GetXml: TOpenAPIDefinition.xml;
      function GetExternalDocs: TOpenAPIDefinition.externalDocs;
      function GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
      function GetRefStored: Boolean;
      function GetFormatStored: Boolean;
      function GetTitleStored: Boolean;
      function GetDescriptionStored: Boolean;
      function GetDefaultStored: Boolean;
      function GetMultipleOfStored: Boolean;
      function GetMaximumStored: Boolean;
      function GetExclusiveMaximumStored: Boolean;
      function GetMinimumStored: Boolean;
      function GetExclusiveMinimumStored: Boolean;
      function GetMaxLengthStored: Boolean;
      function GetMinLengthStored: Boolean;
      function GetPatternStored: Boolean;
      function GetMaxItemsStored: Boolean;
      function GetMinItemsStored: Boolean;
      function GetUniqueItemsStored: Boolean;
      function GetMaxPropertiesStored: Boolean;
      function GetMinPropertiesStored: Boolean;
      function GetRequiredStored: Boolean;
      function GetEnumStored: Boolean;
      function GetAdditionalPropertiesStored: Boolean;
      function GetTypeStored: Boolean;
      function GetItemsStored: Boolean;
      function GetAllOfStored: Boolean;
      function GetPropertiesStored: Boolean;
      function GetDiscriminatorStored: Boolean;
      function GetReadOnlyStored: Boolean;
      function GetXmlStored: Boolean;
      function GetExternalDocsStored: Boolean;
      function GetExampleStored: Boolean;
      function GetVendorExtensionStored: Boolean;
    public
      destructor Destroy; override;

      function AddAllOf: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.schema;

      property IsRefStored: Boolean read GetRefStored;
      property IsFormatStored: Boolean read GetFormatStored;
      property IsTitleStored: Boolean read GetTitleStored;
      property IsDescriptionStored: Boolean read GetDescriptionStored;
      property IsDefaultStored: Boolean read GetDefaultStored;
      property IsMultipleOfStored: Boolean read GetMultipleOfStored;
      property IsMaximumStored: Boolean read GetMaximumStored;
      property IsExclusiveMaximumStored: Boolean read GetExclusiveMaximumStored;
      property IsMinimumStored: Boolean read GetMinimumStored;
      property IsExclusiveMinimumStored: Boolean read GetExclusiveMinimumStored;
      property IsMaxLengthStored: Boolean read GetMaxLengthStored;
      property IsMinLengthStored: Boolean read GetMinLengthStored;
      property IsPatternStored: Boolean read GetPatternStored;
      property IsMaxItemsStored: Boolean read GetMaxItemsStored;
      property IsMinItemsStored: Boolean read GetMinItemsStored;
      property IsUniqueItemsStored: Boolean read GetUniqueItemsStored;
      property IsMaxPropertiesStored: Boolean read GetMaxPropertiesStored;
      property IsMinPropertiesStored: Boolean read GetMinPropertiesStored;
      property IsRequiredStored: Boolean read GetRequiredStored;
      property IsEnumStored: Boolean read GetEnumStored;
      property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
      property IsTypeStored: Boolean read GetTypeStored;
      property IsItemsStored: Boolean read GetItemsStored;
      property IsAllOfStored: Boolean read GetAllOfStored;
      property IsPropertiesStored: Boolean read GetPropertiesStored;
      property IsDiscriminatorStored: Boolean read GetDiscriminatorStored;
      property IsReadOnlyStored: Boolean read GetReadOnlyStored;
      property IsXmlStored: Boolean read GetXmlStored;
      property IsExternalDocsStored: Boolean read GetExternalDocsStored;
      property IsExampleStored: Boolean read GetExampleStored;
      property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
    published
      [FieldName('$ref')]
      property ref: System.String read FRef write FRef stored GetRefStored;
      property format: System.String read FFormat write FFormat stored GetFormatStored;
      property title: System.String read FTitle write FTitle stored GetTitleStored;
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      property default: Blue.Print.JSON.Draft4.Schema.any read FDefault write FDefault stored GetDefaultStored;
      property multipleOf: System.Double read FMultipleOf write FMultipleOf stored GetMultipleOfStored;
      property maximum: System.Double read FMaximum write FMaximum stored GetMaximumStored;
      property exclusiveMaximum: System.Boolean read FExclusiveMaximum write FExclusiveMaximum stored GetExclusiveMaximumStored;
      property minimum: System.Double read FMinimum write FMinimum stored GetMinimumStored;
      property exclusiveMinimum: System.Boolean read FExclusiveMinimum write FExclusiveMinimum stored GetExclusiveMinimumStored;
      property maxLength: Blue.Print.JSON.Draft4.Schema.Schema.positiveInteger read FMaxLength write FMaxLength stored GetMaxLengthStored;
      property minLength: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0 read GetMinLength write FMinLength stored GetMinLengthStored;
      property pattern: System.String read FPattern write FPattern stored GetPatternStored;
      property maxItems: Blue.Print.JSON.Draft4.Schema.Schema.positiveInteger read FMaxItems write FMaxItems stored GetMaxItemsStored;
      property minItems: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0 read GetMinItems write FMinItems stored GetMinItemsStored;
      property uniqueItems: System.Boolean read FUniqueItems write FUniqueItems stored GetUniqueItemsStored;
      property maxProperties: Blue.Print.JSON.Draft4.Schema.Schema.positiveInteger read FMaxProperties write FMaxProperties stored GetMaxPropertiesStored;
      property minProperties: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0 read GetMinProperties write FMinProperties stored GetMinPropertiesStored;
      property required: Blue.Print.JSON.Draft4.Schema.Schema.stringArray read FRequired write FRequired stored GetRequiredStored;
      property enum: TArray<Blue.Print.JSON.Draft4.Schema.any> read FEnum write FEnum stored GetEnumStored;
      property additionalProperties: TOpenAPIDefinition.schema.AdditionalPropertiesProperty read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
      [FieldName('type')]
      property &type: Blue.Print.JSON.Draft4.Schema.Schema.Schema.TypeProperty read GetType write FType stored GetTypeStored;
      property items: TOpenAPIDefinition.schema.ItemsProperty read GetItems write FItems stored GetItemsStored;
      property allOf: TArray<TOpenAPIDefinition.schema> read FAllOf write FAllOf stored GetAllOfStored;
      property properties: TOpenAPIDefinition.schema.PropertiesProperty read GetProperties write FProperties stored GetPropertiesStored;
      property discriminator: System.String read FDiscriminator write FDiscriminator stored GetDiscriminatorStored;
      property readOnly: System.Boolean read FReadOnly write FReadOnly stored GetReadOnlyStored;
      property xml: TOpenAPIDefinition.xml read GetXml write FXml stored GetXmlStored;
      property externalDocs: TOpenAPIDefinition.externalDocs read GetExternalDocs write FExternalDocs stored GetExternalDocsStored;
      property example: any read FExample write FExample stored GetExampleStored;
      [PatternProperty('^x-')]
      property vendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
    end;

    fileSchema = class
    public type
      [EnumValue('file')]
      TypeProperty = (&file);
    private
      FFormat: System.String;
      FTitle: System.String;
      FDescription: System.String;
      FDefault: Blue.Print.JSON.Draft4.Schema.any;
      FRequired: Blue.Print.JSON.Draft4.Schema.Schema.stringArray;
      FType: TOpenAPIDefinition.fileSchema.TypeProperty;
      FReadOnly: System.Boolean;
      FExternalDocs: TOpenAPIDefinition.externalDocs;
      FExample: any;
      FVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;

      function GetExternalDocs: TOpenAPIDefinition.externalDocs;
      function GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
      function GetFormatStored: Boolean;
      function GetTitleStored: Boolean;
      function GetDescriptionStored: Boolean;
      function GetDefaultStored: Boolean;
      function GetRequiredStored: Boolean;
      function GetReadOnlyStored: Boolean;
      function GetExternalDocsStored: Boolean;
      function GetExampleStored: Boolean;
      function GetVendorExtensionStored: Boolean;
    public
      destructor Destroy; override;

      property IsFormatStored: Boolean read GetFormatStored;
      property IsTitleStored: Boolean read GetTitleStored;
      property IsDescriptionStored: Boolean read GetDescriptionStored;
      property IsDefaultStored: Boolean read GetDefaultStored;
      property IsRequiredStored: Boolean read GetRequiredStored;
      property IsReadOnlyStored: Boolean read GetReadOnlyStored;
      property IsExternalDocsStored: Boolean read GetExternalDocsStored;
      property IsExampleStored: Boolean read GetExampleStored;
      property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
    published
      property format: System.String read FFormat write FFormat stored GetFormatStored;
      property title: System.String read FTitle write FTitle stored GetTitleStored;
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      property default: Blue.Print.JSON.Draft4.Schema.any read FDefault write FDefault stored GetDefaultStored;
      property required: Blue.Print.JSON.Draft4.Schema.Schema.stringArray read FRequired write FRequired stored GetRequiredStored;
      [FieldName('type')]
      property &type: TOpenAPIDefinition.fileSchema.TypeProperty read FType write FType;
      property readOnly: System.Boolean read FReadOnly write FReadOnly stored GetReadOnlyStored;
      property externalDocs: TOpenAPIDefinition.externalDocs read GetExternalDocs write FExternalDocs stored GetExternalDocsStored;
      property example: any read FExample write FExample stored GetExampleStored;
      [PatternProperty('^x-')]
      property vendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
    end;

    primitivesItems = class
    public type
      [EnumValue('string, number, integer, boolean, array')]
      TypeProperty = (&string, number, integer, boolean, &array);
    private
      FType: TOpenAPIDefinition.primitivesItems.TypeProperty;
      FFormat: System.String;
      FItems: TOpenAPIDefinition.primitivesItems;
      FCollectionFormat: TOpenAPIDefinition.collectionFormat;
      FDefault: TOpenAPIDefinition.default;
      FMaximum: TOpenAPIDefinition.maximum;
      FExclusiveMaximum: TOpenAPIDefinition.exclusiveMaximum;
      FMinimum: TOpenAPIDefinition.minimum;
      FExclusiveMinimum: TOpenAPIDefinition.exclusiveMinimum;
      FMaxLength: TOpenAPIDefinition.maxLength;
      FMinLength: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0;
      FPattern: TOpenAPIDefinition.pattern;
      FMaxItems: TOpenAPIDefinition.maxItems;
      FMinItems: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0;
      FUniqueItems: TOpenAPIDefinition.uniqueItems;
      FEnum: TOpenAPIDefinition.enum;
      FMultipleOf: TOpenAPIDefinition.multipleOf;
      FVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
      FTypeIsStored: Boolean;
      FCollectionFormatIsStored: Boolean;

      function GetItems: TOpenAPIDefinition.primitivesItems;
      function GetMinLength: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0;
      function GetMinItems: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0;
      function GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
      function GetFormatStored: Boolean;
      function GetItemsStored: Boolean;
      function GetDefaultStored: Boolean;
      function GetMaximumStored: Boolean;
      function GetExclusiveMaximumStored: Boolean;
      function GetMinimumStored: Boolean;
      function GetExclusiveMinimumStored: Boolean;
      function GetMaxLengthStored: Boolean;
      function GetMinLengthStored: Boolean;
      function GetPatternStored: Boolean;
      function GetMaxItemsStored: Boolean;
      function GetMinItemsStored: Boolean;
      function GetUniqueItemsStored: Boolean;
      function GetEnumStored: Boolean;
      function GetMultipleOfStored: Boolean;
      function GetVendorExtensionStored: Boolean;
      procedure SetType(const Value: TOpenAPIDefinition.primitivesItems.TypeProperty);
      procedure SetCollectionFormat(const Value: TOpenAPIDefinition.collectionFormat);
    public
      destructor Destroy; override;

      property IsTypeStored: Boolean read FTypeIsStored;
      property IsFormatStored: Boolean read GetFormatStored;
      property IsItemsStored: Boolean read GetItemsStored;
      property IsCollectionFormatStored: Boolean read FCollectionFormatIsStored;
      property IsDefaultStored: Boolean read GetDefaultStored;
      property IsMaximumStored: Boolean read GetMaximumStored;
      property IsExclusiveMaximumStored: Boolean read GetExclusiveMaximumStored;
      property IsMinimumStored: Boolean read GetMinimumStored;
      property IsExclusiveMinimumStored: Boolean read GetExclusiveMinimumStored;
      property IsMaxLengthStored: Boolean read GetMaxLengthStored;
      property IsMinLengthStored: Boolean read GetMinLengthStored;
      property IsPatternStored: Boolean read GetPatternStored;
      property IsMaxItemsStored: Boolean read GetMaxItemsStored;
      property IsMinItemsStored: Boolean read GetMinItemsStored;
      property IsUniqueItemsStored: Boolean read GetUniqueItemsStored;
      property IsEnumStored: Boolean read GetEnumStored;
      property IsMultipleOfStored: Boolean read GetMultipleOfStored;
      property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
    published
      [FieldName('type')]
      property &type: TOpenAPIDefinition.primitivesItems.TypeProperty read FType write SetType stored FTypeIsStored;
      property format: System.String read FFormat write FFormat stored GetFormatStored;
      property items: TOpenAPIDefinition.primitivesItems read GetItems write FItems stored GetItemsStored;
      property collectionFormat: TOpenAPIDefinition.collectionFormat read FCollectionFormat write SetCollectionFormat stored FCollectionFormatIsStored;
      property default: TOpenAPIDefinition.default read FDefault write FDefault stored GetDefaultStored;
      property maximum: TOpenAPIDefinition.maximum read FMaximum write FMaximum stored GetMaximumStored;
      property exclusiveMaximum: TOpenAPIDefinition.exclusiveMaximum read FExclusiveMaximum write FExclusiveMaximum stored GetExclusiveMaximumStored;
      property minimum: TOpenAPIDefinition.minimum read FMinimum write FMinimum stored GetMinimumStored;
      property exclusiveMinimum: TOpenAPIDefinition.exclusiveMinimum read FExclusiveMinimum write FExclusiveMinimum stored GetExclusiveMinimumStored;
      property maxLength: TOpenAPIDefinition.maxLength read FMaxLength write FMaxLength stored GetMaxLengthStored;
      property minLength: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0 read GetMinLength write FMinLength stored GetMinLengthStored;
      property pattern: TOpenAPIDefinition.pattern read FPattern write FPattern stored GetPatternStored;
      property maxItems: TOpenAPIDefinition.maxItems read FMaxItems write FMaxItems stored GetMaxItemsStored;
      property minItems: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0 read GetMinItems write FMinItems stored GetMinItemsStored;
      property uniqueItems: TOpenAPIDefinition.uniqueItems read FUniqueItems write FUniqueItems stored GetUniqueItemsStored;
      property enum: TOpenAPIDefinition.enum read FEnum write FEnum stored GetEnumStored;
      property multipleOf: TOpenAPIDefinition.multipleOf read FMultipleOf write FMultipleOf stored GetMultipleOfStored;
      [PatternProperty('^x-')]
      property vendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
    end;

    securityRequirement = class
    private
      FAdditionalProperties: TDynamicProperty<TArray<System.String>>;

      function GetAdditionalProperties: TDynamicProperty<TArray<System.String>>;
      function GetAdditionalPropertiesStored: Boolean;
    public
      destructor Destroy; override;

      property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
    published
      property additionalProperties: TDynamicProperty<TArray<System.String>> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
    end;

    xml = class
    private
      FName: System.String;
      FNamespace: System.String;
      FPrefix: System.String;
      FAttribute: System.Boolean;
      FWrapped: System.Boolean;
      FVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;

      function GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
      function GetNameStored: Boolean;
      function GetNamespaceStored: Boolean;
      function GetPrefixStored: Boolean;
      function GetAttributeStored: Boolean;
      function GetWrappedStored: Boolean;
      function GetVendorExtensionStored: Boolean;
    public
      destructor Destroy; override;

      property IsNameStored: Boolean read GetNameStored;
      property IsNamespaceStored: Boolean read GetNamespaceStored;
      property IsPrefixStored: Boolean read GetPrefixStored;
      property IsAttributeStored: Boolean read GetAttributeStored;
      property IsWrappedStored: Boolean read GetWrappedStored;
      property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
    published
      property name: System.String read FName write FName stored GetNameStored;
      property namespace: System.String read FNamespace write FNamespace stored GetNamespaceStored;
      property prefix: System.String read FPrefix write FPrefix stored GetPrefixStored;
      property attribute: System.Boolean read FAttribute write FAttribute stored GetAttributeStored;
      property wrapped: System.Boolean read FWrapped write FWrapped stored GetWrappedStored;
      [PatternProperty('^x-')]
      property vendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
    end;

    tag = class
    private
      FName: System.String;
      FDescription: System.String;
      FExternalDocs: TOpenAPIDefinition.externalDocs;
      FVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;

      function GetExternalDocs: TOpenAPIDefinition.externalDocs;
      function GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
      function GetDescriptionStored: Boolean;
      function GetExternalDocsStored: Boolean;
      function GetVendorExtensionStored: Boolean;
    public
      destructor Destroy; override;

      property IsDescriptionStored: Boolean read GetDescriptionStored;
      property IsExternalDocsStored: Boolean read GetExternalDocsStored;
      property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
    published
      property name: System.String read FName write FName;
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      property externalDocs: TOpenAPIDefinition.externalDocs read GetExternalDocs write FExternalDocs stored GetExternalDocsStored;
      [PatternProperty('^x-')]
      property vendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
    end;

    securityDefinitions = class
    public type
      // Forward class declaration
      additionalPropertiesType = class;

      [Flat('type')]
      additionalPropertiesType = class
      private
        FBasicAuthenticationSecurity: TOpenAPIDefinition.basicAuthenticationSecurity;
        FApiKeySecurity: TOpenAPIDefinition.apiKeySecurity;
        FOauth2ImplicitSecurity: TOpenAPIDefinition.oauth2ImplicitSecurity;
        FOauth2PasswordSecurity: TOpenAPIDefinition.oauth2PasswordSecurity;
        FOauth2ApplicationSecurity: TOpenAPIDefinition.oauth2ApplicationSecurity;
        FOauth2AccessCodeSecurity: TOpenAPIDefinition.oauth2AccessCodeSecurity;

        function GetBasicAuthenticationSecurity: TOpenAPIDefinition.basicAuthenticationSecurity;
        function GetApiKeySecurity: TOpenAPIDefinition.apiKeySecurity;
        function GetOauth2ImplicitSecurity: TOpenAPIDefinition.oauth2ImplicitSecurity;
        function GetOauth2PasswordSecurity: TOpenAPIDefinition.oauth2PasswordSecurity;
        function GetOauth2ApplicationSecurity: TOpenAPIDefinition.oauth2ApplicationSecurity;
        function GetOauth2AccessCodeSecurity: TOpenAPIDefinition.oauth2AccessCodeSecurity;
        function GetBasicAuthenticationSecurityStored: Boolean;
        function GetApiKeySecurityStored: Boolean;
        function GetOauth2ImplicitSecurityStored: Boolean;
        function GetOauth2PasswordSecurityStored: Boolean;
        function GetOauth2ApplicationSecurityStored: Boolean;
        function GetOauth2AccessCodeSecurityStored: Boolean;
      public
        destructor Destroy; override;

        property IsBasicAuthenticationSecurityStored: Boolean read GetBasicAuthenticationSecurityStored;
        property IsApiKeySecurityStored: Boolean read GetApiKeySecurityStored;
        property IsOauth2ImplicitSecurityStored: Boolean read GetOauth2ImplicitSecurityStored;
        property IsOauth2PasswordSecurityStored: Boolean read GetOauth2PasswordSecurityStored;
        property IsOauth2ApplicationSecurityStored: Boolean read GetOauth2ApplicationSecurityStored;
        property IsOauth2AccessCodeSecurityStored: Boolean read GetOauth2AccessCodeSecurityStored;
      published
        property basicAuthenticationSecurity: TOpenAPIDefinition.basicAuthenticationSecurity read GetBasicAuthenticationSecurity write FBasicAuthenticationSecurity stored GetBasicAuthenticationSecurityStored;
        property apiKeySecurity: TOpenAPIDefinition.apiKeySecurity read GetApiKeySecurity write FApiKeySecurity stored GetApiKeySecurityStored;
        property oauth2ImplicitSecurity: TOpenAPIDefinition.oauth2ImplicitSecurity read GetOauth2ImplicitSecurity write FOauth2ImplicitSecurity stored GetOauth2ImplicitSecurityStored;
        property oauth2PasswordSecurity: TOpenAPIDefinition.oauth2PasswordSecurity read GetOauth2PasswordSecurity write FOauth2PasswordSecurity stored GetOauth2PasswordSecurityStored;
        property oauth2ApplicationSecurity: TOpenAPIDefinition.oauth2ApplicationSecurity read GetOauth2ApplicationSecurity write FOauth2ApplicationSecurity stored GetOauth2ApplicationSecurityStored;
        property oauth2AccessCodeSecurity: TOpenAPIDefinition.oauth2AccessCodeSecurity read GetOauth2AccessCodeSecurity write FOauth2AccessCodeSecurity stored GetOauth2AccessCodeSecurityStored;
      end;
    private
      FAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.securityDefinitions.additionalPropertiesType>;

      function GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.securityDefinitions.additionalPropertiesType>;
      function GetAdditionalPropertiesStored: Boolean;
    public
      destructor Destroy; override;

      property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
    published
      property additionalProperties: TDynamicProperty<TOpenAPIDefinition.securityDefinitions.additionalPropertiesType> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
    end;

    basicAuthenticationSecurity = class
    public type
      TypeProperty = (basic);
    private
      FType: TOpenAPIDefinition.basicAuthenticationSecurity.TypeProperty;
      FDescription: System.String;
      FVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;

      function GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
      function GetDescriptionStored: Boolean;
      function GetVendorExtensionStored: Boolean;
    public
      destructor Destroy; override;

      property IsDescriptionStored: Boolean read GetDescriptionStored;
      property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
    published
      [FieldName('type')]
      property &type: TOpenAPIDefinition.basicAuthenticationSecurity.TypeProperty read FType write FType;
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      [PatternProperty('^x-')]
      property vendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
    end;

    apiKeySecurity = class
    public type
      TypeProperty = (apiKey);

      InProperty = (header, query);
    private
      FType: TOpenAPIDefinition.apiKeySecurity.TypeProperty;
      FName: System.String;
      FIn: TOpenAPIDefinition.apiKeySecurity.InProperty;
      FDescription: System.String;
      FVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;

      function GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
      function GetDescriptionStored: Boolean;
      function GetVendorExtensionStored: Boolean;
    public
      destructor Destroy; override;

      property IsDescriptionStored: Boolean read GetDescriptionStored;
      property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
    published
      [FieldName('type')]
      property &type: TOpenAPIDefinition.apiKeySecurity.TypeProperty read FType write FType;
      property name: System.String read FName write FName;
      [FieldName('in')]
      property &in: TOpenAPIDefinition.apiKeySecurity.InProperty read FIn write FIn;
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      [PatternProperty('^x-')]
      property vendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
    end;

    oauth2ImplicitSecurity = class
    public type
      TypeProperty = (oauth2);

      FlowProperty = (implicit);
    private
      FType: TOpenAPIDefinition.oauth2ImplicitSecurity.TypeProperty;
      FFlow: TOpenAPIDefinition.oauth2ImplicitSecurity.FlowProperty;
      FScopes: TOpenAPIDefinition.oauth2Scopes;
      FAuthorizationUrl: System.String;
      FDescription: System.String;
      FVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;

      function GetScopes: TOpenAPIDefinition.oauth2Scopes;
      function GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
      function GetScopesStored: Boolean;
      function GetDescriptionStored: Boolean;
      function GetVendorExtensionStored: Boolean;
    public
      destructor Destroy; override;

      property IsScopesStored: Boolean read GetScopesStored;
      property IsDescriptionStored: Boolean read GetDescriptionStored;
      property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
    published
      [FieldName('type')]
      property &type: TOpenAPIDefinition.oauth2ImplicitSecurity.TypeProperty read FType write FType;
      property flow: TOpenAPIDefinition.oauth2ImplicitSecurity.FlowProperty read FFlow write FFlow;
      property scopes: TOpenAPIDefinition.oauth2Scopes read GetScopes write FScopes stored GetScopesStored;
      property authorizationUrl: System.String read FAuthorizationUrl write FAuthorizationUrl;
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      [PatternProperty('^x-')]
      property vendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
    end;

    oauth2PasswordSecurity = class
    public type
      TypeProperty = (oauth2);

      FlowProperty = (password);
    private
      FType: TOpenAPIDefinition.oauth2PasswordSecurity.TypeProperty;
      FFlow: TOpenAPIDefinition.oauth2PasswordSecurity.FlowProperty;
      FScopes: TOpenAPIDefinition.oauth2Scopes;
      FTokenUrl: System.String;
      FDescription: System.String;
      FVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;

      function GetScopes: TOpenAPIDefinition.oauth2Scopes;
      function GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
      function GetScopesStored: Boolean;
      function GetDescriptionStored: Boolean;
      function GetVendorExtensionStored: Boolean;
    public
      destructor Destroy; override;

      property IsScopesStored: Boolean read GetScopesStored;
      property IsDescriptionStored: Boolean read GetDescriptionStored;
      property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
    published
      [FieldName('type')]
      property &type: TOpenAPIDefinition.oauth2PasswordSecurity.TypeProperty read FType write FType;
      property flow: TOpenAPIDefinition.oauth2PasswordSecurity.FlowProperty read FFlow write FFlow;
      property scopes: TOpenAPIDefinition.oauth2Scopes read GetScopes write FScopes stored GetScopesStored;
      property tokenUrl: System.String read FTokenUrl write FTokenUrl;
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      [PatternProperty('^x-')]
      property vendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
    end;

    oauth2ApplicationSecurity = class
    public type
      TypeProperty = (oauth2);

      FlowProperty = (application);
    private
      FType: TOpenAPIDefinition.oauth2ApplicationSecurity.TypeProperty;
      FFlow: TOpenAPIDefinition.oauth2ApplicationSecurity.FlowProperty;
      FScopes: TOpenAPIDefinition.oauth2Scopes;
      FTokenUrl: System.String;
      FDescription: System.String;
      FVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;

      function GetScopes: TOpenAPIDefinition.oauth2Scopes;
      function GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
      function GetScopesStored: Boolean;
      function GetDescriptionStored: Boolean;
      function GetVendorExtensionStored: Boolean;
    public
      destructor Destroy; override;

      property IsScopesStored: Boolean read GetScopesStored;
      property IsDescriptionStored: Boolean read GetDescriptionStored;
      property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
    published
      [FieldName('type')]
      property &type: TOpenAPIDefinition.oauth2ApplicationSecurity.TypeProperty read FType write FType;
      property flow: TOpenAPIDefinition.oauth2ApplicationSecurity.FlowProperty read FFlow write FFlow;
      property scopes: TOpenAPIDefinition.oauth2Scopes read GetScopes write FScopes stored GetScopesStored;
      property tokenUrl: System.String read FTokenUrl write FTokenUrl;
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      [PatternProperty('^x-')]
      property vendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
    end;

    oauth2AccessCodeSecurity = class
    public type
      TypeProperty = (oauth2);

      FlowProperty = (accessCode);
    private
      FType: TOpenAPIDefinition.oauth2AccessCodeSecurity.TypeProperty;
      FFlow: TOpenAPIDefinition.oauth2AccessCodeSecurity.FlowProperty;
      FScopes: TOpenAPIDefinition.oauth2Scopes;
      FAuthorizationUrl: System.String;
      FTokenUrl: System.String;
      FDescription: System.String;
      FVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;

      function GetScopes: TOpenAPIDefinition.oauth2Scopes;
      function GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
      function GetScopesStored: Boolean;
      function GetDescriptionStored: Boolean;
      function GetVendorExtensionStored: Boolean;
    public
      destructor Destroy; override;

      property IsScopesStored: Boolean read GetScopesStored;
      property IsDescriptionStored: Boolean read GetDescriptionStored;
      property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
    published
      [FieldName('type')]
      property &type: TOpenAPIDefinition.oauth2AccessCodeSecurity.TypeProperty read FType write FType;
      property flow: TOpenAPIDefinition.oauth2AccessCodeSecurity.FlowProperty read FFlow write FFlow;
      property scopes: TOpenAPIDefinition.oauth2Scopes read GetScopes write FScopes stored GetScopesStored;
      property authorizationUrl: System.String read FAuthorizationUrl write FAuthorizationUrl;
      property tokenUrl: System.String read FTokenUrl write FTokenUrl;
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      [PatternProperty('^x-')]
      property vendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
    end;

    oauth2Scopes = class
    private
      FAdditionalProperties: TDynamicProperty<System.String>;

      function GetAdditionalProperties: TDynamicProperty<System.String>;
      function GetAdditionalPropertiesStored: Boolean;
    public
      destructor Destroy; override;

      property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
    published
      property additionalProperties: TDynamicProperty<System.String> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
    end;

    [Flat]
    parametersListArrayItem = class
    private
      FParameter: TOpenAPIDefinition.parameter;
      FJsonReference: TOpenAPIDefinition.jsonReference;

      function GetParameter: TOpenAPIDefinition.parameter;
      function GetJsonReference: TOpenAPIDefinition.jsonReference;
      function GetParameterStored: Boolean;
      function GetJsonReferenceStored: Boolean;
    public
      destructor Destroy; override;

      property IsParameterStored: Boolean read GetParameterStored;
      property IsJsonReferenceStored: Boolean read GetJsonReferenceStored;
    published
      property parameter: TOpenAPIDefinition.parameter read GetParameter write FParameter stored GetParameterStored;
      property jsonReference: TOpenAPIDefinition.jsonReference read GetJsonReference write FJsonReference stored GetJsonReferenceStored;
    end;

    jsonReference = class
    private
      FRef: System.String;
    published
      [FieldName('$ref')]
      property ref: System.String read FRef write FRef;
    end;

    TOpenAPIDefinition = class
    public type
      [EnumValue('2.0')]
      SwaggerProperty = (t20);

      // Forward class declaration
      ConsumesProperty = class;
      ProducesProperty = class;

      [Flat]
      ConsumesProperty = class
      private
        FMediaTypeList: TOpenAPIDefinition.mediaTypeList;

        function GetMediaTypeListStored: Boolean;
      public
        property IsMediaTypeListStored: Boolean read GetMediaTypeListStored;
      published
        property mediaTypeList: TOpenAPIDefinition.mediaTypeList read FMediaTypeList write FMediaTypeList stored GetMediaTypeListStored;
      end;

      [Flat]
      ProducesProperty = class
      private
        FMediaTypeList: TOpenAPIDefinition.mediaTypeList;

        function GetMediaTypeListStored: Boolean;
      public
        property IsMediaTypeListStored: Boolean read GetMediaTypeListStored;
      published
        property mediaTypeList: TOpenAPIDefinition.mediaTypeList read FMediaTypeList write FMediaTypeList stored GetMediaTypeListStored;
      end;
    private
      FSwagger: TOpenAPIDefinition.TOpenAPIDefinition.SwaggerProperty;
      FInfo: TOpenAPIDefinition.info;
      FHost: System.String;
      FBasePath: System.String;
      FSchemes: TOpenAPIDefinition.schemesList;
      FConsumes: TOpenAPIDefinition.TOpenAPIDefinition.ConsumesProperty;
      FProduces: TOpenAPIDefinition.TOpenAPIDefinition.ProducesProperty;
      FPaths: TOpenAPIDefinition.paths;
      FDefinitions: TOpenAPIDefinition.definitions;
      FParameters: TOpenAPIDefinition.parameterDefinitions;
      FResponses: TOpenAPIDefinition.responseDefinitions;
      FSecurity: TOpenAPIDefinition.security;
      FSecurityDefinitions: TOpenAPIDefinition.securityDefinitions;
      FTags: TArray<TOpenAPIDefinition.tag>;
      FExternalDocs: TOpenAPIDefinition.externalDocs;
      FVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;

      function GetInfo: TOpenAPIDefinition.info;
      function GetConsumes: TOpenAPIDefinition.TOpenAPIDefinition.ConsumesProperty;
      function GetProduces: TOpenAPIDefinition.TOpenAPIDefinition.ProducesProperty;
      function GetPaths: TOpenAPIDefinition.paths;
      function GetDefinitions: TOpenAPIDefinition.definitions;
      function GetParameters: TOpenAPIDefinition.parameterDefinitions;
      function GetResponses: TOpenAPIDefinition.responseDefinitions;
      function GetSecurityDefinitions: TOpenAPIDefinition.securityDefinitions;
      function GetExternalDocs: TOpenAPIDefinition.externalDocs;
      function GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
      function GetHostStored: Boolean;
      function GetBasePathStored: Boolean;
      function GetSchemesStored: Boolean;
      function GetConsumesStored: Boolean;
      function GetProducesStored: Boolean;
      function GetDefinitionsStored: Boolean;
      function GetParametersStored: Boolean;
      function GetResponsesStored: Boolean;
      function GetSecurityStored: Boolean;
      function GetSecurityDefinitionsStored: Boolean;
      function GetTagsStored: Boolean;
      function GetExternalDocsStored: Boolean;
      function GetVendorExtensionStored: Boolean;
    public
      destructor Destroy; override;

      function AddSecurity: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.securityRequirement;
      function AddTags: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.tag;

      property IsHostStored: Boolean read GetHostStored;
      property IsBasePathStored: Boolean read GetBasePathStored;
      property IsSchemesStored: Boolean read GetSchemesStored;
      property IsConsumesStored: Boolean read GetConsumesStored;
      property IsProducesStored: Boolean read GetProducesStored;
      property IsDefinitionsStored: Boolean read GetDefinitionsStored;
      property IsParametersStored: Boolean read GetParametersStored;
      property IsResponsesStored: Boolean read GetResponsesStored;
      property IsSecurityStored: Boolean read GetSecurityStored;
      property IsSecurityDefinitionsStored: Boolean read GetSecurityDefinitionsStored;
      property IsTagsStored: Boolean read GetTagsStored;
      property IsExternalDocsStored: Boolean read GetExternalDocsStored;
      property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
    published
      property swagger: TOpenAPIDefinition.TOpenAPIDefinition.SwaggerProperty read FSwagger write FSwagger;
      property info: TOpenAPIDefinition.info read GetInfo write FInfo;
      property host: System.String read FHost write FHost stored GetHostStored;
      property basePath: System.String read FBasePath write FBasePath stored GetBasePathStored;
      property schemes: TOpenAPIDefinition.schemesList read FSchemes write FSchemes stored GetSchemesStored;
      property consumes: TOpenAPIDefinition.TOpenAPIDefinition.ConsumesProperty read GetConsumes write FConsumes stored GetConsumesStored;
      property produces: TOpenAPIDefinition.TOpenAPIDefinition.ProducesProperty read GetProduces write FProduces stored GetProducesStored;
      property paths: TOpenAPIDefinition.paths read GetPaths write FPaths;
      property definitions: TOpenAPIDefinition.definitions read GetDefinitions write FDefinitions stored GetDefinitionsStored;
      property parameters: TOpenAPIDefinition.parameterDefinitions read GetParameters write FParameters stored GetParametersStored;
      property responses: TOpenAPIDefinition.responseDefinitions read GetResponses write FResponses stored GetResponsesStored;
      property security: TOpenAPIDefinition.security read FSecurity write FSecurity stored GetSecurityStored;
      property securityDefinitions: TOpenAPIDefinition.securityDefinitions read GetSecurityDefinitions write FSecurityDefinitions stored GetSecurityDefinitionsStored;
      property tags: TArray<TOpenAPIDefinition.tag> read FTags write FTags stored GetTagsStored;
      property externalDocs: TOpenAPIDefinition.externalDocs read GetExternalDocs write FExternalDocs stored GetExternalDocsStored;
      [PatternProperty('^x-')]
      property vendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
    end;
  end;

implementation

uses System.SysUtils;

{ TOpenAPIDefinition.info }

destructor TOpenAPIDefinition.info.Destroy;
begin
  FContact.Free;

  FLicense.Free;

  FVendorExtension.Free;

  inherited;
end;

function TOpenAPIDefinition.info.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.info.GetTermsOfServiceStored: Boolean;
begin
  Result := not FTermsOfService.IsEmpty;
end;

function TOpenAPIDefinition.info.GetContact: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.contact;
begin
  if not Assigned(FContact) then
    FContact := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.contact.Create;

  Result := FContact;
end;

function TOpenAPIDefinition.info.GetContactStored: Boolean;
begin
  Result := Assigned(FContact);
end;

function TOpenAPIDefinition.info.GetLicense: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.license;
begin
  if not Assigned(FLicense) then
    FLicense := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.license.Create;

  Result := FLicense;
end;

function TOpenAPIDefinition.info.GetLicenseStored: Boolean;
begin
  Result := Assigned(FLicense);
end;

function TOpenAPIDefinition.info.GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.vendorExtension>.Create;

  Result := FVendorExtension;
end;

function TOpenAPIDefinition.info.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ TOpenAPIDefinition.contact }

destructor TOpenAPIDefinition.contact.Destroy;
begin
  FVendorExtension.Free;

  inherited;
end;

function TOpenAPIDefinition.contact.GetNameStored: Boolean;
begin
  Result := not FName.IsEmpty;
end;

function TOpenAPIDefinition.contact.GetUrlStored: Boolean;
begin
  Result := not FUrl.IsEmpty;
end;

function TOpenAPIDefinition.contact.GetEmailStored: Boolean;
begin
  Result := not FEmail.IsEmpty;
end;

function TOpenAPIDefinition.contact.GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.vendorExtension>.Create;

  Result := FVendorExtension;
end;

function TOpenAPIDefinition.contact.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ TOpenAPIDefinition.license }

destructor TOpenAPIDefinition.license.Destroy;
begin
  FVendorExtension.Free;

  inherited;
end;

function TOpenAPIDefinition.license.GetUrlStored: Boolean;
begin
  Result := not FUrl.IsEmpty;
end;

function TOpenAPIDefinition.license.GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.vendorExtension>.Create;

  Result := FVendorExtension;
end;

function TOpenAPIDefinition.license.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ TOpenAPIDefinition.paths }

destructor TOpenAPIDefinition.paths.Destroy;
begin
  FVendorExtension.Free;

  FPathItem.Free;

  inherited;
end;

function TOpenAPIDefinition.paths.GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.vendorExtension>.Create;

  Result := FVendorExtension;
end;

function TOpenAPIDefinition.paths.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

function TOpenAPIDefinition.paths.GetPathItem: TDynamicProperty<TOpenAPIDefinition.pathItem>;
begin
  if not Assigned(FPathItem) then
    FPathItem := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.pathItem>.Create;

  Result := FPathItem;
end;

function TOpenAPIDefinition.paths.GetPathItemStored: Boolean;
begin
  Result := Assigned(FPathItem);
end;

{ TOpenAPIDefinition.definitions }

destructor TOpenAPIDefinition.definitions.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.definitions.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.schema>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.schema>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.definitions.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.parameterDefinitions }

destructor TOpenAPIDefinition.parameterDefinitions.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.parameterDefinitions.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.parameter>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.parameter>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.parameterDefinitions.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.responseDefinitions }

destructor TOpenAPIDefinition.responseDefinitions.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.responseDefinitions.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.response>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.response>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.responseDefinitions.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.externalDocs }

destructor TOpenAPIDefinition.externalDocs.Destroy;
begin
  FVendorExtension.Free;

  inherited;
end;

function TOpenAPIDefinition.externalDocs.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.externalDocs.GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.vendorExtension>.Create;

  Result := FVendorExtension;
end;

function TOpenAPIDefinition.externalDocs.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ TOpenAPIDefinition.operation }

destructor TOpenAPIDefinition.operation.Destroy;
begin
  FExternalDocs.Free;

  FProduces.Free;

  FConsumes.Free;

  for var AObject in FParameters do
    AObject.Free;

  FResponses.Free;

  for var AObject in FSecurity do
    AObject.Free;

  FVendorExtension.Free;

  inherited;
end;

function TOpenAPIDefinition.operation.GetTagsStored: Boolean;
begin
  Result := Assigned(FTags);
end;

function TOpenAPIDefinition.operation.GetSummaryStored: Boolean;
begin
  Result := not FSummary.IsEmpty;
end;

function TOpenAPIDefinition.operation.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.operation.GetExternalDocs: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.externalDocs;
begin
  if not Assigned(FExternalDocs) then
    FExternalDocs := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.externalDocs.Create;

  Result := FExternalDocs;
end;

function TOpenAPIDefinition.operation.GetExternalDocsStored: Boolean;
begin
  Result := Assigned(FExternalDocs);
end;

function TOpenAPIDefinition.operation.GetOperationIdStored: Boolean;
begin
  Result := not FOperationId.IsEmpty;
end;

function TOpenAPIDefinition.operation.GetProduces: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.operation.ProducesProperty;
begin
  if not Assigned(FProduces) then
    FProduces := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.operation.ProducesProperty.Create;

  Result := FProduces;
end;

function TOpenAPIDefinition.operation.GetProducesStored: Boolean;
begin
  Result := Assigned(FProduces);
end;

function TOpenAPIDefinition.operation.GetConsumes: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.operation.ConsumesProperty;
begin
  if not Assigned(FConsumes) then
    FConsumes := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.operation.ConsumesProperty.Create;

  Result := FConsumes;
end;

function TOpenAPIDefinition.operation.GetConsumesStored: Boolean;
begin
  Result := Assigned(FConsumes);
end;

function TOpenAPIDefinition.operation.AddParameters: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.parametersListArrayItem;
begin
  Result := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.parametersListArrayItem.Create;

  FParameters := FParameters + [Result];
end;

function TOpenAPIDefinition.operation.GetParametersStored: Boolean;
begin
  Result := Assigned(FParameters);
end;

function TOpenAPIDefinition.operation.GetResponses: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.responses;
begin
  if not Assigned(FResponses) then
    FResponses := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.responses.Create;

  Result := FResponses;
end;

function TOpenAPIDefinition.operation.GetSchemesStored: Boolean;
begin
  Result := Assigned(FSchemes);
end;

function TOpenAPIDefinition.operation.GetDeprecatedStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.operation.AddSecurity: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.securityRequirement;
begin
  Result := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.securityRequirement.Create;

  FSecurity := FSecurity + [Result];
end;

function TOpenAPIDefinition.operation.GetSecurityStored: Boolean;
begin
  Result := Assigned(FSecurity);
end;

function TOpenAPIDefinition.operation.GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.vendorExtension>.Create;

  Result := FVendorExtension;
end;

function TOpenAPIDefinition.operation.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ TOpenAPIDefinition.operation.ProducesProperty }

function TOpenAPIDefinition.operation.ProducesProperty.GetMediaTypeListStored: Boolean;
begin
  Result := Assigned(FMediaTypeList);
end;

{ TOpenAPIDefinition.operation.ConsumesProperty }

function TOpenAPIDefinition.operation.ConsumesProperty.GetMediaTypeListStored: Boolean;
begin
  Result := Assigned(FMediaTypeList);
end;

{ TOpenAPIDefinition.pathItem }

destructor TOpenAPIDefinition.pathItem.Destroy;
begin
  FGet.Free;

  FPut.Free;

  FPost.Free;

  FDelete.Free;

  FOptions.Free;

  FHead.Free;

  FPatch.Free;

  for var AObject in FParameters do
    AObject.Free;

  FVendorExtension.Free;

  inherited;
end;

function TOpenAPIDefinition.pathItem.GetRefStored: Boolean;
begin
  Result := not FRef.IsEmpty;
end;

function TOpenAPIDefinition.pathItem.GetGet: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.operation;
begin
  if not Assigned(FGet) then
    FGet := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.operation.Create;

  Result := FGet;
end;

function TOpenAPIDefinition.pathItem.GetGetStored: Boolean;
begin
  Result := Assigned(FGet);
end;

function TOpenAPIDefinition.pathItem.GetPut: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.operation;
begin
  if not Assigned(FPut) then
    FPut := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.operation.Create;

  Result := FPut;
end;

function TOpenAPIDefinition.pathItem.GetPutStored: Boolean;
begin
  Result := Assigned(FPut);
end;

function TOpenAPIDefinition.pathItem.GetPost: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.operation;
begin
  if not Assigned(FPost) then
    FPost := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.operation.Create;

  Result := FPost;
end;

function TOpenAPIDefinition.pathItem.GetPostStored: Boolean;
begin
  Result := Assigned(FPost);
end;

function TOpenAPIDefinition.pathItem.GetDelete: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.operation;
begin
  if not Assigned(FDelete) then
    FDelete := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.operation.Create;

  Result := FDelete;
end;

function TOpenAPIDefinition.pathItem.GetDeleteStored: Boolean;
begin
  Result := Assigned(FDelete);
end;

function TOpenAPIDefinition.pathItem.GetOptions: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.operation;
begin
  if not Assigned(FOptions) then
    FOptions := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.operation.Create;

  Result := FOptions;
end;

function TOpenAPIDefinition.pathItem.GetOptionsStored: Boolean;
begin
  Result := Assigned(FOptions);
end;

function TOpenAPIDefinition.pathItem.GetHead: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.operation;
begin
  if not Assigned(FHead) then
    FHead := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.operation.Create;

  Result := FHead;
end;

function TOpenAPIDefinition.pathItem.GetHeadStored: Boolean;
begin
  Result := Assigned(FHead);
end;

function TOpenAPIDefinition.pathItem.GetPatch: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.operation;
begin
  if not Assigned(FPatch) then
    FPatch := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.operation.Create;

  Result := FPatch;
end;

function TOpenAPIDefinition.pathItem.GetPatchStored: Boolean;
begin
  Result := Assigned(FPatch);
end;

function TOpenAPIDefinition.pathItem.AddParameters: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.parametersListArrayItem;
begin
  Result := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.parametersListArrayItem.Create;

  FParameters := FParameters + [Result];
end;

function TOpenAPIDefinition.pathItem.GetParametersStored: Boolean;
begin
  Result := Assigned(FParameters);
end;

function TOpenAPIDefinition.pathItem.GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.vendorExtension>.Create;

  Result := FVendorExtension;
end;

function TOpenAPIDefinition.pathItem.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ TOpenAPIDefinition.responses }

destructor TOpenAPIDefinition.responses.Destroy;
begin
  FResponseValue.Free;

  FVendorExtension.Free;

  inherited;
end;

function TOpenAPIDefinition.responses.GetResponseValue: TDynamicProperty<TOpenAPIDefinition.responseValue>;
begin
  if not Assigned(FResponseValue) then
    FResponseValue := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.responseValue>.Create;

  Result := FResponseValue;
end;

function TOpenAPIDefinition.responses.GetResponseValueStored: Boolean;
begin
  Result := Assigned(FResponseValue);
end;

function TOpenAPIDefinition.responses.GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.vendorExtension>.Create;

  Result := FVendorExtension;
end;

function TOpenAPIDefinition.responses.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ TOpenAPIDefinition.responseValue }

destructor TOpenAPIDefinition.responseValue.Destroy;
begin
  FResponse.Free;

  FJsonReference.Free;

  inherited;
end;

function TOpenAPIDefinition.responseValue.GetResponse: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.response;
begin
  if not Assigned(FResponse) then
    FResponse := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.response.Create;

  Result := FResponse;
end;

function TOpenAPIDefinition.responseValue.GetResponseStored: Boolean;
begin
  Result := Assigned(FResponse);
end;

function TOpenAPIDefinition.responseValue.GetJsonReference: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.jsonReference;
begin
  if not Assigned(FJsonReference) then
    FJsonReference := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.jsonReference.Create;

  Result := FJsonReference;
end;

function TOpenAPIDefinition.responseValue.GetJsonReferenceStored: Boolean;
begin
  Result := Assigned(FJsonReference);
end;

{ TOpenAPIDefinition.response }

destructor TOpenAPIDefinition.response.Destroy;
begin
  FSchema.Free;

  FHeaders.Free;

  FExamples.Free;

  FVendorExtension.Free;

  inherited;
end;

function TOpenAPIDefinition.response.GetSchema: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.response.SchemaProperty;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.response.SchemaProperty.Create;

  Result := FSchema;
end;

function TOpenAPIDefinition.response.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function TOpenAPIDefinition.response.GetHeaders: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.headers;
begin
  if not Assigned(FHeaders) then
    FHeaders := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.headers.Create;

  Result := FHeaders;
end;

function TOpenAPIDefinition.response.GetHeadersStored: Boolean;
begin
  Result := Assigned(FHeaders);
end;

function TOpenAPIDefinition.response.GetExamples: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.examples;
begin
  if not Assigned(FExamples) then
    FExamples := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.examples.Create;

  Result := FExamples;
end;

function TOpenAPIDefinition.response.GetExamplesStored: Boolean;
begin
  Result := Assigned(FExamples);
end;

function TOpenAPIDefinition.response.GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.vendorExtension>.Create;

  Result := FVendorExtension;
end;

function TOpenAPIDefinition.response.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ TOpenAPIDefinition.response.SchemaProperty }

destructor TOpenAPIDefinition.response.SchemaProperty.Destroy;
begin
  FSchema.Free;

  FFileSchema.Free;

  inherited;
end;

function TOpenAPIDefinition.response.SchemaProperty.GetSchema: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.schema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.schema.Create;

  Result := FSchema;
end;

function TOpenAPIDefinition.response.SchemaProperty.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function TOpenAPIDefinition.response.SchemaProperty.GetFileSchema: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.fileSchema;
begin
  if not Assigned(FFileSchema) then
    FFileSchema := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.fileSchema.Create;

  Result := FFileSchema;
end;

function TOpenAPIDefinition.response.SchemaProperty.GetFileSchemaStored: Boolean;
begin
  Result := Assigned(FFileSchema);
end;

{ TOpenAPIDefinition.headers }

destructor TOpenAPIDefinition.headers.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.headers.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.header>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.header>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.headers.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.header }

destructor TOpenAPIDefinition.header.Destroy;
begin
  FItems.Free;

  FMinLength.Free;

  FMinItems.Free;

  FVendorExtension.Free;

  inherited;
end;

function TOpenAPIDefinition.header.GetFormatStored: Boolean;
begin
  Result := not FFormat.IsEmpty;
end;

function TOpenAPIDefinition.header.GetItems: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.primitivesItems;
begin
  if not Assigned(FItems) then
    FItems := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.primitivesItems.Create;

  Result := FItems;
end;

function TOpenAPIDefinition.header.GetItemsStored: Boolean;
begin
  Result := Assigned(FItems);
end;

procedure TOpenAPIDefinition.header.SetCollectionFormat(const Value: TOpenAPIDefinition.collectionFormat);
begin
  FCollectionFormat := Value;
  FCollectionFormatIsStored := True;
end;

function TOpenAPIDefinition.header.GetDefaultStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.header.GetMaximumStored: Boolean;
begin
  Result := FMaximum <> 0;
end;

function TOpenAPIDefinition.header.GetExclusiveMaximumStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.header.GetMinimumStored: Boolean;
begin
  Result := FMinimum <> 0;
end;

function TOpenAPIDefinition.header.GetExclusiveMinimumStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.header.GetMaxLengthStored: Boolean;
begin
  Result := FMaxLength <> 0;
end;

function TOpenAPIDefinition.header.GetMinLength: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0;
begin
  if not Assigned(FMinLength) then
    FMinLength := Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0.Create;

  Result := FMinLength;
end;

function TOpenAPIDefinition.header.GetMinLengthStored: Boolean;
begin
  Result := Assigned(FMinLength);
end;

function TOpenAPIDefinition.header.GetPatternStored: Boolean;
begin
  Result := not FPattern.IsEmpty;
end;

function TOpenAPIDefinition.header.GetMaxItemsStored: Boolean;
begin
  Result := FMaxItems <> 0;
end;

function TOpenAPIDefinition.header.GetMinItems: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0;
begin
  if not Assigned(FMinItems) then
    FMinItems := Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0.Create;

  Result := FMinItems;
end;

function TOpenAPIDefinition.header.GetMinItemsStored: Boolean;
begin
  Result := Assigned(FMinItems);
end;

function TOpenAPIDefinition.header.GetUniqueItemsStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.header.GetEnumStored: Boolean;
begin
  Result := Assigned(FEnum);
end;

function TOpenAPIDefinition.header.GetMultipleOfStored: Boolean;
begin
  Result := FMultipleOf <> 0;
end;

function TOpenAPIDefinition.header.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.header.GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.vendorExtension>.Create;

  Result := FVendorExtension;
end;

function TOpenAPIDefinition.header.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ TOpenAPIDefinition.bodyParameter }

destructor TOpenAPIDefinition.bodyParameter.Destroy;
begin
  FSchema.Free;

  FVendorExtension.Free;

  inherited;
end;

function TOpenAPIDefinition.bodyParameter.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.bodyParameter.GetRequiredStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.bodyParameter.GetSchema: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.schema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.schema.Create;

  Result := FSchema;
end;

function TOpenAPIDefinition.bodyParameter.GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.vendorExtension>.Create;

  Result := FVendorExtension;
end;

function TOpenAPIDefinition.bodyParameter.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ TOpenAPIDefinition.headerParameterSubSchema }

destructor TOpenAPIDefinition.headerParameterSubSchema.Destroy;
begin
  FItems.Free;

  FMinLength.Free;

  FMinItems.Free;

  FVendorExtension.Free;

  inherited;
end;

function TOpenAPIDefinition.headerParameterSubSchema.GetRequiredStored: Boolean;
begin
  Result := False;
end;

procedure TOpenAPIDefinition.headerParameterSubSchema.SetIn(const Value: TOpenAPIDefinition.headerParameterSubSchema.InProperty);
begin
  FIn := Value;
  FInIsStored := True;
end;

function TOpenAPIDefinition.headerParameterSubSchema.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.headerParameterSubSchema.GetNameStored: Boolean;
begin
  Result := not FName.IsEmpty;
end;

procedure TOpenAPIDefinition.headerParameterSubSchema.SetType(const Value: TOpenAPIDefinition.headerParameterSubSchema.TypeProperty);
begin
  FType := Value;
  FTypeIsStored := True;
end;

function TOpenAPIDefinition.headerParameterSubSchema.GetFormatStored: Boolean;
begin
  Result := not FFormat.IsEmpty;
end;

function TOpenAPIDefinition.headerParameterSubSchema.GetItems: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.primitivesItems;
begin
  if not Assigned(FItems) then
    FItems := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.primitivesItems.Create;

  Result := FItems;
end;

function TOpenAPIDefinition.headerParameterSubSchema.GetItemsStored: Boolean;
begin
  Result := Assigned(FItems);
end;

procedure TOpenAPIDefinition.headerParameterSubSchema.SetCollectionFormat(const Value: TOpenAPIDefinition.collectionFormat);
begin
  FCollectionFormat := Value;
  FCollectionFormatIsStored := True;
end;

function TOpenAPIDefinition.headerParameterSubSchema.GetDefaultStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.headerParameterSubSchema.GetMaximumStored: Boolean;
begin
  Result := FMaximum <> 0;
end;

function TOpenAPIDefinition.headerParameterSubSchema.GetExclusiveMaximumStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.headerParameterSubSchema.GetMinimumStored: Boolean;
begin
  Result := FMinimum <> 0;
end;

function TOpenAPIDefinition.headerParameterSubSchema.GetExclusiveMinimumStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.headerParameterSubSchema.GetMaxLengthStored: Boolean;
begin
  Result := FMaxLength <> 0;
end;

function TOpenAPIDefinition.headerParameterSubSchema.GetMinLength: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0;
begin
  if not Assigned(FMinLength) then
    FMinLength := Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0.Create;

  Result := FMinLength;
end;

function TOpenAPIDefinition.headerParameterSubSchema.GetMinLengthStored: Boolean;
begin
  Result := Assigned(FMinLength);
end;

function TOpenAPIDefinition.headerParameterSubSchema.GetPatternStored: Boolean;
begin
  Result := not FPattern.IsEmpty;
end;

function TOpenAPIDefinition.headerParameterSubSchema.GetMaxItemsStored: Boolean;
begin
  Result := FMaxItems <> 0;
end;

function TOpenAPIDefinition.headerParameterSubSchema.GetMinItems: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0;
begin
  if not Assigned(FMinItems) then
    FMinItems := Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0.Create;

  Result := FMinItems;
end;

function TOpenAPIDefinition.headerParameterSubSchema.GetMinItemsStored: Boolean;
begin
  Result := Assigned(FMinItems);
end;

function TOpenAPIDefinition.headerParameterSubSchema.GetUniqueItemsStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.headerParameterSubSchema.GetEnumStored: Boolean;
begin
  Result := Assigned(FEnum);
end;

function TOpenAPIDefinition.headerParameterSubSchema.GetMultipleOfStored: Boolean;
begin
  Result := FMultipleOf <> 0;
end;

function TOpenAPIDefinition.headerParameterSubSchema.GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.vendorExtension>.Create;

  Result := FVendorExtension;
end;

function TOpenAPIDefinition.headerParameterSubSchema.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ TOpenAPIDefinition.queryParameterSubSchema }

destructor TOpenAPIDefinition.queryParameterSubSchema.Destroy;
begin
  FItems.Free;

  FMinLength.Free;

  FMinItems.Free;

  FVendorExtension.Free;

  inherited;
end;

function TOpenAPIDefinition.queryParameterSubSchema.GetRequiredStored: Boolean;
begin
  Result := False;
end;

procedure TOpenAPIDefinition.queryParameterSubSchema.SetIn(const Value: TOpenAPIDefinition.queryParameterSubSchema.InProperty);
begin
  FIn := Value;
  FInIsStored := True;
end;

function TOpenAPIDefinition.queryParameterSubSchema.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.queryParameterSubSchema.GetNameStored: Boolean;
begin
  Result := not FName.IsEmpty;
end;

function TOpenAPIDefinition.queryParameterSubSchema.GetAllowEmptyValueStored: Boolean;
begin
  Result := False;
end;

procedure TOpenAPIDefinition.queryParameterSubSchema.SetType(const Value: TOpenAPIDefinition.queryParameterSubSchema.TypeProperty);
begin
  FType := Value;
  FTypeIsStored := True;
end;

function TOpenAPIDefinition.queryParameterSubSchema.GetFormatStored: Boolean;
begin
  Result := not FFormat.IsEmpty;
end;

function TOpenAPIDefinition.queryParameterSubSchema.GetItems: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.primitivesItems;
begin
  if not Assigned(FItems) then
    FItems := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.primitivesItems.Create;

  Result := FItems;
end;

function TOpenAPIDefinition.queryParameterSubSchema.GetItemsStored: Boolean;
begin
  Result := Assigned(FItems);
end;

procedure TOpenAPIDefinition.queryParameterSubSchema.SetCollectionFormat(const Value: TOpenAPIDefinition.collectionFormatWithMulti);
begin
  FCollectionFormat := Value;
  FCollectionFormatIsStored := True;
end;

function TOpenAPIDefinition.queryParameterSubSchema.GetDefaultStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.queryParameterSubSchema.GetMaximumStored: Boolean;
begin
  Result := FMaximum <> 0;
end;

function TOpenAPIDefinition.queryParameterSubSchema.GetExclusiveMaximumStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.queryParameterSubSchema.GetMinimumStored: Boolean;
begin
  Result := FMinimum <> 0;
end;

function TOpenAPIDefinition.queryParameterSubSchema.GetExclusiveMinimumStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.queryParameterSubSchema.GetMaxLengthStored: Boolean;
begin
  Result := FMaxLength <> 0;
end;

function TOpenAPIDefinition.queryParameterSubSchema.GetMinLength: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0;
begin
  if not Assigned(FMinLength) then
    FMinLength := Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0.Create;

  Result := FMinLength;
end;

function TOpenAPIDefinition.queryParameterSubSchema.GetMinLengthStored: Boolean;
begin
  Result := Assigned(FMinLength);
end;

function TOpenAPIDefinition.queryParameterSubSchema.GetPatternStored: Boolean;
begin
  Result := not FPattern.IsEmpty;
end;

function TOpenAPIDefinition.queryParameterSubSchema.GetMaxItemsStored: Boolean;
begin
  Result := FMaxItems <> 0;
end;

function TOpenAPIDefinition.queryParameterSubSchema.GetMinItems: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0;
begin
  if not Assigned(FMinItems) then
    FMinItems := Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0.Create;

  Result := FMinItems;
end;

function TOpenAPIDefinition.queryParameterSubSchema.GetMinItemsStored: Boolean;
begin
  Result := Assigned(FMinItems);
end;

function TOpenAPIDefinition.queryParameterSubSchema.GetUniqueItemsStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.queryParameterSubSchema.GetEnumStored: Boolean;
begin
  Result := Assigned(FEnum);
end;

function TOpenAPIDefinition.queryParameterSubSchema.GetMultipleOfStored: Boolean;
begin
  Result := FMultipleOf <> 0;
end;

function TOpenAPIDefinition.queryParameterSubSchema.GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.vendorExtension>.Create;

  Result := FVendorExtension;
end;

function TOpenAPIDefinition.queryParameterSubSchema.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ TOpenAPIDefinition.formDataParameterSubSchema }

destructor TOpenAPIDefinition.formDataParameterSubSchema.Destroy;
begin
  FItems.Free;

  FMinLength.Free;

  FMinItems.Free;

  FVendorExtension.Free;

  inherited;
end;

function TOpenAPIDefinition.formDataParameterSubSchema.GetRequiredStored: Boolean;
begin
  Result := False;
end;

procedure TOpenAPIDefinition.formDataParameterSubSchema.SetIn(const Value: TOpenAPIDefinition.formDataParameterSubSchema.InProperty);
begin
  FIn := Value;
  FInIsStored := True;
end;

function TOpenAPIDefinition.formDataParameterSubSchema.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.formDataParameterSubSchema.GetNameStored: Boolean;
begin
  Result := not FName.IsEmpty;
end;

function TOpenAPIDefinition.formDataParameterSubSchema.GetAllowEmptyValueStored: Boolean;
begin
  Result := False;
end;

procedure TOpenAPIDefinition.formDataParameterSubSchema.SetType(const Value: TOpenAPIDefinition.formDataParameterSubSchema.TypeProperty);
begin
  FType := Value;
  FTypeIsStored := True;
end;

function TOpenAPIDefinition.formDataParameterSubSchema.GetFormatStored: Boolean;
begin
  Result := not FFormat.IsEmpty;
end;

function TOpenAPIDefinition.formDataParameterSubSchema.GetItems: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.primitivesItems;
begin
  if not Assigned(FItems) then
    FItems := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.primitivesItems.Create;

  Result := FItems;
end;

function TOpenAPIDefinition.formDataParameterSubSchema.GetItemsStored: Boolean;
begin
  Result := Assigned(FItems);
end;

procedure TOpenAPIDefinition.formDataParameterSubSchema.SetCollectionFormat(const Value: TOpenAPIDefinition.collectionFormatWithMulti);
begin
  FCollectionFormat := Value;
  FCollectionFormatIsStored := True;
end;

function TOpenAPIDefinition.formDataParameterSubSchema.GetDefaultStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.formDataParameterSubSchema.GetMaximumStored: Boolean;
begin
  Result := FMaximum <> 0;
end;

function TOpenAPIDefinition.formDataParameterSubSchema.GetExclusiveMaximumStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.formDataParameterSubSchema.GetMinimumStored: Boolean;
begin
  Result := FMinimum <> 0;
end;

function TOpenAPIDefinition.formDataParameterSubSchema.GetExclusiveMinimumStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.formDataParameterSubSchema.GetMaxLengthStored: Boolean;
begin
  Result := FMaxLength <> 0;
end;

function TOpenAPIDefinition.formDataParameterSubSchema.GetMinLength: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0;
begin
  if not Assigned(FMinLength) then
    FMinLength := Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0.Create;

  Result := FMinLength;
end;

function TOpenAPIDefinition.formDataParameterSubSchema.GetMinLengthStored: Boolean;
begin
  Result := Assigned(FMinLength);
end;

function TOpenAPIDefinition.formDataParameterSubSchema.GetPatternStored: Boolean;
begin
  Result := not FPattern.IsEmpty;
end;

function TOpenAPIDefinition.formDataParameterSubSchema.GetMaxItemsStored: Boolean;
begin
  Result := FMaxItems <> 0;
end;

function TOpenAPIDefinition.formDataParameterSubSchema.GetMinItems: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0;
begin
  if not Assigned(FMinItems) then
    FMinItems := Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0.Create;

  Result := FMinItems;
end;

function TOpenAPIDefinition.formDataParameterSubSchema.GetMinItemsStored: Boolean;
begin
  Result := Assigned(FMinItems);
end;

function TOpenAPIDefinition.formDataParameterSubSchema.GetUniqueItemsStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.formDataParameterSubSchema.GetEnumStored: Boolean;
begin
  Result := Assigned(FEnum);
end;

function TOpenAPIDefinition.formDataParameterSubSchema.GetMultipleOfStored: Boolean;
begin
  Result := FMultipleOf <> 0;
end;

function TOpenAPIDefinition.formDataParameterSubSchema.GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.vendorExtension>.Create;

  Result := FVendorExtension;
end;

function TOpenAPIDefinition.formDataParameterSubSchema.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ TOpenAPIDefinition.pathParameterSubSchema }

destructor TOpenAPIDefinition.pathParameterSubSchema.Destroy;
begin
  FItems.Free;

  FMinLength.Free;

  FMinItems.Free;

  FVendorExtension.Free;

  inherited;
end;

procedure TOpenAPIDefinition.pathParameterSubSchema.SetIn(const Value: TOpenAPIDefinition.pathParameterSubSchema.InProperty);
begin
  FIn := Value;
  FInIsStored := True;
end;

function TOpenAPIDefinition.pathParameterSubSchema.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.pathParameterSubSchema.GetNameStored: Boolean;
begin
  Result := not FName.IsEmpty;
end;

procedure TOpenAPIDefinition.pathParameterSubSchema.SetType(const Value: TOpenAPIDefinition.pathParameterSubSchema.TypeProperty);
begin
  FType := Value;
  FTypeIsStored := True;
end;

function TOpenAPIDefinition.pathParameterSubSchema.GetFormatStored: Boolean;
begin
  Result := not FFormat.IsEmpty;
end;

function TOpenAPIDefinition.pathParameterSubSchema.GetItems: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.primitivesItems;
begin
  if not Assigned(FItems) then
    FItems := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.primitivesItems.Create;

  Result := FItems;
end;

function TOpenAPIDefinition.pathParameterSubSchema.GetItemsStored: Boolean;
begin
  Result := Assigned(FItems);
end;

procedure TOpenAPIDefinition.pathParameterSubSchema.SetCollectionFormat(const Value: TOpenAPIDefinition.collectionFormat);
begin
  FCollectionFormat := Value;
  FCollectionFormatIsStored := True;
end;

function TOpenAPIDefinition.pathParameterSubSchema.GetDefaultStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.pathParameterSubSchema.GetMaximumStored: Boolean;
begin
  Result := FMaximum <> 0;
end;

function TOpenAPIDefinition.pathParameterSubSchema.GetExclusiveMaximumStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.pathParameterSubSchema.GetMinimumStored: Boolean;
begin
  Result := FMinimum <> 0;
end;

function TOpenAPIDefinition.pathParameterSubSchema.GetExclusiveMinimumStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.pathParameterSubSchema.GetMaxLengthStored: Boolean;
begin
  Result := FMaxLength <> 0;
end;

function TOpenAPIDefinition.pathParameterSubSchema.GetMinLength: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0;
begin
  if not Assigned(FMinLength) then
    FMinLength := Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0.Create;

  Result := FMinLength;
end;

function TOpenAPIDefinition.pathParameterSubSchema.GetMinLengthStored: Boolean;
begin
  Result := Assigned(FMinLength);
end;

function TOpenAPIDefinition.pathParameterSubSchema.GetPatternStored: Boolean;
begin
  Result := not FPattern.IsEmpty;
end;

function TOpenAPIDefinition.pathParameterSubSchema.GetMaxItemsStored: Boolean;
begin
  Result := FMaxItems <> 0;
end;

function TOpenAPIDefinition.pathParameterSubSchema.GetMinItems: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0;
begin
  if not Assigned(FMinItems) then
    FMinItems := Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0.Create;

  Result := FMinItems;
end;

function TOpenAPIDefinition.pathParameterSubSchema.GetMinItemsStored: Boolean;
begin
  Result := Assigned(FMinItems);
end;

function TOpenAPIDefinition.pathParameterSubSchema.GetUniqueItemsStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.pathParameterSubSchema.GetEnumStored: Boolean;
begin
  Result := Assigned(FEnum);
end;

function TOpenAPIDefinition.pathParameterSubSchema.GetMultipleOfStored: Boolean;
begin
  Result := FMultipleOf <> 0;
end;

function TOpenAPIDefinition.pathParameterSubSchema.GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.vendorExtension>.Create;

  Result := FVendorExtension;
end;

function TOpenAPIDefinition.pathParameterSubSchema.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ TOpenAPIDefinition.nonBodyParameter }

destructor TOpenAPIDefinition.nonBodyParameter.Destroy;
begin
  FHeaderParameterSubSchema.Free;

  FFormDataParameterSubSchema.Free;

  FQueryParameterSubSchema.Free;

  FPathParameterSubSchema.Free;

  inherited;
end;

function TOpenAPIDefinition.nonBodyParameter.GetHeaderParameterSubSchema: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.headerParameterSubSchema;
begin
  if not Assigned(FHeaderParameterSubSchema) then
    FHeaderParameterSubSchema := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.headerParameterSubSchema.Create;

  Result := FHeaderParameterSubSchema;
end;

function TOpenAPIDefinition.nonBodyParameter.GetHeaderParameterSubSchemaStored: Boolean;
begin
  Result := Assigned(FHeaderParameterSubSchema);
end;

function TOpenAPIDefinition.nonBodyParameter.GetFormDataParameterSubSchema: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.formDataParameterSubSchema;
begin
  if not Assigned(FFormDataParameterSubSchema) then
    FFormDataParameterSubSchema := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.formDataParameterSubSchema.Create;

  Result := FFormDataParameterSubSchema;
end;

function TOpenAPIDefinition.nonBodyParameter.GetFormDataParameterSubSchemaStored: Boolean;
begin
  Result := Assigned(FFormDataParameterSubSchema);
end;

function TOpenAPIDefinition.nonBodyParameter.GetQueryParameterSubSchema: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.queryParameterSubSchema;
begin
  if not Assigned(FQueryParameterSubSchema) then
    FQueryParameterSubSchema := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.queryParameterSubSchema.Create;

  Result := FQueryParameterSubSchema;
end;

function TOpenAPIDefinition.nonBodyParameter.GetQueryParameterSubSchemaStored: Boolean;
begin
  Result := Assigned(FQueryParameterSubSchema);
end;

function TOpenAPIDefinition.nonBodyParameter.GetPathParameterSubSchema: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.pathParameterSubSchema;
begin
  if not Assigned(FPathParameterSubSchema) then
    FPathParameterSubSchema := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.pathParameterSubSchema.Create;

  Result := FPathParameterSubSchema;
end;

function TOpenAPIDefinition.nonBodyParameter.GetPathParameterSubSchemaStored: Boolean;
begin
  Result := Assigned(FPathParameterSubSchema);
end;

{ TOpenAPIDefinition.parameter }

destructor TOpenAPIDefinition.parameter.Destroy;
begin
  FBodyParameter.Free;

  FNonBodyParameter.Free;

  inherited;
end;

function TOpenAPIDefinition.parameter.GetBodyParameter: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.bodyParameter;
begin
  if not Assigned(FBodyParameter) then
    FBodyParameter := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.bodyParameter.Create;

  Result := FBodyParameter;
end;

function TOpenAPIDefinition.parameter.GetBodyParameterStored: Boolean;
begin
  Result := Assigned(FBodyParameter);
end;

function TOpenAPIDefinition.parameter.GetNonBodyParameter: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.nonBodyParameter;
begin
  if not Assigned(FNonBodyParameter) then
    FNonBodyParameter := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.nonBodyParameter.Create;

  Result := FNonBodyParameter;
end;

function TOpenAPIDefinition.parameter.GetNonBodyParameterStored: Boolean;
begin
  Result := Assigned(FNonBodyParameter);
end;

{ TOpenAPIDefinition.schema }

destructor TOpenAPIDefinition.schema.Destroy;
begin
  FMinLength.Free;

  FMinItems.Free;

  FMinProperties.Free;

  FAdditionalProperties.Free;

  FType.Free;

  FItems.Free;

  for var AObject in FAllOf do
    AObject.Free;

  FProperties.Free;

  FXml.Free;

  FExternalDocs.Free;

  FVendorExtension.Free;

  inherited;
end;

function TOpenAPIDefinition.schema.GetRefStored: Boolean;
begin
  Result := not FRef.IsEmpty;
end;

function TOpenAPIDefinition.schema.GetFormatStored: Boolean;
begin
  Result := not FFormat.IsEmpty;
end;

function TOpenAPIDefinition.schema.GetTitleStored: Boolean;
begin
  Result := not FTitle.IsEmpty;
end;

function TOpenAPIDefinition.schema.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.schema.GetDefaultStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.schema.GetMultipleOfStored: Boolean;
begin
  Result := FMultipleOf <> 0;
end;

function TOpenAPIDefinition.schema.GetMaximumStored: Boolean;
begin
  Result := FMaximum <> 0;
end;

function TOpenAPIDefinition.schema.GetExclusiveMaximumStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.schema.GetMinimumStored: Boolean;
begin
  Result := FMinimum <> 0;
end;

function TOpenAPIDefinition.schema.GetExclusiveMinimumStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.schema.GetMaxLengthStored: Boolean;
begin
  Result := FMaxLength <> 0;
end;

function TOpenAPIDefinition.schema.GetMinLength: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0;
begin
  if not Assigned(FMinLength) then
    FMinLength := Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0.Create;

  Result := FMinLength;
end;

function TOpenAPIDefinition.schema.GetMinLengthStored: Boolean;
begin
  Result := Assigned(FMinLength);
end;

function TOpenAPIDefinition.schema.GetPatternStored: Boolean;
begin
  Result := not FPattern.IsEmpty;
end;

function TOpenAPIDefinition.schema.GetMaxItemsStored: Boolean;
begin
  Result := FMaxItems <> 0;
end;

function TOpenAPIDefinition.schema.GetMinItems: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0;
begin
  if not Assigned(FMinItems) then
    FMinItems := Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0.Create;

  Result := FMinItems;
end;

function TOpenAPIDefinition.schema.GetMinItemsStored: Boolean;
begin
  Result := Assigned(FMinItems);
end;

function TOpenAPIDefinition.schema.GetUniqueItemsStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.schema.GetMaxPropertiesStored: Boolean;
begin
  Result := FMaxProperties <> 0;
end;

function TOpenAPIDefinition.schema.GetMinProperties: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0;
begin
  if not Assigned(FMinProperties) then
    FMinProperties := Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0.Create;

  Result := FMinProperties;
end;

function TOpenAPIDefinition.schema.GetMinPropertiesStored: Boolean;
begin
  Result := Assigned(FMinProperties);
end;

function TOpenAPIDefinition.schema.GetRequiredStored: Boolean;
begin
  Result := Assigned(FRequired);
end;

function TOpenAPIDefinition.schema.GetEnumStored: Boolean;
begin
  Result := Assigned(FEnum);
end;

function TOpenAPIDefinition.schema.GetAdditionalProperties: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.schema.AdditionalPropertiesProperty;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.schema.AdditionalPropertiesProperty.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.schema.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

function TOpenAPIDefinition.schema.GetType: Blue.Print.JSON.Draft4.Schema.Schema.Schema.TypeProperty;
begin
  if not Assigned(FType) then
    FType := Blue.Print.JSON.Draft4.Schema.Schema.Schema.TypeProperty.Create;

  Result := FType;
end;

function TOpenAPIDefinition.schema.GetTypeStored: Boolean;
begin
  Result := Assigned(FType);
end;

function TOpenAPIDefinition.schema.GetItems: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.schema.ItemsProperty;
begin
  if not Assigned(FItems) then
    FItems := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.schema.ItemsProperty.Create;

  Result := FItems;
end;

function TOpenAPIDefinition.schema.GetItemsStored: Boolean;
begin
  Result := Assigned(FItems);
end;

function TOpenAPIDefinition.schema.AddAllOf: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.schema;
begin
  Result := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.schema.Create;

  FAllOf := FAllOf + [Result];
end;

function TOpenAPIDefinition.schema.GetAllOfStored: Boolean;
begin
  Result := Assigned(FAllOf);
end;

function TOpenAPIDefinition.schema.GetProperties: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.schema.PropertiesProperty;
begin
  if not Assigned(FProperties) then
    FProperties := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.schema.PropertiesProperty.Create;

  Result := FProperties;
end;

function TOpenAPIDefinition.schema.GetPropertiesStored: Boolean;
begin
  Result := Assigned(FProperties);
end;

function TOpenAPIDefinition.schema.GetDiscriminatorStored: Boolean;
begin
  Result := not FDiscriminator.IsEmpty;
end;

function TOpenAPIDefinition.schema.GetReadOnlyStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.schema.GetXml: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.xml;
begin
  if not Assigned(FXml) then
    FXml := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.xml.Create;

  Result := FXml;
end;

function TOpenAPIDefinition.schema.GetXmlStored: Boolean;
begin
  Result := Assigned(FXml);
end;

function TOpenAPIDefinition.schema.GetExternalDocs: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.externalDocs;
begin
  if not Assigned(FExternalDocs) then
    FExternalDocs := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.externalDocs.Create;

  Result := FExternalDocs;
end;

function TOpenAPIDefinition.schema.GetExternalDocsStored: Boolean;
begin
  Result := Assigned(FExternalDocs);
end;

function TOpenAPIDefinition.schema.GetExampleStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.schema.GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.vendorExtension>.Create;

  Result := FVendorExtension;
end;

function TOpenAPIDefinition.schema.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ TOpenAPIDefinition.schema.AdditionalPropertiesProperty }

destructor TOpenAPIDefinition.schema.AdditionalPropertiesProperty.Destroy;
begin
  FSchema.Free;

  inherited;
end;

function TOpenAPIDefinition.schema.AdditionalPropertiesProperty.GetSchema: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.schema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.schema.Create;

  Result := FSchema;
end;

function TOpenAPIDefinition.schema.AdditionalPropertiesProperty.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function TOpenAPIDefinition.schema.AdditionalPropertiesProperty.GetBooleanStored: Boolean;
begin
  Result := False;
end;

{ TOpenAPIDefinition.schema.ItemsProperty }

destructor TOpenAPIDefinition.schema.ItemsProperty.Destroy;
begin
  FSchema.Free;

  for var AObject in FArray do
    AObject.Free;

  inherited;
end;

function TOpenAPIDefinition.schema.ItemsProperty.GetSchema: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.schema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.schema.Create;

  Result := FSchema;
end;

function TOpenAPIDefinition.schema.ItemsProperty.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function TOpenAPIDefinition.schema.ItemsProperty.AddArray: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.schema;
begin
  Result := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.schema.Create;

  FArray := FArray + [Result];
end;

function TOpenAPIDefinition.schema.ItemsProperty.GetArrayStored: Boolean;
begin
  Result := Assigned(FArray);
end;

{ TOpenAPIDefinition.schema.PropertiesProperty }

destructor TOpenAPIDefinition.schema.PropertiesProperty.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.schema.PropertiesProperty.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.schema>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.schema>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.schema.PropertiesProperty.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.fileSchema }

destructor TOpenAPIDefinition.fileSchema.Destroy;
begin
  FExternalDocs.Free;

  FVendorExtension.Free;

  inherited;
end;

function TOpenAPIDefinition.fileSchema.GetFormatStored: Boolean;
begin
  Result := not FFormat.IsEmpty;
end;

function TOpenAPIDefinition.fileSchema.GetTitleStored: Boolean;
begin
  Result := not FTitle.IsEmpty;
end;

function TOpenAPIDefinition.fileSchema.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.fileSchema.GetDefaultStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.fileSchema.GetRequiredStored: Boolean;
begin
  Result := Assigned(FRequired);
end;

function TOpenAPIDefinition.fileSchema.GetReadOnlyStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.fileSchema.GetExternalDocs: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.externalDocs;
begin
  if not Assigned(FExternalDocs) then
    FExternalDocs := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.externalDocs.Create;

  Result := FExternalDocs;
end;

function TOpenAPIDefinition.fileSchema.GetExternalDocsStored: Boolean;
begin
  Result := Assigned(FExternalDocs);
end;

function TOpenAPIDefinition.fileSchema.GetExampleStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.fileSchema.GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.vendorExtension>.Create;

  Result := FVendorExtension;
end;

function TOpenAPIDefinition.fileSchema.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ TOpenAPIDefinition.primitivesItems }

destructor TOpenAPIDefinition.primitivesItems.Destroy;
begin
  FItems.Free;

  FMinLength.Free;

  FMinItems.Free;

  FVendorExtension.Free;

  inherited;
end;

procedure TOpenAPIDefinition.primitivesItems.SetType(const Value: TOpenAPIDefinition.primitivesItems.TypeProperty);
begin
  FType := Value;
  FTypeIsStored := True;
end;

function TOpenAPIDefinition.primitivesItems.GetFormatStored: Boolean;
begin
  Result := not FFormat.IsEmpty;
end;

function TOpenAPIDefinition.primitivesItems.GetItems: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.primitivesItems;
begin
  if not Assigned(FItems) then
    FItems := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.primitivesItems.Create;

  Result := FItems;
end;

function TOpenAPIDefinition.primitivesItems.GetItemsStored: Boolean;
begin
  Result := Assigned(FItems);
end;

procedure TOpenAPIDefinition.primitivesItems.SetCollectionFormat(const Value: TOpenAPIDefinition.collectionFormat);
begin
  FCollectionFormat := Value;
  FCollectionFormatIsStored := True;
end;

function TOpenAPIDefinition.primitivesItems.GetDefaultStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.primitivesItems.GetMaximumStored: Boolean;
begin
  Result := FMaximum <> 0;
end;

function TOpenAPIDefinition.primitivesItems.GetExclusiveMaximumStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.primitivesItems.GetMinimumStored: Boolean;
begin
  Result := FMinimum <> 0;
end;

function TOpenAPIDefinition.primitivesItems.GetExclusiveMinimumStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.primitivesItems.GetMaxLengthStored: Boolean;
begin
  Result := FMaxLength <> 0;
end;

function TOpenAPIDefinition.primitivesItems.GetMinLength: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0;
begin
  if not Assigned(FMinLength) then
    FMinLength := Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0.Create;

  Result := FMinLength;
end;

function TOpenAPIDefinition.primitivesItems.GetMinLengthStored: Boolean;
begin
  Result := Assigned(FMinLength);
end;

function TOpenAPIDefinition.primitivesItems.GetPatternStored: Boolean;
begin
  Result := not FPattern.IsEmpty;
end;

function TOpenAPIDefinition.primitivesItems.GetMaxItemsStored: Boolean;
begin
  Result := FMaxItems <> 0;
end;

function TOpenAPIDefinition.primitivesItems.GetMinItems: Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0;
begin
  if not Assigned(FMinItems) then
    FMinItems := Blue.Print.JSON.Draft4.Schema.Schema.positiveIntegerDefault0.Create;

  Result := FMinItems;
end;

function TOpenAPIDefinition.primitivesItems.GetMinItemsStored: Boolean;
begin
  Result := Assigned(FMinItems);
end;

function TOpenAPIDefinition.primitivesItems.GetUniqueItemsStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.primitivesItems.GetEnumStored: Boolean;
begin
  Result := Assigned(FEnum);
end;

function TOpenAPIDefinition.primitivesItems.GetMultipleOfStored: Boolean;
begin
  Result := FMultipleOf <> 0;
end;

function TOpenAPIDefinition.primitivesItems.GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.vendorExtension>.Create;

  Result := FVendorExtension;
end;

function TOpenAPIDefinition.primitivesItems.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ TOpenAPIDefinition.securityRequirement }

destructor TOpenAPIDefinition.securityRequirement.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.securityRequirement.GetAdditionalProperties: TDynamicProperty<TArray<System.String>>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<TArray<System.String>>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.securityRequirement.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.xml }

destructor TOpenAPIDefinition.xml.Destroy;
begin
  FVendorExtension.Free;

  inherited;
end;

function TOpenAPIDefinition.xml.GetNameStored: Boolean;
begin
  Result := not FName.IsEmpty;
end;

function TOpenAPIDefinition.xml.GetNamespaceStored: Boolean;
begin
  Result := not FNamespace.IsEmpty;
end;

function TOpenAPIDefinition.xml.GetPrefixStored: Boolean;
begin
  Result := not FPrefix.IsEmpty;
end;

function TOpenAPIDefinition.xml.GetAttributeStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.xml.GetWrappedStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.xml.GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.vendorExtension>.Create;

  Result := FVendorExtension;
end;

function TOpenAPIDefinition.xml.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ TOpenAPIDefinition.tag }

destructor TOpenAPIDefinition.tag.Destroy;
begin
  FExternalDocs.Free;

  FVendorExtension.Free;

  inherited;
end;

function TOpenAPIDefinition.tag.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.tag.GetExternalDocs: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.externalDocs;
begin
  if not Assigned(FExternalDocs) then
    FExternalDocs := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.externalDocs.Create;

  Result := FExternalDocs;
end;

function TOpenAPIDefinition.tag.GetExternalDocsStored: Boolean;
begin
  Result := Assigned(FExternalDocs);
end;

function TOpenAPIDefinition.tag.GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.vendorExtension>.Create;

  Result := FVendorExtension;
end;

function TOpenAPIDefinition.tag.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ TOpenAPIDefinition.securityDefinitions }

destructor TOpenAPIDefinition.securityDefinitions.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.securityDefinitions.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.securityDefinitions.additionalPropertiesType>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.securityDefinitions.additionalPropertiesType>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.securityDefinitions.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.securityDefinitions.additionalPropertiesType }

destructor TOpenAPIDefinition.securityDefinitions.additionalPropertiesType.Destroy;
begin
  FBasicAuthenticationSecurity.Free;

  FApiKeySecurity.Free;

  FOauth2ImplicitSecurity.Free;

  FOauth2PasswordSecurity.Free;

  FOauth2ApplicationSecurity.Free;

  FOauth2AccessCodeSecurity.Free;

  inherited;
end;

function TOpenAPIDefinition.securityDefinitions.additionalPropertiesType.GetBasicAuthenticationSecurity: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.basicAuthenticationSecurity;
begin
  if not Assigned(FBasicAuthenticationSecurity) then
    FBasicAuthenticationSecurity := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.basicAuthenticationSecurity.Create;

  Result := FBasicAuthenticationSecurity;
end;

function TOpenAPIDefinition.securityDefinitions.additionalPropertiesType.GetBasicAuthenticationSecurityStored: Boolean;
begin
  Result := Assigned(FBasicAuthenticationSecurity);
end;

function TOpenAPIDefinition.securityDefinitions.additionalPropertiesType.GetApiKeySecurity: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.apiKeySecurity;
begin
  if not Assigned(FApiKeySecurity) then
    FApiKeySecurity := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.apiKeySecurity.Create;

  Result := FApiKeySecurity;
end;

function TOpenAPIDefinition.securityDefinitions.additionalPropertiesType.GetApiKeySecurityStored: Boolean;
begin
  Result := Assigned(FApiKeySecurity);
end;

function TOpenAPIDefinition.securityDefinitions.additionalPropertiesType.GetOauth2ImplicitSecurity: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.oauth2ImplicitSecurity;
begin
  if not Assigned(FOauth2ImplicitSecurity) then
    FOauth2ImplicitSecurity := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.oauth2ImplicitSecurity.Create;

  Result := FOauth2ImplicitSecurity;
end;

function TOpenAPIDefinition.securityDefinitions.additionalPropertiesType.GetOauth2ImplicitSecurityStored: Boolean;
begin
  Result := Assigned(FOauth2ImplicitSecurity);
end;

function TOpenAPIDefinition.securityDefinitions.additionalPropertiesType.GetOauth2PasswordSecurity: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.oauth2PasswordSecurity;
begin
  if not Assigned(FOauth2PasswordSecurity) then
    FOauth2PasswordSecurity := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.oauth2PasswordSecurity.Create;

  Result := FOauth2PasswordSecurity;
end;

function TOpenAPIDefinition.securityDefinitions.additionalPropertiesType.GetOauth2PasswordSecurityStored: Boolean;
begin
  Result := Assigned(FOauth2PasswordSecurity);
end;

function TOpenAPIDefinition.securityDefinitions.additionalPropertiesType.GetOauth2ApplicationSecurity: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.oauth2ApplicationSecurity;
begin
  if not Assigned(FOauth2ApplicationSecurity) then
    FOauth2ApplicationSecurity := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.oauth2ApplicationSecurity.Create;

  Result := FOauth2ApplicationSecurity;
end;

function TOpenAPIDefinition.securityDefinitions.additionalPropertiesType.GetOauth2ApplicationSecurityStored: Boolean;
begin
  Result := Assigned(FOauth2ApplicationSecurity);
end;

function TOpenAPIDefinition.securityDefinitions.additionalPropertiesType.GetOauth2AccessCodeSecurity: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.oauth2AccessCodeSecurity;
begin
  if not Assigned(FOauth2AccessCodeSecurity) then
    FOauth2AccessCodeSecurity := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.oauth2AccessCodeSecurity.Create;

  Result := FOauth2AccessCodeSecurity;
end;

function TOpenAPIDefinition.securityDefinitions.additionalPropertiesType.GetOauth2AccessCodeSecurityStored: Boolean;
begin
  Result := Assigned(FOauth2AccessCodeSecurity);
end;

{ TOpenAPIDefinition.basicAuthenticationSecurity }

destructor TOpenAPIDefinition.basicAuthenticationSecurity.Destroy;
begin
  FVendorExtension.Free;

  inherited;
end;

function TOpenAPIDefinition.basicAuthenticationSecurity.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.basicAuthenticationSecurity.GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.vendorExtension>.Create;

  Result := FVendorExtension;
end;

function TOpenAPIDefinition.basicAuthenticationSecurity.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ TOpenAPIDefinition.apiKeySecurity }

destructor TOpenAPIDefinition.apiKeySecurity.Destroy;
begin
  FVendorExtension.Free;

  inherited;
end;

function TOpenAPIDefinition.apiKeySecurity.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.apiKeySecurity.GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.vendorExtension>.Create;

  Result := FVendorExtension;
end;

function TOpenAPIDefinition.apiKeySecurity.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ TOpenAPIDefinition.oauth2ImplicitSecurity }

destructor TOpenAPIDefinition.oauth2ImplicitSecurity.Destroy;
begin
  FScopes.Free;

  FVendorExtension.Free;

  inherited;
end;

function TOpenAPIDefinition.oauth2ImplicitSecurity.GetScopes: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.oauth2Scopes;
begin
  if not Assigned(FScopes) then
    FScopes := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.oauth2Scopes.Create;

  Result := FScopes;
end;

function TOpenAPIDefinition.oauth2ImplicitSecurity.GetScopesStored: Boolean;
begin
  Result := Assigned(FScopes);
end;

function TOpenAPIDefinition.oauth2ImplicitSecurity.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.oauth2ImplicitSecurity.GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.vendorExtension>.Create;

  Result := FVendorExtension;
end;

function TOpenAPIDefinition.oauth2ImplicitSecurity.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ TOpenAPIDefinition.oauth2PasswordSecurity }

destructor TOpenAPIDefinition.oauth2PasswordSecurity.Destroy;
begin
  FScopes.Free;

  FVendorExtension.Free;

  inherited;
end;

function TOpenAPIDefinition.oauth2PasswordSecurity.GetScopes: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.oauth2Scopes;
begin
  if not Assigned(FScopes) then
    FScopes := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.oauth2Scopes.Create;

  Result := FScopes;
end;

function TOpenAPIDefinition.oauth2PasswordSecurity.GetScopesStored: Boolean;
begin
  Result := Assigned(FScopes);
end;

function TOpenAPIDefinition.oauth2PasswordSecurity.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.oauth2PasswordSecurity.GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.vendorExtension>.Create;

  Result := FVendorExtension;
end;

function TOpenAPIDefinition.oauth2PasswordSecurity.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ TOpenAPIDefinition.oauth2ApplicationSecurity }

destructor TOpenAPIDefinition.oauth2ApplicationSecurity.Destroy;
begin
  FScopes.Free;

  FVendorExtension.Free;

  inherited;
end;

function TOpenAPIDefinition.oauth2ApplicationSecurity.GetScopes: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.oauth2Scopes;
begin
  if not Assigned(FScopes) then
    FScopes := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.oauth2Scopes.Create;

  Result := FScopes;
end;

function TOpenAPIDefinition.oauth2ApplicationSecurity.GetScopesStored: Boolean;
begin
  Result := Assigned(FScopes);
end;

function TOpenAPIDefinition.oauth2ApplicationSecurity.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.oauth2ApplicationSecurity.GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.vendorExtension>.Create;

  Result := FVendorExtension;
end;

function TOpenAPIDefinition.oauth2ApplicationSecurity.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ TOpenAPIDefinition.oauth2AccessCodeSecurity }

destructor TOpenAPIDefinition.oauth2AccessCodeSecurity.Destroy;
begin
  FScopes.Free;

  FVendorExtension.Free;

  inherited;
end;

function TOpenAPIDefinition.oauth2AccessCodeSecurity.GetScopes: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.oauth2Scopes;
begin
  if not Assigned(FScopes) then
    FScopes := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.oauth2Scopes.Create;

  Result := FScopes;
end;

function TOpenAPIDefinition.oauth2AccessCodeSecurity.GetScopesStored: Boolean;
begin
  Result := Assigned(FScopes);
end;

function TOpenAPIDefinition.oauth2AccessCodeSecurity.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.oauth2AccessCodeSecurity.GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.vendorExtension>.Create;

  Result := FVendorExtension;
end;

function TOpenAPIDefinition.oauth2AccessCodeSecurity.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ TOpenAPIDefinition.oauth2Scopes }

destructor TOpenAPIDefinition.oauth2Scopes.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.oauth2Scopes.GetAdditionalProperties: TDynamicProperty<System.String>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<System.String>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.oauth2Scopes.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.parametersListArrayItem }

destructor TOpenAPIDefinition.parametersListArrayItem.Destroy;
begin
  FParameter.Free;

  FJsonReference.Free;

  inherited;
end;

function TOpenAPIDefinition.parametersListArrayItem.GetParameter: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.parameter;
begin
  if not Assigned(FParameter) then
    FParameter := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.parameter.Create;

  Result := FParameter;
end;

function TOpenAPIDefinition.parametersListArrayItem.GetParameterStored: Boolean;
begin
  Result := Assigned(FParameter);
end;

function TOpenAPIDefinition.parametersListArrayItem.GetJsonReference: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.jsonReference;
begin
  if not Assigned(FJsonReference) then
    FJsonReference := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.jsonReference.Create;

  Result := FJsonReference;
end;

function TOpenAPIDefinition.parametersListArrayItem.GetJsonReferenceStored: Boolean;
begin
  Result := Assigned(FJsonReference);
end;

{ TOpenAPIDefinition.TOpenAPIDefinition }

destructor TOpenAPIDefinition.TOpenAPIDefinition.Destroy;
begin
  FInfo.Free;

  FConsumes.Free;

  FProduces.Free;

  FPaths.Free;

  FDefinitions.Free;

  FParameters.Free;

  FResponses.Free;

  for var AObject in FSecurity do
    AObject.Free;

  FSecurityDefinitions.Free;

  for var AObject in FTags do
    AObject.Free;

  FExternalDocs.Free;

  FVendorExtension.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetInfo: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.info;
begin
  if not Assigned(FInfo) then
    FInfo := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.info.Create;

  Result := FInfo;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetHostStored: Boolean;
begin
  Result := not FHost.IsEmpty;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetBasePathStored: Boolean;
begin
  Result := not FBasePath.IsEmpty;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetSchemesStored: Boolean;
begin
  Result := Assigned(FSchemes);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetConsumes: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.TOpenAPIDefinition.ConsumesProperty;
begin
  if not Assigned(FConsumes) then
    FConsumes := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.TOpenAPIDefinition.ConsumesProperty.Create;

  Result := FConsumes;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetConsumesStored: Boolean;
begin
  Result := Assigned(FConsumes);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetProduces: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.TOpenAPIDefinition.ProducesProperty;
begin
  if not Assigned(FProduces) then
    FProduces := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.TOpenAPIDefinition.ProducesProperty.Create;

  Result := FProduces;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetProducesStored: Boolean;
begin
  Result := Assigned(FProduces);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetPaths: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.paths;
begin
  if not Assigned(FPaths) then
    FPaths := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.paths.Create;

  Result := FPaths;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetDefinitions: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.definitions;
begin
  if not Assigned(FDefinitions) then
    FDefinitions := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.definitions.Create;

  Result := FDefinitions;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetDefinitionsStored: Boolean;
begin
  Result := Assigned(FDefinitions);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetParameters: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.parameterDefinitions;
begin
  if not Assigned(FParameters) then
    FParameters := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.parameterDefinitions.Create;

  Result := FParameters;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetParametersStored: Boolean;
begin
  Result := Assigned(FParameters);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetResponses: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.responseDefinitions;
begin
  if not Assigned(FResponses) then
    FResponses := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.responseDefinitions.Create;

  Result := FResponses;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetResponsesStored: Boolean;
begin
  Result := Assigned(FResponses);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.AddSecurity: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.securityRequirement;
begin
  Result := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.securityRequirement.Create;

  FSecurity := FSecurity + [Result];
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetSecurityStored: Boolean;
begin
  Result := Assigned(FSecurity);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetSecurityDefinitions: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.securityDefinitions;
begin
  if not Assigned(FSecurityDefinitions) then
    FSecurityDefinitions := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.securityDefinitions.Create;

  Result := FSecurityDefinitions;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetSecurityDefinitionsStored: Boolean;
begin
  Result := Assigned(FSecurityDefinitions);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.AddTags: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.tag;
begin
  Result := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.tag.Create;

  FTags := FTags + [Result];
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetTagsStored: Boolean;
begin
  Result := Assigned(FTags);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetExternalDocs: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.externalDocs;
begin
  if not Assigned(FExternalDocs) then
    FExternalDocs := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.externalDocs.Create;

  Result := FExternalDocs;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetExternalDocsStored: Boolean;
begin
  Result := Assigned(FExternalDocs);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.vendorExtension>.Create;

  Result := FVendorExtension;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.ConsumesProperty }

function TOpenAPIDefinition.TOpenAPIDefinition.ConsumesProperty.GetMediaTypeListStored: Boolean;
begin
  Result := Assigned(FMediaTypeList);
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.ProducesProperty }

function TOpenAPIDefinition.TOpenAPIDefinition.ProducesProperty.GetMediaTypeListStored: Boolean;
begin
  Result := Assigned(FMediaTypeList);
end;

end.
