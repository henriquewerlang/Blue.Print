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
  TSchema = class;
  PositiveIntegerDefault0 = class;
  AdditionalItems = class;
  DependenciesProperties = class;
  AdditionalProperties = class;
  Items = class;
  &Type = class;
  TSchemaOpenAPI20 = class;
  Parameter = class;
  SecurityDefinitionsProperties = class;
  ParametersList = class;
  ResponseValue = class;
  Consumes = class;
  Produces = class;

  // Forward type alias
  schemaArray = TArray<Blue.Print.Open.API.Schema.v20.TSchema>;
  positiveInteger = System.Integer;
  stringArray = TArray<System.String>;
  any = System.Rtti.TValue;
  jsonReference = TMap<System.String, System.Rtti.TValue>;
  responseDefinitions = TMap<System.String, TMap<System.String, System.Rtti.TValue>>;
  securityRequirement = TMap<System.String, TArray<System.String>>;
  operation = TMap<System.String, System.Rtti.TValue>;
  responses = TMap<System.String, System.Rtti.TValue>;
  formDataParameterSubSchema = System.Rtti.TValue;
  oauth2Scopes = TMap<System.String, System.String>;
  info = TMap<System.String, System.Rtti.TValue>;
  fileSchema = TMap<System.String, System.Rtti.TValue>;
  maxLength = System.Integer;
  enum = TArray<System.Rtti.TValue>;
  nonBodyParameter = TMap<System.String, System.Rtti.TValue>;
  collectionFormat = System.String;
  mediaTypeList = TArray<System.String>;
  pattern = System.String;
  default = System.Rtti.TValue;
  title = System.String;
  oauth2PasswordSecurity = TMap<System.String, System.Rtti.TValue>;
  schemesList = TArray<System.String>;
  collectionFormatWithMulti = System.String;
  multipleOf = System.Double;
  oauth2AccessCodeSecurity = TMap<System.String, System.Rtti.TValue>;
  basicAuthenticationSecurity = TMap<System.String, System.Rtti.TValue>;
  minimum = System.Double;
  license = TMap<System.String, System.Rtti.TValue>;
  paths = TMap<System.String, System.Rtti.TValue>;
  apiKeySecurity = TMap<System.String, System.Rtti.TValue>;
  headerParameterSubSchema = System.Rtti.TValue;
  mimeType = System.String;
  primitivesItems = TMap<System.String, System.Rtti.TValue>;
  queryParameterSubSchema = System.Rtti.TValue;
  security = TArray<TMap<System.String, TArray<System.String>>>;
  oauth2ApplicationSecurity = TMap<System.String, System.Rtti.TValue>;
  vendorExtension = System.Rtti.TValue;
  definitions = TMap<System.String, TMap<System.String, System.Rtti.TValue>>;
  bodyParameter = TMap<System.String, System.Rtti.TValue>;
  securityDefinitions = TMap<System.String, Blue.Print.Open.API.Schema.v20.SecurityDefinitionsProperties>;
  parametersList = TArray<Blue.Print.Open.API.Schema.v20.ParametersList>;
  oauth2ImplicitSecurity = TMap<System.String, System.Rtti.TValue>;
  header = TMap<System.String, System.Rtti.TValue>;
  xml = TMap<System.String, System.Rtti.TValue>;
  maxItems = System.Integer;
  parameterDefinitions = TMap<System.String, Blue.Print.Open.API.Schema.v20.Parameter>;
  description = System.String;
  pathParameterSubSchema = System.Rtti.TValue;
  pathItem = TMap<System.String, System.Rtti.TValue>;
  schema = TMap<System.String, System.Rtti.TValue>;
  maximum = System.Double;
  response = TMap<System.String, System.Rtti.TValue>;
  tag = TMap<System.String, System.Rtti.TValue>;
  headers = TMap<System.String, TMap<System.String, System.Rtti.TValue>>;
  externalDocs = TMap<System.String, System.Rtti.TValue>;
  contact = TMap<System.String, System.Rtti.TValue>;
  examples = TMap<System.String, System.Rtti.TValue>;

  TSchema = class
  private
    FAnyOf: schemaArray;
    FExclusiveMaximum: System.Boolean;
    FFormat: System.String;
    FExclusiveMinimum: System.Boolean;
    FAllOf: schemaArray;
    FSchema: System.String;
    FProperties: TMap<System.String, Blue.Print.Open.API.Schema.v20.TSchema>;
    FNot: Blue.Print.Open.API.Schema.v20.TSchema;
    FMaxLength: positiveInteger;
    FEnum: TArray<any>;
    FAdditionalItems: Blue.Print.Open.API.Schema.v20.AdditionalItems;
    FId: System.String;
    FPattern: System.String;
    FDefault: any;
    FMinProperties: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    FMinLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    FTitle: System.String;
    FMultipleOf: System.Double;
    FPatternProperties: TMap<System.String, Blue.Print.Open.API.Schema.v20.TSchema>;
    FOneOf: schemaArray;
    FMinimum: System.Double;
    FDependencies: TMap<System.String, Blue.Print.Open.API.Schema.v20.DependenciesProperties>;
    FAdditionalProperties: Blue.Print.Open.API.Schema.v20.AdditionalProperties;
    FDefinitions: TMap<System.String, Blue.Print.Open.API.Schema.v20.TSchema>;
    FMaxProperties: positiveInteger;
    FMaxItems: positiveInteger;
    FUniqueItems: System.Boolean;
    FDescription: System.String;
    FMaximum: System.Double;
    FItems: Blue.Print.Open.API.Schema.v20.Items;
    FMinItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    FRequired: stringArray;
    FType: Blue.Print.Open.API.Schema.v20.&Type;
    FExclusiveMaximumIsStored: Boolean;
    FExclusiveMinimumIsStored: Boolean;
    FUniqueItemsIsStored: Boolean;

    function GetProperties: TMap<System.String, Blue.Print.Open.API.Schema.v20.TSchema>;
    function GetNot: Blue.Print.Open.API.Schema.v20.TSchema;
    function GetAdditionalItems: Blue.Print.Open.API.Schema.v20.AdditionalItems;
    function GetMinProperties: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    function GetMinLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    function GetPatternProperties: TMap<System.String, Blue.Print.Open.API.Schema.v20.TSchema>;
    function GetDependencies: TMap<System.String, Blue.Print.Open.API.Schema.v20.DependenciesProperties>;
    function GetAdditionalProperties: Blue.Print.Open.API.Schema.v20.AdditionalProperties;
    function GetDefinitions: TMap<System.String, Blue.Print.Open.API.Schema.v20.TSchema>;
    function GetItems: Blue.Print.Open.API.Schema.v20.Items;
    function GetMinItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    function GetType: Blue.Print.Open.API.Schema.v20.&Type;
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

    function AddAnyOf: Blue.Print.Open.API.Schema.v20.TSchema;
    function AddAllOf: Blue.Print.Open.API.Schema.v20.TSchema;
    function AddOneOf: Blue.Print.Open.API.Schema.v20.TSchema;

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
    property properties: TMap<System.String, Blue.Print.Open.API.Schema.v20.TSchema> read GetProperties write FProperties stored GetPropertiesStored;
    [FieldName('not')]
    property &not: Blue.Print.Open.API.Schema.v20.TSchema read GetNot write FNot stored GetNotStored;
    property maxLength: positiveInteger read FMaxLength write FMaxLength stored GetMaxLengthStored;
    property enum: TArray<any> read FEnum write FEnum stored GetEnumStored;
    property additionalItems: Blue.Print.Open.API.Schema.v20.AdditionalItems read GetAdditionalItems write FAdditionalItems stored GetAdditionalItemsStored;
    property id: System.String read FId write FId stored GetIdStored;
    property pattern: System.String read FPattern write FPattern stored GetPatternStored;
    property default: any read FDefault write FDefault stored GetDefaultStored;
    property minProperties: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0 read GetMinProperties write FMinProperties stored GetMinPropertiesStored;
    property minLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0 read GetMinLength write FMinLength stored GetMinLengthStored;
    property title: System.String read FTitle write FTitle stored GetTitleStored;
    property multipleOf: System.Double read FMultipleOf write FMultipleOf stored GetMultipleOfStored;
    property patternProperties: TMap<System.String, Blue.Print.Open.API.Schema.v20.TSchema> read GetPatternProperties write FPatternProperties stored GetPatternPropertiesStored;
    property oneOf: schemaArray read FOneOf write FOneOf stored GetOneOfStored;
    property minimum: System.Double read FMinimum write FMinimum stored GetMinimumStored;
    property dependencies: TMap<System.String, Blue.Print.Open.API.Schema.v20.DependenciesProperties> read GetDependencies write FDependencies stored GetDependenciesStored;
    property additionalProperties: Blue.Print.Open.API.Schema.v20.AdditionalProperties read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
    property definitions: TMap<System.String, Blue.Print.Open.API.Schema.v20.TSchema> read GetDefinitions write FDefinitions stored GetDefinitionsStored;
    property maxProperties: positiveInteger read FMaxProperties write FMaxProperties stored GetMaxPropertiesStored;
    property maxItems: positiveInteger read FMaxItems write FMaxItems stored GetMaxItemsStored;
    property uniqueItems: System.Boolean read FUniqueItems write SetUniqueItems stored FUniqueItemsIsStored;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property maximum: System.Double read FMaximum write FMaximum stored GetMaximumStored;
    property items: Blue.Print.Open.API.Schema.v20.Items read GetItems write FItems stored GetItemsStored;
    property minItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0 read GetMinItems write FMinItems stored GetMinItemsStored;
    property required: stringArray read FRequired write FRequired stored GetRequiredStored;
    [FieldName('type')]
    property &type: Blue.Print.Open.API.Schema.v20.&Type read GetType write FType stored GetTypeStored;
  end;

  [SingleObject]
  PositiveIntegerDefault0 = class
  private
    FPositiveInteger: System.Integer;

    function GetPositiveIntegerStored: Boolean;
  public
    property IsPositiveIntegerStored: Boolean read GetPositiveIntegerStored;
  published
    property positiveInteger: System.Integer read FPositiveInteger write FPositiveInteger stored GetPositiveIntegerStored;
  end;

  [SingleObject]
  AdditionalItems = class
  private
    FBoolean: Boolean;
    FSchema: Blue.Print.Open.API.Schema.v20.TSchema;
    FBooleanIsStored: Boolean;

    function GetSchema: Blue.Print.Open.API.Schema.v20.TSchema;
    function GetSchemaStored: Boolean;
    procedure SetBoolean(const Value: Boolean);
  public
    destructor Destroy; override;

    property IsBooleanStored: Boolean read FBooleanIsStored;
    property IsSchemaStored: Boolean read GetSchemaStored;
  published
    property boolean: Boolean read FBoolean write SetBoolean stored FBooleanIsStored;
    property Schema: Blue.Print.Open.API.Schema.v20.TSchema read GetSchema write FSchema stored GetSchemaStored;
  end;

  [SingleObject]
  DependenciesProperties = class
  private
    FSchema: Blue.Print.Open.API.Schema.v20.TSchema;
    FStringArray: stringArray;

    function GetSchema: Blue.Print.Open.API.Schema.v20.TSchema;
    function GetSchemaStored: Boolean;
    function GetStringArrayStored: Boolean;
  public
    destructor Destroy; override;

    property IsSchemaStored: Boolean read GetSchemaStored;
    property IsStringArrayStored: Boolean read GetStringArrayStored;
  published
    property Schema: Blue.Print.Open.API.Schema.v20.TSchema read GetSchema write FSchema stored GetSchemaStored;
    property stringArray: stringArray read FStringArray write FStringArray stored GetStringArrayStored;
  end;

  [SingleObject]
  AdditionalProperties = class
  private
    FBoolean: Boolean;
    FSchema: Blue.Print.Open.API.Schema.v20.TSchema;
    FBooleanIsStored: Boolean;

    function GetSchema: Blue.Print.Open.API.Schema.v20.TSchema;
    function GetSchemaStored: Boolean;
    procedure SetBoolean(const Value: Boolean);
  public
    destructor Destroy; override;

    property IsBooleanStored: Boolean read FBooleanIsStored;
    property IsSchemaStored: Boolean read GetSchemaStored;
  published
    property boolean: Boolean read FBoolean write SetBoolean stored FBooleanIsStored;
    property Schema: Blue.Print.Open.API.Schema.v20.TSchema read GetSchema write FSchema stored GetSchemaStored;
  end;

  [SingleObject]
  Items = class
  private
    FSchema: Blue.Print.Open.API.Schema.v20.TSchema;
    FSchemaArray: schemaArray;

    function GetSchema: Blue.Print.Open.API.Schema.v20.TSchema;
    function GetSchemaStored: Boolean;
    function GetSchemaArrayStored: Boolean;
  public
    destructor Destroy; override;

    function AddSchemaArray: Blue.Print.Open.API.Schema.v20.TSchema;

    property IsSchemaStored: Boolean read GetSchemaStored;
    property IsSchemaArrayStored: Boolean read GetSchemaArrayStored;
  published
    property Schema: Blue.Print.Open.API.Schema.v20.TSchema read GetSchema write FSchema stored GetSchemaStored;
    property schemaArray: schemaArray read FSchemaArray write FSchemaArray stored GetSchemaArrayStored;
  end;

  [SingleObject]
  &Type = class
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

  TSchemaOpenAPI20 = class
  private
    FExternalDocs: externalDocs;
    FTags: TArray<tag>;
    FBasePath: System.String;
    FSwagger: System.String;
    FConsumes: Blue.Print.Open.API.Schema.v20.Consumes;
    FPaths: paths;
    FResponses: responses;
    FInfo: info;
    FSchemes: schemesList;
    FSecurity: security;
    FParameters: parameterDefinitions;
    FDefinitions: definitions;
    FProduces: Blue.Print.Open.API.Schema.v20.Produces;
    FHost: System.String;
    FSecurityDefinitions: securityDefinitions;

    function GetExternalDocs: externalDocs;
    function GetConsumes: Blue.Print.Open.API.Schema.v20.Consumes;
    function GetPaths: paths;
    function GetResponses: responses;
    function GetInfo: info;
    function GetParameters: parameterDefinitions;
    function GetDefinitions: definitions;
    function GetProduces: Blue.Print.Open.API.Schema.v20.Produces;
    function GetSecurityDefinitions: securityDefinitions;
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
  public
    destructor Destroy; override;

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
  published
    property externalDocs: externalDocs read GetExternalDocs write FExternalDocs stored GetExternalDocsStored;
    property tags: TArray<tag> read FTags write FTags stored GetTagsStored;
    property basePath: System.String read FBasePath write FBasePath stored GetBasePathStored;
    property swagger: System.String read FSwagger write FSwagger;
    property consumes: Blue.Print.Open.API.Schema.v20.Consumes read GetConsumes write FConsumes stored GetConsumesStored;
    property paths: paths read GetPaths write FPaths;
    property responses: responses read GetResponses write FResponses stored GetResponsesStored;
    property info: info read GetInfo write FInfo;
    property schemes: schemesList read FSchemes write FSchemes stored GetSchemesStored;
    property security: security read FSecurity write FSecurity stored GetSecurityStored;
    property parameters: parameterDefinitions read GetParameters write FParameters stored GetParametersStored;
    property definitions: definitions read GetDefinitions write FDefinitions stored GetDefinitionsStored;
    property produces: Blue.Print.Open.API.Schema.v20.Produces read GetProduces write FProduces stored GetProducesStored;
    property host: System.String read FHost write FHost stored GetHostStored;
    property securityDefinitions: securityDefinitions read GetSecurityDefinitions write FSecurityDefinitions stored GetSecurityDefinitionsStored;
  end;

  [SingleObject]
  Parameter = class
  private
    FBodyParameter: TMap<System.String, any>;
    FNonBodyParameter: nonBodyParameter;

    function GetBodyParameter: TMap<System.String, any>;
    function GetNonBodyParameter: nonBodyParameter;
    function GetBodyParameterStored: Boolean;
    function GetNonBodyParameterStored: Boolean;
  public
    destructor Destroy; override;

    property IsBodyParameterStored: Boolean read GetBodyParameterStored;
    property IsNonBodyParameterStored: Boolean read GetNonBodyParameterStored;
  published
    property bodyParameter: TMap<System.String, any> read GetBodyParameter write FBodyParameter stored GetBodyParameterStored;
    property nonBodyParameter: nonBodyParameter read GetNonBodyParameter write FNonBodyParameter stored GetNonBodyParameterStored;
  end;

  [SingleObject]
  SecurityDefinitionsProperties = class
  private
    FBasicAuthenticationSecurity: basicAuthenticationSecurity;
    FApiKeySecurity: apiKeySecurity;
    FOauth2ImplicitSecurity: TMap<System.String, any>;
    FOauth2PasswordSecurity: oauth2PasswordSecurity;
    FOauth2ApplicationSecurity: oauth2ApplicationSecurity;
    FOauth2AccessCodeSecurity: oauth2AccessCodeSecurity;

    function GetBasicAuthenticationSecurity: basicAuthenticationSecurity;
    function GetApiKeySecurity: apiKeySecurity;
    function GetOauth2ImplicitSecurity: TMap<System.String, any>;
    function GetOauth2PasswordSecurity: oauth2PasswordSecurity;
    function GetOauth2ApplicationSecurity: oauth2ApplicationSecurity;
    function GetOauth2AccessCodeSecurity: oauth2AccessCodeSecurity;
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
    property basicAuthenticationSecurity: basicAuthenticationSecurity read GetBasicAuthenticationSecurity write FBasicAuthenticationSecurity stored GetBasicAuthenticationSecurityStored;
    property apiKeySecurity: apiKeySecurity read GetApiKeySecurity write FApiKeySecurity stored GetApiKeySecurityStored;
    property oauth2ImplicitSecurity: TMap<System.String, any> read GetOauth2ImplicitSecurity write FOauth2ImplicitSecurity stored GetOauth2ImplicitSecurityStored;
    property oauth2PasswordSecurity: oauth2PasswordSecurity read GetOauth2PasswordSecurity write FOauth2PasswordSecurity stored GetOauth2PasswordSecurityStored;
    property oauth2ApplicationSecurity: oauth2ApplicationSecurity read GetOauth2ApplicationSecurity write FOauth2ApplicationSecurity stored GetOauth2ApplicationSecurityStored;
    property oauth2AccessCodeSecurity: oauth2AccessCodeSecurity read GetOauth2AccessCodeSecurity write FOauth2AccessCodeSecurity stored GetOauth2AccessCodeSecurityStored;
  end;

  [SingleObject]
  ParametersList = class
  private
    FParameter: Blue.Print.Open.API.Schema.v20.Parameter;
    FJsonReference: jsonReference;

    function GetParameter: Blue.Print.Open.API.Schema.v20.Parameter;
    function GetJsonReference: jsonReference;
    function GetParameterStored: Boolean;
    function GetJsonReferenceStored: Boolean;
  public
    destructor Destroy; override;

    property IsParameterStored: Boolean read GetParameterStored;
    property IsJsonReferenceStored: Boolean read GetJsonReferenceStored;
  published
    property parameter: Blue.Print.Open.API.Schema.v20.Parameter read GetParameter write FParameter stored GetParameterStored;
    property jsonReference: jsonReference read GetJsonReference write FJsonReference stored GetJsonReferenceStored;
  end;

  [SingleObject]
  ResponseValue = class
  private
    FResponse: TMap<System.String, any>;
    FJsonReference: jsonReference;

    function GetResponse: TMap<System.String, any>;
    function GetJsonReference: jsonReference;
    function GetResponseStored: Boolean;
    function GetJsonReferenceStored: Boolean;
  public
    destructor Destroy; override;

    property IsResponseStored: Boolean read GetResponseStored;
    property IsJsonReferenceStored: Boolean read GetJsonReferenceStored;
  published
    property response: TMap<System.String, any> read GetResponse write FResponse stored GetResponseStored;
    property jsonReference: jsonReference read GetJsonReference write FJsonReference stored GetJsonReferenceStored;
  end;

  [SingleObject]
  Consumes = class
  private
    FMediaTypeList: mediaTypeList;

    function GetMediaTypeListStored: Boolean;
  public
    property IsMediaTypeListStored: Boolean read GetMediaTypeListStored;
  published
    property mediaTypeList: mediaTypeList read FMediaTypeList write FMediaTypeList stored GetMediaTypeListStored;
  end;

  [SingleObject]
  Produces = class
  private
    FMediaTypeList: mediaTypeList;

    function GetMediaTypeListStored: Boolean;
  public
    property IsMediaTypeListStored: Boolean read GetMediaTypeListStored;
  published
    property mediaTypeList: mediaTypeList read FMediaTypeList write FMediaTypeList stored GetMediaTypeListStored;
  end;

implementation

uses System.SysUtils;

{ TSchema }

destructor TSchema.Destroy;
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

function TSchema.AddAnyOf: Blue.Print.Open.API.Schema.v20.TSchema;
begin
  Result := Blue.Print.Open.API.Schema.v20.TSchema.Create;

  FAnyOf := FAnyOf + [Result];
end;

function TSchema.GetAnyOfStored: Boolean;
begin
  Result := Assigned(FAnyOf);
end;

procedure TSchema.SetExclusiveMaximum(const Value: System.Boolean);
begin
  FExclusiveMaximum := Value;
  FExclusiveMaximumIsStored := True;
end;

function TSchema.GetFormatStored: Boolean;
begin
  Result := not FFormat.IsEmpty;
end;

procedure TSchema.SetExclusiveMinimum(const Value: System.Boolean);
begin
  FExclusiveMinimum := Value;
  FExclusiveMinimumIsStored := True;
end;

function TSchema.AddAllOf: Blue.Print.Open.API.Schema.v20.TSchema;
begin
  Result := Blue.Print.Open.API.Schema.v20.TSchema.Create;

  FAllOf := FAllOf + [Result];
end;

function TSchema.GetAllOfStored: Boolean;
begin
  Result := Assigned(FAllOf);
end;

function TSchema.GetSchemaStored: Boolean;
begin
  Result := not FSchema.IsEmpty;
end;

function TSchema.GetProperties: TMap<System.String, Blue.Print.Open.API.Schema.v20.TSchema>;
begin
  if not Assigned(FProperties) then
    FProperties := TMap<System.String, Blue.Print.Open.API.Schema.v20.TSchema>.Create;

  Result := FProperties;
end;

function TSchema.GetPropertiesStored: Boolean;
begin
  Result := Assigned(FProperties);
end;

function TSchema.GetNot: Blue.Print.Open.API.Schema.v20.TSchema;
begin
  if not Assigned(FNot) then
    FNot := Blue.Print.Open.API.Schema.v20.TSchema.Create;

  Result := FNot;
end;

function TSchema.GetNotStored: Boolean;
begin
  Result := Assigned(FNot);
end;

function TSchema.GetMaxLengthStored: Boolean;
begin
  Result := FMaxLength <> 0;
end;

function TSchema.GetEnumStored: Boolean;
begin
  Result := Assigned(FEnum);
end;

function TSchema.GetAdditionalItems: Blue.Print.Open.API.Schema.v20.AdditionalItems;
begin
  if not Assigned(FAdditionalItems) then
    FAdditionalItems := Blue.Print.Open.API.Schema.v20.AdditionalItems.Create;

  Result := FAdditionalItems;
end;

function TSchema.GetAdditionalItemsStored: Boolean;
begin
  Result := Assigned(FAdditionalItems);
end;

function TSchema.GetIdStored: Boolean;
begin
  Result := not FId.IsEmpty;
end;

function TSchema.GetPatternStored: Boolean;
begin
  Result := not FPattern.IsEmpty;
end;

function TSchema.GetDefaultStored: Boolean;
begin
  Result := False;
end;

function TSchema.GetMinProperties: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
begin
  if not Assigned(FMinProperties) then
    FMinProperties := Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0.Create;

  Result := FMinProperties;
end;

function TSchema.GetMinPropertiesStored: Boolean;
begin
  Result := Assigned(FMinProperties);
end;

function TSchema.GetMinLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
begin
  if not Assigned(FMinLength) then
    FMinLength := Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0.Create;

  Result := FMinLength;
end;

function TSchema.GetMinLengthStored: Boolean;
begin
  Result := Assigned(FMinLength);
end;

function TSchema.GetTitleStored: Boolean;
begin
  Result := not FTitle.IsEmpty;
end;

function TSchema.GetMultipleOfStored: Boolean;
begin
  Result := FMultipleOf <> 0;
end;

function TSchema.GetPatternProperties: TMap<System.String, Blue.Print.Open.API.Schema.v20.TSchema>;
begin
  if not Assigned(FPatternProperties) then
    FPatternProperties := TMap<System.String, Blue.Print.Open.API.Schema.v20.TSchema>.Create;

  Result := FPatternProperties;
end;

function TSchema.GetPatternPropertiesStored: Boolean;
begin
  Result := Assigned(FPatternProperties);
end;

function TSchema.AddOneOf: Blue.Print.Open.API.Schema.v20.TSchema;
begin
  Result := Blue.Print.Open.API.Schema.v20.TSchema.Create;

  FOneOf := FOneOf + [Result];
end;

function TSchema.GetOneOfStored: Boolean;
begin
  Result := Assigned(FOneOf);
end;

function TSchema.GetMinimumStored: Boolean;
begin
  Result := FMinimum <> 0;
end;

function TSchema.GetDependencies: TMap<System.String, Blue.Print.Open.API.Schema.v20.DependenciesProperties>;
begin
  if not Assigned(FDependencies) then
    FDependencies := TMap<System.String, Blue.Print.Open.API.Schema.v20.DependenciesProperties>.Create;

  Result := FDependencies;
end;

function TSchema.GetDependenciesStored: Boolean;
begin
  Result := Assigned(FDependencies);
end;

function TSchema.GetAdditionalProperties: Blue.Print.Open.API.Schema.v20.AdditionalProperties;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := Blue.Print.Open.API.Schema.v20.AdditionalProperties.Create;

  Result := FAdditionalProperties;
end;

function TSchema.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

function TSchema.GetDefinitions: TMap<System.String, Blue.Print.Open.API.Schema.v20.TSchema>;
begin
  if not Assigned(FDefinitions) then
    FDefinitions := TMap<System.String, Blue.Print.Open.API.Schema.v20.TSchema>.Create;

  Result := FDefinitions;
end;

function TSchema.GetDefinitionsStored: Boolean;
begin
  Result := Assigned(FDefinitions);
end;

function TSchema.GetMaxPropertiesStored: Boolean;
begin
  Result := FMaxProperties <> 0;
end;

function TSchema.GetMaxItemsStored: Boolean;
begin
  Result := FMaxItems <> 0;
end;

procedure TSchema.SetUniqueItems(const Value: System.Boolean);
begin
  FUniqueItems := Value;
  FUniqueItemsIsStored := True;
end;

function TSchema.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TSchema.GetMaximumStored: Boolean;
begin
  Result := FMaximum <> 0;
end;

function TSchema.GetItems: Blue.Print.Open.API.Schema.v20.Items;
begin
  if not Assigned(FItems) then
    FItems := Blue.Print.Open.API.Schema.v20.Items.Create;

  Result := FItems;
end;

function TSchema.GetItemsStored: Boolean;
begin
  Result := Assigned(FItems);
end;

function TSchema.GetMinItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
begin
  if not Assigned(FMinItems) then
    FMinItems := Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0.Create;

  Result := FMinItems;
end;

function TSchema.GetMinItemsStored: Boolean;
begin
  Result := Assigned(FMinItems);
end;

function TSchema.GetRequiredStored: Boolean;
begin
  Result := Assigned(FRequired);
end;

function TSchema.GetType: Blue.Print.Open.API.Schema.v20.&Type;
begin
  if not Assigned(FType) then
    FType := Blue.Print.Open.API.Schema.v20.&Type.Create;

  Result := FType;
end;

function TSchema.GetTypeStored: Boolean;
begin
  Result := Assigned(FType);
end;

{ PositiveIntegerDefault0 }

function PositiveIntegerDefault0.GetPositiveIntegerStored: Boolean;
begin
  Result := FPositiveInteger <> 0;
end;

{ AdditionalItems }

destructor AdditionalItems.Destroy;
begin
  FSchema.Free;

  inherited;
end;

procedure AdditionalItems.SetBoolean(const Value: Boolean);
begin
  FBoolean := Value;
  FBooleanIsStored := True;
end;

function AdditionalItems.GetSchema: Blue.Print.Open.API.Schema.v20.TSchema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v20.TSchema.Create;

  Result := FSchema;
end;

function AdditionalItems.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

{ DependenciesProperties }

destructor DependenciesProperties.Destroy;
begin
  FSchema.Free;

  inherited;
end;

function DependenciesProperties.GetSchema: Blue.Print.Open.API.Schema.v20.TSchema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v20.TSchema.Create;

  Result := FSchema;
end;

function DependenciesProperties.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function DependenciesProperties.GetStringArrayStored: Boolean;
begin
  Result := Assigned(FStringArray);
end;

{ AdditionalProperties }

destructor AdditionalProperties.Destroy;
begin
  FSchema.Free;

  inherited;
end;

procedure AdditionalProperties.SetBoolean(const Value: Boolean);
begin
  FBoolean := Value;
  FBooleanIsStored := True;
end;

function AdditionalProperties.GetSchema: Blue.Print.Open.API.Schema.v20.TSchema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v20.TSchema.Create;

  Result := FSchema;
end;

function AdditionalProperties.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

{ Items }

destructor Items.Destroy;
begin
  FSchema.Free;

  for var AObject in FSchemaArray do
    AObject.Free;

  inherited;
end;

function Items.GetSchema: Blue.Print.Open.API.Schema.v20.TSchema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v20.TSchema.Create;

  Result := FSchema;
end;

function Items.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function Items.AddSchemaArray: Blue.Print.Open.API.Schema.v20.TSchema;
begin
  Result := Blue.Print.Open.API.Schema.v20.TSchema.Create;

  FSchemaArray := FSchemaArray + [Result];
end;

function Items.GetSchemaArrayStored: Boolean;
begin
  Result := Assigned(FSchemaArray);
end;

{ &Type }

procedure &Type.SetSimpleTypes(const Value: simpleTypes);
begin
  FSimpleTypes := Value;
  FSimpleTypesIsStored := True;
end;

function &Type.GetArrayStored: Boolean;
begin
  Result := Assigned(FArray);
end;

{ TSchemaOpenAPI20 }

destructor TSchemaOpenAPI20.Destroy;
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

  inherited;
end;

function TSchemaOpenAPI20.GetExternalDocs: TMap<System.String, any>;
begin
  if not Assigned(FExternalDocs) then
    FExternalDocs := TMap<System.String, any>.Create;

  Result := FExternalDocs;
end;

function TSchemaOpenAPI20.GetExternalDocsStored: Boolean;
begin
  Result := Assigned(FExternalDocs);
end;

function TSchemaOpenAPI20.GetTagsStored: Boolean;
begin
  Result := Assigned(FTags);
end;

function TSchemaOpenAPI20.GetBasePathStored: Boolean;
begin
  Result := not FBasePath.IsEmpty;
end;

function TSchemaOpenAPI20.GetConsumes: Blue.Print.Open.API.Schema.v20.Consumes;
begin
  if not Assigned(FConsumes) then
    FConsumes := Blue.Print.Open.API.Schema.v20.Consumes.Create;

  Result := FConsumes;
end;

function TSchemaOpenAPI20.GetConsumesStored: Boolean;
begin
  Result := Assigned(FConsumes);
end;

function TSchemaOpenAPI20.GetPaths: TMap<System.String, any>;
begin
  if not Assigned(FPaths) then
    FPaths := TMap<System.String, any>.Create;

  Result := FPaths;
end;

function TSchemaOpenAPI20.GetResponses: TMap<System.String, any>;
begin
  if not Assigned(FResponses) then
    FResponses := TMap<System.String, any>.Create;

  Result := FResponses;
end;

function TSchemaOpenAPI20.GetResponsesStored: Boolean;
begin
  Result := Assigned(FResponses);
end;

function TSchemaOpenAPI20.GetInfo: TMap<System.String, any>;
begin
  if not Assigned(FInfo) then
    FInfo := TMap<System.String, any>.Create;

  Result := FInfo;
end;

function TSchemaOpenAPI20.GetSchemesStored: Boolean;
begin
  Result := Assigned(FSchemes);
end;

function TSchemaOpenAPI20.GetSecurityStored: Boolean;
begin
  Result := Assigned(FSecurity);
end;

function TSchemaOpenAPI20.GetParameters: TMap<System.String, Blue.Print.Open.API.Schema.v20.Parameter>;
begin
  if not Assigned(FParameters) then
    FParameters := TMap<System.String, Blue.Print.Open.API.Schema.v20.Parameter>.Create;

  Result := FParameters;
end;

function TSchemaOpenAPI20.GetParametersStored: Boolean;
begin
  Result := Assigned(FParameters);
end;

function TSchemaOpenAPI20.GetDefinitions: TMap<System.String, TMap<System.String, any>>;
begin
  if not Assigned(FDefinitions) then
    FDefinitions := TMap<System.String, TMap<System.String, any>>.Create;

  Result := FDefinitions;
end;

function TSchemaOpenAPI20.GetDefinitionsStored: Boolean;
begin
  Result := Assigned(FDefinitions);
end;

function TSchemaOpenAPI20.GetProduces: Blue.Print.Open.API.Schema.v20.Produces;
begin
  if not Assigned(FProduces) then
    FProduces := Blue.Print.Open.API.Schema.v20.Produces.Create;

  Result := FProduces;
end;

function TSchemaOpenAPI20.GetProducesStored: Boolean;
begin
  Result := Assigned(FProduces);
end;

function TSchemaOpenAPI20.GetHostStored: Boolean;
begin
  Result := not FHost.IsEmpty;
end;

function TSchemaOpenAPI20.GetSecurityDefinitions: TMap<System.String, Blue.Print.Open.API.Schema.v20.SecurityDefinitionsProperties>;
begin
  if not Assigned(FSecurityDefinitions) then
    FSecurityDefinitions := TMap<System.String, Blue.Print.Open.API.Schema.v20.SecurityDefinitionsProperties>.Create;

  Result := FSecurityDefinitions;
end;

function TSchemaOpenAPI20.GetSecurityDefinitionsStored: Boolean;
begin
  Result := Assigned(FSecurityDefinitions);
end;

{ Parameter }

destructor Parameter.Destroy;
begin
  FBodyParameter.Free;

  FNonBodyParameter.Free;

  inherited;
end;

function Parameter.GetBodyParameter: TMap<System.String, any>;
begin
  if not Assigned(FBodyParameter) then
    FBodyParameter := TMap<System.String, any>.Create;

  Result := FBodyParameter;
end;

function Parameter.GetBodyParameterStored: Boolean;
begin
  Result := Assigned(FBodyParameter);
end;

function Parameter.GetNonBodyParameter: TMap<System.String, any>;
begin
  if not Assigned(FNonBodyParameter) then
    FNonBodyParameter := TMap<System.String, any>.Create;

  Result := FNonBodyParameter;
end;

function Parameter.GetNonBodyParameterStored: Boolean;
begin
  Result := Assigned(FNonBodyParameter);
end;

{ SecurityDefinitionsProperties }

destructor SecurityDefinitionsProperties.Destroy;
begin
  FBasicAuthenticationSecurity.Free;

  FApiKeySecurity.Free;

  FOauth2ImplicitSecurity.Free;

  FOauth2PasswordSecurity.Free;

  FOauth2ApplicationSecurity.Free;

  FOauth2AccessCodeSecurity.Free;

  inherited;
end;

function SecurityDefinitionsProperties.GetBasicAuthenticationSecurity: TMap<System.String, any>;
begin
  if not Assigned(FBasicAuthenticationSecurity) then
    FBasicAuthenticationSecurity := TMap<System.String, any>.Create;

  Result := FBasicAuthenticationSecurity;
end;

function SecurityDefinitionsProperties.GetBasicAuthenticationSecurityStored: Boolean;
begin
  Result := Assigned(FBasicAuthenticationSecurity);
end;

function SecurityDefinitionsProperties.GetApiKeySecurity: TMap<System.String, any>;
begin
  if not Assigned(FApiKeySecurity) then
    FApiKeySecurity := TMap<System.String, any>.Create;

  Result := FApiKeySecurity;
end;

function SecurityDefinitionsProperties.GetApiKeySecurityStored: Boolean;
begin
  Result := Assigned(FApiKeySecurity);
end;

function SecurityDefinitionsProperties.GetOauth2ImplicitSecurity: TMap<System.String, any>;
begin
  if not Assigned(FOauth2ImplicitSecurity) then
    FOauth2ImplicitSecurity := TMap<System.String, any>.Create;

  Result := FOauth2ImplicitSecurity;
end;

function SecurityDefinitionsProperties.GetOauth2ImplicitSecurityStored: Boolean;
begin
  Result := Assigned(FOauth2ImplicitSecurity);
end;

function SecurityDefinitionsProperties.GetOauth2PasswordSecurity: TMap<System.String, any>;
begin
  if not Assigned(FOauth2PasswordSecurity) then
    FOauth2PasswordSecurity := TMap<System.String, any>.Create;

  Result := FOauth2PasswordSecurity;
end;

function SecurityDefinitionsProperties.GetOauth2PasswordSecurityStored: Boolean;
begin
  Result := Assigned(FOauth2PasswordSecurity);
end;

function SecurityDefinitionsProperties.GetOauth2ApplicationSecurity: TMap<System.String, any>;
begin
  if not Assigned(FOauth2ApplicationSecurity) then
    FOauth2ApplicationSecurity := TMap<System.String, any>.Create;

  Result := FOauth2ApplicationSecurity;
end;

function SecurityDefinitionsProperties.GetOauth2ApplicationSecurityStored: Boolean;
begin
  Result := Assigned(FOauth2ApplicationSecurity);
end;

function SecurityDefinitionsProperties.GetOauth2AccessCodeSecurity: TMap<System.String, any>;
begin
  if not Assigned(FOauth2AccessCodeSecurity) then
    FOauth2AccessCodeSecurity := TMap<System.String, any>.Create;

  Result := FOauth2AccessCodeSecurity;
end;

function SecurityDefinitionsProperties.GetOauth2AccessCodeSecurityStored: Boolean;
begin
  Result := Assigned(FOauth2AccessCodeSecurity);
end;

{ ParametersList }

destructor ParametersList.Destroy;
begin
  FParameter.Free;

  FJsonReference.Free;

  inherited;
end;

function ParametersList.GetParameter: Blue.Print.Open.API.Schema.v20.Parameter;
begin
  if not Assigned(FParameter) then
    FParameter := Blue.Print.Open.API.Schema.v20.Parameter.Create;

  Result := FParameter;
end;

function ParametersList.GetParameterStored: Boolean;
begin
  Result := Assigned(FParameter);
end;

function ParametersList.GetJsonReference: TMap<System.String, any>;
begin
  if not Assigned(FJsonReference) then
    FJsonReference := TMap<System.String, any>.Create;

  Result := FJsonReference;
end;

function ParametersList.GetJsonReferenceStored: Boolean;
begin
  Result := Assigned(FJsonReference);
end;

{ ResponseValue }

destructor ResponseValue.Destroy;
begin
  FResponse.Free;

  FJsonReference.Free;

  inherited;
end;

function ResponseValue.GetResponse: TMap<System.String, any>;
begin
  if not Assigned(FResponse) then
    FResponse := TMap<System.String, any>.Create;

  Result := FResponse;
end;

function ResponseValue.GetResponseStored: Boolean;
begin
  Result := Assigned(FResponse);
end;

function ResponseValue.GetJsonReference: TMap<System.String, any>;
begin
  if not Assigned(FJsonReference) then
    FJsonReference := TMap<System.String, any>.Create;

  Result := FJsonReference;
end;

function ResponseValue.GetJsonReferenceStored: Boolean;
begin
  Result := Assigned(FJsonReference);
end;

{ Consumes }

function Consumes.GetMediaTypeListStored: Boolean;
begin
  Result := Assigned(FMediaTypeList);
end;

{ Produces }

function Produces.GetMediaTypeListStored: Boolean;
begin
  Result := Assigned(FMediaTypeList);
end;

end.
