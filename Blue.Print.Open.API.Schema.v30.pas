unit Blue.Print.Open.API.Schema.v30;

interface

{$M+}
{$SCOPEDENUMS ON}

// File generated from https://spec.openapis.org/oas/3.0/schema/2024-10-18;

uses Blue.Print.Types, Blue.Print.JSON.Draft4.Schema, System.Rtti;

type
  // Forward class declaration
  Reference = class;
  Info = class;
  Contact = class;
  License = class;
  Server = class;
  ServerVariable = class;
  Components = class;
  Schema = class;
  Discriminator = class;
  XML = class;
  Response = class;
  MediaType = class;
  Example = class;
  Header = class;
  Paths = class;
  PathItem = class;
  Operation = class;
  Responses = class;
  SecurityRequirement = class;
  Tag = class;
  ExternalDocumentation = class;
  SchemaXORContent = class;
  Parameter = class;
  RequestBody = class;
  SecurityScheme = class;
  APIKeySecurityScheme = class;
  HTTPSecurityScheme = class;
  OAuth2SecurityScheme = class;
  OpenIdConnectSecurityScheme = class;
  OAuthFlows = class;
  ImplicitOAuthFlow = class;
  PasswordOAuthFlow = class;
  ClientCredentialsFlow = class;
  AuthorizationCodeOAuthFlow = class;
  Link = class;
  Callback = class;
  Encoding = class;
  TOpenAPIDefinition = class;

  // Forward type alias
  ExampleXORExamples = System.Rtti.TValue;
  PathParameter = System.Rtti.TValue;
  QueryParameter = System.Rtti.TValue;
  HeaderParameter = System.Rtti.TValue;
  CookieParameter = System.Rtti.TValue;

  Reference = class
  private
    FString: TDynamicProperty<System.String>;

    function GetString: TDynamicProperty<System.String>;
    function GetStringStored: Boolean;
  public
    destructor Destroy; override;

    property IsStringStored: Boolean read GetStringStored;
  published
    [PatternProperty('^\$ref$')]
    [FieldName('string')]
    property &String: TDynamicProperty<System.String> read GetString write FString stored GetStringStored;
  end;

  Info = class
  private
    FTitle: System.String;
    FDescription: System.String;
    FTermsOfService: System.String;
    FContact: Contact;
    FLicense: License;
    FVersion: System.String;
    FAnonymous: TDynamicProperty<any>;

    function GetContact: Contact;
    function GetLicense: License;
    function GetAnonymous: TDynamicProperty<any>;
    function GetDescriptionStored: Boolean;
    function GetTermsOfServiceStored: Boolean;
    function GetContactStored: Boolean;
    function GetLicenseStored: Boolean;
    function GetAnonymousStored: Boolean;
  public
    destructor Destroy; override;

    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsTermsOfServiceStored: Boolean read GetTermsOfServiceStored;
    property IsContactStored: Boolean read GetContactStored;
    property IsLicenseStored: Boolean read GetLicenseStored;
    property IsAnonymousStored: Boolean read GetAnonymousStored;
  published
    property title: System.String read FTitle write FTitle;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property termsOfService: System.String read FTermsOfService write FTermsOfService stored GetTermsOfServiceStored;
    property contact: Contact read GetContact write FContact stored GetContactStored;
    property license: License read GetLicense write FLicense stored GetLicenseStored;
    property version: System.String read FVersion write FVersion;
    [PatternProperty('^x-')]
    property Anonymous: TDynamicProperty<any> read GetAnonymous write FAnonymous stored GetAnonymousStored;
  end;

  Contact = class
  private
    FName: System.String;
    FUrl: System.String;
    FEmail: System.String;
    FAnonymous: TDynamicProperty<any>;

    function GetAnonymous: TDynamicProperty<any>;
    function GetNameStored: Boolean;
    function GetUrlStored: Boolean;
    function GetEmailStored: Boolean;
    function GetAnonymousStored: Boolean;
  public
    destructor Destroy; override;

    property IsNameStored: Boolean read GetNameStored;
    property IsUrlStored: Boolean read GetUrlStored;
    property IsEmailStored: Boolean read GetEmailStored;
    property IsAnonymousStored: Boolean read GetAnonymousStored;
  published
    property name: System.String read FName write FName stored GetNameStored;
    property url: System.String read FUrl write FUrl stored GetUrlStored;
    property email: System.String read FEmail write FEmail stored GetEmailStored;
    [PatternProperty('^x-')]
    property Anonymous: TDynamicProperty<any> read GetAnonymous write FAnonymous stored GetAnonymousStored;
  end;

  License = class
  private
    FName: System.String;
    FUrl: System.String;
    FAnonymous: TDynamicProperty<any>;

    function GetAnonymous: TDynamicProperty<any>;
    function GetUrlStored: Boolean;
    function GetAnonymousStored: Boolean;
  public
    destructor Destroy; override;

    property IsUrlStored: Boolean read GetUrlStored;
    property IsAnonymousStored: Boolean read GetAnonymousStored;
  published
    property name: System.String read FName write FName;
    property url: System.String read FUrl write FUrl stored GetUrlStored;
    [PatternProperty('^x-')]
    property Anonymous: TDynamicProperty<any> read GetAnonymous write FAnonymous stored GetAnonymousStored;
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
      property ServerVariable: TDynamicProperty<ServerVariable> read GetServerVariable write FServerVariable stored GetServerVariableStored;
    end;
  private
    FUrl: System.String;
    FDescription: System.String;
    FVariables: Server.TVariables;
    FAnonymous: TDynamicProperty<any>;

    function GetVariables: Server.TVariables;
    function GetAnonymous: TDynamicProperty<any>;
    function GetDescriptionStored: Boolean;
    function GetVariablesStored: Boolean;
    function GetAnonymousStored: Boolean;
  public
    destructor Destroy; override;

    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsVariablesStored: Boolean read GetVariablesStored;
    property IsAnonymousStored: Boolean read GetAnonymousStored;
  published
    property url: System.String read FUrl write FUrl;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property variables: Server.TVariables read GetVariables write FVariables stored GetVariablesStored;
    [PatternProperty('^x-')]
    property Anonymous: TDynamicProperty<any> read GetAnonymous write FAnonymous stored GetAnonymousStored;
  end;

  ServerVariable = class
  private
    FEnum: TArray<System.String>;
    FDefault: System.String;
    FDescription: System.String;
    FAnonymous: TDynamicProperty<any>;

    function GetAnonymous: TDynamicProperty<any>;
    function GetEnumStored: Boolean;
    function GetDescriptionStored: Boolean;
    function GetAnonymousStored: Boolean;
  public
    destructor Destroy; override;

    property IsEnumStored: Boolean read GetEnumStored;
    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsAnonymousStored: Boolean read GetAnonymousStored;
  published
    property enum: TArray<System.String> read FEnum write FEnum stored GetEnumStored;
    property default: System.String read FDefault write FDefault;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    [PatternProperty('^x-')]
    property Anonymous: TDynamicProperty<any> read GetAnonymous write FAnonymous stored GetAnonymousStored;
  end;

  Components = class
  public type
    TSchemas = class
    public type
      [Flat]
      TAnonymous = class
      private
        FSchema: Schema;
        FReference: Reference;

        function GetSchema: Schema;
        function GetReference: Reference;
        function GetSchemaStored: Boolean;
        function GetReferenceStored: Boolean;
      public
        destructor Destroy; override;

        property IsSchemaStored: Boolean read GetSchemaStored;
        property IsReferenceStored: Boolean read GetReferenceStored;
      published
        property Schema: Schema read GetSchema write FSchema stored GetSchemaStored;
        property Reference: Reference read GetReference write FReference stored GetReferenceStored;
      end;
    private
      FAnonymous: TDynamicProperty<Components.TSchemas.TAnonymous>;

      function GetAnonymous: TDynamicProperty<Components.TSchemas.TAnonymous>;
      function GetAnonymousStored: Boolean;
    public
      destructor Destroy; override;

      property IsAnonymousStored: Boolean read GetAnonymousStored;
    published
      [PatternProperty('^[a-zA-Z0-9\.\-_]+$')]
      property Anonymous: TDynamicProperty<Components.TSchemas.TAnonymous> read GetAnonymous write FAnonymous stored GetAnonymousStored;
    end;

    TResponses = class
    public type
      [Flat]
      TAnonymous = class
      private
        FReference: Reference;
        FResponse: Response;

        function GetReference: Reference;
        function GetResponse: Response;
        function GetReferenceStored: Boolean;
        function GetResponseStored: Boolean;
      public
        destructor Destroy; override;

        property IsReferenceStored: Boolean read GetReferenceStored;
        property IsResponseStored: Boolean read GetResponseStored;
      published
        property Reference: Reference read GetReference write FReference stored GetReferenceStored;
        property Response: Response read GetResponse write FResponse stored GetResponseStored;
      end;
    private
      FAnonymous: TDynamicProperty<Components.TResponses.TAnonymous>;

      function GetAnonymous: TDynamicProperty<Components.TResponses.TAnonymous>;
      function GetAnonymousStored: Boolean;
    public
      destructor Destroy; override;

      property IsAnonymousStored: Boolean read GetAnonymousStored;
    published
      [PatternProperty('^[a-zA-Z0-9\.\-_]+$')]
      property Anonymous: TDynamicProperty<Components.TResponses.TAnonymous> read GetAnonymous write FAnonymous stored GetAnonymousStored;
    end;

    TParameters = class
    public type
      [Flat]
      TAnonymous = class
      private
        FReference: Reference;
        FParameter: Parameter;

        function GetReference: Reference;
        function GetParameter: Parameter;
        function GetReferenceStored: Boolean;
        function GetParameterStored: Boolean;
      public
        destructor Destroy; override;

        property IsReferenceStored: Boolean read GetReferenceStored;
        property IsParameterStored: Boolean read GetParameterStored;
      published
        property Reference: Reference read GetReference write FReference stored GetReferenceStored;
        property Parameter: Parameter read GetParameter write FParameter stored GetParameterStored;
      end;
    private
      FAnonymous: TDynamicProperty<Components.TParameters.TAnonymous>;

      function GetAnonymous: TDynamicProperty<Components.TParameters.TAnonymous>;
      function GetAnonymousStored: Boolean;
    public
      destructor Destroy; override;

      property IsAnonymousStored: Boolean read GetAnonymousStored;
    published
      [PatternProperty('^[a-zA-Z0-9\.\-_]+$')]
      property Anonymous: TDynamicProperty<Components.TParameters.TAnonymous> read GetAnonymous write FAnonymous stored GetAnonymousStored;
    end;

    TExamples = class
    public type
      [Flat]
      TAnonymous = class
      private
        FReference: Reference;
        FExample: Example;

        function GetReference: Reference;
        function GetExample: Example;
        function GetReferenceStored: Boolean;
        function GetExampleStored: Boolean;
      public
        destructor Destroy; override;

        property IsReferenceStored: Boolean read GetReferenceStored;
        property IsExampleStored: Boolean read GetExampleStored;
      published
        property Reference: Reference read GetReference write FReference stored GetReferenceStored;
        property Example: Example read GetExample write FExample stored GetExampleStored;
      end;
    private
      FAnonymous: TDynamicProperty<Components.TExamples.TAnonymous>;

      function GetAnonymous: TDynamicProperty<Components.TExamples.TAnonymous>;
      function GetAnonymousStored: Boolean;
    public
      destructor Destroy; override;

      property IsAnonymousStored: Boolean read GetAnonymousStored;
    published
      [PatternProperty('^[a-zA-Z0-9\.\-_]+$')]
      property Anonymous: TDynamicProperty<Components.TExamples.TAnonymous> read GetAnonymous write FAnonymous stored GetAnonymousStored;
    end;

    TRequestBodies = class
    public type
      [Flat]
      TAnonymous = class
      private
        FReference: Reference;
        FRequestBody: RequestBody;

        function GetReference: Reference;
        function GetRequestBody: RequestBody;
        function GetReferenceStored: Boolean;
        function GetRequestBodyStored: Boolean;
      public
        destructor Destroy; override;

        property IsReferenceStored: Boolean read GetReferenceStored;
        property IsRequestBodyStored: Boolean read GetRequestBodyStored;
      published
        property Reference: Reference read GetReference write FReference stored GetReferenceStored;
        property RequestBody: RequestBody read GetRequestBody write FRequestBody stored GetRequestBodyStored;
      end;
    private
      FAnonymous: TDynamicProperty<Components.TRequestBodies.TAnonymous>;

      function GetAnonymous: TDynamicProperty<Components.TRequestBodies.TAnonymous>;
      function GetAnonymousStored: Boolean;
    public
      destructor Destroy; override;

      property IsAnonymousStored: Boolean read GetAnonymousStored;
    published
      [PatternProperty('^[a-zA-Z0-9\.\-_]+$')]
      property Anonymous: TDynamicProperty<Components.TRequestBodies.TAnonymous> read GetAnonymous write FAnonymous stored GetAnonymousStored;
    end;

    THeaders = class
    public type
      [Flat]
      TAnonymous = class
      private
        FReference: Reference;
        FHeader: Header;

        function GetReference: Reference;
        function GetHeader: Header;
        function GetReferenceStored: Boolean;
        function GetHeaderStored: Boolean;
      public
        destructor Destroy; override;

        property IsReferenceStored: Boolean read GetReferenceStored;
        property IsHeaderStored: Boolean read GetHeaderStored;
      published
        property Reference: Reference read GetReference write FReference stored GetReferenceStored;
        property Header: Header read GetHeader write FHeader stored GetHeaderStored;
      end;
    private
      FAnonymous: TDynamicProperty<Components.THeaders.TAnonymous>;

      function GetAnonymous: TDynamicProperty<Components.THeaders.TAnonymous>;
      function GetAnonymousStored: Boolean;
    public
      destructor Destroy; override;

      property IsAnonymousStored: Boolean read GetAnonymousStored;
    published
      [PatternProperty('^[a-zA-Z0-9\.\-_]+$')]
      property Anonymous: TDynamicProperty<Components.THeaders.TAnonymous> read GetAnonymous write FAnonymous stored GetAnonymousStored;
    end;

    TSecuritySchemes = class
    public type
      [Flat]
      TAnonymous = class
      private
        FReference: Reference;
        FSecurityScheme: SecurityScheme;

        function GetReference: Reference;
        function GetSecurityScheme: SecurityScheme;
        function GetReferenceStored: Boolean;
        function GetSecuritySchemeStored: Boolean;
      public
        destructor Destroy; override;

        property IsReferenceStored: Boolean read GetReferenceStored;
        property IsSecuritySchemeStored: Boolean read GetSecuritySchemeStored;
      published
        property Reference: Reference read GetReference write FReference stored GetReferenceStored;
        property SecurityScheme: SecurityScheme read GetSecurityScheme write FSecurityScheme stored GetSecuritySchemeStored;
      end;
    private
      FAnonymous: TDynamicProperty<Components.TSecuritySchemes.TAnonymous>;

      function GetAnonymous: TDynamicProperty<Components.TSecuritySchemes.TAnonymous>;
      function GetAnonymousStored: Boolean;
    public
      destructor Destroy; override;

      property IsAnonymousStored: Boolean read GetAnonymousStored;
    published
      [PatternProperty('^[a-zA-Z0-9\.\-_]+$')]
      property Anonymous: TDynamicProperty<Components.TSecuritySchemes.TAnonymous> read GetAnonymous write FAnonymous stored GetAnonymousStored;
    end;

    TLinks = class
    public type
      [Flat]
      TAnonymous = class
      private
        FReference: Reference;
        FLink: Link;

        function GetReference: Reference;
        function GetLink: Link;
        function GetReferenceStored: Boolean;
        function GetLinkStored: Boolean;
      public
        destructor Destroy; override;

        property IsReferenceStored: Boolean read GetReferenceStored;
        property IsLinkStored: Boolean read GetLinkStored;
      published
        property Reference: Reference read GetReference write FReference stored GetReferenceStored;
        property Link: Link read GetLink write FLink stored GetLinkStored;
      end;
    private
      FAnonymous: TDynamicProperty<Components.TLinks.TAnonymous>;

      function GetAnonymous: TDynamicProperty<Components.TLinks.TAnonymous>;
      function GetAnonymousStored: Boolean;
    public
      destructor Destroy; override;

      property IsAnonymousStored: Boolean read GetAnonymousStored;
    published
      [PatternProperty('^[a-zA-Z0-9\.\-_]+$')]
      property Anonymous: TDynamicProperty<Components.TLinks.TAnonymous> read GetAnonymous write FAnonymous stored GetAnonymousStored;
    end;

    TCallbacks = class
    public type
      [Flat]
      TAnonymous = class
      private
        FReference: Reference;
        FCallback: Callback;

        function GetReference: Reference;
        function GetCallback: Callback;
        function GetReferenceStored: Boolean;
        function GetCallbackStored: Boolean;
      public
        destructor Destroy; override;

        property IsReferenceStored: Boolean read GetReferenceStored;
        property IsCallbackStored: Boolean read GetCallbackStored;
      published
        property Reference: Reference read GetReference write FReference stored GetReferenceStored;
        property Callback: Callback read GetCallback write FCallback stored GetCallbackStored;
      end;
    private
      FAnonymous: TDynamicProperty<Components.TCallbacks.TAnonymous>;

      function GetAnonymous: TDynamicProperty<Components.TCallbacks.TAnonymous>;
      function GetAnonymousStored: Boolean;
    public
      destructor Destroy; override;

      property IsAnonymousStored: Boolean read GetAnonymousStored;
    published
      [PatternProperty('^[a-zA-Z0-9\.\-_]+$')]
      property Anonymous: TDynamicProperty<Components.TCallbacks.TAnonymous> read GetAnonymous write FAnonymous stored GetAnonymousStored;
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
    FAnonymous: TDynamicProperty<any>;

    function GetSchemas: Components.TSchemas;
    function GetResponses: Components.TResponses;
    function GetParameters: Components.TParameters;
    function GetExamples: Components.TExamples;
    function GetRequestBodies: Components.TRequestBodies;
    function GetHeaders: Components.THeaders;
    function GetSecuritySchemes: Components.TSecuritySchemes;
    function GetLinks: Components.TLinks;
    function GetCallbacks: Components.TCallbacks;
    function GetAnonymous: TDynamicProperty<any>;
    function GetSchemasStored: Boolean;
    function GetResponsesStored: Boolean;
    function GetParametersStored: Boolean;
    function GetExamplesStored: Boolean;
    function GetRequestBodiesStored: Boolean;
    function GetHeadersStored: Boolean;
    function GetSecuritySchemesStored: Boolean;
    function GetLinksStored: Boolean;
    function GetCallbacksStored: Boolean;
    function GetAnonymousStored: Boolean;
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
    property IsAnonymousStored: Boolean read GetAnonymousStored;
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
    [PatternProperty('^x-')]
    property Anonymous: TDynamicProperty<any> read GetAnonymous write FAnonymous stored GetAnonymousStored;
  end;

  Schema = class
  public type
    [EnumValue('array, boolean, integer, number, object, string')]
    TType = (&array, boolean, integer, number, &object, &string);
    [Flat]
    TNot = class
    private
      FSchema: Schema;
      FReference: Reference;

      function GetSchema: Schema;
      function GetReference: Reference;
      function GetSchemaStored: Boolean;
      function GetReferenceStored: Boolean;
    public
      destructor Destroy; override;

      property IsSchemaStored: Boolean read GetSchemaStored;
      property IsReferenceStored: Boolean read GetReferenceStored;
    published
      property Schema: Schema read GetSchema write FSchema stored GetSchemaStored;
      property Reference: Reference read GetReference write FReference stored GetReferenceStored;
    end;

    [Flat]
    TAllOfArrayItem = class
    private
      FSchema: Schema;
      FReference: Reference;

      function GetSchema: Schema;
      function GetReference: Reference;
      function GetSchemaStored: Boolean;
      function GetReferenceStored: Boolean;
    public
      destructor Destroy; override;

      property IsSchemaStored: Boolean read GetSchemaStored;
      property IsReferenceStored: Boolean read GetReferenceStored;
    published
      property Schema: Schema read GetSchema write FSchema stored GetSchemaStored;
      property Reference: Reference read GetReference write FReference stored GetReferenceStored;
    end;

    [Flat]
    TOneOfArrayItem = class
    private
      FSchema: Schema;
      FReference: Reference;

      function GetSchema: Schema;
      function GetReference: Reference;
      function GetSchemaStored: Boolean;
      function GetReferenceStored: Boolean;
    public
      destructor Destroy; override;

      property IsSchemaStored: Boolean read GetSchemaStored;
      property IsReferenceStored: Boolean read GetReferenceStored;
    published
      property Schema: Schema read GetSchema write FSchema stored GetSchemaStored;
      property Reference: Reference read GetReference write FReference stored GetReferenceStored;
    end;

    [Flat]
    TAnyOfArrayItem = class
    private
      FSchema: Schema;
      FReference: Reference;

      function GetSchema: Schema;
      function GetReference: Reference;
      function GetSchemaStored: Boolean;
      function GetReferenceStored: Boolean;
    public
      destructor Destroy; override;

      property IsSchemaStored: Boolean read GetSchemaStored;
      property IsReferenceStored: Boolean read GetReferenceStored;
    published
      property Schema: Schema read GetSchema write FSchema stored GetSchemaStored;
      property Reference: Reference read GetReference write FReference stored GetReferenceStored;
    end;

    [Flat]
    TItems = class
    private
      FSchema: Schema;
      FReference: Reference;

      function GetSchema: Schema;
      function GetReference: Reference;
      function GetSchemaStored: Boolean;
      function GetReferenceStored: Boolean;
    public
      destructor Destroy; override;

      property IsSchemaStored: Boolean read GetSchemaStored;
      property IsReferenceStored: Boolean read GetReferenceStored;
    published
      property Schema: Schema read GetSchema write FSchema stored GetSchemaStored;
      property Reference: Reference read GetReference write FReference stored GetReferenceStored;
    end;

    TProperties = class
    private
      FSchema: Schema;
      FReference: Reference;

      function GetSchema: Schema;
      function GetReference: Reference;
      function GetSchemaStored: Boolean;
      function GetReferenceStored: Boolean;
    public
      destructor Destroy; override;

      property IsSchemaStored: Boolean read GetSchemaStored;
      property IsReferenceStored: Boolean read GetReferenceStored;
    published
      property Schema: Schema read GetSchema write FSchema stored GetSchemaStored;
      property Reference: Reference read GetReference write FReference stored GetReferenceStored;
    end;

    [Flat]
    TAdditionalProperties = class
    private
      FSchema: Schema;
      FReference: Reference;
      FBoolean: System.Boolean;
      FBooleanIsStored: Boolean;

      function GetSchema: Schema;
      function GetReference: Reference;
      function GetSchemaStored: Boolean;
      function GetReferenceStored: Boolean;
      procedure SetBoolean(const Value: System.Boolean);
    public
      destructor Destroy; override;

      property IsSchemaStored: Boolean read GetSchemaStored;
      property IsReferenceStored: Boolean read GetReferenceStored;
      property IsBooleanStored: Boolean read FBooleanIsStored;
    published
      property Schema: Schema read GetSchema write FSchema stored GetSchemaStored;
      property Reference: Reference read GetReference write FReference stored GetReferenceStored;
      property boolean: System.Boolean read FBoolean write SetBoolean stored FBooleanIsStored;
    end;
  private
    FTitle: System.String;
    FMultipleOf: System.Double;
    FMaximum: System.Double;
    FExclusiveMaximum: System.Boolean;
    FMinimum: System.Double;
    FExclusiveMinimum: System.Boolean;
    FMaxLength: System.Integer;
    FMinLength: System.Integer;
    FPattern: System.String;
    FMaxItems: System.Integer;
    FMinItems: System.Integer;
    FUniqueItems: System.Boolean;
    FMaxProperties: System.Integer;
    FMinProperties: System.Integer;
    FRequired: TArray<System.String>;
    FEnum: TArray<any>;
    FType: Schema.TType;
    FNot: Schema.TNot;
    FAllOf: TArray<Schema.TAllOfArrayItem>;
    FOneOf: TArray<Schema.TOneOfArrayItem>;
    FAnyOf: TArray<Schema.TAnyOfArrayItem>;
    FItems: Schema.TItems;
    FProperties: Schema.TProperties;
    FAdditionalProperties: Schema.TAdditionalProperties;
    FDescription: System.String;
    FFormat: System.String;
    FDefault: any;
    FNullable: System.Boolean;
    FDiscriminator: Discriminator;
    FReadOnly: System.Boolean;
    FWriteOnly: System.Boolean;
    FExample: any;
    FExternalDocs: ExternalDocumentation;
    FDeprecated: System.Boolean;
    FXml: XML;
    FAnonymous: TDynamicProperty<any>;
    FExclusiveMaximumIsStored: Boolean;
    FExclusiveMinimumIsStored: Boolean;
    FUniqueItemsIsStored: Boolean;
    FTypeIsStored: Boolean;
    FDefaultIsStored: Boolean;
    FNullableIsStored: Boolean;
    FReadOnlyIsStored: Boolean;
    FWriteOnlyIsStored: Boolean;
    FExampleIsStored: Boolean;
    FDeprecatedIsStored: Boolean;

    function GetNot: Schema.TNot;
    function GetItems: Schema.TItems;
    function GetProperties: Schema.TProperties;
    function GetAdditionalProperties: Schema.TAdditionalProperties;
    function GetDiscriminator: Discriminator;
    function GetExternalDocs: ExternalDocumentation;
    function GetXml: XML;
    function GetAnonymous: TDynamicProperty<any>;
    function GetTitleStored: Boolean;
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
    function GetNotStored: Boolean;
    function GetAllOfStored: Boolean;
    function GetOneOfStored: Boolean;
    function GetAnyOfStored: Boolean;
    function GetItemsStored: Boolean;
    function GetPropertiesStored: Boolean;
    function GetAdditionalPropertiesStored: Boolean;
    function GetDescriptionStored: Boolean;
    function GetFormatStored: Boolean;
    function GetDiscriminatorStored: Boolean;
    function GetExternalDocsStored: Boolean;
    function GetXmlStored: Boolean;
    function GetAnonymousStored: Boolean;
    procedure SetExclusiveMaximum(const Value: System.Boolean);
    procedure SetExclusiveMinimum(const Value: System.Boolean);
    procedure SetUniqueItems(const Value: System.Boolean);
    procedure SetType(const Value: Schema.TType);
    procedure SetDefault(const Value: any);
    procedure SetNullable(const Value: System.Boolean);
    procedure SetReadOnly(const Value: System.Boolean);
    procedure SetWriteOnly(const Value: System.Boolean);
    procedure SetExample(const Value: any);
    procedure SetDeprecated(const Value: System.Boolean);
  public
    destructor Destroy; override;

    function AddAllOf: Schema.TAllOfArrayItem;
    function AddOneOf: Schema.TOneOfArrayItem;
    function AddAnyOf: Schema.TAnyOfArrayItem;

    property IsTitleStored: Boolean read GetTitleStored;
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
    property IsTypeStored: Boolean read FTypeIsStored;
    property IsNotStored: Boolean read GetNotStored;
    property IsAllOfStored: Boolean read GetAllOfStored;
    property IsOneOfStored: Boolean read GetOneOfStored;
    property IsAnyOfStored: Boolean read GetAnyOfStored;
    property IsItemsStored: Boolean read GetItemsStored;
    property IsPropertiesStored: Boolean read GetPropertiesStored;
    property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsFormatStored: Boolean read GetFormatStored;
    property IsDefaultStored: Boolean read FDefaultIsStored;
    property IsNullableStored: Boolean read FNullableIsStored;
    property IsDiscriminatorStored: Boolean read GetDiscriminatorStored;
    property IsReadOnlyStored: Boolean read FReadOnlyIsStored;
    property IsWriteOnlyStored: Boolean read FWriteOnlyIsStored;
    property IsExampleStored: Boolean read FExampleIsStored;
    property IsExternalDocsStored: Boolean read GetExternalDocsStored;
    property IsDeprecatedStored: Boolean read FDeprecatedIsStored;
    property IsXmlStored: Boolean read GetXmlStored;
    property IsAnonymousStored: Boolean read GetAnonymousStored;
  published
    property title: System.String read FTitle write FTitle stored GetTitleStored;
    property multipleOf: System.Double read FMultipleOf write FMultipleOf stored GetMultipleOfStored;
    property maximum: System.Double read FMaximum write FMaximum stored GetMaximumStored;
    property exclusiveMaximum: System.Boolean read FExclusiveMaximum write SetExclusiveMaximum stored FExclusiveMaximumIsStored;
    property minimum: System.Double read FMinimum write FMinimum stored GetMinimumStored;
    property exclusiveMinimum: System.Boolean read FExclusiveMinimum write SetExclusiveMinimum stored FExclusiveMinimumIsStored;
    property maxLength: System.Integer read FMaxLength write FMaxLength stored GetMaxLengthStored;
    property minLength: System.Integer read FMinLength write FMinLength stored GetMinLengthStored;
    property pattern: System.String read FPattern write FPattern stored GetPatternStored;
    property maxItems: System.Integer read FMaxItems write FMaxItems stored GetMaxItemsStored;
    property minItems: System.Integer read FMinItems write FMinItems stored GetMinItemsStored;
    property uniqueItems: System.Boolean read FUniqueItems write SetUniqueItems stored FUniqueItemsIsStored;
    property maxProperties: System.Integer read FMaxProperties write FMaxProperties stored GetMaxPropertiesStored;
    property minProperties: System.Integer read FMinProperties write FMinProperties stored GetMinPropertiesStored;
    property required: TArray<System.String> read FRequired write FRequired stored GetRequiredStored;
    property enum: TArray<any> read FEnum write FEnum stored GetEnumStored;
    [FieldName('type')]
    property &Type: Schema.TType read FType write SetType stored FTypeIsStored;
    [FieldName('not')]
    property &Not: Schema.TNot read GetNot write FNot stored GetNotStored;
    property allOf: TArray<Schema.TAllOfArrayItem> read FAllOf write FAllOf stored GetAllOfStored;
    property oneOf: TArray<Schema.TOneOfArrayItem> read FOneOf write FOneOf stored GetOneOfStored;
    property anyOf: TArray<Schema.TAnyOfArrayItem> read FAnyOf write FAnyOf stored GetAnyOfStored;
    property items: Schema.TItems read GetItems write FItems stored GetItemsStored;
    property properties: Schema.TProperties read GetProperties write FProperties stored GetPropertiesStored;
    property additionalProperties: Schema.TAdditionalProperties read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property format: System.String read FFormat write FFormat stored GetFormatStored;
    property default: any read FDefault write SetDefault stored FDefaultIsStored;
    property nullable: System.Boolean read FNullable write SetNullable stored FNullableIsStored;
    property discriminator: Discriminator read GetDiscriminator write FDiscriminator stored GetDiscriminatorStored;
    property readOnly: System.Boolean read FReadOnly write SetReadOnly stored FReadOnlyIsStored;
    property writeOnly: System.Boolean read FWriteOnly write SetWriteOnly stored FWriteOnlyIsStored;
    property example: any read FExample write SetExample stored FExampleIsStored;
    property externalDocs: ExternalDocumentation read GetExternalDocs write FExternalDocs stored GetExternalDocsStored;
    property deprecated: System.Boolean read FDeprecated write SetDeprecated stored FDeprecatedIsStored;
    property xml: XML read GetXml write FXml stored GetXmlStored;
    [PatternProperty('^x-')]
    property Anonymous: TDynamicProperty<any> read GetAnonymous write FAnonymous stored GetAnonymousStored;
  end;

  Discriminator = class
  public type
    TMapping = class
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
  private
    FPropertyName: System.String;
    FMapping: Discriminator.TMapping;

    function GetMapping: Discriminator.TMapping;
    function GetMappingStored: Boolean;
  public
    destructor Destroy; override;

    property IsMappingStored: Boolean read GetMappingStored;
  published
    property propertyName: System.String read FPropertyName write FPropertyName;
    property mapping: Discriminator.TMapping read GetMapping write FMapping stored GetMappingStored;
  end;

  XML = class
  private
    FName: System.String;
    FNamespace: System.String;
    FPrefix: System.String;
    FAttribute: System.Boolean;
    FWrapped: System.Boolean;
    FAnonymous: TDynamicProperty<any>;
    FAttributeIsStored: Boolean;
    FWrappedIsStored: Boolean;

    function GetAnonymous: TDynamicProperty<any>;
    function GetNameStored: Boolean;
    function GetNamespaceStored: Boolean;
    function GetPrefixStored: Boolean;
    function GetAnonymousStored: Boolean;
    procedure SetAttribute(const Value: System.Boolean);
    procedure SetWrapped(const Value: System.Boolean);
  public
    destructor Destroy; override;

    property IsNameStored: Boolean read GetNameStored;
    property IsNamespaceStored: Boolean read GetNamespaceStored;
    property IsPrefixStored: Boolean read GetPrefixStored;
    property IsAttributeStored: Boolean read FAttributeIsStored;
    property IsWrappedStored: Boolean read FWrappedIsStored;
    property IsAnonymousStored: Boolean read GetAnonymousStored;
  published
    property name: System.String read FName write FName stored GetNameStored;
    property namespace: System.String read FNamespace write FNamespace stored GetNamespaceStored;
    property prefix: System.String read FPrefix write FPrefix stored GetPrefixStored;
    property attribute: System.Boolean read FAttribute write SetAttribute stored FAttributeIsStored;
    property wrapped: System.Boolean read FWrapped write SetWrapped stored FWrappedIsStored;
    [PatternProperty('^x-')]
    property Anonymous: TDynamicProperty<any> read GetAnonymous write FAnonymous stored GetAnonymousStored;
  end;

  Response = class
  public type
    THeaders = class
    private
      FHeader: Header;
      FReference: Reference;

      function GetHeader: Header;
      function GetReference: Reference;
      function GetHeaderStored: Boolean;
      function GetReferenceStored: Boolean;
    public
      destructor Destroy; override;

      property IsHeaderStored: Boolean read GetHeaderStored;
      property IsReferenceStored: Boolean read GetReferenceStored;
    published
      property Header: Header read GetHeader write FHeader stored GetHeaderStored;
      property Reference: Reference read GetReference write FReference stored GetReferenceStored;
    end;

    TContent = class
    private
      FMediaType: TDynamicProperty<MediaType>;

      function GetMediaType: TDynamicProperty<MediaType>;
      function GetMediaTypeStored: Boolean;
    public
      destructor Destroy; override;

      property IsMediaTypeStored: Boolean read GetMediaTypeStored;
    published
      property MediaType: TDynamicProperty<MediaType> read GetMediaType write FMediaType stored GetMediaTypeStored;
    end;

    TLinks = class
    private
      FLink: Link;
      FReference: Reference;

      function GetLink: Link;
      function GetReference: Reference;
      function GetLinkStored: Boolean;
      function GetReferenceStored: Boolean;
    public
      destructor Destroy; override;

      property IsLinkStored: Boolean read GetLinkStored;
      property IsReferenceStored: Boolean read GetReferenceStored;
    published
      property Link: Link read GetLink write FLink stored GetLinkStored;
      property Reference: Reference read GetReference write FReference stored GetReferenceStored;
    end;
  private
    FDescription: System.String;
    FHeaders: Response.THeaders;
    FContent: Response.TContent;
    FLinks: Response.TLinks;
    FAnonymous: TDynamicProperty<any>;

    function GetHeaders: Response.THeaders;
    function GetContent: Response.TContent;
    function GetLinks: Response.TLinks;
    function GetAnonymous: TDynamicProperty<any>;
    function GetHeadersStored: Boolean;
    function GetContentStored: Boolean;
    function GetLinksStored: Boolean;
    function GetAnonymousStored: Boolean;
  public
    destructor Destroy; override;

    property IsHeadersStored: Boolean read GetHeadersStored;
    property IsContentStored: Boolean read GetContentStored;
    property IsLinksStored: Boolean read GetLinksStored;
    property IsAnonymousStored: Boolean read GetAnonymousStored;
  published
    property description: System.String read FDescription write FDescription;
    property headers: Response.THeaders read GetHeaders write FHeaders stored GetHeadersStored;
    property content: Response.TContent read GetContent write FContent stored GetContentStored;
    property links: Response.TLinks read GetLinks write FLinks stored GetLinksStored;
    [PatternProperty('^x-')]
    property Anonymous: TDynamicProperty<any> read GetAnonymous write FAnonymous stored GetAnonymousStored;
  end;

  [Flat]
  MediaType = class
  public type
    [Flat]
    TSchema = class
    private
      FSchema: Schema;
      FReference: Reference;

      function GetSchema: Schema;
      function GetReference: Reference;
      function GetSchemaStored: Boolean;
      function GetReferenceStored: Boolean;
    public
      destructor Destroy; override;

      property IsSchemaStored: Boolean read GetSchemaStored;
      property IsReferenceStored: Boolean read GetReferenceStored;
    published
      property Schema: Schema read GetSchema write FSchema stored GetSchemaStored;
      property Reference: Reference read GetReference write FReference stored GetReferenceStored;
    end;

    TExamples = class
    private
      FExample: Example;
      FReference: Reference;

      function GetExample: Example;
      function GetReference: Reference;
      function GetExampleStored: Boolean;
      function GetReferenceStored: Boolean;
    public
      destructor Destroy; override;

      property IsExampleStored: Boolean read GetExampleStored;
      property IsReferenceStored: Boolean read GetReferenceStored;
    published
      property Example: Example read GetExample write FExample stored GetExampleStored;
      property Reference: Reference read GetReference write FReference stored GetReferenceStored;
    end;

    TEncoding = class
    private
      FEncoding: TDynamicProperty<Encoding>;

      function GetEncoding: TDynamicProperty<Encoding>;
      function GetEncodingStored: Boolean;
    public
      destructor Destroy; override;

      property IsEncodingStored: Boolean read GetEncodingStored;
    published
      property Encoding: TDynamicProperty<Encoding> read GetEncoding write FEncoding stored GetEncodingStored;
    end;
  private
    FSchema: MediaType.TSchema;
    FExample: any;
    FExamples: MediaType.TExamples;
    FEncoding: MediaType.TEncoding;
    FExampleXORExamples: ExampleXORExamples;
    FAnonymous: TDynamicProperty<any>;
    FExampleIsStored: Boolean;
    FExampleXORExamplesIsStored: Boolean;

    function GetSchema: MediaType.TSchema;
    function GetExamples: MediaType.TExamples;
    function GetEncoding: MediaType.TEncoding;
    function GetAnonymous: TDynamicProperty<any>;
    function GetSchemaStored: Boolean;
    function GetExamplesStored: Boolean;
    function GetEncodingStored: Boolean;
    function GetAnonymousStored: Boolean;
    procedure SetExample(const Value: any);
    procedure SetExampleXORExamples(const Value: ExampleXORExamples);
  public
    destructor Destroy; override;

    property IsSchemaStored: Boolean read GetSchemaStored;
    property IsExampleStored: Boolean read FExampleIsStored;
    property IsExamplesStored: Boolean read GetExamplesStored;
    property IsEncodingStored: Boolean read GetEncodingStored;
    property IsExampleXORExamplesStored: Boolean read FExampleXORExamplesIsStored;
    property IsAnonymousStored: Boolean read GetAnonymousStored;
  published
    property schema: MediaType.TSchema read GetSchema write FSchema stored GetSchemaStored;
    property example: any read FExample write SetExample stored FExampleIsStored;
    property examples: MediaType.TExamples read GetExamples write FExamples stored GetExamplesStored;
    property encoding: MediaType.TEncoding read GetEncoding write FEncoding stored GetEncodingStored;
    property ExampleXORExamples: ExampleXORExamples read FExampleXORExamples write SetExampleXORExamples stored FExampleXORExamplesIsStored;
    [PatternProperty('^x-')]
    property Anonymous: TDynamicProperty<any> read GetAnonymous write FAnonymous stored GetAnonymousStored;
  end;

  Example = class
  private
    FSummary: System.String;
    FDescription: System.String;
    FValue: any;
    FExternalValue: System.String;
    FAnonymous: TDynamicProperty<any>;
    FValueIsStored: Boolean;

    function GetAnonymous: TDynamicProperty<any>;
    function GetSummaryStored: Boolean;
    function GetDescriptionStored: Boolean;
    function GetExternalValueStored: Boolean;
    function GetAnonymousStored: Boolean;
    procedure SetValue(const Value: any);
  public
    destructor Destroy; override;

    property IsSummaryStored: Boolean read GetSummaryStored;
    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsValueStored: Boolean read FValueIsStored;
    property IsExternalValueStored: Boolean read GetExternalValueStored;
    property IsAnonymousStored: Boolean read GetAnonymousStored;
  published
    property summary: System.String read FSummary write FSummary stored GetSummaryStored;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property value: any read FValue write SetValue stored FValueIsStored;
    property externalValue: System.String read FExternalValue write FExternalValue stored GetExternalValueStored;
    [PatternProperty('^x-')]
    property Anonymous: TDynamicProperty<any> read GetAnonymous write FAnonymous stored GetAnonymousStored;
  end;

  [Flat]
  Header = class
  public type
    TStyle = (simple);
    [Flat]
    TSchema = class
    private
      FSchema: Schema;
      FReference: Reference;

      function GetSchema: Schema;
      function GetReference: Reference;
      function GetSchemaStored: Boolean;
      function GetReferenceStored: Boolean;
    public
      destructor Destroy; override;

      property IsSchemaStored: Boolean read GetSchemaStored;
      property IsReferenceStored: Boolean read GetReferenceStored;
    published
      property Schema: Schema read GetSchema write FSchema stored GetSchemaStored;
      property Reference: Reference read GetReference write FReference stored GetReferenceStored;
    end;

    TContent = class
    private
      FMediaType: TDynamicProperty<MediaType>;

      function GetMediaType: TDynamicProperty<MediaType>;
      function GetMediaTypeStored: Boolean;
    public
      destructor Destroy; override;

      property IsMediaTypeStored: Boolean read GetMediaTypeStored;
    published
      property MediaType: TDynamicProperty<MediaType> read GetMediaType write FMediaType stored GetMediaTypeStored;
    end;

    TExamples = class
    private
      FExample: Example;
      FReference: Reference;

      function GetExample: Example;
      function GetReference: Reference;
      function GetExampleStored: Boolean;
      function GetReferenceStored: Boolean;
    public
      destructor Destroy; override;

      property IsExampleStored: Boolean read GetExampleStored;
      property IsReferenceStored: Boolean read GetReferenceStored;
    published
      property Example: Example read GetExample write FExample stored GetExampleStored;
      property Reference: Reference read GetReference write FReference stored GetReferenceStored;
    end;
  private
    FDescription: System.String;
    FRequired: System.Boolean;
    FDeprecated: System.Boolean;
    FAllowEmptyValue: System.Boolean;
    FStyle: Header.TStyle;
    FExplode: System.Boolean;
    FAllowReserved: System.Boolean;
    FSchema: Header.TSchema;
    FContent: Header.TContent;
    FExample: any;
    FExamples: Header.TExamples;
    FExampleXORExamples: ExampleXORExamples;
    FSchemaXORContent: SchemaXORContent;
    FAnonymous: TDynamicProperty<any>;
    FRequiredIsStored: Boolean;
    FDeprecatedIsStored: Boolean;
    FAllowEmptyValueIsStored: Boolean;
    FStyleIsStored: Boolean;
    FExplodeIsStored: Boolean;
    FAllowReservedIsStored: Boolean;
    FExampleIsStored: Boolean;
    FExampleXORExamplesIsStored: Boolean;

    function GetSchema: Header.TSchema;
    function GetContent: Header.TContent;
    function GetExamples: Header.TExamples;
    function GetSchemaXORContent: SchemaXORContent;
    function GetAnonymous: TDynamicProperty<any>;
    function GetDescriptionStored: Boolean;
    function GetSchemaStored: Boolean;
    function GetContentStored: Boolean;
    function GetExamplesStored: Boolean;
    function GetSchemaXORContentStored: Boolean;
    function GetAnonymousStored: Boolean;
    procedure SetRequired(const Value: System.Boolean);
    procedure SetDeprecated(const Value: System.Boolean);
    procedure SetAllowEmptyValue(const Value: System.Boolean);
    procedure SetStyle(const Value: Header.TStyle);
    procedure SetExplode(const Value: System.Boolean);
    procedure SetAllowReserved(const Value: System.Boolean);
    procedure SetExample(const Value: any);
    procedure SetExampleXORExamples(const Value: ExampleXORExamples);
  public
    destructor Destroy; override;

    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsRequiredStored: Boolean read FRequiredIsStored;
    property IsDeprecatedStored: Boolean read FDeprecatedIsStored;
    property IsAllowEmptyValueStored: Boolean read FAllowEmptyValueIsStored;
    property IsStyleStored: Boolean read FStyleIsStored;
    property IsExplodeStored: Boolean read FExplodeIsStored;
    property IsAllowReservedStored: Boolean read FAllowReservedIsStored;
    property IsSchemaStored: Boolean read GetSchemaStored;
    property IsContentStored: Boolean read GetContentStored;
    property IsExampleStored: Boolean read FExampleIsStored;
    property IsExamplesStored: Boolean read GetExamplesStored;
    property IsExampleXORExamplesStored: Boolean read FExampleXORExamplesIsStored;
    property IsSchemaXORContentStored: Boolean read GetSchemaXORContentStored;
    property IsAnonymousStored: Boolean read GetAnonymousStored;
  published
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property required: System.Boolean read FRequired write SetRequired stored FRequiredIsStored;
    property deprecated: System.Boolean read FDeprecated write SetDeprecated stored FDeprecatedIsStored;
    property allowEmptyValue: System.Boolean read FAllowEmptyValue write SetAllowEmptyValue stored FAllowEmptyValueIsStored;
    property style: Header.TStyle read FStyle write SetStyle stored FStyleIsStored;
    property explode: System.Boolean read FExplode write SetExplode stored FExplodeIsStored;
    property allowReserved: System.Boolean read FAllowReserved write SetAllowReserved stored FAllowReservedIsStored;
    property schema: Header.TSchema read GetSchema write FSchema stored GetSchemaStored;
    property content: Header.TContent read GetContent write FContent stored GetContentStored;
    property example: any read FExample write SetExample stored FExampleIsStored;
    property examples: Header.TExamples read GetExamples write FExamples stored GetExamplesStored;
    property ExampleXORExamples: ExampleXORExamples read FExampleXORExamples write SetExampleXORExamples stored FExampleXORExamplesIsStored;
    property SchemaXORContent: SchemaXORContent read GetSchemaXORContent write FSchemaXORContent stored GetSchemaXORContentStored;
    [PatternProperty('^x-')]
    property Anonymous: TDynamicProperty<any> read GetAnonymous write FAnonymous stored GetAnonymousStored;
  end;

  Paths = class
  private
    FPathItem: TDynamicProperty<PathItem>;
    FAnonymous: TDynamicProperty<any>;

    function GetPathItem: TDynamicProperty<PathItem>;
    function GetAnonymous: TDynamicProperty<any>;
    function GetPathItemStored: Boolean;
    function GetAnonymousStored: Boolean;
  public
    destructor Destroy; override;

    property IsPathItemStored: Boolean read GetPathItemStored;
    property IsAnonymousStored: Boolean read GetAnonymousStored;
  published
    [PatternProperty('^\/')]
    property PathItem: TDynamicProperty<PathItem> read GetPathItem write FPathItem stored GetPathItemStored;
    [PatternProperty('^x-')]
    property Anonymous: TDynamicProperty<any> read GetAnonymous write FAnonymous stored GetAnonymousStored;
  end;

  PathItem = class
  public type
    [Flat]
    TParametersArrayItem = class
    private
      FParameter: Parameter;
      FReference: Reference;

      function GetParameter: Parameter;
      function GetReference: Reference;
      function GetParameterStored: Boolean;
      function GetReferenceStored: Boolean;
    public
      destructor Destroy; override;

      property IsParameterStored: Boolean read GetParameterStored;
      property IsReferenceStored: Boolean read GetReferenceStored;
    published
      property Parameter: Parameter read GetParameter write FParameter stored GetParameterStored;
      property Reference: Reference read GetReference write FReference stored GetReferenceStored;
    end;
  private
    FRef: System.String;
    FSummary: System.String;
    FDescription: System.String;
    FGet: Operation;
    FPut: Operation;
    FPost: Operation;
    FDelete: Operation;
    FOptions: Operation;
    FHead: Operation;
    FPatch: Operation;
    FTrace: Operation;
    FServers: TArray<Server>;
    FParameters: TArray<PathItem.TParametersArrayItem>;
    FAnonymous: TDynamicProperty<any>;

    function GetGet: Operation;
    function GetPut: Operation;
    function GetPost: Operation;
    function GetDelete: Operation;
    function GetOptions: Operation;
    function GetHead: Operation;
    function GetPatch: Operation;
    function GetTrace: Operation;
    function GetAnonymous: TDynamicProperty<any>;
    function GetRefStored: Boolean;
    function GetSummaryStored: Boolean;
    function GetDescriptionStored: Boolean;
    function GetGetStored: Boolean;
    function GetPutStored: Boolean;
    function GetPostStored: Boolean;
    function GetDeleteStored: Boolean;
    function GetOptionsStored: Boolean;
    function GetHeadStored: Boolean;
    function GetPatchStored: Boolean;
    function GetTraceStored: Boolean;
    function GetServersStored: Boolean;
    function GetParametersStored: Boolean;
    function GetAnonymousStored: Boolean;
  public
    destructor Destroy; override;

    function AddServers: Server;
    function AddParameters: PathItem.TParametersArrayItem;

    property IsRefStored: Boolean read GetRefStored;
    property IsSummaryStored: Boolean read GetSummaryStored;
    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsGetStored: Boolean read GetGetStored;
    property IsPutStored: Boolean read GetPutStored;
    property IsPostStored: Boolean read GetPostStored;
    property IsDeleteStored: Boolean read GetDeleteStored;
    property IsOptionsStored: Boolean read GetOptionsStored;
    property IsHeadStored: Boolean read GetHeadStored;
    property IsPatchStored: Boolean read GetPatchStored;
    property IsTraceStored: Boolean read GetTraceStored;
    property IsServersStored: Boolean read GetServersStored;
    property IsParametersStored: Boolean read GetParametersStored;
    property IsAnonymousStored: Boolean read GetAnonymousStored;
  published
    [FieldName('$ref')]
    property Ref: System.String read FRef write FRef stored GetRefStored;
    property summary: System.String read FSummary write FSummary stored GetSummaryStored;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property get: Operation read GetGet write FGet stored GetGetStored;
    property put: Operation read GetPut write FPut stored GetPutStored;
    property post: Operation read GetPost write FPost stored GetPostStored;
    property delete: Operation read GetDelete write FDelete stored GetDeleteStored;
    property options: Operation read GetOptions write FOptions stored GetOptionsStored;
    property head: Operation read GetHead write FHead stored GetHeadStored;
    property patch: Operation read GetPatch write FPatch stored GetPatchStored;
    property trace: Operation read GetTrace write FTrace stored GetTraceStored;
    property servers: TArray<Server> read FServers write FServers stored GetServersStored;
    property parameters: TArray<PathItem.TParametersArrayItem> read FParameters write FParameters stored GetParametersStored;
    [PatternProperty('^x-')]
    property Anonymous: TDynamicProperty<any> read GetAnonymous write FAnonymous stored GetAnonymousStored;
  end;

  Operation = class
  public type
    [Flat]
    TParametersArrayItem = class
    private
      FParameter: Parameter;
      FReference: Reference;

      function GetParameter: Parameter;
      function GetReference: Reference;
      function GetParameterStored: Boolean;
      function GetReferenceStored: Boolean;
    public
      destructor Destroy; override;

      property IsParameterStored: Boolean read GetParameterStored;
      property IsReferenceStored: Boolean read GetReferenceStored;
    published
      property Parameter: Parameter read GetParameter write FParameter stored GetParameterStored;
      property Reference: Reference read GetReference write FReference stored GetReferenceStored;
    end;

    [Flat]
    TRequestBody = class
    private
      FRequestBody: RequestBody;
      FReference: Reference;

      function GetRequestBody: RequestBody;
      function GetReference: Reference;
      function GetRequestBodyStored: Boolean;
      function GetReferenceStored: Boolean;
    public
      destructor Destroy; override;

      property IsRequestBodyStored: Boolean read GetRequestBodyStored;
      property IsReferenceStored: Boolean read GetReferenceStored;
    published
      property RequestBody: RequestBody read GetRequestBody write FRequestBody stored GetRequestBodyStored;
      property Reference: Reference read GetReference write FReference stored GetReferenceStored;
    end;

    TCallbacks = class
    private
      FCallback: Callback;
      FReference: Reference;

      function GetCallback: Callback;
      function GetReference: Reference;
      function GetCallbackStored: Boolean;
      function GetReferenceStored: Boolean;
    public
      destructor Destroy; override;

      property IsCallbackStored: Boolean read GetCallbackStored;
      property IsReferenceStored: Boolean read GetReferenceStored;
    published
      property Callback: Callback read GetCallback write FCallback stored GetCallbackStored;
      property Reference: Reference read GetReference write FReference stored GetReferenceStored;
    end;
  private
    FTags: TArray<System.String>;
    FSummary: System.String;
    FDescription: System.String;
    FExternalDocs: ExternalDocumentation;
    FOperationId: System.String;
    FParameters: TArray<Operation.TParametersArrayItem>;
    FRequestBody: Operation.TRequestBody;
    FResponses: Responses;
    FCallbacks: Operation.TCallbacks;
    FDeprecated: System.Boolean;
    FSecurity: TArray<SecurityRequirement>;
    FServers: TArray<Server>;
    FAnonymous: TDynamicProperty<any>;
    FDeprecatedIsStored: Boolean;

    function GetExternalDocs: ExternalDocumentation;
    function GetRequestBody: Operation.TRequestBody;
    function GetResponses: Responses;
    function GetCallbacks: Operation.TCallbacks;
    function GetAnonymous: TDynamicProperty<any>;
    function GetTagsStored: Boolean;
    function GetSummaryStored: Boolean;
    function GetDescriptionStored: Boolean;
    function GetExternalDocsStored: Boolean;
    function GetOperationIdStored: Boolean;
    function GetParametersStored: Boolean;
    function GetRequestBodyStored: Boolean;
    function GetCallbacksStored: Boolean;
    function GetSecurityStored: Boolean;
    function GetServersStored: Boolean;
    function GetAnonymousStored: Boolean;
    procedure SetDeprecated(const Value: System.Boolean);
  public
    destructor Destroy; override;

    function AddParameters: Operation.TParametersArrayItem;
    function AddSecurity: SecurityRequirement;
    function AddServers: Server;

    property IsTagsStored: Boolean read GetTagsStored;
    property IsSummaryStored: Boolean read GetSummaryStored;
    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsExternalDocsStored: Boolean read GetExternalDocsStored;
    property IsOperationIdStored: Boolean read GetOperationIdStored;
    property IsParametersStored: Boolean read GetParametersStored;
    property IsRequestBodyStored: Boolean read GetRequestBodyStored;
    property IsCallbacksStored: Boolean read GetCallbacksStored;
    property IsDeprecatedStored: Boolean read FDeprecatedIsStored;
    property IsSecurityStored: Boolean read GetSecurityStored;
    property IsServersStored: Boolean read GetServersStored;
    property IsAnonymousStored: Boolean read GetAnonymousStored;
  published
    property tags: TArray<System.String> read FTags write FTags stored GetTagsStored;
    property summary: System.String read FSummary write FSummary stored GetSummaryStored;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property externalDocs: ExternalDocumentation read GetExternalDocs write FExternalDocs stored GetExternalDocsStored;
    property operationId: System.String read FOperationId write FOperationId stored GetOperationIdStored;
    property parameters: TArray<Operation.TParametersArrayItem> read FParameters write FParameters stored GetParametersStored;
    property requestBody: Operation.TRequestBody read GetRequestBody write FRequestBody stored GetRequestBodyStored;
    property responses: Responses read GetResponses write FResponses;
    property callbacks: Operation.TCallbacks read GetCallbacks write FCallbacks stored GetCallbacksStored;
    property deprecated: System.Boolean read FDeprecated write SetDeprecated stored FDeprecatedIsStored;
    property security: TArray<SecurityRequirement> read FSecurity write FSecurity stored GetSecurityStored;
    property servers: TArray<Server> read FServers write FServers stored GetServersStored;
    [PatternProperty('^x-')]
    property Anonymous: TDynamicProperty<any> read GetAnonymous write FAnonymous stored GetAnonymousStored;
  end;

  Responses = class
  public type
    [Flat]
    TDefault = class
    private
      FResponse: Response;
      FReference: Reference;

      function GetResponse: Response;
      function GetReference: Reference;
      function GetResponseStored: Boolean;
      function GetReferenceStored: Boolean;
    public
      destructor Destroy; override;

      property IsResponseStored: Boolean read GetResponseStored;
      property IsReferenceStored: Boolean read GetReferenceStored;
    published
      property Response: Response read GetResponse write FResponse stored GetResponseStored;
      property Reference: Reference read GetReference write FReference stored GetReferenceStored;
    end;

    [Flat]
    TAnonymous = class
    private
      FResponse: Response;
      FReference: Reference;

      function GetResponse: Response;
      function GetReference: Reference;
      function GetResponseStored: Boolean;
      function GetReferenceStored: Boolean;
    public
      destructor Destroy; override;

      property IsResponseStored: Boolean read GetResponseStored;
      property IsReferenceStored: Boolean read GetReferenceStored;
    published
      property Response: Response read GetResponse write FResponse stored GetResponseStored;
      property Reference: Reference read GetReference write FReference stored GetReferenceStored;
    end;
  private
    FDefault: Responses.TDefault;
    FAnonymous: TDynamicProperty<Responses.TAnonymous>;
    FAnonymous2: TDynamicProperty<any>;

    function GetDefault: Responses.TDefault;
    function GetAnonymous: TDynamicProperty<Responses.TAnonymous>;
    function GetAnonymous2: TDynamicProperty<any>;
    function GetDefaultStored: Boolean;
    function GetAnonymousStored: Boolean;
    function GetAnonymous2Stored: Boolean;
  public
    destructor Destroy; override;

    property IsDefaultStored: Boolean read GetDefaultStored;
    property IsAnonymousStored: Boolean read GetAnonymousStored;
    property IsAnonymous2Stored: Boolean read GetAnonymous2Stored;
  published
    property default: Responses.TDefault read GetDefault write FDefault stored GetDefaultStored;
    [PatternProperty('^[1-5](?:\d{2}|XX)$')]
    property Anonymous: TDynamicProperty<Responses.TAnonymous> read GetAnonymous write FAnonymous stored GetAnonymousStored;
    [PatternProperty('^x-')]
    property Anonymous2: TDynamicProperty<any> read GetAnonymous2 write FAnonymous2 stored GetAnonymous2Stored;
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

  Tag = class
  private
    FName: System.String;
    FDescription: System.String;
    FExternalDocs: ExternalDocumentation;
    FAnonymous: TDynamicProperty<any>;

    function GetExternalDocs: ExternalDocumentation;
    function GetAnonymous: TDynamicProperty<any>;
    function GetDescriptionStored: Boolean;
    function GetExternalDocsStored: Boolean;
    function GetAnonymousStored: Boolean;
  public
    destructor Destroy; override;

    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsExternalDocsStored: Boolean read GetExternalDocsStored;
    property IsAnonymousStored: Boolean read GetAnonymousStored;
  published
    property name: System.String read FName write FName;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property externalDocs: ExternalDocumentation read GetExternalDocs write FExternalDocs stored GetExternalDocsStored;
    [PatternProperty('^x-')]
    property Anonymous: TDynamicProperty<any> read GetAnonymous write FAnonymous stored GetAnonymousStored;
  end;

  ExternalDocumentation = class
  private
    FDescription: System.String;
    FUrl: System.String;
    FAnonymous: TDynamicProperty<any>;

    function GetAnonymous: TDynamicProperty<any>;
    function GetDescriptionStored: Boolean;
    function GetAnonymousStored: Boolean;
  public
    destructor Destroy; override;

    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsAnonymousStored: Boolean read GetAnonymousStored;
  published
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property url: System.String read FUrl write FUrl;
    [PatternProperty('^x-')]
    property Anonymous: TDynamicProperty<any> read GetAnonymous write FAnonymous stored GetAnonymousStored;
  end;

  [Flat]
  SchemaXORContent = class
  public type
    [Flat]
    TAnonymous2 = class
    private
      FAnonymous: any;
      FAnonymous2: any;
      FAnonymous3: any;
      FAnonymous4: any;
      FAnonymous5: any;
      FAnonymousIsStored: Boolean;
      FAnonymous2IsStored: Boolean;
      FAnonymous3IsStored: Boolean;
      FAnonymous4IsStored: Boolean;
      FAnonymous5IsStored: Boolean;

      procedure SetAnonymous(const Value: any);
      procedure SetAnonymous2(const Value: any);
      procedure SetAnonymous3(const Value: any);
      procedure SetAnonymous4(const Value: any);
      procedure SetAnonymous5(const Value: any);
    public
      property IsAnonymousStored: Boolean read FAnonymousIsStored;
      property IsAnonymous2Stored: Boolean read FAnonymous2IsStored;
      property IsAnonymous3Stored: Boolean read FAnonymous3IsStored;
      property IsAnonymous4Stored: Boolean read FAnonymous4IsStored;
      property IsAnonymous5Stored: Boolean read FAnonymous5IsStored;
    published
      property Anonymous: any read FAnonymous write SetAnonymous stored FAnonymousIsStored;
      property Anonymous2: any read FAnonymous2 write SetAnonymous2 stored FAnonymous2IsStored;
      property Anonymous3: any read FAnonymous3 write SetAnonymous3 stored FAnonymous3IsStored;
      property Anonymous4: any read FAnonymous4 write SetAnonymous4 stored FAnonymous4IsStored;
      property Anonymous5: any read FAnonymous5 write SetAnonymous5 stored FAnonymous5IsStored;
    end;
  private
    FAnonymous: any;
    FAnonymous2: SchemaXORContent.TAnonymous2;
    FAnonymousIsStored: Boolean;

    function GetAnonymous2: SchemaXORContent.TAnonymous2;
    function GetAnonymous2Stored: Boolean;
    procedure SetAnonymous(const Value: any);
  public
    destructor Destroy; override;

    property IsAnonymousStored: Boolean read FAnonymousIsStored;
    property IsAnonymous2Stored: Boolean read GetAnonymous2Stored;
  published
    property Anonymous: any read FAnonymous write SetAnonymous stored FAnonymousIsStored;
    property Anonymous2: SchemaXORContent.TAnonymous2 read GetAnonymous2 write FAnonymous2 stored GetAnonymous2Stored;
  end;

  [Flat]
  Parameter = class
  public type
    [Flat]
    TSchema = class
    private
      FSchema: Schema;
      FReference: Reference;

      function GetSchema: Schema;
      function GetReference: Reference;
      function GetSchemaStored: Boolean;
      function GetReferenceStored: Boolean;
    public
      destructor Destroy; override;

      property IsSchemaStored: Boolean read GetSchemaStored;
      property IsReferenceStored: Boolean read GetReferenceStored;
    published
      property Schema: Schema read GetSchema write FSchema stored GetSchemaStored;
      property Reference: Reference read GetReference write FReference stored GetReferenceStored;
    end;

    TContent = class
    private
      FMediaType: TDynamicProperty<MediaType>;

      function GetMediaType: TDynamicProperty<MediaType>;
      function GetMediaTypeStored: Boolean;
    public
      destructor Destroy; override;

      property IsMediaTypeStored: Boolean read GetMediaTypeStored;
    published
      property MediaType: TDynamicProperty<MediaType> read GetMediaType write FMediaType stored GetMediaTypeStored;
    end;

    TExamples = class
    private
      FExample: Example;
      FReference: Reference;

      function GetExample: Example;
      function GetReference: Reference;
      function GetExampleStored: Boolean;
      function GetReferenceStored: Boolean;
    public
      destructor Destroy; override;

      property IsExampleStored: Boolean read GetExampleStored;
      property IsReferenceStored: Boolean read GetReferenceStored;
    published
      property Example: Example read GetExample write FExample stored GetExampleStored;
      property Reference: Reference read GetReference write FReference stored GetReferenceStored;
    end;
  private
    FName: System.String;
    FIn: System.String;
    FDescription: System.String;
    FRequired: System.Boolean;
    FDeprecated: System.Boolean;
    FAllowEmptyValue: System.Boolean;
    FStyle: System.String;
    FExplode: System.Boolean;
    FAllowReserved: System.Boolean;
    FSchema: Parameter.TSchema;
    FContent: Parameter.TContent;
    FExample: any;
    FExamples: Parameter.TExamples;
    FExampleXORExamples: ExampleXORExamples;
    FSchemaXORContent: SchemaXORContent;
    FPathParameter: PathParameter;
    FQueryParameter: QueryParameter;
    FHeaderParameter: HeaderParameter;
    FCookieParameter: CookieParameter;
    FAnonymous: TDynamicProperty<any>;
    FRequiredIsStored: Boolean;
    FDeprecatedIsStored: Boolean;
    FAllowEmptyValueIsStored: Boolean;
    FExplodeIsStored: Boolean;
    FAllowReservedIsStored: Boolean;
    FExampleIsStored: Boolean;
    FExampleXORExamplesIsStored: Boolean;
    FPathParameterIsStored: Boolean;
    FQueryParameterIsStored: Boolean;
    FHeaderParameterIsStored: Boolean;
    FCookieParameterIsStored: Boolean;

    function GetSchema: Parameter.TSchema;
    function GetContent: Parameter.TContent;
    function GetExamples: Parameter.TExamples;
    function GetSchemaXORContent: SchemaXORContent;
    function GetAnonymous: TDynamicProperty<any>;
    function GetDescriptionStored: Boolean;
    function GetStyleStored: Boolean;
    function GetSchemaStored: Boolean;
    function GetContentStored: Boolean;
    function GetExamplesStored: Boolean;
    function GetSchemaXORContentStored: Boolean;
    function GetAnonymousStored: Boolean;
    procedure SetRequired(const Value: System.Boolean);
    procedure SetDeprecated(const Value: System.Boolean);
    procedure SetAllowEmptyValue(const Value: System.Boolean);
    procedure SetExplode(const Value: System.Boolean);
    procedure SetAllowReserved(const Value: System.Boolean);
    procedure SetExample(const Value: any);
    procedure SetExampleXORExamples(const Value: ExampleXORExamples);
    procedure SetPathParameter(const Value: PathParameter);
    procedure SetQueryParameter(const Value: QueryParameter);
    procedure SetHeaderParameter(const Value: HeaderParameter);
    procedure SetCookieParameter(const Value: CookieParameter);
  public
    destructor Destroy; override;

    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsRequiredStored: Boolean read FRequiredIsStored;
    property IsDeprecatedStored: Boolean read FDeprecatedIsStored;
    property IsAllowEmptyValueStored: Boolean read FAllowEmptyValueIsStored;
    property IsStyleStored: Boolean read GetStyleStored;
    property IsExplodeStored: Boolean read FExplodeIsStored;
    property IsAllowReservedStored: Boolean read FAllowReservedIsStored;
    property IsSchemaStored: Boolean read GetSchemaStored;
    property IsContentStored: Boolean read GetContentStored;
    property IsExampleStored: Boolean read FExampleIsStored;
    property IsExamplesStored: Boolean read GetExamplesStored;
    property IsExampleXORExamplesStored: Boolean read FExampleXORExamplesIsStored;
    property IsSchemaXORContentStored: Boolean read GetSchemaXORContentStored;
    property IsPathParameterStored: Boolean read FPathParameterIsStored;
    property IsQueryParameterStored: Boolean read FQueryParameterIsStored;
    property IsHeaderParameterStored: Boolean read FHeaderParameterIsStored;
    property IsCookieParameterStored: Boolean read FCookieParameterIsStored;
    property IsAnonymousStored: Boolean read GetAnonymousStored;
  published
    property name: System.String read FName write FName;
    [FieldName('in')]
    property &In: System.String read FIn write FIn;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property required: System.Boolean read FRequired write SetRequired stored FRequiredIsStored;
    property deprecated: System.Boolean read FDeprecated write SetDeprecated stored FDeprecatedIsStored;
    property allowEmptyValue: System.Boolean read FAllowEmptyValue write SetAllowEmptyValue stored FAllowEmptyValueIsStored;
    property style: System.String read FStyle write FStyle stored GetStyleStored;
    property explode: System.Boolean read FExplode write SetExplode stored FExplodeIsStored;
    property allowReserved: System.Boolean read FAllowReserved write SetAllowReserved stored FAllowReservedIsStored;
    property schema: Parameter.TSchema read GetSchema write FSchema stored GetSchemaStored;
    property content: Parameter.TContent read GetContent write FContent stored GetContentStored;
    property example: any read FExample write SetExample stored FExampleIsStored;
    property examples: Parameter.TExamples read GetExamples write FExamples stored GetExamplesStored;
    property ExampleXORExamples: ExampleXORExamples read FExampleXORExamples write SetExampleXORExamples stored FExampleXORExamplesIsStored;
    property SchemaXORContent: SchemaXORContent read GetSchemaXORContent write FSchemaXORContent stored GetSchemaXORContentStored;
    property PathParameter: PathParameter read FPathParameter write SetPathParameter stored FPathParameterIsStored;
    property QueryParameter: QueryParameter read FQueryParameter write SetQueryParameter stored FQueryParameterIsStored;
    property HeaderParameter: HeaderParameter read FHeaderParameter write SetHeaderParameter stored FHeaderParameterIsStored;
    property CookieParameter: CookieParameter read FCookieParameter write SetCookieParameter stored FCookieParameterIsStored;
    [PatternProperty('^x-')]
    property Anonymous: TDynamicProperty<any> read GetAnonymous write FAnonymous stored GetAnonymousStored;
  end;

  RequestBody = class
  public type
    TContent = class
    private
      FMediaType: TDynamicProperty<MediaType>;

      function GetMediaType: TDynamicProperty<MediaType>;
      function GetMediaTypeStored: Boolean;
    public
      destructor Destroy; override;

      property IsMediaTypeStored: Boolean read GetMediaTypeStored;
    published
      property MediaType: TDynamicProperty<MediaType> read GetMediaType write FMediaType stored GetMediaTypeStored;
    end;
  private
    FDescription: System.String;
    FContent: RequestBody.TContent;
    FRequired: System.Boolean;
    FAnonymous: TDynamicProperty<any>;
    FRequiredIsStored: Boolean;

    function GetContent: RequestBody.TContent;
    function GetAnonymous: TDynamicProperty<any>;
    function GetDescriptionStored: Boolean;
    function GetAnonymousStored: Boolean;
    procedure SetRequired(const Value: System.Boolean);
  public
    destructor Destroy; override;

    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsRequiredStored: Boolean read FRequiredIsStored;
    property IsAnonymousStored: Boolean read GetAnonymousStored;
  published
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property content: RequestBody.TContent read GetContent write FContent;
    property required: System.Boolean read FRequired write SetRequired stored FRequiredIsStored;
    [PatternProperty('^x-')]
    property Anonymous: TDynamicProperty<any> read GetAnonymous write FAnonymous stored GetAnonymousStored;
  end;

  [Flat]
  SecurityScheme = class
  private
    FAPIKeySecurityScheme: APIKeySecurityScheme;
    FHTTPSecurityScheme: HTTPSecurityScheme;
    FOAuth2SecurityScheme: OAuth2SecurityScheme;
    FOpenIdConnectSecurityScheme: OpenIdConnectSecurityScheme;

    function GetAPIKeySecurityScheme: APIKeySecurityScheme;
    function GetHTTPSecurityScheme: HTTPSecurityScheme;
    function GetOAuth2SecurityScheme: OAuth2SecurityScheme;
    function GetOpenIdConnectSecurityScheme: OpenIdConnectSecurityScheme;
    function GetAPIKeySecuritySchemeStored: Boolean;
    function GetHTTPSecuritySchemeStored: Boolean;
    function GetOAuth2SecuritySchemeStored: Boolean;
    function GetOpenIdConnectSecuritySchemeStored: Boolean;
  public
    destructor Destroy; override;

    property IsAPIKeySecuritySchemeStored: Boolean read GetAPIKeySecuritySchemeStored;
    property IsHTTPSecuritySchemeStored: Boolean read GetHTTPSecuritySchemeStored;
    property IsOAuth2SecuritySchemeStored: Boolean read GetOAuth2SecuritySchemeStored;
    property IsOpenIdConnectSecuritySchemeStored: Boolean read GetOpenIdConnectSecuritySchemeStored;
  published
    property APIKeySecurityScheme: APIKeySecurityScheme read GetAPIKeySecurityScheme write FAPIKeySecurityScheme stored GetAPIKeySecuritySchemeStored;
    property HTTPSecurityScheme: HTTPSecurityScheme read GetHTTPSecurityScheme write FHTTPSecurityScheme stored GetHTTPSecuritySchemeStored;
    property OAuth2SecurityScheme: OAuth2SecurityScheme read GetOAuth2SecurityScheme write FOAuth2SecurityScheme stored GetOAuth2SecuritySchemeStored;
    property OpenIdConnectSecurityScheme: OpenIdConnectSecurityScheme read GetOpenIdConnectSecurityScheme write FOpenIdConnectSecurityScheme stored GetOpenIdConnectSecuritySchemeStored;
  end;

  APIKeySecurityScheme = class
  public type
    TType = (apiKey);

    TIn = (header, query, cookie);
  private
    FType: APIKeySecurityScheme.TType;
    FName: System.String;
    FIn: APIKeySecurityScheme.TIn;
    FDescription: System.String;
    FAnonymous: TDynamicProperty<any>;

    function GetAnonymous: TDynamicProperty<any>;
    function GetDescriptionStored: Boolean;
    function GetAnonymousStored: Boolean;
  public
    destructor Destroy; override;

    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsAnonymousStored: Boolean read GetAnonymousStored;
  published
    [FieldName('type')]
    property &Type: APIKeySecurityScheme.TType read FType write FType;
    property name: System.String read FName write FName;
    [FieldName('in')]
    property &In: APIKeySecurityScheme.TIn read FIn write FIn;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    [PatternProperty('^x-')]
    property Anonymous: TDynamicProperty<any> read GetAnonymous write FAnonymous stored GetAnonymousStored;
  end;

  [Flat]
  HTTPSecurityScheme = class
  public type
    TType = (http);
  private
    FScheme: System.String;
    FBearerFormat: System.String;
    FDescription: System.String;
    FType: HTTPSecurityScheme.TType;
    FAnonymous: any;
    FAnonymous2: any;
    FAnonymous3: TDynamicProperty<any>;
    FAnonymousIsStored: Boolean;
    FAnonymous2IsStored: Boolean;

    function GetAnonymous3: TDynamicProperty<any>;
    function GetBearerFormatStored: Boolean;
    function GetDescriptionStored: Boolean;
    function GetAnonymous3Stored: Boolean;
    procedure SetAnonymous(const Value: any);
    procedure SetAnonymous2(const Value: any);
  public
    destructor Destroy; override;

    property IsBearerFormatStored: Boolean read GetBearerFormatStored;
    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsAnonymousStored: Boolean read FAnonymousIsStored;
    property IsAnonymous2Stored: Boolean read FAnonymous2IsStored;
    property IsAnonymous3Stored: Boolean read GetAnonymous3Stored;
  published
    property scheme: System.String read FScheme write FScheme;
    property bearerFormat: System.String read FBearerFormat write FBearerFormat stored GetBearerFormatStored;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    [FieldName('type')]
    property &Type: HTTPSecurityScheme.TType read FType write FType;
    property Anonymous: any read FAnonymous write SetAnonymous stored FAnonymousIsStored;
    property Anonymous2: any read FAnonymous2 write SetAnonymous2 stored FAnonymous2IsStored;
    [PatternProperty('^x-')]
    property Anonymous3: TDynamicProperty<any> read GetAnonymous3 write FAnonymous3 stored GetAnonymous3Stored;
  end;

  OAuth2SecurityScheme = class
  public type
    TType = (oauth2);
  private
    FType: OAuth2SecurityScheme.TType;
    FFlows: OAuthFlows;
    FDescription: System.String;
    FAnonymous: TDynamicProperty<any>;

    function GetFlows: OAuthFlows;
    function GetAnonymous: TDynamicProperty<any>;
    function GetDescriptionStored: Boolean;
    function GetAnonymousStored: Boolean;
  public
    destructor Destroy; override;

    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsAnonymousStored: Boolean read GetAnonymousStored;
  published
    [FieldName('type')]
    property &Type: OAuth2SecurityScheme.TType read FType write FType;
    property flows: OAuthFlows read GetFlows write FFlows;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    [PatternProperty('^x-')]
    property Anonymous: TDynamicProperty<any> read GetAnonymous write FAnonymous stored GetAnonymousStored;
  end;

  OpenIdConnectSecurityScheme = class
  public type
    TType = (openIdConnect);
  private
    FType: OpenIdConnectSecurityScheme.TType;
    FOpenIdConnectUrl: System.String;
    FDescription: System.String;
    FAnonymous: TDynamicProperty<any>;

    function GetAnonymous: TDynamicProperty<any>;
    function GetDescriptionStored: Boolean;
    function GetAnonymousStored: Boolean;
  public
    destructor Destroy; override;

    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsAnonymousStored: Boolean read GetAnonymousStored;
  published
    [FieldName('type')]
    property &Type: OpenIdConnectSecurityScheme.TType read FType write FType;
    property openIdConnectUrl: System.String read FOpenIdConnectUrl write FOpenIdConnectUrl;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    [PatternProperty('^x-')]
    property Anonymous: TDynamicProperty<any> read GetAnonymous write FAnonymous stored GetAnonymousStored;
  end;

  OAuthFlows = class
  private
    FImplicit: ImplicitOAuthFlow;
    FPassword: PasswordOAuthFlow;
    FClientCredentials: ClientCredentialsFlow;
    FAuthorizationCode: AuthorizationCodeOAuthFlow;
    FAnonymous: TDynamicProperty<any>;

    function GetImplicit: ImplicitOAuthFlow;
    function GetPassword: PasswordOAuthFlow;
    function GetClientCredentials: ClientCredentialsFlow;
    function GetAuthorizationCode: AuthorizationCodeOAuthFlow;
    function GetAnonymous: TDynamicProperty<any>;
    function GetImplicitStored: Boolean;
    function GetPasswordStored: Boolean;
    function GetClientCredentialsStored: Boolean;
    function GetAuthorizationCodeStored: Boolean;
    function GetAnonymousStored: Boolean;
  public
    destructor Destroy; override;

    property IsImplicitStored: Boolean read GetImplicitStored;
    property IsPasswordStored: Boolean read GetPasswordStored;
    property IsClientCredentialsStored: Boolean read GetClientCredentialsStored;
    property IsAuthorizationCodeStored: Boolean read GetAuthorizationCodeStored;
    property IsAnonymousStored: Boolean read GetAnonymousStored;
  published
    property implicit: ImplicitOAuthFlow read GetImplicit write FImplicit stored GetImplicitStored;
    property password: PasswordOAuthFlow read GetPassword write FPassword stored GetPasswordStored;
    property clientCredentials: ClientCredentialsFlow read GetClientCredentials write FClientCredentials stored GetClientCredentialsStored;
    property authorizationCode: AuthorizationCodeOAuthFlow read GetAuthorizationCode write FAuthorizationCode stored GetAuthorizationCodeStored;
    [PatternProperty('^x-')]
    property Anonymous: TDynamicProperty<any> read GetAnonymous write FAnonymous stored GetAnonymousStored;
  end;

  ImplicitOAuthFlow = class
  public type
    TScopes = class
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
  private
    FAuthorizationUrl: System.String;
    FRefreshUrl: System.String;
    FScopes: ImplicitOAuthFlow.TScopes;
    FAnonymous: TDynamicProperty<any>;

    function GetScopes: ImplicitOAuthFlow.TScopes;
    function GetAnonymous: TDynamicProperty<any>;
    function GetRefreshUrlStored: Boolean;
    function GetAnonymousStored: Boolean;
  public
    destructor Destroy; override;

    property IsRefreshUrlStored: Boolean read GetRefreshUrlStored;
    property IsAnonymousStored: Boolean read GetAnonymousStored;
  published
    property authorizationUrl: System.String read FAuthorizationUrl write FAuthorizationUrl;
    property refreshUrl: System.String read FRefreshUrl write FRefreshUrl stored GetRefreshUrlStored;
    property scopes: ImplicitOAuthFlow.TScopes read GetScopes write FScopes;
    [PatternProperty('^x-')]
    property Anonymous: TDynamicProperty<any> read GetAnonymous write FAnonymous stored GetAnonymousStored;
  end;

  PasswordOAuthFlow = class
  public type
    TScopes = class
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
  private
    FTokenUrl: System.String;
    FRefreshUrl: System.String;
    FScopes: PasswordOAuthFlow.TScopes;
    FAnonymous: TDynamicProperty<any>;

    function GetScopes: PasswordOAuthFlow.TScopes;
    function GetAnonymous: TDynamicProperty<any>;
    function GetRefreshUrlStored: Boolean;
    function GetAnonymousStored: Boolean;
  public
    destructor Destroy; override;

    property IsRefreshUrlStored: Boolean read GetRefreshUrlStored;
    property IsAnonymousStored: Boolean read GetAnonymousStored;
  published
    property tokenUrl: System.String read FTokenUrl write FTokenUrl;
    property refreshUrl: System.String read FRefreshUrl write FRefreshUrl stored GetRefreshUrlStored;
    property scopes: PasswordOAuthFlow.TScopes read GetScopes write FScopes;
    [PatternProperty('^x-')]
    property Anonymous: TDynamicProperty<any> read GetAnonymous write FAnonymous stored GetAnonymousStored;
  end;

  ClientCredentialsFlow = class
  public type
    TScopes = class
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
  private
    FTokenUrl: System.String;
    FRefreshUrl: System.String;
    FScopes: ClientCredentialsFlow.TScopes;
    FAnonymous: TDynamicProperty<any>;

    function GetScopes: ClientCredentialsFlow.TScopes;
    function GetAnonymous: TDynamicProperty<any>;
    function GetRefreshUrlStored: Boolean;
    function GetAnonymousStored: Boolean;
  public
    destructor Destroy; override;

    property IsRefreshUrlStored: Boolean read GetRefreshUrlStored;
    property IsAnonymousStored: Boolean read GetAnonymousStored;
  published
    property tokenUrl: System.String read FTokenUrl write FTokenUrl;
    property refreshUrl: System.String read FRefreshUrl write FRefreshUrl stored GetRefreshUrlStored;
    property scopes: ClientCredentialsFlow.TScopes read GetScopes write FScopes;
    [PatternProperty('^x-')]
    property Anonymous: TDynamicProperty<any> read GetAnonymous write FAnonymous stored GetAnonymousStored;
  end;

  AuthorizationCodeOAuthFlow = class
  public type
    TScopes = class
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
  private
    FAuthorizationUrl: System.String;
    FTokenUrl: System.String;
    FRefreshUrl: System.String;
    FScopes: AuthorizationCodeOAuthFlow.TScopes;
    FAnonymous: TDynamicProperty<any>;

    function GetScopes: AuthorizationCodeOAuthFlow.TScopes;
    function GetAnonymous: TDynamicProperty<any>;
    function GetRefreshUrlStored: Boolean;
    function GetAnonymousStored: Boolean;
  public
    destructor Destroy; override;

    property IsRefreshUrlStored: Boolean read GetRefreshUrlStored;
    property IsAnonymousStored: Boolean read GetAnonymousStored;
  published
    property authorizationUrl: System.String read FAuthorizationUrl write FAuthorizationUrl;
    property tokenUrl: System.String read FTokenUrl write FTokenUrl;
    property refreshUrl: System.String read FRefreshUrl write FRefreshUrl stored GetRefreshUrlStored;
    property scopes: AuthorizationCodeOAuthFlow.TScopes read GetScopes write FScopes;
    [PatternProperty('^x-')]
    property Anonymous: TDynamicProperty<any> read GetAnonymous write FAnonymous stored GetAnonymousStored;
  end;

  Link = class
  public type
    TParameters = class
    end;
  private
    FOperationId: System.String;
    FOperationRef: System.String;
    FParameters: Link.TParameters;
    FRequestBody: any;
    FDescription: System.String;
    FServer: Server;
    FAnonymous: TDynamicProperty<any>;
    FRequestBodyIsStored: Boolean;

    function GetParameters: Link.TParameters;
    function GetServer: Server;
    function GetAnonymous: TDynamicProperty<any>;
    function GetOperationIdStored: Boolean;
    function GetOperationRefStored: Boolean;
    function GetParametersStored: Boolean;
    function GetDescriptionStored: Boolean;
    function GetServerStored: Boolean;
    function GetAnonymousStored: Boolean;
    procedure SetRequestBody(const Value: any);
  public
    destructor Destroy; override;

    property IsOperationIdStored: Boolean read GetOperationIdStored;
    property IsOperationRefStored: Boolean read GetOperationRefStored;
    property IsParametersStored: Boolean read GetParametersStored;
    property IsRequestBodyStored: Boolean read FRequestBodyIsStored;
    property IsDescriptionStored: Boolean read GetDescriptionStored;
    property IsServerStored: Boolean read GetServerStored;
    property IsAnonymousStored: Boolean read GetAnonymousStored;
  published
    property operationId: System.String read FOperationId write FOperationId stored GetOperationIdStored;
    property operationRef: System.String read FOperationRef write FOperationRef stored GetOperationRefStored;
    property parameters: Link.TParameters read GetParameters write FParameters stored GetParametersStored;
    property requestBody: any read FRequestBody write SetRequestBody stored FRequestBodyIsStored;
    property description: System.String read FDescription write FDescription stored GetDescriptionStored;
    property server: Server read GetServer write FServer stored GetServerStored;
    [PatternProperty('^x-')]
    property Anonymous: TDynamicProperty<any> read GetAnonymous write FAnonymous stored GetAnonymousStored;
  end;

  Callback = class
  private
    FPathItem: TDynamicProperty<PathItem>;
    FAnonymous: TDynamicProperty<any>;

    function GetPathItem: TDynamicProperty<PathItem>;
    function GetAnonymous: TDynamicProperty<any>;
    function GetPathItemStored: Boolean;
    function GetAnonymousStored: Boolean;
  public
    destructor Destroy; override;

    property IsPathItemStored: Boolean read GetPathItemStored;
    property IsAnonymousStored: Boolean read GetAnonymousStored;
  published
    property PathItem: TDynamicProperty<PathItem> read GetPathItem write FPathItem stored GetPathItemStored;
    [PatternProperty('^x-')]
    property Anonymous: TDynamicProperty<any> read GetAnonymous write FAnonymous stored GetAnonymousStored;
  end;

  Encoding = class
  public type
    TStyle = (form, spaceDelimited, pipeDelimited, deepObject);
    THeaders = class
    private
      FHeader: Header;
      FReference: Reference;

      function GetHeader: Header;
      function GetReference: Reference;
      function GetHeaderStored: Boolean;
      function GetReferenceStored: Boolean;
    public
      destructor Destroy; override;

      property IsHeaderStored: Boolean read GetHeaderStored;
      property IsReferenceStored: Boolean read GetReferenceStored;
    published
      property Header: Header read GetHeader write FHeader stored GetHeaderStored;
      property Reference: Reference read GetReference write FReference stored GetReferenceStored;
    end;
  private
    FContentType: System.String;
    FHeaders: Encoding.THeaders;
    FStyle: Encoding.TStyle;
    FExplode: System.Boolean;
    FAllowReserved: System.Boolean;
    FAnonymous: TDynamicProperty<any>;
    FStyleIsStored: Boolean;
    FExplodeIsStored: Boolean;
    FAllowReservedIsStored: Boolean;

    function GetHeaders: Encoding.THeaders;
    function GetAnonymous: TDynamicProperty<any>;
    function GetContentTypeStored: Boolean;
    function GetHeadersStored: Boolean;
    function GetAnonymousStored: Boolean;
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
    property IsAnonymousStored: Boolean read GetAnonymousStored;
  published
    property contentType: System.String read FContentType write FContentType stored GetContentTypeStored;
    property headers: Encoding.THeaders read GetHeaders write FHeaders stored GetHeadersStored;
    property style: Encoding.TStyle read FStyle write SetStyle stored FStyleIsStored;
    property explode: System.Boolean read FExplode write SetExplode stored FExplodeIsStored;
    property allowReserved: System.Boolean read FAllowReserved write SetAllowReserved stored FAllowReservedIsStored;
    [PatternProperty('^x-')]
    property Anonymous: TDynamicProperty<any> read GetAnonymous write FAnonymous stored GetAnonymousStored;
  end;

  TOpenAPIDefinition = class
  private
    FOpenapi: System.String;
    FInfo: Info;
    FExternalDocs: ExternalDocumentation;
    FServers: TArray<Server>;
    FSecurity: TArray<SecurityRequirement>;
    FTags: TArray<Tag>;
    FPaths: Paths;
    FComponents: Components;
    FAnonymous: TDynamicProperty<any>;

    function GetInfo: Info;
    function GetExternalDocs: ExternalDocumentation;
    function GetPaths: Paths;
    function GetComponents: Components;
    function GetAnonymous: TDynamicProperty<any>;
    function GetExternalDocsStored: Boolean;
    function GetServersStored: Boolean;
    function GetSecurityStored: Boolean;
    function GetTagsStored: Boolean;
    function GetComponentsStored: Boolean;
    function GetAnonymousStored: Boolean;
  public
    destructor Destroy; override;

    function AddServers: Server;
    function AddSecurity: SecurityRequirement;
    function AddTags: Tag;

    property IsExternalDocsStored: Boolean read GetExternalDocsStored;
    property IsServersStored: Boolean read GetServersStored;
    property IsSecurityStored: Boolean read GetSecurityStored;
    property IsTagsStored: Boolean read GetTagsStored;
    property IsComponentsStored: Boolean read GetComponentsStored;
    property IsAnonymousStored: Boolean read GetAnonymousStored;
  published
    property openapi: System.String read FOpenapi write FOpenapi;
    property info: Info read GetInfo write FInfo;
    property externalDocs: ExternalDocumentation read GetExternalDocs write FExternalDocs stored GetExternalDocsStored;
    property servers: TArray<Server> read FServers write FServers stored GetServersStored;
    property security: TArray<SecurityRequirement> read FSecurity write FSecurity stored GetSecurityStored;
    property tags: TArray<Tag> read FTags write FTags stored GetTagsStored;
    property paths: Paths read GetPaths write FPaths;
    property components: Components read GetComponents write FComponents stored GetComponentsStored;
    [PatternProperty('^x-')]
    property Anonymous: TDynamicProperty<any> read GetAnonymous write FAnonymous stored GetAnonymousStored;
  end;

implementation

uses System.SysUtils;

{ Reference }

destructor Reference.Destroy;
begin
  FString.Free;

  inherited;
end;

function Reference.GetString: TDynamicProperty<System.String>;
begin
  if not Assigned(FString) then
    FString := TDynamicProperty<System.String>.Create;

  Result := FString;
end;

function Reference.GetStringStored: Boolean;
begin
  Result := Assigned(FString);
end;

{ Info }

destructor Info.Destroy;
begin
  FContact.Free;

  FLicense.Free;

  FAnonymous.Free;

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

function Info.GetContact: Blue.Print.Open.API.Schema.v30.Contact;
begin
  if not Assigned(FContact) then
    FContact := Blue.Print.Open.API.Schema.v30.Contact.Create;

  Result := FContact;
end;

function Info.GetContactStored: Boolean;
begin
  Result := Assigned(FContact);
end;

function Info.GetLicense: Blue.Print.Open.API.Schema.v30.License;
begin
  if not Assigned(FLicense) then
    FLicense := Blue.Print.Open.API.Schema.v30.License.Create;

  Result := FLicense;
end;

function Info.GetLicenseStored: Boolean;
begin
  Result := Assigned(FLicense);
end;

function Info.GetAnonymous: TDynamicProperty<any>;
begin
  if not Assigned(FAnonymous) then
    FAnonymous := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FAnonymous;
end;

function Info.GetAnonymousStored: Boolean;
begin
  Result := Assigned(FAnonymous);
end;

{ Contact }

destructor Contact.Destroy;
begin
  FAnonymous.Free;

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

function Contact.GetAnonymous: TDynamicProperty<any>;
begin
  if not Assigned(FAnonymous) then
    FAnonymous := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FAnonymous;
end;

function Contact.GetAnonymousStored: Boolean;
begin
  Result := Assigned(FAnonymous);
end;

{ License }

destructor License.Destroy;
begin
  FAnonymous.Free;

  inherited;
end;

function License.GetUrlStored: Boolean;
begin
  Result := not FUrl.IsEmpty;
end;

function License.GetAnonymous: TDynamicProperty<any>;
begin
  if not Assigned(FAnonymous) then
    FAnonymous := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FAnonymous;
end;

function License.GetAnonymousStored: Boolean;
begin
  Result := Assigned(FAnonymous);
end;

{ Server }

destructor Server.Destroy;
begin
  FVariables.Free;

  FAnonymous.Free;

  inherited;
end;

function Server.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function Server.GetVariables: Blue.Print.Open.API.Schema.v30.Server.TVariables;
begin
  if not Assigned(FVariables) then
    FVariables := Blue.Print.Open.API.Schema.v30.Server.TVariables.Create;

  Result := FVariables;
end;

function Server.GetVariablesStored: Boolean;
begin
  Result := Assigned(FVariables);
end;

function Server.GetAnonymous: TDynamicProperty<any>;
begin
  if not Assigned(FAnonymous) then
    FAnonymous := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FAnonymous;
end;

function Server.GetAnonymousStored: Boolean;
begin
  Result := Assigned(FAnonymous);
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
    FServerVariable := TDynamicProperty<Blue.Print.Open.API.Schema.v30.ServerVariable>.Create;

  Result := FServerVariable;
end;

function Server.TVariables.GetServerVariableStored: Boolean;
begin
  Result := Assigned(FServerVariable);
end;

{ ServerVariable }

destructor ServerVariable.Destroy;
begin
  FAnonymous.Free;

  inherited;
end;

function ServerVariable.GetEnumStored: Boolean;
begin
  Result := Assigned(FEnum);
end;

function ServerVariable.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function ServerVariable.GetAnonymous: TDynamicProperty<any>;
begin
  if not Assigned(FAnonymous) then
    FAnonymous := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FAnonymous;
end;

function ServerVariable.GetAnonymousStored: Boolean;
begin
  Result := Assigned(FAnonymous);
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

  FAnonymous.Free;

  inherited;
end;

function Components.GetSchemas: Blue.Print.Open.API.Schema.v30.Components.TSchemas;
begin
  if not Assigned(FSchemas) then
    FSchemas := Blue.Print.Open.API.Schema.v30.Components.TSchemas.Create;

  Result := FSchemas;
end;

function Components.GetSchemasStored: Boolean;
begin
  Result := Assigned(FSchemas);
end;

function Components.GetResponses: Blue.Print.Open.API.Schema.v30.Components.TResponses;
begin
  if not Assigned(FResponses) then
    FResponses := Blue.Print.Open.API.Schema.v30.Components.TResponses.Create;

  Result := FResponses;
end;

function Components.GetResponsesStored: Boolean;
begin
  Result := Assigned(FResponses);
end;

function Components.GetParameters: Blue.Print.Open.API.Schema.v30.Components.TParameters;
begin
  if not Assigned(FParameters) then
    FParameters := Blue.Print.Open.API.Schema.v30.Components.TParameters.Create;

  Result := FParameters;
end;

function Components.GetParametersStored: Boolean;
begin
  Result := Assigned(FParameters);
end;

function Components.GetExamples: Blue.Print.Open.API.Schema.v30.Components.TExamples;
begin
  if not Assigned(FExamples) then
    FExamples := Blue.Print.Open.API.Schema.v30.Components.TExamples.Create;

  Result := FExamples;
end;

function Components.GetExamplesStored: Boolean;
begin
  Result := Assigned(FExamples);
end;

function Components.GetRequestBodies: Blue.Print.Open.API.Schema.v30.Components.TRequestBodies;
begin
  if not Assigned(FRequestBodies) then
    FRequestBodies := Blue.Print.Open.API.Schema.v30.Components.TRequestBodies.Create;

  Result := FRequestBodies;
end;

function Components.GetRequestBodiesStored: Boolean;
begin
  Result := Assigned(FRequestBodies);
end;

function Components.GetHeaders: Blue.Print.Open.API.Schema.v30.Components.THeaders;
begin
  if not Assigned(FHeaders) then
    FHeaders := Blue.Print.Open.API.Schema.v30.Components.THeaders.Create;

  Result := FHeaders;
end;

function Components.GetHeadersStored: Boolean;
begin
  Result := Assigned(FHeaders);
end;

function Components.GetSecuritySchemes: Blue.Print.Open.API.Schema.v30.Components.TSecuritySchemes;
begin
  if not Assigned(FSecuritySchemes) then
    FSecuritySchemes := Blue.Print.Open.API.Schema.v30.Components.TSecuritySchemes.Create;

  Result := FSecuritySchemes;
end;

function Components.GetSecuritySchemesStored: Boolean;
begin
  Result := Assigned(FSecuritySchemes);
end;

function Components.GetLinks: Blue.Print.Open.API.Schema.v30.Components.TLinks;
begin
  if not Assigned(FLinks) then
    FLinks := Blue.Print.Open.API.Schema.v30.Components.TLinks.Create;

  Result := FLinks;
end;

function Components.GetLinksStored: Boolean;
begin
  Result := Assigned(FLinks);
end;

function Components.GetCallbacks: Blue.Print.Open.API.Schema.v30.Components.TCallbacks;
begin
  if not Assigned(FCallbacks) then
    FCallbacks := Blue.Print.Open.API.Schema.v30.Components.TCallbacks.Create;

  Result := FCallbacks;
end;

function Components.GetCallbacksStored: Boolean;
begin
  Result := Assigned(FCallbacks);
end;

function Components.GetAnonymous: TDynamicProperty<any>;
begin
  if not Assigned(FAnonymous) then
    FAnonymous := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FAnonymous;
end;

function Components.GetAnonymousStored: Boolean;
begin
  Result := Assigned(FAnonymous);
end;

{ Components.TSchemas }

destructor Components.TSchemas.Destroy;
begin
  FAnonymous.Free;

  inherited;
end;

function Components.TSchemas.GetAnonymous: TDynamicProperty<Components.TSchemas.TAnonymous>;
begin
  if not Assigned(FAnonymous) then
    FAnonymous := TDynamicProperty<Blue.Print.Open.API.Schema.v30.Components.TSchemas.TAnonymous>.Create;

  Result := FAnonymous;
end;

function Components.TSchemas.GetAnonymousStored: Boolean;
begin
  Result := Assigned(FAnonymous);
end;

{ Components.TSchemas.TAnonymous }

destructor Components.TSchemas.TAnonymous.Destroy;
begin
  FSchema.Free;

  FReference.Free;

  inherited;
end;

function Components.TSchemas.TAnonymous.GetSchema: Blue.Print.Open.API.Schema.v30.Schema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v30.Schema.Create;

  Result := FSchema;
end;

function Components.TSchemas.TAnonymous.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function Components.TSchemas.TAnonymous.GetReference: Blue.Print.Open.API.Schema.v30.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.Reference.Create;

  Result := FReference;
end;

function Components.TSchemas.TAnonymous.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

{ Components.TResponses }

destructor Components.TResponses.Destroy;
begin
  FAnonymous.Free;

  inherited;
end;

function Components.TResponses.GetAnonymous: TDynamicProperty<Components.TResponses.TAnonymous>;
begin
  if not Assigned(FAnonymous) then
    FAnonymous := TDynamicProperty<Blue.Print.Open.API.Schema.v30.Components.TResponses.TAnonymous>.Create;

  Result := FAnonymous;
end;

function Components.TResponses.GetAnonymousStored: Boolean;
begin
  Result := Assigned(FAnonymous);
end;

{ Components.TResponses.TAnonymous }

destructor Components.TResponses.TAnonymous.Destroy;
begin
  FReference.Free;

  FResponse.Free;

  inherited;
end;

function Components.TResponses.TAnonymous.GetReference: Blue.Print.Open.API.Schema.v30.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.Reference.Create;

  Result := FReference;
end;

function Components.TResponses.TAnonymous.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

function Components.TResponses.TAnonymous.GetResponse: Blue.Print.Open.API.Schema.v30.Response;
begin
  if not Assigned(FResponse) then
    FResponse := Blue.Print.Open.API.Schema.v30.Response.Create;

  Result := FResponse;
end;

function Components.TResponses.TAnonymous.GetResponseStored: Boolean;
begin
  Result := Assigned(FResponse);
end;

{ Components.TParameters }

destructor Components.TParameters.Destroy;
begin
  FAnonymous.Free;

  inherited;
end;

function Components.TParameters.GetAnonymous: TDynamicProperty<Components.TParameters.TAnonymous>;
begin
  if not Assigned(FAnonymous) then
    FAnonymous := TDynamicProperty<Blue.Print.Open.API.Schema.v30.Components.TParameters.TAnonymous>.Create;

  Result := FAnonymous;
end;

function Components.TParameters.GetAnonymousStored: Boolean;
begin
  Result := Assigned(FAnonymous);
end;

{ Components.TParameters.TAnonymous }

destructor Components.TParameters.TAnonymous.Destroy;
begin
  FReference.Free;

  FParameter.Free;

  inherited;
end;

function Components.TParameters.TAnonymous.GetReference: Blue.Print.Open.API.Schema.v30.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.Reference.Create;

  Result := FReference;
end;

function Components.TParameters.TAnonymous.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

function Components.TParameters.TAnonymous.GetParameter: Blue.Print.Open.API.Schema.v30.Parameter;
begin
  if not Assigned(FParameter) then
    FParameter := Blue.Print.Open.API.Schema.v30.Parameter.Create;

  Result := FParameter;
end;

function Components.TParameters.TAnonymous.GetParameterStored: Boolean;
begin
  Result := Assigned(FParameter);
end;

{ Components.TExamples }

destructor Components.TExamples.Destroy;
begin
  FAnonymous.Free;

  inherited;
end;

function Components.TExamples.GetAnonymous: TDynamicProperty<Components.TExamples.TAnonymous>;
begin
  if not Assigned(FAnonymous) then
    FAnonymous := TDynamicProperty<Blue.Print.Open.API.Schema.v30.Components.TExamples.TAnonymous>.Create;

  Result := FAnonymous;
end;

function Components.TExamples.GetAnonymousStored: Boolean;
begin
  Result := Assigned(FAnonymous);
end;

{ Components.TExamples.TAnonymous }

destructor Components.TExamples.TAnonymous.Destroy;
begin
  FReference.Free;

  FExample.Free;

  inherited;
end;

function Components.TExamples.TAnonymous.GetReference: Blue.Print.Open.API.Schema.v30.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.Reference.Create;

  Result := FReference;
end;

function Components.TExamples.TAnonymous.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

function Components.TExamples.TAnonymous.GetExample: Blue.Print.Open.API.Schema.v30.Example;
begin
  if not Assigned(FExample) then
    FExample := Blue.Print.Open.API.Schema.v30.Example.Create;

  Result := FExample;
end;

function Components.TExamples.TAnonymous.GetExampleStored: Boolean;
begin
  Result := Assigned(FExample);
end;

{ Components.TRequestBodies }

destructor Components.TRequestBodies.Destroy;
begin
  FAnonymous.Free;

  inherited;
end;

function Components.TRequestBodies.GetAnonymous: TDynamicProperty<Components.TRequestBodies.TAnonymous>;
begin
  if not Assigned(FAnonymous) then
    FAnonymous := TDynamicProperty<Blue.Print.Open.API.Schema.v30.Components.TRequestBodies.TAnonymous>.Create;

  Result := FAnonymous;
end;

function Components.TRequestBodies.GetAnonymousStored: Boolean;
begin
  Result := Assigned(FAnonymous);
end;

{ Components.TRequestBodies.TAnonymous }

destructor Components.TRequestBodies.TAnonymous.Destroy;
begin
  FReference.Free;

  FRequestBody.Free;

  inherited;
end;

function Components.TRequestBodies.TAnonymous.GetReference: Blue.Print.Open.API.Schema.v30.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.Reference.Create;

  Result := FReference;
end;

function Components.TRequestBodies.TAnonymous.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

function Components.TRequestBodies.TAnonymous.GetRequestBody: Blue.Print.Open.API.Schema.v30.RequestBody;
begin
  if not Assigned(FRequestBody) then
    FRequestBody := Blue.Print.Open.API.Schema.v30.RequestBody.Create;

  Result := FRequestBody;
end;

function Components.TRequestBodies.TAnonymous.GetRequestBodyStored: Boolean;
begin
  Result := Assigned(FRequestBody);
end;

{ Components.THeaders }

destructor Components.THeaders.Destroy;
begin
  FAnonymous.Free;

  inherited;
end;

function Components.THeaders.GetAnonymous: TDynamicProperty<Components.THeaders.TAnonymous>;
begin
  if not Assigned(FAnonymous) then
    FAnonymous := TDynamicProperty<Blue.Print.Open.API.Schema.v30.Components.THeaders.TAnonymous>.Create;

  Result := FAnonymous;
end;

function Components.THeaders.GetAnonymousStored: Boolean;
begin
  Result := Assigned(FAnonymous);
end;

{ Components.THeaders.TAnonymous }

destructor Components.THeaders.TAnonymous.Destroy;
begin
  FReference.Free;

  FHeader.Free;

  inherited;
end;

function Components.THeaders.TAnonymous.GetReference: Blue.Print.Open.API.Schema.v30.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.Reference.Create;

  Result := FReference;
end;

function Components.THeaders.TAnonymous.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

function Components.THeaders.TAnonymous.GetHeader: Blue.Print.Open.API.Schema.v30.Header;
begin
  if not Assigned(FHeader) then
    FHeader := Blue.Print.Open.API.Schema.v30.Header.Create;

  Result := FHeader;
end;

function Components.THeaders.TAnonymous.GetHeaderStored: Boolean;
begin
  Result := Assigned(FHeader);
end;

{ Components.TSecuritySchemes }

destructor Components.TSecuritySchemes.Destroy;
begin
  FAnonymous.Free;

  inherited;
end;

function Components.TSecuritySchemes.GetAnonymous: TDynamicProperty<Components.TSecuritySchemes.TAnonymous>;
begin
  if not Assigned(FAnonymous) then
    FAnonymous := TDynamicProperty<Blue.Print.Open.API.Schema.v30.Components.TSecuritySchemes.TAnonymous>.Create;

  Result := FAnonymous;
end;

function Components.TSecuritySchemes.GetAnonymousStored: Boolean;
begin
  Result := Assigned(FAnonymous);
end;

{ Components.TSecuritySchemes.TAnonymous }

destructor Components.TSecuritySchemes.TAnonymous.Destroy;
begin
  FReference.Free;

  FSecurityScheme.Free;

  inherited;
end;

function Components.TSecuritySchemes.TAnonymous.GetReference: Blue.Print.Open.API.Schema.v30.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.Reference.Create;

  Result := FReference;
end;

function Components.TSecuritySchemes.TAnonymous.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

function Components.TSecuritySchemes.TAnonymous.GetSecurityScheme: Blue.Print.Open.API.Schema.v30.SecurityScheme;
begin
  if not Assigned(FSecurityScheme) then
    FSecurityScheme := Blue.Print.Open.API.Schema.v30.SecurityScheme.Create;

  Result := FSecurityScheme;
end;

function Components.TSecuritySchemes.TAnonymous.GetSecuritySchemeStored: Boolean;
begin
  Result := Assigned(FSecurityScheme);
end;

{ Components.TLinks }

destructor Components.TLinks.Destroy;
begin
  FAnonymous.Free;

  inherited;
end;

function Components.TLinks.GetAnonymous: TDynamicProperty<Components.TLinks.TAnonymous>;
begin
  if not Assigned(FAnonymous) then
    FAnonymous := TDynamicProperty<Blue.Print.Open.API.Schema.v30.Components.TLinks.TAnonymous>.Create;

  Result := FAnonymous;
end;

function Components.TLinks.GetAnonymousStored: Boolean;
begin
  Result := Assigned(FAnonymous);
end;

{ Components.TLinks.TAnonymous }

destructor Components.TLinks.TAnonymous.Destroy;
begin
  FReference.Free;

  FLink.Free;

  inherited;
end;

function Components.TLinks.TAnonymous.GetReference: Blue.Print.Open.API.Schema.v30.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.Reference.Create;

  Result := FReference;
end;

function Components.TLinks.TAnonymous.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

function Components.TLinks.TAnonymous.GetLink: Blue.Print.Open.API.Schema.v30.Link;
begin
  if not Assigned(FLink) then
    FLink := Blue.Print.Open.API.Schema.v30.Link.Create;

  Result := FLink;
end;

function Components.TLinks.TAnonymous.GetLinkStored: Boolean;
begin
  Result := Assigned(FLink);
end;

{ Components.TCallbacks }

destructor Components.TCallbacks.Destroy;
begin
  FAnonymous.Free;

  inherited;
end;

function Components.TCallbacks.GetAnonymous: TDynamicProperty<Components.TCallbacks.TAnonymous>;
begin
  if not Assigned(FAnonymous) then
    FAnonymous := TDynamicProperty<Blue.Print.Open.API.Schema.v30.Components.TCallbacks.TAnonymous>.Create;

  Result := FAnonymous;
end;

function Components.TCallbacks.GetAnonymousStored: Boolean;
begin
  Result := Assigned(FAnonymous);
end;

{ Components.TCallbacks.TAnonymous }

destructor Components.TCallbacks.TAnonymous.Destroy;
begin
  FReference.Free;

  FCallback.Free;

  inherited;
end;

function Components.TCallbacks.TAnonymous.GetReference: Blue.Print.Open.API.Schema.v30.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.Reference.Create;

  Result := FReference;
end;

function Components.TCallbacks.TAnonymous.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

function Components.TCallbacks.TAnonymous.GetCallback: Blue.Print.Open.API.Schema.v30.Callback;
begin
  if not Assigned(FCallback) then
    FCallback := Blue.Print.Open.API.Schema.v30.Callback.Create;

  Result := FCallback;
end;

function Components.TCallbacks.TAnonymous.GetCallbackStored: Boolean;
begin
  Result := Assigned(FCallback);
end;

{ Schema }

destructor Schema.Destroy;
begin
  FNot.Free;

  for var AObject in FAllOf do
    AObject.Free;

  for var AObject in FOneOf do
    AObject.Free;

  for var AObject in FAnyOf do
    AObject.Free;

  FItems.Free;

  FProperties.Free;

  FAdditionalProperties.Free;

  FDiscriminator.Free;

  FExternalDocs.Free;

  FXml.Free;

  FAnonymous.Free;

  inherited;
end;

function Schema.GetTitleStored: Boolean;
begin
  Result := not FTitle.IsEmpty;
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

function Schema.GetMinLengthStored: Boolean;
begin
  Result := FMinLength <> 0;
end;

function Schema.GetPatternStored: Boolean;
begin
  Result := not FPattern.IsEmpty;
end;

function Schema.GetMaxItemsStored: Boolean;
begin
  Result := FMaxItems <> 0;
end;

function Schema.GetMinItemsStored: Boolean;
begin
  Result := FMinItems <> 0;
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

function Schema.GetMinPropertiesStored: Boolean;
begin
  Result := FMinProperties <> 0;
end;

function Schema.GetRequiredStored: Boolean;
begin
  Result := Assigned(FRequired);
end;

function Schema.GetEnumStored: Boolean;
begin
  Result := Assigned(FEnum);
end;

procedure Schema.SetType(const Value: Schema.TType);
begin
  FType := Value;
  FTypeIsStored := True;
end;

function Schema.GetNot: Blue.Print.Open.API.Schema.v30.Schema.TNot;
begin
  if not Assigned(FNot) then
    FNot := Blue.Print.Open.API.Schema.v30.Schema.TNot.Create;

  Result := FNot;
end;

function Schema.GetNotStored: Boolean;
begin
  Result := Assigned(FNot);
end;

function Schema.AddAllOf: Blue.Print.Open.API.Schema.v30.Schema.TAllOfArrayItem;
begin
  Result := Blue.Print.Open.API.Schema.v30.Schema.TAllOfArrayItem.Create;

  FAllOf := FAllOf + [Result];
end;

function Schema.GetAllOfStored: Boolean;
begin
  Result := Assigned(FAllOf);
end;

function Schema.AddOneOf: Blue.Print.Open.API.Schema.v30.Schema.TOneOfArrayItem;
begin
  Result := Blue.Print.Open.API.Schema.v30.Schema.TOneOfArrayItem.Create;

  FOneOf := FOneOf + [Result];
end;

function Schema.GetOneOfStored: Boolean;
begin
  Result := Assigned(FOneOf);
end;

function Schema.AddAnyOf: Blue.Print.Open.API.Schema.v30.Schema.TAnyOfArrayItem;
begin
  Result := Blue.Print.Open.API.Schema.v30.Schema.TAnyOfArrayItem.Create;

  FAnyOf := FAnyOf + [Result];
end;

function Schema.GetAnyOfStored: Boolean;
begin
  Result := Assigned(FAnyOf);
end;

function Schema.GetItems: Blue.Print.Open.API.Schema.v30.Schema.TItems;
begin
  if not Assigned(FItems) then
    FItems := Blue.Print.Open.API.Schema.v30.Schema.TItems.Create;

  Result := FItems;
end;

function Schema.GetItemsStored: Boolean;
begin
  Result := Assigned(FItems);
end;

function Schema.GetProperties: Blue.Print.Open.API.Schema.v30.Schema.TProperties;
begin
  if not Assigned(FProperties) then
    FProperties := Blue.Print.Open.API.Schema.v30.Schema.TProperties.Create;

  Result := FProperties;
end;

function Schema.GetPropertiesStored: Boolean;
begin
  Result := Assigned(FProperties);
end;

function Schema.GetAdditionalProperties: Blue.Print.Open.API.Schema.v30.Schema.TAdditionalProperties;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := Blue.Print.Open.API.Schema.v30.Schema.TAdditionalProperties.Create;

  Result := FAdditionalProperties;
end;

function Schema.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

function Schema.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function Schema.GetFormatStored: Boolean;
begin
  Result := not FFormat.IsEmpty;
end;

procedure Schema.SetDefault(const Value: any);
begin
  FDefault := Value;
  FDefaultIsStored := True;
end;

procedure Schema.SetNullable(const Value: System.Boolean);
begin
  FNullable := Value;
  FNullableIsStored := True;
end;

function Schema.GetDiscriminator: Blue.Print.Open.API.Schema.v30.Discriminator;
begin
  if not Assigned(FDiscriminator) then
    FDiscriminator := Blue.Print.Open.API.Schema.v30.Discriminator.Create;

  Result := FDiscriminator;
end;

function Schema.GetDiscriminatorStored: Boolean;
begin
  Result := Assigned(FDiscriminator);
end;

procedure Schema.SetReadOnly(const Value: System.Boolean);
begin
  FReadOnly := Value;
  FReadOnlyIsStored := True;
end;

procedure Schema.SetWriteOnly(const Value: System.Boolean);
begin
  FWriteOnly := Value;
  FWriteOnlyIsStored := True;
end;

procedure Schema.SetExample(const Value: any);
begin
  FExample := Value;
  FExampleIsStored := True;
end;

function Schema.GetExternalDocs: Blue.Print.Open.API.Schema.v30.ExternalDocumentation;
begin
  if not Assigned(FExternalDocs) then
    FExternalDocs := Blue.Print.Open.API.Schema.v30.ExternalDocumentation.Create;

  Result := FExternalDocs;
end;

function Schema.GetExternalDocsStored: Boolean;
begin
  Result := Assigned(FExternalDocs);
end;

procedure Schema.SetDeprecated(const Value: System.Boolean);
begin
  FDeprecated := Value;
  FDeprecatedIsStored := True;
end;

function Schema.GetXml: Blue.Print.Open.API.Schema.v30.XML;
begin
  if not Assigned(FXml) then
    FXml := Blue.Print.Open.API.Schema.v30.XML.Create;

  Result := FXml;
end;

function Schema.GetXmlStored: Boolean;
begin
  Result := Assigned(FXml);
end;

function Schema.GetAnonymous: TDynamicProperty<any>;
begin
  if not Assigned(FAnonymous) then
    FAnonymous := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FAnonymous;
end;

function Schema.GetAnonymousStored: Boolean;
begin
  Result := Assigned(FAnonymous);
end;

{ Schema.TNot }

destructor Schema.TNot.Destroy;
begin
  FSchema.Free;

  FReference.Free;

  inherited;
end;

function Schema.TNot.GetSchema: Blue.Print.Open.API.Schema.v30.Schema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v30.Schema.Create;

  Result := FSchema;
end;

function Schema.TNot.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function Schema.TNot.GetReference: Blue.Print.Open.API.Schema.v30.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.Reference.Create;

  Result := FReference;
end;

function Schema.TNot.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

{ Schema.TAllOfArrayItem }

destructor Schema.TAllOfArrayItem.Destroy;
begin
  FSchema.Free;

  FReference.Free;

  inherited;
end;

function Schema.TAllOfArrayItem.GetSchema: Blue.Print.Open.API.Schema.v30.Schema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v30.Schema.Create;

  Result := FSchema;
end;

function Schema.TAllOfArrayItem.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function Schema.TAllOfArrayItem.GetReference: Blue.Print.Open.API.Schema.v30.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.Reference.Create;

  Result := FReference;
end;

function Schema.TAllOfArrayItem.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

{ Schema.TOneOfArrayItem }

destructor Schema.TOneOfArrayItem.Destroy;
begin
  FSchema.Free;

  FReference.Free;

  inherited;
end;

function Schema.TOneOfArrayItem.GetSchema: Blue.Print.Open.API.Schema.v30.Schema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v30.Schema.Create;

  Result := FSchema;
end;

function Schema.TOneOfArrayItem.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function Schema.TOneOfArrayItem.GetReference: Blue.Print.Open.API.Schema.v30.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.Reference.Create;

  Result := FReference;
end;

function Schema.TOneOfArrayItem.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

{ Schema.TAnyOfArrayItem }

destructor Schema.TAnyOfArrayItem.Destroy;
begin
  FSchema.Free;

  FReference.Free;

  inherited;
end;

function Schema.TAnyOfArrayItem.GetSchema: Blue.Print.Open.API.Schema.v30.Schema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v30.Schema.Create;

  Result := FSchema;
end;

function Schema.TAnyOfArrayItem.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function Schema.TAnyOfArrayItem.GetReference: Blue.Print.Open.API.Schema.v30.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.Reference.Create;

  Result := FReference;
end;

function Schema.TAnyOfArrayItem.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

{ Schema.TItems }

destructor Schema.TItems.Destroy;
begin
  FSchema.Free;

  FReference.Free;

  inherited;
end;

function Schema.TItems.GetSchema: Blue.Print.Open.API.Schema.v30.Schema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v30.Schema.Create;

  Result := FSchema;
end;

function Schema.TItems.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function Schema.TItems.GetReference: Blue.Print.Open.API.Schema.v30.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.Reference.Create;

  Result := FReference;
end;

function Schema.TItems.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

{ Schema.TProperties }

destructor Schema.TProperties.Destroy;
begin
  FSchema.Free;

  FReference.Free;

  inherited;
end;

function Schema.TProperties.GetSchema: Blue.Print.Open.API.Schema.v30.Schema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v30.Schema.Create;

  Result := FSchema;
end;

function Schema.TProperties.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function Schema.TProperties.GetReference: Blue.Print.Open.API.Schema.v30.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.Reference.Create;

  Result := FReference;
end;

function Schema.TProperties.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

{ Schema.TAdditionalProperties }

destructor Schema.TAdditionalProperties.Destroy;
begin
  FSchema.Free;

  FReference.Free;

  inherited;
end;

function Schema.TAdditionalProperties.GetSchema: Blue.Print.Open.API.Schema.v30.Schema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v30.Schema.Create;

  Result := FSchema;
end;

function Schema.TAdditionalProperties.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function Schema.TAdditionalProperties.GetReference: Blue.Print.Open.API.Schema.v30.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.Reference.Create;

  Result := FReference;
end;

function Schema.TAdditionalProperties.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

procedure Schema.TAdditionalProperties.SetBoolean(const Value: System.Boolean);
begin
  FBoolean := Value;
  FBooleanIsStored := True;
end;

{ Discriminator }

destructor Discriminator.Destroy;
begin
  FMapping.Free;

  inherited;
end;

function Discriminator.GetMapping: Blue.Print.Open.API.Schema.v30.Discriminator.TMapping;
begin
  if not Assigned(FMapping) then
    FMapping := Blue.Print.Open.API.Schema.v30.Discriminator.TMapping.Create;

  Result := FMapping;
end;

function Discriminator.GetMappingStored: Boolean;
begin
  Result := Assigned(FMapping);
end;

{ Discriminator.TMapping }

destructor Discriminator.TMapping.Destroy;
begin
  FString.Free;

  inherited;
end;

function Discriminator.TMapping.GetString: TDynamicProperty<System.String>;
begin
  if not Assigned(FString) then
    FString := TDynamicProperty<System.String>.Create;

  Result := FString;
end;

function Discriminator.TMapping.GetStringStored: Boolean;
begin
  Result := Assigned(FString);
end;

{ XML }

destructor XML.Destroy;
begin
  FAnonymous.Free;

  inherited;
end;

function XML.GetNameStored: Boolean;
begin
  Result := not FName.IsEmpty;
end;

function XML.GetNamespaceStored: Boolean;
begin
  Result := not FNamespace.IsEmpty;
end;

function XML.GetPrefixStored: Boolean;
begin
  Result := not FPrefix.IsEmpty;
end;

procedure XML.SetAttribute(const Value: System.Boolean);
begin
  FAttribute := Value;
  FAttributeIsStored := True;
end;

procedure XML.SetWrapped(const Value: System.Boolean);
begin
  FWrapped := Value;
  FWrappedIsStored := True;
end;

function XML.GetAnonymous: TDynamicProperty<any>;
begin
  if not Assigned(FAnonymous) then
    FAnonymous := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FAnonymous;
end;

function XML.GetAnonymousStored: Boolean;
begin
  Result := Assigned(FAnonymous);
end;

{ Response }

destructor Response.Destroy;
begin
  FHeaders.Free;

  FContent.Free;

  FLinks.Free;

  FAnonymous.Free;

  inherited;
end;

function Response.GetHeaders: Blue.Print.Open.API.Schema.v30.Response.THeaders;
begin
  if not Assigned(FHeaders) then
    FHeaders := Blue.Print.Open.API.Schema.v30.Response.THeaders.Create;

  Result := FHeaders;
end;

function Response.GetHeadersStored: Boolean;
begin
  Result := Assigned(FHeaders);
end;

function Response.GetContent: Blue.Print.Open.API.Schema.v30.Response.TContent;
begin
  if not Assigned(FContent) then
    FContent := Blue.Print.Open.API.Schema.v30.Response.TContent.Create;

  Result := FContent;
end;

function Response.GetContentStored: Boolean;
begin
  Result := Assigned(FContent);
end;

function Response.GetLinks: Blue.Print.Open.API.Schema.v30.Response.TLinks;
begin
  if not Assigned(FLinks) then
    FLinks := Blue.Print.Open.API.Schema.v30.Response.TLinks.Create;

  Result := FLinks;
end;

function Response.GetLinksStored: Boolean;
begin
  Result := Assigned(FLinks);
end;

function Response.GetAnonymous: TDynamicProperty<any>;
begin
  if not Assigned(FAnonymous) then
    FAnonymous := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FAnonymous;
end;

function Response.GetAnonymousStored: Boolean;
begin
  Result := Assigned(FAnonymous);
end;

{ Response.THeaders }

destructor Response.THeaders.Destroy;
begin
  FHeader.Free;

  FReference.Free;

  inherited;
end;

function Response.THeaders.GetHeader: Blue.Print.Open.API.Schema.v30.Header;
begin
  if not Assigned(FHeader) then
    FHeader := Blue.Print.Open.API.Schema.v30.Header.Create;

  Result := FHeader;
end;

function Response.THeaders.GetHeaderStored: Boolean;
begin
  Result := Assigned(FHeader);
end;

function Response.THeaders.GetReference: Blue.Print.Open.API.Schema.v30.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.Reference.Create;

  Result := FReference;
end;

function Response.THeaders.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

{ Response.TContent }

destructor Response.TContent.Destroy;
begin
  FMediaType.Free;

  inherited;
end;

function Response.TContent.GetMediaType: TDynamicProperty<MediaType>;
begin
  if not Assigned(FMediaType) then
    FMediaType := TDynamicProperty<Blue.Print.Open.API.Schema.v30.MediaType>.Create;

  Result := FMediaType;
end;

function Response.TContent.GetMediaTypeStored: Boolean;
begin
  Result := Assigned(FMediaType);
end;

{ Response.TLinks }

destructor Response.TLinks.Destroy;
begin
  FLink.Free;

  FReference.Free;

  inherited;
end;

function Response.TLinks.GetLink: Blue.Print.Open.API.Schema.v30.Link;
begin
  if not Assigned(FLink) then
    FLink := Blue.Print.Open.API.Schema.v30.Link.Create;

  Result := FLink;
end;

function Response.TLinks.GetLinkStored: Boolean;
begin
  Result := Assigned(FLink);
end;

function Response.TLinks.GetReference: Blue.Print.Open.API.Schema.v30.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.Reference.Create;

  Result := FReference;
end;

function Response.TLinks.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

{ MediaType }

destructor MediaType.Destroy;
begin
  FSchema.Free;

  FExamples.Free;

  FEncoding.Free;

  FAnonymous.Free;

  inherited;
end;

function MediaType.GetSchema: Blue.Print.Open.API.Schema.v30.MediaType.TSchema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v30.MediaType.TSchema.Create;

  Result := FSchema;
end;

function MediaType.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

procedure MediaType.SetExample(const Value: any);
begin
  FExample := Value;
  FExampleIsStored := True;
end;

function MediaType.GetExamples: Blue.Print.Open.API.Schema.v30.MediaType.TExamples;
begin
  if not Assigned(FExamples) then
    FExamples := Blue.Print.Open.API.Schema.v30.MediaType.TExamples.Create;

  Result := FExamples;
end;

function MediaType.GetExamplesStored: Boolean;
begin
  Result := Assigned(FExamples);
end;

function MediaType.GetEncoding: Blue.Print.Open.API.Schema.v30.MediaType.TEncoding;
begin
  if not Assigned(FEncoding) then
    FEncoding := Blue.Print.Open.API.Schema.v30.MediaType.TEncoding.Create;

  Result := FEncoding;
end;

function MediaType.GetEncodingStored: Boolean;
begin
  Result := Assigned(FEncoding);
end;

procedure MediaType.SetExampleXORExamples(const Value: ExampleXORExamples);
begin
  FExampleXORExamples := Value;
  FExampleXORExamplesIsStored := True;
end;

function MediaType.GetAnonymous: TDynamicProperty<any>;
begin
  if not Assigned(FAnonymous) then
    FAnonymous := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FAnonymous;
end;

function MediaType.GetAnonymousStored: Boolean;
begin
  Result := Assigned(FAnonymous);
end;

{ MediaType.TSchema }

destructor MediaType.TSchema.Destroy;
begin
  FSchema.Free;

  FReference.Free;

  inherited;
end;

function MediaType.TSchema.GetSchema: Blue.Print.Open.API.Schema.v30.Schema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v30.Schema.Create;

  Result := FSchema;
end;

function MediaType.TSchema.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function MediaType.TSchema.GetReference: Blue.Print.Open.API.Schema.v30.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.Reference.Create;

  Result := FReference;
end;

function MediaType.TSchema.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

{ MediaType.TExamples }

destructor MediaType.TExamples.Destroy;
begin
  FExample.Free;

  FReference.Free;

  inherited;
end;

function MediaType.TExamples.GetExample: Blue.Print.Open.API.Schema.v30.Example;
begin
  if not Assigned(FExample) then
    FExample := Blue.Print.Open.API.Schema.v30.Example.Create;

  Result := FExample;
end;

function MediaType.TExamples.GetExampleStored: Boolean;
begin
  Result := Assigned(FExample);
end;

function MediaType.TExamples.GetReference: Blue.Print.Open.API.Schema.v30.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.Reference.Create;

  Result := FReference;
end;

function MediaType.TExamples.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
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
    FEncoding := TDynamicProperty<Blue.Print.Open.API.Schema.v30.Encoding>.Create;

  Result := FEncoding;
end;

function MediaType.TEncoding.GetEncodingStored: Boolean;
begin
  Result := Assigned(FEncoding);
end;

{ Example }

destructor Example.Destroy;
begin
  FAnonymous.Free;

  inherited;
end;

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

function Example.GetAnonymous: TDynamicProperty<any>;
begin
  if not Assigned(FAnonymous) then
    FAnonymous := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FAnonymous;
end;

function Example.GetAnonymousStored: Boolean;
begin
  Result := Assigned(FAnonymous);
end;

{ Header }

destructor Header.Destroy;
begin
  FSchema.Free;

  FContent.Free;

  FExamples.Free;

  FSchemaXORContent.Free;

  FAnonymous.Free;

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

procedure Header.SetAllowEmptyValue(const Value: System.Boolean);
begin
  FAllowEmptyValue := Value;
  FAllowEmptyValueIsStored := True;
end;

procedure Header.SetStyle(const Value: Header.TStyle);
begin
  FStyle := Value;
  FStyleIsStored := True;
end;

procedure Header.SetExplode(const Value: System.Boolean);
begin
  FExplode := Value;
  FExplodeIsStored := True;
end;

procedure Header.SetAllowReserved(const Value: System.Boolean);
begin
  FAllowReserved := Value;
  FAllowReservedIsStored := True;
end;

function Header.GetSchema: Blue.Print.Open.API.Schema.v30.Header.TSchema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v30.Header.TSchema.Create;

  Result := FSchema;
end;

function Header.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function Header.GetContent: Blue.Print.Open.API.Schema.v30.Header.TContent;
begin
  if not Assigned(FContent) then
    FContent := Blue.Print.Open.API.Schema.v30.Header.TContent.Create;

  Result := FContent;
end;

function Header.GetContentStored: Boolean;
begin
  Result := Assigned(FContent);
end;

procedure Header.SetExample(const Value: any);
begin
  FExample := Value;
  FExampleIsStored := True;
end;

function Header.GetExamples: Blue.Print.Open.API.Schema.v30.Header.TExamples;
begin
  if not Assigned(FExamples) then
    FExamples := Blue.Print.Open.API.Schema.v30.Header.TExamples.Create;

  Result := FExamples;
end;

function Header.GetExamplesStored: Boolean;
begin
  Result := Assigned(FExamples);
end;

procedure Header.SetExampleXORExamples(const Value: ExampleXORExamples);
begin
  FExampleXORExamples := Value;
  FExampleXORExamplesIsStored := True;
end;

function Header.GetSchemaXORContent: Blue.Print.Open.API.Schema.v30.SchemaXORContent;
begin
  if not Assigned(FSchemaXORContent) then
    FSchemaXORContent := Blue.Print.Open.API.Schema.v30.SchemaXORContent.Create;

  Result := FSchemaXORContent;
end;

function Header.GetSchemaXORContentStored: Boolean;
begin
  Result := Assigned(FSchemaXORContent);
end;

function Header.GetAnonymous: TDynamicProperty<any>;
begin
  if not Assigned(FAnonymous) then
    FAnonymous := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FAnonymous;
end;

function Header.GetAnonymousStored: Boolean;
begin
  Result := Assigned(FAnonymous);
end;

{ Header.TSchema }

destructor Header.TSchema.Destroy;
begin
  FSchema.Free;

  FReference.Free;

  inherited;
end;

function Header.TSchema.GetSchema: Blue.Print.Open.API.Schema.v30.Schema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v30.Schema.Create;

  Result := FSchema;
end;

function Header.TSchema.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function Header.TSchema.GetReference: Blue.Print.Open.API.Schema.v30.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.Reference.Create;

  Result := FReference;
end;

function Header.TSchema.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

{ Header.TContent }

destructor Header.TContent.Destroy;
begin
  FMediaType.Free;

  inherited;
end;

function Header.TContent.GetMediaType: TDynamicProperty<MediaType>;
begin
  if not Assigned(FMediaType) then
    FMediaType := TDynamicProperty<Blue.Print.Open.API.Schema.v30.MediaType>.Create;

  Result := FMediaType;
end;

function Header.TContent.GetMediaTypeStored: Boolean;
begin
  Result := Assigned(FMediaType);
end;

{ Header.TExamples }

destructor Header.TExamples.Destroy;
begin
  FExample.Free;

  FReference.Free;

  inherited;
end;

function Header.TExamples.GetExample: Blue.Print.Open.API.Schema.v30.Example;
begin
  if not Assigned(FExample) then
    FExample := Blue.Print.Open.API.Schema.v30.Example.Create;

  Result := FExample;
end;

function Header.TExamples.GetExampleStored: Boolean;
begin
  Result := Assigned(FExample);
end;

function Header.TExamples.GetReference: Blue.Print.Open.API.Schema.v30.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.Reference.Create;

  Result := FReference;
end;

function Header.TExamples.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

{ Paths }

destructor Paths.Destroy;
begin
  FPathItem.Free;

  FAnonymous.Free;

  inherited;
end;

function Paths.GetPathItem: TDynamicProperty<PathItem>;
begin
  if not Assigned(FPathItem) then
    FPathItem := TDynamicProperty<Blue.Print.Open.API.Schema.v30.PathItem>.Create;

  Result := FPathItem;
end;

function Paths.GetPathItemStored: Boolean;
begin
  Result := Assigned(FPathItem);
end;

function Paths.GetAnonymous: TDynamicProperty<any>;
begin
  if not Assigned(FAnonymous) then
    FAnonymous := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FAnonymous;
end;

function Paths.GetAnonymousStored: Boolean;
begin
  Result := Assigned(FAnonymous);
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

  FTrace.Free;

  for var AObject in FServers do
    AObject.Free;

  for var AObject in FParameters do
    AObject.Free;

  FAnonymous.Free;

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

function PathItem.GetGet: Blue.Print.Open.API.Schema.v30.Operation;
begin
  if not Assigned(FGet) then
    FGet := Blue.Print.Open.API.Schema.v30.Operation.Create;

  Result := FGet;
end;

function PathItem.GetGetStored: Boolean;
begin
  Result := Assigned(FGet);
end;

function PathItem.GetPut: Blue.Print.Open.API.Schema.v30.Operation;
begin
  if not Assigned(FPut) then
    FPut := Blue.Print.Open.API.Schema.v30.Operation.Create;

  Result := FPut;
end;

function PathItem.GetPutStored: Boolean;
begin
  Result := Assigned(FPut);
end;

function PathItem.GetPost: Blue.Print.Open.API.Schema.v30.Operation;
begin
  if not Assigned(FPost) then
    FPost := Blue.Print.Open.API.Schema.v30.Operation.Create;

  Result := FPost;
end;

function PathItem.GetPostStored: Boolean;
begin
  Result := Assigned(FPost);
end;

function PathItem.GetDelete: Blue.Print.Open.API.Schema.v30.Operation;
begin
  if not Assigned(FDelete) then
    FDelete := Blue.Print.Open.API.Schema.v30.Operation.Create;

  Result := FDelete;
end;

function PathItem.GetDeleteStored: Boolean;
begin
  Result := Assigned(FDelete);
end;

function PathItem.GetOptions: Blue.Print.Open.API.Schema.v30.Operation;
begin
  if not Assigned(FOptions) then
    FOptions := Blue.Print.Open.API.Schema.v30.Operation.Create;

  Result := FOptions;
end;

function PathItem.GetOptionsStored: Boolean;
begin
  Result := Assigned(FOptions);
end;

function PathItem.GetHead: Blue.Print.Open.API.Schema.v30.Operation;
begin
  if not Assigned(FHead) then
    FHead := Blue.Print.Open.API.Schema.v30.Operation.Create;

  Result := FHead;
end;

function PathItem.GetHeadStored: Boolean;
begin
  Result := Assigned(FHead);
end;

function PathItem.GetPatch: Blue.Print.Open.API.Schema.v30.Operation;
begin
  if not Assigned(FPatch) then
    FPatch := Blue.Print.Open.API.Schema.v30.Operation.Create;

  Result := FPatch;
end;

function PathItem.GetPatchStored: Boolean;
begin
  Result := Assigned(FPatch);
end;

function PathItem.GetTrace: Blue.Print.Open.API.Schema.v30.Operation;
begin
  if not Assigned(FTrace) then
    FTrace := Blue.Print.Open.API.Schema.v30.Operation.Create;

  Result := FTrace;
end;

function PathItem.GetTraceStored: Boolean;
begin
  Result := Assigned(FTrace);
end;

function PathItem.AddServers: Blue.Print.Open.API.Schema.v30.Server;
begin
  Result := Blue.Print.Open.API.Schema.v30.Server.Create;

  FServers := FServers + [Result];
end;

function PathItem.GetServersStored: Boolean;
begin
  Result := Assigned(FServers);
end;

function PathItem.AddParameters: Blue.Print.Open.API.Schema.v30.PathItem.TParametersArrayItem;
begin
  Result := Blue.Print.Open.API.Schema.v30.PathItem.TParametersArrayItem.Create;

  FParameters := FParameters + [Result];
end;

function PathItem.GetParametersStored: Boolean;
begin
  Result := Assigned(FParameters);
end;

function PathItem.GetAnonymous: TDynamicProperty<any>;
begin
  if not Assigned(FAnonymous) then
    FAnonymous := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FAnonymous;
end;

function PathItem.GetAnonymousStored: Boolean;
begin
  Result := Assigned(FAnonymous);
end;

{ PathItem.TParametersArrayItem }

destructor PathItem.TParametersArrayItem.Destroy;
begin
  FParameter.Free;

  FReference.Free;

  inherited;
end;

function PathItem.TParametersArrayItem.GetParameter: Blue.Print.Open.API.Schema.v30.Parameter;
begin
  if not Assigned(FParameter) then
    FParameter := Blue.Print.Open.API.Schema.v30.Parameter.Create;

  Result := FParameter;
end;

function PathItem.TParametersArrayItem.GetParameterStored: Boolean;
begin
  Result := Assigned(FParameter);
end;

function PathItem.TParametersArrayItem.GetReference: Blue.Print.Open.API.Schema.v30.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.Reference.Create;

  Result := FReference;
end;

function PathItem.TParametersArrayItem.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

{ Operation }

destructor Operation.Destroy;
begin
  FExternalDocs.Free;

  for var AObject in FParameters do
    AObject.Free;

  FRequestBody.Free;

  FResponses.Free;

  FCallbacks.Free;

  for var AObject in FSecurity do
    AObject.Free;

  for var AObject in FServers do
    AObject.Free;

  FAnonymous.Free;

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

function Operation.GetExternalDocs: Blue.Print.Open.API.Schema.v30.ExternalDocumentation;
begin
  if not Assigned(FExternalDocs) then
    FExternalDocs := Blue.Print.Open.API.Schema.v30.ExternalDocumentation.Create;

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

function Operation.AddParameters: Blue.Print.Open.API.Schema.v30.Operation.TParametersArrayItem;
begin
  Result := Blue.Print.Open.API.Schema.v30.Operation.TParametersArrayItem.Create;

  FParameters := FParameters + [Result];
end;

function Operation.GetParametersStored: Boolean;
begin
  Result := Assigned(FParameters);
end;

function Operation.GetRequestBody: Blue.Print.Open.API.Schema.v30.Operation.TRequestBody;
begin
  if not Assigned(FRequestBody) then
    FRequestBody := Blue.Print.Open.API.Schema.v30.Operation.TRequestBody.Create;

  Result := FRequestBody;
end;

function Operation.GetRequestBodyStored: Boolean;
begin
  Result := Assigned(FRequestBody);
end;

function Operation.GetResponses: Blue.Print.Open.API.Schema.v30.Responses;
begin
  if not Assigned(FResponses) then
    FResponses := Blue.Print.Open.API.Schema.v30.Responses.Create;

  Result := FResponses;
end;

function Operation.GetCallbacks: Blue.Print.Open.API.Schema.v30.Operation.TCallbacks;
begin
  if not Assigned(FCallbacks) then
    FCallbacks := Blue.Print.Open.API.Schema.v30.Operation.TCallbacks.Create;

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

function Operation.AddSecurity: Blue.Print.Open.API.Schema.v30.SecurityRequirement;
begin
  Result := Blue.Print.Open.API.Schema.v30.SecurityRequirement.Create;

  FSecurity := FSecurity + [Result];
end;

function Operation.GetSecurityStored: Boolean;
begin
  Result := Assigned(FSecurity);
end;

function Operation.AddServers: Blue.Print.Open.API.Schema.v30.Server;
begin
  Result := Blue.Print.Open.API.Schema.v30.Server.Create;

  FServers := FServers + [Result];
end;

function Operation.GetServersStored: Boolean;
begin
  Result := Assigned(FServers);
end;

function Operation.GetAnonymous: TDynamicProperty<any>;
begin
  if not Assigned(FAnonymous) then
    FAnonymous := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FAnonymous;
end;

function Operation.GetAnonymousStored: Boolean;
begin
  Result := Assigned(FAnonymous);
end;

{ Operation.TParametersArrayItem }

destructor Operation.TParametersArrayItem.Destroy;
begin
  FParameter.Free;

  FReference.Free;

  inherited;
end;

function Operation.TParametersArrayItem.GetParameter: Blue.Print.Open.API.Schema.v30.Parameter;
begin
  if not Assigned(FParameter) then
    FParameter := Blue.Print.Open.API.Schema.v30.Parameter.Create;

  Result := FParameter;
end;

function Operation.TParametersArrayItem.GetParameterStored: Boolean;
begin
  Result := Assigned(FParameter);
end;

function Operation.TParametersArrayItem.GetReference: Blue.Print.Open.API.Schema.v30.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.Reference.Create;

  Result := FReference;
end;

function Operation.TParametersArrayItem.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

{ Operation.TRequestBody }

destructor Operation.TRequestBody.Destroy;
begin
  FRequestBody.Free;

  FReference.Free;

  inherited;
end;

function Operation.TRequestBody.GetRequestBody: Blue.Print.Open.API.Schema.v30.RequestBody;
begin
  if not Assigned(FRequestBody) then
    FRequestBody := Blue.Print.Open.API.Schema.v30.RequestBody.Create;

  Result := FRequestBody;
end;

function Operation.TRequestBody.GetRequestBodyStored: Boolean;
begin
  Result := Assigned(FRequestBody);
end;

function Operation.TRequestBody.GetReference: Blue.Print.Open.API.Schema.v30.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.Reference.Create;

  Result := FReference;
end;

function Operation.TRequestBody.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

{ Operation.TCallbacks }

destructor Operation.TCallbacks.Destroy;
begin
  FCallback.Free;

  FReference.Free;

  inherited;
end;

function Operation.TCallbacks.GetCallback: Blue.Print.Open.API.Schema.v30.Callback;
begin
  if not Assigned(FCallback) then
    FCallback := Blue.Print.Open.API.Schema.v30.Callback.Create;

  Result := FCallback;
end;

function Operation.TCallbacks.GetCallbackStored: Boolean;
begin
  Result := Assigned(FCallback);
end;

function Operation.TCallbacks.GetReference: Blue.Print.Open.API.Schema.v30.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.Reference.Create;

  Result := FReference;
end;

function Operation.TCallbacks.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

{ Responses }

destructor Responses.Destroy;
begin
  FDefault.Free;

  FAnonymous.Free;

  FAnonymous2.Free;

  inherited;
end;

function Responses.GetDefault: Blue.Print.Open.API.Schema.v30.Responses.TDefault;
begin
  if not Assigned(FDefault) then
    FDefault := Blue.Print.Open.API.Schema.v30.Responses.TDefault.Create;

  Result := FDefault;
end;

function Responses.GetDefaultStored: Boolean;
begin
  Result := Assigned(FDefault);
end;

function Responses.GetAnonymous: TDynamicProperty<Responses.TAnonymous>;
begin
  if not Assigned(FAnonymous) then
    FAnonymous := TDynamicProperty<Blue.Print.Open.API.Schema.v30.Responses.TAnonymous>.Create;

  Result := FAnonymous;
end;

function Responses.GetAnonymousStored: Boolean;
begin
  Result := Assigned(FAnonymous);
end;

function Responses.GetAnonymous2: TDynamicProperty<any>;
begin
  if not Assigned(FAnonymous2) then
    FAnonymous2 := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FAnonymous2;
end;

function Responses.GetAnonymous2Stored: Boolean;
begin
  Result := Assigned(FAnonymous2);
end;

{ Responses.TDefault }

destructor Responses.TDefault.Destroy;
begin
  FResponse.Free;

  FReference.Free;

  inherited;
end;

function Responses.TDefault.GetResponse: Blue.Print.Open.API.Schema.v30.Response;
begin
  if not Assigned(FResponse) then
    FResponse := Blue.Print.Open.API.Schema.v30.Response.Create;

  Result := FResponse;
end;

function Responses.TDefault.GetResponseStored: Boolean;
begin
  Result := Assigned(FResponse);
end;

function Responses.TDefault.GetReference: Blue.Print.Open.API.Schema.v30.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.Reference.Create;

  Result := FReference;
end;

function Responses.TDefault.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

{ Responses.TAnonymous }

destructor Responses.TAnonymous.Destroy;
begin
  FResponse.Free;

  FReference.Free;

  inherited;
end;

function Responses.TAnonymous.GetResponse: Blue.Print.Open.API.Schema.v30.Response;
begin
  if not Assigned(FResponse) then
    FResponse := Blue.Print.Open.API.Schema.v30.Response.Create;

  Result := FResponse;
end;

function Responses.TAnonymous.GetResponseStored: Boolean;
begin
  Result := Assigned(FResponse);
end;

function Responses.TAnonymous.GetReference: Blue.Print.Open.API.Schema.v30.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.Reference.Create;

  Result := FReference;
end;

function Responses.TAnonymous.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
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

{ Tag }

destructor Tag.Destroy;
begin
  FExternalDocs.Free;

  FAnonymous.Free;

  inherited;
end;

function Tag.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function Tag.GetExternalDocs: Blue.Print.Open.API.Schema.v30.ExternalDocumentation;
begin
  if not Assigned(FExternalDocs) then
    FExternalDocs := Blue.Print.Open.API.Schema.v30.ExternalDocumentation.Create;

  Result := FExternalDocs;
end;

function Tag.GetExternalDocsStored: Boolean;
begin
  Result := Assigned(FExternalDocs);
end;

function Tag.GetAnonymous: TDynamicProperty<any>;
begin
  if not Assigned(FAnonymous) then
    FAnonymous := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FAnonymous;
end;

function Tag.GetAnonymousStored: Boolean;
begin
  Result := Assigned(FAnonymous);
end;

{ ExternalDocumentation }

destructor ExternalDocumentation.Destroy;
begin
  FAnonymous.Free;

  inherited;
end;

function ExternalDocumentation.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function ExternalDocumentation.GetAnonymous: TDynamicProperty<any>;
begin
  if not Assigned(FAnonymous) then
    FAnonymous := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FAnonymous;
end;

function ExternalDocumentation.GetAnonymousStored: Boolean;
begin
  Result := Assigned(FAnonymous);
end;

{ SchemaXORContent }

destructor SchemaXORContent.Destroy;
begin
  FAnonymous2.Free;

  inherited;
end;

procedure SchemaXORContent.SetAnonymous(const Value: any);
begin
  FAnonymous := Value;
  FAnonymousIsStored := True;
end;

function SchemaXORContent.GetAnonymous2: Blue.Print.Open.API.Schema.v30.SchemaXORContent.TAnonymous2;
begin
  if not Assigned(FAnonymous2) then
    FAnonymous2 := Blue.Print.Open.API.Schema.v30.SchemaXORContent.TAnonymous2.Create;

  Result := FAnonymous2;
end;

function SchemaXORContent.GetAnonymous2Stored: Boolean;
begin
  Result := Assigned(FAnonymous2);
end;

{ SchemaXORContent.TAnonymous2 }

procedure SchemaXORContent.TAnonymous2.SetAnonymous(const Value: any);
begin
  FAnonymous := Value;
  FAnonymousIsStored := True;
end;

procedure SchemaXORContent.TAnonymous2.SetAnonymous2(const Value: any);
begin
  FAnonymous2 := Value;
  FAnonymous2IsStored := True;
end;

procedure SchemaXORContent.TAnonymous2.SetAnonymous3(const Value: any);
begin
  FAnonymous3 := Value;
  FAnonymous3IsStored := True;
end;

procedure SchemaXORContent.TAnonymous2.SetAnonymous4(const Value: any);
begin
  FAnonymous4 := Value;
  FAnonymous4IsStored := True;
end;

procedure SchemaXORContent.TAnonymous2.SetAnonymous5(const Value: any);
begin
  FAnonymous5 := Value;
  FAnonymous5IsStored := True;
end;

{ Parameter }

destructor Parameter.Destroy;
begin
  FSchema.Free;

  FContent.Free;

  FExamples.Free;

  FSchemaXORContent.Free;

  FAnonymous.Free;

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

procedure Parameter.SetAllowEmptyValue(const Value: System.Boolean);
begin
  FAllowEmptyValue := Value;
  FAllowEmptyValueIsStored := True;
end;

function Parameter.GetStyleStored: Boolean;
begin
  Result := not FStyle.IsEmpty;
end;

procedure Parameter.SetExplode(const Value: System.Boolean);
begin
  FExplode := Value;
  FExplodeIsStored := True;
end;

procedure Parameter.SetAllowReserved(const Value: System.Boolean);
begin
  FAllowReserved := Value;
  FAllowReservedIsStored := True;
end;

function Parameter.GetSchema: Blue.Print.Open.API.Schema.v30.Parameter.TSchema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v30.Parameter.TSchema.Create;

  Result := FSchema;
end;

function Parameter.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function Parameter.GetContent: Blue.Print.Open.API.Schema.v30.Parameter.TContent;
begin
  if not Assigned(FContent) then
    FContent := Blue.Print.Open.API.Schema.v30.Parameter.TContent.Create;

  Result := FContent;
end;

function Parameter.GetContentStored: Boolean;
begin
  Result := Assigned(FContent);
end;

procedure Parameter.SetExample(const Value: any);
begin
  FExample := Value;
  FExampleIsStored := True;
end;

function Parameter.GetExamples: Blue.Print.Open.API.Schema.v30.Parameter.TExamples;
begin
  if not Assigned(FExamples) then
    FExamples := Blue.Print.Open.API.Schema.v30.Parameter.TExamples.Create;

  Result := FExamples;
end;

function Parameter.GetExamplesStored: Boolean;
begin
  Result := Assigned(FExamples);
end;

procedure Parameter.SetExampleXORExamples(const Value: ExampleXORExamples);
begin
  FExampleXORExamples := Value;
  FExampleXORExamplesIsStored := True;
end;

function Parameter.GetSchemaXORContent: Blue.Print.Open.API.Schema.v30.SchemaXORContent;
begin
  if not Assigned(FSchemaXORContent) then
    FSchemaXORContent := Blue.Print.Open.API.Schema.v30.SchemaXORContent.Create;

  Result := FSchemaXORContent;
end;

function Parameter.GetSchemaXORContentStored: Boolean;
begin
  Result := Assigned(FSchemaXORContent);
end;

procedure Parameter.SetPathParameter(const Value: PathParameter);
begin
  FPathParameter := Value;
  FPathParameterIsStored := True;
end;

procedure Parameter.SetQueryParameter(const Value: QueryParameter);
begin
  FQueryParameter := Value;
  FQueryParameterIsStored := True;
end;

procedure Parameter.SetHeaderParameter(const Value: HeaderParameter);
begin
  FHeaderParameter := Value;
  FHeaderParameterIsStored := True;
end;

procedure Parameter.SetCookieParameter(const Value: CookieParameter);
begin
  FCookieParameter := Value;
  FCookieParameterIsStored := True;
end;

function Parameter.GetAnonymous: TDynamicProperty<any>;
begin
  if not Assigned(FAnonymous) then
    FAnonymous := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FAnonymous;
end;

function Parameter.GetAnonymousStored: Boolean;
begin
  Result := Assigned(FAnonymous);
end;

{ Parameter.TSchema }

destructor Parameter.TSchema.Destroy;
begin
  FSchema.Free;

  FReference.Free;

  inherited;
end;

function Parameter.TSchema.GetSchema: Blue.Print.Open.API.Schema.v30.Schema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v30.Schema.Create;

  Result := FSchema;
end;

function Parameter.TSchema.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function Parameter.TSchema.GetReference: Blue.Print.Open.API.Schema.v30.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.Reference.Create;

  Result := FReference;
end;

function Parameter.TSchema.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

{ Parameter.TContent }

destructor Parameter.TContent.Destroy;
begin
  FMediaType.Free;

  inherited;
end;

function Parameter.TContent.GetMediaType: TDynamicProperty<MediaType>;
begin
  if not Assigned(FMediaType) then
    FMediaType := TDynamicProperty<Blue.Print.Open.API.Schema.v30.MediaType>.Create;

  Result := FMediaType;
end;

function Parameter.TContent.GetMediaTypeStored: Boolean;
begin
  Result := Assigned(FMediaType);
end;

{ Parameter.TExamples }

destructor Parameter.TExamples.Destroy;
begin
  FExample.Free;

  FReference.Free;

  inherited;
end;

function Parameter.TExamples.GetExample: Blue.Print.Open.API.Schema.v30.Example;
begin
  if not Assigned(FExample) then
    FExample := Blue.Print.Open.API.Schema.v30.Example.Create;

  Result := FExample;
end;

function Parameter.TExamples.GetExampleStored: Boolean;
begin
  Result := Assigned(FExample);
end;

function Parameter.TExamples.GetReference: Blue.Print.Open.API.Schema.v30.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.Reference.Create;

  Result := FReference;
end;

function Parameter.TExamples.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

{ RequestBody }

destructor RequestBody.Destroy;
begin
  FContent.Free;

  FAnonymous.Free;

  inherited;
end;

function RequestBody.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function RequestBody.GetContent: Blue.Print.Open.API.Schema.v30.RequestBody.TContent;
begin
  if not Assigned(FContent) then
    FContent := Blue.Print.Open.API.Schema.v30.RequestBody.TContent.Create;

  Result := FContent;
end;

procedure RequestBody.SetRequired(const Value: System.Boolean);
begin
  FRequired := Value;
  FRequiredIsStored := True;
end;

function RequestBody.GetAnonymous: TDynamicProperty<any>;
begin
  if not Assigned(FAnonymous) then
    FAnonymous := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FAnonymous;
end;

function RequestBody.GetAnonymousStored: Boolean;
begin
  Result := Assigned(FAnonymous);
end;

{ RequestBody.TContent }

destructor RequestBody.TContent.Destroy;
begin
  FMediaType.Free;

  inherited;
end;

function RequestBody.TContent.GetMediaType: TDynamicProperty<MediaType>;
begin
  if not Assigned(FMediaType) then
    FMediaType := TDynamicProperty<Blue.Print.Open.API.Schema.v30.MediaType>.Create;

  Result := FMediaType;
end;

function RequestBody.TContent.GetMediaTypeStored: Boolean;
begin
  Result := Assigned(FMediaType);
end;

{ SecurityScheme }

destructor SecurityScheme.Destroy;
begin
  FAPIKeySecurityScheme.Free;

  FHTTPSecurityScheme.Free;

  FOAuth2SecurityScheme.Free;

  FOpenIdConnectSecurityScheme.Free;

  inherited;
end;

function SecurityScheme.GetAPIKeySecurityScheme: Blue.Print.Open.API.Schema.v30.APIKeySecurityScheme;
begin
  if not Assigned(FAPIKeySecurityScheme) then
    FAPIKeySecurityScheme := Blue.Print.Open.API.Schema.v30.APIKeySecurityScheme.Create;

  Result := FAPIKeySecurityScheme;
end;

function SecurityScheme.GetAPIKeySecuritySchemeStored: Boolean;
begin
  Result := Assigned(FAPIKeySecurityScheme);
end;

function SecurityScheme.GetHTTPSecurityScheme: Blue.Print.Open.API.Schema.v30.HTTPSecurityScheme;
begin
  if not Assigned(FHTTPSecurityScheme) then
    FHTTPSecurityScheme := Blue.Print.Open.API.Schema.v30.HTTPSecurityScheme.Create;

  Result := FHTTPSecurityScheme;
end;

function SecurityScheme.GetHTTPSecuritySchemeStored: Boolean;
begin
  Result := Assigned(FHTTPSecurityScheme);
end;

function SecurityScheme.GetOAuth2SecurityScheme: Blue.Print.Open.API.Schema.v30.OAuth2SecurityScheme;
begin
  if not Assigned(FOAuth2SecurityScheme) then
    FOAuth2SecurityScheme := Blue.Print.Open.API.Schema.v30.OAuth2SecurityScheme.Create;

  Result := FOAuth2SecurityScheme;
end;

function SecurityScheme.GetOAuth2SecuritySchemeStored: Boolean;
begin
  Result := Assigned(FOAuth2SecurityScheme);
end;

function SecurityScheme.GetOpenIdConnectSecurityScheme: Blue.Print.Open.API.Schema.v30.OpenIdConnectSecurityScheme;
begin
  if not Assigned(FOpenIdConnectSecurityScheme) then
    FOpenIdConnectSecurityScheme := Blue.Print.Open.API.Schema.v30.OpenIdConnectSecurityScheme.Create;

  Result := FOpenIdConnectSecurityScheme;
end;

function SecurityScheme.GetOpenIdConnectSecuritySchemeStored: Boolean;
begin
  Result := Assigned(FOpenIdConnectSecurityScheme);
end;

{ APIKeySecurityScheme }

destructor APIKeySecurityScheme.Destroy;
begin
  FAnonymous.Free;

  inherited;
end;

function APIKeySecurityScheme.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function APIKeySecurityScheme.GetAnonymous: TDynamicProperty<any>;
begin
  if not Assigned(FAnonymous) then
    FAnonymous := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FAnonymous;
end;

function APIKeySecurityScheme.GetAnonymousStored: Boolean;
begin
  Result := Assigned(FAnonymous);
end;

{ HTTPSecurityScheme }

destructor HTTPSecurityScheme.Destroy;
begin
  FAnonymous3.Free;

  inherited;
end;

function HTTPSecurityScheme.GetBearerFormatStored: Boolean;
begin
  Result := not FBearerFormat.IsEmpty;
end;

function HTTPSecurityScheme.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

procedure HTTPSecurityScheme.SetAnonymous(const Value: any);
begin
  FAnonymous := Value;
  FAnonymousIsStored := True;
end;

procedure HTTPSecurityScheme.SetAnonymous2(const Value: any);
begin
  FAnonymous2 := Value;
  FAnonymous2IsStored := True;
end;

function HTTPSecurityScheme.GetAnonymous3: TDynamicProperty<any>;
begin
  if not Assigned(FAnonymous3) then
    FAnonymous3 := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FAnonymous3;
end;

function HTTPSecurityScheme.GetAnonymous3Stored: Boolean;
begin
  Result := Assigned(FAnonymous3);
end;

{ OAuth2SecurityScheme }

destructor OAuth2SecurityScheme.Destroy;
begin
  FFlows.Free;

  FAnonymous.Free;

  inherited;
end;

function OAuth2SecurityScheme.GetFlows: Blue.Print.Open.API.Schema.v30.OAuthFlows;
begin
  if not Assigned(FFlows) then
    FFlows := Blue.Print.Open.API.Schema.v30.OAuthFlows.Create;

  Result := FFlows;
end;

function OAuth2SecurityScheme.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function OAuth2SecurityScheme.GetAnonymous: TDynamicProperty<any>;
begin
  if not Assigned(FAnonymous) then
    FAnonymous := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FAnonymous;
end;

function OAuth2SecurityScheme.GetAnonymousStored: Boolean;
begin
  Result := Assigned(FAnonymous);
end;

{ OpenIdConnectSecurityScheme }

destructor OpenIdConnectSecurityScheme.Destroy;
begin
  FAnonymous.Free;

  inherited;
end;

function OpenIdConnectSecurityScheme.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function OpenIdConnectSecurityScheme.GetAnonymous: TDynamicProperty<any>;
begin
  if not Assigned(FAnonymous) then
    FAnonymous := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FAnonymous;
end;

function OpenIdConnectSecurityScheme.GetAnonymousStored: Boolean;
begin
  Result := Assigned(FAnonymous);
end;

{ OAuthFlows }

destructor OAuthFlows.Destroy;
begin
  FImplicit.Free;

  FPassword.Free;

  FClientCredentials.Free;

  FAuthorizationCode.Free;

  FAnonymous.Free;

  inherited;
end;

function OAuthFlows.GetImplicit: Blue.Print.Open.API.Schema.v30.ImplicitOAuthFlow;
begin
  if not Assigned(FImplicit) then
    FImplicit := Blue.Print.Open.API.Schema.v30.ImplicitOAuthFlow.Create;

  Result := FImplicit;
end;

function OAuthFlows.GetImplicitStored: Boolean;
begin
  Result := Assigned(FImplicit);
end;

function OAuthFlows.GetPassword: Blue.Print.Open.API.Schema.v30.PasswordOAuthFlow;
begin
  if not Assigned(FPassword) then
    FPassword := Blue.Print.Open.API.Schema.v30.PasswordOAuthFlow.Create;

  Result := FPassword;
end;

function OAuthFlows.GetPasswordStored: Boolean;
begin
  Result := Assigned(FPassword);
end;

function OAuthFlows.GetClientCredentials: Blue.Print.Open.API.Schema.v30.ClientCredentialsFlow;
begin
  if not Assigned(FClientCredentials) then
    FClientCredentials := Blue.Print.Open.API.Schema.v30.ClientCredentialsFlow.Create;

  Result := FClientCredentials;
end;

function OAuthFlows.GetClientCredentialsStored: Boolean;
begin
  Result := Assigned(FClientCredentials);
end;

function OAuthFlows.GetAuthorizationCode: Blue.Print.Open.API.Schema.v30.AuthorizationCodeOAuthFlow;
begin
  if not Assigned(FAuthorizationCode) then
    FAuthorizationCode := Blue.Print.Open.API.Schema.v30.AuthorizationCodeOAuthFlow.Create;

  Result := FAuthorizationCode;
end;

function OAuthFlows.GetAuthorizationCodeStored: Boolean;
begin
  Result := Assigned(FAuthorizationCode);
end;

function OAuthFlows.GetAnonymous: TDynamicProperty<any>;
begin
  if not Assigned(FAnonymous) then
    FAnonymous := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FAnonymous;
end;

function OAuthFlows.GetAnonymousStored: Boolean;
begin
  Result := Assigned(FAnonymous);
end;

{ ImplicitOAuthFlow }

destructor ImplicitOAuthFlow.Destroy;
begin
  FScopes.Free;

  FAnonymous.Free;

  inherited;
end;

function ImplicitOAuthFlow.GetRefreshUrlStored: Boolean;
begin
  Result := not FRefreshUrl.IsEmpty;
end;

function ImplicitOAuthFlow.GetScopes: Blue.Print.Open.API.Schema.v30.ImplicitOAuthFlow.TScopes;
begin
  if not Assigned(FScopes) then
    FScopes := Blue.Print.Open.API.Schema.v30.ImplicitOAuthFlow.TScopes.Create;

  Result := FScopes;
end;

function ImplicitOAuthFlow.GetAnonymous: TDynamicProperty<any>;
begin
  if not Assigned(FAnonymous) then
    FAnonymous := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FAnonymous;
end;

function ImplicitOAuthFlow.GetAnonymousStored: Boolean;
begin
  Result := Assigned(FAnonymous);
end;

{ ImplicitOAuthFlow.TScopes }

destructor ImplicitOAuthFlow.TScopes.Destroy;
begin
  FString.Free;

  inherited;
end;

function ImplicitOAuthFlow.TScopes.GetString: TDynamicProperty<System.String>;
begin
  if not Assigned(FString) then
    FString := TDynamicProperty<System.String>.Create;

  Result := FString;
end;

function ImplicitOAuthFlow.TScopes.GetStringStored: Boolean;
begin
  Result := Assigned(FString);
end;

{ PasswordOAuthFlow }

destructor PasswordOAuthFlow.Destroy;
begin
  FScopes.Free;

  FAnonymous.Free;

  inherited;
end;

function PasswordOAuthFlow.GetRefreshUrlStored: Boolean;
begin
  Result := not FRefreshUrl.IsEmpty;
end;

function PasswordOAuthFlow.GetScopes: Blue.Print.Open.API.Schema.v30.PasswordOAuthFlow.TScopes;
begin
  if not Assigned(FScopes) then
    FScopes := Blue.Print.Open.API.Schema.v30.PasswordOAuthFlow.TScopes.Create;

  Result := FScopes;
end;

function PasswordOAuthFlow.GetAnonymous: TDynamicProperty<any>;
begin
  if not Assigned(FAnonymous) then
    FAnonymous := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FAnonymous;
end;

function PasswordOAuthFlow.GetAnonymousStored: Boolean;
begin
  Result := Assigned(FAnonymous);
end;

{ PasswordOAuthFlow.TScopes }

destructor PasswordOAuthFlow.TScopes.Destroy;
begin
  FString.Free;

  inherited;
end;

function PasswordOAuthFlow.TScopes.GetString: TDynamicProperty<System.String>;
begin
  if not Assigned(FString) then
    FString := TDynamicProperty<System.String>.Create;

  Result := FString;
end;

function PasswordOAuthFlow.TScopes.GetStringStored: Boolean;
begin
  Result := Assigned(FString);
end;

{ ClientCredentialsFlow }

destructor ClientCredentialsFlow.Destroy;
begin
  FScopes.Free;

  FAnonymous.Free;

  inherited;
end;

function ClientCredentialsFlow.GetRefreshUrlStored: Boolean;
begin
  Result := not FRefreshUrl.IsEmpty;
end;

function ClientCredentialsFlow.GetScopes: Blue.Print.Open.API.Schema.v30.ClientCredentialsFlow.TScopes;
begin
  if not Assigned(FScopes) then
    FScopes := Blue.Print.Open.API.Schema.v30.ClientCredentialsFlow.TScopes.Create;

  Result := FScopes;
end;

function ClientCredentialsFlow.GetAnonymous: TDynamicProperty<any>;
begin
  if not Assigned(FAnonymous) then
    FAnonymous := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FAnonymous;
end;

function ClientCredentialsFlow.GetAnonymousStored: Boolean;
begin
  Result := Assigned(FAnonymous);
end;

{ ClientCredentialsFlow.TScopes }

destructor ClientCredentialsFlow.TScopes.Destroy;
begin
  FString.Free;

  inherited;
end;

function ClientCredentialsFlow.TScopes.GetString: TDynamicProperty<System.String>;
begin
  if not Assigned(FString) then
    FString := TDynamicProperty<System.String>.Create;

  Result := FString;
end;

function ClientCredentialsFlow.TScopes.GetStringStored: Boolean;
begin
  Result := Assigned(FString);
end;

{ AuthorizationCodeOAuthFlow }

destructor AuthorizationCodeOAuthFlow.Destroy;
begin
  FScopes.Free;

  FAnonymous.Free;

  inherited;
end;

function AuthorizationCodeOAuthFlow.GetRefreshUrlStored: Boolean;
begin
  Result := not FRefreshUrl.IsEmpty;
end;

function AuthorizationCodeOAuthFlow.GetScopes: Blue.Print.Open.API.Schema.v30.AuthorizationCodeOAuthFlow.TScopes;
begin
  if not Assigned(FScopes) then
    FScopes := Blue.Print.Open.API.Schema.v30.AuthorizationCodeOAuthFlow.TScopes.Create;

  Result := FScopes;
end;

function AuthorizationCodeOAuthFlow.GetAnonymous: TDynamicProperty<any>;
begin
  if not Assigned(FAnonymous) then
    FAnonymous := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FAnonymous;
end;

function AuthorizationCodeOAuthFlow.GetAnonymousStored: Boolean;
begin
  Result := Assigned(FAnonymous);
end;

{ AuthorizationCodeOAuthFlow.TScopes }

destructor AuthorizationCodeOAuthFlow.TScopes.Destroy;
begin
  FString.Free;

  inherited;
end;

function AuthorizationCodeOAuthFlow.TScopes.GetString: TDynamicProperty<System.String>;
begin
  if not Assigned(FString) then
    FString := TDynamicProperty<System.String>.Create;

  Result := FString;
end;

function AuthorizationCodeOAuthFlow.TScopes.GetStringStored: Boolean;
begin
  Result := Assigned(FString);
end;

{ Link }

destructor Link.Destroy;
begin
  FParameters.Free;

  FServer.Free;

  FAnonymous.Free;

  inherited;
end;

function Link.GetOperationIdStored: Boolean;
begin
  Result := not FOperationId.IsEmpty;
end;

function Link.GetOperationRefStored: Boolean;
begin
  Result := not FOperationRef.IsEmpty;
end;

function Link.GetParameters: Blue.Print.Open.API.Schema.v30.Link.TParameters;
begin
  if not Assigned(FParameters) then
    FParameters := Blue.Print.Open.API.Schema.v30.Link.TParameters.Create;

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

function Link.GetServer: Blue.Print.Open.API.Schema.v30.Server;
begin
  if not Assigned(FServer) then
    FServer := Blue.Print.Open.API.Schema.v30.Server.Create;

  Result := FServer;
end;

function Link.GetServerStored: Boolean;
begin
  Result := Assigned(FServer);
end;

function Link.GetAnonymous: TDynamicProperty<any>;
begin
  if not Assigned(FAnonymous) then
    FAnonymous := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FAnonymous;
end;

function Link.GetAnonymousStored: Boolean;
begin
  Result := Assigned(FAnonymous);
end;

{ Callback }

destructor Callback.Destroy;
begin
  FPathItem.Free;

  FAnonymous.Free;

  inherited;
end;

function Callback.GetPathItem: TDynamicProperty<PathItem>;
begin
  if not Assigned(FPathItem) then
    FPathItem := TDynamicProperty<Blue.Print.Open.API.Schema.v30.PathItem>.Create;

  Result := FPathItem;
end;

function Callback.GetPathItemStored: Boolean;
begin
  Result := Assigned(FPathItem);
end;

function Callback.GetAnonymous: TDynamicProperty<any>;
begin
  if not Assigned(FAnonymous) then
    FAnonymous := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FAnonymous;
end;

function Callback.GetAnonymousStored: Boolean;
begin
  Result := Assigned(FAnonymous);
end;

{ Encoding }

destructor Encoding.Destroy;
begin
  FHeaders.Free;

  FAnonymous.Free;

  inherited;
end;

function Encoding.GetContentTypeStored: Boolean;
begin
  Result := not FContentType.IsEmpty;
end;

function Encoding.GetHeaders: Blue.Print.Open.API.Schema.v30.Encoding.THeaders;
begin
  if not Assigned(FHeaders) then
    FHeaders := Blue.Print.Open.API.Schema.v30.Encoding.THeaders.Create;

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

function Encoding.GetAnonymous: TDynamicProperty<any>;
begin
  if not Assigned(FAnonymous) then
    FAnonymous := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FAnonymous;
end;

function Encoding.GetAnonymousStored: Boolean;
begin
  Result := Assigned(FAnonymous);
end;

{ Encoding.THeaders }

destructor Encoding.THeaders.Destroy;
begin
  FHeader.Free;

  FReference.Free;

  inherited;
end;

function Encoding.THeaders.GetHeader: Blue.Print.Open.API.Schema.v30.Header;
begin
  if not Assigned(FHeader) then
    FHeader := Blue.Print.Open.API.Schema.v30.Header.Create;

  Result := FHeader;
end;

function Encoding.THeaders.GetHeaderStored: Boolean;
begin
  Result := Assigned(FHeader);
end;

function Encoding.THeaders.GetReference: Blue.Print.Open.API.Schema.v30.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.Reference.Create;

  Result := FReference;
end;

function Encoding.THeaders.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

{ TOpenAPIDefinition }

destructor TOpenAPIDefinition.Destroy;
begin
  FInfo.Free;

  FExternalDocs.Free;

  for var AObject in FServers do
    AObject.Free;

  for var AObject in FSecurity do
    AObject.Free;

  for var AObject in FTags do
    AObject.Free;

  FPaths.Free;

  FComponents.Free;

  FAnonymous.Free;

  inherited;
end;

function TOpenAPIDefinition.GetInfo: Blue.Print.Open.API.Schema.v30.Info;
begin
  if not Assigned(FInfo) then
    FInfo := Blue.Print.Open.API.Schema.v30.Info.Create;

  Result := FInfo;
end;

function TOpenAPIDefinition.GetExternalDocs: Blue.Print.Open.API.Schema.v30.ExternalDocumentation;
begin
  if not Assigned(FExternalDocs) then
    FExternalDocs := Blue.Print.Open.API.Schema.v30.ExternalDocumentation.Create;

  Result := FExternalDocs;
end;

function TOpenAPIDefinition.GetExternalDocsStored: Boolean;
begin
  Result := Assigned(FExternalDocs);
end;

function TOpenAPIDefinition.AddServers: Blue.Print.Open.API.Schema.v30.Server;
begin
  Result := Blue.Print.Open.API.Schema.v30.Server.Create;

  FServers := FServers + [Result];
end;

function TOpenAPIDefinition.GetServersStored: Boolean;
begin
  Result := Assigned(FServers);
end;

function TOpenAPIDefinition.AddSecurity: Blue.Print.Open.API.Schema.v30.SecurityRequirement;
begin
  Result := Blue.Print.Open.API.Schema.v30.SecurityRequirement.Create;

  FSecurity := FSecurity + [Result];
end;

function TOpenAPIDefinition.GetSecurityStored: Boolean;
begin
  Result := Assigned(FSecurity);
end;

function TOpenAPIDefinition.AddTags: Blue.Print.Open.API.Schema.v30.Tag;
begin
  Result := Blue.Print.Open.API.Schema.v30.Tag.Create;

  FTags := FTags + [Result];
end;

function TOpenAPIDefinition.GetTagsStored: Boolean;
begin
  Result := Assigned(FTags);
end;

function TOpenAPIDefinition.GetPaths: Blue.Print.Open.API.Schema.v30.Paths;
begin
  if not Assigned(FPaths) then
    FPaths := Blue.Print.Open.API.Schema.v30.Paths.Create;

  Result := FPaths;
end;

function TOpenAPIDefinition.GetComponents: Blue.Print.Open.API.Schema.v30.Components;
begin
  if not Assigned(FComponents) then
    FComponents := Blue.Print.Open.API.Schema.v30.Components.Create;

  Result := FComponents;
end;

function TOpenAPIDefinition.GetComponentsStored: Boolean;
begin
  Result := Assigned(FComponents);
end;

function TOpenAPIDefinition.GetAnonymous: TDynamicProperty<any>;
begin
  if not Assigned(FAnonymous) then
    FAnonymous := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FAnonymous;
end;

function TOpenAPIDefinition.GetAnonymousStored: Boolean;
begin
  Result := Assigned(FAnonymous);
end;

end.
