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
  JsonReference = class;
  Operation = class;
  Responses = class;
  FormDataParameterSubSchema = class;
  Info = class;
  FileSchema = class;
  NonBodyParameter = class;
  Oauth2PasswordSecurity = class;
  Oauth2AccessCodeSecurity = class;
  BasicAuthenticationSecurity = class;
  License = class;
  Paths = class;
  Parameter = class;
  ApiKeySecurity = class;
  HeaderParameterSubSchema = class;
  PrimitivesItems = class;
  QueryParameterSubSchema = class;
  Oauth2ApplicationSecurity = class;
  BodyParameter = class;
  SecurityDefinitions = class;
  ParametersListArrayItem = class;
  Oauth2ImplicitSecurity = class;
  Header = class;
  Xml = class;
  ResponseValue = class;
  PathParameterSubSchema = class;
  PathItem = class;
  Schema = class;
  Response = class;
  Tag = class;
  ExternalDocs = class;
  Contact = class;

  // Forward type alias
  schemaArray = TArray<Blue.Print.Open.API.Schema.v20.TJSONSchema>;
  positiveInteger = System.Integer;
  stringArray = TArray<System.String>;
  any = System.Rtti.TValue;
  responseDefinitions = TMap<System.String, Blue.Print.Open.API.Schema.v20.Response>;
  exclusiveMaximum = System.Boolean;
  securityRequirement = TMap<System.String, TArray<System.String>>;
  exclusiveMinimum = System.Boolean;
  oauth2Scopes = TMap<System.String, System.String>;
  maxLength = System.Integer;
  enum = TArray<System.Rtti.TValue>;
  collectionFormat = System.String;
  mediaTypeList = TArray<System.String>;
  pattern = System.String;
  default = System.Rtti.TValue;
  minLength = Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
  title = System.String;
  schemesList = TArray<System.String>;
  collectionFormatWithMulti = System.String;
  multipleOf = System.Double;
  minimum = System.Double;
  mimeType = System.String;
  security = TArray<TMap<System.String, TArray<System.String>>>;
  vendorExtension = System.Rtti.TValue;
  definitions = TMap<System.String, Blue.Print.Open.API.Schema.v20.Schema>;
  parametersList = TArray<Blue.Print.Open.API.Schema.v20.ParametersListArrayItem>;
  maxItems = System.Integer;
  uniqueItems = System.Boolean;
  parameterDefinitions = TMap<System.String, Blue.Print.Open.API.Schema.v20.Parameter>;
  description = System.String;
  maximum = System.Double;
  headers = TMap<System.String, Blue.Print.Open.API.Schema.v20.Header>;
  minItems = Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
  examples = TMap<System.String, System.Rtti.TValue>;

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
    FAnyOf: schemaArray;
    FExclusiveMaximum: System.Boolean;
    FFormat: System.String;
    FExclusiveMinimum: System.Boolean;
    FAllOf: schemaArray;
    FSchema: System.String;
    FProperties: TMap<System.String, Blue.Print.Open.API.Schema.v20.TJSONSchema>;
    FNot: Blue.Print.Open.API.Schema.v20.TJSONSchema;
    FMaxLength: positiveInteger;
    FEnum: TArray<any>;
    FAdditionalItems: Blue.Print.Open.API.Schema.v20.TJSONSchema.TAdditionalItems;
    FId: System.String;
    FPattern: System.String;
    FDefault: any;
    FMinProperties: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    FMinLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    FTitle: System.String;
    FMultipleOf: System.Double;
    FPatternProperties: TMap<System.String, Blue.Print.Open.API.Schema.v20.TJSONSchema>;
    FOneOf: schemaArray;
    FMinimum: System.Double;
    FDependencies: Blue.Print.Open.API.Schema.v20.TJSONSchema.TDependencies;
    FAdditionalProperties: Blue.Print.Open.API.Schema.v20.TJSONSchema.TAdditionalProperties;
    FDefinitions: TMap<System.String, Blue.Print.Open.API.Schema.v20.TJSONSchema>;
    FMaxProperties: positiveInteger;
    FMaxItems: positiveInteger;
    FUniqueItems: System.Boolean;
    FDescription: System.String;
    FMaximum: System.Double;
    FItems: Blue.Print.Open.API.Schema.v20.TJSONSchema.TItems;
    FMinItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    FRequired: stringArray;
    FType: Blue.Print.Open.API.Schema.v20.TJSONSchema.TType;
    FExclusiveMaximumIsStored: Boolean;
    FExclusiveMinimumIsStored: Boolean;
    FUniqueItemsIsStored: Boolean;

    function GetProperties: TMap<System.String, Blue.Print.Open.API.Schema.v20.TJSONSchema>;
    function GetNot: Blue.Print.Open.API.Schema.v20.TJSONSchema;
    function GetAdditionalItems: Blue.Print.Open.API.Schema.v20.TJSONSchema.TAdditionalItems;
    function GetMinProperties: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    function GetMinLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    function GetPatternProperties: TMap<System.String, Blue.Print.Open.API.Schema.v20.TJSONSchema>;
    function GetDependencies: Blue.Print.Open.API.Schema.v20.TJSONSchema.TDependencies;
    function GetAdditionalProperties: Blue.Print.Open.API.Schema.v20.TJSONSchema.TAdditionalProperties;
    function GetDefinitions: TMap<System.String, Blue.Print.Open.API.Schema.v20.TJSONSchema>;
    function GetItems: Blue.Print.Open.API.Schema.v20.TJSONSchema.TItems;
    function GetMinItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    function GetType: Blue.Print.Open.API.Schema.v20.TJSONSchema.TType;
    function GetAnyOfStored: Boolean;
    function GetFormatStored: Boolean;
    function GetAllOfStored: Boolean;
    function GetSchemaStored: Boolean;
    function GetPropertiesStored: Boolean;
    function GetNotStored: Boolean;
    function GetMaxLengthStored: Boolean;
    function GetEnumStored: Boolean;
    function GetAdditionalItemsStored: Boolean;
    function GetIdStored: Boolean;
    function GetPatternStored: Boolean;
    function GetDefaultStored: Boolean;
    function GetMinPropertiesStored: Boolean;
    function GetMinLengthStored: Boolean;
    function GetTitleStored: Boolean;
    function GetMultipleOfStored: Boolean;
    function GetPatternPropertiesStored: Boolean;
    function GetOneOfStored: Boolean;
    function GetMinimumStored: Boolean;
    function GetDependenciesStored: Boolean;
    function GetAdditionalPropertiesStored: Boolean;
    function GetDefinitionsStored: Boolean;
    function GetMaxPropertiesStored: Boolean;
    function GetMaxItemsStored: Boolean;
    function GetDescriptionStored: Boolean;
    function GetMaximumStored: Boolean;
    function GetItemsStored: Boolean;
    function GetMinItemsStored: Boolean;
    function GetRequiredStored: Boolean;
    function GetTypeStored: Boolean;
    procedure SetExclusiveMaximum(const Value: System.Boolean);
    procedure SetExclusiveMinimum(const Value: System.Boolean);
    procedure SetUniqueItems(const Value: System.Boolean);
  public
    destructor Destroy; override;

    function AddAnyOf: Blue.Print.Open.API.Schema.v20.TJSONSchema;
    function AddAllOf: Blue.Print.Open.API.Schema.v20.TJSONSchema;
    function AddOneOf: Blue.Print.Open.API.Schema.v20.TJSONSchema;

    property IsAnyOfStored: Boolean read GetAnyOfStored;
    property IsExclusiveMaximumStored: Boolean read FExclusiveMaximumIsStored;
    property IsFormatStored: Boolean read GetFormatStored;
    property IsExclusiveMinimumStored: Boolean read FExclusiveMinimumIsStored;
    property IsAllOfStored: Boolean read GetAllOfStored;
    property IsSchemaStored: Boolean read GetSchemaStored;
    property IsPropertiesStored: Boolean read GetPropertiesStored;
    property IsNotStored: Boolean read GetNotStored;
    property IsMaxLengthStored: Boolean read GetMaxLengthStored;
    property IsEnumStored: Boolean read GetEnumStored;
    property IsAdditionalItemsStored: Boolean read GetAdditionalItemsStored;
    property IsIdStored: Boolean read GetIdStored;
    property IsPatternStored: Boolean read GetPatternStored;
    property IsDefaultStored: Boolean read GetDefaultStored;
    property IsMinPropertiesStored: Boolean read GetMinPropertiesStored;
    property IsMinLengthStored: Boolean read GetMinLengthStored;
    property IsTitleStored: Boolean read GetTitleStored;
    property IsMultipleOfStored: Boolean read GetMultipleOfStored;
    property IsPatternPropertiesStored: Boolean read GetPatternPropertiesStored;
    property IsOneOfStored: Boolean read GetOneOfStored;
    property IsMinimumStored: Boolean read GetMinimumStored;
    property IsDependenciesStored: Boolean read GetDependenciesStored;
    property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
    property IsDefinitionsStored: Boolean read GetDefinitionsStored;
    property IsMaxPropertiesStored: Boolean read GetMaxPropertiesStored;
    property IsMaxItemsStored: Boolean read GetMaxItemsStored;
    property IsUniqueItemsStored: Boolean read FUniqueItemsIsStored;
    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsMaximumStored: Boolean read GetMaximumStored;
    property IsItemsStored: Boolean read GetItemsStored;
    property IsMinItemsStored: Boolean read GetMinItemsStored;
    property IsRequiredStored: Boolean read GetRequiredStored;
    property IsTypeStored: Boolean read GetTypeStored;
  published
    property anyOf: schemaArray read FAnyOf write FAnyOf stored GetAnyOfStored;
    property exclusiveMaximum: System.Boolean read FExclusiveMaximum write SetExclusiveMaximum stored FExclusiveMaximumIsStored;
    property format: System.String read FFormat write FFormat stored GetFormatStored;
    property exclusiveMinimum: System.Boolean read FExclusiveMinimum write SetExclusiveMinimum stored FExclusiveMinimumIsStored;
    property allOf: schemaArray read FAllOf write FAllOf stored GetAllOfStored;
    [FieldName('$schema')]
    property schema: System.String read FSchema write FSchema stored GetSchemaStored;
    property properties: TMap<System.String, Blue.Print.Open.API.Schema.v20.TJSONSchema> read GetProperties write FProperties stored GetPropertiesStored;
    [FieldName('not')]
    property &not: Blue.Print.Open.API.Schema.v20.TJSONSchema read GetNot write FNot stored GetNotStored;
    property maxLength: positiveInteger read FMaxLength write FMaxLength stored GetMaxLengthStored;
    property enum: TArray<any> read FEnum write FEnum stored GetEnumStored;
    property additionalItems: Blue.Print.Open.API.Schema.v20.TJSONSchema.TAdditionalItems read GetAdditionalItems write FAdditionalItems stored GetAdditionalItemsStored;
    property id: System.String read FId write FId stored GetIdStored;
    property pattern: System.String read FPattern write FPattern stored GetPatternStored;
    property default: any read FDefault write FDefault stored GetDefaultStored;
    property minProperties: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0 read GetMinProperties write FMinProperties stored GetMinPropertiesStored;
    property minLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0 read GetMinLength write FMinLength stored GetMinLengthStored;
    property title: System.String read FTitle write FTitle stored GetTitleStored;
    property multipleOf: System.Double read FMultipleOf write FMultipleOf stored GetMultipleOfStored;
    property patternProperties: TMap<System.String, Blue.Print.Open.API.Schema.v20.TJSONSchema> read GetPatternProperties write FPatternProperties stored GetPatternPropertiesStored;
    property oneOf: schemaArray read FOneOf write FOneOf stored GetOneOfStored;
    property minimum: System.Double read FMinimum write FMinimum stored GetMinimumStored;
    property dependencies: Blue.Print.Open.API.Schema.v20.TJSONSchema.TDependencies read GetDependencies write FDependencies stored GetDependenciesStored;
    property additionalProperties: Blue.Print.Open.API.Schema.v20.TJSONSchema.TAdditionalProperties read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
    property definitions: TMap<System.String, Blue.Print.Open.API.Schema.v20.TJSONSchema> read GetDefinitions write FDefinitions stored GetDefinitionsStored;
    property maxProperties: positiveInteger read FMaxProperties write FMaxProperties stored GetMaxPropertiesStored;
    property maxItems: positiveInteger read FMaxItems write FMaxItems stored GetMaxItemsStored;
    property uniqueItems: System.Boolean read FUniqueItems write SetUniqueItems stored FUniqueItemsIsStored;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property maximum: System.Double read FMaximum write FMaximum stored GetMaximumStored;
    property items: Blue.Print.Open.API.Schema.v20.TJSONSchema.TItems read GetItems write FItems stored GetItemsStored;
    property minItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0 read GetMinItems write FMinItems stored GetMinItemsStored;
    property required: stringArray read FRequired write FRequired stored GetRequiredStored;
    [FieldName('type')]
    property &type: Blue.Print.Open.API.Schema.v20.TJSONSchema.TType read GetType write FType stored GetTypeStored;
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
    FExternalDocs: Blue.Print.Open.API.Schema.v20.ExternalDocs;
    FTags: TArray<Blue.Print.Open.API.Schema.v20.Tag>;
    FBasePath: System.String;
    FSwagger: System.String;
    FConsumes: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.TConsumes;
    FPaths: Blue.Print.Open.API.Schema.v20.Paths;
    FResponses: Blue.Print.Open.API.Schema.v20.Responses;
    FInfo: Blue.Print.Open.API.Schema.v20.Info;
    FSchemes: schemesList;
    FSecurity: security;
    FParameters: parameterDefinitions;
    FDefinitions: definitions;
    FProduces: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.TProduces;
    FHost: System.String;
    FSecurityDefinitions: Blue.Print.Open.API.Schema.v20.SecurityDefinitions;
    FVendorExtension: TMap<System.String, vendorExtension>;

    function GetExternalDocs: Blue.Print.Open.API.Schema.v20.ExternalDocs;
    function GetConsumes: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.TConsumes;
    function GetPaths: Blue.Print.Open.API.Schema.v20.Paths;
    function GetResponses: Blue.Print.Open.API.Schema.v20.Responses;
    function GetInfo: Blue.Print.Open.API.Schema.v20.Info;
    function GetParameters: parameterDefinitions;
    function GetDefinitions: definitions;
    function GetProduces: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.TProduces;
    function GetSecurityDefinitions: Blue.Print.Open.API.Schema.v20.SecurityDefinitions;
    function GetVendorExtension: TMap<System.String, vendorExtension>;
    function GetExternalDocsStored: Boolean;
    function GetTagsStored: Boolean;
    function GetBasePathStored: Boolean;
    function GetConsumesStored: Boolean;
    function GetResponsesStored: Boolean;
    function GetSchemesStored: Boolean;
    function GetSecurityStored: Boolean;
    function GetParametersStored: Boolean;
    function GetDefinitionsStored: Boolean;
    function GetProducesStored: Boolean;
    function GetHostStored: Boolean;
    function GetSecurityDefinitionsStored: Boolean;
    function GetVendorExtensionStored: Boolean;
  public
    destructor Destroy; override;

    function AddTags: Blue.Print.Open.API.Schema.v20.Tag;

    property IsExternalDocsStored: Boolean read GetExternalDocsStored;
    property IsTagsStored: Boolean read GetTagsStored;
    property IsBasePathStored: Boolean read GetBasePathStored;
    property IsConsumesStored: Boolean read GetConsumesStored;
    property IsResponsesStored: Boolean read GetResponsesStored;
    property IsSchemesStored: Boolean read GetSchemesStored;
    property IsSecurityStored: Boolean read GetSecurityStored;
    property IsParametersStored: Boolean read GetParametersStored;
    property IsDefinitionsStored: Boolean read GetDefinitionsStored;
    property IsProducesStored: Boolean read GetProducesStored;
    property IsHostStored: Boolean read GetHostStored;
    property IsSecurityDefinitionsStored: Boolean read GetSecurityDefinitionsStored;
    property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
  published
    property externalDocs: Blue.Print.Open.API.Schema.v20.ExternalDocs read GetExternalDocs write FExternalDocs stored GetExternalDocsStored;
    property tags: TArray<Blue.Print.Open.API.Schema.v20.Tag> read FTags write FTags stored GetTagsStored;
    property basePath: System.String read FBasePath write FBasePath stored GetBasePathStored;
    property swagger: System.String read FSwagger write FSwagger;
    property consumes: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.TConsumes read GetConsumes write FConsumes stored GetConsumesStored;
    property paths: Blue.Print.Open.API.Schema.v20.Paths read GetPaths write FPaths;
    property responses: Blue.Print.Open.API.Schema.v20.Responses read GetResponses write FResponses stored GetResponsesStored;
    property info: Blue.Print.Open.API.Schema.v20.Info read GetInfo write FInfo;
    property schemes: schemesList read FSchemes write FSchemes stored GetSchemesStored;
    property security: security read FSecurity write FSecurity stored GetSecurityStored;
    property parameters: parameterDefinitions read GetParameters write FParameters stored GetParametersStored;
    property definitions: definitions read GetDefinitions write FDefinitions stored GetDefinitionsStored;
    property produces: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.TProduces read GetProduces write FProduces stored GetProducesStored;
    property host: System.String read FHost write FHost stored GetHostStored;
    property securityDefinitions: Blue.Print.Open.API.Schema.v20.SecurityDefinitions read GetSecurityDefinitions write FSecurityDefinitions stored GetSecurityDefinitionsStored;
    property vendorExtension: TMap<System.String, vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
  end;

  JsonReference = class
  private
    FRef: System.String;
  published
    [FieldName('$ref')]
    property ref: System.String read FRef write FRef;
  end;

  Operation = class
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
    FTags: TArray<System.String>;
    FConsumes: Blue.Print.Open.API.Schema.v20.Operation.TConsumes;
    FDescription: System.String;
    FResponses: Blue.Print.Open.API.Schema.v20.Responses;
    FSummary: System.String;
    FSchemes: schemesList;
    FDeprecated: System.Boolean;
    FOperationId: System.String;
    FSecurity: security;
    FParameters: parametersList;
    FExternalDocs: Blue.Print.Open.API.Schema.v20.ExternalDocs;
    FProduces: Blue.Print.Open.API.Schema.v20.Operation.TProduces;
    FVendorExtension: TMap<System.String, vendorExtension>;
    FDeprecatedIsStored: Boolean;

    function GetConsumes: Blue.Print.Open.API.Schema.v20.Operation.TConsumes;
    function GetResponses: Blue.Print.Open.API.Schema.v20.Responses;
    function GetExternalDocs: Blue.Print.Open.API.Schema.v20.ExternalDocs;
    function GetProduces: Blue.Print.Open.API.Schema.v20.Operation.TProduces;
    function GetVendorExtension: TMap<System.String, vendorExtension>;
    function GetTagsStored: Boolean;
    function GetConsumesStored: Boolean;
    function GetDescriptionStored: Boolean;
    function GetSummaryStored: Boolean;
    function GetSchemesStored: Boolean;
    function GetOperationIdStored: Boolean;
    function GetSecurityStored: Boolean;
    function GetParametersStored: Boolean;
    function GetExternalDocsStored: Boolean;
    function GetProducesStored: Boolean;
    function GetVendorExtensionStored: Boolean;
    procedure SetDeprecated(const Value: System.Boolean);
  public
    destructor Destroy; override;

    function AddParameters: Blue.Print.Open.API.Schema.v20.ParametersListArrayItem;

    property IsTagsStored: Boolean read GetTagsStored;
    property IsConsumesStored: Boolean read GetConsumesStored;
    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsSummaryStored: Boolean read GetSummaryStored;
    property IsSchemesStored: Boolean read GetSchemesStored;
    property IsDeprecatedStored: Boolean read FDeprecatedIsStored;
    property IsOperationIdStored: Boolean read GetOperationIdStored;
    property IsSecurityStored: Boolean read GetSecurityStored;
    property IsParametersStored: Boolean read GetParametersStored;
    property IsExternalDocsStored: Boolean read GetExternalDocsStored;
    property IsProducesStored: Boolean read GetProducesStored;
    property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
  published
    property tags: TArray<System.String> read FTags write FTags stored GetTagsStored;
    property consumes: Blue.Print.Open.API.Schema.v20.Operation.TConsumes read GetConsumes write FConsumes stored GetConsumesStored;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property responses: Blue.Print.Open.API.Schema.v20.Responses read GetResponses write FResponses;
    property summary: System.String read FSummary write FSummary stored GetSummaryStored;
    property schemes: schemesList read FSchemes write FSchemes stored GetSchemesStored;
    property deprecated: System.Boolean read FDeprecated write SetDeprecated stored FDeprecatedIsStored;
    property operationId: System.String read FOperationId write FOperationId stored GetOperationIdStored;
    property security: security read FSecurity write FSecurity stored GetSecurityStored;
    property parameters: parametersList read FParameters write FParameters stored GetParametersStored;
    property externalDocs: Blue.Print.Open.API.Schema.v20.ExternalDocs read GetExternalDocs write FExternalDocs stored GetExternalDocsStored;
    property produces: Blue.Print.Open.API.Schema.v20.Operation.TProduces read GetProduces write FProduces stored GetProducesStored;
    property vendorExtension: TMap<System.String, vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
  end;

  Responses = class
  private
    FResponseValue: TMap<System.String, Blue.Print.Open.API.Schema.v20.ResponseValue>;
    FVendorExtension: TMap<System.String, vendorExtension>;

    function GetResponseValue: TMap<System.String, Blue.Print.Open.API.Schema.v20.ResponseValue>;
    function GetVendorExtension: TMap<System.String, vendorExtension>;
    function GetResponseValueStored: Boolean;
    function GetVendorExtensionStored: Boolean;
  public
    destructor Destroy; override;

    property IsResponseValueStored: Boolean read GetResponseValueStored;
    property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
  published
    property responseValue: TMap<System.String, Blue.Print.Open.API.Schema.v20.ResponseValue> read GetResponseValue write FResponseValue stored GetResponseValueStored;
    property vendorExtension: TMap<System.String, vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
  end;

  FormDataParameterSubSchema = class
  private
    FName: System.String;
    FExclusiveMaximum: exclusiveMaximum;
    FMinimum: minimum;
    FFormat: System.String;
    FExclusiveMinimum: exclusiveMinimum;
    FMaxLength: maxLength;
    FEnum: enum;
    FMaxItems: maxItems;
    FCollectionFormat: collectionFormatWithMulti;
    FUniqueItems: uniqueItems;
    FAllowEmptyValue: System.Boolean;
    FDescription: System.String;
    FMaximum: maximum;
    FDefault: default;
    FPattern: pattern;
    FIn: System.String;
    FItems: Blue.Print.Open.API.Schema.v20.PrimitivesItems;
    FMinLength: minLength;
    FMinItems: minItems;
    FRequired: System.Boolean;
    FType: System.String;
    FMultipleOf: multipleOf;
    FVendorExtension: TMap<System.String, vendorExtension>;
    FExclusiveMaximumIsStored: Boolean;
    FExclusiveMinimumIsStored: Boolean;
    FUniqueItemsIsStored: Boolean;
    FAllowEmptyValueIsStored: Boolean;
    FRequiredIsStored: Boolean;

    function GetItems: Blue.Print.Open.API.Schema.v20.PrimitivesItems;
    function GetMinLength: minLength;
    function GetMinItems: minItems;
    function GetVendorExtension: TMap<System.String, vendorExtension>;
    function GetNameStored: Boolean;
    function GetMinimumStored: Boolean;
    function GetFormatStored: Boolean;
    function GetMaxLengthStored: Boolean;
    function GetEnumStored: Boolean;
    function GetMaxItemsStored: Boolean;
    function GetCollectionFormatStored: Boolean;
    function GetDescriptionStored: Boolean;
    function GetMaximumStored: Boolean;
    function GetDefaultStored: Boolean;
    function GetPatternStored: Boolean;
    function GetInStored: Boolean;
    function GetItemsStored: Boolean;
    function GetMinLengthStored: Boolean;
    function GetMinItemsStored: Boolean;
    function GetTypeStored: Boolean;
    function GetMultipleOfStored: Boolean;
    function GetVendorExtensionStored: Boolean;
    procedure SetExclusiveMaximum(const Value: exclusiveMaximum);
    procedure SetExclusiveMinimum(const Value: exclusiveMinimum);
    procedure SetUniqueItems(const Value: uniqueItems);
    procedure SetAllowEmptyValue(const Value: System.Boolean);
    procedure SetRequired(const Value: System.Boolean);
  public
    destructor Destroy; override;

    property IsNameStored: Boolean read GetNameStored;
    property IsExclusiveMaximumStored: Boolean read FExclusiveMaximumIsStored;
    property IsMinimumStored: Boolean read GetMinimumStored;
    property IsFormatStored: Boolean read GetFormatStored;
    property IsExclusiveMinimumStored: Boolean read FExclusiveMinimumIsStored;
    property IsMaxLengthStored: Boolean read GetMaxLengthStored;
    property IsEnumStored: Boolean read GetEnumStored;
    property IsMaxItemsStored: Boolean read GetMaxItemsStored;
    property IsCollectionFormatStored: Boolean read GetCollectionFormatStored;
    property IsUniqueItemsStored: Boolean read FUniqueItemsIsStored;
    property IsAllowEmptyValueStored: Boolean read FAllowEmptyValueIsStored;
    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsMaximumStored: Boolean read GetMaximumStored;
    property IsDefaultStored: Boolean read GetDefaultStored;
    property IsPatternStored: Boolean read GetPatternStored;
    property IsInStored: Boolean read GetInStored;
    property IsItemsStored: Boolean read GetItemsStored;
    property IsMinLengthStored: Boolean read GetMinLengthStored;
    property IsMinItemsStored: Boolean read GetMinItemsStored;
    property IsRequiredStored: Boolean read FRequiredIsStored;
    property IsTypeStored: Boolean read GetTypeStored;
    property IsMultipleOfStored: Boolean read GetMultipleOfStored;
    property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
  published
    property name: System.String read FName write FName stored GetNameStored;
    property exclusiveMaximum: exclusiveMaximum read FExclusiveMaximum write SetExclusiveMaximum stored FExclusiveMaximumIsStored;
    property minimum: minimum read FMinimum write FMinimum stored GetMinimumStored;
    property format: System.String read FFormat write FFormat stored GetFormatStored;
    property exclusiveMinimum: exclusiveMinimum read FExclusiveMinimum write SetExclusiveMinimum stored FExclusiveMinimumIsStored;
    property maxLength: maxLength read FMaxLength write FMaxLength stored GetMaxLengthStored;
    property enum: enum read FEnum write FEnum stored GetEnumStored;
    property maxItems: maxItems read FMaxItems write FMaxItems stored GetMaxItemsStored;
    property collectionFormat: collectionFormatWithMulti read FCollectionFormat write FCollectionFormat stored GetCollectionFormatStored;
    property uniqueItems: uniqueItems read FUniqueItems write SetUniqueItems stored FUniqueItemsIsStored;
    property allowEmptyValue: System.Boolean read FAllowEmptyValue write SetAllowEmptyValue stored FAllowEmptyValueIsStored;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property maximum: maximum read FMaximum write FMaximum stored GetMaximumStored;
    property default: default read FDefault write FDefault stored GetDefaultStored;
    property pattern: pattern read FPattern write FPattern stored GetPatternStored;
    [FieldName('in')]
    property &in: System.String read FIn write FIn stored GetInStored;
    property items: Blue.Print.Open.API.Schema.v20.PrimitivesItems read GetItems write FItems stored GetItemsStored;
    property minLength: minLength read GetMinLength write FMinLength stored GetMinLengthStored;
    property minItems: minItems read GetMinItems write FMinItems stored GetMinItemsStored;
    property required: System.Boolean read FRequired write SetRequired stored FRequiredIsStored;
    [FieldName('type')]
    property &type: System.String read FType write FType stored GetTypeStored;
    property multipleOf: multipleOf read FMultipleOf write FMultipleOf stored GetMultipleOfStored;
    property vendorExtension: TMap<System.String, vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
  end;

  Info = class
  private
    FVersion: System.String;
    FTitle: System.String;
    FLicense: Blue.Print.Open.API.Schema.v20.License;
    FDescription: System.String;
    FTermsOfService: System.String;
    FContact: Blue.Print.Open.API.Schema.v20.Contact;
    FVendorExtension: TMap<System.String, vendorExtension>;

    function GetLicense: Blue.Print.Open.API.Schema.v20.License;
    function GetContact: Blue.Print.Open.API.Schema.v20.Contact;
    function GetVendorExtension: TMap<System.String, vendorExtension>;
    function GetLicenseStored: Boolean;
    function GetDescriptionStored: Boolean;
    function GetTermsOfServiceStored: Boolean;
    function GetContactStored: Boolean;
    function GetVendorExtensionStored: Boolean;
  public
    destructor Destroy; override;

    property IsLicenseStored: Boolean read GetLicenseStored;
    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsTermsOfServiceStored: Boolean read GetTermsOfServiceStored;
    property IsContactStored: Boolean read GetContactStored;
    property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
  published
    property version: System.String read FVersion write FVersion;
    property title: System.String read FTitle write FTitle;
    property license: Blue.Print.Open.API.Schema.v20.License read GetLicense write FLicense stored GetLicenseStored;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property termsOfService: System.String read FTermsOfService write FTermsOfService stored GetTermsOfServiceStored;
    property contact: Blue.Print.Open.API.Schema.v20.Contact read GetContact write FContact stored GetContactStored;
    property vendorExtension: TMap<System.String, vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
  end;

  FileSchema = class
  private
    FFormat: System.String;
    FDescription: System.String;
    FDefault: any;
    FReadOnly: System.Boolean;
    FTitle: System.String;
    FExternalDocs: Blue.Print.Open.API.Schema.v20.ExternalDocs;
    FRequired: stringArray;
    FType: System.String;
    FExample: any;
    FVendorExtension: TMap<System.String, vendorExtension>;
    FReadOnlyIsStored: Boolean;

    function GetExternalDocs: Blue.Print.Open.API.Schema.v20.ExternalDocs;
    function GetVendorExtension: TMap<System.String, vendorExtension>;
    function GetFormatStored: Boolean;
    function GetDescriptionStored: Boolean;
    function GetDefaultStored: Boolean;
    function GetTitleStored: Boolean;
    function GetExternalDocsStored: Boolean;
    function GetRequiredStored: Boolean;
    function GetExampleStored: Boolean;
    function GetVendorExtensionStored: Boolean;
    procedure SetReadOnly(const Value: System.Boolean);
  public
    destructor Destroy; override;

    property IsFormatStored: Boolean read GetFormatStored;
    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsDefaultStored: Boolean read GetDefaultStored;
    property IsReadOnlyStored: Boolean read FReadOnlyIsStored;
    property IsTitleStored: Boolean read GetTitleStored;
    property IsExternalDocsStored: Boolean read GetExternalDocsStored;
    property IsRequiredStored: Boolean read GetRequiredStored;
    property IsExampleStored: Boolean read GetExampleStored;
    property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
  published
    property format: System.String read FFormat write FFormat stored GetFormatStored;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property default: any read FDefault write FDefault stored GetDefaultStored;
    property readOnly: System.Boolean read FReadOnly write SetReadOnly stored FReadOnlyIsStored;
    property title: System.String read FTitle write FTitle stored GetTitleStored;
    property externalDocs: Blue.Print.Open.API.Schema.v20.ExternalDocs read GetExternalDocs write FExternalDocs stored GetExternalDocsStored;
    property required: stringArray read FRequired write FRequired stored GetRequiredStored;
    [FieldName('type')]
    property &type: System.String read FType write FType;
    property example: any read FExample write FExample stored GetExampleStored;
    property vendorExtension: TMap<System.String, vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
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

  Oauth2PasswordSecurity = class
  private
    FFlow: System.String;
    FDescription: System.String;
    FScopes: oauth2Scopes;
    FType: System.String;
    FTokenUrl: System.String;
    FVendorExtension: TMap<System.String, vendorExtension>;

    function GetScopes: oauth2Scopes;
    function GetVendorExtension: TMap<System.String, vendorExtension>;
    function GetDescriptionStored: Boolean;
    function GetScopesStored: Boolean;
    function GetVendorExtensionStored: Boolean;
  public
    destructor Destroy; override;

    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsScopesStored: Boolean read GetScopesStored;
    property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
  published
    property flow: System.String read FFlow write FFlow;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property scopes: oauth2Scopes read GetScopes write FScopes stored GetScopesStored;
    [FieldName('type')]
    property &type: System.String read FType write FType;
    property tokenUrl: System.String read FTokenUrl write FTokenUrl;
    property vendorExtension: TMap<System.String, vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
  end;

  Oauth2AccessCodeSecurity = class
  private
    FFlow: System.String;
    FTokenUrl: System.String;
    FDescription: System.String;
    FScopes: oauth2Scopes;
    FType: System.String;
    FAuthorizationUrl: System.String;
    FVendorExtension: TMap<System.String, vendorExtension>;

    function GetScopes: oauth2Scopes;
    function GetVendorExtension: TMap<System.String, vendorExtension>;
    function GetDescriptionStored: Boolean;
    function GetScopesStored: Boolean;
    function GetVendorExtensionStored: Boolean;
  public
    destructor Destroy; override;

    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsScopesStored: Boolean read GetScopesStored;
    property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
  published
    property flow: System.String read FFlow write FFlow;
    property tokenUrl: System.String read FTokenUrl write FTokenUrl;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property scopes: oauth2Scopes read GetScopes write FScopes stored GetScopesStored;
    [FieldName('type')]
    property &type: System.String read FType write FType;
    property authorizationUrl: System.String read FAuthorizationUrl write FAuthorizationUrl;
    property vendorExtension: TMap<System.String, vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
  end;

  BasicAuthenticationSecurity = class
  private
    FDescription: System.String;
    FType: System.String;
    FVendorExtension: TMap<System.String, vendorExtension>;

    function GetVendorExtension: TMap<System.String, vendorExtension>;
    function GetDescriptionStored: Boolean;
    function GetVendorExtensionStored: Boolean;
  public
    destructor Destroy; override;

    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
  published
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    [FieldName('type')]
    property &type: System.String read FType write FType;
    property vendorExtension: TMap<System.String, vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
  end;

  License = class
  private
    FUrl: System.String;
    FName: System.String;
    FVendorExtension: TMap<System.String, vendorExtension>;

    function GetVendorExtension: TMap<System.String, vendorExtension>;
    function GetUrlStored: Boolean;
    function GetVendorExtensionStored: Boolean;
  public
    destructor Destroy; override;

    property IsUrlStored: Boolean read GetUrlStored;
    property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
  published
    property url: System.String read FUrl write FUrl stored GetUrlStored;
    property name: System.String read FName write FName;
    property vendorExtension: TMap<System.String, vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
  end;

  Paths = class
  private
    FPathItem: TMap<System.String, Blue.Print.Open.API.Schema.v20.PathItem>;
    FVendorExtension: TMap<System.String, vendorExtension>;

    function GetPathItem: TMap<System.String, Blue.Print.Open.API.Schema.v20.PathItem>;
    function GetVendorExtension: TMap<System.String, vendorExtension>;
    function GetPathItemStored: Boolean;
    function GetVendorExtensionStored: Boolean;
  public
    destructor Destroy; override;

    property IsPathItemStored: Boolean read GetPathItemStored;
    property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
  published
    property pathItem: TMap<System.String, Blue.Print.Open.API.Schema.v20.PathItem> read GetPathItem write FPathItem stored GetPathItemStored;
    property vendorExtension: TMap<System.String, vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
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

  ApiKeySecurity = class
  private
    FName: System.String;
    FIn: System.String;
    FDescription: System.String;
    FType: System.String;
    FVendorExtension: TMap<System.String, vendorExtension>;

    function GetVendorExtension: TMap<System.String, vendorExtension>;
    function GetDescriptionStored: Boolean;
    function GetVendorExtensionStored: Boolean;
  public
    destructor Destroy; override;

    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
  published
    property name: System.String read FName write FName;
    [FieldName('in')]
    property &in: System.String read FIn write FIn;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    [FieldName('type')]
    property &type: System.String read FType write FType;
    property vendorExtension: TMap<System.String, vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
  end;

  HeaderParameterSubSchema = class
  private
    FName: System.String;
    FExclusiveMaximum: exclusiveMaximum;
    FMinimum: minimum;
    FFormat: System.String;
    FExclusiveMinimum: exclusiveMinimum;
    FMaxLength: maxLength;
    FEnum: enum;
    FMaxItems: maxItems;
    FCollectionFormat: collectionFormat;
    FUniqueItems: uniqueItems;
    FDescription: System.String;
    FMaximum: maximum;
    FDefault: default;
    FPattern: pattern;
    FIn: System.String;
    FItems: Blue.Print.Open.API.Schema.v20.PrimitivesItems;
    FMinLength: minLength;
    FMinItems: minItems;
    FRequired: System.Boolean;
    FType: System.String;
    FMultipleOf: multipleOf;
    FVendorExtension: TMap<System.String, vendorExtension>;
    FExclusiveMaximumIsStored: Boolean;
    FExclusiveMinimumIsStored: Boolean;
    FUniqueItemsIsStored: Boolean;
    FRequiredIsStored: Boolean;

    function GetItems: Blue.Print.Open.API.Schema.v20.PrimitivesItems;
    function GetMinLength: minLength;
    function GetMinItems: minItems;
    function GetVendorExtension: TMap<System.String, vendorExtension>;
    function GetNameStored: Boolean;
    function GetMinimumStored: Boolean;
    function GetFormatStored: Boolean;
    function GetMaxLengthStored: Boolean;
    function GetEnumStored: Boolean;
    function GetMaxItemsStored: Boolean;
    function GetCollectionFormatStored: Boolean;
    function GetDescriptionStored: Boolean;
    function GetMaximumStored: Boolean;
    function GetDefaultStored: Boolean;
    function GetPatternStored: Boolean;
    function GetInStored: Boolean;
    function GetItemsStored: Boolean;
    function GetMinLengthStored: Boolean;
    function GetMinItemsStored: Boolean;
    function GetTypeStored: Boolean;
    function GetMultipleOfStored: Boolean;
    function GetVendorExtensionStored: Boolean;
    procedure SetExclusiveMaximum(const Value: exclusiveMaximum);
    procedure SetExclusiveMinimum(const Value: exclusiveMinimum);
    procedure SetUniqueItems(const Value: uniqueItems);
    procedure SetRequired(const Value: System.Boolean);
  public
    destructor Destroy; override;

    property IsNameStored: Boolean read GetNameStored;
    property IsExclusiveMaximumStored: Boolean read FExclusiveMaximumIsStored;
    property IsMinimumStored: Boolean read GetMinimumStored;
    property IsFormatStored: Boolean read GetFormatStored;
    property IsExclusiveMinimumStored: Boolean read FExclusiveMinimumIsStored;
    property IsMaxLengthStored: Boolean read GetMaxLengthStored;
    property IsEnumStored: Boolean read GetEnumStored;
    property IsMaxItemsStored: Boolean read GetMaxItemsStored;
    property IsCollectionFormatStored: Boolean read GetCollectionFormatStored;
    property IsUniqueItemsStored: Boolean read FUniqueItemsIsStored;
    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsMaximumStored: Boolean read GetMaximumStored;
    property IsDefaultStored: Boolean read GetDefaultStored;
    property IsPatternStored: Boolean read GetPatternStored;
    property IsInStored: Boolean read GetInStored;
    property IsItemsStored: Boolean read GetItemsStored;
    property IsMinLengthStored: Boolean read GetMinLengthStored;
    property IsMinItemsStored: Boolean read GetMinItemsStored;
    property IsRequiredStored: Boolean read FRequiredIsStored;
    property IsTypeStored: Boolean read GetTypeStored;
    property IsMultipleOfStored: Boolean read GetMultipleOfStored;
    property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
  published
    property name: System.String read FName write FName stored GetNameStored;
    property exclusiveMaximum: exclusiveMaximum read FExclusiveMaximum write SetExclusiveMaximum stored FExclusiveMaximumIsStored;
    property minimum: minimum read FMinimum write FMinimum stored GetMinimumStored;
    property format: System.String read FFormat write FFormat stored GetFormatStored;
    property exclusiveMinimum: exclusiveMinimum read FExclusiveMinimum write SetExclusiveMinimum stored FExclusiveMinimumIsStored;
    property maxLength: maxLength read FMaxLength write FMaxLength stored GetMaxLengthStored;
    property enum: enum read FEnum write FEnum stored GetEnumStored;
    property maxItems: maxItems read FMaxItems write FMaxItems stored GetMaxItemsStored;
    property collectionFormat: collectionFormat read FCollectionFormat write FCollectionFormat stored GetCollectionFormatStored;
    property uniqueItems: uniqueItems read FUniqueItems write SetUniqueItems stored FUniqueItemsIsStored;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property maximum: maximum read FMaximum write FMaximum stored GetMaximumStored;
    property default: default read FDefault write FDefault stored GetDefaultStored;
    property pattern: pattern read FPattern write FPattern stored GetPatternStored;
    [FieldName('in')]
    property &in: System.String read FIn write FIn stored GetInStored;
    property items: Blue.Print.Open.API.Schema.v20.PrimitivesItems read GetItems write FItems stored GetItemsStored;
    property minLength: minLength read GetMinLength write FMinLength stored GetMinLengthStored;
    property minItems: minItems read GetMinItems write FMinItems stored GetMinItemsStored;
    property required: System.Boolean read FRequired write SetRequired stored FRequiredIsStored;
    [FieldName('type')]
    property &type: System.String read FType write FType stored GetTypeStored;
    property multipleOf: multipleOf read FMultipleOf write FMultipleOf stored GetMultipleOfStored;
    property vendorExtension: TMap<System.String, vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
  end;

  PrimitivesItems = class
  private
    FExclusiveMaximum: exclusiveMaximum;
    FMinimum: minimum;
    FFormat: System.String;
    FExclusiveMinimum: exclusiveMinimum;
    FMaxLength: maxLength;
    FEnum: enum;
    FMaxItems: maxItems;
    FCollectionFormat: collectionFormat;
    FUniqueItems: uniqueItems;
    FMaximum: maximum;
    FDefault: default;
    FPattern: pattern;
    FItems: Blue.Print.Open.API.Schema.v20.PrimitivesItems;
    FMinLength: minLength;
    FMinItems: minItems;
    FMultipleOf: multipleOf;
    FType: System.String;
    FVendorExtension: TMap<System.String, vendorExtension>;
    FExclusiveMaximumIsStored: Boolean;
    FExclusiveMinimumIsStored: Boolean;
    FUniqueItemsIsStored: Boolean;

    function GetItems: Blue.Print.Open.API.Schema.v20.PrimitivesItems;
    function GetMinLength: minLength;
    function GetMinItems: minItems;
    function GetVendorExtension: TMap<System.String, vendorExtension>;
    function GetMinimumStored: Boolean;
    function GetFormatStored: Boolean;
    function GetMaxLengthStored: Boolean;
    function GetEnumStored: Boolean;
    function GetMaxItemsStored: Boolean;
    function GetCollectionFormatStored: Boolean;
    function GetMaximumStored: Boolean;
    function GetDefaultStored: Boolean;
    function GetPatternStored: Boolean;
    function GetItemsStored: Boolean;
    function GetMinLengthStored: Boolean;
    function GetMinItemsStored: Boolean;
    function GetMultipleOfStored: Boolean;
    function GetTypeStored: Boolean;
    function GetVendorExtensionStored: Boolean;
    procedure SetExclusiveMaximum(const Value: exclusiveMaximum);
    procedure SetExclusiveMinimum(const Value: exclusiveMinimum);
    procedure SetUniqueItems(const Value: uniqueItems);
  public
    destructor Destroy; override;

    property IsExclusiveMaximumStored: Boolean read FExclusiveMaximumIsStored;
    property IsMinimumStored: Boolean read GetMinimumStored;
    property IsFormatStored: Boolean read GetFormatStored;
    property IsExclusiveMinimumStored: Boolean read FExclusiveMinimumIsStored;
    property IsMaxLengthStored: Boolean read GetMaxLengthStored;
    property IsEnumStored: Boolean read GetEnumStored;
    property IsMaxItemsStored: Boolean read GetMaxItemsStored;
    property IsCollectionFormatStored: Boolean read GetCollectionFormatStored;
    property IsUniqueItemsStored: Boolean read FUniqueItemsIsStored;
    property IsMaximumStored: Boolean read GetMaximumStored;
    property IsDefaultStored: Boolean read GetDefaultStored;
    property IsPatternStored: Boolean read GetPatternStored;
    property IsItemsStored: Boolean read GetItemsStored;
    property IsMinLengthStored: Boolean read GetMinLengthStored;
    property IsMinItemsStored: Boolean read GetMinItemsStored;
    property IsMultipleOfStored: Boolean read GetMultipleOfStored;
    property IsTypeStored: Boolean read GetTypeStored;
    property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
  published
    property exclusiveMaximum: exclusiveMaximum read FExclusiveMaximum write SetExclusiveMaximum stored FExclusiveMaximumIsStored;
    property minimum: minimum read FMinimum write FMinimum stored GetMinimumStored;
    property format: System.String read FFormat write FFormat stored GetFormatStored;
    property exclusiveMinimum: exclusiveMinimum read FExclusiveMinimum write SetExclusiveMinimum stored FExclusiveMinimumIsStored;
    property maxLength: maxLength read FMaxLength write FMaxLength stored GetMaxLengthStored;
    property enum: enum read FEnum write FEnum stored GetEnumStored;
    property maxItems: maxItems read FMaxItems write FMaxItems stored GetMaxItemsStored;
    property collectionFormat: collectionFormat read FCollectionFormat write FCollectionFormat stored GetCollectionFormatStored;
    property uniqueItems: uniqueItems read FUniqueItems write SetUniqueItems stored FUniqueItemsIsStored;
    property maximum: maximum read FMaximum write FMaximum stored GetMaximumStored;
    property default: default read FDefault write FDefault stored GetDefaultStored;
    property pattern: pattern read FPattern write FPattern stored GetPatternStored;
    property items: Blue.Print.Open.API.Schema.v20.PrimitivesItems read GetItems write FItems stored GetItemsStored;
    property minLength: minLength read GetMinLength write FMinLength stored GetMinLengthStored;
    property minItems: minItems read GetMinItems write FMinItems stored GetMinItemsStored;
    property multipleOf: multipleOf read FMultipleOf write FMultipleOf stored GetMultipleOfStored;
    [FieldName('type')]
    property &type: System.String read FType write FType stored GetTypeStored;
    property vendorExtension: TMap<System.String, vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
  end;

  QueryParameterSubSchema = class
  private
    FName: System.String;
    FExclusiveMaximum: exclusiveMaximum;
    FMinimum: minimum;
    FFormat: System.String;
    FExclusiveMinimum: exclusiveMinimum;
    FMaxLength: maxLength;
    FEnum: enum;
    FMaxItems: maxItems;
    FCollectionFormat: collectionFormat;
    FUniqueItems: uniqueItems;
    FAllowEmptyValue: System.Boolean;
    FDescription: System.String;
    FMaximum: maximum;
    FDefault: default;
    FPattern: pattern;
    FIn: System.String;
    FItems: Blue.Print.Open.API.Schema.v20.PrimitivesItems;
    FMinLength: minLength;
    FMinItems: minItems;
    FRequired: System.Boolean;
    FType: System.String;
    FMultipleOf: multipleOf;
    FVendorExtension: TMap<System.String, vendorExtension>;
    FExclusiveMaximumIsStored: Boolean;
    FExclusiveMinimumIsStored: Boolean;
    FUniqueItemsIsStored: Boolean;
    FAllowEmptyValueIsStored: Boolean;
    FRequiredIsStored: Boolean;

    function GetItems: Blue.Print.Open.API.Schema.v20.PrimitivesItems;
    function GetMinLength: minLength;
    function GetMinItems: minItems;
    function GetVendorExtension: TMap<System.String, vendorExtension>;
    function GetNameStored: Boolean;
    function GetMinimumStored: Boolean;
    function GetFormatStored: Boolean;
    function GetMaxLengthStored: Boolean;
    function GetEnumStored: Boolean;
    function GetMaxItemsStored: Boolean;
    function GetCollectionFormatStored: Boolean;
    function GetDescriptionStored: Boolean;
    function GetMaximumStored: Boolean;
    function GetDefaultStored: Boolean;
    function GetPatternStored: Boolean;
    function GetInStored: Boolean;
    function GetItemsStored: Boolean;
    function GetMinLengthStored: Boolean;
    function GetMinItemsStored: Boolean;
    function GetTypeStored: Boolean;
    function GetMultipleOfStored: Boolean;
    function GetVendorExtensionStored: Boolean;
    procedure SetExclusiveMaximum(const Value: exclusiveMaximum);
    procedure SetExclusiveMinimum(const Value: exclusiveMinimum);
    procedure SetUniqueItems(const Value: uniqueItems);
    procedure SetAllowEmptyValue(const Value: System.Boolean);
    procedure SetRequired(const Value: System.Boolean);
  public
    destructor Destroy; override;

    property IsNameStored: Boolean read GetNameStored;
    property IsExclusiveMaximumStored: Boolean read FExclusiveMaximumIsStored;
    property IsMinimumStored: Boolean read GetMinimumStored;
    property IsFormatStored: Boolean read GetFormatStored;
    property IsExclusiveMinimumStored: Boolean read FExclusiveMinimumIsStored;
    property IsMaxLengthStored: Boolean read GetMaxLengthStored;
    property IsEnumStored: Boolean read GetEnumStored;
    property IsMaxItemsStored: Boolean read GetMaxItemsStored;
    property IsCollectionFormatStored: Boolean read GetCollectionFormatStored;
    property IsUniqueItemsStored: Boolean read FUniqueItemsIsStored;
    property IsAllowEmptyValueStored: Boolean read FAllowEmptyValueIsStored;
    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsMaximumStored: Boolean read GetMaximumStored;
    property IsDefaultStored: Boolean read GetDefaultStored;
    property IsPatternStored: Boolean read GetPatternStored;
    property IsInStored: Boolean read GetInStored;
    property IsItemsStored: Boolean read GetItemsStored;
    property IsMinLengthStored: Boolean read GetMinLengthStored;
    property IsMinItemsStored: Boolean read GetMinItemsStored;
    property IsRequiredStored: Boolean read FRequiredIsStored;
    property IsTypeStored: Boolean read GetTypeStored;
    property IsMultipleOfStored: Boolean read GetMultipleOfStored;
    property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
  published
    property name: System.String read FName write FName stored GetNameStored;
    property exclusiveMaximum: exclusiveMaximum read FExclusiveMaximum write SetExclusiveMaximum stored FExclusiveMaximumIsStored;
    property minimum: minimum read FMinimum write FMinimum stored GetMinimumStored;
    property format: System.String read FFormat write FFormat stored GetFormatStored;
    property exclusiveMinimum: exclusiveMinimum read FExclusiveMinimum write SetExclusiveMinimum stored FExclusiveMinimumIsStored;
    property maxLength: maxLength read FMaxLength write FMaxLength stored GetMaxLengthStored;
    property enum: enum read FEnum write FEnum stored GetEnumStored;
    property maxItems: maxItems read FMaxItems write FMaxItems stored GetMaxItemsStored;
    property collectionFormat: collectionFormat read FCollectionFormat write FCollectionFormat stored GetCollectionFormatStored;
    property uniqueItems: uniqueItems read FUniqueItems write SetUniqueItems stored FUniqueItemsIsStored;
    property allowEmptyValue: System.Boolean read FAllowEmptyValue write SetAllowEmptyValue stored FAllowEmptyValueIsStored;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property maximum: maximum read FMaximum write FMaximum stored GetMaximumStored;
    property default: default read FDefault write FDefault stored GetDefaultStored;
    property pattern: pattern read FPattern write FPattern stored GetPatternStored;
    [FieldName('in')]
    property &in: System.String read FIn write FIn stored GetInStored;
    property items: Blue.Print.Open.API.Schema.v20.PrimitivesItems read GetItems write FItems stored GetItemsStored;
    property minLength: minLength read GetMinLength write FMinLength stored GetMinLengthStored;
    property minItems: minItems read GetMinItems write FMinItems stored GetMinItemsStored;
    property required: System.Boolean read FRequired write SetRequired stored FRequiredIsStored;
    [FieldName('type')]
    property &type: System.String read FType write FType stored GetTypeStored;
    property multipleOf: multipleOf read FMultipleOf write FMultipleOf stored GetMultipleOfStored;
    property vendorExtension: TMap<System.String, vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
  end;

  Oauth2ApplicationSecurity = class
  private
    FFlow: System.String;
    FDescription: System.String;
    FScopes: oauth2Scopes;
    FType: System.String;
    FTokenUrl: System.String;
    FVendorExtension: TMap<System.String, vendorExtension>;

    function GetScopes: oauth2Scopes;
    function GetVendorExtension: TMap<System.String, vendorExtension>;
    function GetDescriptionStored: Boolean;
    function GetScopesStored: Boolean;
    function GetVendorExtensionStored: Boolean;
  public
    destructor Destroy; override;

    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsScopesStored: Boolean read GetScopesStored;
    property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
  published
    property flow: System.String read FFlow write FFlow;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property scopes: oauth2Scopes read GetScopes write FScopes stored GetScopesStored;
    [FieldName('type')]
    property &type: System.String read FType write FType;
    property tokenUrl: System.String read FTokenUrl write FTokenUrl;
    property vendorExtension: TMap<System.String, vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
  end;

  BodyParameter = class
  private
    FName: System.String;
    FIn: System.String;
    FDescription: System.String;
    FRequired: System.Boolean;
    FSchema: Blue.Print.Open.API.Schema.v20.Schema;
    FVendorExtension: TMap<System.String, vendorExtension>;
    FRequiredIsStored: Boolean;

    function GetSchema: Blue.Print.Open.API.Schema.v20.Schema;
    function GetVendorExtension: TMap<System.String, vendorExtension>;
    function GetDescriptionStored: Boolean;
    function GetVendorExtensionStored: Boolean;
    procedure SetRequired(const Value: System.Boolean);
  public
    destructor Destroy; override;

    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsRequiredStored: Boolean read FRequiredIsStored;
    property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
  published
    property name: System.String read FName write FName;
    [FieldName('in')]
    property &in: System.String read FIn write FIn;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property required: System.Boolean read FRequired write SetRequired stored FRequiredIsStored;
    property schema: Blue.Print.Open.API.Schema.v20.Schema read GetSchema write FSchema;
    property vendorExtension: TMap<System.String, vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
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

  Oauth2ImplicitSecurity = class
  private
    FFlow: System.String;
    FDescription: System.String;
    FScopes: oauth2Scopes;
    FType: System.String;
    FAuthorizationUrl: System.String;
    FVendorExtension: TMap<System.String, vendorExtension>;

    function GetScopes: oauth2Scopes;
    function GetVendorExtension: TMap<System.String, vendorExtension>;
    function GetDescriptionStored: Boolean;
    function GetScopesStored: Boolean;
    function GetVendorExtensionStored: Boolean;
  public
    destructor Destroy; override;

    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsScopesStored: Boolean read GetScopesStored;
    property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
  published
    property flow: System.String read FFlow write FFlow;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property scopes: oauth2Scopes read GetScopes write FScopes stored GetScopesStored;
    [FieldName('type')]
    property &type: System.String read FType write FType;
    property authorizationUrl: System.String read FAuthorizationUrl write FAuthorizationUrl;
    property vendorExtension: TMap<System.String, vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
  end;

  Header = class
  private
    FExclusiveMaximum: exclusiveMaximum;
    FMinimum: minimum;
    FFormat: System.String;
    FExclusiveMinimum: exclusiveMinimum;
    FMaxLength: maxLength;
    FEnum: enum;
    FMaxItems: maxItems;
    FCollectionFormat: collectionFormat;
    FUniqueItems: uniqueItems;
    FDescription: System.String;
    FMaximum: maximum;
    FDefault: default;
    FPattern: pattern;
    FItems: Blue.Print.Open.API.Schema.v20.PrimitivesItems;
    FMinLength: minLength;
    FMinItems: minItems;
    FMultipleOf: multipleOf;
    FType: System.String;
    FVendorExtension: TMap<System.String, vendorExtension>;
    FExclusiveMaximumIsStored: Boolean;
    FExclusiveMinimumIsStored: Boolean;
    FUniqueItemsIsStored: Boolean;

    function GetItems: Blue.Print.Open.API.Schema.v20.PrimitivesItems;
    function GetMinLength: minLength;
    function GetMinItems: minItems;
    function GetVendorExtension: TMap<System.String, vendorExtension>;
    function GetMinimumStored: Boolean;
    function GetFormatStored: Boolean;
    function GetMaxLengthStored: Boolean;
    function GetEnumStored: Boolean;
    function GetMaxItemsStored: Boolean;
    function GetCollectionFormatStored: Boolean;
    function GetDescriptionStored: Boolean;
    function GetMaximumStored: Boolean;
    function GetDefaultStored: Boolean;
    function GetPatternStored: Boolean;
    function GetItemsStored: Boolean;
    function GetMinLengthStored: Boolean;
    function GetMinItemsStored: Boolean;
    function GetMultipleOfStored: Boolean;
    function GetVendorExtensionStored: Boolean;
    procedure SetExclusiveMaximum(const Value: exclusiveMaximum);
    procedure SetExclusiveMinimum(const Value: exclusiveMinimum);
    procedure SetUniqueItems(const Value: uniqueItems);
  public
    destructor Destroy; override;

    property IsExclusiveMaximumStored: Boolean read FExclusiveMaximumIsStored;
    property IsMinimumStored: Boolean read GetMinimumStored;
    property IsFormatStored: Boolean read GetFormatStored;
    property IsExclusiveMinimumStored: Boolean read FExclusiveMinimumIsStored;
    property IsMaxLengthStored: Boolean read GetMaxLengthStored;
    property IsEnumStored: Boolean read GetEnumStored;
    property IsMaxItemsStored: Boolean read GetMaxItemsStored;
    property IsCollectionFormatStored: Boolean read GetCollectionFormatStored;
    property IsUniqueItemsStored: Boolean read FUniqueItemsIsStored;
    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsMaximumStored: Boolean read GetMaximumStored;
    property IsDefaultStored: Boolean read GetDefaultStored;
    property IsPatternStored: Boolean read GetPatternStored;
    property IsItemsStored: Boolean read GetItemsStored;
    property IsMinLengthStored: Boolean read GetMinLengthStored;
    property IsMinItemsStored: Boolean read GetMinItemsStored;
    property IsMultipleOfStored: Boolean read GetMultipleOfStored;
    property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
  published
    property exclusiveMaximum: exclusiveMaximum read FExclusiveMaximum write SetExclusiveMaximum stored FExclusiveMaximumIsStored;
    property minimum: minimum read FMinimum write FMinimum stored GetMinimumStored;
    property format: System.String read FFormat write FFormat stored GetFormatStored;
    property exclusiveMinimum: exclusiveMinimum read FExclusiveMinimum write SetExclusiveMinimum stored FExclusiveMinimumIsStored;
    property maxLength: maxLength read FMaxLength write FMaxLength stored GetMaxLengthStored;
    property enum: enum read FEnum write FEnum stored GetEnumStored;
    property maxItems: maxItems read FMaxItems write FMaxItems stored GetMaxItemsStored;
    property collectionFormat: collectionFormat read FCollectionFormat write FCollectionFormat stored GetCollectionFormatStored;
    property uniqueItems: uniqueItems read FUniqueItems write SetUniqueItems stored FUniqueItemsIsStored;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property maximum: maximum read FMaximum write FMaximum stored GetMaximumStored;
    property default: default read FDefault write FDefault stored GetDefaultStored;
    property pattern: pattern read FPattern write FPattern stored GetPatternStored;
    property items: Blue.Print.Open.API.Schema.v20.PrimitivesItems read GetItems write FItems stored GetItemsStored;
    property minLength: minLength read GetMinLength write FMinLength stored GetMinLengthStored;
    property minItems: minItems read GetMinItems write FMinItems stored GetMinItemsStored;
    property multipleOf: multipleOf read FMultipleOf write FMultipleOf stored GetMultipleOfStored;
    [FieldName('type')]
    property &type: System.String read FType write FType;
    property vendorExtension: TMap<System.String, vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
  end;

  Xml = class
  private
    FAttribute: System.Boolean;
    FName: System.String;
    FPrefix: System.String;
    FWrapped: System.Boolean;
    FNamespace: System.String;
    FVendorExtension: TMap<System.String, vendorExtension>;
    FAttributeIsStored: Boolean;
    FWrappedIsStored: Boolean;

    function GetVendorExtension: TMap<System.String, vendorExtension>;
    function GetNameStored: Boolean;
    function GetPrefixStored: Boolean;
    function GetNamespaceStored: Boolean;
    function GetVendorExtensionStored: Boolean;
    procedure SetAttribute(const Value: System.Boolean);
    procedure SetWrapped(const Value: System.Boolean);
  public
    destructor Destroy; override;

    property IsAttributeStored: Boolean read FAttributeIsStored;
    property IsNameStored: Boolean read GetNameStored;
    property IsPrefixStored: Boolean read GetPrefixStored;
    property IsWrappedStored: Boolean read FWrappedIsStored;
    property IsNamespaceStored: Boolean read GetNamespaceStored;
    property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
  published
    property attribute: System.Boolean read FAttribute write SetAttribute stored FAttributeIsStored;
    property name: System.String read FName write FName stored GetNameStored;
    property prefix: System.String read FPrefix write FPrefix stored GetPrefixStored;
    property wrapped: System.Boolean read FWrapped write SetWrapped stored FWrappedIsStored;
    property namespace: System.String read FNamespace write FNamespace stored GetNamespaceStored;
    property vendorExtension: TMap<System.String, vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
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

  PathParameterSubSchema = class
  private
    FName: System.String;
    FExclusiveMaximum: exclusiveMaximum;
    FMinimum: minimum;
    FFormat: System.String;
    FExclusiveMinimum: exclusiveMinimum;
    FMaxLength: maxLength;
    FEnum: enum;
    FMaxItems: maxItems;
    FCollectionFormat: collectionFormat;
    FUniqueItems: uniqueItems;
    FDescription: description;
    FMaximum: maximum;
    FDefault: default;
    FPattern: pattern;
    FIn: System.String;
    FItems: Blue.Print.Open.API.Schema.v20.PrimitivesItems;
    FMinLength: minLength;
    FMinItems: minItems;
    FRequired: System.Boolean;
    FType: System.String;
    FMultipleOf: multipleOf;
    FVendorExtension: TMap<System.String, vendorExtension>;
    FExclusiveMaximumIsStored: Boolean;
    FExclusiveMinimumIsStored: Boolean;
    FUniqueItemsIsStored: Boolean;

    function GetItems: Blue.Print.Open.API.Schema.v20.PrimitivesItems;
    function GetMinLength: minLength;
    function GetMinItems: minItems;
    function GetVendorExtension: TMap<System.String, vendorExtension>;
    function GetNameStored: Boolean;
    function GetMinimumStored: Boolean;
    function GetFormatStored: Boolean;
    function GetMaxLengthStored: Boolean;
    function GetEnumStored: Boolean;
    function GetMaxItemsStored: Boolean;
    function GetCollectionFormatStored: Boolean;
    function GetDescriptionStored: Boolean;
    function GetMaximumStored: Boolean;
    function GetDefaultStored: Boolean;
    function GetPatternStored: Boolean;
    function GetInStored: Boolean;
    function GetItemsStored: Boolean;
    function GetMinLengthStored: Boolean;
    function GetMinItemsStored: Boolean;
    function GetTypeStored: Boolean;
    function GetMultipleOfStored: Boolean;
    function GetVendorExtensionStored: Boolean;
    procedure SetExclusiveMaximum(const Value: exclusiveMaximum);
    procedure SetExclusiveMinimum(const Value: exclusiveMinimum);
    procedure SetUniqueItems(const Value: uniqueItems);
  public
    destructor Destroy; override;

    property IsNameStored: Boolean read GetNameStored;
    property IsExclusiveMaximumStored: Boolean read FExclusiveMaximumIsStored;
    property IsMinimumStored: Boolean read GetMinimumStored;
    property IsFormatStored: Boolean read GetFormatStored;
    property IsExclusiveMinimumStored: Boolean read FExclusiveMinimumIsStored;
    property IsMaxLengthStored: Boolean read GetMaxLengthStored;
    property IsEnumStored: Boolean read GetEnumStored;
    property IsMaxItemsStored: Boolean read GetMaxItemsStored;
    property IsCollectionFormatStored: Boolean read GetCollectionFormatStored;
    property IsUniqueItemsStored: Boolean read FUniqueItemsIsStored;
    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsMaximumStored: Boolean read GetMaximumStored;
    property IsDefaultStored: Boolean read GetDefaultStored;
    property IsPatternStored: Boolean read GetPatternStored;
    property IsInStored: Boolean read GetInStored;
    property IsItemsStored: Boolean read GetItemsStored;
    property IsMinLengthStored: Boolean read GetMinLengthStored;
    property IsMinItemsStored: Boolean read GetMinItemsStored;
    property IsTypeStored: Boolean read GetTypeStored;
    property IsMultipleOfStored: Boolean read GetMultipleOfStored;
    property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
  published
    property name: System.String read FName write FName stored GetNameStored;
    property exclusiveMaximum: exclusiveMaximum read FExclusiveMaximum write SetExclusiveMaximum stored FExclusiveMaximumIsStored;
    property minimum: minimum read FMinimum write FMinimum stored GetMinimumStored;
    property format: System.String read FFormat write FFormat stored GetFormatStored;
    property exclusiveMinimum: exclusiveMinimum read FExclusiveMinimum write SetExclusiveMinimum stored FExclusiveMinimumIsStored;
    property maxLength: maxLength read FMaxLength write FMaxLength stored GetMaxLengthStored;
    property enum: enum read FEnum write FEnum stored GetEnumStored;
    property maxItems: maxItems read FMaxItems write FMaxItems stored GetMaxItemsStored;
    property collectionFormat: collectionFormat read FCollectionFormat write FCollectionFormat stored GetCollectionFormatStored;
    property uniqueItems: uniqueItems read FUniqueItems write SetUniqueItems stored FUniqueItemsIsStored;
    property description: description read FDescription write FDescription stored GetDescriptionStored;
    property maximum: maximum read FMaximum write FMaximum stored GetMaximumStored;
    property default: default read FDefault write FDefault stored GetDefaultStored;
    property pattern: pattern read FPattern write FPattern stored GetPatternStored;
    [FieldName('in')]
    property &in: System.String read FIn write FIn stored GetInStored;
    property items: Blue.Print.Open.API.Schema.v20.PrimitivesItems read GetItems write FItems stored GetItemsStored;
    property minLength: minLength read GetMinLength write FMinLength stored GetMinLengthStored;
    property minItems: minItems read GetMinItems write FMinItems stored GetMinItemsStored;
    property required: System.Boolean read FRequired write FRequired;
    [FieldName('type')]
    property &type: System.String read FType write FType stored GetTypeStored;
    property multipleOf: multipleOf read FMultipleOf write FMultipleOf stored GetMultipleOfStored;
    property vendorExtension: TMap<System.String, vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
  end;

  PathItem = class
  private
    FRef: System.String;
    FPatch: Blue.Print.Open.API.Schema.v20.Operation;
    FDelete: Blue.Print.Open.API.Schema.v20.Operation;
    FHead: Blue.Print.Open.API.Schema.v20.Operation;
    FGet: Blue.Print.Open.API.Schema.v20.Operation;
    FPost: Blue.Print.Open.API.Schema.v20.Operation;
    FOptions: Blue.Print.Open.API.Schema.v20.Operation;
    FParameters: parametersList;
    FPut: Blue.Print.Open.API.Schema.v20.Operation;
    FVendorExtension: TMap<System.String, vendorExtension>;

    function GetPatch: Blue.Print.Open.API.Schema.v20.Operation;
    function GetDelete: Blue.Print.Open.API.Schema.v20.Operation;
    function GetHead: Blue.Print.Open.API.Schema.v20.Operation;
    function GetGet: Blue.Print.Open.API.Schema.v20.Operation;
    function GetPost: Blue.Print.Open.API.Schema.v20.Operation;
    function GetOptions: Blue.Print.Open.API.Schema.v20.Operation;
    function GetPut: Blue.Print.Open.API.Schema.v20.Operation;
    function GetVendorExtension: TMap<System.String, vendorExtension>;
    function GetRefStored: Boolean;
    function GetPatchStored: Boolean;
    function GetDeleteStored: Boolean;
    function GetHeadStored: Boolean;
    function GetGetStored: Boolean;
    function GetPostStored: Boolean;
    function GetOptionsStored: Boolean;
    function GetParametersStored: Boolean;
    function GetPutStored: Boolean;
    function GetVendorExtensionStored: Boolean;
  public
    destructor Destroy; override;

    function AddParameters: Blue.Print.Open.API.Schema.v20.ParametersListArrayItem;

    property IsRefStored: Boolean read GetRefStored;
    property IsPatchStored: Boolean read GetPatchStored;
    property IsDeleteStored: Boolean read GetDeleteStored;
    property IsHeadStored: Boolean read GetHeadStored;
    property IsGetStored: Boolean read GetGetStored;
    property IsPostStored: Boolean read GetPostStored;
    property IsOptionsStored: Boolean read GetOptionsStored;
    property IsParametersStored: Boolean read GetParametersStored;
    property IsPutStored: Boolean read GetPutStored;
    property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
  published
    [FieldName('$ref')]
    property ref: System.String read FRef write FRef stored GetRefStored;
    property patch: Blue.Print.Open.API.Schema.v20.Operation read GetPatch write FPatch stored GetPatchStored;
    property delete: Blue.Print.Open.API.Schema.v20.Operation read GetDelete write FDelete stored GetDeleteStored;
    property head: Blue.Print.Open.API.Schema.v20.Operation read GetHead write FHead stored GetHeadStored;
    property get: Blue.Print.Open.API.Schema.v20.Operation read GetGet write FGet stored GetGetStored;
    property post: Blue.Print.Open.API.Schema.v20.Operation read GetPost write FPost stored GetPostStored;
    property options: Blue.Print.Open.API.Schema.v20.Operation read GetOptions write FOptions stored GetOptionsStored;
    property parameters: parametersList read FParameters write FParameters stored GetParametersStored;
    property put: Blue.Print.Open.API.Schema.v20.Operation read GetPut write FPut stored GetPutStored;
    property vendorExtension: TMap<System.String, vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
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
    FExample: any;
    FExclusiveMaximum: exclusiveMaximum;
    FMinimum: minimum;
    FFormat: System.String;
    FExclusiveMinimum: exclusiveMinimum;
    FAdditionalProperties: Blue.Print.Open.API.Schema.v20.Schema.TAdditionalProperties;
    FAllOf: TArray<Blue.Print.Open.API.Schema.v20.Schema>;
    FProperties: TMap<System.String, Blue.Print.Open.API.Schema.v20.Schema>;
    FDiscriminator: System.String;
    FMaxLength: maxLength;
    FEnum: enum;
    FRef: System.String;
    FMaxProperties: positiveInteger;
    FXml: Blue.Print.Open.API.Schema.v20.Xml;
    FMaxItems: maxItems;
    FUniqueItems: uniqueItems;
    FDescription: description;
    FMaximum: System.Double;
    FDefault: default;
    FPattern: pattern;
    FMinProperties: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    FMinLength: minLength;
    FItems: Blue.Print.Open.API.Schema.v20.Schema.TItems;
    FTitle: title;
    FReadOnly: System.Boolean;
    FMinItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    FExternalDocs: Blue.Print.Open.API.Schema.v20.ExternalDocs;
    FMultipleOf: multipleOf;
    FRequired: stringArray;
    FType: Blue.Print.Open.API.Schema.v20.Schema.TType;
    FVendorExtension: TMap<System.String, vendorExtension>;
    FExclusiveMaximumIsStored: Boolean;
    FExclusiveMinimumIsStored: Boolean;
    FUniqueItemsIsStored: Boolean;
    FReadOnlyIsStored: Boolean;

    function GetAdditionalProperties: Blue.Print.Open.API.Schema.v20.Schema.TAdditionalProperties;
    function GetProperties: TMap<System.String, Blue.Print.Open.API.Schema.v20.Schema>;
    function GetXml: Blue.Print.Open.API.Schema.v20.Xml;
    function GetMinProperties: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    function GetMinLength: minLength;
    function GetItems: Blue.Print.Open.API.Schema.v20.Schema.TItems;
    function GetMinItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    function GetExternalDocs: Blue.Print.Open.API.Schema.v20.ExternalDocs;
    function GetType: Blue.Print.Open.API.Schema.v20.Schema.TType;
    function GetVendorExtension: TMap<System.String, vendorExtension>;
    function GetExampleStored: Boolean;
    function GetMinimumStored: Boolean;
    function GetFormatStored: Boolean;
    function GetAdditionalPropertiesStored: Boolean;
    function GetAllOfStored: Boolean;
    function GetPropertiesStored: Boolean;
    function GetDiscriminatorStored: Boolean;
    function GetMaxLengthStored: Boolean;
    function GetEnumStored: Boolean;
    function GetRefStored: Boolean;
    function GetMaxPropertiesStored: Boolean;
    function GetXmlStored: Boolean;
    function GetMaxItemsStored: Boolean;
    function GetDescriptionStored: Boolean;
    function GetMaximumStored: Boolean;
    function GetDefaultStored: Boolean;
    function GetPatternStored: Boolean;
    function GetMinPropertiesStored: Boolean;
    function GetMinLengthStored: Boolean;
    function GetItemsStored: Boolean;
    function GetTitleStored: Boolean;
    function GetMinItemsStored: Boolean;
    function GetExternalDocsStored: Boolean;
    function GetMultipleOfStored: Boolean;
    function GetRequiredStored: Boolean;
    function GetTypeStored: Boolean;
    function GetVendorExtensionStored: Boolean;
    procedure SetExclusiveMaximum(const Value: exclusiveMaximum);
    procedure SetExclusiveMinimum(const Value: exclusiveMinimum);
    procedure SetUniqueItems(const Value: uniqueItems);
    procedure SetReadOnly(const Value: System.Boolean);
  public
    destructor Destroy; override;

    function AddAllOf: Blue.Print.Open.API.Schema.v20.Schema;

    property IsExampleStored: Boolean read GetExampleStored;
    property IsExclusiveMaximumStored: Boolean read FExclusiveMaximumIsStored;
    property IsMinimumStored: Boolean read GetMinimumStored;
    property IsFormatStored: Boolean read GetFormatStored;
    property IsExclusiveMinimumStored: Boolean read FExclusiveMinimumIsStored;
    property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
    property IsAllOfStored: Boolean read GetAllOfStored;
    property IsPropertiesStored: Boolean read GetPropertiesStored;
    property IsDiscriminatorStored: Boolean read GetDiscriminatorStored;
    property IsMaxLengthStored: Boolean read GetMaxLengthStored;
    property IsEnumStored: Boolean read GetEnumStored;
    property IsRefStored: Boolean read GetRefStored;
    property IsMaxPropertiesStored: Boolean read GetMaxPropertiesStored;
    property IsXmlStored: Boolean read GetXmlStored;
    property IsMaxItemsStored: Boolean read GetMaxItemsStored;
    property IsUniqueItemsStored: Boolean read FUniqueItemsIsStored;
    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsMaximumStored: Boolean read GetMaximumStored;
    property IsDefaultStored: Boolean read GetDefaultStored;
    property IsPatternStored: Boolean read GetPatternStored;
    property IsMinPropertiesStored: Boolean read GetMinPropertiesStored;
    property IsMinLengthStored: Boolean read GetMinLengthStored;
    property IsItemsStored: Boolean read GetItemsStored;
    property IsTitleStored: Boolean read GetTitleStored;
    property IsReadOnlyStored: Boolean read FReadOnlyIsStored;
    property IsMinItemsStored: Boolean read GetMinItemsStored;
    property IsExternalDocsStored: Boolean read GetExternalDocsStored;
    property IsMultipleOfStored: Boolean read GetMultipleOfStored;
    property IsRequiredStored: Boolean read GetRequiredStored;
    property IsTypeStored: Boolean read GetTypeStored;
    property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
  published
    property example: any read FExample write FExample stored GetExampleStored;
    property exclusiveMaximum: exclusiveMaximum read FExclusiveMaximum write SetExclusiveMaximum stored FExclusiveMaximumIsStored;
    property minimum: minimum read FMinimum write FMinimum stored GetMinimumStored;
    property format: System.String read FFormat write FFormat stored GetFormatStored;
    property exclusiveMinimum: exclusiveMinimum read FExclusiveMinimum write SetExclusiveMinimum stored FExclusiveMinimumIsStored;
    property additionalProperties: Blue.Print.Open.API.Schema.v20.Schema.TAdditionalProperties read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
    property allOf: TArray<Blue.Print.Open.API.Schema.v20.Schema> read FAllOf write FAllOf stored GetAllOfStored;
    property properties: TMap<System.String, Blue.Print.Open.API.Schema.v20.Schema> read GetProperties write FProperties stored GetPropertiesStored;
    property discriminator: System.String read FDiscriminator write FDiscriminator stored GetDiscriminatorStored;
    property maxLength: maxLength read FMaxLength write FMaxLength stored GetMaxLengthStored;
    property enum: enum read FEnum write FEnum stored GetEnumStored;
    [FieldName('$ref')]
    property ref: System.String read FRef write FRef stored GetRefStored;
    property maxProperties: positiveInteger read FMaxProperties write FMaxProperties stored GetMaxPropertiesStored;
    property xml: Blue.Print.Open.API.Schema.v20.Xml read GetXml write FXml stored GetXmlStored;
    property maxItems: maxItems read FMaxItems write FMaxItems stored GetMaxItemsStored;
    property uniqueItems: uniqueItems read FUniqueItems write SetUniqueItems stored FUniqueItemsIsStored;
    property description: description read FDescription write FDescription stored GetDescriptionStored;
    property maximum: System.Double read FMaximum write FMaximum stored GetMaximumStored;
    property default: default read FDefault write FDefault stored GetDefaultStored;
    property pattern: pattern read FPattern write FPattern stored GetPatternStored;
    property minProperties: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0 read GetMinProperties write FMinProperties stored GetMinPropertiesStored;
    property minLength: minLength read GetMinLength write FMinLength stored GetMinLengthStored;
    property items: Blue.Print.Open.API.Schema.v20.Schema.TItems read GetItems write FItems stored GetItemsStored;
    property title: title read FTitle write FTitle stored GetTitleStored;
    property readOnly: System.Boolean read FReadOnly write SetReadOnly stored FReadOnlyIsStored;
    property minItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0 read GetMinItems write FMinItems stored GetMinItemsStored;
    property externalDocs: Blue.Print.Open.API.Schema.v20.ExternalDocs read GetExternalDocs write FExternalDocs stored GetExternalDocsStored;
    property multipleOf: multipleOf read FMultipleOf write FMultipleOf stored GetMultipleOfStored;
    property required: stringArray read FRequired write FRequired stored GetRequiredStored;
    [FieldName('type')]
    property &type: Blue.Print.Open.API.Schema.v20.Schema.TType read GetType write FType stored GetTypeStored;
    property vendorExtension: TMap<System.String, vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
  end;

  Response = class
  private
    FHeaders: headers;
    FDescription: description;
    FSchema: Blue.Print.Open.API.Schema.v20.Schema;
    FExamples: examples;
    FVendorExtension: TMap<System.String, vendorExtension>;

    function GetHeaders: headers;
    function GetSchema: Blue.Print.Open.API.Schema.v20.Schema;
    function GetExamples: examples;
    function GetVendorExtension: TMap<System.String, vendorExtension>;
    function GetHeadersStored: Boolean;
    function GetSchemaStored: Boolean;
    function GetExamplesStored: Boolean;
    function GetVendorExtensionStored: Boolean;
  public
    destructor Destroy; override;

    property IsHeadersStored: Boolean read GetHeadersStored;
    property IsSchemaStored: Boolean read GetSchemaStored;
    property IsExamplesStored: Boolean read GetExamplesStored;
    property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
  published
    property headers: headers read GetHeaders write FHeaders stored GetHeadersStored;
    property description: description read FDescription write FDescription;
    property schema: Blue.Print.Open.API.Schema.v20.Schema read GetSchema write FSchema stored GetSchemaStored;
    property examples: examples read GetExamples write FExamples stored GetExamplesStored;
    property vendorExtension: TMap<System.String, vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
  end;

  Tag = class
  private
    FName: System.String;
    FDescription: description;
    FExternalDocs: Blue.Print.Open.API.Schema.v20.ExternalDocs;
    FVendorExtension: TMap<System.String, vendorExtension>;

    function GetExternalDocs: Blue.Print.Open.API.Schema.v20.ExternalDocs;
    function GetVendorExtension: TMap<System.String, vendorExtension>;
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
    property description: description read FDescription write FDescription stored GetDescriptionStored;
    property externalDocs: Blue.Print.Open.API.Schema.v20.ExternalDocs read GetExternalDocs write FExternalDocs stored GetExternalDocsStored;
    property vendorExtension: TMap<System.String, vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
  end;

  ExternalDocs = class
  private
    FDescription: description;
    FUrl: System.String;
    FVendorExtension: TMap<System.String, vendorExtension>;

    function GetVendorExtension: TMap<System.String, vendorExtension>;
    function GetDescriptionStored: Boolean;
    function GetVendorExtensionStored: Boolean;
  public
    destructor Destroy; override;

    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
  published
    property description: description read FDescription write FDescription stored GetDescriptionStored;
    property url: System.String read FUrl write FUrl;
    property vendorExtension: TMap<System.String, vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
  end;

  Contact = class
  private
    FEmail: System.String;
    FName: System.String;
    FUrl: System.String;
    FVendorExtension: TMap<System.String, vendorExtension>;

    function GetVendorExtension: TMap<System.String, vendorExtension>;
    function GetEmailStored: Boolean;
    function GetNameStored: Boolean;
    function GetUrlStored: Boolean;
    function GetVendorExtensionStored: Boolean;
  public
    destructor Destroy; override;

    property IsEmailStored: Boolean read GetEmailStored;
    property IsNameStored: Boolean read GetNameStored;
    property IsUrlStored: Boolean read GetUrlStored;
    property IsVendorExtensionStored: Boolean read GetVendorExtensionStored;
  published
    property email: System.String read FEmail write FEmail stored GetEmailStored;
    property name: System.String read FName write FName stored GetNameStored;
    property url: System.String read FUrl write FUrl stored GetUrlStored;
    property vendorExtension: TMap<System.String, vendorExtension> read GetVendorExtension write FVendorExtension stored GetVendorExtensionStored;
  end;

implementation

uses System.SysUtils;

{ TJSONSchema }

destructor TJSONSchema.Destroy;
begin
  for var AObject in FAnyOf do
    AObject.Free;

  for var AObject in FAllOf do
    AObject.Free;

  FProperties.Free;

  FNot.Free;

  FAdditionalItems.Free;

  FMinProperties.Free;

  FMinLength.Free;

  FPatternProperties.Free;

  for var AObject in FOneOf do
    AObject.Free;

  FDependencies.Free;

  FAdditionalProperties.Free;

  FDefinitions.Free;

  FItems.Free;

  FMinItems.Free;

  FType.Free;

  inherited;
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

procedure TJSONSchema.SetExclusiveMaximum(const Value: System.Boolean);
begin
  FExclusiveMaximum := Value;
  FExclusiveMaximumIsStored := True;
end;

function TJSONSchema.GetFormatStored: Boolean;
begin
  Result := not FFormat.IsEmpty;
end;

procedure TJSONSchema.SetExclusiveMinimum(const Value: System.Boolean);
begin
  FExclusiveMinimum := Value;
  FExclusiveMinimumIsStored := True;
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

function TJSONSchema.GetSchemaStored: Boolean;
begin
  Result := not FSchema.IsEmpty;
end;

function TJSONSchema.GetProperties: TMap<System.String, Blue.Print.Open.API.Schema.v20.TJSONSchema>;
begin
  if not Assigned(FProperties) then
    FProperties := TMap<System.String, Blue.Print.Open.API.Schema.v20.TJSONSchema>.Create;

  Result := FProperties;
end;

function TJSONSchema.GetPropertiesStored: Boolean;
begin
  Result := Assigned(FProperties);
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

function TJSONSchema.GetMaxLengthStored: Boolean;
begin
  Result := FMaxLength <> 0;
end;

function TJSONSchema.GetEnumStored: Boolean;
begin
  Result := Assigned(FEnum);
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

function TJSONSchema.GetIdStored: Boolean;
begin
  Result := not FId.IsEmpty;
end;

function TJSONSchema.GetPatternStored: Boolean;
begin
  Result := not FPattern.IsEmpty;
end;

function TJSONSchema.GetDefaultStored: Boolean;
begin
  Result := False;
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

function TJSONSchema.GetTitleStored: Boolean;
begin
  Result := not FTitle.IsEmpty;
end;

function TJSONSchema.GetMultipleOfStored: Boolean;
begin
  Result := FMultipleOf <> 0;
end;

function TJSONSchema.GetPatternProperties: TMap<System.String, Blue.Print.Open.API.Schema.v20.TJSONSchema>;
begin
  if not Assigned(FPatternProperties) then
    FPatternProperties := TMap<System.String, Blue.Print.Open.API.Schema.v20.TJSONSchema>.Create;

  Result := FPatternProperties;
end;

function TJSONSchema.GetPatternPropertiesStored: Boolean;
begin
  Result := Assigned(FPatternProperties);
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

function TJSONSchema.GetMinimumStored: Boolean;
begin
  Result := FMinimum <> 0;
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

function TJSONSchema.GetDefinitions: TMap<System.String, Blue.Print.Open.API.Schema.v20.TJSONSchema>;
begin
  if not Assigned(FDefinitions) then
    FDefinitions := TMap<System.String, Blue.Print.Open.API.Schema.v20.TJSONSchema>.Create;

  Result := FDefinitions;
end;

function TJSONSchema.GetDefinitionsStored: Boolean;
begin
  Result := Assigned(FDefinitions);
end;

function TJSONSchema.GetMaxPropertiesStored: Boolean;
begin
  Result := FMaxProperties <> 0;
end;

function TJSONSchema.GetMaxItemsStored: Boolean;
begin
  Result := FMaxItems <> 0;
end;

procedure TJSONSchema.SetUniqueItems(const Value: System.Boolean);
begin
  FUniqueItems := Value;
  FUniqueItemsIsStored := True;
end;

function TJSONSchema.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TJSONSchema.GetMaximumStored: Boolean;
begin
  Result := FMaximum <> 0;
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

function TJSONSchema.GetRequiredStored: Boolean;
begin
  Result := Assigned(FRequired);
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
  FExternalDocs.Free;

  for var AObject in FTags do
    AObject.Free;

  FConsumes.Free;

  FPaths.Free;

  FResponses.Free;

  FInfo.Free;

  for var AObject in FSecurity do
    AObject.Free;

  FParameters.Free;

  FDefinitions.Free;

  FProduces.Free;

  FSecurityDefinitions.Free;

  FVendorExtension.Free;

  inherited;
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

function TOpenAPIDefinition.AddTags: Blue.Print.Open.API.Schema.v20.Tag;
begin
  Result := Blue.Print.Open.API.Schema.v20.Tag.Create;

  FTags := FTags + [Result];
end;

function TOpenAPIDefinition.GetTagsStored: Boolean;
begin
  Result := Assigned(FTags);
end;

function TOpenAPIDefinition.GetBasePathStored: Boolean;
begin
  Result := not FBasePath.IsEmpty;
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

function TOpenAPIDefinition.GetPaths: Blue.Print.Open.API.Schema.v20.Paths;
begin
  if not Assigned(FPaths) then
    FPaths := Blue.Print.Open.API.Schema.v20.Paths.Create;

  Result := FPaths;
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

function TOpenAPIDefinition.GetInfo: Blue.Print.Open.API.Schema.v20.Info;
begin
  if not Assigned(FInfo) then
    FInfo := Blue.Print.Open.API.Schema.v20.Info.Create;

  Result := FInfo;
end;

function TOpenAPIDefinition.GetSchemesStored: Boolean;
begin
  Result := Assigned(FSchemes);
end;

function TOpenAPIDefinition.GetSecurityStored: Boolean;
begin
  Result := Assigned(FSecurity);
end;

function TOpenAPIDefinition.GetParameters: TMap<System.String, Blue.Print.Open.API.Schema.v20.Parameter>;
begin
  if not Assigned(FParameters) then
    FParameters := TMap<System.String, Blue.Print.Open.API.Schema.v20.Parameter>.Create;

  Result := FParameters;
end;

function TOpenAPIDefinition.GetParametersStored: Boolean;
begin
  Result := Assigned(FParameters);
end;

function TOpenAPIDefinition.GetDefinitions: TMap<System.String, Blue.Print.Open.API.Schema.v20.Schema>;
begin
  if not Assigned(FDefinitions) then
    FDefinitions := TMap<System.String, Blue.Print.Open.API.Schema.v20.Schema>.Create;

  Result := FDefinitions;
end;

function TOpenAPIDefinition.GetDefinitionsStored: Boolean;
begin
  Result := Assigned(FDefinitions);
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

function TOpenAPIDefinition.GetHostStored: Boolean;
begin
  Result := not FHost.IsEmpty;
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

function TOpenAPIDefinition.GetVendorExtension: TMap<System.String, vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TMap<System.String, System.Rtti.TValue>.Create;

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

{ Operation }

destructor Operation.Destroy;
begin
  FConsumes.Free;

  FResponses.Free;

  for var AObject in FSecurity do
    AObject.Free;

  for var AObject in FParameters do
    AObject.Free;

  FExternalDocs.Free;

  FProduces.Free;

  FVendorExtension.Free;

  inherited;
end;

function Operation.GetTagsStored: Boolean;
begin
  Result := Assigned(FTags);
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

function Operation.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function Operation.GetResponses: Blue.Print.Open.API.Schema.v20.Responses;
begin
  if not Assigned(FResponses) then
    FResponses := Blue.Print.Open.API.Schema.v20.Responses.Create;

  Result := FResponses;
end;

function Operation.GetSummaryStored: Boolean;
begin
  Result := not FSummary.IsEmpty;
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

function Operation.GetOperationIdStored: Boolean;
begin
  Result := not FOperationId.IsEmpty;
end;

function Operation.GetSecurityStored: Boolean;
begin
  Result := Assigned(FSecurity);
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

function Operation.GetVendorExtension: TMap<System.String, vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TMap<System.String, System.Rtti.TValue>.Create;

  Result := FVendorExtension;
end;

function Operation.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ Operation.TConsumes }

function Operation.TConsumes.GetMediaTypeListStored: Boolean;
begin
  Result := Assigned(FMediaTypeList);
end;

{ Operation.TProduces }

function Operation.TProduces.GetMediaTypeListStored: Boolean;
begin
  Result := Assigned(FMediaTypeList);
end;

{ Responses }

destructor Responses.Destroy;
begin
  FResponseValue.Free;

  FVendorExtension.Free;

  inherited;
end;

function Responses.GetResponseValue: TMap<System.String, Blue.Print.Open.API.Schema.v20.ResponseValue>;
begin
  if not Assigned(FResponseValue) then
    FResponseValue := TMap<System.String, Blue.Print.Open.API.Schema.v20.ResponseValue>.Create;

  Result := FResponseValue;
end;

function Responses.GetResponseValueStored: Boolean;
begin
  Result := Assigned(FResponseValue);
end;

function Responses.GetVendorExtension: TMap<System.String, vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TMap<System.String, System.Rtti.TValue>.Create;

  Result := FVendorExtension;
end;

function Responses.GetVendorExtensionStored: Boolean;
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

function FormDataParameterSubSchema.GetNameStored: Boolean;
begin
  Result := not FName.IsEmpty;
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

function FormDataParameterSubSchema.GetFormatStored: Boolean;
begin
  Result := not FFormat.IsEmpty;
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

function FormDataParameterSubSchema.GetEnumStored: Boolean;
begin
  Result := Assigned(FEnum);
end;

function FormDataParameterSubSchema.GetMaxItemsStored: Boolean;
begin
  Result := FMaxItems <> 0;
end;

function FormDataParameterSubSchema.GetCollectionFormatStored: Boolean;
begin
  Result := not FCollectionFormat.IsEmpty;
end;

procedure FormDataParameterSubSchema.SetUniqueItems(const Value: uniqueItems);
begin
  FUniqueItems := Value;
  FUniqueItemsIsStored := True;
end;

procedure FormDataParameterSubSchema.SetAllowEmptyValue(const Value: System.Boolean);
begin
  FAllowEmptyValue := Value;
  FAllowEmptyValueIsStored := True;
end;

function FormDataParameterSubSchema.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function FormDataParameterSubSchema.GetMaximumStored: Boolean;
begin
  Result := FMaximum <> 0;
end;

function FormDataParameterSubSchema.GetDefaultStored: Boolean;
begin
  Result := False;
end;

function FormDataParameterSubSchema.GetPatternStored: Boolean;
begin
  Result := not FPattern.IsEmpty;
end;

function FormDataParameterSubSchema.GetInStored: Boolean;
begin
  Result := not FIn.IsEmpty;
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

procedure FormDataParameterSubSchema.SetRequired(const Value: System.Boolean);
begin
  FRequired := Value;
  FRequiredIsStored := True;
end;

function FormDataParameterSubSchema.GetTypeStored: Boolean;
begin
  Result := not FType.IsEmpty;
end;

function FormDataParameterSubSchema.GetMultipleOfStored: Boolean;
begin
  Result := FMultipleOf <> 0;
end;

function FormDataParameterSubSchema.GetVendorExtension: TMap<System.String, vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TMap<System.String, System.Rtti.TValue>.Create;

  Result := FVendorExtension;
end;

function FormDataParameterSubSchema.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ Info }

destructor Info.Destroy;
begin
  FLicense.Free;

  FContact.Free;

  FVendorExtension.Free;

  inherited;
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

function Info.GetVendorExtension: TMap<System.String, vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TMap<System.String, System.Rtti.TValue>.Create;

  Result := FVendorExtension;
end;

function Info.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
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

function FileSchema.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function FileSchema.GetDefaultStored: Boolean;
begin
  Result := False;
end;

procedure FileSchema.SetReadOnly(const Value: System.Boolean);
begin
  FReadOnly := Value;
  FReadOnlyIsStored := True;
end;

function FileSchema.GetTitleStored: Boolean;
begin
  Result := not FTitle.IsEmpty;
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

function FileSchema.GetRequiredStored: Boolean;
begin
  Result := Assigned(FRequired);
end;

function FileSchema.GetExampleStored: Boolean;
begin
  Result := False;
end;

function FileSchema.GetVendorExtension: TMap<System.String, vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TMap<System.String, System.Rtti.TValue>.Create;

  Result := FVendorExtension;
end;

function FileSchema.GetVendorExtensionStored: Boolean;
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

{ Oauth2PasswordSecurity }

destructor Oauth2PasswordSecurity.Destroy;
begin
  FScopes.Free;

  FVendorExtension.Free;

  inherited;
end;

function Oauth2PasswordSecurity.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function Oauth2PasswordSecurity.GetScopes: TMap<System.String, System.String>;
begin
  if not Assigned(FScopes) then
    FScopes := TMap<System.String, System.String>.Create;

  Result := FScopes;
end;

function Oauth2PasswordSecurity.GetScopesStored: Boolean;
begin
  Result := Assigned(FScopes);
end;

function Oauth2PasswordSecurity.GetVendorExtension: TMap<System.String, vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TMap<System.String, System.Rtti.TValue>.Create;

  Result := FVendorExtension;
end;

function Oauth2PasswordSecurity.GetVendorExtensionStored: Boolean;
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

function Oauth2AccessCodeSecurity.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function Oauth2AccessCodeSecurity.GetScopes: TMap<System.String, System.String>;
begin
  if not Assigned(FScopes) then
    FScopes := TMap<System.String, System.String>.Create;

  Result := FScopes;
end;

function Oauth2AccessCodeSecurity.GetScopesStored: Boolean;
begin
  Result := Assigned(FScopes);
end;

function Oauth2AccessCodeSecurity.GetVendorExtension: TMap<System.String, vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TMap<System.String, System.Rtti.TValue>.Create;

  Result := FVendorExtension;
end;

function Oauth2AccessCodeSecurity.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
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

function BasicAuthenticationSecurity.GetVendorExtension: TMap<System.String, vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TMap<System.String, System.Rtti.TValue>.Create;

  Result := FVendorExtension;
end;

function BasicAuthenticationSecurity.GetVendorExtensionStored: Boolean;
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

function License.GetVendorExtension: TMap<System.String, vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TMap<System.String, System.Rtti.TValue>.Create;

  Result := FVendorExtension;
end;

function License.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ Paths }

destructor Paths.Destroy;
begin
  FPathItem.Free;

  FVendorExtension.Free;

  inherited;
end;

function Paths.GetPathItem: TMap<System.String, Blue.Print.Open.API.Schema.v20.PathItem>;
begin
  if not Assigned(FPathItem) then
    FPathItem := TMap<System.String, Blue.Print.Open.API.Schema.v20.PathItem>.Create;

  Result := FPathItem;
end;

function Paths.GetPathItemStored: Boolean;
begin
  Result := Assigned(FPathItem);
end;

function Paths.GetVendorExtension: TMap<System.String, vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TMap<System.String, System.Rtti.TValue>.Create;

  Result := FVendorExtension;
end;

function Paths.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
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

function ApiKeySecurity.GetVendorExtension: TMap<System.String, vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TMap<System.String, System.Rtti.TValue>.Create;

  Result := FVendorExtension;
end;

function ApiKeySecurity.GetVendorExtensionStored: Boolean;
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

function HeaderParameterSubSchema.GetNameStored: Boolean;
begin
  Result := not FName.IsEmpty;
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

function HeaderParameterSubSchema.GetFormatStored: Boolean;
begin
  Result := not FFormat.IsEmpty;
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

function HeaderParameterSubSchema.GetEnumStored: Boolean;
begin
  Result := Assigned(FEnum);
end;

function HeaderParameterSubSchema.GetMaxItemsStored: Boolean;
begin
  Result := FMaxItems <> 0;
end;

function HeaderParameterSubSchema.GetCollectionFormatStored: Boolean;
begin
  Result := not FCollectionFormat.IsEmpty;
end;

procedure HeaderParameterSubSchema.SetUniqueItems(const Value: uniqueItems);
begin
  FUniqueItems := Value;
  FUniqueItemsIsStored := True;
end;

function HeaderParameterSubSchema.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function HeaderParameterSubSchema.GetMaximumStored: Boolean;
begin
  Result := FMaximum <> 0;
end;

function HeaderParameterSubSchema.GetDefaultStored: Boolean;
begin
  Result := False;
end;

function HeaderParameterSubSchema.GetPatternStored: Boolean;
begin
  Result := not FPattern.IsEmpty;
end;

function HeaderParameterSubSchema.GetInStored: Boolean;
begin
  Result := not FIn.IsEmpty;
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

procedure HeaderParameterSubSchema.SetRequired(const Value: System.Boolean);
begin
  FRequired := Value;
  FRequiredIsStored := True;
end;

function HeaderParameterSubSchema.GetTypeStored: Boolean;
begin
  Result := not FType.IsEmpty;
end;

function HeaderParameterSubSchema.GetMultipleOfStored: Boolean;
begin
  Result := FMultipleOf <> 0;
end;

function HeaderParameterSubSchema.GetVendorExtension: TMap<System.String, vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TMap<System.String, System.Rtti.TValue>.Create;

  Result := FVendorExtension;
end;

function HeaderParameterSubSchema.GetVendorExtensionStored: Boolean;
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

procedure PrimitivesItems.SetExclusiveMaximum(const Value: exclusiveMaximum);
begin
  FExclusiveMaximum := Value;
  FExclusiveMaximumIsStored := True;
end;

function PrimitivesItems.GetMinimumStored: Boolean;
begin
  Result := FMinimum <> 0;
end;

function PrimitivesItems.GetFormatStored: Boolean;
begin
  Result := not FFormat.IsEmpty;
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

function PrimitivesItems.GetEnumStored: Boolean;
begin
  Result := Assigned(FEnum);
end;

function PrimitivesItems.GetMaxItemsStored: Boolean;
begin
  Result := FMaxItems <> 0;
end;

function PrimitivesItems.GetCollectionFormatStored: Boolean;
begin
  Result := not FCollectionFormat.IsEmpty;
end;

procedure PrimitivesItems.SetUniqueItems(const Value: uniqueItems);
begin
  FUniqueItems := Value;
  FUniqueItemsIsStored := True;
end;

function PrimitivesItems.GetMaximumStored: Boolean;
begin
  Result := FMaximum <> 0;
end;

function PrimitivesItems.GetDefaultStored: Boolean;
begin
  Result := False;
end;

function PrimitivesItems.GetPatternStored: Boolean;
begin
  Result := not FPattern.IsEmpty;
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

function PrimitivesItems.GetMultipleOfStored: Boolean;
begin
  Result := FMultipleOf <> 0;
end;

function PrimitivesItems.GetTypeStored: Boolean;
begin
  Result := not FType.IsEmpty;
end;

function PrimitivesItems.GetVendorExtension: TMap<System.String, vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TMap<System.String, System.Rtti.TValue>.Create;

  Result := FVendorExtension;
end;

function PrimitivesItems.GetVendorExtensionStored: Boolean;
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

function QueryParameterSubSchema.GetNameStored: Boolean;
begin
  Result := not FName.IsEmpty;
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

function QueryParameterSubSchema.GetFormatStored: Boolean;
begin
  Result := not FFormat.IsEmpty;
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

function QueryParameterSubSchema.GetEnumStored: Boolean;
begin
  Result := Assigned(FEnum);
end;

function QueryParameterSubSchema.GetMaxItemsStored: Boolean;
begin
  Result := FMaxItems <> 0;
end;

function QueryParameterSubSchema.GetCollectionFormatStored: Boolean;
begin
  Result := not FCollectionFormat.IsEmpty;
end;

procedure QueryParameterSubSchema.SetUniqueItems(const Value: uniqueItems);
begin
  FUniqueItems := Value;
  FUniqueItemsIsStored := True;
end;

procedure QueryParameterSubSchema.SetAllowEmptyValue(const Value: System.Boolean);
begin
  FAllowEmptyValue := Value;
  FAllowEmptyValueIsStored := True;
end;

function QueryParameterSubSchema.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function QueryParameterSubSchema.GetMaximumStored: Boolean;
begin
  Result := FMaximum <> 0;
end;

function QueryParameterSubSchema.GetDefaultStored: Boolean;
begin
  Result := False;
end;

function QueryParameterSubSchema.GetPatternStored: Boolean;
begin
  Result := not FPattern.IsEmpty;
end;

function QueryParameterSubSchema.GetInStored: Boolean;
begin
  Result := not FIn.IsEmpty;
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

procedure QueryParameterSubSchema.SetRequired(const Value: System.Boolean);
begin
  FRequired := Value;
  FRequiredIsStored := True;
end;

function QueryParameterSubSchema.GetTypeStored: Boolean;
begin
  Result := not FType.IsEmpty;
end;

function QueryParameterSubSchema.GetMultipleOfStored: Boolean;
begin
  Result := FMultipleOf <> 0;
end;

function QueryParameterSubSchema.GetVendorExtension: TMap<System.String, vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TMap<System.String, System.Rtti.TValue>.Create;

  Result := FVendorExtension;
end;

function QueryParameterSubSchema.GetVendorExtensionStored: Boolean;
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

function Oauth2ApplicationSecurity.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function Oauth2ApplicationSecurity.GetScopes: TMap<System.String, System.String>;
begin
  if not Assigned(FScopes) then
    FScopes := TMap<System.String, System.String>.Create;

  Result := FScopes;
end;

function Oauth2ApplicationSecurity.GetScopesStored: Boolean;
begin
  Result := Assigned(FScopes);
end;

function Oauth2ApplicationSecurity.GetVendorExtension: TMap<System.String, vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TMap<System.String, System.Rtti.TValue>.Create;

  Result := FVendorExtension;
end;

function Oauth2ApplicationSecurity.GetVendorExtensionStored: Boolean;
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

function BodyParameter.GetVendorExtension: TMap<System.String, vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TMap<System.String, System.Rtti.TValue>.Create;

  Result := FVendorExtension;
end;

function BodyParameter.GetVendorExtensionStored: Boolean;
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

{ Oauth2ImplicitSecurity }

destructor Oauth2ImplicitSecurity.Destroy;
begin
  FScopes.Free;

  FVendorExtension.Free;

  inherited;
end;

function Oauth2ImplicitSecurity.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function Oauth2ImplicitSecurity.GetScopes: TMap<System.String, System.String>;
begin
  if not Assigned(FScopes) then
    FScopes := TMap<System.String, System.String>.Create;

  Result := FScopes;
end;

function Oauth2ImplicitSecurity.GetScopesStored: Boolean;
begin
  Result := Assigned(FScopes);
end;

function Oauth2ImplicitSecurity.GetVendorExtension: TMap<System.String, vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TMap<System.String, System.Rtti.TValue>.Create;

  Result := FVendorExtension;
end;

function Oauth2ImplicitSecurity.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
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

procedure Header.SetExclusiveMaximum(const Value: exclusiveMaximum);
begin
  FExclusiveMaximum := Value;
  FExclusiveMaximumIsStored := True;
end;

function Header.GetMinimumStored: Boolean;
begin
  Result := FMinimum <> 0;
end;

function Header.GetFormatStored: Boolean;
begin
  Result := not FFormat.IsEmpty;
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

function Header.GetEnumStored: Boolean;
begin
  Result := Assigned(FEnum);
end;

function Header.GetMaxItemsStored: Boolean;
begin
  Result := FMaxItems <> 0;
end;

function Header.GetCollectionFormatStored: Boolean;
begin
  Result := not FCollectionFormat.IsEmpty;
end;

procedure Header.SetUniqueItems(const Value: uniqueItems);
begin
  FUniqueItems := Value;
  FUniqueItemsIsStored := True;
end;

function Header.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function Header.GetMaximumStored: Boolean;
begin
  Result := FMaximum <> 0;
end;

function Header.GetDefaultStored: Boolean;
begin
  Result := False;
end;

function Header.GetPatternStored: Boolean;
begin
  Result := not FPattern.IsEmpty;
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

function Header.GetMultipleOfStored: Boolean;
begin
  Result := FMultipleOf <> 0;
end;

function Header.GetVendorExtension: TMap<System.String, vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TMap<System.String, System.Rtti.TValue>.Create;

  Result := FVendorExtension;
end;

function Header.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ Xml }

destructor Xml.Destroy;
begin
  FVendorExtension.Free;

  inherited;
end;

procedure Xml.SetAttribute(const Value: System.Boolean);
begin
  FAttribute := Value;
  FAttributeIsStored := True;
end;

function Xml.GetNameStored: Boolean;
begin
  Result := not FName.IsEmpty;
end;

function Xml.GetPrefixStored: Boolean;
begin
  Result := not FPrefix.IsEmpty;
end;

procedure Xml.SetWrapped(const Value: System.Boolean);
begin
  FWrapped := Value;
  FWrappedIsStored := True;
end;

function Xml.GetNamespaceStored: Boolean;
begin
  Result := not FNamespace.IsEmpty;
end;

function Xml.GetVendorExtension: TMap<System.String, vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TMap<System.String, System.Rtti.TValue>.Create;

  Result := FVendorExtension;
end;

function Xml.GetVendorExtensionStored: Boolean;
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

{ PathParameterSubSchema }

destructor PathParameterSubSchema.Destroy;
begin
  FItems.Free;

  FMinLength.Free;

  FMinItems.Free;

  FVendorExtension.Free;

  inherited;
end;

function PathParameterSubSchema.GetNameStored: Boolean;
begin
  Result := not FName.IsEmpty;
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

function PathParameterSubSchema.GetFormatStored: Boolean;
begin
  Result := not FFormat.IsEmpty;
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

function PathParameterSubSchema.GetEnumStored: Boolean;
begin
  Result := Assigned(FEnum);
end;

function PathParameterSubSchema.GetMaxItemsStored: Boolean;
begin
  Result := FMaxItems <> 0;
end;

function PathParameterSubSchema.GetCollectionFormatStored: Boolean;
begin
  Result := not FCollectionFormat.IsEmpty;
end;

procedure PathParameterSubSchema.SetUniqueItems(const Value: uniqueItems);
begin
  FUniqueItems := Value;
  FUniqueItemsIsStored := True;
end;

function PathParameterSubSchema.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function PathParameterSubSchema.GetMaximumStored: Boolean;
begin
  Result := FMaximum <> 0;
end;

function PathParameterSubSchema.GetDefaultStored: Boolean;
begin
  Result := False;
end;

function PathParameterSubSchema.GetPatternStored: Boolean;
begin
  Result := not FPattern.IsEmpty;
end;

function PathParameterSubSchema.GetInStored: Boolean;
begin
  Result := not FIn.IsEmpty;
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

function PathParameterSubSchema.GetTypeStored: Boolean;
begin
  Result := not FType.IsEmpty;
end;

function PathParameterSubSchema.GetMultipleOfStored: Boolean;
begin
  Result := FMultipleOf <> 0;
end;

function PathParameterSubSchema.GetVendorExtension: TMap<System.String, vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TMap<System.String, System.Rtti.TValue>.Create;

  Result := FVendorExtension;
end;

function PathParameterSubSchema.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ PathItem }

destructor PathItem.Destroy;
begin
  FPatch.Free;

  FDelete.Free;

  FHead.Free;

  FGet.Free;

  FPost.Free;

  FOptions.Free;

  for var AObject in FParameters do
    AObject.Free;

  FPut.Free;

  FVendorExtension.Free;

  inherited;
end;

function PathItem.GetRefStored: Boolean;
begin
  Result := not FRef.IsEmpty;
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

function PathItem.AddParameters: Blue.Print.Open.API.Schema.v20.ParametersListArrayItem;
begin
  Result := Blue.Print.Open.API.Schema.v20.ParametersListArrayItem.Create;

  FParameters := FParameters + [Result];
end;

function PathItem.GetParametersStored: Boolean;
begin
  Result := Assigned(FParameters);
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

function PathItem.GetVendorExtension: TMap<System.String, vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TMap<System.String, System.Rtti.TValue>.Create;

  Result := FVendorExtension;
end;

function PathItem.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ Schema }

destructor Schema.Destroy;
begin
  FAdditionalProperties.Free;

  for var AObject in FAllOf do
    AObject.Free;

  FProperties.Free;

  FXml.Free;

  FMinProperties.Free;

  FMinLength.Free;

  FItems.Free;

  FMinItems.Free;

  FExternalDocs.Free;

  FType.Free;

  FVendorExtension.Free;

  inherited;
end;

function Schema.GetExampleStored: Boolean;
begin
  Result := False;
end;

procedure Schema.SetExclusiveMaximum(const Value: exclusiveMaximum);
begin
  FExclusiveMaximum := Value;
  FExclusiveMaximumIsStored := True;
end;

function Schema.GetMinimumStored: Boolean;
begin
  Result := FMinimum <> 0;
end;

function Schema.GetFormatStored: Boolean;
begin
  Result := not FFormat.IsEmpty;
end;

procedure Schema.SetExclusiveMinimum(const Value: exclusiveMinimum);
begin
  FExclusiveMinimum := Value;
  FExclusiveMinimumIsStored := True;
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

function Schema.AddAllOf: Blue.Print.Open.API.Schema.v20.Schema;
begin
  Result := Blue.Print.Open.API.Schema.v20.Schema.Create;

  FAllOf := FAllOf + [Result];
end;

function Schema.GetAllOfStored: Boolean;
begin
  Result := Assigned(FAllOf);
end;

function Schema.GetProperties: TMap<System.String, Blue.Print.Open.API.Schema.v20.Schema>;
begin
  if not Assigned(FProperties) then
    FProperties := TMap<System.String, Blue.Print.Open.API.Schema.v20.Schema>.Create;

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

function Schema.GetMaxLengthStored: Boolean;
begin
  Result := FMaxLength <> 0;
end;

function Schema.GetEnumStored: Boolean;
begin
  Result := Assigned(FEnum);
end;

function Schema.GetRefStored: Boolean;
begin
  Result := not FRef.IsEmpty;
end;

function Schema.GetMaxPropertiesStored: Boolean;
begin
  Result := FMaxProperties <> 0;
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

function Schema.GetMaxItemsStored: Boolean;
begin
  Result := FMaxItems <> 0;
end;

procedure Schema.SetUniqueItems(const Value: uniqueItems);
begin
  FUniqueItems := Value;
  FUniqueItemsIsStored := True;
end;

function Schema.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function Schema.GetMaximumStored: Boolean;
begin
  Result := FMaximum <> 0;
end;

function Schema.GetDefaultStored: Boolean;
begin
  Result := False;
end;

function Schema.GetPatternStored: Boolean;
begin
  Result := not FPattern.IsEmpty;
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

function Schema.GetTitleStored: Boolean;
begin
  Result := not FTitle.IsEmpty;
end;

procedure Schema.SetReadOnly(const Value: System.Boolean);
begin
  FReadOnly := Value;
  FReadOnlyIsStored := True;
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

function Schema.GetMultipleOfStored: Boolean;
begin
  Result := FMultipleOf <> 0;
end;

function Schema.GetRequiredStored: Boolean;
begin
  Result := Assigned(FRequired);
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

function Schema.GetVendorExtension: TMap<System.String, vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TMap<System.String, System.Rtti.TValue>.Create;

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

{ Response }

destructor Response.Destroy;
begin
  FHeaders.Free;

  FSchema.Free;

  FExamples.Free;

  FVendorExtension.Free;

  inherited;
end;

function Response.GetHeaders: TMap<System.String, Blue.Print.Open.API.Schema.v20.Header>;
begin
  if not Assigned(FHeaders) then
    FHeaders := TMap<System.String, Blue.Print.Open.API.Schema.v20.Header>.Create;

  Result := FHeaders;
end;

function Response.GetHeadersStored: Boolean;
begin
  Result := Assigned(FHeaders);
end;

function Response.GetSchema: Blue.Print.Open.API.Schema.v20.Schema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v20.Schema.Create;

  Result := FSchema;
end;

function Response.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function Response.GetExamples: TMap<System.String, any>;
begin
  if not Assigned(FExamples) then
    FExamples := TMap<System.String, System.Rtti.TValue>.Create;

  Result := FExamples;
end;

function Response.GetExamplesStored: Boolean;
begin
  Result := Assigned(FExamples);
end;

function Response.GetVendorExtension: TMap<System.String, vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TMap<System.String, System.Rtti.TValue>.Create;

  Result := FVendorExtension;
end;

function Response.GetVendorExtensionStored: Boolean;
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

function Tag.GetVendorExtension: TMap<System.String, vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TMap<System.String, System.Rtti.TValue>.Create;

  Result := FVendorExtension;
end;

function Tag.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
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

function ExternalDocs.GetVendorExtension: TMap<System.String, vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TMap<System.String, System.Rtti.TValue>.Create;

  Result := FVendorExtension;
end;

function ExternalDocs.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

{ Contact }

destructor Contact.Destroy;
begin
  FVendorExtension.Free;

  inherited;
end;

function Contact.GetEmailStored: Boolean;
begin
  Result := not FEmail.IsEmpty;
end;

function Contact.GetNameStored: Boolean;
begin
  Result := not FName.IsEmpty;
end;

function Contact.GetUrlStored: Boolean;
begin
  Result := not FUrl.IsEmpty;
end;

function Contact.GetVendorExtension: TMap<System.String, vendorExtension>;
begin
  if not Assigned(FVendorExtension) then
    FVendorExtension := TMap<System.String, System.Rtti.TValue>.Create;

  Result := FVendorExtension;
end;

function Contact.GetVendorExtensionStored: Boolean;
begin
  Result := Assigned(FVendorExtension);
end;

end.
