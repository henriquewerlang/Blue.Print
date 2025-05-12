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
  AdditionalItems = class;
  DependenciesAdditionalProperties = class;
  AdditionalProperties = class;
  Items = class;
  &Type = class;
  TOpenAPIDefinition = class;
  JsonReference = class;
  Response = class;
  Header = class;
  Operation = class;
  Consumes = class;
  ParametersListArrayItem = class;
  Parameter = class;
  BodyParameter = class;
  Schema = class;
  Xml = class;
  ExternalDocs = class;
  Produces = class;
  Info = class;
  License = class;
  Contact = class;
  FileSchema = class;
  Oauth2PasswordSecurity = class;
  Oauth2AccessCodeSecurity = class;
  BasicAuthenticationSecurity = class;
  ApiKeySecurity = class;
  PrimitivesItems = class;
  Oauth2ApplicationSecurity = class;
  SecurityDefinitionsAdditionalProperties = class;
  Oauth2ImplicitSecurity = class;
  ResponseValue = class;
  PathItem = class;
  Tag = class;

  // Forward type alias
  schemaArray = TArray<Blue.Print.Open.API.Schema.v20.TJSONSchema>;
  positiveInteger = System.Integer;
  stringArray = TArray<System.String>;
  any = System.Rtti.TValue;
  responseDefinitions = TMap<System.String, Blue.Print.Open.API.Schema.v20.Response>;
  securityRequirement = TMap<System.String, TArray<System.String>>;
  responses = TMap<System.String, System.Rtti.TValue>;
  formDataParameterSubSchema = System.Rtti.TValue;
  oauth2Scopes = TMap<System.String, System.String>;
  maxLength = System.Integer;
  enum = TArray<System.Rtti.TValue>;
  nonBodyParameter = TMap<System.String, System.Rtti.TValue>;
  collectionFormat = System.String;
  mediaTypeList = TArray<System.String>;
  pattern = System.String;
  default = System.Rtti.TValue;
  title = System.String;
  schemesList = TArray<System.String>;
  collectionFormatWithMulti = System.String;
  multipleOf = System.Double;
  minimum = System.Double;
  paths = TMap<System.String, System.Rtti.TValue>;
  headerParameterSubSchema = System.Rtti.TValue;
  mimeType = System.String;
  queryParameterSubSchema = System.Rtti.TValue;
  security = TArray<TMap<System.String, TArray<System.String>>>;
  vendorExtension = System.Rtti.TValue;
  definitions = TMap<System.String, Blue.Print.Open.API.Schema.v20.Schema>;
  securityDefinitions = TMap<System.String, Blue.Print.Open.API.Schema.v20.SecurityDefinitionsAdditionalProperties>;
  parametersList = TArray<Blue.Print.Open.API.Schema.v20.ParametersListArrayItem>;
  maxItems = System.Integer;
  parameterDefinitions = TMap<System.String, Blue.Print.Open.API.Schema.v20.Parameter>;
  description = System.String;
  pathParameterSubSchema = System.Rtti.TValue;
  maximum = System.Double;
  headers = TMap<System.String, Blue.Print.Open.API.Schema.v20.Header>;
  examples = TMap<System.String, System.Rtti.TValue>;

  TJSONSchema = class
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
    FAdditionalItems: Blue.Print.Open.API.Schema.v20.AdditionalItems;
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
    FDependencies: TMap<System.String, Blue.Print.Open.API.Schema.v20.DependenciesAdditionalProperties>;
    FAdditionalProperties: Blue.Print.Open.API.Schema.v20.AdditionalProperties;
    FDefinitions: TMap<System.String, Blue.Print.Open.API.Schema.v20.TJSONSchema>;
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

    function GetProperties: TMap<System.String, Blue.Print.Open.API.Schema.v20.TJSONSchema>;
    function GetNot: Blue.Print.Open.API.Schema.v20.TJSONSchema;
    function GetAdditionalItems: Blue.Print.Open.API.Schema.v20.AdditionalItems;
    function GetMinProperties: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    function GetMinLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    function GetPatternProperties: TMap<System.String, Blue.Print.Open.API.Schema.v20.TJSONSchema>;
    function GetDependencies: TMap<System.String, Blue.Print.Open.API.Schema.v20.DependenciesAdditionalProperties>;
    function GetAdditionalProperties: Blue.Print.Open.API.Schema.v20.AdditionalProperties;
    function GetDefinitions: TMap<System.String, Blue.Print.Open.API.Schema.v20.TJSONSchema>;
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
    property additionalItems: Blue.Print.Open.API.Schema.v20.AdditionalItems read GetAdditionalItems write FAdditionalItems stored GetAdditionalItemsStored;
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
    property dependencies: TMap<System.String, Blue.Print.Open.API.Schema.v20.DependenciesAdditionalProperties> read GetDependencies write FDependencies stored GetDependenciesStored;
    property additionalProperties: Blue.Print.Open.API.Schema.v20.AdditionalProperties read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
    property definitions: TMap<System.String, Blue.Print.Open.API.Schema.v20.TJSONSchema> read GetDefinitions write FDefinitions stored GetDefinitionsStored;
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
  DependenciesAdditionalProperties = class
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
  AdditionalProperties = class
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
  Items = class
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

  TOpenAPIDefinition = class
  private
    FExternalDocs: Blue.Print.Open.API.Schema.v20.ExternalDocs;
    FTags: TArray<Blue.Print.Open.API.Schema.v20.Tag>;
    FBasePath: System.String;
    FSwagger: System.String;
    FConsumes: Blue.Print.Open.API.Schema.v20.Consumes;
    FPaths: paths;
    FResponses: responses;
    FInfo: Blue.Print.Open.API.Schema.v20.Info;
    FSchemes: schemesList;
    FSecurity: security;
    FParameters: parameterDefinitions;
    FDefinitions: definitions;
    FProduces: Blue.Print.Open.API.Schema.v20.Produces;
    FHost: System.String;
    FSecurityDefinitions: securityDefinitions;

    function GetExternalDocs: Blue.Print.Open.API.Schema.v20.ExternalDocs;
    function GetConsumes: Blue.Print.Open.API.Schema.v20.Consumes;
    function GetPaths: paths;
    function GetResponses: responses;
    function GetInfo: Blue.Print.Open.API.Schema.v20.Info;
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
  published
    property externalDocs: Blue.Print.Open.API.Schema.v20.ExternalDocs read GetExternalDocs write FExternalDocs stored GetExternalDocsStored;
    property tags: TArray<Blue.Print.Open.API.Schema.v20.Tag> read FTags write FTags stored GetTagsStored;
    property basePath: System.String read FBasePath write FBasePath stored GetBasePathStored;
    property swagger: System.String read FSwagger write FSwagger;
    property consumes: Blue.Print.Open.API.Schema.v20.Consumes read GetConsumes write FConsumes stored GetConsumesStored;
    property paths: paths read GetPaths write FPaths;
    property responses: responses read GetResponses write FResponses stored GetResponsesStored;
    property info: Blue.Print.Open.API.Schema.v20.Info read GetInfo write FInfo;
    property schemes: schemesList read FSchemes write FSchemes stored GetSchemesStored;
    property security: security read FSecurity write FSecurity stored GetSecurityStored;
    property parameters: parameterDefinitions read GetParameters write FParameters stored GetParametersStored;
    property definitions: definitions read GetDefinitions write FDefinitions stored GetDefinitionsStored;
    property produces: Blue.Print.Open.API.Schema.v20.Produces read GetProduces write FProduces stored GetProducesStored;
    property host: System.String read FHost write FHost stored GetHostStored;
    property securityDefinitions: securityDefinitions read GetSecurityDefinitions write FSecurityDefinitions stored GetSecurityDefinitionsStored;
  end;

  JsonReference = class
  private
    FRef: System.String;
  published
    [FieldName('$ref')]
    property ref: System.String read FRef write FRef;
  end;

  Response = class
  private
    FHeaders: TMap<System.String, Blue.Print.Open.API.Schema.v20.Header>;
    FDescription: System.String;
    FSchema: TArray<any>;
    FExamples: TMap<System.String, any>;

    function GetHeaders: TMap<System.String, Blue.Print.Open.API.Schema.v20.Header>;
    function GetExamples: TMap<System.String, any>;
    function GetHeadersStored: Boolean;
    function GetSchemaStored: Boolean;
    function GetExamplesStored: Boolean;
  public
    destructor Destroy; override;

    property IsHeadersStored: Boolean read GetHeadersStored;
    property IsSchemaStored: Boolean read GetSchemaStored;
    property IsExamplesStored: Boolean read GetExamplesStored;
  published
    property headers: TMap<System.String, Blue.Print.Open.API.Schema.v20.Header> read GetHeaders write FHeaders stored GetHeadersStored;
    property description: System.String read FDescription write FDescription;
    property schema: TArray<any> read FSchema write FSchema stored GetSchemaStored;
    property examples: TMap<System.String, any> read GetExamples write FExamples stored GetExamplesStored;
  end;

  Header = class
  private
    FExclusiveMaximum: System.Boolean;
    FMinimum: System.Double;
    FFormat: System.String;
    FExclusiveMinimum: System.Boolean;
    FMaxLength: positiveInteger;
    FEnum: TArray<any>;
    FMaxItems: positiveInteger;
    FCollectionFormat: System.String;
    FUniqueItems: System.Boolean;
    FDescription: System.String;
    FMaximum: System.Double;
    FDefault: any;
    FPattern: System.String;
    FItems: Blue.Print.Open.API.Schema.v20.Items;
    FMinLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    FMinItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    FMultipleOf: System.Double;
    FType: Blue.Print.Open.API.Schema.v20.&Type;
    FExclusiveMaximumIsStored: Boolean;
    FExclusiveMinimumIsStored: Boolean;
    FUniqueItemsIsStored: Boolean;

    function GetItems: Blue.Print.Open.API.Schema.v20.Items;
    function GetMinLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    function GetMinItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    function GetType: Blue.Print.Open.API.Schema.v20.&Type;
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
    procedure SetExclusiveMaximum(const Value: System.Boolean);
    procedure SetExclusiveMinimum(const Value: System.Boolean);
    procedure SetUniqueItems(const Value: System.Boolean);
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
  published
    property exclusiveMaximum: System.Boolean read FExclusiveMaximum write SetExclusiveMaximum stored FExclusiveMaximumIsStored;
    property minimum: System.Double read FMinimum write FMinimum stored GetMinimumStored;
    property format: System.String read FFormat write FFormat stored GetFormatStored;
    property exclusiveMinimum: System.Boolean read FExclusiveMinimum write SetExclusiveMinimum stored FExclusiveMinimumIsStored;
    property maxLength: positiveInteger read FMaxLength write FMaxLength stored GetMaxLengthStored;
    property enum: TArray<any> read FEnum write FEnum stored GetEnumStored;
    property maxItems: positiveInteger read FMaxItems write FMaxItems stored GetMaxItemsStored;
    property collectionFormat: System.String read FCollectionFormat write FCollectionFormat stored GetCollectionFormatStored;
    property uniqueItems: System.Boolean read FUniqueItems write SetUniqueItems stored FUniqueItemsIsStored;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property maximum: System.Double read FMaximum write FMaximum stored GetMaximumStored;
    property default: any read FDefault write FDefault stored GetDefaultStored;
    property pattern: System.String read FPattern write FPattern stored GetPatternStored;
    property items: Blue.Print.Open.API.Schema.v20.Items read GetItems write FItems stored GetItemsStored;
    property minLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0 read GetMinLength write FMinLength stored GetMinLengthStored;
    property minItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0 read GetMinItems write FMinItems stored GetMinItemsStored;
    property multipleOf: System.Double read FMultipleOf write FMultipleOf stored GetMultipleOfStored;
    [FieldName('type')]
    property &type: Blue.Print.Open.API.Schema.v20.&Type read GetType write FType;
  end;

  Operation = class
  private
    FTags: TArray<System.String>;
    FConsumes: Blue.Print.Open.API.Schema.v20.Consumes;
    FDescription: System.String;
    FResponses: TMap<System.String, any>;
    FSummary: System.String;
    FSchemes: TArray<System.String>;
    FDeprecated: System.Boolean;
    FOperationId: System.String;
    FSecurity: TArray<securityRequirement>;
    FParameters: TArray<Blue.Print.Open.API.Schema.v20.ParametersListArrayItem>;
    FExternalDocs: Blue.Print.Open.API.Schema.v20.ExternalDocs;
    FProduces: Blue.Print.Open.API.Schema.v20.Produces;
    FDeprecatedIsStored: Boolean;

    function GetConsumes: Blue.Print.Open.API.Schema.v20.Consumes;
    function GetResponses: TMap<System.String, any>;
    function GetExternalDocs: Blue.Print.Open.API.Schema.v20.ExternalDocs;
    function GetProduces: Blue.Print.Open.API.Schema.v20.Produces;
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
  published
    property tags: TArray<System.String> read FTags write FTags stored GetTagsStored;
    property consumes: Blue.Print.Open.API.Schema.v20.Consumes read GetConsumes write FConsumes stored GetConsumesStored;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property responses: TMap<System.String, any> read GetResponses write FResponses;
    property summary: System.String read FSummary write FSummary stored GetSummaryStored;
    property schemes: TArray<System.String> read FSchemes write FSchemes stored GetSchemesStored;
    property deprecated: System.Boolean read FDeprecated write SetDeprecated stored FDeprecatedIsStored;
    property operationId: System.String read FOperationId write FOperationId stored GetOperationIdStored;
    property security: TArray<securityRequirement> read FSecurity write FSecurity stored GetSecurityStored;
    property parameters: TArray<Blue.Print.Open.API.Schema.v20.ParametersListArrayItem> read FParameters write FParameters stored GetParametersStored;
    property externalDocs: Blue.Print.Open.API.Schema.v20.ExternalDocs read GetExternalDocs write FExternalDocs stored GetExternalDocsStored;
    property produces: Blue.Print.Open.API.Schema.v20.Produces read GetProduces write FProduces stored GetProducesStored;
  end;

  [SingleObject]
  Consumes = class
  private
    FMediaTypeList: TArray<System.String>;

    function GetMediaTypeListStored: Boolean;
  public
    property IsMediaTypeListStored: Boolean read GetMediaTypeListStored;
  published
    property mediaTypeList: TArray<System.String> read FMediaTypeList write FMediaTypeList stored GetMediaTypeListStored;
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

  [SingleObject]
  Parameter = class
  private
    FBodyParameter: Blue.Print.Open.API.Schema.v20.BodyParameter;
    FNonBodyParameter: TMap<System.String, any>;

    function GetBodyParameter: Blue.Print.Open.API.Schema.v20.BodyParameter;
    function GetNonBodyParameter: TMap<System.String, any>;
    function GetBodyParameterStored: Boolean;
    function GetNonBodyParameterStored: Boolean;
  public
    destructor Destroy; override;

    property IsBodyParameterStored: Boolean read GetBodyParameterStored;
    property IsNonBodyParameterStored: Boolean read GetNonBodyParameterStored;
  published
    property bodyParameter: Blue.Print.Open.API.Schema.v20.BodyParameter read GetBodyParameter write FBodyParameter stored GetBodyParameterStored;
    property nonBodyParameter: TMap<System.String, any> read GetNonBodyParameter write FNonBodyParameter stored GetNonBodyParameterStored;
  end;

  BodyParameter = class
  private
    FName: System.String;
    FIn: System.String;
    FDescription: System.String;
    FRequired: System.Boolean;
    FSchema: Blue.Print.Open.API.Schema.v20.Schema;
    FRequiredIsStored: Boolean;

    function GetSchema: Blue.Print.Open.API.Schema.v20.Schema;
    function GetDescriptionStored: Boolean;
    procedure SetRequired(const Value: System.Boolean);
  public
    destructor Destroy; override;

    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsRequiredStored: Boolean read FRequiredIsStored;
  published
    property name: System.String read FName write FName;
    [FieldName('in')]
    property &in: System.String read FIn write FIn;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property required: System.Boolean read FRequired write SetRequired stored FRequiredIsStored;
    property schema: Blue.Print.Open.API.Schema.v20.Schema read GetSchema write FSchema;
  end;

  Schema = class
  private
    FExample: any;
    FExclusiveMaximum: System.Boolean;
    FMinimum: System.Double;
    FFormat: System.String;
    FExclusiveMinimum: System.Boolean;
    FAdditionalProperties: Blue.Print.Open.API.Schema.v20.AdditionalProperties;
    FAllOf: TArray<Blue.Print.Open.API.Schema.v20.Schema>;
    FProperties: TMap<System.String, Blue.Print.Open.API.Schema.v20.Schema>;
    FDiscriminator: System.String;
    FMaxLength: positiveInteger;
    FEnum: TArray<any>;
    FRef: System.String;
    FMaxProperties: positiveInteger;
    FXml: Blue.Print.Open.API.Schema.v20.Xml;
    FMaxItems: positiveInteger;
    FUniqueItems: System.Boolean;
    FDescription: System.String;
    FMaximum: System.Double;
    FDefault: any;
    FPattern: System.String;
    FMinProperties: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    FMinLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    FItems: Blue.Print.Open.API.Schema.v20.Items;
    FTitle: System.String;
    FReadOnly: System.Boolean;
    FMinItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    FExternalDocs: Blue.Print.Open.API.Schema.v20.ExternalDocs;
    FMultipleOf: System.Double;
    FRequired: stringArray;
    FType: Blue.Print.Open.API.Schema.v20.&Type;
    FExclusiveMaximumIsStored: Boolean;
    FExclusiveMinimumIsStored: Boolean;
    FUniqueItemsIsStored: Boolean;
    FReadOnlyIsStored: Boolean;

    function GetAdditionalProperties: Blue.Print.Open.API.Schema.v20.AdditionalProperties;
    function GetProperties: TMap<System.String, Blue.Print.Open.API.Schema.v20.Schema>;
    function GetXml: Blue.Print.Open.API.Schema.v20.Xml;
    function GetMinProperties: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    function GetMinLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    function GetItems: Blue.Print.Open.API.Schema.v20.Items;
    function GetMinItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    function GetExternalDocs: Blue.Print.Open.API.Schema.v20.ExternalDocs;
    function GetType: Blue.Print.Open.API.Schema.v20.&Type;
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
    procedure SetExclusiveMaximum(const Value: System.Boolean);
    procedure SetExclusiveMinimum(const Value: System.Boolean);
    procedure SetUniqueItems(const Value: System.Boolean);
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
  published
    property example: any read FExample write FExample stored GetExampleStored;
    property exclusiveMaximum: System.Boolean read FExclusiveMaximum write SetExclusiveMaximum stored FExclusiveMaximumIsStored;
    property minimum: System.Double read FMinimum write FMinimum stored GetMinimumStored;
    property format: System.String read FFormat write FFormat stored GetFormatStored;
    property exclusiveMinimum: System.Boolean read FExclusiveMinimum write SetExclusiveMinimum stored FExclusiveMinimumIsStored;
    property additionalProperties: Blue.Print.Open.API.Schema.v20.AdditionalProperties read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
    property allOf: TArray<Blue.Print.Open.API.Schema.v20.Schema> read FAllOf write FAllOf stored GetAllOfStored;
    property properties: TMap<System.String, Blue.Print.Open.API.Schema.v20.Schema> read GetProperties write FProperties stored GetPropertiesStored;
    property discriminator: System.String read FDiscriminator write FDiscriminator stored GetDiscriminatorStored;
    property maxLength: positiveInteger read FMaxLength write FMaxLength stored GetMaxLengthStored;
    property enum: TArray<any> read FEnum write FEnum stored GetEnumStored;
    [FieldName('$ref')]
    property ref: System.String read FRef write FRef stored GetRefStored;
    property maxProperties: positiveInteger read FMaxProperties write FMaxProperties stored GetMaxPropertiesStored;
    property xml: Blue.Print.Open.API.Schema.v20.Xml read GetXml write FXml stored GetXmlStored;
    property maxItems: positiveInteger read FMaxItems write FMaxItems stored GetMaxItemsStored;
    property uniqueItems: System.Boolean read FUniqueItems write SetUniqueItems stored FUniqueItemsIsStored;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property maximum: System.Double read FMaximum write FMaximum stored GetMaximumStored;
    property default: any read FDefault write FDefault stored GetDefaultStored;
    property pattern: System.String read FPattern write FPattern stored GetPatternStored;
    property minProperties: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0 read GetMinProperties write FMinProperties stored GetMinPropertiesStored;
    property minLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0 read GetMinLength write FMinLength stored GetMinLengthStored;
    property items: Blue.Print.Open.API.Schema.v20.Items read GetItems write FItems stored GetItemsStored;
    property title: System.String read FTitle write FTitle stored GetTitleStored;
    property readOnly: System.Boolean read FReadOnly write SetReadOnly stored FReadOnlyIsStored;
    property minItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0 read GetMinItems write FMinItems stored GetMinItemsStored;
    property externalDocs: Blue.Print.Open.API.Schema.v20.ExternalDocs read GetExternalDocs write FExternalDocs stored GetExternalDocsStored;
    property multipleOf: System.Double read FMultipleOf write FMultipleOf stored GetMultipleOfStored;
    property required: stringArray read FRequired write FRequired stored GetRequiredStored;
    [FieldName('type')]
    property &type: Blue.Print.Open.API.Schema.v20.&Type read GetType write FType stored GetTypeStored;
  end;

  Xml = class
  private
    FAttribute: System.Boolean;
    FName: System.String;
    FPrefix: System.String;
    FWrapped: System.Boolean;
    FNamespace: System.String;
    FAttributeIsStored: Boolean;
    FWrappedIsStored: Boolean;

    function GetNameStored: Boolean;
    function GetPrefixStored: Boolean;
    function GetNamespaceStored: Boolean;
    procedure SetAttribute(const Value: System.Boolean);
    procedure SetWrapped(const Value: System.Boolean);
  public
    property IsAttributeStored: Boolean read FAttributeIsStored;
    property IsNameStored: Boolean read GetNameStored;
    property IsPrefixStored: Boolean read GetPrefixStored;
    property IsWrappedStored: Boolean read FWrappedIsStored;
    property IsNamespaceStored: Boolean read GetNamespaceStored;
  published
    property attribute: System.Boolean read FAttribute write SetAttribute stored FAttributeIsStored;
    property name: System.String read FName write FName stored GetNameStored;
    property prefix: System.String read FPrefix write FPrefix stored GetPrefixStored;
    property wrapped: System.Boolean read FWrapped write SetWrapped stored FWrappedIsStored;
    property namespace: System.String read FNamespace write FNamespace stored GetNamespaceStored;
  end;

  ExternalDocs = class
  private
    FDescription: System.String;
    FUrl: System.String;

    function GetDescriptionStored: Boolean;
  public
    property IsDescriptionStored: Boolean read GetDescriptionStored;
  published
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property url: System.String read FUrl write FUrl;
  end;

  [SingleObject]
  Produces = class
  private
    FMediaTypeList: TArray<System.String>;

    function GetMediaTypeListStored: Boolean;
  public
    property IsMediaTypeListStored: Boolean read GetMediaTypeListStored;
  published
    property mediaTypeList: TArray<System.String> read FMediaTypeList write FMediaTypeList stored GetMediaTypeListStored;
  end;

  Info = class
  private
    FVersion: System.String;
    FTitle: System.String;
    FLicense: Blue.Print.Open.API.Schema.v20.License;
    FDescription: System.String;
    FTermsOfService: System.String;
    FContact: Blue.Print.Open.API.Schema.v20.Contact;

    function GetLicense: Blue.Print.Open.API.Schema.v20.License;
    function GetContact: Blue.Print.Open.API.Schema.v20.Contact;
    function GetLicenseStored: Boolean;
    function GetDescriptionStored: Boolean;
    function GetTermsOfServiceStored: Boolean;
    function GetContactStored: Boolean;
  public
    destructor Destroy; override;

    property IsLicenseStored: Boolean read GetLicenseStored;
    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsTermsOfServiceStored: Boolean read GetTermsOfServiceStored;
    property IsContactStored: Boolean read GetContactStored;
  published
    property version: System.String read FVersion write FVersion;
    property title: System.String read FTitle write FTitle;
    property license: Blue.Print.Open.API.Schema.v20.License read GetLicense write FLicense stored GetLicenseStored;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property termsOfService: System.String read FTermsOfService write FTermsOfService stored GetTermsOfServiceStored;
    property contact: Blue.Print.Open.API.Schema.v20.Contact read GetContact write FContact stored GetContactStored;
  end;

  License = class
  private
    FUrl: System.String;
    FName: System.String;

    function GetUrlStored: Boolean;
  public
    property IsUrlStored: Boolean read GetUrlStored;
  published
    property url: System.String read FUrl write FUrl stored GetUrlStored;
    property name: System.String read FName write FName;
  end;

  Contact = class
  private
    FEmail: System.String;
    FName: System.String;
    FUrl: System.String;

    function GetEmailStored: Boolean;
    function GetNameStored: Boolean;
    function GetUrlStored: Boolean;
  public
    property IsEmailStored: Boolean read GetEmailStored;
    property IsNameStored: Boolean read GetNameStored;
    property IsUrlStored: Boolean read GetUrlStored;
  published
    property email: System.String read FEmail write FEmail stored GetEmailStored;
    property name: System.String read FName write FName stored GetNameStored;
    property url: System.String read FUrl write FUrl stored GetUrlStored;
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
    FType: Blue.Print.Open.API.Schema.v20.&Type;
    FExample: any;
    FReadOnlyIsStored: Boolean;

    function GetExternalDocs: Blue.Print.Open.API.Schema.v20.ExternalDocs;
    function GetType: Blue.Print.Open.API.Schema.v20.&Type;
    function GetFormatStored: Boolean;
    function GetDescriptionStored: Boolean;
    function GetDefaultStored: Boolean;
    function GetTitleStored: Boolean;
    function GetExternalDocsStored: Boolean;
    function GetRequiredStored: Boolean;
    function GetExampleStored: Boolean;
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
  published
    property format: System.String read FFormat write FFormat stored GetFormatStored;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property default: any read FDefault write FDefault stored GetDefaultStored;
    property readOnly: System.Boolean read FReadOnly write SetReadOnly stored FReadOnlyIsStored;
    property title: System.String read FTitle write FTitle stored GetTitleStored;
    property externalDocs: Blue.Print.Open.API.Schema.v20.ExternalDocs read GetExternalDocs write FExternalDocs stored GetExternalDocsStored;
    property required: stringArray read FRequired write FRequired stored GetRequiredStored;
    [FieldName('type')]
    property &type: Blue.Print.Open.API.Schema.v20.&Type read GetType write FType;
    property example: any read FExample write FExample stored GetExampleStored;
  end;

  Oauth2PasswordSecurity = class
  private
    FFlow: System.String;
    FDescription: System.String;
    FScopes: oauth2Scopes;
    FType: Blue.Print.Open.API.Schema.v20.&Type;
    FTokenUrl: System.String;

    function GetScopes: oauth2Scopes;
    function GetType: Blue.Print.Open.API.Schema.v20.&Type;
    function GetDescriptionStored: Boolean;
    function GetScopesStored: Boolean;
  public
    destructor Destroy; override;

    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsScopesStored: Boolean read GetScopesStored;
  published
    property flow: System.String read FFlow write FFlow;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property scopes: oauth2Scopes read GetScopes write FScopes stored GetScopesStored;
    [FieldName('type')]
    property &type: Blue.Print.Open.API.Schema.v20.&Type read GetType write FType;
    property tokenUrl: System.String read FTokenUrl write FTokenUrl;
  end;

  Oauth2AccessCodeSecurity = class
  private
    FFlow: System.String;
    FTokenUrl: System.String;
    FDescription: System.String;
    FScopes: oauth2Scopes;
    FType: Blue.Print.Open.API.Schema.v20.&Type;
    FAuthorizationUrl: System.String;

    function GetScopes: oauth2Scopes;
    function GetType: Blue.Print.Open.API.Schema.v20.&Type;
    function GetDescriptionStored: Boolean;
    function GetScopesStored: Boolean;
  public
    destructor Destroy; override;

    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsScopesStored: Boolean read GetScopesStored;
  published
    property flow: System.String read FFlow write FFlow;
    property tokenUrl: System.String read FTokenUrl write FTokenUrl;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property scopes: oauth2Scopes read GetScopes write FScopes stored GetScopesStored;
    [FieldName('type')]
    property &type: Blue.Print.Open.API.Schema.v20.&Type read GetType write FType;
    property authorizationUrl: System.String read FAuthorizationUrl write FAuthorizationUrl;
  end;

  BasicAuthenticationSecurity = class
  private
    FDescription: System.String;
    FType: Blue.Print.Open.API.Schema.v20.&Type;

    function GetType: Blue.Print.Open.API.Schema.v20.&Type;
    function GetDescriptionStored: Boolean;
  public
    destructor Destroy; override;

    property IsDescriptionStored: Boolean read GetDescriptionStored;
  published
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    [FieldName('type')]
    property &type: Blue.Print.Open.API.Schema.v20.&Type read GetType write FType;
  end;

  ApiKeySecurity = class
  private
    FName: System.String;
    FIn: System.String;
    FDescription: System.String;
    FType: Blue.Print.Open.API.Schema.v20.&Type;

    function GetType: Blue.Print.Open.API.Schema.v20.&Type;
    function GetDescriptionStored: Boolean;
  public
    destructor Destroy; override;

    property IsDescriptionStored: Boolean read GetDescriptionStored;
  published
    property name: System.String read FName write FName;
    [FieldName('in')]
    property &in: System.String read FIn write FIn;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    [FieldName('type')]
    property &type: Blue.Print.Open.API.Schema.v20.&Type read GetType write FType;
  end;

  PrimitivesItems = class
  private
    FExclusiveMaximum: System.Boolean;
    FMinimum: minimum;
    FFormat: System.String;
    FExclusiveMinimum: System.Boolean;
    FMaxLength: maxLength;
    FEnum: enum;
    FMaxItems: positiveInteger;
    FCollectionFormat: collectionFormat;
    FUniqueItems: System.Boolean;
    FMaximum: System.Double;
    FDefault: default;
    FPattern: pattern;
    FItems: Blue.Print.Open.API.Schema.v20.Items;
    FMinLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    FMinItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    FMultipleOf: multipleOf;
    FType: Blue.Print.Open.API.Schema.v20.&Type;
    FExclusiveMaximumIsStored: Boolean;
    FExclusiveMinimumIsStored: Boolean;
    FUniqueItemsIsStored: Boolean;

    function GetItems: Blue.Print.Open.API.Schema.v20.Items;
    function GetMinLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    function GetMinItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    function GetType: Blue.Print.Open.API.Schema.v20.&Type;
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
    procedure SetExclusiveMaximum(const Value: System.Boolean);
    procedure SetExclusiveMinimum(const Value: System.Boolean);
    procedure SetUniqueItems(const Value: System.Boolean);
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
  published
    property exclusiveMaximum: System.Boolean read FExclusiveMaximum write SetExclusiveMaximum stored FExclusiveMaximumIsStored;
    property minimum: minimum read FMinimum write FMinimum stored GetMinimumStored;
    property format: System.String read FFormat write FFormat stored GetFormatStored;
    property exclusiveMinimum: System.Boolean read FExclusiveMinimum write SetExclusiveMinimum stored FExclusiveMinimumIsStored;
    property maxLength: maxLength read FMaxLength write FMaxLength stored GetMaxLengthStored;
    property enum: enum read FEnum write FEnum stored GetEnumStored;
    property maxItems: positiveInteger read FMaxItems write FMaxItems stored GetMaxItemsStored;
    property collectionFormat: collectionFormat read FCollectionFormat write FCollectionFormat stored GetCollectionFormatStored;
    property uniqueItems: System.Boolean read FUniqueItems write SetUniqueItems stored FUniqueItemsIsStored;
    property maximum: System.Double read FMaximum write FMaximum stored GetMaximumStored;
    property default: default read FDefault write FDefault stored GetDefaultStored;
    property pattern: pattern read FPattern write FPattern stored GetPatternStored;
    property items: Blue.Print.Open.API.Schema.v20.Items read GetItems write FItems stored GetItemsStored;
    property minLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0 read GetMinLength write FMinLength stored GetMinLengthStored;
    property minItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0 read GetMinItems write FMinItems stored GetMinItemsStored;
    property multipleOf: multipleOf read FMultipleOf write FMultipleOf stored GetMultipleOfStored;
    [FieldName('type')]
    property &type: Blue.Print.Open.API.Schema.v20.&Type read GetType write FType stored GetTypeStored;
  end;

  Oauth2ApplicationSecurity = class
  private
    FFlow: System.String;
    FDescription: System.String;
    FScopes: oauth2Scopes;
    FType: Blue.Print.Open.API.Schema.v20.&Type;
    FTokenUrl: System.String;

    function GetScopes: oauth2Scopes;
    function GetType: Blue.Print.Open.API.Schema.v20.&Type;
    function GetDescriptionStored: Boolean;
    function GetScopesStored: Boolean;
  public
    destructor Destroy; override;

    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsScopesStored: Boolean read GetScopesStored;
  published
    property flow: System.String read FFlow write FFlow;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property scopes: oauth2Scopes read GetScopes write FScopes stored GetScopesStored;
    [FieldName('type')]
    property &type: Blue.Print.Open.API.Schema.v20.&Type read GetType write FType;
    property tokenUrl: System.String read FTokenUrl write FTokenUrl;
  end;

  [SingleObject]
  SecurityDefinitionsAdditionalProperties = class
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

  Oauth2ImplicitSecurity = class
  private
    FFlow: System.String;
    FDescription: System.String;
    FScopes: oauth2Scopes;
    FType: Blue.Print.Open.API.Schema.v20.&Type;
    FAuthorizationUrl: System.String;

    function GetScopes: oauth2Scopes;
    function GetType: Blue.Print.Open.API.Schema.v20.&Type;
    function GetDescriptionStored: Boolean;
    function GetScopesStored: Boolean;
  public
    destructor Destroy; override;

    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsScopesStored: Boolean read GetScopesStored;
  published
    property flow: System.String read FFlow write FFlow;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property scopes: oauth2Scopes read GetScopes write FScopes stored GetScopesStored;
    [FieldName('type')]
    property &type: Blue.Print.Open.API.Schema.v20.&Type read GetType write FType;
    property authorizationUrl: System.String read FAuthorizationUrl write FAuthorizationUrl;
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

    function GetPatch: Blue.Print.Open.API.Schema.v20.Operation;
    function GetDelete: Blue.Print.Open.API.Schema.v20.Operation;
    function GetHead: Blue.Print.Open.API.Schema.v20.Operation;
    function GetGet: Blue.Print.Open.API.Schema.v20.Operation;
    function GetPost: Blue.Print.Open.API.Schema.v20.Operation;
    function GetOptions: Blue.Print.Open.API.Schema.v20.Operation;
    function GetPut: Blue.Print.Open.API.Schema.v20.Operation;
    function GetRefStored: Boolean;
    function GetPatchStored: Boolean;
    function GetDeleteStored: Boolean;
    function GetHeadStored: Boolean;
    function GetGetStored: Boolean;
    function GetPostStored: Boolean;
    function GetOptionsStored: Boolean;
    function GetParametersStored: Boolean;
    function GetPutStored: Boolean;
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
  end;

  Tag = class
  private
    FName: System.String;
    FDescription: description;
    FExternalDocs: Blue.Print.Open.API.Schema.v20.ExternalDocs;

    function GetExternalDocs: Blue.Print.Open.API.Schema.v20.ExternalDocs;
    function GetDescriptionStored: Boolean;
    function GetExternalDocsStored: Boolean;
  public
    destructor Destroy; override;

    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsExternalDocsStored: Boolean read GetExternalDocsStored;
  published
    property name: System.String read FName write FName;
    property description: description read FDescription write FDescription stored GetDescriptionStored;
    property externalDocs: Blue.Print.Open.API.Schema.v20.ExternalDocs read GetExternalDocs write FExternalDocs stored GetExternalDocsStored;
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

function TJSONSchema.GetAdditionalItems: Blue.Print.Open.API.Schema.v20.AdditionalItems;
begin
  if not Assigned(FAdditionalItems) then
    FAdditionalItems := Blue.Print.Open.API.Schema.v20.AdditionalItems.Create;

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

function TJSONSchema.GetDependencies: TMap<System.String, Blue.Print.Open.API.Schema.v20.DependenciesAdditionalProperties>;
begin
  if not Assigned(FDependencies) then
    FDependencies := TMap<System.String, Blue.Print.Open.API.Schema.v20.DependenciesAdditionalProperties>.Create;

  Result := FDependencies;
end;

function TJSONSchema.GetDependenciesStored: Boolean;
begin
  Result := Assigned(FDependencies);
end;

function TJSONSchema.GetAdditionalProperties: Blue.Print.Open.API.Schema.v20.AdditionalProperties;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := Blue.Print.Open.API.Schema.v20.AdditionalProperties.Create;

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

function TJSONSchema.GetItems: Blue.Print.Open.API.Schema.v20.Items;
begin
  if not Assigned(FItems) then
    FItems := Blue.Print.Open.API.Schema.v20.Items.Create;

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

function TJSONSchema.GetType: Blue.Print.Open.API.Schema.v20.&Type;
begin
  if not Assigned(FType) then
    FType := Blue.Print.Open.API.Schema.v20.&Type.Create;

  Result := FType;
end;

function TJSONSchema.GetTypeStored: Boolean;
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

function AdditionalItems.GetSchema: Blue.Print.Open.API.Schema.v20.TJSONSchema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v20.TJSONSchema.Create;

  Result := FSchema;
end;

function AdditionalItems.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

{ DependenciesAdditionalProperties }

destructor DependenciesAdditionalProperties.Destroy;
begin
  FSchema.Free;

  inherited;
end;

function DependenciesAdditionalProperties.GetSchema: Blue.Print.Open.API.Schema.v20.TJSONSchema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v20.TJSONSchema.Create;

  Result := FSchema;
end;

function DependenciesAdditionalProperties.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function DependenciesAdditionalProperties.GetStringArrayStored: Boolean;
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

function AdditionalProperties.GetSchema: Blue.Print.Open.API.Schema.v20.TJSONSchema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v20.TJSONSchema.Create;

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

function Items.GetSchema: Blue.Print.Open.API.Schema.v20.TJSONSchema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v20.TJSONSchema.Create;

  Result := FSchema;
end;

function Items.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function Items.AddSchemaArray: Blue.Print.Open.API.Schema.v20.TJSONSchema;
begin
  Result := Blue.Print.Open.API.Schema.v20.TJSONSchema.Create;

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

function TOpenAPIDefinition.GetConsumes: Blue.Print.Open.API.Schema.v20.Consumes;
begin
  if not Assigned(FConsumes) then
    FConsumes := Blue.Print.Open.API.Schema.v20.Consumes.Create;

  Result := FConsumes;
end;

function TOpenAPIDefinition.GetConsumesStored: Boolean;
begin
  Result := Assigned(FConsumes);
end;

function TOpenAPIDefinition.GetPaths: TMap<System.String, any>;
begin
  if not Assigned(FPaths) then
    FPaths := TMap<System.String, any>.Create;

  Result := FPaths;
end;

function TOpenAPIDefinition.GetResponses: TMap<System.String, any>;
begin
  if not Assigned(FResponses) then
    FResponses := TMap<System.String, any>.Create;

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

function TOpenAPIDefinition.GetProduces: Blue.Print.Open.API.Schema.v20.Produces;
begin
  if not Assigned(FProduces) then
    FProduces := Blue.Print.Open.API.Schema.v20.Produces.Create;

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

function TOpenAPIDefinition.GetSecurityDefinitions: TMap<System.String, Blue.Print.Open.API.Schema.v20.SecurityDefinitionsAdditionalProperties>;
begin
  if not Assigned(FSecurityDefinitions) then
    FSecurityDefinitions := TMap<System.String, Blue.Print.Open.API.Schema.v20.SecurityDefinitionsAdditionalProperties>.Create;

  Result := FSecurityDefinitions;
end;

function TOpenAPIDefinition.GetSecurityDefinitionsStored: Boolean;
begin
  Result := Assigned(FSecurityDefinitions);
end;

{ Response }

destructor Response.Destroy;
begin
  FHeaders.Free;

  FExamples.Free;

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

function Response.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function Response.GetExamples: TMap<System.String, any>;
begin
  if not Assigned(FExamples) then
    FExamples := TMap<System.String, any>.Create;

  Result := FExamples;
end;

function Response.GetExamplesStored: Boolean;
begin
  Result := Assigned(FExamples);
end;

{ Header }

destructor Header.Destroy;
begin
  FItems.Free;

  FMinLength.Free;

  FMinItems.Free;

  FType.Free;

  inherited;
end;

procedure Header.SetExclusiveMaximum(const Value: System.Boolean);
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

procedure Header.SetExclusiveMinimum(const Value: System.Boolean);
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

procedure Header.SetUniqueItems(const Value: System.Boolean);
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

function Header.GetItems: Blue.Print.Open.API.Schema.v20.Items;
begin
  if not Assigned(FItems) then
    FItems := Blue.Print.Open.API.Schema.v20.Items.Create;

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

function Header.GetType: Blue.Print.Open.API.Schema.v20.&Type;
begin
  if not Assigned(FType) then
    FType := Blue.Print.Open.API.Schema.v20.&Type.Create;

  Result := FType;
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

  inherited;
end;

function Operation.GetTagsStored: Boolean;
begin
  Result := Assigned(FTags);
end;

function Operation.GetConsumes: Blue.Print.Open.API.Schema.v20.Consumes;
begin
  if not Assigned(FConsumes) then
    FConsumes := Blue.Print.Open.API.Schema.v20.Consumes.Create;

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

function Operation.GetResponses: TMap<System.String, any>;
begin
  if not Assigned(FResponses) then
    FResponses := TMap<System.String, any>.Create;

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

function Operation.GetProduces: Blue.Print.Open.API.Schema.v20.Produces;
begin
  if not Assigned(FProduces) then
    FProduces := Blue.Print.Open.API.Schema.v20.Produces.Create;

  Result := FProduces;
end;

function Operation.GetProducesStored: Boolean;
begin
  Result := Assigned(FProduces);
end;

{ Consumes }

function Consumes.GetMediaTypeListStored: Boolean;
begin
  Result := Assigned(FMediaTypeList);
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

{ BodyParameter }

destructor BodyParameter.Destroy;
begin
  FSchema.Free;

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

  inherited;
end;

function Schema.GetExampleStored: Boolean;
begin
  Result := False;
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

function Schema.GetFormatStored: Boolean;
begin
  Result := not FFormat.IsEmpty;
end;

procedure Schema.SetExclusiveMinimum(const Value: System.Boolean);
begin
  FExclusiveMinimum := Value;
  FExclusiveMinimumIsStored := True;
end;

function Schema.GetAdditionalProperties: Blue.Print.Open.API.Schema.v20.AdditionalProperties;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := Blue.Print.Open.API.Schema.v20.AdditionalProperties.Create;

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

procedure Schema.SetUniqueItems(const Value: System.Boolean);
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

function Schema.GetItems: Blue.Print.Open.API.Schema.v20.Items;
begin
  if not Assigned(FItems) then
    FItems := Blue.Print.Open.API.Schema.v20.Items.Create;

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

function Schema.GetType: Blue.Print.Open.API.Schema.v20.&Type;
begin
  if not Assigned(FType) then
    FType := Blue.Print.Open.API.Schema.v20.&Type.Create;

  Result := FType;
end;

function Schema.GetTypeStored: Boolean;
begin
  Result := Assigned(FType);
end;

{ Xml }

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

{ ExternalDocs }

function ExternalDocs.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

{ Produces }

function Produces.GetMediaTypeListStored: Boolean;
begin
  Result := Assigned(FMediaTypeList);
end;

{ Info }

destructor Info.Destroy;
begin
  FLicense.Free;

  FContact.Free;

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

{ License }

function License.GetUrlStored: Boolean;
begin
  Result := not FUrl.IsEmpty;
end;

{ Contact }

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

{ FileSchema }

destructor FileSchema.Destroy;
begin
  FExternalDocs.Free;

  FType.Free;

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

function FileSchema.GetType: Blue.Print.Open.API.Schema.v20.&Type;
begin
  if not Assigned(FType) then
    FType := Blue.Print.Open.API.Schema.v20.&Type.Create;

  Result := FType;
end;

function FileSchema.GetExampleStored: Boolean;
begin
  Result := False;
end;

{ Oauth2PasswordSecurity }

destructor Oauth2PasswordSecurity.Destroy;
begin
  FScopes.Free;

  FType.Free;

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

function Oauth2PasswordSecurity.GetType: Blue.Print.Open.API.Schema.v20.&Type;
begin
  if not Assigned(FType) then
    FType := Blue.Print.Open.API.Schema.v20.&Type.Create;

  Result := FType;
end;

{ Oauth2AccessCodeSecurity }

destructor Oauth2AccessCodeSecurity.Destroy;
begin
  FScopes.Free;

  FType.Free;

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

function Oauth2AccessCodeSecurity.GetType: Blue.Print.Open.API.Schema.v20.&Type;
begin
  if not Assigned(FType) then
    FType := Blue.Print.Open.API.Schema.v20.&Type.Create;

  Result := FType;
end;

{ BasicAuthenticationSecurity }

destructor BasicAuthenticationSecurity.Destroy;
begin
  FType.Free;

  inherited;
end;

function BasicAuthenticationSecurity.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function BasicAuthenticationSecurity.GetType: Blue.Print.Open.API.Schema.v20.&Type;
begin
  if not Assigned(FType) then
    FType := Blue.Print.Open.API.Schema.v20.&Type.Create;

  Result := FType;
end;

{ ApiKeySecurity }

destructor ApiKeySecurity.Destroy;
begin
  FType.Free;

  inherited;
end;

function ApiKeySecurity.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function ApiKeySecurity.GetType: Blue.Print.Open.API.Schema.v20.&Type;
begin
  if not Assigned(FType) then
    FType := Blue.Print.Open.API.Schema.v20.&Type.Create;

  Result := FType;
end;

{ PrimitivesItems }

destructor PrimitivesItems.Destroy;
begin
  FItems.Free;

  FMinLength.Free;

  FMinItems.Free;

  FType.Free;

  inherited;
end;

procedure PrimitivesItems.SetExclusiveMaximum(const Value: System.Boolean);
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

procedure PrimitivesItems.SetExclusiveMinimum(const Value: System.Boolean);
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

procedure PrimitivesItems.SetUniqueItems(const Value: System.Boolean);
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

function PrimitivesItems.GetItems: Blue.Print.Open.API.Schema.v20.Items;
begin
  if not Assigned(FItems) then
    FItems := Blue.Print.Open.API.Schema.v20.Items.Create;

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

function PrimitivesItems.GetType: Blue.Print.Open.API.Schema.v20.&Type;
begin
  if not Assigned(FType) then
    FType := Blue.Print.Open.API.Schema.v20.&Type.Create;

  Result := FType;
end;

function PrimitivesItems.GetTypeStored: Boolean;
begin
  Result := Assigned(FType);
end;

{ Oauth2ApplicationSecurity }

destructor Oauth2ApplicationSecurity.Destroy;
begin
  FScopes.Free;

  FType.Free;

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

function Oauth2ApplicationSecurity.GetType: Blue.Print.Open.API.Schema.v20.&Type;
begin
  if not Assigned(FType) then
    FType := Blue.Print.Open.API.Schema.v20.&Type.Create;

  Result := FType;
end;

{ SecurityDefinitionsAdditionalProperties }

destructor SecurityDefinitionsAdditionalProperties.Destroy;
begin
  FBasicAuthenticationSecurity.Free;

  FApiKeySecurity.Free;

  FOauth2ImplicitSecurity.Free;

  FOauth2PasswordSecurity.Free;

  FOauth2ApplicationSecurity.Free;

  FOauth2AccessCodeSecurity.Free;

  inherited;
end;

function SecurityDefinitionsAdditionalProperties.GetBasicAuthenticationSecurity: Blue.Print.Open.API.Schema.v20.BasicAuthenticationSecurity;
begin
  if not Assigned(FBasicAuthenticationSecurity) then
    FBasicAuthenticationSecurity := Blue.Print.Open.API.Schema.v20.BasicAuthenticationSecurity.Create;

  Result := FBasicAuthenticationSecurity;
end;

function SecurityDefinitionsAdditionalProperties.GetBasicAuthenticationSecurityStored: Boolean;
begin
  Result := Assigned(FBasicAuthenticationSecurity);
end;

function SecurityDefinitionsAdditionalProperties.GetApiKeySecurity: Blue.Print.Open.API.Schema.v20.ApiKeySecurity;
begin
  if not Assigned(FApiKeySecurity) then
    FApiKeySecurity := Blue.Print.Open.API.Schema.v20.ApiKeySecurity.Create;

  Result := FApiKeySecurity;
end;

function SecurityDefinitionsAdditionalProperties.GetApiKeySecurityStored: Boolean;
begin
  Result := Assigned(FApiKeySecurity);
end;

function SecurityDefinitionsAdditionalProperties.GetOauth2ImplicitSecurity: Blue.Print.Open.API.Schema.v20.Oauth2ImplicitSecurity;
begin
  if not Assigned(FOauth2ImplicitSecurity) then
    FOauth2ImplicitSecurity := Blue.Print.Open.API.Schema.v20.Oauth2ImplicitSecurity.Create;

  Result := FOauth2ImplicitSecurity;
end;

function SecurityDefinitionsAdditionalProperties.GetOauth2ImplicitSecurityStored: Boolean;
begin
  Result := Assigned(FOauth2ImplicitSecurity);
end;

function SecurityDefinitionsAdditionalProperties.GetOauth2PasswordSecurity: Blue.Print.Open.API.Schema.v20.Oauth2PasswordSecurity;
begin
  if not Assigned(FOauth2PasswordSecurity) then
    FOauth2PasswordSecurity := Blue.Print.Open.API.Schema.v20.Oauth2PasswordSecurity.Create;

  Result := FOauth2PasswordSecurity;
end;

function SecurityDefinitionsAdditionalProperties.GetOauth2PasswordSecurityStored: Boolean;
begin
  Result := Assigned(FOauth2PasswordSecurity);
end;

function SecurityDefinitionsAdditionalProperties.GetOauth2ApplicationSecurity: Blue.Print.Open.API.Schema.v20.Oauth2ApplicationSecurity;
begin
  if not Assigned(FOauth2ApplicationSecurity) then
    FOauth2ApplicationSecurity := Blue.Print.Open.API.Schema.v20.Oauth2ApplicationSecurity.Create;

  Result := FOauth2ApplicationSecurity;
end;

function SecurityDefinitionsAdditionalProperties.GetOauth2ApplicationSecurityStored: Boolean;
begin
  Result := Assigned(FOauth2ApplicationSecurity);
end;

function SecurityDefinitionsAdditionalProperties.GetOauth2AccessCodeSecurity: Blue.Print.Open.API.Schema.v20.Oauth2AccessCodeSecurity;
begin
  if not Assigned(FOauth2AccessCodeSecurity) then
    FOauth2AccessCodeSecurity := Blue.Print.Open.API.Schema.v20.Oauth2AccessCodeSecurity.Create;

  Result := FOauth2AccessCodeSecurity;
end;

function SecurityDefinitionsAdditionalProperties.GetOauth2AccessCodeSecurityStored: Boolean;
begin
  Result := Assigned(FOauth2AccessCodeSecurity);
end;

{ Oauth2ImplicitSecurity }

destructor Oauth2ImplicitSecurity.Destroy;
begin
  FScopes.Free;

  FType.Free;

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

function Oauth2ImplicitSecurity.GetType: Blue.Print.Open.API.Schema.v20.&Type;
begin
  if not Assigned(FType) then
    FType := Blue.Print.Open.API.Schema.v20.&Type.Create;

  Result := FType;
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

{ Tag }

destructor Tag.Destroy;
begin
  FExternalDocs.Free;

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

end.
