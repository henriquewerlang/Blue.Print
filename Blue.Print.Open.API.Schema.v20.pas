unit Blue.Print.Open.API.Schema.v20;

interface

{$M+}
{$SCOPEDENUMS ON}

// File generated from http://json-schema.org/draft-04/schema#, http://swagger.io/v2/schema.json#;

uses Blue.Print.Types, System.Rtti;

type
  // Enumerations declaration
  [EnumValue('array, boolean, integer, null, number, object, string')]
  simpleTypes = (&array, boolean, integer, null, number, &object, &string);
  // Forward class declaration
  TJSONSchema = class;
  PositiveIntegerDefault0 = class;
  TOpenAPIDefinition = class;
  Info = class;
  Contact = class;
  License = class;
  Paths = class;
  ExternalDocs = class;
  Operation = class;
  PathItem = class;
  Responses = class;
  ResponseValue = class;
  Response = class;
  Header = class;
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
  Xml = class;
  Tag = class;
  SecurityDefinitions = class;
  BasicAuthenticationSecurity = class;
  ApiKeySecurity = class;
  Oauth2ImplicitSecurity = class;
  Oauth2PasswordSecurity = class;
  Oauth2ApplicationSecurity = class;
  Oauth2AccessCodeSecurity = class;
  ParametersListArrayItem = class;
  JsonReference = class;

  // Forward type alias
  schemaArray = TArray<Blue.Print.Open.API.Schema.v20.TJSONSchema>;
  positiveInteger = System.Integer;
  stringArray = TArray<System.String>;
  any = System.Rtti.TValue;
  definitions = TMap<Blue.Print.Open.API.Schema.v20.Schema>;
  parameterDefinitions = TMap<Blue.Print.Open.API.Schema.v20.Parameter>;
  responseDefinitions = TMap<Blue.Print.Open.API.Schema.v20.Response>;
  examples = TMap<System.Rtti.TValue>;
  mimeType = System.String;
  headers = TMap<Blue.Print.Open.API.Schema.v20.Header>;
  vendorExtension = System.Rtti.TValue;
  security = TArray<TMap<TArray<System.String>>>;
  securityRequirement = TMap<TArray<System.String>>;
  oauth2Scopes = TMap<System.String>;
  mediaTypeList = TArray<System.String>;
  parametersList = TArray<Blue.Print.Open.API.Schema.v20.ParametersListArrayItem>;
  schemesList = TArray<System.String>;
  collectionFormat = System.String;
  collectionFormatWithMulti = System.String;
  title = System.String;
  description = System.String;
  default = System.Rtti.TValue;
  multipleOf = System.Double;
  maximum = System.Double;
  exclusiveMaximum = System.Boolean;
  minimum = System.Double;
  exclusiveMinimum = System.Boolean;
  maxLength = System.Integer;
  minLength = Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
  pattern = System.String;
  maxItems = System.Integer;
  minItems = Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
  uniqueItems = System.Boolean;
  enum = TArray<System.Rtti.TValue>;

  TJSONSchema = class
  public type
    [SingleObject]
    TAdditionalItems = class
    private
      FBoolean: Boolean;
      FSchema: Blue.Print.Open.API.Schema.v20.TJSONSchema;
      FBooleanIsStored: Boolean;

      function GetSchema: Blue.Print.Open.API.Schema.v20.TJSONSchema;
      function GetSchemaStored: Boolean;
      procedure SetBoolean(const Value: Boolean);
    public
      destructor Destroy; override;

      property IsBooleanStored: Boolean read FBooleanIsStored;
      property IsSchemaStored: Boolean read GetSchemaStored;
    published
      property boolean: Boolean read FBoolean write SetBoolean stored FBooleanIsStored;
      property Schema: Blue.Print.Open.API.Schema.v20.TJSONSchema read GetSchema write FSchema stored GetSchemaStored;
    end;

    [SingleObject]
    TItems = class
    private
      FSchema: Blue.Print.Open.API.Schema.v20.TJSONSchema;
      FSchemaArray: schemaArray;

      function GetSchema: Blue.Print.Open.API.Schema.v20.TJSONSchema;
      function GetSchemaStored: Boolean;
      function GetSchemaArrayStored: Boolean;
    public
      destructor Destroy; override;

      function AddSchemaArray: Blue.Print.Open.API.Schema.v20.TJSONSchema;

      property IsSchemaStored: Boolean read GetSchemaStored;
      property IsSchemaArrayStored: Boolean read GetSchemaArrayStored;
    published
      property Schema: Blue.Print.Open.API.Schema.v20.TJSONSchema read GetSchema write FSchema stored GetSchemaStored;
      property schemaArray: schemaArray read FSchemaArray write FSchemaArray stored GetSchemaArrayStored;
    end;

    [SingleObject]
    TAdditionalProperties = class
    private
      FBoolean: Boolean;
      FSchema: Blue.Print.Open.API.Schema.v20.TJSONSchema;
      FBooleanIsStored: Boolean;

      function GetSchema: Blue.Print.Open.API.Schema.v20.TJSONSchema;
      function GetSchemaStored: Boolean;
      procedure SetBoolean(const Value: Boolean);
    public
      destructor Destroy; override;

      property IsBooleanStored: Boolean read FBooleanIsStored;
      property IsSchemaStored: Boolean read GetSchemaStored;
    published
      property boolean: Boolean read FBoolean write SetBoolean stored FBooleanIsStored;
      property Schema: Blue.Print.Open.API.Schema.v20.TJSONSchema read GetSchema write FSchema stored GetSchemaStored;
    end;

    TDependencies = class
    private
      FSchema: Blue.Print.Open.API.Schema.v20.TJSONSchema;
      FStringArray: stringArray;

      function GetSchema: Blue.Print.Open.API.Schema.v20.TJSONSchema;
      function GetSchemaStored: Boolean;
      function GetStringArrayStored: Boolean;
    public
      destructor Destroy; override;

      property IsSchemaStored: Boolean read GetSchemaStored;
      property IsStringArrayStored: Boolean read GetStringArrayStored;
    published
      property Schema: Blue.Print.Open.API.Schema.v20.TJSONSchema read GetSchema write FSchema stored GetSchemaStored;
      property stringArray: stringArray read FStringArray write FStringArray stored GetStringArrayStored;
    end;

    [SingleObject]
    TType = class
    private
      FSimpleTypes: simpleTypes;
      FArray: TArray<simpleTypes>;
      FSimpleTypesIsStored: Boolean;

      function GetArrayStored: Boolean;
      procedure SetSimpleTypes(const Value: simpleTypes);
    public
      property IsSimpleTypesStored: Boolean read FSimpleTypesIsStored;
      property IsArrayStored: Boolean read GetArrayStored;
    published
      property simpleTypes: simpleTypes read FSimpleTypes write SetSimpleTypes stored FSimpleTypesIsStored;
      [FieldName('array')]
      property &array: TArray<simpleTypes> read FArray write FArray stored GetArrayStored;
    end;
  private
    FId: System.String;
    FSchema: System.String;
    FTitle: System.String;
    FDescription: System.String;
    FDefault: any;
    FMultipleOf: System.Double;
    FMaximum: System.Double;
    FExclusiveMaximum: System.Boolean;
    FMinimum: System.Double;
    FExclusiveMinimum: System.Boolean;
    FMaxLength: positiveInteger;
    FMinLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    FPattern: System.String;
    FAdditionalItems: Blue.Print.Open.API.Schema.v20.TJSONSchema.TAdditionalItems;
    FItems: Blue.Print.Open.API.Schema.v20.TJSONSchema.TItems;
    FMaxItems: positiveInteger;
    FMinItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    FUniqueItems: System.Boolean;
    FMaxProperties: positiveInteger;
    FMinProperties: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    FRequired: stringArray;
    FAdditionalProperties: Blue.Print.Open.API.Schema.v20.TJSONSchema.TAdditionalProperties;
    FDefinitions: TMap<Blue.Print.Open.API.Schema.v20.TJSONSchema>;
    FProperties: TMap<Blue.Print.Open.API.Schema.v20.TJSONSchema>;
    FPatternProperties: TMap<Blue.Print.Open.API.Schema.v20.TJSONSchema>;
    FDependencies: Blue.Print.Open.API.Schema.v20.TJSONSchema.TDependencies;
    FEnum: TArray<any>;
    FType: Blue.Print.Open.API.Schema.v20.TJSONSchema.TType;
    FFormat: System.String;
    FAllOf: schemaArray;
    FAnyOf: schemaArray;
    FOneOf: schemaArray;
    FNot: Blue.Print.Open.API.Schema.v20.TJSONSchema;
    FExclusiveMaximumIsStored: Boolean;
    FExclusiveMinimumIsStored: Boolean;
    FUniqueItemsIsStored: Boolean;

    function GetMinLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    function GetAdditionalItems: Blue.Print.Open.API.Schema.v20.TJSONSchema.TAdditionalItems;
    function GetItems: Blue.Print.Open.API.Schema.v20.TJSONSchema.TItems;
    function GetMinItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    function GetMinProperties: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    function GetAdditionalProperties: Blue.Print.Open.API.Schema.v20.TJSONSchema.TAdditionalProperties;
    function GetDefinitions: TMap<Blue.Print.Open.API.Schema.v20.TJSONSchema>;
    function GetProperties: TMap<Blue.Print.Open.API.Schema.v20.TJSONSchema>;
    function GetPatternProperties: TMap<Blue.Print.Open.API.Schema.v20.TJSONSchema>;
    function GetDependencies: Blue.Print.Open.API.Schema.v20.TJSONSchema.TDependencies;
    function GetType: Blue.Print.Open.API.Schema.v20.TJSONSchema.TType;
    function GetNot: Blue.Print.Open.API.Schema.v20.TJSONSchema;
    function GetIdStored: Boolean;
    function GetSchemaStored: Boolean;
    function GetTitleStored: Boolean;
    function GetDescriptionStored: Boolean;
    function GetDefaultStored: Boolean;
    function GetMultipleOfStored: Boolean;
    function GetMaximumStored: Boolean;
    function GetMinimumStored: Boolean;
    function GetMaxLengthStored: Boolean;
    function GetMinLengthStored: Boolean;
    function GetPatternStored: Boolean;
    function GetAdditionalItemsStored: Boolean;
    function GetItemsStored: Boolean;
    function GetMaxItemsStored: Boolean;
    function GetMinItemsStored: Boolean;
    function GetMaxPropertiesStored: Boolean;
    function GetMinPropertiesStored: Boolean;
    function GetRequiredStored: Boolean;
    function GetAdditionalPropertiesStored: Boolean;
    function GetDefinitionsStored: Boolean;
    function GetPropertiesStored: Boolean;
    function GetPatternPropertiesStored: Boolean;
    function GetDependenciesStored: Boolean;
    function GetEnumStored: Boolean;
    function GetTypeStored: Boolean;
    function GetFormatStored: Boolean;
    function GetAllOfStored: Boolean;
    function GetAnyOfStored: Boolean;
    function GetOneOfStored: Boolean;
    function GetNotStored: Boolean;
    procedure SetExclusiveMaximum(const Value: System.Boolean);
    procedure SetExclusiveMinimum(const Value: System.Boolean);
    procedure SetUniqueItems(const Value: System.Boolean);
  public
    destructor Destroy; override;

    function AddAllOf: Blue.Print.Open.API.Schema.v20.TJSONSchema;
    function AddAnyOf: Blue.Print.Open.API.Schema.v20.TJSONSchema;
    function AddOneOf: Blue.Print.Open.API.Schema.v20.TJSONSchema;

    property IsIdStored: Boolean read GetIdStored;
    property IsSchemaStored: Boolean read GetSchemaStored;
    property IsTitleStored: Boolean read GetTitleStored;
    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsDefaultStored: Boolean read GetDefaultStored;
    property IsMultipleOfStored: Boolean read GetMultipleOfStored;
    property IsMaximumStored: Boolean read GetMaximumStored;
    property IsExclusiveMaximumStored: Boolean read FExclusiveMaximumIsStored;
    property IsMinimumStored: Boolean read GetMinimumStored;
    property IsExclusiveMinimumStored: Boolean read FExclusiveMinimumIsStored;
    property IsMaxLengthStored: Boolean read GetMaxLengthStored;
    property IsMinLengthStored: Boolean read GetMinLengthStored;
    property IsPatternStored: Boolean read GetPatternStored;
    property IsAdditionalItemsStored: Boolean read GetAdditionalItemsStored;
    property IsItemsStored: Boolean read GetItemsStored;
    property IsMaxItemsStored: Boolean read GetMaxItemsStored;
    property IsMinItemsStored: Boolean read GetMinItemsStored;
    property IsUniqueItemsStored: Boolean read FUniqueItemsIsStored;
    property IsMaxPropertiesStored: Boolean read GetMaxPropertiesStored;
    property IsMinPropertiesStored: Boolean read GetMinPropertiesStored;
    property IsRequiredStored: Boolean read GetRequiredStored;
    property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
    property IsDefinitionsStored: Boolean read GetDefinitionsStored;
    property IsPropertiesStored: Boolean read GetPropertiesStored;
    property IsPatternPropertiesStored: Boolean read GetPatternPropertiesStored;
    property IsDependenciesStored: Boolean read GetDependenciesStored;
    property IsEnumStored: Boolean read GetEnumStored;
    property IsTypeStored: Boolean read GetTypeStored;
    property IsFormatStored: Boolean read GetFormatStored;
    property IsAllOfStored: Boolean read GetAllOfStored;
    property IsAnyOfStored: Boolean read GetAnyOfStored;
    property IsOneOfStored: Boolean read GetOneOfStored;
    property IsNotStored: Boolean read GetNotStored;
  published
    property id: System.String read FId write FId stored GetIdStored;
    [FieldName('$schema')]
    property schema: System.String read FSchema write FSchema stored GetSchemaStored;
    property title: System.String read FTitle write FTitle stored GetTitleStored;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property default: any read FDefault write FDefault stored GetDefaultStored;
    property multipleOf: System.Double read FMultipleOf write FMultipleOf stored GetMultipleOfStored;
    property maximum: System.Double read FMaximum write FMaximum stored GetMaximumStored;
    property exclusiveMaximum: System.Boolean read FExclusiveMaximum write SetExclusiveMaximum stored FExclusiveMaximumIsStored;
    property minimum: System.Double read FMinimum write FMinimum stored GetMinimumStored;
    property exclusiveMinimum: System.Boolean read FExclusiveMinimum write SetExclusiveMinimum stored FExclusiveMinimumIsStored;
    property maxLength: positiveInteger read FMaxLength write FMaxLength stored GetMaxLengthStored;
    property minLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0 read GetMinLength write FMinLength stored GetMinLengthStored;
    property pattern: System.String read FPattern write FPattern stored GetPatternStored;
    property additionalItems: Blue.Print.Open.API.Schema.v20.TJSONSchema.TAdditionalItems read GetAdditionalItems write FAdditionalItems stored GetAdditionalItemsStored;
    property items: Blue.Print.Open.API.Schema.v20.TJSONSchema.TItems read GetItems write FItems stored GetItemsStored;
    property maxItems: positiveInteger read FMaxItems write FMaxItems stored GetMaxItemsStored;
    property minItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0 read GetMinItems write FMinItems stored GetMinItemsStored;
    property uniqueItems: System.Boolean read FUniqueItems write SetUniqueItems stored FUniqueItemsIsStored;
    property maxProperties: positiveInteger read FMaxProperties write FMaxProperties stored GetMaxPropertiesStored;
    property minProperties: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0 read GetMinProperties write FMinProperties stored GetMinPropertiesStored;
    property required: stringArray read FRequired write FRequired stored GetRequiredStored;
    property additionalProperties: Blue.Print.Open.API.Schema.v20.TJSONSchema.TAdditionalProperties read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
    property definitions: TMap<Blue.Print.Open.API.Schema.v20.TJSONSchema> read GetDefinitions write FDefinitions stored GetDefinitionsStored;
    property properties: TMap<Blue.Print.Open.API.Schema.v20.TJSONSchema> read GetProperties write FProperties stored GetPropertiesStored;
    property patternProperties: TMap<Blue.Print.Open.API.Schema.v20.TJSONSchema> read GetPatternProperties write FPatternProperties stored GetPatternPropertiesStored;
    property dependencies: Blue.Print.Open.API.Schema.v20.TJSONSchema.TDependencies read GetDependencies write FDependencies stored GetDependenciesStored;
    property enum: TArray<any> read FEnum write FEnum stored GetEnumStored;
    [FieldName('type')]
    property &type: Blue.Print.Open.API.Schema.v20.TJSONSchema.TType read GetType write FType stored GetTypeStored;
    property format: System.String read FFormat write FFormat stored GetFormatStored;
    property allOf: schemaArray read FAllOf write FAllOf stored GetAllOfStored;
    property anyOf: schemaArray read FAnyOf write FAnyOf stored GetAnyOfStored;
    property oneOf: schemaArray read FOneOf write FOneOf stored GetOneOfStored;
    [FieldName('not')]
    property &not: Blue.Print.Open.API.Schema.v20.TJSONSchema read GetNot write FNot stored GetNotStored;
  end;

  [SingleObject]
  PositiveIntegerDefault0 = class
  private
    FPositiveInteger: positiveInteger;

    function GetPositiveIntegerStored: Boolean;
  public
    property IsPositiveIntegerStored: Boolean read GetPositiveIntegerStored;
  published
    property positiveInteger: positiveInteger read FPositiveInteger write FPositiveInteger stored GetPositiveIntegerStored;
  end;

  TOpenAPIDefinition = class
  public type
    [SingleObject]
    TConsumes = class
    private
      FMediaTypeList: mediaTypeList;

      function GetMediaTypeListStored: Boolean;
    public
      property IsMediaTypeListStored: Boolean read GetMediaTypeListStored;
    published
      property mediaTypeList: mediaTypeList read FMediaTypeList write FMediaTypeList stored GetMediaTypeListStored;
    end;

    [SingleObject]
    TProduces = class
    private
      FMediaTypeList: mediaTypeList;

      function GetMediaTypeListStored: Boolean;
    public
      property IsMediaTypeListStored: Boolean read GetMediaTypeListStored;
    published
      property mediaTypeList: mediaTypeList read FMediaTypeList write FMediaTypeList stored GetMediaTypeListStored;
    end;
  private
    FSwagger: System.String;
    FInfo: Blue.Print.Open.API.Schema.v20.Info;
    FHost: System.String;
    FBasePath: System.String;
    FSchemes: schemesList;
    FConsumes: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.TConsumes;
    FProduces: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.TProduces;
    FPaths: Blue.Print.Open.API.Schema.v20.Paths;
    FDefinitions: definitions;
    FParameters: parameterDefinitions;
    FResponses: Blue.Print.Open.API.Schema.v20.Responses;
    FSecurity: security;
    FSecurityDefinitions: Blue.Print.Open.API.Schema.v20.SecurityDefinitions;
    FTags: TArray<Blue.Print.Open.API.Schema.v20.Tag>;
    FExternalDocs: Blue.Print.Open.API.Schema.v20.ExternalDocs;
    FVendorExtension: TMap<vendorExtension>;

    function GetInfo: Blue.Print.Open.API.Schema.v20.Info;
    function GetConsumes: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.TConsumes;
    function GetProduces: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.TProduces;
    function GetPaths: Blue.Print.Open.API.Schema.v20.Paths;
    function GetDefinitions: definitions;
    function GetParameters: parameterDefinitions;
    function GetResponses: Blue.Print.Open.API.Schema.v20.Responses;
    function GetSecurityDefinitions: Blue.Print.Open.API.Schema.v20.SecurityDefinitions;
    function GetExternalDocs: Blue.Print.Open.API.Schema.v20.ExternalDocs;
    function GetVendorExtension: TMap<vendorExtension>;
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

    function AddTags: Blue.Print.Open.API.Schema.v20.Tag;

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
    property swagger: System.String read FSwagger write FSwagger;
    property info: Blue.Print.Open.API.Schema.v20.Info read GetInfo write FInfo;
    property host: System.String read FHost write FHost stored GetHostStored;
    property basePath: System.String read FBasePath write FBasePath stored GetBasePathStored;
    property schemes: schemesList read FSchemes write FSchemes stored GetSchemesStored;
    property consumes: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.TConsumes read GetConsumes write FConsumes stored GetConsumesStored;
    property produces: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.TProduces read GetProduces write FProduces stored GetProducesStored;
    property paths: Blue.Print.Open.API.Schema.v20.Paths read GetPaths write FPaths;
    property definitions: definitions read GetDefinitions write FDefinitions stored GetDefinitionsStored;
    property parameters: parameterDefinitions read GetParameters write FParameters stored GetParametersStored;
    property responses: Blue.Print.Open.API.Schema.v20.Responses read GetResponses write FResponses stored GetResponsesStored;
    property security: security read FSecurity write FSecurity stored GetSecurityStored;
    property securityDefinitions: Blue.Print.Open.API.Schema.v20.SecurityDefinitions read GetSecurityDefinitions write FSecurityDefinitions stored GetSecurityDefinitionsStored;
    property tags: TArray<Blue.Print.Open.API.Schema.v20.Tag> read FTags write FTags stored GetTagsStored;
    property externalDocs: Blue.Print.Open.API.Schema.v20.ExternalDocs read GetExternalDocs write FExternalDocs stored GetExternalDocsStored;
    property vendorExtension: TMap<vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
  end;

  Info = class
  private
    FTitle: System.String;
    FVersion: System.String;
    FDescription: System.String;
    FTermsOfService: System.String;
    FContact: Blue.Print.Open.API.Schema.v20.Contact;
    FLicense: Blue.Print.Open.API.Schema.v20.License;
    FVendorExtension: TMap<vendorExtension>;

    function GetContact: Blue.Print.Open.API.Schema.v20.Contact;
    function GetLicense: Blue.Print.Open.API.Schema.v20.License;
    function GetVendorExtension: TMap<vendorExtension>;
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
    property contact: Blue.Print.Open.API.Schema.v20.Contact read GetContact write FContact stored GetContactStored;
    property license: Blue.Print.Open.API.Schema.v20.License read GetLicense write FLicense stored GetLicenseStored;
    property vendorExtension: TMap<vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
  end;

  Contact = class
  private
    FName: System.String;
    FUrl: System.String;
    FEmail: System.String;
    FVendorExtension: TMap<vendorExtension>;

    function GetVendorExtension: TMap<vendorExtension>;
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
    property vendorExtension: TMap<vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
  end;

  License = class
  private
    FName: System.String;
    FUrl: System.String;
    FVendorExtension: TMap<vendorExtension>;

    function GetVendorExtension: TMap<vendorExtension>;
    function GetUrlStored: Boolean;
    function GetVendorExtensionStored: Boolean;
  public
    destructor Destroy; override;

    property IsUrlStored: Boolean read GetUrlStored;
    property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
  published
    property name: System.String read FName write FName;
    property url: System.String read FUrl write FUrl stored GetUrlStored;
    property vendorExtension: TMap<vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
  end;

  Paths = class
  private
    FVendorExtension: TMap<vendorExtension>;
    FPathItem: TMap<Blue.Print.Open.API.Schema.v20.PathItem>;

    function GetVendorExtension: TMap<vendorExtension>;
    function GetPathItem: TMap<Blue.Print.Open.API.Schema.v20.PathItem>;
    function GetVendorExtensionStored: Boolean;
    function GetPathItemStored: Boolean;
  public
    destructor Destroy; override;

    property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
    property IsPathItemStored: Boolean read GetPathItemStored;
  published
    property vendorExtension: TMap<vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
    property pathItem: TMap<Blue.Print.Open.API.Schema.v20.PathItem> read GetPathItem write FPathItem stored GetPathItemStored;
  end;

  ExternalDocs = class
  private
    FDescription: System.String;
    FUrl: System.String;
    FVendorExtension: TMap<vendorExtension>;

    function GetVendorExtension: TMap<vendorExtension>;
    function GetDescriptionStored: Boolean;
    function GetVendorExtensionStored: Boolean;
  public
    destructor Destroy; override;

    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
  published
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property url: System.String read FUrl write FUrl;
    property vendorExtension: TMap<vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
  end;

  Operation = class
  public type
    [SingleObject]
    TProduces = class
    private
      FMediaTypeList: mediaTypeList;

      function GetMediaTypeListStored: Boolean;
    public
      property IsMediaTypeListStored: Boolean read GetMediaTypeListStored;
    published
      property mediaTypeList: mediaTypeList read FMediaTypeList write FMediaTypeList stored GetMediaTypeListStored;
    end;

    [SingleObject]
    TConsumes = class
    private
      FMediaTypeList: mediaTypeList;

      function GetMediaTypeListStored: Boolean;
    public
      property IsMediaTypeListStored: Boolean read GetMediaTypeListStored;
    published
      property mediaTypeList: mediaTypeList read FMediaTypeList write FMediaTypeList stored GetMediaTypeListStored;
    end;
  private
    FTags: TArray<System.String>;
    FSummary: System.String;
    FDescription: System.String;
    FExternalDocs: Blue.Print.Open.API.Schema.v20.ExternalDocs;
    FOperationId: System.String;
    FProduces: Blue.Print.Open.API.Schema.v20.Operation.TProduces;
    FConsumes: Blue.Print.Open.API.Schema.v20.Operation.TConsumes;
    FParameters: parametersList;
    FResponses: Blue.Print.Open.API.Schema.v20.Responses;
    FSchemes: schemesList;
    FDeprecated: System.Boolean;
    FSecurity: security;
    FVendorExtension: TMap<vendorExtension>;
    FDeprecatedIsStored: Boolean;

    function GetExternalDocs: Blue.Print.Open.API.Schema.v20.ExternalDocs;
    function GetProduces: Blue.Print.Open.API.Schema.v20.Operation.TProduces;
    function GetConsumes: Blue.Print.Open.API.Schema.v20.Operation.TConsumes;
    function GetResponses: Blue.Print.Open.API.Schema.v20.Responses;
    function GetVendorExtension: TMap<vendorExtension>;
    function GetTagsStored: Boolean;
    function GetSummaryStored: Boolean;
    function GetDescriptionStored: Boolean;
    function GetExternalDocsStored: Boolean;
    function GetOperationIdStored: Boolean;
    function GetProducesStored: Boolean;
    function GetConsumesStored: Boolean;
    function GetParametersStored: Boolean;
    function GetSchemesStored: Boolean;
    function GetSecurityStored: Boolean;
    function GetVendorExtensionStored: Boolean;
    procedure SetDeprecated(const Value: System.Boolean);
  public
    destructor Destroy; override;

    function AddParameters: Blue.Print.Open.API.Schema.v20.ParametersListArrayItem;

    property IsTagsStored: Boolean read GetTagsStored;
    property IsSummaryStored: Boolean read GetSummaryStored;
    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsExternalDocsStored: Boolean read GetExternalDocsStored;
    property IsOperationIdStored: Boolean read GetOperationIdStored;
    property IsProducesStored: Boolean read GetProducesStored;
    property IsConsumesStored: Boolean read GetConsumesStored;
    property IsParametersStored: Boolean read GetParametersStored;
    property IsSchemesStored: Boolean read GetSchemesStored;
    property IsDeprecatedStored: Boolean read FDeprecatedIsStored;
    property IsSecurityStored: Boolean read GetSecurityStored;
    property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
  published
    property tags: TArray<System.String> read FTags write FTags stored GetTagsStored;
    property summary: System.String read FSummary write FSummary stored GetSummaryStored;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property externalDocs: Blue.Print.Open.API.Schema.v20.ExternalDocs read GetExternalDocs write FExternalDocs stored GetExternalDocsStored;
    property operationId: System.String read FOperationId write FOperationId stored GetOperationIdStored;
    property produces: Blue.Print.Open.API.Schema.v20.Operation.TProduces read GetProduces write FProduces stored GetProducesStored;
    property consumes: Blue.Print.Open.API.Schema.v20.Operation.TConsumes read GetConsumes write FConsumes stored GetConsumesStored;
    property parameters: parametersList read FParameters write FParameters stored GetParametersStored;
    property responses: Blue.Print.Open.API.Schema.v20.Responses read GetResponses write FResponses;
    property schemes: schemesList read FSchemes write FSchemes stored GetSchemesStored;
    property deprecated: System.Boolean read FDeprecated write SetDeprecated stored FDeprecatedIsStored;
    property security: security read FSecurity write FSecurity stored GetSecurityStored;
    property vendorExtension: TMap<vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
  end;

  PathItem = class
  private
    FRef: System.String;
    FGet: Blue.Print.Open.API.Schema.v20.Operation;
    FPut: Blue.Print.Open.API.Schema.v20.Operation;
    FPost: Blue.Print.Open.API.Schema.v20.Operation;
    FDelete: Blue.Print.Open.API.Schema.v20.Operation;
    FOptions: Blue.Print.Open.API.Schema.v20.Operation;
    FHead: Blue.Print.Open.API.Schema.v20.Operation;
    FPatch: Blue.Print.Open.API.Schema.v20.Operation;
    FParameters: parametersList;
    FVendorExtension: TMap<vendorExtension>;

    function GetGet: Blue.Print.Open.API.Schema.v20.Operation;
    function GetPut: Blue.Print.Open.API.Schema.v20.Operation;
    function GetPost: Blue.Print.Open.API.Schema.v20.Operation;
    function GetDelete: Blue.Print.Open.API.Schema.v20.Operation;
    function GetOptions: Blue.Print.Open.API.Schema.v20.Operation;
    function GetHead: Blue.Print.Open.API.Schema.v20.Operation;
    function GetPatch: Blue.Print.Open.API.Schema.v20.Operation;
    function GetVendorExtension: TMap<vendorExtension>;
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

    function AddParameters: Blue.Print.Open.API.Schema.v20.ParametersListArrayItem;

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
    property get: Blue.Print.Open.API.Schema.v20.Operation read GetGet write FGet stored GetGetStored;
    property put: Blue.Print.Open.API.Schema.v20.Operation read GetPut write FPut stored GetPutStored;
    property post: Blue.Print.Open.API.Schema.v20.Operation read GetPost write FPost stored GetPostStored;
    property delete: Blue.Print.Open.API.Schema.v20.Operation read GetDelete write FDelete stored GetDeleteStored;
    property options: Blue.Print.Open.API.Schema.v20.Operation read GetOptions write FOptions stored GetOptionsStored;
    property head: Blue.Print.Open.API.Schema.v20.Operation read GetHead write FHead stored GetHeadStored;
    property patch: Blue.Print.Open.API.Schema.v20.Operation read GetPatch write FPatch stored GetPatchStored;
    property parameters: parametersList read FParameters write FParameters stored GetParametersStored;
    property vendorExtension: TMap<vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
  end;

  Responses = class
  private
    FResponseValue: TMap<Blue.Print.Open.API.Schema.v20.ResponseValue>;
    FVendorExtension: TMap<vendorExtension>;

    function GetResponseValue: TMap<Blue.Print.Open.API.Schema.v20.ResponseValue>;
    function GetVendorExtension: TMap<vendorExtension>;
    function GetResponseValueStored: Boolean;
    function GetVendorExtensionStored: Boolean;
  public
    destructor Destroy; override;

    property IsResponseValueStored: Boolean read GetResponseValueStored;
    property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
  published
    property responseValue: TMap<Blue.Print.Open.API.Schema.v20.ResponseValue> read GetResponseValue write FResponseValue stored GetResponseValueStored;
    property vendorExtension: TMap<vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
  end;

  [SingleObject]
  ResponseValue = class
  private
    FResponse: Blue.Print.Open.API.Schema.v20.Response;
    FJsonReference: Blue.Print.Open.API.Schema.v20.JsonReference;

    function GetResponse: Blue.Print.Open.API.Schema.v20.Response;
    function GetJsonReference: Blue.Print.Open.API.Schema.v20.JsonReference;
    function GetResponseStored: Boolean;
    function GetJsonReferenceStored: Boolean;
  public
    destructor Destroy; override;

    property IsResponseStored: Boolean read GetResponseStored;
    property IsJsonReferenceStored: Boolean read GetJsonReferenceStored;
  published
    property response: Blue.Print.Open.API.Schema.v20.Response read GetResponse write FResponse stored GetResponseStored;
    property jsonReference: Blue.Print.Open.API.Schema.v20.JsonReference read GetJsonReference write FJsonReference stored GetJsonReferenceStored;
  end;

  Response = class
  public type
    [SingleObject]
    TSchema = class
    private
      FSchema: Blue.Print.Open.API.Schema.v20.Response.TSchema;
      FFileSchema: Blue.Print.Open.API.Schema.v20.FileSchema;

      function GetSchema: Blue.Print.Open.API.Schema.v20.Response.TSchema;
      function GetFileSchema: Blue.Print.Open.API.Schema.v20.FileSchema;
      function GetSchemaStored: Boolean;
      function GetFileSchemaStored: Boolean;
    public
      destructor Destroy; override;

      property IsSchemaStored: Boolean read GetSchemaStored;
      property IsFileSchemaStored: Boolean read GetFileSchemaStored;
    published
      property schema: Blue.Print.Open.API.Schema.v20.Response.TSchema read GetSchema write FSchema stored GetSchemaStored;
      property fileSchema: Blue.Print.Open.API.Schema.v20.FileSchema read GetFileSchema write FFileSchema stored GetFileSchemaStored;
    end;
  private
    FDescription: System.String;
    FSchema: Blue.Print.Open.API.Schema.v20.Response.TSchema;
    FHeaders: headers;
    FExamples: examples;
    FVendorExtension: TMap<vendorExtension>;

    function GetSchema: Blue.Print.Open.API.Schema.v20.Response.TSchema;
    function GetHeaders: headers;
    function GetExamples: examples;
    function GetVendorExtension: TMap<vendorExtension>;
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
    property schema: Blue.Print.Open.API.Schema.v20.Response.TSchema read GetSchema write FSchema stored GetSchemaStored;
    property headers: headers read GetHeaders write FHeaders stored GetHeadersStored;
    property examples: examples read GetExamples write FExamples stored GetExamplesStored;
    property vendorExtension: TMap<vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
  end;

  Header = class
  private
    FType: System.String;
    FFormat: System.String;
    FItems: Blue.Print.Open.API.Schema.v20.PrimitivesItems;
    FCollectionFormat: collectionFormat;
    FDefault: default;
    FMaximum: maximum;
    FExclusiveMaximum: exclusiveMaximum;
    FMinimum: minimum;
    FExclusiveMinimum: exclusiveMinimum;
    FMaxLength: maxLength;
    FMinLength: minLength;
    FPattern: pattern;
    FMaxItems: maxItems;
    FMinItems: minItems;
    FUniqueItems: uniqueItems;
    FEnum: enum;
    FMultipleOf: multipleOf;
    FDescription: System.String;
    FVendorExtension: TMap<vendorExtension>;
    FExclusiveMaximumIsStored: Boolean;
    FExclusiveMinimumIsStored: Boolean;
    FUniqueItemsIsStored: Boolean;

    function GetItems: Blue.Print.Open.API.Schema.v20.PrimitivesItems;
    function GetMinLength: minLength;
    function GetMinItems: minItems;
    function GetVendorExtension: TMap<vendorExtension>;
    function GetFormatStored: Boolean;
    function GetItemsStored: Boolean;
    function GetCollectionFormatStored: Boolean;
    function GetDefaultStored: Boolean;
    function GetMaximumStored: Boolean;
    function GetMinimumStored: Boolean;
    function GetMaxLengthStored: Boolean;
    function GetMinLengthStored: Boolean;
    function GetPatternStored: Boolean;
    function GetMaxItemsStored: Boolean;
    function GetMinItemsStored: Boolean;
    function GetEnumStored: Boolean;
    function GetMultipleOfStored: Boolean;
    function GetDescriptionStored: Boolean;
    function GetVendorExtensionStored: Boolean;
    procedure SetExclusiveMaximum(const Value: exclusiveMaximum);
    procedure SetExclusiveMinimum(const Value: exclusiveMinimum);
    procedure SetUniqueItems(const Value: uniqueItems);
  public
    destructor Destroy; override;

    property IsFormatStored: Boolean read GetFormatStored;
    property IsItemsStored: Boolean read GetItemsStored;
    property IsCollectionFormatStored: Boolean read GetCollectionFormatStored;
    property IsDefaultStored: Boolean read GetDefaultStored;
    property IsMaximumStored: Boolean read GetMaximumStored;
    property IsExclusiveMaximumStored: Boolean read FExclusiveMaximumIsStored;
    property IsMinimumStored: Boolean read GetMinimumStored;
    property IsExclusiveMinimumStored: Boolean read FExclusiveMinimumIsStored;
    property IsMaxLengthStored: Boolean read GetMaxLengthStored;
    property IsMinLengthStored: Boolean read GetMinLengthStored;
    property IsPatternStored: Boolean read GetPatternStored;
    property IsMaxItemsStored: Boolean read GetMaxItemsStored;
    property IsMinItemsStored: Boolean read GetMinItemsStored;
    property IsUniqueItemsStored: Boolean read FUniqueItemsIsStored;
    property IsEnumStored: Boolean read GetEnumStored;
    property IsMultipleOfStored: Boolean read GetMultipleOfStored;
    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
  published
    [FieldName('type')]
    property &type: System.String read FType write FType;
    property format: System.String read FFormat write FFormat stored GetFormatStored;
    property items: Blue.Print.Open.API.Schema.v20.PrimitivesItems read GetItems write FItems stored GetItemsStored;
    property collectionFormat: collectionFormat read FCollectionFormat write FCollectionFormat stored GetCollectionFormatStored;
    property default: default read FDefault write FDefault stored GetDefaultStored;
    property maximum: maximum read FMaximum write FMaximum stored GetMaximumStored;
    property exclusiveMaximum: exclusiveMaximum read FExclusiveMaximum write SetExclusiveMaximum stored FExclusiveMaximumIsStored;
    property minimum: minimum read FMinimum write FMinimum stored GetMinimumStored;
    property exclusiveMinimum: exclusiveMinimum read FExclusiveMinimum write SetExclusiveMinimum stored FExclusiveMinimumIsStored;
    property maxLength: maxLength read FMaxLength write FMaxLength stored GetMaxLengthStored;
    property minLength: minLength read GetMinLength write FMinLength stored GetMinLengthStored;
    property pattern: pattern read FPattern write FPattern stored GetPatternStored;
    property maxItems: maxItems read FMaxItems write FMaxItems stored GetMaxItemsStored;
    property minItems: minItems read GetMinItems write FMinItems stored GetMinItemsStored;
    property uniqueItems: uniqueItems read FUniqueItems write SetUniqueItems stored FUniqueItemsIsStored;
    property enum: enum read FEnum write FEnum stored GetEnumStored;
    property multipleOf: multipleOf read FMultipleOf write FMultipleOf stored GetMultipleOfStored;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property vendorExtension: TMap<vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
  end;

  BodyParameter = class
  private
    FDescription: System.String;
    FName: System.String;
    FIn: System.String;
    FRequired: System.Boolean;
    FSchema: Blue.Print.Open.API.Schema.v20.Schema;
    FVendorExtension: TMap<vendorExtension>;
    FRequiredIsStored: Boolean;

    function GetSchema: Blue.Print.Open.API.Schema.v20.Schema;
    function GetVendorExtension: TMap<vendorExtension>;
    function GetDescriptionStored: Boolean;
    function GetVendorExtensionStored: Boolean;
    procedure SetRequired(const Value: System.Boolean);
  public
    destructor Destroy; override;

    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsRequiredStored: Boolean read FRequiredIsStored;
    property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
  published
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property name: System.String read FName write FName;
    [FieldName('in')]
    property &in: System.String read FIn write FIn;
    property required: System.Boolean read FRequired write SetRequired stored FRequiredIsStored;
    property schema: Blue.Print.Open.API.Schema.v20.Schema read GetSchema write FSchema;
    property vendorExtension: TMap<vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
  end;

  HeaderParameterSubSchema = class
  private
    FRequired: System.Boolean;
    FIn: System.String;
    FDescription: System.String;
    FName: System.String;
    FType: System.String;
    FFormat: System.String;
    FItems: Blue.Print.Open.API.Schema.v20.PrimitivesItems;
    FCollectionFormat: collectionFormat;
    FDefault: default;
    FMaximum: maximum;
    FExclusiveMaximum: exclusiveMaximum;
    FMinimum: minimum;
    FExclusiveMinimum: exclusiveMinimum;
    FMaxLength: maxLength;
    FMinLength: minLength;
    FPattern: pattern;
    FMaxItems: maxItems;
    FMinItems: minItems;
    FUniqueItems: uniqueItems;
    FEnum: enum;
    FMultipleOf: multipleOf;
    FVendorExtension: TMap<vendorExtension>;
    FRequiredIsStored: Boolean;
    FExclusiveMaximumIsStored: Boolean;
    FExclusiveMinimumIsStored: Boolean;
    FUniqueItemsIsStored: Boolean;

    function GetItems: Blue.Print.Open.API.Schema.v20.PrimitivesItems;
    function GetMinLength: minLength;
    function GetMinItems: minItems;
    function GetVendorExtension: TMap<vendorExtension>;
    function GetInStored: Boolean;
    function GetDescriptionStored: Boolean;
    function GetNameStored: Boolean;
    function GetTypeStored: Boolean;
    function GetFormatStored: Boolean;
    function GetItemsStored: Boolean;
    function GetCollectionFormatStored: Boolean;
    function GetDefaultStored: Boolean;
    function GetMaximumStored: Boolean;
    function GetMinimumStored: Boolean;
    function GetMaxLengthStored: Boolean;
    function GetMinLengthStored: Boolean;
    function GetPatternStored: Boolean;
    function GetMaxItemsStored: Boolean;
    function GetMinItemsStored: Boolean;
    function GetEnumStored: Boolean;
    function GetMultipleOfStored: Boolean;
    function GetVendorExtensionStored: Boolean;
    procedure SetRequired(const Value: System.Boolean);
    procedure SetExclusiveMaximum(const Value: exclusiveMaximum);
    procedure SetExclusiveMinimum(const Value: exclusiveMinimum);
    procedure SetUniqueItems(const Value: uniqueItems);
  public
    destructor Destroy; override;

    property IsRequiredStored: Boolean read FRequiredIsStored;
    property IsInStored: Boolean read GetInStored;
    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsNameStored: Boolean read GetNameStored;
    property IsTypeStored: Boolean read GetTypeStored;
    property IsFormatStored: Boolean read GetFormatStored;
    property IsItemsStored: Boolean read GetItemsStored;
    property IsCollectionFormatStored: Boolean read GetCollectionFormatStored;
    property IsDefaultStored: Boolean read GetDefaultStored;
    property IsMaximumStored: Boolean read GetMaximumStored;
    property IsExclusiveMaximumStored: Boolean read FExclusiveMaximumIsStored;
    property IsMinimumStored: Boolean read GetMinimumStored;
    property IsExclusiveMinimumStored: Boolean read FExclusiveMinimumIsStored;
    property IsMaxLengthStored: Boolean read GetMaxLengthStored;
    property IsMinLengthStored: Boolean read GetMinLengthStored;
    property IsPatternStored: Boolean read GetPatternStored;
    property IsMaxItemsStored: Boolean read GetMaxItemsStored;
    property IsMinItemsStored: Boolean read GetMinItemsStored;
    property IsUniqueItemsStored: Boolean read FUniqueItemsIsStored;
    property IsEnumStored: Boolean read GetEnumStored;
    property IsMultipleOfStored: Boolean read GetMultipleOfStored;
    property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
  published
    property required: System.Boolean read FRequired write SetRequired stored FRequiredIsStored;
    [FieldName('in')]
    property &in: System.String read FIn write FIn stored GetInStored;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property name: System.String read FName write FName stored GetNameStored;
    [FieldName('type')]
    property &type: System.String read FType write FType stored GetTypeStored;
    property format: System.String read FFormat write FFormat stored GetFormatStored;
    property items: Blue.Print.Open.API.Schema.v20.PrimitivesItems read GetItems write FItems stored GetItemsStored;
    property collectionFormat: collectionFormat read FCollectionFormat write FCollectionFormat stored GetCollectionFormatStored;
    property default: default read FDefault write FDefault stored GetDefaultStored;
    property maximum: maximum read FMaximum write FMaximum stored GetMaximumStored;
    property exclusiveMaximum: exclusiveMaximum read FExclusiveMaximum write SetExclusiveMaximum stored FExclusiveMaximumIsStored;
    property minimum: minimum read FMinimum write FMinimum stored GetMinimumStored;
    property exclusiveMinimum: exclusiveMinimum read FExclusiveMinimum write SetExclusiveMinimum stored FExclusiveMinimumIsStored;
    property maxLength: maxLength read FMaxLength write FMaxLength stored GetMaxLengthStored;
    property minLength: minLength read GetMinLength write FMinLength stored GetMinLengthStored;
    property pattern: pattern read FPattern write FPattern stored GetPatternStored;
    property maxItems: maxItems read FMaxItems write FMaxItems stored GetMaxItemsStored;
    property minItems: minItems read GetMinItems write FMinItems stored GetMinItemsStored;
    property uniqueItems: uniqueItems read FUniqueItems write SetUniqueItems stored FUniqueItemsIsStored;
    property enum: enum read FEnum write FEnum stored GetEnumStored;
    property multipleOf: multipleOf read FMultipleOf write FMultipleOf stored GetMultipleOfStored;
    property vendorExtension: TMap<vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
  end;

  QueryParameterSubSchema = class
  private
    FRequired: System.Boolean;
    FIn: System.String;
    FDescription: System.String;
    FName: System.String;
    FAllowEmptyValue: System.Boolean;
    FType: System.String;
    FFormat: System.String;
    FItems: Blue.Print.Open.API.Schema.v20.PrimitivesItems;
    FCollectionFormat: collectionFormatWithMulti;
    FDefault: default;
    FMaximum: maximum;
    FExclusiveMaximum: exclusiveMaximum;
    FMinimum: minimum;
    FExclusiveMinimum: exclusiveMinimum;
    FMaxLength: maxLength;
    FMinLength: minLength;
    FPattern: pattern;
    FMaxItems: maxItems;
    FMinItems: minItems;
    FUniqueItems: uniqueItems;
    FEnum: enum;
    FMultipleOf: multipleOf;
    FVendorExtension: TMap<vendorExtension>;
    FRequiredIsStored: Boolean;
    FAllowEmptyValueIsStored: Boolean;
    FExclusiveMaximumIsStored: Boolean;
    FExclusiveMinimumIsStored: Boolean;
    FUniqueItemsIsStored: Boolean;

    function GetItems: Blue.Print.Open.API.Schema.v20.PrimitivesItems;
    function GetMinLength: minLength;
    function GetMinItems: minItems;
    function GetVendorExtension: TMap<vendorExtension>;
    function GetInStored: Boolean;
    function GetDescriptionStored: Boolean;
    function GetNameStored: Boolean;
    function GetTypeStored: Boolean;
    function GetFormatStored: Boolean;
    function GetItemsStored: Boolean;
    function GetCollectionFormatStored: Boolean;
    function GetDefaultStored: Boolean;
    function GetMaximumStored: Boolean;
    function GetMinimumStored: Boolean;
    function GetMaxLengthStored: Boolean;
    function GetMinLengthStored: Boolean;
    function GetPatternStored: Boolean;
    function GetMaxItemsStored: Boolean;
    function GetMinItemsStored: Boolean;
    function GetEnumStored: Boolean;
    function GetMultipleOfStored: Boolean;
    function GetVendorExtensionStored: Boolean;
    procedure SetRequired(const Value: System.Boolean);
    procedure SetAllowEmptyValue(const Value: System.Boolean);
    procedure SetExclusiveMaximum(const Value: exclusiveMaximum);
    procedure SetExclusiveMinimum(const Value: exclusiveMinimum);
    procedure SetUniqueItems(const Value: uniqueItems);
  public
    destructor Destroy; override;

    property IsRequiredStored: Boolean read FRequiredIsStored;
    property IsInStored: Boolean read GetInStored;
    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsNameStored: Boolean read GetNameStored;
    property IsAllowEmptyValueStored: Boolean read FAllowEmptyValueIsStored;
    property IsTypeStored: Boolean read GetTypeStored;
    property IsFormatStored: Boolean read GetFormatStored;
    property IsItemsStored: Boolean read GetItemsStored;
    property IsCollectionFormatStored: Boolean read GetCollectionFormatStored;
    property IsDefaultStored: Boolean read GetDefaultStored;
    property IsMaximumStored: Boolean read GetMaximumStored;
    property IsExclusiveMaximumStored: Boolean read FExclusiveMaximumIsStored;
    property IsMinimumStored: Boolean read GetMinimumStored;
    property IsExclusiveMinimumStored: Boolean read FExclusiveMinimumIsStored;
    property IsMaxLengthStored: Boolean read GetMaxLengthStored;
    property IsMinLengthStored: Boolean read GetMinLengthStored;
    property IsPatternStored: Boolean read GetPatternStored;
    property IsMaxItemsStored: Boolean read GetMaxItemsStored;
    property IsMinItemsStored: Boolean read GetMinItemsStored;
    property IsUniqueItemsStored: Boolean read FUniqueItemsIsStored;
    property IsEnumStored: Boolean read GetEnumStored;
    property IsMultipleOfStored: Boolean read GetMultipleOfStored;
    property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
  published
    property required: System.Boolean read FRequired write SetRequired stored FRequiredIsStored;
    [FieldName('in')]
    property &in: System.String read FIn write FIn stored GetInStored;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property name: System.String read FName write FName stored GetNameStored;
    property allowEmptyValue: System.Boolean read FAllowEmptyValue write SetAllowEmptyValue stored FAllowEmptyValueIsStored;
    [FieldName('type')]
    property &type: System.String read FType write FType stored GetTypeStored;
    property format: System.String read FFormat write FFormat stored GetFormatStored;
    property items: Blue.Print.Open.API.Schema.v20.PrimitivesItems read GetItems write FItems stored GetItemsStored;
    property collectionFormat: collectionFormatWithMulti read FCollectionFormat write FCollectionFormat stored GetCollectionFormatStored;
    property default: default read FDefault write FDefault stored GetDefaultStored;
    property maximum: maximum read FMaximum write FMaximum stored GetMaximumStored;
    property exclusiveMaximum: exclusiveMaximum read FExclusiveMaximum write SetExclusiveMaximum stored FExclusiveMaximumIsStored;
    property minimum: minimum read FMinimum write FMinimum stored GetMinimumStored;
    property exclusiveMinimum: exclusiveMinimum read FExclusiveMinimum write SetExclusiveMinimum stored FExclusiveMinimumIsStored;
    property maxLength: maxLength read FMaxLength write FMaxLength stored GetMaxLengthStored;
    property minLength: minLength read GetMinLength write FMinLength stored GetMinLengthStored;
    property pattern: pattern read FPattern write FPattern stored GetPatternStored;
    property maxItems: maxItems read FMaxItems write FMaxItems stored GetMaxItemsStored;
    property minItems: minItems read GetMinItems write FMinItems stored GetMinItemsStored;
    property uniqueItems: uniqueItems read FUniqueItems write SetUniqueItems stored FUniqueItemsIsStored;
    property enum: enum read FEnum write FEnum stored GetEnumStored;
    property multipleOf: multipleOf read FMultipleOf write FMultipleOf stored GetMultipleOfStored;
    property vendorExtension: TMap<vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
  end;

  FormDataParameterSubSchema = class
  private
    FRequired: System.Boolean;
    FIn: System.String;
    FDescription: System.String;
    FName: System.String;
    FAllowEmptyValue: System.Boolean;
    FType: System.String;
    FFormat: System.String;
    FItems: Blue.Print.Open.API.Schema.v20.PrimitivesItems;
    FCollectionFormat: collectionFormatWithMulti;
    FDefault: default;
    FMaximum: maximum;
    FExclusiveMaximum: exclusiveMaximum;
    FMinimum: minimum;
    FExclusiveMinimum: exclusiveMinimum;
    FMaxLength: maxLength;
    FMinLength: minLength;
    FPattern: pattern;
    FMaxItems: maxItems;
    FMinItems: minItems;
    FUniqueItems: uniqueItems;
    FEnum: enum;
    FMultipleOf: multipleOf;
    FVendorExtension: TMap<vendorExtension>;
    FRequiredIsStored: Boolean;
    FAllowEmptyValueIsStored: Boolean;
    FExclusiveMaximumIsStored: Boolean;
    FExclusiveMinimumIsStored: Boolean;
    FUniqueItemsIsStored: Boolean;

    function GetItems: Blue.Print.Open.API.Schema.v20.PrimitivesItems;
    function GetMinLength: minLength;
    function GetMinItems: minItems;
    function GetVendorExtension: TMap<vendorExtension>;
    function GetInStored: Boolean;
    function GetDescriptionStored: Boolean;
    function GetNameStored: Boolean;
    function GetTypeStored: Boolean;
    function GetFormatStored: Boolean;
    function GetItemsStored: Boolean;
    function GetCollectionFormatStored: Boolean;
    function GetDefaultStored: Boolean;
    function GetMaximumStored: Boolean;
    function GetMinimumStored: Boolean;
    function GetMaxLengthStored: Boolean;
    function GetMinLengthStored: Boolean;
    function GetPatternStored: Boolean;
    function GetMaxItemsStored: Boolean;
    function GetMinItemsStored: Boolean;
    function GetEnumStored: Boolean;
    function GetMultipleOfStored: Boolean;
    function GetVendorExtensionStored: Boolean;
    procedure SetRequired(const Value: System.Boolean);
    procedure SetAllowEmptyValue(const Value: System.Boolean);
    procedure SetExclusiveMaximum(const Value: exclusiveMaximum);
    procedure SetExclusiveMinimum(const Value: exclusiveMinimum);
    procedure SetUniqueItems(const Value: uniqueItems);
  public
    destructor Destroy; override;

    property IsRequiredStored: Boolean read FRequiredIsStored;
    property IsInStored: Boolean read GetInStored;
    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsNameStored: Boolean read GetNameStored;
    property IsAllowEmptyValueStored: Boolean read FAllowEmptyValueIsStored;
    property IsTypeStored: Boolean read GetTypeStored;
    property IsFormatStored: Boolean read GetFormatStored;
    property IsItemsStored: Boolean read GetItemsStored;
    property IsCollectionFormatStored: Boolean read GetCollectionFormatStored;
    property IsDefaultStored: Boolean read GetDefaultStored;
    property IsMaximumStored: Boolean read GetMaximumStored;
    property IsExclusiveMaximumStored: Boolean read FExclusiveMaximumIsStored;
    property IsMinimumStored: Boolean read GetMinimumStored;
    property IsExclusiveMinimumStored: Boolean read FExclusiveMinimumIsStored;
    property IsMaxLengthStored: Boolean read GetMaxLengthStored;
    property IsMinLengthStored: Boolean read GetMinLengthStored;
    property IsPatternStored: Boolean read GetPatternStored;
    property IsMaxItemsStored: Boolean read GetMaxItemsStored;
    property IsMinItemsStored: Boolean read GetMinItemsStored;
    property IsUniqueItemsStored: Boolean read FUniqueItemsIsStored;
    property IsEnumStored: Boolean read GetEnumStored;
    property IsMultipleOfStored: Boolean read GetMultipleOfStored;
    property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
  published
    property required: System.Boolean read FRequired write SetRequired stored FRequiredIsStored;
    [FieldName('in')]
    property &in: System.String read FIn write FIn stored GetInStored;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property name: System.String read FName write FName stored GetNameStored;
    property allowEmptyValue: System.Boolean read FAllowEmptyValue write SetAllowEmptyValue stored FAllowEmptyValueIsStored;
    [FieldName('type')]
    property &type: System.String read FType write FType stored GetTypeStored;
    property format: System.String read FFormat write FFormat stored GetFormatStored;
    property items: Blue.Print.Open.API.Schema.v20.PrimitivesItems read GetItems write FItems stored GetItemsStored;
    property collectionFormat: collectionFormatWithMulti read FCollectionFormat write FCollectionFormat stored GetCollectionFormatStored;
    property default: default read FDefault write FDefault stored GetDefaultStored;
    property maximum: maximum read FMaximum write FMaximum stored GetMaximumStored;
    property exclusiveMaximum: exclusiveMaximum read FExclusiveMaximum write SetExclusiveMaximum stored FExclusiveMaximumIsStored;
    property minimum: minimum read FMinimum write FMinimum stored GetMinimumStored;
    property exclusiveMinimum: exclusiveMinimum read FExclusiveMinimum write SetExclusiveMinimum stored FExclusiveMinimumIsStored;
    property maxLength: maxLength read FMaxLength write FMaxLength stored GetMaxLengthStored;
    property minLength: minLength read GetMinLength write FMinLength stored GetMinLengthStored;
    property pattern: pattern read FPattern write FPattern stored GetPatternStored;
    property maxItems: maxItems read FMaxItems write FMaxItems stored GetMaxItemsStored;
    property minItems: minItems read GetMinItems write FMinItems stored GetMinItemsStored;
    property uniqueItems: uniqueItems read FUniqueItems write SetUniqueItems stored FUniqueItemsIsStored;
    property enum: enum read FEnum write FEnum stored GetEnumStored;
    property multipleOf: multipleOf read FMultipleOf write FMultipleOf stored GetMultipleOfStored;
    property vendorExtension: TMap<vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
  end;

  PathParameterSubSchema = class
  private
    FRequired: System.Boolean;
    FIn: System.String;
    FDescription: System.String;
    FName: System.String;
    FType: System.String;
    FFormat: System.String;
    FItems: Blue.Print.Open.API.Schema.v20.PrimitivesItems;
    FCollectionFormat: collectionFormat;
    FDefault: default;
    FMaximum: maximum;
    FExclusiveMaximum: exclusiveMaximum;
    FMinimum: minimum;
    FExclusiveMinimum: exclusiveMinimum;
    FMaxLength: maxLength;
    FMinLength: minLength;
    FPattern: pattern;
    FMaxItems: maxItems;
    FMinItems: minItems;
    FUniqueItems: uniqueItems;
    FEnum: enum;
    FMultipleOf: multipleOf;
    FVendorExtension: TMap<vendorExtension>;
    FExclusiveMaximumIsStored: Boolean;
    FExclusiveMinimumIsStored: Boolean;
    FUniqueItemsIsStored: Boolean;

    function GetItems: Blue.Print.Open.API.Schema.v20.PrimitivesItems;
    function GetMinLength: minLength;
    function GetMinItems: minItems;
    function GetVendorExtension: TMap<vendorExtension>;
    function GetInStored: Boolean;
    function GetDescriptionStored: Boolean;
    function GetNameStored: Boolean;
    function GetTypeStored: Boolean;
    function GetFormatStored: Boolean;
    function GetItemsStored: Boolean;
    function GetCollectionFormatStored: Boolean;
    function GetDefaultStored: Boolean;
    function GetMaximumStored: Boolean;
    function GetMinimumStored: Boolean;
    function GetMaxLengthStored: Boolean;
    function GetMinLengthStored: Boolean;
    function GetPatternStored: Boolean;
    function GetMaxItemsStored: Boolean;
    function GetMinItemsStored: Boolean;
    function GetEnumStored: Boolean;
    function GetMultipleOfStored: Boolean;
    function GetVendorExtensionStored: Boolean;
    procedure SetExclusiveMaximum(const Value: exclusiveMaximum);
    procedure SetExclusiveMinimum(const Value: exclusiveMinimum);
    procedure SetUniqueItems(const Value: uniqueItems);
  public
    destructor Destroy; override;

    property IsInStored: Boolean read GetInStored;
    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsNameStored: Boolean read GetNameStored;
    property IsTypeStored: Boolean read GetTypeStored;
    property IsFormatStored: Boolean read GetFormatStored;
    property IsItemsStored: Boolean read GetItemsStored;
    property IsCollectionFormatStored: Boolean read GetCollectionFormatStored;
    property IsDefaultStored: Boolean read GetDefaultStored;
    property IsMaximumStored: Boolean read GetMaximumStored;
    property IsExclusiveMaximumStored: Boolean read FExclusiveMaximumIsStored;
    property IsMinimumStored: Boolean read GetMinimumStored;
    property IsExclusiveMinimumStored: Boolean read FExclusiveMinimumIsStored;
    property IsMaxLengthStored: Boolean read GetMaxLengthStored;
    property IsMinLengthStored: Boolean read GetMinLengthStored;
    property IsPatternStored: Boolean read GetPatternStored;
    property IsMaxItemsStored: Boolean read GetMaxItemsStored;
    property IsMinItemsStored: Boolean read GetMinItemsStored;
    property IsUniqueItemsStored: Boolean read FUniqueItemsIsStored;
    property IsEnumStored: Boolean read GetEnumStored;
    property IsMultipleOfStored: Boolean read GetMultipleOfStored;
    property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
  published
    property required: System.Boolean read FRequired write FRequired;
    [FieldName('in')]
    property &in: System.String read FIn write FIn stored GetInStored;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property name: System.String read FName write FName stored GetNameStored;
    [FieldName('type')]
    property &type: System.String read FType write FType stored GetTypeStored;
    property format: System.String read FFormat write FFormat stored GetFormatStored;
    property items: Blue.Print.Open.API.Schema.v20.PrimitivesItems read GetItems write FItems stored GetItemsStored;
    property collectionFormat: collectionFormat read FCollectionFormat write FCollectionFormat stored GetCollectionFormatStored;
    property default: default read FDefault write FDefault stored GetDefaultStored;
    property maximum: maximum read FMaximum write FMaximum stored GetMaximumStored;
    property exclusiveMaximum: exclusiveMaximum read FExclusiveMaximum write SetExclusiveMaximum stored FExclusiveMaximumIsStored;
    property minimum: minimum read FMinimum write FMinimum stored GetMinimumStored;
    property exclusiveMinimum: exclusiveMinimum read FExclusiveMinimum write SetExclusiveMinimum stored FExclusiveMinimumIsStored;
    property maxLength: maxLength read FMaxLength write FMaxLength stored GetMaxLengthStored;
    property minLength: minLength read GetMinLength write FMinLength stored GetMinLengthStored;
    property pattern: pattern read FPattern write FPattern stored GetPatternStored;
    property maxItems: maxItems read FMaxItems write FMaxItems stored GetMaxItemsStored;
    property minItems: minItems read GetMinItems write FMinItems stored GetMinItemsStored;
    property uniqueItems: uniqueItems read FUniqueItems write SetUniqueItems stored FUniqueItemsIsStored;
    property enum: enum read FEnum write FEnum stored GetEnumStored;
    property multipleOf: multipleOf read FMultipleOf write FMultipleOf stored GetMultipleOfStored;
    property vendorExtension: TMap<vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
  end;

  [SingleObject]
  NonBodyParameter = class
  private
    FHeaderParameterSubSchema: Blue.Print.Open.API.Schema.v20.HeaderParameterSubSchema;
    FFormDataParameterSubSchema: Blue.Print.Open.API.Schema.v20.FormDataParameterSubSchema;
    FQueryParameterSubSchema: Blue.Print.Open.API.Schema.v20.QueryParameterSubSchema;
    FPathParameterSubSchema: Blue.Print.Open.API.Schema.v20.PathParameterSubSchema;

    function GetHeaderParameterSubSchema: Blue.Print.Open.API.Schema.v20.HeaderParameterSubSchema;
    function GetFormDataParameterSubSchema: Blue.Print.Open.API.Schema.v20.FormDataParameterSubSchema;
    function GetQueryParameterSubSchema: Blue.Print.Open.API.Schema.v20.QueryParameterSubSchema;
    function GetPathParameterSubSchema: Blue.Print.Open.API.Schema.v20.PathParameterSubSchema;
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
    property headerParameterSubSchema: Blue.Print.Open.API.Schema.v20.HeaderParameterSubSchema read GetHeaderParameterSubSchema write FHeaderParameterSubSchema stored GetHeaderParameterSubSchemaStored;
    property formDataParameterSubSchema: Blue.Print.Open.API.Schema.v20.FormDataParameterSubSchema read GetFormDataParameterSubSchema write FFormDataParameterSubSchema stored GetFormDataParameterSubSchemaStored;
    property queryParameterSubSchema: Blue.Print.Open.API.Schema.v20.QueryParameterSubSchema read GetQueryParameterSubSchema write FQueryParameterSubSchema stored GetQueryParameterSubSchemaStored;
    property pathParameterSubSchema: Blue.Print.Open.API.Schema.v20.PathParameterSubSchema read GetPathParameterSubSchema write FPathParameterSubSchema stored GetPathParameterSubSchemaStored;
  end;

  [SingleObject]
  Parameter = class
  private
    FBodyParameter: Blue.Print.Open.API.Schema.v20.BodyParameter;
    FNonBodyParameter: Blue.Print.Open.API.Schema.v20.NonBodyParameter;

    function GetBodyParameter: Blue.Print.Open.API.Schema.v20.BodyParameter;
    function GetNonBodyParameter: Blue.Print.Open.API.Schema.v20.NonBodyParameter;
    function GetBodyParameterStored: Boolean;
    function GetNonBodyParameterStored: Boolean;
  public
    destructor Destroy; override;

    property IsBodyParameterStored: Boolean read GetBodyParameterStored;
    property IsNonBodyParameterStored: Boolean read GetNonBodyParameterStored;
  published
    property bodyParameter: Blue.Print.Open.API.Schema.v20.BodyParameter read GetBodyParameter write FBodyParameter stored GetBodyParameterStored;
    property nonBodyParameter: Blue.Print.Open.API.Schema.v20.NonBodyParameter read GetNonBodyParameter write FNonBodyParameter stored GetNonBodyParameterStored;
  end;

  Schema = class
  public type
    [SingleObject]
    TAdditionalProperties = class
    private
      FSchema: Blue.Print.Open.API.Schema.v20.Schema;
      FBoolean: Boolean;
      FBooleanIsStored: Boolean;

      function GetSchema: Blue.Print.Open.API.Schema.v20.Schema;
      function GetSchemaStored: Boolean;
      procedure SetBoolean(const Value: Boolean);
    public
      destructor Destroy; override;

      property IsSchemaStored: Boolean read GetSchemaStored;
      property IsBooleanStored: Boolean read FBooleanIsStored;
    published
      property schema: Blue.Print.Open.API.Schema.v20.Schema read GetSchema write FSchema stored GetSchemaStored;
      property boolean: Boolean read FBoolean write SetBoolean stored FBooleanIsStored;
    end;

    [SingleObject]
    TType = class
    private
      FSimpleTypes: simpleTypes;
      FArray: TArray<simpleTypes>;
      FSimpleTypesIsStored: Boolean;

      function GetArrayStored: Boolean;
      procedure SetSimpleTypes(const Value: simpleTypes);
    public
      property IsSimpleTypesStored: Boolean read FSimpleTypesIsStored;
      property IsArrayStored: Boolean read GetArrayStored;
    published
      property simpleTypes: simpleTypes read FSimpleTypes write SetSimpleTypes stored FSimpleTypesIsStored;
      [FieldName('array')]
      property &array: TArray<simpleTypes> read FArray write FArray stored GetArrayStored;
    end;

    [SingleObject]
    TItems = class
    private
      FSchema: Blue.Print.Open.API.Schema.v20.Schema;
      FArray: TArray<Blue.Print.Open.API.Schema.v20.Schema>;

      function GetSchema: Blue.Print.Open.API.Schema.v20.Schema;
      function GetSchemaStored: Boolean;
      function GetArrayStored: Boolean;
    public
      destructor Destroy; override;

      function AddArray: Blue.Print.Open.API.Schema.v20.Schema;

      property IsSchemaStored: Boolean read GetSchemaStored;
      property IsArrayStored: Boolean read GetArrayStored;
    published
      property schema: Blue.Print.Open.API.Schema.v20.Schema read GetSchema write FSchema stored GetSchemaStored;
      [FieldName('array')]
      property &array: TArray<Blue.Print.Open.API.Schema.v20.Schema> read FArray write FArray stored GetArrayStored;
    end;
  private
    FRef: System.String;
    FFormat: System.String;
    FTitle: System.String;
    FDescription: System.String;
    FDefault: any;
    FMultipleOf: System.Double;
    FMaximum: System.Double;
    FExclusiveMaximum: System.Boolean;
    FMinimum: System.Double;
    FExclusiveMinimum: System.Boolean;
    FMaxLength: positiveInteger;
    FMinLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    FPattern: System.String;
    FMaxItems: positiveInteger;
    FMinItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    FUniqueItems: System.Boolean;
    FMaxProperties: positiveInteger;
    FMinProperties: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    FRequired: stringArray;
    FEnum: TArray<any>;
    FAdditionalProperties: Blue.Print.Open.API.Schema.v20.Schema.TAdditionalProperties;
    FType: Blue.Print.Open.API.Schema.v20.Schema.TType;
    FItems: Blue.Print.Open.API.Schema.v20.Schema.TItems;
    FAllOf: TArray<Blue.Print.Open.API.Schema.v20.Schema>;
    FProperties: TMap<Blue.Print.Open.API.Schema.v20.Schema>;
    FDiscriminator: System.String;
    FReadOnly: System.Boolean;
    FXml: Blue.Print.Open.API.Schema.v20.Xml;
    FExternalDocs: Blue.Print.Open.API.Schema.v20.ExternalDocs;
    FExample: any;
    FVendorExtension: TMap<vendorExtension>;
    FExclusiveMaximumIsStored: Boolean;
    FExclusiveMinimumIsStored: Boolean;
    FUniqueItemsIsStored: Boolean;
    FReadOnlyIsStored: Boolean;

    function GetMinLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    function GetMinItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    function GetMinProperties: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    function GetAdditionalProperties: Blue.Print.Open.API.Schema.v20.Schema.TAdditionalProperties;
    function GetType: Blue.Print.Open.API.Schema.v20.Schema.TType;
    function GetItems: Blue.Print.Open.API.Schema.v20.Schema.TItems;
    function GetProperties: TMap<Blue.Print.Open.API.Schema.v20.Schema>;
    function GetXml: Blue.Print.Open.API.Schema.v20.Xml;
    function GetExternalDocs: Blue.Print.Open.API.Schema.v20.ExternalDocs;
    function GetVendorExtension: TMap<vendorExtension>;
    function GetRefStored: Boolean;
    function GetFormatStored: Boolean;
    function GetTitleStored: Boolean;
    function GetDescriptionStored: Boolean;
    function GetDefaultStored: Boolean;
    function GetMultipleOfStored: Boolean;
    function GetMaximumStored: Boolean;
    function GetMinimumStored: Boolean;
    function GetMaxLengthStored: Boolean;
    function GetMinLengthStored: Boolean;
    function GetPatternStored: Boolean;
    function GetMaxItemsStored: Boolean;
    function GetMinItemsStored: Boolean;
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
    function GetXmlStored: Boolean;
    function GetExternalDocsStored: Boolean;
    function GetExampleStored: Boolean;
    function GetVendorExtensionStored: Boolean;
    procedure SetExclusiveMaximum(const Value: System.Boolean);
    procedure SetExclusiveMinimum(const Value: System.Boolean);
    procedure SetUniqueItems(const Value: System.Boolean);
    procedure SetReadOnly(const Value: System.Boolean);
  public
    destructor Destroy; override;

    function AddAllOf: Blue.Print.Open.API.Schema.v20.Schema;

    property IsRefStored: Boolean read GetRefStored;
    property IsFormatStored: Boolean read GetFormatStored;
    property IsTitleStored: Boolean read GetTitleStored;
    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsDefaultStored: Boolean read GetDefaultStored;
    property IsMultipleOfStored: Boolean read GetMultipleOfStored;
    property IsMaximumStored: Boolean read GetMaximumStored;
    property IsExclusiveMaximumStored: Boolean read FExclusiveMaximumIsStored;
    property IsMinimumStored: Boolean read GetMinimumStored;
    property IsExclusiveMinimumStored: Boolean read FExclusiveMinimumIsStored;
    property IsMaxLengthStored: Boolean read GetMaxLengthStored;
    property IsMinLengthStored: Boolean read GetMinLengthStored;
    property IsPatternStored: Boolean read GetPatternStored;
    property IsMaxItemsStored: Boolean read GetMaxItemsStored;
    property IsMinItemsStored: Boolean read GetMinItemsStored;
    property IsUniqueItemsStored: Boolean read FUniqueItemsIsStored;
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
    property IsReadOnlyStored: Boolean read FReadOnlyIsStored;
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
    property default: any read FDefault write FDefault stored GetDefaultStored;
    property multipleOf: System.Double read FMultipleOf write FMultipleOf stored GetMultipleOfStored;
    property maximum: System.Double read FMaximum write FMaximum stored GetMaximumStored;
    property exclusiveMaximum: System.Boolean read FExclusiveMaximum write SetExclusiveMaximum stored FExclusiveMaximumIsStored;
    property minimum: System.Double read FMinimum write FMinimum stored GetMinimumStored;
    property exclusiveMinimum: System.Boolean read FExclusiveMinimum write SetExclusiveMinimum stored FExclusiveMinimumIsStored;
    property maxLength: positiveInteger read FMaxLength write FMaxLength stored GetMaxLengthStored;
    property minLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0 read GetMinLength write FMinLength stored GetMinLengthStored;
    property pattern: System.String read FPattern write FPattern stored GetPatternStored;
    property maxItems: positiveInteger read FMaxItems write FMaxItems stored GetMaxItemsStored;
    property minItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0 read GetMinItems write FMinItems stored GetMinItemsStored;
    property uniqueItems: System.Boolean read FUniqueItems write SetUniqueItems stored FUniqueItemsIsStored;
    property maxProperties: positiveInteger read FMaxProperties write FMaxProperties stored GetMaxPropertiesStored;
    property minProperties: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0 read GetMinProperties write FMinProperties stored GetMinPropertiesStored;
    property required: stringArray read FRequired write FRequired stored GetRequiredStored;
    property enum: TArray<any> read FEnum write FEnum stored GetEnumStored;
    property additionalProperties: Blue.Print.Open.API.Schema.v20.Schema.TAdditionalProperties read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
    [FieldName('type')]
    property &type: Blue.Print.Open.API.Schema.v20.Schema.TType read GetType write FType stored GetTypeStored;
    property items: Blue.Print.Open.API.Schema.v20.Schema.TItems read GetItems write FItems stored GetItemsStored;
    property allOf: TArray<Blue.Print.Open.API.Schema.v20.Schema> read FAllOf write FAllOf stored GetAllOfStored;
    property properties: TMap<Blue.Print.Open.API.Schema.v20.Schema> read GetProperties write FProperties stored GetPropertiesStored;
    property discriminator: System.String read FDiscriminator write FDiscriminator stored GetDiscriminatorStored;
    property readOnly: System.Boolean read FReadOnly write SetReadOnly stored FReadOnlyIsStored;
    property xml: Blue.Print.Open.API.Schema.v20.Xml read GetXml write FXml stored GetXmlStored;
    property externalDocs: Blue.Print.Open.API.Schema.v20.ExternalDocs read GetExternalDocs write FExternalDocs stored GetExternalDocsStored;
    property example: any read FExample write FExample stored GetExampleStored;
    property vendorExtension: TMap<vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
  end;

  FileSchema = class
  private
    FFormat: System.String;
    FTitle: System.String;
    FDescription: System.String;
    FDefault: any;
    FRequired: stringArray;
    FType: System.String;
    FReadOnly: System.Boolean;
    FExternalDocs: Blue.Print.Open.API.Schema.v20.ExternalDocs;
    FExample: any;
    FVendorExtension: TMap<vendorExtension>;
    FReadOnlyIsStored: Boolean;

    function GetExternalDocs: Blue.Print.Open.API.Schema.v20.ExternalDocs;
    function GetVendorExtension: TMap<vendorExtension>;
    function GetFormatStored: Boolean;
    function GetTitleStored: Boolean;
    function GetDescriptionStored: Boolean;
    function GetDefaultStored: Boolean;
    function GetRequiredStored: Boolean;
    function GetExternalDocsStored: Boolean;
    function GetExampleStored: Boolean;
    function GetVendorExtensionStored: Boolean;
    procedure SetReadOnly(const Value: System.Boolean);
  public
    destructor Destroy; override;

    property IsFormatStored: Boolean read GetFormatStored;
    property IsTitleStored: Boolean read GetTitleStored;
    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsDefaultStored: Boolean read GetDefaultStored;
    property IsRequiredStored: Boolean read GetRequiredStored;
    property IsReadOnlyStored: Boolean read FReadOnlyIsStored;
    property IsExternalDocsStored: Boolean read GetExternalDocsStored;
    property IsExampleStored: Boolean read GetExampleStored;
    property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
  published
    property format: System.String read FFormat write FFormat stored GetFormatStored;
    property title: System.String read FTitle write FTitle stored GetTitleStored;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property default: any read FDefault write FDefault stored GetDefaultStored;
    property required: stringArray read FRequired write FRequired stored GetRequiredStored;
    [FieldName('type')]
    property &type: System.String read FType write FType;
    property readOnly: System.Boolean read FReadOnly write SetReadOnly stored FReadOnlyIsStored;
    property externalDocs: Blue.Print.Open.API.Schema.v20.ExternalDocs read GetExternalDocs write FExternalDocs stored GetExternalDocsStored;
    property example: any read FExample write FExample stored GetExampleStored;
    property vendorExtension: TMap<vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
  end;

  PrimitivesItems = class
  private
    FType: System.String;
    FFormat: System.String;
    FItems: Blue.Print.Open.API.Schema.v20.PrimitivesItems;
    FCollectionFormat: collectionFormat;
    FDefault: default;
    FMaximum: maximum;
    FExclusiveMaximum: exclusiveMaximum;
    FMinimum: minimum;
    FExclusiveMinimum: exclusiveMinimum;
    FMaxLength: maxLength;
    FMinLength: minLength;
    FPattern: pattern;
    FMaxItems: maxItems;
    FMinItems: minItems;
    FUniqueItems: uniqueItems;
    FEnum: enum;
    FMultipleOf: multipleOf;
    FVendorExtension: TMap<vendorExtension>;
    FExclusiveMaximumIsStored: Boolean;
    FExclusiveMinimumIsStored: Boolean;
    FUniqueItemsIsStored: Boolean;

    function GetItems: Blue.Print.Open.API.Schema.v20.PrimitivesItems;
    function GetMinLength: minLength;
    function GetMinItems: minItems;
    function GetVendorExtension: TMap<vendorExtension>;
    function GetTypeStored: Boolean;
    function GetFormatStored: Boolean;
    function GetItemsStored: Boolean;
    function GetCollectionFormatStored: Boolean;
    function GetDefaultStored: Boolean;
    function GetMaximumStored: Boolean;
    function GetMinimumStored: Boolean;
    function GetMaxLengthStored: Boolean;
    function GetMinLengthStored: Boolean;
    function GetPatternStored: Boolean;
    function GetMaxItemsStored: Boolean;
    function GetMinItemsStored: Boolean;
    function GetEnumStored: Boolean;
    function GetMultipleOfStored: Boolean;
    function GetVendorExtensionStored: Boolean;
    procedure SetExclusiveMaximum(const Value: exclusiveMaximum);
    procedure SetExclusiveMinimum(const Value: exclusiveMinimum);
    procedure SetUniqueItems(const Value: uniqueItems);
  public
    destructor Destroy; override;

    property IsTypeStored: Boolean read GetTypeStored;
    property IsFormatStored: Boolean read GetFormatStored;
    property IsItemsStored: Boolean read GetItemsStored;
    property IsCollectionFormatStored: Boolean read GetCollectionFormatStored;
    property IsDefaultStored: Boolean read GetDefaultStored;
    property IsMaximumStored: Boolean read GetMaximumStored;
    property IsExclusiveMaximumStored: Boolean read FExclusiveMaximumIsStored;
    property IsMinimumStored: Boolean read GetMinimumStored;
    property IsExclusiveMinimumStored: Boolean read FExclusiveMinimumIsStored;
    property IsMaxLengthStored: Boolean read GetMaxLengthStored;
    property IsMinLengthStored: Boolean read GetMinLengthStored;
    property IsPatternStored: Boolean read GetPatternStored;
    property IsMaxItemsStored: Boolean read GetMaxItemsStored;
    property IsMinItemsStored: Boolean read GetMinItemsStored;
    property IsUniqueItemsStored: Boolean read FUniqueItemsIsStored;
    property IsEnumStored: Boolean read GetEnumStored;
    property IsMultipleOfStored: Boolean read GetMultipleOfStored;
    property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
  published
    [FieldName('type')]
    property &type: System.String read FType write FType stored GetTypeStored;
    property format: System.String read FFormat write FFormat stored GetFormatStored;
    property items: Blue.Print.Open.API.Schema.v20.PrimitivesItems read GetItems write FItems stored GetItemsStored;
    property collectionFormat: collectionFormat read FCollectionFormat write FCollectionFormat stored GetCollectionFormatStored;
    property default: default read FDefault write FDefault stored GetDefaultStored;
    property maximum: maximum read FMaximum write FMaximum stored GetMaximumStored;
    property exclusiveMaximum: exclusiveMaximum read FExclusiveMaximum write SetExclusiveMaximum stored FExclusiveMaximumIsStored;
    property minimum: minimum read FMinimum write FMinimum stored GetMinimumStored;
    property exclusiveMinimum: exclusiveMinimum read FExclusiveMinimum write SetExclusiveMinimum stored FExclusiveMinimumIsStored;
    property maxLength: maxLength read FMaxLength write FMaxLength stored GetMaxLengthStored;
    property minLength: minLength read GetMinLength write FMinLength stored GetMinLengthStored;
    property pattern: pattern read FPattern write FPattern stored GetPatternStored;
    property maxItems: maxItems read FMaxItems write FMaxItems stored GetMaxItemsStored;
    property minItems: minItems read GetMinItems write FMinItems stored GetMinItemsStored;
    property uniqueItems: uniqueItems read FUniqueItems write SetUniqueItems stored FUniqueItemsIsStored;
    property enum: enum read FEnum write FEnum stored GetEnumStored;
    property multipleOf: multipleOf read FMultipleOf write FMultipleOf stored GetMultipleOfStored;
    property vendorExtension: TMap<vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
  end;

  Xml = class
  private
    FName: System.String;
    FNamespace: System.String;
    FPrefix: System.String;
    FAttribute: System.Boolean;
    FWrapped: System.Boolean;
    FVendorExtension: TMap<vendorExtension>;
    FAttributeIsStored: Boolean;
    FWrappedIsStored: Boolean;

    function GetVendorExtension: TMap<vendorExtension>;
    function GetNameStored: Boolean;
    function GetNamespaceStored: Boolean;
    function GetPrefixStored: Boolean;
    function GetVendorExtensionStored: Boolean;
    procedure SetAttribute(const Value: System.Boolean);
    procedure SetWrapped(const Value: System.Boolean);
  public
    destructor Destroy; override;

    property IsNameStored: Boolean read GetNameStored;
    property IsNamespaceStored: Boolean read GetNamespaceStored;
    property IsPrefixStored: Boolean read GetPrefixStored;
    property IsAttributeStored: Boolean read FAttributeIsStored;
    property IsWrappedStored: Boolean read FWrappedIsStored;
    property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
  published
    property name: System.String read FName write FName stored GetNameStored;
    property namespace: System.String read FNamespace write FNamespace stored GetNamespaceStored;
    property prefix: System.String read FPrefix write FPrefix stored GetPrefixStored;
    property attribute: System.Boolean read FAttribute write SetAttribute stored FAttributeIsStored;
    property wrapped: System.Boolean read FWrapped write SetWrapped stored FWrappedIsStored;
    property vendorExtension: TMap<vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
  end;

  Tag = class
  private
    FName: System.String;
    FDescription: System.String;
    FExternalDocs: Blue.Print.Open.API.Schema.v20.ExternalDocs;
    FVendorExtension: TMap<vendorExtension>;

    function GetExternalDocs: Blue.Print.Open.API.Schema.v20.ExternalDocs;
    function GetVendorExtension: TMap<vendorExtension>;
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
    property externalDocs: Blue.Print.Open.API.Schema.v20.ExternalDocs read GetExternalDocs write FExternalDocs stored GetExternalDocsStored;
    property vendorExtension: TMap<vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
  end;

  SecurityDefinitions = class
  private
    FBasicAuthenticationSecurity: Blue.Print.Open.API.Schema.v20.BasicAuthenticationSecurity;
    FApiKeySecurity: Blue.Print.Open.API.Schema.v20.ApiKeySecurity;
    FOauth2ImplicitSecurity: Blue.Print.Open.API.Schema.v20.Oauth2ImplicitSecurity;
    FOauth2PasswordSecurity: Blue.Print.Open.API.Schema.v20.Oauth2PasswordSecurity;
    FOauth2ApplicationSecurity: Blue.Print.Open.API.Schema.v20.Oauth2ApplicationSecurity;
    FOauth2AccessCodeSecurity: Blue.Print.Open.API.Schema.v20.Oauth2AccessCodeSecurity;

    function GetBasicAuthenticationSecurity: Blue.Print.Open.API.Schema.v20.BasicAuthenticationSecurity;
    function GetApiKeySecurity: Blue.Print.Open.API.Schema.v20.ApiKeySecurity;
    function GetOauth2ImplicitSecurity: Blue.Print.Open.API.Schema.v20.Oauth2ImplicitSecurity;
    function GetOauth2PasswordSecurity: Blue.Print.Open.API.Schema.v20.Oauth2PasswordSecurity;
    function GetOauth2ApplicationSecurity: Blue.Print.Open.API.Schema.v20.Oauth2ApplicationSecurity;
    function GetOauth2AccessCodeSecurity: Blue.Print.Open.API.Schema.v20.Oauth2AccessCodeSecurity;
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
    property basicAuthenticationSecurity: Blue.Print.Open.API.Schema.v20.BasicAuthenticationSecurity read GetBasicAuthenticationSecurity write FBasicAuthenticationSecurity stored GetBasicAuthenticationSecurityStored;
    property apiKeySecurity: Blue.Print.Open.API.Schema.v20.ApiKeySecurity read GetApiKeySecurity write FApiKeySecurity stored GetApiKeySecurityStored;
    property oauth2ImplicitSecurity: Blue.Print.Open.API.Schema.v20.Oauth2ImplicitSecurity read GetOauth2ImplicitSecurity write FOauth2ImplicitSecurity stored GetOauth2ImplicitSecurityStored;
    property oauth2PasswordSecurity: Blue.Print.Open.API.Schema.v20.Oauth2PasswordSecurity read GetOauth2PasswordSecurity write FOauth2PasswordSecurity stored GetOauth2PasswordSecurityStored;
    property oauth2ApplicationSecurity: Blue.Print.Open.API.Schema.v20.Oauth2ApplicationSecurity read GetOauth2ApplicationSecurity write FOauth2ApplicationSecurity stored GetOauth2ApplicationSecurityStored;
    property oauth2AccessCodeSecurity: Blue.Print.Open.API.Schema.v20.Oauth2AccessCodeSecurity read GetOauth2AccessCodeSecurity write FOauth2AccessCodeSecurity stored GetOauth2AccessCodeSecurityStored;
  end;

  BasicAuthenticationSecurity = class
  private
    FType: System.String;
    FDescription: System.String;
    FVendorExtension: TMap<vendorExtension>;

    function GetVendorExtension: TMap<vendorExtension>;
    function GetDescriptionStored: Boolean;
    function GetVendorExtensionStored: Boolean;
  public
    destructor Destroy; override;

    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
  published
    [FieldName('type')]
    property &type: System.String read FType write FType;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property vendorExtension: TMap<vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
  end;

  ApiKeySecurity = class
  private
    FType: System.String;
    FName: System.String;
    FIn: System.String;
    FDescription: System.String;
    FVendorExtension: TMap<vendorExtension>;

    function GetVendorExtension: TMap<vendorExtension>;
    function GetDescriptionStored: Boolean;
    function GetVendorExtensionStored: Boolean;
  public
    destructor Destroy; override;

    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
  published
    [FieldName('type')]
    property &type: System.String read FType write FType;
    property name: System.String read FName write FName;
    [FieldName('in')]
    property &in: System.String read FIn write FIn;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property vendorExtension: TMap<vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
  end;

  Oauth2ImplicitSecurity = class
  private
    FType: System.String;
    FFlow: System.String;
    FScopes: oauth2Scopes;
    FAuthorizationUrl: System.String;
    FDescription: System.String;
    FVendorExtension: TMap<vendorExtension>;

    function GetScopes: oauth2Scopes;
    function GetVendorExtension: TMap<vendorExtension>;
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
    property &type: System.String read FType write FType;
    property flow: System.String read FFlow write FFlow;
    property scopes: oauth2Scopes read GetScopes write FScopes stored GetScopesStored;
    property authorizationUrl: System.String read FAuthorizationUrl write FAuthorizationUrl;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property vendorExtension: TMap<vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
  end;

  Oauth2PasswordSecurity = class
  private
    FType: System.String;
    FFlow: System.String;
    FScopes: oauth2Scopes;
    FTokenUrl: System.String;
    FDescription: System.String;
    FVendorExtension: TMap<vendorExtension>;

    function GetScopes: oauth2Scopes;
    function GetVendorExtension: TMap<vendorExtension>;
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
    property &type: System.String read FType write FType;
    property flow: System.String read FFlow write FFlow;
    property scopes: oauth2Scopes read GetScopes write FScopes stored GetScopesStored;
    property tokenUrl: System.String read FTokenUrl write FTokenUrl;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property vendorExtension: TMap<vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
  end;

  Oauth2ApplicationSecurity = class
  private
    FType: System.String;
    FFlow: System.String;
    FScopes: oauth2Scopes;
    FTokenUrl: System.String;
    FDescription: System.String;
    FVendorExtension: TMap<vendorExtension>;

    function GetScopes: oauth2Scopes;
    function GetVendorExtension: TMap<vendorExtension>;
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
    property &type: System.String read FType write FType;
    property flow: System.String read FFlow write FFlow;
    property scopes: oauth2Scopes read GetScopes write FScopes stored GetScopesStored;
    property tokenUrl: System.String read FTokenUrl write FTokenUrl;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property vendorExtension: TMap<vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
  end;

  Oauth2AccessCodeSecurity = class
  private
    FType: System.String;
    FFlow: System.String;
    FScopes: oauth2Scopes;
    FAuthorizationUrl: System.String;
    FTokenUrl: System.String;
    FDescription: System.String;
    FVendorExtension: TMap<vendorExtension>;

    function GetScopes: oauth2Scopes;
    function GetVendorExtension: TMap<vendorExtension>;
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
    property &type: System.String read FType write FType;
    property flow: System.String read FFlow write FFlow;
    property scopes: oauth2Scopes read GetScopes write FScopes stored GetScopesStored;
    property authorizationUrl: System.String read FAuthorizationUrl write FAuthorizationUrl;
    property tokenUrl: System.String read FTokenUrl write FTokenUrl;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property vendorExtension: TMap<vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
  end;

  [SingleObject]
  ParametersListArrayItem = class
  private
    FParameter: Blue.Print.Open.API.Schema.v20.Parameter;
    FJsonReference: Blue.Print.Open.API.Schema.v20.JsonReference;

    function GetParameter: Blue.Print.Open.API.Schema.v20.Parameter;
    function GetJsonReference: Blue.Print.Open.API.Schema.v20.JsonReference;
    function GetParameterStored: Boolean;
    function GetJsonReferenceStored: Boolean;
  public
    destructor Destroy; override;

    property IsParameterStored: Boolean read GetParameterStored;
    property IsJsonReferenceStored: Boolean read GetJsonReferenceStored;
  published
    property parameter: Blue.Print.Open.API.Schema.v20.Parameter read GetParameter write FParameter stored GetParameterStored;
    property jsonReference: Blue.Print.Open.API.Schema.v20.JsonReference read GetJsonReference write FJsonReference stored GetJsonReferenceStored;
  end;

  JsonReference = class
  private
    FRef: System.String;
  published
    [FieldName('$ref')]
    property ref: System.String read FRef write FRef;
  end;

implementation

uses System.SysUtils;

{ TJSONSchema }

destructor TJSONSchema.Destroy;
begin
  FMinLength.Free;

  FAdditionalItems.Free;

  FItems.Free;

  FMinItems.Free;

  FMinProperties.Free;

  FAdditionalProperties.Free;

  FDefinitions.Free;

  FProperties.Free;

  FPatternProperties.Free;

  FDependencies.Free;

  FType.Free;

  for var AObject in FAllOf do
    AObject.Free;

  for var AObject in FAnyOf do
    AObject.Free;

  for var AObject in FOneOf do
    AObject.Free;

  FNot.Free;

  inherited;
end;

function TJSONSchema.GetIdStored: Boolean;
begin
  Result := not FId.IsEmpty;
end;

function TJSONSchema.GetSchemaStored: Boolean;
begin
  Result := not FSchema.IsEmpty;
end;

function TJSONSchema.GetTitleStored: Boolean;
begin
  Result := not FTitle.IsEmpty;
end;

function TJSONSchema.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TJSONSchema.GetDefaultStored: Boolean;
begin
  Result := False;
end;

function TJSONSchema.GetMultipleOfStored: Boolean;
begin
  Result := FMultipleOf <> 0;
end;

function TJSONSchema.GetMaximumStored: Boolean;
begin
  Result := FMaximum <> 0;
end;

procedure TJSONSchema.SetExclusiveMaximum(const Value: System.Boolean);
begin
  FExclusiveMaximum := Value;
  FExclusiveMaximumIsStored := True;
end;

function TJSONSchema.GetMinimumStored: Boolean;
begin
  Result := FMinimum <> 0;
end;

procedure TJSONSchema.SetExclusiveMinimum(const Value: System.Boolean);
begin
  FExclusiveMinimum := Value;
  FExclusiveMinimumIsStored := True;
end;

function TJSONSchema.GetMaxLengthStored: Boolean;
begin
  Result := FMaxLength <> 0;
end;

function TJSONSchema.GetMinLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
begin
  if not Assigned(FMinLength) then
    FMinLength := Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0.Create;

  Result := FMinLength;
end;

function TJSONSchema.GetMinLengthStored: Boolean;
begin
  Result := Assigned(FMinLength);
end;

function TJSONSchema.GetPatternStored: Boolean;
begin
  Result := not FPattern.IsEmpty;
end;

function TJSONSchema.GetAdditionalItems: Blue.Print.Open.API.Schema.v20.TJSONSchema.TAdditionalItems;
begin
  if not Assigned(FAdditionalItems) then
    FAdditionalItems := Blue.Print.Open.API.Schema.v20.TJSONSchema.TAdditionalItems.Create;

  Result := FAdditionalItems;
end;

function TJSONSchema.GetAdditionalItemsStored: Boolean;
begin
  Result := Assigned(FAdditionalItems);
end;

function TJSONSchema.GetItems: Blue.Print.Open.API.Schema.v20.TJSONSchema.TItems;
begin
  if not Assigned(FItems) then
    FItems := Blue.Print.Open.API.Schema.v20.TJSONSchema.TItems.Create;

  Result := FItems;
end;

function TJSONSchema.GetItemsStored: Boolean;
begin
  Result := Assigned(FItems);
end;

function TJSONSchema.GetMaxItemsStored: Boolean;
begin
  Result := FMaxItems <> 0;
end;

function TJSONSchema.GetMinItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
begin
  if not Assigned(FMinItems) then
    FMinItems := Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0.Create;

  Result := FMinItems;
end;

function TJSONSchema.GetMinItemsStored: Boolean;
begin
  Result := Assigned(FMinItems);
end;

procedure TJSONSchema.SetUniqueItems(const Value: System.Boolean);
begin
  FUniqueItems := Value;
  FUniqueItemsIsStored := True;
end;

function TJSONSchema.GetMaxPropertiesStored: Boolean;
begin
  Result := FMaxProperties <> 0;
end;

function TJSONSchema.GetMinProperties: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
begin
  if not Assigned(FMinProperties) then
    FMinProperties := Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0.Create;

  Result := FMinProperties;
end;

function TJSONSchema.GetMinPropertiesStored: Boolean;
begin
  Result := Assigned(FMinProperties);
end;

function TJSONSchema.GetRequiredStored: Boolean;
begin
  Result := Assigned(FRequired);
end;

function TJSONSchema.GetAdditionalProperties: Blue.Print.Open.API.Schema.v20.TJSONSchema.TAdditionalProperties;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := Blue.Print.Open.API.Schema.v20.TJSONSchema.TAdditionalProperties.Create;

  Result := FAdditionalProperties;
end;

function TJSONSchema.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

function TJSONSchema.GetDefinitions: TMap<Blue.Print.Open.API.Schema.v20.TJSONSchema>;
begin
  if not Assigned(FDefinitions) then
    FDefinitions := TMap<Blue.Print.Open.API.Schema.v20.TJSONSchema>.Create;

  Result := FDefinitions;
end;

function TJSONSchema.GetDefinitionsStored: Boolean;
begin
  Result := Assigned(FDefinitions);
end;

function TJSONSchema.GetProperties: TMap<Blue.Print.Open.API.Schema.v20.TJSONSchema>;
begin
  if not Assigned(FProperties) then
    FProperties := TMap<Blue.Print.Open.API.Schema.v20.TJSONSchema>.Create;

  Result := FProperties;
end;

function TJSONSchema.GetPropertiesStored: Boolean;
begin
  Result := Assigned(FProperties);
end;

function TJSONSchema.GetPatternProperties: TMap<Blue.Print.Open.API.Schema.v20.TJSONSchema>;
begin
  if not Assigned(FPatternProperties) then
    FPatternProperties := TMap<Blue.Print.Open.API.Schema.v20.TJSONSchema>.Create;

  Result := FPatternProperties;
end;

function TJSONSchema.GetPatternPropertiesStored: Boolean;
begin
  Result := Assigned(FPatternProperties);
end;

function TJSONSchema.GetDependencies: Blue.Print.Open.API.Schema.v20.TJSONSchema.TDependencies;
begin
  if not Assigned(FDependencies) then
    FDependencies := Blue.Print.Open.API.Schema.v20.TJSONSchema.TDependencies.Create;

  Result := FDependencies;
end;

function TJSONSchema.GetDependenciesStored: Boolean;
begin
  Result := Assigned(FDependencies);
end;

function TJSONSchema.GetEnumStored: Boolean;
begin
  Result := Assigned(FEnum);
end;

function TJSONSchema.GetType: Blue.Print.Open.API.Schema.v20.TJSONSchema.TType;
begin
  if not Assigned(FType) then
    FType := Blue.Print.Open.API.Schema.v20.TJSONSchema.TType.Create;

  Result := FType;
end;

function TJSONSchema.GetTypeStored: Boolean;
begin
  Result := Assigned(FType);
end;

function TJSONSchema.GetFormatStored: Boolean;
begin
  Result := not FFormat.IsEmpty;
end;

function TJSONSchema.AddAllOf: Blue.Print.Open.API.Schema.v20.TJSONSchema;
begin
  Result := Blue.Print.Open.API.Schema.v20.TJSONSchema.Create;

  FAllOf := FAllOf + [Result];
end;

function TJSONSchema.GetAllOfStored: Boolean;
begin
  Result := Assigned(FAllOf);
end;

function TJSONSchema.AddAnyOf: Blue.Print.Open.API.Schema.v20.TJSONSchema;
begin
  Result := Blue.Print.Open.API.Schema.v20.TJSONSchema.Create;

  FAnyOf := FAnyOf + [Result];
end;

function TJSONSchema.GetAnyOfStored: Boolean;
begin
  Result := Assigned(FAnyOf);
end;

function TJSONSchema.AddOneOf: Blue.Print.Open.API.Schema.v20.TJSONSchema;
begin
  Result := Blue.Print.Open.API.Schema.v20.TJSONSchema.Create;

  FOneOf := FOneOf + [Result];
end;

function TJSONSchema.GetOneOfStored: Boolean;
begin
  Result := Assigned(FOneOf);
end;

function TJSONSchema.GetNot: Blue.Print.Open.API.Schema.v20.TJSONSchema;
begin
  if not Assigned(FNot) then
    FNot := Blue.Print.Open.API.Schema.v20.TJSONSchema.Create;

  Result := FNot;
end;

function TJSONSchema.GetNotStored: Boolean;
begin
  Result := Assigned(FNot);
end;

{ TJSONSchema.TAdditionalItems }

destructor TJSONSchema.TAdditionalItems.Destroy;
begin
  FSchema.Free;

  inherited;
end;

procedure TJSONSchema.TAdditionalItems.SetBoolean(const Value: Boolean);
begin
  FBoolean := Value;
  FBooleanIsStored := True;
end;

function TJSONSchema.TAdditionalItems.GetSchema: Blue.Print.Open.API.Schema.v20.TJSONSchema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v20.TJSONSchema.Create;

  Result := FSchema;
end;

function TJSONSchema.TAdditionalItems.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

{ TJSONSchema.TItems }

destructor TJSONSchema.TItems.Destroy;
begin
  FSchema.Free;

  for var AObject in FSchemaArray do
    AObject.Free;

  inherited;
end;

function TJSONSchema.TItems.GetSchema: Blue.Print.Open.API.Schema.v20.TJSONSchema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v20.TJSONSchema.Create;

  Result := FSchema;
end;

function TJSONSchema.TItems.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function TJSONSchema.TItems.AddSchemaArray: Blue.Print.Open.API.Schema.v20.TJSONSchema;
begin
  Result := Blue.Print.Open.API.Schema.v20.TJSONSchema.Create;

  FSchemaArray := FSchemaArray + [Result];
end;

function TJSONSchema.TItems.GetSchemaArrayStored: Boolean;
begin
  Result := Assigned(FSchemaArray);
end;

{ TJSONSchema.TAdditionalProperties }

destructor TJSONSchema.TAdditionalProperties.Destroy;
begin
  FSchema.Free;

  inherited;
end;

procedure TJSONSchema.TAdditionalProperties.SetBoolean(const Value: Boolean);
begin
  FBoolean := Value;
  FBooleanIsStored := True;
end;

function TJSONSchema.TAdditionalProperties.GetSchema: Blue.Print.Open.API.Schema.v20.TJSONSchema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v20.TJSONSchema.Create;

  Result := FSchema;
end;

function TJSONSchema.TAdditionalProperties.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

{ TJSONSchema.TDependencies }

destructor TJSONSchema.TDependencies.Destroy;
begin
  FSchema.Free;

  inherited;
end;

function TJSONSchema.TDependencies.GetSchema: Blue.Print.Open.API.Schema.v20.TJSONSchema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v20.TJSONSchema.Create;

  Result := FSchema;
end;

function TJSONSchema.TDependencies.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function TJSONSchema.TDependencies.GetStringArrayStored: Boolean;
begin
  Result := Assigned(FStringArray);
end;

{ TJSONSchema.TType }

procedure TJSONSchema.TType.SetSimpleTypes(const Value: simpleTypes);
begin
  FSimpleTypes := Value;
  FSimpleTypesIsStored := True;
end;

function TJSONSchema.TType.GetArrayStored: Boolean;
begin
  Result := Assigned(FArray);
end;

{ PositiveIntegerDefault0 }

function PositiveIntegerDefault0.GetPositiveIntegerStored: Boolean;
begin
  Result := FPositiveInteger <> 0;
end;

{ TOpenAPIDefinition }

destructor TOpenAPIDefinition.Destroy;
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

function TOpenAPIDefinition.GetInfo: Blue.Print.Open.API.Schema.v20.Info;
begin
  if not Assigned(FInfo) then
    FInfo := Blue.Print.Open.API.Schema.v20.Info.Create;

  Result := FInfo;
end;

function TOpenAPIDefinition.GetHostStored: Boolean;
begin
  Result := not FHost.IsEmpty;
end;

function TOpenAPIDefinition.GetBasePathStored: Boolean;
begin
  Result := not FBasePath.IsEmpty;
end;

function TOpenAPIDefinition.GetSchemesStored: Boolean;
begin
  Result := Assigned(FSchemes);
end;

function TOpenAPIDefinition.GetConsumes: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.TConsumes;
begin
  if not Assigned(FConsumes) then
    FConsumes := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.TConsumes.Create;

  Result := FConsumes;
end;

function TOpenAPIDefinition.GetConsumesStored: Boolean;
begin
  Result := Assigned(FConsumes);
end;

function TOpenAPIDefinition.GetProduces: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.TProduces;
begin
  if not Assigned(FProduces) then
    FProduces := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.TProduces.Create;

  Result := FProduces;
end;

function TOpenAPIDefinition.GetProducesStored: Boolean;
begin
  Result := Assigned(FProduces);
end;

function TOpenAPIDefinition.GetPaths: Blue.Print.Open.API.Schema.v20.Paths;
begin
  if not Assigned(FPaths) then
    FPaths := Blue.Print.Open.API.Schema.v20.Paths.Create;

  Result := FPaths;
end;

function TOpenAPIDefinition.GetDefinitions: TMap<Blue.Print.Open.API.Schema.v20.Schema>;
begin
  if not Assigned(FDefinitions) then
    FDefinitions := TMap<Blue.Print.Open.API.Schema.v20.Schema>.Create;

  Result := FDefinitions;
end;

function TOpenAPIDefinition.GetDefinitionsStored: Boolean;
begin
  Result := Assigned(FDefinitions);
end;

function TOpenAPIDefinition.GetParameters: TMap<Blue.Print.Open.API.Schema.v20.Parameter>;
begin
  if not Assigned(FParameters) then
    FParameters := TMap<Blue.Print.Open.API.Schema.v20.Parameter>.Create;

  Result := FParameters;
end;

function TOpenAPIDefinition.GetParametersStored: Boolean;
begin
  Result := Assigned(FParameters);
end;

function TOpenAPIDefinition.GetResponses: Blue.Print.Open.API.Schema.v20.Responses;
begin
  if not Assigned(FResponses) then
    FResponses := Blue.Print.Open.API.Schema.v20.Responses.Create;

  Result := FResponses;
end;

function TOpenAPIDefinition.GetResponsesStored: Boolean;
begin
  Result := Assigned(FResponses);
end;

function TOpenAPIDefinition.GetSecurityStored: Boolean;
begin
  Result := Assigned(FSecurity);
end;

function TOpenAPIDefinition.GetSecurityDefinitions: Blue.Print.Open.API.Schema.v20.SecurityDefinitions;
begin
  if not Assigned(FSecurityDefinitions) then
    FSecurityDefinitions := Blue.Print.Open.API.Schema.v20.SecurityDefinitions.Create;

  Result := FSecurityDefinitions;
end;

function TOpenAPIDefinition.GetSecurityDefinitionsStored: Boolean;
begin
  Result := Assigned(FSecurityDefinitions);
end;

function TOpenAPIDefinition.AddTags: Blue.Print.Open.API.Schema.v20.Tag;
begin
  Result := Blue.Print.Open.API.Schema.v20.Tag.Create;

  FTags := FTags + [Result];
end;

function TOpenAPIDefinition.GetTagsStored: Boolean;
begin
  Result := Assigned(FTags);
end;

function TOpenAPIDefinition.GetExternalDocs: Blue.Print.Open.API.Schema.v20.ExternalDocs;
begin
  if not Assigned(FExternalDocs) then
    FExternalDocs := Blue.Print.Open.API.Schema.v20.ExternalDocs.Create;

  Result := FExternalDocs;
end;

function TOpenAPIDefinition.GetExternalDocsStored: Boolean;
begin
  Result := Assigned(FExternalDocs);
end;

function TOpenAPIDefinition.GetVendorExtension: TMap<vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TMap<System.Rtti.TValue>.Create;

  Result := FVendorExtension;
end;

function TOpenAPIDefinition.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ TOpenAPIDefinition.TConsumes }

function TOpenAPIDefinition.TConsumes.GetMediaTypeListStored: Boolean;
begin
  Result := Assigned(FMediaTypeList);
end;

{ TOpenAPIDefinition.TProduces }

function TOpenAPIDefinition.TProduces.GetMediaTypeListStored: Boolean;
begin
  Result := Assigned(FMediaTypeList);
end;

{ Info }

destructor Info.Destroy;
begin
  FContact.Free;

  FLicense.Free;

  FVendorExtension.Free;

  inherited;
end;

function Info.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function Info.GetTermsOfServiceStored: Boolean;
begin
  Result := not FTermsOfService.IsEmpty;
end;

function Info.GetContact: Blue.Print.Open.API.Schema.v20.Contact;
begin
  if not Assigned(FContact) then
    FContact := Blue.Print.Open.API.Schema.v20.Contact.Create;

  Result := FContact;
end;

function Info.GetContactStored: Boolean;
begin
  Result := Assigned(FContact);
end;

function Info.GetLicense: Blue.Print.Open.API.Schema.v20.License;
begin
  if not Assigned(FLicense) then
    FLicense := Blue.Print.Open.API.Schema.v20.License.Create;

  Result := FLicense;
end;

function Info.GetLicenseStored: Boolean;
begin
  Result := Assigned(FLicense);
end;

function Info.GetVendorExtension: TMap<vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TMap<System.Rtti.TValue>.Create;

  Result := FVendorExtension;
end;

function Info.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ Contact }

destructor Contact.Destroy;
begin
  FVendorExtension.Free;

  inherited;
end;

function Contact.GetNameStored: Boolean;
begin
  Result := not FName.IsEmpty;
end;

function Contact.GetUrlStored: Boolean;
begin
  Result := not FUrl.IsEmpty;
end;

function Contact.GetEmailStored: Boolean;
begin
  Result := not FEmail.IsEmpty;
end;

function Contact.GetVendorExtension: TMap<vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TMap<System.Rtti.TValue>.Create;

  Result := FVendorExtension;
end;

function Contact.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ License }

destructor License.Destroy;
begin
  FVendorExtension.Free;

  inherited;
end;

function License.GetUrlStored: Boolean;
begin
  Result := not FUrl.IsEmpty;
end;

function License.GetVendorExtension: TMap<vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TMap<System.Rtti.TValue>.Create;

  Result := FVendorExtension;
end;

function License.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ Paths }

destructor Paths.Destroy;
begin
  FVendorExtension.Free;

  FPathItem.Free;

  inherited;
end;

function Paths.GetVendorExtension: TMap<vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TMap<System.Rtti.TValue>.Create;

  Result := FVendorExtension;
end;

function Paths.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

function Paths.GetPathItem: TMap<Blue.Print.Open.API.Schema.v20.PathItem>;
begin
  if not Assigned(FPathItem) then
    FPathItem := TMap<Blue.Print.Open.API.Schema.v20.PathItem>.Create;

  Result := FPathItem;
end;

function Paths.GetPathItemStored: Boolean;
begin
  Result := Assigned(FPathItem);
end;

{ ExternalDocs }

destructor ExternalDocs.Destroy;
begin
  FVendorExtension.Free;

  inherited;
end;

function ExternalDocs.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function ExternalDocs.GetVendorExtension: TMap<vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TMap<System.Rtti.TValue>.Create;

  Result := FVendorExtension;
end;

function ExternalDocs.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ Operation }

destructor Operation.Destroy;
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

function Operation.GetTagsStored: Boolean;
begin
  Result := Assigned(FTags);
end;

function Operation.GetSummaryStored: Boolean;
begin
  Result := not FSummary.IsEmpty;
end;

function Operation.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function Operation.GetExternalDocs: Blue.Print.Open.API.Schema.v20.ExternalDocs;
begin
  if not Assigned(FExternalDocs) then
    FExternalDocs := Blue.Print.Open.API.Schema.v20.ExternalDocs.Create;

  Result := FExternalDocs;
end;

function Operation.GetExternalDocsStored: Boolean;
begin
  Result := Assigned(FExternalDocs);
end;

function Operation.GetOperationIdStored: Boolean;
begin
  Result := not FOperationId.IsEmpty;
end;

function Operation.GetProduces: Blue.Print.Open.API.Schema.v20.Operation.TProduces;
begin
  if not Assigned(FProduces) then
    FProduces := Blue.Print.Open.API.Schema.v20.Operation.TProduces.Create;

  Result := FProduces;
end;

function Operation.GetProducesStored: Boolean;
begin
  Result := Assigned(FProduces);
end;

function Operation.GetConsumes: Blue.Print.Open.API.Schema.v20.Operation.TConsumes;
begin
  if not Assigned(FConsumes) then
    FConsumes := Blue.Print.Open.API.Schema.v20.Operation.TConsumes.Create;

  Result := FConsumes;
end;

function Operation.GetConsumesStored: Boolean;
begin
  Result := Assigned(FConsumes);
end;

function Operation.AddParameters: Blue.Print.Open.API.Schema.v20.ParametersListArrayItem;
begin
  Result := Blue.Print.Open.API.Schema.v20.ParametersListArrayItem.Create;

  FParameters := FParameters + [Result];
end;

function Operation.GetParametersStored: Boolean;
begin
  Result := Assigned(FParameters);
end;

function Operation.GetResponses: Blue.Print.Open.API.Schema.v20.Responses;
begin
  if not Assigned(FResponses) then
    FResponses := Blue.Print.Open.API.Schema.v20.Responses.Create;

  Result := FResponses;
end;

function Operation.GetSchemesStored: Boolean;
begin
  Result := Assigned(FSchemes);
end;

procedure Operation.SetDeprecated(const Value: System.Boolean);
begin
  FDeprecated := Value;
  FDeprecatedIsStored := True;
end;

function Operation.GetSecurityStored: Boolean;
begin
  Result := Assigned(FSecurity);
end;

function Operation.GetVendorExtension: TMap<vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TMap<System.Rtti.TValue>.Create;

  Result := FVendorExtension;
end;

function Operation.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ Operation.TProduces }

function Operation.TProduces.GetMediaTypeListStored: Boolean;
begin
  Result := Assigned(FMediaTypeList);
end;

{ Operation.TConsumes }

function Operation.TConsumes.GetMediaTypeListStored: Boolean;
begin
  Result := Assigned(FMediaTypeList);
end;

{ PathItem }

destructor PathItem.Destroy;
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

function PathItem.GetRefStored: Boolean;
begin
  Result := not FRef.IsEmpty;
end;

function PathItem.GetGet: Blue.Print.Open.API.Schema.v20.Operation;
begin
  if not Assigned(FGet) then
    FGet := Blue.Print.Open.API.Schema.v20.Operation.Create;

  Result := FGet;
end;

function PathItem.GetGetStored: Boolean;
begin
  Result := Assigned(FGet);
end;

function PathItem.GetPut: Blue.Print.Open.API.Schema.v20.Operation;
begin
  if not Assigned(FPut) then
    FPut := Blue.Print.Open.API.Schema.v20.Operation.Create;

  Result := FPut;
end;

function PathItem.GetPutStored: Boolean;
begin
  Result := Assigned(FPut);
end;

function PathItem.GetPost: Blue.Print.Open.API.Schema.v20.Operation;
begin
  if not Assigned(FPost) then
    FPost := Blue.Print.Open.API.Schema.v20.Operation.Create;

  Result := FPost;
end;

function PathItem.GetPostStored: Boolean;
begin
  Result := Assigned(FPost);
end;

function PathItem.GetDelete: Blue.Print.Open.API.Schema.v20.Operation;
begin
  if not Assigned(FDelete) then
    FDelete := Blue.Print.Open.API.Schema.v20.Operation.Create;

  Result := FDelete;
end;

function PathItem.GetDeleteStored: Boolean;
begin
  Result := Assigned(FDelete);
end;

function PathItem.GetOptions: Blue.Print.Open.API.Schema.v20.Operation;
begin
  if not Assigned(FOptions) then
    FOptions := Blue.Print.Open.API.Schema.v20.Operation.Create;

  Result := FOptions;
end;

function PathItem.GetOptionsStored: Boolean;
begin
  Result := Assigned(FOptions);
end;

function PathItem.GetHead: Blue.Print.Open.API.Schema.v20.Operation;
begin
  if not Assigned(FHead) then
    FHead := Blue.Print.Open.API.Schema.v20.Operation.Create;

  Result := FHead;
end;

function PathItem.GetHeadStored: Boolean;
begin
  Result := Assigned(FHead);
end;

function PathItem.GetPatch: Blue.Print.Open.API.Schema.v20.Operation;
begin
  if not Assigned(FPatch) then
    FPatch := Blue.Print.Open.API.Schema.v20.Operation.Create;

  Result := FPatch;
end;

function PathItem.GetPatchStored: Boolean;
begin
  Result := Assigned(FPatch);
end;

function PathItem.AddParameters: Blue.Print.Open.API.Schema.v20.ParametersListArrayItem;
begin
  Result := Blue.Print.Open.API.Schema.v20.ParametersListArrayItem.Create;

  FParameters := FParameters + [Result];
end;

function PathItem.GetParametersStored: Boolean;
begin
  Result := Assigned(FParameters);
end;

function PathItem.GetVendorExtension: TMap<vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TMap<System.Rtti.TValue>.Create;

  Result := FVendorExtension;
end;

function PathItem.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ Responses }

destructor Responses.Destroy;
begin
  FResponseValue.Free;

  FVendorExtension.Free;

  inherited;
end;

function Responses.GetResponseValue: TMap<Blue.Print.Open.API.Schema.v20.ResponseValue>;
begin
  if not Assigned(FResponseValue) then
    FResponseValue := TMap<Blue.Print.Open.API.Schema.v20.ResponseValue>.Create;

  Result := FResponseValue;
end;

function Responses.GetResponseValueStored: Boolean;
begin
  Result := Assigned(FResponseValue);
end;

function Responses.GetVendorExtension: TMap<vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TMap<System.Rtti.TValue>.Create;

  Result := FVendorExtension;
end;

function Responses.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ ResponseValue }

destructor ResponseValue.Destroy;
begin
  FResponse.Free;

  FJsonReference.Free;

  inherited;
end;

function ResponseValue.GetResponse: Blue.Print.Open.API.Schema.v20.Response;
begin
  if not Assigned(FResponse) then
    FResponse := Blue.Print.Open.API.Schema.v20.Response.Create;

  Result := FResponse;
end;

function ResponseValue.GetResponseStored: Boolean;
begin
  Result := Assigned(FResponse);
end;

function ResponseValue.GetJsonReference: Blue.Print.Open.API.Schema.v20.JsonReference;
begin
  if not Assigned(FJsonReference) then
    FJsonReference := Blue.Print.Open.API.Schema.v20.JsonReference.Create;

  Result := FJsonReference;
end;

function ResponseValue.GetJsonReferenceStored: Boolean;
begin
  Result := Assigned(FJsonReference);
end;

{ Response }

destructor Response.Destroy;
begin
  FSchema.Free;

  FHeaders.Free;

  FExamples.Free;

  FVendorExtension.Free;

  inherited;
end;

function Response.GetSchema: Blue.Print.Open.API.Schema.v20.Response.TSchema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v20.Response.TSchema.Create;

  Result := FSchema;
end;

function Response.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function Response.GetHeaders: TMap<Blue.Print.Open.API.Schema.v20.Header>;
begin
  if not Assigned(FHeaders) then
    FHeaders := TMap<Blue.Print.Open.API.Schema.v20.Header>.Create;

  Result := FHeaders;
end;

function Response.GetHeadersStored: Boolean;
begin
  Result := Assigned(FHeaders);
end;

function Response.GetExamples: TMap<any>;
begin
  if not Assigned(FExamples) then
    FExamples := TMap<System.Rtti.TValue>.Create;

  Result := FExamples;
end;

function Response.GetExamplesStored: Boolean;
begin
  Result := Assigned(FExamples);
end;

function Response.GetVendorExtension: TMap<vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TMap<System.Rtti.TValue>.Create;

  Result := FVendorExtension;
end;

function Response.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ Response.TSchema }

destructor Response.TSchema.Destroy;
begin
  FSchema.Free;

  FFileSchema.Free;

  inherited;
end;

function Response.TSchema.GetSchema: Blue.Print.Open.API.Schema.v20.Response.TSchema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v20.Response.TSchema.Create;

  Result := FSchema;
end;

function Response.TSchema.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function Response.TSchema.GetFileSchema: Blue.Print.Open.API.Schema.v20.FileSchema;
begin
  if not Assigned(FFileSchema) then
    FFileSchema := Blue.Print.Open.API.Schema.v20.FileSchema.Create;

  Result := FFileSchema;
end;

function Response.TSchema.GetFileSchemaStored: Boolean;
begin
  Result := Assigned(FFileSchema);
end;

{ Header }

destructor Header.Destroy;
begin
  FItems.Free;

  FMinLength.Free;

  FMinItems.Free;

  FVendorExtension.Free;

  inherited;
end;

function Header.GetFormatStored: Boolean;
begin
  Result := not FFormat.IsEmpty;
end;

function Header.GetItems: Blue.Print.Open.API.Schema.v20.PrimitivesItems;
begin
  if not Assigned(FItems) then
    FItems := Blue.Print.Open.API.Schema.v20.PrimitivesItems.Create;

  Result := FItems;
end;

function Header.GetItemsStored: Boolean;
begin
  Result := Assigned(FItems);
end;

function Header.GetCollectionFormatStored: Boolean;
begin
  Result := not FCollectionFormat.IsEmpty;
end;

function Header.GetDefaultStored: Boolean;
begin
  Result := False;
end;

function Header.GetMaximumStored: Boolean;
begin
  Result := FMaximum <> 0;
end;

procedure Header.SetExclusiveMaximum(const Value: exclusiveMaximum);
begin
  FExclusiveMaximum := Value;
  FExclusiveMaximumIsStored := True;
end;

function Header.GetMinimumStored: Boolean;
begin
  Result := FMinimum <> 0;
end;

procedure Header.SetExclusiveMinimum(const Value: exclusiveMinimum);
begin
  FExclusiveMinimum := Value;
  FExclusiveMinimumIsStored := True;
end;

function Header.GetMaxLengthStored: Boolean;
begin
  Result := FMaxLength <> 0;
end;

function Header.GetMinLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
begin
  if not Assigned(FMinLength) then
    FMinLength := Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0.Create;

  Result := FMinLength;
end;

function Header.GetMinLengthStored: Boolean;
begin
  Result := Assigned(FMinLength);
end;

function Header.GetPatternStored: Boolean;
begin
  Result := not FPattern.IsEmpty;
end;

function Header.GetMaxItemsStored: Boolean;
begin
  Result := FMaxItems <> 0;
end;

function Header.GetMinItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
begin
  if not Assigned(FMinItems) then
    FMinItems := Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0.Create;

  Result := FMinItems;
end;

function Header.GetMinItemsStored: Boolean;
begin
  Result := Assigned(FMinItems);
end;

procedure Header.SetUniqueItems(const Value: uniqueItems);
begin
  FUniqueItems := Value;
  FUniqueItemsIsStored := True;
end;

function Header.GetEnumStored: Boolean;
begin
  Result := Assigned(FEnum);
end;

function Header.GetMultipleOfStored: Boolean;
begin
  Result := FMultipleOf <> 0;
end;

function Header.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function Header.GetVendorExtension: TMap<vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TMap<System.Rtti.TValue>.Create;

  Result := FVendorExtension;
end;

function Header.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ BodyParameter }

destructor BodyParameter.Destroy;
begin
  FSchema.Free;

  FVendorExtension.Free;

  inherited;
end;

function BodyParameter.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

procedure BodyParameter.SetRequired(const Value: System.Boolean);
begin
  FRequired := Value;
  FRequiredIsStored := True;
end;

function BodyParameter.GetSchema: Blue.Print.Open.API.Schema.v20.Schema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v20.Schema.Create;

  Result := FSchema;
end;

function BodyParameter.GetVendorExtension: TMap<vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TMap<System.Rtti.TValue>.Create;

  Result := FVendorExtension;
end;

function BodyParameter.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ HeaderParameterSubSchema }

destructor HeaderParameterSubSchema.Destroy;
begin
  FItems.Free;

  FMinLength.Free;

  FMinItems.Free;

  FVendorExtension.Free;

  inherited;
end;

procedure HeaderParameterSubSchema.SetRequired(const Value: System.Boolean);
begin
  FRequired := Value;
  FRequiredIsStored := True;
end;

function HeaderParameterSubSchema.GetInStored: Boolean;
begin
  Result := not FIn.IsEmpty;
end;

function HeaderParameterSubSchema.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function HeaderParameterSubSchema.GetNameStored: Boolean;
begin
  Result := not FName.IsEmpty;
end;

function HeaderParameterSubSchema.GetTypeStored: Boolean;
begin
  Result := not FType.IsEmpty;
end;

function HeaderParameterSubSchema.GetFormatStored: Boolean;
begin
  Result := not FFormat.IsEmpty;
end;

function HeaderParameterSubSchema.GetItems: Blue.Print.Open.API.Schema.v20.PrimitivesItems;
begin
  if not Assigned(FItems) then
    FItems := Blue.Print.Open.API.Schema.v20.PrimitivesItems.Create;

  Result := FItems;
end;

function HeaderParameterSubSchema.GetItemsStored: Boolean;
begin
  Result := Assigned(FItems);
end;

function HeaderParameterSubSchema.GetCollectionFormatStored: Boolean;
begin
  Result := not FCollectionFormat.IsEmpty;
end;

function HeaderParameterSubSchema.GetDefaultStored: Boolean;
begin
  Result := False;
end;

function HeaderParameterSubSchema.GetMaximumStored: Boolean;
begin
  Result := FMaximum <> 0;
end;

procedure HeaderParameterSubSchema.SetExclusiveMaximum(const Value: exclusiveMaximum);
begin
  FExclusiveMaximum := Value;
  FExclusiveMaximumIsStored := True;
end;

function HeaderParameterSubSchema.GetMinimumStored: Boolean;
begin
  Result := FMinimum <> 0;
end;

procedure HeaderParameterSubSchema.SetExclusiveMinimum(const Value: exclusiveMinimum);
begin
  FExclusiveMinimum := Value;
  FExclusiveMinimumIsStored := True;
end;

function HeaderParameterSubSchema.GetMaxLengthStored: Boolean;
begin
  Result := FMaxLength <> 0;
end;

function HeaderParameterSubSchema.GetMinLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
begin
  if not Assigned(FMinLength) then
    FMinLength := Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0.Create;

  Result := FMinLength;
end;

function HeaderParameterSubSchema.GetMinLengthStored: Boolean;
begin
  Result := Assigned(FMinLength);
end;

function HeaderParameterSubSchema.GetPatternStored: Boolean;
begin
  Result := not FPattern.IsEmpty;
end;

function HeaderParameterSubSchema.GetMaxItemsStored: Boolean;
begin
  Result := FMaxItems <> 0;
end;

function HeaderParameterSubSchema.GetMinItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
begin
  if not Assigned(FMinItems) then
    FMinItems := Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0.Create;

  Result := FMinItems;
end;

function HeaderParameterSubSchema.GetMinItemsStored: Boolean;
begin
  Result := Assigned(FMinItems);
end;

procedure HeaderParameterSubSchema.SetUniqueItems(const Value: uniqueItems);
begin
  FUniqueItems := Value;
  FUniqueItemsIsStored := True;
end;

function HeaderParameterSubSchema.GetEnumStored: Boolean;
begin
  Result := Assigned(FEnum);
end;

function HeaderParameterSubSchema.GetMultipleOfStored: Boolean;
begin
  Result := FMultipleOf <> 0;
end;

function HeaderParameterSubSchema.GetVendorExtension: TMap<vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TMap<System.Rtti.TValue>.Create;

  Result := FVendorExtension;
end;

function HeaderParameterSubSchema.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ QueryParameterSubSchema }

destructor QueryParameterSubSchema.Destroy;
begin
  FItems.Free;

  FMinLength.Free;

  FMinItems.Free;

  FVendorExtension.Free;

  inherited;
end;

procedure QueryParameterSubSchema.SetRequired(const Value: System.Boolean);
begin
  FRequired := Value;
  FRequiredIsStored := True;
end;

function QueryParameterSubSchema.GetInStored: Boolean;
begin
  Result := not FIn.IsEmpty;
end;

function QueryParameterSubSchema.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function QueryParameterSubSchema.GetNameStored: Boolean;
begin
  Result := not FName.IsEmpty;
end;

procedure QueryParameterSubSchema.SetAllowEmptyValue(const Value: System.Boolean);
begin
  FAllowEmptyValue := Value;
  FAllowEmptyValueIsStored := True;
end;

function QueryParameterSubSchema.GetTypeStored: Boolean;
begin
  Result := not FType.IsEmpty;
end;

function QueryParameterSubSchema.GetFormatStored: Boolean;
begin
  Result := not FFormat.IsEmpty;
end;

function QueryParameterSubSchema.GetItems: Blue.Print.Open.API.Schema.v20.PrimitivesItems;
begin
  if not Assigned(FItems) then
    FItems := Blue.Print.Open.API.Schema.v20.PrimitivesItems.Create;

  Result := FItems;
end;

function QueryParameterSubSchema.GetItemsStored: Boolean;
begin
  Result := Assigned(FItems);
end;

function QueryParameterSubSchema.GetCollectionFormatStored: Boolean;
begin
  Result := not FCollectionFormat.IsEmpty;
end;

function QueryParameterSubSchema.GetDefaultStored: Boolean;
begin
  Result := False;
end;

function QueryParameterSubSchema.GetMaximumStored: Boolean;
begin
  Result := FMaximum <> 0;
end;

procedure QueryParameterSubSchema.SetExclusiveMaximum(const Value: exclusiveMaximum);
begin
  FExclusiveMaximum := Value;
  FExclusiveMaximumIsStored := True;
end;

function QueryParameterSubSchema.GetMinimumStored: Boolean;
begin
  Result := FMinimum <> 0;
end;

procedure QueryParameterSubSchema.SetExclusiveMinimum(const Value: exclusiveMinimum);
begin
  FExclusiveMinimum := Value;
  FExclusiveMinimumIsStored := True;
end;

function QueryParameterSubSchema.GetMaxLengthStored: Boolean;
begin
  Result := FMaxLength <> 0;
end;

function QueryParameterSubSchema.GetMinLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
begin
  if not Assigned(FMinLength) then
    FMinLength := Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0.Create;

  Result := FMinLength;
end;

function QueryParameterSubSchema.GetMinLengthStored: Boolean;
begin
  Result := Assigned(FMinLength);
end;

function QueryParameterSubSchema.GetPatternStored: Boolean;
begin
  Result := not FPattern.IsEmpty;
end;

function QueryParameterSubSchema.GetMaxItemsStored: Boolean;
begin
  Result := FMaxItems <> 0;
end;

function QueryParameterSubSchema.GetMinItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
begin
  if not Assigned(FMinItems) then
    FMinItems := Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0.Create;

  Result := FMinItems;
end;

function QueryParameterSubSchema.GetMinItemsStored: Boolean;
begin
  Result := Assigned(FMinItems);
end;

procedure QueryParameterSubSchema.SetUniqueItems(const Value: uniqueItems);
begin
  FUniqueItems := Value;
  FUniqueItemsIsStored := True;
end;

function QueryParameterSubSchema.GetEnumStored: Boolean;
begin
  Result := Assigned(FEnum);
end;

function QueryParameterSubSchema.GetMultipleOfStored: Boolean;
begin
  Result := FMultipleOf <> 0;
end;

function QueryParameterSubSchema.GetVendorExtension: TMap<vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TMap<System.Rtti.TValue>.Create;

  Result := FVendorExtension;
end;

function QueryParameterSubSchema.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ FormDataParameterSubSchema }

destructor FormDataParameterSubSchema.Destroy;
begin
  FItems.Free;

  FMinLength.Free;

  FMinItems.Free;

  FVendorExtension.Free;

  inherited;
end;

procedure FormDataParameterSubSchema.SetRequired(const Value: System.Boolean);
begin
  FRequired := Value;
  FRequiredIsStored := True;
end;

function FormDataParameterSubSchema.GetInStored: Boolean;
begin
  Result := not FIn.IsEmpty;
end;

function FormDataParameterSubSchema.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function FormDataParameterSubSchema.GetNameStored: Boolean;
begin
  Result := not FName.IsEmpty;
end;

procedure FormDataParameterSubSchema.SetAllowEmptyValue(const Value: System.Boolean);
begin
  FAllowEmptyValue := Value;
  FAllowEmptyValueIsStored := True;
end;

function FormDataParameterSubSchema.GetTypeStored: Boolean;
begin
  Result := not FType.IsEmpty;
end;

function FormDataParameterSubSchema.GetFormatStored: Boolean;
begin
  Result := not FFormat.IsEmpty;
end;

function FormDataParameterSubSchema.GetItems: Blue.Print.Open.API.Schema.v20.PrimitivesItems;
begin
  if not Assigned(FItems) then
    FItems := Blue.Print.Open.API.Schema.v20.PrimitivesItems.Create;

  Result := FItems;
end;

function FormDataParameterSubSchema.GetItemsStored: Boolean;
begin
  Result := Assigned(FItems);
end;

function FormDataParameterSubSchema.GetCollectionFormatStored: Boolean;
begin
  Result := not FCollectionFormat.IsEmpty;
end;

function FormDataParameterSubSchema.GetDefaultStored: Boolean;
begin
  Result := False;
end;

function FormDataParameterSubSchema.GetMaximumStored: Boolean;
begin
  Result := FMaximum <> 0;
end;

procedure FormDataParameterSubSchema.SetExclusiveMaximum(const Value: exclusiveMaximum);
begin
  FExclusiveMaximum := Value;
  FExclusiveMaximumIsStored := True;
end;

function FormDataParameterSubSchema.GetMinimumStored: Boolean;
begin
  Result := FMinimum <> 0;
end;

procedure FormDataParameterSubSchema.SetExclusiveMinimum(const Value: exclusiveMinimum);
begin
  FExclusiveMinimum := Value;
  FExclusiveMinimumIsStored := True;
end;

function FormDataParameterSubSchema.GetMaxLengthStored: Boolean;
begin
  Result := FMaxLength <> 0;
end;

function FormDataParameterSubSchema.GetMinLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
begin
  if not Assigned(FMinLength) then
    FMinLength := Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0.Create;

  Result := FMinLength;
end;

function FormDataParameterSubSchema.GetMinLengthStored: Boolean;
begin
  Result := Assigned(FMinLength);
end;

function FormDataParameterSubSchema.GetPatternStored: Boolean;
begin
  Result := not FPattern.IsEmpty;
end;

function FormDataParameterSubSchema.GetMaxItemsStored: Boolean;
begin
  Result := FMaxItems <> 0;
end;

function FormDataParameterSubSchema.GetMinItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
begin
  if not Assigned(FMinItems) then
    FMinItems := Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0.Create;

  Result := FMinItems;
end;

function FormDataParameterSubSchema.GetMinItemsStored: Boolean;
begin
  Result := Assigned(FMinItems);
end;

procedure FormDataParameterSubSchema.SetUniqueItems(const Value: uniqueItems);
begin
  FUniqueItems := Value;
  FUniqueItemsIsStored := True;
end;

function FormDataParameterSubSchema.GetEnumStored: Boolean;
begin
  Result := Assigned(FEnum);
end;

function FormDataParameterSubSchema.GetMultipleOfStored: Boolean;
begin
  Result := FMultipleOf <> 0;
end;

function FormDataParameterSubSchema.GetVendorExtension: TMap<vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TMap<System.Rtti.TValue>.Create;

  Result := FVendorExtension;
end;

function FormDataParameterSubSchema.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ PathParameterSubSchema }

destructor PathParameterSubSchema.Destroy;
begin
  FItems.Free;

  FMinLength.Free;

  FMinItems.Free;

  FVendorExtension.Free;

  inherited;
end;

function PathParameterSubSchema.GetInStored: Boolean;
begin
  Result := not FIn.IsEmpty;
end;

function PathParameterSubSchema.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function PathParameterSubSchema.GetNameStored: Boolean;
begin
  Result := not FName.IsEmpty;
end;

function PathParameterSubSchema.GetTypeStored: Boolean;
begin
  Result := not FType.IsEmpty;
end;

function PathParameterSubSchema.GetFormatStored: Boolean;
begin
  Result := not FFormat.IsEmpty;
end;

function PathParameterSubSchema.GetItems: Blue.Print.Open.API.Schema.v20.PrimitivesItems;
begin
  if not Assigned(FItems) then
    FItems := Blue.Print.Open.API.Schema.v20.PrimitivesItems.Create;

  Result := FItems;
end;

function PathParameterSubSchema.GetItemsStored: Boolean;
begin
  Result := Assigned(FItems);
end;

function PathParameterSubSchema.GetCollectionFormatStored: Boolean;
begin
  Result := not FCollectionFormat.IsEmpty;
end;

function PathParameterSubSchema.GetDefaultStored: Boolean;
begin
  Result := False;
end;

function PathParameterSubSchema.GetMaximumStored: Boolean;
begin
  Result := FMaximum <> 0;
end;

procedure PathParameterSubSchema.SetExclusiveMaximum(const Value: exclusiveMaximum);
begin
  FExclusiveMaximum := Value;
  FExclusiveMaximumIsStored := True;
end;

function PathParameterSubSchema.GetMinimumStored: Boolean;
begin
  Result := FMinimum <> 0;
end;

procedure PathParameterSubSchema.SetExclusiveMinimum(const Value: exclusiveMinimum);
begin
  FExclusiveMinimum := Value;
  FExclusiveMinimumIsStored := True;
end;

function PathParameterSubSchema.GetMaxLengthStored: Boolean;
begin
  Result := FMaxLength <> 0;
end;

function PathParameterSubSchema.GetMinLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
begin
  if not Assigned(FMinLength) then
    FMinLength := Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0.Create;

  Result := FMinLength;
end;

function PathParameterSubSchema.GetMinLengthStored: Boolean;
begin
  Result := Assigned(FMinLength);
end;

function PathParameterSubSchema.GetPatternStored: Boolean;
begin
  Result := not FPattern.IsEmpty;
end;

function PathParameterSubSchema.GetMaxItemsStored: Boolean;
begin
  Result := FMaxItems <> 0;
end;

function PathParameterSubSchema.GetMinItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
begin
  if not Assigned(FMinItems) then
    FMinItems := Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0.Create;

  Result := FMinItems;
end;

function PathParameterSubSchema.GetMinItemsStored: Boolean;
begin
  Result := Assigned(FMinItems);
end;

procedure PathParameterSubSchema.SetUniqueItems(const Value: uniqueItems);
begin
  FUniqueItems := Value;
  FUniqueItemsIsStored := True;
end;

function PathParameterSubSchema.GetEnumStored: Boolean;
begin
  Result := Assigned(FEnum);
end;

function PathParameterSubSchema.GetMultipleOfStored: Boolean;
begin
  Result := FMultipleOf <> 0;
end;

function PathParameterSubSchema.GetVendorExtension: TMap<vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TMap<System.Rtti.TValue>.Create;

  Result := FVendorExtension;
end;

function PathParameterSubSchema.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ NonBodyParameter }

destructor NonBodyParameter.Destroy;
begin
  FHeaderParameterSubSchema.Free;

  FFormDataParameterSubSchema.Free;

  FQueryParameterSubSchema.Free;

  FPathParameterSubSchema.Free;

  inherited;
end;

function NonBodyParameter.GetHeaderParameterSubSchema: Blue.Print.Open.API.Schema.v20.HeaderParameterSubSchema;
begin
  if not Assigned(FHeaderParameterSubSchema) then
    FHeaderParameterSubSchema := Blue.Print.Open.API.Schema.v20.HeaderParameterSubSchema.Create;

  Result := FHeaderParameterSubSchema;
end;

function NonBodyParameter.GetHeaderParameterSubSchemaStored: Boolean;
begin
  Result := Assigned(FHeaderParameterSubSchema);
end;

function NonBodyParameter.GetFormDataParameterSubSchema: Blue.Print.Open.API.Schema.v20.FormDataParameterSubSchema;
begin
  if not Assigned(FFormDataParameterSubSchema) then
    FFormDataParameterSubSchema := Blue.Print.Open.API.Schema.v20.FormDataParameterSubSchema.Create;

  Result := FFormDataParameterSubSchema;
end;

function NonBodyParameter.GetFormDataParameterSubSchemaStored: Boolean;
begin
  Result := Assigned(FFormDataParameterSubSchema);
end;

function NonBodyParameter.GetQueryParameterSubSchema: Blue.Print.Open.API.Schema.v20.QueryParameterSubSchema;
begin
  if not Assigned(FQueryParameterSubSchema) then
    FQueryParameterSubSchema := Blue.Print.Open.API.Schema.v20.QueryParameterSubSchema.Create;

  Result := FQueryParameterSubSchema;
end;

function NonBodyParameter.GetQueryParameterSubSchemaStored: Boolean;
begin
  Result := Assigned(FQueryParameterSubSchema);
end;

function NonBodyParameter.GetPathParameterSubSchema: Blue.Print.Open.API.Schema.v20.PathParameterSubSchema;
begin
  if not Assigned(FPathParameterSubSchema) then
    FPathParameterSubSchema := Blue.Print.Open.API.Schema.v20.PathParameterSubSchema.Create;

  Result := FPathParameterSubSchema;
end;

function NonBodyParameter.GetPathParameterSubSchemaStored: Boolean;
begin
  Result := Assigned(FPathParameterSubSchema);
end;

{ Parameter }

destructor Parameter.Destroy;
begin
  FBodyParameter.Free;

  FNonBodyParameter.Free;

  inherited;
end;

function Parameter.GetBodyParameter: Blue.Print.Open.API.Schema.v20.BodyParameter;
begin
  if not Assigned(FBodyParameter) then
    FBodyParameter := Blue.Print.Open.API.Schema.v20.BodyParameter.Create;

  Result := FBodyParameter;
end;

function Parameter.GetBodyParameterStored: Boolean;
begin
  Result := Assigned(FBodyParameter);
end;

function Parameter.GetNonBodyParameter: Blue.Print.Open.API.Schema.v20.NonBodyParameter;
begin
  if not Assigned(FNonBodyParameter) then
    FNonBodyParameter := Blue.Print.Open.API.Schema.v20.NonBodyParameter.Create;

  Result := FNonBodyParameter;
end;

function Parameter.GetNonBodyParameterStored: Boolean;
begin
  Result := Assigned(FNonBodyParameter);
end;

{ Schema }

destructor Schema.Destroy;
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

function Schema.GetRefStored: Boolean;
begin
  Result := not FRef.IsEmpty;
end;

function Schema.GetFormatStored: Boolean;
begin
  Result := not FFormat.IsEmpty;
end;

function Schema.GetTitleStored: Boolean;
begin
  Result := not FTitle.IsEmpty;
end;

function Schema.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function Schema.GetDefaultStored: Boolean;
begin
  Result := False;
end;

function Schema.GetMultipleOfStored: Boolean;
begin
  Result := FMultipleOf <> 0;
end;

function Schema.GetMaximumStored: Boolean;
begin
  Result := FMaximum <> 0;
end;

procedure Schema.SetExclusiveMaximum(const Value: System.Boolean);
begin
  FExclusiveMaximum := Value;
  FExclusiveMaximumIsStored := True;
end;

function Schema.GetMinimumStored: Boolean;
begin
  Result := FMinimum <> 0;
end;

procedure Schema.SetExclusiveMinimum(const Value: System.Boolean);
begin
  FExclusiveMinimum := Value;
  FExclusiveMinimumIsStored := True;
end;

function Schema.GetMaxLengthStored: Boolean;
begin
  Result := FMaxLength <> 0;
end;

function Schema.GetMinLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
begin
  if not Assigned(FMinLength) then
    FMinLength := Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0.Create;

  Result := FMinLength;
end;

function Schema.GetMinLengthStored: Boolean;
begin
  Result := Assigned(FMinLength);
end;

function Schema.GetPatternStored: Boolean;
begin
  Result := not FPattern.IsEmpty;
end;

function Schema.GetMaxItemsStored: Boolean;
begin
  Result := FMaxItems <> 0;
end;

function Schema.GetMinItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
begin
  if not Assigned(FMinItems) then
    FMinItems := Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0.Create;

  Result := FMinItems;
end;

function Schema.GetMinItemsStored: Boolean;
begin
  Result := Assigned(FMinItems);
end;

procedure Schema.SetUniqueItems(const Value: System.Boolean);
begin
  FUniqueItems := Value;
  FUniqueItemsIsStored := True;
end;

function Schema.GetMaxPropertiesStored: Boolean;
begin
  Result := FMaxProperties <> 0;
end;

function Schema.GetMinProperties: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
begin
  if not Assigned(FMinProperties) then
    FMinProperties := Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0.Create;

  Result := FMinProperties;
end;

function Schema.GetMinPropertiesStored: Boolean;
begin
  Result := Assigned(FMinProperties);
end;

function Schema.GetRequiredStored: Boolean;
begin
  Result := Assigned(FRequired);
end;

function Schema.GetEnumStored: Boolean;
begin
  Result := Assigned(FEnum);
end;

function Schema.GetAdditionalProperties: Blue.Print.Open.API.Schema.v20.Schema.TAdditionalProperties;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := Blue.Print.Open.API.Schema.v20.Schema.TAdditionalProperties.Create;

  Result := FAdditionalProperties;
end;

function Schema.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

function Schema.GetType: Blue.Print.Open.API.Schema.v20.Schema.TType;
begin
  if not Assigned(FType) then
    FType := Blue.Print.Open.API.Schema.v20.Schema.TType.Create;

  Result := FType;
end;

function Schema.GetTypeStored: Boolean;
begin
  Result := Assigned(FType);
end;

function Schema.GetItems: Blue.Print.Open.API.Schema.v20.Schema.TItems;
begin
  if not Assigned(FItems) then
    FItems := Blue.Print.Open.API.Schema.v20.Schema.TItems.Create;

  Result := FItems;
end;

function Schema.GetItemsStored: Boolean;
begin
  Result := Assigned(FItems);
end;

function Schema.AddAllOf: Blue.Print.Open.API.Schema.v20.Schema;
begin
  Result := Blue.Print.Open.API.Schema.v20.Schema.Create;

  FAllOf := FAllOf + [Result];
end;

function Schema.GetAllOfStored: Boolean;
begin
  Result := Assigned(FAllOf);
end;

function Schema.GetProperties: TMap<Blue.Print.Open.API.Schema.v20.Schema>;
begin
  if not Assigned(FProperties) then
    FProperties := TMap<Blue.Print.Open.API.Schema.v20.Schema>.Create;

  Result := FProperties;
end;

function Schema.GetPropertiesStored: Boolean;
begin
  Result := Assigned(FProperties);
end;

function Schema.GetDiscriminatorStored: Boolean;
begin
  Result := not FDiscriminator.IsEmpty;
end;

procedure Schema.SetReadOnly(const Value: System.Boolean);
begin
  FReadOnly := Value;
  FReadOnlyIsStored := True;
end;

function Schema.GetXml: Blue.Print.Open.API.Schema.v20.Xml;
begin
  if not Assigned(FXml) then
    FXml := Blue.Print.Open.API.Schema.v20.Xml.Create;

  Result := FXml;
end;

function Schema.GetXmlStored: Boolean;
begin
  Result := Assigned(FXml);
end;

function Schema.GetExternalDocs: Blue.Print.Open.API.Schema.v20.ExternalDocs;
begin
  if not Assigned(FExternalDocs) then
    FExternalDocs := Blue.Print.Open.API.Schema.v20.ExternalDocs.Create;

  Result := FExternalDocs;
end;

function Schema.GetExternalDocsStored: Boolean;
begin
  Result := Assigned(FExternalDocs);
end;

function Schema.GetExampleStored: Boolean;
begin
  Result := False;
end;

function Schema.GetVendorExtension: TMap<vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TMap<System.Rtti.TValue>.Create;

  Result := FVendorExtension;
end;

function Schema.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ Schema.TAdditionalProperties }

destructor Schema.TAdditionalProperties.Destroy;
begin
  FSchema.Free;

  inherited;
end;

function Schema.TAdditionalProperties.GetSchema: Blue.Print.Open.API.Schema.v20.Schema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v20.Schema.Create;

  Result := FSchema;
end;

function Schema.TAdditionalProperties.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

procedure Schema.TAdditionalProperties.SetBoolean(const Value: Boolean);
begin
  FBoolean := Value;
  FBooleanIsStored := True;
end;

{ Schema.TType }

procedure Schema.TType.SetSimpleTypes(const Value: simpleTypes);
begin
  FSimpleTypes := Value;
  FSimpleTypesIsStored := True;
end;

function Schema.TType.GetArrayStored: Boolean;
begin
  Result := Assigned(FArray);
end;

{ Schema.TItems }

destructor Schema.TItems.Destroy;
begin
  FSchema.Free;

  for var AObject in FArray do
    AObject.Free;

  inherited;
end;

function Schema.TItems.GetSchema: Blue.Print.Open.API.Schema.v20.Schema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v20.Schema.Create;

  Result := FSchema;
end;

function Schema.TItems.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function Schema.TItems.AddArray: Blue.Print.Open.API.Schema.v20.Schema;
begin
  Result := Blue.Print.Open.API.Schema.v20.Schema.Create;

  FArray := FArray + [Result];
end;

function Schema.TItems.GetArrayStored: Boolean;
begin
  Result := Assigned(FArray);
end;

{ FileSchema }

destructor FileSchema.Destroy;
begin
  FExternalDocs.Free;

  FVendorExtension.Free;

  inherited;
end;

function FileSchema.GetFormatStored: Boolean;
begin
  Result := not FFormat.IsEmpty;
end;

function FileSchema.GetTitleStored: Boolean;
begin
  Result := not FTitle.IsEmpty;
end;

function FileSchema.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function FileSchema.GetDefaultStored: Boolean;
begin
  Result := False;
end;

function FileSchema.GetRequiredStored: Boolean;
begin
  Result := Assigned(FRequired);
end;

procedure FileSchema.SetReadOnly(const Value: System.Boolean);
begin
  FReadOnly := Value;
  FReadOnlyIsStored := True;
end;

function FileSchema.GetExternalDocs: Blue.Print.Open.API.Schema.v20.ExternalDocs;
begin
  if not Assigned(FExternalDocs) then
    FExternalDocs := Blue.Print.Open.API.Schema.v20.ExternalDocs.Create;

  Result := FExternalDocs;
end;

function FileSchema.GetExternalDocsStored: Boolean;
begin
  Result := Assigned(FExternalDocs);
end;

function FileSchema.GetExampleStored: Boolean;
begin
  Result := False;
end;

function FileSchema.GetVendorExtension: TMap<vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TMap<System.Rtti.TValue>.Create;

  Result := FVendorExtension;
end;

function FileSchema.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ PrimitivesItems }

destructor PrimitivesItems.Destroy;
begin
  FItems.Free;

  FMinLength.Free;

  FMinItems.Free;

  FVendorExtension.Free;

  inherited;
end;

function PrimitivesItems.GetTypeStored: Boolean;
begin
  Result := not FType.IsEmpty;
end;

function PrimitivesItems.GetFormatStored: Boolean;
begin
  Result := not FFormat.IsEmpty;
end;

function PrimitivesItems.GetItems: Blue.Print.Open.API.Schema.v20.PrimitivesItems;
begin
  if not Assigned(FItems) then
    FItems := Blue.Print.Open.API.Schema.v20.PrimitivesItems.Create;

  Result := FItems;
end;

function PrimitivesItems.GetItemsStored: Boolean;
begin
  Result := Assigned(FItems);
end;

function PrimitivesItems.GetCollectionFormatStored: Boolean;
begin
  Result := not FCollectionFormat.IsEmpty;
end;

function PrimitivesItems.GetDefaultStored: Boolean;
begin
  Result := False;
end;

function PrimitivesItems.GetMaximumStored: Boolean;
begin
  Result := FMaximum <> 0;
end;

procedure PrimitivesItems.SetExclusiveMaximum(const Value: exclusiveMaximum);
begin
  FExclusiveMaximum := Value;
  FExclusiveMaximumIsStored := True;
end;

function PrimitivesItems.GetMinimumStored: Boolean;
begin
  Result := FMinimum <> 0;
end;

procedure PrimitivesItems.SetExclusiveMinimum(const Value: exclusiveMinimum);
begin
  FExclusiveMinimum := Value;
  FExclusiveMinimumIsStored := True;
end;

function PrimitivesItems.GetMaxLengthStored: Boolean;
begin
  Result := FMaxLength <> 0;
end;

function PrimitivesItems.GetMinLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
begin
  if not Assigned(FMinLength) then
    FMinLength := Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0.Create;

  Result := FMinLength;
end;

function PrimitivesItems.GetMinLengthStored: Boolean;
begin
  Result := Assigned(FMinLength);
end;

function PrimitivesItems.GetPatternStored: Boolean;
begin
  Result := not FPattern.IsEmpty;
end;

function PrimitivesItems.GetMaxItemsStored: Boolean;
begin
  Result := FMaxItems <> 0;
end;

function PrimitivesItems.GetMinItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
begin
  if not Assigned(FMinItems) then
    FMinItems := Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0.Create;

  Result := FMinItems;
end;

function PrimitivesItems.GetMinItemsStored: Boolean;
begin
  Result := Assigned(FMinItems);
end;

procedure PrimitivesItems.SetUniqueItems(const Value: uniqueItems);
begin
  FUniqueItems := Value;
  FUniqueItemsIsStored := True;
end;

function PrimitivesItems.GetEnumStored: Boolean;
begin
  Result := Assigned(FEnum);
end;

function PrimitivesItems.GetMultipleOfStored: Boolean;
begin
  Result := FMultipleOf <> 0;
end;

function PrimitivesItems.GetVendorExtension: TMap<vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TMap<System.Rtti.TValue>.Create;

  Result := FVendorExtension;
end;

function PrimitivesItems.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ Xml }

destructor Xml.Destroy;
begin
  FVendorExtension.Free;

  inherited;
end;

function Xml.GetNameStored: Boolean;
begin
  Result := not FName.IsEmpty;
end;

function Xml.GetNamespaceStored: Boolean;
begin
  Result := not FNamespace.IsEmpty;
end;

function Xml.GetPrefixStored: Boolean;
begin
  Result := not FPrefix.IsEmpty;
end;

procedure Xml.SetAttribute(const Value: System.Boolean);
begin
  FAttribute := Value;
  FAttributeIsStored := True;
end;

procedure Xml.SetWrapped(const Value: System.Boolean);
begin
  FWrapped := Value;
  FWrappedIsStored := True;
end;

function Xml.GetVendorExtension: TMap<vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TMap<System.Rtti.TValue>.Create;

  Result := FVendorExtension;
end;

function Xml.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ Tag }

destructor Tag.Destroy;
begin
  FExternalDocs.Free;

  FVendorExtension.Free;

  inherited;
end;

function Tag.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function Tag.GetExternalDocs: Blue.Print.Open.API.Schema.v20.ExternalDocs;
begin
  if not Assigned(FExternalDocs) then
    FExternalDocs := Blue.Print.Open.API.Schema.v20.ExternalDocs.Create;

  Result := FExternalDocs;
end;

function Tag.GetExternalDocsStored: Boolean;
begin
  Result := Assigned(FExternalDocs);
end;

function Tag.GetVendorExtension: TMap<vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TMap<System.Rtti.TValue>.Create;

  Result := FVendorExtension;
end;

function Tag.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ SecurityDefinitions }

destructor SecurityDefinitions.Destroy;
begin
  FBasicAuthenticationSecurity.Free;

  FApiKeySecurity.Free;

  FOauth2ImplicitSecurity.Free;

  FOauth2PasswordSecurity.Free;

  FOauth2ApplicationSecurity.Free;

  FOauth2AccessCodeSecurity.Free;

  inherited;
end;

function SecurityDefinitions.GetBasicAuthenticationSecurity: Blue.Print.Open.API.Schema.v20.BasicAuthenticationSecurity;
begin
  if not Assigned(FBasicAuthenticationSecurity) then
    FBasicAuthenticationSecurity := Blue.Print.Open.API.Schema.v20.BasicAuthenticationSecurity.Create;

  Result := FBasicAuthenticationSecurity;
end;

function SecurityDefinitions.GetBasicAuthenticationSecurityStored: Boolean;
begin
  Result := Assigned(FBasicAuthenticationSecurity);
end;

function SecurityDefinitions.GetApiKeySecurity: Blue.Print.Open.API.Schema.v20.ApiKeySecurity;
begin
  if not Assigned(FApiKeySecurity) then
    FApiKeySecurity := Blue.Print.Open.API.Schema.v20.ApiKeySecurity.Create;

  Result := FApiKeySecurity;
end;

function SecurityDefinitions.GetApiKeySecurityStored: Boolean;
begin
  Result := Assigned(FApiKeySecurity);
end;

function SecurityDefinitions.GetOauth2ImplicitSecurity: Blue.Print.Open.API.Schema.v20.Oauth2ImplicitSecurity;
begin
  if not Assigned(FOauth2ImplicitSecurity) then
    FOauth2ImplicitSecurity := Blue.Print.Open.API.Schema.v20.Oauth2ImplicitSecurity.Create;

  Result := FOauth2ImplicitSecurity;
end;

function SecurityDefinitions.GetOauth2ImplicitSecurityStored: Boolean;
begin
  Result := Assigned(FOauth2ImplicitSecurity);
end;

function SecurityDefinitions.GetOauth2PasswordSecurity: Blue.Print.Open.API.Schema.v20.Oauth2PasswordSecurity;
begin
  if not Assigned(FOauth2PasswordSecurity) then
    FOauth2PasswordSecurity := Blue.Print.Open.API.Schema.v20.Oauth2PasswordSecurity.Create;

  Result := FOauth2PasswordSecurity;
end;

function SecurityDefinitions.GetOauth2PasswordSecurityStored: Boolean;
begin
  Result := Assigned(FOauth2PasswordSecurity);
end;

function SecurityDefinitions.GetOauth2ApplicationSecurity: Blue.Print.Open.API.Schema.v20.Oauth2ApplicationSecurity;
begin
  if not Assigned(FOauth2ApplicationSecurity) then
    FOauth2ApplicationSecurity := Blue.Print.Open.API.Schema.v20.Oauth2ApplicationSecurity.Create;

  Result := FOauth2ApplicationSecurity;
end;

function SecurityDefinitions.GetOauth2ApplicationSecurityStored: Boolean;
begin
  Result := Assigned(FOauth2ApplicationSecurity);
end;

function SecurityDefinitions.GetOauth2AccessCodeSecurity: Blue.Print.Open.API.Schema.v20.Oauth2AccessCodeSecurity;
begin
  if not Assigned(FOauth2AccessCodeSecurity) then
    FOauth2AccessCodeSecurity := Blue.Print.Open.API.Schema.v20.Oauth2AccessCodeSecurity.Create;

  Result := FOauth2AccessCodeSecurity;
end;

function SecurityDefinitions.GetOauth2AccessCodeSecurityStored: Boolean;
begin
  Result := Assigned(FOauth2AccessCodeSecurity);
end;

{ BasicAuthenticationSecurity }

destructor BasicAuthenticationSecurity.Destroy;
begin
  FVendorExtension.Free;

  inherited;
end;

function BasicAuthenticationSecurity.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function BasicAuthenticationSecurity.GetVendorExtension: TMap<vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TMap<System.Rtti.TValue>.Create;

  Result := FVendorExtension;
end;

function BasicAuthenticationSecurity.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ ApiKeySecurity }

destructor ApiKeySecurity.Destroy;
begin
  FVendorExtension.Free;

  inherited;
end;

function ApiKeySecurity.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function ApiKeySecurity.GetVendorExtension: TMap<vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TMap<System.Rtti.TValue>.Create;

  Result := FVendorExtension;
end;

function ApiKeySecurity.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ Oauth2ImplicitSecurity }

destructor Oauth2ImplicitSecurity.Destroy;
begin
  FScopes.Free;

  FVendorExtension.Free;

  inherited;
end;

function Oauth2ImplicitSecurity.GetScopes: TMap<System.String>;
begin
  if not Assigned(FScopes) then
    FScopes := TMap<System.String>.Create;

  Result := FScopes;
end;

function Oauth2ImplicitSecurity.GetScopesStored: Boolean;
begin
  Result := Assigned(FScopes);
end;

function Oauth2ImplicitSecurity.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function Oauth2ImplicitSecurity.GetVendorExtension: TMap<vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TMap<System.Rtti.TValue>.Create;

  Result := FVendorExtension;
end;

function Oauth2ImplicitSecurity.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ Oauth2PasswordSecurity }

destructor Oauth2PasswordSecurity.Destroy;
begin
  FScopes.Free;

  FVendorExtension.Free;

  inherited;
end;

function Oauth2PasswordSecurity.GetScopes: TMap<System.String>;
begin
  if not Assigned(FScopes) then
    FScopes := TMap<System.String>.Create;

  Result := FScopes;
end;

function Oauth2PasswordSecurity.GetScopesStored: Boolean;
begin
  Result := Assigned(FScopes);
end;

function Oauth2PasswordSecurity.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function Oauth2PasswordSecurity.GetVendorExtension: TMap<vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TMap<System.Rtti.TValue>.Create;

  Result := FVendorExtension;
end;

function Oauth2PasswordSecurity.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ Oauth2ApplicationSecurity }

destructor Oauth2ApplicationSecurity.Destroy;
begin
  FScopes.Free;

  FVendorExtension.Free;

  inherited;
end;

function Oauth2ApplicationSecurity.GetScopes: TMap<System.String>;
begin
  if not Assigned(FScopes) then
    FScopes := TMap<System.String>.Create;

  Result := FScopes;
end;

function Oauth2ApplicationSecurity.GetScopesStored: Boolean;
begin
  Result := Assigned(FScopes);
end;

function Oauth2ApplicationSecurity.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function Oauth2ApplicationSecurity.GetVendorExtension: TMap<vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TMap<System.Rtti.TValue>.Create;

  Result := FVendorExtension;
end;

function Oauth2ApplicationSecurity.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ Oauth2AccessCodeSecurity }

destructor Oauth2AccessCodeSecurity.Destroy;
begin
  FScopes.Free;

  FVendorExtension.Free;

  inherited;
end;

function Oauth2AccessCodeSecurity.GetScopes: TMap<System.String>;
begin
  if not Assigned(FScopes) then
    FScopes := TMap<System.String>.Create;

  Result := FScopes;
end;

function Oauth2AccessCodeSecurity.GetScopesStored: Boolean;
begin
  Result := Assigned(FScopes);
end;

function Oauth2AccessCodeSecurity.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function Oauth2AccessCodeSecurity.GetVendorExtension: TMap<vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TMap<System.Rtti.TValue>.Create;

  Result := FVendorExtension;
end;

function Oauth2AccessCodeSecurity.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ ParametersListArrayItem }

destructor ParametersListArrayItem.Destroy;
begin
  FParameter.Free;

  FJsonReference.Free;

  inherited;
end;

function ParametersListArrayItem.GetParameter: Blue.Print.Open.API.Schema.v20.Parameter;
begin
  if not Assigned(FParameter) then
    FParameter := Blue.Print.Open.API.Schema.v20.Parameter.Create;

  Result := FParameter;
end;

function ParametersListArrayItem.GetParameterStored: Boolean;
begin
  Result := Assigned(FParameter);
end;

function ParametersListArrayItem.GetJsonReference: Blue.Print.Open.API.Schema.v20.JsonReference;
begin
  if not Assigned(FJsonReference) then
    FJsonReference := Blue.Print.Open.API.Schema.v20.JsonReference.Create;

  Result := FJsonReference;
end;

function ParametersListArrayItem.GetJsonReferenceStored: Boolean;
begin
  Result := Assigned(FJsonReference);
end;

end.
