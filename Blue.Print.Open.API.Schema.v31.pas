unit Blue.Print.Open.API.Schema.v31;

interface

{$M+}
{$SCOPEDENUMS ON}

// File generated from https://spec.openapis.org/oas/3.1/schema/2025-11-23;

uses Blue.Print.Types, Blue.Print.JSON.Draft2022.Schema, System.Rtti;

type
  // Forward class declaration
  Info = class;
  Contact = class;
  License = class;
  Server = class;
  ServerVariable = class;
  Components = class;
  Paths = class;
  PathItem = class;
  Operation = class;
  ExternalDocumentation = class;
  Parameter = class;
  RequestBody = class;
  Content = class;
  MediaType = class;
  Encoding = class;
  Responses = class;
  Response = class;
  Callbacks = class;
  Example = class;
  Link = class;
  Header = class;
  Tag = class;
  Reference = class;
  Schema = class;
  SecurityScheme = class;
  OauthFlows = class;
  SecurityRequirement = class;
  SpecificationExtensions = class;
  MapOfStrings = class;

  // Forward type alias
  parameter-or-reference = System.Rtti.TValue;
  request-body-or-reference = System.Rtti.TValue;
  response-or-reference = System.Rtti.TValue;
  callbacks-or-reference = System.Rtti.TValue;
  example-or-reference = System.Rtti.TValue;
  link-or-reference = System.Rtti.TValue;
  header-or-reference = System.Rtti.TValue;
  security-scheme-or-reference = System.Rtti.TValue;
  examples = System.Rtti.TValue;
  explode-for-form = System.Rtti.TValue;

  Info = class
  private
    FTitle: System.String;
    FSummary: System.String;
    FDescription: System.String;
    FTermsOfService: System.String;
    FContact: Contact;
    FLicense: License;
    FVersion: System.String;

    function GetContact: Contact;
    function GetLicense: License;
    function GetSummaryStored: Boolean;
    function GetDescriptionStored: Boolean;
    function GetTermsOfServiceStored: Boolean;
    function GetContactStored: Boolean;
    function GetLicenseStored: Boolean;
  public
    destructor Destroy; override;

    property IsSummaryStored: Boolean read GetSummaryStored;
    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsTermsOfServiceStored: Boolean read GetTermsOfServiceStored;
    property IsContactStored: Boolean read GetContactStored;
    property IsLicenseStored: Boolean read GetLicenseStored;
  published
    property title: System.String read FTitle write FTitle;
    property summary: System.String read FSummary write FSummary stored GetSummaryStored;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property termsOfService: System.String read FTermsOfService write FTermsOfService stored GetTermsOfServiceStored;
    property contact: Contact read GetContact write FContact stored GetContactStored;
    property license: License read GetLicense write FLicense stored GetLicenseStored;
    property version: System.String read FVersion write FVersion;
  end;

  Contact = class
  private
    FName: System.String;
    FUrl: System.String;
    FEmail: System.String;

    function GetNameStored: Boolean;
    function GetUrlStored: Boolean;
    function GetEmailStored: Boolean;
  public
    property IsNameStored: Boolean read GetNameStored;
    property IsUrlStored: Boolean read GetUrlStored;
    property IsEmailStored: Boolean read GetEmailStored;
  published
    property name: System.String read FName write FName stored GetNameStored;
    property url: System.String read FUrl write FUrl stored GetUrlStored;
    property email: System.String read FEmail write FEmail stored GetEmailStored;
  end;

  License = class
  private
    FName: System.String;
    FIdentifier: System.String;
    FUrl: System.String;

    function GetIdentifierStored: Boolean;
    function GetUrlStored: Boolean;
  public
    property IsIdentifierStored: Boolean read GetIdentifierStored;
    property IsUrlStored: Boolean read GetUrlStored;
  published
    property name: System.String read FName write FName;
    property identifier: System.String read FIdentifier write FIdentifier stored GetIdentifierStored;
    property url: System.String read FUrl write FUrl stored GetUrlStored;
  end;

  Server = class
  public type
    TVariables = class
    private
      FServerVariable: TDynamicProperty<ServerVariable>;

      function GetServerVariable: TDynamicProperty<ServerVariable>;
      function GetServerVariableStored: Boolean;
    public
      destructor Destroy; override;

      property IsServerVariableStored: Boolean read GetServerVariableStored;
    published
      [FieldName('server-variable')]
      property ServerVariable: TDynamicProperty<ServerVariable> read GetServerVariable write FServerVariable stored GetServerVariableStored;
    end;
  private
    FUrl: System.String;
    FDescription: System.String;
    FVariables: Server.TVariables;

    function GetVariables: Server.TVariables;
    function GetDescriptionStored: Boolean;
    function GetVariablesStored: Boolean;
  public
    destructor Destroy; override;

    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsVariablesStored: Boolean read GetVariablesStored;
  published
    property url: System.String read FUrl write FUrl;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property variables: Server.TVariables read GetVariables write FVariables stored GetVariablesStored;
  end;

  ServerVariable = class
  private
    FEnum: TArray<System.String>;
    FDefault: System.String;
    FDescription: System.String;

    function GetEnumStored: Boolean;
    function GetDescriptionStored: Boolean;
  public
    property IsEnumStored: Boolean read GetEnumStored;
    property IsDescriptionStored: Boolean read GetDescriptionStored;
  published
    property enum: TArray<System.String> read FEnum write FEnum stored GetEnumStored;
    property default: System.String read FDefault write FDefault;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
  end;

  Components = class
  public type
    TSchemas = class
    private
      FSchemas: TDynamicProperty<SpecificationExtensions>;

      function GetSchemas: TDynamicProperty<SpecificationExtensions>;
      function GetSchemasStored: Boolean;
    public
      destructor Destroy; override;

      property IsSchemasStored: Boolean read GetSchemasStored;
    published
      property Schemas: TDynamicProperty<SpecificationExtensions> read GetSchemas write FSchemas stored GetSchemasStored;
    end;

    TResponses = class
    private
      FResponseOrReference: TDynamicProperty<response-or-reference>;

      function GetResponseOrReference: TDynamicProperty<response-or-reference>;
      function GetResponseOrReferenceStored: Boolean;
    public
      destructor Destroy; override;

      property IsResponseOrReferenceStored: Boolean read GetResponseOrReferenceStored;
    published
      [FieldName('response-or-reference')]
      property ResponseOrReference: TDynamicProperty<response-or-reference> read GetResponseOrReference write FResponseOrReference stored GetResponseOrReferenceStored;
    end;

    TParameters = class
    private
      FParameterOrReference: TDynamicProperty<parameter-or-reference>;

      function GetParameterOrReference: TDynamicProperty<parameter-or-reference>;
      function GetParameterOrReferenceStored: Boolean;
    public
      destructor Destroy; override;

      property IsParameterOrReferenceStored: Boolean read GetParameterOrReferenceStored;
    published
      [FieldName('parameter-or-reference')]
      property ParameterOrReference: TDynamicProperty<parameter-or-reference> read GetParameterOrReference write FParameterOrReference stored GetParameterOrReferenceStored;
    end;

    TExamples = class
    private
      FExampleOrReference: TDynamicProperty<example-or-reference>;

      function GetExampleOrReference: TDynamicProperty<example-or-reference>;
      function GetExampleOrReferenceStored: Boolean;
    public
      destructor Destroy; override;

      property IsExampleOrReferenceStored: Boolean read GetExampleOrReferenceStored;
    published
      [FieldName('example-or-reference')]
      property ExampleOrReference: TDynamicProperty<example-or-reference> read GetExampleOrReference write FExampleOrReference stored GetExampleOrReferenceStored;
    end;

    TRequestBodies = class
    private
      FRequestBodyOrReference: TDynamicProperty<request-body-or-reference>;

      function GetRequestBodyOrReference: TDynamicProperty<request-body-or-reference>;
      function GetRequestBodyOrReferenceStored: Boolean;
    public
      destructor Destroy; override;

      property IsRequestBodyOrReferenceStored: Boolean read GetRequestBodyOrReferenceStored;
    published
      [FieldName('request-body-or-reference')]
      property RequestBodyOrReference: TDynamicProperty<request-body-or-reference> read GetRequestBodyOrReference write FRequestBodyOrReference stored GetRequestBodyOrReferenceStored;
    end;

    THeaders = class
    private
      FHeaderOrReference: TDynamicProperty<header-or-reference>;

      function GetHeaderOrReference: TDynamicProperty<header-or-reference>;
      function GetHeaderOrReferenceStored: Boolean;
    public
      destructor Destroy; override;

      property IsHeaderOrReferenceStored: Boolean read GetHeaderOrReferenceStored;
    published
      [FieldName('header-or-reference')]
      property HeaderOrReference: TDynamicProperty<header-or-reference> read GetHeaderOrReference write FHeaderOrReference stored GetHeaderOrReferenceStored;
    end;

    TSecuritySchemes = class
    private
      FSecuritySchemeOrReference: TDynamicProperty<security-scheme-or-reference>;

      function GetSecuritySchemeOrReference: TDynamicProperty<security-scheme-or-reference>;
      function GetSecuritySchemeOrReferenceStored: Boolean;
    public
      destructor Destroy; override;

      property IsSecuritySchemeOrReferenceStored: Boolean read GetSecuritySchemeOrReferenceStored;
    published
      [FieldName('security-scheme-or-reference')]
      property SecuritySchemeOrReference: TDynamicProperty<security-scheme-or-reference> read GetSecuritySchemeOrReference write FSecuritySchemeOrReference stored GetSecuritySchemeOrReferenceStored;
    end;

    TLinks = class
    private
      FLinkOrReference: TDynamicProperty<link-or-reference>;

      function GetLinkOrReference: TDynamicProperty<link-or-reference>;
      function GetLinkOrReferenceStored: Boolean;
    public
      destructor Destroy; override;

      property IsLinkOrReferenceStored: Boolean read GetLinkOrReferenceStored;
    published
      [FieldName('link-or-reference')]
      property LinkOrReference: TDynamicProperty<link-or-reference> read GetLinkOrReference write FLinkOrReference stored GetLinkOrReferenceStored;
    end;

    TCallbacks = class
    private
      FCallbacksOrReference: TDynamicProperty<callbacks-or-reference>;

      function GetCallbacksOrReference: TDynamicProperty<callbacks-or-reference>;
      function GetCallbacksOrReferenceStored: Boolean;
    public
      destructor Destroy; override;

      property IsCallbacksOrReferenceStored: Boolean read GetCallbacksOrReferenceStored;
    published
      [FieldName('callbacks-or-reference')]
      property CallbacksOrReference: TDynamicProperty<callbacks-or-reference> read GetCallbacksOrReference write FCallbacksOrReference stored GetCallbacksOrReferenceStored;
    end;

    TPathItems = class
    private
      FPathItem: TDynamicProperty<PathItem>;

      function GetPathItem: TDynamicProperty<PathItem>;
      function GetPathItemStored: Boolean;
    public
      destructor Destroy; override;

      property IsPathItemStored: Boolean read GetPathItemStored;
    published
      [FieldName('path-item')]
      property PathItem: TDynamicProperty<PathItem> read GetPathItem write FPathItem stored GetPathItemStored;
    end;
  private
    FSchemas: Components.TSchemas;
    FResponses: Components.TResponses;
    FParameters: Components.TParameters;
    FExamples: Components.TExamples;
    FRequestBodies: Components.TRequestBodies;
    FHeaders: Components.THeaders;
    FSecuritySchemes: Components.TSecuritySchemes;
    FLinks: Components.TLinks;
    FCallbacks: Components.TCallbacks;
    FPathItems: Components.TPathItems;
    FSpecificationExtensions: TDynamicProperty<any>;

    function GetSchemas: Components.TSchemas;
    function GetResponses: Components.TResponses;
    function GetParameters: Components.TParameters;
    function GetExamples: Components.TExamples;
    function GetRequestBodies: Components.TRequestBodies;
    function GetHeaders: Components.THeaders;
    function GetSecuritySchemes: Components.TSecuritySchemes;
    function GetLinks: Components.TLinks;
    function GetCallbacks: Components.TCallbacks;
    function GetPathItems: Components.TPathItems;
    function GetSpecificationExtensions: TDynamicProperty<any>;
    function GetSchemasStored: Boolean;
    function GetResponsesStored: Boolean;
    function GetParametersStored: Boolean;
    function GetExamplesStored: Boolean;
    function GetRequestBodiesStored: Boolean;
    function GetHeadersStored: Boolean;
    function GetSecuritySchemesStored: Boolean;
    function GetLinksStored: Boolean;
    function GetCallbacksStored: Boolean;
    function GetPathItemsStored: Boolean;
    function GetSpecificationExtensionsStored: Boolean;
  public
    destructor Destroy; override;

    property IsSchemasStored: Boolean read GetSchemasStored;
    property IsResponsesStored: Boolean read GetResponsesStored;
    property IsParametersStored: Boolean read GetParametersStored;
    property IsExamplesStored: Boolean read GetExamplesStored;
    property IsRequestBodiesStored: Boolean read GetRequestBodiesStored;
    property IsHeadersStored: Boolean read GetHeadersStored;
    property IsSecuritySchemesStored: Boolean read GetSecuritySchemesStored;
    property IsLinksStored: Boolean read GetLinksStored;
    property IsCallbacksStored: Boolean read GetCallbacksStored;
    property IsPathItemsStored: Boolean read GetPathItemsStored;
    property IsSpecificationExtensionsStored: Boolean read GetSpecificationExtensionsStored;
  published
    property schemas: Components.TSchemas read GetSchemas write FSchemas stored GetSchemasStored;
    property responses: Components.TResponses read GetResponses write FResponses stored GetResponsesStored;
    property parameters: Components.TParameters read GetParameters write FParameters stored GetParametersStored;
    property examples: Components.TExamples read GetExamples write FExamples stored GetExamplesStored;
    property requestBodies: Components.TRequestBodies read GetRequestBodies write FRequestBodies stored GetRequestBodiesStored;
    property headers: Components.THeaders read GetHeaders write FHeaders stored GetHeadersStored;
    property securitySchemes: Components.TSecuritySchemes read GetSecuritySchemes write FSecuritySchemes stored GetSecuritySchemesStored;
    property links: Components.TLinks read GetLinks write FLinks stored GetLinksStored;
    property callbacks: Components.TCallbacks read GetCallbacks write FCallbacks stored GetCallbacksStored;
    property pathItems: Components.TPathItems read GetPathItems write FPathItems stored GetPathItemsStored;
    [PatternProperty('^(?:schemas|responses|parameters|examples|requestBodies|headers|securitySchemes|links|callbacks|pathItems)$')]
    [FieldName('specification-extensions')]
    property SpecificationExtensions: TDynamicProperty<any> read GetSpecificationExtensions write FSpecificationExtensions stored GetSpecificationExtensionsStored;
  end;

  Paths = class
  private
    FSpecificationExtensions: TDynamicProperty<PathItem>;

    function GetSpecificationExtensions: TDynamicProperty<PathItem>;
    function GetSpecificationExtensionsStored: Boolean;
  public
    destructor Destroy; override;

    property IsSpecificationExtensionsStored: Boolean read GetSpecificationExtensionsStored;
  published
    [PatternProperty('^/')]
    [FieldName('specification-extensions')]
    property SpecificationExtensions: TDynamicProperty<PathItem> read GetSpecificationExtensions write FSpecificationExtensions stored GetSpecificationExtensionsStored;
  end;

  PathItem = class
  private
    FRef: System.String;
    FSummary: System.String;
    FDescription: System.String;
    FServers: TArray<Server>;
    FParameters: TArray<parameter-or-reference>;
    FGet: Operation;
    FPut: Operation;
    FPost: Operation;
    FDelete: Operation;
    FOptions: Operation;
    FHead: Operation;
    FPatch: Operation;
    FTrace: Operation;

    function GetGet: Operation;
    function GetPut: Operation;
    function GetPost: Operation;
    function GetDelete: Operation;
    function GetOptions: Operation;
    function GetHead: Operation;
    function GetPatch: Operation;
    function GetTrace: Operation;
    function GetRefStored: Boolean;
    function GetSummaryStored: Boolean;
    function GetDescriptionStored: Boolean;
    function GetServersStored: Boolean;
    function GetParametersStored: Boolean;
    function GetGetStored: Boolean;
    function GetPutStored: Boolean;
    function GetPostStored: Boolean;
    function GetDeleteStored: Boolean;
    function GetOptionsStored: Boolean;
    function GetHeadStored: Boolean;
    function GetPatchStored: Boolean;
    function GetTraceStored: Boolean;
  public
    destructor Destroy; override;

    function AddServers: Server;

    property IsRefStored: Boolean read GetRefStored;
    property IsSummaryStored: Boolean read GetSummaryStored;
    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsServersStored: Boolean read GetServersStored;
    property IsParametersStored: Boolean read GetParametersStored;
    property IsGetStored: Boolean read GetGetStored;
    property IsPutStored: Boolean read GetPutStored;
    property IsPostStored: Boolean read GetPostStored;
    property IsDeleteStored: Boolean read GetDeleteStored;
    property IsOptionsStored: Boolean read GetOptionsStored;
    property IsHeadStored: Boolean read GetHeadStored;
    property IsPatchStored: Boolean read GetPatchStored;
    property IsTraceStored: Boolean read GetTraceStored;
  published
    [FieldName('$ref')]
    property Ref: System.String read FRef write FRef stored GetRefStored;
    property summary: System.String read FSummary write FSummary stored GetSummaryStored;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property servers: TArray<Server> read FServers write FServers stored GetServersStored;
    property parameters: TArray<parameter-or-reference> read FParameters write FParameters stored GetParametersStored;
    property get: Operation read GetGet write FGet stored GetGetStored;
    property put: Operation read GetPut write FPut stored GetPutStored;
    property post: Operation read GetPost write FPost stored GetPostStored;
    property delete: Operation read GetDelete write FDelete stored GetDeleteStored;
    property options: Operation read GetOptions write FOptions stored GetOptionsStored;
    property head: Operation read GetHead write FHead stored GetHeadStored;
    property patch: Operation read GetPatch write FPatch stored GetPatchStored;
    property trace: Operation read GetTrace write FTrace stored GetTraceStored;
  end;

  Operation = class
  public type
    TCallbacks = class
    private
      FCallbacksOrReference: TDynamicProperty<callbacks-or-reference>;

      function GetCallbacksOrReference: TDynamicProperty<callbacks-or-reference>;
      function GetCallbacksOrReferenceStored: Boolean;
    public
      destructor Destroy; override;

      property IsCallbacksOrReferenceStored: Boolean read GetCallbacksOrReferenceStored;
    published
      [FieldName('callbacks-or-reference')]
      property CallbacksOrReference: TDynamicProperty<callbacks-or-reference> read GetCallbacksOrReference write FCallbacksOrReference stored GetCallbacksOrReferenceStored;
    end;
  private
    FTags: TArray<System.String>;
    FSummary: System.String;
    FDescription: System.String;
    FExternalDocs: ExternalDocumentation;
    FOperationId: System.String;
    FParameters: TArray<parameter-or-reference>;
    FRequestBody: request-body-or-reference;
    FResponses: Responses;
    FCallbacks: Operation.TCallbacks;
    FDeprecated: System.Boolean;
    FSecurity: TArray<SecurityRequirement>;
    FServers: TArray<Server>;
    FRequestBodyIsStored: Boolean;
    FDeprecatedIsStored: Boolean;

    function GetExternalDocs: ExternalDocumentation;
    function GetResponses: Responses;
    function GetCallbacks: Operation.TCallbacks;
    function GetTagsStored: Boolean;
    function GetSummaryStored: Boolean;
    function GetDescriptionStored: Boolean;
    function GetExternalDocsStored: Boolean;
    function GetOperationIdStored: Boolean;
    function GetParametersStored: Boolean;
    function GetResponsesStored: Boolean;
    function GetCallbacksStored: Boolean;
    function GetSecurityStored: Boolean;
    function GetServersStored: Boolean;
    procedure SetRequestBody(const Value: request-body-or-reference);
    procedure SetDeprecated(const Value: System.Boolean);
  public
    destructor Destroy; override;

    function AddSecurity: SecurityRequirement;
    function AddServers: Server;

    property IsTagsStored: Boolean read GetTagsStored;
    property IsSummaryStored: Boolean read GetSummaryStored;
    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsExternalDocsStored: Boolean read GetExternalDocsStored;
    property IsOperationIdStored: Boolean read GetOperationIdStored;
    property IsParametersStored: Boolean read GetParametersStored;
    property IsRequestBodyStored: Boolean read FRequestBodyIsStored;
    property IsResponsesStored: Boolean read GetResponsesStored;
    property IsCallbacksStored: Boolean read GetCallbacksStored;
    property IsDeprecatedStored: Boolean read FDeprecatedIsStored;
    property IsSecurityStored: Boolean read GetSecurityStored;
    property IsServersStored: Boolean read GetServersStored;
  published
    property tags: TArray<System.String> read FTags write FTags stored GetTagsStored;
    property summary: System.String read FSummary write FSummary stored GetSummaryStored;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property externalDocs: ExternalDocumentation read GetExternalDocs write FExternalDocs stored GetExternalDocsStored;
    property operationId: System.String read FOperationId write FOperationId stored GetOperationIdStored;
    property parameters: TArray<parameter-or-reference> read FParameters write FParameters stored GetParametersStored;
    property requestBody: request-body-or-reference read FRequestBody write SetRequestBody stored FRequestBodyIsStored;
    property responses: Responses read GetResponses write FResponses stored GetResponsesStored;
    property callbacks: Operation.TCallbacks read GetCallbacks write FCallbacks stored GetCallbacksStored;
    property deprecated: System.Boolean read FDeprecated write SetDeprecated stored FDeprecatedIsStored;
    property security: TArray<SecurityRequirement> read FSecurity write FSecurity stored GetSecurityStored;
    property servers: TArray<Server> read FServers write FServers stored GetServersStored;
  end;

  ExternalDocumentation = class
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

  [Flat]
  Parameter = class
  public type
    TIn = (query, header, path, cookie);
  private
    FName: System.String;
    FIn: Parameter.TIn;
    FDescription: System.String;
    FRequired: System.Boolean;
    FDeprecated: System.Boolean;
    FSchema: SpecificationExtensions;
    FContent: Content;
    FRequiredIsStored: Boolean;
    FDeprecatedIsStored: Boolean;

    function GetSchema: SpecificationExtensions;
    function GetContent: Content;
    function GetDescriptionStored: Boolean;
    function GetSchemaStored: Boolean;
    function GetContentStored: Boolean;
    procedure SetRequired(const Value: System.Boolean);
    procedure SetDeprecated(const Value: System.Boolean);
  public
    destructor Destroy; override;

    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsRequiredStored: Boolean read FRequiredIsStored;
    property IsDeprecatedStored: Boolean read FDeprecatedIsStored;
    property IsSchemaStored: Boolean read GetSchemaStored;
    property IsContentStored: Boolean read GetContentStored;
  published
    property name: System.String read FName write FName;
    [FieldName('in')]
    property &In: Parameter.TIn read FIn write FIn;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property required: System.Boolean read FRequired write SetRequired stored FRequiredIsStored;
    property deprecated: System.Boolean read FDeprecated write SetDeprecated stored FDeprecatedIsStored;
    property schema: SpecificationExtensions read GetSchema write FSchema stored GetSchemaStored;
    property content: Content read GetContent write FContent stored GetContentStored;
  end;

  RequestBody = class
  private
    FDescription: System.String;
    FContent: Content;
    FRequired: System.Boolean;
    FRequiredIsStored: Boolean;

    function GetContent: Content;
    function GetDescriptionStored: Boolean;
    procedure SetRequired(const Value: System.Boolean);
  public
    destructor Destroy; override;

    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsRequiredStored: Boolean read FRequiredIsStored;
  published
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property content: Content read GetContent write FContent;
    property required: System.Boolean read FRequired write SetRequired stored FRequiredIsStored;
  end;

  Content = class
  private
    FMediaType: TDynamicProperty<MediaType>;

    function GetMediaType: TDynamicProperty<MediaType>;
    function GetMediaTypeStored: Boolean;
  public
    destructor Destroy; override;

    property IsMediaTypeStored: Boolean read GetMediaTypeStored;
  published
    [FieldName('media-type')]
    property MediaType: TDynamicProperty<MediaType> read GetMediaType write FMediaType stored GetMediaTypeStored;
  end;

  [Flat]
  MediaType = class
  public type
    TEncoding = class
    private
      FEncoding: TDynamicProperty<Encoding>;

      function GetEncoding: TDynamicProperty<Encoding>;
      function GetEncodingStored: Boolean;
    public
      destructor Destroy; override;

      property IsEncodingStored: Boolean read GetEncodingStored;
    published
      property encoding: TDynamicProperty<Encoding> read GetEncoding write FEncoding stored GetEncodingStored;
    end;
  private
    FSchema: SpecificationExtensions;
    FEncoding: MediaType.TEncoding;
    FSpecificationExtensions: SpecificationExtensions;
    FExamples: examples;
    FExamplesIsStored: Boolean;

    function GetSchema: SpecificationExtensions;
    function GetEncoding: MediaType.TEncoding;
    function GetSpecificationExtensions: SpecificationExtensions;
    function GetSchemaStored: Boolean;
    function GetEncodingStored: Boolean;
    function GetSpecificationExtensionsStored: Boolean;
    procedure SetExamples(const Value: examples);
  public
    destructor Destroy; override;

    property IsSchemaStored: Boolean read GetSchemaStored;
    property IsEncodingStored: Boolean read GetEncodingStored;
    property IsSpecificationExtensionsStored: Boolean read GetSpecificationExtensionsStored;
    property IsExamplesStored: Boolean read FExamplesIsStored;
  published
    property schema: SpecificationExtensions read GetSchema write FSchema stored GetSchemaStored;
    property encoding: MediaType.TEncoding read GetEncoding write FEncoding stored GetEncodingStored;
    [FieldName('specification-extensions')]
    property SpecificationExtensions: SpecificationExtensions read GetSpecificationExtensions write FSpecificationExtensions stored GetSpecificationExtensionsStored;
    property examples: examples read FExamples write SetExamples stored FExamplesIsStored;
  end;

  Encoding = class
  public type
    TStyle = (form, spaceDelimited, pipeDelimited, deepObject);
    THeaders = class
    private
      FHeaderOrReference: TDynamicProperty<header-or-reference>;

      function GetHeaderOrReference: TDynamicProperty<header-or-reference>;
      function GetHeaderOrReferenceStored: Boolean;
    public
      destructor Destroy; override;

      property IsHeaderOrReferenceStored: Boolean read GetHeaderOrReferenceStored;
    published
      [FieldName('header-or-reference')]
      property HeaderOrReference: TDynamicProperty<header-or-reference> read GetHeaderOrReference write FHeaderOrReference stored GetHeaderOrReferenceStored;
    end;
  private
    FContentType: System.String;
    FHeaders: Encoding.THeaders;
    FStyle: Encoding.TStyle;
    FExplode: System.Boolean;
    FAllowReserved: System.Boolean;
    FStyleIsStored: Boolean;
    FExplodeIsStored: Boolean;
    FAllowReservedIsStored: Boolean;

    function GetHeaders: Encoding.THeaders;
    function GetContentTypeStored: Boolean;
    function GetHeadersStored: Boolean;
    procedure SetStyle(const Value: Encoding.TStyle);
    procedure SetExplode(const Value: System.Boolean);
    procedure SetAllowReserved(const Value: System.Boolean);
  public
    destructor Destroy; override;

    property IsContentTypeStored: Boolean read GetContentTypeStored;
    property IsHeadersStored: Boolean read GetHeadersStored;
    property IsStyleStored: Boolean read FStyleIsStored;
    property IsExplodeStored: Boolean read FExplodeIsStored;
    property IsAllowReservedStored: Boolean read FAllowReservedIsStored;
  published
    property contentType: System.String read FContentType write FContentType stored GetContentTypeStored;
    property headers: Encoding.THeaders read GetHeaders write FHeaders stored GetHeadersStored;
    property style: Encoding.TStyle read FStyle write SetStyle stored FStyleIsStored;
    property explode: System.Boolean read FExplode write SetExplode stored FExplodeIsStored;
    property allowReserved: System.Boolean read FAllowReserved write SetAllowReserved stored FAllowReservedIsStored;
  end;

  Responses = class
  private
    FDefault: response-or-reference;
    FSpecificationExtensions: TDynamicProperty<response-or-reference>;
    FDefaultIsStored: Boolean;

    function GetSpecificationExtensions: TDynamicProperty<response-or-reference>;
    function GetSpecificationExtensionsStored: Boolean;
    procedure SetDefault(const Value: response-or-reference);
  public
    destructor Destroy; override;

    property IsDefaultStored: Boolean read FDefaultIsStored;
    property IsSpecificationExtensionsStored: Boolean read GetSpecificationExtensionsStored;
  published
    property default: response-or-reference read FDefault write SetDefault stored FDefaultIsStored;
    [PatternProperty('^[1-5](?:[0-9]{2}|XX)$')]
    [FieldName('specification-extensions')]
    property SpecificationExtensions: TDynamicProperty<response-or-reference> read GetSpecificationExtensions write FSpecificationExtensions stored GetSpecificationExtensionsStored;
  end;

  Response = class
  public type
    THeaders = class
    private
      FHeaderOrReference: TDynamicProperty<header-or-reference>;

      function GetHeaderOrReference: TDynamicProperty<header-or-reference>;
      function GetHeaderOrReferenceStored: Boolean;
    public
      destructor Destroy; override;

      property IsHeaderOrReferenceStored: Boolean read GetHeaderOrReferenceStored;
    published
      [FieldName('header-or-reference')]
      property HeaderOrReference: TDynamicProperty<header-or-reference> read GetHeaderOrReference write FHeaderOrReference stored GetHeaderOrReferenceStored;
    end;

    TLinks = class
    private
      FLinkOrReference: TDynamicProperty<link-or-reference>;

      function GetLinkOrReference: TDynamicProperty<link-or-reference>;
      function GetLinkOrReferenceStored: Boolean;
    public
      destructor Destroy; override;

      property IsLinkOrReferenceStored: Boolean read GetLinkOrReferenceStored;
    published
      [FieldName('link-or-reference')]
      property LinkOrReference: TDynamicProperty<link-or-reference> read GetLinkOrReference write FLinkOrReference stored GetLinkOrReferenceStored;
    end;
  private
    FDescription: System.String;
    FHeaders: Response.THeaders;
    FContent: Content;
    FLinks: Response.TLinks;

    function GetHeaders: Response.THeaders;
    function GetContent: Content;
    function GetLinks: Response.TLinks;
    function GetHeadersStored: Boolean;
    function GetContentStored: Boolean;
    function GetLinksStored: Boolean;
  public
    destructor Destroy; override;

    property IsHeadersStored: Boolean read GetHeadersStored;
    property IsContentStored: Boolean read GetContentStored;
    property IsLinksStored: Boolean read GetLinksStored;
  published
    property description: System.String read FDescription write FDescription;
    property headers: Response.THeaders read GetHeaders write FHeaders stored GetHeadersStored;
    property content: Content read GetContent write FContent stored GetContentStored;
    property links: Response.TLinks read GetLinks write FLinks stored GetLinksStored;
  end;

  Callbacks = class
  private
    FPathItem: TDynamicProperty<PathItem>;

    function GetPathItem: TDynamicProperty<PathItem>;
    function GetPathItemStored: Boolean;
  public
    destructor Destroy; override;

    property IsPathItemStored: Boolean read GetPathItemStored;
  published
    [FieldName('path-item')]
    property PathItem: TDynamicProperty<PathItem> read GetPathItem write FPathItem stored GetPathItemStored;
  end;

  Example = class
  private
    FSummary: System.String;
    FDescription: System.String;
    FValue: any;
    FExternalValue: System.String;
    FValueIsStored: Boolean;

    function GetSummaryStored: Boolean;
    function GetDescriptionStored: Boolean;
    function GetExternalValueStored: Boolean;
    procedure SetValue(const Value: any);
  public
    property IsSummaryStored: Boolean read GetSummaryStored;
    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsValueStored: Boolean read FValueIsStored;
    property IsExternalValueStored: Boolean read GetExternalValueStored;
  published
    property summary: System.String read FSummary write FSummary stored GetSummaryStored;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property value: any read FValue write SetValue stored FValueIsStored;
    property externalValue: System.String read FExternalValue write FExternalValue stored GetExternalValueStored;
  end;

  [Flat]
  Link = class
  private
    FOperationRef: System.String;
    FOperationId: System.String;
    FParameters: MapOfStrings;
    FRequestBody: any;
    FDescription: System.String;
    FServer: Server;
    FRequestBodyIsStored: Boolean;

    function GetParameters: MapOfStrings;
    function GetServer: Server;
    function GetOperationRefStored: Boolean;
    function GetOperationIdStored: Boolean;
    function GetParametersStored: Boolean;
    function GetDescriptionStored: Boolean;
    function GetServerStored: Boolean;
    procedure SetRequestBody(const Value: any);
  public
    destructor Destroy; override;

    property IsOperationRefStored: Boolean read GetOperationRefStored;
    property IsOperationIdStored: Boolean read GetOperationIdStored;
    property IsParametersStored: Boolean read GetParametersStored;
    property IsRequestBodyStored: Boolean read FRequestBodyIsStored;
    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsServerStored: Boolean read GetServerStored;
  published
    property operationRef: System.String read FOperationRef write FOperationRef stored GetOperationRefStored;
    property operationId: System.String read FOperationId write FOperationId stored GetOperationIdStored;
    property parameters: MapOfStrings read GetParameters write FParameters stored GetParametersStored;
    property requestBody: any read FRequestBody write SetRequestBody stored FRequestBodyIsStored;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property server: Server read GetServer write FServer stored GetServerStored;
  end;

  [Flat]
  Header = class
  private
    FDescription: System.String;
    FRequired: System.Boolean;
    FDeprecated: System.Boolean;
    FSchema: SpecificationExtensions;
    FContent: Content;
    FRequiredIsStored: Boolean;
    FDeprecatedIsStored: Boolean;

    function GetSchema: SpecificationExtensions;
    function GetContent: Content;
    function GetDescriptionStored: Boolean;
    function GetSchemaStored: Boolean;
    function GetContentStored: Boolean;
    procedure SetRequired(const Value: System.Boolean);
    procedure SetDeprecated(const Value: System.Boolean);
  public
    destructor Destroy; override;

    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsRequiredStored: Boolean read FRequiredIsStored;
    property IsDeprecatedStored: Boolean read FDeprecatedIsStored;
    property IsSchemaStored: Boolean read GetSchemaStored;
    property IsContentStored: Boolean read GetContentStored;
  published
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property required: System.Boolean read FRequired write SetRequired stored FRequiredIsStored;
    property deprecated: System.Boolean read FDeprecated write SetDeprecated stored FDeprecatedIsStored;
    property schema: SpecificationExtensions read GetSchema write FSchema stored GetSchemaStored;
    property content: Content read GetContent write FContent stored GetContentStored;
  end;

  Tag = class
  private
    FName: System.String;
    FDescription: System.String;
    FExternalDocs: ExternalDocumentation;

    function GetExternalDocs: ExternalDocumentation;
    function GetDescriptionStored: Boolean;
    function GetExternalDocsStored: Boolean;
  public
    destructor Destroy; override;

    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsExternalDocsStored: Boolean read GetExternalDocsStored;
  published
    property name: System.String read FName write FName;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property externalDocs: ExternalDocumentation read GetExternalDocs write FExternalDocs stored GetExternalDocsStored;
  end;

  Reference = class
  private
    FRef: System.String;
    FSummary: System.String;
    FDescription: System.String;

    function GetRefStored: Boolean;
    function GetSummaryStored: Boolean;
    function GetDescriptionStored: Boolean;
  public
    property IsRefStored: Boolean read GetRefStored;
    property IsSummaryStored: Boolean read GetSummaryStored;
    property IsDescriptionStored: Boolean read GetDescriptionStored;
  published
    [FieldName('$ref')]
    property Ref: System.String read FRef write FRef stored GetRefStored;
    property summary: System.String read FSummary write FSummary stored GetSummaryStored;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
  end;

  [Flat]
  Schema = class
  public type
    TObject = class
    end;
  private
    FObject: Schema.TObject;
    FBoolean: System.Boolean;
    FBooleanIsStored: Boolean;

    function GetObject: Schema.TObject;
    function GetObjectStored: Boolean;
    procedure SetBoolean(const Value: System.Boolean);
  public
    destructor Destroy; override;

    property IsObjectStored: Boolean read GetObjectStored;
    property IsBooleanStored: Boolean read FBooleanIsStored;
  published
    [FieldName('Object')]
    property &Object: Schema.TObject read GetObject write FObject stored GetObjectStored;
    property Boolean: System.Boolean read FBoolean write SetBoolean stored FBooleanIsStored;
  end;

  [Flat]
  SecurityScheme = class
  public type
    TType = (apiKey, http, mutualTLS, oauth2, openIdConnect);
  private
    FType: SecurityScheme.TType;
    FDescription: System.String;
    FSpecificationExtensions: SpecificationExtensions;
    FTypeApikey: Undefined { type-apikey };
    FTypeHttp: Undefined { type-http };
    FTypeHttpBearer: Undefined { type-http-bearer };
    FTypeOauth2: Undefined { type-oauth2 };
    FTypeOidc: Undefined { type-oidc };

    function GetSpecificationExtensions: SpecificationExtensions;
    function GetDescriptionStored: Boolean;
    function GetSpecificationExtensionsStored: Boolean;
    function GetTypeApikeyStored: Boolean;
    function GetTypeHttpStored: Boolean;
    function GetTypeHttpBearerStored: Boolean;
    function GetTypeOauth2Stored: Boolean;
    function GetTypeOidcStored: Boolean;
  public
    destructor Destroy; override;

    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsSpecificationExtensionsStored: Boolean read GetSpecificationExtensionsStored;
    property IsTypeApikeyStored: Boolean read GetTypeApikeyStored;
    property IsTypeHttpStored: Boolean read GetTypeHttpStored;
    property IsTypeHttpBearerStored: Boolean read GetTypeHttpBearerStored;
    property IsTypeOauth2Stored: Boolean read GetTypeOauth2Stored;
    property IsTypeOidcStored: Boolean read GetTypeOidcStored;
  published
    [FieldName('type')]
    property &Type: SecurityScheme.TType read FType write FType;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    [FieldName('specification-extensions')]
    property SpecificationExtensions: SpecificationExtensions read GetSpecificationExtensions write FSpecificationExtensions stored GetSpecificationExtensionsStored;
    [FieldName('type-apikey')]
    property TypeApikey: Undefined { type-apikey } read FTypeApikey write FTypeApikey stored GetTypeApikeyStored;
    [FieldName('type-http')]
    property TypeHttp: Undefined { type-http } read FTypeHttp write FTypeHttp stored GetTypeHttpStored;
    [FieldName('type-http-bearer')]
    property TypeHttpBearer: Undefined { type-http-bearer } read FTypeHttpBearer write FTypeHttpBearer stored GetTypeHttpBearerStored;
    [FieldName('type-oauth2')]
    property TypeOauth2: Undefined { type-oauth2 } read FTypeOauth2 write FTypeOauth2 stored GetTypeOauth2Stored;
    [FieldName('type-oidc')]
    property TypeOidc: Undefined { type-oidc } read FTypeOidc write FTypeOidc stored GetTypeOidcStored;
  end;

  OauthFlows = class
  private
    FImplicit: Undefined { implicit };
    FPassword: Undefined { password };
    FClientCredentials: Undefined { client-credentials };
    FAuthorizationCode: Undefined { authorization-code };

    function GetImplicitStored: Boolean;
    function GetPasswordStored: Boolean;
    function GetClientCredentialsStored: Boolean;
    function GetAuthorizationCodeStored: Boolean;
  public
    property IsImplicitStored: Boolean read GetImplicitStored;
    property IsPasswordStored: Boolean read GetPasswordStored;
    property IsClientCredentialsStored: Boolean read GetClientCredentialsStored;
    property IsAuthorizationCodeStored: Boolean read GetAuthorizationCodeStored;
  published
    property implicit: Undefined { implicit } read FImplicit write FImplicit stored GetImplicitStored;
    property password: Undefined { password } read FPassword write FPassword stored GetPasswordStored;
    property clientCredentials: Undefined { client-credentials } read FClientCredentials write FClientCredentials stored GetClientCredentialsStored;
    property authorizationCode: Undefined { authorization-code } read FAuthorizationCode write FAuthorizationCode stored GetAuthorizationCodeStored;
  end;

  SecurityRequirement = class
  private
    FArray: TDynamicProperty<TArray<System.String>>;

    function GetArray: TDynamicProperty<TArray<System.String>>;
    function GetArrayStored: Boolean;
  public
    destructor Destroy; override;

    property IsArrayStored: Boolean read GetArrayStored;
  published
    [FieldName('array')]
    property &Array: TDynamicProperty<TArray<System.String>> read GetArray write FArray stored GetArrayStored;
  end;

  SpecificationExtensions = class
  private
    FPatternProperty: TDynamicProperty<any>;

    function GetPatternProperty: TDynamicProperty<any>;
    function GetPatternPropertyStored: Boolean;
  public
    destructor Destroy; override;

    property IsPatternPropertyStored: Boolean read GetPatternPropertyStored;
  published
    [PatternProperty('^x-')]
    property PatternProperty: TDynamicProperty<any> read GetPatternProperty write FPatternProperty stored GetPatternPropertyStored;
  end;

  MapOfStrings = class
  private
    FString: TDynamicProperty<System.String>;

    function GetString: TDynamicProperty<System.String>;
    function GetStringStored: Boolean;
  public
    destructor Destroy; override;

    property IsStringStored: Boolean read GetStringStored;
  published
    [FieldName('string')]
    property &String: TDynamicProperty<System.String> read GetString write FString stored GetStringStored;
  end;

implementation

uses System.SysUtils;

{ Info }

destructor Info.Destroy;
begin
  FContact.Free;

  FLicense.Free;

  inherited;
end;

function Info.GetSummaryStored: Boolean;
begin
  Result := not FSummary.IsEmpty;
end;

function Info.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function Info.GetTermsOfServiceStored: Boolean;
begin
  Result := not FTermsOfService.IsEmpty;
end;

function Info.GetContact: Blue.Print.Open.API.Schema.v31.Contact;
begin
  if not Assigned(FContact) then
    FContact := Blue.Print.Open.API.Schema.v31.Contact.Create;

  Result := FContact;
end;

function Info.GetContactStored: Boolean;
begin
  Result := Assigned(FContact);
end;

function Info.GetLicense: Blue.Print.Open.API.Schema.v31.License;
begin
  if not Assigned(FLicense) then
    FLicense := Blue.Print.Open.API.Schema.v31.License.Create;

  Result := FLicense;
end;

function Info.GetLicenseStored: Boolean;
begin
  Result := Assigned(FLicense);
end;

{ Contact }

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

{ License }

function License.GetIdentifierStored: Boolean;
begin
  Result := not FIdentifier.IsEmpty;
end;

function License.GetUrlStored: Boolean;
begin
  Result := not FUrl.IsEmpty;
end;

{ Server }

destructor Server.Destroy;
begin
  FVariables.Free;

  inherited;
end;

function Server.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function Server.GetVariables: Blue.Print.Open.API.Schema.v31.Server.TVariables;
begin
  if not Assigned(FVariables) then
    FVariables := Blue.Print.Open.API.Schema.v31.Server.TVariables.Create;

  Result := FVariables;
end;

function Server.GetVariablesStored: Boolean;
begin
  Result := Assigned(FVariables);
end;

{ Server.TVariables }

destructor Server.TVariables.Destroy;
begin
  FServerVariable.Free;

  inherited;
end;

function Server.TVariables.GetServerVariable: TDynamicProperty<ServerVariable>;
begin
  if not Assigned(FServerVariable) then
    FServerVariable := TDynamicProperty<Blue.Print.Open.API.Schema.v31.ServerVariable>.Create;

  Result := FServerVariable;
end;

function Server.TVariables.GetServerVariableStored: Boolean;
begin
  Result := Assigned(FServerVariable);
end;

{ ServerVariable }

function ServerVariable.GetEnumStored: Boolean;
begin
  Result := Assigned(FEnum);
end;

function ServerVariable.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

{ Components }

destructor Components.Destroy;
begin
  FSchemas.Free;

  FResponses.Free;

  FParameters.Free;

  FExamples.Free;

  FRequestBodies.Free;

  FHeaders.Free;

  FSecuritySchemes.Free;

  FLinks.Free;

  FCallbacks.Free;

  FPathItems.Free;

  FSpecificationExtensions.Free;

  inherited;
end;

function Components.GetSchemas: Blue.Print.Open.API.Schema.v31.Components.TSchemas;
begin
  if not Assigned(FSchemas) then
    FSchemas := Blue.Print.Open.API.Schema.v31.Components.TSchemas.Create;

  Result := FSchemas;
end;

function Components.GetSchemasStored: Boolean;
begin
  Result := Assigned(FSchemas);
end;

function Components.GetResponses: Blue.Print.Open.API.Schema.v31.Components.TResponses;
begin
  if not Assigned(FResponses) then
    FResponses := Blue.Print.Open.API.Schema.v31.Components.TResponses.Create;

  Result := FResponses;
end;

function Components.GetResponsesStored: Boolean;
begin
  Result := Assigned(FResponses);
end;

function Components.GetParameters: Blue.Print.Open.API.Schema.v31.Components.TParameters;
begin
  if not Assigned(FParameters) then
    FParameters := Blue.Print.Open.API.Schema.v31.Components.TParameters.Create;

  Result := FParameters;
end;

function Components.GetParametersStored: Boolean;
begin
  Result := Assigned(FParameters);
end;

function Components.GetExamples: Blue.Print.Open.API.Schema.v31.Components.TExamples;
begin
  if not Assigned(FExamples) then
    FExamples := Blue.Print.Open.API.Schema.v31.Components.TExamples.Create;

  Result := FExamples;
end;

function Components.GetExamplesStored: Boolean;
begin
  Result := Assigned(FExamples);
end;

function Components.GetRequestBodies: Blue.Print.Open.API.Schema.v31.Components.TRequestBodies;
begin
  if not Assigned(FRequestBodies) then
    FRequestBodies := Blue.Print.Open.API.Schema.v31.Components.TRequestBodies.Create;

  Result := FRequestBodies;
end;

function Components.GetRequestBodiesStored: Boolean;
begin
  Result := Assigned(FRequestBodies);
end;

function Components.GetHeaders: Blue.Print.Open.API.Schema.v31.Components.THeaders;
begin
  if not Assigned(FHeaders) then
    FHeaders := Blue.Print.Open.API.Schema.v31.Components.THeaders.Create;

  Result := FHeaders;
end;

function Components.GetHeadersStored: Boolean;
begin
  Result := Assigned(FHeaders);
end;

function Components.GetSecuritySchemes: Blue.Print.Open.API.Schema.v31.Components.TSecuritySchemes;
begin
  if not Assigned(FSecuritySchemes) then
    FSecuritySchemes := Blue.Print.Open.API.Schema.v31.Components.TSecuritySchemes.Create;

  Result := FSecuritySchemes;
end;

function Components.GetSecuritySchemesStored: Boolean;
begin
  Result := Assigned(FSecuritySchemes);
end;

function Components.GetLinks: Blue.Print.Open.API.Schema.v31.Components.TLinks;
begin
  if not Assigned(FLinks) then
    FLinks := Blue.Print.Open.API.Schema.v31.Components.TLinks.Create;

  Result := FLinks;
end;

function Components.GetLinksStored: Boolean;
begin
  Result := Assigned(FLinks);
end;

function Components.GetCallbacks: Blue.Print.Open.API.Schema.v31.Components.TCallbacks;
begin
  if not Assigned(FCallbacks) then
    FCallbacks := Blue.Print.Open.API.Schema.v31.Components.TCallbacks.Create;

  Result := FCallbacks;
end;

function Components.GetCallbacksStored: Boolean;
begin
  Result := Assigned(FCallbacks);
end;

function Components.GetPathItems: Blue.Print.Open.API.Schema.v31.Components.TPathItems;
begin
  if not Assigned(FPathItems) then
    FPathItems := Blue.Print.Open.API.Schema.v31.Components.TPathItems.Create;

  Result := FPathItems;
end;

function Components.GetPathItemsStored: Boolean;
begin
  Result := Assigned(FPathItems);
end;

function Components.GetSpecificationExtensions: TDynamicProperty<any>;
begin
  if not Assigned(FSpecificationExtensions) then
    FSpecificationExtensions := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FSpecificationExtensions;
end;

function Components.GetSpecificationExtensionsStored: Boolean;
begin
  Result := Assigned(FSpecificationExtensions);
end;

{ Components.TSchemas }

destructor Components.TSchemas.Destroy;
begin
  FSchemas.Free;

  inherited;
end;

function Components.TSchemas.GetSchemas: TDynamicProperty<SpecificationExtensions>;
begin
  if not Assigned(FSchemas) then
    FSchemas := TDynamicProperty<Blue.Print.Open.API.Schema.v31.SpecificationExtensions>.Create;

  Result := FSchemas;
end;

function Components.TSchemas.GetSchemasStored: Boolean;
begin
  Result := Assigned(FSchemas);
end;

{ Components.TResponses }

destructor Components.TResponses.Destroy;
begin
  FResponseOrReference.Free;

  inherited;
end;

function Components.TResponses.GetResponseOrReference: TDynamicProperty<response-or-reference>;
begin
  if not Assigned(FResponseOrReference) then
    FResponseOrReference := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FResponseOrReference;
end;

function Components.TResponses.GetResponseOrReferenceStored: Boolean;
begin
  Result := Assigned(FResponseOrReference);
end;

{ Components.TParameters }

destructor Components.TParameters.Destroy;
begin
  FParameterOrReference.Free;

  inherited;
end;

function Components.TParameters.GetParameterOrReference: TDynamicProperty<parameter-or-reference>;
begin
  if not Assigned(FParameterOrReference) then
    FParameterOrReference := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FParameterOrReference;
end;

function Components.TParameters.GetParameterOrReferenceStored: Boolean;
begin
  Result := Assigned(FParameterOrReference);
end;

{ Components.TExamples }

destructor Components.TExamples.Destroy;
begin
  FExampleOrReference.Free;

  inherited;
end;

function Components.TExamples.GetExampleOrReference: TDynamicProperty<example-or-reference>;
begin
  if not Assigned(FExampleOrReference) then
    FExampleOrReference := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FExampleOrReference;
end;

function Components.TExamples.GetExampleOrReferenceStored: Boolean;
begin
  Result := Assigned(FExampleOrReference);
end;

{ Components.TRequestBodies }

destructor Components.TRequestBodies.Destroy;
begin
  FRequestBodyOrReference.Free;

  inherited;
end;

function Components.TRequestBodies.GetRequestBodyOrReference: TDynamicProperty<request-body-or-reference>;
begin
  if not Assigned(FRequestBodyOrReference) then
    FRequestBodyOrReference := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FRequestBodyOrReference;
end;

function Components.TRequestBodies.GetRequestBodyOrReferenceStored: Boolean;
begin
  Result := Assigned(FRequestBodyOrReference);
end;

{ Components.THeaders }

destructor Components.THeaders.Destroy;
begin
  FHeaderOrReference.Free;

  inherited;
end;

function Components.THeaders.GetHeaderOrReference: TDynamicProperty<header-or-reference>;
begin
  if not Assigned(FHeaderOrReference) then
    FHeaderOrReference := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FHeaderOrReference;
end;

function Components.THeaders.GetHeaderOrReferenceStored: Boolean;
begin
  Result := Assigned(FHeaderOrReference);
end;

{ Components.TSecuritySchemes }

destructor Components.TSecuritySchemes.Destroy;
begin
  FSecuritySchemeOrReference.Free;

  inherited;
end;

function Components.TSecuritySchemes.GetSecuritySchemeOrReference: TDynamicProperty<security-scheme-or-reference>;
begin
  if not Assigned(FSecuritySchemeOrReference) then
    FSecuritySchemeOrReference := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FSecuritySchemeOrReference;
end;

function Components.TSecuritySchemes.GetSecuritySchemeOrReferenceStored: Boolean;
begin
  Result := Assigned(FSecuritySchemeOrReference);
end;

{ Components.TLinks }

destructor Components.TLinks.Destroy;
begin
  FLinkOrReference.Free;

  inherited;
end;

function Components.TLinks.GetLinkOrReference: TDynamicProperty<link-or-reference>;
begin
  if not Assigned(FLinkOrReference) then
    FLinkOrReference := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FLinkOrReference;
end;

function Components.TLinks.GetLinkOrReferenceStored: Boolean;
begin
  Result := Assigned(FLinkOrReference);
end;

{ Components.TCallbacks }

destructor Components.TCallbacks.Destroy;
begin
  FCallbacksOrReference.Free;

  inherited;
end;

function Components.TCallbacks.GetCallbacksOrReference: TDynamicProperty<callbacks-or-reference>;
begin
  if not Assigned(FCallbacksOrReference) then
    FCallbacksOrReference := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FCallbacksOrReference;
end;

function Components.TCallbacks.GetCallbacksOrReferenceStored: Boolean;
begin
  Result := Assigned(FCallbacksOrReference);
end;

{ Components.TPathItems }

destructor Components.TPathItems.Destroy;
begin
  FPathItem.Free;

  inherited;
end;

function Components.TPathItems.GetPathItem: TDynamicProperty<PathItem>;
begin
  if not Assigned(FPathItem) then
    FPathItem := TDynamicProperty<Blue.Print.Open.API.Schema.v31.PathItem>.Create;

  Result := FPathItem;
end;

function Components.TPathItems.GetPathItemStored: Boolean;
begin
  Result := Assigned(FPathItem);
end;

{ Paths }

destructor Paths.Destroy;
begin
  FSpecificationExtensions.Free;

  inherited;
end;

function Paths.GetSpecificationExtensions: TDynamicProperty<PathItem>;
begin
  if not Assigned(FSpecificationExtensions) then
    FSpecificationExtensions := TDynamicProperty<Blue.Print.Open.API.Schema.v31.PathItem>.Create;

  Result := FSpecificationExtensions;
end;

function Paths.GetSpecificationExtensionsStored: Boolean;
begin
  Result := Assigned(FSpecificationExtensions);
end;

{ PathItem }

destructor PathItem.Destroy;
begin
  for var AObject in FServers do
    AObject.Free;

  FGet.Free;

  FPut.Free;

  FPost.Free;

  FDelete.Free;

  FOptions.Free;

  FHead.Free;

  FPatch.Free;

  FTrace.Free;

  inherited;
end;

function PathItem.GetRefStored: Boolean;
begin
  Result := not FRef.IsEmpty;
end;

function PathItem.GetSummaryStored: Boolean;
begin
  Result := not FSummary.IsEmpty;
end;

function PathItem.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function PathItem.AddServers: Blue.Print.Open.API.Schema.v31.Server;
begin
  Result := Blue.Print.Open.API.Schema.v31.Server.Create;

  FServers := FServers + [Result];
end;

function PathItem.GetServersStored: Boolean;
begin
  Result := Assigned(FServers);
end;

function PathItem.GetParametersStored: Boolean;
begin
  Result := Assigned(FParameters);
end;

function PathItem.GetGet: Blue.Print.Open.API.Schema.v31.Operation;
begin
  if not Assigned(FGet) then
    FGet := Blue.Print.Open.API.Schema.v31.Operation.Create;

  Result := FGet;
end;

function PathItem.GetGetStored: Boolean;
begin
  Result := Assigned(FGet);
end;

function PathItem.GetPut: Blue.Print.Open.API.Schema.v31.Operation;
begin
  if not Assigned(FPut) then
    FPut := Blue.Print.Open.API.Schema.v31.Operation.Create;

  Result := FPut;
end;

function PathItem.GetPutStored: Boolean;
begin
  Result := Assigned(FPut);
end;

function PathItem.GetPost: Blue.Print.Open.API.Schema.v31.Operation;
begin
  if not Assigned(FPost) then
    FPost := Blue.Print.Open.API.Schema.v31.Operation.Create;

  Result := FPost;
end;

function PathItem.GetPostStored: Boolean;
begin
  Result := Assigned(FPost);
end;

function PathItem.GetDelete: Blue.Print.Open.API.Schema.v31.Operation;
begin
  if not Assigned(FDelete) then
    FDelete := Blue.Print.Open.API.Schema.v31.Operation.Create;

  Result := FDelete;
end;

function PathItem.GetDeleteStored: Boolean;
begin
  Result := Assigned(FDelete);
end;

function PathItem.GetOptions: Blue.Print.Open.API.Schema.v31.Operation;
begin
  if not Assigned(FOptions) then
    FOptions := Blue.Print.Open.API.Schema.v31.Operation.Create;

  Result := FOptions;
end;

function PathItem.GetOptionsStored: Boolean;
begin
  Result := Assigned(FOptions);
end;

function PathItem.GetHead: Blue.Print.Open.API.Schema.v31.Operation;
begin
  if not Assigned(FHead) then
    FHead := Blue.Print.Open.API.Schema.v31.Operation.Create;

  Result := FHead;
end;

function PathItem.GetHeadStored: Boolean;
begin
  Result := Assigned(FHead);
end;

function PathItem.GetPatch: Blue.Print.Open.API.Schema.v31.Operation;
begin
  if not Assigned(FPatch) then
    FPatch := Blue.Print.Open.API.Schema.v31.Operation.Create;

  Result := FPatch;
end;

function PathItem.GetPatchStored: Boolean;
begin
  Result := Assigned(FPatch);
end;

function PathItem.GetTrace: Blue.Print.Open.API.Schema.v31.Operation;
begin
  if not Assigned(FTrace) then
    FTrace := Blue.Print.Open.API.Schema.v31.Operation.Create;

  Result := FTrace;
end;

function PathItem.GetTraceStored: Boolean;
begin
  Result := Assigned(FTrace);
end;

{ Operation }

destructor Operation.Destroy;
begin
  FExternalDocs.Free;

  FResponses.Free;

  FCallbacks.Free;

  for var AObject in FSecurity do
    AObject.Free;

  for var AObject in FServers do
    AObject.Free;

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

function Operation.GetExternalDocs: Blue.Print.Open.API.Schema.v31.ExternalDocumentation;
begin
  if not Assigned(FExternalDocs) then
    FExternalDocs := Blue.Print.Open.API.Schema.v31.ExternalDocumentation.Create;

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

function Operation.GetParametersStored: Boolean;
begin
  Result := Assigned(FParameters);
end;

procedure Operation.SetRequestBody(const Value: request-body-or-reference);
begin
  FRequestBody := Value;
  FRequestBodyIsStored := True;
end;

function Operation.GetResponses: Blue.Print.Open.API.Schema.v31.Responses;
begin
  if not Assigned(FResponses) then
    FResponses := Blue.Print.Open.API.Schema.v31.Responses.Create;

  Result := FResponses;
end;

function Operation.GetResponsesStored: Boolean;
begin
  Result := Assigned(FResponses);
end;

function Operation.GetCallbacks: Blue.Print.Open.API.Schema.v31.Operation.TCallbacks;
begin
  if not Assigned(FCallbacks) then
    FCallbacks := Blue.Print.Open.API.Schema.v31.Operation.TCallbacks.Create;

  Result := FCallbacks;
end;

function Operation.GetCallbacksStored: Boolean;
begin
  Result := Assigned(FCallbacks);
end;

procedure Operation.SetDeprecated(const Value: System.Boolean);
begin
  FDeprecated := Value;
  FDeprecatedIsStored := True;
end;

function Operation.AddSecurity: Blue.Print.Open.API.Schema.v31.SecurityRequirement;
begin
  Result := Blue.Print.Open.API.Schema.v31.SecurityRequirement.Create;

  FSecurity := FSecurity + [Result];
end;

function Operation.GetSecurityStored: Boolean;
begin
  Result := Assigned(FSecurity);
end;

function Operation.AddServers: Blue.Print.Open.API.Schema.v31.Server;
begin
  Result := Blue.Print.Open.API.Schema.v31.Server.Create;

  FServers := FServers + [Result];
end;

function Operation.GetServersStored: Boolean;
begin
  Result := Assigned(FServers);
end;

{ Operation.TCallbacks }

destructor Operation.TCallbacks.Destroy;
begin
  FCallbacksOrReference.Free;

  inherited;
end;

function Operation.TCallbacks.GetCallbacksOrReference: TDynamicProperty<callbacks-or-reference>;
begin
  if not Assigned(FCallbacksOrReference) then
    FCallbacksOrReference := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FCallbacksOrReference;
end;

function Operation.TCallbacks.GetCallbacksOrReferenceStored: Boolean;
begin
  Result := Assigned(FCallbacksOrReference);
end;

{ ExternalDocumentation }

function ExternalDocumentation.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

{ Parameter }

destructor Parameter.Destroy;
begin
  FSchema.Free;

  FContent.Free;

  inherited;
end;

function Parameter.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

procedure Parameter.SetRequired(const Value: System.Boolean);
begin
  FRequired := Value;
  FRequiredIsStored := True;
end;

procedure Parameter.SetDeprecated(const Value: System.Boolean);
begin
  FDeprecated := Value;
  FDeprecatedIsStored := True;
end;

function Parameter.GetSchema: Blue.Print.Open.API.Schema.v31.SpecificationExtensions;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v31.SpecificationExtensions.Create;

  Result := FSchema;
end;

function Parameter.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function Parameter.GetContent: Blue.Print.Open.API.Schema.v31.Content;
begin
  if not Assigned(FContent) then
    FContent := Blue.Print.Open.API.Schema.v31.Content.Create;

  Result := FContent;
end;

function Parameter.GetContentStored: Boolean;
begin
  Result := Assigned(FContent);
end;

{ RequestBody }

destructor RequestBody.Destroy;
begin
  FContent.Free;

  inherited;
end;

function RequestBody.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function RequestBody.GetContent: Blue.Print.Open.API.Schema.v31.Content;
begin
  if not Assigned(FContent) then
    FContent := Blue.Print.Open.API.Schema.v31.Content.Create;

  Result := FContent;
end;

procedure RequestBody.SetRequired(const Value: System.Boolean);
begin
  FRequired := Value;
  FRequiredIsStored := True;
end;

{ Content }

destructor Content.Destroy;
begin
  FMediaType.Free;

  inherited;
end;

function Content.GetMediaType: TDynamicProperty<MediaType>;
begin
  if not Assigned(FMediaType) then
    FMediaType := TDynamicProperty<Blue.Print.Open.API.Schema.v31.MediaType>.Create;

  Result := FMediaType;
end;

function Content.GetMediaTypeStored: Boolean;
begin
  Result := Assigned(FMediaType);
end;

{ MediaType }

destructor MediaType.Destroy;
begin
  FSchema.Free;

  FEncoding.Free;

  FSpecificationExtensions.Free;

  inherited;
end;

function MediaType.GetSchema: Blue.Print.Open.API.Schema.v31.SpecificationExtensions;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v31.SpecificationExtensions.Create;

  Result := FSchema;
end;

function MediaType.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function MediaType.GetEncoding: Blue.Print.Open.API.Schema.v31.MediaType.TEncoding;
begin
  if not Assigned(FEncoding) then
    FEncoding := Blue.Print.Open.API.Schema.v31.MediaType.TEncoding.Create;

  Result := FEncoding;
end;

function MediaType.GetEncodingStored: Boolean;
begin
  Result := Assigned(FEncoding);
end;

function MediaType.GetSpecificationExtensions: Blue.Print.Open.API.Schema.v31.SpecificationExtensions;
begin
  if not Assigned(FSpecificationExtensions) then
    FSpecificationExtensions := Blue.Print.Open.API.Schema.v31.SpecificationExtensions.Create;

  Result := FSpecificationExtensions;
end;

function MediaType.GetSpecificationExtensionsStored: Boolean;
begin
  Result := Assigned(FSpecificationExtensions);
end;

procedure MediaType.SetExamples(const Value: examples);
begin
  FExamples := Value;
  FExamplesIsStored := True;
end;

{ MediaType.TEncoding }

destructor MediaType.TEncoding.Destroy;
begin
  FEncoding.Free;

  inherited;
end;

function MediaType.TEncoding.GetEncoding: TDynamicProperty<Encoding>;
begin
  if not Assigned(FEncoding) then
    FEncoding := TDynamicProperty<Blue.Print.Open.API.Schema.v31.Encoding>.Create;

  Result := FEncoding;
end;

function MediaType.TEncoding.GetEncodingStored: Boolean;
begin
  Result := Assigned(FEncoding);
end;

{ Encoding }

destructor Encoding.Destroy;
begin
  FHeaders.Free;

  inherited;
end;

function Encoding.GetContentTypeStored: Boolean;
begin
  Result := not FContentType.IsEmpty;
end;

function Encoding.GetHeaders: Blue.Print.Open.API.Schema.v31.Encoding.THeaders;
begin
  if not Assigned(FHeaders) then
    FHeaders := Blue.Print.Open.API.Schema.v31.Encoding.THeaders.Create;

  Result := FHeaders;
end;

function Encoding.GetHeadersStored: Boolean;
begin
  Result := Assigned(FHeaders);
end;

procedure Encoding.SetStyle(const Value: Encoding.TStyle);
begin
  FStyle := Value;
  FStyleIsStored := True;
end;

procedure Encoding.SetExplode(const Value: System.Boolean);
begin
  FExplode := Value;
  FExplodeIsStored := True;
end;

procedure Encoding.SetAllowReserved(const Value: System.Boolean);
begin
  FAllowReserved := Value;
  FAllowReservedIsStored := True;
end;

{ Encoding.THeaders }

destructor Encoding.THeaders.Destroy;
begin
  FHeaderOrReference.Free;

  inherited;
end;

function Encoding.THeaders.GetHeaderOrReference: TDynamicProperty<header-or-reference>;
begin
  if not Assigned(FHeaderOrReference) then
    FHeaderOrReference := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FHeaderOrReference;
end;

function Encoding.THeaders.GetHeaderOrReferenceStored: Boolean;
begin
  Result := Assigned(FHeaderOrReference);
end;

{ Responses }

destructor Responses.Destroy;
begin
  FSpecificationExtensions.Free;

  inherited;
end;

procedure Responses.SetDefault(const Value: response-or-reference);
begin
  FDefault := Value;
  FDefaultIsStored := True;
end;

function Responses.GetSpecificationExtensions: TDynamicProperty<response-or-reference>;
begin
  if not Assigned(FSpecificationExtensions) then
    FSpecificationExtensions := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FSpecificationExtensions;
end;

function Responses.GetSpecificationExtensionsStored: Boolean;
begin
  Result := Assigned(FSpecificationExtensions);
end;

{ Response }

destructor Response.Destroy;
begin
  FHeaders.Free;

  FContent.Free;

  FLinks.Free;

  inherited;
end;

function Response.GetHeaders: Blue.Print.Open.API.Schema.v31.Response.THeaders;
begin
  if not Assigned(FHeaders) then
    FHeaders := Blue.Print.Open.API.Schema.v31.Response.THeaders.Create;

  Result := FHeaders;
end;

function Response.GetHeadersStored: Boolean;
begin
  Result := Assigned(FHeaders);
end;

function Response.GetContent: Blue.Print.Open.API.Schema.v31.Content;
begin
  if not Assigned(FContent) then
    FContent := Blue.Print.Open.API.Schema.v31.Content.Create;

  Result := FContent;
end;

function Response.GetContentStored: Boolean;
begin
  Result := Assigned(FContent);
end;

function Response.GetLinks: Blue.Print.Open.API.Schema.v31.Response.TLinks;
begin
  if not Assigned(FLinks) then
    FLinks := Blue.Print.Open.API.Schema.v31.Response.TLinks.Create;

  Result := FLinks;
end;

function Response.GetLinksStored: Boolean;
begin
  Result := Assigned(FLinks);
end;

{ Response.THeaders }

destructor Response.THeaders.Destroy;
begin
  FHeaderOrReference.Free;

  inherited;
end;

function Response.THeaders.GetHeaderOrReference: TDynamicProperty<header-or-reference>;
begin
  if not Assigned(FHeaderOrReference) then
    FHeaderOrReference := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FHeaderOrReference;
end;

function Response.THeaders.GetHeaderOrReferenceStored: Boolean;
begin
  Result := Assigned(FHeaderOrReference);
end;

{ Response.TLinks }

destructor Response.TLinks.Destroy;
begin
  FLinkOrReference.Free;

  inherited;
end;

function Response.TLinks.GetLinkOrReference: TDynamicProperty<link-or-reference>;
begin
  if not Assigned(FLinkOrReference) then
    FLinkOrReference := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FLinkOrReference;
end;

function Response.TLinks.GetLinkOrReferenceStored: Boolean;
begin
  Result := Assigned(FLinkOrReference);
end;

{ Callbacks }

destructor Callbacks.Destroy;
begin
  FPathItem.Free;

  inherited;
end;

function Callbacks.GetPathItem: TDynamicProperty<PathItem>;
begin
  if not Assigned(FPathItem) then
    FPathItem := TDynamicProperty<Blue.Print.Open.API.Schema.v31.PathItem>.Create;

  Result := FPathItem;
end;

function Callbacks.GetPathItemStored: Boolean;
begin
  Result := Assigned(FPathItem);
end;

{ Example }

function Example.GetSummaryStored: Boolean;
begin
  Result := not FSummary.IsEmpty;
end;

function Example.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

procedure Example.SetValue(const Value: any);
begin
  FValue := Value;
  FValueIsStored := True;
end;

function Example.GetExternalValueStored: Boolean;
begin
  Result := not FExternalValue.IsEmpty;
end;

{ Link }

destructor Link.Destroy;
begin
  FParameters.Free;

  FServer.Free;

  inherited;
end;

function Link.GetOperationRefStored: Boolean;
begin
  Result := not FOperationRef.IsEmpty;
end;

function Link.GetOperationIdStored: Boolean;
begin
  Result := not FOperationId.IsEmpty;
end;

function Link.GetParameters: Blue.Print.Open.API.Schema.v31.MapOfStrings;
begin
  if not Assigned(FParameters) then
    FParameters := Blue.Print.Open.API.Schema.v31.MapOfStrings.Create;

  Result := FParameters;
end;

function Link.GetParametersStored: Boolean;
begin
  Result := Assigned(FParameters);
end;

procedure Link.SetRequestBody(const Value: any);
begin
  FRequestBody := Value;
  FRequestBodyIsStored := True;
end;

function Link.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function Link.GetServer: Blue.Print.Open.API.Schema.v31.Server;
begin
  if not Assigned(FServer) then
    FServer := Blue.Print.Open.API.Schema.v31.Server.Create;

  Result := FServer;
end;

function Link.GetServerStored: Boolean;
begin
  Result := Assigned(FServer);
end;

{ Header }

destructor Header.Destroy;
begin
  FSchema.Free;

  FContent.Free;

  inherited;
end;

function Header.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

procedure Header.SetRequired(const Value: System.Boolean);
begin
  FRequired := Value;
  FRequiredIsStored := True;
end;

procedure Header.SetDeprecated(const Value: System.Boolean);
begin
  FDeprecated := Value;
  FDeprecatedIsStored := True;
end;

function Header.GetSchema: Blue.Print.Open.API.Schema.v31.SpecificationExtensions;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v31.SpecificationExtensions.Create;

  Result := FSchema;
end;

function Header.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function Header.GetContent: Blue.Print.Open.API.Schema.v31.Content;
begin
  if not Assigned(FContent) then
    FContent := Blue.Print.Open.API.Schema.v31.Content.Create;

  Result := FContent;
end;

function Header.GetContentStored: Boolean;
begin
  Result := Assigned(FContent);
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

function Tag.GetExternalDocs: Blue.Print.Open.API.Schema.v31.ExternalDocumentation;
begin
  if not Assigned(FExternalDocs) then
    FExternalDocs := Blue.Print.Open.API.Schema.v31.ExternalDocumentation.Create;

  Result := FExternalDocs;
end;

function Tag.GetExternalDocsStored: Boolean;
begin
  Result := Assigned(FExternalDocs);
end;

{ Reference }

function Reference.GetRefStored: Boolean;
begin
  Result := not FRef.IsEmpty;
end;

function Reference.GetSummaryStored: Boolean;
begin
  Result := not FSummary.IsEmpty;
end;

function Reference.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

{ Schema }

destructor Schema.Destroy;
begin
  FObject.Free;

  inherited;
end;

function Schema.GetObject: Blue.Print.Open.API.Schema.v31.Schema.TObject;
begin
  if not Assigned(FObject) then
    FObject := Blue.Print.Open.API.Schema.v31.Schema.TObject.Create;

  Result := FObject;
end;

function Schema.GetObjectStored: Boolean;
begin
  Result := Assigned(FObject);
end;

procedure Schema.SetBoolean(const Value: System.Boolean);
begin
  FBoolean := Value;
  FBooleanIsStored := True;
end;

{ SecurityScheme }

destructor SecurityScheme.Destroy;
begin
  FSpecificationExtensions.Free;

  inherited;
end;

function SecurityScheme.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function SecurityScheme.GetSpecificationExtensions: Blue.Print.Open.API.Schema.v31.SpecificationExtensions;
begin
  if not Assigned(FSpecificationExtensions) then
    FSpecificationExtensions := Blue.Print.Open.API.Schema.v31.SpecificationExtensions.Create;

  Result := FSpecificationExtensions;
end;

function SecurityScheme.GetSpecificationExtensionsStored: Boolean;
begin
  Result := Assigned(FSpecificationExtensions);
end;

function SecurityScheme.GetTypeApikeyStored: Boolean;
begin
  Result := False;
end;

function SecurityScheme.GetTypeHttpStored: Boolean;
begin
  Result := False;
end;

function SecurityScheme.GetTypeHttpBearerStored: Boolean;
begin
  Result := False;
end;

function SecurityScheme.GetTypeOauth2Stored: Boolean;
begin
  Result := False;
end;

function SecurityScheme.GetTypeOidcStored: Boolean;
begin
  Result := False;
end;

{ OauthFlows }

function OauthFlows.GetImplicitStored: Boolean;
begin
  Result := False;
end;

function OauthFlows.GetPasswordStored: Boolean;
begin
  Result := False;
end;

function OauthFlows.GetClientCredentialsStored: Boolean;
begin
  Result := False;
end;

function OauthFlows.GetAuthorizationCodeStored: Boolean;
begin
  Result := False;
end;

{ SecurityRequirement }

destructor SecurityRequirement.Destroy;
begin
  FArray.Free;

  inherited;
end;

function SecurityRequirement.GetArray: TDynamicProperty<TArray<System.String>>;
begin
  if not Assigned(FArray) then
    FArray := TDynamicProperty<TArray<System.String>>.Create;

  Result := FArray;
end;

function SecurityRequirement.GetArrayStored: Boolean;
begin
  Result := Assigned(FArray);
end;

{ SpecificationExtensions }

destructor SpecificationExtensions.Destroy;
begin
  FPatternProperty.Free;

  inherited;
end;

function SpecificationExtensions.GetPatternProperty: TDynamicProperty<any>;
begin
  if not Assigned(FPatternProperty) then
    FPatternProperty := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FPatternProperty;
end;

function SpecificationExtensions.GetPatternPropertyStored: Boolean;
begin
  Result := Assigned(FPatternProperty);
end;

{ MapOfStrings }

destructor MapOfStrings.Destroy;
begin
  FString.Free;

  inherited;
end;

function MapOfStrings.GetString: TDynamicProperty<System.String>;
begin
  if not Assigned(FString) then
    FString := TDynamicProperty<System.String>.Create;

  Result := FString;
end;

function MapOfStrings.GetStringStored: Boolean;
begin
  Result := Assigned(FString);
end;

end.
