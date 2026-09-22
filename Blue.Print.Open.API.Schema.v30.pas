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
      VariablesProperty = class;

      VariablesProperty = class
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
      FVariables: TOpenAPIDefinition.Server.VariablesProperty;
      FPatternProperty: TDynamicProperty<any>;

      function GetVariables: TOpenAPIDefinition.Server.VariablesProperty;
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
      property variables: TOpenAPIDefinition.Server.VariablesProperty read GetVariables write FVariables stored GetVariablesStored;
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
      SchemasProperty = class;
      ResponsesProperty = class;
      ParametersProperty = class;
      ExamplesProperty = class;
      RequestBodiesProperty = class;
      HeadersProperty = class;
      SecuritySchemesProperty = class;
      LinksProperty = class;
      CallbacksProperty = class;

      SchemasProperty = class
      public type
        // Forward class declaration
        PatternProperty = class;

        [Flat]
        PatternProperty = class
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
        FPatternPropertyElement: TDynamicProperty<TOpenAPIDefinition.Components.SchemasProperty.PatternProperty>;

        function GetPatternPropertyElement: TDynamicProperty<TOpenAPIDefinition.Components.SchemasProperty.PatternProperty>;
        function GetPatternPropertyStored: Boolean;
      public
        destructor Destroy; override;

        property IsPatternPropertyStored: Boolean read GetPatternPropertyStored;
      published
        [PatternProperty('^[a-zA-Z0-9\.\-_]+$')]
        [FieldName('PatternProperty')]
        property PatternPropertyElement: TDynamicProperty<TOpenAPIDefinition.Components.SchemasProperty.PatternProperty> read GetPatternPropertyElement write FPatternPropertyElement stored GetPatternPropertyStored;
      end;

      ResponsesProperty = class
      public type
        // Forward class declaration
        PatternProperty = class;

        [Flat]
        PatternProperty = class
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
        FPatternPropertyElement: TDynamicProperty<TOpenAPIDefinition.Components.ResponsesProperty.PatternProperty>;

        function GetPatternPropertyElement: TDynamicProperty<TOpenAPIDefinition.Components.ResponsesProperty.PatternProperty>;
        function GetPatternPropertyStored: Boolean;
      public
        destructor Destroy; override;

        property IsPatternPropertyStored: Boolean read GetPatternPropertyStored;
      published
        [PatternProperty('^[a-zA-Z0-9\.\-_]+$')]
        [FieldName('PatternProperty')]
        property PatternPropertyElement: TDynamicProperty<TOpenAPIDefinition.Components.ResponsesProperty.PatternProperty> read GetPatternPropertyElement write FPatternPropertyElement stored GetPatternPropertyStored;
      end;

      ParametersProperty = class
      public type
        // Forward class declaration
        PatternProperty = class;

        [Flat]
        PatternProperty = class
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
        FPatternPropertyElement: TDynamicProperty<TOpenAPIDefinition.Components.ParametersProperty.PatternProperty>;

        function GetPatternPropertyElement: TDynamicProperty<TOpenAPIDefinition.Components.ParametersProperty.PatternProperty>;
        function GetPatternPropertyStored: Boolean;
      public
        destructor Destroy; override;

        property IsPatternPropertyStored: Boolean read GetPatternPropertyStored;
      published
        [PatternProperty('^[a-zA-Z0-9\.\-_]+$')]
        [FieldName('PatternProperty')]
        property PatternPropertyElement: TDynamicProperty<TOpenAPIDefinition.Components.ParametersProperty.PatternProperty> read GetPatternPropertyElement write FPatternPropertyElement stored GetPatternPropertyStored;
      end;

      ExamplesProperty = class
      public type
        // Forward class declaration
        PatternProperty = class;

        [Flat]
        PatternProperty = class
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
        FPatternPropertyElement: TDynamicProperty<TOpenAPIDefinition.Components.ExamplesProperty.PatternProperty>;

        function GetPatternPropertyElement: TDynamicProperty<TOpenAPIDefinition.Components.ExamplesProperty.PatternProperty>;
        function GetPatternPropertyStored: Boolean;
      public
        destructor Destroy; override;

        property IsPatternPropertyStored: Boolean read GetPatternPropertyStored;
      published
        [PatternProperty('^[a-zA-Z0-9\.\-_]+$')]
        [FieldName('PatternProperty')]
        property PatternPropertyElement: TDynamicProperty<TOpenAPIDefinition.Components.ExamplesProperty.PatternProperty> read GetPatternPropertyElement write FPatternPropertyElement stored GetPatternPropertyStored;
      end;

      RequestBodiesProperty = class
      public type
        // Forward class declaration
        PatternProperty = class;

        [Flat]
        PatternProperty = class
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
        FPatternPropertyElement: TDynamicProperty<TOpenAPIDefinition.Components.RequestBodiesProperty.PatternProperty>;

        function GetPatternPropertyElement: TDynamicProperty<TOpenAPIDefinition.Components.RequestBodiesProperty.PatternProperty>;
        function GetPatternPropertyStored: Boolean;
      public
        destructor Destroy; override;

        property IsPatternPropertyStored: Boolean read GetPatternPropertyStored;
      published
        [PatternProperty('^[a-zA-Z0-9\.\-_]+$')]
        [FieldName('PatternProperty')]
        property PatternPropertyElement: TDynamicProperty<TOpenAPIDefinition.Components.RequestBodiesProperty.PatternProperty> read GetPatternPropertyElement write FPatternPropertyElement stored GetPatternPropertyStored;
      end;

      HeadersProperty = class
      public type
        // Forward class declaration
        PatternProperty = class;

        [Flat]
        PatternProperty = class
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
        FPatternPropertyElement: TDynamicProperty<TOpenAPIDefinition.Components.HeadersProperty.PatternProperty>;

        function GetPatternPropertyElement: TDynamicProperty<TOpenAPIDefinition.Components.HeadersProperty.PatternProperty>;
        function GetPatternPropertyStored: Boolean;
      public
        destructor Destroy; override;

        property IsPatternPropertyStored: Boolean read GetPatternPropertyStored;
      published
        [PatternProperty('^[a-zA-Z0-9\.\-_]+$')]
        [FieldName('PatternProperty')]
        property PatternPropertyElement: TDynamicProperty<TOpenAPIDefinition.Components.HeadersProperty.PatternProperty> read GetPatternPropertyElement write FPatternPropertyElement stored GetPatternPropertyStored;
      end;

      SecuritySchemesProperty = class
      public type
        // Forward class declaration
        PatternProperty = class;

        [Flat]
        PatternProperty = class
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
        FPatternPropertyElement: TDynamicProperty<TOpenAPIDefinition.Components.SecuritySchemesProperty.PatternProperty>;

        function GetPatternPropertyElement: TDynamicProperty<TOpenAPIDefinition.Components.SecuritySchemesProperty.PatternProperty>;
        function GetPatternPropertyStored: Boolean;
      public
        destructor Destroy; override;

        property IsPatternPropertyStored: Boolean read GetPatternPropertyStored;
      published
        [PatternProperty('^[a-zA-Z0-9\.\-_]+$')]
        [FieldName('PatternProperty')]
        property PatternPropertyElement: TDynamicProperty<TOpenAPIDefinition.Components.SecuritySchemesProperty.PatternProperty> read GetPatternPropertyElement write FPatternPropertyElement stored GetPatternPropertyStored;
      end;

      LinksProperty = class
      public type
        // Forward class declaration
        PatternProperty = class;

        [Flat]
        PatternProperty = class
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
        FPatternPropertyElement: TDynamicProperty<TOpenAPIDefinition.Components.LinksProperty.PatternProperty>;

        function GetPatternPropertyElement: TDynamicProperty<TOpenAPIDefinition.Components.LinksProperty.PatternProperty>;
        function GetPatternPropertyStored: Boolean;
      public
        destructor Destroy; override;

        property IsPatternPropertyStored: Boolean read GetPatternPropertyStored;
      published
        [PatternProperty('^[a-zA-Z0-9\.\-_]+$')]
        [FieldName('PatternProperty')]
        property PatternPropertyElement: TDynamicProperty<TOpenAPIDefinition.Components.LinksProperty.PatternProperty> read GetPatternPropertyElement write FPatternPropertyElement stored GetPatternPropertyStored;
      end;

      CallbacksProperty = class
      public type
        // Forward class declaration
        PatternProperty = class;

        [Flat]
        PatternProperty = class
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
        FPatternPropertyElement: TDynamicProperty<TOpenAPIDefinition.Components.CallbacksProperty.PatternProperty>;

        function GetPatternPropertyElement: TDynamicProperty<TOpenAPIDefinition.Components.CallbacksProperty.PatternProperty>;
        function GetPatternPropertyStored: Boolean;
      public
        destructor Destroy; override;

        property IsPatternPropertyStored: Boolean read GetPatternPropertyStored;
      published
        [PatternProperty('^[a-zA-Z0-9\.\-_]+$')]
        [FieldName('PatternProperty')]
        property PatternPropertyElement: TDynamicProperty<TOpenAPIDefinition.Components.CallbacksProperty.PatternProperty> read GetPatternPropertyElement write FPatternPropertyElement stored GetPatternPropertyStored;
      end;
    private
      FSchemas: TOpenAPIDefinition.Components.SchemasProperty;
      FResponses: TOpenAPIDefinition.Components.ResponsesProperty;
      FParameters: TOpenAPIDefinition.Components.ParametersProperty;
      FExamples: TOpenAPIDefinition.Components.ExamplesProperty;
      FRequestBodies: TOpenAPIDefinition.Components.RequestBodiesProperty;
      FHeaders: TOpenAPIDefinition.Components.HeadersProperty;
      FSecuritySchemes: TOpenAPIDefinition.Components.SecuritySchemesProperty;
      FLinks: TOpenAPIDefinition.Components.LinksProperty;
      FCallbacks: TOpenAPIDefinition.Components.CallbacksProperty;
      FPatternProperty: TDynamicProperty<any>;

      function GetSchemas: TOpenAPIDefinition.Components.SchemasProperty;
      function GetResponses: TOpenAPIDefinition.Components.ResponsesProperty;
      function GetParameters: TOpenAPIDefinition.Components.ParametersProperty;
      function GetExamples: TOpenAPIDefinition.Components.ExamplesProperty;
      function GetRequestBodies: TOpenAPIDefinition.Components.RequestBodiesProperty;
      function GetHeaders: TOpenAPIDefinition.Components.HeadersProperty;
      function GetSecuritySchemes: TOpenAPIDefinition.Components.SecuritySchemesProperty;
      function GetLinks: TOpenAPIDefinition.Components.LinksProperty;
      function GetCallbacks: TOpenAPIDefinition.Components.CallbacksProperty;
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
      property schemas: TOpenAPIDefinition.Components.SchemasProperty read GetSchemas write FSchemas stored GetSchemasStored;
      property responses: TOpenAPIDefinition.Components.ResponsesProperty read GetResponses write FResponses stored GetResponsesStored;
      property parameters: TOpenAPIDefinition.Components.ParametersProperty read GetParameters write FParameters stored GetParametersStored;
      property examples: TOpenAPIDefinition.Components.ExamplesProperty read GetExamples write FExamples stored GetExamplesStored;
      property requestBodies: TOpenAPIDefinition.Components.RequestBodiesProperty read GetRequestBodies write FRequestBodies stored GetRequestBodiesStored;
      property headers: TOpenAPIDefinition.Components.HeadersProperty read GetHeaders write FHeaders stored GetHeadersStored;
      property securitySchemes: TOpenAPIDefinition.Components.SecuritySchemesProperty read GetSecuritySchemes write FSecuritySchemes stored GetSecuritySchemesStored;
      property links: TOpenAPIDefinition.Components.LinksProperty read GetLinks write FLinks stored GetLinksStored;
      property callbacks: TOpenAPIDefinition.Components.CallbacksProperty read GetCallbacks write FCallbacks stored GetCallbacksStored;
      [PatternProperty('^x-')]
      property PatternProperty: TDynamicProperty<any> read GetPatternProperty write FPatternProperty stored GetPatternPropertyStored;
    end;

    Schema = class
    public type
      [EnumValue('array, boolean, integer, number, object, string')]
      TypeProperty = (&array, boolean, integer, number, &object, &string);

      // Forward class declaration
      NotProperty = class;
      AllOfPropertyArrayItem = class;
      OneOfPropertyArrayItem = class;
      AnyOfPropertyArrayItem = class;
      ItemsProperty = class;
      PropertiesProperty = class;
      AdditionalPropertiesProperty = class;

      [Flat]
      NotProperty = class
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
      AllOfPropertyArrayItem = class
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
      OneOfPropertyArrayItem = class
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
      AnyOfPropertyArrayItem = class
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
      ItemsProperty = class
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

      PropertiesProperty = class
      public type
        // Forward class declaration
        additionalPropertiesType = class;

        [Flat]
        additionalPropertiesType = class
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
        FAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Schema.PropertiesProperty.additionalPropertiesType>;

        function GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Schema.PropertiesProperty.additionalPropertiesType>;
        function GetAdditionalPropertiesStored: Boolean;
      public
        destructor Destroy; override;

        property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
      published
        property additionalProperties: TDynamicProperty<TOpenAPIDefinition.Schema.PropertiesProperty.additionalPropertiesType> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
      end;

      [Flat]
      AdditionalPropertiesProperty = class
      private
        FSchema: TOpenAPIDefinition.Schema;
        FReference: TOpenAPIDefinition.Reference;
        FBoolean: System.Boolean;
        FBooleanIsStored: Boolean;

        function GetSchema: TOpenAPIDefinition.Schema;
        function GetReference: TOpenAPIDefinition.Reference;
        function GetSchemaStored: Boolean;
        function GetReferenceStored: Boolean;
        procedure SetBoolean(const Value: System.Boolean);
      public
        destructor Destroy; override;

        property IsSchemaStored: Boolean read GetSchemaStored;
        property IsReferenceStored: Boolean read GetReferenceStored;
        property IsBooleanStored: Boolean read FBooleanIsStored;
      published
        property Schema: TOpenAPIDefinition.Schema read GetSchema write FSchema stored GetSchemaStored;
        property Reference: TOpenAPIDefinition.Reference read GetReference write FReference stored GetReferenceStored;
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
      FType: TOpenAPIDefinition.Schema.TypeProperty;
      FNot: TOpenAPIDefinition.Schema.NotProperty;
      FAllOf: TArray<TOpenAPIDefinition.Schema.AllOfPropertyArrayItem>;
      FOneOf: TArray<TOpenAPIDefinition.Schema.OneOfPropertyArrayItem>;
      FAnyOf: TArray<TOpenAPIDefinition.Schema.AnyOfPropertyArrayItem>;
      FItems: TOpenAPIDefinition.Schema.ItemsProperty;
      FProperties: TOpenAPIDefinition.Schema.PropertiesProperty;
      FAdditionalProperties: TOpenAPIDefinition.Schema.AdditionalPropertiesProperty;
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
      FExclusiveMaximumIsStored: Boolean;
      FExclusiveMinimumIsStored: Boolean;
      FUniqueItemsIsStored: Boolean;
      FTypeIsStored: Boolean;
      FNullableIsStored: Boolean;
      FReadOnlyIsStored: Boolean;
      FWriteOnlyIsStored: Boolean;
      FDeprecatedIsStored: Boolean;

      function GetNot: TOpenAPIDefinition.Schema.NotProperty;
      function GetItems: TOpenAPIDefinition.Schema.ItemsProperty;
      function GetProperties: TOpenAPIDefinition.Schema.PropertiesProperty;
      function GetAdditionalProperties: TOpenAPIDefinition.Schema.AdditionalPropertiesProperty;
      function GetDiscriminator: TOpenAPIDefinition.Discriminator;
      function GetExternalDocs: TOpenAPIDefinition.ExternalDocumentation;
      function GetXml: TOpenAPIDefinition.XML;
      function GetPatternProperty: TDynamicProperty<any>;
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
      function GetDefaultStored: Boolean;
      function GetDiscriminatorStored: Boolean;
      function GetExampleStored: Boolean;
      function GetExternalDocsStored: Boolean;
      function GetXmlStored: Boolean;
      function GetPatternPropertyStored: Boolean;
      procedure SetExclusiveMaximum(const Value: System.Boolean);
      procedure SetExclusiveMinimum(const Value: System.Boolean);
      procedure SetUniqueItems(const Value: System.Boolean);
      procedure SetType(const Value: TOpenAPIDefinition.Schema.TypeProperty);
      procedure SetNullable(const Value: System.Boolean);
      procedure SetReadOnly(const Value: System.Boolean);
      procedure SetWriteOnly(const Value: System.Boolean);
      procedure SetDeprecated(const Value: System.Boolean);
    public
      destructor Destroy; override;

      function AddAllOf: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema.AllOfPropertyArrayItem;
      function AddOneOf: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema.OneOfPropertyArrayItem;
      function AddAnyOf: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema.AnyOfPropertyArrayItem;

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
      property IsDefaultStored: Boolean read GetDefaultStored;
      property IsNullableStored: Boolean read FNullableIsStored;
      property IsDiscriminatorStored: Boolean read GetDiscriminatorStored;
      property IsReadOnlyStored: Boolean read FReadOnlyIsStored;
      property IsWriteOnlyStored: Boolean read FWriteOnlyIsStored;
      property IsExampleStored: Boolean read GetExampleStored;
      property IsExternalDocsStored: Boolean read GetExternalDocsStored;
      property IsDeprecatedStored: Boolean read FDeprecatedIsStored;
      property IsXmlStored: Boolean read GetXmlStored;
      property IsPatternPropertyStored: Boolean read GetPatternPropertyStored;
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
      property &type: TOpenAPIDefinition.Schema.TypeProperty read FType write SetType stored FTypeIsStored;
      [FieldName('not')]
      property &not: TOpenAPIDefinition.Schema.NotProperty read GetNot write FNot stored GetNotStored;
      property allOf: TArray<TOpenAPIDefinition.Schema.AllOfPropertyArrayItem> read FAllOf write FAllOf stored GetAllOfStored;
      property oneOf: TArray<TOpenAPIDefinition.Schema.OneOfPropertyArrayItem> read FOneOf write FOneOf stored GetOneOfStored;
      property anyOf: TArray<TOpenAPIDefinition.Schema.AnyOfPropertyArrayItem> read FAnyOf write FAnyOf stored GetAnyOfStored;
      property items: TOpenAPIDefinition.Schema.ItemsProperty read GetItems write FItems stored GetItemsStored;
      property properties: TOpenAPIDefinition.Schema.PropertiesProperty read GetProperties write FProperties stored GetPropertiesStored;
      property additionalProperties: TOpenAPIDefinition.Schema.AdditionalPropertiesProperty read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      property format: System.String read FFormat write FFormat stored GetFormatStored;
      property default: any read FDefault write FDefault stored GetDefaultStored;
      property nullable: System.Boolean read FNullable write SetNullable stored FNullableIsStored;
      property discriminator: TOpenAPIDefinition.Discriminator read GetDiscriminator write FDiscriminator stored GetDiscriminatorStored;
      property readOnly: System.Boolean read FReadOnly write SetReadOnly stored FReadOnlyIsStored;
      property writeOnly: System.Boolean read FWriteOnly write SetWriteOnly stored FWriteOnlyIsStored;
      property example: any read FExample write FExample stored GetExampleStored;
      property externalDocs: TOpenAPIDefinition.ExternalDocumentation read GetExternalDocs write FExternalDocs stored GetExternalDocsStored;
      property deprecated: System.Boolean read FDeprecated write SetDeprecated stored FDeprecatedIsStored;
      property xml: TOpenAPIDefinition.XML read GetXml write FXml stored GetXmlStored;
      [PatternProperty('^x-')]
      property PatternProperty: TDynamicProperty<any> read GetPatternProperty write FPatternProperty stored GetPatternPropertyStored;
    end;

    Discriminator = class
    public type
      // Forward class declaration
      MappingProperty = class;

      MappingProperty = class
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
      FMapping: TOpenAPIDefinition.Discriminator.MappingProperty;

      function GetMapping: TOpenAPIDefinition.Discriminator.MappingProperty;
      function GetMappingStored: Boolean;
    public
      destructor Destroy; override;

      property IsMappingStored: Boolean read GetMappingStored;
    published
      property propertyName: System.String read FPropertyName write FPropertyName;
      property mapping: TOpenAPIDefinition.Discriminator.MappingProperty read GetMapping write FMapping stored GetMappingStored;
    end;

    XML = class
    private
      FName: System.String;
      FNamespace: System.String;
      FPrefix: System.String;
      FAttribute: System.Boolean;
      FWrapped: System.Boolean;
      FPatternProperty: TDynamicProperty<any>;
      FAttributeIsStored: Boolean;
      FWrappedIsStored: Boolean;

      function GetPatternProperty: TDynamicProperty<any>;
      function GetNameStored: Boolean;
      function GetNamespaceStored: Boolean;
      function GetPrefixStored: Boolean;
      function GetPatternPropertyStored: Boolean;
      procedure SetAttribute(const Value: System.Boolean);
      procedure SetWrapped(const Value: System.Boolean);
    public
      destructor Destroy; override;

      property IsNameStored: Boolean read GetNameStored;
      property IsNamespaceStored: Boolean read GetNamespaceStored;
      property IsPrefixStored: Boolean read GetPrefixStored;
      property IsAttributeStored: Boolean read FAttributeIsStored;
      property IsWrappedStored: Boolean read FWrappedIsStored;
      property IsPatternPropertyStored: Boolean read GetPatternPropertyStored;
    published
      property name: System.String read FName write FName stored GetNameStored;
      property namespace: System.String read FNamespace write FNamespace stored GetNamespaceStored;
      property prefix: System.String read FPrefix write FPrefix stored GetPrefixStored;
      property attribute: System.Boolean read FAttribute write SetAttribute stored FAttributeIsStored;
      property wrapped: System.Boolean read FWrapped write SetWrapped stored FWrappedIsStored;
      [PatternProperty('^x-')]
      property PatternProperty: TDynamicProperty<any> read GetPatternProperty write FPatternProperty stored GetPatternPropertyStored;
    end;

    Response = class
    public type
      // Forward class declaration
      HeadersProperty = class;
      ContentProperty = class;
      LinksProperty = class;

      HeadersProperty = class
      public type
        // Forward class declaration
        additionalPropertiesType = class;

        [Flat]
        additionalPropertiesType = class
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
        FAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Response.HeadersProperty.additionalPropertiesType>;

        function GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Response.HeadersProperty.additionalPropertiesType>;
        function GetAdditionalPropertiesStored: Boolean;
      public
        destructor Destroy; override;

        property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
      published
        property additionalProperties: TDynamicProperty<TOpenAPIDefinition.Response.HeadersProperty.additionalPropertiesType> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
      end;

      ContentProperty = class
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

      LinksProperty = class
      public type
        // Forward class declaration
        additionalPropertiesType = class;

        [Flat]
        additionalPropertiesType = class
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
        FAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Response.LinksProperty.additionalPropertiesType>;

        function GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Response.LinksProperty.additionalPropertiesType>;
        function GetAdditionalPropertiesStored: Boolean;
      public
        destructor Destroy; override;

        property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
      published
        property additionalProperties: TDynamicProperty<TOpenAPIDefinition.Response.LinksProperty.additionalPropertiesType> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
      end;
    private
      FDescription: System.String;
      FHeaders: TOpenAPIDefinition.Response.HeadersProperty;
      FContent: TOpenAPIDefinition.Response.ContentProperty;
      FLinks: TOpenAPIDefinition.Response.LinksProperty;
      FPatternProperty: TDynamicProperty<any>;

      function GetHeaders: TOpenAPIDefinition.Response.HeadersProperty;
      function GetContent: TOpenAPIDefinition.Response.ContentProperty;
      function GetLinks: TOpenAPIDefinition.Response.LinksProperty;
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
      property headers: TOpenAPIDefinition.Response.HeadersProperty read GetHeaders write FHeaders stored GetHeadersStored;
      property content: TOpenAPIDefinition.Response.ContentProperty read GetContent write FContent stored GetContentStored;
      property links: TOpenAPIDefinition.Response.LinksProperty read GetLinks write FLinks stored GetLinksStored;
      [PatternProperty('^x-')]
      property PatternProperty: TDynamicProperty<any> read GetPatternProperty write FPatternProperty stored GetPatternPropertyStored;
    end;

    MediaType = class
    public type
      // Forward class declaration
      SchemaProperty = class;
      ExamplesProperty = class;
      EncodingProperty = class;

      [Flat]
      SchemaProperty = class
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

      ExamplesProperty = class
      public type
        // Forward class declaration
        additionalPropertiesType = class;

        [Flat]
        additionalPropertiesType = class
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
        FAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.MediaType.ExamplesProperty.additionalPropertiesType>;

        function GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.MediaType.ExamplesProperty.additionalPropertiesType>;
        function GetAdditionalPropertiesStored: Boolean;
      public
        destructor Destroy; override;

        property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
      published
        property additionalProperties: TDynamicProperty<TOpenAPIDefinition.MediaType.ExamplesProperty.additionalPropertiesType> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
      end;

      EncodingProperty = class
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
      FSchema: TOpenAPIDefinition.MediaType.SchemaProperty;
      FExample: any;
      FExamples: TOpenAPIDefinition.MediaType.ExamplesProperty;
      FEncoding: TOpenAPIDefinition.MediaType.EncodingProperty;
      FExampleXORExamples: TOpenAPIDefinition.ExampleXORExamples;
      FPatternProperty: TDynamicProperty<any>;

      function GetSchema: TOpenAPIDefinition.MediaType.SchemaProperty;
      function GetExamples: TOpenAPIDefinition.MediaType.ExamplesProperty;
      function GetEncoding: TOpenAPIDefinition.MediaType.EncodingProperty;
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
      property schema: TOpenAPIDefinition.MediaType.SchemaProperty read GetSchema write FSchema stored GetSchemaStored;
      property example: any read FExample write FExample stored GetExampleStored;
      property examples: TOpenAPIDefinition.MediaType.ExamplesProperty read GetExamples write FExamples stored GetExamplesStored;
      property encoding: TOpenAPIDefinition.MediaType.EncodingProperty read GetEncoding write FEncoding stored GetEncodingStored;
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

    Header = class
    public type
      StyleProperty = (simple);

      // Forward class declaration
      SchemaProperty = class;
      ContentProperty = class;
      ExamplesProperty = class;

      [Flat]
      SchemaProperty = class
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

      ContentProperty = class
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

      ExamplesProperty = class
      public type
        // Forward class declaration
        additionalPropertiesType = class;

        [Flat]
        additionalPropertiesType = class
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
        FAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Header.ExamplesProperty.additionalPropertiesType>;

        function GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Header.ExamplesProperty.additionalPropertiesType>;
        function GetAdditionalPropertiesStored: Boolean;
      public
        destructor Destroy; override;

        property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
      published
        property additionalProperties: TDynamicProperty<TOpenAPIDefinition.Header.ExamplesProperty.additionalPropertiesType> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
      end;
    private
      FDescription: System.String;
      FRequired: System.Boolean;
      FDeprecated: System.Boolean;
      FAllowEmptyValue: System.Boolean;
      FStyle: TOpenAPIDefinition.Header.StyleProperty;
      FExplode: System.Boolean;
      FAllowReserved: System.Boolean;
      FSchema: TOpenAPIDefinition.Header.SchemaProperty;
      FContent: TOpenAPIDefinition.Header.ContentProperty;
      FExample: any;
      FExamples: TOpenAPIDefinition.Header.ExamplesProperty;
      FExampleXORExamples: TOpenAPIDefinition.ExampleXORExamples;
      FSchemaXORContent: TOpenAPIDefinition.SchemaXORContent;
      FPatternProperty: TDynamicProperty<any>;
      FRequiredIsStored: Boolean;
      FDeprecatedIsStored: Boolean;
      FAllowEmptyValueIsStored: Boolean;
      FStyleIsStored: Boolean;
      FExplodeIsStored: Boolean;
      FAllowReservedIsStored: Boolean;

      function GetSchema: TOpenAPIDefinition.Header.SchemaProperty;
      function GetContent: TOpenAPIDefinition.Header.ContentProperty;
      function GetExamples: TOpenAPIDefinition.Header.ExamplesProperty;
      function GetSchemaXORContent: TOpenAPIDefinition.SchemaXORContent;
      function GetPatternProperty: TDynamicProperty<any>;
      function GetDescriptionStored: Boolean;
      function GetSchemaStored: Boolean;
      function GetContentStored: Boolean;
      function GetExampleStored: Boolean;
      function GetExamplesStored: Boolean;
      function GetExampleXORExamplesStored: Boolean;
      function GetSchemaXORContentStored: Boolean;
      function GetPatternPropertyStored: Boolean;
      procedure SetRequired(const Value: System.Boolean);
      procedure SetDeprecated(const Value: System.Boolean);
      procedure SetAllowEmptyValue(const Value: System.Boolean);
      procedure SetStyle(const Value: TOpenAPIDefinition.Header.StyleProperty);
      procedure SetExplode(const Value: System.Boolean);
      procedure SetAllowReserved(const Value: System.Boolean);
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
      property IsExampleStored: Boolean read GetExampleStored;
      property IsExamplesStored: Boolean read GetExamplesStored;
      property IsExampleXORExamplesStored: Boolean read GetExampleXORExamplesStored;
      property IsSchemaXORContentStored: Boolean read GetSchemaXORContentStored;
      property IsPatternPropertyStored: Boolean read GetPatternPropertyStored;
    published
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      property required: System.Boolean read FRequired write SetRequired stored FRequiredIsStored;
      property deprecated: System.Boolean read FDeprecated write SetDeprecated stored FDeprecatedIsStored;
      property allowEmptyValue: System.Boolean read FAllowEmptyValue write SetAllowEmptyValue stored FAllowEmptyValueIsStored;
      property style: TOpenAPIDefinition.Header.StyleProperty read FStyle write SetStyle stored FStyleIsStored;
      property explode: System.Boolean read FExplode write SetExplode stored FExplodeIsStored;
      property allowReserved: System.Boolean read FAllowReserved write SetAllowReserved stored FAllowReservedIsStored;
      property schema: TOpenAPIDefinition.Header.SchemaProperty read GetSchema write FSchema stored GetSchemaStored;
      property content: TOpenAPIDefinition.Header.ContentProperty read GetContent write FContent stored GetContentStored;
      property example: any read FExample write FExample stored GetExampleStored;
      property examples: TOpenAPIDefinition.Header.ExamplesProperty read GetExamples write FExamples stored GetExamplesStored;
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
      ParametersPropertyArrayItem = class;

      [Flat]
      ParametersPropertyArrayItem = class
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
      FParameters: TArray<TOpenAPIDefinition.PathItem.ParametersPropertyArrayItem>;
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
      function AddParameters: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.PathItem.ParametersPropertyArrayItem;

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
      property ref: System.String read FRef write FRef stored GetRefStored;
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
      property parameters: TArray<TOpenAPIDefinition.PathItem.ParametersPropertyArrayItem> read FParameters write FParameters stored GetParametersStored;
      [PatternProperty('^x-')]
      property PatternProperty: TDynamicProperty<any> read GetPatternProperty write FPatternProperty stored GetPatternPropertyStored;
    end;

    Operation = class
    public type
      // Forward class declaration
      ParametersPropertyArrayItem = class;
      RequestBodyProperty = class;
      CallbacksProperty = class;

      [Flat]
      ParametersPropertyArrayItem = class
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
      RequestBodyProperty = class
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

      CallbacksProperty = class
      public type
        // Forward class declaration
        additionalPropertiesType = class;

        [Flat]
        additionalPropertiesType = class
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
        FAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Operation.CallbacksProperty.additionalPropertiesType>;

        function GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Operation.CallbacksProperty.additionalPropertiesType>;
        function GetAdditionalPropertiesStored: Boolean;
      public
        destructor Destroy; override;

        property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
      published
        property additionalProperties: TDynamicProperty<TOpenAPIDefinition.Operation.CallbacksProperty.additionalPropertiesType> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
      end;
    private
      FTags: TArray<System.String>;
      FSummary: System.String;
      FDescription: System.String;
      FExternalDocs: TOpenAPIDefinition.ExternalDocumentation;
      FOperationId: System.String;
      FParameters: TArray<TOpenAPIDefinition.Operation.ParametersPropertyArrayItem>;
      FRequestBody: TOpenAPIDefinition.Operation.RequestBodyProperty;
      FResponses: TOpenAPIDefinition.Responses;
      FCallbacks: TOpenAPIDefinition.Operation.CallbacksProperty;
      FDeprecated: System.Boolean;
      FSecurity: TArray<TOpenAPIDefinition.SecurityRequirement>;
      FServers: TArray<TOpenAPIDefinition.Server>;
      FPatternProperty: TDynamicProperty<any>;
      FDeprecatedIsStored: Boolean;

      function GetExternalDocs: TOpenAPIDefinition.ExternalDocumentation;
      function GetRequestBody: TOpenAPIDefinition.Operation.RequestBodyProperty;
      function GetResponses: TOpenAPIDefinition.Responses;
      function GetCallbacks: TOpenAPIDefinition.Operation.CallbacksProperty;
      function GetPatternProperty: TDynamicProperty<any>;
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
      function GetPatternPropertyStored: Boolean;
      procedure SetDeprecated(const Value: System.Boolean);
    public
      destructor Destroy; override;

      function AddParameters: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Operation.ParametersPropertyArrayItem;
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
      property IsDeprecatedStored: Boolean read FDeprecatedIsStored;
      property IsSecurityStored: Boolean read GetSecurityStored;
      property IsServersStored: Boolean read GetServersStored;
      property IsPatternPropertyStored: Boolean read GetPatternPropertyStored;
    published
      property tags: TArray<System.String> read FTags write FTags stored GetTagsStored;
      property summary: System.String read FSummary write FSummary stored GetSummaryStored;
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      property externalDocs: TOpenAPIDefinition.ExternalDocumentation read GetExternalDocs write FExternalDocs stored GetExternalDocsStored;
      property operationId: System.String read FOperationId write FOperationId stored GetOperationIdStored;
      property parameters: TArray<TOpenAPIDefinition.Operation.ParametersPropertyArrayItem> read FParameters write FParameters stored GetParametersStored;
      property requestBody: TOpenAPIDefinition.Operation.RequestBodyProperty read GetRequestBody write FRequestBody stored GetRequestBodyStored;
      property responses: TOpenAPIDefinition.Responses read GetResponses write FResponses;
      property callbacks: TOpenAPIDefinition.Operation.CallbacksProperty read GetCallbacks write FCallbacks stored GetCallbacksStored;
      property deprecated: System.Boolean read FDeprecated write SetDeprecated stored FDeprecatedIsStored;
      property security: TArray<TOpenAPIDefinition.SecurityRequirement> read FSecurity write FSecurity stored GetSecurityStored;
      property servers: TArray<TOpenAPIDefinition.Server> read FServers write FServers stored GetServersStored;
      [PatternProperty('^x-')]
      property PatternProperty: TDynamicProperty<any> read GetPatternProperty write FPatternProperty stored GetPatternPropertyStored;
    end;

    Responses = class
    public type
      // Forward class declaration
      DefaultProperty = class;
      PatternProperty = class;

      [Flat]
      DefaultProperty = class
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
      PatternProperty = class
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
      FDefault: TOpenAPIDefinition.Responses.DefaultProperty;
      FPatternPropertyElement: TDynamicProperty<TOpenAPIDefinition.Responses.PatternProperty>;
      FPatternProperty2: TDynamicProperty<any>;

      function GetDefault: TOpenAPIDefinition.Responses.DefaultProperty;
      function GetPatternPropertyElement: TDynamicProperty<TOpenAPIDefinition.Responses.PatternProperty>;
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
      property default: TOpenAPIDefinition.Responses.DefaultProperty read GetDefault write FDefault stored GetDefaultStored;
      [PatternProperty('^[1-5](?:\d{2}|XX)$')]
      [FieldName('PatternProperty')]
      property PatternPropertyElement: TDynamicProperty<TOpenAPIDefinition.Responses.PatternProperty> read GetPatternPropertyElement write FPatternPropertyElement stored GetPatternPropertyStored;
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

    Parameter = class
    public type
      // Forward class declaration
      SchemaProperty = class;
      ContentProperty = class;
      ExamplesProperty = class;

      [Flat]
      SchemaProperty = class
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

      ContentProperty = class
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

      ExamplesProperty = class
      public type
        // Forward class declaration
        additionalPropertiesType = class;

        [Flat]
        additionalPropertiesType = class
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
        FAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Parameter.ExamplesProperty.additionalPropertiesType>;

        function GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Parameter.ExamplesProperty.additionalPropertiesType>;
        function GetAdditionalPropertiesStored: Boolean;
      public
        destructor Destroy; override;

        property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
      published
        property additionalProperties: TDynamicProperty<TOpenAPIDefinition.Parameter.ExamplesProperty.additionalPropertiesType> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
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
      FSchema: TOpenAPIDefinition.Parameter.SchemaProperty;
      FContent: TOpenAPIDefinition.Parameter.ContentProperty;
      FExample: any;
      FExamples: TOpenAPIDefinition.Parameter.ExamplesProperty;
      FExampleXORExamples: TOpenAPIDefinition.ExampleXORExamples;
      FSchemaXORContent: TOpenAPIDefinition.SchemaXORContent;
      FPathParameter: TOpenAPIDefinition.PathParameter;
      FQueryParameter: TOpenAPIDefinition.QueryParameter;
      FHeaderParameter: TOpenAPIDefinition.HeaderParameter;
      FCookieParameter: TOpenAPIDefinition.CookieParameter;
      FPatternProperty: TDynamicProperty<any>;
      FRequiredIsStored: Boolean;
      FDeprecatedIsStored: Boolean;
      FAllowEmptyValueIsStored: Boolean;
      FExplodeIsStored: Boolean;
      FAllowReservedIsStored: Boolean;

      function GetSchema: TOpenAPIDefinition.Parameter.SchemaProperty;
      function GetContent: TOpenAPIDefinition.Parameter.ContentProperty;
      function GetExamples: TOpenAPIDefinition.Parameter.ExamplesProperty;
      function GetSchemaXORContent: TOpenAPIDefinition.SchemaXORContent;
      function GetPathParameter: TOpenAPIDefinition.PathParameter;
      function GetQueryParameter: TOpenAPIDefinition.QueryParameter;
      function GetHeaderParameter: TOpenAPIDefinition.HeaderParameter;
      function GetCookieParameter: TOpenAPIDefinition.CookieParameter;
      function GetPatternProperty: TDynamicProperty<any>;
      function GetDescriptionStored: Boolean;
      function GetStyleStored: Boolean;
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
      procedure SetRequired(const Value: System.Boolean);
      procedure SetDeprecated(const Value: System.Boolean);
      procedure SetAllowEmptyValue(const Value: System.Boolean);
      procedure SetExplode(const Value: System.Boolean);
      procedure SetAllowReserved(const Value: System.Boolean);
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
      property required: System.Boolean read FRequired write SetRequired stored FRequiredIsStored;
      property deprecated: System.Boolean read FDeprecated write SetDeprecated stored FDeprecatedIsStored;
      property allowEmptyValue: System.Boolean read FAllowEmptyValue write SetAllowEmptyValue stored FAllowEmptyValueIsStored;
      property style: System.String read FStyle write FStyle stored GetStyleStored;
      property explode: System.Boolean read FExplode write SetExplode stored FExplodeIsStored;
      property allowReserved: System.Boolean read FAllowReserved write SetAllowReserved stored FAllowReservedIsStored;
      property schema: TOpenAPIDefinition.Parameter.SchemaProperty read GetSchema write FSchema stored GetSchemaStored;
      property content: TOpenAPIDefinition.Parameter.ContentProperty read GetContent write FContent stored GetContentStored;
      property example: any read FExample write FExample stored GetExampleStored;
      property examples: TOpenAPIDefinition.Parameter.ExamplesProperty read GetExamples write FExamples stored GetExamplesStored;
      property ExampleXORExamples: TOpenAPIDefinition.ExampleXORExamples read FExampleXORExamples write FExampleXORExamples stored GetExampleXORExamplesStored;
      property SchemaXORContent: TOpenAPIDefinition.SchemaXORContent read GetSchemaXORContent write FSchemaXORContent stored GetSchemaXORContentStored;
      [Flat('in')]
      property PathParameter: TOpenAPIDefinition.PathParameter read GetPathParameter write FPathParameter stored GetPathParameterStored;
      [Flat('in')]
      property QueryParameter: TOpenAPIDefinition.QueryParameter read GetQueryParameter write FQueryParameter stored GetQueryParameterStored;
      [Flat('in')]
      property HeaderParameter: TOpenAPIDefinition.HeaderParameter read GetHeaderParameter write FHeaderParameter stored GetHeaderParameterStored;
      [Flat('in')]
      property CookieParameter: TOpenAPIDefinition.CookieParameter read GetCookieParameter write FCookieParameter stored GetCookieParameterStored;
      [PatternProperty('^x-')]
      property PatternProperty: TDynamicProperty<any> read GetPatternProperty write FPatternProperty stored GetPatternPropertyStored;
    end;

    PathParameter = class
    public type
      InProperty = (path);

      [EnumValue('matrix, label, simple')]
      StyleProperty = (matrix, &label, simple);

      RequiredProperty = (True);
    private
      FIn: TOpenAPIDefinition.PathParameter.InProperty;
      FStyle: TOpenAPIDefinition.PathParameter.StyleProperty;
      FRequired: TOpenAPIDefinition.PathParameter.RequiredProperty;
      FInIsStored: Boolean;
      FStyleIsStored: Boolean;

      procedure SetIn(const Value: TOpenAPIDefinition.PathParameter.InProperty);
      procedure SetStyle(const Value: TOpenAPIDefinition.PathParameter.StyleProperty);
    public
      property IsInStored: Boolean read FInIsStored;
      property IsStyleStored: Boolean read FStyleIsStored;
    published
      [FieldName('in')]
      property &in: TOpenAPIDefinition.PathParameter.InProperty read FIn write SetIn stored FInIsStored;
      property style: TOpenAPIDefinition.PathParameter.StyleProperty read FStyle write SetStyle stored FStyleIsStored;
      property required: TOpenAPIDefinition.PathParameter.RequiredProperty read FRequired write FRequired;
    end;

    QueryParameter = class
    public type
      InProperty = (query);

      StyleProperty = (form, spaceDelimited, pipeDelimited, deepObject);
    private
      FIn: TOpenAPIDefinition.QueryParameter.InProperty;
      FStyle: TOpenAPIDefinition.QueryParameter.StyleProperty;
      FInIsStored: Boolean;
      FStyleIsStored: Boolean;

      procedure SetIn(const Value: TOpenAPIDefinition.QueryParameter.InProperty);
      procedure SetStyle(const Value: TOpenAPIDefinition.QueryParameter.StyleProperty);
    public
      property IsInStored: Boolean read FInIsStored;
      property IsStyleStored: Boolean read FStyleIsStored;
    published
      [FieldName('in')]
      property &in: TOpenAPIDefinition.QueryParameter.InProperty read FIn write SetIn stored FInIsStored;
      property style: TOpenAPIDefinition.QueryParameter.StyleProperty read FStyle write SetStyle stored FStyleIsStored;
    end;

    HeaderParameter = class
    public type
      InProperty = (header);

      StyleProperty = (simple);
    private
      FIn: TOpenAPIDefinition.HeaderParameter.InProperty;
      FStyle: TOpenAPIDefinition.HeaderParameter.StyleProperty;
      FInIsStored: Boolean;
      FStyleIsStored: Boolean;

      procedure SetIn(const Value: TOpenAPIDefinition.HeaderParameter.InProperty);
      procedure SetStyle(const Value: TOpenAPIDefinition.HeaderParameter.StyleProperty);
    public
      property IsInStored: Boolean read FInIsStored;
      property IsStyleStored: Boolean read FStyleIsStored;
    published
      [FieldName('in')]
      property &in: TOpenAPIDefinition.HeaderParameter.InProperty read FIn write SetIn stored FInIsStored;
      property style: TOpenAPIDefinition.HeaderParameter.StyleProperty read FStyle write SetStyle stored FStyleIsStored;
    end;

    CookieParameter = class
    public type
      InProperty = (cookie);

      StyleProperty = (form);
    private
      FIn: TOpenAPIDefinition.CookieParameter.InProperty;
      FStyle: TOpenAPIDefinition.CookieParameter.StyleProperty;
      FInIsStored: Boolean;
      FStyleIsStored: Boolean;

      procedure SetIn(const Value: TOpenAPIDefinition.CookieParameter.InProperty);
      procedure SetStyle(const Value: TOpenAPIDefinition.CookieParameter.StyleProperty);
    public
      property IsInStored: Boolean read FInIsStored;
      property IsStyleStored: Boolean read FStyleIsStored;
    published
      [FieldName('in')]
      property &in: TOpenAPIDefinition.CookieParameter.InProperty read FIn write SetIn stored FInIsStored;
      property style: TOpenAPIDefinition.CookieParameter.StyleProperty read FStyle write SetStyle stored FStyleIsStored;
    end;

    RequestBody = class
    public type
      // Forward class declaration
      ContentProperty = class;

      ContentProperty = class
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
      FContent: TOpenAPIDefinition.RequestBody.ContentProperty;
      FRequired: System.Boolean;
      FPatternProperty: TDynamicProperty<any>;
      FRequiredIsStored: Boolean;

      function GetContent: TOpenAPIDefinition.RequestBody.ContentProperty;
      function GetPatternProperty: TDynamicProperty<any>;
      function GetDescriptionStored: Boolean;
      function GetPatternPropertyStored: Boolean;
      procedure SetRequired(const Value: System.Boolean);
    public
      destructor Destroy; override;

      property IsDescriptionStored: Boolean read GetDescriptionStored;
      property IsRequiredStored: Boolean read FRequiredIsStored;
      property IsPatternPropertyStored: Boolean read GetPatternPropertyStored;
    published
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      property content: TOpenAPIDefinition.RequestBody.ContentProperty read GetContent write FContent;
      property required: System.Boolean read FRequired write SetRequired stored FRequiredIsStored;
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
      TypeProperty = (apiKey);

      InProperty = (header, query, cookie);
    private
      FType: TOpenAPIDefinition.APIKeySecurityScheme.TypeProperty;
      FName: System.String;
      FIn: TOpenAPIDefinition.APIKeySecurityScheme.InProperty;
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
      property &type: TOpenAPIDefinition.APIKeySecurityScheme.TypeProperty read FType write FType;
      property name: System.String read FName write FName;
      [FieldName('in')]
      property &in: TOpenAPIDefinition.APIKeySecurityScheme.InProperty read FIn write FIn;
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      [PatternProperty('^x-')]
      property PatternProperty: TDynamicProperty<any> read GetPatternProperty write FPatternProperty stored GetPatternPropertyStored;
    end;

    HTTPSecurityScheme = class
    public type
      TypeProperty = (http);
    private
      FScheme: System.String;
      FBearerFormat: System.String;
      FDescription: System.String;
      FType: TOpenAPIDefinition.HTTPSecurityScheme.TypeProperty;
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
      property &type: TOpenAPIDefinition.HTTPSecurityScheme.TypeProperty read FType write FType;
      [PatternProperty('^x-')]
      property PatternProperty: TDynamicProperty<any> read GetPatternProperty write FPatternProperty stored GetPatternPropertyStored;
    end;

    OAuth2SecurityScheme = class
    public type
      TypeProperty = (oauth2);
    private
      FType: TOpenAPIDefinition.OAuth2SecurityScheme.TypeProperty;
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
      property &type: TOpenAPIDefinition.OAuth2SecurityScheme.TypeProperty read FType write FType;
      property flows: TOpenAPIDefinition.OAuthFlows read GetFlows write FFlows;
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      [PatternProperty('^x-')]
      property PatternProperty: TDynamicProperty<any> read GetPatternProperty write FPatternProperty stored GetPatternPropertyStored;
    end;

    OpenIdConnectSecurityScheme = class
    public type
      TypeProperty = (openIdConnect);
    private
      FType: TOpenAPIDefinition.OpenIdConnectSecurityScheme.TypeProperty;
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
      property &type: TOpenAPIDefinition.OpenIdConnectSecurityScheme.TypeProperty read FType write FType;
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
      ScopesProperty = class;

      ScopesProperty = class
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
      FScopes: TOpenAPIDefinition.ImplicitOAuthFlow.ScopesProperty;
      FPatternProperty: TDynamicProperty<any>;

      function GetScopes: TOpenAPIDefinition.ImplicitOAuthFlow.ScopesProperty;
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
      property scopes: TOpenAPIDefinition.ImplicitOAuthFlow.ScopesProperty read GetScopes write FScopes;
      [PatternProperty('^x-')]
      property PatternProperty: TDynamicProperty<any> read GetPatternProperty write FPatternProperty stored GetPatternPropertyStored;
    end;

    PasswordOAuthFlow = class
    public type
      // Forward class declaration
      ScopesProperty = class;

      ScopesProperty = class
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
      FScopes: TOpenAPIDefinition.PasswordOAuthFlow.ScopesProperty;
      FPatternProperty: TDynamicProperty<any>;

      function GetScopes: TOpenAPIDefinition.PasswordOAuthFlow.ScopesProperty;
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
      property scopes: TOpenAPIDefinition.PasswordOAuthFlow.ScopesProperty read GetScopes write FScopes;
      [PatternProperty('^x-')]
      property PatternProperty: TDynamicProperty<any> read GetPatternProperty write FPatternProperty stored GetPatternPropertyStored;
    end;

    ClientCredentialsFlow = class
    public type
      // Forward class declaration
      ScopesProperty = class;

      ScopesProperty = class
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
      FScopes: TOpenAPIDefinition.ClientCredentialsFlow.ScopesProperty;
      FPatternProperty: TDynamicProperty<any>;

      function GetScopes: TOpenAPIDefinition.ClientCredentialsFlow.ScopesProperty;
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
      property scopes: TOpenAPIDefinition.ClientCredentialsFlow.ScopesProperty read GetScopes write FScopes;
      [PatternProperty('^x-')]
      property PatternProperty: TDynamicProperty<any> read GetPatternProperty write FPatternProperty stored GetPatternPropertyStored;
    end;

    AuthorizationCodeOAuthFlow = class
    public type
      // Forward class declaration
      ScopesProperty = class;

      ScopesProperty = class
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
      FScopes: TOpenAPIDefinition.AuthorizationCodeOAuthFlow.ScopesProperty;
      FPatternProperty: TDynamicProperty<any>;

      function GetScopes: TOpenAPIDefinition.AuthorizationCodeOAuthFlow.ScopesProperty;
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
      property scopes: TOpenAPIDefinition.AuthorizationCodeOAuthFlow.ScopesProperty read GetScopes write FScopes;
      [PatternProperty('^x-')]
      property PatternProperty: TDynamicProperty<any> read GetPatternProperty write FPatternProperty stored GetPatternPropertyStored;
    end;

    Link = class
    public type
      // Forward class declaration
      ParametersProperty = class;

      ParametersProperty = class
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
      FParameters: TOpenAPIDefinition.Link.ParametersProperty;
      FRequestBody: any;
      FDescription: System.String;
      FServer: TOpenAPIDefinition.Server;
      FPatternProperty: TDynamicProperty<any>;

      function GetParameters: TOpenAPIDefinition.Link.ParametersProperty;
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
      property parameters: TOpenAPIDefinition.Link.ParametersProperty read GetParameters write FParameters stored GetParametersStored;
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
      StyleProperty = (form, spaceDelimited, pipeDelimited, deepObject);

      // Forward class declaration
      HeadersProperty = class;

      HeadersProperty = class
      public type
        // Forward class declaration
        additionalPropertiesType = class;

        [Flat]
        additionalPropertiesType = class
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
        FAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Encoding.HeadersProperty.additionalPropertiesType>;

        function GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Encoding.HeadersProperty.additionalPropertiesType>;
        function GetAdditionalPropertiesStored: Boolean;
      public
        destructor Destroy; override;

        property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
      published
        property additionalProperties: TDynamicProperty<TOpenAPIDefinition.Encoding.HeadersProperty.additionalPropertiesType> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
      end;
    private
      FContentType: System.String;
      FHeaders: TOpenAPIDefinition.Encoding.HeadersProperty;
      FStyle: TOpenAPIDefinition.Encoding.StyleProperty;
      FExplode: System.Boolean;
      FAllowReserved: System.Boolean;
      FPatternProperty: TDynamicProperty<any>;
      FStyleIsStored: Boolean;
      FExplodeIsStored: Boolean;
      FAllowReservedIsStored: Boolean;

      function GetHeaders: TOpenAPIDefinition.Encoding.HeadersProperty;
      function GetPatternProperty: TDynamicProperty<any>;
      function GetContentTypeStored: Boolean;
      function GetHeadersStored: Boolean;
      function GetPatternPropertyStored: Boolean;
      procedure SetStyle(const Value: TOpenAPIDefinition.Encoding.StyleProperty);
      procedure SetExplode(const Value: System.Boolean);
      procedure SetAllowReserved(const Value: System.Boolean);
    public
      destructor Destroy; override;

      property IsContentTypeStored: Boolean read GetContentTypeStored;
      property IsHeadersStored: Boolean read GetHeadersStored;
      property IsStyleStored: Boolean read FStyleIsStored;
      property IsExplodeStored: Boolean read FExplodeIsStored;
      property IsAllowReservedStored: Boolean read FAllowReservedIsStored;
      property IsPatternPropertyStored: Boolean read GetPatternPropertyStored;
    published
      property contentType: System.String read FContentType write FContentType stored GetContentTypeStored;
      property headers: TOpenAPIDefinition.Encoding.HeadersProperty read GetHeaders write FHeaders stored GetHeadersStored;
      property style: TOpenAPIDefinition.Encoding.StyleProperty read FStyle write SetStyle stored FStyleIsStored;
      property explode: System.Boolean read FExplode write SetExplode stored FExplodeIsStored;
      property allowReserved: System.Boolean read FAllowReserved write SetAllowReserved stored FAllowReservedIsStored;
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

function TOpenAPIDefinition.Server.GetVariables: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Server.VariablesProperty;
begin
  if not Assigned(FVariables) then
    FVariables := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Server.VariablesProperty.Create;

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

{ TOpenAPIDefinition.Server.VariablesProperty }

destructor TOpenAPIDefinition.Server.VariablesProperty.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.Server.VariablesProperty.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.ServerVariable>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.ServerVariable>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.Server.VariablesProperty.GetAdditionalPropertiesStored: Boolean;
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

function TOpenAPIDefinition.Components.GetSchemas: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Components.SchemasProperty;
begin
  if not Assigned(FSchemas) then
    FSchemas := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Components.SchemasProperty.Create;

  Result := FSchemas;
end;

function TOpenAPIDefinition.Components.GetSchemasStored: Boolean;
begin
  Result := Assigned(FSchemas);
end;

function TOpenAPIDefinition.Components.GetResponses: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Components.ResponsesProperty;
begin
  if not Assigned(FResponses) then
    FResponses := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Components.ResponsesProperty.Create;

  Result := FResponses;
end;

function TOpenAPIDefinition.Components.GetResponsesStored: Boolean;
begin
  Result := Assigned(FResponses);
end;

function TOpenAPIDefinition.Components.GetParameters: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Components.ParametersProperty;
begin
  if not Assigned(FParameters) then
    FParameters := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Components.ParametersProperty.Create;

  Result := FParameters;
end;

function TOpenAPIDefinition.Components.GetParametersStored: Boolean;
begin
  Result := Assigned(FParameters);
end;

function TOpenAPIDefinition.Components.GetExamples: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Components.ExamplesProperty;
begin
  if not Assigned(FExamples) then
    FExamples := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Components.ExamplesProperty.Create;

  Result := FExamples;
end;

function TOpenAPIDefinition.Components.GetExamplesStored: Boolean;
begin
  Result := Assigned(FExamples);
end;

function TOpenAPIDefinition.Components.GetRequestBodies: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Components.RequestBodiesProperty;
begin
  if not Assigned(FRequestBodies) then
    FRequestBodies := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Components.RequestBodiesProperty.Create;

  Result := FRequestBodies;
end;

function TOpenAPIDefinition.Components.GetRequestBodiesStored: Boolean;
begin
  Result := Assigned(FRequestBodies);
end;

function TOpenAPIDefinition.Components.GetHeaders: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Components.HeadersProperty;
begin
  if not Assigned(FHeaders) then
    FHeaders := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Components.HeadersProperty.Create;

  Result := FHeaders;
end;

function TOpenAPIDefinition.Components.GetHeadersStored: Boolean;
begin
  Result := Assigned(FHeaders);
end;

function TOpenAPIDefinition.Components.GetSecuritySchemes: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Components.SecuritySchemesProperty;
begin
  if not Assigned(FSecuritySchemes) then
    FSecuritySchemes := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Components.SecuritySchemesProperty.Create;

  Result := FSecuritySchemes;
end;

function TOpenAPIDefinition.Components.GetSecuritySchemesStored: Boolean;
begin
  Result := Assigned(FSecuritySchemes);
end;

function TOpenAPIDefinition.Components.GetLinks: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Components.LinksProperty;
begin
  if not Assigned(FLinks) then
    FLinks := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Components.LinksProperty.Create;

  Result := FLinks;
end;

function TOpenAPIDefinition.Components.GetLinksStored: Boolean;
begin
  Result := Assigned(FLinks);
end;

function TOpenAPIDefinition.Components.GetCallbacks: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Components.CallbacksProperty;
begin
  if not Assigned(FCallbacks) then
    FCallbacks := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Components.CallbacksProperty.Create;

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

{ TOpenAPIDefinition.Components.SchemasProperty }

destructor TOpenAPIDefinition.Components.SchemasProperty.Destroy;
begin
  FPatternPropertyElement.Free;

  inherited;
end;

function TOpenAPIDefinition.Components.SchemasProperty.GetPatternPropertyElement: TDynamicProperty<TOpenAPIDefinition.Components.SchemasProperty.PatternProperty>;
begin
  if not Assigned(FPatternPropertyElement) then
    FPatternPropertyElement := TDynamicProperty<Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Components.SchemasProperty.PatternProperty>.Create;

  Result := FPatternPropertyElement;
end;

function TOpenAPIDefinition.Components.SchemasProperty.GetPatternPropertyStored: Boolean;
begin
  Result := Assigned(FPatternPropertyElement);
end;

{ TOpenAPIDefinition.Components.SchemasProperty.PatternProperty }

destructor TOpenAPIDefinition.Components.SchemasProperty.PatternProperty.Destroy;
begin
  FSchema.Free;

  FReference.Free;

  inherited;
end;

function TOpenAPIDefinition.Components.SchemasProperty.PatternProperty.GetSchema: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema.Create;

  Result := FSchema;
end;

function TOpenAPIDefinition.Components.SchemasProperty.PatternProperty.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function TOpenAPIDefinition.Components.SchemasProperty.PatternProperty.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Components.SchemasProperty.PatternProperty.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

{ TOpenAPIDefinition.Components.ResponsesProperty }

destructor TOpenAPIDefinition.Components.ResponsesProperty.Destroy;
begin
  FPatternPropertyElement.Free;

  inherited;
end;

function TOpenAPIDefinition.Components.ResponsesProperty.GetPatternPropertyElement: TDynamicProperty<TOpenAPIDefinition.Components.ResponsesProperty.PatternProperty>;
begin
  if not Assigned(FPatternPropertyElement) then
    FPatternPropertyElement := TDynamicProperty<Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Components.ResponsesProperty.PatternProperty>.Create;

  Result := FPatternPropertyElement;
end;

function TOpenAPIDefinition.Components.ResponsesProperty.GetPatternPropertyStored: Boolean;
begin
  Result := Assigned(FPatternPropertyElement);
end;

{ TOpenAPIDefinition.Components.ResponsesProperty.PatternProperty }

destructor TOpenAPIDefinition.Components.ResponsesProperty.PatternProperty.Destroy;
begin
  FReference.Free;

  FResponse.Free;

  inherited;
end;

function TOpenAPIDefinition.Components.ResponsesProperty.PatternProperty.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Components.ResponsesProperty.PatternProperty.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

function TOpenAPIDefinition.Components.ResponsesProperty.PatternProperty.GetResponse: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Response;
begin
  if not Assigned(FResponse) then
    FResponse := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Response.Create;

  Result := FResponse;
end;

function TOpenAPIDefinition.Components.ResponsesProperty.PatternProperty.GetResponseStored: Boolean;
begin
  Result := Assigned(FResponse);
end;

{ TOpenAPIDefinition.Components.ParametersProperty }

destructor TOpenAPIDefinition.Components.ParametersProperty.Destroy;
begin
  FPatternPropertyElement.Free;

  inherited;
end;

function TOpenAPIDefinition.Components.ParametersProperty.GetPatternPropertyElement: TDynamicProperty<TOpenAPIDefinition.Components.ParametersProperty.PatternProperty>;
begin
  if not Assigned(FPatternPropertyElement) then
    FPatternPropertyElement := TDynamicProperty<Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Components.ParametersProperty.PatternProperty>.Create;

  Result := FPatternPropertyElement;
end;

function TOpenAPIDefinition.Components.ParametersProperty.GetPatternPropertyStored: Boolean;
begin
  Result := Assigned(FPatternPropertyElement);
end;

{ TOpenAPIDefinition.Components.ParametersProperty.PatternProperty }

destructor TOpenAPIDefinition.Components.ParametersProperty.PatternProperty.Destroy;
begin
  FReference.Free;

  FParameter.Free;

  inherited;
end;

function TOpenAPIDefinition.Components.ParametersProperty.PatternProperty.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Components.ParametersProperty.PatternProperty.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

function TOpenAPIDefinition.Components.ParametersProperty.PatternProperty.GetParameter: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Parameter;
begin
  if not Assigned(FParameter) then
    FParameter := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Parameter.Create;

  Result := FParameter;
end;

function TOpenAPIDefinition.Components.ParametersProperty.PatternProperty.GetParameterStored: Boolean;
begin
  Result := Assigned(FParameter);
end;

{ TOpenAPIDefinition.Components.ExamplesProperty }

destructor TOpenAPIDefinition.Components.ExamplesProperty.Destroy;
begin
  FPatternPropertyElement.Free;

  inherited;
end;

function TOpenAPIDefinition.Components.ExamplesProperty.GetPatternPropertyElement: TDynamicProperty<TOpenAPIDefinition.Components.ExamplesProperty.PatternProperty>;
begin
  if not Assigned(FPatternPropertyElement) then
    FPatternPropertyElement := TDynamicProperty<Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Components.ExamplesProperty.PatternProperty>.Create;

  Result := FPatternPropertyElement;
end;

function TOpenAPIDefinition.Components.ExamplesProperty.GetPatternPropertyStored: Boolean;
begin
  Result := Assigned(FPatternPropertyElement);
end;

{ TOpenAPIDefinition.Components.ExamplesProperty.PatternProperty }

destructor TOpenAPIDefinition.Components.ExamplesProperty.PatternProperty.Destroy;
begin
  FReference.Free;

  FExample.Free;

  inherited;
end;

function TOpenAPIDefinition.Components.ExamplesProperty.PatternProperty.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Components.ExamplesProperty.PatternProperty.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

function TOpenAPIDefinition.Components.ExamplesProperty.PatternProperty.GetExample: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Example;
begin
  if not Assigned(FExample) then
    FExample := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Example.Create;

  Result := FExample;
end;

function TOpenAPIDefinition.Components.ExamplesProperty.PatternProperty.GetExampleStored: Boolean;
begin
  Result := Assigned(FExample);
end;

{ TOpenAPIDefinition.Components.RequestBodiesProperty }

destructor TOpenAPIDefinition.Components.RequestBodiesProperty.Destroy;
begin
  FPatternPropertyElement.Free;

  inherited;
end;

function TOpenAPIDefinition.Components.RequestBodiesProperty.GetPatternPropertyElement: TDynamicProperty<TOpenAPIDefinition.Components.RequestBodiesProperty.PatternProperty>;
begin
  if not Assigned(FPatternPropertyElement) then
    FPatternPropertyElement := TDynamicProperty<Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Components.RequestBodiesProperty.PatternProperty>.Create;

  Result := FPatternPropertyElement;
end;

function TOpenAPIDefinition.Components.RequestBodiesProperty.GetPatternPropertyStored: Boolean;
begin
  Result := Assigned(FPatternPropertyElement);
end;

{ TOpenAPIDefinition.Components.RequestBodiesProperty.PatternProperty }

destructor TOpenAPIDefinition.Components.RequestBodiesProperty.PatternProperty.Destroy;
begin
  FReference.Free;

  FRequestBody.Free;

  inherited;
end;

function TOpenAPIDefinition.Components.RequestBodiesProperty.PatternProperty.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Components.RequestBodiesProperty.PatternProperty.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

function TOpenAPIDefinition.Components.RequestBodiesProperty.PatternProperty.GetRequestBody: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.RequestBody;
begin
  if not Assigned(FRequestBody) then
    FRequestBody := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.RequestBody.Create;

  Result := FRequestBody;
end;

function TOpenAPIDefinition.Components.RequestBodiesProperty.PatternProperty.GetRequestBodyStored: Boolean;
begin
  Result := Assigned(FRequestBody);
end;

{ TOpenAPIDefinition.Components.HeadersProperty }

destructor TOpenAPIDefinition.Components.HeadersProperty.Destroy;
begin
  FPatternPropertyElement.Free;

  inherited;
end;

function TOpenAPIDefinition.Components.HeadersProperty.GetPatternPropertyElement: TDynamicProperty<TOpenAPIDefinition.Components.HeadersProperty.PatternProperty>;
begin
  if not Assigned(FPatternPropertyElement) then
    FPatternPropertyElement := TDynamicProperty<Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Components.HeadersProperty.PatternProperty>.Create;

  Result := FPatternPropertyElement;
end;

function TOpenAPIDefinition.Components.HeadersProperty.GetPatternPropertyStored: Boolean;
begin
  Result := Assigned(FPatternPropertyElement);
end;

{ TOpenAPIDefinition.Components.HeadersProperty.PatternProperty }

destructor TOpenAPIDefinition.Components.HeadersProperty.PatternProperty.Destroy;
begin
  FReference.Free;

  FHeader.Free;

  inherited;
end;

function TOpenAPIDefinition.Components.HeadersProperty.PatternProperty.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Components.HeadersProperty.PatternProperty.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

function TOpenAPIDefinition.Components.HeadersProperty.PatternProperty.GetHeader: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Header;
begin
  if not Assigned(FHeader) then
    FHeader := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Header.Create;

  Result := FHeader;
end;

function TOpenAPIDefinition.Components.HeadersProperty.PatternProperty.GetHeaderStored: Boolean;
begin
  Result := Assigned(FHeader);
end;

{ TOpenAPIDefinition.Components.SecuritySchemesProperty }

destructor TOpenAPIDefinition.Components.SecuritySchemesProperty.Destroy;
begin
  FPatternPropertyElement.Free;

  inherited;
end;

function TOpenAPIDefinition.Components.SecuritySchemesProperty.GetPatternPropertyElement: TDynamicProperty<TOpenAPIDefinition.Components.SecuritySchemesProperty.PatternProperty>;
begin
  if not Assigned(FPatternPropertyElement) then
    FPatternPropertyElement := TDynamicProperty<Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Components.SecuritySchemesProperty.PatternProperty>.Create;

  Result := FPatternPropertyElement;
end;

function TOpenAPIDefinition.Components.SecuritySchemesProperty.GetPatternPropertyStored: Boolean;
begin
  Result := Assigned(FPatternPropertyElement);
end;

{ TOpenAPIDefinition.Components.SecuritySchemesProperty.PatternProperty }

destructor TOpenAPIDefinition.Components.SecuritySchemesProperty.PatternProperty.Destroy;
begin
  FReference.Free;

  FSecurityScheme.Free;

  inherited;
end;

function TOpenAPIDefinition.Components.SecuritySchemesProperty.PatternProperty.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Components.SecuritySchemesProperty.PatternProperty.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

function TOpenAPIDefinition.Components.SecuritySchemesProperty.PatternProperty.GetSecurityScheme: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.SecurityScheme;
begin
  if not Assigned(FSecurityScheme) then
    FSecurityScheme := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.SecurityScheme.Create;

  Result := FSecurityScheme;
end;

function TOpenAPIDefinition.Components.SecuritySchemesProperty.PatternProperty.GetSecuritySchemeStored: Boolean;
begin
  Result := Assigned(FSecurityScheme);
end;

{ TOpenAPIDefinition.Components.LinksProperty }

destructor TOpenAPIDefinition.Components.LinksProperty.Destroy;
begin
  FPatternPropertyElement.Free;

  inherited;
end;

function TOpenAPIDefinition.Components.LinksProperty.GetPatternPropertyElement: TDynamicProperty<TOpenAPIDefinition.Components.LinksProperty.PatternProperty>;
begin
  if not Assigned(FPatternPropertyElement) then
    FPatternPropertyElement := TDynamicProperty<Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Components.LinksProperty.PatternProperty>.Create;

  Result := FPatternPropertyElement;
end;

function TOpenAPIDefinition.Components.LinksProperty.GetPatternPropertyStored: Boolean;
begin
  Result := Assigned(FPatternPropertyElement);
end;

{ TOpenAPIDefinition.Components.LinksProperty.PatternProperty }

destructor TOpenAPIDefinition.Components.LinksProperty.PatternProperty.Destroy;
begin
  FReference.Free;

  FLink.Free;

  inherited;
end;

function TOpenAPIDefinition.Components.LinksProperty.PatternProperty.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Components.LinksProperty.PatternProperty.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

function TOpenAPIDefinition.Components.LinksProperty.PatternProperty.GetLink: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Link;
begin
  if not Assigned(FLink) then
    FLink := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Link.Create;

  Result := FLink;
end;

function TOpenAPIDefinition.Components.LinksProperty.PatternProperty.GetLinkStored: Boolean;
begin
  Result := Assigned(FLink);
end;

{ TOpenAPIDefinition.Components.CallbacksProperty }

destructor TOpenAPIDefinition.Components.CallbacksProperty.Destroy;
begin
  FPatternPropertyElement.Free;

  inherited;
end;

function TOpenAPIDefinition.Components.CallbacksProperty.GetPatternPropertyElement: TDynamicProperty<TOpenAPIDefinition.Components.CallbacksProperty.PatternProperty>;
begin
  if not Assigned(FPatternPropertyElement) then
    FPatternPropertyElement := TDynamicProperty<Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Components.CallbacksProperty.PatternProperty>.Create;

  Result := FPatternPropertyElement;
end;

function TOpenAPIDefinition.Components.CallbacksProperty.GetPatternPropertyStored: Boolean;
begin
  Result := Assigned(FPatternPropertyElement);
end;

{ TOpenAPIDefinition.Components.CallbacksProperty.PatternProperty }

destructor TOpenAPIDefinition.Components.CallbacksProperty.PatternProperty.Destroy;
begin
  FReference.Free;

  FCallback.Free;

  inherited;
end;

function TOpenAPIDefinition.Components.CallbacksProperty.PatternProperty.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Components.CallbacksProperty.PatternProperty.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

function TOpenAPIDefinition.Components.CallbacksProperty.PatternProperty.GetCallback: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Callback;
begin
  if not Assigned(FCallback) then
    FCallback := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Callback.Create;

  Result := FCallback;
end;

function TOpenAPIDefinition.Components.CallbacksProperty.PatternProperty.GetCallbackStored: Boolean;
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

procedure TOpenAPIDefinition.Schema.SetExclusiveMaximum(const Value: System.Boolean);
begin
  FExclusiveMaximum := Value;
  FExclusiveMaximumIsStored := True;
end;

function TOpenAPIDefinition.Schema.GetMinimumStored: Boolean;
begin
  Result := FMinimum <> 0;
end;

procedure TOpenAPIDefinition.Schema.SetExclusiveMinimum(const Value: System.Boolean);
begin
  FExclusiveMinimum := Value;
  FExclusiveMinimumIsStored := True;
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

procedure TOpenAPIDefinition.Schema.SetUniqueItems(const Value: System.Boolean);
begin
  FUniqueItems := Value;
  FUniqueItemsIsStored := True;
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

procedure TOpenAPIDefinition.Schema.SetType(const Value: TOpenAPIDefinition.Schema.TypeProperty);
begin
  FType := Value;
  FTypeIsStored := True;
end;

function TOpenAPIDefinition.Schema.GetNot: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema.NotProperty;
begin
  if not Assigned(FNot) then
    FNot := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema.NotProperty.Create;

  Result := FNot;
end;

function TOpenAPIDefinition.Schema.GetNotStored: Boolean;
begin
  Result := Assigned(FNot);
end;

function TOpenAPIDefinition.Schema.AddAllOf: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema.AllOfPropertyArrayItem;
begin
  Result := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema.AllOfPropertyArrayItem.Create;

  FAllOf := FAllOf + [Result];
end;

function TOpenAPIDefinition.Schema.GetAllOfStored: Boolean;
begin
  Result := Assigned(FAllOf);
end;

function TOpenAPIDefinition.Schema.AddOneOf: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema.OneOfPropertyArrayItem;
begin
  Result := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema.OneOfPropertyArrayItem.Create;

  FOneOf := FOneOf + [Result];
end;

function TOpenAPIDefinition.Schema.GetOneOfStored: Boolean;
begin
  Result := Assigned(FOneOf);
end;

function TOpenAPIDefinition.Schema.AddAnyOf: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema.AnyOfPropertyArrayItem;
begin
  Result := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema.AnyOfPropertyArrayItem.Create;

  FAnyOf := FAnyOf + [Result];
end;

function TOpenAPIDefinition.Schema.GetAnyOfStored: Boolean;
begin
  Result := Assigned(FAnyOf);
end;

function TOpenAPIDefinition.Schema.GetItems: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema.ItemsProperty;
begin
  if not Assigned(FItems) then
    FItems := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema.ItemsProperty.Create;

  Result := FItems;
end;

function TOpenAPIDefinition.Schema.GetItemsStored: Boolean;
begin
  Result := Assigned(FItems);
end;

function TOpenAPIDefinition.Schema.GetProperties: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema.PropertiesProperty;
begin
  if not Assigned(FProperties) then
    FProperties := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema.PropertiesProperty.Create;

  Result := FProperties;
end;

function TOpenAPIDefinition.Schema.GetPropertiesStored: Boolean;
begin
  Result := Assigned(FProperties);
end;

function TOpenAPIDefinition.Schema.GetAdditionalProperties: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema.AdditionalPropertiesProperty;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema.AdditionalPropertiesProperty.Create;

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

procedure TOpenAPIDefinition.Schema.SetNullable(const Value: System.Boolean);
begin
  FNullable := Value;
  FNullableIsStored := True;
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

procedure TOpenAPIDefinition.Schema.SetReadOnly(const Value: System.Boolean);
begin
  FReadOnly := Value;
  FReadOnlyIsStored := True;
end;

procedure TOpenAPIDefinition.Schema.SetWriteOnly(const Value: System.Boolean);
begin
  FWriteOnly := Value;
  FWriteOnlyIsStored := True;
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

procedure TOpenAPIDefinition.Schema.SetDeprecated(const Value: System.Boolean);
begin
  FDeprecated := Value;
  FDeprecatedIsStored := True;
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

{ TOpenAPIDefinition.Schema.NotProperty }

destructor TOpenAPIDefinition.Schema.NotProperty.Destroy;
begin
  FSchema.Free;

  FReference.Free;

  inherited;
end;

function TOpenAPIDefinition.Schema.NotProperty.GetSchema: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema.Create;

  Result := FSchema;
end;

function TOpenAPIDefinition.Schema.NotProperty.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function TOpenAPIDefinition.Schema.NotProperty.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Schema.NotProperty.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

{ TOpenAPIDefinition.Schema.AllOfPropertyArrayItem }

destructor TOpenAPIDefinition.Schema.AllOfPropertyArrayItem.Destroy;
begin
  FSchema.Free;

  FReference.Free;

  inherited;
end;

function TOpenAPIDefinition.Schema.AllOfPropertyArrayItem.GetSchema: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema.Create;

  Result := FSchema;
end;

function TOpenAPIDefinition.Schema.AllOfPropertyArrayItem.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function TOpenAPIDefinition.Schema.AllOfPropertyArrayItem.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Schema.AllOfPropertyArrayItem.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

{ TOpenAPIDefinition.Schema.OneOfPropertyArrayItem }

destructor TOpenAPIDefinition.Schema.OneOfPropertyArrayItem.Destroy;
begin
  FSchema.Free;

  FReference.Free;

  inherited;
end;

function TOpenAPIDefinition.Schema.OneOfPropertyArrayItem.GetSchema: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema.Create;

  Result := FSchema;
end;

function TOpenAPIDefinition.Schema.OneOfPropertyArrayItem.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function TOpenAPIDefinition.Schema.OneOfPropertyArrayItem.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Schema.OneOfPropertyArrayItem.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

{ TOpenAPIDefinition.Schema.AnyOfPropertyArrayItem }

destructor TOpenAPIDefinition.Schema.AnyOfPropertyArrayItem.Destroy;
begin
  FSchema.Free;

  FReference.Free;

  inherited;
end;

function TOpenAPIDefinition.Schema.AnyOfPropertyArrayItem.GetSchema: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema.Create;

  Result := FSchema;
end;

function TOpenAPIDefinition.Schema.AnyOfPropertyArrayItem.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function TOpenAPIDefinition.Schema.AnyOfPropertyArrayItem.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Schema.AnyOfPropertyArrayItem.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

{ TOpenAPIDefinition.Schema.ItemsProperty }

destructor TOpenAPIDefinition.Schema.ItemsProperty.Destroy;
begin
  FSchema.Free;

  FReference.Free;

  inherited;
end;

function TOpenAPIDefinition.Schema.ItemsProperty.GetSchema: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema.Create;

  Result := FSchema;
end;

function TOpenAPIDefinition.Schema.ItemsProperty.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function TOpenAPIDefinition.Schema.ItemsProperty.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Schema.ItemsProperty.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

{ TOpenAPIDefinition.Schema.PropertiesProperty }

destructor TOpenAPIDefinition.Schema.PropertiesProperty.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.Schema.PropertiesProperty.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Schema.PropertiesProperty.additionalPropertiesType>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema.PropertiesProperty.additionalPropertiesType>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.Schema.PropertiesProperty.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.Schema.PropertiesProperty.additionalPropertiesType }

destructor TOpenAPIDefinition.Schema.PropertiesProperty.additionalPropertiesType.Destroy;
begin
  FSchema.Free;

  FReference.Free;

  inherited;
end;

function TOpenAPIDefinition.Schema.PropertiesProperty.additionalPropertiesType.GetSchema: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema.Create;

  Result := FSchema;
end;

function TOpenAPIDefinition.Schema.PropertiesProperty.additionalPropertiesType.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function TOpenAPIDefinition.Schema.PropertiesProperty.additionalPropertiesType.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Schema.PropertiesProperty.additionalPropertiesType.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

{ TOpenAPIDefinition.Schema.AdditionalPropertiesProperty }

destructor TOpenAPIDefinition.Schema.AdditionalPropertiesProperty.Destroy;
begin
  FSchema.Free;

  FReference.Free;

  inherited;
end;

function TOpenAPIDefinition.Schema.AdditionalPropertiesProperty.GetSchema: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema.Create;

  Result := FSchema;
end;

function TOpenAPIDefinition.Schema.AdditionalPropertiesProperty.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function TOpenAPIDefinition.Schema.AdditionalPropertiesProperty.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Schema.AdditionalPropertiesProperty.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

procedure TOpenAPIDefinition.Schema.AdditionalPropertiesProperty.SetBoolean(const Value: System.Boolean);
begin
  FBoolean := Value;
  FBooleanIsStored := True;
end;

{ TOpenAPIDefinition.Discriminator }

destructor TOpenAPIDefinition.Discriminator.Destroy;
begin
  FMapping.Free;

  inherited;
end;

function TOpenAPIDefinition.Discriminator.GetMapping: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Discriminator.MappingProperty;
begin
  if not Assigned(FMapping) then
    FMapping := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Discriminator.MappingProperty.Create;

  Result := FMapping;
end;

function TOpenAPIDefinition.Discriminator.GetMappingStored: Boolean;
begin
  Result := Assigned(FMapping);
end;

{ TOpenAPIDefinition.Discriminator.MappingProperty }

destructor TOpenAPIDefinition.Discriminator.MappingProperty.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.Discriminator.MappingProperty.GetAdditionalProperties: TDynamicProperty<System.String>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<System.String>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.Discriminator.MappingProperty.GetAdditionalPropertiesStored: Boolean;
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

procedure TOpenAPIDefinition.XML.SetAttribute(const Value: System.Boolean);
begin
  FAttribute := Value;
  FAttributeIsStored := True;
end;

procedure TOpenAPIDefinition.XML.SetWrapped(const Value: System.Boolean);
begin
  FWrapped := Value;
  FWrappedIsStored := True;
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

function TOpenAPIDefinition.Response.GetHeaders: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Response.HeadersProperty;
begin
  if not Assigned(FHeaders) then
    FHeaders := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Response.HeadersProperty.Create;

  Result := FHeaders;
end;

function TOpenAPIDefinition.Response.GetHeadersStored: Boolean;
begin
  Result := Assigned(FHeaders);
end;

function TOpenAPIDefinition.Response.GetContent: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Response.ContentProperty;
begin
  if not Assigned(FContent) then
    FContent := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Response.ContentProperty.Create;

  Result := FContent;
end;

function TOpenAPIDefinition.Response.GetContentStored: Boolean;
begin
  Result := Assigned(FContent);
end;

function TOpenAPIDefinition.Response.GetLinks: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Response.LinksProperty;
begin
  if not Assigned(FLinks) then
    FLinks := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Response.LinksProperty.Create;

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

{ TOpenAPIDefinition.Response.HeadersProperty }

destructor TOpenAPIDefinition.Response.HeadersProperty.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.Response.HeadersProperty.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Response.HeadersProperty.additionalPropertiesType>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Response.HeadersProperty.additionalPropertiesType>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.Response.HeadersProperty.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.Response.HeadersProperty.additionalPropertiesType }

destructor TOpenAPIDefinition.Response.HeadersProperty.additionalPropertiesType.Destroy;
begin
  FHeader.Free;

  FReference.Free;

  inherited;
end;

function TOpenAPIDefinition.Response.HeadersProperty.additionalPropertiesType.GetHeader: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Header;
begin
  if not Assigned(FHeader) then
    FHeader := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Header.Create;

  Result := FHeader;
end;

function TOpenAPIDefinition.Response.HeadersProperty.additionalPropertiesType.GetHeaderStored: Boolean;
begin
  Result := Assigned(FHeader);
end;

function TOpenAPIDefinition.Response.HeadersProperty.additionalPropertiesType.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Response.HeadersProperty.additionalPropertiesType.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

{ TOpenAPIDefinition.Response.ContentProperty }

destructor TOpenAPIDefinition.Response.ContentProperty.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.Response.ContentProperty.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.MediaType>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.MediaType>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.Response.ContentProperty.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.Response.LinksProperty }

destructor TOpenAPIDefinition.Response.LinksProperty.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.Response.LinksProperty.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Response.LinksProperty.additionalPropertiesType>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Response.LinksProperty.additionalPropertiesType>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.Response.LinksProperty.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.Response.LinksProperty.additionalPropertiesType }

destructor TOpenAPIDefinition.Response.LinksProperty.additionalPropertiesType.Destroy;
begin
  FLink.Free;

  FReference.Free;

  inherited;
end;

function TOpenAPIDefinition.Response.LinksProperty.additionalPropertiesType.GetLink: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Link;
begin
  if not Assigned(FLink) then
    FLink := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Link.Create;

  Result := FLink;
end;

function TOpenAPIDefinition.Response.LinksProperty.additionalPropertiesType.GetLinkStored: Boolean;
begin
  Result := Assigned(FLink);
end;

function TOpenAPIDefinition.Response.LinksProperty.additionalPropertiesType.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Response.LinksProperty.additionalPropertiesType.GetReferenceStored: Boolean;
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

function TOpenAPIDefinition.MediaType.GetSchema: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.MediaType.SchemaProperty;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.MediaType.SchemaProperty.Create;

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

function TOpenAPIDefinition.MediaType.GetExamples: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.MediaType.ExamplesProperty;
begin
  if not Assigned(FExamples) then
    FExamples := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.MediaType.ExamplesProperty.Create;

  Result := FExamples;
end;

function TOpenAPIDefinition.MediaType.GetExamplesStored: Boolean;
begin
  Result := Assigned(FExamples);
end;

function TOpenAPIDefinition.MediaType.GetEncoding: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.MediaType.EncodingProperty;
begin
  if not Assigned(FEncoding) then
    FEncoding := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.MediaType.EncodingProperty.Create;

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

{ TOpenAPIDefinition.MediaType.SchemaProperty }

destructor TOpenAPIDefinition.MediaType.SchemaProperty.Destroy;
begin
  FSchema.Free;

  FReference.Free;

  inherited;
end;

function TOpenAPIDefinition.MediaType.SchemaProperty.GetSchema: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema.Create;

  Result := FSchema;
end;

function TOpenAPIDefinition.MediaType.SchemaProperty.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function TOpenAPIDefinition.MediaType.SchemaProperty.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.MediaType.SchemaProperty.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

{ TOpenAPIDefinition.MediaType.ExamplesProperty }

destructor TOpenAPIDefinition.MediaType.ExamplesProperty.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.MediaType.ExamplesProperty.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.MediaType.ExamplesProperty.additionalPropertiesType>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.MediaType.ExamplesProperty.additionalPropertiesType>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.MediaType.ExamplesProperty.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.MediaType.ExamplesProperty.additionalPropertiesType }

destructor TOpenAPIDefinition.MediaType.ExamplesProperty.additionalPropertiesType.Destroy;
begin
  FExample.Free;

  FReference.Free;

  inherited;
end;

function TOpenAPIDefinition.MediaType.ExamplesProperty.additionalPropertiesType.GetExample: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Example;
begin
  if not Assigned(FExample) then
    FExample := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Example.Create;

  Result := FExample;
end;

function TOpenAPIDefinition.MediaType.ExamplesProperty.additionalPropertiesType.GetExampleStored: Boolean;
begin
  Result := Assigned(FExample);
end;

function TOpenAPIDefinition.MediaType.ExamplesProperty.additionalPropertiesType.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.MediaType.ExamplesProperty.additionalPropertiesType.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

{ TOpenAPIDefinition.MediaType.EncodingProperty }

destructor TOpenAPIDefinition.MediaType.EncodingProperty.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.MediaType.EncodingProperty.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Encoding>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Encoding>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.MediaType.EncodingProperty.GetAdditionalPropertiesStored: Boolean;
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

procedure TOpenAPIDefinition.Header.SetRequired(const Value: System.Boolean);
begin
  FRequired := Value;
  FRequiredIsStored := True;
end;

procedure TOpenAPIDefinition.Header.SetDeprecated(const Value: System.Boolean);
begin
  FDeprecated := Value;
  FDeprecatedIsStored := True;
end;

procedure TOpenAPIDefinition.Header.SetAllowEmptyValue(const Value: System.Boolean);
begin
  FAllowEmptyValue := Value;
  FAllowEmptyValueIsStored := True;
end;

procedure TOpenAPIDefinition.Header.SetStyle(const Value: TOpenAPIDefinition.Header.StyleProperty);
begin
  FStyle := Value;
  FStyleIsStored := True;
end;

procedure TOpenAPIDefinition.Header.SetExplode(const Value: System.Boolean);
begin
  FExplode := Value;
  FExplodeIsStored := True;
end;

procedure TOpenAPIDefinition.Header.SetAllowReserved(const Value: System.Boolean);
begin
  FAllowReserved := Value;
  FAllowReservedIsStored := True;
end;

function TOpenAPIDefinition.Header.GetSchema: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Header.SchemaProperty;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Header.SchemaProperty.Create;

  Result := FSchema;
end;

function TOpenAPIDefinition.Header.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function TOpenAPIDefinition.Header.GetContent: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Header.ContentProperty;
begin
  if not Assigned(FContent) then
    FContent := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Header.ContentProperty.Create;

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

function TOpenAPIDefinition.Header.GetExamples: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Header.ExamplesProperty;
begin
  if not Assigned(FExamples) then
    FExamples := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Header.ExamplesProperty.Create;

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

{ TOpenAPIDefinition.Header.SchemaProperty }

destructor TOpenAPIDefinition.Header.SchemaProperty.Destroy;
begin
  FSchema.Free;

  FReference.Free;

  inherited;
end;

function TOpenAPIDefinition.Header.SchemaProperty.GetSchema: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema.Create;

  Result := FSchema;
end;

function TOpenAPIDefinition.Header.SchemaProperty.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function TOpenAPIDefinition.Header.SchemaProperty.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Header.SchemaProperty.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

{ TOpenAPIDefinition.Header.ContentProperty }

destructor TOpenAPIDefinition.Header.ContentProperty.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.Header.ContentProperty.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.MediaType>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.MediaType>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.Header.ContentProperty.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.Header.ExamplesProperty }

destructor TOpenAPIDefinition.Header.ExamplesProperty.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.Header.ExamplesProperty.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Header.ExamplesProperty.additionalPropertiesType>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Header.ExamplesProperty.additionalPropertiesType>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.Header.ExamplesProperty.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.Header.ExamplesProperty.additionalPropertiesType }

destructor TOpenAPIDefinition.Header.ExamplesProperty.additionalPropertiesType.Destroy;
begin
  FExample.Free;

  FReference.Free;

  inherited;
end;

function TOpenAPIDefinition.Header.ExamplesProperty.additionalPropertiesType.GetExample: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Example;
begin
  if not Assigned(FExample) then
    FExample := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Example.Create;

  Result := FExample;
end;

function TOpenAPIDefinition.Header.ExamplesProperty.additionalPropertiesType.GetExampleStored: Boolean;
begin
  Result := Assigned(FExample);
end;

function TOpenAPIDefinition.Header.ExamplesProperty.additionalPropertiesType.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Header.ExamplesProperty.additionalPropertiesType.GetReferenceStored: Boolean;
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

function TOpenAPIDefinition.PathItem.AddParameters: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.PathItem.ParametersPropertyArrayItem;
begin
  Result := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.PathItem.ParametersPropertyArrayItem.Create;

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

{ TOpenAPIDefinition.PathItem.ParametersPropertyArrayItem }

destructor TOpenAPIDefinition.PathItem.ParametersPropertyArrayItem.Destroy;
begin
  FParameter.Free;

  FReference.Free;

  inherited;
end;

function TOpenAPIDefinition.PathItem.ParametersPropertyArrayItem.GetParameter: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Parameter;
begin
  if not Assigned(FParameter) then
    FParameter := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Parameter.Create;

  Result := FParameter;
end;

function TOpenAPIDefinition.PathItem.ParametersPropertyArrayItem.GetParameterStored: Boolean;
begin
  Result := Assigned(FParameter);
end;

function TOpenAPIDefinition.PathItem.ParametersPropertyArrayItem.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.PathItem.ParametersPropertyArrayItem.GetReferenceStored: Boolean;
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

function TOpenAPIDefinition.Operation.AddParameters: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Operation.ParametersPropertyArrayItem;
begin
  Result := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Operation.ParametersPropertyArrayItem.Create;

  FParameters := FParameters + [Result];
end;

function TOpenAPIDefinition.Operation.GetParametersStored: Boolean;
begin
  Result := Assigned(FParameters);
end;

function TOpenAPIDefinition.Operation.GetRequestBody: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Operation.RequestBodyProperty;
begin
  if not Assigned(FRequestBody) then
    FRequestBody := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Operation.RequestBodyProperty.Create;

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

function TOpenAPIDefinition.Operation.GetCallbacks: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Operation.CallbacksProperty;
begin
  if not Assigned(FCallbacks) then
    FCallbacks := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Operation.CallbacksProperty.Create;

  Result := FCallbacks;
end;

function TOpenAPIDefinition.Operation.GetCallbacksStored: Boolean;
begin
  Result := Assigned(FCallbacks);
end;

procedure TOpenAPIDefinition.Operation.SetDeprecated(const Value: System.Boolean);
begin
  FDeprecated := Value;
  FDeprecatedIsStored := True;
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

{ TOpenAPIDefinition.Operation.ParametersPropertyArrayItem }

destructor TOpenAPIDefinition.Operation.ParametersPropertyArrayItem.Destroy;
begin
  FParameter.Free;

  FReference.Free;

  inherited;
end;

function TOpenAPIDefinition.Operation.ParametersPropertyArrayItem.GetParameter: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Parameter;
begin
  if not Assigned(FParameter) then
    FParameter := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Parameter.Create;

  Result := FParameter;
end;

function TOpenAPIDefinition.Operation.ParametersPropertyArrayItem.GetParameterStored: Boolean;
begin
  Result := Assigned(FParameter);
end;

function TOpenAPIDefinition.Operation.ParametersPropertyArrayItem.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Operation.ParametersPropertyArrayItem.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

{ TOpenAPIDefinition.Operation.RequestBodyProperty }

destructor TOpenAPIDefinition.Operation.RequestBodyProperty.Destroy;
begin
  FRequestBody.Free;

  FReference.Free;

  inherited;
end;

function TOpenAPIDefinition.Operation.RequestBodyProperty.GetRequestBody: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.RequestBody;
begin
  if not Assigned(FRequestBody) then
    FRequestBody := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.RequestBody.Create;

  Result := FRequestBody;
end;

function TOpenAPIDefinition.Operation.RequestBodyProperty.GetRequestBodyStored: Boolean;
begin
  Result := Assigned(FRequestBody);
end;

function TOpenAPIDefinition.Operation.RequestBodyProperty.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Operation.RequestBodyProperty.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

{ TOpenAPIDefinition.Operation.CallbacksProperty }

destructor TOpenAPIDefinition.Operation.CallbacksProperty.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.Operation.CallbacksProperty.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Operation.CallbacksProperty.additionalPropertiesType>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Operation.CallbacksProperty.additionalPropertiesType>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.Operation.CallbacksProperty.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.Operation.CallbacksProperty.additionalPropertiesType }

destructor TOpenAPIDefinition.Operation.CallbacksProperty.additionalPropertiesType.Destroy;
begin
  FCallback.Free;

  FReference.Free;

  inherited;
end;

function TOpenAPIDefinition.Operation.CallbacksProperty.additionalPropertiesType.GetCallback: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Callback;
begin
  if not Assigned(FCallback) then
    FCallback := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Callback.Create;

  Result := FCallback;
end;

function TOpenAPIDefinition.Operation.CallbacksProperty.additionalPropertiesType.GetCallbackStored: Boolean;
begin
  Result := Assigned(FCallback);
end;

function TOpenAPIDefinition.Operation.CallbacksProperty.additionalPropertiesType.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Operation.CallbacksProperty.additionalPropertiesType.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

{ TOpenAPIDefinition.Responses }

destructor TOpenAPIDefinition.Responses.Destroy;
begin
  FDefault.Free;

  FPatternPropertyElement.Free;

  FPatternProperty2.Free;

  inherited;
end;

function TOpenAPIDefinition.Responses.GetDefault: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Responses.DefaultProperty;
begin
  if not Assigned(FDefault) then
    FDefault := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Responses.DefaultProperty.Create;

  Result := FDefault;
end;

function TOpenAPIDefinition.Responses.GetDefaultStored: Boolean;
begin
  Result := Assigned(FDefault);
end;

function TOpenAPIDefinition.Responses.GetPatternPropertyElement: TDynamicProperty<TOpenAPIDefinition.Responses.PatternProperty>;
begin
  if not Assigned(FPatternPropertyElement) then
    FPatternPropertyElement := TDynamicProperty<Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Responses.PatternProperty>.Create;

  Result := FPatternPropertyElement;
end;

function TOpenAPIDefinition.Responses.GetPatternPropertyStored: Boolean;
begin
  Result := Assigned(FPatternPropertyElement);
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

{ TOpenAPIDefinition.Responses.DefaultProperty }

destructor TOpenAPIDefinition.Responses.DefaultProperty.Destroy;
begin
  FResponse.Free;

  FReference.Free;

  inherited;
end;

function TOpenAPIDefinition.Responses.DefaultProperty.GetResponse: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Response;
begin
  if not Assigned(FResponse) then
    FResponse := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Response.Create;

  Result := FResponse;
end;

function TOpenAPIDefinition.Responses.DefaultProperty.GetResponseStored: Boolean;
begin
  Result := Assigned(FResponse);
end;

function TOpenAPIDefinition.Responses.DefaultProperty.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Responses.DefaultProperty.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

{ TOpenAPIDefinition.Responses.PatternProperty }

destructor TOpenAPIDefinition.Responses.PatternProperty.Destroy;
begin
  FResponse.Free;

  FReference.Free;

  inherited;
end;

function TOpenAPIDefinition.Responses.PatternProperty.GetResponse: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Response;
begin
  if not Assigned(FResponse) then
    FResponse := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Response.Create;

  Result := FResponse;
end;

function TOpenAPIDefinition.Responses.PatternProperty.GetResponseStored: Boolean;
begin
  Result := Assigned(FResponse);
end;

function TOpenAPIDefinition.Responses.PatternProperty.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Responses.PatternProperty.GetReferenceStored: Boolean;
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

procedure TOpenAPIDefinition.Parameter.SetRequired(const Value: System.Boolean);
begin
  FRequired := Value;
  FRequiredIsStored := True;
end;

procedure TOpenAPIDefinition.Parameter.SetDeprecated(const Value: System.Boolean);
begin
  FDeprecated := Value;
  FDeprecatedIsStored := True;
end;

procedure TOpenAPIDefinition.Parameter.SetAllowEmptyValue(const Value: System.Boolean);
begin
  FAllowEmptyValue := Value;
  FAllowEmptyValueIsStored := True;
end;

function TOpenAPIDefinition.Parameter.GetStyleStored: Boolean;
begin
  Result := not FStyle.IsEmpty;
end;

procedure TOpenAPIDefinition.Parameter.SetExplode(const Value: System.Boolean);
begin
  FExplode := Value;
  FExplodeIsStored := True;
end;

procedure TOpenAPIDefinition.Parameter.SetAllowReserved(const Value: System.Boolean);
begin
  FAllowReserved := Value;
  FAllowReservedIsStored := True;
end;

function TOpenAPIDefinition.Parameter.GetSchema: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Parameter.SchemaProperty;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Parameter.SchemaProperty.Create;

  Result := FSchema;
end;

function TOpenAPIDefinition.Parameter.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function TOpenAPIDefinition.Parameter.GetContent: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Parameter.ContentProperty;
begin
  if not Assigned(FContent) then
    FContent := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Parameter.ContentProperty.Create;

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

function TOpenAPIDefinition.Parameter.GetExamples: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Parameter.ExamplesProperty;
begin
  if not Assigned(FExamples) then
    FExamples := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Parameter.ExamplesProperty.Create;

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

{ TOpenAPIDefinition.Parameter.SchemaProperty }

destructor TOpenAPIDefinition.Parameter.SchemaProperty.Destroy;
begin
  FSchema.Free;

  FReference.Free;

  inherited;
end;

function TOpenAPIDefinition.Parameter.SchemaProperty.GetSchema: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Schema.Create;

  Result := FSchema;
end;

function TOpenAPIDefinition.Parameter.SchemaProperty.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function TOpenAPIDefinition.Parameter.SchemaProperty.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Parameter.SchemaProperty.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

{ TOpenAPIDefinition.Parameter.ContentProperty }

destructor TOpenAPIDefinition.Parameter.ContentProperty.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.Parameter.ContentProperty.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.MediaType>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.MediaType>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.Parameter.ContentProperty.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.Parameter.ExamplesProperty }

destructor TOpenAPIDefinition.Parameter.ExamplesProperty.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.Parameter.ExamplesProperty.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Parameter.ExamplesProperty.additionalPropertiesType>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Parameter.ExamplesProperty.additionalPropertiesType>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.Parameter.ExamplesProperty.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.Parameter.ExamplesProperty.additionalPropertiesType }

destructor TOpenAPIDefinition.Parameter.ExamplesProperty.additionalPropertiesType.Destroy;
begin
  FExample.Free;

  FReference.Free;

  inherited;
end;

function TOpenAPIDefinition.Parameter.ExamplesProperty.additionalPropertiesType.GetExample: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Example;
begin
  if not Assigned(FExample) then
    FExample := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Example.Create;

  Result := FExample;
end;

function TOpenAPIDefinition.Parameter.ExamplesProperty.additionalPropertiesType.GetExampleStored: Boolean;
begin
  Result := Assigned(FExample);
end;

function TOpenAPIDefinition.Parameter.ExamplesProperty.additionalPropertiesType.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Parameter.ExamplesProperty.additionalPropertiesType.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

{ TOpenAPIDefinition.PathParameter }

procedure TOpenAPIDefinition.PathParameter.SetIn(const Value: TOpenAPIDefinition.PathParameter.InProperty);
begin
  FIn := Value;
  FInIsStored := True;
end;

procedure TOpenAPIDefinition.PathParameter.SetStyle(const Value: TOpenAPIDefinition.PathParameter.StyleProperty);
begin
  FStyle := Value;
  FStyleIsStored := True;
end;

{ TOpenAPIDefinition.QueryParameter }

procedure TOpenAPIDefinition.QueryParameter.SetIn(const Value: TOpenAPIDefinition.QueryParameter.InProperty);
begin
  FIn := Value;
  FInIsStored := True;
end;

procedure TOpenAPIDefinition.QueryParameter.SetStyle(const Value: TOpenAPIDefinition.QueryParameter.StyleProperty);
begin
  FStyle := Value;
  FStyleIsStored := True;
end;

{ TOpenAPIDefinition.HeaderParameter }

procedure TOpenAPIDefinition.HeaderParameter.SetIn(const Value: TOpenAPIDefinition.HeaderParameter.InProperty);
begin
  FIn := Value;
  FInIsStored := True;
end;

procedure TOpenAPIDefinition.HeaderParameter.SetStyle(const Value: TOpenAPIDefinition.HeaderParameter.StyleProperty);
begin
  FStyle := Value;
  FStyleIsStored := True;
end;

{ TOpenAPIDefinition.CookieParameter }

procedure TOpenAPIDefinition.CookieParameter.SetIn(const Value: TOpenAPIDefinition.CookieParameter.InProperty);
begin
  FIn := Value;
  FInIsStored := True;
end;

procedure TOpenAPIDefinition.CookieParameter.SetStyle(const Value: TOpenAPIDefinition.CookieParameter.StyleProperty);
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

function TOpenAPIDefinition.RequestBody.GetContent: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.RequestBody.ContentProperty;
begin
  if not Assigned(FContent) then
    FContent := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.RequestBody.ContentProperty.Create;

  Result := FContent;
end;

procedure TOpenAPIDefinition.RequestBody.SetRequired(const Value: System.Boolean);
begin
  FRequired := Value;
  FRequiredIsStored := True;
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

{ TOpenAPIDefinition.RequestBody.ContentProperty }

destructor TOpenAPIDefinition.RequestBody.ContentProperty.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.RequestBody.ContentProperty.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.MediaType>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.MediaType>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.RequestBody.ContentProperty.GetAdditionalPropertiesStored: Boolean;
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

function TOpenAPIDefinition.ImplicitOAuthFlow.GetScopes: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.ImplicitOAuthFlow.ScopesProperty;
begin
  if not Assigned(FScopes) then
    FScopes := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.ImplicitOAuthFlow.ScopesProperty.Create;

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

{ TOpenAPIDefinition.ImplicitOAuthFlow.ScopesProperty }

destructor TOpenAPIDefinition.ImplicitOAuthFlow.ScopesProperty.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.ImplicitOAuthFlow.ScopesProperty.GetAdditionalProperties: TDynamicProperty<System.String>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<System.String>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.ImplicitOAuthFlow.ScopesProperty.GetAdditionalPropertiesStored: Boolean;
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

function TOpenAPIDefinition.PasswordOAuthFlow.GetScopes: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.PasswordOAuthFlow.ScopesProperty;
begin
  if not Assigned(FScopes) then
    FScopes := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.PasswordOAuthFlow.ScopesProperty.Create;

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

{ TOpenAPIDefinition.PasswordOAuthFlow.ScopesProperty }

destructor TOpenAPIDefinition.PasswordOAuthFlow.ScopesProperty.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.PasswordOAuthFlow.ScopesProperty.GetAdditionalProperties: TDynamicProperty<System.String>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<System.String>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.PasswordOAuthFlow.ScopesProperty.GetAdditionalPropertiesStored: Boolean;
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

function TOpenAPIDefinition.ClientCredentialsFlow.GetScopes: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.ClientCredentialsFlow.ScopesProperty;
begin
  if not Assigned(FScopes) then
    FScopes := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.ClientCredentialsFlow.ScopesProperty.Create;

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

{ TOpenAPIDefinition.ClientCredentialsFlow.ScopesProperty }

destructor TOpenAPIDefinition.ClientCredentialsFlow.ScopesProperty.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.ClientCredentialsFlow.ScopesProperty.GetAdditionalProperties: TDynamicProperty<System.String>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<System.String>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.ClientCredentialsFlow.ScopesProperty.GetAdditionalPropertiesStored: Boolean;
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

function TOpenAPIDefinition.AuthorizationCodeOAuthFlow.GetScopes: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.AuthorizationCodeOAuthFlow.ScopesProperty;
begin
  if not Assigned(FScopes) then
    FScopes := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.AuthorizationCodeOAuthFlow.ScopesProperty.Create;

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

{ TOpenAPIDefinition.AuthorizationCodeOAuthFlow.ScopesProperty }

destructor TOpenAPIDefinition.AuthorizationCodeOAuthFlow.ScopesProperty.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.AuthorizationCodeOAuthFlow.ScopesProperty.GetAdditionalProperties: TDynamicProperty<System.String>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<System.String>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.AuthorizationCodeOAuthFlow.ScopesProperty.GetAdditionalPropertiesStored: Boolean;
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

function TOpenAPIDefinition.Link.GetParameters: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Link.ParametersProperty;
begin
  if not Assigned(FParameters) then
    FParameters := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Link.ParametersProperty.Create;

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

{ TOpenAPIDefinition.Link.ParametersProperty }

destructor TOpenAPIDefinition.Link.ParametersProperty.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.Link.ParametersProperty.GetAdditionalProperties: TDynamicProperty<any>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.Link.ParametersProperty.GetAdditionalPropertiesStored: Boolean;
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

function TOpenAPIDefinition.Encoding.GetHeaders: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Encoding.HeadersProperty;
begin
  if not Assigned(FHeaders) then
    FHeaders := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Encoding.HeadersProperty.Create;

  Result := FHeaders;
end;

function TOpenAPIDefinition.Encoding.GetHeadersStored: Boolean;
begin
  Result := Assigned(FHeaders);
end;

procedure TOpenAPIDefinition.Encoding.SetStyle(const Value: TOpenAPIDefinition.Encoding.StyleProperty);
begin
  FStyle := Value;
  FStyleIsStored := True;
end;

procedure TOpenAPIDefinition.Encoding.SetExplode(const Value: System.Boolean);
begin
  FExplode := Value;
  FExplodeIsStored := True;
end;

procedure TOpenAPIDefinition.Encoding.SetAllowReserved(const Value: System.Boolean);
begin
  FAllowReserved := Value;
  FAllowReservedIsStored := True;
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

{ TOpenAPIDefinition.Encoding.HeadersProperty }

destructor TOpenAPIDefinition.Encoding.HeadersProperty.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.Encoding.HeadersProperty.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.Encoding.HeadersProperty.additionalPropertiesType>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Encoding.HeadersProperty.additionalPropertiesType>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.Encoding.HeadersProperty.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.Encoding.HeadersProperty.additionalPropertiesType }

destructor TOpenAPIDefinition.Encoding.HeadersProperty.additionalPropertiesType.Destroy;
begin
  FHeader.Free;

  FReference.Free;

  inherited;
end;

function TOpenAPIDefinition.Encoding.HeadersProperty.additionalPropertiesType.GetHeader: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Header;
begin
  if not Assigned(FHeader) then
    FHeader := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Header.Create;

  Result := FHeader;
end;

function TOpenAPIDefinition.Encoding.HeadersProperty.additionalPropertiesType.GetHeaderStored: Boolean;
begin
  Result := Assigned(FHeader);
end;

function TOpenAPIDefinition.Encoding.HeadersProperty.additionalPropertiesType.GetReference: Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v30.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.Encoding.HeadersProperty.additionalPropertiesType.GetReferenceStored: Boolean;
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
