unit Blue.Print.OpenAPI30.Schema;

interface

{$M+}
{$SCOPEDENUMS ON}

uses Blue.Print.Types, System.Rtti;

type
  OpenAPIDefinition = class;

  OpenAPIDefinition = class
  public type
    Reference = class;
    InfoType = class;
    Contact = class;
    License = class;
    Server = class;
    ServerVariable = class;
    ComponentsType = class;
    Schema = class;
    Discriminator = class;
    XML = class;
    Response = class;
    MediaType = class;
    Example = class;
    Header = class;
    PathsType = class;
    PathItem = class;
    Operation = class;
    Responses = class;
    SecurityRequirement = class;
    Tag = class;
    ExternalDocumentation = class;
    SchemaXORContent = class;
    Parameter = class;
    PathParameter = class;
    QueryParameter = class;
    HeaderParameter = class;
    CookieParameter = class;
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

    ExampleXORExamples = System.Rtti.TValue;

    Reference = class
    private
      FString: Blue.Print.Types.TDynamicProperty<System.String>;
    public
      procedure AddString(const Name: String; const Value: System.String);
    published
      [PatternProperty('^\$ref$')]
      [FieldName('string')]
      property &string: Blue.Print.Types.TDynamicProperty<System.String> read FString write FString;
    end;

    InfoType = class
    private
      FTitle: System.String;
      FDescription: System.String;
      FDescriptionStored: Boolean;
      FTermsOfService: System.String;
      FTermsOfServiceStored: Boolean;
      FContact: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Contact;
      FContactStored: Boolean;
      FLicense: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.License;
      FLicenseStored: Boolean;
      FVersion: System.String;
      FPatternProperty7: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue>;
      procedure SetDescription(const Value: System.String);
      procedure SetTermsOfService(const Value: System.String);
      function GetContact: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Contact;
      procedure SetContact(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Contact);
      function GetLicense: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.License;
      procedure SetLicense(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.License);
    public
      destructor Destroy; override;

      procedure AddPatternProperty7(const Name: String; const Value: System.Rtti.TValue);

      property IsDescriptionStored: Boolean read FDescriptionStored;
      property IsTermsOfServiceStored: Boolean read FTermsOfServiceStored;
      property IsContactStored: Boolean read FContactStored;
      property IsLicenseStored: Boolean read FLicenseStored;
    published
      property title: System.String read FTitle write FTitle;
      property description: System.String read FDescription write SetDescription stored FDescriptionStored;
      property termsOfService: System.String read FTermsOfService write SetTermsOfService stored FTermsOfServiceStored;
      property contact: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Contact read GetContact write SetContact stored FContactStored;
      property license: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.License read GetLicense write SetLicense stored FLicenseStored;
      property version: System.String read FVersion write FVersion;
      [PatternProperty('^x-')]
      property PatternProperty7: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue> read FPatternProperty7 write FPatternProperty7;
    end;

    Contact = class
    private
      FName: System.String;
      FNameStored: Boolean;
      FUrl: System.String;
      FUrlStored: Boolean;
      FEmail: System.String;
      FEmailStored: Boolean;
      FPatternProperty4: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue>;
      procedure SetName(const Value: System.String);
      procedure SetUrl(const Value: System.String);
      procedure SetEmail(const Value: System.String);
    public
      procedure AddPatternProperty4(const Name: String; const Value: System.Rtti.TValue);

      property IsNameStored: Boolean read FNameStored;
      property IsUrlStored: Boolean read FUrlStored;
      property IsEmailStored: Boolean read FEmailStored;
    published
      property name: System.String read FName write SetName stored FNameStored;
      property url: System.String read FUrl write SetUrl stored FUrlStored;
      property email: System.String read FEmail write SetEmail stored FEmailStored;
      [PatternProperty('^x-')]
      property PatternProperty4: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue> read FPatternProperty4 write FPatternProperty4;
    end;

    License = class
    private
      FName: System.String;
      FUrl: System.String;
      FUrlStored: Boolean;
      FPatternProperty3: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue>;
      procedure SetUrl(const Value: System.String);
    public
      procedure AddPatternProperty3(const Name: String; const Value: System.Rtti.TValue);

      property IsUrlStored: Boolean read FUrlStored;
    published
      property name: System.String read FName write FName;
      property url: System.String read FUrl write SetUrl stored FUrlStored;
      [PatternProperty('^x-')]
      property PatternProperty3: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue> read FPatternProperty3 write FPatternProperty3;
    end;

    Server = class
    public type
      TVariablesType = class;

      TVariablesType = class
      private
        FAdditionalProperties: Blue.Print.Types.TDynamicProperty<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ServerVariable>;
      public
        destructor Destroy; override;

        function AddAdditionalProperties(const Name: String): Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ServerVariable;
      published
        property additionalProperties: Blue.Print.Types.TDynamicProperty<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ServerVariable> read FAdditionalProperties write FAdditionalProperties;
      end;
    private
      FUrl: System.String;
      FDescription: System.String;
      FDescriptionStored: Boolean;
      FVariables: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Server.TVariablesType;
      FVariablesStored: Boolean;
      FPatternProperty4: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue>;
      procedure SetDescription(const Value: System.String);
      function GetVariables: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Server.TVariablesType;
      procedure SetVariables(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Server.TVariablesType);
    public
      destructor Destroy; override;

      procedure AddPatternProperty4(const Name: String; const Value: System.Rtti.TValue);

      property IsDescriptionStored: Boolean read FDescriptionStored;
      property IsVariablesStored: Boolean read FVariablesStored;
    published
      property url: System.String read FUrl write FUrl;
      property description: System.String read FDescription write SetDescription stored FDescriptionStored;
      property variables: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Server.TVariablesType read GetVariables write SetVariables stored FVariablesStored;
      [PatternProperty('^x-')]
      property PatternProperty4: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue> read FPatternProperty4 write FPatternProperty4;
    end;

    ServerVariable = class
    private
      FEnum: System.TArray<System.String>;
      FEnumStored: Boolean;
      FDefault: System.String;
      FDescription: System.String;
      FDescriptionStored: Boolean;
      FPatternProperty4: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue>;
      procedure SetEnum(const Value: System.TArray<System.String>);
      procedure SetDescription(const Value: System.String);
    public
      procedure AddEnum(const Value: System.String);
      procedure AddPatternProperty4(const Name: String; const Value: System.Rtti.TValue);

      property IsEnumStored: Boolean read FEnumStored;
      property IsDescriptionStored: Boolean read FDescriptionStored;
    published
      property enum: System.TArray<System.String> read FEnum write SetEnum stored FEnumStored;
      property default: System.String read FDefault write FDefault;
      property description: System.String read FDescription write SetDescription stored FDescriptionStored;
      [PatternProperty('^x-')]
      property PatternProperty4: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue> read FPatternProperty4 write FPatternProperty4;
    end;

    ComponentsType = class
    public type
      TSchemasType = class;
      TResponsesType = class;
      TParametersType = class;
      TExamplesType = class;
      TRequestBodiesType = class;
      THeadersType = class;
      TSecuritySchemesType = class;
      TLinksType = class;
      TCallbacksType = class;

      TSchemasType = class
      public type
        TPatternPropertyType = class;

        [Flat]
        TPatternPropertyType = class
        private
          FSchema: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema;
          FSchemaStored: Boolean;
          FReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
          FReferenceStored: Boolean;
          function GetSchema: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema;
          procedure SetSchema(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema);
          function GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
          procedure SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
        public
          destructor Destroy; override;

          property IsSchemaStored: Boolean read FSchemaStored;
          property IsReferenceStored: Boolean read FReferenceStored;
        published
          property Schema: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema read GetSchema write SetSchema stored FSchemaStored;
          property Reference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference read GetReference write SetReference stored FReferenceStored;
        end;
      private
        FPatternProperty: Blue.Print.Types.TDynamicProperty<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TSchemasType.TPatternPropertyType>;
      public
        destructor Destroy; override;

        function AddPatternProperty(const Name: String): Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TSchemasType.TPatternPropertyType;
      published
        [PatternProperty('^[a-zA-Z0-9\.\-_]+$')]
        property PatternProperty: Blue.Print.Types.TDynamicProperty<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TSchemasType.TPatternPropertyType> read FPatternProperty write FPatternProperty;
      end;

      TResponsesType = class
      public type
        TPatternPropertyType = class;

        [Flat]
        TPatternPropertyType = class
        private
          FReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
          FReferenceStored: Boolean;
          FResponse: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Response;
          FResponseStored: Boolean;
          function GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
          procedure SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
          function GetResponse: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Response;
          procedure SetResponse(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Response);
        public
          destructor Destroy; override;

          property IsReferenceStored: Boolean read FReferenceStored;
          property IsResponseStored: Boolean read FResponseStored;
        published
          property Reference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference read GetReference write SetReference stored FReferenceStored;
          property Response: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Response read GetResponse write SetResponse stored FResponseStored;
        end;
      private
        FPatternProperty: Blue.Print.Types.TDynamicProperty<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TResponsesType.TPatternPropertyType>;
      public
        destructor Destroy; override;

        function AddPatternProperty(const Name: String): Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TResponsesType.TPatternPropertyType;
      published
        [PatternProperty('^[a-zA-Z0-9\.\-_]+$')]
        property PatternProperty: Blue.Print.Types.TDynamicProperty<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TResponsesType.TPatternPropertyType> read FPatternProperty write FPatternProperty;
      end;

      TParametersType = class
      public type
        TPatternPropertyType = class;

        [Flat]
        TPatternPropertyType = class
        private
          FReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
          FReferenceStored: Boolean;
          FParameter: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Parameter;
          FParameterStored: Boolean;
          function GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
          procedure SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
          function GetParameter: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Parameter;
          procedure SetParameter(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Parameter);
        public
          destructor Destroy; override;

          property IsReferenceStored: Boolean read FReferenceStored;
          property IsParameterStored: Boolean read FParameterStored;
        published
          property Reference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference read GetReference write SetReference stored FReferenceStored;
          property Parameter: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Parameter read GetParameter write SetParameter stored FParameterStored;
        end;
      private
        FPatternProperty: Blue.Print.Types.TDynamicProperty<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TParametersType.TPatternPropertyType>;
      public
        destructor Destroy; override;

        function AddPatternProperty(const Name: String): Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TParametersType.TPatternPropertyType;
      published
        [PatternProperty('^[a-zA-Z0-9\.\-_]+$')]
        property PatternProperty: Blue.Print.Types.TDynamicProperty<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TParametersType.TPatternPropertyType> read FPatternProperty write FPatternProperty;
      end;

      TExamplesType = class
      public type
        TPatternPropertyType = class;

        [Flat]
        TPatternPropertyType = class
        private
          FReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
          FReferenceStored: Boolean;
          FExample: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Example;
          FExampleStored: Boolean;
          function GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
          procedure SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
          function GetExample: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Example;
          procedure SetExample(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Example);
        public
          destructor Destroy; override;

          property IsReferenceStored: Boolean read FReferenceStored;
          property IsExampleStored: Boolean read FExampleStored;
        published
          property Reference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference read GetReference write SetReference stored FReferenceStored;
          property Example: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Example read GetExample write SetExample stored FExampleStored;
        end;
      private
        FPatternProperty: Blue.Print.Types.TDynamicProperty<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TExamplesType.TPatternPropertyType>;
      public
        destructor Destroy; override;

        function AddPatternProperty(const Name: String): Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TExamplesType.TPatternPropertyType;
      published
        [PatternProperty('^[a-zA-Z0-9\.\-_]+$')]
        property PatternProperty: Blue.Print.Types.TDynamicProperty<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TExamplesType.TPatternPropertyType> read FPatternProperty write FPatternProperty;
      end;

      TRequestBodiesType = class
      public type
        TPatternPropertyType = class;

        [Flat]
        TPatternPropertyType = class
        private
          FReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
          FReferenceStored: Boolean;
          FRequestBody: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.RequestBody;
          FRequestBodyStored: Boolean;
          function GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
          procedure SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
          function GetRequestBody: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.RequestBody;
          procedure SetRequestBody(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.RequestBody);
        public
          destructor Destroy; override;

          property IsReferenceStored: Boolean read FReferenceStored;
          property IsRequestBodyStored: Boolean read FRequestBodyStored;
        published
          property Reference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference read GetReference write SetReference stored FReferenceStored;
          property RequestBody: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.RequestBody read GetRequestBody write SetRequestBody stored FRequestBodyStored;
        end;
      private
        FPatternProperty: Blue.Print.Types.TDynamicProperty<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TRequestBodiesType.TPatternPropertyType>;
      public
        destructor Destroy; override;

        function AddPatternProperty(const Name: String): Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TRequestBodiesType.TPatternPropertyType;
      published
        [PatternProperty('^[a-zA-Z0-9\.\-_]+$')]
        property PatternProperty: Blue.Print.Types.TDynamicProperty<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TRequestBodiesType.TPatternPropertyType> read FPatternProperty write FPatternProperty;
      end;

      THeadersType = class
      public type
        TPatternPropertyType = class;

        [Flat]
        TPatternPropertyType = class
        private
          FReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
          FReferenceStored: Boolean;
          FHeader: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Header;
          FHeaderStored: Boolean;
          function GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
          procedure SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
          function GetHeader: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Header;
          procedure SetHeader(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Header);
        public
          destructor Destroy; override;

          property IsReferenceStored: Boolean read FReferenceStored;
          property IsHeaderStored: Boolean read FHeaderStored;
        published
          property Reference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference read GetReference write SetReference stored FReferenceStored;
          property Header: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Header read GetHeader write SetHeader stored FHeaderStored;
        end;
      private
        FPatternProperty: Blue.Print.Types.TDynamicProperty<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.THeadersType.TPatternPropertyType>;
      public
        destructor Destroy; override;

        function AddPatternProperty(const Name: String): Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.THeadersType.TPatternPropertyType;
      published
        [PatternProperty('^[a-zA-Z0-9\.\-_]+$')]
        property PatternProperty: Blue.Print.Types.TDynamicProperty<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.THeadersType.TPatternPropertyType> read FPatternProperty write FPatternProperty;
      end;

      TSecuritySchemesType = class
      public type
        TPatternPropertyType = class;

        [Flat]
        TPatternPropertyType = class
        private
          FReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
          FReferenceStored: Boolean;
          FSecurityScheme: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.SecurityScheme;
          FSecuritySchemeStored: Boolean;
          function GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
          procedure SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
          function GetSecurityScheme: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.SecurityScheme;
          procedure SetSecurityScheme(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.SecurityScheme);
        public
          destructor Destroy; override;

          property IsReferenceStored: Boolean read FReferenceStored;
          property IsSecuritySchemeStored: Boolean read FSecuritySchemeStored;
        published
          property Reference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference read GetReference write SetReference stored FReferenceStored;
          property SecurityScheme: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.SecurityScheme read GetSecurityScheme write SetSecurityScheme stored FSecuritySchemeStored;
        end;
      private
        FPatternProperty: Blue.Print.Types.TDynamicProperty<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TSecuritySchemesType.TPatternPropertyType>;
      public
        destructor Destroy; override;

        function AddPatternProperty(const Name: String): Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TSecuritySchemesType.TPatternPropertyType;
      published
        [PatternProperty('^[a-zA-Z0-9\.\-_]+$')]
        property PatternProperty: Blue.Print.Types.TDynamicProperty<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TSecuritySchemesType.TPatternPropertyType> read FPatternProperty write FPatternProperty;
      end;

      TLinksType = class
      public type
        TPatternPropertyType = class;

        [Flat]
        TPatternPropertyType = class
        private
          FReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
          FReferenceStored: Boolean;
          FLink: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Link;
          FLinkStored: Boolean;
          function GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
          procedure SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
          function GetLink: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Link;
          procedure SetLink(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Link);
        public
          destructor Destroy; override;

          property IsReferenceStored: Boolean read FReferenceStored;
          property IsLinkStored: Boolean read FLinkStored;
        published
          property Reference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference read GetReference write SetReference stored FReferenceStored;
          property Link: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Link read GetLink write SetLink stored FLinkStored;
        end;
      private
        FPatternProperty: Blue.Print.Types.TDynamicProperty<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TLinksType.TPatternPropertyType>;
      public
        destructor Destroy; override;

        function AddPatternProperty(const Name: String): Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TLinksType.TPatternPropertyType;
      published
        [PatternProperty('^[a-zA-Z0-9\.\-_]+$')]
        property PatternProperty: Blue.Print.Types.TDynamicProperty<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TLinksType.TPatternPropertyType> read FPatternProperty write FPatternProperty;
      end;

      TCallbacksType = class
      public type
        TPatternPropertyType = class;

        [Flat]
        TPatternPropertyType = class
        private
          FReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
          FReferenceStored: Boolean;
          FCallback: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Callback;
          FCallbackStored: Boolean;
          function GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
          procedure SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
          function GetCallback: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Callback;
          procedure SetCallback(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Callback);
        public
          destructor Destroy; override;

          property IsReferenceStored: Boolean read FReferenceStored;
          property IsCallbackStored: Boolean read FCallbackStored;
        published
          property Reference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference read GetReference write SetReference stored FReferenceStored;
          property Callback: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Callback read GetCallback write SetCallback stored FCallbackStored;
        end;
      private
        FPatternProperty: Blue.Print.Types.TDynamicProperty<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TCallbacksType.TPatternPropertyType>;
      public
        destructor Destroy; override;

        function AddPatternProperty(const Name: String): Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TCallbacksType.TPatternPropertyType;
      published
        [PatternProperty('^[a-zA-Z0-9\.\-_]+$')]
        property PatternProperty: Blue.Print.Types.TDynamicProperty<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TCallbacksType.TPatternPropertyType> read FPatternProperty write FPatternProperty;
      end;
    private
      FSchemas: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TSchemasType;
      FSchemasStored: Boolean;
      FResponses: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TResponsesType;
      FResponsesStored: Boolean;
      FParameters: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TParametersType;
      FParametersStored: Boolean;
      FExamples: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TExamplesType;
      FExamplesStored: Boolean;
      FRequestBodies: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TRequestBodiesType;
      FRequestBodiesStored: Boolean;
      FHeaders: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.THeadersType;
      FHeadersStored: Boolean;
      FSecuritySchemes: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TSecuritySchemesType;
      FSecuritySchemesStored: Boolean;
      FLinks: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TLinksType;
      FLinksStored: Boolean;
      FCallbacks: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TCallbacksType;
      FCallbacksStored: Boolean;
      FPatternProperty10: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue>;
      function GetSchemas: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TSchemasType;
      procedure SetSchemas(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TSchemasType);
      function GetResponses: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TResponsesType;
      procedure SetResponses(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TResponsesType);
      function GetParameters: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TParametersType;
      procedure SetParameters(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TParametersType);
      function GetExamples: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TExamplesType;
      procedure SetExamples(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TExamplesType);
      function GetRequestBodies: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TRequestBodiesType;
      procedure SetRequestBodies(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TRequestBodiesType);
      function GetHeaders: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.THeadersType;
      procedure SetHeaders(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.THeadersType);
      function GetSecuritySchemes: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TSecuritySchemesType;
      procedure SetSecuritySchemes(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TSecuritySchemesType);
      function GetLinks: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TLinksType;
      procedure SetLinks(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TLinksType);
      function GetCallbacks: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TCallbacksType;
      procedure SetCallbacks(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TCallbacksType);
    public
      destructor Destroy; override;

      procedure AddPatternProperty10(const Name: String; const Value: System.Rtti.TValue);

      property IsSchemasStored: Boolean read FSchemasStored;
      property IsResponsesStored: Boolean read FResponsesStored;
      property IsParametersStored: Boolean read FParametersStored;
      property IsExamplesStored: Boolean read FExamplesStored;
      property IsRequestBodiesStored: Boolean read FRequestBodiesStored;
      property IsHeadersStored: Boolean read FHeadersStored;
      property IsSecuritySchemesStored: Boolean read FSecuritySchemesStored;
      property IsLinksStored: Boolean read FLinksStored;
      property IsCallbacksStored: Boolean read FCallbacksStored;
    published
      property schemas: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TSchemasType read GetSchemas write SetSchemas stored FSchemasStored;
      property responses: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TResponsesType read GetResponses write SetResponses stored FResponsesStored;
      property parameters: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TParametersType read GetParameters write SetParameters stored FParametersStored;
      property examples: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TExamplesType read GetExamples write SetExamples stored FExamplesStored;
      property requestBodies: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TRequestBodiesType read GetRequestBodies write SetRequestBodies stored FRequestBodiesStored;
      property headers: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.THeadersType read GetHeaders write SetHeaders stored FHeadersStored;
      property securitySchemes: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TSecuritySchemesType read GetSecuritySchemes write SetSecuritySchemes stored FSecuritySchemesStored;
      property links: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TLinksType read GetLinks write SetLinks stored FLinksStored;
      property callbacks: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TCallbacksType read GetCallbacks write SetCallbacks stored FCallbacksStored;
      [PatternProperty('^x-')]
      property PatternProperty10: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue> read FPatternProperty10 write FPatternProperty10;
    end;

    Schema = class
    public type
      [EnumValue('array, boolean, integer, number, object, string')]
      TTypeType = (&array, boolean, integer, number, &object, &string);

      TNotType = class;
      TAllOfTypeArray = class;
      TOneOfTypeArray = class;
      TAnyOfTypeArray = class;
      TItemsType = class;
      TPropertiesType = class;
      TAdditionalPropertiesType = class;

      [Flat]
      TNotType = class
      private
        FSchema: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema;
        FSchemaStored: Boolean;
        FReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
        FReferenceStored: Boolean;
        function GetSchema: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema;
        procedure SetSchema(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema);
        function GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
        procedure SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
      public
        destructor Destroy; override;

        property IsSchemaStored: Boolean read FSchemaStored;
        property IsReferenceStored: Boolean read FReferenceStored;
      published
        property Schema: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema read GetSchema write SetSchema stored FSchemaStored;
        property Reference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference read GetReference write SetReference stored FReferenceStored;
      end;

      [Flat]
      TAllOfTypeArray = class
      private
        FSchema: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema;
        FSchemaStored: Boolean;
        FReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
        FReferenceStored: Boolean;
        function GetSchema: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema;
        procedure SetSchema(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema);
        function GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
        procedure SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
      public
        destructor Destroy; override;

        property IsSchemaStored: Boolean read FSchemaStored;
        property IsReferenceStored: Boolean read FReferenceStored;
      published
        property Schema: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema read GetSchema write SetSchema stored FSchemaStored;
        property Reference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference read GetReference write SetReference stored FReferenceStored;
      end;

      [Flat]
      TOneOfTypeArray = class
      private
        FSchema: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema;
        FSchemaStored: Boolean;
        FReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
        FReferenceStored: Boolean;
        function GetSchema: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema;
        procedure SetSchema(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema);
        function GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
        procedure SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
      public
        destructor Destroy; override;

        property IsSchemaStored: Boolean read FSchemaStored;
        property IsReferenceStored: Boolean read FReferenceStored;
      published
        property Schema: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema read GetSchema write SetSchema stored FSchemaStored;
        property Reference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference read GetReference write SetReference stored FReferenceStored;
      end;

      [Flat]
      TAnyOfTypeArray = class
      private
        FSchema: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema;
        FSchemaStored: Boolean;
        FReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
        FReferenceStored: Boolean;
        function GetSchema: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema;
        procedure SetSchema(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema);
        function GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
        procedure SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
      public
        destructor Destroy; override;

        property IsSchemaStored: Boolean read FSchemaStored;
        property IsReferenceStored: Boolean read FReferenceStored;
      published
        property Schema: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema read GetSchema write SetSchema stored FSchemaStored;
        property Reference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference read GetReference write SetReference stored FReferenceStored;
      end;

      [Flat]
      TItemsType = class
      private
        FSchema: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema;
        FSchemaStored: Boolean;
        FReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
        FReferenceStored: Boolean;
        function GetSchema: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema;
        procedure SetSchema(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema);
        function GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
        procedure SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
      public
        destructor Destroy; override;

        property IsSchemaStored: Boolean read FSchemaStored;
        property IsReferenceStored: Boolean read FReferenceStored;
      published
        property Schema: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema read GetSchema write SetSchema stored FSchemaStored;
        property Reference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference read GetReference write SetReference stored FReferenceStored;
      end;

      TPropertiesType = class
      public type
        TAdditionalPropertiesType = class;

        [Flat]
        TAdditionalPropertiesType = class
        private
          FSchema: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema;
          FSchemaStored: Boolean;
          FReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
          FReferenceStored: Boolean;
          function GetSchema: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema;
          procedure SetSchema(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema);
          function GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
          procedure SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
        public
          destructor Destroy; override;

          property IsSchemaStored: Boolean read FSchemaStored;
          property IsReferenceStored: Boolean read FReferenceStored;
        published
          property Schema: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema read GetSchema write SetSchema stored FSchemaStored;
          property Reference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference read GetReference write SetReference stored FReferenceStored;
        end;
      private
        FAdditionalProperties: Blue.Print.Types.TDynamicProperty<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.TPropertiesType.TAdditionalPropertiesType>;
      public
        destructor Destroy; override;

        function AddAdditionalProperties(const Name: String): Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.TPropertiesType.TAdditionalPropertiesType;
      published
        property additionalProperties: Blue.Print.Types.TDynamicProperty<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.TPropertiesType.TAdditionalPropertiesType> read FAdditionalProperties write FAdditionalProperties;
      end;

      [Flat]
      TAdditionalPropertiesType = class
      private
        FSchema: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema;
        FSchemaStored: Boolean;
        FReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
        FReferenceStored: Boolean;
        FBoolean: System.Boolean;
        FBooleanStored: Boolean;
        function GetSchema: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema;
        procedure SetSchema(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema);
        function GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
        procedure SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
        procedure SetBoolean(const Value: System.Boolean);
      public
        destructor Destroy; override;

        property IsSchemaStored: Boolean read FSchemaStored;
        property IsReferenceStored: Boolean read FReferenceStored;
        property IsBooleanStored: Boolean read FBooleanStored;
      published
        property Schema: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema read GetSchema write SetSchema stored FSchemaStored;
        property Reference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference read GetReference write SetReference stored FReferenceStored;
        property boolean: System.Boolean read FBoolean write SetBoolean stored FBooleanStored;
      end;
    private
      FTitle: System.String;
      FTitleStored: Boolean;
      FMultipleOf: System.Double;
      FMultipleOfStored: Boolean;
      FMaximum: System.Double;
      FMaximumStored: Boolean;
      FExclusiveMaximum: System.Boolean;
      FExclusiveMaximumStored: Boolean;
      FMinimum: System.Double;
      FMinimumStored: Boolean;
      FExclusiveMinimum: System.Boolean;
      FExclusiveMinimumStored: Boolean;
      FMaxLength: System.Integer;
      FMaxLengthStored: Boolean;
      FMinLength: System.Integer;
      FMinLengthStored: Boolean;
      FPattern: System.String;
      FPatternStored: Boolean;
      FMaxItems: System.Integer;
      FMaxItemsStored: Boolean;
      FMinItems: System.Integer;
      FMinItemsStored: Boolean;
      FUniqueItems: System.Boolean;
      FUniqueItemsStored: Boolean;
      FMaxProperties: System.Integer;
      FMaxPropertiesStored: Boolean;
      FMinProperties: System.Integer;
      FMinPropertiesStored: Boolean;
      FRequired: System.TArray<System.String>;
      FRequiredStored: Boolean;
      FEnum: System.TArray<System.Rtti.TValue>;
      FEnumStored: Boolean;
      FType: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.TTypeType;
      FTypeStored: Boolean;
      FNot: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.TNotType;
      FNotStored: Boolean;
      FAllOf: System.TArray<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.TAllOfTypeArray>;
      FAllOfStored: Boolean;
      FOneOf: System.TArray<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.TOneOfTypeArray>;
      FOneOfStored: Boolean;
      FAnyOf: System.TArray<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.TAnyOfTypeArray>;
      FAnyOfStored: Boolean;
      FItems: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.TItemsType;
      FItemsStored: Boolean;
      FProperties: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.TPropertiesType;
      FPropertiesStored: Boolean;
      FAdditionalProperties: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.TAdditionalPropertiesType;
      FAdditionalPropertiesStored: Boolean;
      FDescription: System.String;
      FDescriptionStored: Boolean;
      FFormat: System.String;
      FFormatStored: Boolean;
      FDefault: System.Rtti.TValue;
      FDefaultStored: Boolean;
      FNullable: System.Boolean;
      FNullableStored: Boolean;
      FDiscriminator: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Discriminator;
      FDiscriminatorStored: Boolean;
      FReadOnly: System.Boolean;
      FReadOnlyStored: Boolean;
      FWriteOnly: System.Boolean;
      FWriteOnlyStored: Boolean;
      FExample: System.Rtti.TValue;
      FExampleStored: Boolean;
      FExternalDocs: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ExternalDocumentation;
      FExternalDocsStored: Boolean;
      FDeprecated: System.Boolean;
      FDeprecatedStored: Boolean;
      FXml: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.XML;
      FXmlStored: Boolean;
      FPatternProperty36: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue>;
      procedure SetTitle(const Value: System.String);
      procedure SetMultipleOf(const Value: System.Double);
      procedure SetMaximum(const Value: System.Double);
      procedure SetExclusiveMaximum(const Value: System.Boolean);
      procedure SetMinimum(const Value: System.Double);
      procedure SetExclusiveMinimum(const Value: System.Boolean);
      procedure SetMaxLength(const Value: System.Integer);
      procedure SetMinLength(const Value: System.Integer);
      procedure SetPattern(const Value: System.String);
      procedure SetMaxItems(const Value: System.Integer);
      procedure SetMinItems(const Value: System.Integer);
      procedure SetUniqueItems(const Value: System.Boolean);
      procedure SetMaxProperties(const Value: System.Integer);
      procedure SetMinProperties(const Value: System.Integer);
      procedure SetRequired(const Value: System.TArray<System.String>);
      procedure SetEnum(const Value: System.TArray<System.Rtti.TValue>);
      procedure SetType(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.TTypeType);
      function GetNot: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.TNotType;
      procedure SetNot(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.TNotType);
      procedure SetAllOf(const Value: System.TArray<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.TAllOfTypeArray>);
      procedure SetOneOf(const Value: System.TArray<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.TOneOfTypeArray>);
      procedure SetAnyOf(const Value: System.TArray<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.TAnyOfTypeArray>);
      function GetItems: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.TItemsType;
      procedure SetItems(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.TItemsType);
      function GetProperties: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.TPropertiesType;
      procedure SetProperties(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.TPropertiesType);
      function GetAdditionalProperties: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.TAdditionalPropertiesType;
      procedure SetAdditionalProperties(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.TAdditionalPropertiesType);
      procedure SetDescription(const Value: System.String);
      procedure SetFormat(const Value: System.String);
      procedure SetDefault(const Value: System.Rtti.TValue);
      procedure SetNullable(const Value: System.Boolean);
      function GetDiscriminator: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Discriminator;
      procedure SetDiscriminator(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Discriminator);
      procedure SetReadOnly(const Value: System.Boolean);
      procedure SetWriteOnly(const Value: System.Boolean);
      procedure SetExample(const Value: System.Rtti.TValue);
      function GetExternalDocs: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ExternalDocumentation;
      procedure SetExternalDocs(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ExternalDocumentation);
      procedure SetDeprecated(const Value: System.Boolean);
      function GetXml: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.XML;
      procedure SetXml(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.XML);
    public
      destructor Destroy; override;

      procedure AddRequired(const Value: System.String);
      procedure AddEnum(const Value: System.Rtti.TValue);
      function AddAllOf: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.TAllOfTypeArray;
      function AddOneOf: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.TOneOfTypeArray;
      function AddAnyOf: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.TAnyOfTypeArray;
      procedure AddPatternProperty36(const Name: String; const Value: System.Rtti.TValue);

      property IsTitleStored: Boolean read FTitleStored;
      property IsMultipleOfStored: Boolean read FMultipleOfStored;
      property IsMaximumStored: Boolean read FMaximumStored;
      property IsExclusiveMaximumStored: Boolean read FExclusiveMaximumStored;
      property IsMinimumStored: Boolean read FMinimumStored;
      property IsExclusiveMinimumStored: Boolean read FExclusiveMinimumStored;
      property IsMaxLengthStored: Boolean read FMaxLengthStored;
      property IsMinLengthStored: Boolean read FMinLengthStored;
      property IsPatternStored: Boolean read FPatternStored;
      property IsMaxItemsStored: Boolean read FMaxItemsStored;
      property IsMinItemsStored: Boolean read FMinItemsStored;
      property IsUniqueItemsStored: Boolean read FUniqueItemsStored;
      property IsMaxPropertiesStored: Boolean read FMaxPropertiesStored;
      property IsMinPropertiesStored: Boolean read FMinPropertiesStored;
      property IsRequiredStored: Boolean read FRequiredStored;
      property IsEnumStored: Boolean read FEnumStored;
      property IsTypeStored: Boolean read FTypeStored;
      property IsNotStored: Boolean read FNotStored;
      property IsAllOfStored: Boolean read FAllOfStored;
      property IsOneOfStored: Boolean read FOneOfStored;
      property IsAnyOfStored: Boolean read FAnyOfStored;
      property IsItemsStored: Boolean read FItemsStored;
      property IsPropertiesStored: Boolean read FPropertiesStored;
      property IsAdditionalPropertiesStored: Boolean read FAdditionalPropertiesStored;
      property IsDescriptionStored: Boolean read FDescriptionStored;
      property IsFormatStored: Boolean read FFormatStored;
      property IsDefaultStored: Boolean read FDefaultStored;
      property IsNullableStored: Boolean read FNullableStored;
      property IsDiscriminatorStored: Boolean read FDiscriminatorStored;
      property IsReadOnlyStored: Boolean read FReadOnlyStored;
      property IsWriteOnlyStored: Boolean read FWriteOnlyStored;
      property IsExampleStored: Boolean read FExampleStored;
      property IsExternalDocsStored: Boolean read FExternalDocsStored;
      property IsDeprecatedStored: Boolean read FDeprecatedStored;
      property IsXmlStored: Boolean read FXmlStored;
    published
      property title: System.String read FTitle write SetTitle stored FTitleStored;
      property multipleOf: System.Double read FMultipleOf write SetMultipleOf stored FMultipleOfStored;
      property maximum: System.Double read FMaximum write SetMaximum stored FMaximumStored;
      property exclusiveMaximum: System.Boolean read FExclusiveMaximum write SetExclusiveMaximum stored FExclusiveMaximumStored;
      property minimum: System.Double read FMinimum write SetMinimum stored FMinimumStored;
      property exclusiveMinimum: System.Boolean read FExclusiveMinimum write SetExclusiveMinimum stored FExclusiveMinimumStored;
      property maxLength: System.Integer read FMaxLength write SetMaxLength stored FMaxLengthStored;
      property minLength: System.Integer read FMinLength write SetMinLength stored FMinLengthStored;
      property pattern: System.String read FPattern write SetPattern stored FPatternStored;
      property maxItems: System.Integer read FMaxItems write SetMaxItems stored FMaxItemsStored;
      property minItems: System.Integer read FMinItems write SetMinItems stored FMinItemsStored;
      property uniqueItems: System.Boolean read FUniqueItems write SetUniqueItems stored FUniqueItemsStored;
      property maxProperties: System.Integer read FMaxProperties write SetMaxProperties stored FMaxPropertiesStored;
      property minProperties: System.Integer read FMinProperties write SetMinProperties stored FMinPropertiesStored;
      property required: System.TArray<System.String> read FRequired write SetRequired stored FRequiredStored;
      property enum: System.TArray<System.Rtti.TValue> read FEnum write SetEnum stored FEnumStored;
      [FieldName('type')]
      property &type: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.TTypeType read FType write SetType stored FTypeStored;
      [FieldName('not')]
      property &not: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.TNotType read GetNot write SetNot stored FNotStored;
      property allOf: System.TArray<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.TAllOfTypeArray> read FAllOf write SetAllOf stored FAllOfStored;
      property oneOf: System.TArray<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.TOneOfTypeArray> read FOneOf write SetOneOf stored FOneOfStored;
      property anyOf: System.TArray<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.TAnyOfTypeArray> read FAnyOf write SetAnyOf stored FAnyOfStored;
      property items: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.TItemsType read GetItems write SetItems stored FItemsStored;
      property properties: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.TPropertiesType read GetProperties write SetProperties stored FPropertiesStored;
      property additionalProperties: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.TAdditionalPropertiesType read GetAdditionalProperties write SetAdditionalProperties stored FAdditionalPropertiesStored;
      property description: System.String read FDescription write SetDescription stored FDescriptionStored;
      property format: System.String read FFormat write SetFormat stored FFormatStored;
      property default: System.Rtti.TValue read FDefault write SetDefault stored FDefaultStored;
      property nullable: System.Boolean read FNullable write SetNullable stored FNullableStored;
      property discriminator: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Discriminator read GetDiscriminator write SetDiscriminator stored FDiscriminatorStored;
      property readOnly: System.Boolean read FReadOnly write SetReadOnly stored FReadOnlyStored;
      property writeOnly: System.Boolean read FWriteOnly write SetWriteOnly stored FWriteOnlyStored;
      property example: System.Rtti.TValue read FExample write SetExample stored FExampleStored;
      property externalDocs: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ExternalDocumentation read GetExternalDocs write SetExternalDocs stored FExternalDocsStored;
      property deprecated: System.Boolean read FDeprecated write SetDeprecated stored FDeprecatedStored;
      property xml: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.XML read GetXml write SetXml stored FXmlStored;
      [PatternProperty('^x-')]
      property PatternProperty36: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue> read FPatternProperty36 write FPatternProperty36;
    end;

    Discriminator = class
    public type
      TMappingType = class;

      TMappingType = class
      private
        FAdditionalProperties: Blue.Print.Types.TDynamicProperty<System.String>;
      public
        procedure AddAdditionalProperties(const Name: String; const Value: System.String);
      published
        property additionalProperties: Blue.Print.Types.TDynamicProperty<System.String> read FAdditionalProperties write FAdditionalProperties;
      end;
    private
      FPropertyName: System.String;
      FMapping: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Discriminator.TMappingType;
      FMappingStored: Boolean;
      function GetMapping: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Discriminator.TMappingType;
      procedure SetMapping(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Discriminator.TMappingType);
    public
      destructor Destroy; override;

      property IsMappingStored: Boolean read FMappingStored;
    published
      property propertyName: System.String read FPropertyName write FPropertyName;
      property mapping: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Discriminator.TMappingType read GetMapping write SetMapping stored FMappingStored;
    end;

    XML = class
    private
      FName: System.String;
      FNameStored: Boolean;
      FNamespace: System.String;
      FNamespaceStored: Boolean;
      FPrefix: System.String;
      FPrefixStored: Boolean;
      FAttribute: System.Boolean;
      FAttributeStored: Boolean;
      FWrapped: System.Boolean;
      FWrappedStored: Boolean;
      FPatternProperty6: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue>;
      procedure SetName(const Value: System.String);
      procedure SetNamespace(const Value: System.String);
      procedure SetPrefix(const Value: System.String);
      procedure SetAttribute(const Value: System.Boolean);
      procedure SetWrapped(const Value: System.Boolean);
    public
      procedure AddPatternProperty6(const Name: String; const Value: System.Rtti.TValue);

      property IsNameStored: Boolean read FNameStored;
      property IsNamespaceStored: Boolean read FNamespaceStored;
      property IsPrefixStored: Boolean read FPrefixStored;
      property IsAttributeStored: Boolean read FAttributeStored;
      property IsWrappedStored: Boolean read FWrappedStored;
    published
      property name: System.String read FName write SetName stored FNameStored;
      property namespace: System.String read FNamespace write SetNamespace stored FNamespaceStored;
      property prefix: System.String read FPrefix write SetPrefix stored FPrefixStored;
      property attribute: System.Boolean read FAttribute write SetAttribute stored FAttributeStored;
      property wrapped: System.Boolean read FWrapped write SetWrapped stored FWrappedStored;
      [PatternProperty('^x-')]
      property PatternProperty6: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue> read FPatternProperty6 write FPatternProperty6;
    end;

    Response = class
    public type
      THeadersType = class;
      TContentType = class;
      TLinksType = class;

      THeadersType = class
      public type
        TAdditionalPropertiesType = class;

        [Flat]
        TAdditionalPropertiesType = class
        private
          FHeader: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Header;
          FHeaderStored: Boolean;
          FReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
          FReferenceStored: Boolean;
          function GetHeader: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Header;
          procedure SetHeader(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Header);
          function GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
          procedure SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
        public
          destructor Destroy; override;

          property IsHeaderStored: Boolean read FHeaderStored;
          property IsReferenceStored: Boolean read FReferenceStored;
        published
          property Header: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Header read GetHeader write SetHeader stored FHeaderStored;
          property Reference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference read GetReference write SetReference stored FReferenceStored;
        end;
      private
        FAdditionalProperties: Blue.Print.Types.TDynamicProperty<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Response.THeadersType.TAdditionalPropertiesType>;
      public
        destructor Destroy; override;

        function AddAdditionalProperties(const Name: String): Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Response.THeadersType.TAdditionalPropertiesType;
      published
        property additionalProperties: Blue.Print.Types.TDynamicProperty<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Response.THeadersType.TAdditionalPropertiesType> read FAdditionalProperties write FAdditionalProperties;
      end;

      TContentType = class
      private
        FAdditionalProperties: Blue.Print.Types.TDynamicProperty<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.MediaType>;
      public
        destructor Destroy; override;

        function AddAdditionalProperties(const Name: String): Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.MediaType;
      published
        property additionalProperties: Blue.Print.Types.TDynamicProperty<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.MediaType> read FAdditionalProperties write FAdditionalProperties;
      end;

      TLinksType = class
      public type
        TAdditionalPropertiesType = class;

        [Flat]
        TAdditionalPropertiesType = class
        private
          FLink: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Link;
          FLinkStored: Boolean;
          FReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
          FReferenceStored: Boolean;
          function GetLink: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Link;
          procedure SetLink(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Link);
          function GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
          procedure SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
        public
          destructor Destroy; override;

          property IsLinkStored: Boolean read FLinkStored;
          property IsReferenceStored: Boolean read FReferenceStored;
        published
          property Link: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Link read GetLink write SetLink stored FLinkStored;
          property Reference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference read GetReference write SetReference stored FReferenceStored;
        end;
      private
        FAdditionalProperties: Blue.Print.Types.TDynamicProperty<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Response.TLinksType.TAdditionalPropertiesType>;
      public
        destructor Destroy; override;

        function AddAdditionalProperties(const Name: String): Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Response.TLinksType.TAdditionalPropertiesType;
      published
        property additionalProperties: Blue.Print.Types.TDynamicProperty<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Response.TLinksType.TAdditionalPropertiesType> read FAdditionalProperties write FAdditionalProperties;
      end;
    private
      FDescription: System.String;
      FHeaders: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Response.THeadersType;
      FHeadersStored: Boolean;
      FContent: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Response.TContentType;
      FContentStored: Boolean;
      FLinks: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Response.TLinksType;
      FLinksStored: Boolean;
      FPatternProperty5: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue>;
      function GetHeaders: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Response.THeadersType;
      procedure SetHeaders(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Response.THeadersType);
      function GetContent: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Response.TContentType;
      procedure SetContent(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Response.TContentType);
      function GetLinks: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Response.TLinksType;
      procedure SetLinks(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Response.TLinksType);
    public
      destructor Destroy; override;

      procedure AddPatternProperty5(const Name: String; const Value: System.Rtti.TValue);

      property IsHeadersStored: Boolean read FHeadersStored;
      property IsContentStored: Boolean read FContentStored;
      property IsLinksStored: Boolean read FLinksStored;
    published
      property description: System.String read FDescription write FDescription;
      property headers: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Response.THeadersType read GetHeaders write SetHeaders stored FHeadersStored;
      property content: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Response.TContentType read GetContent write SetContent stored FContentStored;
      property links: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Response.TLinksType read GetLinks write SetLinks stored FLinksStored;
      [PatternProperty('^x-')]
      property PatternProperty5: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue> read FPatternProperty5 write FPatternProperty5;
    end;

    MediaType = class
    public type
      TSchemaType = class;
      TExamplesType = class;
      TEncodingType = class;

      [Flat]
      TSchemaType = class
      private
        FSchema: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema;
        FSchemaStored: Boolean;
        FReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
        FReferenceStored: Boolean;
        function GetSchema: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema;
        procedure SetSchema(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema);
        function GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
        procedure SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
      public
        destructor Destroy; override;

        property IsSchemaStored: Boolean read FSchemaStored;
        property IsReferenceStored: Boolean read FReferenceStored;
      published
        property Schema: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema read GetSchema write SetSchema stored FSchemaStored;
        property Reference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference read GetReference write SetReference stored FReferenceStored;
      end;

      TExamplesType = class
      public type
        TAdditionalPropertiesType = class;

        [Flat]
        TAdditionalPropertiesType = class
        private
          FExample: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Example;
          FExampleStored: Boolean;
          FReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
          FReferenceStored: Boolean;
          function GetExample: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Example;
          procedure SetExample(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Example);
          function GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
          procedure SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
        public
          destructor Destroy; override;

          property IsExampleStored: Boolean read FExampleStored;
          property IsReferenceStored: Boolean read FReferenceStored;
        published
          property Example: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Example read GetExample write SetExample stored FExampleStored;
          property Reference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference read GetReference write SetReference stored FReferenceStored;
        end;
      private
        FAdditionalProperties: Blue.Print.Types.TDynamicProperty<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.MediaType.TExamplesType.TAdditionalPropertiesType>;
      public
        destructor Destroy; override;

        function AddAdditionalProperties(const Name: String): Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.MediaType.TExamplesType.TAdditionalPropertiesType;
      published
        property additionalProperties: Blue.Print.Types.TDynamicProperty<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.MediaType.TExamplesType.TAdditionalPropertiesType> read FAdditionalProperties write FAdditionalProperties;
      end;

      TEncodingType = class
      private
        FAdditionalProperties: Blue.Print.Types.TDynamicProperty<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Encoding>;
      public
        destructor Destroy; override;

        function AddAdditionalProperties(const Name: String): Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Encoding;
      published
        property additionalProperties: Blue.Print.Types.TDynamicProperty<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Encoding> read FAdditionalProperties write FAdditionalProperties;
      end;
    private
      FSchema: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.MediaType.TSchemaType;
      FSchemaStored: Boolean;
      FExample: System.Rtti.TValue;
      FExampleStored: Boolean;
      FExamples: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.MediaType.TExamplesType;
      FExamplesStored: Boolean;
      FEncoding: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.MediaType.TEncodingType;
      FEncodingStored: Boolean;
      FPatternProperty5: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue>;
      function GetSchema: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.MediaType.TSchemaType;
      procedure SetSchema(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.MediaType.TSchemaType);
      procedure SetExample(const Value: System.Rtti.TValue);
      function GetExamples: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.MediaType.TExamplesType;
      procedure SetExamples(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.MediaType.TExamplesType);
      function GetEncoding: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.MediaType.TEncodingType;
      procedure SetEncoding(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.MediaType.TEncodingType);
    public
      destructor Destroy; override;

      procedure AddPatternProperty5(const Name: String; const Value: System.Rtti.TValue);

      property IsSchemaStored: Boolean read FSchemaStored;
      property IsExampleStored: Boolean read FExampleStored;
      property IsExamplesStored: Boolean read FExamplesStored;
      property IsEncodingStored: Boolean read FEncodingStored;
    published
      property schema: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.MediaType.TSchemaType read GetSchema write SetSchema stored FSchemaStored;
      property example: System.Rtti.TValue read FExample write SetExample stored FExampleStored;
      property examples: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.MediaType.TExamplesType read GetExamples write SetExamples stored FExamplesStored;
      property encoding: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.MediaType.TEncodingType read GetEncoding write SetEncoding stored FEncodingStored;
      [PatternProperty('^x-')]
      property PatternProperty5: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue> read FPatternProperty5 write FPatternProperty5;
    end;

    Example = class
    private
      FSummary: System.String;
      FSummaryStored: Boolean;
      FDescription: System.String;
      FDescriptionStored: Boolean;
      FValue: System.Rtti.TValue;
      FValueStored: Boolean;
      FExternalValue: System.String;
      FExternalValueStored: Boolean;
      FPatternProperty5: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue>;
      procedure SetSummary(const Value: System.String);
      procedure SetDescription(const Value: System.String);
      procedure SetValue(const Value: System.Rtti.TValue);
      procedure SetExternalValue(const Value: System.String);
    public
      procedure AddPatternProperty5(const Name: String; const Value: System.Rtti.TValue);

      property IsSummaryStored: Boolean read FSummaryStored;
      property IsDescriptionStored: Boolean read FDescriptionStored;
      property IsValueStored: Boolean read FValueStored;
      property IsExternalValueStored: Boolean read FExternalValueStored;
    published
      property summary: System.String read FSummary write SetSummary stored FSummaryStored;
      property description: System.String read FDescription write SetDescription stored FDescriptionStored;
      property value: System.Rtti.TValue read FValue write SetValue stored FValueStored;
      property externalValue: System.String read FExternalValue write SetExternalValue stored FExternalValueStored;
      [PatternProperty('^x-')]
      property PatternProperty5: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue> read FPatternProperty5 write FPatternProperty5;
    end;

    Header = class
    public type
      TStyleType = (simple);

      TSchemaType = class;
      TContentType = class;
      TExamplesType = class;

      [Flat]
      TSchemaType = class
      private
        FSchema: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema;
        FSchemaStored: Boolean;
        FReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
        FReferenceStored: Boolean;
        function GetSchema: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema;
        procedure SetSchema(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema);
        function GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
        procedure SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
      public
        destructor Destroy; override;

        property IsSchemaStored: Boolean read FSchemaStored;
        property IsReferenceStored: Boolean read FReferenceStored;
      published
        property Schema: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema read GetSchema write SetSchema stored FSchemaStored;
        property Reference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference read GetReference write SetReference stored FReferenceStored;
      end;

      TContentType = class
      private
        FAdditionalProperties: Blue.Print.Types.TDynamicProperty<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.MediaType>;
      public
        destructor Destroy; override;

        function AddAdditionalProperties(const Name: String): Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.MediaType;
      published
        property additionalProperties: Blue.Print.Types.TDynamicProperty<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.MediaType> read FAdditionalProperties write FAdditionalProperties;
      end;

      TExamplesType = class
      public type
        TAdditionalPropertiesType = class;

        [Flat]
        TAdditionalPropertiesType = class
        private
          FExample: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Example;
          FExampleStored: Boolean;
          FReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
          FReferenceStored: Boolean;
          function GetExample: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Example;
          procedure SetExample(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Example);
          function GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
          procedure SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
        public
          destructor Destroy; override;

          property IsExampleStored: Boolean read FExampleStored;
          property IsReferenceStored: Boolean read FReferenceStored;
        published
          property Example: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Example read GetExample write SetExample stored FExampleStored;
          property Reference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference read GetReference write SetReference stored FReferenceStored;
        end;
      private
        FAdditionalProperties: Blue.Print.Types.TDynamicProperty<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Header.TExamplesType.TAdditionalPropertiesType>;
      public
        destructor Destroy; override;

        function AddAdditionalProperties(const Name: String): Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Header.TExamplesType.TAdditionalPropertiesType;
      published
        property additionalProperties: Blue.Print.Types.TDynamicProperty<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Header.TExamplesType.TAdditionalPropertiesType> read FAdditionalProperties write FAdditionalProperties;
      end;
    private
      FDescription: System.String;
      FDescriptionStored: Boolean;
      FRequired: System.Boolean;
      FRequiredStored: Boolean;
      FDeprecated: System.Boolean;
      FDeprecatedStored: Boolean;
      FAllowEmptyValue: System.Boolean;
      FAllowEmptyValueStored: Boolean;
      FStyle: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Header.TStyleType;
      FStyleStored: Boolean;
      FExplode: System.Boolean;
      FExplodeStored: Boolean;
      FAllowReserved: System.Boolean;
      FAllowReservedStored: Boolean;
      FSchema: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Header.TSchemaType;
      FSchemaStored: Boolean;
      FContent: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Header.TContentType;
      FContentStored: Boolean;
      FExample: System.Rtti.TValue;
      FExampleStored: Boolean;
      FExamples: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Header.TExamplesType;
      FExamplesStored: Boolean;
      FPatternProperty12: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue>;
      procedure SetDescription(const Value: System.String);
      procedure SetRequired(const Value: System.Boolean);
      procedure SetDeprecated(const Value: System.Boolean);
      procedure SetAllowEmptyValue(const Value: System.Boolean);
      procedure SetStyle(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Header.TStyleType);
      procedure SetExplode(const Value: System.Boolean);
      procedure SetAllowReserved(const Value: System.Boolean);
      function GetSchema: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Header.TSchemaType;
      procedure SetSchema(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Header.TSchemaType);
      function GetContent: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Header.TContentType;
      procedure SetContent(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Header.TContentType);
      procedure SetExample(const Value: System.Rtti.TValue);
      function GetExamples: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Header.TExamplesType;
      procedure SetExamples(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Header.TExamplesType);
    public
      destructor Destroy; override;

      procedure AddPatternProperty12(const Name: String; const Value: System.Rtti.TValue);

      property IsDescriptionStored: Boolean read FDescriptionStored;
      property IsRequiredStored: Boolean read FRequiredStored;
      property IsDeprecatedStored: Boolean read FDeprecatedStored;
      property IsAllowEmptyValueStored: Boolean read FAllowEmptyValueStored;
      property IsStyleStored: Boolean read FStyleStored;
      property IsExplodeStored: Boolean read FExplodeStored;
      property IsAllowReservedStored: Boolean read FAllowReservedStored;
      property IsSchemaStored: Boolean read FSchemaStored;
      property IsContentStored: Boolean read FContentStored;
      property IsExampleStored: Boolean read FExampleStored;
      property IsExamplesStored: Boolean read FExamplesStored;
    published
      property description: System.String read FDescription write SetDescription stored FDescriptionStored;
      property required: System.Boolean read FRequired write SetRequired stored FRequiredStored;
      property deprecated: System.Boolean read FDeprecated write SetDeprecated stored FDeprecatedStored;
      property allowEmptyValue: System.Boolean read FAllowEmptyValue write SetAllowEmptyValue stored FAllowEmptyValueStored;
      property style: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Header.TStyleType read FStyle write SetStyle stored FStyleStored;
      property explode: System.Boolean read FExplode write SetExplode stored FExplodeStored;
      property allowReserved: System.Boolean read FAllowReserved write SetAllowReserved stored FAllowReservedStored;
      property schema: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Header.TSchemaType read GetSchema write SetSchema stored FSchemaStored;
      property content: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Header.TContentType read GetContent write SetContent stored FContentStored;
      property example: System.Rtti.TValue read FExample write SetExample stored FExampleStored;
      property examples: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Header.TExamplesType read GetExamples write SetExamples stored FExamplesStored;
      [PatternProperty('^x-')]
      property PatternProperty12: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue> read FPatternProperty12 write FPatternProperty12;
    end;

    PathsType = class
    private
      FPathItem: Blue.Print.Types.TDynamicProperty<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.PathItem>;
      FPatternProperty2: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue>;
    public
      destructor Destroy; override;

      function AddPathItem(const Name: String): Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.PathItem;
      procedure AddPatternProperty2(const Name: String; const Value: System.Rtti.TValue);
    published
      [PatternProperty('^\/')]
      property PathItem: Blue.Print.Types.TDynamicProperty<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.PathItem> read FPathItem write FPathItem;
      [PatternProperty('^x-')]
      property PatternProperty2: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue> read FPatternProperty2 write FPatternProperty2;
    end;

    PathItem = class
    public type
      TParametersTypeArray = class;

      [Flat]
      TParametersTypeArray = class
      private
        FParameter: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Parameter;
        FParameterStored: Boolean;
        FReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
        FReferenceStored: Boolean;
        function GetParameter: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Parameter;
        procedure SetParameter(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Parameter);
        function GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
        procedure SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
      public
        destructor Destroy; override;

        property IsParameterStored: Boolean read FParameterStored;
        property IsReferenceStored: Boolean read FReferenceStored;
      published
        property Parameter: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Parameter read GetParameter write SetParameter stored FParameterStored;
        property Reference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference read GetReference write SetReference stored FReferenceStored;
      end;
    private
      FRef: System.String;
      FRefStored: Boolean;
      FSummary: System.String;
      FSummaryStored: Boolean;
      FDescription: System.String;
      FDescriptionStored: Boolean;
      FGet: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation;
      FGetStored: Boolean;
      FPut: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation;
      FPutStored: Boolean;
      FPost: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation;
      FPostStored: Boolean;
      FDelete: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation;
      FDeleteStored: Boolean;
      FOptions: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation;
      FOptionsStored: Boolean;
      FHead: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation;
      FHeadStored: Boolean;
      FPatch: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation;
      FPatchStored: Boolean;
      FTrace: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation;
      FTraceStored: Boolean;
      FServers: System.TArray<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Server>;
      FServersStored: Boolean;
      FParameters: System.TArray<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.PathItem.TParametersTypeArray>;
      FParametersStored: Boolean;
      FPatternProperty14: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue>;
      procedure SetRef(const Value: System.String);
      procedure SetSummary(const Value: System.String);
      procedure SetDescription(const Value: System.String);
      function GetGet: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation;
      procedure SetGet(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation);
      function GetPut: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation;
      procedure SetPut(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation);
      function GetPost: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation;
      procedure SetPost(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation);
      function GetDelete: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation;
      procedure SetDelete(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation);
      function GetOptions: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation;
      procedure SetOptions(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation);
      function GetHead: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation;
      procedure SetHead(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation);
      function GetPatch: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation;
      procedure SetPatch(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation);
      function GetTrace: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation;
      procedure SetTrace(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation);
      procedure SetServers(const Value: System.TArray<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Server>);
      procedure SetParameters(const Value: System.TArray<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.PathItem.TParametersTypeArray>);
    public
      destructor Destroy; override;

      function AddServers: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Server;
      function AddParameters: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.PathItem.TParametersTypeArray;
      procedure AddPatternProperty14(const Name: String; const Value: System.Rtti.TValue);

      property IsRefStored: Boolean read FRefStored;
      property IsSummaryStored: Boolean read FSummaryStored;
      property IsDescriptionStored: Boolean read FDescriptionStored;
      property IsGetStored: Boolean read FGetStored;
      property IsPutStored: Boolean read FPutStored;
      property IsPostStored: Boolean read FPostStored;
      property IsDeleteStored: Boolean read FDeleteStored;
      property IsOptionsStored: Boolean read FOptionsStored;
      property IsHeadStored: Boolean read FHeadStored;
      property IsPatchStored: Boolean read FPatchStored;
      property IsTraceStored: Boolean read FTraceStored;
      property IsServersStored: Boolean read FServersStored;
      property IsParametersStored: Boolean read FParametersStored;
    published
      [FieldName('$ref')]
      property Ref: System.String read FRef write SetRef stored FRefStored;
      property summary: System.String read FSummary write SetSummary stored FSummaryStored;
      property description: System.String read FDescription write SetDescription stored FDescriptionStored;
      property get: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation read GetGet write SetGet stored FGetStored;
      property put: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation read GetPut write SetPut stored FPutStored;
      property post: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation read GetPost write SetPost stored FPostStored;
      property delete: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation read GetDelete write SetDelete stored FDeleteStored;
      property options: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation read GetOptions write SetOptions stored FOptionsStored;
      property head: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation read GetHead write SetHead stored FHeadStored;
      property patch: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation read GetPatch write SetPatch stored FPatchStored;
      property trace: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation read GetTrace write SetTrace stored FTraceStored;
      property servers: System.TArray<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Server> read FServers write SetServers stored FServersStored;
      property parameters: System.TArray<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.PathItem.TParametersTypeArray> read FParameters write SetParameters stored FParametersStored;
      [PatternProperty('^x-')]
      property PatternProperty14: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue> read FPatternProperty14 write FPatternProperty14;
    end;

    Operation = class
    public type
      TParametersTypeArray = class;
      TRequestBodyType = class;
      TCallbacksType = class;

      [Flat]
      TParametersTypeArray = class
      private
        FParameter: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Parameter;
        FParameterStored: Boolean;
        FReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
        FReferenceStored: Boolean;
        function GetParameter: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Parameter;
        procedure SetParameter(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Parameter);
        function GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
        procedure SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
      public
        destructor Destroy; override;

        property IsParameterStored: Boolean read FParameterStored;
        property IsReferenceStored: Boolean read FReferenceStored;
      published
        property Parameter: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Parameter read GetParameter write SetParameter stored FParameterStored;
        property Reference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference read GetReference write SetReference stored FReferenceStored;
      end;

      [Flat]
      TRequestBodyType = class
      private
        FRequestBody: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.RequestBody;
        FRequestBodyStored: Boolean;
        FReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
        FReferenceStored: Boolean;
        function GetRequestBody: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.RequestBody;
        procedure SetRequestBody(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.RequestBody);
        function GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
        procedure SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
      public
        destructor Destroy; override;

        property IsRequestBodyStored: Boolean read FRequestBodyStored;
        property IsReferenceStored: Boolean read FReferenceStored;
      published
        property RequestBody: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.RequestBody read GetRequestBody write SetRequestBody stored FRequestBodyStored;
        property Reference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference read GetReference write SetReference stored FReferenceStored;
      end;

      TCallbacksType = class
      public type
        TAdditionalPropertiesType = class;

        [Flat]
        TAdditionalPropertiesType = class
        private
          FCallback: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Callback;
          FCallbackStored: Boolean;
          FReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
          FReferenceStored: Boolean;
          function GetCallback: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Callback;
          procedure SetCallback(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Callback);
          function GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
          procedure SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
        public
          destructor Destroy; override;

          property IsCallbackStored: Boolean read FCallbackStored;
          property IsReferenceStored: Boolean read FReferenceStored;
        published
          property Callback: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Callback read GetCallback write SetCallback stored FCallbackStored;
          property Reference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference read GetReference write SetReference stored FReferenceStored;
        end;
      private
        FAdditionalProperties: Blue.Print.Types.TDynamicProperty<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation.TCallbacksType.TAdditionalPropertiesType>;
      public
        destructor Destroy; override;

        function AddAdditionalProperties(const Name: String): Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation.TCallbacksType.TAdditionalPropertiesType;
      published
        property additionalProperties: Blue.Print.Types.TDynamicProperty<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation.TCallbacksType.TAdditionalPropertiesType> read FAdditionalProperties write FAdditionalProperties;
      end;
    private
      FTags: System.TArray<System.String>;
      FTagsStored: Boolean;
      FSummary: System.String;
      FSummaryStored: Boolean;
      FDescription: System.String;
      FDescriptionStored: Boolean;
      FExternalDocs: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ExternalDocumentation;
      FExternalDocsStored: Boolean;
      FOperationId: System.String;
      FOperationIdStored: Boolean;
      FParameters: System.TArray<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation.TParametersTypeArray>;
      FParametersStored: Boolean;
      FRequestBody: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation.TRequestBodyType;
      FRequestBodyStored: Boolean;
      FResponses: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Responses;
      FCallbacks: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation.TCallbacksType;
      FCallbacksStored: Boolean;
      FDeprecated: System.Boolean;
      FDeprecatedStored: Boolean;
      FSecurity: System.TArray<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.SecurityRequirement>;
      FSecurityStored: Boolean;
      FServers: System.TArray<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Server>;
      FServersStored: Boolean;
      FPatternProperty13: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue>;
      procedure SetTags(const Value: System.TArray<System.String>);
      procedure SetSummary(const Value: System.String);
      procedure SetDescription(const Value: System.String);
      function GetExternalDocs: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ExternalDocumentation;
      procedure SetExternalDocs(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ExternalDocumentation);
      procedure SetOperationId(const Value: System.String);
      procedure SetParameters(const Value: System.TArray<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation.TParametersTypeArray>);
      function GetRequestBody: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation.TRequestBodyType;
      procedure SetRequestBody(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation.TRequestBodyType);
      function GetResponses: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Responses;
      function GetCallbacks: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation.TCallbacksType;
      procedure SetCallbacks(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation.TCallbacksType);
      procedure SetDeprecated(const Value: System.Boolean);
      procedure SetSecurity(const Value: System.TArray<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.SecurityRequirement>);
      procedure SetServers(const Value: System.TArray<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Server>);
    public
      destructor Destroy; override;

      procedure AddTags(const Value: System.String);
      function AddParameters: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation.TParametersTypeArray;
      function AddSecurity: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.SecurityRequirement;
      function AddServers: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Server;
      procedure AddPatternProperty13(const Name: String; const Value: System.Rtti.TValue);

      property IsTagsStored: Boolean read FTagsStored;
      property IsSummaryStored: Boolean read FSummaryStored;
      property IsDescriptionStored: Boolean read FDescriptionStored;
      property IsExternalDocsStored: Boolean read FExternalDocsStored;
      property IsOperationIdStored: Boolean read FOperationIdStored;
      property IsParametersStored: Boolean read FParametersStored;
      property IsRequestBodyStored: Boolean read FRequestBodyStored;
      property IsCallbacksStored: Boolean read FCallbacksStored;
      property IsDeprecatedStored: Boolean read FDeprecatedStored;
      property IsSecurityStored: Boolean read FSecurityStored;
      property IsServersStored: Boolean read FServersStored;
    published
      property tags: System.TArray<System.String> read FTags write SetTags stored FTagsStored;
      property summary: System.String read FSummary write SetSummary stored FSummaryStored;
      property description: System.String read FDescription write SetDescription stored FDescriptionStored;
      property externalDocs: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ExternalDocumentation read GetExternalDocs write SetExternalDocs stored FExternalDocsStored;
      property operationId: System.String read FOperationId write SetOperationId stored FOperationIdStored;
      property parameters: System.TArray<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation.TParametersTypeArray> read FParameters write SetParameters stored FParametersStored;
      property requestBody: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation.TRequestBodyType read GetRequestBody write SetRequestBody stored FRequestBodyStored;
      property responses: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Responses read GetResponses write FResponses;
      property callbacks: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation.TCallbacksType read GetCallbacks write SetCallbacks stored FCallbacksStored;
      property deprecated: System.Boolean read FDeprecated write SetDeprecated stored FDeprecatedStored;
      property security: System.TArray<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.SecurityRequirement> read FSecurity write SetSecurity stored FSecurityStored;
      property servers: System.TArray<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Server> read FServers write SetServers stored FServersStored;
      [PatternProperty('^x-')]
      property PatternProperty13: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue> read FPatternProperty13 write FPatternProperty13;
    end;

    Responses = class
    public type
      TDefaultType = class;
      TPatternProperty2Type = class;

      [Flat]
      TDefaultType = class
      private
        FResponse: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Response;
        FResponseStored: Boolean;
        FReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
        FReferenceStored: Boolean;
        function GetResponse: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Response;
        procedure SetResponse(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Response);
        function GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
        procedure SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
      public
        destructor Destroy; override;

        property IsResponseStored: Boolean read FResponseStored;
        property IsReferenceStored: Boolean read FReferenceStored;
      published
        property Response: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Response read GetResponse write SetResponse stored FResponseStored;
        property Reference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference read GetReference write SetReference stored FReferenceStored;
      end;

      [Flat]
      TPatternProperty2Type = class
      private
        FResponse: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Response;
        FResponseStored: Boolean;
        FReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
        FReferenceStored: Boolean;
        function GetResponse: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Response;
        procedure SetResponse(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Response);
        function GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
        procedure SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
      public
        destructor Destroy; override;

        property IsResponseStored: Boolean read FResponseStored;
        property IsReferenceStored: Boolean read FReferenceStored;
      published
        property Response: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Response read GetResponse write SetResponse stored FResponseStored;
        property Reference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference read GetReference write SetReference stored FReferenceStored;
      end;
    private
      FDefault: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Responses.TDefaultType;
      FDefaultStored: Boolean;
      FPatternProperty2: Blue.Print.Types.TDynamicProperty<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Responses.TPatternProperty2Type>;
      FPatternProperty3: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue>;
      function GetDefault: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Responses.TDefaultType;
      procedure SetDefault(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Responses.TDefaultType);
    public
      destructor Destroy; override;

      function AddPatternProperty2(const Name: String): Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Responses.TPatternProperty2Type;
      procedure AddPatternProperty3(const Name: String; const Value: System.Rtti.TValue);

      property IsDefaultStored: Boolean read FDefaultStored;
    published
      property default: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Responses.TDefaultType read GetDefault write SetDefault stored FDefaultStored;
      [PatternProperty('^[1-5](?:\d{2}|XX)$')]
      property PatternProperty2: Blue.Print.Types.TDynamicProperty<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Responses.TPatternProperty2Type> read FPatternProperty2 write FPatternProperty2;
      [PatternProperty('^x-')]
      property PatternProperty3: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue> read FPatternProperty3 write FPatternProperty3;
    end;

    SecurityRequirement = class
    private
      FAdditionalProperties: Blue.Print.Types.TDynamicProperty<System.TArray<System.String>>;
    public
      procedure AddAdditionalProperties(const Name: String; const Value: System.TArray<System.String>);
    published
      property additionalProperties: Blue.Print.Types.TDynamicProperty<System.TArray<System.String>> read FAdditionalProperties write FAdditionalProperties;
    end;

    Tag = class
    private
      FName: System.String;
      FDescription: System.String;
      FDescriptionStored: Boolean;
      FExternalDocs: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ExternalDocumentation;
      FExternalDocsStored: Boolean;
      FPatternProperty4: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue>;
      procedure SetDescription(const Value: System.String);
      function GetExternalDocs: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ExternalDocumentation;
      procedure SetExternalDocs(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ExternalDocumentation);
    public
      destructor Destroy; override;

      procedure AddPatternProperty4(const Name: String; const Value: System.Rtti.TValue);

      property IsDescriptionStored: Boolean read FDescriptionStored;
      property IsExternalDocsStored: Boolean read FExternalDocsStored;
    published
      property name: System.String read FName write FName;
      property description: System.String read FDescription write SetDescription stored FDescriptionStored;
      property externalDocs: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ExternalDocumentation read GetExternalDocs write SetExternalDocs stored FExternalDocsStored;
      [PatternProperty('^x-')]
      property PatternProperty4: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue> read FPatternProperty4 write FPatternProperty4;
    end;

    ExternalDocumentation = class
    private
      FDescription: System.String;
      FDescriptionStored: Boolean;
      FUrl: System.String;
      FPatternProperty3: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue>;
      procedure SetDescription(const Value: System.String);
    public
      procedure AddPatternProperty3(const Name: String; const Value: System.Rtti.TValue);

      property IsDescriptionStored: Boolean read FDescriptionStored;
    published
      property description: System.String read FDescription write SetDescription stored FDescriptionStored;
      property url: System.String read FUrl write FUrl;
      [PatternProperty('^x-')]
      property PatternProperty3: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue> read FPatternProperty3 write FPatternProperty3;
    end;

    [Flat]
    SchemaXORContent = class
    public type
      TOneOf2Type = class;

      [Flat]
      TOneOf2Type = class
      private
        FAllOf: System.Rtti.TValue;
        FAllOf2: System.Rtti.TValue;
        FAllOf3: System.Rtti.TValue;
        FAllOf4: System.Rtti.TValue;
        FAllOf5: System.Rtti.TValue;
      published
        property AllOf: System.Rtti.TValue read FAllOf write FAllOf;
        property AllOf2: System.Rtti.TValue read FAllOf2 write FAllOf2;
        property AllOf3: System.Rtti.TValue read FAllOf3 write FAllOf3;
        property AllOf4: System.Rtti.TValue read FAllOf4 write FAllOf4;
        property AllOf5: System.Rtti.TValue read FAllOf5 write FAllOf5;
      end;
    private
      FOneOf: System.Rtti.TValue;
      FOneOfStored: Boolean;
      FOneOf2: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.SchemaXORContent.TOneOf2Type;
      FOneOf2Stored: Boolean;
      procedure SetOneOf(const Value: System.Rtti.TValue);
      function GetOneOf2: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.SchemaXORContent.TOneOf2Type;
      procedure SetOneOf2(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.SchemaXORContent.TOneOf2Type);
    public
      destructor Destroy; override;

      property IsOneOfStored: Boolean read FOneOfStored;
      property IsOneOf2Stored: Boolean read FOneOf2Stored;
    published
      property OneOf: System.Rtti.TValue read FOneOf write SetOneOf stored FOneOfStored;
      property OneOf2: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.SchemaXORContent.TOneOf2Type read GetOneOf2 write SetOneOf2 stored FOneOf2Stored;
    end;

    Parameter = class
    public type
      TSchemaType = class;
      TContentType = class;
      TExamplesType = class;

      [Flat]
      TSchemaType = class
      private
        FSchema: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema;
        FSchemaStored: Boolean;
        FReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
        FReferenceStored: Boolean;
        function GetSchema: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema;
        procedure SetSchema(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema);
        function GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
        procedure SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
      public
        destructor Destroy; override;

        property IsSchemaStored: Boolean read FSchemaStored;
        property IsReferenceStored: Boolean read FReferenceStored;
      published
        property Schema: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema read GetSchema write SetSchema stored FSchemaStored;
        property Reference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference read GetReference write SetReference stored FReferenceStored;
      end;

      TContentType = class
      private
        FAdditionalProperties: Blue.Print.Types.TDynamicProperty<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.MediaType>;
      public
        destructor Destroy; override;

        function AddAdditionalProperties(const Name: String): Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.MediaType;
      published
        property additionalProperties: Blue.Print.Types.TDynamicProperty<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.MediaType> read FAdditionalProperties write FAdditionalProperties;
      end;

      TExamplesType = class
      public type
        TAdditionalPropertiesType = class;

        [Flat]
        TAdditionalPropertiesType = class
        private
          FExample: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Example;
          FExampleStored: Boolean;
          FReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
          FReferenceStored: Boolean;
          function GetExample: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Example;
          procedure SetExample(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Example);
          function GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
          procedure SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
        public
          destructor Destroy; override;

          property IsExampleStored: Boolean read FExampleStored;
          property IsReferenceStored: Boolean read FReferenceStored;
        published
          property Example: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Example read GetExample write SetExample stored FExampleStored;
          property Reference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference read GetReference write SetReference stored FReferenceStored;
        end;
      private
        FAdditionalProperties: Blue.Print.Types.TDynamicProperty<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Parameter.TExamplesType.TAdditionalPropertiesType>;
      public
        destructor Destroy; override;

        function AddAdditionalProperties(const Name: String): Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Parameter.TExamplesType.TAdditionalPropertiesType;
      published
        property additionalProperties: Blue.Print.Types.TDynamicProperty<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Parameter.TExamplesType.TAdditionalPropertiesType> read FAdditionalProperties write FAdditionalProperties;
      end;
    private
      FName: System.String;
      FIn: System.String;
      FDescription: System.String;
      FDescriptionStored: Boolean;
      FRequired: System.Boolean;
      FRequiredStored: Boolean;
      FDeprecated: System.Boolean;
      FDeprecatedStored: Boolean;
      FAllowEmptyValue: System.Boolean;
      FAllowEmptyValueStored: Boolean;
      FStyle: System.String;
      FStyleStored: Boolean;
      FExplode: System.Boolean;
      FExplodeStored: Boolean;
      FAllowReserved: System.Boolean;
      FAllowReservedStored: Boolean;
      FSchema: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Parameter.TSchemaType;
      FSchemaStored: Boolean;
      FContent: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Parameter.TContentType;
      FContentStored: Boolean;
      FExample: System.Rtti.TValue;
      FExampleStored: Boolean;
      FExamples: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Parameter.TExamplesType;
      FExamplesStored: Boolean;
      FPatternProperty14: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue>;
      procedure SetDescription(const Value: System.String);
      procedure SetRequired(const Value: System.Boolean);
      procedure SetDeprecated(const Value: System.Boolean);
      procedure SetAllowEmptyValue(const Value: System.Boolean);
      procedure SetStyle(const Value: System.String);
      procedure SetExplode(const Value: System.Boolean);
      procedure SetAllowReserved(const Value: System.Boolean);
      function GetSchema: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Parameter.TSchemaType;
      procedure SetSchema(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Parameter.TSchemaType);
      function GetContent: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Parameter.TContentType;
      procedure SetContent(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Parameter.TContentType);
      procedure SetExample(const Value: System.Rtti.TValue);
      function GetExamples: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Parameter.TExamplesType;
      procedure SetExamples(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Parameter.TExamplesType);
    public
      destructor Destroy; override;

      procedure AddPatternProperty14(const Name: String; const Value: System.Rtti.TValue);

      property IsDescriptionStored: Boolean read FDescriptionStored;
      property IsRequiredStored: Boolean read FRequiredStored;
      property IsDeprecatedStored: Boolean read FDeprecatedStored;
      property IsAllowEmptyValueStored: Boolean read FAllowEmptyValueStored;
      property IsStyleStored: Boolean read FStyleStored;
      property IsExplodeStored: Boolean read FExplodeStored;
      property IsAllowReservedStored: Boolean read FAllowReservedStored;
      property IsSchemaStored: Boolean read FSchemaStored;
      property IsContentStored: Boolean read FContentStored;
      property IsExampleStored: Boolean read FExampleStored;
      property IsExamplesStored: Boolean read FExamplesStored;
    published
      property name: System.String read FName write FName;
      [FieldName('in')]
      property &in: System.String read FIn write FIn;
      property description: System.String read FDescription write SetDescription stored FDescriptionStored;
      property required: System.Boolean read FRequired write SetRequired stored FRequiredStored;
      property deprecated: System.Boolean read FDeprecated write SetDeprecated stored FDeprecatedStored;
      property allowEmptyValue: System.Boolean read FAllowEmptyValue write SetAllowEmptyValue stored FAllowEmptyValueStored;
      property style: System.String read FStyle write SetStyle stored FStyleStored;
      property explode: System.Boolean read FExplode write SetExplode stored FExplodeStored;
      property allowReserved: System.Boolean read FAllowReserved write SetAllowReserved stored FAllowReservedStored;
      property schema: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Parameter.TSchemaType read GetSchema write SetSchema stored FSchemaStored;
      property content: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Parameter.TContentType read GetContent write SetContent stored FContentStored;
      property example: System.Rtti.TValue read FExample write SetExample stored FExampleStored;
      property examples: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Parameter.TExamplesType read GetExamples write SetExamples stored FExamplesStored;
      [PatternProperty('^x-')]
      property PatternProperty14: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue> read FPatternProperty14 write FPatternProperty14;
    end;

    PathParameter = class
    public type
      TInType = (path);

      [EnumValue('matrix, label, simple')]
      TStyleType = (matrix, &label, simple);

      [EnumValue('True')]
      TRequiredType = (True);
    private
      FIn: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.PathParameter.TInType;
      FInStored: Boolean;
      FStyle: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.PathParameter.TStyleType;
      FStyleStored: Boolean;
      FRequired: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.PathParameter.TRequiredType;
      procedure SetIn(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.PathParameter.TInType);
      procedure SetStyle(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.PathParameter.TStyleType);
    public
      property IsInStored: Boolean read FInStored;
      property IsStyleStored: Boolean read FStyleStored;
    published
      [FieldName('in')]
      property &in: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.PathParameter.TInType read FIn write SetIn stored FInStored;
      property style: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.PathParameter.TStyleType read FStyle write SetStyle stored FStyleStored;
      property required: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.PathParameter.TRequiredType read FRequired write FRequired;
    end;

    QueryParameter = class
    public type
      TInType = (query);

      TStyleType = (form, spaceDelimited, pipeDelimited, deepObject);
    private
      FIn: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.QueryParameter.TInType;
      FInStored: Boolean;
      FStyle: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.QueryParameter.TStyleType;
      FStyleStored: Boolean;
      procedure SetIn(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.QueryParameter.TInType);
      procedure SetStyle(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.QueryParameter.TStyleType);
    public
      property IsInStored: Boolean read FInStored;
      property IsStyleStored: Boolean read FStyleStored;
    published
      [FieldName('in')]
      property &in: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.QueryParameter.TInType read FIn write SetIn stored FInStored;
      property style: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.QueryParameter.TStyleType read FStyle write SetStyle stored FStyleStored;
    end;

    HeaderParameter = class
    public type
      TInType = (header);

      TStyleType = (simple);
    private
      FIn: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.HeaderParameter.TInType;
      FInStored: Boolean;
      FStyle: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.HeaderParameter.TStyleType;
      FStyleStored: Boolean;
      procedure SetIn(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.HeaderParameter.TInType);
      procedure SetStyle(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.HeaderParameter.TStyleType);
    public
      property IsInStored: Boolean read FInStored;
      property IsStyleStored: Boolean read FStyleStored;
    published
      [FieldName('in')]
      property &in: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.HeaderParameter.TInType read FIn write SetIn stored FInStored;
      property style: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.HeaderParameter.TStyleType read FStyle write SetStyle stored FStyleStored;
    end;

    CookieParameter = class
    public type
      TInType = (cookie);

      TStyleType = (form);
    private
      FIn: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.CookieParameter.TInType;
      FInStored: Boolean;
      FStyle: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.CookieParameter.TStyleType;
      FStyleStored: Boolean;
      procedure SetIn(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.CookieParameter.TInType);
      procedure SetStyle(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.CookieParameter.TStyleType);
    public
      property IsInStored: Boolean read FInStored;
      property IsStyleStored: Boolean read FStyleStored;
    published
      [FieldName('in')]
      property &in: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.CookieParameter.TInType read FIn write SetIn stored FInStored;
      property style: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.CookieParameter.TStyleType read FStyle write SetStyle stored FStyleStored;
    end;

    RequestBody = class
    public type
      TContentType = class;

      TContentType = class
      private
        FAdditionalProperties: Blue.Print.Types.TDynamicProperty<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.MediaType>;
      public
        destructor Destroy; override;

        function AddAdditionalProperties(const Name: String): Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.MediaType;
      published
        property additionalProperties: Blue.Print.Types.TDynamicProperty<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.MediaType> read FAdditionalProperties write FAdditionalProperties;
      end;
    private
      FDescription: System.String;
      FDescriptionStored: Boolean;
      FContent: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.RequestBody.TContentType;
      FRequired: System.Boolean;
      FRequiredStored: Boolean;
      FPatternProperty4: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue>;
      procedure SetDescription(const Value: System.String);
      function GetContent: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.RequestBody.TContentType;
      procedure SetRequired(const Value: System.Boolean);
    public
      destructor Destroy; override;

      procedure AddPatternProperty4(const Name: String; const Value: System.Rtti.TValue);

      property IsDescriptionStored: Boolean read FDescriptionStored;
      property IsRequiredStored: Boolean read FRequiredStored;
    published
      property description: System.String read FDescription write SetDescription stored FDescriptionStored;
      property content: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.RequestBody.TContentType read GetContent write FContent;
      property required: System.Boolean read FRequired write SetRequired stored FRequiredStored;
      [PatternProperty('^x-')]
      property PatternProperty4: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue> read FPatternProperty4 write FPatternProperty4;
    end;

    [Flat]
    SecurityScheme = class
    private
      FAPIKeySecurityScheme: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.APIKeySecurityScheme;
      FAPIKeySecuritySchemeStored: Boolean;
      FHTTPSecurityScheme: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.HTTPSecurityScheme;
      FHTTPSecuritySchemeStored: Boolean;
      FOAuth2SecurityScheme: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.OAuth2SecurityScheme;
      FOAuth2SecuritySchemeStored: Boolean;
      FOpenIdConnectSecurityScheme: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.OpenIdConnectSecurityScheme;
      FOpenIdConnectSecuritySchemeStored: Boolean;
      function GetAPIKeySecurityScheme: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.APIKeySecurityScheme;
      procedure SetAPIKeySecurityScheme(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.APIKeySecurityScheme);
      function GetHTTPSecurityScheme: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.HTTPSecurityScheme;
      procedure SetHTTPSecurityScheme(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.HTTPSecurityScheme);
      function GetOAuth2SecurityScheme: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.OAuth2SecurityScheme;
      procedure SetOAuth2SecurityScheme(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.OAuth2SecurityScheme);
      function GetOpenIdConnectSecurityScheme: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.OpenIdConnectSecurityScheme;
      procedure SetOpenIdConnectSecurityScheme(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.OpenIdConnectSecurityScheme);
    public
      destructor Destroy; override;

      property IsAPIKeySecuritySchemeStored: Boolean read FAPIKeySecuritySchemeStored;
      property IsHTTPSecuritySchemeStored: Boolean read FHTTPSecuritySchemeStored;
      property IsOAuth2SecuritySchemeStored: Boolean read FOAuth2SecuritySchemeStored;
      property IsOpenIdConnectSecuritySchemeStored: Boolean read FOpenIdConnectSecuritySchemeStored;
    published
      property APIKeySecurityScheme: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.APIKeySecurityScheme read GetAPIKeySecurityScheme write SetAPIKeySecurityScheme stored FAPIKeySecuritySchemeStored;
      property HTTPSecurityScheme: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.HTTPSecurityScheme read GetHTTPSecurityScheme write SetHTTPSecurityScheme stored FHTTPSecuritySchemeStored;
      property OAuth2SecurityScheme: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.OAuth2SecurityScheme read GetOAuth2SecurityScheme write SetOAuth2SecurityScheme stored FOAuth2SecuritySchemeStored;
      property OpenIdConnectSecurityScheme: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.OpenIdConnectSecurityScheme read GetOpenIdConnectSecurityScheme write SetOpenIdConnectSecurityScheme stored FOpenIdConnectSecuritySchemeStored;
    end;

    APIKeySecurityScheme = class
    public type
      TTypeType = (apiKey);

      TInType = (header, query, cookie);
    private
      FType: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.APIKeySecurityScheme.TTypeType;
      FName: System.String;
      FIn: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.APIKeySecurityScheme.TInType;
      FDescription: System.String;
      FDescriptionStored: Boolean;
      FPatternProperty5: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue>;
      procedure SetDescription(const Value: System.String);
    public
      procedure AddPatternProperty5(const Name: String; const Value: System.Rtti.TValue);

      property IsDescriptionStored: Boolean read FDescriptionStored;
    published
      [FieldName('type')]
      property &type: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.APIKeySecurityScheme.TTypeType read FType write FType;
      property name: System.String read FName write FName;
      [FieldName('in')]
      property &in: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.APIKeySecurityScheme.TInType read FIn write FIn;
      property description: System.String read FDescription write SetDescription stored FDescriptionStored;
      [PatternProperty('^x-')]
      property PatternProperty5: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue> read FPatternProperty5 write FPatternProperty5;
    end;

    HTTPSecurityScheme = class
    public type
      TTypeType = (http);
    private
      FScheme: System.String;
      FBearerFormat: System.String;
      FBearerFormatStored: Boolean;
      FDescription: System.String;
      FDescriptionStored: Boolean;
      FType: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.HTTPSecurityScheme.TTypeType;
      FPatternProperty5: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue>;
      procedure SetBearerFormat(const Value: System.String);
      procedure SetDescription(const Value: System.String);
    public
      procedure AddPatternProperty5(const Name: String; const Value: System.Rtti.TValue);

      property IsBearerFormatStored: Boolean read FBearerFormatStored;
      property IsDescriptionStored: Boolean read FDescriptionStored;
    published
      property scheme: System.String read FScheme write FScheme;
      property bearerFormat: System.String read FBearerFormat write SetBearerFormat stored FBearerFormatStored;
      property description: System.String read FDescription write SetDescription stored FDescriptionStored;
      [FieldName('type')]
      property &type: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.HTTPSecurityScheme.TTypeType read FType write FType;
      [PatternProperty('^x-')]
      property PatternProperty5: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue> read FPatternProperty5 write FPatternProperty5;
    end;

    OAuth2SecurityScheme = class
    public type
      TTypeType = (oauth2);
    private
      FType: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.OAuth2SecurityScheme.TTypeType;
      FFlows: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.OAuthFlows;
      FDescription: System.String;
      FDescriptionStored: Boolean;
      FPatternProperty4: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue>;
      function GetFlows: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.OAuthFlows;
      procedure SetDescription(const Value: System.String);
    public
      destructor Destroy; override;

      procedure AddPatternProperty4(const Name: String; const Value: System.Rtti.TValue);

      property IsDescriptionStored: Boolean read FDescriptionStored;
    published
      [FieldName('type')]
      property &type: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.OAuth2SecurityScheme.TTypeType read FType write FType;
      property flows: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.OAuthFlows read GetFlows write FFlows;
      property description: System.String read FDescription write SetDescription stored FDescriptionStored;
      [PatternProperty('^x-')]
      property PatternProperty4: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue> read FPatternProperty4 write FPatternProperty4;
    end;

    OpenIdConnectSecurityScheme = class
    public type
      TTypeType = (openIdConnect);
    private
      FType: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.OpenIdConnectSecurityScheme.TTypeType;
      FOpenIdConnectUrl: System.String;
      FDescription: System.String;
      FDescriptionStored: Boolean;
      FPatternProperty4: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue>;
      procedure SetDescription(const Value: System.String);
    public
      procedure AddPatternProperty4(const Name: String; const Value: System.Rtti.TValue);

      property IsDescriptionStored: Boolean read FDescriptionStored;
    published
      [FieldName('type')]
      property &type: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.OpenIdConnectSecurityScheme.TTypeType read FType write FType;
      property openIdConnectUrl: System.String read FOpenIdConnectUrl write FOpenIdConnectUrl;
      property description: System.String read FDescription write SetDescription stored FDescriptionStored;
      [PatternProperty('^x-')]
      property PatternProperty4: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue> read FPatternProperty4 write FPatternProperty4;
    end;

    OAuthFlows = class
    private
      FImplicit: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ImplicitOAuthFlow;
      FImplicitStored: Boolean;
      FPassword: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.PasswordOAuthFlow;
      FPasswordStored: Boolean;
      FClientCredentials: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ClientCredentialsFlow;
      FClientCredentialsStored: Boolean;
      FAuthorizationCode: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.AuthorizationCodeOAuthFlow;
      FAuthorizationCodeStored: Boolean;
      FPatternProperty5: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue>;
      function GetImplicit: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ImplicitOAuthFlow;
      procedure SetImplicit(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ImplicitOAuthFlow);
      function GetPassword: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.PasswordOAuthFlow;
      procedure SetPassword(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.PasswordOAuthFlow);
      function GetClientCredentials: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ClientCredentialsFlow;
      procedure SetClientCredentials(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ClientCredentialsFlow);
      function GetAuthorizationCode: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.AuthorizationCodeOAuthFlow;
      procedure SetAuthorizationCode(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.AuthorizationCodeOAuthFlow);
    public
      destructor Destroy; override;

      procedure AddPatternProperty5(const Name: String; const Value: System.Rtti.TValue);

      property IsImplicitStored: Boolean read FImplicitStored;
      property IsPasswordStored: Boolean read FPasswordStored;
      property IsClientCredentialsStored: Boolean read FClientCredentialsStored;
      property IsAuthorizationCodeStored: Boolean read FAuthorizationCodeStored;
    published
      property implicit: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ImplicitOAuthFlow read GetImplicit write SetImplicit stored FImplicitStored;
      property password: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.PasswordOAuthFlow read GetPassword write SetPassword stored FPasswordStored;
      property clientCredentials: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ClientCredentialsFlow read GetClientCredentials write SetClientCredentials stored FClientCredentialsStored;
      property authorizationCode: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.AuthorizationCodeOAuthFlow read GetAuthorizationCode write SetAuthorizationCode stored FAuthorizationCodeStored;
      [PatternProperty('^x-')]
      property PatternProperty5: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue> read FPatternProperty5 write FPatternProperty5;
    end;

    ImplicitOAuthFlow = class
    public type
      TScopesType = class;

      TScopesType = class
      private
        FAdditionalProperties: Blue.Print.Types.TDynamicProperty<System.String>;
      public
        procedure AddAdditionalProperties(const Name: String; const Value: System.String);
      published
        property additionalProperties: Blue.Print.Types.TDynamicProperty<System.String> read FAdditionalProperties write FAdditionalProperties;
      end;
    private
      FAuthorizationUrl: System.String;
      FRefreshUrl: System.String;
      FRefreshUrlStored: Boolean;
      FScopes: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ImplicitOAuthFlow.TScopesType;
      FPatternProperty4: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue>;
      procedure SetRefreshUrl(const Value: System.String);
      function GetScopes: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ImplicitOAuthFlow.TScopesType;
    public
      destructor Destroy; override;

      procedure AddPatternProperty4(const Name: String; const Value: System.Rtti.TValue);

      property IsRefreshUrlStored: Boolean read FRefreshUrlStored;
    published
      property authorizationUrl: System.String read FAuthorizationUrl write FAuthorizationUrl;
      property refreshUrl: System.String read FRefreshUrl write SetRefreshUrl stored FRefreshUrlStored;
      property scopes: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ImplicitOAuthFlow.TScopesType read GetScopes write FScopes;
      [PatternProperty('^x-')]
      property PatternProperty4: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue> read FPatternProperty4 write FPatternProperty4;
    end;

    PasswordOAuthFlow = class
    public type
      TScopesType = class;

      TScopesType = class
      private
        FAdditionalProperties: Blue.Print.Types.TDynamicProperty<System.String>;
      public
        procedure AddAdditionalProperties(const Name: String; const Value: System.String);
      published
        property additionalProperties: Blue.Print.Types.TDynamicProperty<System.String> read FAdditionalProperties write FAdditionalProperties;
      end;
    private
      FTokenUrl: System.String;
      FRefreshUrl: System.String;
      FRefreshUrlStored: Boolean;
      FScopes: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.PasswordOAuthFlow.TScopesType;
      FPatternProperty4: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue>;
      procedure SetRefreshUrl(const Value: System.String);
      function GetScopes: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.PasswordOAuthFlow.TScopesType;
    public
      destructor Destroy; override;

      procedure AddPatternProperty4(const Name: String; const Value: System.Rtti.TValue);

      property IsRefreshUrlStored: Boolean read FRefreshUrlStored;
    published
      property tokenUrl: System.String read FTokenUrl write FTokenUrl;
      property refreshUrl: System.String read FRefreshUrl write SetRefreshUrl stored FRefreshUrlStored;
      property scopes: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.PasswordOAuthFlow.TScopesType read GetScopes write FScopes;
      [PatternProperty('^x-')]
      property PatternProperty4: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue> read FPatternProperty4 write FPatternProperty4;
    end;

    ClientCredentialsFlow = class
    public type
      TScopesType = class;

      TScopesType = class
      private
        FAdditionalProperties: Blue.Print.Types.TDynamicProperty<System.String>;
      public
        procedure AddAdditionalProperties(const Name: String; const Value: System.String);
      published
        property additionalProperties: Blue.Print.Types.TDynamicProperty<System.String> read FAdditionalProperties write FAdditionalProperties;
      end;
    private
      FTokenUrl: System.String;
      FRefreshUrl: System.String;
      FRefreshUrlStored: Boolean;
      FScopes: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ClientCredentialsFlow.TScopesType;
      FPatternProperty4: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue>;
      procedure SetRefreshUrl(const Value: System.String);
      function GetScopes: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ClientCredentialsFlow.TScopesType;
    public
      destructor Destroy; override;

      procedure AddPatternProperty4(const Name: String; const Value: System.Rtti.TValue);

      property IsRefreshUrlStored: Boolean read FRefreshUrlStored;
    published
      property tokenUrl: System.String read FTokenUrl write FTokenUrl;
      property refreshUrl: System.String read FRefreshUrl write SetRefreshUrl stored FRefreshUrlStored;
      property scopes: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ClientCredentialsFlow.TScopesType read GetScopes write FScopes;
      [PatternProperty('^x-')]
      property PatternProperty4: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue> read FPatternProperty4 write FPatternProperty4;
    end;

    AuthorizationCodeOAuthFlow = class
    public type
      TScopesType = class;

      TScopesType = class
      private
        FAdditionalProperties: Blue.Print.Types.TDynamicProperty<System.String>;
      public
        procedure AddAdditionalProperties(const Name: String; const Value: System.String);
      published
        property additionalProperties: Blue.Print.Types.TDynamicProperty<System.String> read FAdditionalProperties write FAdditionalProperties;
      end;
    private
      FAuthorizationUrl: System.String;
      FTokenUrl: System.String;
      FRefreshUrl: System.String;
      FRefreshUrlStored: Boolean;
      FScopes: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.AuthorizationCodeOAuthFlow.TScopesType;
      FPatternProperty5: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue>;
      procedure SetRefreshUrl(const Value: System.String);
      function GetScopes: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.AuthorizationCodeOAuthFlow.TScopesType;
    public
      destructor Destroy; override;

      procedure AddPatternProperty5(const Name: String; const Value: System.Rtti.TValue);

      property IsRefreshUrlStored: Boolean read FRefreshUrlStored;
    published
      property authorizationUrl: System.String read FAuthorizationUrl write FAuthorizationUrl;
      property tokenUrl: System.String read FTokenUrl write FTokenUrl;
      property refreshUrl: System.String read FRefreshUrl write SetRefreshUrl stored FRefreshUrlStored;
      property scopes: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.AuthorizationCodeOAuthFlow.TScopesType read GetScopes write FScopes;
      [PatternProperty('^x-')]
      property PatternProperty5: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue> read FPatternProperty5 write FPatternProperty5;
    end;

    Link = class
    public type
      TParametersType = class;

      TParametersType = class
      private
        FAdditionalProperties: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue>;
      public
        procedure AddAdditionalProperties(const Name: String; const Value: System.Rtti.TValue);
      published
        property additionalProperties: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue> read FAdditionalProperties write FAdditionalProperties;
      end;
    private
      FOperationId: System.String;
      FOperationIdStored: Boolean;
      FOperationRef: System.String;
      FOperationRefStored: Boolean;
      FParameters: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Link.TParametersType;
      FParametersStored: Boolean;
      FRequestBody: System.Rtti.TValue;
      FRequestBodyStored: Boolean;
      FDescription: System.String;
      FDescriptionStored: Boolean;
      FServer: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Server;
      FServerStored: Boolean;
      FPatternProperty7: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue>;
      procedure SetOperationId(const Value: System.String);
      procedure SetOperationRef(const Value: System.String);
      function GetParameters: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Link.TParametersType;
      procedure SetParameters(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Link.TParametersType);
      procedure SetRequestBody(const Value: System.Rtti.TValue);
      procedure SetDescription(const Value: System.String);
      function GetServer: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Server;
      procedure SetServer(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Server);
    public
      destructor Destroy; override;

      procedure AddPatternProperty7(const Name: String; const Value: System.Rtti.TValue);

      property IsOperationIdStored: Boolean read FOperationIdStored;
      property IsOperationRefStored: Boolean read FOperationRefStored;
      property IsParametersStored: Boolean read FParametersStored;
      property IsRequestBodyStored: Boolean read FRequestBodyStored;
      property IsDescriptionStored: Boolean read FDescriptionStored;
      property IsServerStored: Boolean read FServerStored;
    published
      property operationId: System.String read FOperationId write SetOperationId stored FOperationIdStored;
      property operationRef: System.String read FOperationRef write SetOperationRef stored FOperationRefStored;
      property parameters: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Link.TParametersType read GetParameters write SetParameters stored FParametersStored;
      property requestBody: System.Rtti.TValue read FRequestBody write SetRequestBody stored FRequestBodyStored;
      property description: System.String read FDescription write SetDescription stored FDescriptionStored;
      property server: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Server read GetServer write SetServer stored FServerStored;
      [PatternProperty('^x-')]
      property PatternProperty7: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue> read FPatternProperty7 write FPatternProperty7;
    end;

    Callback = class
    private
      FAdditionalProperties: Blue.Print.Types.TDynamicProperty<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.PathItem>;
      FPatternProperty2: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue>;
    public
      destructor Destroy; override;

      function AddAdditionalProperties(const Name: String): Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.PathItem;
      procedure AddPatternProperty2(const Name: String; const Value: System.Rtti.TValue);
    published
      property additionalProperties: Blue.Print.Types.TDynamicProperty<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.PathItem> read FAdditionalProperties write FAdditionalProperties;
      [PatternProperty('^x-')]
      property PatternProperty2: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue> read FPatternProperty2 write FPatternProperty2;
    end;

    Encoding = class
    public type
      TStyleType = (form, spaceDelimited, pipeDelimited, deepObject);

      THeadersType = class;

      THeadersType = class
      public type
        TAdditionalPropertiesType = class;

        [Flat]
        TAdditionalPropertiesType = class
        private
          FHeader: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Header;
          FHeaderStored: Boolean;
          FReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
          FReferenceStored: Boolean;
          function GetHeader: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Header;
          procedure SetHeader(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Header);
          function GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
          procedure SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
        public
          destructor Destroy; override;

          property IsHeaderStored: Boolean read FHeaderStored;
          property IsReferenceStored: Boolean read FReferenceStored;
        published
          property Header: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Header read GetHeader write SetHeader stored FHeaderStored;
          property Reference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference read GetReference write SetReference stored FReferenceStored;
        end;
      private
        FAdditionalProperties: Blue.Print.Types.TDynamicProperty<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Encoding.THeadersType.TAdditionalPropertiesType>;
      public
        destructor Destroy; override;

        function AddAdditionalProperties(const Name: String): Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Encoding.THeadersType.TAdditionalPropertiesType;
      published
        property additionalProperties: Blue.Print.Types.TDynamicProperty<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Encoding.THeadersType.TAdditionalPropertiesType> read FAdditionalProperties write FAdditionalProperties;
      end;
    private
      FContentType: System.String;
      FContentTypeStored: Boolean;
      FHeaders: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Encoding.THeadersType;
      FHeadersStored: Boolean;
      FStyle: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Encoding.TStyleType;
      FStyleStored: Boolean;
      FExplode: System.Boolean;
      FExplodeStored: Boolean;
      FAllowReserved: System.Boolean;
      FAllowReservedStored: Boolean;
      FPatternProperty6: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue>;
      procedure SetContentType(const Value: System.String);
      function GetHeaders: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Encoding.THeadersType;
      procedure SetHeaders(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Encoding.THeadersType);
      procedure SetStyle(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Encoding.TStyleType);
      procedure SetExplode(const Value: System.Boolean);
      procedure SetAllowReserved(const Value: System.Boolean);
    public
      destructor Destroy; override;

      procedure AddPatternProperty6(const Name: String; const Value: System.Rtti.TValue);

      property IsContentTypeStored: Boolean read FContentTypeStored;
      property IsHeadersStored: Boolean read FHeadersStored;
      property IsStyleStored: Boolean read FStyleStored;
      property IsExplodeStored: Boolean read FExplodeStored;
      property IsAllowReservedStored: Boolean read FAllowReservedStored;
    published
      property contentType: System.String read FContentType write SetContentType stored FContentTypeStored;
      property headers: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Encoding.THeadersType read GetHeaders write SetHeaders stored FHeadersStored;
      property style: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Encoding.TStyleType read FStyle write SetStyle stored FStyleStored;
      property explode: System.Boolean read FExplode write SetExplode stored FExplodeStored;
      property allowReserved: System.Boolean read FAllowReserved write SetAllowReserved stored FAllowReservedStored;
      [PatternProperty('^x-')]
      property PatternProperty6: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue> read FPatternProperty6 write FPatternProperty6;
    end;
  private
    FOpenapi: System.String;
    FInfo: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.InfoType;
    FExternalDocs: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ExternalDocumentation;
    FExternalDocsStored: Boolean;
    FServers: System.TArray<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Server>;
    FServersStored: Boolean;
    FSecurity: System.TArray<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.SecurityRequirement>;
    FSecurityStored: Boolean;
    FTags: System.TArray<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Tag>;
    FTagsStored: Boolean;
    FPaths: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.PathsType;
    FComponents: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType;
    FComponentsStored: Boolean;
    FPatternProperty9: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue>;
    function GetInfo: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.InfoType;
    function GetExternalDocs: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ExternalDocumentation;
    procedure SetExternalDocs(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ExternalDocumentation);
    procedure SetServers(const Value: System.TArray<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Server>);
    procedure SetSecurity(const Value: System.TArray<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.SecurityRequirement>);
    procedure SetTags(const Value: System.TArray<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Tag>);
    function GetPaths: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.PathsType;
    function GetComponents: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType;
    procedure SetComponents(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType);
  public
    destructor Destroy; override;

    function AddServers: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Server;
    function AddSecurity: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.SecurityRequirement;
    function AddTags: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Tag;
    procedure AddPatternProperty9(const Name: String; const Value: System.Rtti.TValue);

    property IsExternalDocsStored: Boolean read FExternalDocsStored;
    property IsServersStored: Boolean read FServersStored;
    property IsSecurityStored: Boolean read FSecurityStored;
    property IsTagsStored: Boolean read FTagsStored;
    property IsComponentsStored: Boolean read FComponentsStored;
  published
    property openapi: System.String read FOpenapi write FOpenapi;
    property info: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.InfoType read GetInfo write FInfo;
    property externalDocs: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ExternalDocumentation read GetExternalDocs write SetExternalDocs stored FExternalDocsStored;
    property servers: System.TArray<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Server> read FServers write SetServers stored FServersStored;
    property security: System.TArray<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.SecurityRequirement> read FSecurity write SetSecurity stored FSecurityStored;
    property tags: System.TArray<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Tag> read FTags write SetTags stored FTagsStored;
    property paths: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.PathsType read GetPaths write FPaths;
    property components: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType read GetComponents write SetComponents stored FComponentsStored;
    [PatternProperty('^x-')]
    property PatternProperty9: Blue.Print.Types.TDynamicProperty<System.Rtti.TValue> read FPatternProperty9 write FPatternProperty9;
  end;

implementation

{ OpenAPIDefinition }

destructor OpenAPIDefinition.Destroy;
begin
  FInfo.Free;

  FExternalDocs.Free;

  for var Item in FServers do
    Item.Free;

  for var Item in FSecurity do
    Item.Free;

  for var Item in FTags do
    Item.Free;

  FPaths.Free;

  FComponents.Free;

  inherited;
end;

function OpenAPIDefinition.GetInfo: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.InfoType;
begin
  if not Assigned(FInfo) then
    info := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.InfoType.Create;

  Result := FInfo;
end;

function OpenAPIDefinition.GetExternalDocs: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ExternalDocumentation;
begin
  if not Assigned(FExternalDocs) then
    externalDocs := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ExternalDocumentation.Create;

  Result := FExternalDocs;
end;

procedure OpenAPIDefinition.SetExternalDocs(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ExternalDocumentation);
begin
  FExternalDocs := Value;
  FExternalDocsStored := True;
end;

function OpenAPIDefinition.AddServers: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Server;
begin
  Result := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Server.Create;

  servers := servers + [Result];
end;

procedure OpenAPIDefinition.SetServers(const Value: System.TArray<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Server>);
begin
  FServers := Value;
  FServersStored := True;
end;

function OpenAPIDefinition.AddSecurity: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.SecurityRequirement;
begin
  Result := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.SecurityRequirement.Create;

  security := security + [Result];
end;

procedure OpenAPIDefinition.SetSecurity(const Value: System.TArray<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.SecurityRequirement>);
begin
  FSecurity := Value;
  FSecurityStored := True;
end;

function OpenAPIDefinition.AddTags: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Tag;
begin
  Result := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Tag.Create;

  tags := tags + [Result];
end;

procedure OpenAPIDefinition.SetTags(const Value: System.TArray<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Tag>);
begin
  FTags := Value;
  FTagsStored := True;
end;

function OpenAPIDefinition.GetPaths: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.PathsType;
begin
  if not Assigned(FPaths) then
    paths := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.PathsType.Create;

  Result := FPaths;
end;

function OpenAPIDefinition.GetComponents: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType;
begin
  if not Assigned(FComponents) then
    components := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.Create;

  Result := FComponents;
end;

procedure OpenAPIDefinition.SetComponents(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType);
begin
  FComponents := Value;
  FComponentsStored := True;
end;

procedure OpenAPIDefinition.AddPatternProperty9(const Name: String; const Value: System.Rtti.TValue);
begin
  PatternProperty9 := PatternProperty9 + [TDynamicPair<System.Rtti.TValue>.Create(Name, Value)];
end;

{ OpenAPIDefinition.Reference }

procedure OpenAPIDefinition.Reference.AddString(const Name: String; const Value: System.String);
begin
  &string := &string + [TDynamicPair<System.String>.Create(Name, Value)];
end;

{ OpenAPIDefinition.InfoType }

destructor OpenAPIDefinition.InfoType.Destroy;
begin
  FContact.Free;

  FLicense.Free;

  inherited;
end;

procedure OpenAPIDefinition.InfoType.SetDescription(const Value: System.String);
begin
  FDescription := Value;
  FDescriptionStored := True;
end;

procedure OpenAPIDefinition.InfoType.SetTermsOfService(const Value: System.String);
begin
  FTermsOfService := Value;
  FTermsOfServiceStored := True;
end;

function OpenAPIDefinition.InfoType.GetContact: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Contact;
begin
  if not Assigned(FContact) then
    contact := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Contact.Create;

  Result := FContact;
end;

procedure OpenAPIDefinition.InfoType.SetContact(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Contact);
begin
  FContact := Value;
  FContactStored := True;
end;

function OpenAPIDefinition.InfoType.GetLicense: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.License;
begin
  if not Assigned(FLicense) then
    license := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.License.Create;

  Result := FLicense;
end;

procedure OpenAPIDefinition.InfoType.SetLicense(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.License);
begin
  FLicense := Value;
  FLicenseStored := True;
end;

procedure OpenAPIDefinition.InfoType.AddPatternProperty7(const Name: String; const Value: System.Rtti.TValue);
begin
  PatternProperty7 := PatternProperty7 + [TDynamicPair<System.Rtti.TValue>.Create(Name, Value)];
end;

{ OpenAPIDefinition.Contact }

procedure OpenAPIDefinition.Contact.SetName(const Value: System.String);
begin
  FName := Value;
  FNameStored := True;
end;

procedure OpenAPIDefinition.Contact.SetUrl(const Value: System.String);
begin
  FUrl := Value;
  FUrlStored := True;
end;

procedure OpenAPIDefinition.Contact.SetEmail(const Value: System.String);
begin
  FEmail := Value;
  FEmailStored := True;
end;

procedure OpenAPIDefinition.Contact.AddPatternProperty4(const Name: String; const Value: System.Rtti.TValue);
begin
  PatternProperty4 := PatternProperty4 + [TDynamicPair<System.Rtti.TValue>.Create(Name, Value)];
end;

{ OpenAPIDefinition.License }

procedure OpenAPIDefinition.License.SetUrl(const Value: System.String);
begin
  FUrl := Value;
  FUrlStored := True;
end;

procedure OpenAPIDefinition.License.AddPatternProperty3(const Name: String; const Value: System.Rtti.TValue);
begin
  PatternProperty3 := PatternProperty3 + [TDynamicPair<System.Rtti.TValue>.Create(Name, Value)];
end;

{ OpenAPIDefinition.Server }

destructor OpenAPIDefinition.Server.Destroy;
begin
  FVariables.Free;

  inherited;
end;

procedure OpenAPIDefinition.Server.SetDescription(const Value: System.String);
begin
  FDescription := Value;
  FDescriptionStored := True;
end;

function OpenAPIDefinition.Server.GetVariables: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Server.TVariablesType;
begin
  if not Assigned(FVariables) then
    variables := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Server.TVariablesType.Create;

  Result := FVariables;
end;

procedure OpenAPIDefinition.Server.SetVariables(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Server.TVariablesType);
begin
  FVariables := Value;
  FVariablesStored := True;
end;

procedure OpenAPIDefinition.Server.AddPatternProperty4(const Name: String; const Value: System.Rtti.TValue);
begin
  PatternProperty4 := PatternProperty4 + [TDynamicPair<System.Rtti.TValue>.Create(Name, Value)];
end;

{ OpenAPIDefinition.Server.TVariablesType }

destructor OpenAPIDefinition.Server.TVariablesType.Destroy;
begin
  for var Item in FAdditionalProperties do
    Item.Value.Free;

  inherited;
end;

function OpenAPIDefinition.Server.TVariablesType.AddAdditionalProperties(const Name: String): Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ServerVariable;
begin
  Result := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ServerVariable.Create;

  additionalProperties := additionalProperties + [TDynamicPair<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ServerVariable>.Create(Name, Result)];
end;

{ OpenAPIDefinition.ServerVariable }

procedure OpenAPIDefinition.ServerVariable.AddEnum(const Value: System.String);
begin
  enum := enum + [Value];
end;

procedure OpenAPIDefinition.ServerVariable.SetEnum(const Value: System.TArray<System.String>);
begin
  FEnum := Value;
  FEnumStored := True;
end;

procedure OpenAPIDefinition.ServerVariable.SetDescription(const Value: System.String);
begin
  FDescription := Value;
  FDescriptionStored := True;
end;

procedure OpenAPIDefinition.ServerVariable.AddPatternProperty4(const Name: String; const Value: System.Rtti.TValue);
begin
  PatternProperty4 := PatternProperty4 + [TDynamicPair<System.Rtti.TValue>.Create(Name, Value)];
end;

{ OpenAPIDefinition.ComponentsType }

destructor OpenAPIDefinition.ComponentsType.Destroy;
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

  inherited;
end;

function OpenAPIDefinition.ComponentsType.GetSchemas: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TSchemasType;
begin
  if not Assigned(FSchemas) then
    schemas := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TSchemasType.Create;

  Result := FSchemas;
end;

procedure OpenAPIDefinition.ComponentsType.SetSchemas(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TSchemasType);
begin
  FSchemas := Value;
  FSchemasStored := True;
end;

function OpenAPIDefinition.ComponentsType.GetResponses: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TResponsesType;
begin
  if not Assigned(FResponses) then
    responses := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TResponsesType.Create;

  Result := FResponses;
end;

procedure OpenAPIDefinition.ComponentsType.SetResponses(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TResponsesType);
begin
  FResponses := Value;
  FResponsesStored := True;
end;

function OpenAPIDefinition.ComponentsType.GetParameters: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TParametersType;
begin
  if not Assigned(FParameters) then
    parameters := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TParametersType.Create;

  Result := FParameters;
end;

procedure OpenAPIDefinition.ComponentsType.SetParameters(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TParametersType);
begin
  FParameters := Value;
  FParametersStored := True;
end;

function OpenAPIDefinition.ComponentsType.GetExamples: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TExamplesType;
begin
  if not Assigned(FExamples) then
    examples := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TExamplesType.Create;

  Result := FExamples;
end;

procedure OpenAPIDefinition.ComponentsType.SetExamples(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TExamplesType);
begin
  FExamples := Value;
  FExamplesStored := True;
end;

function OpenAPIDefinition.ComponentsType.GetRequestBodies: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TRequestBodiesType;
begin
  if not Assigned(FRequestBodies) then
    requestBodies := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TRequestBodiesType.Create;

  Result := FRequestBodies;
end;

procedure OpenAPIDefinition.ComponentsType.SetRequestBodies(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TRequestBodiesType);
begin
  FRequestBodies := Value;
  FRequestBodiesStored := True;
end;

function OpenAPIDefinition.ComponentsType.GetHeaders: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.THeadersType;
begin
  if not Assigned(FHeaders) then
    headers := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.THeadersType.Create;

  Result := FHeaders;
end;

procedure OpenAPIDefinition.ComponentsType.SetHeaders(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.THeadersType);
begin
  FHeaders := Value;
  FHeadersStored := True;
end;

function OpenAPIDefinition.ComponentsType.GetSecuritySchemes: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TSecuritySchemesType;
begin
  if not Assigned(FSecuritySchemes) then
    securitySchemes := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TSecuritySchemesType.Create;

  Result := FSecuritySchemes;
end;

procedure OpenAPIDefinition.ComponentsType.SetSecuritySchemes(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TSecuritySchemesType);
begin
  FSecuritySchemes := Value;
  FSecuritySchemesStored := True;
end;

function OpenAPIDefinition.ComponentsType.GetLinks: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TLinksType;
begin
  if not Assigned(FLinks) then
    links := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TLinksType.Create;

  Result := FLinks;
end;

procedure OpenAPIDefinition.ComponentsType.SetLinks(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TLinksType);
begin
  FLinks := Value;
  FLinksStored := True;
end;

function OpenAPIDefinition.ComponentsType.GetCallbacks: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TCallbacksType;
begin
  if not Assigned(FCallbacks) then
    callbacks := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TCallbacksType.Create;

  Result := FCallbacks;
end;

procedure OpenAPIDefinition.ComponentsType.SetCallbacks(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TCallbacksType);
begin
  FCallbacks := Value;
  FCallbacksStored := True;
end;

procedure OpenAPIDefinition.ComponentsType.AddPatternProperty10(const Name: String; const Value: System.Rtti.TValue);
begin
  PatternProperty10 := PatternProperty10 + [TDynamicPair<System.Rtti.TValue>.Create(Name, Value)];
end;

{ OpenAPIDefinition.ComponentsType.TSchemasType }

destructor OpenAPIDefinition.ComponentsType.TSchemasType.Destroy;
begin
  for var Item in FPatternProperty do
    Item.Value.Free;

  inherited;
end;

function OpenAPIDefinition.ComponentsType.TSchemasType.AddPatternProperty(const Name: String): Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TSchemasType.TPatternPropertyType;
begin
  Result := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TSchemasType.TPatternPropertyType.Create;

  PatternProperty := PatternProperty + [TDynamicPair<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TSchemasType.TPatternPropertyType>.Create(Name, Result)];
end;

{ OpenAPIDefinition.ComponentsType.TSchemasType.TPatternPropertyType }

destructor OpenAPIDefinition.ComponentsType.TSchemasType.TPatternPropertyType.Destroy;
begin
  FSchema.Free;

  FReference.Free;

  inherited;
end;

function OpenAPIDefinition.ComponentsType.TSchemasType.TPatternPropertyType.GetSchema: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema;
begin
  if not Assigned(FSchema) then
    Schema := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.Create;

  Result := FSchema;
end;

procedure OpenAPIDefinition.ComponentsType.TSchemasType.TPatternPropertyType.SetSchema(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema);
begin
  FSchema := Value;
  FSchemaStored := True;
end;

function OpenAPIDefinition.ComponentsType.TSchemasType.TPatternPropertyType.GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    Reference := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

procedure OpenAPIDefinition.ComponentsType.TSchemasType.TPatternPropertyType.SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
begin
  FReference := Value;
  FReferenceStored := True;
end;

{ OpenAPIDefinition.ComponentsType.TResponsesType }

destructor OpenAPIDefinition.ComponentsType.TResponsesType.Destroy;
begin
  for var Item in FPatternProperty do
    Item.Value.Free;

  inherited;
end;

function OpenAPIDefinition.ComponentsType.TResponsesType.AddPatternProperty(const Name: String): Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TResponsesType.TPatternPropertyType;
begin
  Result := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TResponsesType.TPatternPropertyType.Create;

  PatternProperty := PatternProperty + [TDynamicPair<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TResponsesType.TPatternPropertyType>.Create(Name, Result)];
end;

{ OpenAPIDefinition.ComponentsType.TResponsesType.TPatternPropertyType }

destructor OpenAPIDefinition.ComponentsType.TResponsesType.TPatternPropertyType.Destroy;
begin
  FReference.Free;

  FResponse.Free;

  inherited;
end;

function OpenAPIDefinition.ComponentsType.TResponsesType.TPatternPropertyType.GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    Reference := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

procedure OpenAPIDefinition.ComponentsType.TResponsesType.TPatternPropertyType.SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
begin
  FReference := Value;
  FReferenceStored := True;
end;

function OpenAPIDefinition.ComponentsType.TResponsesType.TPatternPropertyType.GetResponse: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Response;
begin
  if not Assigned(FResponse) then
    Response := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Response.Create;

  Result := FResponse;
end;

procedure OpenAPIDefinition.ComponentsType.TResponsesType.TPatternPropertyType.SetResponse(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Response);
begin
  FResponse := Value;
  FResponseStored := True;
end;

{ OpenAPIDefinition.ComponentsType.TParametersType }

destructor OpenAPIDefinition.ComponentsType.TParametersType.Destroy;
begin
  for var Item in FPatternProperty do
    Item.Value.Free;

  inherited;
end;

function OpenAPIDefinition.ComponentsType.TParametersType.AddPatternProperty(const Name: String): Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TParametersType.TPatternPropertyType;
begin
  Result := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TParametersType.TPatternPropertyType.Create;

  PatternProperty := PatternProperty + [TDynamicPair<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TParametersType.TPatternPropertyType>.Create(Name, Result)];
end;

{ OpenAPIDefinition.ComponentsType.TParametersType.TPatternPropertyType }

destructor OpenAPIDefinition.ComponentsType.TParametersType.TPatternPropertyType.Destroy;
begin
  FReference.Free;

  FParameter.Free;

  inherited;
end;

function OpenAPIDefinition.ComponentsType.TParametersType.TPatternPropertyType.GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    Reference := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

procedure OpenAPIDefinition.ComponentsType.TParametersType.TPatternPropertyType.SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
begin
  FReference := Value;
  FReferenceStored := True;
end;

function OpenAPIDefinition.ComponentsType.TParametersType.TPatternPropertyType.GetParameter: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Parameter;
begin
  if not Assigned(FParameter) then
    Parameter := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Parameter.Create;

  Result := FParameter;
end;

procedure OpenAPIDefinition.ComponentsType.TParametersType.TPatternPropertyType.SetParameter(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Parameter);
begin
  FParameter := Value;
  FParameterStored := True;
end;

{ OpenAPIDefinition.ComponentsType.TExamplesType }

destructor OpenAPIDefinition.ComponentsType.TExamplesType.Destroy;
begin
  for var Item in FPatternProperty do
    Item.Value.Free;

  inherited;
end;

function OpenAPIDefinition.ComponentsType.TExamplesType.AddPatternProperty(const Name: String): Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TExamplesType.TPatternPropertyType;
begin
  Result := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TExamplesType.TPatternPropertyType.Create;

  PatternProperty := PatternProperty + [TDynamicPair<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TExamplesType.TPatternPropertyType>.Create(Name, Result)];
end;

{ OpenAPIDefinition.ComponentsType.TExamplesType.TPatternPropertyType }

destructor OpenAPIDefinition.ComponentsType.TExamplesType.TPatternPropertyType.Destroy;
begin
  FReference.Free;

  FExample.Free;

  inherited;
end;

function OpenAPIDefinition.ComponentsType.TExamplesType.TPatternPropertyType.GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    Reference := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

procedure OpenAPIDefinition.ComponentsType.TExamplesType.TPatternPropertyType.SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
begin
  FReference := Value;
  FReferenceStored := True;
end;

function OpenAPIDefinition.ComponentsType.TExamplesType.TPatternPropertyType.GetExample: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Example;
begin
  if not Assigned(FExample) then
    Example := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Example.Create;

  Result := FExample;
end;

procedure OpenAPIDefinition.ComponentsType.TExamplesType.TPatternPropertyType.SetExample(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Example);
begin
  FExample := Value;
  FExampleStored := True;
end;

{ OpenAPIDefinition.ComponentsType.TRequestBodiesType }

destructor OpenAPIDefinition.ComponentsType.TRequestBodiesType.Destroy;
begin
  for var Item in FPatternProperty do
    Item.Value.Free;

  inherited;
end;

function OpenAPIDefinition.ComponentsType.TRequestBodiesType.AddPatternProperty(const Name: String): Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TRequestBodiesType.TPatternPropertyType;
begin
  Result := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TRequestBodiesType.TPatternPropertyType.Create;

  PatternProperty := PatternProperty + [TDynamicPair<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TRequestBodiesType.TPatternPropertyType>.Create(Name, Result)];
end;

{ OpenAPIDefinition.ComponentsType.TRequestBodiesType.TPatternPropertyType }

destructor OpenAPIDefinition.ComponentsType.TRequestBodiesType.TPatternPropertyType.Destroy;
begin
  FReference.Free;

  FRequestBody.Free;

  inherited;
end;

function OpenAPIDefinition.ComponentsType.TRequestBodiesType.TPatternPropertyType.GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    Reference := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

procedure OpenAPIDefinition.ComponentsType.TRequestBodiesType.TPatternPropertyType.SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
begin
  FReference := Value;
  FReferenceStored := True;
end;

function OpenAPIDefinition.ComponentsType.TRequestBodiesType.TPatternPropertyType.GetRequestBody: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.RequestBody;
begin
  if not Assigned(FRequestBody) then
    RequestBody := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.RequestBody.Create;

  Result := FRequestBody;
end;

procedure OpenAPIDefinition.ComponentsType.TRequestBodiesType.TPatternPropertyType.SetRequestBody(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.RequestBody);
begin
  FRequestBody := Value;
  FRequestBodyStored := True;
end;

{ OpenAPIDefinition.ComponentsType.THeadersType }

destructor OpenAPIDefinition.ComponentsType.THeadersType.Destroy;
begin
  for var Item in FPatternProperty do
    Item.Value.Free;

  inherited;
end;

function OpenAPIDefinition.ComponentsType.THeadersType.AddPatternProperty(const Name: String): Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.THeadersType.TPatternPropertyType;
begin
  Result := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.THeadersType.TPatternPropertyType.Create;

  PatternProperty := PatternProperty + [TDynamicPair<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.THeadersType.TPatternPropertyType>.Create(Name, Result)];
end;

{ OpenAPIDefinition.ComponentsType.THeadersType.TPatternPropertyType }

destructor OpenAPIDefinition.ComponentsType.THeadersType.TPatternPropertyType.Destroy;
begin
  FReference.Free;

  FHeader.Free;

  inherited;
end;

function OpenAPIDefinition.ComponentsType.THeadersType.TPatternPropertyType.GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    Reference := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

procedure OpenAPIDefinition.ComponentsType.THeadersType.TPatternPropertyType.SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
begin
  FReference := Value;
  FReferenceStored := True;
end;

function OpenAPIDefinition.ComponentsType.THeadersType.TPatternPropertyType.GetHeader: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Header;
begin
  if not Assigned(FHeader) then
    Header := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Header.Create;

  Result := FHeader;
end;

procedure OpenAPIDefinition.ComponentsType.THeadersType.TPatternPropertyType.SetHeader(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Header);
begin
  FHeader := Value;
  FHeaderStored := True;
end;

{ OpenAPIDefinition.ComponentsType.TSecuritySchemesType }

destructor OpenAPIDefinition.ComponentsType.TSecuritySchemesType.Destroy;
begin
  for var Item in FPatternProperty do
    Item.Value.Free;

  inherited;
end;

function OpenAPIDefinition.ComponentsType.TSecuritySchemesType.AddPatternProperty(const Name: String): Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TSecuritySchemesType.TPatternPropertyType;
begin
  Result := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TSecuritySchemesType.TPatternPropertyType.Create;

  PatternProperty := PatternProperty + [TDynamicPair<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TSecuritySchemesType.TPatternPropertyType>.Create(Name, Result)];
end;

{ OpenAPIDefinition.ComponentsType.TSecuritySchemesType.TPatternPropertyType }

destructor OpenAPIDefinition.ComponentsType.TSecuritySchemesType.TPatternPropertyType.Destroy;
begin
  FReference.Free;

  FSecurityScheme.Free;

  inherited;
end;

function OpenAPIDefinition.ComponentsType.TSecuritySchemesType.TPatternPropertyType.GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    Reference := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

procedure OpenAPIDefinition.ComponentsType.TSecuritySchemesType.TPatternPropertyType.SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
begin
  FReference := Value;
  FReferenceStored := True;
end;

function OpenAPIDefinition.ComponentsType.TSecuritySchemesType.TPatternPropertyType.GetSecurityScheme: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.SecurityScheme;
begin
  if not Assigned(FSecurityScheme) then
    SecurityScheme := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.SecurityScheme.Create;

  Result := FSecurityScheme;
end;

procedure OpenAPIDefinition.ComponentsType.TSecuritySchemesType.TPatternPropertyType.SetSecurityScheme(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.SecurityScheme);
begin
  FSecurityScheme := Value;
  FSecuritySchemeStored := True;
end;

{ OpenAPIDefinition.ComponentsType.TLinksType }

destructor OpenAPIDefinition.ComponentsType.TLinksType.Destroy;
begin
  for var Item in FPatternProperty do
    Item.Value.Free;

  inherited;
end;

function OpenAPIDefinition.ComponentsType.TLinksType.AddPatternProperty(const Name: String): Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TLinksType.TPatternPropertyType;
begin
  Result := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TLinksType.TPatternPropertyType.Create;

  PatternProperty := PatternProperty + [TDynamicPair<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TLinksType.TPatternPropertyType>.Create(Name, Result)];
end;

{ OpenAPIDefinition.ComponentsType.TLinksType.TPatternPropertyType }

destructor OpenAPIDefinition.ComponentsType.TLinksType.TPatternPropertyType.Destroy;
begin
  FReference.Free;

  FLink.Free;

  inherited;
end;

function OpenAPIDefinition.ComponentsType.TLinksType.TPatternPropertyType.GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    Reference := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

procedure OpenAPIDefinition.ComponentsType.TLinksType.TPatternPropertyType.SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
begin
  FReference := Value;
  FReferenceStored := True;
end;

function OpenAPIDefinition.ComponentsType.TLinksType.TPatternPropertyType.GetLink: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Link;
begin
  if not Assigned(FLink) then
    Link := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Link.Create;

  Result := FLink;
end;

procedure OpenAPIDefinition.ComponentsType.TLinksType.TPatternPropertyType.SetLink(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Link);
begin
  FLink := Value;
  FLinkStored := True;
end;

{ OpenAPIDefinition.ComponentsType.TCallbacksType }

destructor OpenAPIDefinition.ComponentsType.TCallbacksType.Destroy;
begin
  for var Item in FPatternProperty do
    Item.Value.Free;

  inherited;
end;

function OpenAPIDefinition.ComponentsType.TCallbacksType.AddPatternProperty(const Name: String): Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TCallbacksType.TPatternPropertyType;
begin
  Result := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TCallbacksType.TPatternPropertyType.Create;

  PatternProperty := PatternProperty + [TDynamicPair<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ComponentsType.TCallbacksType.TPatternPropertyType>.Create(Name, Result)];
end;

{ OpenAPIDefinition.ComponentsType.TCallbacksType.TPatternPropertyType }

destructor OpenAPIDefinition.ComponentsType.TCallbacksType.TPatternPropertyType.Destroy;
begin
  FReference.Free;

  FCallback.Free;

  inherited;
end;

function OpenAPIDefinition.ComponentsType.TCallbacksType.TPatternPropertyType.GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    Reference := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

procedure OpenAPIDefinition.ComponentsType.TCallbacksType.TPatternPropertyType.SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
begin
  FReference := Value;
  FReferenceStored := True;
end;

function OpenAPIDefinition.ComponentsType.TCallbacksType.TPatternPropertyType.GetCallback: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Callback;
begin
  if not Assigned(FCallback) then
    Callback := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Callback.Create;

  Result := FCallback;
end;

procedure OpenAPIDefinition.ComponentsType.TCallbacksType.TPatternPropertyType.SetCallback(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Callback);
begin
  FCallback := Value;
  FCallbackStored := True;
end;

{ OpenAPIDefinition.Schema }

destructor OpenAPIDefinition.Schema.Destroy;
begin
  FNot.Free;

  for var Item in FAllOf do
    Item.Free;

  for var Item in FOneOf do
    Item.Free;

  for var Item in FAnyOf do
    Item.Free;

  FItems.Free;

  FProperties.Free;

  FAdditionalProperties.Free;

  FDiscriminator.Free;

  FExternalDocs.Free;

  FXml.Free;

  inherited;
end;

procedure OpenAPIDefinition.Schema.SetTitle(const Value: System.String);
begin
  FTitle := Value;
  FTitleStored := True;
end;

procedure OpenAPIDefinition.Schema.SetMultipleOf(const Value: System.Double);
begin
  FMultipleOf := Value;
  FMultipleOfStored := True;
end;

procedure OpenAPIDefinition.Schema.SetMaximum(const Value: System.Double);
begin
  FMaximum := Value;
  FMaximumStored := True;
end;

procedure OpenAPIDefinition.Schema.SetExclusiveMaximum(const Value: System.Boolean);
begin
  FExclusiveMaximum := Value;
  FExclusiveMaximumStored := True;
end;

procedure OpenAPIDefinition.Schema.SetMinimum(const Value: System.Double);
begin
  FMinimum := Value;
  FMinimumStored := True;
end;

procedure OpenAPIDefinition.Schema.SetExclusiveMinimum(const Value: System.Boolean);
begin
  FExclusiveMinimum := Value;
  FExclusiveMinimumStored := True;
end;

procedure OpenAPIDefinition.Schema.SetMaxLength(const Value: System.Integer);
begin
  FMaxLength := Value;
  FMaxLengthStored := True;
end;

procedure OpenAPIDefinition.Schema.SetMinLength(const Value: System.Integer);
begin
  FMinLength := Value;
  FMinLengthStored := True;
end;

procedure OpenAPIDefinition.Schema.SetPattern(const Value: System.String);
begin
  FPattern := Value;
  FPatternStored := True;
end;

procedure OpenAPIDefinition.Schema.SetMaxItems(const Value: System.Integer);
begin
  FMaxItems := Value;
  FMaxItemsStored := True;
end;

procedure OpenAPIDefinition.Schema.SetMinItems(const Value: System.Integer);
begin
  FMinItems := Value;
  FMinItemsStored := True;
end;

procedure OpenAPIDefinition.Schema.SetUniqueItems(const Value: System.Boolean);
begin
  FUniqueItems := Value;
  FUniqueItemsStored := True;
end;

procedure OpenAPIDefinition.Schema.SetMaxProperties(const Value: System.Integer);
begin
  FMaxProperties := Value;
  FMaxPropertiesStored := True;
end;

procedure OpenAPIDefinition.Schema.SetMinProperties(const Value: System.Integer);
begin
  FMinProperties := Value;
  FMinPropertiesStored := True;
end;

procedure OpenAPIDefinition.Schema.AddRequired(const Value: System.String);
begin
  required := required + [Value];
end;

procedure OpenAPIDefinition.Schema.SetRequired(const Value: System.TArray<System.String>);
begin
  FRequired := Value;
  FRequiredStored := True;
end;

procedure OpenAPIDefinition.Schema.AddEnum(const Value: System.Rtti.TValue);
begin
  enum := enum + [Value];
end;

procedure OpenAPIDefinition.Schema.SetEnum(const Value: System.TArray<System.Rtti.TValue>);
begin
  FEnum := Value;
  FEnumStored := True;
end;

procedure OpenAPIDefinition.Schema.SetType(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.TTypeType);
begin
  FType := Value;
  FTypeStored := True;
end;

function OpenAPIDefinition.Schema.GetNot: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.TNotType;
begin
  if not Assigned(FNot) then
    &not := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.TNotType.Create;

  Result := FNot;
end;

procedure OpenAPIDefinition.Schema.SetNot(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.TNotType);
begin
  FNot := Value;
  FNotStored := True;
end;

function OpenAPIDefinition.Schema.AddAllOf: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.TAllOfTypeArray;
begin
  Result := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.TAllOfTypeArray.Create;

  allOf := allOf + [Result];
end;

procedure OpenAPIDefinition.Schema.SetAllOf(const Value: System.TArray<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.TAllOfTypeArray>);
begin
  FAllOf := Value;
  FAllOfStored := True;
end;

function OpenAPIDefinition.Schema.AddOneOf: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.TOneOfTypeArray;
begin
  Result := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.TOneOfTypeArray.Create;

  oneOf := oneOf + [Result];
end;

procedure OpenAPIDefinition.Schema.SetOneOf(const Value: System.TArray<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.TOneOfTypeArray>);
begin
  FOneOf := Value;
  FOneOfStored := True;
end;

function OpenAPIDefinition.Schema.AddAnyOf: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.TAnyOfTypeArray;
begin
  Result := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.TAnyOfTypeArray.Create;

  anyOf := anyOf + [Result];
end;

procedure OpenAPIDefinition.Schema.SetAnyOf(const Value: System.TArray<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.TAnyOfTypeArray>);
begin
  FAnyOf := Value;
  FAnyOfStored := True;
end;

function OpenAPIDefinition.Schema.GetItems: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.TItemsType;
begin
  if not Assigned(FItems) then
    items := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.TItemsType.Create;

  Result := FItems;
end;

procedure OpenAPIDefinition.Schema.SetItems(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.TItemsType);
begin
  FItems := Value;
  FItemsStored := True;
end;

function OpenAPIDefinition.Schema.GetProperties: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.TPropertiesType;
begin
  if not Assigned(FProperties) then
    properties := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.TPropertiesType.Create;

  Result := FProperties;
end;

procedure OpenAPIDefinition.Schema.SetProperties(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.TPropertiesType);
begin
  FProperties := Value;
  FPropertiesStored := True;
end;

function OpenAPIDefinition.Schema.GetAdditionalProperties: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.TAdditionalPropertiesType;
begin
  if not Assigned(FAdditionalProperties) then
    additionalProperties := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.TAdditionalPropertiesType.Create;

  Result := FAdditionalProperties;
end;

procedure OpenAPIDefinition.Schema.SetAdditionalProperties(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.TAdditionalPropertiesType);
begin
  FAdditionalProperties := Value;
  FAdditionalPropertiesStored := True;
end;

procedure OpenAPIDefinition.Schema.SetDescription(const Value: System.String);
begin
  FDescription := Value;
  FDescriptionStored := True;
end;

procedure OpenAPIDefinition.Schema.SetFormat(const Value: System.String);
begin
  FFormat := Value;
  FFormatStored := True;
end;

procedure OpenAPIDefinition.Schema.SetDefault(const Value: System.Rtti.TValue);
begin
  FDefault := Value;
  FDefaultStored := True;
end;

procedure OpenAPIDefinition.Schema.SetNullable(const Value: System.Boolean);
begin
  FNullable := Value;
  FNullableStored := True;
end;

function OpenAPIDefinition.Schema.GetDiscriminator: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Discriminator;
begin
  if not Assigned(FDiscriminator) then
    discriminator := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Discriminator.Create;

  Result := FDiscriminator;
end;

procedure OpenAPIDefinition.Schema.SetDiscriminator(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Discriminator);
begin
  FDiscriminator := Value;
  FDiscriminatorStored := True;
end;

procedure OpenAPIDefinition.Schema.SetReadOnly(const Value: System.Boolean);
begin
  FReadOnly := Value;
  FReadOnlyStored := True;
end;

procedure OpenAPIDefinition.Schema.SetWriteOnly(const Value: System.Boolean);
begin
  FWriteOnly := Value;
  FWriteOnlyStored := True;
end;

procedure OpenAPIDefinition.Schema.SetExample(const Value: System.Rtti.TValue);
begin
  FExample := Value;
  FExampleStored := True;
end;

function OpenAPIDefinition.Schema.GetExternalDocs: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ExternalDocumentation;
begin
  if not Assigned(FExternalDocs) then
    externalDocs := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ExternalDocumentation.Create;

  Result := FExternalDocs;
end;

procedure OpenAPIDefinition.Schema.SetExternalDocs(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ExternalDocumentation);
begin
  FExternalDocs := Value;
  FExternalDocsStored := True;
end;

procedure OpenAPIDefinition.Schema.SetDeprecated(const Value: System.Boolean);
begin
  FDeprecated := Value;
  FDeprecatedStored := True;
end;

function OpenAPIDefinition.Schema.GetXml: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.XML;
begin
  if not Assigned(FXml) then
    xml := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.XML.Create;

  Result := FXml;
end;

procedure OpenAPIDefinition.Schema.SetXml(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.XML);
begin
  FXml := Value;
  FXmlStored := True;
end;

procedure OpenAPIDefinition.Schema.AddPatternProperty36(const Name: String; const Value: System.Rtti.TValue);
begin
  PatternProperty36 := PatternProperty36 + [TDynamicPair<System.Rtti.TValue>.Create(Name, Value)];
end;

{ OpenAPIDefinition.Schema.TNotType }

destructor OpenAPIDefinition.Schema.TNotType.Destroy;
begin
  FSchema.Free;

  FReference.Free;

  inherited;
end;

function OpenAPIDefinition.Schema.TNotType.GetSchema: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema;
begin
  if not Assigned(FSchema) then
    Schema := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.Create;

  Result := FSchema;
end;

procedure OpenAPIDefinition.Schema.TNotType.SetSchema(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema);
begin
  FSchema := Value;
  FSchemaStored := True;
end;

function OpenAPIDefinition.Schema.TNotType.GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    Reference := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

procedure OpenAPIDefinition.Schema.TNotType.SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
begin
  FReference := Value;
  FReferenceStored := True;
end;

{ OpenAPIDefinition.Schema.TAllOfTypeArray }

destructor OpenAPIDefinition.Schema.TAllOfTypeArray.Destroy;
begin
  FSchema.Free;

  FReference.Free;

  inherited;
end;

function OpenAPIDefinition.Schema.TAllOfTypeArray.GetSchema: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema;
begin
  if not Assigned(FSchema) then
    Schema := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.Create;

  Result := FSchema;
end;

procedure OpenAPIDefinition.Schema.TAllOfTypeArray.SetSchema(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema);
begin
  FSchema := Value;
  FSchemaStored := True;
end;

function OpenAPIDefinition.Schema.TAllOfTypeArray.GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    Reference := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

procedure OpenAPIDefinition.Schema.TAllOfTypeArray.SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
begin
  FReference := Value;
  FReferenceStored := True;
end;

{ OpenAPIDefinition.Schema.TOneOfTypeArray }

destructor OpenAPIDefinition.Schema.TOneOfTypeArray.Destroy;
begin
  FSchema.Free;

  FReference.Free;

  inherited;
end;

function OpenAPIDefinition.Schema.TOneOfTypeArray.GetSchema: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema;
begin
  if not Assigned(FSchema) then
    Schema := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.Create;

  Result := FSchema;
end;

procedure OpenAPIDefinition.Schema.TOneOfTypeArray.SetSchema(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema);
begin
  FSchema := Value;
  FSchemaStored := True;
end;

function OpenAPIDefinition.Schema.TOneOfTypeArray.GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    Reference := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

procedure OpenAPIDefinition.Schema.TOneOfTypeArray.SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
begin
  FReference := Value;
  FReferenceStored := True;
end;

{ OpenAPIDefinition.Schema.TAnyOfTypeArray }

destructor OpenAPIDefinition.Schema.TAnyOfTypeArray.Destroy;
begin
  FSchema.Free;

  FReference.Free;

  inherited;
end;

function OpenAPIDefinition.Schema.TAnyOfTypeArray.GetSchema: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema;
begin
  if not Assigned(FSchema) then
    Schema := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.Create;

  Result := FSchema;
end;

procedure OpenAPIDefinition.Schema.TAnyOfTypeArray.SetSchema(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema);
begin
  FSchema := Value;
  FSchemaStored := True;
end;

function OpenAPIDefinition.Schema.TAnyOfTypeArray.GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    Reference := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

procedure OpenAPIDefinition.Schema.TAnyOfTypeArray.SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
begin
  FReference := Value;
  FReferenceStored := True;
end;

{ OpenAPIDefinition.Schema.TItemsType }

destructor OpenAPIDefinition.Schema.TItemsType.Destroy;
begin
  FSchema.Free;

  FReference.Free;

  inherited;
end;

function OpenAPIDefinition.Schema.TItemsType.GetSchema: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema;
begin
  if not Assigned(FSchema) then
    Schema := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.Create;

  Result := FSchema;
end;

procedure OpenAPIDefinition.Schema.TItemsType.SetSchema(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema);
begin
  FSchema := Value;
  FSchemaStored := True;
end;

function OpenAPIDefinition.Schema.TItemsType.GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    Reference := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

procedure OpenAPIDefinition.Schema.TItemsType.SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
begin
  FReference := Value;
  FReferenceStored := True;
end;

{ OpenAPIDefinition.Schema.TPropertiesType }

destructor OpenAPIDefinition.Schema.TPropertiesType.Destroy;
begin
  for var Item in FAdditionalProperties do
    Item.Value.Free;

  inherited;
end;

function OpenAPIDefinition.Schema.TPropertiesType.AddAdditionalProperties(const Name: String): Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.TPropertiesType.TAdditionalPropertiesType;
begin
  Result := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.TPropertiesType.TAdditionalPropertiesType.Create;

  additionalProperties := additionalProperties + [TDynamicPair<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.TPropertiesType.TAdditionalPropertiesType>.Create(Name, Result)];
end;

{ OpenAPIDefinition.Schema.TPropertiesType.TAdditionalPropertiesType }

destructor OpenAPIDefinition.Schema.TPropertiesType.TAdditionalPropertiesType.Destroy;
begin
  FSchema.Free;

  FReference.Free;

  inherited;
end;

function OpenAPIDefinition.Schema.TPropertiesType.TAdditionalPropertiesType.GetSchema: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema;
begin
  if not Assigned(FSchema) then
    Schema := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.Create;

  Result := FSchema;
end;

procedure OpenAPIDefinition.Schema.TPropertiesType.TAdditionalPropertiesType.SetSchema(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema);
begin
  FSchema := Value;
  FSchemaStored := True;
end;

function OpenAPIDefinition.Schema.TPropertiesType.TAdditionalPropertiesType.GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    Reference := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

procedure OpenAPIDefinition.Schema.TPropertiesType.TAdditionalPropertiesType.SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
begin
  FReference := Value;
  FReferenceStored := True;
end;

{ OpenAPIDefinition.Schema.TAdditionalPropertiesType }

destructor OpenAPIDefinition.Schema.TAdditionalPropertiesType.Destroy;
begin
  FSchema.Free;

  FReference.Free;

  inherited;
end;

function OpenAPIDefinition.Schema.TAdditionalPropertiesType.GetSchema: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema;
begin
  if not Assigned(FSchema) then
    Schema := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.Create;

  Result := FSchema;
end;

procedure OpenAPIDefinition.Schema.TAdditionalPropertiesType.SetSchema(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema);
begin
  FSchema := Value;
  FSchemaStored := True;
end;

function OpenAPIDefinition.Schema.TAdditionalPropertiesType.GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    Reference := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

procedure OpenAPIDefinition.Schema.TAdditionalPropertiesType.SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
begin
  FReference := Value;
  FReferenceStored := True;
end;

procedure OpenAPIDefinition.Schema.TAdditionalPropertiesType.SetBoolean(const Value: System.Boolean);
begin
  FBoolean := Value;
  FBooleanStored := True;
end;

{ OpenAPIDefinition.Discriminator }

destructor OpenAPIDefinition.Discriminator.Destroy;
begin
  FMapping.Free;

  inherited;
end;

function OpenAPIDefinition.Discriminator.GetMapping: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Discriminator.TMappingType;
begin
  if not Assigned(FMapping) then
    mapping := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Discriminator.TMappingType.Create;

  Result := FMapping;
end;

procedure OpenAPIDefinition.Discriminator.SetMapping(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Discriminator.TMappingType);
begin
  FMapping := Value;
  FMappingStored := True;
end;

{ OpenAPIDefinition.Discriminator.TMappingType }

procedure OpenAPIDefinition.Discriminator.TMappingType.AddAdditionalProperties(const Name: String; const Value: System.String);
begin
  additionalProperties := additionalProperties + [TDynamicPair<System.String>.Create(Name, Value)];
end;

{ OpenAPIDefinition.XML }

procedure OpenAPIDefinition.XML.SetName(const Value: System.String);
begin
  FName := Value;
  FNameStored := True;
end;

procedure OpenAPIDefinition.XML.SetNamespace(const Value: System.String);
begin
  FNamespace := Value;
  FNamespaceStored := True;
end;

procedure OpenAPIDefinition.XML.SetPrefix(const Value: System.String);
begin
  FPrefix := Value;
  FPrefixStored := True;
end;

procedure OpenAPIDefinition.XML.SetAttribute(const Value: System.Boolean);
begin
  FAttribute := Value;
  FAttributeStored := True;
end;

procedure OpenAPIDefinition.XML.SetWrapped(const Value: System.Boolean);
begin
  FWrapped := Value;
  FWrappedStored := True;
end;

procedure OpenAPIDefinition.XML.AddPatternProperty6(const Name: String; const Value: System.Rtti.TValue);
begin
  PatternProperty6 := PatternProperty6 + [TDynamicPair<System.Rtti.TValue>.Create(Name, Value)];
end;

{ OpenAPIDefinition.Response }

destructor OpenAPIDefinition.Response.Destroy;
begin
  FHeaders.Free;

  FContent.Free;

  FLinks.Free;

  inherited;
end;

function OpenAPIDefinition.Response.GetHeaders: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Response.THeadersType;
begin
  if not Assigned(FHeaders) then
    headers := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Response.THeadersType.Create;

  Result := FHeaders;
end;

procedure OpenAPIDefinition.Response.SetHeaders(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Response.THeadersType);
begin
  FHeaders := Value;
  FHeadersStored := True;
end;

function OpenAPIDefinition.Response.GetContent: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Response.TContentType;
begin
  if not Assigned(FContent) then
    content := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Response.TContentType.Create;

  Result := FContent;
end;

procedure OpenAPIDefinition.Response.SetContent(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Response.TContentType);
begin
  FContent := Value;
  FContentStored := True;
end;

function OpenAPIDefinition.Response.GetLinks: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Response.TLinksType;
begin
  if not Assigned(FLinks) then
    links := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Response.TLinksType.Create;

  Result := FLinks;
end;

procedure OpenAPIDefinition.Response.SetLinks(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Response.TLinksType);
begin
  FLinks := Value;
  FLinksStored := True;
end;

procedure OpenAPIDefinition.Response.AddPatternProperty5(const Name: String; const Value: System.Rtti.TValue);
begin
  PatternProperty5 := PatternProperty5 + [TDynamicPair<System.Rtti.TValue>.Create(Name, Value)];
end;

{ OpenAPIDefinition.Response.THeadersType }

destructor OpenAPIDefinition.Response.THeadersType.Destroy;
begin
  for var Item in FAdditionalProperties do
    Item.Value.Free;

  inherited;
end;

function OpenAPIDefinition.Response.THeadersType.AddAdditionalProperties(const Name: String): Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Response.THeadersType.TAdditionalPropertiesType;
begin
  Result := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Response.THeadersType.TAdditionalPropertiesType.Create;

  additionalProperties := additionalProperties + [TDynamicPair<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Response.THeadersType.TAdditionalPropertiesType>.Create(Name, Result)];
end;

{ OpenAPIDefinition.Response.THeadersType.TAdditionalPropertiesType }

destructor OpenAPIDefinition.Response.THeadersType.TAdditionalPropertiesType.Destroy;
begin
  FHeader.Free;

  FReference.Free;

  inherited;
end;

function OpenAPIDefinition.Response.THeadersType.TAdditionalPropertiesType.GetHeader: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Header;
begin
  if not Assigned(FHeader) then
    Header := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Header.Create;

  Result := FHeader;
end;

procedure OpenAPIDefinition.Response.THeadersType.TAdditionalPropertiesType.SetHeader(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Header);
begin
  FHeader := Value;
  FHeaderStored := True;
end;

function OpenAPIDefinition.Response.THeadersType.TAdditionalPropertiesType.GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    Reference := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

procedure OpenAPIDefinition.Response.THeadersType.TAdditionalPropertiesType.SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
begin
  FReference := Value;
  FReferenceStored := True;
end;

{ OpenAPIDefinition.Response.TContentType }

destructor OpenAPIDefinition.Response.TContentType.Destroy;
begin
  for var Item in FAdditionalProperties do
    Item.Value.Free;

  inherited;
end;

function OpenAPIDefinition.Response.TContentType.AddAdditionalProperties(const Name: String): Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.MediaType;
begin
  Result := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.MediaType.Create;

  additionalProperties := additionalProperties + [TDynamicPair<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.MediaType>.Create(Name, Result)];
end;

{ OpenAPIDefinition.Response.TLinksType }

destructor OpenAPIDefinition.Response.TLinksType.Destroy;
begin
  for var Item in FAdditionalProperties do
    Item.Value.Free;

  inherited;
end;

function OpenAPIDefinition.Response.TLinksType.AddAdditionalProperties(const Name: String): Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Response.TLinksType.TAdditionalPropertiesType;
begin
  Result := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Response.TLinksType.TAdditionalPropertiesType.Create;

  additionalProperties := additionalProperties + [TDynamicPair<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Response.TLinksType.TAdditionalPropertiesType>.Create(Name, Result)];
end;

{ OpenAPIDefinition.Response.TLinksType.TAdditionalPropertiesType }

destructor OpenAPIDefinition.Response.TLinksType.TAdditionalPropertiesType.Destroy;
begin
  FLink.Free;

  FReference.Free;

  inherited;
end;

function OpenAPIDefinition.Response.TLinksType.TAdditionalPropertiesType.GetLink: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Link;
begin
  if not Assigned(FLink) then
    Link := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Link.Create;

  Result := FLink;
end;

procedure OpenAPIDefinition.Response.TLinksType.TAdditionalPropertiesType.SetLink(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Link);
begin
  FLink := Value;
  FLinkStored := True;
end;

function OpenAPIDefinition.Response.TLinksType.TAdditionalPropertiesType.GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    Reference := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

procedure OpenAPIDefinition.Response.TLinksType.TAdditionalPropertiesType.SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
begin
  FReference := Value;
  FReferenceStored := True;
end;

{ OpenAPIDefinition.MediaType }

destructor OpenAPIDefinition.MediaType.Destroy;
begin
  FSchema.Free;

  FExamples.Free;

  FEncoding.Free;

  inherited;
end;

function OpenAPIDefinition.MediaType.GetSchema: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.MediaType.TSchemaType;
begin
  if not Assigned(FSchema) then
    schema := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.MediaType.TSchemaType.Create;

  Result := FSchema;
end;

procedure OpenAPIDefinition.MediaType.SetSchema(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.MediaType.TSchemaType);
begin
  FSchema := Value;
  FSchemaStored := True;
end;

procedure OpenAPIDefinition.MediaType.SetExample(const Value: System.Rtti.TValue);
begin
  FExample := Value;
  FExampleStored := True;
end;

function OpenAPIDefinition.MediaType.GetExamples: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.MediaType.TExamplesType;
begin
  if not Assigned(FExamples) then
    examples := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.MediaType.TExamplesType.Create;

  Result := FExamples;
end;

procedure OpenAPIDefinition.MediaType.SetExamples(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.MediaType.TExamplesType);
begin
  FExamples := Value;
  FExamplesStored := True;
end;

function OpenAPIDefinition.MediaType.GetEncoding: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.MediaType.TEncodingType;
begin
  if not Assigned(FEncoding) then
    encoding := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.MediaType.TEncodingType.Create;

  Result := FEncoding;
end;

procedure OpenAPIDefinition.MediaType.SetEncoding(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.MediaType.TEncodingType);
begin
  FEncoding := Value;
  FEncodingStored := True;
end;

procedure OpenAPIDefinition.MediaType.AddPatternProperty5(const Name: String; const Value: System.Rtti.TValue);
begin
  PatternProperty5 := PatternProperty5 + [TDynamicPair<System.Rtti.TValue>.Create(Name, Value)];
end;

{ OpenAPIDefinition.MediaType.TSchemaType }

destructor OpenAPIDefinition.MediaType.TSchemaType.Destroy;
begin
  FSchema.Free;

  FReference.Free;

  inherited;
end;

function OpenAPIDefinition.MediaType.TSchemaType.GetSchema: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema;
begin
  if not Assigned(FSchema) then
    Schema := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.Create;

  Result := FSchema;
end;

procedure OpenAPIDefinition.MediaType.TSchemaType.SetSchema(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema);
begin
  FSchema := Value;
  FSchemaStored := True;
end;

function OpenAPIDefinition.MediaType.TSchemaType.GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    Reference := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

procedure OpenAPIDefinition.MediaType.TSchemaType.SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
begin
  FReference := Value;
  FReferenceStored := True;
end;

{ OpenAPIDefinition.MediaType.TExamplesType }

destructor OpenAPIDefinition.MediaType.TExamplesType.Destroy;
begin
  for var Item in FAdditionalProperties do
    Item.Value.Free;

  inherited;
end;

function OpenAPIDefinition.MediaType.TExamplesType.AddAdditionalProperties(const Name: String): Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.MediaType.TExamplesType.TAdditionalPropertiesType;
begin
  Result := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.MediaType.TExamplesType.TAdditionalPropertiesType.Create;

  additionalProperties := additionalProperties + [TDynamicPair<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.MediaType.TExamplesType.TAdditionalPropertiesType>.Create(Name, Result)];
end;

{ OpenAPIDefinition.MediaType.TExamplesType.TAdditionalPropertiesType }

destructor OpenAPIDefinition.MediaType.TExamplesType.TAdditionalPropertiesType.Destroy;
begin
  FExample.Free;

  FReference.Free;

  inherited;
end;

function OpenAPIDefinition.MediaType.TExamplesType.TAdditionalPropertiesType.GetExample: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Example;
begin
  if not Assigned(FExample) then
    Example := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Example.Create;

  Result := FExample;
end;

procedure OpenAPIDefinition.MediaType.TExamplesType.TAdditionalPropertiesType.SetExample(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Example);
begin
  FExample := Value;
  FExampleStored := True;
end;

function OpenAPIDefinition.MediaType.TExamplesType.TAdditionalPropertiesType.GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    Reference := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

procedure OpenAPIDefinition.MediaType.TExamplesType.TAdditionalPropertiesType.SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
begin
  FReference := Value;
  FReferenceStored := True;
end;

{ OpenAPIDefinition.MediaType.TEncodingType }

destructor OpenAPIDefinition.MediaType.TEncodingType.Destroy;
begin
  for var Item in FAdditionalProperties do
    Item.Value.Free;

  inherited;
end;

function OpenAPIDefinition.MediaType.TEncodingType.AddAdditionalProperties(const Name: String): Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Encoding;
begin
  Result := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Encoding.Create;

  additionalProperties := additionalProperties + [TDynamicPair<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Encoding>.Create(Name, Result)];
end;

{ OpenAPIDefinition.Example }

procedure OpenAPIDefinition.Example.SetSummary(const Value: System.String);
begin
  FSummary := Value;
  FSummaryStored := True;
end;

procedure OpenAPIDefinition.Example.SetDescription(const Value: System.String);
begin
  FDescription := Value;
  FDescriptionStored := True;
end;

procedure OpenAPIDefinition.Example.SetValue(const Value: System.Rtti.TValue);
begin
  FValue := Value;
  FValueStored := True;
end;

procedure OpenAPIDefinition.Example.SetExternalValue(const Value: System.String);
begin
  FExternalValue := Value;
  FExternalValueStored := True;
end;

procedure OpenAPIDefinition.Example.AddPatternProperty5(const Name: String; const Value: System.Rtti.TValue);
begin
  PatternProperty5 := PatternProperty5 + [TDynamicPair<System.Rtti.TValue>.Create(Name, Value)];
end;

{ OpenAPIDefinition.Header }

destructor OpenAPIDefinition.Header.Destroy;
begin
  FSchema.Free;

  FContent.Free;

  FExamples.Free;

  inherited;
end;

procedure OpenAPIDefinition.Header.SetDescription(const Value: System.String);
begin
  FDescription := Value;
  FDescriptionStored := True;
end;

procedure OpenAPIDefinition.Header.SetRequired(const Value: System.Boolean);
begin
  FRequired := Value;
  FRequiredStored := True;
end;

procedure OpenAPIDefinition.Header.SetDeprecated(const Value: System.Boolean);
begin
  FDeprecated := Value;
  FDeprecatedStored := True;
end;

procedure OpenAPIDefinition.Header.SetAllowEmptyValue(const Value: System.Boolean);
begin
  FAllowEmptyValue := Value;
  FAllowEmptyValueStored := True;
end;

procedure OpenAPIDefinition.Header.SetStyle(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Header.TStyleType);
begin
  FStyle := Value;
  FStyleStored := True;
end;

procedure OpenAPIDefinition.Header.SetExplode(const Value: System.Boolean);
begin
  FExplode := Value;
  FExplodeStored := True;
end;

procedure OpenAPIDefinition.Header.SetAllowReserved(const Value: System.Boolean);
begin
  FAllowReserved := Value;
  FAllowReservedStored := True;
end;

function OpenAPIDefinition.Header.GetSchema: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Header.TSchemaType;
begin
  if not Assigned(FSchema) then
    schema := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Header.TSchemaType.Create;

  Result := FSchema;
end;

procedure OpenAPIDefinition.Header.SetSchema(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Header.TSchemaType);
begin
  FSchema := Value;
  FSchemaStored := True;
end;

function OpenAPIDefinition.Header.GetContent: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Header.TContentType;
begin
  if not Assigned(FContent) then
    content := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Header.TContentType.Create;

  Result := FContent;
end;

procedure OpenAPIDefinition.Header.SetContent(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Header.TContentType);
begin
  FContent := Value;
  FContentStored := True;
end;

procedure OpenAPIDefinition.Header.SetExample(const Value: System.Rtti.TValue);
begin
  FExample := Value;
  FExampleStored := True;
end;

function OpenAPIDefinition.Header.GetExamples: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Header.TExamplesType;
begin
  if not Assigned(FExamples) then
    examples := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Header.TExamplesType.Create;

  Result := FExamples;
end;

procedure OpenAPIDefinition.Header.SetExamples(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Header.TExamplesType);
begin
  FExamples := Value;
  FExamplesStored := True;
end;

procedure OpenAPIDefinition.Header.AddPatternProperty12(const Name: String; const Value: System.Rtti.TValue);
begin
  PatternProperty12 := PatternProperty12 + [TDynamicPair<System.Rtti.TValue>.Create(Name, Value)];
end;

{ OpenAPIDefinition.Header.TSchemaType }

destructor OpenAPIDefinition.Header.TSchemaType.Destroy;
begin
  FSchema.Free;

  FReference.Free;

  inherited;
end;

function OpenAPIDefinition.Header.TSchemaType.GetSchema: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema;
begin
  if not Assigned(FSchema) then
    Schema := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.Create;

  Result := FSchema;
end;

procedure OpenAPIDefinition.Header.TSchemaType.SetSchema(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema);
begin
  FSchema := Value;
  FSchemaStored := True;
end;

function OpenAPIDefinition.Header.TSchemaType.GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    Reference := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

procedure OpenAPIDefinition.Header.TSchemaType.SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
begin
  FReference := Value;
  FReferenceStored := True;
end;

{ OpenAPIDefinition.Header.TContentType }

destructor OpenAPIDefinition.Header.TContentType.Destroy;
begin
  for var Item in FAdditionalProperties do
    Item.Value.Free;

  inherited;
end;

function OpenAPIDefinition.Header.TContentType.AddAdditionalProperties(const Name: String): Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.MediaType;
begin
  Result := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.MediaType.Create;

  additionalProperties := additionalProperties + [TDynamicPair<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.MediaType>.Create(Name, Result)];
end;

{ OpenAPIDefinition.Header.TExamplesType }

destructor OpenAPIDefinition.Header.TExamplesType.Destroy;
begin
  for var Item in FAdditionalProperties do
    Item.Value.Free;

  inherited;
end;

function OpenAPIDefinition.Header.TExamplesType.AddAdditionalProperties(const Name: String): Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Header.TExamplesType.TAdditionalPropertiesType;
begin
  Result := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Header.TExamplesType.TAdditionalPropertiesType.Create;

  additionalProperties := additionalProperties + [TDynamicPair<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Header.TExamplesType.TAdditionalPropertiesType>.Create(Name, Result)];
end;

{ OpenAPIDefinition.Header.TExamplesType.TAdditionalPropertiesType }

destructor OpenAPIDefinition.Header.TExamplesType.TAdditionalPropertiesType.Destroy;
begin
  FExample.Free;

  FReference.Free;

  inherited;
end;

function OpenAPIDefinition.Header.TExamplesType.TAdditionalPropertiesType.GetExample: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Example;
begin
  if not Assigned(FExample) then
    Example := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Example.Create;

  Result := FExample;
end;

procedure OpenAPIDefinition.Header.TExamplesType.TAdditionalPropertiesType.SetExample(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Example);
begin
  FExample := Value;
  FExampleStored := True;
end;

function OpenAPIDefinition.Header.TExamplesType.TAdditionalPropertiesType.GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    Reference := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

procedure OpenAPIDefinition.Header.TExamplesType.TAdditionalPropertiesType.SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
begin
  FReference := Value;
  FReferenceStored := True;
end;

{ OpenAPIDefinition.PathsType }

destructor OpenAPIDefinition.PathsType.Destroy;
begin
  for var Item in FPathItem do
    Item.Value.Free;

  inherited;
end;

function OpenAPIDefinition.PathsType.AddPathItem(const Name: String): Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.PathItem;
begin
  Result := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.PathItem.Create;

  PathItem := PathItem + [TDynamicPair<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.PathItem>.Create(Name, Result)];
end;

procedure OpenAPIDefinition.PathsType.AddPatternProperty2(const Name: String; const Value: System.Rtti.TValue);
begin
  PatternProperty2 := PatternProperty2 + [TDynamicPair<System.Rtti.TValue>.Create(Name, Value)];
end;

{ OpenAPIDefinition.PathItem }

destructor OpenAPIDefinition.PathItem.Destroy;
begin
  FGet.Free;

  FPut.Free;

  FPost.Free;

  FDelete.Free;

  FOptions.Free;

  FHead.Free;

  FPatch.Free;

  FTrace.Free;

  for var Item in FServers do
    Item.Free;

  for var Item in FParameters do
    Item.Free;

  inherited;
end;

procedure OpenAPIDefinition.PathItem.SetRef(const Value: System.String);
begin
  FRef := Value;
  FRefStored := True;
end;

procedure OpenAPIDefinition.PathItem.SetSummary(const Value: System.String);
begin
  FSummary := Value;
  FSummaryStored := True;
end;

procedure OpenAPIDefinition.PathItem.SetDescription(const Value: System.String);
begin
  FDescription := Value;
  FDescriptionStored := True;
end;

function OpenAPIDefinition.PathItem.GetGet: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation;
begin
  if not Assigned(FGet) then
    get := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation.Create;

  Result := FGet;
end;

procedure OpenAPIDefinition.PathItem.SetGet(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation);
begin
  FGet := Value;
  FGetStored := True;
end;

function OpenAPIDefinition.PathItem.GetPut: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation;
begin
  if not Assigned(FPut) then
    put := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation.Create;

  Result := FPut;
end;

procedure OpenAPIDefinition.PathItem.SetPut(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation);
begin
  FPut := Value;
  FPutStored := True;
end;

function OpenAPIDefinition.PathItem.GetPost: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation;
begin
  if not Assigned(FPost) then
    post := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation.Create;

  Result := FPost;
end;

procedure OpenAPIDefinition.PathItem.SetPost(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation);
begin
  FPost := Value;
  FPostStored := True;
end;

function OpenAPIDefinition.PathItem.GetDelete: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation;
begin
  if not Assigned(FDelete) then
    delete := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation.Create;

  Result := FDelete;
end;

procedure OpenAPIDefinition.PathItem.SetDelete(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation);
begin
  FDelete := Value;
  FDeleteStored := True;
end;

function OpenAPIDefinition.PathItem.GetOptions: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation;
begin
  if not Assigned(FOptions) then
    options := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation.Create;

  Result := FOptions;
end;

procedure OpenAPIDefinition.PathItem.SetOptions(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation);
begin
  FOptions := Value;
  FOptionsStored := True;
end;

function OpenAPIDefinition.PathItem.GetHead: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation;
begin
  if not Assigned(FHead) then
    head := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation.Create;

  Result := FHead;
end;

procedure OpenAPIDefinition.PathItem.SetHead(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation);
begin
  FHead := Value;
  FHeadStored := True;
end;

function OpenAPIDefinition.PathItem.GetPatch: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation;
begin
  if not Assigned(FPatch) then
    patch := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation.Create;

  Result := FPatch;
end;

procedure OpenAPIDefinition.PathItem.SetPatch(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation);
begin
  FPatch := Value;
  FPatchStored := True;
end;

function OpenAPIDefinition.PathItem.GetTrace: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation;
begin
  if not Assigned(FTrace) then
    trace := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation.Create;

  Result := FTrace;
end;

procedure OpenAPIDefinition.PathItem.SetTrace(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation);
begin
  FTrace := Value;
  FTraceStored := True;
end;

function OpenAPIDefinition.PathItem.AddServers: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Server;
begin
  Result := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Server.Create;

  servers := servers + [Result];
end;

procedure OpenAPIDefinition.PathItem.SetServers(const Value: System.TArray<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Server>);
begin
  FServers := Value;
  FServersStored := True;
end;

function OpenAPIDefinition.PathItem.AddParameters: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.PathItem.TParametersTypeArray;
begin
  Result := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.PathItem.TParametersTypeArray.Create;

  parameters := parameters + [Result];
end;

procedure OpenAPIDefinition.PathItem.SetParameters(const Value: System.TArray<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.PathItem.TParametersTypeArray>);
begin
  FParameters := Value;
  FParametersStored := True;
end;

procedure OpenAPIDefinition.PathItem.AddPatternProperty14(const Name: String; const Value: System.Rtti.TValue);
begin
  PatternProperty14 := PatternProperty14 + [TDynamicPair<System.Rtti.TValue>.Create(Name, Value)];
end;

{ OpenAPIDefinition.PathItem.TParametersTypeArray }

destructor OpenAPIDefinition.PathItem.TParametersTypeArray.Destroy;
begin
  FParameter.Free;

  FReference.Free;

  inherited;
end;

function OpenAPIDefinition.PathItem.TParametersTypeArray.GetParameter: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Parameter;
begin
  if not Assigned(FParameter) then
    Parameter := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Parameter.Create;

  Result := FParameter;
end;

procedure OpenAPIDefinition.PathItem.TParametersTypeArray.SetParameter(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Parameter);
begin
  FParameter := Value;
  FParameterStored := True;
end;

function OpenAPIDefinition.PathItem.TParametersTypeArray.GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    Reference := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

procedure OpenAPIDefinition.PathItem.TParametersTypeArray.SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
begin
  FReference := Value;
  FReferenceStored := True;
end;

{ OpenAPIDefinition.Operation }

destructor OpenAPIDefinition.Operation.Destroy;
begin
  FExternalDocs.Free;

  for var Item in FParameters do
    Item.Free;

  FRequestBody.Free;

  FResponses.Free;

  FCallbacks.Free;

  for var Item in FSecurity do
    Item.Free;

  for var Item in FServers do
    Item.Free;

  inherited;
end;

procedure OpenAPIDefinition.Operation.AddTags(const Value: System.String);
begin
  tags := tags + [Value];
end;

procedure OpenAPIDefinition.Operation.SetTags(const Value: System.TArray<System.String>);
begin
  FTags := Value;
  FTagsStored := True;
end;

procedure OpenAPIDefinition.Operation.SetSummary(const Value: System.String);
begin
  FSummary := Value;
  FSummaryStored := True;
end;

procedure OpenAPIDefinition.Operation.SetDescription(const Value: System.String);
begin
  FDescription := Value;
  FDescriptionStored := True;
end;

function OpenAPIDefinition.Operation.GetExternalDocs: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ExternalDocumentation;
begin
  if not Assigned(FExternalDocs) then
    externalDocs := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ExternalDocumentation.Create;

  Result := FExternalDocs;
end;

procedure OpenAPIDefinition.Operation.SetExternalDocs(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ExternalDocumentation);
begin
  FExternalDocs := Value;
  FExternalDocsStored := True;
end;

procedure OpenAPIDefinition.Operation.SetOperationId(const Value: System.String);
begin
  FOperationId := Value;
  FOperationIdStored := True;
end;

function OpenAPIDefinition.Operation.AddParameters: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation.TParametersTypeArray;
begin
  Result := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation.TParametersTypeArray.Create;

  parameters := parameters + [Result];
end;

procedure OpenAPIDefinition.Operation.SetParameters(const Value: System.TArray<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation.TParametersTypeArray>);
begin
  FParameters := Value;
  FParametersStored := True;
end;

function OpenAPIDefinition.Operation.GetRequestBody: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation.TRequestBodyType;
begin
  if not Assigned(FRequestBody) then
    requestBody := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation.TRequestBodyType.Create;

  Result := FRequestBody;
end;

procedure OpenAPIDefinition.Operation.SetRequestBody(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation.TRequestBodyType);
begin
  FRequestBody := Value;
  FRequestBodyStored := True;
end;

function OpenAPIDefinition.Operation.GetResponses: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Responses;
begin
  if not Assigned(FResponses) then
    responses := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Responses.Create;

  Result := FResponses;
end;

function OpenAPIDefinition.Operation.GetCallbacks: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation.TCallbacksType;
begin
  if not Assigned(FCallbacks) then
    callbacks := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation.TCallbacksType.Create;

  Result := FCallbacks;
end;

procedure OpenAPIDefinition.Operation.SetCallbacks(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation.TCallbacksType);
begin
  FCallbacks := Value;
  FCallbacksStored := True;
end;

procedure OpenAPIDefinition.Operation.SetDeprecated(const Value: System.Boolean);
begin
  FDeprecated := Value;
  FDeprecatedStored := True;
end;

function OpenAPIDefinition.Operation.AddSecurity: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.SecurityRequirement;
begin
  Result := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.SecurityRequirement.Create;

  security := security + [Result];
end;

procedure OpenAPIDefinition.Operation.SetSecurity(const Value: System.TArray<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.SecurityRequirement>);
begin
  FSecurity := Value;
  FSecurityStored := True;
end;

function OpenAPIDefinition.Operation.AddServers: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Server;
begin
  Result := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Server.Create;

  servers := servers + [Result];
end;

procedure OpenAPIDefinition.Operation.SetServers(const Value: System.TArray<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Server>);
begin
  FServers := Value;
  FServersStored := True;
end;

procedure OpenAPIDefinition.Operation.AddPatternProperty13(const Name: String; const Value: System.Rtti.TValue);
begin
  PatternProperty13 := PatternProperty13 + [TDynamicPair<System.Rtti.TValue>.Create(Name, Value)];
end;

{ OpenAPIDefinition.Operation.TParametersTypeArray }

destructor OpenAPIDefinition.Operation.TParametersTypeArray.Destroy;
begin
  FParameter.Free;

  FReference.Free;

  inherited;
end;

function OpenAPIDefinition.Operation.TParametersTypeArray.GetParameter: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Parameter;
begin
  if not Assigned(FParameter) then
    Parameter := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Parameter.Create;

  Result := FParameter;
end;

procedure OpenAPIDefinition.Operation.TParametersTypeArray.SetParameter(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Parameter);
begin
  FParameter := Value;
  FParameterStored := True;
end;

function OpenAPIDefinition.Operation.TParametersTypeArray.GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    Reference := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

procedure OpenAPIDefinition.Operation.TParametersTypeArray.SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
begin
  FReference := Value;
  FReferenceStored := True;
end;

{ OpenAPIDefinition.Operation.TRequestBodyType }

destructor OpenAPIDefinition.Operation.TRequestBodyType.Destroy;
begin
  FRequestBody.Free;

  FReference.Free;

  inherited;
end;

function OpenAPIDefinition.Operation.TRequestBodyType.GetRequestBody: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.RequestBody;
begin
  if not Assigned(FRequestBody) then
    RequestBody := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.RequestBody.Create;

  Result := FRequestBody;
end;

procedure OpenAPIDefinition.Operation.TRequestBodyType.SetRequestBody(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.RequestBody);
begin
  FRequestBody := Value;
  FRequestBodyStored := True;
end;

function OpenAPIDefinition.Operation.TRequestBodyType.GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    Reference := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

procedure OpenAPIDefinition.Operation.TRequestBodyType.SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
begin
  FReference := Value;
  FReferenceStored := True;
end;

{ OpenAPIDefinition.Operation.TCallbacksType }

destructor OpenAPIDefinition.Operation.TCallbacksType.Destroy;
begin
  for var Item in FAdditionalProperties do
    Item.Value.Free;

  inherited;
end;

function OpenAPIDefinition.Operation.TCallbacksType.AddAdditionalProperties(const Name: String): Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation.TCallbacksType.TAdditionalPropertiesType;
begin
  Result := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation.TCallbacksType.TAdditionalPropertiesType.Create;

  additionalProperties := additionalProperties + [TDynamicPair<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Operation.TCallbacksType.TAdditionalPropertiesType>.Create(Name, Result)];
end;

{ OpenAPIDefinition.Operation.TCallbacksType.TAdditionalPropertiesType }

destructor OpenAPIDefinition.Operation.TCallbacksType.TAdditionalPropertiesType.Destroy;
begin
  FCallback.Free;

  FReference.Free;

  inherited;
end;

function OpenAPIDefinition.Operation.TCallbacksType.TAdditionalPropertiesType.GetCallback: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Callback;
begin
  if not Assigned(FCallback) then
    Callback := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Callback.Create;

  Result := FCallback;
end;

procedure OpenAPIDefinition.Operation.TCallbacksType.TAdditionalPropertiesType.SetCallback(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Callback);
begin
  FCallback := Value;
  FCallbackStored := True;
end;

function OpenAPIDefinition.Operation.TCallbacksType.TAdditionalPropertiesType.GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    Reference := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

procedure OpenAPIDefinition.Operation.TCallbacksType.TAdditionalPropertiesType.SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
begin
  FReference := Value;
  FReferenceStored := True;
end;

{ OpenAPIDefinition.Responses }

destructor OpenAPIDefinition.Responses.Destroy;
begin
  FDefault.Free;

  for var Item in FPatternProperty2 do
    Item.Value.Free;

  inherited;
end;

function OpenAPIDefinition.Responses.GetDefault: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Responses.TDefaultType;
begin
  if not Assigned(FDefault) then
    default := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Responses.TDefaultType.Create;

  Result := FDefault;
end;

procedure OpenAPIDefinition.Responses.SetDefault(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Responses.TDefaultType);
begin
  FDefault := Value;
  FDefaultStored := True;
end;

function OpenAPIDefinition.Responses.AddPatternProperty2(const Name: String): Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Responses.TPatternProperty2Type;
begin
  Result := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Responses.TPatternProperty2Type.Create;

  PatternProperty2 := PatternProperty2 + [TDynamicPair<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Responses.TPatternProperty2Type>.Create(Name, Result)];
end;

procedure OpenAPIDefinition.Responses.AddPatternProperty3(const Name: String; const Value: System.Rtti.TValue);
begin
  PatternProperty3 := PatternProperty3 + [TDynamicPair<System.Rtti.TValue>.Create(Name, Value)];
end;

{ OpenAPIDefinition.Responses.TDefaultType }

destructor OpenAPIDefinition.Responses.TDefaultType.Destroy;
begin
  FResponse.Free;

  FReference.Free;

  inherited;
end;

function OpenAPIDefinition.Responses.TDefaultType.GetResponse: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Response;
begin
  if not Assigned(FResponse) then
    Response := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Response.Create;

  Result := FResponse;
end;

procedure OpenAPIDefinition.Responses.TDefaultType.SetResponse(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Response);
begin
  FResponse := Value;
  FResponseStored := True;
end;

function OpenAPIDefinition.Responses.TDefaultType.GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    Reference := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

procedure OpenAPIDefinition.Responses.TDefaultType.SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
begin
  FReference := Value;
  FReferenceStored := True;
end;

{ OpenAPIDefinition.Responses.TPatternProperty2Type }

destructor OpenAPIDefinition.Responses.TPatternProperty2Type.Destroy;
begin
  FResponse.Free;

  FReference.Free;

  inherited;
end;

function OpenAPIDefinition.Responses.TPatternProperty2Type.GetResponse: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Response;
begin
  if not Assigned(FResponse) then
    Response := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Response.Create;

  Result := FResponse;
end;

procedure OpenAPIDefinition.Responses.TPatternProperty2Type.SetResponse(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Response);
begin
  FResponse := Value;
  FResponseStored := True;
end;

function OpenAPIDefinition.Responses.TPatternProperty2Type.GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    Reference := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

procedure OpenAPIDefinition.Responses.TPatternProperty2Type.SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
begin
  FReference := Value;
  FReferenceStored := True;
end;

{ OpenAPIDefinition.SecurityRequirement }

procedure OpenAPIDefinition.SecurityRequirement.AddAdditionalProperties(const Name: String; const Value: System.TArray<System.String>);
begin
  additionalProperties := additionalProperties + [TDynamicPair<System.TArray<System.String>>.Create(Name, Value)];
end;

{ OpenAPIDefinition.Tag }

destructor OpenAPIDefinition.Tag.Destroy;
begin
  FExternalDocs.Free;

  inherited;
end;

procedure OpenAPIDefinition.Tag.SetDescription(const Value: System.String);
begin
  FDescription := Value;
  FDescriptionStored := True;
end;

function OpenAPIDefinition.Tag.GetExternalDocs: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ExternalDocumentation;
begin
  if not Assigned(FExternalDocs) then
    externalDocs := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ExternalDocumentation.Create;

  Result := FExternalDocs;
end;

procedure OpenAPIDefinition.Tag.SetExternalDocs(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ExternalDocumentation);
begin
  FExternalDocs := Value;
  FExternalDocsStored := True;
end;

procedure OpenAPIDefinition.Tag.AddPatternProperty4(const Name: String; const Value: System.Rtti.TValue);
begin
  PatternProperty4 := PatternProperty4 + [TDynamicPair<System.Rtti.TValue>.Create(Name, Value)];
end;

{ OpenAPIDefinition.ExternalDocumentation }

procedure OpenAPIDefinition.ExternalDocumentation.SetDescription(const Value: System.String);
begin
  FDescription := Value;
  FDescriptionStored := True;
end;

procedure OpenAPIDefinition.ExternalDocumentation.AddPatternProperty3(const Name: String; const Value: System.Rtti.TValue);
begin
  PatternProperty3 := PatternProperty3 + [TDynamicPair<System.Rtti.TValue>.Create(Name, Value)];
end;

{ OpenAPIDefinition.SchemaXORContent }

destructor OpenAPIDefinition.SchemaXORContent.Destroy;
begin
  FOneOf2.Free;

  inherited;
end;

procedure OpenAPIDefinition.SchemaXORContent.SetOneOf(const Value: System.Rtti.TValue);
begin
  FOneOf := Value;
  FOneOfStored := True;
end;

function OpenAPIDefinition.SchemaXORContent.GetOneOf2: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.SchemaXORContent.TOneOf2Type;
begin
  if not Assigned(FOneOf2) then
    OneOf2 := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.SchemaXORContent.TOneOf2Type.Create;

  Result := FOneOf2;
end;

procedure OpenAPIDefinition.SchemaXORContent.SetOneOf2(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.SchemaXORContent.TOneOf2Type);
begin
  FOneOf2 := Value;
  FOneOf2Stored := True;
end;

{ OpenAPIDefinition.Parameter }

destructor OpenAPIDefinition.Parameter.Destroy;
begin
  FSchema.Free;

  FContent.Free;

  FExamples.Free;

  inherited;
end;

procedure OpenAPIDefinition.Parameter.SetDescription(const Value: System.String);
begin
  FDescription := Value;
  FDescriptionStored := True;
end;

procedure OpenAPIDefinition.Parameter.SetRequired(const Value: System.Boolean);
begin
  FRequired := Value;
  FRequiredStored := True;
end;

procedure OpenAPIDefinition.Parameter.SetDeprecated(const Value: System.Boolean);
begin
  FDeprecated := Value;
  FDeprecatedStored := True;
end;

procedure OpenAPIDefinition.Parameter.SetAllowEmptyValue(const Value: System.Boolean);
begin
  FAllowEmptyValue := Value;
  FAllowEmptyValueStored := True;
end;

procedure OpenAPIDefinition.Parameter.SetStyle(const Value: System.String);
begin
  FStyle := Value;
  FStyleStored := True;
end;

procedure OpenAPIDefinition.Parameter.SetExplode(const Value: System.Boolean);
begin
  FExplode := Value;
  FExplodeStored := True;
end;

procedure OpenAPIDefinition.Parameter.SetAllowReserved(const Value: System.Boolean);
begin
  FAllowReserved := Value;
  FAllowReservedStored := True;
end;

function OpenAPIDefinition.Parameter.GetSchema: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Parameter.TSchemaType;
begin
  if not Assigned(FSchema) then
    schema := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Parameter.TSchemaType.Create;

  Result := FSchema;
end;

procedure OpenAPIDefinition.Parameter.SetSchema(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Parameter.TSchemaType);
begin
  FSchema := Value;
  FSchemaStored := True;
end;

function OpenAPIDefinition.Parameter.GetContent: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Parameter.TContentType;
begin
  if not Assigned(FContent) then
    content := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Parameter.TContentType.Create;

  Result := FContent;
end;

procedure OpenAPIDefinition.Parameter.SetContent(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Parameter.TContentType);
begin
  FContent := Value;
  FContentStored := True;
end;

procedure OpenAPIDefinition.Parameter.SetExample(const Value: System.Rtti.TValue);
begin
  FExample := Value;
  FExampleStored := True;
end;

function OpenAPIDefinition.Parameter.GetExamples: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Parameter.TExamplesType;
begin
  if not Assigned(FExamples) then
    examples := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Parameter.TExamplesType.Create;

  Result := FExamples;
end;

procedure OpenAPIDefinition.Parameter.SetExamples(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Parameter.TExamplesType);
begin
  FExamples := Value;
  FExamplesStored := True;
end;

procedure OpenAPIDefinition.Parameter.AddPatternProperty14(const Name: String; const Value: System.Rtti.TValue);
begin
  PatternProperty14 := PatternProperty14 + [TDynamicPair<System.Rtti.TValue>.Create(Name, Value)];
end;

{ OpenAPIDefinition.Parameter.TSchemaType }

destructor OpenAPIDefinition.Parameter.TSchemaType.Destroy;
begin
  FSchema.Free;

  FReference.Free;

  inherited;
end;

function OpenAPIDefinition.Parameter.TSchemaType.GetSchema: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema;
begin
  if not Assigned(FSchema) then
    Schema := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema.Create;

  Result := FSchema;
end;

procedure OpenAPIDefinition.Parameter.TSchemaType.SetSchema(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Schema);
begin
  FSchema := Value;
  FSchemaStored := True;
end;

function OpenAPIDefinition.Parameter.TSchemaType.GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    Reference := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

procedure OpenAPIDefinition.Parameter.TSchemaType.SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
begin
  FReference := Value;
  FReferenceStored := True;
end;

{ OpenAPIDefinition.Parameter.TContentType }

destructor OpenAPIDefinition.Parameter.TContentType.Destroy;
begin
  for var Item in FAdditionalProperties do
    Item.Value.Free;

  inherited;
end;

function OpenAPIDefinition.Parameter.TContentType.AddAdditionalProperties(const Name: String): Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.MediaType;
begin
  Result := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.MediaType.Create;

  additionalProperties := additionalProperties + [TDynamicPair<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.MediaType>.Create(Name, Result)];
end;

{ OpenAPIDefinition.Parameter.TExamplesType }

destructor OpenAPIDefinition.Parameter.TExamplesType.Destroy;
begin
  for var Item in FAdditionalProperties do
    Item.Value.Free;

  inherited;
end;

function OpenAPIDefinition.Parameter.TExamplesType.AddAdditionalProperties(const Name: String): Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Parameter.TExamplesType.TAdditionalPropertiesType;
begin
  Result := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Parameter.TExamplesType.TAdditionalPropertiesType.Create;

  additionalProperties := additionalProperties + [TDynamicPair<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Parameter.TExamplesType.TAdditionalPropertiesType>.Create(Name, Result)];
end;

{ OpenAPIDefinition.Parameter.TExamplesType.TAdditionalPropertiesType }

destructor OpenAPIDefinition.Parameter.TExamplesType.TAdditionalPropertiesType.Destroy;
begin
  FExample.Free;

  FReference.Free;

  inherited;
end;

function OpenAPIDefinition.Parameter.TExamplesType.TAdditionalPropertiesType.GetExample: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Example;
begin
  if not Assigned(FExample) then
    Example := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Example.Create;

  Result := FExample;
end;

procedure OpenAPIDefinition.Parameter.TExamplesType.TAdditionalPropertiesType.SetExample(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Example);
begin
  FExample := Value;
  FExampleStored := True;
end;

function OpenAPIDefinition.Parameter.TExamplesType.TAdditionalPropertiesType.GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    Reference := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

procedure OpenAPIDefinition.Parameter.TExamplesType.TAdditionalPropertiesType.SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
begin
  FReference := Value;
  FReferenceStored := True;
end;

{ OpenAPIDefinition.PathParameter }

procedure OpenAPIDefinition.PathParameter.SetIn(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.PathParameter.TInType);
begin
  FIn := Value;
  FInStored := True;
end;

procedure OpenAPIDefinition.PathParameter.SetStyle(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.PathParameter.TStyleType);
begin
  FStyle := Value;
  FStyleStored := True;
end;

{ OpenAPIDefinition.QueryParameter }

procedure OpenAPIDefinition.QueryParameter.SetIn(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.QueryParameter.TInType);
begin
  FIn := Value;
  FInStored := True;
end;

procedure OpenAPIDefinition.QueryParameter.SetStyle(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.QueryParameter.TStyleType);
begin
  FStyle := Value;
  FStyleStored := True;
end;

{ OpenAPIDefinition.HeaderParameter }

procedure OpenAPIDefinition.HeaderParameter.SetIn(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.HeaderParameter.TInType);
begin
  FIn := Value;
  FInStored := True;
end;

procedure OpenAPIDefinition.HeaderParameter.SetStyle(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.HeaderParameter.TStyleType);
begin
  FStyle := Value;
  FStyleStored := True;
end;

{ OpenAPIDefinition.CookieParameter }

procedure OpenAPIDefinition.CookieParameter.SetIn(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.CookieParameter.TInType);
begin
  FIn := Value;
  FInStored := True;
end;

procedure OpenAPIDefinition.CookieParameter.SetStyle(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.CookieParameter.TStyleType);
begin
  FStyle := Value;
  FStyleStored := True;
end;

{ OpenAPIDefinition.RequestBody }

destructor OpenAPIDefinition.RequestBody.Destroy;
begin
  FContent.Free;

  inherited;
end;

procedure OpenAPIDefinition.RequestBody.SetDescription(const Value: System.String);
begin
  FDescription := Value;
  FDescriptionStored := True;
end;

function OpenAPIDefinition.RequestBody.GetContent: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.RequestBody.TContentType;
begin
  if not Assigned(FContent) then
    content := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.RequestBody.TContentType.Create;

  Result := FContent;
end;

procedure OpenAPIDefinition.RequestBody.SetRequired(const Value: System.Boolean);
begin
  FRequired := Value;
  FRequiredStored := True;
end;

procedure OpenAPIDefinition.RequestBody.AddPatternProperty4(const Name: String; const Value: System.Rtti.TValue);
begin
  PatternProperty4 := PatternProperty4 + [TDynamicPair<System.Rtti.TValue>.Create(Name, Value)];
end;

{ OpenAPIDefinition.RequestBody.TContentType }

destructor OpenAPIDefinition.RequestBody.TContentType.Destroy;
begin
  for var Item in FAdditionalProperties do
    Item.Value.Free;

  inherited;
end;

function OpenAPIDefinition.RequestBody.TContentType.AddAdditionalProperties(const Name: String): Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.MediaType;
begin
  Result := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.MediaType.Create;

  additionalProperties := additionalProperties + [TDynamicPair<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.MediaType>.Create(Name, Result)];
end;

{ OpenAPIDefinition.SecurityScheme }

destructor OpenAPIDefinition.SecurityScheme.Destroy;
begin
  FAPIKeySecurityScheme.Free;

  FHTTPSecurityScheme.Free;

  FOAuth2SecurityScheme.Free;

  FOpenIdConnectSecurityScheme.Free;

  inherited;
end;

function OpenAPIDefinition.SecurityScheme.GetAPIKeySecurityScheme: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.APIKeySecurityScheme;
begin
  if not Assigned(FAPIKeySecurityScheme) then
    APIKeySecurityScheme := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.APIKeySecurityScheme.Create;

  Result := FAPIKeySecurityScheme;
end;

procedure OpenAPIDefinition.SecurityScheme.SetAPIKeySecurityScheme(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.APIKeySecurityScheme);
begin
  FAPIKeySecurityScheme := Value;
  FAPIKeySecuritySchemeStored := True;
end;

function OpenAPIDefinition.SecurityScheme.GetHTTPSecurityScheme: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.HTTPSecurityScheme;
begin
  if not Assigned(FHTTPSecurityScheme) then
    HTTPSecurityScheme := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.HTTPSecurityScheme.Create;

  Result := FHTTPSecurityScheme;
end;

procedure OpenAPIDefinition.SecurityScheme.SetHTTPSecurityScheme(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.HTTPSecurityScheme);
begin
  FHTTPSecurityScheme := Value;
  FHTTPSecuritySchemeStored := True;
end;

function OpenAPIDefinition.SecurityScheme.GetOAuth2SecurityScheme: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.OAuth2SecurityScheme;
begin
  if not Assigned(FOAuth2SecurityScheme) then
    OAuth2SecurityScheme := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.OAuth2SecurityScheme.Create;

  Result := FOAuth2SecurityScheme;
end;

procedure OpenAPIDefinition.SecurityScheme.SetOAuth2SecurityScheme(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.OAuth2SecurityScheme);
begin
  FOAuth2SecurityScheme := Value;
  FOAuth2SecuritySchemeStored := True;
end;

function OpenAPIDefinition.SecurityScheme.GetOpenIdConnectSecurityScheme: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.OpenIdConnectSecurityScheme;
begin
  if not Assigned(FOpenIdConnectSecurityScheme) then
    OpenIdConnectSecurityScheme := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.OpenIdConnectSecurityScheme.Create;

  Result := FOpenIdConnectSecurityScheme;
end;

procedure OpenAPIDefinition.SecurityScheme.SetOpenIdConnectSecurityScheme(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.OpenIdConnectSecurityScheme);
begin
  FOpenIdConnectSecurityScheme := Value;
  FOpenIdConnectSecuritySchemeStored := True;
end;

{ OpenAPIDefinition.APIKeySecurityScheme }

procedure OpenAPIDefinition.APIKeySecurityScheme.SetDescription(const Value: System.String);
begin
  FDescription := Value;
  FDescriptionStored := True;
end;

procedure OpenAPIDefinition.APIKeySecurityScheme.AddPatternProperty5(const Name: String; const Value: System.Rtti.TValue);
begin
  PatternProperty5 := PatternProperty5 + [TDynamicPair<System.Rtti.TValue>.Create(Name, Value)];
end;

{ OpenAPIDefinition.HTTPSecurityScheme }

procedure OpenAPIDefinition.HTTPSecurityScheme.SetBearerFormat(const Value: System.String);
begin
  FBearerFormat := Value;
  FBearerFormatStored := True;
end;

procedure OpenAPIDefinition.HTTPSecurityScheme.SetDescription(const Value: System.String);
begin
  FDescription := Value;
  FDescriptionStored := True;
end;

procedure OpenAPIDefinition.HTTPSecurityScheme.AddPatternProperty5(const Name: String; const Value: System.Rtti.TValue);
begin
  PatternProperty5 := PatternProperty5 + [TDynamicPair<System.Rtti.TValue>.Create(Name, Value)];
end;

{ OpenAPIDefinition.OAuth2SecurityScheme }

destructor OpenAPIDefinition.OAuth2SecurityScheme.Destroy;
begin
  FFlows.Free;

  inherited;
end;

function OpenAPIDefinition.OAuth2SecurityScheme.GetFlows: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.OAuthFlows;
begin
  if not Assigned(FFlows) then
    flows := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.OAuthFlows.Create;

  Result := FFlows;
end;

procedure OpenAPIDefinition.OAuth2SecurityScheme.SetDescription(const Value: System.String);
begin
  FDescription := Value;
  FDescriptionStored := True;
end;

procedure OpenAPIDefinition.OAuth2SecurityScheme.AddPatternProperty4(const Name: String; const Value: System.Rtti.TValue);
begin
  PatternProperty4 := PatternProperty4 + [TDynamicPair<System.Rtti.TValue>.Create(Name, Value)];
end;

{ OpenAPIDefinition.OpenIdConnectSecurityScheme }

procedure OpenAPIDefinition.OpenIdConnectSecurityScheme.SetDescription(const Value: System.String);
begin
  FDescription := Value;
  FDescriptionStored := True;
end;

procedure OpenAPIDefinition.OpenIdConnectSecurityScheme.AddPatternProperty4(const Name: String; const Value: System.Rtti.TValue);
begin
  PatternProperty4 := PatternProperty4 + [TDynamicPair<System.Rtti.TValue>.Create(Name, Value)];
end;

{ OpenAPIDefinition.OAuthFlows }

destructor OpenAPIDefinition.OAuthFlows.Destroy;
begin
  FImplicit.Free;

  FPassword.Free;

  FClientCredentials.Free;

  FAuthorizationCode.Free;

  inherited;
end;

function OpenAPIDefinition.OAuthFlows.GetImplicit: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ImplicitOAuthFlow;
begin
  if not Assigned(FImplicit) then
    implicit := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ImplicitOAuthFlow.Create;

  Result := FImplicit;
end;

procedure OpenAPIDefinition.OAuthFlows.SetImplicit(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ImplicitOAuthFlow);
begin
  FImplicit := Value;
  FImplicitStored := True;
end;

function OpenAPIDefinition.OAuthFlows.GetPassword: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.PasswordOAuthFlow;
begin
  if not Assigned(FPassword) then
    password := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.PasswordOAuthFlow.Create;

  Result := FPassword;
end;

procedure OpenAPIDefinition.OAuthFlows.SetPassword(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.PasswordOAuthFlow);
begin
  FPassword := Value;
  FPasswordStored := True;
end;

function OpenAPIDefinition.OAuthFlows.GetClientCredentials: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ClientCredentialsFlow;
begin
  if not Assigned(FClientCredentials) then
    clientCredentials := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ClientCredentialsFlow.Create;

  Result := FClientCredentials;
end;

procedure OpenAPIDefinition.OAuthFlows.SetClientCredentials(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ClientCredentialsFlow);
begin
  FClientCredentials := Value;
  FClientCredentialsStored := True;
end;

function OpenAPIDefinition.OAuthFlows.GetAuthorizationCode: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.AuthorizationCodeOAuthFlow;
begin
  if not Assigned(FAuthorizationCode) then
    authorizationCode := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.AuthorizationCodeOAuthFlow.Create;

  Result := FAuthorizationCode;
end;

procedure OpenAPIDefinition.OAuthFlows.SetAuthorizationCode(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.AuthorizationCodeOAuthFlow);
begin
  FAuthorizationCode := Value;
  FAuthorizationCodeStored := True;
end;

procedure OpenAPIDefinition.OAuthFlows.AddPatternProperty5(const Name: String; const Value: System.Rtti.TValue);
begin
  PatternProperty5 := PatternProperty5 + [TDynamicPair<System.Rtti.TValue>.Create(Name, Value)];
end;

{ OpenAPIDefinition.ImplicitOAuthFlow }

destructor OpenAPIDefinition.ImplicitOAuthFlow.Destroy;
begin
  FScopes.Free;

  inherited;
end;

procedure OpenAPIDefinition.ImplicitOAuthFlow.SetRefreshUrl(const Value: System.String);
begin
  FRefreshUrl := Value;
  FRefreshUrlStored := True;
end;

function OpenAPIDefinition.ImplicitOAuthFlow.GetScopes: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ImplicitOAuthFlow.TScopesType;
begin
  if not Assigned(FScopes) then
    scopes := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ImplicitOAuthFlow.TScopesType.Create;

  Result := FScopes;
end;

procedure OpenAPIDefinition.ImplicitOAuthFlow.AddPatternProperty4(const Name: String; const Value: System.Rtti.TValue);
begin
  PatternProperty4 := PatternProperty4 + [TDynamicPair<System.Rtti.TValue>.Create(Name, Value)];
end;

{ OpenAPIDefinition.ImplicitOAuthFlow.TScopesType }

procedure OpenAPIDefinition.ImplicitOAuthFlow.TScopesType.AddAdditionalProperties(const Name: String; const Value: System.String);
begin
  additionalProperties := additionalProperties + [TDynamicPair<System.String>.Create(Name, Value)];
end;

{ OpenAPIDefinition.PasswordOAuthFlow }

destructor OpenAPIDefinition.PasswordOAuthFlow.Destroy;
begin
  FScopes.Free;

  inherited;
end;

procedure OpenAPIDefinition.PasswordOAuthFlow.SetRefreshUrl(const Value: System.String);
begin
  FRefreshUrl := Value;
  FRefreshUrlStored := True;
end;

function OpenAPIDefinition.PasswordOAuthFlow.GetScopes: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.PasswordOAuthFlow.TScopesType;
begin
  if not Assigned(FScopes) then
    scopes := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.PasswordOAuthFlow.TScopesType.Create;

  Result := FScopes;
end;

procedure OpenAPIDefinition.PasswordOAuthFlow.AddPatternProperty4(const Name: String; const Value: System.Rtti.TValue);
begin
  PatternProperty4 := PatternProperty4 + [TDynamicPair<System.Rtti.TValue>.Create(Name, Value)];
end;

{ OpenAPIDefinition.PasswordOAuthFlow.TScopesType }

procedure OpenAPIDefinition.PasswordOAuthFlow.TScopesType.AddAdditionalProperties(const Name: String; const Value: System.String);
begin
  additionalProperties := additionalProperties + [TDynamicPair<System.String>.Create(Name, Value)];
end;

{ OpenAPIDefinition.ClientCredentialsFlow }

destructor OpenAPIDefinition.ClientCredentialsFlow.Destroy;
begin
  FScopes.Free;

  inherited;
end;

procedure OpenAPIDefinition.ClientCredentialsFlow.SetRefreshUrl(const Value: System.String);
begin
  FRefreshUrl := Value;
  FRefreshUrlStored := True;
end;

function OpenAPIDefinition.ClientCredentialsFlow.GetScopes: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ClientCredentialsFlow.TScopesType;
begin
  if not Assigned(FScopes) then
    scopes := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.ClientCredentialsFlow.TScopesType.Create;

  Result := FScopes;
end;

procedure OpenAPIDefinition.ClientCredentialsFlow.AddPatternProperty4(const Name: String; const Value: System.Rtti.TValue);
begin
  PatternProperty4 := PatternProperty4 + [TDynamicPair<System.Rtti.TValue>.Create(Name, Value)];
end;

{ OpenAPIDefinition.ClientCredentialsFlow.TScopesType }

procedure OpenAPIDefinition.ClientCredentialsFlow.TScopesType.AddAdditionalProperties(const Name: String; const Value: System.String);
begin
  additionalProperties := additionalProperties + [TDynamicPair<System.String>.Create(Name, Value)];
end;

{ OpenAPIDefinition.AuthorizationCodeOAuthFlow }

destructor OpenAPIDefinition.AuthorizationCodeOAuthFlow.Destroy;
begin
  FScopes.Free;

  inherited;
end;

procedure OpenAPIDefinition.AuthorizationCodeOAuthFlow.SetRefreshUrl(const Value: System.String);
begin
  FRefreshUrl := Value;
  FRefreshUrlStored := True;
end;

function OpenAPIDefinition.AuthorizationCodeOAuthFlow.GetScopes: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.AuthorizationCodeOAuthFlow.TScopesType;
begin
  if not Assigned(FScopes) then
    scopes := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.AuthorizationCodeOAuthFlow.TScopesType.Create;

  Result := FScopes;
end;

procedure OpenAPIDefinition.AuthorizationCodeOAuthFlow.AddPatternProperty5(const Name: String; const Value: System.Rtti.TValue);
begin
  PatternProperty5 := PatternProperty5 + [TDynamicPair<System.Rtti.TValue>.Create(Name, Value)];
end;

{ OpenAPIDefinition.AuthorizationCodeOAuthFlow.TScopesType }

procedure OpenAPIDefinition.AuthorizationCodeOAuthFlow.TScopesType.AddAdditionalProperties(const Name: String; const Value: System.String);
begin
  additionalProperties := additionalProperties + [TDynamicPair<System.String>.Create(Name, Value)];
end;

{ OpenAPIDefinition.Link }

destructor OpenAPIDefinition.Link.Destroy;
begin
  FParameters.Free;

  FServer.Free;

  inherited;
end;

procedure OpenAPIDefinition.Link.SetOperationId(const Value: System.String);
begin
  FOperationId := Value;
  FOperationIdStored := True;
end;

procedure OpenAPIDefinition.Link.SetOperationRef(const Value: System.String);
begin
  FOperationRef := Value;
  FOperationRefStored := True;
end;

function OpenAPIDefinition.Link.GetParameters: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Link.TParametersType;
begin
  if not Assigned(FParameters) then
    parameters := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Link.TParametersType.Create;

  Result := FParameters;
end;

procedure OpenAPIDefinition.Link.SetParameters(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Link.TParametersType);
begin
  FParameters := Value;
  FParametersStored := True;
end;

procedure OpenAPIDefinition.Link.SetRequestBody(const Value: System.Rtti.TValue);
begin
  FRequestBody := Value;
  FRequestBodyStored := True;
end;

procedure OpenAPIDefinition.Link.SetDescription(const Value: System.String);
begin
  FDescription := Value;
  FDescriptionStored := True;
end;

function OpenAPIDefinition.Link.GetServer: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Server;
begin
  if not Assigned(FServer) then
    server := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Server.Create;

  Result := FServer;
end;

procedure OpenAPIDefinition.Link.SetServer(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Server);
begin
  FServer := Value;
  FServerStored := True;
end;

procedure OpenAPIDefinition.Link.AddPatternProperty7(const Name: String; const Value: System.Rtti.TValue);
begin
  PatternProperty7 := PatternProperty7 + [TDynamicPair<System.Rtti.TValue>.Create(Name, Value)];
end;

{ OpenAPIDefinition.Link.TParametersType }

procedure OpenAPIDefinition.Link.TParametersType.AddAdditionalProperties(const Name: String; const Value: System.Rtti.TValue);
begin
  additionalProperties := additionalProperties + [TDynamicPair<System.Rtti.TValue>.Create(Name, Value)];
end;

{ OpenAPIDefinition.Callback }

destructor OpenAPIDefinition.Callback.Destroy;
begin
  for var Item in FAdditionalProperties do
    Item.Value.Free;

  inherited;
end;

function OpenAPIDefinition.Callback.AddAdditionalProperties(const Name: String): Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.PathItem;
begin
  Result := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.PathItem.Create;

  additionalProperties := additionalProperties + [TDynamicPair<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.PathItem>.Create(Name, Result)];
end;

procedure OpenAPIDefinition.Callback.AddPatternProperty2(const Name: String; const Value: System.Rtti.TValue);
begin
  PatternProperty2 := PatternProperty2 + [TDynamicPair<System.Rtti.TValue>.Create(Name, Value)];
end;

{ OpenAPIDefinition.Encoding }

destructor OpenAPIDefinition.Encoding.Destroy;
begin
  FHeaders.Free;

  inherited;
end;

procedure OpenAPIDefinition.Encoding.SetContentType(const Value: System.String);
begin
  FContentType := Value;
  FContentTypeStored := True;
end;

function OpenAPIDefinition.Encoding.GetHeaders: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Encoding.THeadersType;
begin
  if not Assigned(FHeaders) then
    headers := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Encoding.THeadersType.Create;

  Result := FHeaders;
end;

procedure OpenAPIDefinition.Encoding.SetHeaders(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Encoding.THeadersType);
begin
  FHeaders := Value;
  FHeadersStored := True;
end;

procedure OpenAPIDefinition.Encoding.SetStyle(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Encoding.TStyleType);
begin
  FStyle := Value;
  FStyleStored := True;
end;

procedure OpenAPIDefinition.Encoding.SetExplode(const Value: System.Boolean);
begin
  FExplode := Value;
  FExplodeStored := True;
end;

procedure OpenAPIDefinition.Encoding.SetAllowReserved(const Value: System.Boolean);
begin
  FAllowReserved := Value;
  FAllowReservedStored := True;
end;

procedure OpenAPIDefinition.Encoding.AddPatternProperty6(const Name: String; const Value: System.Rtti.TValue);
begin
  PatternProperty6 := PatternProperty6 + [TDynamicPair<System.Rtti.TValue>.Create(Name, Value)];
end;

{ OpenAPIDefinition.Encoding.THeadersType }

destructor OpenAPIDefinition.Encoding.THeadersType.Destroy;
begin
  for var Item in FAdditionalProperties do
    Item.Value.Free;

  inherited;
end;

function OpenAPIDefinition.Encoding.THeadersType.AddAdditionalProperties(const Name: String): Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Encoding.THeadersType.TAdditionalPropertiesType;
begin
  Result := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Encoding.THeadersType.TAdditionalPropertiesType.Create;

  additionalProperties := additionalProperties + [TDynamicPair<Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Encoding.THeadersType.TAdditionalPropertiesType>.Create(Name, Result)];
end;

{ OpenAPIDefinition.Encoding.THeadersType.TAdditionalPropertiesType }

destructor OpenAPIDefinition.Encoding.THeadersType.TAdditionalPropertiesType.Destroy;
begin
  FHeader.Free;

  FReference.Free;

  inherited;
end;

function OpenAPIDefinition.Encoding.THeadersType.TAdditionalPropertiesType.GetHeader: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Header;
begin
  if not Assigned(FHeader) then
    Header := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Header.Create;

  Result := FHeader;
end;

procedure OpenAPIDefinition.Encoding.THeadersType.TAdditionalPropertiesType.SetHeader(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Header);
begin
  FHeader := Value;
  FHeaderStored := True;
end;

function OpenAPIDefinition.Encoding.THeadersType.TAdditionalPropertiesType.GetReference: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    Reference := Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

procedure OpenAPIDefinition.Encoding.THeadersType.TAdditionalPropertiesType.SetReference(const Value: Blue.Print.OpenAPI30.Schema.OpenAPIDefinition.Reference);
begin
  FReference := Value;
  FReferenceStored := True;
end;

end.
