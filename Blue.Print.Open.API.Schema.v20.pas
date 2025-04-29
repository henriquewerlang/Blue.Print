unit Blue.Print.Open.API.Schema.v20;

interface

{$M+}
{$SCOPEDENUMS ON}

// File generated from http://json-schema.org/draft-04/schema#, Open API 2.0.json;

uses Blue.Print.Types, System.Rtti;

type
  // Enumerations declaration
  [EnumValue('array, boolean, integer, null, number, object, string')]
  simpleTypes = (Array, Boolean, Integer, Null, Number, Object, String);
  // Forward class declaration
  TSchema = class;
  PositiveIntegerDefault0 = class;
  Properties = class;
  AdditionalItems = class;
  PatternProperties = class;
  Dependencies = class;
  AdditionalProperties = class;
  Definitions = class;
  Items = class;
  Type = class;
  TSchemaOpenAPI20 = class;
  JsonReference = class;
  ResponseDefinitions = class;
  SecurityRequirement = class;
  Operation = class;
  Consumes = class;
  Responses = class;
  ParametersList = class;
  Parameter = class;
  BodyParameter = class;
  Schema = class;
  Xml = class;
  ExternalDocs = class;
  NonBodyParameter = class;
  Produces = class;
  Oauth2Scopes = class;
  Info = class;
  License = class;
  Contact = class;
  FileSchema = class;
  Oauth2PasswordSecurity = class;
  Oauth2AccessCodeSecurity = class;
  BasicAuthenticationSecurity = class;
  Paths = class;
  ApiKeySecurity = class;
  PrimitivesItems = class;
  Oauth2ApplicationSecurity = class;
  SecurityDefinitions = class;
  Oauth2ImplicitSecurity = class;
  Header = class;
  ResponseValue = class;
  Response = class;
  Headers = class;
  Examples = class;
  ParameterDefinitions = class;
  PathItem = class;
  Tag = class;

  // Forward type alias
  schemaArray = TArray<TSchema>;
  positiveInteger = System.Integer;
  stringArray = TArray<System.String>;
  any = TValue;
  exclusiveMaximum = System.Boolean;
  exclusiveMinimum = System.Boolean;
  formDataParameterSubSchema = TValue;
  maxLength = System.Integer;
  enum = TArray<any>;
  collectionFormat = System.String;
  mediaTypeList = TArray<System.String>;
  pattern = System.String;
  default = TValue;
  title = System.String;
  schemesList = TArray<System.String>;
  collectionFormatWithMulti = System.String;
  multipleOf = System.Double;
  minimum = System.Double;
  headerParameterSubSchema = TValue;
  mimeType = System.String;
  queryParameterSubSchema = TValue;
  security = TArray<SecurityRequirement>;
  vendorExtension = TValue;
  maxItems = System.Integer;
  uniqueItems = System.Boolean;
  description = System.String;
  pathParameterSubSchema = TValue;
  maximum = System.Double;

  TSchema = class
  private
    FAnyOf: schemaArray;
    FExclusiveMaximum: System.Boolean;
    FFormat: System.String;
    FExclusiveMinimum: System.Boolean;
    FAllOf: schemaArray;
    FSchema: System.String;
    FProperties: Properties;
    FNot: TSchema;
    FMaxLength: positiveInteger;
    FEnum: TArray<any>;
    FAdditionalItems: AdditionalItems;
    FId: System.String;
    FPattern: System.String;
    FDefault: any;
    FMinProperties: PositiveIntegerDefault0;
    FMinLength: PositiveIntegerDefault0;
    FTitle: System.String;
    FMultipleOf: System.Double;
    FPatternProperties: PatternProperties;
    FOneOf: schemaArray;
    FMinimum: System.Double;
    FDependencies: Dependencies;
    FAdditionalProperties: AdditionalProperties;
    FDefinitions: Definitions;
    FMaxProperties: positiveInteger;
    FMaxItems: positiveInteger;
    FUniqueItems: System.Boolean;
    FDescription: System.String;
    FMaximum: System.Double;
    FItems: Items;
    FMinItems: PositiveIntegerDefault0;
    FRequired: stringArray;
    FType: Type;
    function GetProperties: Properties;
    function GetNot: TSchema;
    function GetAdditionalItems: AdditionalItems;
    function GetMinProperties: PositiveIntegerDefault0;
    function GetMinLength: PositiveIntegerDefault0;
    function GetPatternProperties: PatternProperties;
    function GetDependencies: Dependencies;
    function GetAdditionalProperties: AdditionalProperties;
    function GetDefinitions: Definitions;
    function GetItems: Items;
    function GetMinItems: PositiveIntegerDefault0;
    function GetType: Type;
    function GetAnyOfStored: Boolean;
    function GetExclusiveMaximumStored: Boolean;
    function GetFormatStored: Boolean;
    function GetExclusiveMinimumStored: Boolean;
    function GetAllOfStored: Boolean;
    function GetSchemaStored: Boolean;
    function GetPropertiesStored: Boolean;
    function GetNotStored: Boolean;
    function GetMaxLengthStored: Boolean;
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
    function GetUniqueItemsStored: Boolean;
    function GetDescriptionStored: Boolean;
    function GetMaximumStored: Boolean;
    function GetItemsStored: Boolean;
    function GetMinItemsStored: Boolean;
    function GetRequiredStored: Boolean;
    function GetTypeStored: Boolean;
  public
    destructor Destroy; override;

    property IsAnyOfStored: Boolean read GetAnyOfStored;
    property IsExclusiveMaximumStored: Boolean read GetExclusiveMaximumStored;
    property IsFormatStored: Boolean read GetFormatStored;
    property IsExclusiveMinimumStored: Boolean read GetExclusiveMinimumStored;
    property IsAllOfStored: Boolean read GetAllOfStored;
    property IsSchemaStored: Boolean read GetSchemaStored;
    property IsPropertiesStored: Boolean read GetPropertiesStored;
    property IsNotStored: Boolean read GetNotStored;
    property IsMaxLengthStored: Boolean read GetMaxLengthStored;
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
    property IsUniqueItemsStored: Boolean read GetUniqueItemsStored;
    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsMaximumStored: Boolean read GetMaximumStored;
    property IsItemsStored: Boolean read GetItemsStored;
    property IsMinItemsStored: Boolean read GetMinItemsStored;
    property IsRequiredStored: Boolean read GetRequiredStored;
    property IsTypeStored: Boolean read GetTypeStored;
  published
    property anyOf: schemaArray read FAnyOf write FAnyOf stored GetAnyOfStored;
    property exclusiveMaximum: System.Boolean read FExclusiveMaximum write FExclusiveMaximum stored GetExclusiveMaximumStored;
    property format: System.String read FFormat write FFormat stored GetFormatStored;
    property exclusiveMinimum: System.Boolean read FExclusiveMinimum write FExclusiveMinimum stored GetExclusiveMinimumStored;
    property allOf: schemaArray read FAllOf write FAllOf stored GetAllOfStored;
    [FieldName('$schema')]
    property schema: System.String read FSchema write FSchema stored GetSchemaStored;
    property properties: Properties read GetProperties write FProperties stored GetPropertiesStored;
    property not: TSchema read GetNot write FNot stored GetNotStored;
    property maxLength: positiveInteger read FMaxLength write FMaxLength stored GetMaxLengthStored;
    property enum: TArray<any> read FEnum write FEnum;
    property additionalItems: AdditionalItems read GetAdditionalItems write FAdditionalItems stored GetAdditionalItemsStored;
    property id: System.String read FId write FId stored GetIdStored;
    property pattern: System.String read FPattern write FPattern stored GetPatternStored;
    property default: any read FDefault write FDefault stored GetDefaultStored;
    property minProperties: PositiveIntegerDefault0 read GetMinProperties write FMinProperties stored GetMinPropertiesStored;
    property minLength: PositiveIntegerDefault0 read GetMinLength write FMinLength stored GetMinLengthStored;
    property title: System.String read FTitle write FTitle stored GetTitleStored;
    property multipleOf: System.Double read FMultipleOf write FMultipleOf stored GetMultipleOfStored;
    property patternProperties: PatternProperties read GetPatternProperties write FPatternProperties stored GetPatternPropertiesStored;
    property oneOf: schemaArray read FOneOf write FOneOf stored GetOneOfStored;
    property minimum: System.Double read FMinimum write FMinimum stored GetMinimumStored;
    property dependencies: Dependencies read GetDependencies write FDependencies stored GetDependenciesStored;
    property additionalProperties: AdditionalProperties read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
    property definitions: Definitions read GetDefinitions write FDefinitions stored GetDefinitionsStored;
    property maxProperties: positiveInteger read FMaxProperties write FMaxProperties stored GetMaxPropertiesStored;
    property maxItems: positiveInteger read FMaxItems write FMaxItems stored GetMaxItemsStored;
    property uniqueItems: System.Boolean read FUniqueItems write FUniqueItems stored GetUniqueItemsStored;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property maximum: System.Double read FMaximum write FMaximum stored GetMaximumStored;
    property items: Items read GetItems write FItems stored GetItemsStored;
    property minItems: PositiveIntegerDefault0 read GetMinItems write FMinItems stored GetMinItemsStored;
    property required: stringArray read FRequired write FRequired stored GetRequiredStored;
    [FieldName('type')]
    property &type: Type read GetType write FType stored GetTypeStored;
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

  Properties = class
  end;

  [SingleObject]
  AdditionalItems = class
  private
    FBoolean: System.Boolean;
    FSchema: TSchema;
    function GetSchema: TSchema;
    function GetBooleanStored: Boolean;
    function GetSchemaStored: Boolean;
  public
    destructor Destroy; override;

    property IsBooleanStored: Boolean read GetBooleanStored;
    property IsSchemaStored: Boolean read GetSchemaStored;
  published
    property boolean: System.Boolean read FBoolean write FBoolean stored GetBooleanStored;
    property Schema: TSchema read GetSchema write FSchema stored GetSchemaStored;
  end;

  PatternProperties = class
  end;

  Dependencies = class
  end;

  [SingleObject]
  AdditionalProperties = class
  private
    FBoolean: System.Boolean;
    FSchema: TSchema;
    function GetSchema: TSchema;
    function GetBooleanStored: Boolean;
    function GetSchemaStored: Boolean;
  public
    destructor Destroy; override;

    property IsBooleanStored: Boolean read GetBooleanStored;
    property IsSchemaStored: Boolean read GetSchemaStored;
  published
    property boolean: System.Boolean read FBoolean write FBoolean stored GetBooleanStored;
    property Schema: TSchema read GetSchema write FSchema stored GetSchemaStored;
  end;

  Definitions = class
  end;

  [SingleObject]
  Items = class
  private
    FSchema: TSchema;
    FSchemaArray: schemaArray;
    function GetSchema: TSchema;
    function GetSchemaStored: Boolean;
    function GetSchemaArrayStored: Boolean;
  public
    destructor Destroy; override;

    property IsSchemaStored: Boolean read GetSchemaStored;
    property IsSchemaArrayStored: Boolean read GetSchemaArrayStored;
  published
    property Schema: TSchema read GetSchema write FSchema stored GetSchemaStored;
    property schemaArray: schemaArray read FSchemaArray write FSchemaArray stored GetSchemaArrayStored;
  end;

  [SingleObject]
  Type = class
  private
    FSimpleTypes: simpleTypes;
    FArray: TArray<simpleTypes>;
    function GetSimpleTypesStored: Boolean;
  public
    property IsSimpleTypesStored: Boolean read GetSimpleTypesStored;
  published
    property simpleTypes: simpleTypes read FSimpleTypes write FSimpleTypes stored GetSimpleTypesStored;
    property array: TArray<simpleTypes> read FArray write FArray;
  end;

  TSchemaOpenAPI20 = class
  private
    FExternalDocs: ExternalDocs;
    FTags: TArray<Tag>;
    FBasePath: System.String;
    FSwagger: System.String;
    FConsumes: Consumes;
    FPaths: Paths;
    FResponses: Responses;
    FInfo: Info;
    FSchemes: schemesList;
    FSecurity: security;
    FParameters: ParameterDefinitions;
    FDefinitions: Definitions;
    FProduces: Produces;
    FHost: System.String;
    FSecurityDefinitions: SecurityDefinitions;
    function GetExternalDocs: ExternalDocs;
    function GetConsumes: Consumes;
    function GetPaths: Paths;
    function GetResponses: Responses;
    function GetInfo: Info;
    function GetParameters: ParameterDefinitions;
    function GetDefinitions: Definitions;
    function GetProduces: Produces;
    function GetSecurityDefinitions: SecurityDefinitions;
    function GetExternalDocsStored: Boolean;
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

    function AddTags: Tag;

    property IsExternalDocsStored: Boolean read GetExternalDocsStored;
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
    property externalDocs: ExternalDocs read GetExternalDocs write FExternalDocs stored GetExternalDocsStored;
    property tags: TArray<Tag> read FTags write FTags;
    property basePath: System.String read FBasePath write FBasePath stored GetBasePathStored;
    property swagger: System.String read FSwagger write FSwagger;
    property consumes: Consumes read GetConsumes write FConsumes stored GetConsumesStored;
    property paths: Paths read GetPaths write FPaths;
    property responses: Responses read GetResponses write FResponses stored GetResponsesStored;
    property info: Info read GetInfo write FInfo;
    property schemes: schemesList read FSchemes write FSchemes stored GetSchemesStored;
    property security: security read FSecurity write FSecurity stored GetSecurityStored;
    property parameters: ParameterDefinitions read GetParameters write FParameters stored GetParametersStored;
    property definitions: Definitions read GetDefinitions write FDefinitions stored GetDefinitionsStored;
    property produces: Produces read GetProduces write FProduces stored GetProducesStored;
    property host: System.String read FHost write FHost stored GetHostStored;
    property securityDefinitions: SecurityDefinitions read GetSecurityDefinitions write FSecurityDefinitions stored GetSecurityDefinitionsStored;
  end;

  JsonReference = class
  private
    FRef: System.String;
  published
    [FieldName('$ref')]
    property ref: System.String read FRef write FRef;
  end;

  ResponseDefinitions = class
  end;

  SecurityRequirement = class
  end;

  Operation = class
  private
    FTags: TArray<System.String>;
    FConsumes: Consumes;
    FDescription: System.String;
    FResponses: Responses;
    FSummary: System.String;
    FSchemes: TArray<System.String>;
    FDeprecated: System.Boolean;
    FOperationId: System.String;
    FSecurity: TArray<SecurityRequirement>;
    FParameters: TArray<ParametersList>;
    FExternalDocs: ExternalDocs;
    FProduces: Produces;
    function GetConsumes: Consumes;
    function GetResponses: Responses;
    function GetExternalDocs: ExternalDocs;
    function GetProduces: Produces;
    function GetConsumesStored: Boolean;
    function GetDescriptionStored: Boolean;
    function GetSummaryStored: Boolean;
    function GetDeprecatedStored: Boolean;
    function GetOperationIdStored: Boolean;
    function GetExternalDocsStored: Boolean;
    function GetProducesStored: Boolean;
  public
    destructor Destroy; override;

    function AddSecurity: SecurityRequirement;
    function AddParameters: ParametersList;

    property IsConsumesStored: Boolean read GetConsumesStored;
    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsSummaryStored: Boolean read GetSummaryStored;
    property IsDeprecatedStored: Boolean read GetDeprecatedStored;
    property IsOperationIdStored: Boolean read GetOperationIdStored;
    property IsExternalDocsStored: Boolean read GetExternalDocsStored;
    property IsProducesStored: Boolean read GetProducesStored;
  published
    property tags: TArray<System.String> read FTags write FTags;
    property consumes: Consumes read GetConsumes write FConsumes stored GetConsumesStored;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property responses: Responses read GetResponses write FResponses;
    property summary: System.String read FSummary write FSummary stored GetSummaryStored;
    property schemes: TArray<System.String> read FSchemes write FSchemes;
    property deprecated: System.Boolean read FDeprecated write FDeprecated stored GetDeprecatedStored;
    property operationId: System.String read FOperationId write FOperationId stored GetOperationIdStored;
    property security: TArray<SecurityRequirement> read FSecurity write FSecurity;
    property parameters: TArray<ParametersList> read FParameters write FParameters;
    property externalDocs: ExternalDocs read GetExternalDocs write FExternalDocs stored GetExternalDocsStored;
    property produces: Produces read GetProduces write FProduces stored GetProducesStored;
  end;

  [SingleObject]
  Consumes = class
  private
    FMediaTypeList: TArray<System.String>;
  published
    property mediaTypeList: TArray<System.String> read FMediaTypeList write FMediaTypeList;
  end;

  Responses = class
  end;

  [SingleObject]
  ParametersList = class
  private
    FParameter: Parameter;
    FJsonReference: JsonReference;
    function GetParameter: Parameter;
    function GetJsonReference: JsonReference;
    function GetParameterStored: Boolean;
    function GetJsonReferenceStored: Boolean;
  public
    destructor Destroy; override;

    property IsParameterStored: Boolean read GetParameterStored;
    property IsJsonReferenceStored: Boolean read GetJsonReferenceStored;
  published
    property parameter: Parameter read GetParameter write FParameter stored GetParameterStored;
    property jsonReference: JsonReference read GetJsonReference write FJsonReference stored GetJsonReferenceStored;
  end;

  [SingleObject]
  Parameter = class
  private
    FBodyParameter: BodyParameter;
    FNonBodyParameter: NonBodyParameter;
    function GetBodyParameter: BodyParameter;
    function GetNonBodyParameter: NonBodyParameter;
    function GetBodyParameterStored: Boolean;
    function GetNonBodyParameterStored: Boolean;
  public
    destructor Destroy; override;

    property IsBodyParameterStored: Boolean read GetBodyParameterStored;
    property IsNonBodyParameterStored: Boolean read GetNonBodyParameterStored;
  published
    property bodyParameter: BodyParameter read GetBodyParameter write FBodyParameter stored GetBodyParameterStored;
    property nonBodyParameter: NonBodyParameter read GetNonBodyParameter write FNonBodyParameter stored GetNonBodyParameterStored;
  end;

  BodyParameter = class
  private
    FName: System.String;
    FIn: System.String;
    FDescription: System.String;
    FRequired: System.Boolean;
    FSchema: Schema;
    function GetSchema: Schema;
    function GetDescriptionStored: Boolean;
    function GetRequiredStored: Boolean;
  public
    destructor Destroy; override;

    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsRequiredStored: Boolean read GetRequiredStored;
  published
    property name: System.String read FName write FName;
    property in: System.String read FIn write FIn;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property required: System.Boolean read FRequired write FRequired stored GetRequiredStored;
    property schema: Schema read GetSchema write FSchema;
  end;

  Schema = class
  private
    FExample: any;
    FExclusiveMaximum: exclusiveMaximum;
    FMinimum: System.Double;
    FFormat: System.String;
    FExclusiveMinimum: System.Boolean;
    FAdditionalProperties: AdditionalProperties;
    FAllOf: TArray<Schema>;
    FProperties: Properties;
    FDiscriminator: System.String;
    FMaxLength: positiveInteger;
    FEnum: TArray<any>;
    FRef: System.String;
    FMaxProperties: positiveInteger;
    FXml: Xml;
    FMaxItems: positiveInteger;
    FUniqueItems: System.Boolean;
    FDescription: System.String;
    FMaximum: System.Double;
    FDefault: any;
    FPattern: System.String;
    FMinProperties: PositiveIntegerDefault0;
    FMinLength: PositiveIntegerDefault0;
    FItems: Items;
    FTitle: System.String;
    FReadOnly: System.Boolean;
    FMinItems: PositiveIntegerDefault0;
    FExternalDocs: ExternalDocs;
    FMultipleOf: System.Double;
    FRequired: stringArray;
    FType: Type;
    function GetAdditionalProperties: AdditionalProperties;
    function GetProperties: Properties;
    function GetXml: Xml;
    function GetMinProperties: PositiveIntegerDefault0;
    function GetMinLength: PositiveIntegerDefault0;
    function GetItems: Items;
    function GetMinItems: PositiveIntegerDefault0;
    function GetExternalDocs: ExternalDocs;
    function GetType: Type;
    function GetExampleStored: Boolean;
    function GetExclusiveMaximumStored: Boolean;
    function GetMinimumStored: Boolean;
    function GetFormatStored: Boolean;
    function GetExclusiveMinimumStored: Boolean;
    function GetAdditionalPropertiesStored: Boolean;
    function GetPropertiesStored: Boolean;
    function GetDiscriminatorStored: Boolean;
    function GetMaxLengthStored: Boolean;
    function GetRefStored: Boolean;
    function GetMaxPropertiesStored: Boolean;
    function GetXmlStored: Boolean;
    function GetMaxItemsStored: Boolean;
    function GetUniqueItemsStored: Boolean;
    function GetDescriptionStored: Boolean;
    function GetMaximumStored: Boolean;
    function GetDefaultStored: Boolean;
    function GetPatternStored: Boolean;
    function GetMinPropertiesStored: Boolean;
    function GetMinLengthStored: Boolean;
    function GetItemsStored: Boolean;
    function GetTitleStored: Boolean;
    function GetReadOnlyStored: Boolean;
    function GetMinItemsStored: Boolean;
    function GetExternalDocsStored: Boolean;
    function GetMultipleOfStored: Boolean;
    function GetRequiredStored: Boolean;
    function GetTypeStored: Boolean;
  public
    destructor Destroy; override;

    function AddAllOf: Schema;

    property IsExampleStored: Boolean read GetExampleStored;
    property IsExclusiveMaximumStored: Boolean read GetExclusiveMaximumStored;
    property IsMinimumStored: Boolean read GetMinimumStored;
    property IsFormatStored: Boolean read GetFormatStored;
    property IsExclusiveMinimumStored: Boolean read GetExclusiveMinimumStored;
    property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
    property IsPropertiesStored: Boolean read GetPropertiesStored;
    property IsDiscriminatorStored: Boolean read GetDiscriminatorStored;
    property IsMaxLengthStored: Boolean read GetMaxLengthStored;
    property IsRefStored: Boolean read GetRefStored;
    property IsMaxPropertiesStored: Boolean read GetMaxPropertiesStored;
    property IsXmlStored: Boolean read GetXmlStored;
    property IsMaxItemsStored: Boolean read GetMaxItemsStored;
    property IsUniqueItemsStored: Boolean read GetUniqueItemsStored;
    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsMaximumStored: Boolean read GetMaximumStored;
    property IsDefaultStored: Boolean read GetDefaultStored;
    property IsPatternStored: Boolean read GetPatternStored;
    property IsMinPropertiesStored: Boolean read GetMinPropertiesStored;
    property IsMinLengthStored: Boolean read GetMinLengthStored;
    property IsItemsStored: Boolean read GetItemsStored;
    property IsTitleStored: Boolean read GetTitleStored;
    property IsReadOnlyStored: Boolean read GetReadOnlyStored;
    property IsMinItemsStored: Boolean read GetMinItemsStored;
    property IsExternalDocsStored: Boolean read GetExternalDocsStored;
    property IsMultipleOfStored: Boolean read GetMultipleOfStored;
    property IsRequiredStored: Boolean read GetRequiredStored;
    property IsTypeStored: Boolean read GetTypeStored;
  published
    property example: any read FExample write FExample stored GetExampleStored;
    property exclusiveMaximum: exclusiveMaximum read FExclusiveMaximum write FExclusiveMaximum stored GetExclusiveMaximumStored;
    property minimum: System.Double read FMinimum write FMinimum stored GetMinimumStored;
    property format: System.String read FFormat write FFormat stored GetFormatStored;
    property exclusiveMinimum: System.Boolean read FExclusiveMinimum write FExclusiveMinimum stored GetExclusiveMinimumStored;
    property additionalProperties: AdditionalProperties read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
    property allOf: TArray<Schema> read FAllOf write FAllOf;
    property properties: Properties read GetProperties write FProperties stored GetPropertiesStored;
    property discriminator: System.String read FDiscriminator write FDiscriminator stored GetDiscriminatorStored;
    property maxLength: positiveInteger read FMaxLength write FMaxLength stored GetMaxLengthStored;
    property enum: TArray<any> read FEnum write FEnum;
    [FieldName('$ref')]
    property ref: System.String read FRef write FRef stored GetRefStored;
    property maxProperties: positiveInteger read FMaxProperties write FMaxProperties stored GetMaxPropertiesStored;
    property xml: Xml read GetXml write FXml stored GetXmlStored;
    property maxItems: positiveInteger read FMaxItems write FMaxItems stored GetMaxItemsStored;
    property uniqueItems: System.Boolean read FUniqueItems write FUniqueItems stored GetUniqueItemsStored;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property maximum: System.Double read FMaximum write FMaximum stored GetMaximumStored;
    property default: any read FDefault write FDefault stored GetDefaultStored;
    property pattern: System.String read FPattern write FPattern stored GetPatternStored;
    property minProperties: PositiveIntegerDefault0 read GetMinProperties write FMinProperties stored GetMinPropertiesStored;
    property minLength: PositiveIntegerDefault0 read GetMinLength write FMinLength stored GetMinLengthStored;
    property items: Items read GetItems write FItems stored GetItemsStored;
    property title: System.String read FTitle write FTitle stored GetTitleStored;
    property readOnly: System.Boolean read FReadOnly write FReadOnly stored GetReadOnlyStored;
    property minItems: PositiveIntegerDefault0 read GetMinItems write FMinItems stored GetMinItemsStored;
    property externalDocs: ExternalDocs read GetExternalDocs write FExternalDocs stored GetExternalDocsStored;
    property multipleOf: System.Double read FMultipleOf write FMultipleOf stored GetMultipleOfStored;
    property required: stringArray read FRequired write FRequired stored GetRequiredStored;
    [FieldName('type')]
    property &type: Type read GetType write FType stored GetTypeStored;
  end;

  Xml = class
  private
    FAttribute: System.Boolean;
    FName: System.String;
    FPrefix: System.String;
    FWrapped: System.Boolean;
    FNamespace: System.String;
    function GetAttributeStored: Boolean;
    function GetNameStored: Boolean;
    function GetPrefixStored: Boolean;
    function GetWrappedStored: Boolean;
    function GetNamespaceStored: Boolean;
  public
    property IsAttributeStored: Boolean read GetAttributeStored;
    property IsNameStored: Boolean read GetNameStored;
    property IsPrefixStored: Boolean read GetPrefixStored;
    property IsWrappedStored: Boolean read GetWrappedStored;
    property IsNamespaceStored: Boolean read GetNamespaceStored;
  published
    property attribute: System.Boolean read FAttribute write FAttribute stored GetAttributeStored;
    property name: System.String read FName write FName stored GetNameStored;
    property prefix: System.String read FPrefix write FPrefix stored GetPrefixStored;
    property wrapped: System.Boolean read FWrapped write FWrapped stored GetWrappedStored;
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

  NonBodyParameter = class
  end;

  [SingleObject]
  Produces = class
  private
    FMediaTypeList: TArray<System.String>;
  published
    property mediaTypeList: TArray<System.String> read FMediaTypeList write FMediaTypeList;
  end;

  Oauth2Scopes = class
  end;

  Info = class
  private
    FVersion: System.String;
    FTitle: System.String;
    FLicense: License;
    FDescription: System.String;
    FTermsOfService: System.String;
    FContact: Contact;
    function GetLicense: License;
    function GetContact: Contact;
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
    property license: License read GetLicense write FLicense stored GetLicenseStored;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property termsOfService: System.String read FTermsOfService write FTermsOfService stored GetTermsOfServiceStored;
    property contact: Contact read GetContact write FContact stored GetContactStored;
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
    FExternalDocs: ExternalDocs;
    FRequired: stringArray;
    FType: Type;
    FExample: any;
    function GetExternalDocs: ExternalDocs;
    function GetType: Type;
    function GetFormatStored: Boolean;
    function GetDescriptionStored: Boolean;
    function GetDefaultStored: Boolean;
    function GetReadOnlyStored: Boolean;
    function GetTitleStored: Boolean;
    function GetExternalDocsStored: Boolean;
    function GetRequiredStored: Boolean;
    function GetExampleStored: Boolean;
  public
    destructor Destroy; override;

    property IsFormatStored: Boolean read GetFormatStored;
    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsDefaultStored: Boolean read GetDefaultStored;
    property IsReadOnlyStored: Boolean read GetReadOnlyStored;
    property IsTitleStored: Boolean read GetTitleStored;
    property IsExternalDocsStored: Boolean read GetExternalDocsStored;
    property IsRequiredStored: Boolean read GetRequiredStored;
    property IsExampleStored: Boolean read GetExampleStored;
  published
    property format: System.String read FFormat write FFormat stored GetFormatStored;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property default: any read FDefault write FDefault stored GetDefaultStored;
    property readOnly: System.Boolean read FReadOnly write FReadOnly stored GetReadOnlyStored;
    property title: System.String read FTitle write FTitle stored GetTitleStored;
    property externalDocs: ExternalDocs read GetExternalDocs write FExternalDocs stored GetExternalDocsStored;
    property required: stringArray read FRequired write FRequired stored GetRequiredStored;
    [FieldName('type')]
    property &type: Type read GetType write FType;
    property example: any read FExample write FExample stored GetExampleStored;
  end;

  Oauth2PasswordSecurity = class
  private
    FFlow: System.String;
    FDescription: System.String;
    FScopes: Oauth2Scopes;
    FType: Type;
    FTokenUrl: System.String;
    function GetScopes: Oauth2Scopes;
    function GetType: Type;
    function GetDescriptionStored: Boolean;
    function GetScopesStored: Boolean;
  public
    destructor Destroy; override;

    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsScopesStored: Boolean read GetScopesStored;
  published
    property flow: System.String read FFlow write FFlow;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property scopes: Oauth2Scopes read GetScopes write FScopes stored GetScopesStored;
    [FieldName('type')]
    property &type: Type read GetType write FType;
    property tokenUrl: System.String read FTokenUrl write FTokenUrl;
  end;

  Oauth2AccessCodeSecurity = class
  private
    FFlow: System.String;
    FTokenUrl: System.String;
    FDescription: System.String;
    FScopes: Oauth2Scopes;
    FType: Type;
    FAuthorizationUrl: System.String;
    function GetScopes: Oauth2Scopes;
    function GetType: Type;
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
    property scopes: Oauth2Scopes read GetScopes write FScopes stored GetScopesStored;
    [FieldName('type')]
    property &type: Type read GetType write FType;
    property authorizationUrl: System.String read FAuthorizationUrl write FAuthorizationUrl;
  end;

  BasicAuthenticationSecurity = class
  private
    FDescription: System.String;
    FType: Type;
    function GetType: Type;
    function GetDescriptionStored: Boolean;
  public
    destructor Destroy; override;

    property IsDescriptionStored: Boolean read GetDescriptionStored;
  published
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    [FieldName('type')]
    property &type: Type read GetType write FType;
  end;

  Paths = class
  end;

  ApiKeySecurity = class
  private
    FName: System.String;
    FIn: System.String;
    FDescription: System.String;
    FType: Type;
    function GetType: Type;
    function GetDescriptionStored: Boolean;
  public
    destructor Destroy; override;

    property IsDescriptionStored: Boolean read GetDescriptionStored;
  published
    property name: System.String read FName write FName;
    property in: System.String read FIn write FIn;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    [FieldName('type')]
    property &type: Type read GetType write FType;
  end;

  PrimitivesItems = class
  private
    FExclusiveMaximum: exclusiveMaximum;
    FMinimum: minimum;
    FFormat: System.String;
    FExclusiveMinimum: exclusiveMinimum;
    FMaxLength: maxLength;
    FEnum: enum;
    FMaxItems: positiveInteger;
    FCollectionFormat: collectionFormat;
    FUniqueItems: System.Boolean;
    FMaximum: System.Double;
    FDefault: default;
    FPattern: pattern;
    FItems: Items;
    FMinLength: PositiveIntegerDefault0;
    FMinItems: PositiveIntegerDefault0;
    FMultipleOf: multipleOf;
    FType: Type;
    function GetItems: Items;
    function GetMinLength: PositiveIntegerDefault0;
    function GetMinItems: PositiveIntegerDefault0;
    function GetType: Type;
    function GetExclusiveMaximumStored: Boolean;
    function GetMinimumStored: Boolean;
    function GetFormatStored: Boolean;
    function GetExclusiveMinimumStored: Boolean;
    function GetMaxLengthStored: Boolean;
    function GetEnumStored: Boolean;
    function GetMaxItemsStored: Boolean;
    function GetCollectionFormatStored: Boolean;
    function GetUniqueItemsStored: Boolean;
    function GetMaximumStored: Boolean;
    function GetDefaultStored: Boolean;
    function GetPatternStored: Boolean;
    function GetItemsStored: Boolean;
    function GetMinLengthStored: Boolean;
    function GetMinItemsStored: Boolean;
    function GetMultipleOfStored: Boolean;
    function GetTypeStored: Boolean;
  public
    destructor Destroy; override;

    property IsExclusiveMaximumStored: Boolean read GetExclusiveMaximumStored;
    property IsMinimumStored: Boolean read GetMinimumStored;
    property IsFormatStored: Boolean read GetFormatStored;
    property IsExclusiveMinimumStored: Boolean read GetExclusiveMinimumStored;
    property IsMaxLengthStored: Boolean read GetMaxLengthStored;
    property IsEnumStored: Boolean read GetEnumStored;
    property IsMaxItemsStored: Boolean read GetMaxItemsStored;
    property IsCollectionFormatStored: Boolean read GetCollectionFormatStored;
    property IsUniqueItemsStored: Boolean read GetUniqueItemsStored;
    property IsMaximumStored: Boolean read GetMaximumStored;
    property IsDefaultStored: Boolean read GetDefaultStored;
    property IsPatternStored: Boolean read GetPatternStored;
    property IsItemsStored: Boolean read GetItemsStored;
    property IsMinLengthStored: Boolean read GetMinLengthStored;
    property IsMinItemsStored: Boolean read GetMinItemsStored;
    property IsMultipleOfStored: Boolean read GetMultipleOfStored;
    property IsTypeStored: Boolean read GetTypeStored;
  published
    property exclusiveMaximum: exclusiveMaximum read FExclusiveMaximum write FExclusiveMaximum stored GetExclusiveMaximumStored;
    property minimum: minimum read FMinimum write FMinimum stored GetMinimumStored;
    property format: System.String read FFormat write FFormat stored GetFormatStored;
    property exclusiveMinimum: exclusiveMinimum read FExclusiveMinimum write FExclusiveMinimum stored GetExclusiveMinimumStored;
    property maxLength: maxLength read FMaxLength write FMaxLength stored GetMaxLengthStored;
    property enum: enum read FEnum write FEnum stored GetEnumStored;
    property maxItems: positiveInteger read FMaxItems write FMaxItems stored GetMaxItemsStored;
    property collectionFormat: collectionFormat read FCollectionFormat write FCollectionFormat stored GetCollectionFormatStored;
    property uniqueItems: System.Boolean read FUniqueItems write FUniqueItems stored GetUniqueItemsStored;
    property maximum: System.Double read FMaximum write FMaximum stored GetMaximumStored;
    property default: default read FDefault write FDefault stored GetDefaultStored;
    property pattern: pattern read FPattern write FPattern stored GetPatternStored;
    property items: Items read GetItems write FItems stored GetItemsStored;
    property minLength: PositiveIntegerDefault0 read GetMinLength write FMinLength stored GetMinLengthStored;
    property minItems: PositiveIntegerDefault0 read GetMinItems write FMinItems stored GetMinItemsStored;
    property multipleOf: multipleOf read FMultipleOf write FMultipleOf stored GetMultipleOfStored;
    [FieldName('type')]
    property &type: Type read GetType write FType stored GetTypeStored;
  end;

  Oauth2ApplicationSecurity = class
  private
    FFlow: System.String;
    FDescription: System.String;
    FScopes: Oauth2Scopes;
    FType: Type;
    FTokenUrl: System.String;
    function GetScopes: Oauth2Scopes;
    function GetType: Type;
    function GetDescriptionStored: Boolean;
    function GetScopesStored: Boolean;
  public
    destructor Destroy; override;

    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsScopesStored: Boolean read GetScopesStored;
  published
    property flow: System.String read FFlow write FFlow;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property scopes: Oauth2Scopes read GetScopes write FScopes stored GetScopesStored;
    [FieldName('type')]
    property &type: Type read GetType write FType;
    property tokenUrl: System.String read FTokenUrl write FTokenUrl;
  end;

  SecurityDefinitions = class
  end;

  Oauth2ImplicitSecurity = class
  private
    FFlow: System.String;
    FDescription: System.String;
    FScopes: Oauth2Scopes;
    FType: Type;
    FAuthorizationUrl: System.String;
    function GetScopes: Oauth2Scopes;
    function GetType: Type;
    function GetDescriptionStored: Boolean;
    function GetScopesStored: Boolean;
  public
    destructor Destroy; override;

    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsScopesStored: Boolean read GetScopesStored;
  published
    property flow: System.String read FFlow write FFlow;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property scopes: Oauth2Scopes read GetScopes write FScopes stored GetScopesStored;
    [FieldName('type')]
    property &type: Type read GetType write FType;
    property authorizationUrl: System.String read FAuthorizationUrl write FAuthorizationUrl;
  end;

  Header = class
  private
    FExclusiveMaximum: exclusiveMaximum;
    FMinimum: minimum;
    FFormat: System.String;
    FExclusiveMinimum: exclusiveMinimum;
    FMaxLength: maxLength;
    FEnum: enum;
    FMaxItems: positiveInteger;
    FCollectionFormat: collectionFormat;
    FUniqueItems: System.Boolean;
    FDescription: System.String;
    FMaximum: System.Double;
    FDefault: default;
    FPattern: pattern;
    FItems: Items;
    FMinLength: PositiveIntegerDefault0;
    FMinItems: PositiveIntegerDefault0;
    FMultipleOf: multipleOf;
    FType: Type;
    function GetItems: Items;
    function GetMinLength: PositiveIntegerDefault0;
    function GetMinItems: PositiveIntegerDefault0;
    function GetType: Type;
    function GetExclusiveMaximumStored: Boolean;
    function GetMinimumStored: Boolean;
    function GetFormatStored: Boolean;
    function GetExclusiveMinimumStored: Boolean;
    function GetMaxLengthStored: Boolean;
    function GetEnumStored: Boolean;
    function GetMaxItemsStored: Boolean;
    function GetCollectionFormatStored: Boolean;
    function GetUniqueItemsStored: Boolean;
    function GetDescriptionStored: Boolean;
    function GetMaximumStored: Boolean;
    function GetDefaultStored: Boolean;
    function GetPatternStored: Boolean;
    function GetItemsStored: Boolean;
    function GetMinLengthStored: Boolean;
    function GetMinItemsStored: Boolean;
    function GetMultipleOfStored: Boolean;
  public
    destructor Destroy; override;

    property IsExclusiveMaximumStored: Boolean read GetExclusiveMaximumStored;
    property IsMinimumStored: Boolean read GetMinimumStored;
    property IsFormatStored: Boolean read GetFormatStored;
    property IsExclusiveMinimumStored: Boolean read GetExclusiveMinimumStored;
    property IsMaxLengthStored: Boolean read GetMaxLengthStored;
    property IsEnumStored: Boolean read GetEnumStored;
    property IsMaxItemsStored: Boolean read GetMaxItemsStored;
    property IsCollectionFormatStored: Boolean read GetCollectionFormatStored;
    property IsUniqueItemsStored: Boolean read GetUniqueItemsStored;
    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsMaximumStored: Boolean read GetMaximumStored;
    property IsDefaultStored: Boolean read GetDefaultStored;
    property IsPatternStored: Boolean read GetPatternStored;
    property IsItemsStored: Boolean read GetItemsStored;
    property IsMinLengthStored: Boolean read GetMinLengthStored;
    property IsMinItemsStored: Boolean read GetMinItemsStored;
    property IsMultipleOfStored: Boolean read GetMultipleOfStored;
  published
    property exclusiveMaximum: exclusiveMaximum read FExclusiveMaximum write FExclusiveMaximum stored GetExclusiveMaximumStored;
    property minimum: minimum read FMinimum write FMinimum stored GetMinimumStored;
    property format: System.String read FFormat write FFormat stored GetFormatStored;
    property exclusiveMinimum: exclusiveMinimum read FExclusiveMinimum write FExclusiveMinimum stored GetExclusiveMinimumStored;
    property maxLength: maxLength read FMaxLength write FMaxLength stored GetMaxLengthStored;
    property enum: enum read FEnum write FEnum stored GetEnumStored;
    property maxItems: positiveInteger read FMaxItems write FMaxItems stored GetMaxItemsStored;
    property collectionFormat: collectionFormat read FCollectionFormat write FCollectionFormat stored GetCollectionFormatStored;
    property uniqueItems: System.Boolean read FUniqueItems write FUniqueItems stored GetUniqueItemsStored;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property maximum: System.Double read FMaximum write FMaximum stored GetMaximumStored;
    property default: default read FDefault write FDefault stored GetDefaultStored;
    property pattern: pattern read FPattern write FPattern stored GetPatternStored;
    property items: Items read GetItems write FItems stored GetItemsStored;
    property minLength: PositiveIntegerDefault0 read GetMinLength write FMinLength stored GetMinLengthStored;
    property minItems: PositiveIntegerDefault0 read GetMinItems write FMinItems stored GetMinItemsStored;
    property multipleOf: multipleOf read FMultipleOf write FMultipleOf stored GetMultipleOfStored;
    [FieldName('type')]
    property &type: Type read GetType write FType;
  end;

  [SingleObject]
  ResponseValue = class
  private
    FResponse: Response;
    FJsonReference: JsonReference;
    function GetResponse: Response;
    function GetJsonReference: JsonReference;
    function GetResponseStored: Boolean;
    function GetJsonReferenceStored: Boolean;
  public
    destructor Destroy; override;

    property IsResponseStored: Boolean read GetResponseStored;
    property IsJsonReferenceStored: Boolean read GetJsonReferenceStored;
  published
    property response: Response read GetResponse write FResponse stored GetResponseStored;
    property jsonReference: JsonReference read GetJsonReference write FJsonReference stored GetJsonReferenceStored;
  end;

  Response = class
  private
    FHeaders: Headers;
    FDescription: System.String;
    FSchema: Schema;
    FExamples: Examples;
    function GetHeaders: Headers;
    function GetSchema: Schema;
    function GetExamples: Examples;
    function GetHeadersStored: Boolean;
    function GetSchemaStored: Boolean;
    function GetExamplesStored: Boolean;
  public
    destructor Destroy; override;

    property IsHeadersStored: Boolean read GetHeadersStored;
    property IsSchemaStored: Boolean read GetSchemaStored;
    property IsExamplesStored: Boolean read GetExamplesStored;
  published
    property headers: Headers read GetHeaders write FHeaders stored GetHeadersStored;
    property description: System.String read FDescription write FDescription;
    property schema: Schema read GetSchema write FSchema stored GetSchemaStored;
    property examples: Examples read GetExamples write FExamples stored GetExamplesStored;
  end;

  Headers = class
  end;

  Examples = class
  end;

  ParameterDefinitions = class
  end;

  PathItem = class
  private
    FRef: System.String;
    FPatch: Operation;
    FDelete: Operation;
    FHead: Operation;
    FGet: Operation;
    FPost: Operation;
    FOptions: Operation;
    FParameters: ParametersList;
    FPut: Operation;
    function GetPatch: Operation;
    function GetDelete: Operation;
    function GetHead: Operation;
    function GetGet: Operation;
    function GetPost: Operation;
    function GetOptions: Operation;
    function GetParameters: ParametersList;
    function GetPut: Operation;
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
    property patch: Operation read GetPatch write FPatch stored GetPatchStored;
    property delete: Operation read GetDelete write FDelete stored GetDeleteStored;
    property head: Operation read GetHead write FHead stored GetHeadStored;
    property get: Operation read GetGet write FGet stored GetGetStored;
    property post: Operation read GetPost write FPost stored GetPostStored;
    property options: Operation read GetOptions write FOptions stored GetOptionsStored;
    property parameters: ParametersList read GetParameters write FParameters stored GetParametersStored;
    property put: Operation read GetPut write FPut stored GetPutStored;
  end;

  Tag = class
  private
    FName: System.String;
    FDescription: description;
    FExternalDocs: ExternalDocs;
    function GetExternalDocs: ExternalDocs;
    function GetDescriptionStored: Boolean;
    function GetExternalDocsStored: Boolean;
  public
    destructor Destroy; override;

    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsExternalDocsStored: Boolean read GetExternalDocsStored;
  published
    property name: System.String read FName write FName;
    property description: description read FDescription write FDescription stored GetDescriptionStored;
    property externalDocs: ExternalDocs read GetExternalDocs write FExternalDocs stored GetExternalDocsStored;
  end;

implementation

uses System.SysUtils;

{ TSchema }

destructor TSchema.Destroy;
begin
  FProperties.Free;

  FNot.Free;

  FAdditionalItems.Free;

  FMinProperties.Free;

  FMinLength.Free;

  FPatternProperties.Free;

  FDependencies.Free;

  FAdditionalProperties.Free;

  FDefinitions.Free;

  FItems.Free;

  FMinItems.Free;

  FType.Free;

  inherited;
end;

function TSchema.GetAnyOfStored: Boolean;
begin
  Result := False;
end;

function TSchema.GetExclusiveMaximumStored: Boolean;
begin
  Result := False;
end;

function TSchema.GetFormatStored: Boolean;
begin
  Result := not FFormat.IsEmpty;
end;

function TSchema.GetExclusiveMinimumStored: Boolean;
begin
  Result := False;
end;

function TSchema.GetAllOfStored: Boolean;
begin
  Result := False;
end;

function TSchema.GetSchemaStored: Boolean;
begin
  Result := not FSchema.IsEmpty;
end;

function TSchema.GetProperties: Properties;
begin
  if not Assigned(FProperties) then
    FProperties := Properties.Create;

  Result := FProperties;
end;

function TSchema.GetPropertiesStored: Boolean;
begin
  Result := Assigned(FProperties);
end;

function TSchema.GetNot: TSchema;
begin
  if not Assigned(FNot) then
    FNot := TSchema.Create;

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

function TSchema.GetAdditionalItems: AdditionalItems;
begin
  if not Assigned(FAdditionalItems) then
    FAdditionalItems := AdditionalItems.Create;

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

function TSchema.GetMinProperties: PositiveIntegerDefault0;
begin
  if not Assigned(FMinProperties) then
    FMinProperties := PositiveIntegerDefault0.Create;

  Result := FMinProperties;
end;

function TSchema.GetMinPropertiesStored: Boolean;
begin
  Result := Assigned(FMinProperties);
end;

function TSchema.GetMinLength: PositiveIntegerDefault0;
begin
  if not Assigned(FMinLength) then
    FMinLength := PositiveIntegerDefault0.Create;

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

function TSchema.GetPatternProperties: PatternProperties;
begin
  if not Assigned(FPatternProperties) then
    FPatternProperties := PatternProperties.Create;

  Result := FPatternProperties;
end;

function TSchema.GetPatternPropertiesStored: Boolean;
begin
  Result := Assigned(FPatternProperties);
end;

function TSchema.GetOneOfStored: Boolean;
begin
  Result := False;
end;

function TSchema.GetMinimumStored: Boolean;
begin
  Result := FMinimum <> 0;
end;

function TSchema.GetDependencies: Dependencies;
begin
  if not Assigned(FDependencies) then
    FDependencies := Dependencies.Create;

  Result := FDependencies;
end;

function TSchema.GetDependenciesStored: Boolean;
begin
  Result := Assigned(FDependencies);
end;

function TSchema.GetAdditionalProperties: AdditionalProperties;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := AdditionalProperties.Create;

  Result := FAdditionalProperties;
end;

function TSchema.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

function TSchema.GetDefinitions: Definitions;
begin
  if not Assigned(FDefinitions) then
    FDefinitions := Definitions.Create;

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

function TSchema.GetUniqueItemsStored: Boolean;
begin
  Result := False;
end;

function TSchema.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TSchema.GetMaximumStored: Boolean;
begin
  Result := FMaximum <> 0;
end;

function TSchema.GetItems: Items;
begin
  if not Assigned(FItems) then
    FItems := Items.Create;

  Result := FItems;
end;

function TSchema.GetItemsStored: Boolean;
begin
  Result := Assigned(FItems);
end;

function TSchema.GetMinItems: PositiveIntegerDefault0;
begin
  if not Assigned(FMinItems) then
    FMinItems := PositiveIntegerDefault0.Create;

  Result := FMinItems;
end;

function TSchema.GetMinItemsStored: Boolean;
begin
  Result := Assigned(FMinItems);
end;

function TSchema.GetRequiredStored: Boolean;
begin
  Result := False;
end;

function TSchema.GetType: Type;
begin
  if not Assigned(FType) then
    FType := Type.Create;

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

function AdditionalItems.GetBooleanStored: Boolean;
begin
  Result := False;
end;

function AdditionalItems.GetSchema: TSchema;
begin
  if not Assigned(FSchema) then
    FSchema := TSchema.Create;

  Result := FSchema;
end;

function AdditionalItems.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

{ AdditionalProperties }

destructor AdditionalProperties.Destroy;
begin
  FSchema.Free;

  inherited;
end;

function AdditionalProperties.GetBooleanStored: Boolean;
begin
  Result := False;
end;

function AdditionalProperties.GetSchema: TSchema;
begin
  if not Assigned(FSchema) then
    FSchema := TSchema.Create;

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

  inherited;
end;

function Items.GetSchema: TSchema;
begin
  if not Assigned(FSchema) then
    FSchema := TSchema.Create;

  Result := FSchema;
end;

function Items.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function Items.GetSchemaArrayStored: Boolean;
begin
  Result := False;
end;

{ Type }

function Type.GetSimpleTypesStored: Boolean;
begin
  Result := False;
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

  FParameters.Free;

  FDefinitions.Free;

  FProduces.Free;

  FSecurityDefinitions.Free;

  inherited;
end;

function TSchemaOpenAPI20.GetExternalDocs: ExternalDocs;
begin
  if not Assigned(FExternalDocs) then
    FExternalDocs := ExternalDocs.Create;

  Result := FExternalDocs;
end;

function TSchemaOpenAPI20.GetExternalDocsStored: Boolean;
begin
  Result := Assigned(FExternalDocs);
end;

function TSchemaOpenAPI20.AddTags: Tag;
begin
  Result := Tag.Create;

  FTags := FTags + [Result];
end;

function TSchemaOpenAPI20.GetBasePathStored: Boolean;
begin
  Result := not FBasePath.IsEmpty;
end;

function TSchemaOpenAPI20.GetConsumes: Consumes;
begin
  if not Assigned(FConsumes) then
    FConsumes := Consumes.Create;

  Result := FConsumes;
end;

function TSchemaOpenAPI20.GetConsumesStored: Boolean;
begin
  Result := Assigned(FConsumes);
end;

function TSchemaOpenAPI20.GetPaths: Paths;
begin
  if not Assigned(FPaths) then
    FPaths := Paths.Create;

  Result := FPaths;
end;

function TSchemaOpenAPI20.GetResponses: Responses;
begin
  if not Assigned(FResponses) then
    FResponses := Responses.Create;

  Result := FResponses;
end;

function TSchemaOpenAPI20.GetResponsesStored: Boolean;
begin
  Result := Assigned(FResponses);
end;

function TSchemaOpenAPI20.GetInfo: Info;
begin
  if not Assigned(FInfo) then
    FInfo := Info.Create;

  Result := FInfo;
end;

function TSchemaOpenAPI20.GetSchemesStored: Boolean;
begin
  Result := False;
end;

function TSchemaOpenAPI20.GetSecurityStored: Boolean;
begin
  Result := False;
end;

function TSchemaOpenAPI20.GetParameters: ParameterDefinitions;
begin
  if not Assigned(FParameters) then
    FParameters := ParameterDefinitions.Create;

  Result := FParameters;
end;

function TSchemaOpenAPI20.GetParametersStored: Boolean;
begin
  Result := Assigned(FParameters);
end;

function TSchemaOpenAPI20.GetDefinitions: Definitions;
begin
  if not Assigned(FDefinitions) then
    FDefinitions := Definitions.Create;

  Result := FDefinitions;
end;

function TSchemaOpenAPI20.GetDefinitionsStored: Boolean;
begin
  Result := Assigned(FDefinitions);
end;

function TSchemaOpenAPI20.GetProduces: Produces;
begin
  if not Assigned(FProduces) then
    FProduces := Produces.Create;

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

function TSchemaOpenAPI20.GetSecurityDefinitions: SecurityDefinitions;
begin
  if not Assigned(FSecurityDefinitions) then
    FSecurityDefinitions := SecurityDefinitions.Create;

  Result := FSecurityDefinitions;
end;

function TSchemaOpenAPI20.GetSecurityDefinitionsStored: Boolean;
begin
  Result := Assigned(FSecurityDefinitions);
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

function Operation.GetConsumes: Consumes;
begin
  if not Assigned(FConsumes) then
    FConsumes := Consumes.Create;

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

function Operation.GetResponses: Responses;
begin
  if not Assigned(FResponses) then
    FResponses := Responses.Create;

  Result := FResponses;
end;

function Operation.GetSummaryStored: Boolean;
begin
  Result := not FSummary.IsEmpty;
end;

function Operation.GetDeprecatedStored: Boolean;
begin
  Result := False;
end;

function Operation.GetOperationIdStored: Boolean;
begin
  Result := not FOperationId.IsEmpty;
end;

function Operation.AddSecurity: SecurityRequirement;
begin
  Result := SecurityRequirement.Create;

  FSecurity := FSecurity + [Result];
end;

function Operation.AddParameters: ParametersList;
begin
  Result := ParametersList.Create;

  FParameters := FParameters + [Result];
end;

function Operation.GetExternalDocs: ExternalDocs;
begin
  if not Assigned(FExternalDocs) then
    FExternalDocs := ExternalDocs.Create;

  Result := FExternalDocs;
end;

function Operation.GetExternalDocsStored: Boolean;
begin
  Result := Assigned(FExternalDocs);
end;

function Operation.GetProduces: Produces;
begin
  if not Assigned(FProduces) then
    FProduces := Produces.Create;

  Result := FProduces;
end;

function Operation.GetProducesStored: Boolean;
begin
  Result := Assigned(FProduces);
end;

{ ParametersList }

destructor ParametersList.Destroy;
begin
  FParameter.Free;

  FJsonReference.Free;

  inherited;
end;

function ParametersList.GetParameter: Parameter;
begin
  if not Assigned(FParameter) then
    FParameter := Parameter.Create;

  Result := FParameter;
end;

function ParametersList.GetParameterStored: Boolean;
begin
  Result := Assigned(FParameter);
end;

function ParametersList.GetJsonReference: JsonReference;
begin
  if not Assigned(FJsonReference) then
    FJsonReference := JsonReference.Create;

  Result := FJsonReference;
end;

function ParametersList.GetJsonReferenceStored: Boolean;
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

function Parameter.GetBodyParameter: BodyParameter;
begin
  if not Assigned(FBodyParameter) then
    FBodyParameter := BodyParameter.Create;

  Result := FBodyParameter;
end;

function Parameter.GetBodyParameterStored: Boolean;
begin
  Result := Assigned(FBodyParameter);
end;

function Parameter.GetNonBodyParameter: NonBodyParameter;
begin
  if not Assigned(FNonBodyParameter) then
    FNonBodyParameter := NonBodyParameter.Create;

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

function BodyParameter.GetRequiredStored: Boolean;
begin
  Result := False;
end;

function BodyParameter.GetSchema: Schema;
begin
  if not Assigned(FSchema) then
    FSchema := Schema.Create;

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

function Schema.GetExclusiveMaximumStored: Boolean;
begin
  Result := False;
end;

function Schema.GetMinimumStored: Boolean;
begin
  Result := FMinimum <> 0;
end;

function Schema.GetFormatStored: Boolean;
begin
  Result := not FFormat.IsEmpty;
end;

function Schema.GetExclusiveMinimumStored: Boolean;
begin
  Result := False;
end;

function Schema.GetAdditionalProperties: AdditionalProperties;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := AdditionalProperties.Create;

  Result := FAdditionalProperties;
end;

function Schema.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

function Schema.AddAllOf: Schema;
begin
  Result := Schema.Create;

  FAllOf := FAllOf + [Result];
end;

function Schema.GetProperties: Properties;
begin
  if not Assigned(FProperties) then
    FProperties := Properties.Create;

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

function Schema.GetRefStored: Boolean;
begin
  Result := not FRef.IsEmpty;
end;

function Schema.GetMaxPropertiesStored: Boolean;
begin
  Result := FMaxProperties <> 0;
end;

function Schema.GetXml: Xml;
begin
  if not Assigned(FXml) then
    FXml := Xml.Create;

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

function Schema.GetUniqueItemsStored: Boolean;
begin
  Result := False;
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

function Schema.GetMinProperties: PositiveIntegerDefault0;
begin
  if not Assigned(FMinProperties) then
    FMinProperties := PositiveIntegerDefault0.Create;

  Result := FMinProperties;
end;

function Schema.GetMinPropertiesStored: Boolean;
begin
  Result := Assigned(FMinProperties);
end;

function Schema.GetMinLength: PositiveIntegerDefault0;
begin
  if not Assigned(FMinLength) then
    FMinLength := PositiveIntegerDefault0.Create;

  Result := FMinLength;
end;

function Schema.GetMinLengthStored: Boolean;
begin
  Result := Assigned(FMinLength);
end;

function Schema.GetItems: Items;
begin
  if not Assigned(FItems) then
    FItems := Items.Create;

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

function Schema.GetReadOnlyStored: Boolean;
begin
  Result := False;
end;

function Schema.GetMinItems: PositiveIntegerDefault0;
begin
  if not Assigned(FMinItems) then
    FMinItems := PositiveIntegerDefault0.Create;

  Result := FMinItems;
end;

function Schema.GetMinItemsStored: Boolean;
begin
  Result := Assigned(FMinItems);
end;

function Schema.GetExternalDocs: ExternalDocs;
begin
  if not Assigned(FExternalDocs) then
    FExternalDocs := ExternalDocs.Create;

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
  Result := False;
end;

function Schema.GetType: Type;
begin
  if not Assigned(FType) then
    FType := Type.Create;

  Result := FType;
end;

function Schema.GetTypeStored: Boolean;
begin
  Result := Assigned(FType);
end;

{ Xml }

function Xml.GetAttributeStored: Boolean;
begin
  Result := False;
end;

function Xml.GetNameStored: Boolean;
begin
  Result := not FName.IsEmpty;
end;

function Xml.GetPrefixStored: Boolean;
begin
  Result := not FPrefix.IsEmpty;
end;

function Xml.GetWrappedStored: Boolean;
begin
  Result := False;
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

{ Info }

destructor Info.Destroy;
begin
  FLicense.Free;

  FContact.Free;

  inherited;
end;

function Info.GetLicense: License;
begin
  if not Assigned(FLicense) then
    FLicense := License.Create;

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

function Info.GetContact: Contact;
begin
  if not Assigned(FContact) then
    FContact := Contact.Create;

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

function FileSchema.GetReadOnlyStored: Boolean;
begin
  Result := False;
end;

function FileSchema.GetTitleStored: Boolean;
begin
  Result := not FTitle.IsEmpty;
end;

function FileSchema.GetExternalDocs: ExternalDocs;
begin
  if not Assigned(FExternalDocs) then
    FExternalDocs := ExternalDocs.Create;

  Result := FExternalDocs;
end;

function FileSchema.GetExternalDocsStored: Boolean;
begin
  Result := Assigned(FExternalDocs);
end;

function FileSchema.GetRequiredStored: Boolean;
begin
  Result := False;
end;

function FileSchema.GetType: Type;
begin
  if not Assigned(FType) then
    FType := Type.Create;

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

function Oauth2PasswordSecurity.GetScopes: Oauth2Scopes;
begin
  if not Assigned(FScopes) then
    FScopes := Oauth2Scopes.Create;

  Result := FScopes;
end;

function Oauth2PasswordSecurity.GetScopesStored: Boolean;
begin
  Result := Assigned(FScopes);
end;

function Oauth2PasswordSecurity.GetType: Type;
begin
  if not Assigned(FType) then
    FType := Type.Create;

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

function Oauth2AccessCodeSecurity.GetScopes: Oauth2Scopes;
begin
  if not Assigned(FScopes) then
    FScopes := Oauth2Scopes.Create;

  Result := FScopes;
end;

function Oauth2AccessCodeSecurity.GetScopesStored: Boolean;
begin
  Result := Assigned(FScopes);
end;

function Oauth2AccessCodeSecurity.GetType: Type;
begin
  if not Assigned(FType) then
    FType := Type.Create;

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

function BasicAuthenticationSecurity.GetType: Type;
begin
  if not Assigned(FType) then
    FType := Type.Create;

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

function ApiKeySecurity.GetType: Type;
begin
  if not Assigned(FType) then
    FType := Type.Create;

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

function PrimitivesItems.GetExclusiveMaximumStored: Boolean;
begin
  Result := False;
end;

function PrimitivesItems.GetMinimumStored: Boolean;
begin
  Result := FMinimum <> 0;
end;

function PrimitivesItems.GetFormatStored: Boolean;
begin
  Result := not FFormat.IsEmpty;
end;

function PrimitivesItems.GetExclusiveMinimumStored: Boolean;
begin
  Result := False;
end;

function PrimitivesItems.GetMaxLengthStored: Boolean;
begin
  Result := FMaxLength <> 0;
end;

function PrimitivesItems.GetEnumStored: Boolean;
begin
  Result := False;
end;

function PrimitivesItems.GetMaxItemsStored: Boolean;
begin
  Result := FMaxItems <> 0;
end;

function PrimitivesItems.GetCollectionFormatStored: Boolean;
begin
  Result := not FCollectionFormat.IsEmpty;
end;

function PrimitivesItems.GetUniqueItemsStored: Boolean;
begin
  Result := False;
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

function PrimitivesItems.GetItems: Items;
begin
  if not Assigned(FItems) then
    FItems := Items.Create;

  Result := FItems;
end;

function PrimitivesItems.GetItemsStored: Boolean;
begin
  Result := Assigned(FItems);
end;

function PrimitivesItems.GetMinLength: PositiveIntegerDefault0;
begin
  if not Assigned(FMinLength) then
    FMinLength := PositiveIntegerDefault0.Create;

  Result := FMinLength;
end;

function PrimitivesItems.GetMinLengthStored: Boolean;
begin
  Result := Assigned(FMinLength);
end;

function PrimitivesItems.GetMinItems: PositiveIntegerDefault0;
begin
  if not Assigned(FMinItems) then
    FMinItems := PositiveIntegerDefault0.Create;

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

function PrimitivesItems.GetType: Type;
begin
  if not Assigned(FType) then
    FType := Type.Create;

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

function Oauth2ApplicationSecurity.GetScopes: Oauth2Scopes;
begin
  if not Assigned(FScopes) then
    FScopes := Oauth2Scopes.Create;

  Result := FScopes;
end;

function Oauth2ApplicationSecurity.GetScopesStored: Boolean;
begin
  Result := Assigned(FScopes);
end;

function Oauth2ApplicationSecurity.GetType: Type;
begin
  if not Assigned(FType) then
    FType := Type.Create;

  Result := FType;
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

function Oauth2ImplicitSecurity.GetScopes: Oauth2Scopes;
begin
  if not Assigned(FScopes) then
    FScopes := Oauth2Scopes.Create;

  Result := FScopes;
end;

function Oauth2ImplicitSecurity.GetScopesStored: Boolean;
begin
  Result := Assigned(FScopes);
end;

function Oauth2ImplicitSecurity.GetType: Type;
begin
  if not Assigned(FType) then
    FType := Type.Create;

  Result := FType;
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

function Header.GetExclusiveMaximumStored: Boolean;
begin
  Result := False;
end;

function Header.GetMinimumStored: Boolean;
begin
  Result := FMinimum <> 0;
end;

function Header.GetFormatStored: Boolean;
begin
  Result := not FFormat.IsEmpty;
end;

function Header.GetExclusiveMinimumStored: Boolean;
begin
  Result := False;
end;

function Header.GetMaxLengthStored: Boolean;
begin
  Result := FMaxLength <> 0;
end;

function Header.GetEnumStored: Boolean;
begin
  Result := False;
end;

function Header.GetMaxItemsStored: Boolean;
begin
  Result := FMaxItems <> 0;
end;

function Header.GetCollectionFormatStored: Boolean;
begin
  Result := not FCollectionFormat.IsEmpty;
end;

function Header.GetUniqueItemsStored: Boolean;
begin
  Result := False;
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

function Header.GetItems: Items;
begin
  if not Assigned(FItems) then
    FItems := Items.Create;

  Result := FItems;
end;

function Header.GetItemsStored: Boolean;
begin
  Result := Assigned(FItems);
end;

function Header.GetMinLength: PositiveIntegerDefault0;
begin
  if not Assigned(FMinLength) then
    FMinLength := PositiveIntegerDefault0.Create;

  Result := FMinLength;
end;

function Header.GetMinLengthStored: Boolean;
begin
  Result := Assigned(FMinLength);
end;

function Header.GetMinItems: PositiveIntegerDefault0;
begin
  if not Assigned(FMinItems) then
    FMinItems := PositiveIntegerDefault0.Create;

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

function Header.GetType: Type;
begin
  if not Assigned(FType) then
    FType := Type.Create;

  Result := FType;
end;

{ ResponseValue }

destructor ResponseValue.Destroy;
begin
  FResponse.Free;

  FJsonReference.Free;

  inherited;
end;

function ResponseValue.GetResponse: Response;
begin
  if not Assigned(FResponse) then
    FResponse := Response.Create;

  Result := FResponse;
end;

function ResponseValue.GetResponseStored: Boolean;
begin
  Result := Assigned(FResponse);
end;

function ResponseValue.GetJsonReference: JsonReference;
begin
  if not Assigned(FJsonReference) then
    FJsonReference := JsonReference.Create;

  Result := FJsonReference;
end;

function ResponseValue.GetJsonReferenceStored: Boolean;
begin
  Result := Assigned(FJsonReference);
end;

{ Response }

destructor Response.Destroy;
begin
  FHeaders.Free;

  FSchema.Free;

  FExamples.Free;

  inherited;
end;

function Response.GetHeaders: Headers;
begin
  if not Assigned(FHeaders) then
    FHeaders := Headers.Create;

  Result := FHeaders;
end;

function Response.GetHeadersStored: Boolean;
begin
  Result := Assigned(FHeaders);
end;

function Response.GetSchema: Schema;
begin
  if not Assigned(FSchema) then
    FSchema := Schema.Create;

  Result := FSchema;
end;

function Response.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function Response.GetExamples: Examples;
begin
  if not Assigned(FExamples) then
    FExamples := Examples.Create;

  Result := FExamples;
end;

function Response.GetExamplesStored: Boolean;
begin
  Result := Assigned(FExamples);
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

  FParameters.Free;

  FPut.Free;

  inherited;
end;

function PathItem.GetRefStored: Boolean;
begin
  Result := not FRef.IsEmpty;
end;

function PathItem.GetPatch: Operation;
begin
  if not Assigned(FPatch) then
    FPatch := Operation.Create;

  Result := FPatch;
end;

function PathItem.GetPatchStored: Boolean;
begin
  Result := Assigned(FPatch);
end;

function PathItem.GetDelete: Operation;
begin
  if not Assigned(FDelete) then
    FDelete := Operation.Create;

  Result := FDelete;
end;

function PathItem.GetDeleteStored: Boolean;
begin
  Result := Assigned(FDelete);
end;

function PathItem.GetHead: Operation;
begin
  if not Assigned(FHead) then
    FHead := Operation.Create;

  Result := FHead;
end;

function PathItem.GetHeadStored: Boolean;
begin
  Result := Assigned(FHead);
end;

function PathItem.GetGet: Operation;
begin
  if not Assigned(FGet) then
    FGet := Operation.Create;

  Result := FGet;
end;

function PathItem.GetGetStored: Boolean;
begin
  Result := Assigned(FGet);
end;

function PathItem.GetPost: Operation;
begin
  if not Assigned(FPost) then
    FPost := Operation.Create;

  Result := FPost;
end;

function PathItem.GetPostStored: Boolean;
begin
  Result := Assigned(FPost);
end;

function PathItem.GetOptions: Operation;
begin
  if not Assigned(FOptions) then
    FOptions := Operation.Create;

  Result := FOptions;
end;

function PathItem.GetOptionsStored: Boolean;
begin
  Result := Assigned(FOptions);
end;

function PathItem.GetParameters: ParametersList;
begin
  if not Assigned(FParameters) then
    FParameters := ParametersList.Create;

  Result := FParameters;
end;

function PathItem.GetParametersStored: Boolean;
begin
  Result := Assigned(FParameters);
end;

function PathItem.GetPut: Operation;
begin
  if not Assigned(FPut) then
    FPut := Operation.Create;

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

function Tag.GetExternalDocs: ExternalDocs;
begin
  if not Assigned(FExternalDocs) then
    FExternalDocs := ExternalDocs.Create;

  Result := FExternalDocs;
end;

function Tag.GetExternalDocsStored: Boolean;
begin
  Result := Assigned(FExternalDocs);
end;

end.
