unit Blue.Print.Open.API.Schema.v32;

interface

{$M+}
{$SCOPEDENUMS ON}

// File generated from https://spec.openapis.org/oas/3.2/schema/2025-11-23;

uses Blue.Print.Types, Blue.Print.JSON.Draft2022.Schema, System.Rtti;

type
  // Forward class declaration
  TOpenAPIDefinition = class;

  // Types alias
  any = System.Rtti.TValue;

  TOpenAPIDefinition = class
  public type
    // Forward class declaration
    TOpenAPIDefinition = class;

    [Flat]
    TOpenAPIDefinition = class
    public type
      // Forward class declaration
      TWebhooks = class;
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
      ParameterOrReference = class;
      RequestBody = class;
      RequestBodyOrReference = class;
      Content = class;
      MediaType = class;
      MediaTypeOrReference = class;
      Encoding = class;
      Responses = class;
      Response = class;
      ResponseOrReference = class;
      Callbacks = class;
      CallbacksOrReference = class;
      Example = class;
      ExampleOrReference = class;
      Link = class;
      LinkOrReference = class;
      Header = class;
      HeaderOrReference = class;
      Tag = class;
      Reference = class;
      Schema = class;
      SecurityScheme = class;
      SecuritySchemeOrReference = class;
      OauthFlows = class;
      SecurityRequirement = class;
      SpecificationExtensions = class;
      Examples = class;
      MapOfStrings = class;
      ExplodeForForm = class;

      // Types alias
      parameters = TArray<Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.ParameterOrReference>;

      TWebhooks = class
      private
        FAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.PathItem>;

        function GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.PathItem>;
        function GetAdditionalPropertiesStored: Boolean;
      public
        destructor Destroy; override;

        property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
      published
        property additionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.PathItem> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
      end;

      Info = class
      private
        FTitle: System.String;
        FSummary: System.String;
        FDescription: System.String;
        FTermsOfService: System.String;
        FContact: TOpenAPIDefinition.TOpenAPIDefinition.Contact;
        FLicense: TOpenAPIDefinition.TOpenAPIDefinition.License;
        FVersion: System.String;

        function GetContact: TOpenAPIDefinition.TOpenAPIDefinition.Contact;
        function GetLicense: TOpenAPIDefinition.TOpenAPIDefinition.License;
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
        property contact: TOpenAPIDefinition.TOpenAPIDefinition.Contact read GetContact write FContact stored GetContactStored;
        property license: TOpenAPIDefinition.TOpenAPIDefinition.License read GetLicense write FLicense stored GetLicenseStored;
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
        // Forward class declaration
        TVariables = class;

        TVariables = class
        private
          FAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.ServerVariable>;

          function GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.ServerVariable>;
          function GetAdditionalPropertiesStored: Boolean;
        public
          destructor Destroy; override;

          property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
        published
          property additionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.ServerVariable> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
        end;
      private
        FUrl: System.String;
        FDescription: System.String;
        FName: System.String;
        FVariables: TOpenAPIDefinition.TOpenAPIDefinition.Server.TVariables;

        function GetVariables: TOpenAPIDefinition.TOpenAPIDefinition.Server.TVariables;
        function GetDescriptionStored: Boolean;
        function GetNameStored: Boolean;
        function GetVariablesStored: Boolean;
      public
        destructor Destroy; override;

        property IsDescriptionStored: Boolean read GetDescriptionStored;
        property IsNameStored: Boolean read GetNameStored;
        property IsVariablesStored: Boolean read GetVariablesStored;
      published
        property url: System.String read FUrl write FUrl;
        property description: System.String read FDescription write FDescription stored GetDescriptionStored;
        property name: System.String read FName write FName stored GetNameStored;
        property variables: TOpenAPIDefinition.TOpenAPIDefinition.Server.TVariables read GetVariables write FVariables stored GetVariablesStored;
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
        TPathItems = class;
        TMediaTypes = class;

        TSchemas = class
        private
          FAdditionalProperties: TDynamicProperty<TOpenAPIDefinition>;

          function GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition>;
          function GetAdditionalPropertiesStored: Boolean;
        public
          destructor Destroy; override;

          property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
        published
          property additionalProperties: TDynamicProperty<TOpenAPIDefinition> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
        end;

        TResponses = class
        private
          FAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.ResponseOrReference>;

          function GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.ResponseOrReference>;
          function GetAdditionalPropertiesStored: Boolean;
        public
          destructor Destroy; override;

          property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
        published
          property additionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.ResponseOrReference> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
        end;

        TParameters = class
        private
          FAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.ParameterOrReference>;

          function GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.ParameterOrReference>;
          function GetAdditionalPropertiesStored: Boolean;
        public
          destructor Destroy; override;

          property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
        published
          property additionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.ParameterOrReference> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
        end;

        TExamples = class
        private
          FAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.ExampleOrReference>;

          function GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.ExampleOrReference>;
          function GetAdditionalPropertiesStored: Boolean;
        public
          destructor Destroy; override;

          property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
        published
          property additionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.ExampleOrReference> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
        end;

        TRequestBodies = class
        private
          FAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.RequestBodyOrReference>;

          function GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.RequestBodyOrReference>;
          function GetAdditionalPropertiesStored: Boolean;
        public
          destructor Destroy; override;

          property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
        published
          property additionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.RequestBodyOrReference> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
        end;

        THeaders = class
        private
          FAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.HeaderOrReference>;

          function GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.HeaderOrReference>;
          function GetAdditionalPropertiesStored: Boolean;
        public
          destructor Destroy; override;

          property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
        published
          property additionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.HeaderOrReference> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
        end;

        TSecuritySchemes = class
        private
          FAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.SecuritySchemeOrReference>;

          function GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.SecuritySchemeOrReference>;
          function GetAdditionalPropertiesStored: Boolean;
        public
          destructor Destroy; override;

          property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
        published
          property additionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.SecuritySchemeOrReference> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
        end;

        TLinks = class
        private
          FAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.LinkOrReference>;

          function GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.LinkOrReference>;
          function GetAdditionalPropertiesStored: Boolean;
        public
          destructor Destroy; override;

          property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
        published
          property additionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.LinkOrReference> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
        end;

        TCallbacks = class
        private
          FAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.CallbacksOrReference>;

          function GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.CallbacksOrReference>;
          function GetAdditionalPropertiesStored: Boolean;
        public
          destructor Destroy; override;

          property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
        published
          property additionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.CallbacksOrReference> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
        end;

        TPathItems = class
        private
          FAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.PathItem>;

          function GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.PathItem>;
          function GetAdditionalPropertiesStored: Boolean;
        public
          destructor Destroy; override;

          property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
        published
          property additionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.PathItem> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
        end;

        TMediaTypes = class
        private
          FAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.MediaTypeOrReference>;

          function GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.MediaTypeOrReference>;
          function GetAdditionalPropertiesStored: Boolean;
        public
          destructor Destroy; override;

          property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
        published
          property additionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.MediaTypeOrReference> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
        end;
      private
        FSchemas: TOpenAPIDefinition.TOpenAPIDefinition.Components.TSchemas;
        FResponses: TOpenAPIDefinition.TOpenAPIDefinition.Components.TResponses;
        FParameters: TOpenAPIDefinition.TOpenAPIDefinition.Components.TParameters;
        FExamples: TOpenAPIDefinition.TOpenAPIDefinition.Components.TExamples;
        FRequestBodies: TOpenAPIDefinition.TOpenAPIDefinition.Components.TRequestBodies;
        FHeaders: TOpenAPIDefinition.TOpenAPIDefinition.Components.THeaders;
        FSecuritySchemes: TOpenAPIDefinition.TOpenAPIDefinition.Components.TSecuritySchemes;
        FLinks: TOpenAPIDefinition.TOpenAPIDefinition.Components.TLinks;
        FCallbacks: TOpenAPIDefinition.TOpenAPIDefinition.Components.TCallbacks;
        FPathItems: TOpenAPIDefinition.TOpenAPIDefinition.Components.TPathItems;
        FMediaTypes: TOpenAPIDefinition.TOpenAPIDefinition.Components.TMediaTypes;
        FPatternProperty: TDynamicProperty<any>;

        function GetSchemas: TOpenAPIDefinition.TOpenAPIDefinition.Components.TSchemas;
        function GetResponses: TOpenAPIDefinition.TOpenAPIDefinition.Components.TResponses;
        function GetParameters: TOpenAPIDefinition.TOpenAPIDefinition.Components.TParameters;
        function GetExamples: TOpenAPIDefinition.TOpenAPIDefinition.Components.TExamples;
        function GetRequestBodies: TOpenAPIDefinition.TOpenAPIDefinition.Components.TRequestBodies;
        function GetHeaders: TOpenAPIDefinition.TOpenAPIDefinition.Components.THeaders;
        function GetSecuritySchemes: TOpenAPIDefinition.TOpenAPIDefinition.Components.TSecuritySchemes;
        function GetLinks: TOpenAPIDefinition.TOpenAPIDefinition.Components.TLinks;
        function GetCallbacks: TOpenAPIDefinition.TOpenAPIDefinition.Components.TCallbacks;
        function GetPathItems: TOpenAPIDefinition.TOpenAPIDefinition.Components.TPathItems;
        function GetMediaTypes: TOpenAPIDefinition.TOpenAPIDefinition.Components.TMediaTypes;
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
        function GetPathItemsStored: Boolean;
        function GetMediaTypesStored: Boolean;
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
        property IsPathItemsStored: Boolean read GetPathItemsStored;
        property IsMediaTypesStored: Boolean read GetMediaTypesStored;
        property IsPatternPropertyStored: Boolean read GetPatternPropertyStored;
      published
        property schemas: TOpenAPIDefinition.TOpenAPIDefinition.Components.TSchemas read GetSchemas write FSchemas stored GetSchemasStored;
        property responses: TOpenAPIDefinition.TOpenAPIDefinition.Components.TResponses read GetResponses write FResponses stored GetResponsesStored;
        property parameters: TOpenAPIDefinition.TOpenAPIDefinition.Components.TParameters read GetParameters write FParameters stored GetParametersStored;
        property examples: TOpenAPIDefinition.TOpenAPIDefinition.Components.TExamples read GetExamples write FExamples stored GetExamplesStored;
        property requestBodies: TOpenAPIDefinition.TOpenAPIDefinition.Components.TRequestBodies read GetRequestBodies write FRequestBodies stored GetRequestBodiesStored;
        property headers: TOpenAPIDefinition.TOpenAPIDefinition.Components.THeaders read GetHeaders write FHeaders stored GetHeadersStored;
        property securitySchemes: TOpenAPIDefinition.TOpenAPIDefinition.Components.TSecuritySchemes read GetSecuritySchemes write FSecuritySchemes stored GetSecuritySchemesStored;
        property links: TOpenAPIDefinition.TOpenAPIDefinition.Components.TLinks read GetLinks write FLinks stored GetLinksStored;
        property callbacks: TOpenAPIDefinition.TOpenAPIDefinition.Components.TCallbacks read GetCallbacks write FCallbacks stored GetCallbacksStored;
        property pathItems: TOpenAPIDefinition.TOpenAPIDefinition.Components.TPathItems read GetPathItems write FPathItems stored GetPathItemsStored;
        property mediaTypes: TOpenAPIDefinition.TOpenAPIDefinition.Components.TMediaTypes read GetMediaTypes write FMediaTypes stored GetMediaTypesStored;
        [PatternProperty('^(?:schemas|responses|parameters|examples|requestBodies|headers|securitySchemes|links|callbacks|pathItems|mediaTypes)$')]
        property PatternProperty: TDynamicProperty<any> read GetPatternProperty write FPatternProperty stored GetPatternPropertyStored;
      end;

      Paths = class
      private
        FPathItem: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.PathItem>;

        function GetPathItem: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.PathItem>;
        function GetPathItemStored: Boolean;
      public
        destructor Destroy; override;

        property IsPathItemStored: Boolean read GetPathItemStored;
      published
        [PatternProperty('^/')]
        [FieldName('path-item')]
        property pathItem: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.PathItem> read GetPathItem write FPathItem stored GetPathItemStored;
      end;

      PathItem = class
      public type
        // Forward class declaration
        TAdditionalOperations = class;

        TAdditionalOperations = class
        private
          FAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.Operation>;

          function GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.Operation>;
          function GetAdditionalPropertiesStored: Boolean;
        public
          destructor Destroy; override;

          property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
        published
          property additionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.Operation> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
        end;
      private
        FRef: System.String;
        FSummary: System.String;
        FDescription: System.String;
        FServers: TArray<TOpenAPIDefinition.TOpenAPIDefinition.Server>;
        FParameters: TOpenAPIDefinition.TOpenAPIDefinition.parameters;
        FAdditionalOperations: TOpenAPIDefinition.TOpenAPIDefinition.PathItem.TAdditionalOperations;
        FGet: TOpenAPIDefinition.TOpenAPIDefinition.Operation;
        FPut: TOpenAPIDefinition.TOpenAPIDefinition.Operation;
        FPost: TOpenAPIDefinition.TOpenAPIDefinition.Operation;
        FDelete: TOpenAPIDefinition.TOpenAPIDefinition.Operation;
        FOptions: TOpenAPIDefinition.TOpenAPIDefinition.Operation;
        FHead: TOpenAPIDefinition.TOpenAPIDefinition.Operation;
        FPatch: TOpenAPIDefinition.TOpenAPIDefinition.Operation;
        FTrace: TOpenAPIDefinition.TOpenAPIDefinition.Operation;
        FQuery: TOpenAPIDefinition.TOpenAPIDefinition.Operation;

        function GetAdditionalOperations: TOpenAPIDefinition.TOpenAPIDefinition.PathItem.TAdditionalOperations;
        function GetGet: TOpenAPIDefinition.TOpenAPIDefinition.Operation;
        function GetPut: TOpenAPIDefinition.TOpenAPIDefinition.Operation;
        function GetPost: TOpenAPIDefinition.TOpenAPIDefinition.Operation;
        function GetDelete: TOpenAPIDefinition.TOpenAPIDefinition.Operation;
        function GetOptions: TOpenAPIDefinition.TOpenAPIDefinition.Operation;
        function GetHead: TOpenAPIDefinition.TOpenAPIDefinition.Operation;
        function GetPatch: TOpenAPIDefinition.TOpenAPIDefinition.Operation;
        function GetTrace: TOpenAPIDefinition.TOpenAPIDefinition.Operation;
        function GetQuery: TOpenAPIDefinition.TOpenAPIDefinition.Operation;
        function GetRefStored: Boolean;
        function GetSummaryStored: Boolean;
        function GetDescriptionStored: Boolean;
        function GetServersStored: Boolean;
        function GetParametersStored: Boolean;
        function GetAdditionalOperationsStored: Boolean;
        function GetGetStored: Boolean;
        function GetPutStored: Boolean;
        function GetPostStored: Boolean;
        function GetDeleteStored: Boolean;
        function GetOptionsStored: Boolean;
        function GetHeadStored: Boolean;
        function GetPatchStored: Boolean;
        function GetTraceStored: Boolean;
        function GetQueryStored: Boolean;
      public
        destructor Destroy; override;

        function AddServers: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Server;
        function AddParameters: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.ParameterOrReference;

        property IsRefStored: Boolean read GetRefStored;
        property IsSummaryStored: Boolean read GetSummaryStored;
        property IsDescriptionStored: Boolean read GetDescriptionStored;
        property IsServersStored: Boolean read GetServersStored;
        property IsParametersStored: Boolean read GetParametersStored;
        property IsAdditionalOperationsStored: Boolean read GetAdditionalOperationsStored;
        property IsGetStored: Boolean read GetGetStored;
        property IsPutStored: Boolean read GetPutStored;
        property IsPostStored: Boolean read GetPostStored;
        property IsDeleteStored: Boolean read GetDeleteStored;
        property IsOptionsStored: Boolean read GetOptionsStored;
        property IsHeadStored: Boolean read GetHeadStored;
        property IsPatchStored: Boolean read GetPatchStored;
        property IsTraceStored: Boolean read GetTraceStored;
        property IsQueryStored: Boolean read GetQueryStored;
      published
        [FieldName('$ref')]
        property Ref: System.String read FRef write FRef stored GetRefStored;
        property summary: System.String read FSummary write FSummary stored GetSummaryStored;
        property description: System.String read FDescription write FDescription stored GetDescriptionStored;
        property servers: TArray<TOpenAPIDefinition.TOpenAPIDefinition.Server> read FServers write FServers stored GetServersStored;
        property parameters: TOpenAPIDefinition.TOpenAPIDefinition.parameters read FParameters write FParameters stored GetParametersStored;
        property additionalOperations: TOpenAPIDefinition.TOpenAPIDefinition.PathItem.TAdditionalOperations read GetAdditionalOperations write FAdditionalOperations stored GetAdditionalOperationsStored;
        property get: TOpenAPIDefinition.TOpenAPIDefinition.Operation read GetGet write FGet stored GetGetStored;
        property put: TOpenAPIDefinition.TOpenAPIDefinition.Operation read GetPut write FPut stored GetPutStored;
        property post: TOpenAPIDefinition.TOpenAPIDefinition.Operation read GetPost write FPost stored GetPostStored;
        property delete: TOpenAPIDefinition.TOpenAPIDefinition.Operation read GetDelete write FDelete stored GetDeleteStored;
        property options: TOpenAPIDefinition.TOpenAPIDefinition.Operation read GetOptions write FOptions stored GetOptionsStored;
        property head: TOpenAPIDefinition.TOpenAPIDefinition.Operation read GetHead write FHead stored GetHeadStored;
        property patch: TOpenAPIDefinition.TOpenAPIDefinition.Operation read GetPatch write FPatch stored GetPatchStored;
        property trace: TOpenAPIDefinition.TOpenAPIDefinition.Operation read GetTrace write FTrace stored GetTraceStored;
        property query: TOpenAPIDefinition.TOpenAPIDefinition.Operation read GetQuery write FQuery stored GetQueryStored;
      end;

      Operation = class
      public type
        // Forward class declaration
        TCallbacks = class;

        TCallbacks = class
        private
          FAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.CallbacksOrReference>;

          function GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.CallbacksOrReference>;
          function GetAdditionalPropertiesStored: Boolean;
        public
          destructor Destroy; override;

          property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
        published
          property additionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.CallbacksOrReference> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
        end;
      private
        FTags: TArray<System.String>;
        FSummary: System.String;
        FDescription: System.String;
        FExternalDocs: TOpenAPIDefinition.TOpenAPIDefinition.ExternalDocumentation;
        FOperationId: System.String;
        FParameters: TOpenAPIDefinition.TOpenAPIDefinition.parameters;
        FRequestBody: TOpenAPIDefinition.TOpenAPIDefinition.RequestBodyOrReference;
        FResponses: TOpenAPIDefinition.TOpenAPIDefinition.Responses;
        FCallbacks: TOpenAPIDefinition.TOpenAPIDefinition.Operation.TCallbacks;
        FDeprecated: System.Boolean;
        FSecurity: TArray<TOpenAPIDefinition.TOpenAPIDefinition.SecurityRequirement>;
        FServers: TArray<TOpenAPIDefinition.TOpenAPIDefinition.Server>;

        function GetExternalDocs: TOpenAPIDefinition.TOpenAPIDefinition.ExternalDocumentation;
        function GetRequestBody: TOpenAPIDefinition.TOpenAPIDefinition.RequestBodyOrReference;
        function GetResponses: TOpenAPIDefinition.TOpenAPIDefinition.Responses;
        function GetCallbacks: TOpenAPIDefinition.TOpenAPIDefinition.Operation.TCallbacks;
        function GetTagsStored: Boolean;
        function GetSummaryStored: Boolean;
        function GetDescriptionStored: Boolean;
        function GetExternalDocsStored: Boolean;
        function GetOperationIdStored: Boolean;
        function GetParametersStored: Boolean;
        function GetRequestBodyStored: Boolean;
        function GetResponsesStored: Boolean;
        function GetCallbacksStored: Boolean;
        function GetDeprecatedStored: Boolean;
        function GetSecurityStored: Boolean;
        function GetServersStored: Boolean;
      public
        destructor Destroy; override;

        function AddParameters: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.ParameterOrReference;
        function AddSecurity: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.SecurityRequirement;
        function AddServers: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Server;

        property IsTagsStored: Boolean read GetTagsStored;
        property IsSummaryStored: Boolean read GetSummaryStored;
        property IsDescriptionStored: Boolean read GetDescriptionStored;
        property IsExternalDocsStored: Boolean read GetExternalDocsStored;
        property IsOperationIdStored: Boolean read GetOperationIdStored;
        property IsParametersStored: Boolean read GetParametersStored;
        property IsRequestBodyStored: Boolean read GetRequestBodyStored;
        property IsResponsesStored: Boolean read GetResponsesStored;
        property IsCallbacksStored: Boolean read GetCallbacksStored;
        property IsDeprecatedStored: Boolean read GetDeprecatedStored;
        property IsSecurityStored: Boolean read GetSecurityStored;
        property IsServersStored: Boolean read GetServersStored;
      published
        property tags: TArray<System.String> read FTags write FTags stored GetTagsStored;
        property summary: System.String read FSummary write FSummary stored GetSummaryStored;
        property description: System.String read FDescription write FDescription stored GetDescriptionStored;
        property externalDocs: TOpenAPIDefinition.TOpenAPIDefinition.ExternalDocumentation read GetExternalDocs write FExternalDocs stored GetExternalDocsStored;
        property operationId: System.String read FOperationId write FOperationId stored GetOperationIdStored;
        property parameters: TOpenAPIDefinition.TOpenAPIDefinition.parameters read FParameters write FParameters stored GetParametersStored;
        property requestBody: TOpenAPIDefinition.TOpenAPIDefinition.RequestBodyOrReference read GetRequestBody write FRequestBody stored GetRequestBodyStored;
        property responses: TOpenAPIDefinition.TOpenAPIDefinition.Responses read GetResponses write FResponses stored GetResponsesStored;
        property callbacks: TOpenAPIDefinition.TOpenAPIDefinition.Operation.TCallbacks read GetCallbacks write FCallbacks stored GetCallbacksStored;
        property deprecated: System.Boolean read FDeprecated write FDeprecated stored GetDeprecatedStored;
        property security: TArray<TOpenAPIDefinition.TOpenAPIDefinition.SecurityRequirement> read FSecurity write FSecurity stored GetSecurityStored;
        property servers: TArray<TOpenAPIDefinition.TOpenAPIDefinition.Server> read FServers write FServers stored GetServersStored;
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
        TIn = (query, querystring, header, path, cookie);
      private
        FName: System.String;
        FIn: TOpenAPIDefinition.TOpenAPIDefinition.Parameter.TIn;
        FDescription: System.String;
        FRequired: System.Boolean;
        FDeprecated: System.Boolean;
        FSchema: TOpenAPIDefinition;
        FContent: TOpenAPIDefinition.TOpenAPIDefinition.Content;
        FExamples: TArray<Blue.Print.JSON.Draft2022.Schema.any>;
        FSpecificationExtensions: TOpenAPIDefinition.TOpenAPIDefinition.SpecificationExtensions;
        FAllowEmptyValue: System.Boolean;

        function GetSchema: TOpenAPIDefinition;
        function GetContent: TOpenAPIDefinition.TOpenAPIDefinition.Content;
        function GetSpecificationExtensions: TOpenAPIDefinition.TOpenAPIDefinition.SpecificationExtensions;
        function GetDescriptionStored: Boolean;
        function GetRequiredStored: Boolean;
        function GetDeprecatedStored: Boolean;
        function GetSchemaStored: Boolean;
        function GetContentStored: Boolean;
        function GetExamplesStored: Boolean;
        function GetSpecificationExtensionsStored: Boolean;
        function GetAllowEmptyValueStored: Boolean;
      public
        destructor Destroy; override;

        property IsDescriptionStored: Boolean read GetDescriptionStored;
        property IsRequiredStored: Boolean read GetRequiredStored;
        property IsDeprecatedStored: Boolean read GetDeprecatedStored;
        property IsSchemaStored: Boolean read GetSchemaStored;
        property IsContentStored: Boolean read GetContentStored;
        property IsExamplesStored: Boolean read GetExamplesStored;
        property IsSpecificationExtensionsStored: Boolean read GetSpecificationExtensionsStored;
        property IsAllowEmptyValueStored: Boolean read GetAllowEmptyValueStored;
      published
        property name: System.String read FName write FName;
        [FieldName('in')]
        property &in: TOpenAPIDefinition.TOpenAPIDefinition.Parameter.TIn read FIn write FIn;
        property description: System.String read FDescription write FDescription stored GetDescriptionStored;
        property required: System.Boolean read FRequired write FRequired stored GetRequiredStored;
        property deprecated: System.Boolean read FDeprecated write FDeprecated stored GetDeprecatedStored;
        property schema: TOpenAPIDefinition read GetSchema write FSchema stored GetSchemaStored;
        property content: TOpenAPIDefinition.TOpenAPIDefinition.Content read GetContent write FContent stored GetContentStored;
        property examples: TArray<Blue.Print.JSON.Draft2022.Schema.any> read FExamples write FExamples stored GetExamplesStored;
        [FieldName('specification-extensions')]
        property specificationExtensions: TOpenAPIDefinition.TOpenAPIDefinition.SpecificationExtensions read GetSpecificationExtensions write FSpecificationExtensions stored GetSpecificationExtensionsStored;
        property allowEmptyValue: System.Boolean read FAllowEmptyValue write FAllowEmptyValue stored GetAllowEmptyValueStored;
      end;

      [Flat]
      ParameterOrReference = class
      private
        FReference: TOpenAPIDefinition.TOpenAPIDefinition.Reference;
        FParameter: TOpenAPIDefinition.TOpenAPIDefinition.Parameter;

        function GetReference: TOpenAPIDefinition.TOpenAPIDefinition.Reference;
        function GetParameter: TOpenAPIDefinition.TOpenAPIDefinition.Parameter;
        function GetReferenceStored: Boolean;
        function GetParameterStored: Boolean;
      public
        destructor Destroy; override;

        property IsReferenceStored: Boolean read GetReferenceStored;
        property IsParameterStored: Boolean read GetParameterStored;
      published
        property reference: TOpenAPIDefinition.TOpenAPIDefinition.Reference read GetReference write FReference stored GetReferenceStored;
        property parameter: TOpenAPIDefinition.TOpenAPIDefinition.Parameter read GetParameter write FParameter stored GetParameterStored;
      end;

      RequestBody = class
      private
        FDescription: System.String;
        FContent: TOpenAPIDefinition.TOpenAPIDefinition.Content;
        FRequired: System.Boolean;

        function GetContent: TOpenAPIDefinition.TOpenAPIDefinition.Content;
        function GetDescriptionStored: Boolean;
        function GetRequiredStored: Boolean;
      public
        destructor Destroy; override;

        property IsDescriptionStored: Boolean read GetDescriptionStored;
        property IsRequiredStored: Boolean read GetRequiredStored;
      published
        property description: System.String read FDescription write FDescription stored GetDescriptionStored;
        property content: TOpenAPIDefinition.TOpenAPIDefinition.Content read GetContent write FContent;
        property required: System.Boolean read FRequired write FRequired stored GetRequiredStored;
      end;

      [Flat]
      RequestBodyOrReference = class
      private
        FReference: TOpenAPIDefinition.TOpenAPIDefinition.Reference;
        FRequestBody: TOpenAPIDefinition.TOpenAPIDefinition.RequestBody;

        function GetReference: TOpenAPIDefinition.TOpenAPIDefinition.Reference;
        function GetRequestBody: TOpenAPIDefinition.TOpenAPIDefinition.RequestBody;
        function GetReferenceStored: Boolean;
        function GetRequestBodyStored: Boolean;
      public
        destructor Destroy; override;

        property IsReferenceStored: Boolean read GetReferenceStored;
        property IsRequestBodyStored: Boolean read GetRequestBodyStored;
      published
        property reference: TOpenAPIDefinition.TOpenAPIDefinition.Reference read GetReference write FReference stored GetReferenceStored;
        [FieldName('request-body')]
        property requestBody: TOpenAPIDefinition.TOpenAPIDefinition.RequestBody read GetRequestBody write FRequestBody stored GetRequestBodyStored;
      end;

      Content = class
      private
        FAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.MediaTypeOrReference>;

        function GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.MediaTypeOrReference>;
        function GetAdditionalPropertiesStored: Boolean;
      public
        destructor Destroy; override;

        property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
      published
        property additionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.MediaTypeOrReference> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
      end;

      [Flat]
      MediaType = class
      public type
        // Forward class declaration
        TEncoding = class;

        TEncoding = class
        private
          FAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.Encoding>;

          function GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.Encoding>;
          function GetAdditionalPropertiesStored: Boolean;
        public
          destructor Destroy; override;

          property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
        published
          property additionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.Encoding> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
        end;
      private
        FDescription: System.String;
        FSchema: TOpenAPIDefinition;
        FItemSchema: TOpenAPIDefinition;
        FEncoding: TOpenAPIDefinition.TOpenAPIDefinition.MediaType.TEncoding;
        FPrefixEncoding: TArray<TOpenAPIDefinition.TOpenAPIDefinition.Encoding>;
        FItemEncoding: TOpenAPIDefinition.TOpenAPIDefinition.Encoding;
        FExamples: TArray<Blue.Print.JSON.Draft2022.Schema.any>;
        FSpecificationExtensions: TOpenAPIDefinition.TOpenAPIDefinition.SpecificationExtensions;

        function GetSchema: TOpenAPIDefinition;
        function GetItemSchema: TOpenAPIDefinition;
        function GetEncoding: TOpenAPIDefinition.TOpenAPIDefinition.MediaType.TEncoding;
        function GetItemEncoding: TOpenAPIDefinition.TOpenAPIDefinition.Encoding;
        function GetSpecificationExtensions: TOpenAPIDefinition.TOpenAPIDefinition.SpecificationExtensions;
        function GetDescriptionStored: Boolean;
        function GetSchemaStored: Boolean;
        function GetItemSchemaStored: Boolean;
        function GetEncodingStored: Boolean;
        function GetPrefixEncodingStored: Boolean;
        function GetItemEncodingStored: Boolean;
        function GetExamplesStored: Boolean;
        function GetSpecificationExtensionsStored: Boolean;
      public
        destructor Destroy; override;

        function AddPrefixEncoding: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Encoding;

        property IsDescriptionStored: Boolean read GetDescriptionStored;
        property IsSchemaStored: Boolean read GetSchemaStored;
        property IsItemSchemaStored: Boolean read GetItemSchemaStored;
        property IsEncodingStored: Boolean read GetEncodingStored;
        property IsPrefixEncodingStored: Boolean read GetPrefixEncodingStored;
        property IsItemEncodingStored: Boolean read GetItemEncodingStored;
        property IsExamplesStored: Boolean read GetExamplesStored;
        property IsSpecificationExtensionsStored: Boolean read GetSpecificationExtensionsStored;
      published
        property description: System.String read FDescription write FDescription stored GetDescriptionStored;
        property schema: TOpenAPIDefinition read GetSchema write FSchema stored GetSchemaStored;
        property itemSchema: TOpenAPIDefinition read GetItemSchema write FItemSchema stored GetItemSchemaStored;
        property encoding: TOpenAPIDefinition.TOpenAPIDefinition.MediaType.TEncoding read GetEncoding write FEncoding stored GetEncodingStored;
        property prefixEncoding: TArray<TOpenAPIDefinition.TOpenAPIDefinition.Encoding> read FPrefixEncoding write FPrefixEncoding stored GetPrefixEncodingStored;
        property itemEncoding: TOpenAPIDefinition.TOpenAPIDefinition.Encoding read GetItemEncoding write FItemEncoding stored GetItemEncodingStored;
        property examples: TArray<Blue.Print.JSON.Draft2022.Schema.any> read FExamples write FExamples stored GetExamplesStored;
        [FieldName('specification-extensions')]
        property specificationExtensions: TOpenAPIDefinition.TOpenAPIDefinition.SpecificationExtensions read GetSpecificationExtensions write FSpecificationExtensions stored GetSpecificationExtensionsStored;
      end;

      [Flat]
      MediaTypeOrReference = class
      private
        FReference: TOpenAPIDefinition.TOpenAPIDefinition.Reference;
        FMediaType: TOpenAPIDefinition.TOpenAPIDefinition.MediaType;

        function GetReference: TOpenAPIDefinition.TOpenAPIDefinition.Reference;
        function GetMediaType: TOpenAPIDefinition.TOpenAPIDefinition.MediaType;
        function GetReferenceStored: Boolean;
        function GetMediaTypeStored: Boolean;
      public
        destructor Destroy; override;

        property IsReferenceStored: Boolean read GetReferenceStored;
        property IsMediaTypeStored: Boolean read GetMediaTypeStored;
      published
        property reference: TOpenAPIDefinition.TOpenAPIDefinition.Reference read GetReference write FReference stored GetReferenceStored;
        [FieldName('media-type')]
        property mediaType: TOpenAPIDefinition.TOpenAPIDefinition.MediaType read GetMediaType write FMediaType stored GetMediaTypeStored;
      end;

      Encoding = class
      public type
        TStyle = (form, spaceDelimited, pipeDelimited, deepObject);

        // Forward class declaration
        THeaders = class;
        TEncoding = class;

        THeaders = class
        private
          FAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.HeaderOrReference>;

          function GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.HeaderOrReference>;
          function GetAdditionalPropertiesStored: Boolean;
        public
          destructor Destroy; override;

          property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
        published
          property additionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.HeaderOrReference> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
        end;

        TEncoding = class
        private
          FAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.Encoding>;

          function GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.Encoding>;
          function GetAdditionalPropertiesStored: Boolean;
        public
          destructor Destroy; override;

          property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
        published
          property additionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.Encoding> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
        end;
      private
        FContentType: System.String;
        FHeaders: TOpenAPIDefinition.TOpenAPIDefinition.Encoding.THeaders;
        FStyle: TOpenAPIDefinition.TOpenAPIDefinition.Encoding.TStyle;
        FExplode: System.Boolean;
        FAllowReserved: System.Boolean;
        FEncoding: TOpenAPIDefinition.TOpenAPIDefinition.Encoding.TEncoding;
        FPrefixEncoding: TArray<TOpenAPIDefinition.TOpenAPIDefinition.Encoding>;
        FItemEncoding: TOpenAPIDefinition.TOpenAPIDefinition.Encoding;
        FStyleIsStored: Boolean;

        function GetHeaders: TOpenAPIDefinition.TOpenAPIDefinition.Encoding.THeaders;
        function GetEncoding: TOpenAPIDefinition.TOpenAPIDefinition.Encoding.TEncoding;
        function GetItemEncoding: TOpenAPIDefinition.TOpenAPIDefinition.Encoding;
        function GetContentTypeStored: Boolean;
        function GetHeadersStored: Boolean;
        function GetExplodeStored: Boolean;
        function GetAllowReservedStored: Boolean;
        function GetEncodingStored: Boolean;
        function GetPrefixEncodingStored: Boolean;
        function GetItemEncodingStored: Boolean;
        procedure SetStyle(const Value: TOpenAPIDefinition.TOpenAPIDefinition.Encoding.TStyle);
      public
        destructor Destroy; override;

        function AddPrefixEncoding: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Encoding;

        property IsContentTypeStored: Boolean read GetContentTypeStored;
        property IsHeadersStored: Boolean read GetHeadersStored;
        property IsStyleStored: Boolean read FStyleIsStored;
        property IsExplodeStored: Boolean read GetExplodeStored;
        property IsAllowReservedStored: Boolean read GetAllowReservedStored;
        property IsEncodingStored: Boolean read GetEncodingStored;
        property IsPrefixEncodingStored: Boolean read GetPrefixEncodingStored;
        property IsItemEncodingStored: Boolean read GetItemEncodingStored;
      published
        property contentType: System.String read FContentType write FContentType stored GetContentTypeStored;
        property headers: TOpenAPIDefinition.TOpenAPIDefinition.Encoding.THeaders read GetHeaders write FHeaders stored GetHeadersStored;
        property style: TOpenAPIDefinition.TOpenAPIDefinition.Encoding.TStyle read FStyle write SetStyle stored FStyleIsStored;
        property explode: System.Boolean read FExplode write FExplode stored GetExplodeStored;
        property allowReserved: System.Boolean read FAllowReserved write FAllowReserved stored GetAllowReservedStored;
        property encoding: TOpenAPIDefinition.TOpenAPIDefinition.Encoding.TEncoding read GetEncoding write FEncoding stored GetEncodingStored;
        property prefixEncoding: TArray<TOpenAPIDefinition.TOpenAPIDefinition.Encoding> read FPrefixEncoding write FPrefixEncoding stored GetPrefixEncodingStored;
        property itemEncoding: TOpenAPIDefinition.TOpenAPIDefinition.Encoding read GetItemEncoding write FItemEncoding stored GetItemEncodingStored;
      end;

      [Flat]
      Responses = class
      private
        FDefault: TOpenAPIDefinition.TOpenAPIDefinition.ResponseOrReference;
        FResponseOrReference: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.ResponseOrReference>;

        function GetDefault: TOpenAPIDefinition.TOpenAPIDefinition.ResponseOrReference;
        function GetResponseOrReference: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.ResponseOrReference>;
        function GetDefaultStored: Boolean;
        function GetResponseOrReferenceStored: Boolean;
      public
        destructor Destroy; override;

        property IsDefaultStored: Boolean read GetDefaultStored;
        property IsResponseOrReferenceStored: Boolean read GetResponseOrReferenceStored;
      published
        property default: TOpenAPIDefinition.TOpenAPIDefinition.ResponseOrReference read GetDefault write FDefault stored GetDefaultStored;
        [PatternProperty('^[1-5](?:[0-9]{2}|XX)$')]
        [FieldName('response-or-reference')]
        property responseOrReference: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.ResponseOrReference> read GetResponseOrReference write FResponseOrReference stored GetResponseOrReferenceStored;
      end;

      Response = class
      public type
        // Forward class declaration
        THeaders = class;
        TLinks = class;

        THeaders = class
        private
          FAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.HeaderOrReference>;

          function GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.HeaderOrReference>;
          function GetAdditionalPropertiesStored: Boolean;
        public
          destructor Destroy; override;

          property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
        published
          property additionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.HeaderOrReference> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
        end;

        TLinks = class
        private
          FAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.LinkOrReference>;

          function GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.LinkOrReference>;
          function GetAdditionalPropertiesStored: Boolean;
        public
          destructor Destroy; override;

          property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
        published
          property additionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.LinkOrReference> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
        end;
      private
        FSummary: System.String;
        FDescription: System.String;
        FHeaders: TOpenAPIDefinition.TOpenAPIDefinition.Response.THeaders;
        FContent: TOpenAPIDefinition.TOpenAPIDefinition.Content;
        FLinks: TOpenAPIDefinition.TOpenAPIDefinition.Response.TLinks;

        function GetHeaders: TOpenAPIDefinition.TOpenAPIDefinition.Response.THeaders;
        function GetContent: TOpenAPIDefinition.TOpenAPIDefinition.Content;
        function GetLinks: TOpenAPIDefinition.TOpenAPIDefinition.Response.TLinks;
        function GetSummaryStored: Boolean;
        function GetDescriptionStored: Boolean;
        function GetHeadersStored: Boolean;
        function GetContentStored: Boolean;
        function GetLinksStored: Boolean;
      public
        destructor Destroy; override;

        property IsSummaryStored: Boolean read GetSummaryStored;
        property IsDescriptionStored: Boolean read GetDescriptionStored;
        property IsHeadersStored: Boolean read GetHeadersStored;
        property IsContentStored: Boolean read GetContentStored;
        property IsLinksStored: Boolean read GetLinksStored;
      published
        property summary: System.String read FSummary write FSummary stored GetSummaryStored;
        property description: System.String read FDescription write FDescription stored GetDescriptionStored;
        property headers: TOpenAPIDefinition.TOpenAPIDefinition.Response.THeaders read GetHeaders write FHeaders stored GetHeadersStored;
        property content: TOpenAPIDefinition.TOpenAPIDefinition.Content read GetContent write FContent stored GetContentStored;
        property links: TOpenAPIDefinition.TOpenAPIDefinition.Response.TLinks read GetLinks write FLinks stored GetLinksStored;
      end;

      [Flat]
      ResponseOrReference = class
      private
        FReference: TOpenAPIDefinition.TOpenAPIDefinition.Reference;
        FResponse: TOpenAPIDefinition.TOpenAPIDefinition.Response;

        function GetReference: TOpenAPIDefinition.TOpenAPIDefinition.Reference;
        function GetResponse: TOpenAPIDefinition.TOpenAPIDefinition.Response;
        function GetReferenceStored: Boolean;
        function GetResponseStored: Boolean;
      public
        destructor Destroy; override;

        property IsReferenceStored: Boolean read GetReferenceStored;
        property IsResponseStored: Boolean read GetResponseStored;
      published
        property reference: TOpenAPIDefinition.TOpenAPIDefinition.Reference read GetReference write FReference stored GetReferenceStored;
        property response: TOpenAPIDefinition.TOpenAPIDefinition.Response read GetResponse write FResponse stored GetResponseStored;
      end;

      Callbacks = class
      private
        FAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.PathItem>;

        function GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.PathItem>;
        function GetAdditionalPropertiesStored: Boolean;
      public
        destructor Destroy; override;

        property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
      published
        property additionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.PathItem> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
      end;

      [Flat]
      CallbacksOrReference = class
      private
        FReference: TOpenAPIDefinition.TOpenAPIDefinition.Reference;
        FCallbacks: TOpenAPIDefinition.TOpenAPIDefinition.Callbacks;

        function GetReference: TOpenAPIDefinition.TOpenAPIDefinition.Reference;
        function GetCallbacks: TOpenAPIDefinition.TOpenAPIDefinition.Callbacks;
        function GetReferenceStored: Boolean;
        function GetCallbacksStored: Boolean;
      public
        destructor Destroy; override;

        property IsReferenceStored: Boolean read GetReferenceStored;
        property IsCallbacksStored: Boolean read GetCallbacksStored;
      published
        property reference: TOpenAPIDefinition.TOpenAPIDefinition.Reference read GetReference write FReference stored GetReferenceStored;
        property callbacks: TOpenAPIDefinition.TOpenAPIDefinition.Callbacks read GetCallbacks write FCallbacks stored GetCallbacksStored;
      end;

      [Flat]
      Example = class
      private
        FSummary: System.String;
        FDescription: System.String;
        FDataValue: any;
        FSerializedValue: System.String;
        FValue: any;
        FExternalValue: System.String;

        function GetSummaryStored: Boolean;
        function GetDescriptionStored: Boolean;
        function GetDataValueStored: Boolean;
        function GetSerializedValueStored: Boolean;
        function GetValueStored: Boolean;
        function GetExternalValueStored: Boolean;
      public
        property IsSummaryStored: Boolean read GetSummaryStored;
        property IsDescriptionStored: Boolean read GetDescriptionStored;
        property IsDataValueStored: Boolean read GetDataValueStored;
        property IsSerializedValueStored: Boolean read GetSerializedValueStored;
        property IsValueStored: Boolean read GetValueStored;
        property IsExternalValueStored: Boolean read GetExternalValueStored;
      published
        property summary: System.String read FSummary write FSummary stored GetSummaryStored;
        property description: System.String read FDescription write FDescription stored GetDescriptionStored;
        property dataValue: any read FDataValue write FDataValue stored GetDataValueStored;
        property serializedValue: System.String read FSerializedValue write FSerializedValue stored GetSerializedValueStored;
        property value: any read FValue write FValue stored GetValueStored;
        property externalValue: System.String read FExternalValue write FExternalValue stored GetExternalValueStored;
      end;

      [Flat]
      ExampleOrReference = class
      private
        FReference: TOpenAPIDefinition.TOpenAPIDefinition.Reference;
        FExample: TOpenAPIDefinition.TOpenAPIDefinition.Example;

        function GetReference: TOpenAPIDefinition.TOpenAPIDefinition.Reference;
        function GetExample: TOpenAPIDefinition.TOpenAPIDefinition.Example;
        function GetReferenceStored: Boolean;
        function GetExampleStored: Boolean;
      public
        destructor Destroy; override;

        property IsReferenceStored: Boolean read GetReferenceStored;
        property IsExampleStored: Boolean read GetExampleStored;
      published
        property reference: TOpenAPIDefinition.TOpenAPIDefinition.Reference read GetReference write FReference stored GetReferenceStored;
        property example: TOpenAPIDefinition.TOpenAPIDefinition.Example read GetExample write FExample stored GetExampleStored;
      end;

      [Flat]
      Link = class
      private
        FOperationRef: System.String;
        FOperationId: System.String;
        FParameters: TOpenAPIDefinition.TOpenAPIDefinition.MapOfStrings;
        FRequestBody: any;
        FDescription: System.String;
        FServer: TOpenAPIDefinition.TOpenAPIDefinition.Server;

        function GetParameters: TOpenAPIDefinition.TOpenAPIDefinition.MapOfStrings;
        function GetServer: TOpenAPIDefinition.TOpenAPIDefinition.Server;
        function GetOperationRefStored: Boolean;
        function GetOperationIdStored: Boolean;
        function GetParametersStored: Boolean;
        function GetRequestBodyStored: Boolean;
        function GetDescriptionStored: Boolean;
        function GetServerStored: Boolean;
      public
        destructor Destroy; override;

        property IsOperationRefStored: Boolean read GetOperationRefStored;
        property IsOperationIdStored: Boolean read GetOperationIdStored;
        property IsParametersStored: Boolean read GetParametersStored;
        property IsRequestBodyStored: Boolean read GetRequestBodyStored;
        property IsDescriptionStored: Boolean read GetDescriptionStored;
        property IsServerStored: Boolean read GetServerStored;
      published
        property operationRef: System.String read FOperationRef write FOperationRef stored GetOperationRefStored;
        property operationId: System.String read FOperationId write FOperationId stored GetOperationIdStored;
        property parameters: TOpenAPIDefinition.TOpenAPIDefinition.MapOfStrings read GetParameters write FParameters stored GetParametersStored;
        property requestBody: any read FRequestBody write FRequestBody stored GetRequestBodyStored;
        property description: System.String read FDescription write FDescription stored GetDescriptionStored;
        property server: TOpenAPIDefinition.TOpenAPIDefinition.Server read GetServer write FServer stored GetServerStored;
      end;

      [Flat]
      LinkOrReference = class
      private
        FReference: TOpenAPIDefinition.TOpenAPIDefinition.Reference;
        FLink: TOpenAPIDefinition.TOpenAPIDefinition.Link;

        function GetReference: TOpenAPIDefinition.TOpenAPIDefinition.Reference;
        function GetLink: TOpenAPIDefinition.TOpenAPIDefinition.Link;
        function GetReferenceStored: Boolean;
        function GetLinkStored: Boolean;
      public
        destructor Destroy; override;

        property IsReferenceStored: Boolean read GetReferenceStored;
        property IsLinkStored: Boolean read GetLinkStored;
      published
        property reference: TOpenAPIDefinition.TOpenAPIDefinition.Reference read GetReference write FReference stored GetReferenceStored;
        property link: TOpenAPIDefinition.TOpenAPIDefinition.Link read GetLink write FLink stored GetLinkStored;
      end;

      [Flat]
      Header = class
      private
        FDescription: System.String;
        FRequired: System.Boolean;
        FDeprecated: System.Boolean;
        FSchema: TOpenAPIDefinition;
        FContent: TOpenAPIDefinition.TOpenAPIDefinition.Content;
        FExamples: TArray<Blue.Print.JSON.Draft2022.Schema.any>;
        FSpecificationExtensions: TOpenAPIDefinition.TOpenAPIDefinition.SpecificationExtensions;

        function GetSchema: TOpenAPIDefinition;
        function GetContent: TOpenAPIDefinition.TOpenAPIDefinition.Content;
        function GetSpecificationExtensions: TOpenAPIDefinition.TOpenAPIDefinition.SpecificationExtensions;
        function GetDescriptionStored: Boolean;
        function GetRequiredStored: Boolean;
        function GetDeprecatedStored: Boolean;
        function GetSchemaStored: Boolean;
        function GetContentStored: Boolean;
        function GetExamplesStored: Boolean;
        function GetSpecificationExtensionsStored: Boolean;
      public
        destructor Destroy; override;

        property IsDescriptionStored: Boolean read GetDescriptionStored;
        property IsRequiredStored: Boolean read GetRequiredStored;
        property IsDeprecatedStored: Boolean read GetDeprecatedStored;
        property IsSchemaStored: Boolean read GetSchemaStored;
        property IsContentStored: Boolean read GetContentStored;
        property IsExamplesStored: Boolean read GetExamplesStored;
        property IsSpecificationExtensionsStored: Boolean read GetSpecificationExtensionsStored;
      published
        property description: System.String read FDescription write FDescription stored GetDescriptionStored;
        property required: System.Boolean read FRequired write FRequired stored GetRequiredStored;
        property deprecated: System.Boolean read FDeprecated write FDeprecated stored GetDeprecatedStored;
        property schema: TOpenAPIDefinition read GetSchema write FSchema stored GetSchemaStored;
        property content: TOpenAPIDefinition.TOpenAPIDefinition.Content read GetContent write FContent stored GetContentStored;
        property examples: TArray<Blue.Print.JSON.Draft2022.Schema.any> read FExamples write FExamples stored GetExamplesStored;
        [FieldName('specification-extensions')]
        property specificationExtensions: TOpenAPIDefinition.TOpenAPIDefinition.SpecificationExtensions read GetSpecificationExtensions write FSpecificationExtensions stored GetSpecificationExtensionsStored;
      end;

      [Flat]
      HeaderOrReference = class
      private
        FReference: TOpenAPIDefinition.TOpenAPIDefinition.Reference;
        FHeader: TOpenAPIDefinition.TOpenAPIDefinition.Header;

        function GetReference: TOpenAPIDefinition.TOpenAPIDefinition.Reference;
        function GetHeader: TOpenAPIDefinition.TOpenAPIDefinition.Header;
        function GetReferenceStored: Boolean;
        function GetHeaderStored: Boolean;
      public
        destructor Destroy; override;

        property IsReferenceStored: Boolean read GetReferenceStored;
        property IsHeaderStored: Boolean read GetHeaderStored;
      published
        property reference: TOpenAPIDefinition.TOpenAPIDefinition.Reference read GetReference write FReference stored GetReferenceStored;
        property header: TOpenAPIDefinition.TOpenAPIDefinition.Header read GetHeader write FHeader stored GetHeaderStored;
      end;

      Tag = class
      private
        FName: System.String;
        FSummary: System.String;
        FDescription: System.String;
        FExternalDocs: TOpenAPIDefinition.TOpenAPIDefinition.ExternalDocumentation;
        FParent: System.String;
        FKind: System.String;

        function GetExternalDocs: TOpenAPIDefinition.TOpenAPIDefinition.ExternalDocumentation;
        function GetSummaryStored: Boolean;
        function GetDescriptionStored: Boolean;
        function GetExternalDocsStored: Boolean;
        function GetParentStored: Boolean;
        function GetKindStored: Boolean;
      public
        destructor Destroy; override;

        property IsSummaryStored: Boolean read GetSummaryStored;
        property IsDescriptionStored: Boolean read GetDescriptionStored;
        property IsExternalDocsStored: Boolean read GetExternalDocsStored;
        property IsParentStored: Boolean read GetParentStored;
        property IsKindStored: Boolean read GetKindStored;
      published
        property name: System.String read FName write FName;
        property summary: System.String read FSummary write FSummary stored GetSummaryStored;
        property description: System.String read FDescription write FDescription stored GetDescriptionStored;
        property externalDocs: TOpenAPIDefinition.TOpenAPIDefinition.ExternalDocumentation read GetExternalDocs write FExternalDocs stored GetExternalDocsStored;
        property parent: System.String read FParent write FParent stored GetParentStored;
        property kind: System.String read FKind write FKind stored GetKindStored;
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
        // Forward class declaration
        &Object = class;

        &Object = class
        end;
      private
        FObject: TOpenAPIDefinition.TOpenAPIDefinition.Schema.&Object;
        FBoolean: System.Boolean;

        function GetObject: TOpenAPIDefinition.TOpenAPIDefinition.Schema.&Object;
        function GetObjectStored: Boolean;
        function GetBooleanStored: Boolean;
      public
        destructor Destroy; override;

        property IsObjectStored: Boolean read GetObjectStored;
        property IsBooleanStored: Boolean read GetBooleanStored;
      published
        [FieldName('Object')]
        property &Object: TOpenAPIDefinition.TOpenAPIDefinition.Schema.&Object read GetObject write FObject stored GetObjectStored;
        property Boolean: System.Boolean read FBoolean write FBoolean stored GetBooleanStored;
      end;

      [Flat]
      SecurityScheme = class
      public type
        TType = (apiKey, http, mutualTLS, oauth2, openIdConnect);

        // Forward class declaration
        TypeApikey = class;
        TypeHttp = class;
        TypeHttpBearer = class;
        TypeOauth2 = class;
        TypeOidc = class;

        [Flat]
        TypeApikey = class
        public type
          TIn = (query, header, cookie);
        private
          FName: System.String;
          FIn: TOpenAPIDefinition.TOpenAPIDefinition.SecurityScheme.TypeApikey.TIn;
        published
          property name: System.String read FName write FName;
          [FieldName('in')]
          property &in: TOpenAPIDefinition.TOpenAPIDefinition.SecurityScheme.TypeApikey.TIn read FIn write FIn;
        end;

        [Flat]
        TypeHttp = class
        private
          FScheme: System.String;
        published
          property scheme: System.String read FScheme write FScheme;
        end;

        [Flat]
        TypeHttpBearer = class
        private
          FBearerFormat: System.String;

          function GetBearerFormatStored: Boolean;
        public
          property IsBearerFormatStored: Boolean read GetBearerFormatStored;
        published
          property bearerFormat: System.String read FBearerFormat write FBearerFormat stored GetBearerFormatStored;
        end;

        [Flat]
        TypeOauth2 = class
        private
          FFlows: TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows;
          FOauth2MetadataUrl: System.String;

          function GetFlows: TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows;
          function GetOauth2MetadataUrlStored: Boolean;
        public
          destructor Destroy; override;

          property IsOauth2MetadataUrlStored: Boolean read GetOauth2MetadataUrlStored;
        published
          property flows: TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows read GetFlows write FFlows;
          property oauth2MetadataUrl: System.String read FOauth2MetadataUrl write FOauth2MetadataUrl stored GetOauth2MetadataUrlStored;
        end;

        [Flat]
        TypeOidc = class
        private
          FOpenIdConnectUrl: System.String;
        published
          property openIdConnectUrl: System.String read FOpenIdConnectUrl write FOpenIdConnectUrl;
        end;
      private
        FType: TOpenAPIDefinition.TOpenAPIDefinition.SecurityScheme.TType;
        FDescription: System.String;
        FDeprecated: System.Boolean;
        FSpecificationExtensions: TOpenAPIDefinition.TOpenAPIDefinition.SpecificationExtensions;
        FTypeApikey: TOpenAPIDefinition.TOpenAPIDefinition.SecurityScheme.TypeApikey;
        FTypeHttp: TOpenAPIDefinition.TOpenAPIDefinition.SecurityScheme.TypeHttp;
        FTypeHttpBearer: TOpenAPIDefinition.TOpenAPIDefinition.SecurityScheme.TypeHttpBearer;
        FTypeOauth2: TOpenAPIDefinition.TOpenAPIDefinition.SecurityScheme.TypeOauth2;
        FTypeOidc: TOpenAPIDefinition.TOpenAPIDefinition.SecurityScheme.TypeOidc;

        function GetSpecificationExtensions: TOpenAPIDefinition.TOpenAPIDefinition.SpecificationExtensions;
        function GetTypeApikey: TOpenAPIDefinition.TOpenAPIDefinition.SecurityScheme.TypeApikey;
        function GetTypeHttp: TOpenAPIDefinition.TOpenAPIDefinition.SecurityScheme.TypeHttp;
        function GetTypeHttpBearer: TOpenAPIDefinition.TOpenAPIDefinition.SecurityScheme.TypeHttpBearer;
        function GetTypeOauth2: TOpenAPIDefinition.TOpenAPIDefinition.SecurityScheme.TypeOauth2;
        function GetTypeOidc: TOpenAPIDefinition.TOpenAPIDefinition.SecurityScheme.TypeOidc;
        function GetDescriptionStored: Boolean;
        function GetDeprecatedStored: Boolean;
        function GetSpecificationExtensionsStored: Boolean;
        function GetTypeApikeyStored: Boolean;
        function GetTypeHttpStored: Boolean;
        function GetTypeHttpBearerStored: Boolean;
        function GetTypeOauth2Stored: Boolean;
        function GetTypeOidcStored: Boolean;
      public
        destructor Destroy; override;

        property IsDescriptionStored: Boolean read GetDescriptionStored;
        property IsDeprecatedStored: Boolean read GetDeprecatedStored;
        property IsSpecificationExtensionsStored: Boolean read GetSpecificationExtensionsStored;
        property IsTypeApikeyStored: Boolean read GetTypeApikeyStored;
        property IsTypeHttpStored: Boolean read GetTypeHttpStored;
        property IsTypeHttpBearerStored: Boolean read GetTypeHttpBearerStored;
        property IsTypeOauth2Stored: Boolean read GetTypeOauth2Stored;
        property IsTypeOidcStored: Boolean read GetTypeOidcStored;
      published
        [FieldName('type')]
        property &type: TOpenAPIDefinition.TOpenAPIDefinition.SecurityScheme.TType read FType write FType;
        property description: System.String read FDescription write FDescription stored GetDescriptionStored;
        property deprecated: System.Boolean read FDeprecated write FDeprecated stored GetDeprecatedStored;
        [FieldName('specification-extensions')]
        property specificationExtensions: TOpenAPIDefinition.TOpenAPIDefinition.SpecificationExtensions read GetSpecificationExtensions write FSpecificationExtensions stored GetSpecificationExtensionsStored;
        [FieldName('type-apikey')]
        property typeApikey: TOpenAPIDefinition.TOpenAPIDefinition.SecurityScheme.TypeApikey read GetTypeApikey write FTypeApikey stored GetTypeApikeyStored;
        [FieldName('type-http')]
        property typeHttp: TOpenAPIDefinition.TOpenAPIDefinition.SecurityScheme.TypeHttp read GetTypeHttp write FTypeHttp stored GetTypeHttpStored;
        [FieldName('type-http-bearer')]
        property typeHttpBearer: TOpenAPIDefinition.TOpenAPIDefinition.SecurityScheme.TypeHttpBearer read GetTypeHttpBearer write FTypeHttpBearer stored GetTypeHttpBearerStored;
        [FieldName('type-oauth2')]
        property typeOauth2: TOpenAPIDefinition.TOpenAPIDefinition.SecurityScheme.TypeOauth2 read GetTypeOauth2 write FTypeOauth2 stored GetTypeOauth2Stored;
        [FieldName('type-oidc')]
        property typeOidc: TOpenAPIDefinition.TOpenAPIDefinition.SecurityScheme.TypeOidc read GetTypeOidc write FTypeOidc stored GetTypeOidcStored;
      end;

      [Flat]
      SecuritySchemeOrReference = class
      private
        FReference: TOpenAPIDefinition.TOpenAPIDefinition.Reference;
        FSecurityScheme: TOpenAPIDefinition.TOpenAPIDefinition.SecurityScheme;

        function GetReference: TOpenAPIDefinition.TOpenAPIDefinition.Reference;
        function GetSecurityScheme: TOpenAPIDefinition.TOpenAPIDefinition.SecurityScheme;
        function GetReferenceStored: Boolean;
        function GetSecuritySchemeStored: Boolean;
      public
        destructor Destroy; override;

        property IsReferenceStored: Boolean read GetReferenceStored;
        property IsSecuritySchemeStored: Boolean read GetSecuritySchemeStored;
      published
        property reference: TOpenAPIDefinition.TOpenAPIDefinition.Reference read GetReference write FReference stored GetReferenceStored;
        [FieldName('security-scheme')]
        property securityScheme: TOpenAPIDefinition.TOpenAPIDefinition.SecurityScheme read GetSecurityScheme write FSecurityScheme stored GetSecuritySchemeStored;
      end;

      OauthFlows = class
      public type
        // Forward class declaration
        Implicit = class;
        Password = class;
        ClientCredentials = class;
        AuthorizationCode = class;
        DeviceAuthorization = class;

        Implicit = class
        private
          FAuthorizationUrl: System.String;
          FRefreshUrl: System.String;
          FScopes: TOpenAPIDefinition.TOpenAPIDefinition.MapOfStrings;

          function GetScopes: TOpenAPIDefinition.TOpenAPIDefinition.MapOfStrings;
          function GetRefreshUrlStored: Boolean;
        public
          destructor Destroy; override;

          property IsRefreshUrlStored: Boolean read GetRefreshUrlStored;
        published
          property authorizationUrl: System.String read FAuthorizationUrl write FAuthorizationUrl;
          property refreshUrl: System.String read FRefreshUrl write FRefreshUrl stored GetRefreshUrlStored;
          property scopes: TOpenAPIDefinition.TOpenAPIDefinition.MapOfStrings read GetScopes write FScopes;
        end;

        Password = class
        private
          FTokenUrl: System.String;
          FRefreshUrl: System.String;
          FScopes: TOpenAPIDefinition.TOpenAPIDefinition.MapOfStrings;

          function GetScopes: TOpenAPIDefinition.TOpenAPIDefinition.MapOfStrings;
          function GetRefreshUrlStored: Boolean;
        public
          destructor Destroy; override;

          property IsRefreshUrlStored: Boolean read GetRefreshUrlStored;
        published
          property tokenUrl: System.String read FTokenUrl write FTokenUrl;
          property refreshUrl: System.String read FRefreshUrl write FRefreshUrl stored GetRefreshUrlStored;
          property scopes: TOpenAPIDefinition.TOpenAPIDefinition.MapOfStrings read GetScopes write FScopes;
        end;

        ClientCredentials = class
        private
          FTokenUrl: System.String;
          FRefreshUrl: System.String;
          FScopes: TOpenAPIDefinition.TOpenAPIDefinition.MapOfStrings;

          function GetScopes: TOpenAPIDefinition.TOpenAPIDefinition.MapOfStrings;
          function GetRefreshUrlStored: Boolean;
        public
          destructor Destroy; override;

          property IsRefreshUrlStored: Boolean read GetRefreshUrlStored;
        published
          property tokenUrl: System.String read FTokenUrl write FTokenUrl;
          property refreshUrl: System.String read FRefreshUrl write FRefreshUrl stored GetRefreshUrlStored;
          property scopes: TOpenAPIDefinition.TOpenAPIDefinition.MapOfStrings read GetScopes write FScopes;
        end;

        AuthorizationCode = class
        private
          FAuthorizationUrl: System.String;
          FTokenUrl: System.String;
          FRefreshUrl: System.String;
          FScopes: TOpenAPIDefinition.TOpenAPIDefinition.MapOfStrings;

          function GetScopes: TOpenAPIDefinition.TOpenAPIDefinition.MapOfStrings;
          function GetRefreshUrlStored: Boolean;
        public
          destructor Destroy; override;

          property IsRefreshUrlStored: Boolean read GetRefreshUrlStored;
        published
          property authorizationUrl: System.String read FAuthorizationUrl write FAuthorizationUrl;
          property tokenUrl: System.String read FTokenUrl write FTokenUrl;
          property refreshUrl: System.String read FRefreshUrl write FRefreshUrl stored GetRefreshUrlStored;
          property scopes: TOpenAPIDefinition.TOpenAPIDefinition.MapOfStrings read GetScopes write FScopes;
        end;

        DeviceAuthorization = class
        private
          FDeviceAuthorizationUrl: System.String;
          FTokenUrl: System.String;
          FRefreshUrl: System.String;
          FScopes: TOpenAPIDefinition.TOpenAPIDefinition.MapOfStrings;

          function GetScopes: TOpenAPIDefinition.TOpenAPIDefinition.MapOfStrings;
          function GetRefreshUrlStored: Boolean;
        public
          destructor Destroy; override;

          property IsRefreshUrlStored: Boolean read GetRefreshUrlStored;
        published
          property deviceAuthorizationUrl: System.String read FDeviceAuthorizationUrl write FDeviceAuthorizationUrl;
          property tokenUrl: System.String read FTokenUrl write FTokenUrl;
          property refreshUrl: System.String read FRefreshUrl write FRefreshUrl stored GetRefreshUrlStored;
          property scopes: TOpenAPIDefinition.TOpenAPIDefinition.MapOfStrings read GetScopes write FScopes;
        end;
      private
        FImplicit: TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows.Implicit;
        FPassword: TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows.Password;
        FClientCredentials: TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows.ClientCredentials;
        FAuthorizationCode: TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows.AuthorizationCode;
        FDeviceAuthorization: TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows.DeviceAuthorization;

        function GetImplicit: TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows.Implicit;
        function GetPassword: TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows.Password;
        function GetClientCredentials: TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows.ClientCredentials;
        function GetAuthorizationCode: TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows.AuthorizationCode;
        function GetDeviceAuthorization: TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows.DeviceAuthorization;
        function GetImplicitStored: Boolean;
        function GetPasswordStored: Boolean;
        function GetClientCredentialsStored: Boolean;
        function GetAuthorizationCodeStored: Boolean;
        function GetDeviceAuthorizationStored: Boolean;
      public
        destructor Destroy; override;

        property IsImplicitStored: Boolean read GetImplicitStored;
        property IsPasswordStored: Boolean read GetPasswordStored;
        property IsClientCredentialsStored: Boolean read GetClientCredentialsStored;
        property IsAuthorizationCodeStored: Boolean read GetAuthorizationCodeStored;
        property IsDeviceAuthorizationStored: Boolean read GetDeviceAuthorizationStored;
      published
        property implicit: TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows.Implicit read GetImplicit write FImplicit stored GetImplicitStored;
        property password: TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows.Password read GetPassword write FPassword stored GetPasswordStored;
        property clientCredentials: TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows.ClientCredentials read GetClientCredentials write FClientCredentials stored GetClientCredentialsStored;
        property authorizationCode: TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows.AuthorizationCode read GetAuthorizationCode write FAuthorizationCode stored GetAuthorizationCodeStored;
        property deviceAuthorization: TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows.DeviceAuthorization read GetDeviceAuthorization write FDeviceAuthorization stored GetDeviceAuthorizationStored;
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

      Examples = class
      public type
        // Forward class declaration
        TExamples = class;

        TExamples = class
        private
          FAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.ExampleOrReference>;

          function GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.ExampleOrReference>;
          function GetAdditionalPropertiesStored: Boolean;
        public
          destructor Destroy; override;

          property IsAdditionalPropertiesStored: Boolean read GetAdditionalPropertiesStored;
        published
          property additionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.ExampleOrReference> read GetAdditionalProperties write FAdditionalProperties stored GetAdditionalPropertiesStored;
        end;
      private
        FExample: any;
        FExamples: TOpenAPIDefinition.TOpenAPIDefinition.Examples.TExamples;

        function GetExamples: TOpenAPIDefinition.TOpenAPIDefinition.Examples.TExamples;
        function GetExampleStored: Boolean;
        function GetExamplesStored: Boolean;
      public
        destructor Destroy; override;

        property IsExampleStored: Boolean read GetExampleStored;
        property IsExamplesStored: Boolean read GetExamplesStored;
      published
        property example: any read FExample write FExample stored GetExampleStored;
        property examples: TOpenAPIDefinition.TOpenAPIDefinition.Examples.TExamples read GetExamples write FExamples stored GetExamplesStored;
      end;

      MapOfStrings = class
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

      [Flat]
      ExplodeForForm = class
      private
        FExplode: System.Boolean;

        function GetExplodeStored: Boolean;
      public
        property IsExplodeStored: Boolean read GetExplodeStored;
      published
        property explode: System.Boolean read FExplode write FExplode stored GetExplodeStored;
      end;
    private
      FOpenapi: System.String;
      FSelf: System.String;
      FInfo: TOpenAPIDefinition.TOpenAPIDefinition.Info;
      FJsonSchemaDialect: System.String;
      FServers: TArray<TOpenAPIDefinition.TOpenAPIDefinition.Server>;
      FPaths: TOpenAPIDefinition.TOpenAPIDefinition.Paths;
      FWebhooks: TOpenAPIDefinition.TOpenAPIDefinition.TWebhooks;
      FComponents: TOpenAPIDefinition.TOpenAPIDefinition.Components;
      FSecurity: TArray<TOpenAPIDefinition.TOpenAPIDefinition.SecurityRequirement>;
      FTags: TArray<TOpenAPIDefinition.TOpenAPIDefinition.Tag>;
      FExternalDocs: TOpenAPIDefinition.TOpenAPIDefinition.ExternalDocumentation;

      function GetInfo: TOpenAPIDefinition.TOpenAPIDefinition.Info;
      function GetPaths: TOpenAPIDefinition.TOpenAPIDefinition.Paths;
      function GetWebhooks: TOpenAPIDefinition.TOpenAPIDefinition.TWebhooks;
      function GetComponents: TOpenAPIDefinition.TOpenAPIDefinition.Components;
      function GetExternalDocs: TOpenAPIDefinition.TOpenAPIDefinition.ExternalDocumentation;
      function GetSelfStored: Boolean;
      function GetJsonSchemaDialectStored: Boolean;
      function GetServersStored: Boolean;
      function GetPathsStored: Boolean;
      function GetWebhooksStored: Boolean;
      function GetComponentsStored: Boolean;
      function GetSecurityStored: Boolean;
      function GetTagsStored: Boolean;
      function GetExternalDocsStored: Boolean;
    public
      destructor Destroy; override;

      function AddServers: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Server;
      function AddSecurity: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.SecurityRequirement;
      function AddTags: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Tag;

      property IsSelfStored: Boolean read GetSelfStored;
      property IsJsonSchemaDialectStored: Boolean read GetJsonSchemaDialectStored;
      property IsServersStored: Boolean read GetServersStored;
      property IsPathsStored: Boolean read GetPathsStored;
      property IsWebhooksStored: Boolean read GetWebhooksStored;
      property IsComponentsStored: Boolean read GetComponentsStored;
      property IsSecurityStored: Boolean read GetSecurityStored;
      property IsTagsStored: Boolean read GetTagsStored;
      property IsExternalDocsStored: Boolean read GetExternalDocsStored;
    published
      property openapi: System.String read FOpenapi write FOpenapi;
      [FieldName('$self')]
      property Self: System.String read FSelf write FSelf stored GetSelfStored;
      property info: TOpenAPIDefinition.TOpenAPIDefinition.Info read GetInfo write FInfo;
      property jsonSchemaDialect: System.String read FJsonSchemaDialect write FJsonSchemaDialect stored GetJsonSchemaDialectStored;
      property servers: TArray<TOpenAPIDefinition.TOpenAPIDefinition.Server> read FServers write FServers stored GetServersStored;
      property paths: TOpenAPIDefinition.TOpenAPIDefinition.Paths read GetPaths write FPaths stored GetPathsStored;
      property webhooks: TOpenAPIDefinition.TOpenAPIDefinition.TWebhooks read GetWebhooks write FWebhooks stored GetWebhooksStored;
      property components: TOpenAPIDefinition.TOpenAPIDefinition.Components read GetComponents write FComponents stored GetComponentsStored;
      property security: TArray<TOpenAPIDefinition.TOpenAPIDefinition.SecurityRequirement> read FSecurity write FSecurity stored GetSecurityStored;
      property tags: TArray<TOpenAPIDefinition.TOpenAPIDefinition.Tag> read FTags write FTags stored GetTagsStored;
      property externalDocs: TOpenAPIDefinition.TOpenAPIDefinition.ExternalDocumentation read GetExternalDocs write FExternalDocs stored GetExternalDocsStored;
    end;
  end;

implementation

uses System.SysUtils;

{ TOpenAPIDefinition.TOpenAPIDefinition }

destructor TOpenAPIDefinition.TOpenAPIDefinition.Destroy;
begin
  FInfo.Free;

  for var AObject in FServers do
    AObject.Free;

  FPaths.Free;

  FWebhooks.Free;

  FComponents.Free;

  for var AObject in FSecurity do
    AObject.Free;

  for var AObject in FTags do
    AObject.Free;

  FExternalDocs.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetSelfStored: Boolean;
begin
  Result := not FSelf.IsEmpty;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetInfo: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Info;
begin
  if not Assigned(FInfo) then
    FInfo := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Info.Create;

  Result := FInfo;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetJsonSchemaDialectStored: Boolean;
begin
  Result := not FJsonSchemaDialect.IsEmpty;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.AddServers: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Server;
begin
  Result := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Server.Create;

  FServers := FServers + [Result];
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetServersStored: Boolean;
begin
  Result := Assigned(FServers);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetPaths: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Paths;
begin
  if not Assigned(FPaths) then
    FPaths := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Paths.Create;

  Result := FPaths;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetPathsStored: Boolean;
begin
  Result := Assigned(FPaths);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetWebhooks: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.TWebhooks;
begin
  if not Assigned(FWebhooks) then
    FWebhooks := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.TWebhooks.Create;

  Result := FWebhooks;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetWebhooksStored: Boolean;
begin
  Result := Assigned(FWebhooks);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetComponents: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Components;
begin
  if not Assigned(FComponents) then
    FComponents := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Components.Create;

  Result := FComponents;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetComponentsStored: Boolean;
begin
  Result := Assigned(FComponents);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.AddSecurity: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.SecurityRequirement;
begin
  Result := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.SecurityRequirement.Create;

  FSecurity := FSecurity + [Result];
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetSecurityStored: Boolean;
begin
  Result := Assigned(FSecurity);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.AddTags: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Tag;
begin
  Result := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Tag.Create;

  FTags := FTags + [Result];
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetTagsStored: Boolean;
begin
  Result := Assigned(FTags);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetExternalDocs: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.ExternalDocumentation;
begin
  if not Assigned(FExternalDocs) then
    FExternalDocs := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.ExternalDocumentation.Create;

  Result := FExternalDocs;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.GetExternalDocsStored: Boolean;
begin
  Result := Assigned(FExternalDocs);
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.TWebhooks }

destructor TOpenAPIDefinition.TOpenAPIDefinition.TWebhooks.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.TWebhooks.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.PathItem>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.PathItem>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.TWebhooks.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.Info }

destructor TOpenAPIDefinition.TOpenAPIDefinition.Info.Destroy;
begin
  FContact.Free;

  FLicense.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Info.GetSummaryStored: Boolean;
begin
  Result := not FSummary.IsEmpty;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Info.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Info.GetTermsOfServiceStored: Boolean;
begin
  Result := not FTermsOfService.IsEmpty;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Info.GetContact: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Contact;
begin
  if not Assigned(FContact) then
    FContact := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Contact.Create;

  Result := FContact;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Info.GetContactStored: Boolean;
begin
  Result := Assigned(FContact);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Info.GetLicense: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.License;
begin
  if not Assigned(FLicense) then
    FLicense := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.License.Create;

  Result := FLicense;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Info.GetLicenseStored: Boolean;
begin
  Result := Assigned(FLicense);
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.Contact }

function TOpenAPIDefinition.TOpenAPIDefinition.Contact.GetNameStored: Boolean;
begin
  Result := not FName.IsEmpty;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Contact.GetUrlStored: Boolean;
begin
  Result := not FUrl.IsEmpty;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Contact.GetEmailStored: Boolean;
begin
  Result := not FEmail.IsEmpty;
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.License }

function TOpenAPIDefinition.TOpenAPIDefinition.License.GetIdentifierStored: Boolean;
begin
  Result := not FIdentifier.IsEmpty;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.License.GetUrlStored: Boolean;
begin
  Result := not FUrl.IsEmpty;
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.Server }

destructor TOpenAPIDefinition.TOpenAPIDefinition.Server.Destroy;
begin
  FVariables.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Server.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Server.GetNameStored: Boolean;
begin
  Result := not FName.IsEmpty;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Server.GetVariables: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Server.TVariables;
begin
  if not Assigned(FVariables) then
    FVariables := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Server.TVariables.Create;

  Result := FVariables;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Server.GetVariablesStored: Boolean;
begin
  Result := Assigned(FVariables);
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.Server.TVariables }

destructor TOpenAPIDefinition.TOpenAPIDefinition.Server.TVariables.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Server.TVariables.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.ServerVariable>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.ServerVariable>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Server.TVariables.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.ServerVariable }

function TOpenAPIDefinition.TOpenAPIDefinition.ServerVariable.GetEnumStored: Boolean;
begin
  Result := Assigned(FEnum);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.ServerVariable.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.Components }

destructor TOpenAPIDefinition.TOpenAPIDefinition.Components.Destroy;
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

  FMediaTypes.Free;

  FPatternProperty.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Components.GetSchemas: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Components.TSchemas;
begin
  if not Assigned(FSchemas) then
    FSchemas := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Components.TSchemas.Create;

  Result := FSchemas;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Components.GetSchemasStored: Boolean;
begin
  Result := Assigned(FSchemas);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Components.GetResponses: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Components.TResponses;
begin
  if not Assigned(FResponses) then
    FResponses := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Components.TResponses.Create;

  Result := FResponses;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Components.GetResponsesStored: Boolean;
begin
  Result := Assigned(FResponses);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Components.GetParameters: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Components.TParameters;
begin
  if not Assigned(FParameters) then
    FParameters := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Components.TParameters.Create;

  Result := FParameters;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Components.GetParametersStored: Boolean;
begin
  Result := Assigned(FParameters);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Components.GetExamples: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Components.TExamples;
begin
  if not Assigned(FExamples) then
    FExamples := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Components.TExamples.Create;

  Result := FExamples;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Components.GetExamplesStored: Boolean;
begin
  Result := Assigned(FExamples);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Components.GetRequestBodies: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Components.TRequestBodies;
begin
  if not Assigned(FRequestBodies) then
    FRequestBodies := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Components.TRequestBodies.Create;

  Result := FRequestBodies;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Components.GetRequestBodiesStored: Boolean;
begin
  Result := Assigned(FRequestBodies);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Components.GetHeaders: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Components.THeaders;
begin
  if not Assigned(FHeaders) then
    FHeaders := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Components.THeaders.Create;

  Result := FHeaders;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Components.GetHeadersStored: Boolean;
begin
  Result := Assigned(FHeaders);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Components.GetSecuritySchemes: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Components.TSecuritySchemes;
begin
  if not Assigned(FSecuritySchemes) then
    FSecuritySchemes := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Components.TSecuritySchemes.Create;

  Result := FSecuritySchemes;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Components.GetSecuritySchemesStored: Boolean;
begin
  Result := Assigned(FSecuritySchemes);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Components.GetLinks: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Components.TLinks;
begin
  if not Assigned(FLinks) then
    FLinks := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Components.TLinks.Create;

  Result := FLinks;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Components.GetLinksStored: Boolean;
begin
  Result := Assigned(FLinks);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Components.GetCallbacks: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Components.TCallbacks;
begin
  if not Assigned(FCallbacks) then
    FCallbacks := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Components.TCallbacks.Create;

  Result := FCallbacks;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Components.GetCallbacksStored: Boolean;
begin
  Result := Assigned(FCallbacks);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Components.GetPathItems: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Components.TPathItems;
begin
  if not Assigned(FPathItems) then
    FPathItems := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Components.TPathItems.Create;

  Result := FPathItems;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Components.GetPathItemsStored: Boolean;
begin
  Result := Assigned(FPathItems);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Components.GetMediaTypes: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Components.TMediaTypes;
begin
  if not Assigned(FMediaTypes) then
    FMediaTypes := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Components.TMediaTypes.Create;

  Result := FMediaTypes;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Components.GetMediaTypesStored: Boolean;
begin
  Result := Assigned(FMediaTypes);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Components.GetPatternProperty: TDynamicProperty<any>;
begin
  if not Assigned(FPatternProperty) then
    FPatternProperty := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FPatternProperty;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Components.GetPatternPropertyStored: Boolean;
begin
  Result := Assigned(FPatternProperty);
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.Components.TSchemas }

destructor TOpenAPIDefinition.TOpenAPIDefinition.Components.TSchemas.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Components.TSchemas.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Components.TSchemas.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.Components.TResponses }

destructor TOpenAPIDefinition.TOpenAPIDefinition.Components.TResponses.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Components.TResponses.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.ResponseOrReference>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.ResponseOrReference>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Components.TResponses.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.Components.TParameters }

destructor TOpenAPIDefinition.TOpenAPIDefinition.Components.TParameters.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Components.TParameters.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.ParameterOrReference>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.ParameterOrReference>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Components.TParameters.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.Components.TExamples }

destructor TOpenAPIDefinition.TOpenAPIDefinition.Components.TExamples.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Components.TExamples.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.ExampleOrReference>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.ExampleOrReference>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Components.TExamples.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.Components.TRequestBodies }

destructor TOpenAPIDefinition.TOpenAPIDefinition.Components.TRequestBodies.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Components.TRequestBodies.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.RequestBodyOrReference>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.RequestBodyOrReference>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Components.TRequestBodies.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.Components.THeaders }

destructor TOpenAPIDefinition.TOpenAPIDefinition.Components.THeaders.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Components.THeaders.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.HeaderOrReference>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.HeaderOrReference>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Components.THeaders.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.Components.TSecuritySchemes }

destructor TOpenAPIDefinition.TOpenAPIDefinition.Components.TSecuritySchemes.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Components.TSecuritySchemes.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.SecuritySchemeOrReference>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.SecuritySchemeOrReference>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Components.TSecuritySchemes.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.Components.TLinks }

destructor TOpenAPIDefinition.TOpenAPIDefinition.Components.TLinks.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Components.TLinks.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.LinkOrReference>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.LinkOrReference>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Components.TLinks.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.Components.TCallbacks }

destructor TOpenAPIDefinition.TOpenAPIDefinition.Components.TCallbacks.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Components.TCallbacks.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.CallbacksOrReference>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.CallbacksOrReference>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Components.TCallbacks.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.Components.TPathItems }

destructor TOpenAPIDefinition.TOpenAPIDefinition.Components.TPathItems.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Components.TPathItems.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.PathItem>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.PathItem>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Components.TPathItems.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.Components.TMediaTypes }

destructor TOpenAPIDefinition.TOpenAPIDefinition.Components.TMediaTypes.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Components.TMediaTypes.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.MediaTypeOrReference>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.MediaTypeOrReference>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Components.TMediaTypes.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.Paths }

destructor TOpenAPIDefinition.TOpenAPIDefinition.Paths.Destroy;
begin
  FPathItem.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Paths.GetPathItem: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.PathItem>;
begin
  if not Assigned(FPathItem) then
    FPathItem := TDynamicProperty<Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.PathItem>.Create;

  Result := FPathItem;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Paths.GetPathItemStored: Boolean;
begin
  Result := Assigned(FPathItem);
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.PathItem }

destructor TOpenAPIDefinition.TOpenAPIDefinition.PathItem.Destroy;
begin
  for var AObject in FServers do
    AObject.Free;

  for var AObject in FParameters do
    AObject.Free;

  FAdditionalOperations.Free;

  FGet.Free;

  FPut.Free;

  FPost.Free;

  FDelete.Free;

  FOptions.Free;

  FHead.Free;

  FPatch.Free;

  FTrace.Free;

  FQuery.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.PathItem.GetRefStored: Boolean;
begin
  Result := not FRef.IsEmpty;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.PathItem.GetSummaryStored: Boolean;
begin
  Result := not FSummary.IsEmpty;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.PathItem.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.PathItem.AddServers: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Server;
begin
  Result := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Server.Create;

  FServers := FServers + [Result];
end;

function TOpenAPIDefinition.TOpenAPIDefinition.PathItem.GetServersStored: Boolean;
begin
  Result := Assigned(FServers);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.PathItem.AddParameters: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.ParameterOrReference;
begin
  Result := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.ParameterOrReference.Create;

  FParameters := FParameters + [Result];
end;

function TOpenAPIDefinition.TOpenAPIDefinition.PathItem.GetParametersStored: Boolean;
begin
  Result := Assigned(FParameters);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.PathItem.GetAdditionalOperations: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.PathItem.TAdditionalOperations;
begin
  if not Assigned(FAdditionalOperations) then
    FAdditionalOperations := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.PathItem.TAdditionalOperations.Create;

  Result := FAdditionalOperations;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.PathItem.GetAdditionalOperationsStored: Boolean;
begin
  Result := Assigned(FAdditionalOperations);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.PathItem.GetGet: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Operation;
begin
  if not Assigned(FGet) then
    FGet := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Operation.Create;

  Result := FGet;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.PathItem.GetGetStored: Boolean;
begin
  Result := Assigned(FGet);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.PathItem.GetPut: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Operation;
begin
  if not Assigned(FPut) then
    FPut := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Operation.Create;

  Result := FPut;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.PathItem.GetPutStored: Boolean;
begin
  Result := Assigned(FPut);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.PathItem.GetPost: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Operation;
begin
  if not Assigned(FPost) then
    FPost := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Operation.Create;

  Result := FPost;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.PathItem.GetPostStored: Boolean;
begin
  Result := Assigned(FPost);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.PathItem.GetDelete: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Operation;
begin
  if not Assigned(FDelete) then
    FDelete := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Operation.Create;

  Result := FDelete;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.PathItem.GetDeleteStored: Boolean;
begin
  Result := Assigned(FDelete);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.PathItem.GetOptions: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Operation;
begin
  if not Assigned(FOptions) then
    FOptions := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Operation.Create;

  Result := FOptions;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.PathItem.GetOptionsStored: Boolean;
begin
  Result := Assigned(FOptions);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.PathItem.GetHead: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Operation;
begin
  if not Assigned(FHead) then
    FHead := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Operation.Create;

  Result := FHead;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.PathItem.GetHeadStored: Boolean;
begin
  Result := Assigned(FHead);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.PathItem.GetPatch: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Operation;
begin
  if not Assigned(FPatch) then
    FPatch := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Operation.Create;

  Result := FPatch;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.PathItem.GetPatchStored: Boolean;
begin
  Result := Assigned(FPatch);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.PathItem.GetTrace: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Operation;
begin
  if not Assigned(FTrace) then
    FTrace := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Operation.Create;

  Result := FTrace;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.PathItem.GetTraceStored: Boolean;
begin
  Result := Assigned(FTrace);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.PathItem.GetQuery: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Operation;
begin
  if not Assigned(FQuery) then
    FQuery := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Operation.Create;

  Result := FQuery;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.PathItem.GetQueryStored: Boolean;
begin
  Result := Assigned(FQuery);
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.PathItem.TAdditionalOperations }

destructor TOpenAPIDefinition.TOpenAPIDefinition.PathItem.TAdditionalOperations.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.PathItem.TAdditionalOperations.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.Operation>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Operation>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.PathItem.TAdditionalOperations.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.Operation }

destructor TOpenAPIDefinition.TOpenAPIDefinition.Operation.Destroy;
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

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Operation.GetTagsStored: Boolean;
begin
  Result := Assigned(FTags);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Operation.GetSummaryStored: Boolean;
begin
  Result := not FSummary.IsEmpty;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Operation.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Operation.GetExternalDocs: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.ExternalDocumentation;
begin
  if not Assigned(FExternalDocs) then
    FExternalDocs := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.ExternalDocumentation.Create;

  Result := FExternalDocs;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Operation.GetExternalDocsStored: Boolean;
begin
  Result := Assigned(FExternalDocs);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Operation.GetOperationIdStored: Boolean;
begin
  Result := not FOperationId.IsEmpty;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Operation.AddParameters: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.ParameterOrReference;
begin
  Result := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.ParameterOrReference.Create;

  FParameters := FParameters + [Result];
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Operation.GetParametersStored: Boolean;
begin
  Result := Assigned(FParameters);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Operation.GetRequestBody: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.RequestBodyOrReference;
begin
  if not Assigned(FRequestBody) then
    FRequestBody := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.RequestBodyOrReference.Create;

  Result := FRequestBody;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Operation.GetRequestBodyStored: Boolean;
begin
  Result := Assigned(FRequestBody);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Operation.GetResponses: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Responses;
begin
  if not Assigned(FResponses) then
    FResponses := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Responses.Create;

  Result := FResponses;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Operation.GetResponsesStored: Boolean;
begin
  Result := Assigned(FResponses);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Operation.GetCallbacks: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Operation.TCallbacks;
begin
  if not Assigned(FCallbacks) then
    FCallbacks := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Operation.TCallbacks.Create;

  Result := FCallbacks;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Operation.GetCallbacksStored: Boolean;
begin
  Result := Assigned(FCallbacks);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Operation.GetDeprecatedStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Operation.AddSecurity: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.SecurityRequirement;
begin
  Result := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.SecurityRequirement.Create;

  FSecurity := FSecurity + [Result];
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Operation.GetSecurityStored: Boolean;
begin
  Result := Assigned(FSecurity);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Operation.AddServers: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Server;
begin
  Result := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Server.Create;

  FServers := FServers + [Result];
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Operation.GetServersStored: Boolean;
begin
  Result := Assigned(FServers);
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.Operation.TCallbacks }

destructor TOpenAPIDefinition.TOpenAPIDefinition.Operation.TCallbacks.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Operation.TCallbacks.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.CallbacksOrReference>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.CallbacksOrReference>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Operation.TCallbacks.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.ExternalDocumentation }

function TOpenAPIDefinition.TOpenAPIDefinition.ExternalDocumentation.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.Parameter }

destructor TOpenAPIDefinition.TOpenAPIDefinition.Parameter.Destroy;
begin
  FSchema.Free;

  FContent.Free;

  FSpecificationExtensions.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Parameter.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Parameter.GetRequiredStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Parameter.GetDeprecatedStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Parameter.GetSchema: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.Create;

  Result := FSchema;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Parameter.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Parameter.GetContent: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Content;
begin
  if not Assigned(FContent) then
    FContent := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Content.Create;

  Result := FContent;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Parameter.GetContentStored: Boolean;
begin
  Result := Assigned(FContent);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Parameter.GetExamplesStored: Boolean;
begin
  Result := Assigned(FExamples);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Parameter.GetSpecificationExtensions: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.SpecificationExtensions;
begin
  if not Assigned(FSpecificationExtensions) then
    FSpecificationExtensions := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.SpecificationExtensions.Create;

  Result := FSpecificationExtensions;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Parameter.GetSpecificationExtensionsStored: Boolean;
begin
  Result := Assigned(FSpecificationExtensions);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Parameter.GetAllowEmptyValueStored: Boolean;
begin
  Result := False;
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.ParameterOrReference }

destructor TOpenAPIDefinition.TOpenAPIDefinition.ParameterOrReference.Destroy;
begin
  FReference.Free;

  FParameter.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.ParameterOrReference.GetReference: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.ParameterOrReference.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.ParameterOrReference.GetParameter: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Parameter;
begin
  if not Assigned(FParameter) then
    FParameter := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Parameter.Create;

  Result := FParameter;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.ParameterOrReference.GetParameterStored: Boolean;
begin
  Result := Assigned(FParameter);
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.RequestBody }

destructor TOpenAPIDefinition.TOpenAPIDefinition.RequestBody.Destroy;
begin
  FContent.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.RequestBody.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.RequestBody.GetContent: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Content;
begin
  if not Assigned(FContent) then
    FContent := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Content.Create;

  Result := FContent;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.RequestBody.GetRequiredStored: Boolean;
begin
  Result := False;
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.RequestBodyOrReference }

destructor TOpenAPIDefinition.TOpenAPIDefinition.RequestBodyOrReference.Destroy;
begin
  FReference.Free;

  FRequestBody.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.RequestBodyOrReference.GetReference: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.RequestBodyOrReference.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.RequestBodyOrReference.GetRequestBody: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.RequestBody;
begin
  if not Assigned(FRequestBody) then
    FRequestBody := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.RequestBody.Create;

  Result := FRequestBody;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.RequestBodyOrReference.GetRequestBodyStored: Boolean;
begin
  Result := Assigned(FRequestBody);
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.Content }

destructor TOpenAPIDefinition.TOpenAPIDefinition.Content.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Content.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.MediaTypeOrReference>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.MediaTypeOrReference>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Content.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.MediaType }

destructor TOpenAPIDefinition.TOpenAPIDefinition.MediaType.Destroy;
begin
  FSchema.Free;

  FItemSchema.Free;

  FEncoding.Free;

  for var AObject in FPrefixEncoding do
    AObject.Free;

  FItemEncoding.Free;

  FSpecificationExtensions.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.MediaType.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.MediaType.GetSchema: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.Create;

  Result := FSchema;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.MediaType.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.MediaType.GetItemSchema: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition;
begin
  if not Assigned(FItemSchema) then
    FItemSchema := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.Create;

  Result := FItemSchema;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.MediaType.GetItemSchemaStored: Boolean;
begin
  Result := Assigned(FItemSchema);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.MediaType.GetEncoding: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.MediaType.TEncoding;
begin
  if not Assigned(FEncoding) then
    FEncoding := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.MediaType.TEncoding.Create;

  Result := FEncoding;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.MediaType.GetEncodingStored: Boolean;
begin
  Result := Assigned(FEncoding);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.MediaType.AddPrefixEncoding: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Encoding;
begin
  Result := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Encoding.Create;

  FPrefixEncoding := FPrefixEncoding + [Result];
end;

function TOpenAPIDefinition.TOpenAPIDefinition.MediaType.GetPrefixEncodingStored: Boolean;
begin
  Result := Assigned(FPrefixEncoding);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.MediaType.GetItemEncoding: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Encoding;
begin
  if not Assigned(FItemEncoding) then
    FItemEncoding := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Encoding.Create;

  Result := FItemEncoding;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.MediaType.GetItemEncodingStored: Boolean;
begin
  Result := Assigned(FItemEncoding);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.MediaType.GetExamplesStored: Boolean;
begin
  Result := Assigned(FExamples);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.MediaType.GetSpecificationExtensions: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.SpecificationExtensions;
begin
  if not Assigned(FSpecificationExtensions) then
    FSpecificationExtensions := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.SpecificationExtensions.Create;

  Result := FSpecificationExtensions;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.MediaType.GetSpecificationExtensionsStored: Boolean;
begin
  Result := Assigned(FSpecificationExtensions);
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.MediaType.TEncoding }

destructor TOpenAPIDefinition.TOpenAPIDefinition.MediaType.TEncoding.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.MediaType.TEncoding.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.Encoding>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Encoding>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.MediaType.TEncoding.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.MediaTypeOrReference }

destructor TOpenAPIDefinition.TOpenAPIDefinition.MediaTypeOrReference.Destroy;
begin
  FReference.Free;

  FMediaType.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.MediaTypeOrReference.GetReference: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.MediaTypeOrReference.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.MediaTypeOrReference.GetMediaType: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.MediaType;
begin
  if not Assigned(FMediaType) then
    FMediaType := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.MediaType.Create;

  Result := FMediaType;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.MediaTypeOrReference.GetMediaTypeStored: Boolean;
begin
  Result := Assigned(FMediaType);
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.Encoding }

destructor TOpenAPIDefinition.TOpenAPIDefinition.Encoding.Destroy;
begin
  FHeaders.Free;

  FEncoding.Free;

  for var AObject in FPrefixEncoding do
    AObject.Free;

  FItemEncoding.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Encoding.GetContentTypeStored: Boolean;
begin
  Result := not FContentType.IsEmpty;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Encoding.GetHeaders: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Encoding.THeaders;
begin
  if not Assigned(FHeaders) then
    FHeaders := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Encoding.THeaders.Create;

  Result := FHeaders;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Encoding.GetHeadersStored: Boolean;
begin
  Result := Assigned(FHeaders);
end;

procedure TOpenAPIDefinition.TOpenAPIDefinition.Encoding.SetStyle(const Value: TOpenAPIDefinition.TOpenAPIDefinition.Encoding.TStyle);
begin
  FStyle := Value;
  FStyleIsStored := True;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Encoding.GetExplodeStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Encoding.GetAllowReservedStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Encoding.GetEncoding: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Encoding.TEncoding;
begin
  if not Assigned(FEncoding) then
    FEncoding := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Encoding.TEncoding.Create;

  Result := FEncoding;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Encoding.GetEncodingStored: Boolean;
begin
  Result := Assigned(FEncoding);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Encoding.AddPrefixEncoding: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Encoding;
begin
  Result := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Encoding.Create;

  FPrefixEncoding := FPrefixEncoding + [Result];
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Encoding.GetPrefixEncodingStored: Boolean;
begin
  Result := Assigned(FPrefixEncoding);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Encoding.GetItemEncoding: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Encoding;
begin
  if not Assigned(FItemEncoding) then
    FItemEncoding := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Encoding.Create;

  Result := FItemEncoding;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Encoding.GetItemEncodingStored: Boolean;
begin
  Result := Assigned(FItemEncoding);
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.Encoding.THeaders }

destructor TOpenAPIDefinition.TOpenAPIDefinition.Encoding.THeaders.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Encoding.THeaders.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.HeaderOrReference>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.HeaderOrReference>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Encoding.THeaders.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.Encoding.TEncoding }

destructor TOpenAPIDefinition.TOpenAPIDefinition.Encoding.TEncoding.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Encoding.TEncoding.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.Encoding>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Encoding>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Encoding.TEncoding.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.Responses }

destructor TOpenAPIDefinition.TOpenAPIDefinition.Responses.Destroy;
begin
  FDefault.Free;

  FResponseOrReference.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Responses.GetDefault: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.ResponseOrReference;
begin
  if not Assigned(FDefault) then
    FDefault := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.ResponseOrReference.Create;

  Result := FDefault;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Responses.GetDefaultStored: Boolean;
begin
  Result := Assigned(FDefault);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Responses.GetResponseOrReference: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.ResponseOrReference>;
begin
  if not Assigned(FResponseOrReference) then
    FResponseOrReference := TDynamicProperty<Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.ResponseOrReference>.Create;

  Result := FResponseOrReference;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Responses.GetResponseOrReferenceStored: Boolean;
begin
  Result := Assigned(FResponseOrReference);
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.Response }

destructor TOpenAPIDefinition.TOpenAPIDefinition.Response.Destroy;
begin
  FHeaders.Free;

  FContent.Free;

  FLinks.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Response.GetSummaryStored: Boolean;
begin
  Result := not FSummary.IsEmpty;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Response.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Response.GetHeaders: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Response.THeaders;
begin
  if not Assigned(FHeaders) then
    FHeaders := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Response.THeaders.Create;

  Result := FHeaders;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Response.GetHeadersStored: Boolean;
begin
  Result := Assigned(FHeaders);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Response.GetContent: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Content;
begin
  if not Assigned(FContent) then
    FContent := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Content.Create;

  Result := FContent;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Response.GetContentStored: Boolean;
begin
  Result := Assigned(FContent);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Response.GetLinks: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Response.TLinks;
begin
  if not Assigned(FLinks) then
    FLinks := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Response.TLinks.Create;

  Result := FLinks;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Response.GetLinksStored: Boolean;
begin
  Result := Assigned(FLinks);
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.Response.THeaders }

destructor TOpenAPIDefinition.TOpenAPIDefinition.Response.THeaders.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Response.THeaders.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.HeaderOrReference>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.HeaderOrReference>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Response.THeaders.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.Response.TLinks }

destructor TOpenAPIDefinition.TOpenAPIDefinition.Response.TLinks.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Response.TLinks.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.LinkOrReference>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.LinkOrReference>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Response.TLinks.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.ResponseOrReference }

destructor TOpenAPIDefinition.TOpenAPIDefinition.ResponseOrReference.Destroy;
begin
  FReference.Free;

  FResponse.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.ResponseOrReference.GetReference: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.ResponseOrReference.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.ResponseOrReference.GetResponse: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Response;
begin
  if not Assigned(FResponse) then
    FResponse := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Response.Create;

  Result := FResponse;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.ResponseOrReference.GetResponseStored: Boolean;
begin
  Result := Assigned(FResponse);
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.Callbacks }

destructor TOpenAPIDefinition.TOpenAPIDefinition.Callbacks.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Callbacks.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.PathItem>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.PathItem>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Callbacks.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.CallbacksOrReference }

destructor TOpenAPIDefinition.TOpenAPIDefinition.CallbacksOrReference.Destroy;
begin
  FReference.Free;

  FCallbacks.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.CallbacksOrReference.GetReference: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.CallbacksOrReference.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.CallbacksOrReference.GetCallbacks: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Callbacks;
begin
  if not Assigned(FCallbacks) then
    FCallbacks := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Callbacks.Create;

  Result := FCallbacks;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.CallbacksOrReference.GetCallbacksStored: Boolean;
begin
  Result := Assigned(FCallbacks);
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.Example }

function TOpenAPIDefinition.TOpenAPIDefinition.Example.GetSummaryStored: Boolean;
begin
  Result := not FSummary.IsEmpty;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Example.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Example.GetDataValueStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Example.GetSerializedValueStored: Boolean;
begin
  Result := not FSerializedValue.IsEmpty;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Example.GetValueStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Example.GetExternalValueStored: Boolean;
begin
  Result := not FExternalValue.IsEmpty;
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.ExampleOrReference }

destructor TOpenAPIDefinition.TOpenAPIDefinition.ExampleOrReference.Destroy;
begin
  FReference.Free;

  FExample.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.ExampleOrReference.GetReference: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.ExampleOrReference.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.ExampleOrReference.GetExample: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Example;
begin
  if not Assigned(FExample) then
    FExample := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Example.Create;

  Result := FExample;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.ExampleOrReference.GetExampleStored: Boolean;
begin
  Result := Assigned(FExample);
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.Link }

destructor TOpenAPIDefinition.TOpenAPIDefinition.Link.Destroy;
begin
  FParameters.Free;

  FServer.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Link.GetOperationRefStored: Boolean;
begin
  Result := not FOperationRef.IsEmpty;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Link.GetOperationIdStored: Boolean;
begin
  Result := not FOperationId.IsEmpty;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Link.GetParameters: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.MapOfStrings;
begin
  if not Assigned(FParameters) then
    FParameters := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.MapOfStrings.Create;

  Result := FParameters;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Link.GetParametersStored: Boolean;
begin
  Result := Assigned(FParameters);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Link.GetRequestBodyStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Link.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Link.GetServer: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Server;
begin
  if not Assigned(FServer) then
    FServer := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Server.Create;

  Result := FServer;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Link.GetServerStored: Boolean;
begin
  Result := Assigned(FServer);
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.LinkOrReference }

destructor TOpenAPIDefinition.TOpenAPIDefinition.LinkOrReference.Destroy;
begin
  FReference.Free;

  FLink.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.LinkOrReference.GetReference: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.LinkOrReference.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.LinkOrReference.GetLink: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Link;
begin
  if not Assigned(FLink) then
    FLink := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Link.Create;

  Result := FLink;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.LinkOrReference.GetLinkStored: Boolean;
begin
  Result := Assigned(FLink);
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.Header }

destructor TOpenAPIDefinition.TOpenAPIDefinition.Header.Destroy;
begin
  FSchema.Free;

  FContent.Free;

  FSpecificationExtensions.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Header.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Header.GetRequiredStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Header.GetDeprecatedStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Header.GetSchema: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.Create;

  Result := FSchema;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Header.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Header.GetContent: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Content;
begin
  if not Assigned(FContent) then
    FContent := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Content.Create;

  Result := FContent;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Header.GetContentStored: Boolean;
begin
  Result := Assigned(FContent);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Header.GetExamplesStored: Boolean;
begin
  Result := Assigned(FExamples);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Header.GetSpecificationExtensions: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.SpecificationExtensions;
begin
  if not Assigned(FSpecificationExtensions) then
    FSpecificationExtensions := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.SpecificationExtensions.Create;

  Result := FSpecificationExtensions;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Header.GetSpecificationExtensionsStored: Boolean;
begin
  Result := Assigned(FSpecificationExtensions);
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.HeaderOrReference }

destructor TOpenAPIDefinition.TOpenAPIDefinition.HeaderOrReference.Destroy;
begin
  FReference.Free;

  FHeader.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.HeaderOrReference.GetReference: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.HeaderOrReference.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.HeaderOrReference.GetHeader: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Header;
begin
  if not Assigned(FHeader) then
    FHeader := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Header.Create;

  Result := FHeader;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.HeaderOrReference.GetHeaderStored: Boolean;
begin
  Result := Assigned(FHeader);
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.Tag }

destructor TOpenAPIDefinition.TOpenAPIDefinition.Tag.Destroy;
begin
  FExternalDocs.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Tag.GetSummaryStored: Boolean;
begin
  Result := not FSummary.IsEmpty;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Tag.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Tag.GetExternalDocs: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.ExternalDocumentation;
begin
  if not Assigned(FExternalDocs) then
    FExternalDocs := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.ExternalDocumentation.Create;

  Result := FExternalDocs;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Tag.GetExternalDocsStored: Boolean;
begin
  Result := Assigned(FExternalDocs);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Tag.GetParentStored: Boolean;
begin
  Result := not FParent.IsEmpty;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Tag.GetKindStored: Boolean;
begin
  Result := not FKind.IsEmpty;
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.Reference }

function TOpenAPIDefinition.TOpenAPIDefinition.Reference.GetRefStored: Boolean;
begin
  Result := not FRef.IsEmpty;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Reference.GetSummaryStored: Boolean;
begin
  Result := not FSummary.IsEmpty;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Reference.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.Schema }

destructor TOpenAPIDefinition.TOpenAPIDefinition.Schema.Destroy;
begin
  FObject.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Schema.GetObject: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Schema.&Object;
begin
  if not Assigned(FObject) then
    FObject := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Schema.&Object.Create;

  Result := FObject;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Schema.GetObjectStored: Boolean;
begin
  Result := Assigned(FObject);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Schema.GetBooleanStored: Boolean;
begin
  Result := False;
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.SecurityScheme }

destructor TOpenAPIDefinition.TOpenAPIDefinition.SecurityScheme.Destroy;
begin
  FSpecificationExtensions.Free;

  FTypeApikey.Free;

  FTypeHttp.Free;

  FTypeHttpBearer.Free;

  FTypeOauth2.Free;

  FTypeOidc.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.SecurityScheme.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.SecurityScheme.GetDeprecatedStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.SecurityScheme.GetSpecificationExtensions: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.SpecificationExtensions;
begin
  if not Assigned(FSpecificationExtensions) then
    FSpecificationExtensions := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.SpecificationExtensions.Create;

  Result := FSpecificationExtensions;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.SecurityScheme.GetSpecificationExtensionsStored: Boolean;
begin
  Result := Assigned(FSpecificationExtensions);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.SecurityScheme.GetTypeApikey: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.SecurityScheme.TypeApikey;
begin
  if not Assigned(FTypeApikey) then
    FTypeApikey := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.SecurityScheme.TypeApikey.Create;

  Result := FTypeApikey;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.SecurityScheme.GetTypeApikeyStored: Boolean;
begin
  Result := Assigned(FTypeApikey);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.SecurityScheme.GetTypeHttp: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.SecurityScheme.TypeHttp;
begin
  if not Assigned(FTypeHttp) then
    FTypeHttp := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.SecurityScheme.TypeHttp.Create;

  Result := FTypeHttp;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.SecurityScheme.GetTypeHttpStored: Boolean;
begin
  Result := Assigned(FTypeHttp);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.SecurityScheme.GetTypeHttpBearer: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.SecurityScheme.TypeHttpBearer;
begin
  if not Assigned(FTypeHttpBearer) then
    FTypeHttpBearer := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.SecurityScheme.TypeHttpBearer.Create;

  Result := FTypeHttpBearer;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.SecurityScheme.GetTypeHttpBearerStored: Boolean;
begin
  Result := Assigned(FTypeHttpBearer);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.SecurityScheme.GetTypeOauth2: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.SecurityScheme.TypeOauth2;
begin
  if not Assigned(FTypeOauth2) then
    FTypeOauth2 := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.SecurityScheme.TypeOauth2.Create;

  Result := FTypeOauth2;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.SecurityScheme.GetTypeOauth2Stored: Boolean;
begin
  Result := Assigned(FTypeOauth2);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.SecurityScheme.GetTypeOidc: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.SecurityScheme.TypeOidc;
begin
  if not Assigned(FTypeOidc) then
    FTypeOidc := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.SecurityScheme.TypeOidc.Create;

  Result := FTypeOidc;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.SecurityScheme.GetTypeOidcStored: Boolean;
begin
  Result := Assigned(FTypeOidc);
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.SecurityScheme.TypeHttpBearer }

function TOpenAPIDefinition.TOpenAPIDefinition.SecurityScheme.TypeHttpBearer.GetBearerFormatStored: Boolean;
begin
  Result := not FBearerFormat.IsEmpty;
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.SecurityScheme.TypeOauth2 }

destructor TOpenAPIDefinition.TOpenAPIDefinition.SecurityScheme.TypeOauth2.Destroy;
begin
  FFlows.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.SecurityScheme.TypeOauth2.GetFlows: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows;
begin
  if not Assigned(FFlows) then
    FFlows := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows.Create;

  Result := FFlows;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.SecurityScheme.TypeOauth2.GetOauth2MetadataUrlStored: Boolean;
begin
  Result := not FOauth2MetadataUrl.IsEmpty;
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.SecuritySchemeOrReference }

destructor TOpenAPIDefinition.TOpenAPIDefinition.SecuritySchemeOrReference.Destroy;
begin
  FReference.Free;

  FSecurityScheme.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.SecuritySchemeOrReference.GetReference: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Reference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Reference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.SecuritySchemeOrReference.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.SecuritySchemeOrReference.GetSecurityScheme: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.SecurityScheme;
begin
  if not Assigned(FSecurityScheme) then
    FSecurityScheme := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.SecurityScheme.Create;

  Result := FSecurityScheme;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.SecuritySchemeOrReference.GetSecuritySchemeStored: Boolean;
begin
  Result := Assigned(FSecurityScheme);
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows }

destructor TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows.Destroy;
begin
  FImplicit.Free;

  FPassword.Free;

  FClientCredentials.Free;

  FAuthorizationCode.Free;

  FDeviceAuthorization.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows.GetImplicit: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows.Implicit;
begin
  if not Assigned(FImplicit) then
    FImplicit := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows.Implicit.Create;

  Result := FImplicit;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows.GetImplicitStored: Boolean;
begin
  Result := Assigned(FImplicit);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows.GetPassword: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows.Password;
begin
  if not Assigned(FPassword) then
    FPassword := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows.Password.Create;

  Result := FPassword;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows.GetPasswordStored: Boolean;
begin
  Result := Assigned(FPassword);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows.GetClientCredentials: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows.ClientCredentials;
begin
  if not Assigned(FClientCredentials) then
    FClientCredentials := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows.ClientCredentials.Create;

  Result := FClientCredentials;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows.GetClientCredentialsStored: Boolean;
begin
  Result := Assigned(FClientCredentials);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows.GetAuthorizationCode: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows.AuthorizationCode;
begin
  if not Assigned(FAuthorizationCode) then
    FAuthorizationCode := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows.AuthorizationCode.Create;

  Result := FAuthorizationCode;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows.GetAuthorizationCodeStored: Boolean;
begin
  Result := Assigned(FAuthorizationCode);
end;

function TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows.GetDeviceAuthorization: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows.DeviceAuthorization;
begin
  if not Assigned(FDeviceAuthorization) then
    FDeviceAuthorization := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows.DeviceAuthorization.Create;

  Result := FDeviceAuthorization;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows.GetDeviceAuthorizationStored: Boolean;
begin
  Result := Assigned(FDeviceAuthorization);
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows.Implicit }

destructor TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows.Implicit.Destroy;
begin
  FScopes.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows.Implicit.GetRefreshUrlStored: Boolean;
begin
  Result := not FRefreshUrl.IsEmpty;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows.Implicit.GetScopes: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.MapOfStrings;
begin
  if not Assigned(FScopes) then
    FScopes := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.MapOfStrings.Create;

  Result := FScopes;
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows.Password }

destructor TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows.Password.Destroy;
begin
  FScopes.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows.Password.GetRefreshUrlStored: Boolean;
begin
  Result := not FRefreshUrl.IsEmpty;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows.Password.GetScopes: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.MapOfStrings;
begin
  if not Assigned(FScopes) then
    FScopes := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.MapOfStrings.Create;

  Result := FScopes;
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows.ClientCredentials }

destructor TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows.ClientCredentials.Destroy;
begin
  FScopes.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows.ClientCredentials.GetRefreshUrlStored: Boolean;
begin
  Result := not FRefreshUrl.IsEmpty;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows.ClientCredentials.GetScopes: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.MapOfStrings;
begin
  if not Assigned(FScopes) then
    FScopes := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.MapOfStrings.Create;

  Result := FScopes;
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows.AuthorizationCode }

destructor TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows.AuthorizationCode.Destroy;
begin
  FScopes.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows.AuthorizationCode.GetRefreshUrlStored: Boolean;
begin
  Result := not FRefreshUrl.IsEmpty;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows.AuthorizationCode.GetScopes: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.MapOfStrings;
begin
  if not Assigned(FScopes) then
    FScopes := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.MapOfStrings.Create;

  Result := FScopes;
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows.DeviceAuthorization }

destructor TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows.DeviceAuthorization.Destroy;
begin
  FScopes.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows.DeviceAuthorization.GetRefreshUrlStored: Boolean;
begin
  Result := not FRefreshUrl.IsEmpty;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.OauthFlows.DeviceAuthorization.GetScopes: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.MapOfStrings;
begin
  if not Assigned(FScopes) then
    FScopes := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.MapOfStrings.Create;

  Result := FScopes;
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.SecurityRequirement }

destructor TOpenAPIDefinition.TOpenAPIDefinition.SecurityRequirement.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.SecurityRequirement.GetAdditionalProperties: TDynamicProperty<TArray<System.String>>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<TArray<System.String>>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.SecurityRequirement.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.SpecificationExtensions }

destructor TOpenAPIDefinition.TOpenAPIDefinition.SpecificationExtensions.Destroy;
begin
  FPatternProperty.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.SpecificationExtensions.GetPatternProperty: TDynamicProperty<any>;
begin
  if not Assigned(FPatternProperty) then
    FPatternProperty := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FPatternProperty;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.SpecificationExtensions.GetPatternPropertyStored: Boolean;
begin
  Result := Assigned(FPatternProperty);
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.Examples }

destructor TOpenAPIDefinition.TOpenAPIDefinition.Examples.Destroy;
begin
  FExamples.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Examples.GetExampleStored: Boolean;
begin
  Result := False;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Examples.GetExamples: Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Examples.TExamples;
begin
  if not Assigned(FExamples) then
    FExamples := Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.Examples.TExamples.Create;

  Result := FExamples;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Examples.GetExamplesStored: Boolean;
begin
  Result := Assigned(FExamples);
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.Examples.TExamples }

destructor TOpenAPIDefinition.TOpenAPIDefinition.Examples.TExamples.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Examples.TExamples.GetAdditionalProperties: TDynamicProperty<TOpenAPIDefinition.TOpenAPIDefinition.ExampleOrReference>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<Blue.Print.Open.API.Schema.v32.TOpenAPIDefinition.TOpenAPIDefinition.ExampleOrReference>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.Examples.TExamples.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.MapOfStrings }

destructor TOpenAPIDefinition.TOpenAPIDefinition.MapOfStrings.Destroy;
begin
  FAdditionalProperties.Free;

  inherited;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.MapOfStrings.GetAdditionalProperties: TDynamicProperty<System.String>;
begin
  if not Assigned(FAdditionalProperties) then
    FAdditionalProperties := TDynamicProperty<System.String>.Create;

  Result := FAdditionalProperties;
end;

function TOpenAPIDefinition.TOpenAPIDefinition.MapOfStrings.GetAdditionalPropertiesStored: Boolean;
begin
  Result := Assigned(FAdditionalProperties);
end;

{ TOpenAPIDefinition.TOpenAPIDefinition.ExplodeForForm }

function TOpenAPIDefinition.TOpenAPIDefinition.ExplodeForForm.GetExplodeStored: Boolean;
begin
  Result := False;
end;

end.
