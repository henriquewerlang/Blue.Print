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
  public
    destructor Destroy; override;
  published
    property anyOf: schemaArray read FAnyOf write FAnyOf;
    property exclusiveMaximum: System.Boolean read FExclusiveMaximum write FExclusiveMaximum;
    property format: System.String read FFormat write FFormat;
    property exclusiveMinimum: System.Boolean read FExclusiveMinimum write FExclusiveMinimum;
    property allOf: schemaArray read FAllOf write FAllOf;
    [FieldName('$schema')]
    property schema: System.String read FSchema write FSchema;
    property properties: Properties read GetProperties write FProperties;
    property not: TSchema read GetNot write FNot;
    property maxLength: positiveInteger read FMaxLength write FMaxLength;
    property enum: TArray<any> read FEnum write FEnum;
    property additionalItems: AdditionalItems read GetAdditionalItems write FAdditionalItems;
    property id: System.String read FId write FId;
    property pattern: System.String read FPattern write FPattern;
    property default: any read FDefault write FDefault;
    property minProperties: PositiveIntegerDefault0 read GetMinProperties write FMinProperties;
    property minLength: PositiveIntegerDefault0 read GetMinLength write FMinLength;
    property title: System.String read FTitle write FTitle;
    property multipleOf: System.Double read FMultipleOf write FMultipleOf;
    property patternProperties: PatternProperties read GetPatternProperties write FPatternProperties;
    property oneOf: schemaArray read FOneOf write FOneOf;
    property minimum: System.Double read FMinimum write FMinimum;
    property dependencies: Dependencies read GetDependencies write FDependencies;
    property additionalProperties: AdditionalProperties read GetAdditionalProperties write FAdditionalProperties;
    property definitions: Definitions read GetDefinitions write FDefinitions;
    property maxProperties: positiveInteger read FMaxProperties write FMaxProperties;
    property maxItems: positiveInteger read FMaxItems write FMaxItems;
    property uniqueItems: System.Boolean read FUniqueItems write FUniqueItems;
    property description: System.String read FDescription write FDescription;
    property maximum: System.Double read FMaximum write FMaximum;
    property items: Items read GetItems write FItems;
    property minItems: PositiveIntegerDefault0 read GetMinItems write FMinItems;
    property required: stringArray read FRequired write FRequired;
    [FieldName('type')]
    property &type: Type read GetType write FType;
  end;

  [SingleObject]
  PositiveIntegerDefault0 = class
  private
    FPositiveInteger: System.Integer;
  published
    property positiveInteger: System.Integer read FPositiveInteger write FPositiveInteger;
  end;

  Properties = class
  end;

  [SingleObject]
  AdditionalItems = class
  private
    FBoolean: System.Boolean;
    FSchema: TSchema;
    function GetSchema: TSchema;
  public
    destructor Destroy; override;
  published
    property boolean: System.Boolean read FBoolean write FBoolean;
    property Schema: TSchema read GetSchema write FSchema;
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
  public
    destructor Destroy; override;
  published
    property boolean: System.Boolean read FBoolean write FBoolean;
    property Schema: TSchema read GetSchema write FSchema;
  end;

  Definitions = class
  end;

  [SingleObject]
  Items = class
  private
    FSchema: TSchema;
    FSchemaArray: schemaArray;
    function GetSchema: TSchema;
  public
    destructor Destroy; override;
  published
    property Schema: TSchema read GetSchema write FSchema;
    property schemaArray: schemaArray read FSchemaArray write FSchemaArray;
  end;

  [SingleObject]
  Type = class
  private
    FSimpleTypes: simpleTypes;
    FArray: TArray<simpleTypes>;
  published
    property simpleTypes: simpleTypes read FSimpleTypes write FSimpleTypes;
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
  public
    destructor Destroy; override;

    function AddTags: Tag;
  published
    property externalDocs: ExternalDocs read GetExternalDocs write FExternalDocs;
    property tags: TArray<Tag> read FTags write FTags;
    property basePath: System.String read FBasePath write FBasePath;
    property swagger: System.String read FSwagger write FSwagger;
    property consumes: Consumes read GetConsumes write FConsumes;
    property paths: Paths read GetPaths write FPaths;
    property responses: Responses read GetResponses write FResponses;
    property info: Info read GetInfo write FInfo;
    property schemes: schemesList read FSchemes write FSchemes;
    property security: security read FSecurity write FSecurity;
    property parameters: ParameterDefinitions read GetParameters write FParameters;
    property definitions: Definitions read GetDefinitions write FDefinitions;
    property produces: Produces read GetProduces write FProduces;
    property host: System.String read FHost write FHost;
    property securityDefinitions: SecurityDefinitions read GetSecurityDefinitions write FSecurityDefinitions;
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
  public
    destructor Destroy; override;

    function AddSecurity: SecurityRequirement;
    function AddParameters: ParametersList;
  published
    property tags: TArray<System.String> read FTags write FTags;
    property consumes: Consumes read GetConsumes write FConsumes;
    property description: System.String read FDescription write FDescription;
    property responses: Responses read GetResponses write FResponses;
    property summary: System.String read FSummary write FSummary;
    property schemes: TArray<System.String> read FSchemes write FSchemes;
    property deprecated: System.Boolean read FDeprecated write FDeprecated;
    property operationId: System.String read FOperationId write FOperationId;
    property security: TArray<SecurityRequirement> read FSecurity write FSecurity;
    property parameters: TArray<ParametersList> read FParameters write FParameters;
    property externalDocs: ExternalDocs read GetExternalDocs write FExternalDocs;
    property produces: Produces read GetProduces write FProduces;
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
  public
    destructor Destroy; override;
  published
    property parameter: Parameter read GetParameter write FParameter;
    property jsonReference: JsonReference read GetJsonReference write FJsonReference;
  end;

  [SingleObject]
  Parameter = class
  private
    FBodyParameter: BodyParameter;
    FNonBodyParameter: NonBodyParameter;
    function GetBodyParameter: BodyParameter;
    function GetNonBodyParameter: NonBodyParameter;
  public
    destructor Destroy; override;
  published
    property bodyParameter: BodyParameter read GetBodyParameter write FBodyParameter;
    property nonBodyParameter: NonBodyParameter read GetNonBodyParameter write FNonBodyParameter;
  end;

  BodyParameter = class
  private
    FName: System.String;
    FIn: System.String;
    FDescription: System.String;
    FRequired: System.Boolean;
    FSchema: Schema;
    function GetSchema: Schema;
  public
    destructor Destroy; override;
  published
    property name: System.String read FName write FName;
    property in: System.String read FIn write FIn;
    property description: System.String read FDescription write FDescription;
    property required: System.Boolean read FRequired write FRequired;
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
  public
    destructor Destroy; override;

    function AddAllOf: Schema;
  published
    property example: any read FExample write FExample;
    property exclusiveMaximum: exclusiveMaximum read FExclusiveMaximum write FExclusiveMaximum;
    property minimum: System.Double read FMinimum write FMinimum;
    property format: System.String read FFormat write FFormat;
    property exclusiveMinimum: System.Boolean read FExclusiveMinimum write FExclusiveMinimum;
    property additionalProperties: AdditionalProperties read GetAdditionalProperties write FAdditionalProperties;
    property allOf: TArray<Schema> read FAllOf write FAllOf;
    property properties: Properties read GetProperties write FProperties;
    property discriminator: System.String read FDiscriminator write FDiscriminator;
    property maxLength: positiveInteger read FMaxLength write FMaxLength;
    property enum: TArray<any> read FEnum write FEnum;
    [FieldName('$ref')]
    property ref: System.String read FRef write FRef;
    property maxProperties: positiveInteger read FMaxProperties write FMaxProperties;
    property xml: Xml read GetXml write FXml;
    property maxItems: positiveInteger read FMaxItems write FMaxItems;
    property uniqueItems: System.Boolean read FUniqueItems write FUniqueItems;
    property description: System.String read FDescription write FDescription;
    property maximum: System.Double read FMaximum write FMaximum;
    property default: any read FDefault write FDefault;
    property pattern: System.String read FPattern write FPattern;
    property minProperties: PositiveIntegerDefault0 read GetMinProperties write FMinProperties;
    property minLength: PositiveIntegerDefault0 read GetMinLength write FMinLength;
    property items: Items read GetItems write FItems;
    property title: System.String read FTitle write FTitle;
    property readOnly: System.Boolean read FReadOnly write FReadOnly;
    property minItems: PositiveIntegerDefault0 read GetMinItems write FMinItems;
    property externalDocs: ExternalDocs read GetExternalDocs write FExternalDocs;
    property multipleOf: System.Double read FMultipleOf write FMultipleOf;
    property required: stringArray read FRequired write FRequired;
    [FieldName('type')]
    property &type: Type read GetType write FType;
  end;

  Xml = class
  private
    FAttribute: System.Boolean;
    FName: System.String;
    FPrefix: System.String;
    FWrapped: System.Boolean;
    FNamespace: System.String;
  published
    property attribute: System.Boolean read FAttribute write FAttribute;
    property name: System.String read FName write FName;
    property prefix: System.String read FPrefix write FPrefix;
    property wrapped: System.Boolean read FWrapped write FWrapped;
    property namespace: System.String read FNamespace write FNamespace;
  end;

  ExternalDocs = class
  private
    FDescription: System.String;
    FUrl: System.String;
  published
    property description: System.String read FDescription write FDescription;
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
  public
    destructor Destroy; override;
  published
    property version: System.String read FVersion write FVersion;
    property title: System.String read FTitle write FTitle;
    property license: License read GetLicense write FLicense;
    property description: System.String read FDescription write FDescription;
    property termsOfService: System.String read FTermsOfService write FTermsOfService;
    property contact: Contact read GetContact write FContact;
  end;

  License = class
  private
    FUrl: System.String;
    FName: System.String;
  published
    property url: System.String read FUrl write FUrl;
    property name: System.String read FName write FName;
  end;

  Contact = class
  private
    FEmail: System.String;
    FName: System.String;
    FUrl: System.String;
  published
    property email: System.String read FEmail write FEmail;
    property name: System.String read FName write FName;
    property url: System.String read FUrl write FUrl;
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
  public
    destructor Destroy; override;
  published
    property format: System.String read FFormat write FFormat;
    property description: System.String read FDescription write FDescription;
    property default: any read FDefault write FDefault;
    property readOnly: System.Boolean read FReadOnly write FReadOnly;
    property title: System.String read FTitle write FTitle;
    property externalDocs: ExternalDocs read GetExternalDocs write FExternalDocs;
    property required: stringArray read FRequired write FRequired;
    [FieldName('type')]
    property &type: Type read GetType write FType;
    property example: any read FExample write FExample;
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
  public
    destructor Destroy; override;
  published
    property flow: System.String read FFlow write FFlow;
    property description: System.String read FDescription write FDescription;
    property scopes: Oauth2Scopes read GetScopes write FScopes;
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
  public
    destructor Destroy; override;
  published
    property flow: System.String read FFlow write FFlow;
    property tokenUrl: System.String read FTokenUrl write FTokenUrl;
    property description: System.String read FDescription write FDescription;
    property scopes: Oauth2Scopes read GetScopes write FScopes;
    [FieldName('type')]
    property &type: Type read GetType write FType;
    property authorizationUrl: System.String read FAuthorizationUrl write FAuthorizationUrl;
  end;

  BasicAuthenticationSecurity = class
  private
    FDescription: System.String;
    FType: Type;
    function GetType: Type;
  public
    destructor Destroy; override;
  published
    property description: System.String read FDescription write FDescription;
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
  public
    destructor Destroy; override;
  published
    property name: System.String read FName write FName;
    property in: System.String read FIn write FIn;
    property description: System.String read FDescription write FDescription;
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
  public
    destructor Destroy; override;
  published
    property exclusiveMaximum: exclusiveMaximum read FExclusiveMaximum write FExclusiveMaximum;
    property minimum: minimum read FMinimum write FMinimum;
    property format: System.String read FFormat write FFormat;
    property exclusiveMinimum: exclusiveMinimum read FExclusiveMinimum write FExclusiveMinimum;
    property maxLength: maxLength read FMaxLength write FMaxLength;
    property enum: enum read FEnum write FEnum;
    property maxItems: positiveInteger read FMaxItems write FMaxItems;
    property collectionFormat: collectionFormat read FCollectionFormat write FCollectionFormat;
    property uniqueItems: System.Boolean read FUniqueItems write FUniqueItems;
    property maximum: System.Double read FMaximum write FMaximum;
    property default: default read FDefault write FDefault;
    property pattern: pattern read FPattern write FPattern;
    property items: Items read GetItems write FItems;
    property minLength: PositiveIntegerDefault0 read GetMinLength write FMinLength;
    property minItems: PositiveIntegerDefault0 read GetMinItems write FMinItems;
    property multipleOf: multipleOf read FMultipleOf write FMultipleOf;
    [FieldName('type')]
    property &type: Type read GetType write FType;
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
  public
    destructor Destroy; override;
  published
    property flow: System.String read FFlow write FFlow;
    property description: System.String read FDescription write FDescription;
    property scopes: Oauth2Scopes read GetScopes write FScopes;
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
  public
    destructor Destroy; override;
  published
    property flow: System.String read FFlow write FFlow;
    property description: System.String read FDescription write FDescription;
    property scopes: Oauth2Scopes read GetScopes write FScopes;
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
  public
    destructor Destroy; override;
  published
    property exclusiveMaximum: exclusiveMaximum read FExclusiveMaximum write FExclusiveMaximum;
    property minimum: minimum read FMinimum write FMinimum;
    property format: System.String read FFormat write FFormat;
    property exclusiveMinimum: exclusiveMinimum read FExclusiveMinimum write FExclusiveMinimum;
    property maxLength: maxLength read FMaxLength write FMaxLength;
    property enum: enum read FEnum write FEnum;
    property maxItems: positiveInteger read FMaxItems write FMaxItems;
    property collectionFormat: collectionFormat read FCollectionFormat write FCollectionFormat;
    property uniqueItems: System.Boolean read FUniqueItems write FUniqueItems;
    property description: System.String read FDescription write FDescription;
    property maximum: System.Double read FMaximum write FMaximum;
    property default: default read FDefault write FDefault;
    property pattern: pattern read FPattern write FPattern;
    property items: Items read GetItems write FItems;
    property minLength: PositiveIntegerDefault0 read GetMinLength write FMinLength;
    property minItems: PositiveIntegerDefault0 read GetMinItems write FMinItems;
    property multipleOf: multipleOf read FMultipleOf write FMultipleOf;
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
  public
    destructor Destroy; override;
  published
    property response: Response read GetResponse write FResponse;
    property jsonReference: JsonReference read GetJsonReference write FJsonReference;
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
  public
    destructor Destroy; override;
  published
    property headers: Headers read GetHeaders write FHeaders;
    property description: System.String read FDescription write FDescription;
    property schema: Schema read GetSchema write FSchema;
    property examples: Examples read GetExamples write FExamples;
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
  public
    destructor Destroy; override;
  published
    [FieldName('$ref')]
    property ref: System.String read FRef write FRef;
    property patch: Operation read GetPatch write FPatch;
    property delete: Operation read GetDelete write FDelete;
    property head: Operation read GetHead write FHead;
    property get: Operation read GetGet write FGet;
    property post: Operation read GetPost write FPost;
    property options: Operation read GetOptions write FOptions;
    property parameters: ParametersList read GetParameters write FParameters;
    property put: Operation read GetPut write FPut;
  end;

  Tag = class
  private
    FName: System.String;
    FDescription: description;
    FExternalDocs: ExternalDocs;
    function GetExternalDocs: ExternalDocs;
  public
    destructor Destroy; override;
  published
    property name: System.String read FName write FName;
    property description: description read FDescription write FDescription;
    property externalDocs: ExternalDocs read GetExternalDocs write FExternalDocs;
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

function TSchema.GetProperties: Properties;
begin
  if not Assigned(FProperties) then
    FProperties := Properties.Create;

  Result := FProperties;
end;

function TSchema.GetNot: TSchema;
begin
  if not Assigned(FNot) then
    FNot := TSchema.Create;

  Result := FNot;
end;

function TSchema.GetAdditionalItems: AdditionalItems;
begin
  if not Assigned(FAdditionalItems) then
    FAdditionalItems := AdditionalItems.Create;

  Result := FAdditionalItems;
end;

function TSchema.GetMinProperties: PositiveIntegerDefault0;
begin
  if not Assigned(FMinProperties) then
    FMinProperties := PositiveIntegerDefault0.Create;

  Result := FMinProperties;
end;

function TSchema.GetMinLength: PositiveIntegerDefault0;
begin
  if not Assigned(FMinLength) then
    FMinLength := PositiveIntegerDefault0.Create;

  Result := FMinLength;
end;

function TSchema.GetPatternProperties: PatternProperties;
begin
  if not Assigned(FPatternProperties) then
    FPatternProperties := PatternProperties.Create;

  Result := FPatternProperties;
end;

function TSchema.GetDependencies: Dependencies;
begin
  if not Assigned(FDependencies) then
    FDependencies := Dependencies.Create;

  Result := FDependencies;
end;

function TSchema.GetAdditionalProperties: AdditionalProperties;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := AdditionalProperties.Create;

  Result := FAdditionalProperties;
end;

function TSchema.GetDefinitions: Definitions;
begin
  if not Assigned(FDefinitions) then
    FDefinitions := Definitions.Create;

  Result := FDefinitions;
end;

function TSchema.GetItems: Items;
begin
  if not Assigned(FItems) then
    FItems := Items.Create;

  Result := FItems;
end;

function TSchema.GetMinItems: PositiveIntegerDefault0;
begin
  if not Assigned(FMinItems) then
    FMinItems := PositiveIntegerDefault0.Create;

  Result := FMinItems;
end;

function TSchema.GetType: Type;
begin
  if not Assigned(FType) then
    FType := Type.Create;

  Result := FType;
end;

{ AdditionalItems }

destructor AdditionalItems.Destroy;
begin
  FSchema.Free;

  inherited;
end;

function AdditionalItems.GetSchema: TSchema;
begin
  if not Assigned(FSchema) then
    FSchema := TSchema.Create;

  Result := FSchema;
end;

{ AdditionalProperties }

destructor AdditionalProperties.Destroy;
begin
  FSchema.Free;

  inherited;
end;

function AdditionalProperties.GetSchema: TSchema;
begin
  if not Assigned(FSchema) then
    FSchema := TSchema.Create;

  Result := FSchema;
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

function TSchemaOpenAPI20.AddTags: Tag;
begin
  Result := Tag.Create;

  FTags := FTags + [Result];
end;

function TSchemaOpenAPI20.GetConsumes: Consumes;
begin
  if not Assigned(FConsumes) then
    FConsumes := Consumes.Create;

  Result := FConsumes;
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

function TSchemaOpenAPI20.GetInfo: Info;
begin
  if not Assigned(FInfo) then
    FInfo := Info.Create;

  Result := FInfo;
end;

function TSchemaOpenAPI20.GetParameters: ParameterDefinitions;
begin
  if not Assigned(FParameters) then
    FParameters := ParameterDefinitions.Create;

  Result := FParameters;
end;

function TSchemaOpenAPI20.GetDefinitions: Definitions;
begin
  if not Assigned(FDefinitions) then
    FDefinitions := Definitions.Create;

  Result := FDefinitions;
end;

function TSchemaOpenAPI20.GetProduces: Produces;
begin
  if not Assigned(FProduces) then
    FProduces := Produces.Create;

  Result := FProduces;
end;

function TSchemaOpenAPI20.GetSecurityDefinitions: SecurityDefinitions;
begin
  if not Assigned(FSecurityDefinitions) then
    FSecurityDefinitions := SecurityDefinitions.Create;

  Result := FSecurityDefinitions;
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

function Operation.GetResponses: Responses;
begin
  if not Assigned(FResponses) then
    FResponses := Responses.Create;

  Result := FResponses;
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

function Operation.GetProduces: Produces;
begin
  if not Assigned(FProduces) then
    FProduces := Produces.Create;

  Result := FProduces;
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

function ParametersList.GetJsonReference: JsonReference;
begin
  if not Assigned(FJsonReference) then
    FJsonReference := JsonReference.Create;

  Result := FJsonReference;
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

function Parameter.GetNonBodyParameter: NonBodyParameter;
begin
  if not Assigned(FNonBodyParameter) then
    FNonBodyParameter := NonBodyParameter.Create;

  Result := FNonBodyParameter;
end;

{ BodyParameter }

destructor BodyParameter.Destroy;
begin
  FSchema.Free;

  inherited;
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

function Schema.GetAdditionalProperties: AdditionalProperties;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := AdditionalProperties.Create;

  Result := FAdditionalProperties;
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

function Schema.GetXml: Xml;
begin
  if not Assigned(FXml) then
    FXml := Xml.Create;

  Result := FXml;
end;

function Schema.GetMinProperties: PositiveIntegerDefault0;
begin
  if not Assigned(FMinProperties) then
    FMinProperties := PositiveIntegerDefault0.Create;

  Result := FMinProperties;
end;

function Schema.GetMinLength: PositiveIntegerDefault0;
begin
  if not Assigned(FMinLength) then
    FMinLength := PositiveIntegerDefault0.Create;

  Result := FMinLength;
end;

function Schema.GetItems: Items;
begin
  if not Assigned(FItems) then
    FItems := Items.Create;

  Result := FItems;
end;

function Schema.GetMinItems: PositiveIntegerDefault0;
begin
  if not Assigned(FMinItems) then
    FMinItems := PositiveIntegerDefault0.Create;

  Result := FMinItems;
end;

function Schema.GetExternalDocs: ExternalDocs;
begin
  if not Assigned(FExternalDocs) then
    FExternalDocs := ExternalDocs.Create;

  Result := FExternalDocs;
end;

function Schema.GetType: Type;
begin
  if not Assigned(FType) then
    FType := Type.Create;

  Result := FType;
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

function Info.GetContact: Contact;
begin
  if not Assigned(FContact) then
    FContact := Contact.Create;

  Result := FContact;
end;

{ FileSchema }

destructor FileSchema.Destroy;
begin
  FExternalDocs.Free;

  FType.Free;

  inherited;
end;

function FileSchema.GetExternalDocs: ExternalDocs;
begin
  if not Assigned(FExternalDocs) then
    FExternalDocs := ExternalDocs.Create;

  Result := FExternalDocs;
end;

function FileSchema.GetType: Type;
begin
  if not Assigned(FType) then
    FType := Type.Create;

  Result := FType;
end;

{ Oauth2PasswordSecurity }

destructor Oauth2PasswordSecurity.Destroy;
begin
  FScopes.Free;

  FType.Free;

  inherited;
end;

function Oauth2PasswordSecurity.GetScopes: Oauth2Scopes;
begin
  if not Assigned(FScopes) then
    FScopes := Oauth2Scopes.Create;

  Result := FScopes;
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

function Oauth2AccessCodeSecurity.GetScopes: Oauth2Scopes;
begin
  if not Assigned(FScopes) then
    FScopes := Oauth2Scopes.Create;

  Result := FScopes;
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

function PrimitivesItems.GetItems: Items;
begin
  if not Assigned(FItems) then
    FItems := Items.Create;

  Result := FItems;
end;

function PrimitivesItems.GetMinLength: PositiveIntegerDefault0;
begin
  if not Assigned(FMinLength) then
    FMinLength := PositiveIntegerDefault0.Create;

  Result := FMinLength;
end;

function PrimitivesItems.GetMinItems: PositiveIntegerDefault0;
begin
  if not Assigned(FMinItems) then
    FMinItems := PositiveIntegerDefault0.Create;

  Result := FMinItems;
end;

function PrimitivesItems.GetType: Type;
begin
  if not Assigned(FType) then
    FType := Type.Create;

  Result := FType;
end;

{ Oauth2ApplicationSecurity }

destructor Oauth2ApplicationSecurity.Destroy;
begin
  FScopes.Free;

  FType.Free;

  inherited;
end;

function Oauth2ApplicationSecurity.GetScopes: Oauth2Scopes;
begin
  if not Assigned(FScopes) then
    FScopes := Oauth2Scopes.Create;

  Result := FScopes;
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

function Oauth2ImplicitSecurity.GetScopes: Oauth2Scopes;
begin
  if not Assigned(FScopes) then
    FScopes := Oauth2Scopes.Create;

  Result := FScopes;
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

function Header.GetItems: Items;
begin
  if not Assigned(FItems) then
    FItems := Items.Create;

  Result := FItems;
end;

function Header.GetMinLength: PositiveIntegerDefault0;
begin
  if not Assigned(FMinLength) then
    FMinLength := PositiveIntegerDefault0.Create;

  Result := FMinLength;
end;

function Header.GetMinItems: PositiveIntegerDefault0;
begin
  if not Assigned(FMinItems) then
    FMinItems := PositiveIntegerDefault0.Create;

  Result := FMinItems;
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

function ResponseValue.GetJsonReference: JsonReference;
begin
  if not Assigned(FJsonReference) then
    FJsonReference := JsonReference.Create;

  Result := FJsonReference;
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

function Response.GetSchema: Schema;
begin
  if not Assigned(FSchema) then
    FSchema := Schema.Create;

  Result := FSchema;
end;

function Response.GetExamples: Examples;
begin
  if not Assigned(FExamples) then
    FExamples := Examples.Create;

  Result := FExamples;
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

function PathItem.GetPatch: Operation;
begin
  if not Assigned(FPatch) then
    FPatch := Operation.Create;

  Result := FPatch;
end;

function PathItem.GetDelete: Operation;
begin
  if not Assigned(FDelete) then
    FDelete := Operation.Create;

  Result := FDelete;
end;

function PathItem.GetHead: Operation;
begin
  if not Assigned(FHead) then
    FHead := Operation.Create;

  Result := FHead;
end;

function PathItem.GetGet: Operation;
begin
  if not Assigned(FGet) then
    FGet := Operation.Create;

  Result := FGet;
end;

function PathItem.GetPost: Operation;
begin
  if not Assigned(FPost) then
    FPost := Operation.Create;

  Result := FPost;
end;

function PathItem.GetOptions: Operation;
begin
  if not Assigned(FOptions) then
    FOptions := Operation.Create;

  Result := FOptions;
end;

function PathItem.GetParameters: ParametersList;
begin
  if not Assigned(FParameters) then
    FParameters := ParametersList.Create;

  Result := FParameters;
end;

function PathItem.GetPut: Operation;
begin
  if not Assigned(FPut) then
    FPut := Operation.Create;

  Result := FPut;
end;

{ Tag }

destructor Tag.Destroy;
begin
  FExternalDocs.Free;

  inherited;
end;

function Tag.GetExternalDocs: ExternalDocs;
begin
  if not Assigned(FExternalDocs) then
    FExternalDocs := ExternalDocs.Create;

  Result := FExternalDocs;
end;

end.
