unit Blue.Print.Open.API.Schema.v30;

interface

{$M+}
{$SCOPEDENUMS ON}

// File generated from https://spec.openapis.org/oas/3.0/schema/2024-10-18;

uses Blue.Print.Types, System.Rtti;

type
  // Forward class declaration
  TOpenAPIDefinition = class;

  // Types alias
  any = System.Rtti.TValue;

  TOpenAPIDefinition = class
  public type
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
    TOpenAPIDefinition = class;

    // Types alias
    ExampleXORExamples = System.Rtti.TValue;

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
      property &string: TDynamicProperty<System.String> read GetString write FString stored GetStringStored;
    end;

    Info = class
    private
      FTitle: System.String;
      FDescription: System.String;
      FTermsOfService: System.String;
      FContact: TOpenAPIDefinition.Contact;
      FLicense: TOpenAPIDefinition.License;
      FVersion: System.String;
      FPatternProperty: TDynamicProperty<any>;

      function GetContact: TOpenAPIDefinition.Contact;
      function GetLicense: TOpenAPIDefinition.License;
      function GetPatternProperty: TDynamicProperty<any>;
      function GetDescriptionStored: Boolean;
      function GetTermsOfServiceStored: Boolean;
      function GetContactStored: Boolean;
      function GetLicenseStored: Boolean;
      function GetPatternPropertyStored: Boolean;
    public
      destructor Destroy; override;

      property IsDescriptionStored: Boolean read GetDescriptionStored;
      property IsTermsOfServiceStored: Boolean read GetTermsOfServiceStored;
      property IsContactStored: Boolean read GetContactStored;
      property IsLicenseStored: Boolean read GetLicenseStored;
      property IsPatternPropertyStored: Boolean read GetPatternPropertyStored;
    published
      property title: System.String read FTitle write FTitle;
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      property termsOfService: System.String read FTermsOfService write FTermsOfService stored GetTermsOfServiceStored;
      property contact: TOpenAPIDefinition.Contact read GetContact write FContact stored GetContactStored;
      property license: TOpenAPIDefinition.License read GetLicense write FLicense stored GetLicenseStored;
      property version: System.String read FVersion write FVersion;
      [PatternProperty('^x-')]
      property PatternProperty: TDynamicProperty<any> read GetPatternProperty write FPatternProperty stored GetPatternPropertyStored;
    end;

    Contact = class
    private
      FName: System.String;
      FUrl: System.String;
      FEmail: System.String;
      FPatternProperty: TDynamicProperty<any>;

      function GetPatternProperty: TDynamicProperty<any>;
      function GetNameStored: Boolean;
      function GetUrlStored: Boolean;
      function GetEmailStored: Boolean;
      function GetPatternPropertyStored: Boolean;
    public
      destructor Destroy; override;

      property IsNameStored: Boolean read GetNameStored;
      property IsUrlStored: Boolean read GetUrlStored;
      property IsEmailStored: Boolean read GetEmailStored;
      property IsPatternPropertyStored: Boolean read GetPatternPropertyStored;
    published
      property name: System.String read FName write FName stored GetNameStored;
      property url: System.String read FUrl write FUrl stored GetUrlStored;
      property email: System.String read FEmail write FEmail stored GetEmailStored;
      [PatternProperty('^x-')]
      property PatternProperty: TDynamicProperty<any> read GetPatternProperty write FPatternProperty stored GetPatternPropertyStored;
    end;

    License = class
    private
      FName: System.String;
      FUrl: System.String;
      FPatternProperty: TDynamicProperty<any>;

      function GetPatternProperty: TDynamicProperty<any>;
      function GetUrlStored: Boolean;
      function GetPatternPropertyStored: Boolean;
    public
      destructor Destroy; override;

      property IsUrlStored: Boolean read GetUrlStored;
      property IsPatternPropertyStored: Boolean read GetPatternPropertyStored;
    published
      property name: System.String read FName write FName;
      property url: System.String read FUrl write FUrl stored GetUrlStored;
      [PatternProperty('^x-')]
      property PatternProperty: TDynamicProperty<any> read GetPatternProperty write FPatternProperty stored GetPatternPropertyStored;
    end;

    Server = class
    public type
      // Forward class declaration
      TVariables = class;

      TVariables = class
      private
        FAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.ServerVariable>;

        function GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.ServerVariable>;
        function GetAdditionalPropertiesStored: Boolean;
      public
        destructor Destroy; override;

        property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
      published
        property additionalProperties: TDynamicProperty<TOpenAPIDefinition.ServerVariable> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
      end;
    private
      FUrl: System.String;
      FDescription: System.String;
      FVariables: TOpenAPIDefinition.Server.TVariables;
      FPatternProperty: TDynamicProperty<any>;

      function GetVariables: TOpenAPIDefinition.Server.TVariables;
      function GetPatternProperty: TDynamicProperty<any>;
      function GetDescriptionStored: Boolean;
      function GetVariablesStored: Boolean;
      function GetPatternPropertyStored: Boolean;
    public
      destructor Destroy; override;

      property IsDescriptionStored: Boolean read GetDescriptionStored;
      property IsVariablesStored: Boolean read GetVariablesStored;
      property IsPatternPropertyStored: Boolean read GetPatternPropertyStored;
    published
      property url: System.String read FUrl write FUrl;
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      property variables: TOpenAPIDefinition.Server.TVariables read GetVariables write FVariables stored GetVariablesStored;
      [PatternProperty('^x-')]
      property PatternProperty: TDynamicProperty<any> read GetPatternProperty write FPatternProperty stored GetPatternPropertyStored;
    end;

    ServerVariable = class
    private
      FEnum: TArray<System.String>;
      FDefault: System.String;
      FDescription: System.String;
      FPatternProperty: TDynamicProperty<any>;

      function GetPatternProperty: TDynamicProperty<any>;
      function GetEnumStored: Boolean;
      function GetDescriptionStored: Boolean;
      function GetPatternPropertyStored: Boolean;
    public
      destructor Destroy; override;

      property IsEnumStored: Boolean read GetEnumStored;
      property IsDescriptionStored: Boolean read GetDescriptionStored;
      property IsPatternPropertyStored: Boolean read GetPatternPropertyStored;
    published
      property enum: TArray<System.String> read FEnum write FEnum stored GetEnumStored;
      property default: System.String read FDefault write FDefault;
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      [PatternProperty('^x-')]
      property PatternProperty: TDynamicProperty<any> read GetPatternProperty write FPatternProperty stored GetPatternPropertyStored;
    end;

    Components = class
    public type
      // Forward class declaration
      TSchemas = class;
      TResponses = class;
      TParameters = class;
      TExamples = class;
      TRequestBodies = class;
      THeaders = class;
      TSecuritySchemes = class;
      TLinks = class;
      TCallbacks = class;

      TSchemas = class
      public type
        // Forward class declaration
        TPatternProperty = class;

        [Flat]
        TPatternProperty = class
        private
          FSchema: TOpenAPIDefinition.Schema;
          FReference: TOpenAPIDefinition.Reference;

          function GetSchema: TOpenAPIDefinition.Schema;
          function GetReference: TOpenAPIDefinition.Reference;
          function GetSchemaStored: Boolean;
          function GetReferenceStored: Boolean;
        public
          destructor Destroy; override;

          property IsSchemaStored: Boolean read GetSchemaStored;
          property IsReferenceStored: Boolean read GetReferenceStored;
        published
          property Schema: TOpenAPIDefinition.Schema read GetSchema write FSchema stored GetSchemaStored;
          property Reference: TOpenAPIDefinition.Reference read GetReference write FReference stored GetReferenceStored;
        end;
      private
        FPatternProperty: TDynamicProperty<TOpenAPIDefinition.Components.TSchemas.TPatternProperty>;

        function GetPatternProperty: TDynamicProperty<TOpenAPIDefinition.Components.TSchemas.TPatternProperty>;
        function GetPatternPropertyStored: Boolean;
      public
        destructor Destroy; override;

        property IsPatternPropertyStored: Boolean read GetPatternPropertyStored;
      published
        [PatternProperty('^[a-zA-Z0-9\.\-_]+$')]
        property PatternProperty: TDynamicProperty<TOpenAPIDefinition.Components.TSchemas.TPatternProperty> read GetPatternProperty write FPatternProperty stored GetPatternPropertyStored;
      end;

      TResponses = class
      public type
        // Forward class declaration
        TPatternProperty = class;

        [Flat]
        TPatternProperty = class
        private
          FReference: TOpenAPIDefinition.Reference;
          FResponse: TOpenAPIDefinition.Response;

          function GetReference: TOpenAPIDefinition.Reference;
          function GetResponse: TOpenAPIDefinition.Response;
          function GetReferenceStored: Boolean;
          function GetResponseStored: Boolean;
        public
          destructor Destroy; override;

          property IsReferenceStored: Boolean read GetReferenceStored;
          property IsResponseStored: Boolean read GetResponseStored;
        published
          property Reference: TOpenAPIDefinition.Reference read GetReference write FReference stored GetReferenceStored;
          property Response: TOpenAPIDefinition.Response read GetResponse write FResponse stored GetResponseStored;
        end;
      private
        FPatternProperty: TDynamicProperty<TOpenAPIDefinition.Components.TResponses.TPatternProperty>;

        function GetPatternProperty: TDynamicProperty<TOpenAPIDefinition.Components.TResponses.TPatternProperty>;
        function GetPatternPropertyStored: Boolean;
      public
        destructor Destroy; override;

        property IsPatternPropertyStored: Boolean read GetPatternPropertyStored;
      published
        [PatternProperty('^[a-zA-Z0-9\.\-_]+$')]
        property PatternProperty: TDynamicProperty<TOpenAPIDefinition.Components.TResponses.TPatternProperty> read GetPatternProperty write FPatternProperty stored GetPatternPropertyStored;
      end;

      TParameters = class
      public type
        // Forward class declaration
        TPatternProperty = class;

        [Flat]
        TPatternProperty = class
        private
          FReference: TOpenAPIDefinition.Reference;
          FParameter: TOpenAPIDefinition.Parameter;

          function GetReference: TOpenAPIDefinition.Reference;
          function GetParameter: TOpenAPIDefinition.Parameter;
          function GetReferenceStored: Boolean;
          function GetParameterStored: Boolean;
        public
          destructor Destroy; override;

          property IsReferenceStored: Boolean read GetReferenceStored;
          property IsParameterStored: Boolean read GetParameterStored;
        published
          property Reference: TOpenAPIDefinition.Reference read GetReference write FReference stored GetReferenceStored;
          property Parameter: TOpenAPIDefinition.Parameter read GetParameter write FParameter stored GetParameterStored;
        end;
      private
        FPatternProperty: TDynamicProperty<TOpenAPIDefinition.Components.TParameters.TPatternProperty>;

        function GetPatternProperty: TDynamicProperty<TOpenAPIDefinition.Components.TParameters.TPatternProperty>;
        function GetPatternPropertyStored: Boolean;
      public
        destructor Destroy; override;

        property IsPatternPropertyStored: Boolean read GetPatternPropertyStored;
      published
        [PatternProperty('^[a-zA-Z0-9\.\-_]+$')]
        property PatternProperty: TDynamicProperty<TOpenAPIDefinition.Components.TParameters.TPatternProperty> read GetPatternProperty write FPatternProperty stored GetPatternPropertyStored;
      end;

      TExamples = class
      public type
        // Forward class declaration
        TPatternProperty = class;

        [Flat]
        TPatternProperty = class
        private
          FReference: TOpenAPIDefinition.Reference;
          FExample: TOpenAPIDefinition.Example;

          function GetReference: TOpenAPIDefinition.Reference;
          function GetExample: TOpenAPIDefinition.Example;
          function GetReferenceStored: Boolean;
          function GetExampleStored: Boolean;
        public
          destructor Destroy; override;

          property IsReferenceStored: Boolean read GetReferenceStored;
          property IsExampleStored: Boolean read GetExampleStored;
        published
          property Reference: TOpenAPIDefinition.Reference read GetReference write FReference stored GetReferenceStored;
          property Example: TOpenAPIDefinition.Example read GetExample write FExample stored GetExampleStored;
        end;
      private
        FPatternProperty: TDynamicProperty<TOpenAPIDefinition.Components.TExamples.TPatternProperty>;

        function GetPatternProperty: TDynamicProperty<TOpenAPIDefinition.Components.TExamples.TPatternProperty>;
        function GetPatternPropertyStored: Boolean;
      public
        destructor Destroy; override;

        property IsPatternPropertyStored: Boolean read GetPatternPropertyStored;
      published
        [PatternProperty('^[a-zA-Z0-9\.\-_]+$')]
        property PatternProperty: TDynamicProperty<TOpenAPIDefinition.Components.TExamples.TPatternProperty> read GetPatternProperty write FPatternProperty stored GetPatternPropertyStored;
      end;

      TRequestBodies = class
      public type
        // Forward class declaration
        TPatternProperty = class;

        [Flat]
        TPatternProperty = class
        private
          FReference: TOpenAPIDefinition.Reference;
          FRequestBody: TOpenAPIDefinition.RequestBody;

          function GetReference: TOpenAPIDefinition.Reference;
          function GetRequestBody: TOpenAPIDefinition.RequestBody;
          function GetReferenceStored: Boolean;
          function GetRequestBodyStored: Boolean;
        public
          destructor Destroy; override;

          property IsReferenceStored: Boolean read GetReferenceStored;
          property IsRequestBodyStored: Boolean read GetRequestBodyStored;
        published
          property Reference: TOpenAPIDefinition.Reference read GetReference write FReference stored GetReferenceStored;
          property RequestBody: TOpenAPIDefinition.RequestBody read GetRequestBody write FRequestBody stored GetRequestBodyStored;
        end;
      private
        FPatternProperty: TDynamicProperty<TOpenAPIDefinition.Components.TRequestBodies.TPatternProperty>;

        function GetPatternProperty: TDynamicProperty<TOpenAPIDefinition.Components.TRequestBodies.TPatternProperty>;
        function GetPatternPropertyStored: Boolean;
      public
        destructor Destroy; override;

        property IsPatternPropertyStored: Boolean read GetPatternPropertyStored;
      published
        [PatternProperty('^[a-zA-Z0-9\.\-_]+$')]
        property PatternProperty: TDynamicProperty<TOpenAPIDefinition.Components.TRequestBodies.TPatternProperty> read GetPatternProperty write FPatternProperty stored GetPatternPropertyStored;
      end;

      THeaders = class
      public type
        // Forward class declaration
        TPatternProperty = class;

        [Flat]
        TPatternProperty = class
        private
          FReference: TOpenAPIDefinition.Reference;
          FHeader: TOpenAPIDefinition.Header;

          function GetReference: TOpenAPIDefinition.Reference;
          function GetHeader: TOpenAPIDefinition.Header;
          function GetReferenceStored: Boolean;
          function GetHeaderStored: Boolean;
        public
          destructor Destroy; override;

          property IsReferenceStored: Boolean read GetReferenceStored;
          property IsHeaderStored: Boolean read GetHeaderStored;
        published
          property Reference: TOpenAPIDefinition.Reference read GetReference write FReference stored GetReferenceStored;
          property Header: TOpenAPIDefinition.Header read GetHeader write FHeader stored GetHeaderStored;
        end;
      private
        FPatternProperty: TDynamicProperty<TOpenAPIDefinition.Components.THeaders.TPatternProperty>;

        function GetPatternProperty: TDynamicProperty<TOpenAPIDefinition.Components.THeaders.TPatternProperty>;
        function GetPatternPropertyStored: Boolean;
      public
        destructor Destroy; override;

        property IsPatternPropertyStored: Boolean read GetPatternPropertyStored;
      published
        [PatternProperty('^[a-zA-Z0-9\.\-_]+$')]
        property PatternProperty: TDynamicProperty<TOpenAPIDefinition.Components.THeaders.TPatternProperty> read GetPatternProperty write FPatternProperty stored GetPatternPropertyStored;
      end;

      TSecuritySchemes = class
      public type
        // Forward class declaration
        TPatternProperty = class;

        [Flat]
        TPatternProperty = class
        private
          FReference: TOpenAPIDefinition.Reference;
          FSecurityScheme: TOpenAPIDefinition.SecurityScheme;

          function GetReference: TOpenAPIDefinition.Reference;
          function GetSecurityScheme: TOpenAPIDefinition.SecurityScheme;
          function GetReferenceStored: Boolean;
          function GetSecuritySchemeStored: Boolean;
        public
          destructor Destroy; override;

          property IsReferenceStored: Boolean read GetReferenceStored;
          property IsSecuritySchemeStored: Boolean read GetSecuritySchemeStored;
        published
          property Reference: TOpenAPIDefinition.Reference read GetReference write FReference stored GetReferenceStored;
          property SecurityScheme: TOpenAPIDefinition.SecurityScheme read GetSecurityScheme write FSecurityScheme stored GetSecuritySchemeStored;
        end;
      private
        FPatternProperty: TDynamicProperty<TOpenAPIDefinition.Components.TSecuritySchemes.TPatternProperty>;

        function GetPatternProperty: TDynamicProperty<TOpenAPIDefinition.Components.TSecuritySchemes.TPatternProperty>;
        function GetPatternPropertyStored: Boolean;
      public
        destructor Destroy; override;

        property IsPatternPropertyStored: Boolean read GetPatternPropertyStored;
      published
        [PatternProperty('^[a-zA-Z0-9\.\-_]+$')]
        property PatternProperty: TDynamicProperty<TOpenAPIDefinition.Components.TSecuritySchemes.TPatternProperty> read GetPatternProperty write FPatternProperty stored GetPatternPropertyStored;
      end;

      TLinks = class
      public type
        // Forward class declaration
        TPatternProperty = class;

        [Flat]
        TPatternProperty = class
        private
          FReference: TOpenAPIDefinition.Reference;
          FLink: TOpenAPIDefinition.Link;

          function GetReference: TOpenAPIDefinition.Reference;
          function GetLink: TOpenAPIDefinition.Link;
          function GetReferenceStored: Boolean;
          function GetLinkStored: Boolean;
        public
          destructor Destroy; override;

          property IsReferenceStored: Boolean read GetReferenceStored;
          property IsLinkStored: Boolean read GetLinkStored;
        published
          property Reference: TOpenAPIDefinition.Reference read GetReference write FReference stored GetReferenceStored;
          property Link: TOpenAPIDefinition.Link read GetLink write FLink stored GetLinkStored;
        end;
      private
        FPatternProperty: TDynamicProperty<TOpenAPIDefinition.Components.TLinks.TPatternProperty>;

        function GetPatternProperty: TDynamicProperty<TOpenAPIDefinition.Components.TLinks.TPatternProperty>;
        function GetPatternPropertyStored: Boolean;
      public
        destructor Destroy; override;

        property IsPatternPropertyStored: Boolean read GetPatternPropertyStored;
      published
        [PatternProperty('^[a-zA-Z0-9\.\-_]+$')]
        property PatternProperty: TDynamicProperty<TOpenAPIDefinition.Components.TLinks.TPatternProperty> read GetPatternProperty write FPatternProperty stored GetPatternPropertyStored;
      end;

      TCallbacks = class
      public type
        // Forward class declaration
        TPatternProperty = class;

        [Flat]
        TPatternProperty = class
        private
          FReference: TOpenAPIDefinition.Reference;
          FCallback: TOpenAPIDefinition.Callback;

          function GetReference: TOpenAPIDefinition.Reference;
          function GetCallback: TOpenAPIDefinition.Callback;
          function GetReferenceStored: Boolean;
          function GetCallbackStored: Boolean;
        public
          destructor Destroy; override;

          property IsReferenceStored: Boolean read GetReferenceStored;
          property IsCallbackStored: Boolean read GetCallbackStored;
        published
          property Reference: TOpenAPIDefinition.Reference read GetReference write FReference stored GetReferenceStored;
          property Callback: TOpenAPIDefinition.Callback read GetCallback write FCallback stored GetCallbackStored;
        end;
      private
        FPatternProperty: TDynamicProperty<TOpenAPIDefinition.Components.TCallbacks.TPatternProperty>;

        function GetPatternProperty: TDynamicProperty<TOpenAPIDefinition.Components.TCallbacks.TPatternProperty>;
        function GetPatternPropertyStored: Boolean;
      public
        destructor Destroy; override;

        property IsPatternPropertyStored: Boolean read GetPatternPropertyStored;
      published
        [PatternProperty('^[a-zA-Z0-9\.\-_]+$')]
        property PatternProperty: TDynamicProperty<TOpenAPIDefinition.Components.TCallbacks.TPatternProperty> read GetPatternProperty write FPatternProperty stored GetPatternPropertyStored;
      end;
    private
      FSchemas: TOpenAPIDefinition.Components.TSchemas;
      FResponses: TOpenAPIDefinition.Components.TResponses;
      FParameters: TOpenAPIDefinition.Components.TParameters;
      FExamples: TOpenAPIDefinition.Components.TExamples;
      FRequestBodies: TOpenAPIDefinition.Components.TRequestBodies;
      FHeaders: TOpenAPIDefinition.Components.THeaders;
      FSecuritySchemes: TOpenAPIDefinition.Components.TSecuritySchemes;
      FLinks: TOpenAPIDefinition.Components.TLinks;
      FCallbacks: TOpenAPIDefinition.Components.TCallbacks;
      FPatternProperty: TDynamicProperty<any>;

      function GetSchemas: TOpenAPIDefinition.Components.TSchemas;
      function GetResponses: TOpenAPIDefinition.Components.TResponses;
      function GetParameters: TOpenAPIDefinition.Components.TParameters;
      function GetExamples: TOpenAPIDefinition.Components.TExamples;
      function GetRequestBodies: TOpenAPIDefinition.Components.TRequestBodies;
      function GetHeaders: TOpenAPIDefinition.Components.THeaders;
      function GetSecuritySchemes: TOpenAPIDefinition.Components.TSecuritySchemes;
      function GetLinks: TOpenAPIDefinition.Components.TLinks;
      function GetCallbacks: TOpenAPIDefinition.Components.TCallbacks;
      function GetPatternProperty: TDynamicProperty<any>;
      function GetSchemasStored: Boolean;
      function GetResponsesStored: Boolean;
      function GetParametersStored: Boolean;
      function GetExamplesStored: Boolean;
      function GetRequestBodiesStored: Boolean;
      function GetHeadersStored: Boolean;
      function GetSecuritySchemesStored: Boolean;
      function GetLinksStored: Boolean;
      function GetCallbacksStored: Boolean;
      function GetPatternPropertyStored: Boolean;
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
      property IsPatternPropertyStored: Boolean read GetPatternPropertyStored;
    published
      property schemas: TOpenAPIDefinition.Components.TSchemas read GetSchemas write FSchemas stored GetSchemasStored;
      property responses: TOpenAPIDefinition.Components.TResponses read GetResponses write FResponses stored GetResponsesStored;
      property parameters: TOpenAPIDefinition.Components.TParameters read GetParameters write FParameters stored GetParametersStored;
      property examples: TOpenAPIDefinition.Components.TExamples read GetExamples write FExamples stored GetExamplesStored;
      property requestBodies: TOpenAPIDefinition.Components.TRequestBodies read GetRequestBodies write FRequestBodies stored GetRequestBodiesStored;
      property headers: TOpenAPIDefinition.Components.THeaders read GetHeaders write FHeaders stored GetHeadersStored;
      property securitySchemes: TOpenAPIDefinition.Components.TSecuritySchemes read GetSecuritySchemes write FSecuritySchemes stored GetSecuritySchemesStored;
      property links: TOpenAPIDefinition.Components.TLinks read GetLinks write FLinks stored GetLinksStored;
      property callbacks: TOpenAPIDefinition.Components.TCallbacks read GetCallbacks write FCallbacks stored GetCallbacksStored;
      [PatternProperty('^x-')]
      property PatternProperty: TDynamicProperty<any> read GetPatternProperty write FPatternProperty stored GetPatternPropertyStored;
    end;

    Schema = class
    public type
      [EnumValue('array, boolean, integer, number, object, string')]
      TType = (&array, boolean, integer, number, &object, &string);

      // Forward class declaration
      TNot = class;
      TAllOfArrayItem = class;
      TOneOfArrayItem = class;
      TAnyOfArrayItem = class;
      TItems = class;
      TProperties = class;
      TAdditionalProperties = class;

      [Flat]
      TNot = class
      private
        FSchema: TOpenAPIDefinition.Schema;
        FReference: TOpenAPIDefinition.Reference;

        function GetSchema: TOpenAPIDefinition.Schema;
        function GetReference: TOpenAPIDefinition.Reference;
        function GetSchemaStored: Boolean;
        function GetReferenceStored: Boolean;
      public
        destructor Destroy; override;

        property IsSchemaStored: Boolean read GetSchemaStored;
        property IsReferenceStored: Boolean read GetReferenceStored;
      published
        property Schema: TOpenAPIDefinition.Schema read GetSchema write FSchema stored GetSchemaStored;
        property Reference: TOpenAPIDefinition.Reference read GetReference write FReference stored GetReferenceStored;
      end;

      [Flat]
      TAllOfArrayItem = class
      private
        FSchema: TOpenAPIDefinition.Schema;
        FReference: TOpenAPIDefinition.Reference;

        function GetSchema: TOpenAPIDefinition.Schema;
        function GetReference: TOpenAPIDefinition.Reference;
        function GetSchemaStored: Boolean;
        function GetReferenceStored: Boolean;
      public
        destructor Destroy; override;

        property IsSchemaStored: Boolean read GetSchemaStored;
        property IsReferenceStored: Boolean read GetReferenceStored;
      published
        property Schema: TOpenAPIDefinition.Schema read GetSchema write FSchema stored GetSchemaStored;
        property Reference: TOpenAPIDefinition.Reference read GetReference write FReference stored GetReferenceStored;
      end;

      [Flat]
      TOneOfArrayItem = class
      private
        FSchema: TOpenAPIDefinition.Schema;
        FReference: TOpenAPIDefinition.Reference;

        function GetSchema: TOpenAPIDefinition.Schema;
        function GetReference: TOpenAPIDefinition.Reference;
        function GetSchemaStored: Boolean;
        function GetReferenceStored: Boolean;
      public
        destructor Destroy; override;

        property IsSchemaStored: Boolean read GetSchemaStored;
        property IsReferenceStored: Boolean read GetReferenceStored;
      published
        property Schema: TOpenAPIDefinition.Schema read GetSchema write FSchema stored GetSchemaStored;
        property Reference: TOpenAPIDefinition.Reference read GetReference write FReference stored GetReferenceStored;
      end;

      [Flat]
      TAnyOfArrayItem = class
      private
        FSchema: TOpenAPIDefinition.Schema;
        FReference: TOpenAPIDefinition.Reference;

        function GetSchema: TOpenAPIDefinition.Schema;
        function GetReference: TOpenAPIDefinition.Reference;
        function GetSchemaStored: Boolean;
        function GetReferenceStored: Boolean;
      public
        destructor Destroy; override;

        property IsSchemaStored: Boolean read GetSchemaStored;
        property IsReferenceStored: Boolean read GetReferenceStored;
      published
        property Schema: TOpenAPIDefinition.Schema read GetSchema write FSchema stored GetSchemaStored;
        property Reference: TOpenAPIDefinition.Reference read GetReference write FReference stored GetReferenceStored;
      end;

      [Flat]
      TItems = class
      private
        FSchema: TOpenAPIDefinition.Schema;
        FReference: TOpenAPIDefinition.Reference;

        function GetSchema: TOpenAPIDefinition.Schema;
        function GetReference: TOpenAPIDefinition.Reference;
        function GetSchemaStored: Boolean;
        function GetReferenceStored: Boolean;
      public
        destructor Destroy; override;

        property IsSchemaStored: Boolean read GetSchemaStored;
        property IsReferenceStored: Boolean read GetReferenceStored;
      published
        property Schema: TOpenAPIDefinition.Schema read GetSchema write FSchema stored GetSchemaStored;
        property Reference: TOpenAPIDefinition.Reference read GetReference write FReference stored GetReferenceStored;
      end;

      TProperties = class
      public type
        // Forward class declaration
        TadditionalProperties = class;

        [Flat]
        TadditionalProperties = class
        private
          FSchema: TOpenAPIDefinition.Schema;
          FReference: TOpenAPIDefinition.Reference;

          function GetSchema: TOpenAPIDefinition.Schema;
          function GetReference: TOpenAPIDefinition.Reference;
          function GetSchemaStored: Boolean;
          function GetReferenceStored: Boolean;
        public
          destructor Destroy; override;

          property IsSchemaStored: Boolean read GetSchemaStored;
          property IsReferenceStored: Boolean read GetReferenceStored;
        published
          property Schema: TOpenAPIDefinition.Schema read GetSchema write FSchema stored GetSchemaStored;
          property Reference: TOpenAPIDefinition.Reference read GetReference write FReference stored GetReferenceStored;
        end;
      private
        FSchema: TOpenAPIDefinition.Schema;
        FReference: TOpenAPIDefinition.Reference;
        FAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Schema.TProperties.TadditionalProperties>;

        function GetSchema: TOpenAPIDefinition.Schema;
        function GetReference: TOpenAPIDefinition.Reference;
        function GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Schema.TProperties.TadditionalProperties>;
        function GetSchemaStored: Boolean;
        function GetReferenceStored: Boolean;
        function GetAdditionalPropertiesStored: Boolean;
      public
        destructor Destroy; override;

        property IsSchemaStored: Boolean read GetSchemaStored;
        property IsReferenceStored: Boolean read GetReferenceStored;
        property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
      published
        property Schema: TOpenAPIDefinition.Schema read GetSchema write FSchema stored GetSchemaStored;
        property Reference: TOpenAPIDefinition.Reference read GetReference write FReference stored GetReferenceStored;
        property additionalProperties: TDynamicProperty<TOpenAPIDefinition.Schema.TProperties.TadditionalProperties> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
      end;

      [Flat]
      TAdditionalProperties = class
      private
        FSchema: TOpenAPIDefinition.Schema;
        FReference: TOpenAPIDefinition.Reference;
        FBoolean: System.Boolean;

        function GetSchema: TOpenAPIDefinition.Schema;
        function GetReference: TOpenAPIDefinition.Reference;
        function GetSchemaStored: Boolean;
        function GetReferenceStored: Boolean;
        function GetBooleanStored: Boolean;
      public
        destructor Destroy; override;

        property IsSchemaStored: Boolean read GetSchemaStored;
        property IsReferenceStored: Boolean read GetReferenceStored;
        property IsBooleanStored: Boolean read GetBooleanStored;
      published
        property Schema: TOpenAPIDefinition.Schema read GetSchema write FSchema stored GetSchemaStored;
        property Reference: TOpenAPIDefinition.Reference read GetReference write FReference stored GetReferenceStored;
        property boolean: System.Boolean read FBoolean write FBoolean stored GetBooleanStored;
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
      FType: TOpenAPIDefinition.Schema.TType;
      FNot: TOpenAPIDefinition.Schema.TNot;
      FAllOf: TArray<TOpenAPIDefinition.Schema.TAllOfArrayItem>;
      FOneOf: TArray<TOpenAPIDefinition.Schema.TOneOfArrayItem>;
      FAnyOf: TArray<TOpenAPIDefinition.Schema.TAnyOfArrayItem>;
      FItems: TOpenAPIDefinition.Schema.TItems;
      FProperties: TOpenAPIDefinition.Schema.TProperties;
      FAdditionalProperties: TOpenAPIDefinition.Schema.TAdditionalProperties;
      FDescription: System.String;
      FFormat: System.String;
      FDefault: any;
      FNullable: System.Boolean;
      FDiscriminator: TOpenAPIDefinition.Discriminator;
      FReadOnly: System.Boolean;
      FWriteOnly: System.Boolean;
      FExample: any;
      FExternalDocs: TOpenAPIDefinition.ExternalDocumentation;
      FDeprecated: System.Boolean;
      FXml: TOpenAPIDefinition.XML;
      FPatternProperty: TDynamicProperty<any>;
      FTypeIsStored: Boolean;

      function GetNot: TOpenAPIDefinition.Schema.TNot;
      function GetItems: TOpenAPIDefinition.Schema.TItems;
      function GetProperties: TOpenAPIDefinition.Schema.TProperties;
      function GetAdditionalProperties: TOpenAPIDefinition.Schema.TAdditionalProperties;
      function GetDiscriminator: TOpenAPIDefinition.Discriminator;
      function GetExternalDocs: TOpenAPIDefinition.ExternalDocumentation;
      function GetXml: TOpenAPIDefinition.XML;
      function GetPatternProperty: TDynamicProperty<any>;
      function GetTitleStored: Boolean;
      function GetMultipleOfStored: Boolean;
      function GetMaximumStored: Boolean;
      function GetExclusiveMaximumStored: Boolean;
      function GetMinimumStored: Boolean;
      function GetExclusiveMinimumStored: Boolean;
      function GetMaxLengthStored: Boolean;
      function GetMinLengthStored: Boolean;
      function GetPatternStored: Boolean;
      function GetMaxItemsStored: Boolean;
      function GetMinItemsStored: Boolean;
      function GetUniqueItemsStored: Boolean;
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
      function GetDefaultStored: Boolean;
      function GetNullableStored: Boolean;
      function GetDiscriminatorStored: Boolean;
      function GetReadOnlyStored: Boolean;
      function GetWriteOnlyStored: Boolean;
      function GetExampleStored: Boolean;
      function GetExternalDocsStored: Boolean;
      function GetDeprecatedStored: Boolean;
      function GetXmlStored: Boolean;
      function GetPatternPropertyStored: Boolean;
      procedure SetType(const Value: TOpenAPIDefinition.Schema.TType);
    public
      destructor Destroy; override;

      function AddAllOf: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema.TAllOfArrayItem;
      function AddOneOf: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema.TOneOfArrayItem;
      function AddAnyOf: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema.TAnyOfArrayItem;

      property IsTitleStored: Boolean read GetTitleStored;
      property IsMultipleOfStored: Boolean read GetMultipleOfStored;
      property IsMaximumStored: Boolean read GetMaximumStored;
      property IsExclusiveMaximumStored: Boolean read GetExclusiveMaximumStored;
      property IsMinimumStored: Boolean read GetMinimumStored;
      property IsExclusiveMinimumStored: Boolean read GetExclusiveMinimumStored;
      property IsMaxLengthStored: Boolean read GetMaxLengthStored;
      property IsMinLengthStored: Boolean read GetMinLengthStored;
      property IsPatternStored: Boolean read GetPatternStored;
      property IsMaxItemsStored: Boolean read GetMaxItemsStored;
      property IsMinItemsStored: Boolean read GetMinItemsStored;
      property IsUniqueItemsStored: Boolean read GetUniqueItemsStored;
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
      property IsDefaultStored: Boolean read GetDefaultStored;
      property IsNullableStored: Boolean read GetNullableStored;
      property IsDiscriminatorStored: Boolean read GetDiscriminatorStored;
      property IsReadOnlyStored: Boolean read GetReadOnlyStored;
      property IsWriteOnlyStored: Boolean read GetWriteOnlyStored;
      property IsExampleStored: Boolean read GetExampleStored;
      property IsExternalDocsStored: Boolean read GetExternalDocsStored;
      property IsDeprecatedStored: Boolean read GetDeprecatedStored;
      property IsXmlStored: Boolean read GetXmlStored;
      property IsPatternPropertyStored: Boolean read GetPatternPropertyStored;
    published
      property title: System.String read FTitle write FTitle stored GetTitleStored;
      property multipleOf: System.Double read FMultipleOf write FMultipleOf stored GetMultipleOfStored;
      property maximum: System.Double read FMaximum write FMaximum stored GetMaximumStored;
      property exclusiveMaximum: System.Boolean read FExclusiveMaximum write FExclusiveMaximum stored GetExclusiveMaximumStored;
      property minimum: System.Double read FMinimum write FMinimum stored GetMinimumStored;
      property exclusiveMinimum: System.Boolean read FExclusiveMinimum write FExclusiveMinimum stored GetExclusiveMinimumStored;
      property maxLength: System.Integer read FMaxLength write FMaxLength stored GetMaxLengthStored;
      property minLength: System.Integer read FMinLength write FMinLength stored GetMinLengthStored;
      property pattern: System.String read FPattern write FPattern stored GetPatternStored;
      property maxItems: System.Integer read FMaxItems write FMaxItems stored GetMaxItemsStored;
      property minItems: System.Integer read FMinItems write FMinItems stored GetMinItemsStored;
      property uniqueItems: System.Boolean read FUniqueItems write FUniqueItems stored GetUniqueItemsStored;
      property maxProperties: System.Integer read FMaxProperties write FMaxProperties stored GetMaxPropertiesStored;
      property minProperties: System.Integer read FMinProperties write FMinProperties stored GetMinPropertiesStored;
      property required: TArray<System.String> read FRequired write FRequired stored GetRequiredStored;
      property enum: TArray<any> read FEnum write FEnum stored GetEnumStored;
      [FieldName('type')]
      property &type: TOpenAPIDefinition.Schema.TType read FType write SetType stored FTypeIsStored;
      [FieldName('not')]
      property &not: TOpenAPIDefinition.Schema.TNot read GetNot write FNot stored GetNotStored;
      property allOf: TArray<TOpenAPIDefinition.Schema.TAllOfArrayItem> read FAllOf write FAllOf stored GetAllOfStored;
      property oneOf: TArray<TOpenAPIDefinition.Schema.TOneOfArrayItem> read FOneOf write FOneOf stored GetOneOfStored;
      property anyOf: TArray<TOpenAPIDefinition.Schema.TAnyOfArrayItem> read FAnyOf write FAnyOf stored GetAnyOfStored;
      property items: TOpenAPIDefinition.Schema.TItems read GetItems write FItems stored GetItemsStored;
      property properties: TOpenAPIDefinition.Schema.TProperties read GetProperties write FProperties stored GetPropertiesStored;
      property additionalProperties: TOpenAPIDefinition.Schema.TAdditionalProperties read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      property format: System.String read FFormat write FFormat stored GetFormatStored;
      property default: any read FDefault write FDefault stored GetDefaultStored;
      property nullable: System.Boolean read FNullable write FNullable stored GetNullableStored;
      property discriminator: TOpenAPIDefinition.Discriminator read GetDiscriminator write FDiscriminator stored GetDiscriminatorStored;
      property readOnly: System.Boolean read FReadOnly write FReadOnly stored GetReadOnlyStored;
      property writeOnly: System.Boolean read FWriteOnly write FWriteOnly stored GetWriteOnlyStored;
      property example: any read FExample write FExample stored GetExampleStored;
      property externalDocs: TOpenAPIDefinition.ExternalDocumentation read GetExternalDocs write FExternalDocs stored GetExternalDocsStored;
      property deprecated: System.Boolean read FDeprecated write FDeprecated stored GetDeprecatedStored;
      property xml: TOpenAPIDefinition.XML read GetXml write FXml stored GetXmlStored;
      [PatternProperty('^x-')]
      property PatternProperty: TDynamicProperty<any> read GetPatternProperty write FPatternProperty stored GetPatternPropertyStored;
    end;

    Discriminator = class
    public type
      // Forward class declaration
      TMapping = class;

      TMapping = class
      private
        FAdditionalProperties: TDynamicProperty<System.String>;

        function GetAdditionalProperties: TDynamicProperty<System.String>;
        function GetAdditionalPropertiesStored: Boolean;
      public
        destructor Destroy; override;

        property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
      published
        property additionalProperties: TDynamicProperty<System.String> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
      end;
    private
      FPropertyName: System.String;
      FMapping: TOpenAPIDefinition.Discriminator.TMapping;

      function GetMapping: TOpenAPIDefinition.Discriminator.TMapping;
      function GetMappingStored: Boolean;
    public
      destructor Destroy; override;

      property IsMappingStored: Boolean read GetMappingStored;
    published
      property propertyName: System.String read FPropertyName write FPropertyName;
      property mapping: TOpenAPIDefinition.Discriminator.TMapping read GetMapping write FMapping stored GetMappingStored;
    end;

    XML = class
    private
      FName: System.String;
      FNamespace: System.String;
      FPrefix: System.String;
      FAttribute: System.Boolean;
      FWrapped: System.Boolean;
      FPatternProperty: TDynamicProperty<any>;

      function GetPatternProperty: TDynamicProperty<any>;
      function GetNameStored: Boolean;
      function GetNamespaceStored: Boolean;
      function GetPrefixStored: Boolean;
      function GetAttributeStored: Boolean;
      function GetWrappedStored: Boolean;
      function GetPatternPropertyStored: Boolean;
    public
      destructor Destroy; override;

      property IsNameStored: Boolean read GetNameStored;
      property IsNamespaceStored: Boolean read GetNamespaceStored;
      property IsPrefixStored: Boolean read GetPrefixStored;
      property IsAttributeStored: Boolean read GetAttributeStored;
      property IsWrappedStored: Boolean read GetWrappedStored;
      property IsPatternPropertyStored: Boolean read GetPatternPropertyStored;
    published
      property name: System.String read FName write FName stored GetNameStored;
      property namespace: System.String read FNamespace write FNamespace stored GetNamespaceStored;
      property prefix: System.String read FPrefix write FPrefix stored GetPrefixStored;
      property attribute: System.Boolean read FAttribute write FAttribute stored GetAttributeStored;
      property wrapped: System.Boolean read FWrapped write FWrapped stored GetWrappedStored;
      [PatternProperty('^x-')]
      property PatternProperty: TDynamicProperty<any> read GetPatternProperty write FPatternProperty stored GetPatternPropertyStored;
    end;

    Response = class
    public type
      // Forward class declaration
      THeaders = class;
      TContent = class;
      TLinks = class;

      THeaders = class
      public type
        // Forward class declaration
        TadditionalProperties = class;

        [Flat]
        TadditionalProperties = class
        private
          FHeader: TOpenAPIDefinition.Header;
          FReference: TOpenAPIDefinition.Reference;

          function GetHeader: TOpenAPIDefinition.Header;
          function GetReference: TOpenAPIDefinition.Reference;
          function GetHeaderStored: Boolean;
          function GetReferenceStored: Boolean;
        public
          destructor Destroy; override;

          property IsHeaderStored: Boolean read GetHeaderStored;
          property IsReferenceStored: Boolean read GetReferenceStored;
        published
          property Header: TOpenAPIDefinition.Header read GetHeader write FHeader stored GetHeaderStored;
          property Reference: TOpenAPIDefinition.Reference read GetReference write FReference stored GetReferenceStored;
        end;
      private
        FHeader: TOpenAPIDefinition.Header;
        FReference: TOpenAPIDefinition.Reference;
        FAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Response.THeaders.TadditionalProperties>;

        function GetHeader: TOpenAPIDefinition.Header;
        function GetReference: TOpenAPIDefinition.Reference;
        function GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Response.THeaders.TadditionalProperties>;
        function GetHeaderStored: Boolean;
        function GetReferenceStored: Boolean;
        function GetAdditionalPropertiesStored: Boolean;
      public
        destructor Destroy; override;

        property IsHeaderStored: Boolean read GetHeaderStored;
        property IsReferenceStored: Boolean read GetReferenceStored;
        property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
      published
        property Header: TOpenAPIDefinition.Header read GetHeader write FHeader stored GetHeaderStored;
        property Reference: TOpenAPIDefinition.Reference read GetReference write FReference stored GetReferenceStored;
        property additionalProperties: TDynamicProperty<TOpenAPIDefinition.Response.THeaders.TadditionalProperties> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
      end;

      TContent = class
      private
        FAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.MediaType>;

        function GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.MediaType>;
        function GetAdditionalPropertiesStored: Boolean;
      public
        destructor Destroy; override;

        property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
      published
        property additionalProperties: TDynamicProperty<TOpenAPIDefinition.MediaType> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
      end;

      TLinks = class
      public type
        // Forward class declaration
        TadditionalProperties = class;

        [Flat]
        TadditionalProperties = class
        private
          FLink: TOpenAPIDefinition.Link;
          FReference: TOpenAPIDefinition.Reference;

          function GetLink: TOpenAPIDefinition.Link;
          function GetReference: TOpenAPIDefinition.Reference;
          function GetLinkStored: Boolean;
          function GetReferenceStored: Boolean;
        public
          destructor Destroy; override;

          property IsLinkStored: Boolean read GetLinkStored;
          property IsReferenceStored: Boolean read GetReferenceStored;
        published
          property Link: TOpenAPIDefinition.Link read GetLink write FLink stored GetLinkStored;
          property Reference: TOpenAPIDefinition.Reference read GetReference write FReference stored GetReferenceStored;
        end;
      private
        FLink: TOpenAPIDefinition.Link;
        FReference: TOpenAPIDefinition.Reference;
        FAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Response.TLinks.TadditionalProperties>;

        function GetLink: TOpenAPIDefinition.Link;
        function GetReference: TOpenAPIDefinition.Reference;
        function GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Response.TLinks.TadditionalProperties>;
        function GetLinkStored: Boolean;
        function GetReferenceStored: Boolean;
        function GetAdditionalPropertiesStored: Boolean;
      public
        destructor Destroy; override;

        property IsLinkStored: Boolean read GetLinkStored;
        property IsReferenceStored: Boolean read GetReferenceStored;
        property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
      published
        property Link: TOpenAPIDefinition.Link read GetLink write FLink stored GetLinkStored;
        property Reference: TOpenAPIDefinition.Reference read GetReference write FReference stored GetReferenceStored;
        property additionalProperties: TDynamicProperty<TOpenAPIDefinition.Response.TLinks.TadditionalProperties> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
      end;
    private
      FDescription: System.String;
      FHeaders: TOpenAPIDefinition.Response.THeaders;
      FContent: TOpenAPIDefinition.Response.TContent;
      FLinks: TOpenAPIDefinition.Response.TLinks;
      FPatternProperty: TDynamicProperty<any>;

      function GetHeaders: TOpenAPIDefinition.Response.THeaders;
      function GetContent: TOpenAPIDefinition.Response.TContent;
      function GetLinks: TOpenAPIDefinition.Response.TLinks;
      function GetPatternProperty: TDynamicProperty<any>;
      function GetHeadersStored: Boolean;
      function GetContentStored: Boolean;
      function GetLinksStored: Boolean;
      function GetPatternPropertyStored: Boolean;
    public
      destructor Destroy; override;

      property IsHeadersStored: Boolean read GetHeadersStored;
      property IsContentStored: Boolean read GetContentStored;
      property IsLinksStored: Boolean read GetLinksStored;
      property IsPatternPropertyStored: Boolean read GetPatternPropertyStored;
    published
      property description: System.String read FDescription write FDescription;
      property headers: TOpenAPIDefinition.Response.THeaders read GetHeaders write FHeaders stored GetHeadersStored;
      property content: TOpenAPIDefinition.Response.TContent read GetContent write FContent stored GetContentStored;
      property links: TOpenAPIDefinition.Response.TLinks read GetLinks write FLinks stored GetLinksStored;
      [PatternProperty('^x-')]
      property PatternProperty: TDynamicProperty<any> read GetPatternProperty write FPatternProperty stored GetPatternPropertyStored;
    end;

    [Flat]
    MediaType = class
    public type
      // Forward class declaration
      TSchema = class;
      TExamples = class;
      TEncoding = class;

      [Flat]
      TSchema = class
      private
        FSchema: TOpenAPIDefinition.Schema;
        FReference: TOpenAPIDefinition.Reference;

        function GetSchema: TOpenAPIDefinition.Schema;
        function GetReference: TOpenAPIDefinition.Reference;
        function GetSchemaStored: Boolean;
        function GetReferenceStored: Boolean;
      public
        destructor Destroy; override;

        property IsSchemaStored: Boolean read GetSchemaStored;
        property IsReferenceStored: Boolean read GetReferenceStored;
      published
        property Schema: TOpenAPIDefinition.Schema read GetSchema write FSchema stored GetSchemaStored;
        property Reference: TOpenAPIDefinition.Reference read GetReference write FReference stored GetReferenceStored;
      end;

      TExamples = class
      public type
        // Forward class declaration
        TadditionalProperties = class;

        [Flat]
        TadditionalProperties = class
        private
          FExample: TOpenAPIDefinition.Example;
          FReference: TOpenAPIDefinition.Reference;

          function GetExample: TOpenAPIDefinition.Example;
          function GetReference: TOpenAPIDefinition.Reference;
          function GetExampleStored: Boolean;
          function GetReferenceStored: Boolean;
        public
          destructor Destroy; override;

          property IsExampleStored: Boolean read GetExampleStored;
          property IsReferenceStored: Boolean read GetReferenceStored;
        published
          property Example: TOpenAPIDefinition.Example read GetExample write FExample stored GetExampleStored;
          property Reference: TOpenAPIDefinition.Reference read GetReference write FReference stored GetReferenceStored;
        end;
      private
        FExample: TOpenAPIDefinition.Example;
        FReference: TOpenAPIDefinition.Reference;
        FAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.MediaType.TExamples.TadditionalProperties>;

        function GetExample: TOpenAPIDefinition.Example;
        function GetReference: TOpenAPIDefinition.Reference;
        function GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.MediaType.TExamples.TadditionalProperties>;
        function GetExampleStored: Boolean;
        function GetReferenceStored: Boolean;
        function GetAdditionalPropertiesStored: Boolean;
      public
        destructor Destroy; override;

        property IsExampleStored: Boolean read GetExampleStored;
        property IsReferenceStored: Boolean read GetReferenceStored;
        property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
      published
        property Example: TOpenAPIDefinition.Example read GetExample write FExample stored GetExampleStored;
        property Reference: TOpenAPIDefinition.Reference read GetReference write FReference stored GetReferenceStored;
        property additionalProperties: TDynamicProperty<TOpenAPIDefinition.MediaType.TExamples.TadditionalProperties> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
      end;

      TEncoding = class
      private
        FAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Encoding>;

        function GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Encoding>;
        function GetAdditionalPropertiesStored: Boolean;
      public
        destructor Destroy; override;

        property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
      published
        property additionalProperties: TDynamicProperty<TOpenAPIDefinition.Encoding> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
      end;
    private
      FSchema: TOpenAPIDefinition.MediaType.TSchema;
      FExample: any;
      FExamples: TOpenAPIDefinition.MediaType.TExamples;
      FEncoding: TOpenAPIDefinition.MediaType.TEncoding;
      FExampleXORExamples: TOpenAPIDefinition.ExampleXORExamples;
      FPatternProperty: TDynamicProperty<any>;

      function GetSchema: TOpenAPIDefinition.MediaType.TSchema;
      function GetExamples: TOpenAPIDefinition.MediaType.TExamples;
      function GetEncoding: TOpenAPIDefinition.MediaType.TEncoding;
      function GetPatternProperty: TDynamicProperty<any>;
      function GetSchemaStored: Boolean;
      function GetExampleStored: Boolean;
      function GetExamplesStored: Boolean;
      function GetEncodingStored: Boolean;
      function GetExampleXORExamplesStored: Boolean;
      function GetPatternPropertyStored: Boolean;
    public
      destructor Destroy; override;

      property IsSchemaStored: Boolean read GetSchemaStored;
      property IsExampleStored: Boolean read GetExampleStored;
      property IsExamplesStored: Boolean read GetExamplesStored;
      property IsEncodingStored: Boolean read GetEncodingStored;
      property IsExampleXORExamplesStored: Boolean read GetExampleXORExamplesStored;
      property IsPatternPropertyStored: Boolean read GetPatternPropertyStored;
    published
      property schema: TOpenAPIDefinition.MediaType.TSchema read GetSchema write FSchema stored GetSchemaStored;
      property example: any read FExample write FExample stored GetExampleStored;
      property examples: TOpenAPIDefinition.MediaType.TExamples read GetExamples write FExamples stored GetExamplesStored;
      property encoding: TOpenAPIDefinition.MediaType.TEncoding read GetEncoding write FEncoding stored GetEncodingStored;
      property ExampleXORExamples: TOpenAPIDefinition.ExampleXORExamples read FExampleXORExamples write FExampleXORExamples stored GetExampleXORExamplesStored;
      [PatternProperty('^x-')]
      property PatternProperty: TDynamicProperty<any> read GetPatternProperty write FPatternProperty stored GetPatternPropertyStored;
    end;

    Example = class
    private
      FSummary: System.String;
      FDescription: System.String;
      FValue: any;
      FExternalValue: System.String;
      FPatternProperty: TDynamicProperty<any>;

      function GetPatternProperty: TDynamicProperty<any>;
      function GetSummaryStored: Boolean;
      function GetDescriptionStored: Boolean;
      function GetValueStored: Boolean;
      function GetExternalValueStored: Boolean;
      function GetPatternPropertyStored: Boolean;
    public
      destructor Destroy; override;

      property IsSummaryStored: Boolean read GetSummaryStored;
      property IsDescriptionStored: Boolean read GetDescriptionStored;
      property IsValueStored: Boolean read GetValueStored;
      property IsExternalValueStored: Boolean read GetExternalValueStored;
      property IsPatternPropertyStored: Boolean read GetPatternPropertyStored;
    published
      property summary: System.String read FSummary write FSummary stored GetSummaryStored;
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      property value: any read FValue write FValue stored GetValueStored;
      property externalValue: System.String read FExternalValue write FExternalValue stored GetExternalValueStored;
      [PatternProperty('^x-')]
      property PatternProperty: TDynamicProperty<any> read GetPatternProperty write FPatternProperty stored GetPatternPropertyStored;
    end;

    [Flat]
    Header = class
    public type
      TStyle = (simple);

      // Forward class declaration
      TSchema = class;
      TContent = class;
      TExamples = class;

      [Flat]
      TSchema = class
      private
        FSchema: TOpenAPIDefinition.Schema;
        FReference: TOpenAPIDefinition.Reference;

        function GetSchema: TOpenAPIDefinition.Schema;
        function GetReference: TOpenAPIDefinition.Reference;
        function GetSchemaStored: Boolean;
        function GetReferenceStored: Boolean;
      public
        destructor Destroy; override;

        property IsSchemaStored: Boolean read GetSchemaStored;
        property IsReferenceStored: Boolean read GetReferenceStored;
      published
        property Schema: TOpenAPIDefinition.Schema read GetSchema write FSchema stored GetSchemaStored;
        property Reference: TOpenAPIDefinition.Reference read GetReference write FReference stored GetReferenceStored;
      end;

      TContent = class
      private
        FAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.MediaType>;

        function GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.MediaType>;
        function GetAdditionalPropertiesStored: Boolean;
      public
        destructor Destroy; override;

        property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
      published
        property additionalProperties: TDynamicProperty<TOpenAPIDefinition.MediaType> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
      end;

      TExamples = class
      public type
        // Forward class declaration
        TadditionalProperties = class;

        [Flat]
        TadditionalProperties = class
        private
          FExample: TOpenAPIDefinition.Example;
          FReference: TOpenAPIDefinition.Reference;

          function GetExample: TOpenAPIDefinition.Example;
          function GetReference: TOpenAPIDefinition.Reference;
          function GetExampleStored: Boolean;
          function GetReferenceStored: Boolean;
        public
          destructor Destroy; override;

          property IsExampleStored: Boolean read GetExampleStored;
          property IsReferenceStored: Boolean read GetReferenceStored;
        published
          property Example: TOpenAPIDefinition.Example read GetExample write FExample stored GetExampleStored;
          property Reference: TOpenAPIDefinition.Reference read GetReference write FReference stored GetReferenceStored;
        end;
      private
        FExample: TOpenAPIDefinition.Example;
        FReference: TOpenAPIDefinition.Reference;
        FAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Header.TExamples.TadditionalProperties>;

        function GetExample: TOpenAPIDefinition.Example;
        function GetReference: TOpenAPIDefinition.Reference;
        function GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Header.TExamples.TadditionalProperties>;
        function GetExampleStored: Boolean;
        function GetReferenceStored: Boolean;
        function GetAdditionalPropertiesStored: Boolean;
      public
        destructor Destroy; override;

        property IsExampleStored: Boolean read GetExampleStored;
        property IsReferenceStored: Boolean read GetReferenceStored;
        property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
      published
        property Example: TOpenAPIDefinition.Example read GetExample write FExample stored GetExampleStored;
        property Reference: TOpenAPIDefinition.Reference read GetReference write FReference stored GetReferenceStored;
        property additionalProperties: TDynamicProperty<TOpenAPIDefinition.Header.TExamples.TadditionalProperties> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
      end;
    private
      FDescription: System.String;
      FRequired: System.Boolean;
      FDeprecated: System.Boolean;
      FAllowEmptyValue: System.Boolean;
      FStyle: TOpenAPIDefinition.Header.TStyle;
      FExplode: System.Boolean;
      FAllowReserved: System.Boolean;
      FSchema: TOpenAPIDefinition.Header.TSchema;
      FContent: TOpenAPIDefinition.Header.TContent;
      FExample: any;
      FExamples: TOpenAPIDefinition.Header.TExamples;
      FExampleXORExamples: TOpenAPIDefinition.ExampleXORExamples;
      FSchemaXORContent: TOpenAPIDefinition.SchemaXORContent;
      FPatternProperty: TDynamicProperty<any>;
      FStyleIsStored: Boolean;

      function GetSchema: TOpenAPIDefinition.Header.TSchema;
      function GetContent: TOpenAPIDefinition.Header.TContent;
      function GetExamples: TOpenAPIDefinition.Header.TExamples;
      function GetSchemaXORContent: TOpenAPIDefinition.SchemaXORContent;
      function GetPatternProperty: TDynamicProperty<any>;
      function GetDescriptionStored: Boolean;
      function GetRequiredStored: Boolean;
      function GetDeprecatedStored: Boolean;
      function GetAllowEmptyValueStored: Boolean;
      function GetExplodeStored: Boolean;
      function GetAllowReservedStored: Boolean;
      function GetSchemaStored: Boolean;
      function GetContentStored: Boolean;
      function GetExampleStored: Boolean;
      function GetExamplesStored: Boolean;
      function GetExampleXORExamplesStored: Boolean;
      function GetSchemaXORContentStored: Boolean;
      function GetPatternPropertyStored: Boolean;
      procedure SetStyle(const Value: TOpenAPIDefinition.Header.TStyle);
    public
      destructor Destroy; override;

      property IsDescriptionStored: Boolean read GetDescriptionStored;
      property IsRequiredStored: Boolean read GetRequiredStored;
      property IsDeprecatedStored: Boolean read GetDeprecatedStored;
      property IsAllowEmptyValueStored: Boolean read GetAllowEmptyValueStored;
      property IsStyleStored: Boolean read FStyleIsStored;
      property IsExplodeStored: Boolean read GetExplodeStored;
      property IsAllowReservedStored: Boolean read GetAllowReservedStored;
      property IsSchemaStored: Boolean read GetSchemaStored;
      property IsContentStored: Boolean read GetContentStored;
      property IsExampleStored: Boolean read GetExampleStored;
      property IsExamplesStored: Boolean read GetExamplesStored;
      property IsExampleXORExamplesStored: Boolean read GetExampleXORExamplesStored;
      property IsSchemaXORContentStored: Boolean read GetSchemaXORContentStored;
      property IsPatternPropertyStored: Boolean read GetPatternPropertyStored;
    published
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      property required: System.Boolean read FRequired write FRequired stored GetRequiredStored;
      property deprecated: System.Boolean read FDeprecated write FDeprecated stored GetDeprecatedStored;
      property allowEmptyValue: System.Boolean read FAllowEmptyValue write FAllowEmptyValue stored GetAllowEmptyValueStored;
      property style: TOpenAPIDefinition.Header.TStyle read FStyle write SetStyle stored FStyleIsStored;
      property explode: System.Boolean read FExplode write FExplode stored GetExplodeStored;
      property allowReserved: System.Boolean read FAllowReserved write FAllowReserved stored GetAllowReservedStored;
      property schema: TOpenAPIDefinition.Header.TSchema read GetSchema write FSchema stored GetSchemaStored;
      property content: TOpenAPIDefinition.Header.TContent read GetContent write FContent stored GetContentStored;
      property example: any read FExample write FExample stored GetExampleStored;
      property examples: TOpenAPIDefinition.Header.TExamples read GetExamples write FExamples stored GetExamplesStored;
      property ExampleXORExamples: TOpenAPIDefinition.ExampleXORExamples read FExampleXORExamples write FExampleXORExamples stored GetExampleXORExamplesStored;
      property SchemaXORContent: TOpenAPIDefinition.SchemaXORContent read GetSchemaXORContent write FSchemaXORContent stored GetSchemaXORContentStored;
      [PatternProperty('^x-')]
      property PatternProperty: TDynamicProperty<any> read GetPatternProperty write FPatternProperty stored GetPatternPropertyStored;
    end;

    Paths = class
    private
      FPathItem: TDynamicProperty<TOpenAPIDefinition.PathItem>;
      FPatternProperty: TDynamicProperty<any>;

      function GetPathItem: TDynamicProperty<TOpenAPIDefinition.PathItem>;
      function GetPatternProperty: TDynamicProperty<any>;
      function GetPathItemStored: Boolean;
      function GetPatternPropertyStored: Boolean;
    public
      destructor Destroy; override;

      property IsPathItemStored: Boolean read GetPathItemStored;
      property IsPatternPropertyStored: Boolean read GetPatternPropertyStored;
    published
      [PatternProperty('^\/')]
      property PathItem: TDynamicProperty<TOpenAPIDefinition.PathItem> read GetPathItem write FPathItem stored GetPathItemStored;
      [PatternProperty('^x-')]
      property PatternProperty: TDynamicProperty<any> read GetPatternProperty write FPatternProperty stored GetPatternPropertyStored;
    end;

    PathItem = class
    public type
      // Forward class declaration
      TParametersArrayItem = class;

      [Flat]
      TParametersArrayItem = class
      private
        FParameter: TOpenAPIDefinition.Parameter;
        FReference: TOpenAPIDefinition.Reference;

        function GetParameter: TOpenAPIDefinition.Parameter;
        function GetReference: TOpenAPIDefinition.Reference;
        function GetParameterStored: Boolean;
        function GetReferenceStored: Boolean;
      public
        destructor Destroy; override;

        property IsParameterStored: Boolean read GetParameterStored;
        property IsReferenceStored: Boolean read GetReferenceStored;
      published
        property Parameter: TOpenAPIDefinition.Parameter read GetParameter write FParameter stored GetParameterStored;
        property Reference: TOpenAPIDefinition.Reference read GetReference write FReference stored GetReferenceStored;
      end;
    private
      FRef: System.String;
      FSummary: System.String;
      FDescription: System.String;
      FGet: TOpenAPIDefinition.Operation;
      FPut: TOpenAPIDefinition.Operation;
      FPost: TOpenAPIDefinition.Operation;
      FDelete: TOpenAPIDefinition.Operation;
      FOptions: TOpenAPIDefinition.Operation;
      FHead: TOpenAPIDefinition.Operation;
      FPatch: TOpenAPIDefinition.Operation;
      FTrace: TOpenAPIDefinition.Operation;
      FServers: TArray<TOpenAPIDefinition.Server>;
      FParameters: TArray<TOpenAPIDefinition.PathItem.TParametersArrayItem>;
      FPatternProperty: TDynamicProperty<any>;

      function GetGet: TOpenAPIDefinition.Operation;
      function GetPut: TOpenAPIDefinition.Operation;
      function GetPost: TOpenAPIDefinition.Operation;
      function GetDelete: TOpenAPIDefinition.Operation;
      function GetOptions: TOpenAPIDefinition.Operation;
      function GetHead: TOpenAPIDefinition.Operation;
      function GetPatch: TOpenAPIDefinition.Operation;
      function GetTrace: TOpenAPIDefinition.Operation;
      function GetPatternProperty: TDynamicProperty<any>;
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
      function GetPatternPropertyStored: Boolean;
    public
      destructor Destroy; override;

      function AddServers: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Server;
      function AddParameters: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.PathItem.TParametersArrayItem;

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
      property IsPatternPropertyStored: Boolean read GetPatternPropertyStored;
    published
      [FieldName('$ref')]
      property Ref: System.String read FRef write FRef stored GetRefStored;
      property summary: System.String read FSummary write FSummary stored GetSummaryStored;
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      property get: TOpenAPIDefinition.Operation read GetGet write FGet stored GetGetStored;
      property put: TOpenAPIDefinition.Operation read GetPut write FPut stored GetPutStored;
      property post: TOpenAPIDefinition.Operation read GetPost write FPost stored GetPostStored;
      property delete: TOpenAPIDefinition.Operation read GetDelete write FDelete stored GetDeleteStored;
      property options: TOpenAPIDefinition.Operation read GetOptions write FOptions stored GetOptionsStored;
      property head: TOpenAPIDefinition.Operation read GetHead write FHead stored GetHeadStored;
      property patch: TOpenAPIDefinition.Operation read GetPatch write FPatch stored GetPatchStored;
      property trace: TOpenAPIDefinition.Operation read GetTrace write FTrace stored GetTraceStored;
      property servers: TArray<TOpenAPIDefinition.Server> read FServers write FServers stored GetServersStored;
      property parameters: TArray<TOpenAPIDefinition.PathItem.TParametersArrayItem> read FParameters write FParameters stored GetParametersStored;
      [PatternProperty('^x-')]
      property PatternProperty: TDynamicProperty<any> read GetPatternProperty write FPatternProperty stored GetPatternPropertyStored;
    end;

    Operation = class
    public type
      // Forward class declaration
      TParametersArrayItem = class;
      TRequestBody = class;
      TCallbacks = class;

      [Flat]
      TParametersArrayItem = class
      private
        FParameter: TOpenAPIDefinition.Parameter;
        FReference: TOpenAPIDefinition.Reference;

        function GetParameter: TOpenAPIDefinition.Parameter;
        function GetReference: TOpenAPIDefinition.Reference;
        function GetParameterStored: Boolean;
        function GetReferenceStored: Boolean;
      public
        destructor Destroy; override;

        property IsParameterStored: Boolean read GetParameterStored;
        property IsReferenceStored: Boolean read GetReferenceStored;
      published
        property Parameter: TOpenAPIDefinition.Parameter read GetParameter write FParameter stored GetParameterStored;
        property Reference: TOpenAPIDefinition.Reference read GetReference write FReference stored GetReferenceStored;
      end;

      [Flat]
      TRequestBody = class
      private
        FRequestBody: TOpenAPIDefinition.RequestBody;
        FReference: TOpenAPIDefinition.Reference;

        function GetRequestBody: TOpenAPIDefinition.RequestBody;
        function GetReference: TOpenAPIDefinition.Reference;
        function GetRequestBodyStored: Boolean;
        function GetReferenceStored: Boolean;
      public
        destructor Destroy; override;

        property IsRequestBodyStored: Boolean read GetRequestBodyStored;
        property IsReferenceStored: Boolean read GetReferenceStored;
      published
        property RequestBody: TOpenAPIDefinition.RequestBody read GetRequestBody write FRequestBody stored GetRequestBodyStored;
        property Reference: TOpenAPIDefinition.Reference read GetReference write FReference stored GetReferenceStored;
      end;

      TCallbacks = class
      public type
        // Forward class declaration
        TadditionalProperties = class;

        [Flat]
        TadditionalProperties = class
        private
          FCallback: TOpenAPIDefinition.Callback;
          FReference: TOpenAPIDefinition.Reference;

          function GetCallback: TOpenAPIDefinition.Callback;
          function GetReference: TOpenAPIDefinition.Reference;
          function GetCallbackStored: Boolean;
          function GetReferenceStored: Boolean;
        public
          destructor Destroy; override;

          property IsCallbackStored: Boolean read GetCallbackStored;
          property IsReferenceStored: Boolean read GetReferenceStored;
        published
          property Callback: TOpenAPIDefinition.Callback read GetCallback write FCallback stored GetCallbackStored;
          property Reference: TOpenAPIDefinition.Reference read GetReference write FReference stored GetReferenceStored;
        end;
      private
        FCallback: TOpenAPIDefinition.Callback;
        FReference: TOpenAPIDefinition.Reference;
        FAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Operation.TCallbacks.TadditionalProperties>;

        function GetCallback: TOpenAPIDefinition.Callback;
        function GetReference: TOpenAPIDefinition.Reference;
        function GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Operation.TCallbacks.TadditionalProperties>;
        function GetCallbackStored: Boolean;
        function GetReferenceStored: Boolean;
        function GetAdditionalPropertiesStored: Boolean;
      public
        destructor Destroy; override;

        property IsCallbackStored: Boolean read GetCallbackStored;
        property IsReferenceStored: Boolean read GetReferenceStored;
        property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
      published
        property Callback: TOpenAPIDefinition.Callback read GetCallback write FCallback stored GetCallbackStored;
        property Reference: TOpenAPIDefinition.Reference read GetReference write FReference stored GetReferenceStored;
        property additionalProperties: TDynamicProperty<TOpenAPIDefinition.Operation.TCallbacks.TadditionalProperties> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
      end;
    private
      FTags: TArray<System.String>;
      FSummary: System.String;
      FDescription: System.String;
      FExternalDocs: TOpenAPIDefinition.ExternalDocumentation;
      FOperationId: System.String;
      FParameters: TArray<TOpenAPIDefinition.Operation.TParametersArrayItem>;
      FRequestBody: TOpenAPIDefinition.Operation.TRequestBody;
      FResponses: TOpenAPIDefinition.Responses;
      FCallbacks: TOpenAPIDefinition.Operation.TCallbacks;
      FDeprecated: System.Boolean;
      FSecurity: TArray<TOpenAPIDefinition.SecurityRequirement>;
      FServers: TArray<TOpenAPIDefinition.Server>;
      FPatternProperty: TDynamicProperty<any>;

      function GetExternalDocs: TOpenAPIDefinition.ExternalDocumentation;
      function GetRequestBody: TOpenAPIDefinition.Operation.TRequestBody;
      function GetResponses: TOpenAPIDefinition.Responses;
      function GetCallbacks: TOpenAPIDefinition.Operation.TCallbacks;
      function GetPatternProperty: TDynamicProperty<any>;
      function GetTagsStored: Boolean;
      function GetSummaryStored: Boolean;
      function GetDescriptionStored: Boolean;
      function GetExternalDocsStored: Boolean;
      function GetOperationIdStored: Boolean;
      function GetParametersStored: Boolean;
      function GetRequestBodyStored: Boolean;
      function GetCallbacksStored: Boolean;
      function GetDeprecatedStored: Boolean;
      function GetSecurityStored: Boolean;
      function GetServersStored: Boolean;
      function GetPatternPropertyStored: Boolean;
    public
      destructor Destroy; override;

      function AddParameters: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Operation.TParametersArrayItem;
      function AddSecurity: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.SecurityRequirement;
      function AddServers: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Server;

      property IsTagsStored: Boolean read GetTagsStored;
      property IsSummaryStored: Boolean read GetSummaryStored;
      property IsDescriptionStored: Boolean read GetDescriptionStored;
      property IsExternalDocsStored: Boolean read GetExternalDocsStored;
      property IsOperationIdStored: Boolean read GetOperationIdStored;
      property IsParametersStored: Boolean read GetParametersStored;
      property IsRequestBodyStored: Boolean read GetRequestBodyStored;
      property IsCallbacksStored: Boolean read GetCallbacksStored;
      property IsDeprecatedStored: Boolean read GetDeprecatedStored;
      property IsSecurityStored: Boolean read GetSecurityStored;
      property IsServersStored: Boolean read GetServersStored;
      property IsPatternPropertyStored: Boolean read GetPatternPropertyStored;
    published
      property tags: TArray<System.String> read FTags write FTags stored GetTagsStored;
      property summary: System.String read FSummary write FSummary stored GetSummaryStored;
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      property externalDocs: TOpenAPIDefinition.ExternalDocumentation read GetExternalDocs write FExternalDocs stored GetExternalDocsStored;
      property operationId: System.String read FOperationId write FOperationId stored GetOperationIdStored;
      property parameters: TArray<TOpenAPIDefinition.Operation.TParametersArrayItem> read FParameters write FParameters stored GetParametersStored;
      property requestBody: TOpenAPIDefinition.Operation.TRequestBody read GetRequestBody write FRequestBody stored GetRequestBodyStored;
      property responses: TOpenAPIDefinition.Responses read GetResponses write FResponses;
      property callbacks: TOpenAPIDefinition.Operation.TCallbacks read GetCallbacks write FCallbacks stored GetCallbacksStored;
      property deprecated: System.Boolean read FDeprecated write FDeprecated stored GetDeprecatedStored;
      property security: TArray<TOpenAPIDefinition.SecurityRequirement> read FSecurity write FSecurity stored GetSecurityStored;
      property servers: TArray<TOpenAPIDefinition.Server> read FServers write FServers stored GetServersStored;
      [PatternProperty('^x-')]
      property PatternProperty: TDynamicProperty<any> read GetPatternProperty write FPatternProperty stored GetPatternPropertyStored;
    end;

    Responses = class
    public type
      // Forward class declaration
      TDefault = class;
      TPatternProperty = class;

      [Flat]
      TDefault = class
      private
        FResponse: TOpenAPIDefinition.Response;
        FReference: TOpenAPIDefinition.Reference;

        function GetResponse: TOpenAPIDefinition.Response;
        function GetReference: TOpenAPIDefinition.Reference;
        function GetResponseStored: Boolean;
        function GetReferenceStored: Boolean;
      public
        destructor Destroy; override;

        property IsResponseStored: Boolean read GetResponseStored;
        property IsReferenceStored: Boolean read GetReferenceStored;
      published
        property Response: TOpenAPIDefinition.Response read GetResponse write FResponse stored GetResponseStored;
        property Reference: TOpenAPIDefinition.Reference read GetReference write FReference stored GetReferenceStored;
      end;

      [Flat]
      TPatternProperty = class
      private
        FResponse: TOpenAPIDefinition.Response;
        FReference: TOpenAPIDefinition.Reference;

        function GetResponse: TOpenAPIDefinition.Response;
        function GetReference: TOpenAPIDefinition.Reference;
        function GetResponseStored: Boolean;
        function GetReferenceStored: Boolean;
      public
        destructor Destroy; override;

        property IsResponseStored: Boolean read GetResponseStored;
        property IsReferenceStored: Boolean read GetReferenceStored;
      published
        property Response: TOpenAPIDefinition.Response read GetResponse write FResponse stored GetResponseStored;
        property Reference: TOpenAPIDefinition.Reference read GetReference write FReference stored GetReferenceStored;
      end;
    private
      FDefault: TOpenAPIDefinition.Responses.TDefault;
      FPatternProperty: TDynamicProperty<TOpenAPIDefinition.Responses.TPatternProperty>;
      FPatternProperty2: TDynamicProperty<any>;

      function GetDefault: TOpenAPIDefinition.Responses.TDefault;
      function GetPatternProperty: TDynamicProperty<TOpenAPIDefinition.Responses.TPatternProperty>;
      function GetPatternProperty2: TDynamicProperty<any>;
      function GetDefaultStored: Boolean;
      function GetPatternPropertyStored: Boolean;
      function GetPatternProperty2Stored: Boolean;
    public
      destructor Destroy; override;

      property IsDefaultStored: Boolean read GetDefaultStored;
      property IsPatternPropertyStored: Boolean read GetPatternPropertyStored;
      property IsPatternProperty2Stored: Boolean read GetPatternProperty2Stored;
    published
      property default: TOpenAPIDefinition.Responses.TDefault read GetDefault write FDefault stored GetDefaultStored;
      [PatternProperty('^[1-5](?:\d{2}|XX)$')]
      property PatternProperty: TDynamicProperty<TOpenAPIDefinition.Responses.TPatternProperty> read GetPatternProperty write FPatternProperty stored GetPatternPropertyStored;
      [PatternProperty('^x-')]
      property PatternProperty2: TDynamicProperty<any> read GetPatternProperty2 write FPatternProperty2 stored GetPatternProperty2Stored;
    end;

    SecurityRequirement = class
    private
      FAdditionalProperties: TDynamicProperty<TArray<System.String>>;

      function GetAdditionalProperties: TDynamicProperty<TArray<System.String>>;
      function GetAdditionalPropertiesStored: Boolean;
    public
      destructor Destroy; override;

      property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
    published
      property additionalProperties: TDynamicProperty<TArray<System.String>> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
    end;

    Tag = class
    private
      FName: System.String;
      FDescription: System.String;
      FExternalDocs: TOpenAPIDefinition.ExternalDocumentation;
      FPatternProperty: TDynamicProperty<any>;

      function GetExternalDocs: TOpenAPIDefinition.ExternalDocumentation;
      function GetPatternProperty: TDynamicProperty<any>;
      function GetDescriptionStored: Boolean;
      function GetExternalDocsStored: Boolean;
      function GetPatternPropertyStored: Boolean;
    public
      destructor Destroy; override;

      property IsDescriptionStored: Boolean read GetDescriptionStored;
      property IsExternalDocsStored: Boolean read GetExternalDocsStored;
      property IsPatternPropertyStored: Boolean read GetPatternPropertyStored;
    published
      property name: System.String read FName write FName;
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      property externalDocs: TOpenAPIDefinition.ExternalDocumentation read GetExternalDocs write FExternalDocs stored GetExternalDocsStored;
      [PatternProperty('^x-')]
      property PatternProperty: TDynamicProperty<any> read GetPatternProperty write FPatternProperty stored GetPatternPropertyStored;
    end;

    ExternalDocumentation = class
    private
      FDescription: System.String;
      FUrl: System.String;
      FPatternProperty: TDynamicProperty<any>;

      function GetPatternProperty: TDynamicProperty<any>;
      function GetDescriptionStored: Boolean;
      function GetPatternPropertyStored: Boolean;
    public
      destructor Destroy; override;

      property IsDescriptionStored: Boolean read GetDescriptionStored;
      property IsPatternPropertyStored: Boolean read GetPatternPropertyStored;
    published
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      property url: System.String read FUrl write FUrl;
      [PatternProperty('^x-')]
      property PatternProperty: TDynamicProperty<any> read GetPatternProperty write FPatternProperty stored GetPatternPropertyStored;
    end;

    [Flat]
    SchemaXORContent = class
    end;

    [Flat]
    Parameter = class
    public type
      // Forward class declaration
      TSchema = class;
      TContent = class;
      TExamples = class;

      [Flat]
      TSchema = class
      private
        FSchema: TOpenAPIDefinition.Schema;
        FReference: TOpenAPIDefinition.Reference;

        function GetSchema: TOpenAPIDefinition.Schema;
        function GetReference: TOpenAPIDefinition.Reference;
        function GetSchemaStored: Boolean;
        function GetReferenceStored: Boolean;
      public
        destructor Destroy; override;

        property IsSchemaStored: Boolean read GetSchemaStored;
        property IsReferenceStored: Boolean read GetReferenceStored;
      published
        property Schema: TOpenAPIDefinition.Schema read GetSchema write FSchema stored GetSchemaStored;
        property Reference: TOpenAPIDefinition.Reference read GetReference write FReference stored GetReferenceStored;
      end;

      TContent = class
      private
        FAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.MediaType>;

        function GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.MediaType>;
        function GetAdditionalPropertiesStored: Boolean;
      public
        destructor Destroy; override;

        property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
      published
        property additionalProperties: TDynamicProperty<TOpenAPIDefinition.MediaType> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
      end;

      TExamples = class
      public type
        // Forward class declaration
        TadditionalProperties = class;

        [Flat]
        TadditionalProperties = class
        private
          FExample: TOpenAPIDefinition.Example;
          FReference: TOpenAPIDefinition.Reference;

          function GetExample: TOpenAPIDefinition.Example;
          function GetReference: TOpenAPIDefinition.Reference;
          function GetExampleStored: Boolean;
          function GetReferenceStored: Boolean;
        public
          destructor Destroy; override;

          property IsExampleStored: Boolean read GetExampleStored;
          property IsReferenceStored: Boolean read GetReferenceStored;
        published
          property Example: TOpenAPIDefinition.Example read GetExample write FExample stored GetExampleStored;
          property Reference: TOpenAPIDefinition.Reference read GetReference write FReference stored GetReferenceStored;
        end;
      private
        FExample: TOpenAPIDefinition.Example;
        FReference: TOpenAPIDefinition.Reference;
        FAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Parameter.TExamples.TadditionalProperties>;

        function GetExample: TOpenAPIDefinition.Example;
        function GetReference: TOpenAPIDefinition.Reference;
        function GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Parameter.TExamples.TadditionalProperties>;
        function GetExampleStored: Boolean;
        function GetReferenceStored: Boolean;
        function GetAdditionalPropertiesStored: Boolean;
      public
        destructor Destroy; override;

        property IsExampleStored: Boolean read GetExampleStored;
        property IsReferenceStored: Boolean read GetReferenceStored;
        property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
      published
        property Example: TOpenAPIDefinition.Example read GetExample write FExample stored GetExampleStored;
        property Reference: TOpenAPIDefinition.Reference read GetReference write FReference stored GetReferenceStored;
        property additionalProperties: TDynamicProperty<TOpenAPIDefinition.Parameter.TExamples.TadditionalProperties> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
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
      FSchema: TOpenAPIDefinition.Parameter.TSchema;
      FContent: TOpenAPIDefinition.Parameter.TContent;
      FExample: any;
      FExamples: TOpenAPIDefinition.Parameter.TExamples;
      FExampleXORExamples: TOpenAPIDefinition.ExampleXORExamples;
      FSchemaXORContent: TOpenAPIDefinition.SchemaXORContent;
      FPathParameter: TOpenAPIDefinition.PathParameter;
      FQueryParameter: TOpenAPIDefinition.QueryParameter;
      FHeaderParameter: TOpenAPIDefinition.HeaderParameter;
      FCookieParameter: TOpenAPIDefinition.CookieParameter;
      FPatternProperty: TDynamicProperty<any>;

      function GetSchema: TOpenAPIDefinition.Parameter.TSchema;
      function GetContent: TOpenAPIDefinition.Parameter.TContent;
      function GetExamples: TOpenAPIDefinition.Parameter.TExamples;
      function GetSchemaXORContent: TOpenAPIDefinition.SchemaXORContent;
      function GetPathParameter: TOpenAPIDefinition.PathParameter;
      function GetQueryParameter: TOpenAPIDefinition.QueryParameter;
      function GetHeaderParameter: TOpenAPIDefinition.HeaderParameter;
      function GetCookieParameter: TOpenAPIDefinition.CookieParameter;
      function GetPatternProperty: TDynamicProperty<any>;
      function GetDescriptionStored: Boolean;
      function GetRequiredStored: Boolean;
      function GetDeprecatedStored: Boolean;
      function GetAllowEmptyValueStored: Boolean;
      function GetStyleStored: Boolean;
      function GetExplodeStored: Boolean;
      function GetAllowReservedStored: Boolean;
      function GetSchemaStored: Boolean;
      function GetContentStored: Boolean;
      function GetExampleStored: Boolean;
      function GetExamplesStored: Boolean;
      function GetExampleXORExamplesStored: Boolean;
      function GetSchemaXORContentStored: Boolean;
      function GetPathParameterStored: Boolean;
      function GetQueryParameterStored: Boolean;
      function GetHeaderParameterStored: Boolean;
      function GetCookieParameterStored: Boolean;
      function GetPatternPropertyStored: Boolean;
    public
      destructor Destroy; override;

      property IsDescriptionStored: Boolean read GetDescriptionStored;
      property IsRequiredStored: Boolean read GetRequiredStored;
      property IsDeprecatedStored: Boolean read GetDeprecatedStored;
      property IsAllowEmptyValueStored: Boolean read GetAllowEmptyValueStored;
      property IsStyleStored: Boolean read GetStyleStored;
      property IsExplodeStored: Boolean read GetExplodeStored;
      property IsAllowReservedStored: Boolean read GetAllowReservedStored;
      property IsSchemaStored: Boolean read GetSchemaStored;
      property IsContentStored: Boolean read GetContentStored;
      property IsExampleStored: Boolean read GetExampleStored;
      property IsExamplesStored: Boolean read GetExamplesStored;
      property IsExampleXORExamplesStored: Boolean read GetExampleXORExamplesStored;
      property IsSchemaXORContentStored: Boolean read GetSchemaXORContentStored;
      property IsPathParameterStored: Boolean read GetPathParameterStored;
      property IsQueryParameterStored: Boolean read GetQueryParameterStored;
      property IsHeaderParameterStored: Boolean read GetHeaderParameterStored;
      property IsCookieParameterStored: Boolean read GetCookieParameterStored;
      property IsPatternPropertyStored: Boolean read GetPatternPropertyStored;
    published
      property name: System.String read FName write FName;
      [FieldName('in')]
      property &in: System.String read FIn write FIn;
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      property required: System.Boolean read FRequired write FRequired stored GetRequiredStored;
      property deprecated: System.Boolean read FDeprecated write FDeprecated stored GetDeprecatedStored;
      property allowEmptyValue: System.Boolean read FAllowEmptyValue write FAllowEmptyValue stored GetAllowEmptyValueStored;
      property style: System.String read FStyle write FStyle stored GetStyleStored;
      property explode: System.Boolean read FExplode write FExplode stored GetExplodeStored;
      property allowReserved: System.Boolean read FAllowReserved write FAllowReserved stored GetAllowReservedStored;
      property schema: TOpenAPIDefinition.Parameter.TSchema read GetSchema write FSchema stored GetSchemaStored;
      property content: TOpenAPIDefinition.Parameter.TContent read GetContent write FContent stored GetContentStored;
      property example: any read FExample write FExample stored GetExampleStored;
      property examples: TOpenAPIDefinition.Parameter.TExamples read GetExamples write FExamples stored GetExamplesStored;
      property ExampleXORExamples: TOpenAPIDefinition.ExampleXORExamples read FExampleXORExamples write FExampleXORExamples stored GetExampleXORExamplesStored;
      property SchemaXORContent: TOpenAPIDefinition.SchemaXORContent read GetSchemaXORContent write FSchemaXORContent stored GetSchemaXORContentStored;
      property PathParameter: TOpenAPIDefinition.PathParameter read GetPathParameter write FPathParameter stored GetPathParameterStored;
      property QueryParameter: TOpenAPIDefinition.QueryParameter read GetQueryParameter write FQueryParameter stored GetQueryParameterStored;
      property HeaderParameter: TOpenAPIDefinition.HeaderParameter read GetHeaderParameter write FHeaderParameter stored GetHeaderParameterStored;
      property CookieParameter: TOpenAPIDefinition.CookieParameter read GetCookieParameter write FCookieParameter stored GetCookieParameterStored;
      [PatternProperty('^x-')]
      property PatternProperty: TDynamicProperty<any> read GetPatternProperty write FPatternProperty stored GetPatternPropertyStored;
    end;

    PathParameter = class
    public type
      TIn = (path);

      [EnumValue('matrix, label, simple')]
      TStyle = (matrix, &label, simple);

      TRequired = (True);
    private
      FIn: TOpenAPIDefinition.PathParameter.TIn;
      FStyle: TOpenAPIDefinition.PathParameter.TStyle;
      FRequired: TOpenAPIDefinition.PathParameter.TRequired;
      FInIsStored: Boolean;
      FStyleIsStored: Boolean;

      procedure SetIn(const Value: TOpenAPIDefinition.PathParameter.TIn);
      procedure SetStyle(const Value: TOpenAPIDefinition.PathParameter.TStyle);
    public
      property IsInStored: Boolean read FInIsStored;
      property IsStyleStored: Boolean read FStyleIsStored;
    published
      [FieldName('in')]
      property &in: TOpenAPIDefinition.PathParameter.TIn read FIn write SetIn stored FInIsStored;
      property style: TOpenAPIDefinition.PathParameter.TStyle read FStyle write SetStyle stored FStyleIsStored;
      property required: TOpenAPIDefinition.PathParameter.TRequired read FRequired write FRequired;
    end;

    QueryParameter = class
    public type
      TIn = (query);

      TStyle = (form, spaceDelimited, pipeDelimited, deepObject);
    private
      FIn: TOpenAPIDefinition.QueryParameter.TIn;
      FStyle: TOpenAPIDefinition.QueryParameter.TStyle;
      FInIsStored: Boolean;
      FStyleIsStored: Boolean;

      procedure SetIn(const Value: TOpenAPIDefinition.QueryParameter.TIn);
      procedure SetStyle(const Value: TOpenAPIDefinition.QueryParameter.TStyle);
    public
      property IsInStored: Boolean read FInIsStored;
      property IsStyleStored: Boolean read FStyleIsStored;
    published
      [FieldName('in')]
      property &in: TOpenAPIDefinition.QueryParameter.TIn read FIn write SetIn stored FInIsStored;
      property style: TOpenAPIDefinition.QueryParameter.TStyle read FStyle write SetStyle stored FStyleIsStored;
    end;

    HeaderParameter = class
    public type
      TIn = (header);

      TStyle = (simple);
    private
      FIn: TOpenAPIDefinition.HeaderParameter.TIn;
      FStyle: TOpenAPIDefinition.HeaderParameter.TStyle;
      FInIsStored: Boolean;
      FStyleIsStored: Boolean;

      procedure SetIn(const Value: TOpenAPIDefinition.HeaderParameter.TIn);
      procedure SetStyle(const Value: TOpenAPIDefinition.HeaderParameter.TStyle);
    public
      property IsInStored: Boolean read FInIsStored;
      property IsStyleStored: Boolean read FStyleIsStored;
    published
      [FieldName('in')]
      property &in: TOpenAPIDefinition.HeaderParameter.TIn read FIn write SetIn stored FInIsStored;
      property style: TOpenAPIDefinition.HeaderParameter.TStyle read FStyle write SetStyle stored FStyleIsStored;
    end;

    CookieParameter = class
    public type
      TIn = (cookie);

      TStyle = (form);
    private
      FIn: TOpenAPIDefinition.CookieParameter.TIn;
      FStyle: TOpenAPIDefinition.CookieParameter.TStyle;
      FInIsStored: Boolean;
      FStyleIsStored: Boolean;

      procedure SetIn(const Value: TOpenAPIDefinition.CookieParameter.TIn);
      procedure SetStyle(const Value: TOpenAPIDefinition.CookieParameter.TStyle);
    public
      property IsInStored: Boolean read FInIsStored;
      property IsStyleStored: Boolean read FStyleIsStored;
    published
      [FieldName('in')]
      property &in: TOpenAPIDefinition.CookieParameter.TIn read FIn write SetIn stored FInIsStored;
      property style: TOpenAPIDefinition.CookieParameter.TStyle read FStyle write SetStyle stored FStyleIsStored;
    end;

    RequestBody = class
    public type
      // Forward class declaration
      TContent = class;

      TContent = class
      private
        FAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.MediaType>;

        function GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.MediaType>;
        function GetAdditionalPropertiesStored: Boolean;
      public
        destructor Destroy; override;

        property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
      published
        property additionalProperties: TDynamicProperty<TOpenAPIDefinition.MediaType> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
      end;
    private
      FDescription: System.String;
      FContent: TOpenAPIDefinition.RequestBody.TContent;
      FRequired: System.Boolean;
      FPatternProperty: TDynamicProperty<any>;

      function GetContent: TOpenAPIDefinition.RequestBody.TContent;
      function GetPatternProperty: TDynamicProperty<any>;
      function GetDescriptionStored: Boolean;
      function GetRequiredStored: Boolean;
      function GetPatternPropertyStored: Boolean;
    public
      destructor Destroy; override;

      property IsDescriptionStored: Boolean read GetDescriptionStored;
      property IsRequiredStored: Boolean read GetRequiredStored;
      property IsPatternPropertyStored: Boolean read GetPatternPropertyStored;
    published
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      property content: TOpenAPIDefinition.RequestBody.TContent read GetContent write FContent;
      property required: System.Boolean read FRequired write FRequired stored GetRequiredStored;
      [PatternProperty('^x-')]
      property PatternProperty: TDynamicProperty<any> read GetPatternProperty write FPatternProperty stored GetPatternPropertyStored;
    end;

    [Flat]
    SecurityScheme = class
    private
      FAPIKeySecurityScheme: TOpenAPIDefinition.APIKeySecurityScheme;
      FHTTPSecurityScheme: TOpenAPIDefinition.HTTPSecurityScheme;
      FOAuth2SecurityScheme: TOpenAPIDefinition.OAuth2SecurityScheme;
      FOpenIdConnectSecurityScheme: TOpenAPIDefinition.OpenIdConnectSecurityScheme;

      function GetAPIKeySecurityScheme: TOpenAPIDefinition.APIKeySecurityScheme;
      function GetHTTPSecurityScheme: TOpenAPIDefinition.HTTPSecurityScheme;
      function GetOAuth2SecurityScheme: TOpenAPIDefinition.OAuth2SecurityScheme;
      function GetOpenIdConnectSecurityScheme: TOpenAPIDefinition.OpenIdConnectSecurityScheme;
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
      property APIKeySecurityScheme: TOpenAPIDefinition.APIKeySecurityScheme read GetAPIKeySecurityScheme write FAPIKeySecurityScheme stored GetAPIKeySecuritySchemeStored;
      property HTTPSecurityScheme: TOpenAPIDefinition.HTTPSecurityScheme read GetHTTPSecurityScheme write FHTTPSecurityScheme stored GetHTTPSecuritySchemeStored;
      property OAuth2SecurityScheme: TOpenAPIDefinition.OAuth2SecurityScheme read GetOAuth2SecurityScheme write FOAuth2SecurityScheme stored GetOAuth2SecuritySchemeStored;
      property OpenIdConnectSecurityScheme: TOpenAPIDefinition.OpenIdConnectSecurityScheme read GetOpenIdConnectSecurityScheme write FOpenIdConnectSecurityScheme stored GetOpenIdConnectSecuritySchemeStored;
    end;

    APIKeySecurityScheme = class
    public type
      TType = (apiKey);

      TIn = (header, query, cookie);
    private
      FType: TOpenAPIDefinition.APIKeySecurityScheme.TType;
      FName: System.String;
      FIn: TOpenAPIDefinition.APIKeySecurityScheme.TIn;
      FDescription: System.String;
      FPatternProperty: TDynamicProperty<any>;

      function GetPatternProperty: TDynamicProperty<any>;
      function GetDescriptionStored: Boolean;
      function GetPatternPropertyStored: Boolean;
    public
      destructor Destroy; override;

      property IsDescriptionStored: Boolean read GetDescriptionStored;
      property IsPatternPropertyStored: Boolean read GetPatternPropertyStored;
    published
      [FieldName('type')]
      property &type: TOpenAPIDefinition.APIKeySecurityScheme.TType read FType write FType;
      property name: System.String read FName write FName;
      [FieldName('in')]
      property &in: TOpenAPIDefinition.APIKeySecurityScheme.TIn read FIn write FIn;
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      [PatternProperty('^x-')]
      property PatternProperty: TDynamicProperty<any> read GetPatternProperty write FPatternProperty stored GetPatternPropertyStored;
    end;

    [Flat]
    HTTPSecurityScheme = class
    public type
      TType = (http);
    private
      FScheme: System.String;
      FBearerFormat: System.String;
      FDescription: System.String;
      FType: TOpenAPIDefinition.HTTPSecurityScheme.TType;
      FPatternProperty: TDynamicProperty<any>;

      function GetPatternProperty: TDynamicProperty<any>;
      function GetBearerFormatStored: Boolean;
      function GetDescriptionStored: Boolean;
      function GetPatternPropertyStored: Boolean;
    public
      destructor Destroy; override;

      property IsBearerFormatStored: Boolean read GetBearerFormatStored;
      property IsDescriptionStored: Boolean read GetDescriptionStored;
      property IsPatternPropertyStored: Boolean read GetPatternPropertyStored;
    published
      property scheme: System.String read FScheme write FScheme;
      property bearerFormat: System.String read FBearerFormat write FBearerFormat stored GetBearerFormatStored;
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      [FieldName('type')]
      property &type: TOpenAPIDefinition.HTTPSecurityScheme.TType read FType write FType;
      [PatternProperty('^x-')]
      property PatternProperty: TDynamicProperty<any> read GetPatternProperty write FPatternProperty stored GetPatternPropertyStored;
    end;

    OAuth2SecurityScheme = class
    public type
      TType = (oauth2);
    private
      FType: TOpenAPIDefinition.OAuth2SecurityScheme.TType;
      FFlows: TOpenAPIDefinition.OAuthFlows;
      FDescription: System.String;
      FPatternProperty: TDynamicProperty<any>;

      function GetFlows: TOpenAPIDefinition.OAuthFlows;
      function GetPatternProperty: TDynamicProperty<any>;
      function GetDescriptionStored: Boolean;
      function GetPatternPropertyStored: Boolean;
    public
      destructor Destroy; override;

      property IsDescriptionStored: Boolean read GetDescriptionStored;
      property IsPatternPropertyStored: Boolean read GetPatternPropertyStored;
    published
      [FieldName('type')]
      property &type: TOpenAPIDefinition.OAuth2SecurityScheme.TType read FType write FType;
      property flows: TOpenAPIDefinition.OAuthFlows read GetFlows write FFlows;
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      [PatternProperty('^x-')]
      property PatternProperty: TDynamicProperty<any> read GetPatternProperty write FPatternProperty stored GetPatternPropertyStored;
    end;

    OpenIdConnectSecurityScheme = class
    public type
      TType = (openIdConnect);
    private
      FType: TOpenAPIDefinition.OpenIdConnectSecurityScheme.TType;
      FOpenIdConnectUrl: System.String;
      FDescription: System.String;
      FPatternProperty: TDynamicProperty<any>;

      function GetPatternProperty: TDynamicProperty<any>;
      function GetDescriptionStored: Boolean;
      function GetPatternPropertyStored: Boolean;
    public
      destructor Destroy; override;

      property IsDescriptionStored: Boolean read GetDescriptionStored;
      property IsPatternPropertyStored: Boolean read GetPatternPropertyStored;
    published
      [FieldName('type')]
      property &type: TOpenAPIDefinition.OpenIdConnectSecurityScheme.TType read FType write FType;
      property openIdConnectUrl: System.String read FOpenIdConnectUrl write FOpenIdConnectUrl;
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      [PatternProperty('^x-')]
      property PatternProperty: TDynamicProperty<any> read GetPatternProperty write FPatternProperty stored GetPatternPropertyStored;
    end;

    OAuthFlows = class
    private
      FImplicit: TOpenAPIDefinition.ImplicitOAuthFlow;
      FPassword: TOpenAPIDefinition.PasswordOAuthFlow;
      FClientCredentials: TOpenAPIDefinition.ClientCredentialsFlow;
      FAuthorizationCode: TOpenAPIDefinition.AuthorizationCodeOAuthFlow;
      FPatternProperty: TDynamicProperty<any>;

      function GetImplicit: TOpenAPIDefinition.ImplicitOAuthFlow;
      function GetPassword: TOpenAPIDefinition.PasswordOAuthFlow;
      function GetClientCredentials: TOpenAPIDefinition.ClientCredentialsFlow;
      function GetAuthorizationCode: TOpenAPIDefinition.AuthorizationCodeOAuthFlow;
      function GetPatternProperty: TDynamicProperty<any>;
      function GetImplicitStored: Boolean;
      function GetPasswordStored: Boolean;
      function GetClientCredentialsStored: Boolean;
      function GetAuthorizationCodeStored: Boolean;
      function GetPatternPropertyStored: Boolean;
    public
      destructor Destroy; override;

      property IsImplicitStored: Boolean read GetImplicitStored;
      property IsPasswordStored: Boolean read GetPasswordStored;
      property IsClientCredentialsStored: Boolean read GetClientCredentialsStored;
      property IsAuthorizationCodeStored: Boolean read GetAuthorizationCodeStored;
      property IsPatternPropertyStored: Boolean read GetPatternPropertyStored;
    published
      property implicit: TOpenAPIDefinition.ImplicitOAuthFlow read GetImplicit write FImplicit stored GetImplicitStored;
      property password: TOpenAPIDefinition.PasswordOAuthFlow read GetPassword write FPassword stored GetPasswordStored;
      property clientCredentials: TOpenAPIDefinition.ClientCredentialsFlow read GetClientCredentials write FClientCredentials stored GetClientCredentialsStored;
      property authorizationCode: TOpenAPIDefinition.AuthorizationCodeOAuthFlow read GetAuthorizationCode write FAuthorizationCode stored GetAuthorizationCodeStored;
      [PatternProperty('^x-')]
      property PatternProperty: TDynamicProperty<any> read GetPatternProperty write FPatternProperty stored GetPatternPropertyStored;
    end;

    ImplicitOAuthFlow = class
    public type
      // Forward class declaration
      TScopes = class;

      TScopes = class
      private
        FAdditionalProperties: TDynamicProperty<System.String>;

        function GetAdditionalProperties: TDynamicProperty<System.String>;
        function GetAdditionalPropertiesStored: Boolean;
      public
        destructor Destroy; override;

        property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
      published
        property additionalProperties: TDynamicProperty<System.String> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
      end;
    private
      FAuthorizationUrl: System.String;
      FRefreshUrl: System.String;
      FScopes: TOpenAPIDefinition.ImplicitOAuthFlow.TScopes;
      FPatternProperty: TDynamicProperty<any>;

      function GetScopes: TOpenAPIDefinition.ImplicitOAuthFlow.TScopes;
      function GetPatternProperty: TDynamicProperty<any>;
      function GetRefreshUrlStored: Boolean;
      function GetPatternPropertyStored: Boolean;
    public
      destructor Destroy; override;

      property IsRefreshUrlStored: Boolean read GetRefreshUrlStored;
      property IsPatternPropertyStored: Boolean read GetPatternPropertyStored;
    published
      property authorizationUrl: System.String read FAuthorizationUrl write FAuthorizationUrl;
      property refreshUrl: System.String read FRefreshUrl write FRefreshUrl stored GetRefreshUrlStored;
      property scopes: TOpenAPIDefinition.ImplicitOAuthFlow.TScopes read GetScopes write FScopes;
      [PatternProperty('^x-')]
      property PatternProperty: TDynamicProperty<any> read GetPatternProperty write FPatternProperty stored GetPatternPropertyStored;
    end;

    PasswordOAuthFlow = class
    public type
      // Forward class declaration
      TScopes = class;

      TScopes = class
      private
        FAdditionalProperties: TDynamicProperty<System.String>;

        function GetAdditionalProperties: TDynamicProperty<System.String>;
        function GetAdditionalPropertiesStored: Boolean;
      public
        destructor Destroy; override;

        property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
      published
        property additionalProperties: TDynamicProperty<System.String> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
      end;
    private
      FTokenUrl: System.String;
      FRefreshUrl: System.String;
      FScopes: TOpenAPIDefinition.PasswordOAuthFlow.TScopes;
      FPatternProperty: TDynamicProperty<any>;

      function GetScopes: TOpenAPIDefinition.PasswordOAuthFlow.TScopes;
      function GetPatternProperty: TDynamicProperty<any>;
      function GetRefreshUrlStored: Boolean;
      function GetPatternPropertyStored: Boolean;
    public
      destructor Destroy; override;

      property IsRefreshUrlStored: Boolean read GetRefreshUrlStored;
      property IsPatternPropertyStored: Boolean read GetPatternPropertyStored;
    published
      property tokenUrl: System.String read FTokenUrl write FTokenUrl;
      property refreshUrl: System.String read FRefreshUrl write FRefreshUrl stored GetRefreshUrlStored;
      property scopes: TOpenAPIDefinition.PasswordOAuthFlow.TScopes read GetScopes write FScopes;
      [PatternProperty('^x-')]
      property PatternProperty: TDynamicProperty<any> read GetPatternProperty write FPatternProperty stored GetPatternPropertyStored;
    end;

    ClientCredentialsFlow = class
    public type
      // Forward class declaration
      TScopes = class;

      TScopes = class
      private
        FAdditionalProperties: TDynamicProperty<System.String>;

        function GetAdditionalProperties: TDynamicProperty<System.String>;
        function GetAdditionalPropertiesStored: Boolean;
      public
        destructor Destroy; override;

        property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
      published
        property additionalProperties: TDynamicProperty<System.String> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
      end;
    private
      FTokenUrl: System.String;
      FRefreshUrl: System.String;
      FScopes: TOpenAPIDefinition.ClientCredentialsFlow.TScopes;
      FPatternProperty: TDynamicProperty<any>;

      function GetScopes: TOpenAPIDefinition.ClientCredentialsFlow.TScopes;
      function GetPatternProperty: TDynamicProperty<any>;
      function GetRefreshUrlStored: Boolean;
      function GetPatternPropertyStored: Boolean;
    public
      destructor Destroy; override;

      property IsRefreshUrlStored: Boolean read GetRefreshUrlStored;
      property IsPatternPropertyStored: Boolean read GetPatternPropertyStored;
    published
      property tokenUrl: System.String read FTokenUrl write FTokenUrl;
      property refreshUrl: System.String read FRefreshUrl write FRefreshUrl stored GetRefreshUrlStored;
      property scopes: TOpenAPIDefinition.ClientCredentialsFlow.TScopes read GetScopes write FScopes;
      [PatternProperty('^x-')]
      property PatternProperty: TDynamicProperty<any> read GetPatternProperty write FPatternProperty stored GetPatternPropertyStored;
    end;

    AuthorizationCodeOAuthFlow = class
    public type
      // Forward class declaration
      TScopes = class;

      TScopes = class
      private
        FAdditionalProperties: TDynamicProperty<System.String>;

        function GetAdditionalProperties: TDynamicProperty<System.String>;
        function GetAdditionalPropertiesStored: Boolean;
      public
        destructor Destroy; override;

        property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
      published
        property additionalProperties: TDynamicProperty<System.String> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
      end;
    private
      FAuthorizationUrl: System.String;
      FTokenUrl: System.String;
      FRefreshUrl: System.String;
      FScopes: TOpenAPIDefinition.AuthorizationCodeOAuthFlow.TScopes;
      FPatternProperty: TDynamicProperty<any>;

      function GetScopes: TOpenAPIDefinition.AuthorizationCodeOAuthFlow.TScopes;
      function GetPatternProperty: TDynamicProperty<any>;
      function GetRefreshUrlStored: Boolean;
      function GetPatternPropertyStored: Boolean;
    public
      destructor Destroy; override;

      property IsRefreshUrlStored: Boolean read GetRefreshUrlStored;
      property IsPatternPropertyStored: Boolean read GetPatternPropertyStored;
    published
      property authorizationUrl: System.String read FAuthorizationUrl write FAuthorizationUrl;
      property tokenUrl: System.String read FTokenUrl write FTokenUrl;
      property refreshUrl: System.String read FRefreshUrl write FRefreshUrl stored GetRefreshUrlStored;
      property scopes: TOpenAPIDefinition.AuthorizationCodeOAuthFlow.TScopes read GetScopes write FScopes;
      [PatternProperty('^x-')]
      property PatternProperty: TDynamicProperty<any> read GetPatternProperty write FPatternProperty stored GetPatternPropertyStored;
    end;

    Link = class
    public type
      // Forward class declaration
      TParameters = class;

      TParameters = class
      private
        FAdditionalProperties: TDynamicProperty<any>;

        function GetAdditionalProperties: TDynamicProperty<any>;
        function GetAdditionalPropertiesStored: Boolean;
      public
        destructor Destroy; override;

        property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
      published
        property additionalProperties: TDynamicProperty<any> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
      end;
    private
      FOperationId: System.String;
      FOperationRef: System.String;
      FParameters: TOpenAPIDefinition.Link.TParameters;
      FRequestBody: any;
      FDescription: System.String;
      FServer: TOpenAPIDefinition.Server;
      FPatternProperty: TDynamicProperty<any>;

      function GetParameters: TOpenAPIDefinition.Link.TParameters;
      function GetServer: TOpenAPIDefinition.Server;
      function GetPatternProperty: TDynamicProperty<any>;
      function GetOperationIdStored: Boolean;
      function GetOperationRefStored: Boolean;
      function GetParametersStored: Boolean;
      function GetRequestBodyStored: Boolean;
      function GetDescriptionStored: Boolean;
      function GetServerStored: Boolean;
      function GetPatternPropertyStored: Boolean;
    public
      destructor Destroy; override;

      property IsOperationIdStored: Boolean read GetOperationIdStored;
      property IsOperationRefStored: Boolean read GetOperationRefStored;
      property IsParametersStored: Boolean read GetParametersStored;
      property IsRequestBodyStored: Boolean read GetRequestBodyStored;
      property IsDescriptionStored: Boolean read GetDescriptionStored;
      property IsServerStored: Boolean read GetServerStored;
      property IsPatternPropertyStored: Boolean read GetPatternPropertyStored;
    published
      property operationId: System.String read FOperationId write FOperationId stored GetOperationIdStored;
      property operationRef: System.String read FOperationRef write FOperationRef stored GetOperationRefStored;
      property parameters: TOpenAPIDefinition.Link.TParameters read GetParameters write FParameters stored GetParametersStored;
      property requestBody: any read FRequestBody write FRequestBody stored GetRequestBodyStored;
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      property server: TOpenAPIDefinition.Server read GetServer write FServer stored GetServerStored;
      [PatternProperty('^x-')]
      property PatternProperty: TDynamicProperty<any> read GetPatternProperty write FPatternProperty stored GetPatternPropertyStored;
    end;

    Callback = class
    private
      FPatternProperty: TDynamicProperty<any>;
      FAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.PathItem>;

      function GetPatternProperty: TDynamicProperty<any>;
      function GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.PathItem>;
      function GetPatternPropertyStored: Boolean;
      function GetAdditionalPropertiesStored: Boolean;
    public
      destructor Destroy; override;

      property IsPatternPropertyStored: Boolean read GetPatternPropertyStored;
      property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
    published
      [PatternProperty('^x-')]
      property PatternProperty: TDynamicProperty<any> read GetPatternProperty write FPatternProperty stored GetPatternPropertyStored;
      property additionalProperties: TDynamicProperty<TOpenAPIDefinition.PathItem> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
    end;

    Encoding = class
    public type
      TStyle = (form, spaceDelimited, pipeDelimited, deepObject);

      // Forward class declaration
      THeaders = class;

      THeaders = class
      public type
        // Forward class declaration
        TadditionalProperties = class;

        [Flat]
        TadditionalProperties = class
        private
          FHeader: TOpenAPIDefinition.Header;
          FReference: TOpenAPIDefinition.Reference;

          function GetHeader: TOpenAPIDefinition.Header;
          function GetReference: TOpenAPIDefinition.Reference;
          function GetHeaderStored: Boolean;
          function GetReferenceStored: Boolean;
        public
          destructor Destroy; override;

          property IsHeaderStored: Boolean read GetHeaderStored;
          property IsReferenceStored: Boolean read GetReferenceStored;
        published
          property Header: TOpenAPIDefinition.Header read GetHeader write FHeader stored GetHeaderStored;
          property Reference: TOpenAPIDefinition.Reference read GetReference write FReference stored GetReferenceStored;
        end;
      private
        FHeader: TOpenAPIDefinition.Header;
        FReference: TOpenAPIDefinition.Reference;
        FAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Encoding.THeaders.TadditionalProperties>;

        function GetHeader: TOpenAPIDefinition.Header;
        function GetReference: TOpenAPIDefinition.Reference;
        function GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Encoding.THeaders.TadditionalProperties>;
        function GetHeaderStored: Boolean;
        function GetReferenceStored: Boolean;
        function GetAdditionalPropertiesStored: Boolean;
      public
        destructor Destroy; override;

        property IsHeaderStored: Boolean read GetHeaderStored;
        property IsReferenceStored: Boolean read GetReferenceStored;
        property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
      published
        property Header: TOpenAPIDefinition.Header read GetHeader write FHeader stored GetHeaderStored;
        property Reference: TOpenAPIDefinition.Reference read GetReference write FReference stored GetReferenceStored;
        property additionalProperties: TDynamicProperty<TOpenAPIDefinition.Encoding.THeaders.TadditionalProperties> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
      end;
    private
      FContentType: System.String;
      FHeaders: TOpenAPIDefinition.Encoding.THeaders;
      FStyle: TOpenAPIDefinition.Encoding.TStyle;
      FExplode: System.Boolean;
      FAllowReserved: System.Boolean;
      FPatternProperty: TDynamicProperty<any>;
      FStyleIsStored: Boolean;

      function GetHeaders: TOpenAPIDefinition.Encoding.THeaders;
      function GetPatternProperty: TDynamicProperty<any>;
      function GetContentTypeStored: Boolean;
      function GetHeadersStored: Boolean;
      function GetExplodeStored: Boolean;
      function GetAllowReservedStored: Boolean;
      function GetPatternPropertyStored: Boolean;
      procedure SetStyle(const Value: TOpenAPIDefinition.Encoding.TStyle);
    public
      destructor Destroy; override;

      property IsContentTypeStored: Boolean read GetContentTypeStored;
      property IsHeadersStored: Boolean read GetHeadersStored;
      property IsStyleStored: Boolean read FStyleIsStored;
      property IsExplodeStored: Boolean read GetExplodeStored;
      property IsAllowReservedStored: Boolean read GetAllowReservedStored;
      property IsPatternPropertyStored: Boolean read GetPatternPropertyStored;
    published
      property contentType: System.String read FContentType write FContentType stored GetContentTypeStored;
      property headers: TOpenAPIDefinition.Encoding.THeaders read GetHeaders write FHeaders stored GetHeadersStored;
      property style: TOpenAPIDefinition.Encoding.TStyle read FStyle write SetStyle stored FStyleIsStored;
      property explode: System.Boolean read FExplode write FExplode stored GetExplodeStored;
      property allowReserved: System.Boolean read FAllowReserved write FAllowReserved stored GetAllowReservedStored;
      [PatternProperty('^x-')]
      property PatternProperty: TDynamicProperty<any> read GetPatternProperty write FPatternProperty stored GetPatternPropertyStored;
    end;

    TOpenAPIDefinition = class
    private
      FOpenapi: System.String;
      FInfo: TOpenAPIDefinition.Info;
      FExternalDocs: TOpenAPIDefinition.ExternalDocumentation;
      FServers: TArray<TOpenAPIDefinition.Server>;
      FSecurity: TArray<TOpenAPIDefinition.SecurityRequirement>;
      FTags: TArray<TOpenAPIDefinition.Tag>;
      FPaths: TOpenAPIDefinition.Paths;
      FComponents: TOpenAPIDefinition.Components;
      FPatternProperty: TDynamicProperty<any>;

      function GetInfo: TOpenAPIDefinition.Info;
      function GetExternalDocs: TOpenAPIDefinition.ExternalDocumentation;
      function GetPaths: TOpenAPIDefinition.Paths;
      function GetComponents: TOpenAPIDefinition.Components;
      function GetPatternProperty: TDynamicProperty<any>;
      function GetExternalDocsStored: Boolean;
      function GetServersStored: Boolean;
      function GetSecurityStored: Boolean;
      function GetTagsStored: Boolean;
      function GetComponentsStored: Boolean;
      function GetPatternPropertyStored: Boolean;
    public
      destructor Destroy; override;

      function AddServers: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Server;
      function AddSecurity: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.SecurityRequirement;
      function AddTags: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Tag;

      property IsExternalDocsStored: Boolean read GetExternalDocsStored;
      property IsServersStored: Boolean read GetServersStored;
      property IsSecurityStored: Boolean read GetSecurityStored;
      property IsTagsStored: Boolean read GetTagsStored;
      property IsComponentsStored: Boolean read GetComponentsStored;
      property IsPatternPropertyStored: Boolean read GetPatternPropertyStored;
    published
      property openapi: System.String read FOpenapi write FOpenapi;
      property info: TOpenAPIDefinition.Info read GetInfo write FInfo;
      property externalDocs: TOpenAPIDefinition.ExternalDocumentation read GetExternalDocs write FExternalDocs stored GetExternalDocsStored;
      property servers: TArray<TOpenAPIDefinition.Server> read FServers write FServers stored GetServersStored;
      property security: TArray<TOpenAPIDefinition.SecurityRequirement> read FSecurity write FSecurity stored GetSecurityStored;
      property tags: TArray<TOpenAPIDefinition.Tag> read FTags write FTags stored GetTagsStored;
      property paths: TOpenAPIDefinition.Paths read GetPaths write FPaths;
      property components: TOpenAPIDefinition.Components read GetComponents write FComponents stored GetComponentsStored;
      [PatternProperty('^x-')]
      property PatternProperty: TDynamicProperty<any> read GetPatternProperty write FPatternProperty stored GetPatternPropertyStored;
    end;
  end;

implementation

uses System.SysUtils;

{ TOpenAPIDefinition.Reference }

destructor TOpenAPIDefinition.Reference.Destroy;
begin
  FString.Free;

  inherited;
end;

function TOpenAPIDefinition.Reference.GetString: TDynamicProperty<System.String>;
begin
  if not Assigned(FString) then
    FString := TDynamicProperty<System.String>.Create;

  Result := FString;
end;

function TOpenAPIDefinition.Reference.GetStringStored: Boolean;
begin
  Result := Assigned(FString);
end;

{ TOpenAPIDefinition.Info }

destructor TOpenAPIDefinition.Info.Destroy;
begin
  FContact.Free;

  FLicense.Free;

  FPatternProperty.Free;

  inherited;
end;

function TOpenAPIDefinition.Info.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.Info.GetTermsOfServiceStored: Boolean;
begin
  Result := not FTermsOfService.IsEmpty;
end;

function TOpenAPIDefinition.Info.GetContact: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Contact;
begin
  if not Assigned(FContact) then
    FContact := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Contact.Create;

  Result := FContact;
end;

function TOpenAPIDefinition.Info.GetContactStored: Boolean;
begin
  Result := Assigned(FContact);
end;

function TOpenAPIDefinition.Info.GetLicense: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.License;
begin
  if not Assigned(FLicense) then
    FLicense := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.License.Create;

  Result := FLicense;
end;

function TOpenAPIDefinition.Info.GetLicenseStored: Boolean;
begin
  Result := Assigned(FLicense);
end;

function TOpenAPIDefinition.Info.GetPatternProperty: TDynamicProperty<any>;
begin
  if not Assigned(FPatternProperty) then
    FPatternProperty := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FPatternProperty;
end;

function TOpenAPIDefinition.Info.GetPatternPropertyStored: Boolean;
begin
  Result := Assigned(FPatternProperty);
end;

{ TOpenAPIDefinition.Contact }

destructor TOpenAPIDefinition.Contact.Destroy;
begin
  FPatternProperty.Free;

  inherited;
end;

function TOpenAPIDefinition.Contact.GetNameStored: Boolean;
begin
  Result := not FName.IsEmpty;
end;

function TOpenAPIDefinition.Contact.GetUrlStored: Boolean;
begin
  Result := not FUrl.IsEmpty;
end;

function TOpenAPIDefinition.Contact.GetEmailStored: Boolean;
begin
  Result := not FEmail.IsEmpty;
end;

function TOpenAPIDefinition.Contact.GetPatternProperty: TDynamicProperty<any>;
begin
  if not Assigned(FPatternProperty) then
    FPatternProperty := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FPatternProperty;
end;

function TOpenAPIDefinition.Contact.GetPatternPropertyStored: Boolean;
begin
  Result := Assigned(FPatternProperty);
end;

{ TOpenAPIDefinition.License }

destructor TOpenAPIDefinition.License.Destroy;
begin
  FPatternProperty.Free;

  inherited;
end;

function TOpenAPIDefinition.License.GetUrlStored: Boolean;
begin
  Result := not FUrl.IsEmpty;
end;

function TOpenAPIDefinition.License.GetPatternProperty: TDynamicProperty<any>;
begin
  if not Assigned(FPatternProperty) then
    FPatternProperty := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FPatternProperty;
end;

function TOpenAPIDefinition.License.GetPatternPropertyStored: Boolean;
begin
  Result := Assigned(FPatternProperty);
end;

{ TOpenAPIDefinition.Server }

destructor TOpenAPIDefinition.Server.Destroy;
begin
  FVariables.Free;

  FPatternProperty.Free;

  inherited;
end;

function TOpenAPIDefinition.Server.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.Server.GetVariables: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Server.TVariables;
begin
  if not Assigned(FVariables) then
    FVariables := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Server.TVariables.Create;

  Result := FVariables;
end;

function TOpenAPIDefinition.Server.GetVariablesStored: Boolean;
begin
  Result := Assigned(FVariables);
end;

function TOpenAPIDefinition.Server.GetPatternProperty: TDynamicProperty<any>;
begin
  if not Assigned(FPatternProperty) then
    FPatternProperty := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FPatternProperty;
end;

function TOpenAPIDefinition.Server.GetPatternPropertyStored: Boolean;
begin
  Result := Assigned(FPatternProperty);
end;

{ TOpenAPIDefinition.Server.TVariables }

destructor TOpenAPIDefinition.Server.TVariables.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.Server.TVariables.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.ServerVariable>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.ServerVariable>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.Server.TVariables.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.ServerVariable }

destructor TOpenAPIDefinition.ServerVariable.Destroy;
begin
  FPatternProperty.Free;

  inherited;
end;

function TOpenAPIDefinition.ServerVariable.GetEnumStored: Boolean;
begin
  Result := Assigned(FEnum);
end;

function TOpenAPIDefinition.ServerVariable.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.ServerVariable.GetPatternProperty: TDynamicProperty<any>;
begin
  if not Assigned(FPatternProperty) then
    FPatternProperty := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FPatternProperty;
end;

function TOpenAPIDefinition.ServerVariable.GetPatternPropertyStored: Boolean;
begin
  Result := Assigned(FPatternProperty);
end;

{ TOpenAPIDefinition.Components }

destructor TOpenAPIDefinition.Components.Destroy;
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

  FPatternProperty.Free;

  inherited;
end;

function TOpenAPIDefinition.Components.GetSchemas: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Components.TSchemas;
begin
  if not Assigned(FSchemas) then
    FSchemas := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Components.TSchemas.Create;

  Result := FSchemas;
end;

function TOpenAPIDefinition.Components.GetSchemasStored: Boolean;
begin
  Result := Assigned(FSchemas);
end;

function TOpenAPIDefinition.Components.GetResponses: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Components.TResponses;
begin
  if not Assigned(FResponses) then
    FResponses := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Components.TResponses.Create;

  Result := FResponses;
end;

function TOpenAPIDefinition.Components.GetResponsesStored: Boolean;
begin
  Result := Assigned(FResponses);
end;

function TOpenAPIDefinition.Components.GetParameters: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Components.TParameters;
begin
  if not Assigned(FParameters) then
    FParameters := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Components.TParameters.Create;

  Result := FParameters;
end;

function TOpenAPIDefinition.Components.GetParametersStored: Boolean;
begin
  Result := Assigned(FParameters);
end;

function TOpenAPIDefinition.Components.GetExamples: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Components.TExamples;
begin
  if not Assigned(FExamples) then
    FExamples := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Components.TExamples.Create;

  Result := FExamples;
end;

function TOpenAPIDefinition.Components.GetExamplesStored: Boolean;
begin
  Result := Assigned(FExamples);
end;

function TOpenAPIDefinition.Components.GetRequestBodies: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Components.TRequestBodies;
begin
  if not Assigned(FRequestBodies) then
    FRequestBodies := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Components.TRequestBodies.Create;

  Result := FRequestBodies;
end;

function TOpenAPIDefinition.Components.GetRequestBodiesStored: Boolean;
begin
  Result := Assigned(FRequestBodies);
end;

function TOpenAPIDefinition.Components.GetHeaders: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Components.THeaders;
begin
  if not Assigned(FHeaders) then
    FHeaders := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Components.THeaders.Create;

  Result := FHeaders;
end;

function TOpenAPIDefinition.Components.GetHeadersStored: Boolean;
begin
  Result := Assigned(FHeaders);
end;

function TOpenAPIDefinition.Components.GetSecuritySchemes: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Components.TSecuritySchemes;
begin
  if not Assigned(FSecuritySchemes) then
    FSecuritySchemes := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Components.TSecuritySchemes.Create;

  Result := FSecuritySchemes;
end;

function TOpenAPIDefinition.Components.GetSecuritySchemesStored: Boolean;
begin
  Result := Assigned(FSecuritySchemes);
end;

function TOpenAPIDefinition.Components.GetLinks: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Components.TLinks;
begin
  if not Assigned(FLinks) then
    FLinks := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Components.TLinks.Create;

  Result := FLinks;
end;

function TOpenAPIDefinition.Components.GetLinksStored: Boolean;
begin
  Result := Assigned(FLinks);
end;

function TOpenAPIDefinition.Components.GetCallbacks: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Components.TCallbacks;
begin
  if not Assigned(FCallbacks) then
    FCallbacks := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Components.TCallbacks.Create;

  Result := FCallbacks;
end;

function TOpenAPIDefinition.Components.GetCallbacksStored: Boolean;
begin
  Result := Assigned(FCallbacks);
end;

function TOpenAPIDefinition.Components.GetPatternProperty: TDynamicProperty<any>;
begin
  if not Assigned(FPatternProperty) then
    FPatternProperty := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FPatternProperty;
end;

function TOpenAPIDefinition.Components.GetPatternPropertyStored: Boolean;
begin
  Result := Assigned(FPatternProperty);
end;

{ TOpenAPIDefinition.Components.TSchemas }

destructor TOpenAPIDefinition.Components.TSchemas.Destroy;
begin
  FPatternProperty.Free;

  inherited;
end;

function TOpenAPIDefinition.Components.TSchemas.GetPatternProperty: TDynamicProperty<TOpenAPIDefinition.Components.TSchemas.TPatternProperty>;
begin
  if not Assigned(FPatternProperty) then
    FPatternProperty := TDynamicProperty<Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Components.TSchemas.TPatternProperty>.Create;

  Result := FPatternProperty;
end;

function TOpenAPIDefinition.Components.TSchemas.GetPatternPropertyStored: Boolean;
begin
  Result := Assigned(FPatternProperty);
end;

{ TOpenAPIDefinition.Components.TSchemas.TPatternProperty }

destructor TOpenAPIDefinition.Components.TSchemas.TPatternProperty.Destroy;
begin
  FSchema.Free;

  FReference.Free;

  inherited;
end;

function TOpenAPIDefinition.Components.TSchemas.TPatternProperty.GetSchema: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema.Create;

  Result := FSchema;
end;

function TOpenAPIDefinition.Components.TSchemas.TPatternProperty.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function TOpenAPIDefinition.Components.TSchemas.TPatternProperty.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Components.TSchemas.TPatternProperty.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

{ TOpenAPIDefinition.Components.TResponses }

destructor TOpenAPIDefinition.Components.TResponses.Destroy;
begin
  FPatternProperty.Free;

  inherited;
end;

function TOpenAPIDefinition.Components.TResponses.GetPatternProperty: TDynamicProperty<TOpenAPIDefinition.Components.TResponses.TPatternProperty>;
begin
  if not Assigned(FPatternProperty) then
    FPatternProperty := TDynamicProperty<Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Components.TResponses.TPatternProperty>.Create;

  Result := FPatternProperty;
end;

function TOpenAPIDefinition.Components.TResponses.GetPatternPropertyStored: Boolean;
begin
  Result := Assigned(FPatternProperty);
end;

{ TOpenAPIDefinition.Components.TResponses.TPatternProperty }

destructor TOpenAPIDefinition.Components.TResponses.TPatternProperty.Destroy;
begin
  FReference.Free;

  FResponse.Free;

  inherited;
end;

function TOpenAPIDefinition.Components.TResponses.TPatternProperty.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Components.TResponses.TPatternProperty.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

function TOpenAPIDefinition.Components.TResponses.TPatternProperty.GetResponse: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Response;
begin
  if not Assigned(FResponse) then
    FResponse := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Response.Create;

  Result := FResponse;
end;

function TOpenAPIDefinition.Components.TResponses.TPatternProperty.GetResponseStored: Boolean;
begin
  Result := Assigned(FResponse);
end;

{ TOpenAPIDefinition.Components.TParameters }

destructor TOpenAPIDefinition.Components.TParameters.Destroy;
begin
  FPatternProperty.Free;

  inherited;
end;

function TOpenAPIDefinition.Components.TParameters.GetPatternProperty: TDynamicProperty<TOpenAPIDefinition.Components.TParameters.TPatternProperty>;
begin
  if not Assigned(FPatternProperty) then
    FPatternProperty := TDynamicProperty<Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Components.TParameters.TPatternProperty>.Create;

  Result := FPatternProperty;
end;

function TOpenAPIDefinition.Components.TParameters.GetPatternPropertyStored: Boolean;
begin
  Result := Assigned(FPatternProperty);
end;

{ TOpenAPIDefinition.Components.TParameters.TPatternProperty }

destructor TOpenAPIDefinition.Components.TParameters.TPatternProperty.Destroy;
begin
  FReference.Free;

  FParameter.Free;

  inherited;
end;

function TOpenAPIDefinition.Components.TParameters.TPatternProperty.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Components.TParameters.TPatternProperty.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

function TOpenAPIDefinition.Components.TParameters.TPatternProperty.GetParameter: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Parameter;
begin
  if not Assigned(FParameter) then
    FParameter := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Parameter.Create;

  Result := FParameter;
end;

function TOpenAPIDefinition.Components.TParameters.TPatternProperty.GetParameterStored: Boolean;
begin
  Result := Assigned(FParameter);
end;

{ TOpenAPIDefinition.Components.TExamples }

destructor TOpenAPIDefinition.Components.TExamples.Destroy;
begin
  FPatternProperty.Free;

  inherited;
end;

function TOpenAPIDefinition.Components.TExamples.GetPatternProperty: TDynamicProperty<TOpenAPIDefinition.Components.TExamples.TPatternProperty>;
begin
  if not Assigned(FPatternProperty) then
    FPatternProperty := TDynamicProperty<Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Components.TExamples.TPatternProperty>.Create;

  Result := FPatternProperty;
end;

function TOpenAPIDefinition.Components.TExamples.GetPatternPropertyStored: Boolean;
begin
  Result := Assigned(FPatternProperty);
end;

{ TOpenAPIDefinition.Components.TExamples.TPatternProperty }

destructor TOpenAPIDefinition.Components.TExamples.TPatternProperty.Destroy;
begin
  FReference.Free;

  FExample.Free;

  inherited;
end;

function TOpenAPIDefinition.Components.TExamples.TPatternProperty.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Components.TExamples.TPatternProperty.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

function TOpenAPIDefinition.Components.TExamples.TPatternProperty.GetExample: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Example;
begin
  if not Assigned(FExample) then
    FExample := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Example.Create;

  Result := FExample;
end;

function TOpenAPIDefinition.Components.TExamples.TPatternProperty.GetExampleStored: Boolean;
begin
  Result := Assigned(FExample);
end;

{ TOpenAPIDefinition.Components.TRequestBodies }

destructor TOpenAPIDefinition.Components.TRequestBodies.Destroy;
begin
  FPatternProperty.Free;

  inherited;
end;

function TOpenAPIDefinition.Components.TRequestBodies.GetPatternProperty: TDynamicProperty<TOpenAPIDefinition.Components.TRequestBodies.TPatternProperty>;
begin
  if not Assigned(FPatternProperty) then
    FPatternProperty := TDynamicProperty<Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Components.TRequestBodies.TPatternProperty>.Create;

  Result := FPatternProperty;
end;

function TOpenAPIDefinition.Components.TRequestBodies.GetPatternPropertyStored: Boolean;
begin
  Result := Assigned(FPatternProperty);
end;

{ TOpenAPIDefinition.Components.TRequestBodies.TPatternProperty }

destructor TOpenAPIDefinition.Components.TRequestBodies.TPatternProperty.Destroy;
begin
  FReference.Free;

  FRequestBody.Free;

  inherited;
end;

function TOpenAPIDefinition.Components.TRequestBodies.TPatternProperty.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Components.TRequestBodies.TPatternProperty.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

function TOpenAPIDefinition.Components.TRequestBodies.TPatternProperty.GetRequestBody: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.RequestBody;
begin
  if not Assigned(FRequestBody) then
    FRequestBody := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.RequestBody.Create;

  Result := FRequestBody;
end;

function TOpenAPIDefinition.Components.TRequestBodies.TPatternProperty.GetRequestBodyStored: Boolean;
begin
  Result := Assigned(FRequestBody);
end;

{ TOpenAPIDefinition.Components.THeaders }

destructor TOpenAPIDefinition.Components.THeaders.Destroy;
begin
  FPatternProperty.Free;

  inherited;
end;

function TOpenAPIDefinition.Components.THeaders.GetPatternProperty: TDynamicProperty<TOpenAPIDefinition.Components.THeaders.TPatternProperty>;
begin
  if not Assigned(FPatternProperty) then
    FPatternProperty := TDynamicProperty<Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Components.THeaders.TPatternProperty>.Create;

  Result := FPatternProperty;
end;

function TOpenAPIDefinition.Components.THeaders.GetPatternPropertyStored: Boolean;
begin
  Result := Assigned(FPatternProperty);
end;

{ TOpenAPIDefinition.Components.THeaders.TPatternProperty }

destructor TOpenAPIDefinition.Components.THeaders.TPatternProperty.Destroy;
begin
  FReference.Free;

  FHeader.Free;

  inherited;
end;

function TOpenAPIDefinition.Components.THeaders.TPatternProperty.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Components.THeaders.TPatternProperty.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

function TOpenAPIDefinition.Components.THeaders.TPatternProperty.GetHeader: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Header;
begin
  if not Assigned(FHeader) then
    FHeader := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Header.Create;

  Result := FHeader;
end;

function TOpenAPIDefinition.Components.THeaders.TPatternProperty.GetHeaderStored: Boolean;
begin
  Result := Assigned(FHeader);
end;

{ TOpenAPIDefinition.Components.TSecuritySchemes }

destructor TOpenAPIDefinition.Components.TSecuritySchemes.Destroy;
begin
  FPatternProperty.Free;

  inherited;
end;

function TOpenAPIDefinition.Components.TSecuritySchemes.GetPatternProperty: TDynamicProperty<TOpenAPIDefinition.Components.TSecuritySchemes.TPatternProperty>;
begin
  if not Assigned(FPatternProperty) then
    FPatternProperty := TDynamicProperty<Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Components.TSecuritySchemes.TPatternProperty>.Create;

  Result := FPatternProperty;
end;

function TOpenAPIDefinition.Components.TSecuritySchemes.GetPatternPropertyStored: Boolean;
begin
  Result := Assigned(FPatternProperty);
end;

{ TOpenAPIDefinition.Components.TSecuritySchemes.TPatternProperty }

destructor TOpenAPIDefinition.Components.TSecuritySchemes.TPatternProperty.Destroy;
begin
  FReference.Free;

  FSecurityScheme.Free;

  inherited;
end;

function TOpenAPIDefinition.Components.TSecuritySchemes.TPatternProperty.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Components.TSecuritySchemes.TPatternProperty.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

function TOpenAPIDefinition.Components.TSecuritySchemes.TPatternProperty.GetSecurityScheme: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.SecurityScheme;
begin
  if not Assigned(FSecurityScheme) then
    FSecurityScheme := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.SecurityScheme.Create;

  Result := FSecurityScheme;
end;

function TOpenAPIDefinition.Components.TSecuritySchemes.TPatternProperty.GetSecuritySchemeStored: Boolean;
begin
  Result := Assigned(FSecurityScheme);
end;

{ TOpenAPIDefinition.Components.TLinks }

destructor TOpenAPIDefinition.Components.TLinks.Destroy;
begin
  FPatternProperty.Free;

  inherited;
end;

function TOpenAPIDefinition.Components.TLinks.GetPatternProperty: TDynamicProperty<TOpenAPIDefinition.Components.TLinks.TPatternProperty>;
begin
  if not Assigned(FPatternProperty) then
    FPatternProperty := TDynamicProperty<Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Components.TLinks.TPatternProperty>.Create;

  Result := FPatternProperty;
end;

function TOpenAPIDefinition.Components.TLinks.GetPatternPropertyStored: Boolean;
begin
  Result := Assigned(FPatternProperty);
end;

{ TOpenAPIDefinition.Components.TLinks.TPatternProperty }

destructor TOpenAPIDefinition.Components.TLinks.TPatternProperty.Destroy;
begin
  FReference.Free;

  FLink.Free;

  inherited;
end;

function TOpenAPIDefinition.Components.TLinks.TPatternProperty.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Components.TLinks.TPatternProperty.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

function TOpenAPIDefinition.Components.TLinks.TPatternProperty.GetLink: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Link;
begin
  if not Assigned(FLink) then
    FLink := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Link.Create;

  Result := FLink;
end;

function TOpenAPIDefinition.Components.TLinks.TPatternProperty.GetLinkStored: Boolean;
begin
  Result := Assigned(FLink);
end;

{ TOpenAPIDefinition.Components.TCallbacks }

destructor TOpenAPIDefinition.Components.TCallbacks.Destroy;
begin
  FPatternProperty.Free;

  inherited;
end;

function TOpenAPIDefinition.Components.TCallbacks.GetPatternProperty: TDynamicProperty<TOpenAPIDefinition.Components.TCallbacks.TPatternProperty>;
begin
  if not Assigned(FPatternProperty) then
    FPatternProperty := TDynamicProperty<Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Components.TCallbacks.TPatternProperty>.Create;

  Result := FPatternProperty;
end;

function TOpenAPIDefinition.Components.TCallbacks.GetPatternPropertyStored: Boolean;
begin
  Result := Assigned(FPatternProperty);
end;

{ TOpenAPIDefinition.Components.TCallbacks.TPatternProperty }

destructor TOpenAPIDefinition.Components.TCallbacks.TPatternProperty.Destroy;
begin
  FReference.Free;

  FCallback.Free;

  inherited;
end;

function TOpenAPIDefinition.Components.TCallbacks.TPatternProperty.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Components.TCallbacks.TPatternProperty.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

function TOpenAPIDefinition.Components.TCallbacks.TPatternProperty.GetCallback: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Callback;
begin
  if not Assigned(FCallback) then
    FCallback := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Callback.Create;

  Result := FCallback;
end;

function TOpenAPIDefinition.Components.TCallbacks.TPatternProperty.GetCallbackStored: Boolean;
begin
  Result := Assigned(FCallback);
end;

{ TOpenAPIDefinition.Schema }

destructor TOpenAPIDefinition.Schema.Destroy;
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

  FPatternProperty.Free;

  inherited;
end;

function TOpenAPIDefinition.Schema.GetTitleStored: Boolean;
begin
  Result := not FTitle.IsEmpty;
end;

function TOpenAPIDefinition.Schema.GetMultipleOfStored: Boolean;
begin
  Result := FMultipleOf <> 0;
end;

function TOpenAPIDefinition.Schema.GetMaximumStored: Boolean;
begin
  Result := FMaximum <> 0;
end;

function TOpenAPIDefinition.Schema.GetExclusiveMaximumStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.Schema.GetMinimumStored: Boolean;
begin
  Result := FMinimum <> 0;
end;

function TOpenAPIDefinition.Schema.GetExclusiveMinimumStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.Schema.GetMaxLengthStored: Boolean;
begin
  Result := FMaxLength <> 0;
end;

function TOpenAPIDefinition.Schema.GetMinLengthStored: Boolean;
begin
  Result := FMinLength <> 0;
end;

function TOpenAPIDefinition.Schema.GetPatternStored: Boolean;
begin
  Result := not FPattern.IsEmpty;
end;

function TOpenAPIDefinition.Schema.GetMaxItemsStored: Boolean;
begin
  Result := FMaxItems <> 0;
end;

function TOpenAPIDefinition.Schema.GetMinItemsStored: Boolean;
begin
  Result := FMinItems <> 0;
end;

function TOpenAPIDefinition.Schema.GetUniqueItemsStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.Schema.GetMaxPropertiesStored: Boolean;
begin
  Result := FMaxProperties <> 0;
end;

function TOpenAPIDefinition.Schema.GetMinPropertiesStored: Boolean;
begin
  Result := FMinProperties <> 0;
end;

function TOpenAPIDefinition.Schema.GetRequiredStored: Boolean;
begin
  Result := Assigned(FRequired);
end;

function TOpenAPIDefinition.Schema.GetEnumStored: Boolean;
begin
  Result := Assigned(FEnum);
end;

procedure TOpenAPIDefinition.Schema.SetType(const Value: TOpenAPIDefinition.Schema.TType);
begin
  FType := Value;
  FTypeIsStored := True;
end;

function TOpenAPIDefinition.Schema.GetNot: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema.TNot;
begin
  if not Assigned(FNot) then
    FNot := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema.TNot.Create;

  Result := FNot;
end;

function TOpenAPIDefinition.Schema.GetNotStored: Boolean;
begin
  Result := Assigned(FNot);
end;

function TOpenAPIDefinition.Schema.AddAllOf: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema.TAllOfArrayItem;
begin
  Result := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema.TAllOfArrayItem.Create;

  FAllOf := FAllOf + [Result];
end;

function TOpenAPIDefinition.Schema.GetAllOfStored: Boolean;
begin
  Result := Assigned(FAllOf);
end;

function TOpenAPIDefinition.Schema.AddOneOf: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema.TOneOfArrayItem;
begin
  Result := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema.TOneOfArrayItem.Create;

  FOneOf := FOneOf + [Result];
end;

function TOpenAPIDefinition.Schema.GetOneOfStored: Boolean;
begin
  Result := Assigned(FOneOf);
end;

function TOpenAPIDefinition.Schema.AddAnyOf: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema.TAnyOfArrayItem;
begin
  Result := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema.TAnyOfArrayItem.Create;

  FAnyOf := FAnyOf + [Result];
end;

function TOpenAPIDefinition.Schema.GetAnyOfStored: Boolean;
begin
  Result := Assigned(FAnyOf);
end;

function TOpenAPIDefinition.Schema.GetItems: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema.TItems;
begin
  if not Assigned(FItems) then
    FItems := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema.TItems.Create;

  Result := FItems;
end;

function TOpenAPIDefinition.Schema.GetItemsStored: Boolean;
begin
  Result := Assigned(FItems);
end;

function TOpenAPIDefinition.Schema.GetProperties: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema.TProperties;
begin
  if not Assigned(FProperties) then
    FProperties := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema.TProperties.Create;

  Result := FProperties;
end;

function TOpenAPIDefinition.Schema.GetPropertiesStored: Boolean;
begin
  Result := Assigned(FProperties);
end;

function TOpenAPIDefinition.Schema.GetAdditionalProperties: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema.TAdditionalProperties;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema.TAdditionalProperties.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.Schema.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

function TOpenAPIDefinition.Schema.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.Schema.GetFormatStored: Boolean;
begin
  Result := not FFormat.IsEmpty;
end;

function TOpenAPIDefinition.Schema.GetDefaultStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.Schema.GetNullableStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.Schema.GetDiscriminator: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Discriminator;
begin
  if not Assigned(FDiscriminator) then
    FDiscriminator := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Discriminator.Create;

  Result := FDiscriminator;
end;

function TOpenAPIDefinition.Schema.GetDiscriminatorStored: Boolean;
begin
  Result := Assigned(FDiscriminator);
end;

function TOpenAPIDefinition.Schema.GetReadOnlyStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.Schema.GetWriteOnlyStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.Schema.GetExampleStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.Schema.GetExternalDocs: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.ExternalDocumentation;
begin
  if not Assigned(FExternalDocs) then
    FExternalDocs := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.ExternalDocumentation.Create;

  Result := FExternalDocs;
end;

function TOpenAPIDefinition.Schema.GetExternalDocsStored: Boolean;
begin
  Result := Assigned(FExternalDocs);
end;

function TOpenAPIDefinition.Schema.GetDeprecatedStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.Schema.GetXml: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.XML;
begin
  if not Assigned(FXml) then
    FXml := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.XML.Create;

  Result := FXml;
end;

function TOpenAPIDefinition.Schema.GetXmlStored: Boolean;
begin
  Result := Assigned(FXml);
end;

function TOpenAPIDefinition.Schema.GetPatternProperty: TDynamicProperty<any>;
begin
  if not Assigned(FPatternProperty) then
    FPatternProperty := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FPatternProperty;
end;

function TOpenAPIDefinition.Schema.GetPatternPropertyStored: Boolean;
begin
  Result := Assigned(FPatternProperty);
end;

{ TOpenAPIDefinition.Schema.TNot }

destructor TOpenAPIDefinition.Schema.TNot.Destroy;
begin
  FSchema.Free;

  FReference.Free;

  inherited;
end;

function TOpenAPIDefinition.Schema.TNot.GetSchema: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema.Create;

  Result := FSchema;
end;

function TOpenAPIDefinition.Schema.TNot.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function TOpenAPIDefinition.Schema.TNot.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Schema.TNot.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

{ TOpenAPIDefinition.Schema.TAllOfArrayItem }

destructor TOpenAPIDefinition.Schema.TAllOfArrayItem.Destroy;
begin
  FSchema.Free;

  FReference.Free;

  inherited;
end;

function TOpenAPIDefinition.Schema.TAllOfArrayItem.GetSchema: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema.Create;

  Result := FSchema;
end;

function TOpenAPIDefinition.Schema.TAllOfArrayItem.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function TOpenAPIDefinition.Schema.TAllOfArrayItem.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Schema.TAllOfArrayItem.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

{ TOpenAPIDefinition.Schema.TOneOfArrayItem }

destructor TOpenAPIDefinition.Schema.TOneOfArrayItem.Destroy;
begin
  FSchema.Free;

  FReference.Free;

  inherited;
end;

function TOpenAPIDefinition.Schema.TOneOfArrayItem.GetSchema: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema.Create;

  Result := FSchema;
end;

function TOpenAPIDefinition.Schema.TOneOfArrayItem.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function TOpenAPIDefinition.Schema.TOneOfArrayItem.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Schema.TOneOfArrayItem.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

{ TOpenAPIDefinition.Schema.TAnyOfArrayItem }

destructor TOpenAPIDefinition.Schema.TAnyOfArrayItem.Destroy;
begin
  FSchema.Free;

  FReference.Free;

  inherited;
end;

function TOpenAPIDefinition.Schema.TAnyOfArrayItem.GetSchema: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema.Create;

  Result := FSchema;
end;

function TOpenAPIDefinition.Schema.TAnyOfArrayItem.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function TOpenAPIDefinition.Schema.TAnyOfArrayItem.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Schema.TAnyOfArrayItem.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

{ TOpenAPIDefinition.Schema.TItems }

destructor TOpenAPIDefinition.Schema.TItems.Destroy;
begin
  FSchema.Free;

  FReference.Free;

  inherited;
end;

function TOpenAPIDefinition.Schema.TItems.GetSchema: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema.Create;

  Result := FSchema;
end;

function TOpenAPIDefinition.Schema.TItems.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function TOpenAPIDefinition.Schema.TItems.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Schema.TItems.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

{ TOpenAPIDefinition.Schema.TProperties }

destructor TOpenAPIDefinition.Schema.TProperties.Destroy;
begin
  FSchema.Free;

  FReference.Free;

  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.Schema.TProperties.GetSchema: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema.Create;

  Result := FSchema;
end;

function TOpenAPIDefinition.Schema.TProperties.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function TOpenAPIDefinition.Schema.TProperties.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Schema.TProperties.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

function TOpenAPIDefinition.Schema.TProperties.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Schema.TProperties.TadditionalProperties>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema.TProperties.TadditionalProperties>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.Schema.TProperties.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.Schema.TProperties.TadditionalProperties }

destructor TOpenAPIDefinition.Schema.TProperties.TadditionalProperties.Destroy;
begin
  FSchema.Free;

  FReference.Free;

  inherited;
end;

function TOpenAPIDefinition.Schema.TProperties.TadditionalProperties.GetSchema: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema.Create;

  Result := FSchema;
end;

function TOpenAPIDefinition.Schema.TProperties.TadditionalProperties.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function TOpenAPIDefinition.Schema.TProperties.TadditionalProperties.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Schema.TProperties.TadditionalProperties.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

{ TOpenAPIDefinition.Schema.TAdditionalProperties }

destructor TOpenAPIDefinition.Schema.TAdditionalProperties.Destroy;
begin
  FSchema.Free;

  FReference.Free;

  inherited;
end;

function TOpenAPIDefinition.Schema.TAdditionalProperties.GetSchema: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema.Create;

  Result := FSchema;
end;

function TOpenAPIDefinition.Schema.TAdditionalProperties.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function TOpenAPIDefinition.Schema.TAdditionalProperties.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Schema.TAdditionalProperties.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

function TOpenAPIDefinition.Schema.TAdditionalProperties.GetBooleanStored: Boolean;
begin
  Result := False;
end;

{ TOpenAPIDefinition.Discriminator }

destructor TOpenAPIDefinition.Discriminator.Destroy;
begin
  FMapping.Free;

  inherited;
end;

function TOpenAPIDefinition.Discriminator.GetMapping: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Discriminator.TMapping;
begin
  if not Assigned(FMapping) then
    FMapping := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Discriminator.TMapping.Create;

  Result := FMapping;
end;

function TOpenAPIDefinition.Discriminator.GetMappingStored: Boolean;
begin
  Result := Assigned(FMapping);
end;

{ TOpenAPIDefinition.Discriminator.TMapping }

destructor TOpenAPIDefinition.Discriminator.TMapping.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.Discriminator.TMapping.GetAdditionalProperties: TDynamicProperty<System.String>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<System.String>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.Discriminator.TMapping.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.XML }

destructor TOpenAPIDefinition.XML.Destroy;
begin
  FPatternProperty.Free;

  inherited;
end;

function TOpenAPIDefinition.XML.GetNameStored: Boolean;
begin
  Result := not FName.IsEmpty;
end;

function TOpenAPIDefinition.XML.GetNamespaceStored: Boolean;
begin
  Result := not FNamespace.IsEmpty;
end;

function TOpenAPIDefinition.XML.GetPrefixStored: Boolean;
begin
  Result := not FPrefix.IsEmpty;
end;

function TOpenAPIDefinition.XML.GetAttributeStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.XML.GetWrappedStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.XML.GetPatternProperty: TDynamicProperty<any>;
begin
  if not Assigned(FPatternProperty) then
    FPatternProperty := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FPatternProperty;
end;

function TOpenAPIDefinition.XML.GetPatternPropertyStored: Boolean;
begin
  Result := Assigned(FPatternProperty);
end;

{ TOpenAPIDefinition.Response }

destructor TOpenAPIDefinition.Response.Destroy;
begin
  FHeaders.Free;

  FContent.Free;

  FLinks.Free;

  FPatternProperty.Free;

  inherited;
end;

function TOpenAPIDefinition.Response.GetHeaders: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Response.THeaders;
begin
  if not Assigned(FHeaders) then
    FHeaders := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Response.THeaders.Create;

  Result := FHeaders;
end;

function TOpenAPIDefinition.Response.GetHeadersStored: Boolean;
begin
  Result := Assigned(FHeaders);
end;

function TOpenAPIDefinition.Response.GetContent: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Response.TContent;
begin
  if not Assigned(FContent) then
    FContent := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Response.TContent.Create;

  Result := FContent;
end;

function TOpenAPIDefinition.Response.GetContentStored: Boolean;
begin
  Result := Assigned(FContent);
end;

function TOpenAPIDefinition.Response.GetLinks: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Response.TLinks;
begin
  if not Assigned(FLinks) then
    FLinks := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Response.TLinks.Create;

  Result := FLinks;
end;

function TOpenAPIDefinition.Response.GetLinksStored: Boolean;
begin
  Result := Assigned(FLinks);
end;

function TOpenAPIDefinition.Response.GetPatternProperty: TDynamicProperty<any>;
begin
  if not Assigned(FPatternProperty) then
    FPatternProperty := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FPatternProperty;
end;

function TOpenAPIDefinition.Response.GetPatternPropertyStored: Boolean;
begin
  Result := Assigned(FPatternProperty);
end;

{ TOpenAPIDefinition.Response.THeaders }

destructor TOpenAPIDefinition.Response.THeaders.Destroy;
begin
  FHeader.Free;

  FReference.Free;

  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.Response.THeaders.GetHeader: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Header;
begin
  if not Assigned(FHeader) then
    FHeader := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Header.Create;

  Result := FHeader;
end;

function TOpenAPIDefinition.Response.THeaders.GetHeaderStored: Boolean;
begin
  Result := Assigned(FHeader);
end;

function TOpenAPIDefinition.Response.THeaders.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Response.THeaders.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

function TOpenAPIDefinition.Response.THeaders.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Response.THeaders.TadditionalProperties>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Response.THeaders.TadditionalProperties>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.Response.THeaders.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.Response.THeaders.TadditionalProperties }

destructor TOpenAPIDefinition.Response.THeaders.TadditionalProperties.Destroy;
begin
  FHeader.Free;

  FReference.Free;

  inherited;
end;

function TOpenAPIDefinition.Response.THeaders.TadditionalProperties.GetHeader: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Header;
begin
  if not Assigned(FHeader) then
    FHeader := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Header.Create;

  Result := FHeader;
end;

function TOpenAPIDefinition.Response.THeaders.TadditionalProperties.GetHeaderStored: Boolean;
begin
  Result := Assigned(FHeader);
end;

function TOpenAPIDefinition.Response.THeaders.TadditionalProperties.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Response.THeaders.TadditionalProperties.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

{ TOpenAPIDefinition.Response.TContent }

destructor TOpenAPIDefinition.Response.TContent.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.Response.TContent.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.MediaType>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.MediaType>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.Response.TContent.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.Response.TLinks }

destructor TOpenAPIDefinition.Response.TLinks.Destroy;
begin
  FLink.Free;

  FReference.Free;

  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.Response.TLinks.GetLink: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Link;
begin
  if not Assigned(FLink) then
    FLink := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Link.Create;

  Result := FLink;
end;

function TOpenAPIDefinition.Response.TLinks.GetLinkStored: Boolean;
begin
  Result := Assigned(FLink);
end;

function TOpenAPIDefinition.Response.TLinks.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Response.TLinks.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

function TOpenAPIDefinition.Response.TLinks.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Response.TLinks.TadditionalProperties>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Response.TLinks.TadditionalProperties>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.Response.TLinks.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.Response.TLinks.TadditionalProperties }

destructor TOpenAPIDefinition.Response.TLinks.TadditionalProperties.Destroy;
begin
  FLink.Free;

  FReference.Free;

  inherited;
end;

function TOpenAPIDefinition.Response.TLinks.TadditionalProperties.GetLink: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Link;
begin
  if not Assigned(FLink) then
    FLink := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Link.Create;

  Result := FLink;
end;

function TOpenAPIDefinition.Response.TLinks.TadditionalProperties.GetLinkStored: Boolean;
begin
  Result := Assigned(FLink);
end;

function TOpenAPIDefinition.Response.TLinks.TadditionalProperties.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Response.TLinks.TadditionalProperties.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

{ TOpenAPIDefinition.MediaType }

destructor TOpenAPIDefinition.MediaType.Destroy;
begin
  FSchema.Free;

  FExamples.Free;

  FEncoding.Free;

  FPatternProperty.Free;

  inherited;
end;

function TOpenAPIDefinition.MediaType.GetSchema: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.MediaType.TSchema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.MediaType.TSchema.Create;

  Result := FSchema;
end;

function TOpenAPIDefinition.MediaType.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function TOpenAPIDefinition.MediaType.GetExampleStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.MediaType.GetExamples: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.MediaType.TExamples;
begin
  if not Assigned(FExamples) then
    FExamples := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.MediaType.TExamples.Create;

  Result := FExamples;
end;

function TOpenAPIDefinition.MediaType.GetExamplesStored: Boolean;
begin
  Result := Assigned(FExamples);
end;

function TOpenAPIDefinition.MediaType.GetEncoding: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.MediaType.TEncoding;
begin
  if not Assigned(FEncoding) then
    FEncoding := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.MediaType.TEncoding.Create;

  Result := FEncoding;
end;

function TOpenAPIDefinition.MediaType.GetEncodingStored: Boolean;
begin
  Result := Assigned(FEncoding);
end;

function TOpenAPIDefinition.MediaType.GetExampleXORExamplesStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.MediaType.GetPatternProperty: TDynamicProperty<any>;
begin
  if not Assigned(FPatternProperty) then
    FPatternProperty := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FPatternProperty;
end;

function TOpenAPIDefinition.MediaType.GetPatternPropertyStored: Boolean;
begin
  Result := Assigned(FPatternProperty);
end;

{ TOpenAPIDefinition.MediaType.TSchema }

destructor TOpenAPIDefinition.MediaType.TSchema.Destroy;
begin
  FSchema.Free;

  FReference.Free;

  inherited;
end;

function TOpenAPIDefinition.MediaType.TSchema.GetSchema: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema.Create;

  Result := FSchema;
end;

function TOpenAPIDefinition.MediaType.TSchema.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function TOpenAPIDefinition.MediaType.TSchema.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.MediaType.TSchema.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

{ TOpenAPIDefinition.MediaType.TExamples }

destructor TOpenAPIDefinition.MediaType.TExamples.Destroy;
begin
  FExample.Free;

  FReference.Free;

  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.MediaType.TExamples.GetExample: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Example;
begin
  if not Assigned(FExample) then
    FExample := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Example.Create;

  Result := FExample;
end;

function TOpenAPIDefinition.MediaType.TExamples.GetExampleStored: Boolean;
begin
  Result := Assigned(FExample);
end;

function TOpenAPIDefinition.MediaType.TExamples.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.MediaType.TExamples.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

function TOpenAPIDefinition.MediaType.TExamples.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.MediaType.TExamples.TadditionalProperties>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.MediaType.TExamples.TadditionalProperties>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.MediaType.TExamples.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.MediaType.TExamples.TadditionalProperties }

destructor TOpenAPIDefinition.MediaType.TExamples.TadditionalProperties.Destroy;
begin
  FExample.Free;

  FReference.Free;

  inherited;
end;

function TOpenAPIDefinition.MediaType.TExamples.TadditionalProperties.GetExample: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Example;
begin
  if not Assigned(FExample) then
    FExample := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Example.Create;

  Result := FExample;
end;

function TOpenAPIDefinition.MediaType.TExamples.TadditionalProperties.GetExampleStored: Boolean;
begin
  Result := Assigned(FExample);
end;

function TOpenAPIDefinition.MediaType.TExamples.TadditionalProperties.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.MediaType.TExamples.TadditionalProperties.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

{ TOpenAPIDefinition.MediaType.TEncoding }

destructor TOpenAPIDefinition.MediaType.TEncoding.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.MediaType.TEncoding.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Encoding>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Encoding>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.MediaType.TEncoding.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.Example }

destructor TOpenAPIDefinition.Example.Destroy;
begin
  FPatternProperty.Free;

  inherited;
end;

function TOpenAPIDefinition.Example.GetSummaryStored: Boolean;
begin
  Result := not FSummary.IsEmpty;
end;

function TOpenAPIDefinition.Example.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.Example.GetValueStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.Example.GetExternalValueStored: Boolean;
begin
  Result := not FExternalValue.IsEmpty;
end;

function TOpenAPIDefinition.Example.GetPatternProperty: TDynamicProperty<any>;
begin
  if not Assigned(FPatternProperty) then
    FPatternProperty := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FPatternProperty;
end;

function TOpenAPIDefinition.Example.GetPatternPropertyStored: Boolean;
begin
  Result := Assigned(FPatternProperty);
end;

{ TOpenAPIDefinition.Header }

destructor TOpenAPIDefinition.Header.Destroy;
begin
  FSchema.Free;

  FContent.Free;

  FExamples.Free;

  FSchemaXORContent.Free;

  FPatternProperty.Free;

  inherited;
end;

function TOpenAPIDefinition.Header.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.Header.GetRequiredStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.Header.GetDeprecatedStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.Header.GetAllowEmptyValueStored: Boolean;
begin
  Result := False;
end;

procedure TOpenAPIDefinition.Header.SetStyle(const Value: TOpenAPIDefinition.Header.TStyle);
begin
  FStyle := Value;
  FStyleIsStored := True;
end;

function TOpenAPIDefinition.Header.GetExplodeStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.Header.GetAllowReservedStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.Header.GetSchema: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Header.TSchema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Header.TSchema.Create;

  Result := FSchema;
end;

function TOpenAPIDefinition.Header.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function TOpenAPIDefinition.Header.GetContent: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Header.TContent;
begin
  if not Assigned(FContent) then
    FContent := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Header.TContent.Create;

  Result := FContent;
end;

function TOpenAPIDefinition.Header.GetContentStored: Boolean;
begin
  Result := Assigned(FContent);
end;

function TOpenAPIDefinition.Header.GetExampleStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.Header.GetExamples: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Header.TExamples;
begin
  if not Assigned(FExamples) then
    FExamples := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Header.TExamples.Create;

  Result := FExamples;
end;

function TOpenAPIDefinition.Header.GetExamplesStored: Boolean;
begin
  Result := Assigned(FExamples);
end;

function TOpenAPIDefinition.Header.GetExampleXORExamplesStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.Header.GetSchemaXORContent: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.SchemaXORContent;
begin
  if not Assigned(FSchemaXORContent) then
    FSchemaXORContent := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.SchemaXORContent.Create;

  Result := FSchemaXORContent;
end;

function TOpenAPIDefinition.Header.GetSchemaXORContentStored: Boolean;
begin
  Result := Assigned(FSchemaXORContent);
end;

function TOpenAPIDefinition.Header.GetPatternProperty: TDynamicProperty<any>;
begin
  if not Assigned(FPatternProperty) then
    FPatternProperty := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FPatternProperty;
end;

function TOpenAPIDefinition.Header.GetPatternPropertyStored: Boolean;
begin
  Result := Assigned(FPatternProperty);
end;

{ TOpenAPIDefinition.Header.TSchema }

destructor TOpenAPIDefinition.Header.TSchema.Destroy;
begin
  FSchema.Free;

  FReference.Free;

  inherited;
end;

function TOpenAPIDefinition.Header.TSchema.GetSchema: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema.Create;

  Result := FSchema;
end;

function TOpenAPIDefinition.Header.TSchema.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function TOpenAPIDefinition.Header.TSchema.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Header.TSchema.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

{ TOpenAPIDefinition.Header.TContent }

destructor TOpenAPIDefinition.Header.TContent.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.Header.TContent.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.MediaType>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.MediaType>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.Header.TContent.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.Header.TExamples }

destructor TOpenAPIDefinition.Header.TExamples.Destroy;
begin
  FExample.Free;

  FReference.Free;

  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.Header.TExamples.GetExample: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Example;
begin
  if not Assigned(FExample) then
    FExample := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Example.Create;

  Result := FExample;
end;

function TOpenAPIDefinition.Header.TExamples.GetExampleStored: Boolean;
begin
  Result := Assigned(FExample);
end;

function TOpenAPIDefinition.Header.TExamples.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Header.TExamples.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

function TOpenAPIDefinition.Header.TExamples.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Header.TExamples.TadditionalProperties>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Header.TExamples.TadditionalProperties>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.Header.TExamples.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.Header.TExamples.TadditionalProperties }

destructor TOpenAPIDefinition.Header.TExamples.TadditionalProperties.Destroy;
begin
  FExample.Free;

  FReference.Free;

  inherited;
end;

function TOpenAPIDefinition.Header.TExamples.TadditionalProperties.GetExample: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Example;
begin
  if not Assigned(FExample) then
    FExample := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Example.Create;

  Result := FExample;
end;

function TOpenAPIDefinition.Header.TExamples.TadditionalProperties.GetExampleStored: Boolean;
begin
  Result := Assigned(FExample);
end;

function TOpenAPIDefinition.Header.TExamples.TadditionalProperties.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Header.TExamples.TadditionalProperties.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

{ TOpenAPIDefinition.Paths }

destructor TOpenAPIDefinition.Paths.Destroy;
begin
  FPathItem.Free;

  FPatternProperty.Free;

  inherited;
end;

function TOpenAPIDefinition.Paths.GetPathItem: TDynamicProperty<TOpenAPIDefinition.PathItem>;
begin
  if not Assigned(FPathItem) then
    FPathItem := TDynamicProperty<Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.PathItem>.Create;

  Result := FPathItem;
end;

function TOpenAPIDefinition.Paths.GetPathItemStored: Boolean;
begin
  Result := Assigned(FPathItem);
end;

function TOpenAPIDefinition.Paths.GetPatternProperty: TDynamicProperty<any>;
begin
  if not Assigned(FPatternProperty) then
    FPatternProperty := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FPatternProperty;
end;

function TOpenAPIDefinition.Paths.GetPatternPropertyStored: Boolean;
begin
  Result := Assigned(FPatternProperty);
end;

{ TOpenAPIDefinition.PathItem }

destructor TOpenAPIDefinition.PathItem.Destroy;
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

  FPatternProperty.Free;

  inherited;
end;

function TOpenAPIDefinition.PathItem.GetRefStored: Boolean;
begin
  Result := not FRef.IsEmpty;
end;

function TOpenAPIDefinition.PathItem.GetSummaryStored: Boolean;
begin
  Result := not FSummary.IsEmpty;
end;

function TOpenAPIDefinition.PathItem.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.PathItem.GetGet: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Operation;
begin
  if not Assigned(FGet) then
    FGet := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Operation.Create;

  Result := FGet;
end;

function TOpenAPIDefinition.PathItem.GetGetStored: Boolean;
begin
  Result := Assigned(FGet);
end;

function TOpenAPIDefinition.PathItem.GetPut: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Operation;
begin
  if not Assigned(FPut) then
    FPut := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Operation.Create;

  Result := FPut;
end;

function TOpenAPIDefinition.PathItem.GetPutStored: Boolean;
begin
  Result := Assigned(FPut);
end;

function TOpenAPIDefinition.PathItem.GetPost: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Operation;
begin
  if not Assigned(FPost) then
    FPost := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Operation.Create;

  Result := FPost;
end;

function TOpenAPIDefinition.PathItem.GetPostStored: Boolean;
begin
  Result := Assigned(FPost);
end;

function TOpenAPIDefinition.PathItem.GetDelete: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Operation;
begin
  if not Assigned(FDelete) then
    FDelete := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Operation.Create;

  Result := FDelete;
end;

function TOpenAPIDefinition.PathItem.GetDeleteStored: Boolean;
begin
  Result := Assigned(FDelete);
end;

function TOpenAPIDefinition.PathItem.GetOptions: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Operation;
begin
  if not Assigned(FOptions) then
    FOptions := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Operation.Create;

  Result := FOptions;
end;

function TOpenAPIDefinition.PathItem.GetOptionsStored: Boolean;
begin
  Result := Assigned(FOptions);
end;

function TOpenAPIDefinition.PathItem.GetHead: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Operation;
begin
  if not Assigned(FHead) then
    FHead := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Operation.Create;

  Result := FHead;
end;

function TOpenAPIDefinition.PathItem.GetHeadStored: Boolean;
begin
  Result := Assigned(FHead);
end;

function TOpenAPIDefinition.PathItem.GetPatch: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Operation;
begin
  if not Assigned(FPatch) then
    FPatch := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Operation.Create;

  Result := FPatch;
end;

function TOpenAPIDefinition.PathItem.GetPatchStored: Boolean;
begin
  Result := Assigned(FPatch);
end;

function TOpenAPIDefinition.PathItem.GetTrace: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Operation;
begin
  if not Assigned(FTrace) then
    FTrace := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Operation.Create;

  Result := FTrace;
end;

function TOpenAPIDefinition.PathItem.GetTraceStored: Boolean;
begin
  Result := Assigned(FTrace);
end;

function TOpenAPIDefinition.PathItem.AddServers: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Server;
begin
  Result := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Server.Create;

  FServers := FServers + [Result];
end;

function TOpenAPIDefinition.PathItem.GetServersStored: Boolean;
begin
  Result := Assigned(FServers);
end;

function TOpenAPIDefinition.PathItem.AddParameters: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.PathItem.TParametersArrayItem;
begin
  Result := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.PathItem.TParametersArrayItem.Create;

  FParameters := FParameters + [Result];
end;

function TOpenAPIDefinition.PathItem.GetParametersStored: Boolean;
begin
  Result := Assigned(FParameters);
end;

function TOpenAPIDefinition.PathItem.GetPatternProperty: TDynamicProperty<any>;
begin
  if not Assigned(FPatternProperty) then
    FPatternProperty := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FPatternProperty;
end;

function TOpenAPIDefinition.PathItem.GetPatternPropertyStored: Boolean;
begin
  Result := Assigned(FPatternProperty);
end;

{ TOpenAPIDefinition.PathItem.TParametersArrayItem }

destructor TOpenAPIDefinition.PathItem.TParametersArrayItem.Destroy;
begin
  FParameter.Free;

  FReference.Free;

  inherited;
end;

function TOpenAPIDefinition.PathItem.TParametersArrayItem.GetParameter: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Parameter;
begin
  if not Assigned(FParameter) then
    FParameter := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Parameter.Create;

  Result := FParameter;
end;

function TOpenAPIDefinition.PathItem.TParametersArrayItem.GetParameterStored: Boolean;
begin
  Result := Assigned(FParameter);
end;

function TOpenAPIDefinition.PathItem.TParametersArrayItem.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.PathItem.TParametersArrayItem.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

{ TOpenAPIDefinition.Operation }

destructor TOpenAPIDefinition.Operation.Destroy;
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

  FPatternProperty.Free;

  inherited;
end;

function TOpenAPIDefinition.Operation.GetTagsStored: Boolean;
begin
  Result := Assigned(FTags);
end;

function TOpenAPIDefinition.Operation.GetSummaryStored: Boolean;
begin
  Result := not FSummary.IsEmpty;
end;

function TOpenAPIDefinition.Operation.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.Operation.GetExternalDocs: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.ExternalDocumentation;
begin
  if not Assigned(FExternalDocs) then
    FExternalDocs := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.ExternalDocumentation.Create;

  Result := FExternalDocs;
end;

function TOpenAPIDefinition.Operation.GetExternalDocsStored: Boolean;
begin
  Result := Assigned(FExternalDocs);
end;

function TOpenAPIDefinition.Operation.GetOperationIdStored: Boolean;
begin
  Result := not FOperationId.IsEmpty;
end;

function TOpenAPIDefinition.Operation.AddParameters: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Operation.TParametersArrayItem;
begin
  Result := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Operation.TParametersArrayItem.Create;

  FParameters := FParameters + [Result];
end;

function TOpenAPIDefinition.Operation.GetParametersStored: Boolean;
begin
  Result := Assigned(FParameters);
end;

function TOpenAPIDefinition.Operation.GetRequestBody: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Operation.TRequestBody;
begin
  if not Assigned(FRequestBody) then
    FRequestBody := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Operation.TRequestBody.Create;

  Result := FRequestBody;
end;

function TOpenAPIDefinition.Operation.GetRequestBodyStored: Boolean;
begin
  Result := Assigned(FRequestBody);
end;

function TOpenAPIDefinition.Operation.GetResponses: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Responses;
begin
  if not Assigned(FResponses) then
    FResponses := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Responses.Create;

  Result := FResponses;
end;

function TOpenAPIDefinition.Operation.GetCallbacks: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Operation.TCallbacks;
begin
  if not Assigned(FCallbacks) then
    FCallbacks := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Operation.TCallbacks.Create;

  Result := FCallbacks;
end;

function TOpenAPIDefinition.Operation.GetCallbacksStored: Boolean;
begin
  Result := Assigned(FCallbacks);
end;

function TOpenAPIDefinition.Operation.GetDeprecatedStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.Operation.AddSecurity: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.SecurityRequirement;
begin
  Result := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.SecurityRequirement.Create;

  FSecurity := FSecurity + [Result];
end;

function TOpenAPIDefinition.Operation.GetSecurityStored: Boolean;
begin
  Result := Assigned(FSecurity);
end;

function TOpenAPIDefinition.Operation.AddServers: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Server;
begin
  Result := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Server.Create;

  FServers := FServers + [Result];
end;

function TOpenAPIDefinition.Operation.GetServersStored: Boolean;
begin
  Result := Assigned(FServers);
end;

function TOpenAPIDefinition.Operation.GetPatternProperty: TDynamicProperty<any>;
begin
  if not Assigned(FPatternProperty) then
    FPatternProperty := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FPatternProperty;
end;

function TOpenAPIDefinition.Operation.GetPatternPropertyStored: Boolean;
begin
  Result := Assigned(FPatternProperty);
end;

{ TOpenAPIDefinition.Operation.TParametersArrayItem }

destructor TOpenAPIDefinition.Operation.TParametersArrayItem.Destroy;
begin
  FParameter.Free;

  FReference.Free;

  inherited;
end;

function TOpenAPIDefinition.Operation.TParametersArrayItem.GetParameter: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Parameter;
begin
  if not Assigned(FParameter) then
    FParameter := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Parameter.Create;

  Result := FParameter;
end;

function TOpenAPIDefinition.Operation.TParametersArrayItem.GetParameterStored: Boolean;
begin
  Result := Assigned(FParameter);
end;

function TOpenAPIDefinition.Operation.TParametersArrayItem.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Operation.TParametersArrayItem.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

{ TOpenAPIDefinition.Operation.TRequestBody }

destructor TOpenAPIDefinition.Operation.TRequestBody.Destroy;
begin
  FRequestBody.Free;

  FReference.Free;

  inherited;
end;

function TOpenAPIDefinition.Operation.TRequestBody.GetRequestBody: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.RequestBody;
begin
  if not Assigned(FRequestBody) then
    FRequestBody := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.RequestBody.Create;

  Result := FRequestBody;
end;

function TOpenAPIDefinition.Operation.TRequestBody.GetRequestBodyStored: Boolean;
begin
  Result := Assigned(FRequestBody);
end;

function TOpenAPIDefinition.Operation.TRequestBody.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Operation.TRequestBody.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

{ TOpenAPIDefinition.Operation.TCallbacks }

destructor TOpenAPIDefinition.Operation.TCallbacks.Destroy;
begin
  FCallback.Free;

  FReference.Free;

  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.Operation.TCallbacks.GetCallback: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Callback;
begin
  if not Assigned(FCallback) then
    FCallback := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Callback.Create;

  Result := FCallback;
end;

function TOpenAPIDefinition.Operation.TCallbacks.GetCallbackStored: Boolean;
begin
  Result := Assigned(FCallback);
end;

function TOpenAPIDefinition.Operation.TCallbacks.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Operation.TCallbacks.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

function TOpenAPIDefinition.Operation.TCallbacks.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Operation.TCallbacks.TadditionalProperties>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Operation.TCallbacks.TadditionalProperties>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.Operation.TCallbacks.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.Operation.TCallbacks.TadditionalProperties }

destructor TOpenAPIDefinition.Operation.TCallbacks.TadditionalProperties.Destroy;
begin
  FCallback.Free;

  FReference.Free;

  inherited;
end;

function TOpenAPIDefinition.Operation.TCallbacks.TadditionalProperties.GetCallback: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Callback;
begin
  if not Assigned(FCallback) then
    FCallback := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Callback.Create;

  Result := FCallback;
end;

function TOpenAPIDefinition.Operation.TCallbacks.TadditionalProperties.GetCallbackStored: Boolean;
begin
  Result := Assigned(FCallback);
end;

function TOpenAPIDefinition.Operation.TCallbacks.TadditionalProperties.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Operation.TCallbacks.TadditionalProperties.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

{ TOpenAPIDefinition.Responses }

destructor TOpenAPIDefinition.Responses.Destroy;
begin
  FDefault.Free;

  FPatternProperty.Free;

  FPatternProperty2.Free;

  inherited;
end;

function TOpenAPIDefinition.Responses.GetDefault: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Responses.TDefault;
begin
  if not Assigned(FDefault) then
    FDefault := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Responses.TDefault.Create;

  Result := FDefault;
end;

function TOpenAPIDefinition.Responses.GetDefaultStored: Boolean;
begin
  Result := Assigned(FDefault);
end;

function TOpenAPIDefinition.Responses.GetPatternProperty: TDynamicProperty<TOpenAPIDefinition.Responses.TPatternProperty>;
begin
  if not Assigned(FPatternProperty) then
    FPatternProperty := TDynamicProperty<Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Responses.TPatternProperty>.Create;

  Result := FPatternProperty;
end;

function TOpenAPIDefinition.Responses.GetPatternPropertyStored: Boolean;
begin
  Result := Assigned(FPatternProperty);
end;

function TOpenAPIDefinition.Responses.GetPatternProperty2: TDynamicProperty<any>;
begin
  if not Assigned(FPatternProperty2) then
    FPatternProperty2 := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FPatternProperty2;
end;

function TOpenAPIDefinition.Responses.GetPatternProperty2Stored: Boolean;
begin
  Result := Assigned(FPatternProperty2);
end;

{ TOpenAPIDefinition.Responses.TDefault }

destructor TOpenAPIDefinition.Responses.TDefault.Destroy;
begin
  FResponse.Free;

  FReference.Free;

  inherited;
end;

function TOpenAPIDefinition.Responses.TDefault.GetResponse: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Response;
begin
  if not Assigned(FResponse) then
    FResponse := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Response.Create;

  Result := FResponse;
end;

function TOpenAPIDefinition.Responses.TDefault.GetResponseStored: Boolean;
begin
  Result := Assigned(FResponse);
end;

function TOpenAPIDefinition.Responses.TDefault.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Responses.TDefault.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

{ TOpenAPIDefinition.Responses.TPatternProperty }

destructor TOpenAPIDefinition.Responses.TPatternProperty.Destroy;
begin
  FResponse.Free;

  FReference.Free;

  inherited;
end;

function TOpenAPIDefinition.Responses.TPatternProperty.GetResponse: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Response;
begin
  if not Assigned(FResponse) then
    FResponse := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Response.Create;

  Result := FResponse;
end;

function TOpenAPIDefinition.Responses.TPatternProperty.GetResponseStored: Boolean;
begin
  Result := Assigned(FResponse);
end;

function TOpenAPIDefinition.Responses.TPatternProperty.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Responses.TPatternProperty.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

{ TOpenAPIDefinition.SecurityRequirement }

destructor TOpenAPIDefinition.SecurityRequirement.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.SecurityRequirement.GetAdditionalProperties: TDynamicProperty<TArray<System.String>>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<TArray<System.String>>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.SecurityRequirement.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.Tag }

destructor TOpenAPIDefinition.Tag.Destroy;
begin
  FExternalDocs.Free;

  FPatternProperty.Free;

  inherited;
end;

function TOpenAPIDefinition.Tag.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.Tag.GetExternalDocs: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.ExternalDocumentation;
begin
  if not Assigned(FExternalDocs) then
    FExternalDocs := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.ExternalDocumentation.Create;

  Result := FExternalDocs;
end;

function TOpenAPIDefinition.Tag.GetExternalDocsStored: Boolean;
begin
  Result := Assigned(FExternalDocs);
end;

function TOpenAPIDefinition.Tag.GetPatternProperty: TDynamicProperty<any>;
begin
  if not Assigned(FPatternProperty) then
    FPatternProperty := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FPatternProperty;
end;

function TOpenAPIDefinition.Tag.GetPatternPropertyStored: Boolean;
begin
  Result := Assigned(FPatternProperty);
end;

{ TOpenAPIDefinition.ExternalDocumentation }

destructor TOpenAPIDefinition.ExternalDocumentation.Destroy;
begin
  FPatternProperty.Free;

  inherited;
end;

function TOpenAPIDefinition.ExternalDocumentation.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.ExternalDocumentation.GetPatternProperty: TDynamicProperty<any>;
begin
  if not Assigned(FPatternProperty) then
    FPatternProperty := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FPatternProperty;
end;

function TOpenAPIDefinition.ExternalDocumentation.GetPatternPropertyStored: Boolean;
begin
  Result := Assigned(FPatternProperty);
end;

{ TOpenAPIDefinition.Parameter }

destructor TOpenAPIDefinition.Parameter.Destroy;
begin
  FSchema.Free;

  FContent.Free;

  FExamples.Free;

  FSchemaXORContent.Free;

  FPathParameter.Free;

  FQueryParameter.Free;

  FHeaderParameter.Free;

  FCookieParameter.Free;

  FPatternProperty.Free;

  inherited;
end;

function TOpenAPIDefinition.Parameter.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.Parameter.GetRequiredStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.Parameter.GetDeprecatedStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.Parameter.GetAllowEmptyValueStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.Parameter.GetStyleStored: Boolean;
begin
  Result := not FStyle.IsEmpty;
end;

function TOpenAPIDefinition.Parameter.GetExplodeStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.Parameter.GetAllowReservedStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.Parameter.GetSchema: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Parameter.TSchema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Parameter.TSchema.Create;

  Result := FSchema;
end;

function TOpenAPIDefinition.Parameter.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function TOpenAPIDefinition.Parameter.GetContent: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Parameter.TContent;
begin
  if not Assigned(FContent) then
    FContent := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Parameter.TContent.Create;

  Result := FContent;
end;

function TOpenAPIDefinition.Parameter.GetContentStored: Boolean;
begin
  Result := Assigned(FContent);
end;

function TOpenAPIDefinition.Parameter.GetExampleStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.Parameter.GetExamples: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Parameter.TExamples;
begin
  if not Assigned(FExamples) then
    FExamples := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Parameter.TExamples.Create;

  Result := FExamples;
end;

function TOpenAPIDefinition.Parameter.GetExamplesStored: Boolean;
begin
  Result := Assigned(FExamples);
end;

function TOpenAPIDefinition.Parameter.GetExampleXORExamplesStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.Parameter.GetSchemaXORContent: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.SchemaXORContent;
begin
  if not Assigned(FSchemaXORContent) then
    FSchemaXORContent := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.SchemaXORContent.Create;

  Result := FSchemaXORContent;
end;

function TOpenAPIDefinition.Parameter.GetSchemaXORContentStored: Boolean;
begin
  Result := Assigned(FSchemaXORContent);
end;

function TOpenAPIDefinition.Parameter.GetPathParameter: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.PathParameter;
begin
  if not Assigned(FPathParameter) then
    FPathParameter := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.PathParameter.Create;

  Result := FPathParameter;
end;

function TOpenAPIDefinition.Parameter.GetPathParameterStored: Boolean;
begin
  Result := Assigned(FPathParameter);
end;

function TOpenAPIDefinition.Parameter.GetQueryParameter: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.QueryParameter;
begin
  if not Assigned(FQueryParameter) then
    FQueryParameter := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.QueryParameter.Create;

  Result := FQueryParameter;
end;

function TOpenAPIDefinition.Parameter.GetQueryParameterStored: Boolean;
begin
  Result := Assigned(FQueryParameter);
end;

function TOpenAPIDefinition.Parameter.GetHeaderParameter: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.HeaderParameter;
begin
  if not Assigned(FHeaderParameter) then
    FHeaderParameter := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.HeaderParameter.Create;

  Result := FHeaderParameter;
end;

function TOpenAPIDefinition.Parameter.GetHeaderParameterStored: Boolean;
begin
  Result := Assigned(FHeaderParameter);
end;

function TOpenAPIDefinition.Parameter.GetCookieParameter: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.CookieParameter;
begin
  if not Assigned(FCookieParameter) then
    FCookieParameter := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.CookieParameter.Create;

  Result := FCookieParameter;
end;

function TOpenAPIDefinition.Parameter.GetCookieParameterStored: Boolean;
begin
  Result := Assigned(FCookieParameter);
end;

function TOpenAPIDefinition.Parameter.GetPatternProperty: TDynamicProperty<any>;
begin
  if not Assigned(FPatternProperty) then
    FPatternProperty := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FPatternProperty;
end;

function TOpenAPIDefinition.Parameter.GetPatternPropertyStored: Boolean;
begin
  Result := Assigned(FPatternProperty);
end;

{ TOpenAPIDefinition.Parameter.TSchema }

destructor TOpenAPIDefinition.Parameter.TSchema.Destroy;
begin
  FSchema.Free;

  FReference.Free;

  inherited;
end;

function TOpenAPIDefinition.Parameter.TSchema.GetSchema: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema.Create;

  Result := FSchema;
end;

function TOpenAPIDefinition.Parameter.TSchema.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function TOpenAPIDefinition.Parameter.TSchema.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Parameter.TSchema.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

{ TOpenAPIDefinition.Parameter.TContent }

destructor TOpenAPIDefinition.Parameter.TContent.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.Parameter.TContent.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.MediaType>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.MediaType>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.Parameter.TContent.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.Parameter.TExamples }

destructor TOpenAPIDefinition.Parameter.TExamples.Destroy;
begin
  FExample.Free;

  FReference.Free;

  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.Parameter.TExamples.GetExample: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Example;
begin
  if not Assigned(FExample) then
    FExample := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Example.Create;

  Result := FExample;
end;

function TOpenAPIDefinition.Parameter.TExamples.GetExampleStored: Boolean;
begin
  Result := Assigned(FExample);
end;

function TOpenAPIDefinition.Parameter.TExamples.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Parameter.TExamples.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

function TOpenAPIDefinition.Parameter.TExamples.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Parameter.TExamples.TadditionalProperties>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Parameter.TExamples.TadditionalProperties>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.Parameter.TExamples.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.Parameter.TExamples.TadditionalProperties }

destructor TOpenAPIDefinition.Parameter.TExamples.TadditionalProperties.Destroy;
begin
  FExample.Free;

  FReference.Free;

  inherited;
end;

function TOpenAPIDefinition.Parameter.TExamples.TadditionalProperties.GetExample: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Example;
begin
  if not Assigned(FExample) then
    FExample := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Example.Create;

  Result := FExample;
end;

function TOpenAPIDefinition.Parameter.TExamples.TadditionalProperties.GetExampleStored: Boolean;
begin
  Result := Assigned(FExample);
end;

function TOpenAPIDefinition.Parameter.TExamples.TadditionalProperties.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Parameter.TExamples.TadditionalProperties.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

{ TOpenAPIDefinition.PathParameter }

procedure TOpenAPIDefinition.PathParameter.SetIn(const Value: TOpenAPIDefinition.PathParameter.TIn);
begin
  FIn := Value;
  FInIsStored := True;
end;

procedure TOpenAPIDefinition.PathParameter.SetStyle(const Value: TOpenAPIDefinition.PathParameter.TStyle);
begin
  FStyle := Value;
  FStyleIsStored := True;
end;

{ TOpenAPIDefinition.QueryParameter }

procedure TOpenAPIDefinition.QueryParameter.SetIn(const Value: TOpenAPIDefinition.QueryParameter.TIn);
begin
  FIn := Value;
  FInIsStored := True;
end;

procedure TOpenAPIDefinition.QueryParameter.SetStyle(const Value: TOpenAPIDefinition.QueryParameter.TStyle);
begin
  FStyle := Value;
  FStyleIsStored := True;
end;

{ TOpenAPIDefinition.HeaderParameter }

procedure TOpenAPIDefinition.HeaderParameter.SetIn(const Value: TOpenAPIDefinition.HeaderParameter.TIn);
begin
  FIn := Value;
  FInIsStored := True;
end;

procedure TOpenAPIDefinition.HeaderParameter.SetStyle(const Value: TOpenAPIDefinition.HeaderParameter.TStyle);
begin
  FStyle := Value;
  FStyleIsStored := True;
end;

{ TOpenAPIDefinition.CookieParameter }

procedure TOpenAPIDefinition.CookieParameter.SetIn(const Value: TOpenAPIDefinition.CookieParameter.TIn);
begin
  FIn := Value;
  FInIsStored := True;
end;

procedure TOpenAPIDefinition.CookieParameter.SetStyle(const Value: TOpenAPIDefinition.CookieParameter.TStyle);
begin
  FStyle := Value;
  FStyleIsStored := True;
end;

{ TOpenAPIDefinition.RequestBody }

destructor TOpenAPIDefinition.RequestBody.Destroy;
begin
  FContent.Free;

  FPatternProperty.Free;

  inherited;
end;

function TOpenAPIDefinition.RequestBody.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.RequestBody.GetContent: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.RequestBody.TContent;
begin
  if not Assigned(FContent) then
    FContent := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.RequestBody.TContent.Create;

  Result := FContent;
end;

function TOpenAPIDefinition.RequestBody.GetRequiredStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.RequestBody.GetPatternProperty: TDynamicProperty<any>;
begin
  if not Assigned(FPatternProperty) then
    FPatternProperty := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FPatternProperty;
end;

function TOpenAPIDefinition.RequestBody.GetPatternPropertyStored: Boolean;
begin
  Result := Assigned(FPatternProperty);
end;

{ TOpenAPIDefinition.RequestBody.TContent }

destructor TOpenAPIDefinition.RequestBody.TContent.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.RequestBody.TContent.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.MediaType>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.MediaType>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.RequestBody.TContent.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.SecurityScheme }

destructor TOpenAPIDefinition.SecurityScheme.Destroy;
begin
  FAPIKeySecurityScheme.Free;

  FHTTPSecurityScheme.Free;

  FOAuth2SecurityScheme.Free;

  FOpenIdConnectSecurityScheme.Free;

  inherited;
end;

function TOpenAPIDefinition.SecurityScheme.GetAPIKeySecurityScheme: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.APIKeySecurityScheme;
begin
  if not Assigned(FAPIKeySecurityScheme) then
    FAPIKeySecurityScheme := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.APIKeySecurityScheme.Create;

  Result := FAPIKeySecurityScheme;
end;

function TOpenAPIDefinition.SecurityScheme.GetAPIKeySecuritySchemeStored: Boolean;
begin
  Result := Assigned(FAPIKeySecurityScheme);
end;

function TOpenAPIDefinition.SecurityScheme.GetHTTPSecurityScheme: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.HTTPSecurityScheme;
begin
  if not Assigned(FHTTPSecurityScheme) then
    FHTTPSecurityScheme := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.HTTPSecurityScheme.Create;

  Result := FHTTPSecurityScheme;
end;

function TOpenAPIDefinition.SecurityScheme.GetHTTPSecuritySchemeStored: Boolean;
begin
  Result := Assigned(FHTTPSecurityScheme);
end;

function TOpenAPIDefinition.SecurityScheme.GetOAuth2SecurityScheme: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.OAuth2SecurityScheme;
begin
  if not Assigned(FOAuth2SecurityScheme) then
    FOAuth2SecurityScheme := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.OAuth2SecurityScheme.Create;

  Result := FOAuth2SecurityScheme;
end;

function TOpenAPIDefinition.SecurityScheme.GetOAuth2SecuritySchemeStored: Boolean;
begin
  Result := Assigned(FOAuth2SecurityScheme);
end;

function TOpenAPIDefinition.SecurityScheme.GetOpenIdConnectSecurityScheme: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.OpenIdConnectSecurityScheme;
begin
  if not Assigned(FOpenIdConnectSecurityScheme) then
    FOpenIdConnectSecurityScheme := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.OpenIdConnectSecurityScheme.Create;

  Result := FOpenIdConnectSecurityScheme;
end;

function TOpenAPIDefinition.SecurityScheme.GetOpenIdConnectSecuritySchemeStored: Boolean;
begin
  Result := Assigned(FOpenIdConnectSecurityScheme);
end;

{ TOpenAPIDefinition.APIKeySecurityScheme }

destructor TOpenAPIDefinition.APIKeySecurityScheme.Destroy;
begin
  FPatternProperty.Free;

  inherited;
end;

function TOpenAPIDefinition.APIKeySecurityScheme.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.APIKeySecurityScheme.GetPatternProperty: TDynamicProperty<any>;
begin
  if not Assigned(FPatternProperty) then
    FPatternProperty := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FPatternProperty;
end;

function TOpenAPIDefinition.APIKeySecurityScheme.GetPatternPropertyStored: Boolean;
begin
  Result := Assigned(FPatternProperty);
end;

{ TOpenAPIDefinition.HTTPSecurityScheme }

destructor TOpenAPIDefinition.HTTPSecurityScheme.Destroy;
begin
  FPatternProperty.Free;

  inherited;
end;

function TOpenAPIDefinition.HTTPSecurityScheme.GetBearerFormatStored: Boolean;
begin
  Result := not FBearerFormat.IsEmpty;
end;

function TOpenAPIDefinition.HTTPSecurityScheme.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.HTTPSecurityScheme.GetPatternProperty: TDynamicProperty<any>;
begin
  if not Assigned(FPatternProperty) then
    FPatternProperty := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FPatternProperty;
end;

function TOpenAPIDefinition.HTTPSecurityScheme.GetPatternPropertyStored: Boolean;
begin
  Result := Assigned(FPatternProperty);
end;

{ TOpenAPIDefinition.OAuth2SecurityScheme }

destructor TOpenAPIDefinition.OAuth2SecurityScheme.Destroy;
begin
  FFlows.Free;

  FPatternProperty.Free;

  inherited;
end;

function TOpenAPIDefinition.OAuth2SecurityScheme.GetFlows: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.OAuthFlows;
begin
  if not Assigned(FFlows) then
    FFlows := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.OAuthFlows.Create;

  Result := FFlows;
end;

function TOpenAPIDefinition.OAuth2SecurityScheme.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.OAuth2SecurityScheme.GetPatternProperty: TDynamicProperty<any>;
begin
  if not Assigned(FPatternProperty) then
    FPatternProperty := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FPatternProperty;
end;

function TOpenAPIDefinition.OAuth2SecurityScheme.GetPatternPropertyStored: Boolean;
begin
  Result := Assigned(FPatternProperty);
end;

{ TOpenAPIDefinition.OpenIdConnectSecurityScheme }

destructor TOpenAPIDefinition.OpenIdConnectSecurityScheme.Destroy;
begin
  FPatternProperty.Free;

  inherited;
end;

function TOpenAPIDefinition.OpenIdConnectSecurityScheme.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.OpenIdConnectSecurityScheme.GetPatternProperty: TDynamicProperty<any>;
begin
  if not Assigned(FPatternProperty) then
    FPatternProperty := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FPatternProperty;
end;

function TOpenAPIDefinition.OpenIdConnectSecurityScheme.GetPatternPropertyStored: Boolean;
begin
  Result := Assigned(FPatternProperty);
end;

{ TOpenAPIDefinition.OAuthFlows }

destructor TOpenAPIDefinition.OAuthFlows.Destroy;
begin
  FImplicit.Free;

  FPassword.Free;

  FClientCredentials.Free;

  FAuthorizationCode.Free;

  FPatternProperty.Free;

  inherited;
end;

function TOpenAPIDefinition.OAuthFlows.GetImplicit: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.ImplicitOAuthFlow;
begin
  if not Assigned(FImplicit) then
    FImplicit := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.ImplicitOAuthFlow.Create;

  Result := FImplicit;
end;

function TOpenAPIDefinition.OAuthFlows.GetImplicitStored: Boolean;
begin
  Result := Assigned(FImplicit);
end;

function TOpenAPIDefinition.OAuthFlows.GetPassword: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.PasswordOAuthFlow;
begin
  if not Assigned(FPassword) then
    FPassword := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.PasswordOAuthFlow.Create;

  Result := FPassword;
end;

function TOpenAPIDefinition.OAuthFlows.GetPasswordStored: Boolean;
begin
  Result := Assigned(FPassword);
end;

function TOpenAPIDefinition.OAuthFlows.GetClientCredentials: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.ClientCredentialsFlow;
begin
  if not Assigned(FClientCredentials) then
    FClientCredentials := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.ClientCredentialsFlow.Create;

  Result := FClientCredentials;
end;

function TOpenAPIDefinition.OAuthFlows.GetClientCredentialsStored: Boolean;
begin
  Result := Assigned(FClientCredentials);
end;

function TOpenAPIDefinition.OAuthFlows.GetAuthorizationCode: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.AuthorizationCodeOAuthFlow;
begin
  if not Assigned(FAuthorizationCode) then
    FAuthorizationCode := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.AuthorizationCodeOAuthFlow.Create;

  Result := FAuthorizationCode;
end;

function TOpenAPIDefinition.OAuthFlows.GetAuthorizationCodeStored: Boolean;
begin
  Result := Assigned(FAuthorizationCode);
end;

function TOpenAPIDefinition.OAuthFlows.GetPatternProperty: TDynamicProperty<any>;
begin
  if not Assigned(FPatternProperty) then
    FPatternProperty := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FPatternProperty;
end;

function TOpenAPIDefinition.OAuthFlows.GetPatternPropertyStored: Boolean;
begin
  Result := Assigned(FPatternProperty);
end;

{ TOpenAPIDefinition.ImplicitOAuthFlow }

destructor TOpenAPIDefinition.ImplicitOAuthFlow.Destroy;
begin
  FScopes.Free;

  FPatternProperty.Free;

  inherited;
end;

function TOpenAPIDefinition.ImplicitOAuthFlow.GetRefreshUrlStored: Boolean;
begin
  Result := not FRefreshUrl.IsEmpty;
end;

function TOpenAPIDefinition.ImplicitOAuthFlow.GetScopes: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.ImplicitOAuthFlow.TScopes;
begin
  if not Assigned(FScopes) then
    FScopes := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.ImplicitOAuthFlow.TScopes.Create;

  Result := FScopes;
end;

function TOpenAPIDefinition.ImplicitOAuthFlow.GetPatternProperty: TDynamicProperty<any>;
begin
  if not Assigned(FPatternProperty) then
    FPatternProperty := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FPatternProperty;
end;

function TOpenAPIDefinition.ImplicitOAuthFlow.GetPatternPropertyStored: Boolean;
begin
  Result := Assigned(FPatternProperty);
end;

{ TOpenAPIDefinition.ImplicitOAuthFlow.TScopes }

destructor TOpenAPIDefinition.ImplicitOAuthFlow.TScopes.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.ImplicitOAuthFlow.TScopes.GetAdditionalProperties: TDynamicProperty<System.String>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<System.String>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.ImplicitOAuthFlow.TScopes.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.PasswordOAuthFlow }

destructor TOpenAPIDefinition.PasswordOAuthFlow.Destroy;
begin
  FScopes.Free;

  FPatternProperty.Free;

  inherited;
end;

function TOpenAPIDefinition.PasswordOAuthFlow.GetRefreshUrlStored: Boolean;
begin
  Result := not FRefreshUrl.IsEmpty;
end;

function TOpenAPIDefinition.PasswordOAuthFlow.GetScopes: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.PasswordOAuthFlow.TScopes;
begin
  if not Assigned(FScopes) then
    FScopes := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.PasswordOAuthFlow.TScopes.Create;

  Result := FScopes;
end;

function TOpenAPIDefinition.PasswordOAuthFlow.GetPatternProperty: TDynamicProperty<any>;
begin
  if not Assigned(FPatternProperty) then
    FPatternProperty := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FPatternProperty;
end;

function TOpenAPIDefinition.PasswordOAuthFlow.GetPatternPropertyStored: Boolean;
begin
  Result := Assigned(FPatternProperty);
end;

{ TOpenAPIDefinition.PasswordOAuthFlow.TScopes }

destructor TOpenAPIDefinition.PasswordOAuthFlow.TScopes.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.PasswordOAuthFlow.TScopes.GetAdditionalProperties: TDynamicProperty<System.String>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<System.String>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.PasswordOAuthFlow.TScopes.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.ClientCredentialsFlow }

destructor TOpenAPIDefinition.ClientCredentialsFlow.Destroy;
begin
  FScopes.Free;

  FPatternProperty.Free;

  inherited;
end;

function TOpenAPIDefinition.ClientCredentialsFlow.GetRefreshUrlStored: Boolean;
begin
  Result := not FRefreshUrl.IsEmpty;
end;

function TOpenAPIDefinition.ClientCredentialsFlow.GetScopes: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.ClientCredentialsFlow.TScopes;
begin
  if not Assigned(FScopes) then
    FScopes := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.ClientCredentialsFlow.TScopes.Create;

  Result := FScopes;
end;

function TOpenAPIDefinition.ClientCredentialsFlow.GetPatternProperty: TDynamicProperty<any>;
begin
  if not Assigned(FPatternProperty) then
    FPatternProperty := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FPatternProperty;
end;

function TOpenAPIDefinition.ClientCredentialsFlow.GetPatternPropertyStored: Boolean;
begin
  Result := Assigned(FPatternProperty);
end;

{ TOpenAPIDefinition.ClientCredentialsFlow.TScopes }

destructor TOpenAPIDefinition.ClientCredentialsFlow.TScopes.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.ClientCredentialsFlow.TScopes.GetAdditionalProperties: TDynamicProperty<System.String>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<System.String>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.ClientCredentialsFlow.TScopes.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.AuthorizationCodeOAuthFlow }

destructor TOpenAPIDefinition.AuthorizationCodeOAuthFlow.Destroy;
begin
  FScopes.Free;

  FPatternProperty.Free;

  inherited;
end;

function TOpenAPIDefinition.AuthorizationCodeOAuthFlow.GetRefreshUrlStored: Boolean;
begin
  Result := not FRefreshUrl.IsEmpty;
end;

function TOpenAPIDefinition.AuthorizationCodeOAuthFlow.GetScopes: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.AuthorizationCodeOAuthFlow.TScopes;
begin
  if not Assigned(FScopes) then
    FScopes := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.AuthorizationCodeOAuthFlow.TScopes.Create;

  Result := FScopes;
end;

function TOpenAPIDefinition.AuthorizationCodeOAuthFlow.GetPatternProperty: TDynamicProperty<any>;
begin
  if not Assigned(FPatternProperty) then
    FPatternProperty := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FPatternProperty;
end;

function TOpenAPIDefinition.AuthorizationCodeOAuthFlow.GetPatternPropertyStored: Boolean;
begin
  Result := Assigned(FPatternProperty);
end;

{ TOpenAPIDefinition.AuthorizationCodeOAuthFlow.TScopes }

destructor TOpenAPIDefinition.AuthorizationCodeOAuthFlow.TScopes.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.AuthorizationCodeOAuthFlow.TScopes.GetAdditionalProperties: TDynamicProperty<System.String>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<System.String>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.AuthorizationCodeOAuthFlow.TScopes.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.Link }

destructor TOpenAPIDefinition.Link.Destroy;
begin
  FParameters.Free;

  FServer.Free;

  FPatternProperty.Free;

  inherited;
end;

function TOpenAPIDefinition.Link.GetOperationIdStored: Boolean;
begin
  Result := not FOperationId.IsEmpty;
end;

function TOpenAPIDefinition.Link.GetOperationRefStored: Boolean;
begin
  Result := not FOperationRef.IsEmpty;
end;

function TOpenAPIDefinition.Link.GetParameters: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Link.TParameters;
begin
  if not Assigned(FParameters) then
    FParameters := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Link.TParameters.Create;

  Result := FParameters;
end;

function TOpenAPIDefinition.Link.GetParametersStored: Boolean;
begin
  Result := Assigned(FParameters);
end;

function TOpenAPIDefinition.Link.GetRequestBodyStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.Link.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.Link.GetServer: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Server;
begin
  if not Assigned(FServer) then
    FServer := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Server.Create;

  Result := FServer;
end;

function TOpenAPIDefinition.Link.GetServerStored: Boolean;
begin
  Result := Assigned(FServer);
end;

function TOpenAPIDefinition.Link.GetPatternProperty: TDynamicProperty<any>;
begin
  if not Assigned(FPatternProperty) then
    FPatternProperty := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FPatternProperty;
end;

function TOpenAPIDefinition.Link.GetPatternPropertyStored: Boolean;
begin
  Result := Assigned(FPatternProperty);
end;

{ TOpenAPIDefinition.Link.TParameters }

destructor TOpenAPIDefinition.Link.TParameters.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.Link.TParameters.GetAdditionalProperties: TDynamicProperty<any>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.Link.TParameters.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.Callback }

destructor TOpenAPIDefinition.Callback.Destroy;
begin
  FPatternProperty.Free;

  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.Callback.GetPatternProperty: TDynamicProperty<any>;
begin
  if not Assigned(FPatternProperty) then
    FPatternProperty := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FPatternProperty;
end;

function TOpenAPIDefinition.Callback.GetPatternPropertyStored: Boolean;
begin
  Result := Assigned(FPatternProperty);
end;

function TOpenAPIDefinition.Callback.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.PathItem>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.PathItem>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.Callback.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.Encoding }

destructor TOpenAPIDefinition.Encoding.Destroy;
begin
  FHeaders.Free;

  FPatternProperty.Free;

  inherited;
end;

function TOpenAPIDefinition.Encoding.GetContentTypeStored: Boolean;
begin
  Result := not FContentType.IsEmpty;
end;

function TOpenAPIDefinition.Encoding.GetHeaders: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Encoding.THeaders;
begin
  if not Assigned(FHeaders) then
    FHeaders := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Encoding.THeaders.Create;

  Result := FHeaders;
end;

function TOpenAPIDefinition.Encoding.GetHeadersStored: Boolean;
begin
  Result := Assigned(FHeaders);
end;

procedure TOpenAPIDefinition.Encoding.SetStyle(const Value: TOpenAPIDefinition.Encoding.TStyle);
begin
  FStyle := Value;
  FStyleIsStored := True;
end;

function TOpenAPIDefinition.Encoding.GetExplodeStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.Encoding.GetAllowReservedStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.Encoding.GetPatternProperty: TDynamicProperty<any>;
begin
  if not Assigned(FPatternProperty) then
    FPatternProperty := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FPatternProperty;
end;

function TOpenAPIDefinition.Encoding.GetPatternPropertyStored: Boolean;
begin
  Result := Assigned(FPatternProperty);
end;

{ TOpenAPIDefinition.Encoding.THeaders }

destructor TOpenAPIDefinition.Encoding.THeaders.Destroy;
begin
  FHeader.Free;

  FReference.Free;

  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.Encoding.THeaders.GetHeader: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Header;
begin
  if not Assigned(FHeader) then
    FHeader := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Header.Create;

  Result := FHeader;
end;

function TOpenAPIDefinition.Encoding.THeaders.GetHeaderStored: Boolean;
begin
  Result := Assigned(FHeader);
end;

function TOpenAPIDefinition.Encoding.THeaders.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Encoding.THeaders.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

function TOpenAPIDefinition.Encoding.THeaders.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Encoding.THeaders.TadditionalProperties>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Encoding.THeaders.TadditionalProperties>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.Encoding.THeaders.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.Encoding.THeaders.TadditionalProperties }

destructor TOpenAPIDefinition.Encoding.THeaders.TadditionalProperties.Destroy;
begin
  FHeader.Free;

  FReference.Free;

  inherited;
end;

function TOpenAPIDefinition.Encoding.THeaders.TadditionalProperties.GetHeader: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Header;
begin
  if not Assigned(FHeader) then
    FHeader := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Header.Create;

  Result := FHeader;
end;

function TOpenAPIDefinition.Encoding.THeaders.TadditionalProperties.GetHeaderStored: Boolean;
begin
  Result := Assigned(FHeader);
end;

function TOpenAPIDefinition.Encoding.THeaders.TadditionalProperties.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Encoding.THeaders.TadditionalProperties.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

{ TOpenAPIDefinition.TOpenAPIDefinition }

destructor TOpenAPIDefinition.TOpenAPIDefinition.Destroy;
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

  FPatternProperty.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetInfo: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Info;
begin
  if not Assigned(FInfo) then
    FInfo := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Info.Create;

  Result := FInfo;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetExternalDocs: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.ExternalDocumentation;
begin
  if not Assigned(FExternalDocs) then
    FExternalDocs := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.ExternalDocumentation.Create;

  Result := FExternalDocs;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetExternalDocsStored: Boolean;
begin
  Result := Assigned(FExternalDocs);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.AddServers: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Server;
begin
  Result := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Server.Create;

  FServers := FServers + [Result];
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetServersStored: Boolean;
begin
  Result := Assigned(FServers);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.AddSecurity: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.SecurityRequirement;
begin
  Result := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.SecurityRequirement.Create;

  FSecurity := FSecurity + [Result];
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetSecurityStored: Boolean;
begin
  Result := Assigned(FSecurity);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.AddTags: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Tag;
begin
  Result := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Tag.Create;

  FTags := FTags + [Result];
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetTagsStored: Boolean;
begin
  Result := Assigned(FTags);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetPaths: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Paths;
begin
  if not Assigned(FPaths) then
    FPaths := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Paths.Create;

  Result := FPaths;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetComponents: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Components;
begin
  if not Assigned(FComponents) then
    FComponents := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Components.Create;

  Result := FComponents;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetComponentsStored: Boolean;
begin
  Result := Assigned(FComponents);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetPatternProperty: TDynamicProperty<any>;
begin
  if not Assigned(FPatternProperty) then
    FPatternProperty := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FPatternProperty;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetPatternPropertyStored: Boolean;
begin
  Result := Assigned(FPatternProperty);
end;

end.
