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
    SchemesListArrayItem = (http, https, ws, wss);

    CollectionFormat = (csv, ssv, tsv, pipes);

    CollectionFormatWithMulti = (csv, ssv, tsv, pipes, multi);

    // Forward class declaration
    Info = class;
    Contact = class;
    License = class;
    Paths = class;
    Definitions = class;
    ParameterDefinitions = class;
    ResponseDefinitions = class;
    ExternalDocs = class;
    Examples = class;
    Operation = class;
    PathItem = class;
    Responses = class;
    ResponseValue = class;
    Response = class;
    Headers = class;
    Header = class;
    VendorExtension = class;
    BodyParameter = class;
    HeaderParameterSubSchema = class;
    QueryParameterSubSchema = class;
    FormDataParameterSubSchema = class;
    PathParameterSubSchema = class;
    NonBodyParameter = class;
    Parameter = class;
    Schema = class;
    FileSchema = class;
    PrimitivesItems = class;
    SecurityRequirement = class;
    Xml = class;
    Tag = class;
    SecurityDefinitions = class;
    BasicAuthenticationSecurity = class;
    ApiKeySecurity = class;
    Oauth2ImplicitSecurity = class;
    Oauth2PasswordSecurity = class;
    Oauth2ApplicationSecurity = class;
    Oauth2AccessCodeSecurity = class;
    Oauth2Scopes = class;
    ParametersListArrayItem = class;
    JsonReference = class;
    TOpenAPIDefinition = class;

    // Types alias
    mimeType = System.String;
    security = TArray<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.SecurityRequirement>;
    mediaTypeList = TArray<System.String>;
    parametersList = TArray<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.ParametersListArrayItem>;
    schemesList = TArray<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.SchemesListArrayItem>;
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

    Info = class
    private
      FTitle: System.String;
      FVersion: System.String;
      FDescription: System.String;
      FTermsOfService: System.String;
      FContact: TOpenAPIDefinition.Contact;
      FLicense: TOpenAPIDefinition.License;
      FVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;

      function GetContact: TOpenAPIDefinition.Contact;
      function GetLicense: TOpenAPIDefinition.License;
      function GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
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
      property contact: TOpenAPIDefinition.Contact read GetContact write FContact stored GetContactStored;
      property license: TOpenAPIDefinition.License read GetLicense write FLicense stored GetLicenseStored;
      [PatternProperty('^x-')]
      property vendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
    end;

    Contact = class
    private
      FName: System.String;
      FUrl: System.String;
      FEmail: System.String;
      FVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;

      function GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
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
      property vendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
    end;

    License = class
    private
      FName: System.String;
      FUrl: System.String;
      FVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;

      function GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
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
      property vendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
    end;

    Paths = class
    private
      FVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
      FPathItem: TDynamicProperty<TOpenAPIDefinition.PathItem>;

      function GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
      function GetPathItem: TDynamicProperty<TOpenAPIDefinition.PathItem>;
      function GetVendorExtensionStored: Boolean;
      function GetPathItemStored: Boolean;
    public
      destructor Destroy; override;

      property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
      property IsPathItemStored: Boolean read GetPathItemStored;
    published
      [PatternProperty('^x-')]
      property vendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
      [PatternProperty('^/')]
      property pathItem: TDynamicProperty<TOpenAPIDefinition.PathItem> read GetPathItem write FPathItem stored GetPathItemStored;
    end;

    Definitions = class
    private
      FAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Schema>;

      function GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Schema>;
      function GetAdditionalPropertiesStored: Boolean;
    public
      destructor Destroy; override;

      property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
    published
      property additionalProperties: TDynamicProperty<TOpenAPIDefinition.Schema> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
    end;

    ParameterDefinitions = class
    private
      FAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Parameter>;

      function GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Parameter>;
      function GetAdditionalPropertiesStored: Boolean;
    public
      destructor Destroy; override;

      property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
    published
      property additionalProperties: TDynamicProperty<TOpenAPIDefinition.Parameter> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
    end;

    ResponseDefinitions = class
    private
      FAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Response>;

      function GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Response>;
      function GetAdditionalPropertiesStored: Boolean;
    public
      destructor Destroy; override;

      property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
    published
      property additionalProperties: TDynamicProperty<TOpenAPIDefinition.Response> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
    end;

    ExternalDocs = class
    private
      FDescription: System.String;
      FUrl: System.String;
      FVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;

      function GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
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
      property vendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
    end;

    Examples = class
    end;

    Operation = class
    public type
      // Forward class declaration
      Tproduces = class;
      Tconsumes = class;

      [Flat]
      Tproduces = class
      private
        FMediaTypeList: TOpenAPIDefinition.mediaTypeList;

        function GetMediaTypeListStored: Boolean;
      public
        property IsMediaTypeListStored: Boolean read GetMediaTypeListStored;
      published
        property mediaTypeList: TOpenAPIDefinition.mediaTypeList read FMediaTypeList write FMediaTypeList stored GetMediaTypeListStored;
      end;

      [Flat]
      Tconsumes = class
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
      FExternalDocs: TOpenAPIDefinition.ExternalDocs;
      FOperationId: System.String;
      FProduces: TOpenAPIDefinition.Operation.Tproduces;
      FConsumes: TOpenAPIDefinition.Operation.Tconsumes;
      FParameters: TOpenAPIDefinition.parametersList;
      FResponses: TOpenAPIDefinition.Responses;
      FSchemes: TOpenAPIDefinition.schemesList;
      FDeprecated: System.Boolean;
      FSecurity: TOpenAPIDefinition.security;
      FVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;

      function GetExternalDocs: TOpenAPIDefinition.ExternalDocs;
      function GetProduces: TOpenAPIDefinition.Operation.Tproduces;
      function GetConsumes: TOpenAPIDefinition.Operation.Tconsumes;
      function GetResponses: TOpenAPIDefinition.Responses;
      function GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
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

      function AddParameters: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.ParametersListArrayItem;
      function AddSecurity: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.SecurityRequirement;

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
      property externalDocs: TOpenAPIDefinition.ExternalDocs read GetExternalDocs write FExternalDocs stored GetExternalDocsStored;
      property operationId: System.String read FOperationId write FOperationId stored GetOperationIdStored;
      property produces: TOpenAPIDefinition.Operation.Tproduces read GetProduces write FProduces stored GetProducesStored;
      property consumes: TOpenAPIDefinition.Operation.Tconsumes read GetConsumes write FConsumes stored GetConsumesStored;
      property parameters: TOpenAPIDefinition.parametersList read FParameters write FParameters stored GetParametersStored;
      property responses: TOpenAPIDefinition.Responses read GetResponses write FResponses;
      property schemes: TOpenAPIDefinition.schemesList read FSchemes write FSchemes stored GetSchemesStored;
      property deprecated: System.Boolean read FDeprecated write FDeprecated stored GetDeprecatedStored;
      property security: TOpenAPIDefinition.security read FSecurity write FSecurity stored GetSecurityStored;
      [PatternProperty('^x-')]
      property vendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
    end;

    PathItem = class
    private
      FRef: System.String;
      FGet: TOpenAPIDefinition.Operation;
      FPut: TOpenAPIDefinition.Operation;
      FPost: TOpenAPIDefinition.Operation;
      FDelete: TOpenAPIDefinition.Operation;
      FOptions: TOpenAPIDefinition.Operation;
      FHead: TOpenAPIDefinition.Operation;
      FPatch: TOpenAPIDefinition.Operation;
      FParameters: TOpenAPIDefinition.parametersList;
      FVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;

      function GetGet: TOpenAPIDefinition.Operation;
      function GetPut: TOpenAPIDefinition.Operation;
      function GetPost: TOpenAPIDefinition.Operation;
      function GetDelete: TOpenAPIDefinition.Operation;
      function GetOptions: TOpenAPIDefinition.Operation;
      function GetHead: TOpenAPIDefinition.Operation;
      function GetPatch: TOpenAPIDefinition.Operation;
      function GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
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

      function AddParameters: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.ParametersListArrayItem;

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
      property Ref: System.String read FRef write FRef stored GetRefStored;
      property get: TOpenAPIDefinition.Operation read GetGet write FGet stored GetGetStored;
      property put: TOpenAPIDefinition.Operation read GetPut write FPut stored GetPutStored;
      property post: TOpenAPIDefinition.Operation read GetPost write FPost stored GetPostStored;
      property delete: TOpenAPIDefinition.Operation read GetDelete write FDelete stored GetDeleteStored;
      property options: TOpenAPIDefinition.Operation read GetOptions write FOptions stored GetOptionsStored;
      property head: TOpenAPIDefinition.Operation read GetHead write FHead stored GetHeadStored;
      property patch: TOpenAPIDefinition.Operation read GetPatch write FPatch stored GetPatchStored;
      property parameters: TOpenAPIDefinition.parametersList read FParameters write FParameters stored GetParametersStored;
      [PatternProperty('^x-')]
      property vendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
    end;

    Responses = class
    private
      FResponseValue: TDynamicProperty<TOpenAPIDefinition.ResponseValue>;
      FVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;

      function GetResponseValue: TDynamicProperty<TOpenAPIDefinition.ResponseValue>;
      function GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
      function GetResponseValueStored: Boolean;
      function GetVendorExtensionStored: Boolean;
    public
      destructor Destroy; override;

      property IsResponseValueStored: Boolean read GetResponseValueStored;
      property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
    published
      [PatternProperty('^([0-9]{3})$|^(default)$')]
      property responseValue: TDynamicProperty<TOpenAPIDefinition.ResponseValue> read GetResponseValue write FResponseValue stored GetResponseValueStored;
      [PatternProperty('^x-')]
      property vendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
    end;

    [Flat]
    ResponseValue = class
    private
      FResponse: TOpenAPIDefinition.Response;
      FJsonReference: TOpenAPIDefinition.JsonReference;

      function GetResponse: TOpenAPIDefinition.Response;
      function GetJsonReference: TOpenAPIDefinition.JsonReference;
      function GetResponseStored: Boolean;
      function GetJsonReferenceStored: Boolean;
    public
      destructor Destroy; override;

      property IsResponseStored: Boolean read GetResponseStored;
      property IsJsonReferenceStored: Boolean read GetJsonReferenceStored;
    published
      property response: TOpenAPIDefinition.Response read GetResponse write FResponse stored GetResponseStored;
      property jsonReference: TOpenAPIDefinition.JsonReference read GetJsonReference write FJsonReference stored GetJsonReferenceStored;
    end;

    Response = class
    public type
      // Forward class declaration
      Tschema = class;

      [Flat]
      Tschema = class
      private
        FSchema: TOpenAPIDefinition.Schema;
        FFileSchema: TOpenAPIDefinition.FileSchema;

        function GetSchema: TOpenAPIDefinition.Schema;
        function GetFileSchema: TOpenAPIDefinition.FileSchema;
        function GetSchemaStored: Boolean;
        function GetFileSchemaStored: Boolean;
      public
        destructor Destroy; override;

        property IsSchemaStored: Boolean read GetSchemaStored;
        property IsFileSchemaStored: Boolean read GetFileSchemaStored;
      published
        property schema: TOpenAPIDefinition.Schema read GetSchema write FSchema stored GetSchemaStored;
        property fileSchema: TOpenAPIDefinition.FileSchema read GetFileSchema write FFileSchema stored GetFileSchemaStored;
      end;
    private
      FDescription: System.String;
      FSchema: TOpenAPIDefinition.Response.Tschema;
      FHeaders: TOpenAPIDefinition.Headers;
      FExamples: TOpenAPIDefinition.Examples;
      FVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;

      function GetSchema: TOpenAPIDefinition.Response.Tschema;
      function GetHeaders: TOpenAPIDefinition.Headers;
      function GetExamples: TOpenAPIDefinition.Examples;
      function GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
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
      property schema: TOpenAPIDefinition.Response.Tschema read GetSchema write FSchema stored GetSchemaStored;
      property headers: TOpenAPIDefinition.Headers read GetHeaders write FHeaders stored GetHeadersStored;
      property examples: TOpenAPIDefinition.Examples read GetExamples write FExamples stored GetExamplesStored;
      [PatternProperty('^x-')]
      property vendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
    end;

    Headers = class
    private
      FAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Header>;

      function GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Header>;
      function GetAdditionalPropertiesStored: Boolean;
    public
      destructor Destroy; override;

      property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
    published
      property additionalProperties: TDynamicProperty<TOpenAPIDefinition.Header> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
    end;

    Header = class
    public type
      [EnumValue('string, number, integer, boolean, array')]
      Ttype = (&string, number, integer, boolean, &array);
    private
      FType: TOpenAPIDefinition.Header.Ttype;
      FFormat: System.String;
      FItems: TOpenAPIDefinition.PrimitivesItems;
      FCollectionFormat: TOpenAPIDefinition.CollectionFormat;
      FDefault: TOpenAPIDefinition.default;
      FMaximum: TOpenAPIDefinition.maximum;
      FExclusiveMaximum: TOpenAPIDefinition.exclusiveMaximum;
      FMinimum: TOpenAPIDefinition.minimum;
      FExclusiveMinimum: TOpenAPIDefinition.exclusiveMinimum;
      FMaxLength: TOpenAPIDefinition.maxLength;
      FMinLength: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0;
      FPattern: TOpenAPIDefinition.pattern;
      FMaxItems: TOpenAPIDefinition.maxItems;
      FMinItems: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0;
      FUniqueItems: TOpenAPIDefinition.uniqueItems;
      FEnum: TOpenAPIDefinition.enum;
      FMultipleOf: TOpenAPIDefinition.multipleOf;
      FDescription: System.String;
      FVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
      FCollectionFormatIsStored: Boolean;

      function GetItems: TOpenAPIDefinition.PrimitivesItems;
      function GetMinLength: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0;
      function GetMinItems: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0;
      function GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
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
      procedure SetCollectionFormat(const Value: TOpenAPIDefinition.CollectionFormat);
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
      property &type: TOpenAPIDefinition.Header.Ttype read FType write FType;
      property format: System.String read FFormat write FFormat stored GetFormatStored;
      property items: TOpenAPIDefinition.PrimitivesItems read GetItems write FItems stored GetItemsStored;
      property collectionFormat: TOpenAPIDefinition.CollectionFormat read FCollectionFormat write SetCollectionFormat stored FCollectionFormatIsStored;
      property default: TOpenAPIDefinition.default read FDefault write FDefault stored GetDefaultStored;
      property maximum: TOpenAPIDefinition.maximum read FMaximum write FMaximum stored GetMaximumStored;
      property exclusiveMaximum: TOpenAPIDefinition.exclusiveMaximum read FExclusiveMaximum write FExclusiveMaximum stored GetExclusiveMaximumStored;
      property minimum: TOpenAPIDefinition.minimum read FMinimum write FMinimum stored GetMinimumStored;
      property exclusiveMinimum: TOpenAPIDefinition.exclusiveMinimum read FExclusiveMinimum write FExclusiveMinimum stored GetExclusiveMinimumStored;
      property maxLength: TOpenAPIDefinition.maxLength read FMaxLength write FMaxLength stored GetMaxLengthStored;
      property minLength: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0 read GetMinLength write FMinLength stored GetMinLengthStored;
      property pattern: TOpenAPIDefinition.pattern read FPattern write FPattern stored GetPatternStored;
      property maxItems: TOpenAPIDefinition.maxItems read FMaxItems write FMaxItems stored GetMaxItemsStored;
      property minItems: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0 read GetMinItems write FMinItems stored GetMinItemsStored;
      property uniqueItems: TOpenAPIDefinition.uniqueItems read FUniqueItems write FUniqueItems stored GetUniqueItemsStored;
      property enum: TOpenAPIDefinition.enum read FEnum write FEnum stored GetEnumStored;
      property multipleOf: TOpenAPIDefinition.multipleOf read FMultipleOf write FMultipleOf stored GetMultipleOfStored;
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      [PatternProperty('^x-')]
      property vendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
    end;

    VendorExtension = class
    end;

    BodyParameter = class
    public type
      Tin = (body);
    private
      FDescription: System.String;
      FName: System.String;
      FIn: TOpenAPIDefinition.BodyParameter.Tin;
      FRequired: System.Boolean;
      FSchema: TOpenAPIDefinition.Schema;
      FVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;

      function GetSchema: TOpenAPIDefinition.Schema;
      function GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
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
      property &in: TOpenAPIDefinition.BodyParameter.Tin read FIn write FIn;
      property required: System.Boolean read FRequired write FRequired stored GetRequiredStored;
      property schema: TOpenAPIDefinition.Schema read GetSchema write FSchema;
      [PatternProperty('^x-')]
      property vendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
    end;

    HeaderParameterSubSchema = class
    public type
      Tin = (header);

      [EnumValue('string, number, boolean, integer, array')]
      Ttype = (&string, number, boolean, integer, &array);
    private
      FRequired: System.Boolean;
      FIn: TOpenAPIDefinition.HeaderParameterSubSchema.Tin;
      FDescription: System.String;
      FName: System.String;
      FType: TOpenAPIDefinition.HeaderParameterSubSchema.Ttype;
      FFormat: System.String;
      FItems: TOpenAPIDefinition.PrimitivesItems;
      FCollectionFormat: TOpenAPIDefinition.CollectionFormat;
      FDefault: TOpenAPIDefinition.default;
      FMaximum: TOpenAPIDefinition.maximum;
      FExclusiveMaximum: TOpenAPIDefinition.exclusiveMaximum;
      FMinimum: TOpenAPIDefinition.minimum;
      FExclusiveMinimum: TOpenAPIDefinition.exclusiveMinimum;
      FMaxLength: TOpenAPIDefinition.maxLength;
      FMinLength: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0;
      FPattern: TOpenAPIDefinition.pattern;
      FMaxItems: TOpenAPIDefinition.maxItems;
      FMinItems: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0;
      FUniqueItems: TOpenAPIDefinition.uniqueItems;
      FEnum: TOpenAPIDefinition.enum;
      FMultipleOf: TOpenAPIDefinition.multipleOf;
      FVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
      FInIsStored: Boolean;
      FTypeIsStored: Boolean;
      FCollectionFormatIsStored: Boolean;

      function GetItems: TOpenAPIDefinition.PrimitivesItems;
      function GetMinLength: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0;
      function GetMinItems: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0;
      function GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
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
      procedure SetIn(const Value: TOpenAPIDefinition.HeaderParameterSubSchema.Tin);
      procedure SetType(const Value: TOpenAPIDefinition.HeaderParameterSubSchema.Ttype);
      procedure SetCollectionFormat(const Value: TOpenAPIDefinition.CollectionFormat);
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
      property &in: TOpenAPIDefinition.HeaderParameterSubSchema.Tin read FIn write SetIn stored FInIsStored;
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      property name: System.String read FName write FName stored GetNameStored;
      [FieldName('type')]
      property &type: TOpenAPIDefinition.HeaderParameterSubSchema.Ttype read FType write SetType stored FTypeIsStored;
      property format: System.String read FFormat write FFormat stored GetFormatStored;
      property items: TOpenAPIDefinition.PrimitivesItems read GetItems write FItems stored GetItemsStored;
      property collectionFormat: TOpenAPIDefinition.CollectionFormat read FCollectionFormat write SetCollectionFormat stored FCollectionFormatIsStored;
      property default: TOpenAPIDefinition.default read FDefault write FDefault stored GetDefaultStored;
      property maximum: TOpenAPIDefinition.maximum read FMaximum write FMaximum stored GetMaximumStored;
      property exclusiveMaximum: TOpenAPIDefinition.exclusiveMaximum read FExclusiveMaximum write FExclusiveMaximum stored GetExclusiveMaximumStored;
      property minimum: TOpenAPIDefinition.minimum read FMinimum write FMinimum stored GetMinimumStored;
      property exclusiveMinimum: TOpenAPIDefinition.exclusiveMinimum read FExclusiveMinimum write FExclusiveMinimum stored GetExclusiveMinimumStored;
      property maxLength: TOpenAPIDefinition.maxLength read FMaxLength write FMaxLength stored GetMaxLengthStored;
      property minLength: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0 read GetMinLength write FMinLength stored GetMinLengthStored;
      property pattern: TOpenAPIDefinition.pattern read FPattern write FPattern stored GetPatternStored;
      property maxItems: TOpenAPIDefinition.maxItems read FMaxItems write FMaxItems stored GetMaxItemsStored;
      property minItems: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0 read GetMinItems write FMinItems stored GetMinItemsStored;
      property uniqueItems: TOpenAPIDefinition.uniqueItems read FUniqueItems write FUniqueItems stored GetUniqueItemsStored;
      property enum: TOpenAPIDefinition.enum read FEnum write FEnum stored GetEnumStored;
      property multipleOf: TOpenAPIDefinition.multipleOf read FMultipleOf write FMultipleOf stored GetMultipleOfStored;
      [PatternProperty('^x-')]
      property vendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
    end;

    QueryParameterSubSchema = class
    public type
      Tin = (query);

      [EnumValue('string, number, boolean, integer, array')]
      Ttype = (&string, number, boolean, integer, &array);
    private
      FRequired: System.Boolean;
      FIn: TOpenAPIDefinition.QueryParameterSubSchema.Tin;
      FDescription: System.String;
      FName: System.String;
      FAllowEmptyValue: System.Boolean;
      FType: TOpenAPIDefinition.QueryParameterSubSchema.Ttype;
      FFormat: System.String;
      FItems: TOpenAPIDefinition.PrimitivesItems;
      FCollectionFormat: TOpenAPIDefinition.CollectionFormatWithMulti;
      FDefault: TOpenAPIDefinition.default;
      FMaximum: TOpenAPIDefinition.maximum;
      FExclusiveMaximum: TOpenAPIDefinition.exclusiveMaximum;
      FMinimum: TOpenAPIDefinition.minimum;
      FExclusiveMinimum: TOpenAPIDefinition.exclusiveMinimum;
      FMaxLength: TOpenAPIDefinition.maxLength;
      FMinLength: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0;
      FPattern: TOpenAPIDefinition.pattern;
      FMaxItems: TOpenAPIDefinition.maxItems;
      FMinItems: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0;
      FUniqueItems: TOpenAPIDefinition.uniqueItems;
      FEnum: TOpenAPIDefinition.enum;
      FMultipleOf: TOpenAPIDefinition.multipleOf;
      FVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
      FInIsStored: Boolean;
      FTypeIsStored: Boolean;
      FCollectionFormatIsStored: Boolean;

      function GetItems: TOpenAPIDefinition.PrimitivesItems;
      function GetMinLength: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0;
      function GetMinItems: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0;
      function GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
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
      procedure SetIn(const Value: TOpenAPIDefinition.QueryParameterSubSchema.Tin);
      procedure SetType(const Value: TOpenAPIDefinition.QueryParameterSubSchema.Ttype);
      procedure SetCollectionFormat(const Value: TOpenAPIDefinition.CollectionFormatWithMulti);
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
      property &in: TOpenAPIDefinition.QueryParameterSubSchema.Tin read FIn write SetIn stored FInIsStored;
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      property name: System.String read FName write FName stored GetNameStored;
      property allowEmptyValue: System.Boolean read FAllowEmptyValue write FAllowEmptyValue stored GetAllowEmptyValueStored;
      [FieldName('type')]
      property &type: TOpenAPIDefinition.QueryParameterSubSchema.Ttype read FType write SetType stored FTypeIsStored;
      property format: System.String read FFormat write FFormat stored GetFormatStored;
      property items: TOpenAPIDefinition.PrimitivesItems read GetItems write FItems stored GetItemsStored;
      property collectionFormat: TOpenAPIDefinition.CollectionFormatWithMulti read FCollectionFormat write SetCollectionFormat stored FCollectionFormatIsStored;
      property default: TOpenAPIDefinition.default read FDefault write FDefault stored GetDefaultStored;
      property maximum: TOpenAPIDefinition.maximum read FMaximum write FMaximum stored GetMaximumStored;
      property exclusiveMaximum: TOpenAPIDefinition.exclusiveMaximum read FExclusiveMaximum write FExclusiveMaximum stored GetExclusiveMaximumStored;
      property minimum: TOpenAPIDefinition.minimum read FMinimum write FMinimum stored GetMinimumStored;
      property exclusiveMinimum: TOpenAPIDefinition.exclusiveMinimum read FExclusiveMinimum write FExclusiveMinimum stored GetExclusiveMinimumStored;
      property maxLength: TOpenAPIDefinition.maxLength read FMaxLength write FMaxLength stored GetMaxLengthStored;
      property minLength: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0 read GetMinLength write FMinLength stored GetMinLengthStored;
      property pattern: TOpenAPIDefinition.pattern read FPattern write FPattern stored GetPatternStored;
      property maxItems: TOpenAPIDefinition.maxItems read FMaxItems write FMaxItems stored GetMaxItemsStored;
      property minItems: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0 read GetMinItems write FMinItems stored GetMinItemsStored;
      property uniqueItems: TOpenAPIDefinition.uniqueItems read FUniqueItems write FUniqueItems stored GetUniqueItemsStored;
      property enum: TOpenAPIDefinition.enum read FEnum write FEnum stored GetEnumStored;
      property multipleOf: TOpenAPIDefinition.multipleOf read FMultipleOf write FMultipleOf stored GetMultipleOfStored;
      [PatternProperty('^x-')]
      property vendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
    end;

    FormDataParameterSubSchema = class
    public type
      Tin = (formData);

      [EnumValue('string, number, boolean, integer, array, file')]
      Ttype = (&string, number, boolean, integer, &array, &file);
    private
      FRequired: System.Boolean;
      FIn: TOpenAPIDefinition.FormDataParameterSubSchema.Tin;
      FDescription: System.String;
      FName: System.String;
      FAllowEmptyValue: System.Boolean;
      FType: TOpenAPIDefinition.FormDataParameterSubSchema.Ttype;
      FFormat: System.String;
      FItems: TOpenAPIDefinition.PrimitivesItems;
      FCollectionFormat: TOpenAPIDefinition.CollectionFormatWithMulti;
      FDefault: TOpenAPIDefinition.default;
      FMaximum: TOpenAPIDefinition.maximum;
      FExclusiveMaximum: TOpenAPIDefinition.exclusiveMaximum;
      FMinimum: TOpenAPIDefinition.minimum;
      FExclusiveMinimum: TOpenAPIDefinition.exclusiveMinimum;
      FMaxLength: TOpenAPIDefinition.maxLength;
      FMinLength: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0;
      FPattern: TOpenAPIDefinition.pattern;
      FMaxItems: TOpenAPIDefinition.maxItems;
      FMinItems: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0;
      FUniqueItems: TOpenAPIDefinition.uniqueItems;
      FEnum: TOpenAPIDefinition.enum;
      FMultipleOf: TOpenAPIDefinition.multipleOf;
      FVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
      FInIsStored: Boolean;
      FTypeIsStored: Boolean;
      FCollectionFormatIsStored: Boolean;

      function GetItems: TOpenAPIDefinition.PrimitivesItems;
      function GetMinLength: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0;
      function GetMinItems: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0;
      function GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
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
      procedure SetIn(const Value: TOpenAPIDefinition.FormDataParameterSubSchema.Tin);
      procedure SetType(const Value: TOpenAPIDefinition.FormDataParameterSubSchema.Ttype);
      procedure SetCollectionFormat(const Value: TOpenAPIDefinition.CollectionFormatWithMulti);
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
      property &in: TOpenAPIDefinition.FormDataParameterSubSchema.Tin read FIn write SetIn stored FInIsStored;
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      property name: System.String read FName write FName stored GetNameStored;
      property allowEmptyValue: System.Boolean read FAllowEmptyValue write FAllowEmptyValue stored GetAllowEmptyValueStored;
      [FieldName('type')]
      property &type: TOpenAPIDefinition.FormDataParameterSubSchema.Ttype read FType write SetType stored FTypeIsStored;
      property format: System.String read FFormat write FFormat stored GetFormatStored;
      property items: TOpenAPIDefinition.PrimitivesItems read GetItems write FItems stored GetItemsStored;
      property collectionFormat: TOpenAPIDefinition.CollectionFormatWithMulti read FCollectionFormat write SetCollectionFormat stored FCollectionFormatIsStored;
      property default: TOpenAPIDefinition.default read FDefault write FDefault stored GetDefaultStored;
      property maximum: TOpenAPIDefinition.maximum read FMaximum write FMaximum stored GetMaximumStored;
      property exclusiveMaximum: TOpenAPIDefinition.exclusiveMaximum read FExclusiveMaximum write FExclusiveMaximum stored GetExclusiveMaximumStored;
      property minimum: TOpenAPIDefinition.minimum read FMinimum write FMinimum stored GetMinimumStored;
      property exclusiveMinimum: TOpenAPIDefinition.exclusiveMinimum read FExclusiveMinimum write FExclusiveMinimum stored GetExclusiveMinimumStored;
      property maxLength: TOpenAPIDefinition.maxLength read FMaxLength write FMaxLength stored GetMaxLengthStored;
      property minLength: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0 read GetMinLength write FMinLength stored GetMinLengthStored;
      property pattern: TOpenAPIDefinition.pattern read FPattern write FPattern stored GetPatternStored;
      property maxItems: TOpenAPIDefinition.maxItems read FMaxItems write FMaxItems stored GetMaxItemsStored;
      property minItems: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0 read GetMinItems write FMinItems stored GetMinItemsStored;
      property uniqueItems: TOpenAPIDefinition.uniqueItems read FUniqueItems write FUniqueItems stored GetUniqueItemsStored;
      property enum: TOpenAPIDefinition.enum read FEnum write FEnum stored GetEnumStored;
      property multipleOf: TOpenAPIDefinition.multipleOf read FMultipleOf write FMultipleOf stored GetMultipleOfStored;
      [PatternProperty('^x-')]
      property vendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
    end;

    PathParameterSubSchema = class
    public type
      Trequired = (True);

      Tin = (path);

      [EnumValue('string, number, boolean, integer, array')]
      Ttype = (&string, number, boolean, integer, &array);
    private
      FRequired: TOpenAPIDefinition.PathParameterSubSchema.Trequired;
      FIn: TOpenAPIDefinition.PathParameterSubSchema.Tin;
      FDescription: System.String;
      FName: System.String;
      FType: TOpenAPIDefinition.PathParameterSubSchema.Ttype;
      FFormat: System.String;
      FItems: TOpenAPIDefinition.PrimitivesItems;
      FCollectionFormat: TOpenAPIDefinition.CollectionFormat;
      FDefault: TOpenAPIDefinition.default;
      FMaximum: TOpenAPIDefinition.maximum;
      FExclusiveMaximum: TOpenAPIDefinition.exclusiveMaximum;
      FMinimum: TOpenAPIDefinition.minimum;
      FExclusiveMinimum: TOpenAPIDefinition.exclusiveMinimum;
      FMaxLength: TOpenAPIDefinition.maxLength;
      FMinLength: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0;
      FPattern: TOpenAPIDefinition.pattern;
      FMaxItems: TOpenAPIDefinition.maxItems;
      FMinItems: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0;
      FUniqueItems: TOpenAPIDefinition.uniqueItems;
      FEnum: TOpenAPIDefinition.enum;
      FMultipleOf: TOpenAPIDefinition.multipleOf;
      FVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
      FInIsStored: Boolean;
      FTypeIsStored: Boolean;
      FCollectionFormatIsStored: Boolean;

      function GetItems: TOpenAPIDefinition.PrimitivesItems;
      function GetMinLength: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0;
      function GetMinItems: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0;
      function GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
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
      procedure SetIn(const Value: TOpenAPIDefinition.PathParameterSubSchema.Tin);
      procedure SetType(const Value: TOpenAPIDefinition.PathParameterSubSchema.Ttype);
      procedure SetCollectionFormat(const Value: TOpenAPIDefinition.CollectionFormat);
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
      property required: TOpenAPIDefinition.PathParameterSubSchema.Trequired read FRequired write FRequired;
      [FieldName('in')]
      property &in: TOpenAPIDefinition.PathParameterSubSchema.Tin read FIn write SetIn stored FInIsStored;
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      property name: System.String read FName write FName stored GetNameStored;
      [FieldName('type')]
      property &type: TOpenAPIDefinition.PathParameterSubSchema.Ttype read FType write SetType stored FTypeIsStored;
      property format: System.String read FFormat write FFormat stored GetFormatStored;
      property items: TOpenAPIDefinition.PrimitivesItems read GetItems write FItems stored GetItemsStored;
      property collectionFormat: TOpenAPIDefinition.CollectionFormat read FCollectionFormat write SetCollectionFormat stored FCollectionFormatIsStored;
      property default: TOpenAPIDefinition.default read FDefault write FDefault stored GetDefaultStored;
      property maximum: TOpenAPIDefinition.maximum read FMaximum write FMaximum stored GetMaximumStored;
      property exclusiveMaximum: TOpenAPIDefinition.exclusiveMaximum read FExclusiveMaximum write FExclusiveMaximum stored GetExclusiveMaximumStored;
      property minimum: TOpenAPIDefinition.minimum read FMinimum write FMinimum stored GetMinimumStored;
      property exclusiveMinimum: TOpenAPIDefinition.exclusiveMinimum read FExclusiveMinimum write FExclusiveMinimum stored GetExclusiveMinimumStored;
      property maxLength: TOpenAPIDefinition.maxLength read FMaxLength write FMaxLength stored GetMaxLengthStored;
      property minLength: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0 read GetMinLength write FMinLength stored GetMinLengthStored;
      property pattern: TOpenAPIDefinition.pattern read FPattern write FPattern stored GetPatternStored;
      property maxItems: TOpenAPIDefinition.maxItems read FMaxItems write FMaxItems stored GetMaxItemsStored;
      property minItems: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0 read GetMinItems write FMinItems stored GetMinItemsStored;
      property uniqueItems: TOpenAPIDefinition.uniqueItems read FUniqueItems write FUniqueItems stored GetUniqueItemsStored;
      property enum: TOpenAPIDefinition.enum read FEnum write FEnum stored GetEnumStored;
      property multipleOf: TOpenAPIDefinition.multipleOf read FMultipleOf write FMultipleOf stored GetMultipleOfStored;
      [PatternProperty('^x-')]
      property vendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
    end;

    [Flat('in')]
    NonBodyParameter = class
    private
      FHeaderParameterSubSchema: TOpenAPIDefinition.HeaderParameterSubSchema;
      FFormDataParameterSubSchema: TOpenAPIDefinition.FormDataParameterSubSchema;
      FQueryParameterSubSchema: TOpenAPIDefinition.QueryParameterSubSchema;
      FPathParameterSubSchema: TOpenAPIDefinition.PathParameterSubSchema;

      function GetHeaderParameterSubSchema: TOpenAPIDefinition.HeaderParameterSubSchema;
      function GetFormDataParameterSubSchema: TOpenAPIDefinition.FormDataParameterSubSchema;
      function GetQueryParameterSubSchema: TOpenAPIDefinition.QueryParameterSubSchema;
      function GetPathParameterSubSchema: TOpenAPIDefinition.PathParameterSubSchema;
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
      property headerParameterSubSchema: TOpenAPIDefinition.HeaderParameterSubSchema read GetHeaderParameterSubSchema write FHeaderParameterSubSchema stored GetHeaderParameterSubSchemaStored;
      property formDataParameterSubSchema: TOpenAPIDefinition.FormDataParameterSubSchema read GetFormDataParameterSubSchema write FFormDataParameterSubSchema stored GetFormDataParameterSubSchemaStored;
      property queryParameterSubSchema: TOpenAPIDefinition.QueryParameterSubSchema read GetQueryParameterSubSchema write FQueryParameterSubSchema stored GetQueryParameterSubSchemaStored;
      property pathParameterSubSchema: TOpenAPIDefinition.PathParameterSubSchema read GetPathParameterSubSchema write FPathParameterSubSchema stored GetPathParameterSubSchemaStored;
    end;

    [Flat('in')]
    Parameter = class
    private
      FBodyParameter: TOpenAPIDefinition.BodyParameter;
      FNonBodyParameter: TOpenAPIDefinition.NonBodyParameter;

      function GetBodyParameter: TOpenAPIDefinition.BodyParameter;
      function GetNonBodyParameter: TOpenAPIDefinition.NonBodyParameter;
      function GetBodyParameterStored: Boolean;
      function GetNonBodyParameterStored: Boolean;
    public
      destructor Destroy; override;

      property IsBodyParameterStored: Boolean read GetBodyParameterStored;
      property IsNonBodyParameterStored: Boolean read GetNonBodyParameterStored;
    published
      property bodyParameter: TOpenAPIDefinition.BodyParameter read GetBodyParameter write FBodyParameter stored GetBodyParameterStored;
      property nonBodyParameter: TOpenAPIDefinition.NonBodyParameter read GetNonBodyParameter write FNonBodyParameter stored GetNonBodyParameterStored;
    end;

    Schema = class
    public type
      // Forward class declaration
      TadditionalProperties = class;
      Titems = class;
      Tproperties = class;

      [Flat]
      TadditionalProperties = class
      private
        FSchema: TOpenAPIDefinition.Schema;
        FBoolean: System.Boolean;

        function GetSchema: TOpenAPIDefinition.Schema;
        function GetSchemaStored: Boolean;
        function GetBooleanStored: Boolean;
      public
        destructor Destroy; override;

        property IsSchemaStored: Boolean read GetSchemaStored;
        property IsBooleanStored: Boolean read GetBooleanStored;
      published
        property schema: TOpenAPIDefinition.Schema read GetSchema write FSchema stored GetSchemaStored;
        property boolean: System.Boolean read FBoolean write FBoolean stored GetBooleanStored;
      end;

      [Flat]
      Titems = class
      private
        FSchema: TOpenAPIDefinition.Schema;
        FArray: TArray<TOpenAPIDefinition.Schema>;

        function GetSchema: TOpenAPIDefinition.Schema;
        function GetSchemaStored: Boolean;
        function GetArrayStored: Boolean;
      public
        destructor Destroy; override;

        function AddArray: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Schema;

        property IsSchemaStored: Boolean read GetSchemaStored;
        property IsArrayStored: Boolean read GetArrayStored;
      published
        property schema: TOpenAPIDefinition.Schema read GetSchema write FSchema stored GetSchemaStored;
        [FieldName('array')]
        property &array: TArray<TOpenAPIDefinition.Schema> read FArray write FArray stored GetArrayStored;
      end;

      Tproperties = class
      private
        FAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Schema>;

        function GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Schema>;
        function GetAdditionalPropertiesStored: Boolean;
      public
        destructor Destroy; override;

        property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
      published
        property additionalProperties: TDynamicProperty<TOpenAPIDefinition.Schema> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
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
      FMinLength: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0;
      FPattern: System.String;
      FMaxItems: Blue.Print.JSON.Draft4.Schema.Schema.positiveInteger;
      FMinItems: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0;
      FUniqueItems: System.Boolean;
      FMaxProperties: Blue.Print.JSON.Draft4.Schema.Schema.positiveInteger;
      FMinProperties: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0;
      FRequired: Blue.Print.JSON.Draft4.Schema.Schema.stringArray;
      FEnum: TArray<Blue.Print.JSON.Draft4.Schema.any>;
      FAdditionalProperties: TOpenAPIDefinition.Schema.TadditionalProperties;
      FType: Blue.Print.JSON.Draft4.Schema.Schema.Schema.Ttype;
      FItems: TOpenAPIDefinition.Schema.Titems;
      FAllOf: TArray<TOpenAPIDefinition.Schema>;
      FProperties: TOpenAPIDefinition.Schema.Tproperties;
      FDiscriminator: System.String;
      FReadOnly: System.Boolean;
      FXml: TOpenAPIDefinition.Xml;
      FExternalDocs: TOpenAPIDefinition.ExternalDocs;
      FExample: any;
      FVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;

      function GetMinLength: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0;
      function GetMinItems: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0;
      function GetMinProperties: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0;
      function GetAdditionalProperties: TOpenAPIDefinition.Schema.TadditionalProperties;
      function GetType: Blue.Print.JSON.Draft4.Schema.Schema.Schema.Ttype;
      function GetItems: TOpenAPIDefinition.Schema.Titems;
      function GetProperties: TOpenAPIDefinition.Schema.Tproperties;
      function GetXml: TOpenAPIDefinition.Xml;
      function GetExternalDocs: TOpenAPIDefinition.ExternalDocs;
      function GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
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

      function AddAllOf: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Schema;

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
      property Ref: System.String read FRef write FRef stored GetRefStored;
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
      property minLength: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0 read GetMinLength write FMinLength stored GetMinLengthStored;
      property pattern: System.String read FPattern write FPattern stored GetPatternStored;
      property maxItems: Blue.Print.JSON.Draft4.Schema.Schema.positiveInteger read FMaxItems write FMaxItems stored GetMaxItemsStored;
      property minItems: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0 read GetMinItems write FMinItems stored GetMinItemsStored;
      property uniqueItems: System.Boolean read FUniqueItems write FUniqueItems stored GetUniqueItemsStored;
      property maxProperties: Blue.Print.JSON.Draft4.Schema.Schema.positiveInteger read FMaxProperties write FMaxProperties stored GetMaxPropertiesStored;
      property minProperties: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0 read GetMinProperties write FMinProperties stored GetMinPropertiesStored;
      property required: Blue.Print.JSON.Draft4.Schema.Schema.stringArray read FRequired write FRequired stored GetRequiredStored;
      property enum: TArray<Blue.Print.JSON.Draft4.Schema.any> read FEnum write FEnum stored GetEnumStored;
      property additionalProperties: TOpenAPIDefinition.Schema.TadditionalProperties read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
      [FieldName('type')]
      property &type: Blue.Print.JSON.Draft4.Schema.Schema.Schema.Ttype read GetType write FType stored GetTypeStored;
      property items: TOpenAPIDefinition.Schema.Titems read GetItems write FItems stored GetItemsStored;
      property allOf: TArray<TOpenAPIDefinition.Schema> read FAllOf write FAllOf stored GetAllOfStored;
      property properties: TOpenAPIDefinition.Schema.Tproperties read GetProperties write FProperties stored GetPropertiesStored;
      property discriminator: System.String read FDiscriminator write FDiscriminator stored GetDiscriminatorStored;
      property readOnly: System.Boolean read FReadOnly write FReadOnly stored GetReadOnlyStored;
      property xml: TOpenAPIDefinition.Xml read GetXml write FXml stored GetXmlStored;
      property externalDocs: TOpenAPIDefinition.ExternalDocs read GetExternalDocs write FExternalDocs stored GetExternalDocsStored;
      property example: any read FExample write FExample stored GetExampleStored;
      [PatternProperty('^x-')]
      property vendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
    end;

    FileSchema = class
    public type
      [EnumValue('file')]
      Ttype = (&file);
    private
      FFormat: System.String;
      FTitle: System.String;
      FDescription: System.String;
      FDefault: Blue.Print.JSON.Draft4.Schema.any;
      FRequired: Blue.Print.JSON.Draft4.Schema.Schema.stringArray;
      FType: TOpenAPIDefinition.FileSchema.Ttype;
      FReadOnly: System.Boolean;
      FExternalDocs: TOpenAPIDefinition.ExternalDocs;
      FExample: any;
      FVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;

      function GetExternalDocs: TOpenAPIDefinition.ExternalDocs;
      function GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
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
      property &type: TOpenAPIDefinition.FileSchema.Ttype read FType write FType;
      property readOnly: System.Boolean read FReadOnly write FReadOnly stored GetReadOnlyStored;
      property externalDocs: TOpenAPIDefinition.ExternalDocs read GetExternalDocs write FExternalDocs stored GetExternalDocsStored;
      property example: any read FExample write FExample stored GetExampleStored;
      [PatternProperty('^x-')]
      property vendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
    end;

    PrimitivesItems = class
    public type
      [EnumValue('string, number, integer, boolean, array')]
      Ttype = (&string, number, integer, boolean, &array);
    private
      FType: TOpenAPIDefinition.PrimitivesItems.Ttype;
      FFormat: System.String;
      FItems: TOpenAPIDefinition.PrimitivesItems;
      FCollectionFormat: TOpenAPIDefinition.CollectionFormat;
      FDefault: TOpenAPIDefinition.default;
      FMaximum: TOpenAPIDefinition.maximum;
      FExclusiveMaximum: TOpenAPIDefinition.exclusiveMaximum;
      FMinimum: TOpenAPIDefinition.minimum;
      FExclusiveMinimum: TOpenAPIDefinition.exclusiveMinimum;
      FMaxLength: TOpenAPIDefinition.maxLength;
      FMinLength: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0;
      FPattern: TOpenAPIDefinition.pattern;
      FMaxItems: TOpenAPIDefinition.maxItems;
      FMinItems: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0;
      FUniqueItems: TOpenAPIDefinition.uniqueItems;
      FEnum: TOpenAPIDefinition.enum;
      FMultipleOf: TOpenAPIDefinition.multipleOf;
      FVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
      FTypeIsStored: Boolean;
      FCollectionFormatIsStored: Boolean;

      function GetItems: TOpenAPIDefinition.PrimitivesItems;
      function GetMinLength: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0;
      function GetMinItems: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0;
      function GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
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
      procedure SetType(const Value: TOpenAPIDefinition.PrimitivesItems.Ttype);
      procedure SetCollectionFormat(const Value: TOpenAPIDefinition.CollectionFormat);
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
      property &type: TOpenAPIDefinition.PrimitivesItems.Ttype read FType write SetType stored FTypeIsStored;
      property format: System.String read FFormat write FFormat stored GetFormatStored;
      property items: TOpenAPIDefinition.PrimitivesItems read GetItems write FItems stored GetItemsStored;
      property collectionFormat: TOpenAPIDefinition.CollectionFormat read FCollectionFormat write SetCollectionFormat stored FCollectionFormatIsStored;
      property default: TOpenAPIDefinition.default read FDefault write FDefault stored GetDefaultStored;
      property maximum: TOpenAPIDefinition.maximum read FMaximum write FMaximum stored GetMaximumStored;
      property exclusiveMaximum: TOpenAPIDefinition.exclusiveMaximum read FExclusiveMaximum write FExclusiveMaximum stored GetExclusiveMaximumStored;
      property minimum: TOpenAPIDefinition.minimum read FMinimum write FMinimum stored GetMinimumStored;
      property exclusiveMinimum: TOpenAPIDefinition.exclusiveMinimum read FExclusiveMinimum write FExclusiveMinimum stored GetExclusiveMinimumStored;
      property maxLength: TOpenAPIDefinition.maxLength read FMaxLength write FMaxLength stored GetMaxLengthStored;
      property minLength: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0 read GetMinLength write FMinLength stored GetMinLengthStored;
      property pattern: TOpenAPIDefinition.pattern read FPattern write FPattern stored GetPatternStored;
      property maxItems: TOpenAPIDefinition.maxItems read FMaxItems write FMaxItems stored GetMaxItemsStored;
      property minItems: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0 read GetMinItems write FMinItems stored GetMinItemsStored;
      property uniqueItems: TOpenAPIDefinition.uniqueItems read FUniqueItems write FUniqueItems stored GetUniqueItemsStored;
      property enum: TOpenAPIDefinition.enum read FEnum write FEnum stored GetEnumStored;
      property multipleOf: TOpenAPIDefinition.multipleOf read FMultipleOf write FMultipleOf stored GetMultipleOfStored;
      [PatternProperty('^x-')]
      property vendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
    end;

    SecurityRequirement = class
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

    Xml = class
    private
      FName: System.String;
      FNamespace: System.String;
      FPrefix: System.String;
      FAttribute: System.Boolean;
      FWrapped: System.Boolean;
      FVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;

      function GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
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
      property vendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
    end;

    Tag = class
    private
      FName: System.String;
      FDescription: System.String;
      FExternalDocs: TOpenAPIDefinition.ExternalDocs;
      FVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;

      function GetExternalDocs: TOpenAPIDefinition.ExternalDocs;
      function GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
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
      property externalDocs: TOpenAPIDefinition.ExternalDocs read GetExternalDocs write FExternalDocs stored GetExternalDocsStored;
      [PatternProperty('^x-')]
      property vendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
    end;

    SecurityDefinitions = class
    public type
      // Forward class declaration
      TadditionalProperties = class;

      [Flat]
      TadditionalProperties = class
      private
        FBasicAuthenticationSecurity: TOpenAPIDefinition.BasicAuthenticationSecurity;
        FApiKeySecurity: TOpenAPIDefinition.ApiKeySecurity;
        FOauth2ImplicitSecurity: TOpenAPIDefinition.Oauth2ImplicitSecurity;
        FOauth2PasswordSecurity: TOpenAPIDefinition.Oauth2PasswordSecurity;
        FOauth2ApplicationSecurity: TOpenAPIDefinition.Oauth2ApplicationSecurity;
        FOauth2AccessCodeSecurity: TOpenAPIDefinition.Oauth2AccessCodeSecurity;

        function GetBasicAuthenticationSecurity: TOpenAPIDefinition.BasicAuthenticationSecurity;
        function GetApiKeySecurity: TOpenAPIDefinition.ApiKeySecurity;
        function GetOauth2ImplicitSecurity: TOpenAPIDefinition.Oauth2ImplicitSecurity;
        function GetOauth2PasswordSecurity: TOpenAPIDefinition.Oauth2PasswordSecurity;
        function GetOauth2ApplicationSecurity: TOpenAPIDefinition.Oauth2ApplicationSecurity;
        function GetOauth2AccessCodeSecurity: TOpenAPIDefinition.Oauth2AccessCodeSecurity;
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
        property basicAuthenticationSecurity: TOpenAPIDefinition.BasicAuthenticationSecurity read GetBasicAuthenticationSecurity write FBasicAuthenticationSecurity stored GetBasicAuthenticationSecurityStored;
        property apiKeySecurity: TOpenAPIDefinition.ApiKeySecurity read GetApiKeySecurity write FApiKeySecurity stored GetApiKeySecurityStored;
        property oauth2ImplicitSecurity: TOpenAPIDefinition.Oauth2ImplicitSecurity read GetOauth2ImplicitSecurity write FOauth2ImplicitSecurity stored GetOauth2ImplicitSecurityStored;
        property oauth2PasswordSecurity: TOpenAPIDefinition.Oauth2PasswordSecurity read GetOauth2PasswordSecurity write FOauth2PasswordSecurity stored GetOauth2PasswordSecurityStored;
        property oauth2ApplicationSecurity: TOpenAPIDefinition.Oauth2ApplicationSecurity read GetOauth2ApplicationSecurity write FOauth2ApplicationSecurity stored GetOauth2ApplicationSecurityStored;
        property oauth2AccessCodeSecurity: TOpenAPIDefinition.Oauth2AccessCodeSecurity read GetOauth2AccessCodeSecurity write FOauth2AccessCodeSecurity stored GetOauth2AccessCodeSecurityStored;
      end;
    private
      FBasicAuthenticationSecurity: TOpenAPIDefinition.BasicAuthenticationSecurity;
      FApiKeySecurity: TOpenAPIDefinition.ApiKeySecurity;
      FOauth2ImplicitSecurity: TOpenAPIDefinition.Oauth2ImplicitSecurity;
      FOauth2PasswordSecurity: TOpenAPIDefinition.Oauth2PasswordSecurity;
      FOauth2ApplicationSecurity: TOpenAPIDefinition.Oauth2ApplicationSecurity;
      FOauth2AccessCodeSecurity: TOpenAPIDefinition.Oauth2AccessCodeSecurity;
      FAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.SecurityDefinitions.TadditionalProperties>;

      function GetBasicAuthenticationSecurity: TOpenAPIDefinition.BasicAuthenticationSecurity;
      function GetApiKeySecurity: TOpenAPIDefinition.ApiKeySecurity;
      function GetOauth2ImplicitSecurity: TOpenAPIDefinition.Oauth2ImplicitSecurity;
      function GetOauth2PasswordSecurity: TOpenAPIDefinition.Oauth2PasswordSecurity;
      function GetOauth2ApplicationSecurity: TOpenAPIDefinition.Oauth2ApplicationSecurity;
      function GetOauth2AccessCodeSecurity: TOpenAPIDefinition.Oauth2AccessCodeSecurity;
      function GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.SecurityDefinitions.TadditionalProperties>;
      function GetBasicAuthenticationSecurityStored: Boolean;
      function GetApiKeySecurityStored: Boolean;
      function GetOauth2ImplicitSecurityStored: Boolean;
      function GetOauth2PasswordSecurityStored: Boolean;
      function GetOauth2ApplicationSecurityStored: Boolean;
      function GetOauth2AccessCodeSecurityStored: Boolean;
      function GetAdditionalPropertiesStored: Boolean;
    public
      destructor Destroy; override;

      property IsBasicAuthenticationSecurityStored: Boolean read GetBasicAuthenticationSecurityStored;
      property IsApiKeySecurityStored: Boolean read GetApiKeySecurityStored;
      property IsOauth2ImplicitSecurityStored: Boolean read GetOauth2ImplicitSecurityStored;
      property IsOauth2PasswordSecurityStored: Boolean read GetOauth2PasswordSecurityStored;
      property IsOauth2ApplicationSecurityStored: Boolean read GetOauth2ApplicationSecurityStored;
      property IsOauth2AccessCodeSecurityStored: Boolean read GetOauth2AccessCodeSecurityStored;
      property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
    published
      property basicAuthenticationSecurity: TOpenAPIDefinition.BasicAuthenticationSecurity read GetBasicAuthenticationSecurity write FBasicAuthenticationSecurity stored GetBasicAuthenticationSecurityStored;
      property apiKeySecurity: TOpenAPIDefinition.ApiKeySecurity read GetApiKeySecurity write FApiKeySecurity stored GetApiKeySecurityStored;
      property oauth2ImplicitSecurity: TOpenAPIDefinition.Oauth2ImplicitSecurity read GetOauth2ImplicitSecurity write FOauth2ImplicitSecurity stored GetOauth2ImplicitSecurityStored;
      property oauth2PasswordSecurity: TOpenAPIDefinition.Oauth2PasswordSecurity read GetOauth2PasswordSecurity write FOauth2PasswordSecurity stored GetOauth2PasswordSecurityStored;
      property oauth2ApplicationSecurity: TOpenAPIDefinition.Oauth2ApplicationSecurity read GetOauth2ApplicationSecurity write FOauth2ApplicationSecurity stored GetOauth2ApplicationSecurityStored;
      property oauth2AccessCodeSecurity: TOpenAPIDefinition.Oauth2AccessCodeSecurity read GetOauth2AccessCodeSecurity write FOauth2AccessCodeSecurity stored GetOauth2AccessCodeSecurityStored;
      property additionalProperties: TDynamicProperty<TOpenAPIDefinition.SecurityDefinitions.TadditionalProperties> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
    end;

    BasicAuthenticationSecurity = class
    public type
      Ttype = (basic);
    private
      FType: TOpenAPIDefinition.BasicAuthenticationSecurity.Ttype;
      FDescription: System.String;
      FVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;

      function GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
      function GetDescriptionStored: Boolean;
      function GetVendorExtensionStored: Boolean;
    public
      destructor Destroy; override;

      property IsDescriptionStored: Boolean read GetDescriptionStored;
      property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
    published
      [FieldName('type')]
      property &type: TOpenAPIDefinition.BasicAuthenticationSecurity.Ttype read FType write FType;
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      [PatternProperty('^x-')]
      property vendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
    end;

    ApiKeySecurity = class
    public type
      Ttype = (apiKey);

      Tin = (header, query);
    private
      FType: TOpenAPIDefinition.ApiKeySecurity.Ttype;
      FName: System.String;
      FIn: TOpenAPIDefinition.ApiKeySecurity.Tin;
      FDescription: System.String;
      FVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;

      function GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
      function GetDescriptionStored: Boolean;
      function GetVendorExtensionStored: Boolean;
    public
      destructor Destroy; override;

      property IsDescriptionStored: Boolean read GetDescriptionStored;
      property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
    published
      [FieldName('type')]
      property &type: TOpenAPIDefinition.ApiKeySecurity.Ttype read FType write FType;
      property name: System.String read FName write FName;
      [FieldName('in')]
      property &in: TOpenAPIDefinition.ApiKeySecurity.Tin read FIn write FIn;
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      [PatternProperty('^x-')]
      property vendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
    end;

    Oauth2ImplicitSecurity = class
    public type
      Ttype = (oauth2);

      Tflow = (implicit);
    private
      FType: TOpenAPIDefinition.Oauth2ImplicitSecurity.Ttype;
      FFlow: TOpenAPIDefinition.Oauth2ImplicitSecurity.Tflow;
      FScopes: TOpenAPIDefinition.Oauth2Scopes;
      FAuthorizationUrl: System.String;
      FDescription: System.String;
      FVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;

      function GetScopes: TOpenAPIDefinition.Oauth2Scopes;
      function GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
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
      property &type: TOpenAPIDefinition.Oauth2ImplicitSecurity.Ttype read FType write FType;
      property flow: TOpenAPIDefinition.Oauth2ImplicitSecurity.Tflow read FFlow write FFlow;
      property scopes: TOpenAPIDefinition.Oauth2Scopes read GetScopes write FScopes stored GetScopesStored;
      property authorizationUrl: System.String read FAuthorizationUrl write FAuthorizationUrl;
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      [PatternProperty('^x-')]
      property vendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
    end;

    Oauth2PasswordSecurity = class
    public type
      Ttype = (oauth2);

      Tflow = (password);
    private
      FType: TOpenAPIDefinition.Oauth2PasswordSecurity.Ttype;
      FFlow: TOpenAPIDefinition.Oauth2PasswordSecurity.Tflow;
      FScopes: TOpenAPIDefinition.Oauth2Scopes;
      FTokenUrl: System.String;
      FDescription: System.String;
      FVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;

      function GetScopes: TOpenAPIDefinition.Oauth2Scopes;
      function GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
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
      property &type: TOpenAPIDefinition.Oauth2PasswordSecurity.Ttype read FType write FType;
      property flow: TOpenAPIDefinition.Oauth2PasswordSecurity.Tflow read FFlow write FFlow;
      property scopes: TOpenAPIDefinition.Oauth2Scopes read GetScopes write FScopes stored GetScopesStored;
      property tokenUrl: System.String read FTokenUrl write FTokenUrl;
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      [PatternProperty('^x-')]
      property vendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
    end;

    Oauth2ApplicationSecurity = class
    public type
      Ttype = (oauth2);

      Tflow = (application);
    private
      FType: TOpenAPIDefinition.Oauth2ApplicationSecurity.Ttype;
      FFlow: TOpenAPIDefinition.Oauth2ApplicationSecurity.Tflow;
      FScopes: TOpenAPIDefinition.Oauth2Scopes;
      FTokenUrl: System.String;
      FDescription: System.String;
      FVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;

      function GetScopes: TOpenAPIDefinition.Oauth2Scopes;
      function GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
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
      property &type: TOpenAPIDefinition.Oauth2ApplicationSecurity.Ttype read FType write FType;
      property flow: TOpenAPIDefinition.Oauth2ApplicationSecurity.Tflow read FFlow write FFlow;
      property scopes: TOpenAPIDefinition.Oauth2Scopes read GetScopes write FScopes stored GetScopesStored;
      property tokenUrl: System.String read FTokenUrl write FTokenUrl;
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      [PatternProperty('^x-')]
      property vendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
    end;

    Oauth2AccessCodeSecurity = class
    public type
      Ttype = (oauth2);

      Tflow = (accessCode);
    private
      FType: TOpenAPIDefinition.Oauth2AccessCodeSecurity.Ttype;
      FFlow: TOpenAPIDefinition.Oauth2AccessCodeSecurity.Tflow;
      FScopes: TOpenAPIDefinition.Oauth2Scopes;
      FAuthorizationUrl: System.String;
      FTokenUrl: System.String;
      FDescription: System.String;
      FVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;

      function GetScopes: TOpenAPIDefinition.Oauth2Scopes;
      function GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
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
      property &type: TOpenAPIDefinition.Oauth2AccessCodeSecurity.Ttype read FType write FType;
      property flow: TOpenAPIDefinition.Oauth2AccessCodeSecurity.Tflow read FFlow write FFlow;
      property scopes: TOpenAPIDefinition.Oauth2Scopes read GetScopes write FScopes stored GetScopesStored;
      property authorizationUrl: System.String read FAuthorizationUrl write FAuthorizationUrl;
      property tokenUrl: System.String read FTokenUrl write FTokenUrl;
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      [PatternProperty('^x-')]
      property vendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
    end;

    Oauth2Scopes = class
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
    ParametersListArrayItem = class
    private
      FParameter: TOpenAPIDefinition.Parameter;
      FJsonReference: TOpenAPIDefinition.JsonReference;

      function GetParameter: TOpenAPIDefinition.Parameter;
      function GetJsonReference: TOpenAPIDefinition.JsonReference;
      function GetParameterStored: Boolean;
      function GetJsonReferenceStored: Boolean;
    public
      destructor Destroy; override;

      property IsParameterStored: Boolean read GetParameterStored;
      property IsJsonReferenceStored: Boolean read GetJsonReferenceStored;
    published
      property parameter: TOpenAPIDefinition.Parameter read GetParameter write FParameter stored GetParameterStored;
      property jsonReference: TOpenAPIDefinition.JsonReference read GetJsonReference write FJsonReference stored GetJsonReferenceStored;
    end;

    JsonReference = class
    private
      FRef: System.String;
    published
      [FieldName('$ref')]
      property Ref: System.String read FRef write FRef;
    end;

    TOpenAPIDefinition = class
    public type
      [EnumValue('2.0')]
      Tswagger = (t20);

      // Forward class declaration
      Tconsumes = class;
      Tproduces = class;

      [Flat]
      Tconsumes = class
      private
        FMediaTypeList: TOpenAPIDefinition.mediaTypeList;

        function GetMediaTypeListStored: Boolean;
      public
        property IsMediaTypeListStored: Boolean read GetMediaTypeListStored;
      published
        property mediaTypeList: TOpenAPIDefinition.mediaTypeList read FMediaTypeList write FMediaTypeList stored GetMediaTypeListStored;
      end;

      [Flat]
      Tproduces = class
      private
        FMediaTypeList: TOpenAPIDefinition.mediaTypeList;

        function GetMediaTypeListStored: Boolean;
      public
        property IsMediaTypeListStored: Boolean read GetMediaTypeListStored;
      published
        property mediaTypeList: TOpenAPIDefinition.mediaTypeList read FMediaTypeList write FMediaTypeList stored GetMediaTypeListStored;
      end;
    private
      FSwagger: TOpenAPIDefinition.TOpenAPIDefinition.Tswagger;
      FInfo: TOpenAPIDefinition.Info;
      FHost: System.String;
      FBasePath: System.String;
      FSchemes: TOpenAPIDefinition.schemesList;
      FConsumes: TOpenAPIDefinition.TOpenAPIDefinition.Tconsumes;
      FProduces: TOpenAPIDefinition.TOpenAPIDefinition.Tproduces;
      FPaths: TOpenAPIDefinition.Paths;
      FDefinitions: TOpenAPIDefinition.Definitions;
      FParameters: TOpenAPIDefinition.ParameterDefinitions;
      FResponses: TOpenAPIDefinition.ResponseDefinitions;
      FSecurity: TOpenAPIDefinition.security;
      FSecurityDefinitions: TOpenAPIDefinition.SecurityDefinitions;
      FTags: TArray<TOpenAPIDefinition.Tag>;
      FExternalDocs: TOpenAPIDefinition.ExternalDocs;
      FVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;

      function GetInfo: TOpenAPIDefinition.Info;
      function GetConsumes: TOpenAPIDefinition.TOpenAPIDefinition.Tconsumes;
      function GetProduces: TOpenAPIDefinition.TOpenAPIDefinition.Tproduces;
      function GetPaths: TOpenAPIDefinition.Paths;
      function GetDefinitions: TOpenAPIDefinition.Definitions;
      function GetParameters: TOpenAPIDefinition.ParameterDefinitions;
      function GetResponses: TOpenAPIDefinition.ResponseDefinitions;
      function GetSecurityDefinitions: TOpenAPIDefinition.SecurityDefinitions;
      function GetExternalDocs: TOpenAPIDefinition.ExternalDocs;
      function GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
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

      function AddSecurity: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.SecurityRequirement;
      function AddTags: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Tag;

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
      property swagger: TOpenAPIDefinition.TOpenAPIDefinition.Tswagger read FSwagger write FSwagger;
      property info: TOpenAPIDefinition.Info read GetInfo write FInfo;
      property host: System.String read FHost write FHost stored GetHostStored;
      property basePath: System.String read FBasePath write FBasePath stored GetBasePathStored;
      property schemes: TOpenAPIDefinition.schemesList read FSchemes write FSchemes stored GetSchemesStored;
      property consumes: TOpenAPIDefinition.TOpenAPIDefinition.Tconsumes read GetConsumes write FConsumes stored GetConsumesStored;
      property produces: TOpenAPIDefinition.TOpenAPIDefinition.Tproduces read GetProduces write FProduces stored GetProducesStored;
      property paths: TOpenAPIDefinition.Paths read GetPaths write FPaths;
      property definitions: TOpenAPIDefinition.Definitions read GetDefinitions write FDefinitions stored GetDefinitionsStored;
      property parameters: TOpenAPIDefinition.ParameterDefinitions read GetParameters write FParameters stored GetParametersStored;
      property responses: TOpenAPIDefinition.ResponseDefinitions read GetResponses write FResponses stored GetResponsesStored;
      property security: TOpenAPIDefinition.security read FSecurity write FSecurity stored GetSecurityStored;
      property securityDefinitions: TOpenAPIDefinition.SecurityDefinitions read GetSecurityDefinitions write FSecurityDefinitions stored GetSecurityDefinitionsStored;
      property tags: TArray<TOpenAPIDefinition.Tag> read FTags write FTags stored GetTagsStored;
      property externalDocs: TOpenAPIDefinition.ExternalDocs read GetExternalDocs write FExternalDocs stored GetExternalDocsStored;
      [PatternProperty('^x-')]
      property vendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
    end;
  end;

implementation

uses System.SysUtils;

{ TOpenAPIDefinition.Info }

destructor TOpenAPIDefinition.Info.Destroy;
begin
  FContact.Free;

  FLicense.Free;

  FVendorExtension.Free;

  inherited;
end;

function TOpenAPIDefinition.Info.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.Info.GetTermsOfServiceStored: Boolean;
begin
  Result := not FTermsOfService.IsEmpty;
end;

function TOpenAPIDefinition.Info.GetContact: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Contact;
begin
  if not Assigned(FContact) then
    FContact := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Contact.Create;

  Result := FContact;
end;

function TOpenAPIDefinition.Info.GetContactStored: Boolean;
begin
  Result := Assigned(FContact);
end;

function TOpenAPIDefinition.Info.GetLicense: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.License;
begin
  if not Assigned(FLicense) then
    FLicense := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.License.Create;

  Result := FLicense;
end;

function TOpenAPIDefinition.Info.GetLicenseStored: Boolean;
begin
  Result := Assigned(FLicense);
end;

function TOpenAPIDefinition.Info.GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.VendorExtension>.Create;

  Result := FVendorExtension;
end;

function TOpenAPIDefinition.Info.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ TOpenAPIDefinition.Contact }

destructor TOpenAPIDefinition.Contact.Destroy;
begin
  FVendorExtension.Free;

  inherited;
end;

function TOpenAPIDefinition.Contact.GetNameStored: Boolean;
begin
  Result := not FName.IsEmpty;
end;

function TOpenAPIDefinition.Contact.GetUrlStored: Boolean;
begin
  Result := not FUrl.IsEmpty;
end;

function TOpenAPIDefinition.Contact.GetEmailStored: Boolean;
begin
  Result := not FEmail.IsEmpty;
end;

function TOpenAPIDefinition.Contact.GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.VendorExtension>.Create;

  Result := FVendorExtension;
end;

function TOpenAPIDefinition.Contact.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ TOpenAPIDefinition.License }

destructor TOpenAPIDefinition.License.Destroy;
begin
  FVendorExtension.Free;

  inherited;
end;

function TOpenAPIDefinition.License.GetUrlStored: Boolean;
begin
  Result := not FUrl.IsEmpty;
end;

function TOpenAPIDefinition.License.GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.VendorExtension>.Create;

  Result := FVendorExtension;
end;

function TOpenAPIDefinition.License.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ TOpenAPIDefinition.Paths }

destructor TOpenAPIDefinition.Paths.Destroy;
begin
  FVendorExtension.Free;

  FPathItem.Free;

  inherited;
end;

function TOpenAPIDefinition.Paths.GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.VendorExtension>.Create;

  Result := FVendorExtension;
end;

function TOpenAPIDefinition.Paths.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

function TOpenAPIDefinition.Paths.GetPathItem: TDynamicProperty<TOpenAPIDefinition.PathItem>;
begin
  if not Assigned(FPathItem) then
    FPathItem := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.PathItem>.Create;

  Result := FPathItem;
end;

function TOpenAPIDefinition.Paths.GetPathItemStored: Boolean;
begin
  Result := Assigned(FPathItem);
end;

{ TOpenAPIDefinition.Definitions }

destructor TOpenAPIDefinition.Definitions.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.Definitions.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Schema>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Schema>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.Definitions.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.ParameterDefinitions }

destructor TOpenAPIDefinition.ParameterDefinitions.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.ParameterDefinitions.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Parameter>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Parameter>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.ParameterDefinitions.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.ResponseDefinitions }

destructor TOpenAPIDefinition.ResponseDefinitions.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.ResponseDefinitions.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Response>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Response>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.ResponseDefinitions.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.ExternalDocs }

destructor TOpenAPIDefinition.ExternalDocs.Destroy;
begin
  FVendorExtension.Free;

  inherited;
end;

function TOpenAPIDefinition.ExternalDocs.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.ExternalDocs.GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.VendorExtension>.Create;

  Result := FVendorExtension;
end;

function TOpenAPIDefinition.ExternalDocs.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ TOpenAPIDefinition.Operation }

destructor TOpenAPIDefinition.Operation.Destroy;
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

function TOpenAPIDefinition.Operation.GetTagsStored: Boolean;
begin
  Result := Assigned(FTags);
end;

function TOpenAPIDefinition.Operation.GetSummaryStored: Boolean;
begin
  Result := not FSummary.IsEmpty;
end;

function TOpenAPIDefinition.Operation.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.Operation.GetExternalDocs: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.ExternalDocs;
begin
  if not Assigned(FExternalDocs) then
    FExternalDocs := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.ExternalDocs.Create;

  Result := FExternalDocs;
end;

function TOpenAPIDefinition.Operation.GetExternalDocsStored: Boolean;
begin
  Result := Assigned(FExternalDocs);
end;

function TOpenAPIDefinition.Operation.GetOperationIdStored: Boolean;
begin
  Result := not FOperationId.IsEmpty;
end;

function TOpenAPIDefinition.Operation.GetProduces: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Operation.Tproduces;
begin
  if not Assigned(FProduces) then
    FProduces := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Operation.Tproduces.Create;

  Result := FProduces;
end;

function TOpenAPIDefinition.Operation.GetProducesStored: Boolean;
begin
  Result := Assigned(FProduces);
end;

function TOpenAPIDefinition.Operation.GetConsumes: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Operation.Tconsumes;
begin
  if not Assigned(FConsumes) then
    FConsumes := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Operation.Tconsumes.Create;

  Result := FConsumes;
end;

function TOpenAPIDefinition.Operation.GetConsumesStored: Boolean;
begin
  Result := Assigned(FConsumes);
end;

function TOpenAPIDefinition.Operation.AddParameters: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.ParametersListArrayItem;
begin
  Result := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.ParametersListArrayItem.Create;

  FParameters := FParameters + [Result];
end;

function TOpenAPIDefinition.Operation.GetParametersStored: Boolean;
begin
  Result := Assigned(FParameters);
end;

function TOpenAPIDefinition.Operation.GetResponses: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Responses;
begin
  if not Assigned(FResponses) then
    FResponses := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Responses.Create;

  Result := FResponses;
end;

function TOpenAPIDefinition.Operation.GetSchemesStored: Boolean;
begin
  Result := Assigned(FSchemes);
end;

function TOpenAPIDefinition.Operation.GetDeprecatedStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.Operation.AddSecurity: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.SecurityRequirement;
begin
  Result := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.SecurityRequirement.Create;

  FSecurity := FSecurity + [Result];
end;

function TOpenAPIDefinition.Operation.GetSecurityStored: Boolean;
begin
  Result := Assigned(FSecurity);
end;

function TOpenAPIDefinition.Operation.GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.VendorExtension>.Create;

  Result := FVendorExtension;
end;

function TOpenAPIDefinition.Operation.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ TOpenAPIDefinition.Operation.Tproduces }

function TOpenAPIDefinition.Operation.Tproduces.GetMediaTypeListStored: Boolean;
begin
  Result := Assigned(FMediaTypeList);
end;

{ TOpenAPIDefinition.Operation.Tconsumes }

function TOpenAPIDefinition.Operation.Tconsumes.GetMediaTypeListStored: Boolean;
begin
  Result := Assigned(FMediaTypeList);
end;

{ TOpenAPIDefinition.PathItem }

destructor TOpenAPIDefinition.PathItem.Destroy;
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

function TOpenAPIDefinition.PathItem.GetRefStored: Boolean;
begin
  Result := not FRef.IsEmpty;
end;

function TOpenAPIDefinition.PathItem.GetGet: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Operation;
begin
  if not Assigned(FGet) then
    FGet := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Operation.Create;

  Result := FGet;
end;

function TOpenAPIDefinition.PathItem.GetGetStored: Boolean;
begin
  Result := Assigned(FGet);
end;

function TOpenAPIDefinition.PathItem.GetPut: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Operation;
begin
  if not Assigned(FPut) then
    FPut := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Operation.Create;

  Result := FPut;
end;

function TOpenAPIDefinition.PathItem.GetPutStored: Boolean;
begin
  Result := Assigned(FPut);
end;

function TOpenAPIDefinition.PathItem.GetPost: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Operation;
begin
  if not Assigned(FPost) then
    FPost := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Operation.Create;

  Result := FPost;
end;

function TOpenAPIDefinition.PathItem.GetPostStored: Boolean;
begin
  Result := Assigned(FPost);
end;

function TOpenAPIDefinition.PathItem.GetDelete: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Operation;
begin
  if not Assigned(FDelete) then
    FDelete := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Operation.Create;

  Result := FDelete;
end;

function TOpenAPIDefinition.PathItem.GetDeleteStored: Boolean;
begin
  Result := Assigned(FDelete);
end;

function TOpenAPIDefinition.PathItem.GetOptions: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Operation;
begin
  if not Assigned(FOptions) then
    FOptions := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Operation.Create;

  Result := FOptions;
end;

function TOpenAPIDefinition.PathItem.GetOptionsStored: Boolean;
begin
  Result := Assigned(FOptions);
end;

function TOpenAPIDefinition.PathItem.GetHead: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Operation;
begin
  if not Assigned(FHead) then
    FHead := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Operation.Create;

  Result := FHead;
end;

function TOpenAPIDefinition.PathItem.GetHeadStored: Boolean;
begin
  Result := Assigned(FHead);
end;

function TOpenAPIDefinition.PathItem.GetPatch: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Operation;
begin
  if not Assigned(FPatch) then
    FPatch := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Operation.Create;

  Result := FPatch;
end;

function TOpenAPIDefinition.PathItem.GetPatchStored: Boolean;
begin
  Result := Assigned(FPatch);
end;

function TOpenAPIDefinition.PathItem.AddParameters: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.ParametersListArrayItem;
begin
  Result := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.ParametersListArrayItem.Create;

  FParameters := FParameters + [Result];
end;

function TOpenAPIDefinition.PathItem.GetParametersStored: Boolean;
begin
  Result := Assigned(FParameters);
end;

function TOpenAPIDefinition.PathItem.GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.VendorExtension>.Create;

  Result := FVendorExtension;
end;

function TOpenAPIDefinition.PathItem.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ TOpenAPIDefinition.Responses }

destructor TOpenAPIDefinition.Responses.Destroy;
begin
  FResponseValue.Free;

  FVendorExtension.Free;

  inherited;
end;

function TOpenAPIDefinition.Responses.GetResponseValue: TDynamicProperty<TOpenAPIDefinition.ResponseValue>;
begin
  if not Assigned(FResponseValue) then
    FResponseValue := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.ResponseValue>.Create;

  Result := FResponseValue;
end;

function TOpenAPIDefinition.Responses.GetResponseValueStored: Boolean;
begin
  Result := Assigned(FResponseValue);
end;

function TOpenAPIDefinition.Responses.GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.VendorExtension>.Create;

  Result := FVendorExtension;
end;

function TOpenAPIDefinition.Responses.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ TOpenAPIDefinition.ResponseValue }

destructor TOpenAPIDefinition.ResponseValue.Destroy;
begin
  FResponse.Free;

  FJsonReference.Free;

  inherited;
end;

function TOpenAPIDefinition.ResponseValue.GetResponse: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Response;
begin
  if not Assigned(FResponse) then
    FResponse := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Response.Create;

  Result := FResponse;
end;

function TOpenAPIDefinition.ResponseValue.GetResponseStored: Boolean;
begin
  Result := Assigned(FResponse);
end;

function TOpenAPIDefinition.ResponseValue.GetJsonReference: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.JsonReference;
begin
  if not Assigned(FJsonReference) then
    FJsonReference := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.JsonReference.Create;

  Result := FJsonReference;
end;

function TOpenAPIDefinition.ResponseValue.GetJsonReferenceStored: Boolean;
begin
  Result := Assigned(FJsonReference);
end;

{ TOpenAPIDefinition.Response }

destructor TOpenAPIDefinition.Response.Destroy;
begin
  FSchema.Free;

  FHeaders.Free;

  FExamples.Free;

  FVendorExtension.Free;

  inherited;
end;

function TOpenAPIDefinition.Response.GetSchema: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Response.Tschema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Response.Tschema.Create;

  Result := FSchema;
end;

function TOpenAPIDefinition.Response.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function TOpenAPIDefinition.Response.GetHeaders: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Headers;
begin
  if not Assigned(FHeaders) then
    FHeaders := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Headers.Create;

  Result := FHeaders;
end;

function TOpenAPIDefinition.Response.GetHeadersStored: Boolean;
begin
  Result := Assigned(FHeaders);
end;

function TOpenAPIDefinition.Response.GetExamples: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Examples;
begin
  if not Assigned(FExamples) then
    FExamples := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Examples.Create;

  Result := FExamples;
end;

function TOpenAPIDefinition.Response.GetExamplesStored: Boolean;
begin
  Result := Assigned(FExamples);
end;

function TOpenAPIDefinition.Response.GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.VendorExtension>.Create;

  Result := FVendorExtension;
end;

function TOpenAPIDefinition.Response.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ TOpenAPIDefinition.Response.Tschema }

destructor TOpenAPIDefinition.Response.Tschema.Destroy;
begin
  FSchema.Free;

  FFileSchema.Free;

  inherited;
end;

function TOpenAPIDefinition.Response.Tschema.GetSchema: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Schema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Schema.Create;

  Result := FSchema;
end;

function TOpenAPIDefinition.Response.Tschema.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function TOpenAPIDefinition.Response.Tschema.GetFileSchema: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.FileSchema;
begin
  if not Assigned(FFileSchema) then
    FFileSchema := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.FileSchema.Create;

  Result := FFileSchema;
end;

function TOpenAPIDefinition.Response.Tschema.GetFileSchemaStored: Boolean;
begin
  Result := Assigned(FFileSchema);
end;

{ TOpenAPIDefinition.Headers }

destructor TOpenAPIDefinition.Headers.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.Headers.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Header>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Header>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.Headers.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.Header }

destructor TOpenAPIDefinition.Header.Destroy;
begin
  FItems.Free;

  FMinLength.Free;

  FMinItems.Free;

  FVendorExtension.Free;

  inherited;
end;

function TOpenAPIDefinition.Header.GetFormatStored: Boolean;
begin
  Result := not FFormat.IsEmpty;
end;

function TOpenAPIDefinition.Header.GetItems: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.PrimitivesItems;
begin
  if not Assigned(FItems) then
    FItems := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.PrimitivesItems.Create;

  Result := FItems;
end;

function TOpenAPIDefinition.Header.GetItemsStored: Boolean;
begin
  Result := Assigned(FItems);
end;

procedure TOpenAPIDefinition.Header.SetCollectionFormat(const Value: TOpenAPIDefinition.CollectionFormat);
begin
  FCollectionFormat := Value;
  FCollectionFormatIsStored := True;
end;

function TOpenAPIDefinition.Header.GetDefaultStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.Header.GetMaximumStored: Boolean;
begin
  Result := FMaximum <> 0;
end;

function TOpenAPIDefinition.Header.GetExclusiveMaximumStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.Header.GetMinimumStored: Boolean;
begin
  Result := FMinimum <> 0;
end;

function TOpenAPIDefinition.Header.GetExclusiveMinimumStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.Header.GetMaxLengthStored: Boolean;
begin
  Result := FMaxLength <> 0;
end;

function TOpenAPIDefinition.Header.GetMinLength: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0;
begin
  if not Assigned(FMinLength) then
    FMinLength := Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0.Create;

  Result := FMinLength;
end;

function TOpenAPIDefinition.Header.GetMinLengthStored: Boolean;
begin
  Result := Assigned(FMinLength);
end;

function TOpenAPIDefinition.Header.GetPatternStored: Boolean;
begin
  Result := not FPattern.IsEmpty;
end;

function TOpenAPIDefinition.Header.GetMaxItemsStored: Boolean;
begin
  Result := FMaxItems <> 0;
end;

function TOpenAPIDefinition.Header.GetMinItems: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0;
begin
  if not Assigned(FMinItems) then
    FMinItems := Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0.Create;

  Result := FMinItems;
end;

function TOpenAPIDefinition.Header.GetMinItemsStored: Boolean;
begin
  Result := Assigned(FMinItems);
end;

function TOpenAPIDefinition.Header.GetUniqueItemsStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.Header.GetEnumStored: Boolean;
begin
  Result := Assigned(FEnum);
end;

function TOpenAPIDefinition.Header.GetMultipleOfStored: Boolean;
begin
  Result := FMultipleOf <> 0;
end;

function TOpenAPIDefinition.Header.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.Header.GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.VendorExtension>.Create;

  Result := FVendorExtension;
end;

function TOpenAPIDefinition.Header.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ TOpenAPIDefinition.BodyParameter }

destructor TOpenAPIDefinition.BodyParameter.Destroy;
begin
  FSchema.Free;

  FVendorExtension.Free;

  inherited;
end;

function TOpenAPIDefinition.BodyParameter.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.BodyParameter.GetRequiredStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.BodyParameter.GetSchema: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Schema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Schema.Create;

  Result := FSchema;
end;

function TOpenAPIDefinition.BodyParameter.GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.VendorExtension>.Create;

  Result := FVendorExtension;
end;

function TOpenAPIDefinition.BodyParameter.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ TOpenAPIDefinition.HeaderParameterSubSchema }

destructor TOpenAPIDefinition.HeaderParameterSubSchema.Destroy;
begin
  FItems.Free;

  FMinLength.Free;

  FMinItems.Free;

  FVendorExtension.Free;

  inherited;
end;

function TOpenAPIDefinition.HeaderParameterSubSchema.GetRequiredStored: Boolean;
begin
  Result := False;
end;

procedure TOpenAPIDefinition.HeaderParameterSubSchema.SetIn(const Value: TOpenAPIDefinition.HeaderParameterSubSchema.Tin);
begin
  FIn := Value;
  FInIsStored := True;
end;

function TOpenAPIDefinition.HeaderParameterSubSchema.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.HeaderParameterSubSchema.GetNameStored: Boolean;
begin
  Result := not FName.IsEmpty;
end;

procedure TOpenAPIDefinition.HeaderParameterSubSchema.SetType(const Value: TOpenAPIDefinition.HeaderParameterSubSchema.Ttype);
begin
  FType := Value;
  FTypeIsStored := True;
end;

function TOpenAPIDefinition.HeaderParameterSubSchema.GetFormatStored: Boolean;
begin
  Result := not FFormat.IsEmpty;
end;

function TOpenAPIDefinition.HeaderParameterSubSchema.GetItems: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.PrimitivesItems;
begin
  if not Assigned(FItems) then
    FItems := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.PrimitivesItems.Create;

  Result := FItems;
end;

function TOpenAPIDefinition.HeaderParameterSubSchema.GetItemsStored: Boolean;
begin
  Result := Assigned(FItems);
end;

procedure TOpenAPIDefinition.HeaderParameterSubSchema.SetCollectionFormat(const Value: TOpenAPIDefinition.CollectionFormat);
begin
  FCollectionFormat := Value;
  FCollectionFormatIsStored := True;
end;

function TOpenAPIDefinition.HeaderParameterSubSchema.GetDefaultStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.HeaderParameterSubSchema.GetMaximumStored: Boolean;
begin
  Result := FMaximum <> 0;
end;

function TOpenAPIDefinition.HeaderParameterSubSchema.GetExclusiveMaximumStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.HeaderParameterSubSchema.GetMinimumStored: Boolean;
begin
  Result := FMinimum <> 0;
end;

function TOpenAPIDefinition.HeaderParameterSubSchema.GetExclusiveMinimumStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.HeaderParameterSubSchema.GetMaxLengthStored: Boolean;
begin
  Result := FMaxLength <> 0;
end;

function TOpenAPIDefinition.HeaderParameterSubSchema.GetMinLength: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0;
begin
  if not Assigned(FMinLength) then
    FMinLength := Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0.Create;

  Result := FMinLength;
end;

function TOpenAPIDefinition.HeaderParameterSubSchema.GetMinLengthStored: Boolean;
begin
  Result := Assigned(FMinLength);
end;

function TOpenAPIDefinition.HeaderParameterSubSchema.GetPatternStored: Boolean;
begin
  Result := not FPattern.IsEmpty;
end;

function TOpenAPIDefinition.HeaderParameterSubSchema.GetMaxItemsStored: Boolean;
begin
  Result := FMaxItems <> 0;
end;

function TOpenAPIDefinition.HeaderParameterSubSchema.GetMinItems: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0;
begin
  if not Assigned(FMinItems) then
    FMinItems := Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0.Create;

  Result := FMinItems;
end;

function TOpenAPIDefinition.HeaderParameterSubSchema.GetMinItemsStored: Boolean;
begin
  Result := Assigned(FMinItems);
end;

function TOpenAPIDefinition.HeaderParameterSubSchema.GetUniqueItemsStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.HeaderParameterSubSchema.GetEnumStored: Boolean;
begin
  Result := Assigned(FEnum);
end;

function TOpenAPIDefinition.HeaderParameterSubSchema.GetMultipleOfStored: Boolean;
begin
  Result := FMultipleOf <> 0;
end;

function TOpenAPIDefinition.HeaderParameterSubSchema.GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.VendorExtension>.Create;

  Result := FVendorExtension;
end;

function TOpenAPIDefinition.HeaderParameterSubSchema.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ TOpenAPIDefinition.QueryParameterSubSchema }

destructor TOpenAPIDefinition.QueryParameterSubSchema.Destroy;
begin
  FItems.Free;

  FMinLength.Free;

  FMinItems.Free;

  FVendorExtension.Free;

  inherited;
end;

function TOpenAPIDefinition.QueryParameterSubSchema.GetRequiredStored: Boolean;
begin
  Result := False;
end;

procedure TOpenAPIDefinition.QueryParameterSubSchema.SetIn(const Value: TOpenAPIDefinition.QueryParameterSubSchema.Tin);
begin
  FIn := Value;
  FInIsStored := True;
end;

function TOpenAPIDefinition.QueryParameterSubSchema.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.QueryParameterSubSchema.GetNameStored: Boolean;
begin
  Result := not FName.IsEmpty;
end;

function TOpenAPIDefinition.QueryParameterSubSchema.GetAllowEmptyValueStored: Boolean;
begin
  Result := False;
end;

procedure TOpenAPIDefinition.QueryParameterSubSchema.SetType(const Value: TOpenAPIDefinition.QueryParameterSubSchema.Ttype);
begin
  FType := Value;
  FTypeIsStored := True;
end;

function TOpenAPIDefinition.QueryParameterSubSchema.GetFormatStored: Boolean;
begin
  Result := not FFormat.IsEmpty;
end;

function TOpenAPIDefinition.QueryParameterSubSchema.GetItems: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.PrimitivesItems;
begin
  if not Assigned(FItems) then
    FItems := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.PrimitivesItems.Create;

  Result := FItems;
end;

function TOpenAPIDefinition.QueryParameterSubSchema.GetItemsStored: Boolean;
begin
  Result := Assigned(FItems);
end;

procedure TOpenAPIDefinition.QueryParameterSubSchema.SetCollectionFormat(const Value: TOpenAPIDefinition.CollectionFormatWithMulti);
begin
  FCollectionFormat := Value;
  FCollectionFormatIsStored := True;
end;

function TOpenAPIDefinition.QueryParameterSubSchema.GetDefaultStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.QueryParameterSubSchema.GetMaximumStored: Boolean;
begin
  Result := FMaximum <> 0;
end;

function TOpenAPIDefinition.QueryParameterSubSchema.GetExclusiveMaximumStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.QueryParameterSubSchema.GetMinimumStored: Boolean;
begin
  Result := FMinimum <> 0;
end;

function TOpenAPIDefinition.QueryParameterSubSchema.GetExclusiveMinimumStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.QueryParameterSubSchema.GetMaxLengthStored: Boolean;
begin
  Result := FMaxLength <> 0;
end;

function TOpenAPIDefinition.QueryParameterSubSchema.GetMinLength: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0;
begin
  if not Assigned(FMinLength) then
    FMinLength := Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0.Create;

  Result := FMinLength;
end;

function TOpenAPIDefinition.QueryParameterSubSchema.GetMinLengthStored: Boolean;
begin
  Result := Assigned(FMinLength);
end;

function TOpenAPIDefinition.QueryParameterSubSchema.GetPatternStored: Boolean;
begin
  Result := not FPattern.IsEmpty;
end;

function TOpenAPIDefinition.QueryParameterSubSchema.GetMaxItemsStored: Boolean;
begin
  Result := FMaxItems <> 0;
end;

function TOpenAPIDefinition.QueryParameterSubSchema.GetMinItems: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0;
begin
  if not Assigned(FMinItems) then
    FMinItems := Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0.Create;

  Result := FMinItems;
end;

function TOpenAPIDefinition.QueryParameterSubSchema.GetMinItemsStored: Boolean;
begin
  Result := Assigned(FMinItems);
end;

function TOpenAPIDefinition.QueryParameterSubSchema.GetUniqueItemsStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.QueryParameterSubSchema.GetEnumStored: Boolean;
begin
  Result := Assigned(FEnum);
end;

function TOpenAPIDefinition.QueryParameterSubSchema.GetMultipleOfStored: Boolean;
begin
  Result := FMultipleOf <> 0;
end;

function TOpenAPIDefinition.QueryParameterSubSchema.GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.VendorExtension>.Create;

  Result := FVendorExtension;
end;

function TOpenAPIDefinition.QueryParameterSubSchema.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ TOpenAPIDefinition.FormDataParameterSubSchema }

destructor TOpenAPIDefinition.FormDataParameterSubSchema.Destroy;
begin
  FItems.Free;

  FMinLength.Free;

  FMinItems.Free;

  FVendorExtension.Free;

  inherited;
end;

function TOpenAPIDefinition.FormDataParameterSubSchema.GetRequiredStored: Boolean;
begin
  Result := False;
end;

procedure TOpenAPIDefinition.FormDataParameterSubSchema.SetIn(const Value: TOpenAPIDefinition.FormDataParameterSubSchema.Tin);
begin
  FIn := Value;
  FInIsStored := True;
end;

function TOpenAPIDefinition.FormDataParameterSubSchema.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.FormDataParameterSubSchema.GetNameStored: Boolean;
begin
  Result := not FName.IsEmpty;
end;

function TOpenAPIDefinition.FormDataParameterSubSchema.GetAllowEmptyValueStored: Boolean;
begin
  Result := False;
end;

procedure TOpenAPIDefinition.FormDataParameterSubSchema.SetType(const Value: TOpenAPIDefinition.FormDataParameterSubSchema.Ttype);
begin
  FType := Value;
  FTypeIsStored := True;
end;

function TOpenAPIDefinition.FormDataParameterSubSchema.GetFormatStored: Boolean;
begin
  Result := not FFormat.IsEmpty;
end;

function TOpenAPIDefinition.FormDataParameterSubSchema.GetItems: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.PrimitivesItems;
begin
  if not Assigned(FItems) then
    FItems := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.PrimitivesItems.Create;

  Result := FItems;
end;

function TOpenAPIDefinition.FormDataParameterSubSchema.GetItemsStored: Boolean;
begin
  Result := Assigned(FItems);
end;

procedure TOpenAPIDefinition.FormDataParameterSubSchema.SetCollectionFormat(const Value: TOpenAPIDefinition.CollectionFormatWithMulti);
begin
  FCollectionFormat := Value;
  FCollectionFormatIsStored := True;
end;

function TOpenAPIDefinition.FormDataParameterSubSchema.GetDefaultStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.FormDataParameterSubSchema.GetMaximumStored: Boolean;
begin
  Result := FMaximum <> 0;
end;

function TOpenAPIDefinition.FormDataParameterSubSchema.GetExclusiveMaximumStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.FormDataParameterSubSchema.GetMinimumStored: Boolean;
begin
  Result := FMinimum <> 0;
end;

function TOpenAPIDefinition.FormDataParameterSubSchema.GetExclusiveMinimumStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.FormDataParameterSubSchema.GetMaxLengthStored: Boolean;
begin
  Result := FMaxLength <> 0;
end;

function TOpenAPIDefinition.FormDataParameterSubSchema.GetMinLength: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0;
begin
  if not Assigned(FMinLength) then
    FMinLength := Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0.Create;

  Result := FMinLength;
end;

function TOpenAPIDefinition.FormDataParameterSubSchema.GetMinLengthStored: Boolean;
begin
  Result := Assigned(FMinLength);
end;

function TOpenAPIDefinition.FormDataParameterSubSchema.GetPatternStored: Boolean;
begin
  Result := not FPattern.IsEmpty;
end;

function TOpenAPIDefinition.FormDataParameterSubSchema.GetMaxItemsStored: Boolean;
begin
  Result := FMaxItems <> 0;
end;

function TOpenAPIDefinition.FormDataParameterSubSchema.GetMinItems: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0;
begin
  if not Assigned(FMinItems) then
    FMinItems := Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0.Create;

  Result := FMinItems;
end;

function TOpenAPIDefinition.FormDataParameterSubSchema.GetMinItemsStored: Boolean;
begin
  Result := Assigned(FMinItems);
end;

function TOpenAPIDefinition.FormDataParameterSubSchema.GetUniqueItemsStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.FormDataParameterSubSchema.GetEnumStored: Boolean;
begin
  Result := Assigned(FEnum);
end;

function TOpenAPIDefinition.FormDataParameterSubSchema.GetMultipleOfStored: Boolean;
begin
  Result := FMultipleOf <> 0;
end;

function TOpenAPIDefinition.FormDataParameterSubSchema.GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.VendorExtension>.Create;

  Result := FVendorExtension;
end;

function TOpenAPIDefinition.FormDataParameterSubSchema.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ TOpenAPIDefinition.PathParameterSubSchema }

destructor TOpenAPIDefinition.PathParameterSubSchema.Destroy;
begin
  FItems.Free;

  FMinLength.Free;

  FMinItems.Free;

  FVendorExtension.Free;

  inherited;
end;

procedure TOpenAPIDefinition.PathParameterSubSchema.SetIn(const Value: TOpenAPIDefinition.PathParameterSubSchema.Tin);
begin
  FIn := Value;
  FInIsStored := True;
end;

function TOpenAPIDefinition.PathParameterSubSchema.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.PathParameterSubSchema.GetNameStored: Boolean;
begin
  Result := not FName.IsEmpty;
end;

procedure TOpenAPIDefinition.PathParameterSubSchema.SetType(const Value: TOpenAPIDefinition.PathParameterSubSchema.Ttype);
begin
  FType := Value;
  FTypeIsStored := True;
end;

function TOpenAPIDefinition.PathParameterSubSchema.GetFormatStored: Boolean;
begin
  Result := not FFormat.IsEmpty;
end;

function TOpenAPIDefinition.PathParameterSubSchema.GetItems: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.PrimitivesItems;
begin
  if not Assigned(FItems) then
    FItems := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.PrimitivesItems.Create;

  Result := FItems;
end;

function TOpenAPIDefinition.PathParameterSubSchema.GetItemsStored: Boolean;
begin
  Result := Assigned(FItems);
end;

procedure TOpenAPIDefinition.PathParameterSubSchema.SetCollectionFormat(const Value: TOpenAPIDefinition.CollectionFormat);
begin
  FCollectionFormat := Value;
  FCollectionFormatIsStored := True;
end;

function TOpenAPIDefinition.PathParameterSubSchema.GetDefaultStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.PathParameterSubSchema.GetMaximumStored: Boolean;
begin
  Result := FMaximum <> 0;
end;

function TOpenAPIDefinition.PathParameterSubSchema.GetExclusiveMaximumStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.PathParameterSubSchema.GetMinimumStored: Boolean;
begin
  Result := FMinimum <> 0;
end;

function TOpenAPIDefinition.PathParameterSubSchema.GetExclusiveMinimumStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.PathParameterSubSchema.GetMaxLengthStored: Boolean;
begin
  Result := FMaxLength <> 0;
end;

function TOpenAPIDefinition.PathParameterSubSchema.GetMinLength: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0;
begin
  if not Assigned(FMinLength) then
    FMinLength := Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0.Create;

  Result := FMinLength;
end;

function TOpenAPIDefinition.PathParameterSubSchema.GetMinLengthStored: Boolean;
begin
  Result := Assigned(FMinLength);
end;

function TOpenAPIDefinition.PathParameterSubSchema.GetPatternStored: Boolean;
begin
  Result := not FPattern.IsEmpty;
end;

function TOpenAPIDefinition.PathParameterSubSchema.GetMaxItemsStored: Boolean;
begin
  Result := FMaxItems <> 0;
end;

function TOpenAPIDefinition.PathParameterSubSchema.GetMinItems: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0;
begin
  if not Assigned(FMinItems) then
    FMinItems := Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0.Create;

  Result := FMinItems;
end;

function TOpenAPIDefinition.PathParameterSubSchema.GetMinItemsStored: Boolean;
begin
  Result := Assigned(FMinItems);
end;

function TOpenAPIDefinition.PathParameterSubSchema.GetUniqueItemsStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.PathParameterSubSchema.GetEnumStored: Boolean;
begin
  Result := Assigned(FEnum);
end;

function TOpenAPIDefinition.PathParameterSubSchema.GetMultipleOfStored: Boolean;
begin
  Result := FMultipleOf <> 0;
end;

function TOpenAPIDefinition.PathParameterSubSchema.GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.VendorExtension>.Create;

  Result := FVendorExtension;
end;

function TOpenAPIDefinition.PathParameterSubSchema.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ TOpenAPIDefinition.NonBodyParameter }

destructor TOpenAPIDefinition.NonBodyParameter.Destroy;
begin
  FHeaderParameterSubSchema.Free;

  FFormDataParameterSubSchema.Free;

  FQueryParameterSubSchema.Free;

  FPathParameterSubSchema.Free;

  inherited;
end;

function TOpenAPIDefinition.NonBodyParameter.GetHeaderParameterSubSchema: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.HeaderParameterSubSchema;
begin
  if not Assigned(FHeaderParameterSubSchema) then
    FHeaderParameterSubSchema := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.HeaderParameterSubSchema.Create;

  Result := FHeaderParameterSubSchema;
end;

function TOpenAPIDefinition.NonBodyParameter.GetHeaderParameterSubSchemaStored: Boolean;
begin
  Result := Assigned(FHeaderParameterSubSchema);
end;

function TOpenAPIDefinition.NonBodyParameter.GetFormDataParameterSubSchema: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.FormDataParameterSubSchema;
begin
  if not Assigned(FFormDataParameterSubSchema) then
    FFormDataParameterSubSchema := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.FormDataParameterSubSchema.Create;

  Result := FFormDataParameterSubSchema;
end;

function TOpenAPIDefinition.NonBodyParameter.GetFormDataParameterSubSchemaStored: Boolean;
begin
  Result := Assigned(FFormDataParameterSubSchema);
end;

function TOpenAPIDefinition.NonBodyParameter.GetQueryParameterSubSchema: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.QueryParameterSubSchema;
begin
  if not Assigned(FQueryParameterSubSchema) then
    FQueryParameterSubSchema := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.QueryParameterSubSchema.Create;

  Result := FQueryParameterSubSchema;
end;

function TOpenAPIDefinition.NonBodyParameter.GetQueryParameterSubSchemaStored: Boolean;
begin
  Result := Assigned(FQueryParameterSubSchema);
end;

function TOpenAPIDefinition.NonBodyParameter.GetPathParameterSubSchema: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.PathParameterSubSchema;
begin
  if not Assigned(FPathParameterSubSchema) then
    FPathParameterSubSchema := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.PathParameterSubSchema.Create;

  Result := FPathParameterSubSchema;
end;

function TOpenAPIDefinition.NonBodyParameter.GetPathParameterSubSchemaStored: Boolean;
begin
  Result := Assigned(FPathParameterSubSchema);
end;

{ TOpenAPIDefinition.Parameter }

destructor TOpenAPIDefinition.Parameter.Destroy;
begin
  FBodyParameter.Free;

  FNonBodyParameter.Free;

  inherited;
end;

function TOpenAPIDefinition.Parameter.GetBodyParameter: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.BodyParameter;
begin
  if not Assigned(FBodyParameter) then
    FBodyParameter := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.BodyParameter.Create;

  Result := FBodyParameter;
end;

function TOpenAPIDefinition.Parameter.GetBodyParameterStored: Boolean;
begin
  Result := Assigned(FBodyParameter);
end;

function TOpenAPIDefinition.Parameter.GetNonBodyParameter: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.NonBodyParameter;
begin
  if not Assigned(FNonBodyParameter) then
    FNonBodyParameter := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.NonBodyParameter.Create;

  Result := FNonBodyParameter;
end;

function TOpenAPIDefinition.Parameter.GetNonBodyParameterStored: Boolean;
begin
  Result := Assigned(FNonBodyParameter);
end;

{ TOpenAPIDefinition.Schema }

destructor TOpenAPIDefinition.Schema.Destroy;
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

function TOpenAPIDefinition.Schema.GetRefStored: Boolean;
begin
  Result := not FRef.IsEmpty;
end;

function TOpenAPIDefinition.Schema.GetFormatStored: Boolean;
begin
  Result := not FFormat.IsEmpty;
end;

function TOpenAPIDefinition.Schema.GetTitleStored: Boolean;
begin
  Result := not FTitle.IsEmpty;
end;

function TOpenAPIDefinition.Schema.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.Schema.GetDefaultStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.Schema.GetMultipleOfStored: Boolean;
begin
  Result := FMultipleOf <> 0;
end;

function TOpenAPIDefinition.Schema.GetMaximumStored: Boolean;
begin
  Result := FMaximum <> 0;
end;

function TOpenAPIDefinition.Schema.GetExclusiveMaximumStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.Schema.GetMinimumStored: Boolean;
begin
  Result := FMinimum <> 0;
end;

function TOpenAPIDefinition.Schema.GetExclusiveMinimumStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.Schema.GetMaxLengthStored: Boolean;
begin
  Result := FMaxLength <> 0;
end;

function TOpenAPIDefinition.Schema.GetMinLength: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0;
begin
  if not Assigned(FMinLength) then
    FMinLength := Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0.Create;

  Result := FMinLength;
end;

function TOpenAPIDefinition.Schema.GetMinLengthStored: Boolean;
begin
  Result := Assigned(FMinLength);
end;

function TOpenAPIDefinition.Schema.GetPatternStored: Boolean;
begin
  Result := not FPattern.IsEmpty;
end;

function TOpenAPIDefinition.Schema.GetMaxItemsStored: Boolean;
begin
  Result := FMaxItems <> 0;
end;

function TOpenAPIDefinition.Schema.GetMinItems: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0;
begin
  if not Assigned(FMinItems) then
    FMinItems := Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0.Create;

  Result := FMinItems;
end;

function TOpenAPIDefinition.Schema.GetMinItemsStored: Boolean;
begin
  Result := Assigned(FMinItems);
end;

function TOpenAPIDefinition.Schema.GetUniqueItemsStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.Schema.GetMaxPropertiesStored: Boolean;
begin
  Result := FMaxProperties <> 0;
end;

function TOpenAPIDefinition.Schema.GetMinProperties: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0;
begin
  if not Assigned(FMinProperties) then
    FMinProperties := Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0.Create;

  Result := FMinProperties;
end;

function TOpenAPIDefinition.Schema.GetMinPropertiesStored: Boolean;
begin
  Result := Assigned(FMinProperties);
end;

function TOpenAPIDefinition.Schema.GetRequiredStored: Boolean;
begin
  Result := Assigned(FRequired);
end;

function TOpenAPIDefinition.Schema.GetEnumStored: Boolean;
begin
  Result := Assigned(FEnum);
end;

function TOpenAPIDefinition.Schema.GetAdditionalProperties: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Schema.TadditionalProperties;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Schema.TadditionalProperties.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.Schema.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

function TOpenAPIDefinition.Schema.GetType: Blue.Print.JSON.Draft4.Schema.Schema.Schema.Ttype;
begin
  if not Assigned(FType) then
    FType := Blue.Print.JSON.Draft4.Schema.Schema.Schema.Ttype.Create;

  Result := FType;
end;

function TOpenAPIDefinition.Schema.GetTypeStored: Boolean;
begin
  Result := Assigned(FType);
end;

function TOpenAPIDefinition.Schema.GetItems: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Schema.Titems;
begin
  if not Assigned(FItems) then
    FItems := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Schema.Titems.Create;

  Result := FItems;
end;

function TOpenAPIDefinition.Schema.GetItemsStored: Boolean;
begin
  Result := Assigned(FItems);
end;

function TOpenAPIDefinition.Schema.AddAllOf: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Schema;
begin
  Result := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Schema.Create;

  FAllOf := FAllOf + [Result];
end;

function TOpenAPIDefinition.Schema.GetAllOfStored: Boolean;
begin
  Result := Assigned(FAllOf);
end;

function TOpenAPIDefinition.Schema.GetProperties: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Schema.Tproperties;
begin
  if not Assigned(FProperties) then
    FProperties := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Schema.Tproperties.Create;

  Result := FProperties;
end;

function TOpenAPIDefinition.Schema.GetPropertiesStored: Boolean;
begin
  Result := Assigned(FProperties);
end;

function TOpenAPIDefinition.Schema.GetDiscriminatorStored: Boolean;
begin
  Result := not FDiscriminator.IsEmpty;
end;

function TOpenAPIDefinition.Schema.GetReadOnlyStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.Schema.GetXml: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Xml;
begin
  if not Assigned(FXml) then
    FXml := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Xml.Create;

  Result := FXml;
end;

function TOpenAPIDefinition.Schema.GetXmlStored: Boolean;
begin
  Result := Assigned(FXml);
end;

function TOpenAPIDefinition.Schema.GetExternalDocs: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.ExternalDocs;
begin
  if not Assigned(FExternalDocs) then
    FExternalDocs := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.ExternalDocs.Create;

  Result := FExternalDocs;
end;

function TOpenAPIDefinition.Schema.GetExternalDocsStored: Boolean;
begin
  Result := Assigned(FExternalDocs);
end;

function TOpenAPIDefinition.Schema.GetExampleStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.Schema.GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.VendorExtension>.Create;

  Result := FVendorExtension;
end;

function TOpenAPIDefinition.Schema.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ TOpenAPIDefinition.Schema.TadditionalProperties }

destructor TOpenAPIDefinition.Schema.TadditionalProperties.Destroy;
begin
  FSchema.Free;

  inherited;
end;

function TOpenAPIDefinition.Schema.TadditionalProperties.GetSchema: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Schema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Schema.Create;

  Result := FSchema;
end;

function TOpenAPIDefinition.Schema.TadditionalProperties.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function TOpenAPIDefinition.Schema.TadditionalProperties.GetBooleanStored: Boolean;
begin
  Result := False;
end;

{ TOpenAPIDefinition.Schema.Titems }

destructor TOpenAPIDefinition.Schema.Titems.Destroy;
begin
  FSchema.Free;

  for var AObject in FArray do
    AObject.Free;

  inherited;
end;

function TOpenAPIDefinition.Schema.Titems.GetSchema: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Schema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Schema.Create;

  Result := FSchema;
end;

function TOpenAPIDefinition.Schema.Titems.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function TOpenAPIDefinition.Schema.Titems.AddArray: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Schema;
begin
  Result := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Schema.Create;

  FArray := FArray + [Result];
end;

function TOpenAPIDefinition.Schema.Titems.GetArrayStored: Boolean;
begin
  Result := Assigned(FArray);
end;

{ TOpenAPIDefinition.Schema.Tproperties }

destructor TOpenAPIDefinition.Schema.Tproperties.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.Schema.Tproperties.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Schema>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Schema>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.Schema.Tproperties.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.FileSchema }

destructor TOpenAPIDefinition.FileSchema.Destroy;
begin
  FExternalDocs.Free;

  FVendorExtension.Free;

  inherited;
end;

function TOpenAPIDefinition.FileSchema.GetFormatStored: Boolean;
begin
  Result := not FFormat.IsEmpty;
end;

function TOpenAPIDefinition.FileSchema.GetTitleStored: Boolean;
begin
  Result := not FTitle.IsEmpty;
end;

function TOpenAPIDefinition.FileSchema.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.FileSchema.GetDefaultStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.FileSchema.GetRequiredStored: Boolean;
begin
  Result := Assigned(FRequired);
end;

function TOpenAPIDefinition.FileSchema.GetReadOnlyStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.FileSchema.GetExternalDocs: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.ExternalDocs;
begin
  if not Assigned(FExternalDocs) then
    FExternalDocs := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.ExternalDocs.Create;

  Result := FExternalDocs;
end;

function TOpenAPIDefinition.FileSchema.GetExternalDocsStored: Boolean;
begin
  Result := Assigned(FExternalDocs);
end;

function TOpenAPIDefinition.FileSchema.GetExampleStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.FileSchema.GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.VendorExtension>.Create;

  Result := FVendorExtension;
end;

function TOpenAPIDefinition.FileSchema.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ TOpenAPIDefinition.PrimitivesItems }

destructor TOpenAPIDefinition.PrimitivesItems.Destroy;
begin
  FItems.Free;

  FMinLength.Free;

  FMinItems.Free;

  FVendorExtension.Free;

  inherited;
end;

procedure TOpenAPIDefinition.PrimitivesItems.SetType(const Value: TOpenAPIDefinition.PrimitivesItems.Ttype);
begin
  FType := Value;
  FTypeIsStored := True;
end;

function TOpenAPIDefinition.PrimitivesItems.GetFormatStored: Boolean;
begin
  Result := not FFormat.IsEmpty;
end;

function TOpenAPIDefinition.PrimitivesItems.GetItems: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.PrimitivesItems;
begin
  if not Assigned(FItems) then
    FItems := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.PrimitivesItems.Create;

  Result := FItems;
end;

function TOpenAPIDefinition.PrimitivesItems.GetItemsStored: Boolean;
begin
  Result := Assigned(FItems);
end;

procedure TOpenAPIDefinition.PrimitivesItems.SetCollectionFormat(const Value: TOpenAPIDefinition.CollectionFormat);
begin
  FCollectionFormat := Value;
  FCollectionFormatIsStored := True;
end;

function TOpenAPIDefinition.PrimitivesItems.GetDefaultStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.PrimitivesItems.GetMaximumStored: Boolean;
begin
  Result := FMaximum <> 0;
end;

function TOpenAPIDefinition.PrimitivesItems.GetExclusiveMaximumStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.PrimitivesItems.GetMinimumStored: Boolean;
begin
  Result := FMinimum <> 0;
end;

function TOpenAPIDefinition.PrimitivesItems.GetExclusiveMinimumStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.PrimitivesItems.GetMaxLengthStored: Boolean;
begin
  Result := FMaxLength <> 0;
end;

function TOpenAPIDefinition.PrimitivesItems.GetMinLength: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0;
begin
  if not Assigned(FMinLength) then
    FMinLength := Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0.Create;

  Result := FMinLength;
end;

function TOpenAPIDefinition.PrimitivesItems.GetMinLengthStored: Boolean;
begin
  Result := Assigned(FMinLength);
end;

function TOpenAPIDefinition.PrimitivesItems.GetPatternStored: Boolean;
begin
  Result := not FPattern.IsEmpty;
end;

function TOpenAPIDefinition.PrimitivesItems.GetMaxItemsStored: Boolean;
begin
  Result := FMaxItems <> 0;
end;

function TOpenAPIDefinition.PrimitivesItems.GetMinItems: Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0;
begin
  if not Assigned(FMinItems) then
    FMinItems := Blue.Print.JSON.Draft4.Schema.Schema.PositiveIntegerDefault0.Create;

  Result := FMinItems;
end;

function TOpenAPIDefinition.PrimitivesItems.GetMinItemsStored: Boolean;
begin
  Result := Assigned(FMinItems);
end;

function TOpenAPIDefinition.PrimitivesItems.GetUniqueItemsStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.PrimitivesItems.GetEnumStored: Boolean;
begin
  Result := Assigned(FEnum);
end;

function TOpenAPIDefinition.PrimitivesItems.GetMultipleOfStored: Boolean;
begin
  Result := FMultipleOf <> 0;
end;

function TOpenAPIDefinition.PrimitivesItems.GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.VendorExtension>.Create;

  Result := FVendorExtension;
end;

function TOpenAPIDefinition.PrimitivesItems.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ TOpenAPIDefinition.SecurityRequirement }

destructor TOpenAPIDefinition.SecurityRequirement.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.SecurityRequirement.GetAdditionalProperties: TDynamicProperty<TArray<System.String>>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<TArray<System.String>>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.SecurityRequirement.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.Xml }

destructor TOpenAPIDefinition.Xml.Destroy;
begin
  FVendorExtension.Free;

  inherited;
end;

function TOpenAPIDefinition.Xml.GetNameStored: Boolean;
begin
  Result := not FName.IsEmpty;
end;

function TOpenAPIDefinition.Xml.GetNamespaceStored: Boolean;
begin
  Result := not FNamespace.IsEmpty;
end;

function TOpenAPIDefinition.Xml.GetPrefixStored: Boolean;
begin
  Result := not FPrefix.IsEmpty;
end;

function TOpenAPIDefinition.Xml.GetAttributeStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.Xml.GetWrappedStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.Xml.GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.VendorExtension>.Create;

  Result := FVendorExtension;
end;

function TOpenAPIDefinition.Xml.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ TOpenAPIDefinition.Tag }

destructor TOpenAPIDefinition.Tag.Destroy;
begin
  FExternalDocs.Free;

  FVendorExtension.Free;

  inherited;
end;

function TOpenAPIDefinition.Tag.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.Tag.GetExternalDocs: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.ExternalDocs;
begin
  if not Assigned(FExternalDocs) then
    FExternalDocs := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.ExternalDocs.Create;

  Result := FExternalDocs;
end;

function TOpenAPIDefinition.Tag.GetExternalDocsStored: Boolean;
begin
  Result := Assigned(FExternalDocs);
end;

function TOpenAPIDefinition.Tag.GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.VendorExtension>.Create;

  Result := FVendorExtension;
end;

function TOpenAPIDefinition.Tag.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ TOpenAPIDefinition.SecurityDefinitions }

destructor TOpenAPIDefinition.SecurityDefinitions.Destroy;
begin
  FBasicAuthenticationSecurity.Free;

  FApiKeySecurity.Free;

  FOauth2ImplicitSecurity.Free;

  FOauth2PasswordSecurity.Free;

  FOauth2ApplicationSecurity.Free;

  FOauth2AccessCodeSecurity.Free;

  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.SecurityDefinitions.GetBasicAuthenticationSecurity: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.BasicAuthenticationSecurity;
begin
  if not Assigned(FBasicAuthenticationSecurity) then
    FBasicAuthenticationSecurity := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.BasicAuthenticationSecurity.Create;

  Result := FBasicAuthenticationSecurity;
end;

function TOpenAPIDefinition.SecurityDefinitions.GetBasicAuthenticationSecurityStored: Boolean;
begin
  Result := Assigned(FBasicAuthenticationSecurity);
end;

function TOpenAPIDefinition.SecurityDefinitions.GetApiKeySecurity: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.ApiKeySecurity;
begin
  if not Assigned(FApiKeySecurity) then
    FApiKeySecurity := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.ApiKeySecurity.Create;

  Result := FApiKeySecurity;
end;

function TOpenAPIDefinition.SecurityDefinitions.GetApiKeySecurityStored: Boolean;
begin
  Result := Assigned(FApiKeySecurity);
end;

function TOpenAPIDefinition.SecurityDefinitions.GetOauth2ImplicitSecurity: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Oauth2ImplicitSecurity;
begin
  if not Assigned(FOauth2ImplicitSecurity) then
    FOauth2ImplicitSecurity := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Oauth2ImplicitSecurity.Create;

  Result := FOauth2ImplicitSecurity;
end;

function TOpenAPIDefinition.SecurityDefinitions.GetOauth2ImplicitSecurityStored: Boolean;
begin
  Result := Assigned(FOauth2ImplicitSecurity);
end;

function TOpenAPIDefinition.SecurityDefinitions.GetOauth2PasswordSecurity: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Oauth2PasswordSecurity;
begin
  if not Assigned(FOauth2PasswordSecurity) then
    FOauth2PasswordSecurity := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Oauth2PasswordSecurity.Create;

  Result := FOauth2PasswordSecurity;
end;

function TOpenAPIDefinition.SecurityDefinitions.GetOauth2PasswordSecurityStored: Boolean;
begin
  Result := Assigned(FOauth2PasswordSecurity);
end;

function TOpenAPIDefinition.SecurityDefinitions.GetOauth2ApplicationSecurity: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Oauth2ApplicationSecurity;
begin
  if not Assigned(FOauth2ApplicationSecurity) then
    FOauth2ApplicationSecurity := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Oauth2ApplicationSecurity.Create;

  Result := FOauth2ApplicationSecurity;
end;

function TOpenAPIDefinition.SecurityDefinitions.GetOauth2ApplicationSecurityStored: Boolean;
begin
  Result := Assigned(FOauth2ApplicationSecurity);
end;

function TOpenAPIDefinition.SecurityDefinitions.GetOauth2AccessCodeSecurity: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Oauth2AccessCodeSecurity;
begin
  if not Assigned(FOauth2AccessCodeSecurity) then
    FOauth2AccessCodeSecurity := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Oauth2AccessCodeSecurity.Create;

  Result := FOauth2AccessCodeSecurity;
end;

function TOpenAPIDefinition.SecurityDefinitions.GetOauth2AccessCodeSecurityStored: Boolean;
begin
  Result := Assigned(FOauth2AccessCodeSecurity);
end;

function TOpenAPIDefinition.SecurityDefinitions.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.SecurityDefinitions.TadditionalProperties>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.SecurityDefinitions.TadditionalProperties>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.SecurityDefinitions.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.SecurityDefinitions.TadditionalProperties }

destructor TOpenAPIDefinition.SecurityDefinitions.TadditionalProperties.Destroy;
begin
  FBasicAuthenticationSecurity.Free;

  FApiKeySecurity.Free;

  FOauth2ImplicitSecurity.Free;

  FOauth2PasswordSecurity.Free;

  FOauth2ApplicationSecurity.Free;

  FOauth2AccessCodeSecurity.Free;

  inherited;
end;

function TOpenAPIDefinition.SecurityDefinitions.TadditionalProperties.GetBasicAuthenticationSecurity: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.BasicAuthenticationSecurity;
begin
  if not Assigned(FBasicAuthenticationSecurity) then
    FBasicAuthenticationSecurity := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.BasicAuthenticationSecurity.Create;

  Result := FBasicAuthenticationSecurity;
end;

function TOpenAPIDefinition.SecurityDefinitions.TadditionalProperties.GetBasicAuthenticationSecurityStored: Boolean;
begin
  Result := Assigned(FBasicAuthenticationSecurity);
end;

function TOpenAPIDefinition.SecurityDefinitions.TadditionalProperties.GetApiKeySecurity: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.ApiKeySecurity;
begin
  if not Assigned(FApiKeySecurity) then
    FApiKeySecurity := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.ApiKeySecurity.Create;

  Result := FApiKeySecurity;
end;

function TOpenAPIDefinition.SecurityDefinitions.TadditionalProperties.GetApiKeySecurityStored: Boolean;
begin
  Result := Assigned(FApiKeySecurity);
end;

function TOpenAPIDefinition.SecurityDefinitions.TadditionalProperties.GetOauth2ImplicitSecurity: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Oauth2ImplicitSecurity;
begin
  if not Assigned(FOauth2ImplicitSecurity) then
    FOauth2ImplicitSecurity := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Oauth2ImplicitSecurity.Create;

  Result := FOauth2ImplicitSecurity;
end;

function TOpenAPIDefinition.SecurityDefinitions.TadditionalProperties.GetOauth2ImplicitSecurityStored: Boolean;
begin
  Result := Assigned(FOauth2ImplicitSecurity);
end;

function TOpenAPIDefinition.SecurityDefinitions.TadditionalProperties.GetOauth2PasswordSecurity: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Oauth2PasswordSecurity;
begin
  if not Assigned(FOauth2PasswordSecurity) then
    FOauth2PasswordSecurity := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Oauth2PasswordSecurity.Create;

  Result := FOauth2PasswordSecurity;
end;

function TOpenAPIDefinition.SecurityDefinitions.TadditionalProperties.GetOauth2PasswordSecurityStored: Boolean;
begin
  Result := Assigned(FOauth2PasswordSecurity);
end;

function TOpenAPIDefinition.SecurityDefinitions.TadditionalProperties.GetOauth2ApplicationSecurity: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Oauth2ApplicationSecurity;
begin
  if not Assigned(FOauth2ApplicationSecurity) then
    FOauth2ApplicationSecurity := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Oauth2ApplicationSecurity.Create;

  Result := FOauth2ApplicationSecurity;
end;

function TOpenAPIDefinition.SecurityDefinitions.TadditionalProperties.GetOauth2ApplicationSecurityStored: Boolean;
begin
  Result := Assigned(FOauth2ApplicationSecurity);
end;

function TOpenAPIDefinition.SecurityDefinitions.TadditionalProperties.GetOauth2AccessCodeSecurity: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Oauth2AccessCodeSecurity;
begin
  if not Assigned(FOauth2AccessCodeSecurity) then
    FOauth2AccessCodeSecurity := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Oauth2AccessCodeSecurity.Create;

  Result := FOauth2AccessCodeSecurity;
end;

function TOpenAPIDefinition.SecurityDefinitions.TadditionalProperties.GetOauth2AccessCodeSecurityStored: Boolean;
begin
  Result := Assigned(FOauth2AccessCodeSecurity);
end;

{ TOpenAPIDefinition.BasicAuthenticationSecurity }

destructor TOpenAPIDefinition.BasicAuthenticationSecurity.Destroy;
begin
  FVendorExtension.Free;

  inherited;
end;

function TOpenAPIDefinition.BasicAuthenticationSecurity.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.BasicAuthenticationSecurity.GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.VendorExtension>.Create;

  Result := FVendorExtension;
end;

function TOpenAPIDefinition.BasicAuthenticationSecurity.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ TOpenAPIDefinition.ApiKeySecurity }

destructor TOpenAPIDefinition.ApiKeySecurity.Destroy;
begin
  FVendorExtension.Free;

  inherited;
end;

function TOpenAPIDefinition.ApiKeySecurity.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.ApiKeySecurity.GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.VendorExtension>.Create;

  Result := FVendorExtension;
end;

function TOpenAPIDefinition.ApiKeySecurity.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ TOpenAPIDefinition.Oauth2ImplicitSecurity }

destructor TOpenAPIDefinition.Oauth2ImplicitSecurity.Destroy;
begin
  FScopes.Free;

  FVendorExtension.Free;

  inherited;
end;

function TOpenAPIDefinition.Oauth2ImplicitSecurity.GetScopes: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Oauth2Scopes;
begin
  if not Assigned(FScopes) then
    FScopes := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Oauth2Scopes.Create;

  Result := FScopes;
end;

function TOpenAPIDefinition.Oauth2ImplicitSecurity.GetScopesStored: Boolean;
begin
  Result := Assigned(FScopes);
end;

function TOpenAPIDefinition.Oauth2ImplicitSecurity.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.Oauth2ImplicitSecurity.GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.VendorExtension>.Create;

  Result := FVendorExtension;
end;

function TOpenAPIDefinition.Oauth2ImplicitSecurity.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ TOpenAPIDefinition.Oauth2PasswordSecurity }

destructor TOpenAPIDefinition.Oauth2PasswordSecurity.Destroy;
begin
  FScopes.Free;

  FVendorExtension.Free;

  inherited;
end;

function TOpenAPIDefinition.Oauth2PasswordSecurity.GetScopes: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Oauth2Scopes;
begin
  if not Assigned(FScopes) then
    FScopes := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Oauth2Scopes.Create;

  Result := FScopes;
end;

function TOpenAPIDefinition.Oauth2PasswordSecurity.GetScopesStored: Boolean;
begin
  Result := Assigned(FScopes);
end;

function TOpenAPIDefinition.Oauth2PasswordSecurity.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.Oauth2PasswordSecurity.GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.VendorExtension>.Create;

  Result := FVendorExtension;
end;

function TOpenAPIDefinition.Oauth2PasswordSecurity.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ TOpenAPIDefinition.Oauth2ApplicationSecurity }

destructor TOpenAPIDefinition.Oauth2ApplicationSecurity.Destroy;
begin
  FScopes.Free;

  FVendorExtension.Free;

  inherited;
end;

function TOpenAPIDefinition.Oauth2ApplicationSecurity.GetScopes: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Oauth2Scopes;
begin
  if not Assigned(FScopes) then
    FScopes := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Oauth2Scopes.Create;

  Result := FScopes;
end;

function TOpenAPIDefinition.Oauth2ApplicationSecurity.GetScopesStored: Boolean;
begin
  Result := Assigned(FScopes);
end;

function TOpenAPIDefinition.Oauth2ApplicationSecurity.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.Oauth2ApplicationSecurity.GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.VendorExtension>.Create;

  Result := FVendorExtension;
end;

function TOpenAPIDefinition.Oauth2ApplicationSecurity.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ TOpenAPIDefinition.Oauth2AccessCodeSecurity }

destructor TOpenAPIDefinition.Oauth2AccessCodeSecurity.Destroy;
begin
  FScopes.Free;

  FVendorExtension.Free;

  inherited;
end;

function TOpenAPIDefinition.Oauth2AccessCodeSecurity.GetScopes: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Oauth2Scopes;
begin
  if not Assigned(FScopes) then
    FScopes := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Oauth2Scopes.Create;

  Result := FScopes;
end;

function TOpenAPIDefinition.Oauth2AccessCodeSecurity.GetScopesStored: Boolean;
begin
  Result := Assigned(FScopes);
end;

function TOpenAPIDefinition.Oauth2AccessCodeSecurity.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.Oauth2AccessCodeSecurity.GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.VendorExtension>.Create;

  Result := FVendorExtension;
end;

function TOpenAPIDefinition.Oauth2AccessCodeSecurity.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ TOpenAPIDefinition.Oauth2Scopes }

destructor TOpenAPIDefinition.Oauth2Scopes.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.Oauth2Scopes.GetAdditionalProperties: TDynamicProperty<System.String>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<System.String>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.Oauth2Scopes.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.ParametersListArrayItem }

destructor TOpenAPIDefinition.ParametersListArrayItem.Destroy;
begin
  FParameter.Free;

  FJsonReference.Free;

  inherited;
end;

function TOpenAPIDefinition.ParametersListArrayItem.GetParameter: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Parameter;
begin
  if not Assigned(FParameter) then
    FParameter := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Parameter.Create;

  Result := FParameter;
end;

function TOpenAPIDefinition.ParametersListArrayItem.GetParameterStored: Boolean;
begin
  Result := Assigned(FParameter);
end;

function TOpenAPIDefinition.ParametersListArrayItem.GetJsonReference: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.JsonReference;
begin
  if not Assigned(FJsonReference) then
    FJsonReference := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.JsonReference.Create;

  Result := FJsonReference;
end;

function TOpenAPIDefinition.ParametersListArrayItem.GetJsonReferenceStored: Boolean;
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

function TOpenAPIDefinition.TOpenAPIDefinition.GetInfo: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Info;
begin
  if not Assigned(FInfo) then
    FInfo := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Info.Create;

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

function TOpenAPIDefinition.TOpenAPIDefinition.GetConsumes: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.TOpenAPIDefinition.Tconsumes;
begin
  if not Assigned(FConsumes) then
    FConsumes := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.TOpenAPIDefinition.Tconsumes.Create;

  Result := FConsumes;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetConsumesStored: Boolean;
begin
  Result := Assigned(FConsumes);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetProduces: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.TOpenAPIDefinition.Tproduces;
begin
  if not Assigned(FProduces) then
    FProduces := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.TOpenAPIDefinition.Tproduces.Create;

  Result := FProduces;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetProducesStored: Boolean;
begin
  Result := Assigned(FProduces);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetPaths: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Paths;
begin
  if not Assigned(FPaths) then
    FPaths := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Paths.Create;

  Result := FPaths;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetDefinitions: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Definitions;
begin
  if not Assigned(FDefinitions) then
    FDefinitions := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Definitions.Create;

  Result := FDefinitions;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetDefinitionsStored: Boolean;
begin
  Result := Assigned(FDefinitions);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetParameters: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.ParameterDefinitions;
begin
  if not Assigned(FParameters) then
    FParameters := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.ParameterDefinitions.Create;

  Result := FParameters;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetParametersStored: Boolean;
begin
  Result := Assigned(FParameters);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetResponses: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.ResponseDefinitions;
begin
  if not Assigned(FResponses) then
    FResponses := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.ResponseDefinitions.Create;

  Result := FResponses;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetResponsesStored: Boolean;
begin
  Result := Assigned(FResponses);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.AddSecurity: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.SecurityRequirement;
begin
  Result := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.SecurityRequirement.Create;

  FSecurity := FSecurity + [Result];
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetSecurityStored: Boolean;
begin
  Result := Assigned(FSecurity);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetSecurityDefinitions: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.SecurityDefinitions;
begin
  if not Assigned(FSecurityDefinitions) then
    FSecurityDefinitions := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.SecurityDefinitions.Create;

  Result := FSecurityDefinitions;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetSecurityDefinitionsStored: Boolean;
begin
  Result := Assigned(FSecurityDefinitions);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.AddTags: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Tag;
begin
  Result := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.Tag.Create;

  FTags := FTags + [Result];
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetTagsStored: Boolean;
begin
  Result := Assigned(FTags);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetExternalDocs: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.ExternalDocs;
begin
  if not Assigned(FExternalDocs) then
    FExternalDocs := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.ExternalDocs.Create;

  Result := FExternalDocs;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetExternalDocsStored: Boolean;
begin
  Result := Assigned(FExternalDocs);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetVendorExtension: TDynamicProperty<TOpenAPIDefinition.VendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TDynamicProperty<Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.VendorExtension>.Create;

  Result := FVendorExtension;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.Tconsumes }

function TOpenAPIDefinition.TOpenAPIDefinition.Tconsumes.GetMediaTypeListStored: Boolean;
begin
  Result := Assigned(FMediaTypeList);
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.Tproduces }

function TOpenAPIDefinition.TOpenAPIDefinition.Tproduces.GetMediaTypeListStored: Boolean;
begin
  Result := Assigned(FMediaTypeList);
end;

end.
