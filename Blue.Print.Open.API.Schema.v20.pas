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
  Response = class;
  Operation = class;
  FormDataParameterSubSchema = class;
  Info = class;
  FileSchema = class;
  Oauth2PasswordSecurity = class;
  Oauth2AccessCodeSecurity = class;
  BasicAuthenticationSecurity = class;
  License = class;
  Parameter = class;
  ApiKeySecurity = class;
  HeaderParameterSubSchema = class;
  PrimitivesItems = class;
  QueryParameterSubSchema = class;
  Oauth2ApplicationSecurity = class;
  Schema = class;
  BodyParameter = class;
  SecurityDefinitionsAdditionalProperties = class;
  ParametersListArrayItem = class;
  Oauth2ImplicitSecurity = class;
  Header = class;
  Xml = class;
  ResponseValue = class;
  PathParameterSubSchema = class;
  PathItem = class;
  Tag = class;
  ExternalDocs = class;
  Contact = class;

  // Forward type alias
  schemaArray = TArray<Blue.Print.Open.API.Schema.v20.TJSONSchema>;
  positiveInteger = System.Integer;
  stringArray = TArray<System.String>;
  any = System.Rtti.TValue;
  responseDefinitions = TMap<System.String, Blue.Print.Open.API.Schema.v20.Response>;
  securityRequirement = TMap<System.String, TArray<System.String>>;
  responses = TMap<System.String, System.Rtti.TValue>;
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
  mimeType = System.String;
  security = TArray<TMap<System.String, TArray<System.String>>>;
  vendorExtension = System.Rtti.TValue;
  definitions = TMap<System.String, Blue.Print.Open.API.Schema.v20.Schema>;
  securityDefinitions = TMap<System.String, Blue.Print.Open.API.Schema.v20.SecurityDefinitionsAdditionalProperties>;
  parametersList = TArray<Blue.Print.Open.API.Schema.v20.ParametersListArrayItem>;
  maxItems = System.Integer;
  parameterDefinitions = TMap<System.String, Blue.Print.Open.API.Schema.v20.Parameter>;
  description = System.String;
  maximum = System.Double;
  headers = TMap<System.String, Blue.Print.Open.API.Schema.v20.Header>;
  examples = TMap<System.String, System.Rtti.TValue>;

  TJSONSchema = class
  public type
    [SingleObject]
    TAdditionalItemsProperty = class
    private
      FBoolean: System.Boolean;
      FSchema: Blue.Print.Open.API.Schema.v20.TJSONSchema;
      FBooleanIsStored: Boolean;

      function GetSchema: Blue.Print.Open.API.Schema.v20.TJSONSchema;
      function GetSchemaStored: Boolean;
      procedure SetBoolean(const Value: System.Boolean);
    public
      destructor Destroy; override;

      property IsBooleanStored: Boolean read FBooleanIsStored;
      property IsSchemaStored: Boolean read GetSchemaStored;
    published
      property boolean: System.Boolean read FBoolean write SetBoolean stored FBooleanIsStored;
      property Schema: Blue.Print.Open.API.Schema.v20.TJSONSchema read GetSchema write FSchema stored GetSchemaStored;
    end;

    [SingleObject]
    TDependenciesPropertyAdditionalProperties = class
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
    TAdditionalPropertiesProperty = class
    private
      FBoolean: System.Boolean;
      FSchema: Blue.Print.Open.API.Schema.v20.TJSONSchema;
      FBooleanIsStored: Boolean;

      function GetSchema: Blue.Print.Open.API.Schema.v20.TJSONSchema;
      function GetSchemaStored: Boolean;
      procedure SetBoolean(const Value: System.Boolean);
    public
      destructor Destroy; override;

      property IsBooleanStored: Boolean read FBooleanIsStored;
      property IsSchemaStored: Boolean read GetSchemaStored;
    published
      property boolean: System.Boolean read FBoolean write SetBoolean stored FBooleanIsStored;
      property Schema: Blue.Print.Open.API.Schema.v20.TJSONSchema read GetSchema write FSchema stored GetSchemaStored;
    end;

    [SingleObject]
    TItemsProperty = class
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
    TTypeProperty = class
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
    FAdditionalItems: Blue.Print.Open.API.Schema.v20.TJSONSchema.TAdditionalItemsProperty;
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
    FDependencies: TMap<System.String, Blue.Print.Open.API.Schema.v20.TJSONSchema.TDependenciesPropertyAdditionalProperties>;
    FAdditionalProperties: Blue.Print.Open.API.Schema.v20.TJSONSchema.TAdditionalPropertiesProperty;
    FDefinitions: TMap<System.String, Blue.Print.Open.API.Schema.v20.TJSONSchema>;
    FMaxProperties: positiveInteger;
    FMaxItems: positiveInteger;
    FUniqueItems: System.Boolean;
    FDescription: System.String;
    FMaximum: System.Double;
    FItems: Blue.Print.Open.API.Schema.v20.TJSONSchema.TItemsProperty;
    FMinItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    FRequired: stringArray;
    FType: Blue.Print.Open.API.Schema.v20.TJSONSchema.TTypeProperty;
    FExclusiveMaximumIsStored: Boolean;
    FExclusiveMinimumIsStored: Boolean;
    FUniqueItemsIsStored: Boolean;

    function GetProperties: TMap<System.String, Blue.Print.Open.API.Schema.v20.TJSONSchema>;
    function GetNot: Blue.Print.Open.API.Schema.v20.TJSONSchema;
    function GetAdditionalItems: Blue.Print.Open.API.Schema.v20.TJSONSchema.TAdditionalItemsProperty;
    function GetMinProperties: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    function GetMinLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    function GetPatternProperties: TMap<System.String, Blue.Print.Open.API.Schema.v20.TJSONSchema>;
    function GetDependencies: TMap<System.String, Blue.Print.Open.API.Schema.v20.TJSONSchema.TDependenciesPropertyAdditionalProperties>;
    function GetAdditionalProperties: Blue.Print.Open.API.Schema.v20.TJSONSchema.TAdditionalPropertiesProperty;
    function GetDefinitions: TMap<System.String, Blue.Print.Open.API.Schema.v20.TJSONSchema>;
    function GetItems: Blue.Print.Open.API.Schema.v20.TJSONSchema.TItemsProperty;
    function GetMinItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    function GetType: Blue.Print.Open.API.Schema.v20.TJSONSchema.TTypeProperty;
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
    property additionalItems: Blue.Print.Open.API.Schema.v20.TJSONSchema.TAdditionalItemsProperty read GetAdditionalItems write FAdditionalItems stored GetAdditionalItemsStored;
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
    property dependencies: TMap<System.String, Blue.Print.Open.API.Schema.v20.TJSONSchema.TDependenciesPropertyAdditionalProperties> read GetDependencies write FDependencies stored GetDependenciesStored;
    property additionalProperties: Blue.Print.Open.API.Schema.v20.TJSONSchema.TAdditionalPropertiesProperty read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
    property definitions: TMap<System.String, Blue.Print.Open.API.Schema.v20.TJSONSchema> read GetDefinitions write FDefinitions stored GetDefinitionsStored;
    property maxProperties: positiveInteger read FMaxProperties write FMaxProperties stored GetMaxPropertiesStored;
    property maxItems: positiveInteger read FMaxItems write FMaxItems stored GetMaxItemsStored;
    property uniqueItems: System.Boolean read FUniqueItems write SetUniqueItems stored FUniqueItemsIsStored;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property maximum: System.Double read FMaximum write FMaximum stored GetMaximumStored;
    property items: Blue.Print.Open.API.Schema.v20.TJSONSchema.TItemsProperty read GetItems write FItems stored GetItemsStored;
    property minItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0 read GetMinItems write FMinItems stored GetMinItemsStored;
    property required: stringArray read FRequired write FRequired stored GetRequiredStored;
    [FieldName('type')]
    property &type: Blue.Print.Open.API.Schema.v20.TJSONSchema.TTypeProperty read GetType write FType stored GetTypeStored;
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

  TOpenAPIDefinition = class
  public type
    [SingleObject]
    TConsumesProperty = class
    private
      FMediaTypeList: mediaTypeList;

      function GetMediaTypeListStored: Boolean;
    public
      property IsMediaTypeListStored: Boolean read GetMediaTypeListStored;
    published
      property mediaTypeList: mediaTypeList read FMediaTypeList write FMediaTypeList stored GetMediaTypeListStored;
    end;

    [SingleObject]
    TProducesProperty = class
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
    FConsumes: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.TConsumesProperty;
    FPaths: paths;
    FResponses: responseDefinitions;
    FInfo: Blue.Print.Open.API.Schema.v20.Info;
    FSchemes: schemesList;
    FSecurity: security;
    FParameters: parameterDefinitions;
    FDefinitions: definitions;
    FProduces: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.TProducesProperty;
    FHost: System.String;
    FSecurityDefinitions: securityDefinitions;

    function GetExternalDocs: Blue.Print.Open.API.Schema.v20.ExternalDocs;
    function GetConsumes: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.TConsumesProperty;
    function GetPaths: paths;
    function GetResponses: responseDefinitions;
    function GetInfo: Blue.Print.Open.API.Schema.v20.Info;
    function GetParameters: parameterDefinitions;
    function GetDefinitions: definitions;
    function GetProduces: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.TProducesProperty;
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
    property consumes: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.TConsumesProperty read GetConsumes write FConsumes stored GetConsumesStored;
    property paths: paths read GetPaths write FPaths;
    property responses: responseDefinitions read GetResponses write FResponses stored GetResponsesStored;
    property info: Blue.Print.Open.API.Schema.v20.Info read GetInfo write FInfo;
    property schemes: schemesList read FSchemes write FSchemes stored GetSchemesStored;
    property security: security read FSecurity write FSecurity stored GetSecurityStored;
    property parameters: parameterDefinitions read GetParameters write FParameters stored GetParametersStored;
    property definitions: definitions read GetDefinitions write FDefinitions stored GetDefinitionsStored;
    property produces: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.TProducesProperty read GetProduces write FProduces stored GetProducesStored;
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
  public type
    THeader = class
    public type
      TPrimitivesItems = class
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
        FMaximum: System.Double;
        FDefault: any;
        FPattern: System.String;
        FItems: Blue.Print.Open.API.Schema.v20.Response.THeader.TPrimitivesItems;
        FMinLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
        FMinItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
        FMultipleOf: System.Double;
        FType: System.String;
        FExclusiveMaximumIsStored: Boolean;
        FExclusiveMinimumIsStored: Boolean;
        FUniqueItemsIsStored: Boolean;

        function GetItems: Blue.Print.Open.API.Schema.v20.Response.THeader.TPrimitivesItems;
        function GetMinLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
        function GetMinItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
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
        property minimum: System.Double read FMinimum write FMinimum stored GetMinimumStored;
        property format: System.String read FFormat write FFormat stored GetFormatStored;
        property exclusiveMinimum: System.Boolean read FExclusiveMinimum write SetExclusiveMinimum stored FExclusiveMinimumIsStored;
        property maxLength: positiveInteger read FMaxLength write FMaxLength stored GetMaxLengthStored;
        property enum: TArray<any> read FEnum write FEnum stored GetEnumStored;
        property maxItems: positiveInteger read FMaxItems write FMaxItems stored GetMaxItemsStored;
        property collectionFormat: System.String read FCollectionFormat write FCollectionFormat stored GetCollectionFormatStored;
        property uniqueItems: System.Boolean read FUniqueItems write SetUniqueItems stored FUniqueItemsIsStored;
        property maximum: System.Double read FMaximum write FMaximum stored GetMaximumStored;
        property default: any read FDefault write FDefault stored GetDefaultStored;
        property pattern: System.String read FPattern write FPattern stored GetPatternStored;
        property items: Blue.Print.Open.API.Schema.v20.Response.THeader.TPrimitivesItems read GetItems write FItems stored GetItemsStored;
        property minLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0 read GetMinLength write FMinLength stored GetMinLengthStored;
        property minItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0 read GetMinItems write FMinItems stored GetMinItemsStored;
        property multipleOf: System.Double read FMultipleOf write FMultipleOf stored GetMultipleOfStored;
        [FieldName('type')]
        property &type: System.String read FType write FType stored GetTypeStored;
      end;
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
      FItems: Blue.Print.Open.API.Schema.v20.Response.THeader.TPrimitivesItems;
      FMinLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
      FMinItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
      FMultipleOf: System.Double;
      FType: System.String;
      FExclusiveMaximumIsStored: Boolean;
      FExclusiveMinimumIsStored: Boolean;
      FUniqueItemsIsStored: Boolean;

      function GetItems: Blue.Print.Open.API.Schema.v20.Response.THeader.TPrimitivesItems;
      function GetMinLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
      function GetMinItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
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
      property items: Blue.Print.Open.API.Schema.v20.Response.THeader.TPrimitivesItems read GetItems write FItems stored GetItemsStored;
      property minLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0 read GetMinLength write FMinLength stored GetMinLengthStored;
      property minItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0 read GetMinItems write FMinItems stored GetMinItemsStored;
      property multipleOf: System.Double read FMultipleOf write FMultipleOf stored GetMultipleOfStored;
      [FieldName('type')]
      property &type: System.String read FType write FType;
    end;

    [SingleObject]
    TSchemaProperty = class
    public type
      TFileSchema = class
      public type
        TExternalDocs = class
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
      private
        FFormat: System.String;
        FDescription: System.String;
        FDefault: any;
        FReadOnly: System.Boolean;
        FTitle: System.String;
        FExternalDocs: Blue.Print.Open.API.Schema.v20.Response.TSchemaProperty.TFileSchema.TExternalDocs;
        FRequired: stringArray;
        FType: System.String;
        FExample: any;
        FReadOnlyIsStored: Boolean;

        function GetExternalDocs: Blue.Print.Open.API.Schema.v20.Response.TSchemaProperty.TFileSchema.TExternalDocs;
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
        property externalDocs: Blue.Print.Open.API.Schema.v20.Response.TSchemaProperty.TFileSchema.TExternalDocs read GetExternalDocs write FExternalDocs stored GetExternalDocsStored;
        property required: stringArray read FRequired write FRequired stored GetRequiredStored;
        [FieldName('type')]
        property &type: System.String read FType write FType;
        property example: any read FExample write FExample stored GetExampleStored;
      end;
    private
      FSchema: Blue.Print.Open.API.Schema.v20.Response.TSchemaProperty;
      FFileSchema: Blue.Print.Open.API.Schema.v20.Response.TSchemaProperty.TFileSchema;

      function GetSchema: Blue.Print.Open.API.Schema.v20.Response.TSchemaProperty;
      function GetFileSchema: Blue.Print.Open.API.Schema.v20.Response.TSchemaProperty.TFileSchema;
      function GetSchemaStored: Boolean;
      function GetFileSchemaStored: Boolean;
    public
      destructor Destroy; override;

      property IsSchemaStored: Boolean read GetSchemaStored;
      property IsFileSchemaStored: Boolean read GetFileSchemaStored;
    published
      property schema: Blue.Print.Open.API.Schema.v20.Response.TSchemaProperty read GetSchema write FSchema stored GetSchemaStored;
      property fileSchema: Blue.Print.Open.API.Schema.v20.Response.TSchemaProperty.TFileSchema read GetFileSchema write FFileSchema stored GetFileSchemaStored;
    end;
  private
    FHeaders: TMap<System.String, Blue.Print.Open.API.Schema.v20.Response.THeader>;
    FDescription: System.String;
    FSchema: Blue.Print.Open.API.Schema.v20.Response.TSchemaProperty;
    FExamples: TMap<System.String, any>;

    function GetHeaders: TMap<System.String, Blue.Print.Open.API.Schema.v20.Response.THeader>;
    function GetSchema: Blue.Print.Open.API.Schema.v20.Response.TSchemaProperty;
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
    property headers: TMap<System.String, Blue.Print.Open.API.Schema.v20.Response.THeader> read GetHeaders write FHeaders stored GetHeadersStored;
    property description: System.String read FDescription write FDescription;
    property schema: Blue.Print.Open.API.Schema.v20.Response.TSchemaProperty read GetSchema write FSchema stored GetSchemaStored;
    property examples: TMap<System.String, any> read GetExamples write FExamples stored GetExamplesStored;
  end;

  Operation = class
  public type
    [SingleObject]
    TConsumesProperty = class
    private
      FMediaTypeList: TArray<System.String>;

      function GetMediaTypeListStored: Boolean;
    public
      property IsMediaTypeListStored: Boolean read GetMediaTypeListStored;
    published
      property mediaTypeList: TArray<System.String> read FMediaTypeList write FMediaTypeList stored GetMediaTypeListStored;
    end;

    [SingleObject]
    TParametersListArrayItem = class
    public type
      [SingleObject]
      TParameter = class
      public type
        TBodyParameter = class
        public type
          TSchema = class
          public type
            [SingleObject]
            TAdditionalPropertiesProperty = class
            private
              FSchema: Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema;
              FBoolean: System.Boolean;
              FBooleanIsStored: Boolean;

              function GetSchema: Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema;
              function GetSchemaStored: Boolean;
              procedure SetBoolean(const Value: System.Boolean);
            public
              destructor Destroy; override;

              property IsSchemaStored: Boolean read GetSchemaStored;
              property IsBooleanStored: Boolean read FBooleanIsStored;
            published
              property schema: Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema read GetSchema write FSchema stored GetSchemaStored;
              property boolean: System.Boolean read FBoolean write SetBoolean stored FBooleanIsStored;
            end;

            TXml = class
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

            [SingleObject]
            TItemsProperty = class
            private
              FSchema: Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema;
              FArray: TArray<Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema>;

              function GetSchema: Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema;
              function GetSchemaStored: Boolean;
              function GetArrayStored: Boolean;
            public
              destructor Destroy; override;

              function AddArray: Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema;

              property IsSchemaStored: Boolean read GetSchemaStored;
              property IsArrayStored: Boolean read GetArrayStored;
            published
              property schema: Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema read GetSchema write FSchema stored GetSchemaStored;
              [FieldName('array')]
              property &array: TArray<Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema> read FArray write FArray stored GetArrayStored;
            end;

            TExternalDocs = class
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
            FExclusiveMaximum: System.Boolean;
            FMinimum: System.Double;
            FFormat: System.String;
            FExclusiveMinimum: System.Boolean;
            FAdditionalProperties: Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.TAdditionalPropertiesProperty;
            FAllOf: TArray<Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema>;
            FProperties: TMap<System.String, Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema>;
            FDiscriminator: System.String;
            FMaxLength: positiveInteger;
            FEnum: TArray<any>;
            FRef: System.String;
            FMaxProperties: positiveInteger;
            FXml: Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.TXml;
            FMaxItems: positiveInteger;
            FUniqueItems: System.Boolean;
            FDescription: System.String;
            FMaximum: System.Double;
            FDefault: any;
            FPattern: System.String;
            FMinProperties: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
            FMinLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
            FItems: Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.TItemsProperty;
            FTitle: System.String;
            FReadOnly: System.Boolean;
            FMinItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
            FExternalDocs: Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.TExternalDocs;
            FMultipleOf: System.Double;
            FRequired: stringArray;
            FType: Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.TType;
            FExclusiveMaximumIsStored: Boolean;
            FExclusiveMinimumIsStored: Boolean;
            FUniqueItemsIsStored: Boolean;
            FReadOnlyIsStored: Boolean;

            function GetAdditionalProperties: Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.TAdditionalPropertiesProperty;
            function GetProperties: TMap<System.String, Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema>;
            function GetXml: Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.TXml;
            function GetMinProperties: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
            function GetMinLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
            function GetItems: Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.TItemsProperty;
            function GetMinItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
            function GetExternalDocs: Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.TExternalDocs;
            function GetType: Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.TType;
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

            function AddAllOf: Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema;

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
            property additionalProperties: Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.TAdditionalPropertiesProperty read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
            property allOf: TArray<Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema> read FAllOf write FAllOf stored GetAllOfStored;
            property properties: TMap<System.String, Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema> read GetProperties write FProperties stored GetPropertiesStored;
            property discriminator: System.String read FDiscriminator write FDiscriminator stored GetDiscriminatorStored;
            property maxLength: positiveInteger read FMaxLength write FMaxLength stored GetMaxLengthStored;
            property enum: TArray<any> read FEnum write FEnum stored GetEnumStored;
            [FieldName('$ref')]
            property ref: System.String read FRef write FRef stored GetRefStored;
            property maxProperties: positiveInteger read FMaxProperties write FMaxProperties stored GetMaxPropertiesStored;
            property xml: Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.TXml read GetXml write FXml stored GetXmlStored;
            property maxItems: positiveInteger read FMaxItems write FMaxItems stored GetMaxItemsStored;
            property uniqueItems: System.Boolean read FUniqueItems write SetUniqueItems stored FUniqueItemsIsStored;
            property description: System.String read FDescription write FDescription stored GetDescriptionStored;
            property maximum: System.Double read FMaximum write FMaximum stored GetMaximumStored;
            property default: any read FDefault write FDefault stored GetDefaultStored;
            property pattern: System.String read FPattern write FPattern stored GetPatternStored;
            property minProperties: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0 read GetMinProperties write FMinProperties stored GetMinPropertiesStored;
            property minLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0 read GetMinLength write FMinLength stored GetMinLengthStored;
            property items: Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.TItemsProperty read GetItems write FItems stored GetItemsStored;
            property title: System.String read FTitle write FTitle stored GetTitleStored;
            property readOnly: System.Boolean read FReadOnly write SetReadOnly stored FReadOnlyIsStored;
            property minItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0 read GetMinItems write FMinItems stored GetMinItemsStored;
            property externalDocs: Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.TExternalDocs read GetExternalDocs write FExternalDocs stored GetExternalDocsStored;
            property multipleOf: System.Double read FMultipleOf write FMultipleOf stored GetMultipleOfStored;
            property required: stringArray read FRequired write FRequired stored GetRequiredStored;
            [FieldName('type')]
            property &type: Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.TType read GetType write FType stored GetTypeStored;
          end;
        private
          FName: System.String;
          FIn: System.String;
          FDescription: System.String;
          FRequired: System.Boolean;
          FSchema: Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema;
          FRequiredIsStored: Boolean;

          function GetSchema: Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema;
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
          property schema: Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema read GetSchema write FSchema;
        end;
      private
        FBodyParameter: Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.TBodyParameter;
        FNonBodyParameter: TMap<System.String, any>;

        function GetBodyParameter: Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.TBodyParameter;
        function GetNonBodyParameter: TMap<System.String, any>;
        function GetBodyParameterStored: Boolean;
        function GetNonBodyParameterStored: Boolean;
      public
        destructor Destroy; override;

        property IsBodyParameterStored: Boolean read GetBodyParameterStored;
        property IsNonBodyParameterStored: Boolean read GetNonBodyParameterStored;
      published
        property bodyParameter: Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.TBodyParameter read GetBodyParameter write FBodyParameter stored GetBodyParameterStored;
        property nonBodyParameter: TMap<System.String, any> read GetNonBodyParameter write FNonBodyParameter stored GetNonBodyParameterStored;
      end;
    private
      FParameter: Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter;
      FJsonReference: Blue.Print.Open.API.Schema.v20.JsonReference;

      function GetParameter: Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter;
      function GetJsonReference: Blue.Print.Open.API.Schema.v20.JsonReference;
      function GetParameterStored: Boolean;
      function GetJsonReferenceStored: Boolean;
    public
      destructor Destroy; override;

      property IsParameterStored: Boolean read GetParameterStored;
      property IsJsonReferenceStored: Boolean read GetJsonReferenceStored;
    published
      property parameter: Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter read GetParameter write FParameter stored GetParameterStored;
      property jsonReference: Blue.Print.Open.API.Schema.v20.JsonReference read GetJsonReference write FJsonReference stored GetJsonReferenceStored;
    end;

    TExternalDocs = class
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
    TProducesProperty = class
    private
      FMediaTypeList: TArray<System.String>;

      function GetMediaTypeListStored: Boolean;
    public
      property IsMediaTypeListStored: Boolean read GetMediaTypeListStored;
    published
      property mediaTypeList: TArray<System.String> read FMediaTypeList write FMediaTypeList stored GetMediaTypeListStored;
    end;
  private
    FTags: TArray<System.String>;
    FConsumes: Blue.Print.Open.API.Schema.v20.Operation.TConsumesProperty;
    FDescription: System.String;
    FResponses: TMap<System.String, any>;
    FSummary: System.String;
    FSchemes: TArray<System.String>;
    FDeprecated: System.Boolean;
    FOperationId: System.String;
    FSecurity: TArray<securityRequirement>;
    FParameters: TArray<Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem>;
    FExternalDocs: Blue.Print.Open.API.Schema.v20.Operation.TExternalDocs;
    FProduces: Blue.Print.Open.API.Schema.v20.Operation.TProducesProperty;
    FDeprecatedIsStored: Boolean;

    function GetConsumes: Blue.Print.Open.API.Schema.v20.Operation.TConsumesProperty;
    function GetResponses: TMap<System.String, any>;
    function GetExternalDocs: Blue.Print.Open.API.Schema.v20.Operation.TExternalDocs;
    function GetProduces: Blue.Print.Open.API.Schema.v20.Operation.TProducesProperty;
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

    function AddParameters: Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem;

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
    property consumes: Blue.Print.Open.API.Schema.v20.Operation.TConsumesProperty read GetConsumes write FConsumes stored GetConsumesStored;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property responses: TMap<System.String, any> read GetResponses write FResponses;
    property summary: System.String read FSummary write FSummary stored GetSummaryStored;
    property schemes: TArray<System.String> read FSchemes write FSchemes stored GetSchemesStored;
    property deprecated: System.Boolean read FDeprecated write SetDeprecated stored FDeprecatedIsStored;
    property operationId: System.String read FOperationId write FOperationId stored GetOperationIdStored;
    property security: TArray<securityRequirement> read FSecurity write FSecurity stored GetSecurityStored;
    property parameters: TArray<Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem> read FParameters write FParameters stored GetParametersStored;
    property externalDocs: Blue.Print.Open.API.Schema.v20.Operation.TExternalDocs read GetExternalDocs write FExternalDocs stored GetExternalDocsStored;
    property produces: Blue.Print.Open.API.Schema.v20.Operation.TProducesProperty read GetProduces write FProduces stored GetProducesStored;
  end;

  FormDataParameterSubSchema = class
  public type
    TPrimitivesItems = class
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
      FMaximum: System.Double;
      FDefault: any;
      FPattern: System.String;
      FItems: Blue.Print.Open.API.Schema.v20.FormDataParameterSubSchema.TPrimitivesItems;
      FMinLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
      FMinItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
      FMultipleOf: System.Double;
      FType: System.String;
      FExclusiveMaximumIsStored: Boolean;
      FExclusiveMinimumIsStored: Boolean;
      FUniqueItemsIsStored: Boolean;

      function GetItems: Blue.Print.Open.API.Schema.v20.FormDataParameterSubSchema.TPrimitivesItems;
      function GetMinLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
      function GetMinItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
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
      property minimum: System.Double read FMinimum write FMinimum stored GetMinimumStored;
      property format: System.String read FFormat write FFormat stored GetFormatStored;
      property exclusiveMinimum: System.Boolean read FExclusiveMinimum write SetExclusiveMinimum stored FExclusiveMinimumIsStored;
      property maxLength: positiveInteger read FMaxLength write FMaxLength stored GetMaxLengthStored;
      property enum: TArray<any> read FEnum write FEnum stored GetEnumStored;
      property maxItems: positiveInteger read FMaxItems write FMaxItems stored GetMaxItemsStored;
      property collectionFormat: System.String read FCollectionFormat write FCollectionFormat stored GetCollectionFormatStored;
      property uniqueItems: System.Boolean read FUniqueItems write SetUniqueItems stored FUniqueItemsIsStored;
      property maximum: System.Double read FMaximum write FMaximum stored GetMaximumStored;
      property default: any read FDefault write FDefault stored GetDefaultStored;
      property pattern: System.String read FPattern write FPattern stored GetPatternStored;
      property items: Blue.Print.Open.API.Schema.v20.FormDataParameterSubSchema.TPrimitivesItems read GetItems write FItems stored GetItemsStored;
      property minLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0 read GetMinLength write FMinLength stored GetMinLengthStored;
      property minItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0 read GetMinItems write FMinItems stored GetMinItemsStored;
      property multipleOf: System.Double read FMultipleOf write FMultipleOf stored GetMultipleOfStored;
      [FieldName('type')]
      property &type: System.String read FType write FType stored GetTypeStored;
    end;
  private
    FName: System.String;
    FExclusiveMaximum: System.Boolean;
    FMinimum: System.Double;
    FFormat: System.String;
    FExclusiveMinimum: System.Boolean;
    FMaxLength: positiveInteger;
    FEnum: TArray<any>;
    FMaxItems: positiveInteger;
    FCollectionFormat: System.String;
    FUniqueItems: System.Boolean;
    FAllowEmptyValue: System.Boolean;
    FDescription: System.String;
    FMaximum: System.Double;
    FDefault: any;
    FPattern: System.String;
    FIn: System.String;
    FItems: Blue.Print.Open.API.Schema.v20.FormDataParameterSubSchema.TPrimitivesItems;
    FMinLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    FMinItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    FRequired: System.Boolean;
    FType: System.String;
    FMultipleOf: System.Double;
    FExclusiveMaximumIsStored: Boolean;
    FExclusiveMinimumIsStored: Boolean;
    FUniqueItemsIsStored: Boolean;
    FAllowEmptyValueIsStored: Boolean;
    FRequiredIsStored: Boolean;

    function GetItems: Blue.Print.Open.API.Schema.v20.FormDataParameterSubSchema.TPrimitivesItems;
    function GetMinLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    function GetMinItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
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
    procedure SetExclusiveMaximum(const Value: System.Boolean);
    procedure SetExclusiveMinimum(const Value: System.Boolean);
    procedure SetUniqueItems(const Value: System.Boolean);
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
  published
    property name: System.String read FName write FName stored GetNameStored;
    property exclusiveMaximum: System.Boolean read FExclusiveMaximum write SetExclusiveMaximum stored FExclusiveMaximumIsStored;
    property minimum: System.Double read FMinimum write FMinimum stored GetMinimumStored;
    property format: System.String read FFormat write FFormat stored GetFormatStored;
    property exclusiveMinimum: System.Boolean read FExclusiveMinimum write SetExclusiveMinimum stored FExclusiveMinimumIsStored;
    property maxLength: positiveInteger read FMaxLength write FMaxLength stored GetMaxLengthStored;
    property enum: TArray<any> read FEnum write FEnum stored GetEnumStored;
    property maxItems: positiveInteger read FMaxItems write FMaxItems stored GetMaxItemsStored;
    property collectionFormat: System.String read FCollectionFormat write FCollectionFormat stored GetCollectionFormatStored;
    property uniqueItems: System.Boolean read FUniqueItems write SetUniqueItems stored FUniqueItemsIsStored;
    property allowEmptyValue: System.Boolean read FAllowEmptyValue write SetAllowEmptyValue stored FAllowEmptyValueIsStored;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property maximum: System.Double read FMaximum write FMaximum stored GetMaximumStored;
    property default: any read FDefault write FDefault stored GetDefaultStored;
    property pattern: System.String read FPattern write FPattern stored GetPatternStored;
    [FieldName('in')]
    property &in: System.String read FIn write FIn stored GetInStored;
    property items: Blue.Print.Open.API.Schema.v20.FormDataParameterSubSchema.TPrimitivesItems read GetItems write FItems stored GetItemsStored;
    property minLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0 read GetMinLength write FMinLength stored GetMinLengthStored;
    property minItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0 read GetMinItems write FMinItems stored GetMinItemsStored;
    property required: System.Boolean read FRequired write SetRequired stored FRequiredIsStored;
    [FieldName('type')]
    property &type: System.String read FType write FType stored GetTypeStored;
    property multipleOf: System.Double read FMultipleOf write FMultipleOf stored GetMultipleOfStored;
  end;

  Info = class
  public type
    TLicense = class
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

    TContact = class
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
  private
    FVersion: System.String;
    FTitle: System.String;
    FLicense: Blue.Print.Open.API.Schema.v20.Info.TLicense;
    FDescription: System.String;
    FTermsOfService: System.String;
    FContact: Blue.Print.Open.API.Schema.v20.Info.TContact;

    function GetLicense: Blue.Print.Open.API.Schema.v20.Info.TLicense;
    function GetContact: Blue.Print.Open.API.Schema.v20.Info.TContact;
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
    property license: Blue.Print.Open.API.Schema.v20.Info.TLicense read GetLicense write FLicense stored GetLicenseStored;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property termsOfService: System.String read FTermsOfService write FTermsOfService stored GetTermsOfServiceStored;
    property contact: Blue.Print.Open.API.Schema.v20.Info.TContact read GetContact write FContact stored GetContactStored;
  end;

  FileSchema = class
  public type
    TExternalDocs = class
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
  private
    FFormat: System.String;
    FDescription: System.String;
    FDefault: any;
    FReadOnly: System.Boolean;
    FTitle: System.String;
    FExternalDocs: Blue.Print.Open.API.Schema.v20.FileSchema.TExternalDocs;
    FRequired: stringArray;
    FType: System.String;
    FExample: any;
    FReadOnlyIsStored: Boolean;

    function GetExternalDocs: Blue.Print.Open.API.Schema.v20.FileSchema.TExternalDocs;
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
    property externalDocs: Blue.Print.Open.API.Schema.v20.FileSchema.TExternalDocs read GetExternalDocs write FExternalDocs stored GetExternalDocsStored;
    property required: stringArray read FRequired write FRequired stored GetRequiredStored;
    [FieldName('type')]
    property &type: System.String read FType write FType;
    property example: any read FExample write FExample stored GetExampleStored;
  end;

  Oauth2PasswordSecurity = class
  private
    FFlow: System.String;
    FDescription: System.String;
    FScopes: oauth2Scopes;
    FType: System.String;
    FTokenUrl: System.String;

    function GetScopes: oauth2Scopes;
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
    property &type: System.String read FType write FType;
    property tokenUrl: System.String read FTokenUrl write FTokenUrl;
  end;

  Oauth2AccessCodeSecurity = class
  private
    FFlow: System.String;
    FTokenUrl: System.String;
    FDescription: System.String;
    FScopes: oauth2Scopes;
    FType: System.String;
    FAuthorizationUrl: System.String;

    function GetScopes: oauth2Scopes;
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
    property &type: System.String read FType write FType;
    property authorizationUrl: System.String read FAuthorizationUrl write FAuthorizationUrl;
  end;

  BasicAuthenticationSecurity = class
  private
    FDescription: System.String;
    FType: System.String;

    function GetDescriptionStored: Boolean;
  public
    property IsDescriptionStored: Boolean read GetDescriptionStored;
  published
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    [FieldName('type')]
    property &type: System.String read FType write FType;
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

  [SingleObject]
  Parameter = class
  public type
    TBodyParameter = class
    public type
      TSchema = class
      public type
        [SingleObject]
        TAdditionalPropertiesProperty = class
        private
          FSchema: Blue.Print.Open.API.Schema.v20.Parameter.TBodyParameter.TSchema;
          FBoolean: System.Boolean;
          FBooleanIsStored: Boolean;

          function GetSchema: Blue.Print.Open.API.Schema.v20.Parameter.TBodyParameter.TSchema;
          function GetSchemaStored: Boolean;
          procedure SetBoolean(const Value: System.Boolean);
        public
          destructor Destroy; override;

          property IsSchemaStored: Boolean read GetSchemaStored;
          property IsBooleanStored: Boolean read FBooleanIsStored;
        published
          property schema: Blue.Print.Open.API.Schema.v20.Parameter.TBodyParameter.TSchema read GetSchema write FSchema stored GetSchemaStored;
          property boolean: System.Boolean read FBoolean write SetBoolean stored FBooleanIsStored;
        end;

        TXml = class
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

        [SingleObject]
        TItemsProperty = class
        private
          FSchema: Blue.Print.Open.API.Schema.v20.Parameter.TBodyParameter.TSchema;
          FArray: TArray<Blue.Print.Open.API.Schema.v20.Parameter.TBodyParameter.TSchema>;

          function GetSchema: Blue.Print.Open.API.Schema.v20.Parameter.TBodyParameter.TSchema;
          function GetSchemaStored: Boolean;
          function GetArrayStored: Boolean;
        public
          destructor Destroy; override;

          function AddArray: Blue.Print.Open.API.Schema.v20.Parameter.TBodyParameter.TSchema;

          property IsSchemaStored: Boolean read GetSchemaStored;
          property IsArrayStored: Boolean read GetArrayStored;
        published
          property schema: Blue.Print.Open.API.Schema.v20.Parameter.TBodyParameter.TSchema read GetSchema write FSchema stored GetSchemaStored;
          [FieldName('array')]
          property &array: TArray<Blue.Print.Open.API.Schema.v20.Parameter.TBodyParameter.TSchema> read FArray write FArray stored GetArrayStored;
        end;

        TExternalDocs = class
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
        FExclusiveMaximum: System.Boolean;
        FMinimum: minimum;
        FFormat: System.String;
        FExclusiveMinimum: System.Boolean;
        FAdditionalProperties: Blue.Print.Open.API.Schema.v20.Parameter.TBodyParameter.TSchema.TAdditionalPropertiesProperty;
        FAllOf: TArray<Blue.Print.Open.API.Schema.v20.Parameter.TBodyParameter.TSchema>;
        FProperties: TMap<System.String, Blue.Print.Open.API.Schema.v20.Parameter.TBodyParameter.TSchema>;
        FDiscriminator: System.String;
        FMaxLength: positiveInteger;
        FEnum: enum;
        FRef: System.String;
        FMaxProperties: positiveInteger;
        FXml: Blue.Print.Open.API.Schema.v20.Parameter.TBodyParameter.TSchema.TXml;
        FMaxItems: positiveInteger;
        FUniqueItems: System.Boolean;
        FDescription: System.String;
        FMaximum: System.Double;
        FDefault: default;
        FPattern: pattern;
        FMinProperties: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
        FMinLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
        FItems: Blue.Print.Open.API.Schema.v20.Parameter.TBodyParameter.TSchema.TItemsProperty;
        FTitle: title;
        FReadOnly: System.Boolean;
        FMinItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
        FExternalDocs: Blue.Print.Open.API.Schema.v20.Parameter.TBodyParameter.TSchema.TExternalDocs;
        FMultipleOf: multipleOf;
        FRequired: stringArray;
        FType: Blue.Print.Open.API.Schema.v20.Parameter.TBodyParameter.TSchema.TType;
        FExclusiveMaximumIsStored: Boolean;
        FExclusiveMinimumIsStored: Boolean;
        FUniqueItemsIsStored: Boolean;
        FReadOnlyIsStored: Boolean;

        function GetAdditionalProperties: Blue.Print.Open.API.Schema.v20.Parameter.TBodyParameter.TSchema.TAdditionalPropertiesProperty;
        function GetProperties: TMap<System.String, Blue.Print.Open.API.Schema.v20.Parameter.TBodyParameter.TSchema>;
        function GetXml: Blue.Print.Open.API.Schema.v20.Parameter.TBodyParameter.TSchema.TXml;
        function GetMinProperties: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
        function GetMinLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
        function GetItems: Blue.Print.Open.API.Schema.v20.Parameter.TBodyParameter.TSchema.TItemsProperty;
        function GetMinItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
        function GetExternalDocs: Blue.Print.Open.API.Schema.v20.Parameter.TBodyParameter.TSchema.TExternalDocs;
        function GetType: Blue.Print.Open.API.Schema.v20.Parameter.TBodyParameter.TSchema.TType;
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

        function AddAllOf: Blue.Print.Open.API.Schema.v20.Parameter.TBodyParameter.TSchema;

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
        property minimum: minimum read FMinimum write FMinimum stored GetMinimumStored;
        property format: System.String read FFormat write FFormat stored GetFormatStored;
        property exclusiveMinimum: System.Boolean read FExclusiveMinimum write SetExclusiveMinimum stored FExclusiveMinimumIsStored;
        property additionalProperties: Blue.Print.Open.API.Schema.v20.Parameter.TBodyParameter.TSchema.TAdditionalPropertiesProperty read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
        property allOf: TArray<Blue.Print.Open.API.Schema.v20.Parameter.TBodyParameter.TSchema> read FAllOf write FAllOf stored GetAllOfStored;
        property properties: TMap<System.String, Blue.Print.Open.API.Schema.v20.Parameter.TBodyParameter.TSchema> read GetProperties write FProperties stored GetPropertiesStored;
        property discriminator: System.String read FDiscriminator write FDiscriminator stored GetDiscriminatorStored;
        property maxLength: positiveInteger read FMaxLength write FMaxLength stored GetMaxLengthStored;
        property enum: enum read FEnum write FEnum stored GetEnumStored;
        [FieldName('$ref')]
        property ref: System.String read FRef write FRef stored GetRefStored;
        property maxProperties: positiveInteger read FMaxProperties write FMaxProperties stored GetMaxPropertiesStored;
        property xml: Blue.Print.Open.API.Schema.v20.Parameter.TBodyParameter.TSchema.TXml read GetXml write FXml stored GetXmlStored;
        property maxItems: positiveInteger read FMaxItems write FMaxItems stored GetMaxItemsStored;
        property uniqueItems: System.Boolean read FUniqueItems write SetUniqueItems stored FUniqueItemsIsStored;
        property description: System.String read FDescription write FDescription stored GetDescriptionStored;
        property maximum: System.Double read FMaximum write FMaximum stored GetMaximumStored;
        property default: default read FDefault write FDefault stored GetDefaultStored;
        property pattern: pattern read FPattern write FPattern stored GetPatternStored;
        property minProperties: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0 read GetMinProperties write FMinProperties stored GetMinPropertiesStored;
        property minLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0 read GetMinLength write FMinLength stored GetMinLengthStored;
        property items: Blue.Print.Open.API.Schema.v20.Parameter.TBodyParameter.TSchema.TItemsProperty read GetItems write FItems stored GetItemsStored;
        property title: title read FTitle write FTitle stored GetTitleStored;
        property readOnly: System.Boolean read FReadOnly write SetReadOnly stored FReadOnlyIsStored;
        property minItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0 read GetMinItems write FMinItems stored GetMinItemsStored;
        property externalDocs: Blue.Print.Open.API.Schema.v20.Parameter.TBodyParameter.TSchema.TExternalDocs read GetExternalDocs write FExternalDocs stored GetExternalDocsStored;
        property multipleOf: multipleOf read FMultipleOf write FMultipleOf stored GetMultipleOfStored;
        property required: stringArray read FRequired write FRequired stored GetRequiredStored;
        [FieldName('type')]
        property &type: Blue.Print.Open.API.Schema.v20.Parameter.TBodyParameter.TSchema.TType read GetType write FType stored GetTypeStored;
      end;
    private
      FName: System.String;
      FIn: System.String;
      FDescription: System.String;
      FRequired: System.Boolean;
      FSchema: Blue.Print.Open.API.Schema.v20.Parameter.TBodyParameter.TSchema;
      FRequiredIsStored: Boolean;

      function GetSchema: Blue.Print.Open.API.Schema.v20.Parameter.TBodyParameter.TSchema;
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
      property schema: Blue.Print.Open.API.Schema.v20.Parameter.TBodyParameter.TSchema read GetSchema write FSchema;
    end;
  private
    FBodyParameter: Blue.Print.Open.API.Schema.v20.Parameter.TBodyParameter;
    FNonBodyParameter: nonBodyParameter;

    function GetBodyParameter: Blue.Print.Open.API.Schema.v20.Parameter.TBodyParameter;
    function GetNonBodyParameter: nonBodyParameter;
    function GetBodyParameterStored: Boolean;
    function GetNonBodyParameterStored: Boolean;
  public
    destructor Destroy; override;

    property IsBodyParameterStored: Boolean read GetBodyParameterStored;
    property IsNonBodyParameterStored: Boolean read GetNonBodyParameterStored;
  published
    property bodyParameter: Blue.Print.Open.API.Schema.v20.Parameter.TBodyParameter read GetBodyParameter write FBodyParameter stored GetBodyParameterStored;
    property nonBodyParameter: nonBodyParameter read GetNonBodyParameter write FNonBodyParameter stored GetNonBodyParameterStored;
  end;

  ApiKeySecurity = class
  private
    FName: System.String;
    FIn: System.String;
    FDescription: System.String;
    FType: System.String;

    function GetDescriptionStored: Boolean;
  public
    property IsDescriptionStored: Boolean read GetDescriptionStored;
  published
    property name: System.String read FName write FName;
    [FieldName('in')]
    property &in: System.String read FIn write FIn;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    [FieldName('type')]
    property &type: System.String read FType write FType;
  end;

  HeaderParameterSubSchema = class
  public type
    TPrimitivesItems = class
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
      FItems: Blue.Print.Open.API.Schema.v20.HeaderParameterSubSchema.TPrimitivesItems;
      FMinLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
      FMinItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
      FMultipleOf: multipleOf;
      FType: System.String;
      FExclusiveMaximumIsStored: Boolean;
      FExclusiveMinimumIsStored: Boolean;
      FUniqueItemsIsStored: Boolean;

      function GetItems: Blue.Print.Open.API.Schema.v20.HeaderParameterSubSchema.TPrimitivesItems;
      function GetMinLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
      function GetMinItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
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
      property items: Blue.Print.Open.API.Schema.v20.HeaderParameterSubSchema.TPrimitivesItems read GetItems write FItems stored GetItemsStored;
      property minLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0 read GetMinLength write FMinLength stored GetMinLengthStored;
      property minItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0 read GetMinItems write FMinItems stored GetMinItemsStored;
      property multipleOf: multipleOf read FMultipleOf write FMultipleOf stored GetMultipleOfStored;
      [FieldName('type')]
      property &type: System.String read FType write FType stored GetTypeStored;
    end;
  private
    FName: System.String;
    FExclusiveMaximum: System.Boolean;
    FMinimum: minimum;
    FFormat: System.String;
    FExclusiveMinimum: System.Boolean;
    FMaxLength: maxLength;
    FEnum: enum;
    FMaxItems: positiveInteger;
    FCollectionFormat: collectionFormat;
    FUniqueItems: System.Boolean;
    FDescription: System.String;
    FMaximum: System.Double;
    FDefault: default;
    FPattern: pattern;
    FIn: System.String;
    FItems: Blue.Print.Open.API.Schema.v20.HeaderParameterSubSchema.TPrimitivesItems;
    FMinLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    FMinItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    FRequired: System.Boolean;
    FType: System.String;
    FMultipleOf: multipleOf;
    FExclusiveMaximumIsStored: Boolean;
    FExclusiveMinimumIsStored: Boolean;
    FUniqueItemsIsStored: Boolean;
    FRequiredIsStored: Boolean;

    function GetItems: Blue.Print.Open.API.Schema.v20.HeaderParameterSubSchema.TPrimitivesItems;
    function GetMinLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    function GetMinItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
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
    procedure SetExclusiveMaximum(const Value: System.Boolean);
    procedure SetExclusiveMinimum(const Value: System.Boolean);
    procedure SetUniqueItems(const Value: System.Boolean);
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
  published
    property name: System.String read FName write FName stored GetNameStored;
    property exclusiveMaximum: System.Boolean read FExclusiveMaximum write SetExclusiveMaximum stored FExclusiveMaximumIsStored;
    property minimum: minimum read FMinimum write FMinimum stored GetMinimumStored;
    property format: System.String read FFormat write FFormat stored GetFormatStored;
    property exclusiveMinimum: System.Boolean read FExclusiveMinimum write SetExclusiveMinimum stored FExclusiveMinimumIsStored;
    property maxLength: maxLength read FMaxLength write FMaxLength stored GetMaxLengthStored;
    property enum: enum read FEnum write FEnum stored GetEnumStored;
    property maxItems: positiveInteger read FMaxItems write FMaxItems stored GetMaxItemsStored;
    property collectionFormat: collectionFormat read FCollectionFormat write FCollectionFormat stored GetCollectionFormatStored;
    property uniqueItems: System.Boolean read FUniqueItems write SetUniqueItems stored FUniqueItemsIsStored;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property maximum: System.Double read FMaximum write FMaximum stored GetMaximumStored;
    property default: default read FDefault write FDefault stored GetDefaultStored;
    property pattern: pattern read FPattern write FPattern stored GetPatternStored;
    [FieldName('in')]
    property &in: System.String read FIn write FIn stored GetInStored;
    property items: Blue.Print.Open.API.Schema.v20.HeaderParameterSubSchema.TPrimitivesItems read GetItems write FItems stored GetItemsStored;
    property minLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0 read GetMinLength write FMinLength stored GetMinLengthStored;
    property minItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0 read GetMinItems write FMinItems stored GetMinItemsStored;
    property required: System.Boolean read FRequired write SetRequired stored FRequiredIsStored;
    [FieldName('type')]
    property &type: System.String read FType write FType stored GetTypeStored;
    property multipleOf: multipleOf read FMultipleOf write FMultipleOf stored GetMultipleOfStored;
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
    FItems: Blue.Print.Open.API.Schema.v20.PrimitivesItems;
    FMinLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    FMinItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    FMultipleOf: multipleOf;
    FType: System.String;
    FExclusiveMaximumIsStored: Boolean;
    FExclusiveMinimumIsStored: Boolean;
    FUniqueItemsIsStored: Boolean;

    function GetItems: Blue.Print.Open.API.Schema.v20.PrimitivesItems;
    function GetMinLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    function GetMinItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
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
    property items: Blue.Print.Open.API.Schema.v20.PrimitivesItems read GetItems write FItems stored GetItemsStored;
    property minLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0 read GetMinLength write FMinLength stored GetMinLengthStored;
    property minItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0 read GetMinItems write FMinItems stored GetMinItemsStored;
    property multipleOf: multipleOf read FMultipleOf write FMultipleOf stored GetMultipleOfStored;
    [FieldName('type')]
    property &type: System.String read FType write FType stored GetTypeStored;
  end;

  QueryParameterSubSchema = class
  private
    FName: System.String;
    FExclusiveMaximum: System.Boolean;
    FMinimum: minimum;
    FFormat: System.String;
    FExclusiveMinimum: System.Boolean;
    FMaxLength: maxLength;
    FEnum: enum;
    FMaxItems: positiveInteger;
    FCollectionFormat: collectionFormatWithMulti;
    FUniqueItems: System.Boolean;
    FAllowEmptyValue: System.Boolean;
    FDescription: System.String;
    FMaximum: System.Double;
    FDefault: default;
    FPattern: pattern;
    FIn: System.String;
    FItems: Blue.Print.Open.API.Schema.v20.PrimitivesItems;
    FMinLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    FMinItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    FRequired: System.Boolean;
    FType: System.String;
    FMultipleOf: multipleOf;
    FExclusiveMaximumIsStored: Boolean;
    FExclusiveMinimumIsStored: Boolean;
    FUniqueItemsIsStored: Boolean;
    FAllowEmptyValueIsStored: Boolean;
    FRequiredIsStored: Boolean;

    function GetItems: Blue.Print.Open.API.Schema.v20.PrimitivesItems;
    function GetMinLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    function GetMinItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
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
    procedure SetExclusiveMaximum(const Value: System.Boolean);
    procedure SetExclusiveMinimum(const Value: System.Boolean);
    procedure SetUniqueItems(const Value: System.Boolean);
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
  published
    property name: System.String read FName write FName stored GetNameStored;
    property exclusiveMaximum: System.Boolean read FExclusiveMaximum write SetExclusiveMaximum stored FExclusiveMaximumIsStored;
    property minimum: minimum read FMinimum write FMinimum stored GetMinimumStored;
    property format: System.String read FFormat write FFormat stored GetFormatStored;
    property exclusiveMinimum: System.Boolean read FExclusiveMinimum write SetExclusiveMinimum stored FExclusiveMinimumIsStored;
    property maxLength: maxLength read FMaxLength write FMaxLength stored GetMaxLengthStored;
    property enum: enum read FEnum write FEnum stored GetEnumStored;
    property maxItems: positiveInteger read FMaxItems write FMaxItems stored GetMaxItemsStored;
    property collectionFormat: collectionFormatWithMulti read FCollectionFormat write FCollectionFormat stored GetCollectionFormatStored;
    property uniqueItems: System.Boolean read FUniqueItems write SetUniqueItems stored FUniqueItemsIsStored;
    property allowEmptyValue: System.Boolean read FAllowEmptyValue write SetAllowEmptyValue stored FAllowEmptyValueIsStored;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property maximum: System.Double read FMaximum write FMaximum stored GetMaximumStored;
    property default: default read FDefault write FDefault stored GetDefaultStored;
    property pattern: pattern read FPattern write FPattern stored GetPatternStored;
    [FieldName('in')]
    property &in: System.String read FIn write FIn stored GetInStored;
    property items: Blue.Print.Open.API.Schema.v20.PrimitivesItems read GetItems write FItems stored GetItemsStored;
    property minLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0 read GetMinLength write FMinLength stored GetMinLengthStored;
    property minItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0 read GetMinItems write FMinItems stored GetMinItemsStored;
    property required: System.Boolean read FRequired write SetRequired stored FRequiredIsStored;
    [FieldName('type')]
    property &type: System.String read FType write FType stored GetTypeStored;
    property multipleOf: multipleOf read FMultipleOf write FMultipleOf stored GetMultipleOfStored;
  end;

  Oauth2ApplicationSecurity = class
  private
    FFlow: System.String;
    FDescription: System.String;
    FScopes: oauth2Scopes;
    FType: System.String;
    FTokenUrl: System.String;

    function GetScopes: oauth2Scopes;
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
    property &type: System.String read FType write FType;
    property tokenUrl: System.String read FTokenUrl write FTokenUrl;
  end;

  Schema = class
  public type
    [SingleObject]
    TAdditionalPropertiesProperty = class
    private
      FSchema: Blue.Print.Open.API.Schema.v20.Schema;
      FBoolean: System.Boolean;
      FBooleanIsStored: Boolean;

      function GetSchema: Blue.Print.Open.API.Schema.v20.Schema;
      function GetSchemaStored: Boolean;
      procedure SetBoolean(const Value: System.Boolean);
    public
      destructor Destroy; override;

      property IsSchemaStored: Boolean read GetSchemaStored;
      property IsBooleanStored: Boolean read FBooleanIsStored;
    published
      property schema: Blue.Print.Open.API.Schema.v20.Schema read GetSchema write FSchema stored GetSchemaStored;
      property boolean: System.Boolean read FBoolean write SetBoolean stored FBooleanIsStored;
    end;

    TXml = class
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

    [SingleObject]
    TItemsProperty = class
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

    TExternalDocs = class
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
    FExclusiveMaximum: System.Boolean;
    FMinimum: minimum;
    FFormat: System.String;
    FExclusiveMinimum: System.Boolean;
    FAdditionalProperties: Blue.Print.Open.API.Schema.v20.Schema.TAdditionalPropertiesProperty;
    FAllOf: TArray<Blue.Print.Open.API.Schema.v20.Schema>;
    FProperties: TMap<System.String, Blue.Print.Open.API.Schema.v20.Schema>;
    FDiscriminator: System.String;
    FMaxLength: positiveInteger;
    FEnum: enum;
    FRef: System.String;
    FMaxProperties: positiveInteger;
    FXml: Blue.Print.Open.API.Schema.v20.Schema.TXml;
    FMaxItems: positiveInteger;
    FUniqueItems: System.Boolean;
    FDescription: System.String;
    FMaximum: System.Double;
    FDefault: default;
    FPattern: pattern;
    FMinProperties: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    FMinLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    FItems: Blue.Print.Open.API.Schema.v20.Schema.TItemsProperty;
    FTitle: title;
    FReadOnly: System.Boolean;
    FMinItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    FExternalDocs: Blue.Print.Open.API.Schema.v20.Schema.TExternalDocs;
    FMultipleOf: multipleOf;
    FRequired: stringArray;
    FType: Blue.Print.Open.API.Schema.v20.Schema.TType;
    FExclusiveMaximumIsStored: Boolean;
    FExclusiveMinimumIsStored: Boolean;
    FUniqueItemsIsStored: Boolean;
    FReadOnlyIsStored: Boolean;

    function GetAdditionalProperties: Blue.Print.Open.API.Schema.v20.Schema.TAdditionalPropertiesProperty;
    function GetProperties: TMap<System.String, Blue.Print.Open.API.Schema.v20.Schema>;
    function GetXml: Blue.Print.Open.API.Schema.v20.Schema.TXml;
    function GetMinProperties: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    function GetMinLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    function GetItems: Blue.Print.Open.API.Schema.v20.Schema.TItemsProperty;
    function GetMinItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    function GetExternalDocs: Blue.Print.Open.API.Schema.v20.Schema.TExternalDocs;
    function GetType: Blue.Print.Open.API.Schema.v20.Schema.TType;
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
    property minimum: minimum read FMinimum write FMinimum stored GetMinimumStored;
    property format: System.String read FFormat write FFormat stored GetFormatStored;
    property exclusiveMinimum: System.Boolean read FExclusiveMinimum write SetExclusiveMinimum stored FExclusiveMinimumIsStored;
    property additionalProperties: Blue.Print.Open.API.Schema.v20.Schema.TAdditionalPropertiesProperty read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
    property allOf: TArray<Blue.Print.Open.API.Schema.v20.Schema> read FAllOf write FAllOf stored GetAllOfStored;
    property properties: TMap<System.String, Blue.Print.Open.API.Schema.v20.Schema> read GetProperties write FProperties stored GetPropertiesStored;
    property discriminator: System.String read FDiscriminator write FDiscriminator stored GetDiscriminatorStored;
    property maxLength: positiveInteger read FMaxLength write FMaxLength stored GetMaxLengthStored;
    property enum: enum read FEnum write FEnum stored GetEnumStored;
    [FieldName('$ref')]
    property ref: System.String read FRef write FRef stored GetRefStored;
    property maxProperties: positiveInteger read FMaxProperties write FMaxProperties stored GetMaxPropertiesStored;
    property xml: Blue.Print.Open.API.Schema.v20.Schema.TXml read GetXml write FXml stored GetXmlStored;
    property maxItems: positiveInteger read FMaxItems write FMaxItems stored GetMaxItemsStored;
    property uniqueItems: System.Boolean read FUniqueItems write SetUniqueItems stored FUniqueItemsIsStored;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property maximum: System.Double read FMaximum write FMaximum stored GetMaximumStored;
    property default: default read FDefault write FDefault stored GetDefaultStored;
    property pattern: pattern read FPattern write FPattern stored GetPatternStored;
    property minProperties: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0 read GetMinProperties write FMinProperties stored GetMinPropertiesStored;
    property minLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0 read GetMinLength write FMinLength stored GetMinLengthStored;
    property items: Blue.Print.Open.API.Schema.v20.Schema.TItemsProperty read GetItems write FItems stored GetItemsStored;
    property title: title read FTitle write FTitle stored GetTitleStored;
    property readOnly: System.Boolean read FReadOnly write SetReadOnly stored FReadOnlyIsStored;
    property minItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0 read GetMinItems write FMinItems stored GetMinItemsStored;
    property externalDocs: Blue.Print.Open.API.Schema.v20.Schema.TExternalDocs read GetExternalDocs write FExternalDocs stored GetExternalDocsStored;
    property multipleOf: multipleOf read FMultipleOf write FMultipleOf stored GetMultipleOfStored;
    property required: stringArray read FRequired write FRequired stored GetRequiredStored;
    [FieldName('type')]
    property &type: Blue.Print.Open.API.Schema.v20.Schema.TType read GetType write FType stored GetTypeStored;
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

  [SingleObject]
  SecurityDefinitionsAdditionalProperties = class
  public type
    TOauth2ImplicitSecurity = class
    private
      FFlow: System.String;
      FDescription: System.String;
      FScopes: oauth2Scopes;
      FType: System.String;
      FAuthorizationUrl: System.String;

      function GetScopes: oauth2Scopes;
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
      property &type: System.String read FType write FType;
      property authorizationUrl: System.String read FAuthorizationUrl write FAuthorizationUrl;
    end;
  private
    FBasicAuthenticationSecurity: Blue.Print.Open.API.Schema.v20.BasicAuthenticationSecurity;
    FApiKeySecurity: Blue.Print.Open.API.Schema.v20.ApiKeySecurity;
    FOauth2ImplicitSecurity: Blue.Print.Open.API.Schema.v20.SecurityDefinitionsAdditionalProperties.TOauth2ImplicitSecurity;
    FOauth2PasswordSecurity: Blue.Print.Open.API.Schema.v20.Oauth2PasswordSecurity;
    FOauth2ApplicationSecurity: Blue.Print.Open.API.Schema.v20.Oauth2ApplicationSecurity;
    FOauth2AccessCodeSecurity: Blue.Print.Open.API.Schema.v20.Oauth2AccessCodeSecurity;

    function GetBasicAuthenticationSecurity: Blue.Print.Open.API.Schema.v20.BasicAuthenticationSecurity;
    function GetApiKeySecurity: Blue.Print.Open.API.Schema.v20.ApiKeySecurity;
    function GetOauth2ImplicitSecurity: Blue.Print.Open.API.Schema.v20.SecurityDefinitionsAdditionalProperties.TOauth2ImplicitSecurity;
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
    property oauth2ImplicitSecurity: Blue.Print.Open.API.Schema.v20.SecurityDefinitionsAdditionalProperties.TOauth2ImplicitSecurity read GetOauth2ImplicitSecurity write FOauth2ImplicitSecurity stored GetOauth2ImplicitSecurityStored;
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

    function GetScopes: oauth2Scopes;
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
    property &type: System.String read FType write FType;
    property authorizationUrl: System.String read FAuthorizationUrl write FAuthorizationUrl;
  end;

  Header = class
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
    FDescription: System.String;
    FMaximum: System.Double;
    FDefault: default;
    FPattern: pattern;
    FItems: Blue.Print.Open.API.Schema.v20.PrimitivesItems;
    FMinLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    FMinItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    FMultipleOf: multipleOf;
    FType: System.String;
    FExclusiveMaximumIsStored: Boolean;
    FExclusiveMinimumIsStored: Boolean;
    FUniqueItemsIsStored: Boolean;

    function GetItems: Blue.Print.Open.API.Schema.v20.PrimitivesItems;
    function GetMinLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    function GetMinItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
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
    property minimum: minimum read FMinimum write FMinimum stored GetMinimumStored;
    property format: System.String read FFormat write FFormat stored GetFormatStored;
    property exclusiveMinimum: System.Boolean read FExclusiveMinimum write SetExclusiveMinimum stored FExclusiveMinimumIsStored;
    property maxLength: maxLength read FMaxLength write FMaxLength stored GetMaxLengthStored;
    property enum: enum read FEnum write FEnum stored GetEnumStored;
    property maxItems: positiveInteger read FMaxItems write FMaxItems stored GetMaxItemsStored;
    property collectionFormat: collectionFormat read FCollectionFormat write FCollectionFormat stored GetCollectionFormatStored;
    property uniqueItems: System.Boolean read FUniqueItems write SetUniqueItems stored FUniqueItemsIsStored;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property maximum: System.Double read FMaximum write FMaximum stored GetMaximumStored;
    property default: default read FDefault write FDefault stored GetDefaultStored;
    property pattern: pattern read FPattern write FPattern stored GetPatternStored;
    property items: Blue.Print.Open.API.Schema.v20.PrimitivesItems read GetItems write FItems stored GetItemsStored;
    property minLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0 read GetMinLength write FMinLength stored GetMinLengthStored;
    property minItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0 read GetMinItems write FMinItems stored GetMinItemsStored;
    property multipleOf: multipleOf read FMultipleOf write FMultipleOf stored GetMultipleOfStored;
    [FieldName('type')]
    property &type: System.String read FType write FType;
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
    FExclusiveMaximum: System.Boolean;
    FMinimum: minimum;
    FFormat: System.String;
    FExclusiveMinimum: System.Boolean;
    FMaxLength: maxLength;
    FEnum: enum;
    FMaxItems: maxItems;
    FCollectionFormat: collectionFormat;
    FUniqueItems: System.Boolean;
    FDescription: System.String;
    FMaximum: System.Double;
    FDefault: default;
    FPattern: pattern;
    FIn: System.String;
    FItems: Blue.Print.Open.API.Schema.v20.PrimitivesItems;
    FMinLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    FMinItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    FRequired: System.Boolean;
    FType: System.String;
    FMultipleOf: multipleOf;
    FExclusiveMaximumIsStored: Boolean;
    FExclusiveMinimumIsStored: Boolean;
    FUniqueItemsIsStored: Boolean;

    function GetItems: Blue.Print.Open.API.Schema.v20.PrimitivesItems;
    function GetMinLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
    function GetMinItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
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
    procedure SetExclusiveMaximum(const Value: System.Boolean);
    procedure SetExclusiveMinimum(const Value: System.Boolean);
    procedure SetUniqueItems(const Value: System.Boolean);
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
  published
    property name: System.String read FName write FName stored GetNameStored;
    property exclusiveMaximum: System.Boolean read FExclusiveMaximum write SetExclusiveMaximum stored FExclusiveMaximumIsStored;
    property minimum: minimum read FMinimum write FMinimum stored GetMinimumStored;
    property format: System.String read FFormat write FFormat stored GetFormatStored;
    property exclusiveMinimum: System.Boolean read FExclusiveMinimum write SetExclusiveMinimum stored FExclusiveMinimumIsStored;
    property maxLength: maxLength read FMaxLength write FMaxLength stored GetMaxLengthStored;
    property enum: enum read FEnum write FEnum stored GetEnumStored;
    property maxItems: maxItems read FMaxItems write FMaxItems stored GetMaxItemsStored;
    property collectionFormat: collectionFormat read FCollectionFormat write FCollectionFormat stored GetCollectionFormatStored;
    property uniqueItems: System.Boolean read FUniqueItems write SetUniqueItems stored FUniqueItemsIsStored;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property maximum: System.Double read FMaximum write FMaximum stored GetMaximumStored;
    property default: default read FDefault write FDefault stored GetDefaultStored;
    property pattern: pattern read FPattern write FPattern stored GetPatternStored;
    [FieldName('in')]
    property &in: System.String read FIn write FIn stored GetInStored;
    property items: Blue.Print.Open.API.Schema.v20.PrimitivesItems read GetItems write FItems stored GetItemsStored;
    property minLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0 read GetMinLength write FMinLength stored GetMinLengthStored;
    property minItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0 read GetMinItems write FMinItems stored GetMinItemsStored;
    property required: System.Boolean read FRequired write FRequired;
    [FieldName('type')]
    property &type: System.String read FType write FType stored GetTypeStored;
    property multipleOf: multipleOf read FMultipleOf write FMultipleOf stored GetMultipleOfStored;
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
  public type
    TExternalDocs = class
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
  private
    FName: System.String;
    FDescription: System.String;
    FExternalDocs: Blue.Print.Open.API.Schema.v20.Tag.TExternalDocs;

    function GetExternalDocs: Blue.Print.Open.API.Schema.v20.Tag.TExternalDocs;
    function GetDescriptionStored: Boolean;
    function GetExternalDocsStored: Boolean;
  public
    destructor Destroy; override;

    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsExternalDocsStored: Boolean read GetExternalDocsStored;
  published
    property name: System.String read FName write FName;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property externalDocs: Blue.Print.Open.API.Schema.v20.Tag.TExternalDocs read GetExternalDocs write FExternalDocs stored GetExternalDocsStored;
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

function TJSONSchema.GetAdditionalItems: Blue.Print.Open.API.Schema.v20.TJSONSchema.TAdditionalItemsProperty;
begin
  if not Assigned(FAdditionalItems) then
    FAdditionalItems := Blue.Print.Open.API.Schema.v20.TJSONSchema.TAdditionalItemsProperty.Create;

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

function TJSONSchema.GetDependencies: TMap<System.String, Blue.Print.Open.API.Schema.v20.TJSONSchema.TDependenciesPropertyAdditionalProperties>;
begin
  if not Assigned(FDependencies) then
    FDependencies := TMap<System.String, Blue.Print.Open.API.Schema.v20.TJSONSchema.TDependenciesPropertyAdditionalProperties>.Create;

  Result := FDependencies;
end;

function TJSONSchema.GetDependenciesStored: Boolean;
begin
  Result := Assigned(FDependencies);
end;

function TJSONSchema.GetAdditionalProperties: Blue.Print.Open.API.Schema.v20.TJSONSchema.TAdditionalPropertiesProperty;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := Blue.Print.Open.API.Schema.v20.TJSONSchema.TAdditionalPropertiesProperty.Create;

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

function TJSONSchema.GetItems: Blue.Print.Open.API.Schema.v20.TJSONSchema.TItemsProperty;
begin
  if not Assigned(FItems) then
    FItems := Blue.Print.Open.API.Schema.v20.TJSONSchema.TItemsProperty.Create;

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

function TJSONSchema.GetType: Blue.Print.Open.API.Schema.v20.TJSONSchema.TTypeProperty;
begin
  if not Assigned(FType) then
    FType := Blue.Print.Open.API.Schema.v20.TJSONSchema.TTypeProperty.Create;

  Result := FType;
end;

function TJSONSchema.GetTypeStored: Boolean;
begin
  Result := Assigned(FType);
end;

{ TJSONSchema.TAdditionalItemsProperty }

destructor TJSONSchema.TAdditionalItemsProperty.Destroy;
begin
  FSchema.Free;

  inherited;
end;

procedure TJSONSchema.TAdditionalItemsProperty.SetBoolean(const Value: System.Boolean);
begin
  FBoolean := Value;
  FBooleanIsStored := True;
end;

function TJSONSchema.TAdditionalItemsProperty.GetSchema: Blue.Print.Open.API.Schema.v20.TJSONSchema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v20.TJSONSchema.Create;

  Result := FSchema;
end;

function TJSONSchema.TAdditionalItemsProperty.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

{ TJSONSchema.TDependenciesPropertyAdditionalProperties }

destructor TJSONSchema.TDependenciesPropertyAdditionalProperties.Destroy;
begin
  FSchema.Free;

  inherited;
end;

function TJSONSchema.TDependenciesPropertyAdditionalProperties.GetSchema: Blue.Print.Open.API.Schema.v20.TJSONSchema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v20.TJSONSchema.Create;

  Result := FSchema;
end;

function TJSONSchema.TDependenciesPropertyAdditionalProperties.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function TJSONSchema.TDependenciesPropertyAdditionalProperties.GetStringArrayStored: Boolean;
begin
  Result := Assigned(FStringArray);
end;

{ TJSONSchema.TAdditionalPropertiesProperty }

destructor TJSONSchema.TAdditionalPropertiesProperty.Destroy;
begin
  FSchema.Free;

  inherited;
end;

procedure TJSONSchema.TAdditionalPropertiesProperty.SetBoolean(const Value: System.Boolean);
begin
  FBoolean := Value;
  FBooleanIsStored := True;
end;

function TJSONSchema.TAdditionalPropertiesProperty.GetSchema: Blue.Print.Open.API.Schema.v20.TJSONSchema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v20.TJSONSchema.Create;

  Result := FSchema;
end;

function TJSONSchema.TAdditionalPropertiesProperty.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

{ TJSONSchema.TItemsProperty }

destructor TJSONSchema.TItemsProperty.Destroy;
begin
  FSchema.Free;

  for var AObject in FSchemaArray do
    AObject.Free;

  inherited;
end;

function TJSONSchema.TItemsProperty.GetSchema: Blue.Print.Open.API.Schema.v20.TJSONSchema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v20.TJSONSchema.Create;

  Result := FSchema;
end;

function TJSONSchema.TItemsProperty.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function TJSONSchema.TItemsProperty.AddSchemaArray: Blue.Print.Open.API.Schema.v20.TJSONSchema;
begin
  Result := Blue.Print.Open.API.Schema.v20.TJSONSchema.Create;

  FSchemaArray := FSchemaArray + [Result];
end;

function TJSONSchema.TItemsProperty.GetSchemaArrayStored: Boolean;
begin
  Result := Assigned(FSchemaArray);
end;

{ TJSONSchema.TTypeProperty }

procedure TJSONSchema.TTypeProperty.SetSimpleTypes(const Value: simpleTypes);
begin
  FSimpleTypes := Value;
  FSimpleTypesIsStored := True;
end;

function TJSONSchema.TTypeProperty.GetArrayStored: Boolean;
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

function TOpenAPIDefinition.GetConsumes: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.TConsumesProperty;
begin
  if not Assigned(FConsumes) then
    FConsumes := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.TConsumesProperty.Create;

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

function TOpenAPIDefinition.GetResponses: TMap<System.String, Blue.Print.Open.API.Schema.v20.Response>;
begin
  if not Assigned(FResponses) then
    FResponses := TMap<System.String, Blue.Print.Open.API.Schema.v20.Response>.Create;

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

function TOpenAPIDefinition.GetProduces: Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.TProducesProperty;
begin
  if not Assigned(FProduces) then
    FProduces := Blue.Print.Open.API.Schema.v20.TOpenAPIDefinition.TProducesProperty.Create;

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

{ TOpenAPIDefinition.TConsumesProperty }

function TOpenAPIDefinition.TConsumesProperty.GetMediaTypeListStored: Boolean;
begin
  Result := Assigned(FMediaTypeList);
end;

{ TOpenAPIDefinition.TProducesProperty }

function TOpenAPIDefinition.TProducesProperty.GetMediaTypeListStored: Boolean;
begin
  Result := Assigned(FMediaTypeList);
end;

{ Response }

destructor Response.Destroy;
begin
  FHeaders.Free;

  FSchema.Free;

  FExamples.Free;

  inherited;
end;

function Response.GetHeaders: TMap<System.String, Blue.Print.Open.API.Schema.v20.Response.THeader>;
begin
  if not Assigned(FHeaders) then
    FHeaders := TMap<System.String, Blue.Print.Open.API.Schema.v20.Response.THeader>.Create;

  Result := FHeaders;
end;

function Response.GetHeadersStored: Boolean;
begin
  Result := Assigned(FHeaders);
end;

function Response.GetSchema: Blue.Print.Open.API.Schema.v20.Response.TSchemaProperty;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v20.Response.TSchemaProperty.Create;

  Result := FSchema;
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

{ Response.THeader }

destructor Response.THeader.Destroy;
begin
  FItems.Free;

  FMinLength.Free;

  FMinItems.Free;

  inherited;
end;

procedure Response.THeader.SetExclusiveMaximum(const Value: System.Boolean);
begin
  FExclusiveMaximum := Value;
  FExclusiveMaximumIsStored := True;
end;

function Response.THeader.GetMinimumStored: Boolean;
begin
  Result := FMinimum <> 0;
end;

function Response.THeader.GetFormatStored: Boolean;
begin
  Result := not FFormat.IsEmpty;
end;

procedure Response.THeader.SetExclusiveMinimum(const Value: System.Boolean);
begin
  FExclusiveMinimum := Value;
  FExclusiveMinimumIsStored := True;
end;

function Response.THeader.GetMaxLengthStored: Boolean;
begin
  Result := FMaxLength <> 0;
end;

function Response.THeader.GetEnumStored: Boolean;
begin
  Result := Assigned(FEnum);
end;

function Response.THeader.GetMaxItemsStored: Boolean;
begin
  Result := FMaxItems <> 0;
end;

function Response.THeader.GetCollectionFormatStored: Boolean;
begin
  Result := not FCollectionFormat.IsEmpty;
end;

procedure Response.THeader.SetUniqueItems(const Value: System.Boolean);
begin
  FUniqueItems := Value;
  FUniqueItemsIsStored := True;
end;

function Response.THeader.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function Response.THeader.GetMaximumStored: Boolean;
begin
  Result := FMaximum <> 0;
end;

function Response.THeader.GetDefaultStored: Boolean;
begin
  Result := False;
end;

function Response.THeader.GetPatternStored: Boolean;
begin
  Result := not FPattern.IsEmpty;
end;

function Response.THeader.GetItems: Blue.Print.Open.API.Schema.v20.Response.THeader.TPrimitivesItems;
begin
  if not Assigned(FItems) then
    FItems := Blue.Print.Open.API.Schema.v20.Response.THeader.TPrimitivesItems.Create;

  Result := FItems;
end;

function Response.THeader.GetItemsStored: Boolean;
begin
  Result := Assigned(FItems);
end;

function Response.THeader.GetMinLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
begin
  if not Assigned(FMinLength) then
    FMinLength := Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0.Create;

  Result := FMinLength;
end;

function Response.THeader.GetMinLengthStored: Boolean;
begin
  Result := Assigned(FMinLength);
end;

function Response.THeader.GetMinItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
begin
  if not Assigned(FMinItems) then
    FMinItems := Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0.Create;

  Result := FMinItems;
end;

function Response.THeader.GetMinItemsStored: Boolean;
begin
  Result := Assigned(FMinItems);
end;

function Response.THeader.GetMultipleOfStored: Boolean;
begin
  Result := FMultipleOf <> 0;
end;

{ Response.THeader.TPrimitivesItems }

destructor Response.THeader.TPrimitivesItems.Destroy;
begin
  FItems.Free;

  FMinLength.Free;

  FMinItems.Free;

  inherited;
end;

procedure Response.THeader.TPrimitivesItems.SetExclusiveMaximum(const Value: System.Boolean);
begin
  FExclusiveMaximum := Value;
  FExclusiveMaximumIsStored := True;
end;

function Response.THeader.TPrimitivesItems.GetMinimumStored: Boolean;
begin
  Result := FMinimum <> 0;
end;

function Response.THeader.TPrimitivesItems.GetFormatStored: Boolean;
begin
  Result := not FFormat.IsEmpty;
end;

procedure Response.THeader.TPrimitivesItems.SetExclusiveMinimum(const Value: System.Boolean);
begin
  FExclusiveMinimum := Value;
  FExclusiveMinimumIsStored := True;
end;

function Response.THeader.TPrimitivesItems.GetMaxLengthStored: Boolean;
begin
  Result := FMaxLength <> 0;
end;

function Response.THeader.TPrimitivesItems.GetEnumStored: Boolean;
begin
  Result := Assigned(FEnum);
end;

function Response.THeader.TPrimitivesItems.GetMaxItemsStored: Boolean;
begin
  Result := FMaxItems <> 0;
end;

function Response.THeader.TPrimitivesItems.GetCollectionFormatStored: Boolean;
begin
  Result := not FCollectionFormat.IsEmpty;
end;

procedure Response.THeader.TPrimitivesItems.SetUniqueItems(const Value: System.Boolean);
begin
  FUniqueItems := Value;
  FUniqueItemsIsStored := True;
end;

function Response.THeader.TPrimitivesItems.GetMaximumStored: Boolean;
begin
  Result := FMaximum <> 0;
end;

function Response.THeader.TPrimitivesItems.GetDefaultStored: Boolean;
begin
  Result := False;
end;

function Response.THeader.TPrimitivesItems.GetPatternStored: Boolean;
begin
  Result := not FPattern.IsEmpty;
end;

function Response.THeader.TPrimitivesItems.GetItems: Blue.Print.Open.API.Schema.v20.Response.THeader.TPrimitivesItems;
begin
  if not Assigned(FItems) then
    FItems := Blue.Print.Open.API.Schema.v20.Response.THeader.TPrimitivesItems.Create;

  Result := FItems;
end;

function Response.THeader.TPrimitivesItems.GetItemsStored: Boolean;
begin
  Result := Assigned(FItems);
end;

function Response.THeader.TPrimitivesItems.GetMinLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
begin
  if not Assigned(FMinLength) then
    FMinLength := Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0.Create;

  Result := FMinLength;
end;

function Response.THeader.TPrimitivesItems.GetMinLengthStored: Boolean;
begin
  Result := Assigned(FMinLength);
end;

function Response.THeader.TPrimitivesItems.GetMinItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
begin
  if not Assigned(FMinItems) then
    FMinItems := Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0.Create;

  Result := FMinItems;
end;

function Response.THeader.TPrimitivesItems.GetMinItemsStored: Boolean;
begin
  Result := Assigned(FMinItems);
end;

function Response.THeader.TPrimitivesItems.GetMultipleOfStored: Boolean;
begin
  Result := FMultipleOf <> 0;
end;

function Response.THeader.TPrimitivesItems.GetTypeStored: Boolean;
begin
  Result := not FType.IsEmpty;
end;

{ Response.TSchemaProperty }

destructor Response.TSchemaProperty.Destroy;
begin
  FSchema.Free;

  FFileSchema.Free;

  inherited;
end;

function Response.TSchemaProperty.GetSchema: Blue.Print.Open.API.Schema.v20.Response.TSchemaProperty;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v20.Response.TSchemaProperty.Create;

  Result := FSchema;
end;

function Response.TSchemaProperty.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function Response.TSchemaProperty.GetFileSchema: Blue.Print.Open.API.Schema.v20.Response.TSchemaProperty.TFileSchema;
begin
  if not Assigned(FFileSchema) then
    FFileSchema := Blue.Print.Open.API.Schema.v20.Response.TSchemaProperty.TFileSchema.Create;

  Result := FFileSchema;
end;

function Response.TSchemaProperty.GetFileSchemaStored: Boolean;
begin
  Result := Assigned(FFileSchema);
end;

{ Response.TSchemaProperty.TFileSchema }

destructor Response.TSchemaProperty.TFileSchema.Destroy;
begin
  FExternalDocs.Free;

  inherited;
end;

function Response.TSchemaProperty.TFileSchema.GetFormatStored: Boolean;
begin
  Result := not FFormat.IsEmpty;
end;

function Response.TSchemaProperty.TFileSchema.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function Response.TSchemaProperty.TFileSchema.GetDefaultStored: Boolean;
begin
  Result := False;
end;

procedure Response.TSchemaProperty.TFileSchema.SetReadOnly(const Value: System.Boolean);
begin
  FReadOnly := Value;
  FReadOnlyIsStored := True;
end;

function Response.TSchemaProperty.TFileSchema.GetTitleStored: Boolean;
begin
  Result := not FTitle.IsEmpty;
end;

function Response.TSchemaProperty.TFileSchema.GetExternalDocs: Blue.Print.Open.API.Schema.v20.Response.TSchemaProperty.TFileSchema.TExternalDocs;
begin
  if not Assigned(FExternalDocs) then
    FExternalDocs := Blue.Print.Open.API.Schema.v20.Response.TSchemaProperty.TFileSchema.TExternalDocs.Create;

  Result := FExternalDocs;
end;

function Response.TSchemaProperty.TFileSchema.GetExternalDocsStored: Boolean;
begin
  Result := Assigned(FExternalDocs);
end;

function Response.TSchemaProperty.TFileSchema.GetRequiredStored: Boolean;
begin
  Result := Assigned(FRequired);
end;

function Response.TSchemaProperty.TFileSchema.GetExampleStored: Boolean;
begin
  Result := False;
end;

{ Response.TSchemaProperty.TFileSchema.TExternalDocs }

function Response.TSchemaProperty.TFileSchema.TExternalDocs.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
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

function Operation.GetConsumes: Blue.Print.Open.API.Schema.v20.Operation.TConsumesProperty;
begin
  if not Assigned(FConsumes) then
    FConsumes := Blue.Print.Open.API.Schema.v20.Operation.TConsumesProperty.Create;

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

function Operation.AddParameters: Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem;
begin
  Result := Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.Create;

  FParameters := FParameters + [Result];
end;

function Operation.GetParametersStored: Boolean;
begin
  Result := Assigned(FParameters);
end;

function Operation.GetExternalDocs: Blue.Print.Open.API.Schema.v20.Operation.TExternalDocs;
begin
  if not Assigned(FExternalDocs) then
    FExternalDocs := Blue.Print.Open.API.Schema.v20.Operation.TExternalDocs.Create;

  Result := FExternalDocs;
end;

function Operation.GetExternalDocsStored: Boolean;
begin
  Result := Assigned(FExternalDocs);
end;

function Operation.GetProduces: Blue.Print.Open.API.Schema.v20.Operation.TProducesProperty;
begin
  if not Assigned(FProduces) then
    FProduces := Blue.Print.Open.API.Schema.v20.Operation.TProducesProperty.Create;

  Result := FProduces;
end;

function Operation.GetProducesStored: Boolean;
begin
  Result := Assigned(FProduces);
end;

{ Operation.TConsumesProperty }

function Operation.TConsumesProperty.GetMediaTypeListStored: Boolean;
begin
  Result := Assigned(FMediaTypeList);
end;

{ Operation.TParametersListArrayItem }

destructor Operation.TParametersListArrayItem.Destroy;
begin
  FParameter.Free;

  FJsonReference.Free;

  inherited;
end;

function Operation.TParametersListArrayItem.GetParameter: Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter;
begin
  if not Assigned(FParameter) then
    FParameter := Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.Create;

  Result := FParameter;
end;

function Operation.TParametersListArrayItem.GetParameterStored: Boolean;
begin
  Result := Assigned(FParameter);
end;

function Operation.TParametersListArrayItem.GetJsonReference: Blue.Print.Open.API.Schema.v20.JsonReference;
begin
  if not Assigned(FJsonReference) then
    FJsonReference := Blue.Print.Open.API.Schema.v20.JsonReference.Create;

  Result := FJsonReference;
end;

function Operation.TParametersListArrayItem.GetJsonReferenceStored: Boolean;
begin
  Result := Assigned(FJsonReference);
end;

{ Operation.TParametersListArrayItem.TParameter }

destructor Operation.TParametersListArrayItem.TParameter.Destroy;
begin
  FBodyParameter.Free;

  FNonBodyParameter.Free;

  inherited;
end;

function Operation.TParametersListArrayItem.TParameter.GetBodyParameter: Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.TBodyParameter;
begin
  if not Assigned(FBodyParameter) then
    FBodyParameter := Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.TBodyParameter.Create;

  Result := FBodyParameter;
end;

function Operation.TParametersListArrayItem.TParameter.GetBodyParameterStored: Boolean;
begin
  Result := Assigned(FBodyParameter);
end;

function Operation.TParametersListArrayItem.TParameter.GetNonBodyParameter: TMap<System.String, any>;
begin
  if not Assigned(FNonBodyParameter) then
    FNonBodyParameter := TMap<System.String, any>.Create;

  Result := FNonBodyParameter;
end;

function Operation.TParametersListArrayItem.TParameter.GetNonBodyParameterStored: Boolean;
begin
  Result := Assigned(FNonBodyParameter);
end;

{ Operation.TParametersListArrayItem.TParameter.TBodyParameter }

destructor Operation.TParametersListArrayItem.TParameter.TBodyParameter.Destroy;
begin
  FSchema.Free;

  inherited;
end;

function Operation.TParametersListArrayItem.TParameter.TBodyParameter.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

procedure Operation.TParametersListArrayItem.TParameter.TBodyParameter.SetRequired(const Value: System.Boolean);
begin
  FRequired := Value;
  FRequiredIsStored := True;
end;

function Operation.TParametersListArrayItem.TParameter.TBodyParameter.GetSchema: Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.Create;

  Result := FSchema;
end;

{ Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema }

destructor Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.Destroy;
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

function Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.GetExampleStored: Boolean;
begin
  Result := False;
end;

procedure Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.SetExclusiveMaximum(const Value: System.Boolean);
begin
  FExclusiveMaximum := Value;
  FExclusiveMaximumIsStored := True;
end;

function Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.GetMinimumStored: Boolean;
begin
  Result := FMinimum <> 0;
end;

function Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.GetFormatStored: Boolean;
begin
  Result := not FFormat.IsEmpty;
end;

procedure Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.SetExclusiveMinimum(const Value: System.Boolean);
begin
  FExclusiveMinimum := Value;
  FExclusiveMinimumIsStored := True;
end;

function Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.GetAdditionalProperties: Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.TAdditionalPropertiesProperty;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.TAdditionalPropertiesProperty.Create;

  Result := FAdditionalProperties;
end;

function Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

function Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.AddAllOf: Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema;
begin
  Result := Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.Create;

  FAllOf := FAllOf + [Result];
end;

function Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.GetAllOfStored: Boolean;
begin
  Result := Assigned(FAllOf);
end;

function Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.GetProperties: TMap<System.String, Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema>;
begin
  if not Assigned(FProperties) then
    FProperties := TMap<System.String, Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema>.Create;

  Result := FProperties;
end;

function Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.GetPropertiesStored: Boolean;
begin
  Result := Assigned(FProperties);
end;

function Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.GetDiscriminatorStored: Boolean;
begin
  Result := not FDiscriminator.IsEmpty;
end;

function Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.GetMaxLengthStored: Boolean;
begin
  Result := FMaxLength <> 0;
end;

function Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.GetEnumStored: Boolean;
begin
  Result := Assigned(FEnum);
end;

function Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.GetRefStored: Boolean;
begin
  Result := not FRef.IsEmpty;
end;

function Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.GetMaxPropertiesStored: Boolean;
begin
  Result := FMaxProperties <> 0;
end;

function Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.GetXml: Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.TXml;
begin
  if not Assigned(FXml) then
    FXml := Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.TXml.Create;

  Result := FXml;
end;

function Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.GetXmlStored: Boolean;
begin
  Result := Assigned(FXml);
end;

function Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.GetMaxItemsStored: Boolean;
begin
  Result := FMaxItems <> 0;
end;

procedure Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.SetUniqueItems(const Value: System.Boolean);
begin
  FUniqueItems := Value;
  FUniqueItemsIsStored := True;
end;

function Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.GetMaximumStored: Boolean;
begin
  Result := FMaximum <> 0;
end;

function Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.GetDefaultStored: Boolean;
begin
  Result := False;
end;

function Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.GetPatternStored: Boolean;
begin
  Result := not FPattern.IsEmpty;
end;

function Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.GetMinProperties: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
begin
  if not Assigned(FMinProperties) then
    FMinProperties := Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0.Create;

  Result := FMinProperties;
end;

function Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.GetMinPropertiesStored: Boolean;
begin
  Result := Assigned(FMinProperties);
end;

function Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.GetMinLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
begin
  if not Assigned(FMinLength) then
    FMinLength := Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0.Create;

  Result := FMinLength;
end;

function Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.GetMinLengthStored: Boolean;
begin
  Result := Assigned(FMinLength);
end;

function Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.GetItems: Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.TItemsProperty;
begin
  if not Assigned(FItems) then
    FItems := Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.TItemsProperty.Create;

  Result := FItems;
end;

function Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.GetItemsStored: Boolean;
begin
  Result := Assigned(FItems);
end;

function Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.GetTitleStored: Boolean;
begin
  Result := not FTitle.IsEmpty;
end;

procedure Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.SetReadOnly(const Value: System.Boolean);
begin
  FReadOnly := Value;
  FReadOnlyIsStored := True;
end;

function Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.GetMinItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
begin
  if not Assigned(FMinItems) then
    FMinItems := Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0.Create;

  Result := FMinItems;
end;

function Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.GetMinItemsStored: Boolean;
begin
  Result := Assigned(FMinItems);
end;

function Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.GetExternalDocs: Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.TExternalDocs;
begin
  if not Assigned(FExternalDocs) then
    FExternalDocs := Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.TExternalDocs.Create;

  Result := FExternalDocs;
end;

function Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.GetExternalDocsStored: Boolean;
begin
  Result := Assigned(FExternalDocs);
end;

function Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.GetMultipleOfStored: Boolean;
begin
  Result := FMultipleOf <> 0;
end;

function Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.GetRequiredStored: Boolean;
begin
  Result := Assigned(FRequired);
end;

function Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.GetType: Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.TType;
begin
  if not Assigned(FType) then
    FType := Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.TType.Create;

  Result := FType;
end;

function Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.GetTypeStored: Boolean;
begin
  Result := Assigned(FType);
end;

{ Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.TAdditionalPropertiesProperty }

destructor Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.TAdditionalPropertiesProperty.Destroy;
begin
  FSchema.Free;

  inherited;
end;

function Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.TAdditionalPropertiesProperty.GetSchema: Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.Create;

  Result := FSchema;
end;

function Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.TAdditionalPropertiesProperty.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

procedure Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.TAdditionalPropertiesProperty.SetBoolean(const Value: System.Boolean);
begin
  FBoolean := Value;
  FBooleanIsStored := True;
end;

{ Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.TXml }

procedure Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.TXml.SetAttribute(const Value: System.Boolean);
begin
  FAttribute := Value;
  FAttributeIsStored := True;
end;

function Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.TXml.GetNameStored: Boolean;
begin
  Result := not FName.IsEmpty;
end;

function Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.TXml.GetPrefixStored: Boolean;
begin
  Result := not FPrefix.IsEmpty;
end;

procedure Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.TXml.SetWrapped(const Value: System.Boolean);
begin
  FWrapped := Value;
  FWrappedIsStored := True;
end;

function Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.TXml.GetNamespaceStored: Boolean;
begin
  Result := not FNamespace.IsEmpty;
end;

{ Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.TItemsProperty }

destructor Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.TItemsProperty.Destroy;
begin
  FSchema.Free;

  for var AObject in FArray do
    AObject.Free;

  inherited;
end;

function Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.TItemsProperty.GetSchema: Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.Create;

  Result := FSchema;
end;

function Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.TItemsProperty.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.TItemsProperty.AddArray: Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema;
begin
  Result := Blue.Print.Open.API.Schema.v20.Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.Create;

  FArray := FArray + [Result];
end;

function Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.TItemsProperty.GetArrayStored: Boolean;
begin
  Result := Assigned(FArray);
end;

{ Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.TExternalDocs }

function Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.TExternalDocs.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

{ Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.TType }

procedure Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.TType.SetSimpleTypes(const Value: simpleTypes);
begin
  FSimpleTypes := Value;
  FSimpleTypesIsStored := True;
end;

function Operation.TParametersListArrayItem.TParameter.TBodyParameter.TSchema.TType.GetArrayStored: Boolean;
begin
  Result := Assigned(FArray);
end;

{ Operation.TExternalDocs }

function Operation.TExternalDocs.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

{ Operation.TProducesProperty }

function Operation.TProducesProperty.GetMediaTypeListStored: Boolean;
begin
  Result := Assigned(FMediaTypeList);
end;

{ FormDataParameterSubSchema }

destructor FormDataParameterSubSchema.Destroy;
begin
  FItems.Free;

  FMinLength.Free;

  FMinItems.Free;

  inherited;
end;

function FormDataParameterSubSchema.GetNameStored: Boolean;
begin
  Result := not FName.IsEmpty;
end;

procedure FormDataParameterSubSchema.SetExclusiveMaximum(const Value: System.Boolean);
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

procedure FormDataParameterSubSchema.SetExclusiveMinimum(const Value: System.Boolean);
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

procedure FormDataParameterSubSchema.SetUniqueItems(const Value: System.Boolean);
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

function FormDataParameterSubSchema.GetItems: Blue.Print.Open.API.Schema.v20.FormDataParameterSubSchema.TPrimitivesItems;
begin
  if not Assigned(FItems) then
    FItems := Blue.Print.Open.API.Schema.v20.FormDataParameterSubSchema.TPrimitivesItems.Create;

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

{ FormDataParameterSubSchema.TPrimitivesItems }

destructor FormDataParameterSubSchema.TPrimitivesItems.Destroy;
begin
  FItems.Free;

  FMinLength.Free;

  FMinItems.Free;

  inherited;
end;

procedure FormDataParameterSubSchema.TPrimitivesItems.SetExclusiveMaximum(const Value: System.Boolean);
begin
  FExclusiveMaximum := Value;
  FExclusiveMaximumIsStored := True;
end;

function FormDataParameterSubSchema.TPrimitivesItems.GetMinimumStored: Boolean;
begin
  Result := FMinimum <> 0;
end;

function FormDataParameterSubSchema.TPrimitivesItems.GetFormatStored: Boolean;
begin
  Result := not FFormat.IsEmpty;
end;

procedure FormDataParameterSubSchema.TPrimitivesItems.SetExclusiveMinimum(const Value: System.Boolean);
begin
  FExclusiveMinimum := Value;
  FExclusiveMinimumIsStored := True;
end;

function FormDataParameterSubSchema.TPrimitivesItems.GetMaxLengthStored: Boolean;
begin
  Result := FMaxLength <> 0;
end;

function FormDataParameterSubSchema.TPrimitivesItems.GetEnumStored: Boolean;
begin
  Result := Assigned(FEnum);
end;

function FormDataParameterSubSchema.TPrimitivesItems.GetMaxItemsStored: Boolean;
begin
  Result := FMaxItems <> 0;
end;

function FormDataParameterSubSchema.TPrimitivesItems.GetCollectionFormatStored: Boolean;
begin
  Result := not FCollectionFormat.IsEmpty;
end;

procedure FormDataParameterSubSchema.TPrimitivesItems.SetUniqueItems(const Value: System.Boolean);
begin
  FUniqueItems := Value;
  FUniqueItemsIsStored := True;
end;

function FormDataParameterSubSchema.TPrimitivesItems.GetMaximumStored: Boolean;
begin
  Result := FMaximum <> 0;
end;

function FormDataParameterSubSchema.TPrimitivesItems.GetDefaultStored: Boolean;
begin
  Result := False;
end;

function FormDataParameterSubSchema.TPrimitivesItems.GetPatternStored: Boolean;
begin
  Result := not FPattern.IsEmpty;
end;

function FormDataParameterSubSchema.TPrimitivesItems.GetItems: Blue.Print.Open.API.Schema.v20.FormDataParameterSubSchema.TPrimitivesItems;
begin
  if not Assigned(FItems) then
    FItems := Blue.Print.Open.API.Schema.v20.FormDataParameterSubSchema.TPrimitivesItems.Create;

  Result := FItems;
end;

function FormDataParameterSubSchema.TPrimitivesItems.GetItemsStored: Boolean;
begin
  Result := Assigned(FItems);
end;

function FormDataParameterSubSchema.TPrimitivesItems.GetMinLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
begin
  if not Assigned(FMinLength) then
    FMinLength := Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0.Create;

  Result := FMinLength;
end;

function FormDataParameterSubSchema.TPrimitivesItems.GetMinLengthStored: Boolean;
begin
  Result := Assigned(FMinLength);
end;

function FormDataParameterSubSchema.TPrimitivesItems.GetMinItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
begin
  if not Assigned(FMinItems) then
    FMinItems := Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0.Create;

  Result := FMinItems;
end;

function FormDataParameterSubSchema.TPrimitivesItems.GetMinItemsStored: Boolean;
begin
  Result := Assigned(FMinItems);
end;

function FormDataParameterSubSchema.TPrimitivesItems.GetMultipleOfStored: Boolean;
begin
  Result := FMultipleOf <> 0;
end;

function FormDataParameterSubSchema.TPrimitivesItems.GetTypeStored: Boolean;
begin
  Result := not FType.IsEmpty;
end;

{ Info }

destructor Info.Destroy;
begin
  FLicense.Free;

  FContact.Free;

  inherited;
end;

function Info.GetLicense: Blue.Print.Open.API.Schema.v20.Info.TLicense;
begin
  if not Assigned(FLicense) then
    FLicense := Blue.Print.Open.API.Schema.v20.Info.TLicense.Create;

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

function Info.GetContact: Blue.Print.Open.API.Schema.v20.Info.TContact;
begin
  if not Assigned(FContact) then
    FContact := Blue.Print.Open.API.Schema.v20.Info.TContact.Create;

  Result := FContact;
end;

function Info.GetContactStored: Boolean;
begin
  Result := Assigned(FContact);
end;

{ Info.TLicense }

function Info.TLicense.GetUrlStored: Boolean;
begin
  Result := not FUrl.IsEmpty;
end;

{ Info.TContact }

function Info.TContact.GetEmailStored: Boolean;
begin
  Result := not FEmail.IsEmpty;
end;

function Info.TContact.GetNameStored: Boolean;
begin
  Result := not FName.IsEmpty;
end;

function Info.TContact.GetUrlStored: Boolean;
begin
  Result := not FUrl.IsEmpty;
end;

{ FileSchema }

destructor FileSchema.Destroy;
begin
  FExternalDocs.Free;

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

function FileSchema.GetExternalDocs: Blue.Print.Open.API.Schema.v20.FileSchema.TExternalDocs;
begin
  if not Assigned(FExternalDocs) then
    FExternalDocs := Blue.Print.Open.API.Schema.v20.FileSchema.TExternalDocs.Create;

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

{ FileSchema.TExternalDocs }

function FileSchema.TExternalDocs.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

{ Oauth2PasswordSecurity }

destructor Oauth2PasswordSecurity.Destroy;
begin
  FScopes.Free;

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

{ Oauth2AccessCodeSecurity }

destructor Oauth2AccessCodeSecurity.Destroy;
begin
  FScopes.Free;

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

{ BasicAuthenticationSecurity }

function BasicAuthenticationSecurity.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

{ License }

function License.GetUrlStored: Boolean;
begin
  Result := not FUrl.IsEmpty;
end;

{ Parameter }

destructor Parameter.Destroy;
begin
  FBodyParameter.Free;

  FNonBodyParameter.Free;

  inherited;
end;

function Parameter.GetBodyParameter: Blue.Print.Open.API.Schema.v20.Parameter.TBodyParameter;
begin
  if not Assigned(FBodyParameter) then
    FBodyParameter := Blue.Print.Open.API.Schema.v20.Parameter.TBodyParameter.Create;

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

{ Parameter.TBodyParameter }

destructor Parameter.TBodyParameter.Destroy;
begin
  FSchema.Free;

  inherited;
end;

function Parameter.TBodyParameter.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

procedure Parameter.TBodyParameter.SetRequired(const Value: System.Boolean);
begin
  FRequired := Value;
  FRequiredIsStored := True;
end;

function Parameter.TBodyParameter.GetSchema: Blue.Print.Open.API.Schema.v20.Parameter.TBodyParameter.TSchema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v20.Parameter.TBodyParameter.TSchema.Create;

  Result := FSchema;
end;

{ Parameter.TBodyParameter.TSchema }

destructor Parameter.TBodyParameter.TSchema.Destroy;
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

function Parameter.TBodyParameter.TSchema.GetExampleStored: Boolean;
begin
  Result := False;
end;

procedure Parameter.TBodyParameter.TSchema.SetExclusiveMaximum(const Value: System.Boolean);
begin
  FExclusiveMaximum := Value;
  FExclusiveMaximumIsStored := True;
end;

function Parameter.TBodyParameter.TSchema.GetMinimumStored: Boolean;
begin
  Result := FMinimum <> 0;
end;

function Parameter.TBodyParameter.TSchema.GetFormatStored: Boolean;
begin
  Result := not FFormat.IsEmpty;
end;

procedure Parameter.TBodyParameter.TSchema.SetExclusiveMinimum(const Value: System.Boolean);
begin
  FExclusiveMinimum := Value;
  FExclusiveMinimumIsStored := True;
end;

function Parameter.TBodyParameter.TSchema.GetAdditionalProperties: Blue.Print.Open.API.Schema.v20.Parameter.TBodyParameter.TSchema.TAdditionalPropertiesProperty;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := Blue.Print.Open.API.Schema.v20.Parameter.TBodyParameter.TSchema.TAdditionalPropertiesProperty.Create;

  Result := FAdditionalProperties;
end;

function Parameter.TBodyParameter.TSchema.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

function Parameter.TBodyParameter.TSchema.AddAllOf: Blue.Print.Open.API.Schema.v20.Parameter.TBodyParameter.TSchema;
begin
  Result := Blue.Print.Open.API.Schema.v20.Parameter.TBodyParameter.TSchema.Create;

  FAllOf := FAllOf + [Result];
end;

function Parameter.TBodyParameter.TSchema.GetAllOfStored: Boolean;
begin
  Result := Assigned(FAllOf);
end;

function Parameter.TBodyParameter.TSchema.GetProperties: TMap<System.String, Blue.Print.Open.API.Schema.v20.Parameter.TBodyParameter.TSchema>;
begin
  if not Assigned(FProperties) then
    FProperties := TMap<System.String, Blue.Print.Open.API.Schema.v20.Parameter.TBodyParameter.TSchema>.Create;

  Result := FProperties;
end;

function Parameter.TBodyParameter.TSchema.GetPropertiesStored: Boolean;
begin
  Result := Assigned(FProperties);
end;

function Parameter.TBodyParameter.TSchema.GetDiscriminatorStored: Boolean;
begin
  Result := not FDiscriminator.IsEmpty;
end;

function Parameter.TBodyParameter.TSchema.GetMaxLengthStored: Boolean;
begin
  Result := FMaxLength <> 0;
end;

function Parameter.TBodyParameter.TSchema.GetEnumStored: Boolean;
begin
  Result := Assigned(FEnum);
end;

function Parameter.TBodyParameter.TSchema.GetRefStored: Boolean;
begin
  Result := not FRef.IsEmpty;
end;

function Parameter.TBodyParameter.TSchema.GetMaxPropertiesStored: Boolean;
begin
  Result := FMaxProperties <> 0;
end;

function Parameter.TBodyParameter.TSchema.GetXml: Blue.Print.Open.API.Schema.v20.Parameter.TBodyParameter.TSchema.TXml;
begin
  if not Assigned(FXml) then
    FXml := Blue.Print.Open.API.Schema.v20.Parameter.TBodyParameter.TSchema.TXml.Create;

  Result := FXml;
end;

function Parameter.TBodyParameter.TSchema.GetXmlStored: Boolean;
begin
  Result := Assigned(FXml);
end;

function Parameter.TBodyParameter.TSchema.GetMaxItemsStored: Boolean;
begin
  Result := FMaxItems <> 0;
end;

procedure Parameter.TBodyParameter.TSchema.SetUniqueItems(const Value: System.Boolean);
begin
  FUniqueItems := Value;
  FUniqueItemsIsStored := True;
end;

function Parameter.TBodyParameter.TSchema.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function Parameter.TBodyParameter.TSchema.GetMaximumStored: Boolean;
begin
  Result := FMaximum <> 0;
end;

function Parameter.TBodyParameter.TSchema.GetDefaultStored: Boolean;
begin
  Result := False;
end;

function Parameter.TBodyParameter.TSchema.GetPatternStored: Boolean;
begin
  Result := not FPattern.IsEmpty;
end;

function Parameter.TBodyParameter.TSchema.GetMinProperties: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
begin
  if not Assigned(FMinProperties) then
    FMinProperties := Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0.Create;

  Result := FMinProperties;
end;

function Parameter.TBodyParameter.TSchema.GetMinPropertiesStored: Boolean;
begin
  Result := Assigned(FMinProperties);
end;

function Parameter.TBodyParameter.TSchema.GetMinLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
begin
  if not Assigned(FMinLength) then
    FMinLength := Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0.Create;

  Result := FMinLength;
end;

function Parameter.TBodyParameter.TSchema.GetMinLengthStored: Boolean;
begin
  Result := Assigned(FMinLength);
end;

function Parameter.TBodyParameter.TSchema.GetItems: Blue.Print.Open.API.Schema.v20.Parameter.TBodyParameter.TSchema.TItemsProperty;
begin
  if not Assigned(FItems) then
    FItems := Blue.Print.Open.API.Schema.v20.Parameter.TBodyParameter.TSchema.TItemsProperty.Create;

  Result := FItems;
end;

function Parameter.TBodyParameter.TSchema.GetItemsStored: Boolean;
begin
  Result := Assigned(FItems);
end;

function Parameter.TBodyParameter.TSchema.GetTitleStored: Boolean;
begin
  Result := not FTitle.IsEmpty;
end;

procedure Parameter.TBodyParameter.TSchema.SetReadOnly(const Value: System.Boolean);
begin
  FReadOnly := Value;
  FReadOnlyIsStored := True;
end;

function Parameter.TBodyParameter.TSchema.GetMinItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
begin
  if not Assigned(FMinItems) then
    FMinItems := Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0.Create;

  Result := FMinItems;
end;

function Parameter.TBodyParameter.TSchema.GetMinItemsStored: Boolean;
begin
  Result := Assigned(FMinItems);
end;

function Parameter.TBodyParameter.TSchema.GetExternalDocs: Blue.Print.Open.API.Schema.v20.Parameter.TBodyParameter.TSchema.TExternalDocs;
begin
  if not Assigned(FExternalDocs) then
    FExternalDocs := Blue.Print.Open.API.Schema.v20.Parameter.TBodyParameter.TSchema.TExternalDocs.Create;

  Result := FExternalDocs;
end;

function Parameter.TBodyParameter.TSchema.GetExternalDocsStored: Boolean;
begin
  Result := Assigned(FExternalDocs);
end;

function Parameter.TBodyParameter.TSchema.GetMultipleOfStored: Boolean;
begin
  Result := FMultipleOf <> 0;
end;

function Parameter.TBodyParameter.TSchema.GetRequiredStored: Boolean;
begin
  Result := Assigned(FRequired);
end;

function Parameter.TBodyParameter.TSchema.GetType: Blue.Print.Open.API.Schema.v20.Parameter.TBodyParameter.TSchema.TType;
begin
  if not Assigned(FType) then
    FType := Blue.Print.Open.API.Schema.v20.Parameter.TBodyParameter.TSchema.TType.Create;

  Result := FType;
end;

function Parameter.TBodyParameter.TSchema.GetTypeStored: Boolean;
begin
  Result := Assigned(FType);
end;

{ Parameter.TBodyParameter.TSchema.TAdditionalPropertiesProperty }

destructor Parameter.TBodyParameter.TSchema.TAdditionalPropertiesProperty.Destroy;
begin
  FSchema.Free;

  inherited;
end;

function Parameter.TBodyParameter.TSchema.TAdditionalPropertiesProperty.GetSchema: Blue.Print.Open.API.Schema.v20.Parameter.TBodyParameter.TSchema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v20.Parameter.TBodyParameter.TSchema.Create;

  Result := FSchema;
end;

function Parameter.TBodyParameter.TSchema.TAdditionalPropertiesProperty.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

procedure Parameter.TBodyParameter.TSchema.TAdditionalPropertiesProperty.SetBoolean(const Value: System.Boolean);
begin
  FBoolean := Value;
  FBooleanIsStored := True;
end;

{ Parameter.TBodyParameter.TSchema.TXml }

procedure Parameter.TBodyParameter.TSchema.TXml.SetAttribute(const Value: System.Boolean);
begin
  FAttribute := Value;
  FAttributeIsStored := True;
end;

function Parameter.TBodyParameter.TSchema.TXml.GetNameStored: Boolean;
begin
  Result := not FName.IsEmpty;
end;

function Parameter.TBodyParameter.TSchema.TXml.GetPrefixStored: Boolean;
begin
  Result := not FPrefix.IsEmpty;
end;

procedure Parameter.TBodyParameter.TSchema.TXml.SetWrapped(const Value: System.Boolean);
begin
  FWrapped := Value;
  FWrappedIsStored := True;
end;

function Parameter.TBodyParameter.TSchema.TXml.GetNamespaceStored: Boolean;
begin
  Result := not FNamespace.IsEmpty;
end;

{ Parameter.TBodyParameter.TSchema.TItemsProperty }

destructor Parameter.TBodyParameter.TSchema.TItemsProperty.Destroy;
begin
  FSchema.Free;

  for var AObject in FArray do
    AObject.Free;

  inherited;
end;

function Parameter.TBodyParameter.TSchema.TItemsProperty.GetSchema: Blue.Print.Open.API.Schema.v20.Parameter.TBodyParameter.TSchema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v20.Parameter.TBodyParameter.TSchema.Create;

  Result := FSchema;
end;

function Parameter.TBodyParameter.TSchema.TItemsProperty.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function Parameter.TBodyParameter.TSchema.TItemsProperty.AddArray: Blue.Print.Open.API.Schema.v20.Parameter.TBodyParameter.TSchema;
begin
  Result := Blue.Print.Open.API.Schema.v20.Parameter.TBodyParameter.TSchema.Create;

  FArray := FArray + [Result];
end;

function Parameter.TBodyParameter.TSchema.TItemsProperty.GetArrayStored: Boolean;
begin
  Result := Assigned(FArray);
end;

{ Parameter.TBodyParameter.TSchema.TExternalDocs }

function Parameter.TBodyParameter.TSchema.TExternalDocs.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

{ Parameter.TBodyParameter.TSchema.TType }

procedure Parameter.TBodyParameter.TSchema.TType.SetSimpleTypes(const Value: simpleTypes);
begin
  FSimpleTypes := Value;
  FSimpleTypesIsStored := True;
end;

function Parameter.TBodyParameter.TSchema.TType.GetArrayStored: Boolean;
begin
  Result := Assigned(FArray);
end;

{ ApiKeySecurity }

function ApiKeySecurity.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

{ HeaderParameterSubSchema }

destructor HeaderParameterSubSchema.Destroy;
begin
  FItems.Free;

  FMinLength.Free;

  FMinItems.Free;

  inherited;
end;

function HeaderParameterSubSchema.GetNameStored: Boolean;
begin
  Result := not FName.IsEmpty;
end;

procedure HeaderParameterSubSchema.SetExclusiveMaximum(const Value: System.Boolean);
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

procedure HeaderParameterSubSchema.SetExclusiveMinimum(const Value: System.Boolean);
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

procedure HeaderParameterSubSchema.SetUniqueItems(const Value: System.Boolean);
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

function HeaderParameterSubSchema.GetItems: Blue.Print.Open.API.Schema.v20.HeaderParameterSubSchema.TPrimitivesItems;
begin
  if not Assigned(FItems) then
    FItems := Blue.Print.Open.API.Schema.v20.HeaderParameterSubSchema.TPrimitivesItems.Create;

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

{ HeaderParameterSubSchema.TPrimitivesItems }

destructor HeaderParameterSubSchema.TPrimitivesItems.Destroy;
begin
  FItems.Free;

  FMinLength.Free;

  FMinItems.Free;

  inherited;
end;

procedure HeaderParameterSubSchema.TPrimitivesItems.SetExclusiveMaximum(const Value: System.Boolean);
begin
  FExclusiveMaximum := Value;
  FExclusiveMaximumIsStored := True;
end;

function HeaderParameterSubSchema.TPrimitivesItems.GetMinimumStored: Boolean;
begin
  Result := FMinimum <> 0;
end;

function HeaderParameterSubSchema.TPrimitivesItems.GetFormatStored: Boolean;
begin
  Result := not FFormat.IsEmpty;
end;

procedure HeaderParameterSubSchema.TPrimitivesItems.SetExclusiveMinimum(const Value: System.Boolean);
begin
  FExclusiveMinimum := Value;
  FExclusiveMinimumIsStored := True;
end;

function HeaderParameterSubSchema.TPrimitivesItems.GetMaxLengthStored: Boolean;
begin
  Result := FMaxLength <> 0;
end;

function HeaderParameterSubSchema.TPrimitivesItems.GetEnumStored: Boolean;
begin
  Result := Assigned(FEnum);
end;

function HeaderParameterSubSchema.TPrimitivesItems.GetMaxItemsStored: Boolean;
begin
  Result := FMaxItems <> 0;
end;

function HeaderParameterSubSchema.TPrimitivesItems.GetCollectionFormatStored: Boolean;
begin
  Result := not FCollectionFormat.IsEmpty;
end;

procedure HeaderParameterSubSchema.TPrimitivesItems.SetUniqueItems(const Value: System.Boolean);
begin
  FUniqueItems := Value;
  FUniqueItemsIsStored := True;
end;

function HeaderParameterSubSchema.TPrimitivesItems.GetMaximumStored: Boolean;
begin
  Result := FMaximum <> 0;
end;

function HeaderParameterSubSchema.TPrimitivesItems.GetDefaultStored: Boolean;
begin
  Result := False;
end;

function HeaderParameterSubSchema.TPrimitivesItems.GetPatternStored: Boolean;
begin
  Result := not FPattern.IsEmpty;
end;

function HeaderParameterSubSchema.TPrimitivesItems.GetItems: Blue.Print.Open.API.Schema.v20.HeaderParameterSubSchema.TPrimitivesItems;
begin
  if not Assigned(FItems) then
    FItems := Blue.Print.Open.API.Schema.v20.HeaderParameterSubSchema.TPrimitivesItems.Create;

  Result := FItems;
end;

function HeaderParameterSubSchema.TPrimitivesItems.GetItemsStored: Boolean;
begin
  Result := Assigned(FItems);
end;

function HeaderParameterSubSchema.TPrimitivesItems.GetMinLength: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
begin
  if not Assigned(FMinLength) then
    FMinLength := Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0.Create;

  Result := FMinLength;
end;

function HeaderParameterSubSchema.TPrimitivesItems.GetMinLengthStored: Boolean;
begin
  Result := Assigned(FMinLength);
end;

function HeaderParameterSubSchema.TPrimitivesItems.GetMinItems: Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0;
begin
  if not Assigned(FMinItems) then
    FMinItems := Blue.Print.Open.API.Schema.v20.PositiveIntegerDefault0.Create;

  Result := FMinItems;
end;

function HeaderParameterSubSchema.TPrimitivesItems.GetMinItemsStored: Boolean;
begin
  Result := Assigned(FMinItems);
end;

function HeaderParameterSubSchema.TPrimitivesItems.GetMultipleOfStored: Boolean;
begin
  Result := FMultipleOf <> 0;
end;

function HeaderParameterSubSchema.TPrimitivesItems.GetTypeStored: Boolean;
begin
  Result := not FType.IsEmpty;
end;

{ PrimitivesItems }

destructor PrimitivesItems.Destroy;
begin
  FItems.Free;

  FMinLength.Free;

  FMinItems.Free;

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

{ QueryParameterSubSchema }

destructor QueryParameterSubSchema.Destroy;
begin
  FItems.Free;

  FMinLength.Free;

  FMinItems.Free;

  inherited;
end;

function QueryParameterSubSchema.GetNameStored: Boolean;
begin
  Result := not FName.IsEmpty;
end;

procedure QueryParameterSubSchema.SetExclusiveMaximum(const Value: System.Boolean);
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

procedure QueryParameterSubSchema.SetExclusiveMinimum(const Value: System.Boolean);
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

procedure QueryParameterSubSchema.SetUniqueItems(const Value: System.Boolean);
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

{ Oauth2ApplicationSecurity }

destructor Oauth2ApplicationSecurity.Destroy;
begin
  FScopes.Free;

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

function Schema.GetAdditionalProperties: Blue.Print.Open.API.Schema.v20.Schema.TAdditionalPropertiesProperty;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := Blue.Print.Open.API.Schema.v20.Schema.TAdditionalPropertiesProperty.Create;

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

function Schema.GetXml: Blue.Print.Open.API.Schema.v20.Schema.TXml;
begin
  if not Assigned(FXml) then
    FXml := Blue.Print.Open.API.Schema.v20.Schema.TXml.Create;

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

function Schema.GetItems: Blue.Print.Open.API.Schema.v20.Schema.TItemsProperty;
begin
  if not Assigned(FItems) then
    FItems := Blue.Print.Open.API.Schema.v20.Schema.TItemsProperty.Create;

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

function Schema.GetExternalDocs: Blue.Print.Open.API.Schema.v20.Schema.TExternalDocs;
begin
  if not Assigned(FExternalDocs) then
    FExternalDocs := Blue.Print.Open.API.Schema.v20.Schema.TExternalDocs.Create;

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

{ Schema.TAdditionalPropertiesProperty }

destructor Schema.TAdditionalPropertiesProperty.Destroy;
begin
  FSchema.Free;

  inherited;
end;

function Schema.TAdditionalPropertiesProperty.GetSchema: Blue.Print.Open.API.Schema.v20.Schema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v20.Schema.Create;

  Result := FSchema;
end;

function Schema.TAdditionalPropertiesProperty.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

procedure Schema.TAdditionalPropertiesProperty.SetBoolean(const Value: System.Boolean);
begin
  FBoolean := Value;
  FBooleanIsStored := True;
end;

{ Schema.TXml }

procedure Schema.TXml.SetAttribute(const Value: System.Boolean);
begin
  FAttribute := Value;
  FAttributeIsStored := True;
end;

function Schema.TXml.GetNameStored: Boolean;
begin
  Result := not FName.IsEmpty;
end;

function Schema.TXml.GetPrefixStored: Boolean;
begin
  Result := not FPrefix.IsEmpty;
end;

procedure Schema.TXml.SetWrapped(const Value: System.Boolean);
begin
  FWrapped := Value;
  FWrappedIsStored := True;
end;

function Schema.TXml.GetNamespaceStored: Boolean;
begin
  Result := not FNamespace.IsEmpty;
end;

{ Schema.TItemsProperty }

destructor Schema.TItemsProperty.Destroy;
begin
  FSchema.Free;

  for var AObject in FArray do
    AObject.Free;

  inherited;
end;

function Schema.TItemsProperty.GetSchema: Blue.Print.Open.API.Schema.v20.Schema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v20.Schema.Create;

  Result := FSchema;
end;

function Schema.TItemsProperty.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function Schema.TItemsProperty.AddArray: Blue.Print.Open.API.Schema.v20.Schema;
begin
  Result := Blue.Print.Open.API.Schema.v20.Schema.Create;

  FArray := FArray + [Result];
end;

function Schema.TItemsProperty.GetArrayStored: Boolean;
begin
  Result := Assigned(FArray);
end;

{ Schema.TExternalDocs }

function Schema.TExternalDocs.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
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

function SecurityDefinitionsAdditionalProperties.GetOauth2ImplicitSecurity: Blue.Print.Open.API.Schema.v20.SecurityDefinitionsAdditionalProperties.TOauth2ImplicitSecurity;
begin
  if not Assigned(FOauth2ImplicitSecurity) then
    FOauth2ImplicitSecurity := Blue.Print.Open.API.Schema.v20.SecurityDefinitionsAdditionalProperties.TOauth2ImplicitSecurity.Create;

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

{ SecurityDefinitionsAdditionalProperties.TOauth2ImplicitSecurity }

destructor SecurityDefinitionsAdditionalProperties.TOauth2ImplicitSecurity.Destroy;
begin
  FScopes.Free;

  inherited;
end;

function SecurityDefinitionsAdditionalProperties.TOauth2ImplicitSecurity.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function SecurityDefinitionsAdditionalProperties.TOauth2ImplicitSecurity.GetScopes: TMap<System.String, System.String>;
begin
  if not Assigned(FScopes) then
    FScopes := TMap<System.String, System.String>.Create;

  Result := FScopes;
end;

function SecurityDefinitionsAdditionalProperties.TOauth2ImplicitSecurity.GetScopesStored: Boolean;
begin
  Result := Assigned(FScopes);
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

{ Header }

destructor Header.Destroy;
begin
  FItems.Free;

  FMinLength.Free;

  FMinItems.Free;

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

  inherited;
end;

function PathParameterSubSchema.GetNameStored: Boolean;
begin
  Result := not FName.IsEmpty;
end;

procedure PathParameterSubSchema.SetExclusiveMaximum(const Value: System.Boolean);
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

procedure PathParameterSubSchema.SetExclusiveMinimum(const Value: System.Boolean);
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

procedure PathParameterSubSchema.SetUniqueItems(const Value: System.Boolean);
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

function Tag.GetExternalDocs: Blue.Print.Open.API.Schema.v20.Tag.TExternalDocs;
begin
  if not Assigned(FExternalDocs) then
    FExternalDocs := Blue.Print.Open.API.Schema.v20.Tag.TExternalDocs.Create;

  Result := FExternalDocs;
end;

function Tag.GetExternalDocsStored: Boolean;
begin
  Result := Assigned(FExternalDocs);
end;

{ Tag.TExternalDocs }

function Tag.TExternalDocs.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

{ ExternalDocs }

function ExternalDocs.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
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

end.
