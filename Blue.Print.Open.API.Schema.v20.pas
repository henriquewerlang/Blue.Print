unit Blue.Print.Open.API.Schema.v20;

interface

{$M+}

// File generated from Open API 2.0.json;

uses Blue.Print.Types;

type
  // Forward type alias
  exclusiveMaximum = exclusiveMaximum;
  exclusiveMinimum = exclusiveMinimum;
  maxLength = maxLength;
  enum = enum;
  collectionFormat = System.String;
  mediaTypeList = TArray<mediaTypeList>;
  pattern = pattern;
  default = default;
  minLength = minLength;
  title = title;
  schemesList = TArray<System.String>;
  collectionFormatWithMulti = System.String;
  multipleOf = multipleOf;
  minimum = minimum;
  mimeType = System.String;
  security = TArray<SecurityRequirement>;
  parametersList = TArray<ParametersList>;
  maxItems = maxItems;
  uniqueItems = uniqueItems;
  description = description;
  maximum = maximum;
  minItems = minItems;

  // Forward class declaration
  TOpenAPI20 = class;
  JsonReference = class;
  ResponseDefinitions = class;
  SecurityRequirement = class;
  Operation = class;
  Responses = class;
  FormDataParameterSubSchema = class;
  Oauth2Scopes = class;
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
  VendorExtension = class;
  Definitions = class;
  BodyParameter = class;
  SecurityDefinitions = class;
  ParametersList = class;
  Oauth2ImplicitSecurity = class;
  Header = class;
  Xml = class;
  ResponseValue = class;
  ParameterDefinitions = class;
  PathParameterSubSchema = class;
  PathItem = class;
  Schema = class;
  Response = class;
  Tag = class;
  Headers = class;
  ExternalDocs = class;
  Contact = class;
  Examples = class;

  TOpenAPI20 = class
  public type
    Consumes = class
    private
      FMediaTypeList: TArray<mimeType>;
    published
      property mediaTypeList: TArray<mimeType> read FMediaTypeList write FMediaTypeList;
    end;

    Produces = class
    private
      FMediaTypeList: TArray<mimeType>;
    published
      property mediaTypeList: TArray<mimeType> read FMediaTypeList write FMediaTypeList;
    end;
  private
    FExternalDocs: ExternalDocs;
    FTags: TArray<Tag>;
    FBasePath: System.String;
    FSwagger: System.String;
    FConsumes: Consumes;
    FPaths: Paths;
    FResponses: ResponseDefinitions;
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
    function GetResponses: ResponseDefinitions;
    function GetInfo: Info;
    function GetParameters: ParameterDefinitions;
    function GetDefinitions: Definitions;
    function GetProduces: Produces;
    function GetSecurityDefinitions: SecurityDefinitions;
  public
    destructor Destroy; override;

    function AddTags: TArray<Tag>;
  published
    property externalDocs: ExternalDocs read GetExternalDocs write FExternalDocs;
    property tags: TArray<Tag> read FTags write FTags;
    property basePath: System.String read FBasePath write FBasePath;
    property swagger: System.String read FSwagger write FSwagger;
    property consumes: Consumes read GetConsumes write FConsumes;
    property paths: Paths read GetPaths write FPaths;
    property responses: ResponseDefinitions read GetResponses write FResponses;
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
  public type
    Consumes = class
    private
      FMediaTypeList: TArray<mediaTypeList>;
    published
      property mediaTypeList: TArray<mediaTypeList> read FMediaTypeList write FMediaTypeList;
    end;

    Produces = class
    private
      FMediaTypeList: TArray<mediaTypeList>;
    published
      property mediaTypeList: TArray<mediaTypeList> read FMediaTypeList write FMediaTypeList;
    end;
  private
    FTags: TArray<System.String>;
    FConsumes: Consumes;
    FDescription: System.String;
    FResponses: Responses;
    FSummary: System.String;
    FSchemes: Undefined { schemes };
    FDeprecated: System.Boolean;
    FOperationId: System.String;
    FSecurity: security;
    FParameters: Undefined { parameters };
    FExternalDocs: ExternalDocs;
    FProduces: Produces;
    function GetConsumes: Consumes;
    function GetProduces: Produces;
  public
    destructor Destroy; override;
  published
    property tags: TArray<System.String> read FTags write FTags;
    property consumes: Consumes read GetConsumes write FConsumes;
    property description: System.String read FDescription write FDescription;
    property responses: Responses read FResponses write FResponses;
    property summary: System.String read FSummary write FSummary;
    property schemes: Undefined { schemes } read FSchemes write FSchemes;
    property deprecated: System.Boolean read FDeprecated write FDeprecated;
    property operationId: System.String read FOperationId write FOperationId;
    property security: security read FSecurity write FSecurity;
    property parameters: Undefined { parameters } read FParameters write FParameters;
    property externalDocs: ExternalDocs read FExternalDocs write FExternalDocs;
    property produces: Produces read GetProduces write FProduces;
  end;

  Responses = class
  end;

  FormDataParameterSubSchema = class
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
  public
    destructor Destroy; override;
  published
    property version: System.String read FVersion write FVersion;
    property title: System.String read FTitle write FTitle;
    property license: License read FLicense write FLicense;
    property description: System.String read FDescription write FDescription;
    property termsOfService: System.String read FTermsOfService write FTermsOfService;
    property contact: Contact read FContact write FContact;
  end;

  FileSchema = class
  public type
    Example = class
    end;
  private
    FFormat: System.String;
    FDescription: description;
    FDefault: default;
    FReadOnly: System.Boolean;
    FTitle: title;
    FExternalDocs: ExternalDocs;
    FRequired: Undefined { required };
    FType: System.String;
    FExample: Example;
    function GetExample: Example;
  public
    destructor Destroy; override;
  published
    property format: System.String read FFormat write FFormat;
    property description: description read FDescription write FDescription;
    property default: default read FDefault write FDefault;
    property readOnly: System.Boolean read FReadOnly write FReadOnly;
    property title: title read FTitle write FTitle;
    property externalDocs: ExternalDocs read FExternalDocs write FExternalDocs;
    property required: Undefined { required } read FRequired write FRequired;
    [FieldName('type')]
    property &type: System.String read FType write FType;
    property example: Example read GetExample write FExample;
  end;

  NonBodyParameter = class
  end;

  Oauth2PasswordSecurity = class
  private
    FFlow: System.String;
    FDescription: System.String;
    FScopes: Oauth2Scopes;
    FType: System.String;
    FTokenUrl: System.String;
    function GetScopes: Oauth2Scopes;
  public
    destructor Destroy; override;
  published
    property flow: System.String read FFlow write FFlow;
    property description: System.String read FDescription write FDescription;
    property scopes: Oauth2Scopes read GetScopes write FScopes;
    [FieldName('type')]
    property &type: System.String read FType write FType;
    property tokenUrl: System.String read FTokenUrl write FTokenUrl;
  end;

  Oauth2AccessCodeSecurity = class
  private
    FFlow: System.String;
    FTokenUrl: System.String;
    FDescription: System.String;
    FScopes: Oauth2Scopes;
    FType: System.String;
    FAuthorizationUrl: System.String;
    function GetScopes: Oauth2Scopes;
  public
    destructor Destroy; override;
  published
    property flow: System.String read FFlow write FFlow;
    property tokenUrl: System.String read FTokenUrl write FTokenUrl;
    property description: System.String read FDescription write FDescription;
    property scopes: Oauth2Scopes read GetScopes write FScopes;
    [FieldName('type')]
    property &type: System.String read FType write FType;
    property authorizationUrl: System.String read FAuthorizationUrl write FAuthorizationUrl;
  end;

  BasicAuthenticationSecurity = class
  private
    FDescription: System.String;
    FType: System.String;
  published
    property description: System.String read FDescription write FDescription;
    [FieldName('type')]
    property &type: System.String read FType write FType;
  end;

  License = class
  private
    FUrl: System.String;
    FName: System.String;
  published
    property url: System.String read FUrl write FUrl;
    property name: System.String read FName write FName;
  end;

  Paths = class
  end;

  Parameter = class
  end;

  ApiKeySecurity = class
  private
    FName: System.String;
    FIn: System.String;
    FDescription: System.String;
    FType: System.String;
  published
    property name: System.String read FName write FName;
    property in: System.String read FIn write FIn;
    property description: System.String read FDescription write FDescription;
    [FieldName('type')]
    property &type: System.String read FType write FType;
  end;

  HeaderParameterSubSchema = class
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
    FItems: PrimitivesItems;
    FMinLength: minLength;
    FMinItems: minItems;
    FMultipleOf: multipleOf;
    FType: System.String;
    function GetItems: PrimitivesItems;
  public
    destructor Destroy; override;
  published
    property exclusiveMaximum: exclusiveMaximum read FExclusiveMaximum write FExclusiveMaximum;
    property minimum: minimum read FMinimum write FMinimum;
    property format: System.String read FFormat write FFormat;
    property exclusiveMinimum: exclusiveMinimum read FExclusiveMinimum write FExclusiveMinimum;
    property maxLength: maxLength read FMaxLength write FMaxLength;
    property enum: enum read FEnum write FEnum;
    property maxItems: maxItems read FMaxItems write FMaxItems;
    property collectionFormat: collectionFormat read FCollectionFormat write FCollectionFormat;
    property uniqueItems: uniqueItems read FUniqueItems write FUniqueItems;
    property maximum: maximum read FMaximum write FMaximum;
    property default: default read FDefault write FDefault;
    property pattern: pattern read FPattern write FPattern;
    property items: PrimitivesItems read GetItems write FItems;
    property minLength: minLength read FMinLength write FMinLength;
    property minItems: minItems read FMinItems write FMinItems;
    property multipleOf: multipleOf read FMultipleOf write FMultipleOf;
    [FieldName('type')]
    property &type: System.String read FType write FType;
  end;

  QueryParameterSubSchema = class
  end;

  Oauth2ApplicationSecurity = class
  private
    FFlow: System.String;
    FDescription: System.String;
    FScopes: Oauth2Scopes;
    FType: System.String;
    FTokenUrl: System.String;
    function GetScopes: Oauth2Scopes;
  public
    destructor Destroy; override;
  published
    property flow: System.String read FFlow write FFlow;
    property description: System.String read FDescription write FDescription;
    property scopes: Oauth2Scopes read GetScopes write FScopes;
    [FieldName('type')]
    property &type: System.String read FType write FType;
    property tokenUrl: System.String read FTokenUrl write FTokenUrl;
  end;

  VendorExtension = class
  end;

  Definitions = class
  end;

  BodyParameter = class
  private
    FName: System.String;
    FIn: System.String;
    FDescription: System.String;
    FRequired: System.Boolean;
    FSchema: Schema;
  public
    destructor Destroy; override;
  published
    property name: System.String read FName write FName;
    property in: System.String read FIn write FIn;
    property description: System.String read FDescription write FDescription;
    property required: System.Boolean read FRequired write FRequired;
    property schema: Schema read FSchema write FSchema;
  end;

  SecurityDefinitions = class
  end;

  ParametersList = class
  end;

  Oauth2ImplicitSecurity = class
  private
    FFlow: System.String;
    FDescription: System.String;
    FScopes: Oauth2Scopes;
    FType: System.String;
    FAuthorizationUrl: System.String;
    function GetScopes: Oauth2Scopes;
  public
    destructor Destroy; override;
  published
    property flow: System.String read FFlow write FFlow;
    property description: System.String read FDescription write FDescription;
    property scopes: Oauth2Scopes read GetScopes write FScopes;
    [FieldName('type')]
    property &type: System.String read FType write FType;
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
    FMaxItems: maxItems;
    FCollectionFormat: collectionFormat;
    FUniqueItems: uniqueItems;
    FDescription: System.String;
    FMaximum: maximum;
    FDefault: default;
    FPattern: pattern;
    FItems: PrimitivesItems;
    FMinLength: minLength;
    FMinItems: minItems;
    FMultipleOf: multipleOf;
    FType: System.String;
    function GetItems: PrimitivesItems;
  public
    destructor Destroy; override;
  published
    property exclusiveMaximum: exclusiveMaximum read FExclusiveMaximum write FExclusiveMaximum;
    property minimum: minimum read FMinimum write FMinimum;
    property format: System.String read FFormat write FFormat;
    property exclusiveMinimum: exclusiveMinimum read FExclusiveMinimum write FExclusiveMinimum;
    property maxLength: maxLength read FMaxLength write FMaxLength;
    property enum: enum read FEnum write FEnum;
    property maxItems: maxItems read FMaxItems write FMaxItems;
    property collectionFormat: collectionFormat read FCollectionFormat write FCollectionFormat;
    property uniqueItems: uniqueItems read FUniqueItems write FUniqueItems;
    property description: System.String read FDescription write FDescription;
    property maximum: maximum read FMaximum write FMaximum;
    property default: default read FDefault write FDefault;
    property pattern: pattern read FPattern write FPattern;
    property items: PrimitivesItems read GetItems write FItems;
    property minLength: minLength read FMinLength write FMinLength;
    property minItems: minItems read FMinItems write FMinItems;
    property multipleOf: multipleOf read FMultipleOf write FMultipleOf;
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
  published
    property attribute: System.Boolean read FAttribute write FAttribute;
    property name: System.String read FName write FName;
    property prefix: System.String read FPrefix write FPrefix;
    property wrapped: System.Boolean read FWrapped write FWrapped;
    property namespace: System.String read FNamespace write FNamespace;
  end;

  ResponseValue = class
  end;

  ParameterDefinitions = class
  end;

  PathParameterSubSchema = class
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
    FParameters: parametersList;
    FPut: Operation;
    function GetPatch: Operation;
    function GetDelete: Operation;
    function GetHead: Operation;
    function GetGet: Operation;
    function GetPost: Operation;
    function GetOptions: Operation;
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
    property parameters: parametersList read FParameters write FParameters;
    property put: Operation read GetPut write FPut;
  end;

  Schema = class
  public type
    Example = class
    end;

    AdditionalProperties = class
    end;

    Properties = class
    end;

    Items = class
    end;
  private
    FExample: Example;
    FExclusiveMaximum: exclusiveMaximum;
    FMinimum: minimum;
    FFormat: System.String;
    FExclusiveMinimum: exclusiveMinimum;
    FAdditionalProperties: AdditionalProperties;
    FAllOf: TArray<Schema>;
    FProperties: Properties;
    FDiscriminator: System.String;
    FMaxLength: maxLength;
    FEnum: enum;
    FRef: System.String;
    FMaxProperties: Undefined { maxProperties };
    FXml: Xml;
    FMaxItems: maxItems;
    FUniqueItems: uniqueItems;
    FDescription: description;
    FMaximum: maximum;
    FDefault: default;
    FPattern: pattern;
    FMinProperties: Undefined { minProperties };
    FMinLength: minLength;
    FItems: Items;
    FTitle: title;
    FReadOnly: System.Boolean;
    FMinItems: minItems;
    FExternalDocs: ExternalDocs;
    FMultipleOf: multipleOf;
    FRequired: Undefined { required };
    FType: Undefined { type };
    function GetExample: Example;
    function GetAdditionalProperties: AdditionalProperties;
    function GetProperties: Properties;
    function GetXml: Xml;
    function GetItems: Items;
  public
    destructor Destroy; override;

    function AddAllOf: TArray<Schema>;
  published
    property example: Example read GetExample write FExample;
    property exclusiveMaximum: exclusiveMaximum read FExclusiveMaximum write FExclusiveMaximum;
    property minimum: minimum read FMinimum write FMinimum;
    property format: System.String read FFormat write FFormat;
    property exclusiveMinimum: exclusiveMinimum read FExclusiveMinimum write FExclusiveMinimum;
    property additionalProperties: AdditionalProperties read GetAdditionalProperties write FAdditionalProperties;
    property allOf: TArray<Schema> read FAllOf write FAllOf;
    property properties: Properties read GetProperties write FProperties;
    property discriminator: System.String read FDiscriminator write FDiscriminator;
    property maxLength: maxLength read FMaxLength write FMaxLength;
    property enum: enum read FEnum write FEnum;
    [FieldName('$ref')]
    property ref: System.String read FRef write FRef;
    property maxProperties: Undefined { maxProperties } read FMaxProperties write FMaxProperties;
    property xml: Xml read GetXml write FXml;
    property maxItems: maxItems read FMaxItems write FMaxItems;
    property uniqueItems: uniqueItems read FUniqueItems write FUniqueItems;
    property description: description read FDescription write FDescription;
    property maximum: maximum read FMaximum write FMaximum;
    property default: default read FDefault write FDefault;
    property pattern: pattern read FPattern write FPattern;
    property minProperties: Undefined { minProperties } read FMinProperties write FMinProperties;
    property minLength: minLength read FMinLength write FMinLength;
    property items: Items read GetItems write FItems;
    property title: title read FTitle write FTitle;
    property readOnly: System.Boolean read FReadOnly write FReadOnly;
    property minItems: minItems read FMinItems write FMinItems;
    property externalDocs: ExternalDocs read FExternalDocs write FExternalDocs;
    property multipleOf: multipleOf read FMultipleOf write FMultipleOf;
    property required: Undefined { required } read FRequired write FRequired;
    [FieldName('type')]
    property &type: Undefined { type } read FType write FType;
  end;

  Response = class
  public type
    Schema = class
    end;
  private
    FHeaders: Headers;
    FDescription: System.String;
    FSchema: Schema;
    FExamples: Examples;
    function GetSchema: Schema;
  public
    destructor Destroy; override;
  published
    property headers: Headers read FHeaders write FHeaders;
    property description: System.String read FDescription write FDescription;
    property schema: Schema read GetSchema write FSchema;
    property examples: Examples read FExamples write FExamples;
  end;

  Tag = class
  private
    FName: System.String;
    FDescription: System.String;
    FExternalDocs: ExternalDocs;
  public
    destructor Destroy; override;
  published
    property name: System.String read FName write FName;
    property description: System.String read FDescription write FDescription;
    property externalDocs: ExternalDocs read FExternalDocs write FExternalDocs;
  end;

  Headers = class
  end;

  ExternalDocs = class
  private
    FDescription: System.String;
    FUrl: System.String;
  published
    property description: System.String read FDescription write FDescription;
    property url: System.String read FUrl write FUrl;
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

  Examples = class
  end;

implementation

uses System.SysUtils;

{ TOpenAPI20 }

destructor TOpenAPI20.Destroy;
begin
  FExternalDocs.Free;

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

function TOpenAPI20.GetExternalDocs: ExternalDocs;
begin
  if not Assigned(FExternalDocs) then
    FExternalDocs := ExternalDocs.Create;

  Result := FExternalDocs;
end;

function TOpenAPI20.AddTags: TArray<Tag>;
begin
  Result := Tag.Create;

  FTags := FTags + [Result];
end;

function TOpenAPI20.GetConsumes: Consumes;
begin
  if not Assigned(FConsumes) then
    FConsumes := Consumes.Create;

  Result := FConsumes;
end;

function TOpenAPI20.GetPaths: Paths;
begin
  if not Assigned(FPaths) then
    FPaths := Paths.Create;

  Result := FPaths;
end;

function TOpenAPI20.GetResponses: ResponseDefinitions;
begin
  if not Assigned(FResponses) then
    FResponses := ResponseDefinitions.Create;

  Result := FResponses;
end;

function TOpenAPI20.GetInfo: Info;
begin
  if not Assigned(FInfo) then
    FInfo := Info.Create;

  Result := FInfo;
end;

function TOpenAPI20.GetParameters: ParameterDefinitions;
begin
  if not Assigned(FParameters) then
    FParameters := ParameterDefinitions.Create;

  Result := FParameters;
end;

function TOpenAPI20.GetDefinitions: Definitions;
begin
  if not Assigned(FDefinitions) then
    FDefinitions := Definitions.Create;

  Result := FDefinitions;
end;

function TOpenAPI20.GetProduces: Produces;
begin
  if not Assigned(FProduces) then
    FProduces := Produces.Create;

  Result := FProduces;
end;

function TOpenAPI20.GetSecurityDefinitions: SecurityDefinitions;
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

function Operation.GetProduces: Produces;
begin
  if not Assigned(FProduces) then
    FProduces := Produces.Create;

  Result := FProduces;
end;

{ Info }

destructor Info.Destroy;
begin
  FLicense.Free;

  FContact.Free;

  inherited;
end;

{ FileSchema }

destructor FileSchema.Destroy;
begin
  FExternalDocs.Free;

  FExample.Free;

  inherited;
end;

function FileSchema.GetExample: Example;
begin
  if not Assigned(FExample) then
    FExample := Example.Create;

  Result := FExample;
end;

{ Oauth2PasswordSecurity }

destructor Oauth2PasswordSecurity.Destroy;
begin
  FScopes.Free;

  inherited;
end;

function Oauth2PasswordSecurity.GetScopes: Oauth2Scopes;
begin
  if not Assigned(FScopes) then
    FScopes := Oauth2Scopes.Create;

  Result := FScopes;
end;

{ Oauth2AccessCodeSecurity }

destructor Oauth2AccessCodeSecurity.Destroy;
begin
  FScopes.Free;

  inherited;
end;

function Oauth2AccessCodeSecurity.GetScopes: Oauth2Scopes;
begin
  if not Assigned(FScopes) then
    FScopes := Oauth2Scopes.Create;

  Result := FScopes;
end;

{ PrimitivesItems }

destructor PrimitivesItems.Destroy;
begin
  FItems.Free;

  inherited;
end;

function PrimitivesItems.GetItems: PrimitivesItems;
begin
  if not Assigned(FItems) then
    FItems := PrimitivesItems.Create;

  Result := FItems;
end;

{ Oauth2ApplicationSecurity }

destructor Oauth2ApplicationSecurity.Destroy;
begin
  FScopes.Free;

  inherited;
end;

function Oauth2ApplicationSecurity.GetScopes: Oauth2Scopes;
begin
  if not Assigned(FScopes) then
    FScopes := Oauth2Scopes.Create;

  Result := FScopes;
end;

{ BodyParameter }

destructor BodyParameter.Destroy;
begin
  FSchema.Free;

  inherited;
end;

{ Oauth2ImplicitSecurity }

destructor Oauth2ImplicitSecurity.Destroy;
begin
  FScopes.Free;

  inherited;
end;

function Oauth2ImplicitSecurity.GetScopes: Oauth2Scopes;
begin
  if not Assigned(FScopes) then
    FScopes := Oauth2Scopes.Create;

  Result := FScopes;
end;

{ Header }

destructor Header.Destroy;
begin
  FItems.Free;

  inherited;
end;

function Header.GetItems: PrimitivesItems;
begin
  if not Assigned(FItems) then
    FItems := PrimitivesItems.Create;

  Result := FItems;
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

function PathItem.GetPut: Operation;
begin
  if not Assigned(FPut) then
    FPut := Operation.Create;

  Result := FPut;
end;

{ Schema }

destructor Schema.Destroy;
begin
  FExample.Free;

  FAdditionalProperties.Free;

  FProperties.Free;

  FXml.Free;

  FItems.Free;

  FExternalDocs.Free;

  inherited;
end;

function Schema.GetExample: Example;
begin
  if not Assigned(FExample) then
    FExample := Example.Create;

  Result := FExample;
end;

function Schema.GetAdditionalProperties: AdditionalProperties;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := AdditionalProperties.Create;

  Result := FAdditionalProperties;
end;

function Schema.AddAllOf: TArray<Schema>;
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

function Schema.GetItems: Items;
begin
  if not Assigned(FItems) then
    FItems := Items.Create;

  Result := FItems;
end;

{ Response }

destructor Response.Destroy;
begin
  FHeaders.Free;

  FSchema.Free;

  FExamples.Free;

  inherited;
end;

function Response.GetSchema: Schema;
begin
  if not Assigned(FSchema) then
    FSchema := Schema.Create;

  Result := FSchema;
end;

{ Tag }

destructor Tag.Destroy;
begin
  FExternalDocs.Free;

  inherited;
end;

end.
