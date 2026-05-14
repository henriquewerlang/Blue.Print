unit Blue.Print.Open.API.Schema.v31;

interface

{$M+}
{$SCOPEDENUMS ON}

// File generated from https://spec.openapis.org/oas/3.1/schema/2025-11-23;

uses Blue.Print.Types, Blue.Print.JSON.Draft2022.Schema;

type
  // Forward class declaration
  TOpenAPIDefinition = class;

  [Flat]
  TOpenAPIDefinition = class
  public type
    TWebhooks = class
    private
      FPathItem: TDynamicProperty<TOpenAPIDefinition.TPathItem>;

      function GetPathItem: TDynamicProperty<TOpenAPIDefinition.TPathItem>;
      function GetPathItemStored: Boolean;
    public
      destructor Destroy; override;

      property IsPathItemStored: Boolean read GetPathItemStored;
    published
      [FieldName('path-item')]
      property PathItem: TDynamicProperty<TOpenAPIDefinition.TPathItem> read GetPathItem write FPathItem stored GetPathItemStored;
    end;

    TInfo = class
    private
      FTitle: System.String;
      FSummary: System.String;
      FDescription: System.String;
      FTermsOfService: System.String;
      FContact: TOpenAPIDefinition.TContact;
      FLicense: TOpenAPIDefinition.TLicense;
      FVersion: System.String;

      function GetContact: TOpenAPIDefinition.TContact;
      function GetLicense: TOpenAPIDefinition.TLicense;
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
      property contact: TOpenAPIDefinition.TContact read GetContact write FContact stored GetContactStored;
      property license: TOpenAPIDefinition.TLicense read GetLicense write FLicense stored GetLicenseStored;
      property version: System.String read FVersion write FVersion;
    end;

    TContact = class
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

    TLicense = class
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

    TServer = class
    public type
      TVariables = class
      private
        FServerVariable: TDynamicProperty<TOpenAPIDefinition.TServerVariable>;

        function GetServerVariable: TDynamicProperty<TOpenAPIDefinition.TServerVariable>;
        function GetServerVariableStored: Boolean;
      public
        destructor Destroy; override;

        property IsServerVariableStored: Boolean read GetServerVariableStored;
      published
        [FieldName('server-variable')]
        property ServerVariable: TDynamicProperty<TOpenAPIDefinition.TServerVariable> read GetServerVariable write FServerVariable stored GetServerVariableStored;
      end;
    private
      FUrl: System.String;
      FDescription: System.String;
      FVariables: TOpenAPIDefinition.TServer.TVariables;

      function GetVariables: TOpenAPIDefinition.TServer.TVariables;
      function GetDescriptionStored: Boolean;
      function GetVariablesStored: Boolean;
    public
      destructor Destroy; override;

      property IsDescriptionStored: Boolean read GetDescriptionStored;
      property IsVariablesStored: Boolean read GetVariablesStored;
    published
      property url: System.String read FUrl write FUrl;
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      property variables: TOpenAPIDefinition.TServer.TVariables read GetVariables write FVariables stored GetVariablesStored;
    end;

    TServerVariable = class
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

    TComponents = class
    public type
      TSchemas = class
      private
        FSchemas: TDynamicProperty<TOpenAPIDefinition>;

        function GetSchemas: TDynamicProperty<TOpenAPIDefinition>;
        function GetSchemasStored: Boolean;
      public
        destructor Destroy; override;

        property IsSchemasStored: Boolean read GetSchemasStored;
      published
        property Schemas: TDynamicProperty<TOpenAPIDefinition> read GetSchemas write FSchemas stored GetSchemasStored;
      end;

      TResponses = class
      private
        FResponseOrReference: TDynamicProperty<TOpenAPIDefinition.TResponseOrReference>;

        function GetResponseOrReference: TDynamicProperty<TOpenAPIDefinition.TResponseOrReference>;
        function GetResponseOrReferenceStored: Boolean;
      public
        destructor Destroy; override;

        property IsResponseOrReferenceStored: Boolean read GetResponseOrReferenceStored;
      published
        [FieldName('response-or-reference')]
        property ResponseOrReference: TDynamicProperty<TOpenAPIDefinition.TResponseOrReference> read GetResponseOrReference write FResponseOrReference stored GetResponseOrReferenceStored;
      end;

      TParameters = class
      private
        FParameterOrReference: TDynamicProperty<TOpenAPIDefinition.TParameterOrReference>;

        function GetParameterOrReference: TDynamicProperty<TOpenAPIDefinition.TParameterOrReference>;
        function GetParameterOrReferenceStored: Boolean;
      public
        destructor Destroy; override;

        property IsParameterOrReferenceStored: Boolean read GetParameterOrReferenceStored;
      published
        [FieldName('parameter-or-reference')]
        property ParameterOrReference: TDynamicProperty<TOpenAPIDefinition.TParameterOrReference> read GetParameterOrReference write FParameterOrReference stored GetParameterOrReferenceStored;
      end;

      TExamples = class
      private
        FExampleOrReference: TDynamicProperty<TOpenAPIDefinition.TExampleOrReference>;

        function GetExampleOrReference: TDynamicProperty<TOpenAPIDefinition.TExampleOrReference>;
        function GetExampleOrReferenceStored: Boolean;
      public
        destructor Destroy; override;

        property IsExampleOrReferenceStored: Boolean read GetExampleOrReferenceStored;
      published
        [FieldName('example-or-reference')]
        property ExampleOrReference: TDynamicProperty<TOpenAPIDefinition.TExampleOrReference> read GetExampleOrReference write FExampleOrReference stored GetExampleOrReferenceStored;
      end;

      TRequestBodies = class
      private
        FRequestBodyOrReference: TDynamicProperty<TOpenAPIDefinition.TRequestBodyOrReference>;

        function GetRequestBodyOrReference: TDynamicProperty<TOpenAPIDefinition.TRequestBodyOrReference>;
        function GetRequestBodyOrReferenceStored: Boolean;
      public
        destructor Destroy; override;

        property IsRequestBodyOrReferenceStored: Boolean read GetRequestBodyOrReferenceStored;
      published
        [FieldName('request-body-or-reference')]
        property RequestBodyOrReference: TDynamicProperty<TOpenAPIDefinition.TRequestBodyOrReference> read GetRequestBodyOrReference write FRequestBodyOrReference stored GetRequestBodyOrReferenceStored;
      end;

      THeaders = class
      private
        FHeaderOrReference: TDynamicProperty<TOpenAPIDefinition.THeaderOrReference>;

        function GetHeaderOrReference: TDynamicProperty<TOpenAPIDefinition.THeaderOrReference>;
        function GetHeaderOrReferenceStored: Boolean;
      public
        destructor Destroy; override;

        property IsHeaderOrReferenceStored: Boolean read GetHeaderOrReferenceStored;
      published
        [FieldName('header-or-reference')]
        property HeaderOrReference: TDynamicProperty<TOpenAPIDefinition.THeaderOrReference> read GetHeaderOrReference write FHeaderOrReference stored GetHeaderOrReferenceStored;
      end;

      TSecuritySchemes = class
      private
        FSecuritySchemeOrReference: TDynamicProperty<TOpenAPIDefinition.TSecuritySchemeOrReference>;

        function GetSecuritySchemeOrReference: TDynamicProperty<TOpenAPIDefinition.TSecuritySchemeOrReference>;
        function GetSecuritySchemeOrReferenceStored: Boolean;
      public
        destructor Destroy; override;

        property IsSecuritySchemeOrReferenceStored: Boolean read GetSecuritySchemeOrReferenceStored;
      published
        [FieldName('security-scheme-or-reference')]
        property SecuritySchemeOrReference: TDynamicProperty<TOpenAPIDefinition.TSecuritySchemeOrReference> read GetSecuritySchemeOrReference write FSecuritySchemeOrReference stored GetSecuritySchemeOrReferenceStored;
      end;

      TLinks = class
      private
        FLinkOrReference: TDynamicProperty<TOpenAPIDefinition.TLinkOrReference>;

        function GetLinkOrReference: TDynamicProperty<TOpenAPIDefinition.TLinkOrReference>;
        function GetLinkOrReferenceStored: Boolean;
      public
        destructor Destroy; override;

        property IsLinkOrReferenceStored: Boolean read GetLinkOrReferenceStored;
      published
        [FieldName('link-or-reference')]
        property LinkOrReference: TDynamicProperty<TOpenAPIDefinition.TLinkOrReference> read GetLinkOrReference write FLinkOrReference stored GetLinkOrReferenceStored;
      end;

      TCallbacks = class
      private
        FCallbacksOrReference: TDynamicProperty<TOpenAPIDefinition.TCallbacksOrReference>;

        function GetCallbacksOrReference: TDynamicProperty<TOpenAPIDefinition.TCallbacksOrReference>;
        function GetCallbacksOrReferenceStored: Boolean;
      public
        destructor Destroy; override;

        property IsCallbacksOrReferenceStored: Boolean read GetCallbacksOrReferenceStored;
      published
        [FieldName('callbacks-or-reference')]
        property CallbacksOrReference: TDynamicProperty<TOpenAPIDefinition.TCallbacksOrReference> read GetCallbacksOrReference write FCallbacksOrReference stored GetCallbacksOrReferenceStored;
      end;

      TPathItems = class
      private
        FPathItem: TDynamicProperty<TOpenAPIDefinition.TPathItem>;

        function GetPathItem: TDynamicProperty<TOpenAPIDefinition.TPathItem>;
        function GetPathItemStored: Boolean;
      public
        destructor Destroy; override;

        property IsPathItemStored: Boolean read GetPathItemStored;
      published
        [FieldName('path-item')]
        property PathItem: TDynamicProperty<TOpenAPIDefinition.TPathItem> read GetPathItem write FPathItem stored GetPathItemStored;
      end;
    private
      FSchemas: TOpenAPIDefinition.TComponents.TSchemas;
      FResponses: TOpenAPIDefinition.TComponents.TResponses;
      FParameters: TOpenAPIDefinition.TComponents.TParameters;
      FExamples: TOpenAPIDefinition.TComponents.TExamples;
      FRequestBodies: TOpenAPIDefinition.TComponents.TRequestBodies;
      FHeaders: TOpenAPIDefinition.TComponents.THeaders;
      FSecuritySchemes: TOpenAPIDefinition.TComponents.TSecuritySchemes;
      FLinks: TOpenAPIDefinition.TComponents.TLinks;
      FCallbacks: TOpenAPIDefinition.TComponents.TCallbacks;
      FPathItems: TOpenAPIDefinition.TComponents.TPathItems;
      FSpecificationExtensions: TDynamicProperty<any>;

      function GetSchemas: TOpenAPIDefinition.TComponents.TSchemas;
      function GetResponses: TOpenAPIDefinition.TComponents.TResponses;
      function GetParameters: TOpenAPIDefinition.TComponents.TParameters;
      function GetExamples: TOpenAPIDefinition.TComponents.TExamples;
      function GetRequestBodies: TOpenAPIDefinition.TComponents.TRequestBodies;
      function GetHeaders: TOpenAPIDefinition.TComponents.THeaders;
      function GetSecuritySchemes: TOpenAPIDefinition.TComponents.TSecuritySchemes;
      function GetLinks: TOpenAPIDefinition.TComponents.TLinks;
      function GetCallbacks: TOpenAPIDefinition.TComponents.TCallbacks;
      function GetPathItems: TOpenAPIDefinition.TComponents.TPathItems;
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
      property schemas: TOpenAPIDefinition.TComponents.TSchemas read GetSchemas write FSchemas stored GetSchemasStored;
      property responses: TOpenAPIDefinition.TComponents.TResponses read GetResponses write FResponses stored GetResponsesStored;
      property parameters: TOpenAPIDefinition.TComponents.TParameters read GetParameters write FParameters stored GetParametersStored;
      property examples: TOpenAPIDefinition.TComponents.TExamples read GetExamples write FExamples stored GetExamplesStored;
      property requestBodies: TOpenAPIDefinition.TComponents.TRequestBodies read GetRequestBodies write FRequestBodies stored GetRequestBodiesStored;
      property headers: TOpenAPIDefinition.TComponents.THeaders read GetHeaders write FHeaders stored GetHeadersStored;
      property securitySchemes: TOpenAPIDefinition.TComponents.TSecuritySchemes read GetSecuritySchemes write FSecuritySchemes stored GetSecuritySchemesStored;
      property links: TOpenAPIDefinition.TComponents.TLinks read GetLinks write FLinks stored GetLinksStored;
      property callbacks: TOpenAPIDefinition.TComponents.TCallbacks read GetCallbacks write FCallbacks stored GetCallbacksStored;
      property pathItems: TOpenAPIDefinition.TComponents.TPathItems read GetPathItems write FPathItems stored GetPathItemsStored;
      [PatternProperty('^(?:schemas|responses|parameters|examples|requestBodies|headers|securitySchemes|links|callbacks|pathItems)$')]
      [FieldName('specification-extensions')]
      property SpecificationExtensions: TDynamicProperty<any> read GetSpecificationExtensions write FSpecificationExtensions stored GetSpecificationExtensionsStored;
    end;

    TPaths = class
    private
      FSpecificationExtensions: TDynamicProperty<TOpenAPIDefinition.TPathItem>;

      function GetSpecificationExtensions: TDynamicProperty<TOpenAPIDefinition.TPathItem>;
      function GetSpecificationExtensionsStored: Boolean;
    public
      destructor Destroy; override;

      property IsSpecificationExtensionsStored: Boolean read GetSpecificationExtensionsStored;
    published
      [PatternProperty('^/')]
      [FieldName('specification-extensions')]
      property SpecificationExtensions: TDynamicProperty<TOpenAPIDefinition.TPathItem> read GetSpecificationExtensions write FSpecificationExtensions stored GetSpecificationExtensionsStored;
    end;

    TPathItem = class
    private
      FRef: System.String;
      FSummary: System.String;
      FDescription: System.String;
      FServers: TArray<TOpenAPIDefinition.TServer>;
      FParameters: TArray<TOpenAPIDefinition.TParameterOrReference>;
      FGet: TOpenAPIDefinition.TOperation;
      FPut: TOpenAPIDefinition.TOperation;
      FPost: TOpenAPIDefinition.TOperation;
      FDelete: TOpenAPIDefinition.TOperation;
      FOptions: TOpenAPIDefinition.TOperation;
      FHead: TOpenAPIDefinition.TOperation;
      FPatch: TOpenAPIDefinition.TOperation;
      FTrace: TOpenAPIDefinition.TOperation;

      function GetGet: TOpenAPIDefinition.TOperation;
      function GetPut: TOpenAPIDefinition.TOperation;
      function GetPost: TOpenAPIDefinition.TOperation;
      function GetDelete: TOpenAPIDefinition.TOperation;
      function GetOptions: TOpenAPIDefinition.TOperation;
      function GetHead: TOpenAPIDefinition.TOperation;
      function GetPatch: TOpenAPIDefinition.TOperation;
      function GetTrace: TOpenAPIDefinition.TOperation;
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

      function AddServers: TOpenAPIDefinition.TServer;
      function AddParameters: TOpenAPIDefinition.TParameterOrReference;

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
      property servers: TArray<TOpenAPIDefinition.TServer> read FServers write FServers stored GetServersStored;
      property parameters: TArray<TOpenAPIDefinition.TParameterOrReference> read FParameters write FParameters stored GetParametersStored;
      property get: TOpenAPIDefinition.TOperation read GetGet write FGet stored GetGetStored;
      property put: TOpenAPIDefinition.TOperation read GetPut write FPut stored GetPutStored;
      property post: TOpenAPIDefinition.TOperation read GetPost write FPost stored GetPostStored;
      property delete: TOpenAPIDefinition.TOperation read GetDelete write FDelete stored GetDeleteStored;
      property options: TOpenAPIDefinition.TOperation read GetOptions write FOptions stored GetOptionsStored;
      property head: TOpenAPIDefinition.TOperation read GetHead write FHead stored GetHeadStored;
      property patch: TOpenAPIDefinition.TOperation read GetPatch write FPatch stored GetPatchStored;
      property trace: TOpenAPIDefinition.TOperation read GetTrace write FTrace stored GetTraceStored;
    end;

    TOperation = class
    public type
      TCallbacks = class
      private
        FCallbacksOrReference: TDynamicProperty<TOpenAPIDefinition.TCallbacksOrReference>;

        function GetCallbacksOrReference: TDynamicProperty<TOpenAPIDefinition.TCallbacksOrReference>;
        function GetCallbacksOrReferenceStored: Boolean;
      public
        destructor Destroy; override;

        property IsCallbacksOrReferenceStored: Boolean read GetCallbacksOrReferenceStored;
      published
        [FieldName('callbacks-or-reference')]
        property CallbacksOrReference: TDynamicProperty<TOpenAPIDefinition.TCallbacksOrReference> read GetCallbacksOrReference write FCallbacksOrReference stored GetCallbacksOrReferenceStored;
      end;
    private
      FTags: TArray<System.String>;
      FSummary: System.String;
      FDescription: System.String;
      FExternalDocs: TOpenAPIDefinition.TExternalDocumentation;
      FOperationId: System.String;
      FParameters: TArray<TOpenAPIDefinition.TParameterOrReference>;
      FRequestBody: TOpenAPIDefinition.TRequestBodyOrReference;
      FResponses: TOpenAPIDefinition.TResponses;
      FCallbacks: TOpenAPIDefinition.TOperation.TCallbacks;
      FDeprecated: System.Boolean;
      FSecurity: TArray<TOpenAPIDefinition.TSecurityRequirement>;
      FServers: TArray<TOpenAPIDefinition.TServer>;
      FDeprecatedIsStored: Boolean;

      function GetExternalDocs: TOpenAPIDefinition.TExternalDocumentation;
      function GetRequestBody: TOpenAPIDefinition.TRequestBodyOrReference;
      function GetResponses: TOpenAPIDefinition.TResponses;
      function GetCallbacks: TOpenAPIDefinition.TOperation.TCallbacks;
      function GetTagsStored: Boolean;
      function GetSummaryStored: Boolean;
      function GetDescriptionStored: Boolean;
      function GetExternalDocsStored: Boolean;
      function GetOperationIdStored: Boolean;
      function GetParametersStored: Boolean;
      function GetRequestBodyStored: Boolean;
      function GetResponsesStored: Boolean;
      function GetCallbacksStored: Boolean;
      function GetSecurityStored: Boolean;
      function GetServersStored: Boolean;
      procedure SetDeprecated(const Value: System.Boolean);
    public
      destructor Destroy; override;

      function AddParameters: TOpenAPIDefinition.TParameterOrReference;
      function AddSecurity: TOpenAPIDefinition.TSecurityRequirement;
      function AddServers: TOpenAPIDefinition.TServer;

      property IsTagsStored: Boolean read GetTagsStored;
      property IsSummaryStored: Boolean read GetSummaryStored;
      property IsDescriptionStored: Boolean read GetDescriptionStored;
      property IsExternalDocsStored: Boolean read GetExternalDocsStored;
      property IsOperationIdStored: Boolean read GetOperationIdStored;
      property IsParametersStored: Boolean read GetParametersStored;
      property IsRequestBodyStored: Boolean read GetRequestBodyStored;
      property IsResponsesStored: Boolean read GetResponsesStored;
      property IsCallbacksStored: Boolean read GetCallbacksStored;
      property IsDeprecatedStored: Boolean read FDeprecatedIsStored;
      property IsSecurityStored: Boolean read GetSecurityStored;
      property IsServersStored: Boolean read GetServersStored;
    published
      property tags: TArray<System.String> read FTags write FTags stored GetTagsStored;
      property summary: System.String read FSummary write FSummary stored GetSummaryStored;
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      property externalDocs: TOpenAPIDefinition.TExternalDocumentation read GetExternalDocs write FExternalDocs stored GetExternalDocsStored;
      property operationId: System.String read FOperationId write FOperationId stored GetOperationIdStored;
      property parameters: TArray<TOpenAPIDefinition.TParameterOrReference> read FParameters write FParameters stored GetParametersStored;
      property requestBody: TOpenAPIDefinition.TRequestBodyOrReference read GetRequestBody write FRequestBody stored GetRequestBodyStored;
      property responses: TOpenAPIDefinition.TResponses read GetResponses write FResponses stored GetResponsesStored;
      property callbacks: TOpenAPIDefinition.TOperation.TCallbacks read GetCallbacks write FCallbacks stored GetCallbacksStored;
      property deprecated: System.Boolean read FDeprecated write SetDeprecated stored FDeprecatedIsStored;
      property security: TArray<TOpenAPIDefinition.TSecurityRequirement> read FSecurity write FSecurity stored GetSecurityStored;
      property servers: TArray<TOpenAPIDefinition.TServer> read FServers write FServers stored GetServersStored;
    end;

    TExternalDocumentation = class
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
    TParameter = class
    public type
      TIn = (query, header, path, cookie);
    private
      FName: System.String;
      FIn: TOpenAPIDefinition.TParameter.TIn;
      FDescription: System.String;
      FRequired: System.Boolean;
      FDeprecated: System.Boolean;
      FSchema: TOpenAPIDefinition;
      FContent: TOpenAPIDefinition.TContent;
      FAllowEmptyValue: System.Boolean;
      FRequiredIsStored: Boolean;
      FDeprecatedIsStored: Boolean;
      FAllowEmptyValueIsStored: Boolean;

      function GetSchema: TOpenAPIDefinition;
      function GetContent: TOpenAPIDefinition.TContent;
      function GetDescriptionStored: Boolean;
      function GetSchemaStored: Boolean;
      function GetContentStored: Boolean;
      procedure SetRequired(const Value: System.Boolean);
      procedure SetDeprecated(const Value: System.Boolean);
      procedure SetAllowEmptyValue(const Value: System.Boolean);
    public
      destructor Destroy; override;

      property IsDescriptionStored: Boolean read GetDescriptionStored;
      property IsRequiredStored: Boolean read FRequiredIsStored;
      property IsDeprecatedStored: Boolean read FDeprecatedIsStored;
      property IsSchemaStored: Boolean read GetSchemaStored;
      property IsContentStored: Boolean read GetContentStored;
      property IsAllowEmptyValueStored: Boolean read FAllowEmptyValueIsStored;
    published
      property name: System.String read FName write FName;
      [FieldName('in')]
      property &In: TOpenAPIDefinition.TParameter.TIn read FIn write FIn;
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      property required: System.Boolean read FRequired write SetRequired stored FRequiredIsStored;
      property deprecated: System.Boolean read FDeprecated write SetDeprecated stored FDeprecatedIsStored;
      property schema: TOpenAPIDefinition read GetSchema write FSchema stored GetSchemaStored;
      property content: TOpenAPIDefinition.TContent read GetContent write FContent stored GetContentStored;
      property allowEmptyValue: System.Boolean read FAllowEmptyValue write SetAllowEmptyValue stored FAllowEmptyValueIsStored;
    end;

    [Flat]
    TParameterOrReference = class
    private
      FReference: TOpenAPIDefinition.TReference;
      FParameter: TOpenAPIDefinition.TParameter;

      function GetReference: TOpenAPIDefinition.TReference;
      function GetParameter: TOpenAPIDefinition.TParameter;
      function GetReferenceStored: Boolean;
      function GetParameterStored: Boolean;
    public
      destructor Destroy; override;

      property IsReferenceStored: Boolean read GetReferenceStored;
      property IsParameterStored: Boolean read GetParameterStored;
    published
      property reference: TOpenAPIDefinition.TReference read GetReference write FReference stored GetReferenceStored;
      property parameter: TOpenAPIDefinition.TParameter read GetParameter write FParameter stored GetParameterStored;
    end;

    TRequestBody = class
    private
      FDescription: System.String;
      FContent: TOpenAPIDefinition.TContent;
      FRequired: System.Boolean;
      FRequiredIsStored: Boolean;

      function GetContent: TOpenAPIDefinition.TContent;
      function GetDescriptionStored: Boolean;
      procedure SetRequired(const Value: System.Boolean);
    public
      destructor Destroy; override;

      property IsDescriptionStored: Boolean read GetDescriptionStored;
      property IsRequiredStored: Boolean read FRequiredIsStored;
    published
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      property content: TOpenAPIDefinition.TContent read GetContent write FContent;
      property required: System.Boolean read FRequired write SetRequired stored FRequiredIsStored;
    end;

    [Flat]
    TRequestBodyOrReference = class
    private
      FReference: TOpenAPIDefinition.TReference;
      FRequestBody: TOpenAPIDefinition.TRequestBody;

      function GetReference: TOpenAPIDefinition.TReference;
      function GetRequestBody: TOpenAPIDefinition.TRequestBody;
      function GetReferenceStored: Boolean;
      function GetRequestBodyStored: Boolean;
    public
      destructor Destroy; override;

      property IsReferenceStored: Boolean read GetReferenceStored;
      property IsRequestBodyStored: Boolean read GetRequestBodyStored;
    published
      property reference: TOpenAPIDefinition.TReference read GetReference write FReference stored GetReferenceStored;
      [FieldName('request-body')]
      property RequestBody: TOpenAPIDefinition.TRequestBody read GetRequestBody write FRequestBody stored GetRequestBodyStored;
    end;

    TContent = class
    private
      FMediaType: TDynamicProperty<TOpenAPIDefinition.TMediaType>;

      function GetMediaType: TDynamicProperty<TOpenAPIDefinition.TMediaType>;
      function GetMediaTypeStored: Boolean;
    public
      destructor Destroy; override;

      property IsMediaTypeStored: Boolean read GetMediaTypeStored;
    published
      [FieldName('media-type')]
      property MediaType: TDynamicProperty<TOpenAPIDefinition.TMediaType> read GetMediaType write FMediaType stored GetMediaTypeStored;
    end;

    [Flat]
    TMediaType = class
    public type
      TEncoding = class
      private
        FEncoding: TDynamicProperty<TOpenAPIDefinition.TEncoding>;

        function GetEncoding: TDynamicProperty<TOpenAPIDefinition.TEncoding>;
        function GetEncodingStored: Boolean;
      public
        destructor Destroy; override;

        property IsEncodingStored: Boolean read GetEncodingStored;
      published
        property encoding: TDynamicProperty<TOpenAPIDefinition.TEncoding> read GetEncoding write FEncoding stored GetEncodingStored;
      end;
    private
      FSchema: TOpenAPIDefinition;
      FEncoding: TOpenAPIDefinition.TMediaType.TEncoding;
      FSpecificationExtensions: TOpenAPIDefinition.TSpecificationExtensions;
      FExamples: TOpenAPIDefinition.TExamples;

      function GetSchema: TOpenAPIDefinition;
      function GetEncoding: TOpenAPIDefinition.TMediaType.TEncoding;
      function GetSpecificationExtensions: TOpenAPIDefinition.TSpecificationExtensions;
      function GetExamples: TOpenAPIDefinition.TExamples;
      function GetSchemaStored: Boolean;
      function GetEncodingStored: Boolean;
      function GetSpecificationExtensionsStored: Boolean;
      function GetExamplesStored: Boolean;
    public
      destructor Destroy; override;

      property IsSchemaStored: Boolean read GetSchemaStored;
      property IsEncodingStored: Boolean read GetEncodingStored;
      property IsSpecificationExtensionsStored: Boolean read GetSpecificationExtensionsStored;
      property IsExamplesStored: Boolean read GetExamplesStored;
    published
      property schema: TOpenAPIDefinition read GetSchema write FSchema stored GetSchemaStored;
      property encoding: TOpenAPIDefinition.TMediaType.TEncoding read GetEncoding write FEncoding stored GetEncodingStored;
      [FieldName('specification-extensions')]
      property SpecificationExtensions: TOpenAPIDefinition.TSpecificationExtensions read GetSpecificationExtensions write FSpecificationExtensions stored GetSpecificationExtensionsStored;
      property examples: TOpenAPIDefinition.TExamples read GetExamples write FExamples stored GetExamplesStored;
    end;

    TEncoding = class
    public type
      TStyle = (form, spaceDelimited, pipeDelimited, deepObject);

      THeaders = class
      private
        FHeaderOrReference: TDynamicProperty<TOpenAPIDefinition.THeaderOrReference>;

        function GetHeaderOrReference: TDynamicProperty<TOpenAPIDefinition.THeaderOrReference>;
        function GetHeaderOrReferenceStored: Boolean;
      public
        destructor Destroy; override;

        property IsHeaderOrReferenceStored: Boolean read GetHeaderOrReferenceStored;
      published
        [FieldName('header-or-reference')]
        property HeaderOrReference: TDynamicProperty<TOpenAPIDefinition.THeaderOrReference> read GetHeaderOrReference write FHeaderOrReference stored GetHeaderOrReferenceStored;
      end;
    private
      FContentType: System.String;
      FHeaders: TOpenAPIDefinition.TEncoding.THeaders;
      FStyle: TOpenAPIDefinition.TEncoding.TStyle;
      FExplode: System.Boolean;
      FAllowReserved: System.Boolean;
      FStyleIsStored: Boolean;
      FExplodeIsStored: Boolean;
      FAllowReservedIsStored: Boolean;

      function GetHeaders: TOpenAPIDefinition.TEncoding.THeaders;
      function GetContentTypeStored: Boolean;
      function GetHeadersStored: Boolean;
      procedure SetStyle(const Value: TOpenAPIDefinition.TEncoding.TStyle);
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
      property headers: TOpenAPIDefinition.TEncoding.THeaders read GetHeaders write FHeaders stored GetHeadersStored;
      property style: TOpenAPIDefinition.TEncoding.TStyle read FStyle write SetStyle stored FStyleIsStored;
      property explode: System.Boolean read FExplode write SetExplode stored FExplodeIsStored;
      property allowReserved: System.Boolean read FAllowReserved write SetAllowReserved stored FAllowReservedIsStored;
    end;

    [Flat]
    TResponses = class
    private
      FDefault: TOpenAPIDefinition.TResponseOrReference;
      FSpecificationExtensions: TDynamicProperty<TOpenAPIDefinition.TResponseOrReference>;

      function GetDefault: TOpenAPIDefinition.TResponseOrReference;
      function GetSpecificationExtensions: TDynamicProperty<TOpenAPIDefinition.TResponseOrReference>;
      function GetDefaultStored: Boolean;
      function GetSpecificationExtensionsStored: Boolean;
    public
      destructor Destroy; override;

      property IsDefaultStored: Boolean read GetDefaultStored;
      property IsSpecificationExtensionsStored: Boolean read GetSpecificationExtensionsStored;
    published
      property default: TOpenAPIDefinition.TResponseOrReference read GetDefault write FDefault stored GetDefaultStored;
      [PatternProperty('^[1-5](?:[0-9]{2}|XX)$')]
      [FieldName('specification-extensions')]
      property SpecificationExtensions: TDynamicProperty<TOpenAPIDefinition.TResponseOrReference> read GetSpecificationExtensions write FSpecificationExtensions stored GetSpecificationExtensionsStored;
    end;

    TResponse = class
    public type
      THeaders = class
      private
        FHeaderOrReference: TDynamicProperty<TOpenAPIDefinition.THeaderOrReference>;

        function GetHeaderOrReference: TDynamicProperty<TOpenAPIDefinition.THeaderOrReference>;
        function GetHeaderOrReferenceStored: Boolean;
      public
        destructor Destroy; override;

        property IsHeaderOrReferenceStored: Boolean read GetHeaderOrReferenceStored;
      published
        [FieldName('header-or-reference')]
        property HeaderOrReference: TDynamicProperty<TOpenAPIDefinition.THeaderOrReference> read GetHeaderOrReference write FHeaderOrReference stored GetHeaderOrReferenceStored;
      end;

      TLinks = class
      private
        FLinkOrReference: TDynamicProperty<TOpenAPIDefinition.TLinkOrReference>;

        function GetLinkOrReference: TDynamicProperty<TOpenAPIDefinition.TLinkOrReference>;
        function GetLinkOrReferenceStored: Boolean;
      public
        destructor Destroy; override;

        property IsLinkOrReferenceStored: Boolean read GetLinkOrReferenceStored;
      published
        [FieldName('link-or-reference')]
        property LinkOrReference: TDynamicProperty<TOpenAPIDefinition.TLinkOrReference> read GetLinkOrReference write FLinkOrReference stored GetLinkOrReferenceStored;
      end;
    private
      FDescription: System.String;
      FHeaders: TOpenAPIDefinition.TResponse.THeaders;
      FContent: TOpenAPIDefinition.TContent;
      FLinks: TOpenAPIDefinition.TResponse.TLinks;

      function GetHeaders: TOpenAPIDefinition.TResponse.THeaders;
      function GetContent: TOpenAPIDefinition.TContent;
      function GetLinks: TOpenAPIDefinition.TResponse.TLinks;
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
      property headers: TOpenAPIDefinition.TResponse.THeaders read GetHeaders write FHeaders stored GetHeadersStored;
      property content: TOpenAPIDefinition.TContent read GetContent write FContent stored GetContentStored;
      property links: TOpenAPIDefinition.TResponse.TLinks read GetLinks write FLinks stored GetLinksStored;
    end;

    [Flat]
    TResponseOrReference = class
    private
      FReference: TOpenAPIDefinition.TReference;
      FResponse: TOpenAPIDefinition.TResponse;

      function GetReference: TOpenAPIDefinition.TReference;
      function GetResponse: TOpenAPIDefinition.TResponse;
      function GetReferenceStored: Boolean;
      function GetResponseStored: Boolean;
    public
      destructor Destroy; override;

      property IsReferenceStored: Boolean read GetReferenceStored;
      property IsResponseStored: Boolean read GetResponseStored;
    published
      property reference: TOpenAPIDefinition.TReference read GetReference write FReference stored GetReferenceStored;
      property response: TOpenAPIDefinition.TResponse read GetResponse write FResponse stored GetResponseStored;
    end;

    TCallbacks = class
    private
      FPathItem: TDynamicProperty<TOpenAPIDefinition.TPathItem>;

      function GetPathItem: TDynamicProperty<TOpenAPIDefinition.TPathItem>;
      function GetPathItemStored: Boolean;
    public
      destructor Destroy; override;

      property IsPathItemStored: Boolean read GetPathItemStored;
    published
      [FieldName('path-item')]
      property PathItem: TDynamicProperty<TOpenAPIDefinition.TPathItem> read GetPathItem write FPathItem stored GetPathItemStored;
    end;

    [Flat]
    TCallbacksOrReference = class
    private
      FReference: TOpenAPIDefinition.TReference;
      FCallbacks: TOpenAPIDefinition.TCallbacks;

      function GetReference: TOpenAPIDefinition.TReference;
      function GetCallbacks: TOpenAPIDefinition.TCallbacks;
      function GetReferenceStored: Boolean;
      function GetCallbacksStored: Boolean;
    public
      destructor Destroy; override;

      property IsReferenceStored: Boolean read GetReferenceStored;
      property IsCallbacksStored: Boolean read GetCallbacksStored;
    published
      property reference: TOpenAPIDefinition.TReference read GetReference write FReference stored GetReferenceStored;
      property callbacks: TOpenAPIDefinition.TCallbacks read GetCallbacks write FCallbacks stored GetCallbacksStored;
    end;

    TExample = class
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
    TExampleOrReference = class
    private
      FReference: TOpenAPIDefinition.TReference;
      FExample: TOpenAPIDefinition.TExample;

      function GetReference: TOpenAPIDefinition.TReference;
      function GetExample: TOpenAPIDefinition.TExample;
      function GetReferenceStored: Boolean;
      function GetExampleStored: Boolean;
    public
      destructor Destroy; override;

      property IsReferenceStored: Boolean read GetReferenceStored;
      property IsExampleStored: Boolean read GetExampleStored;
    published
      property reference: TOpenAPIDefinition.TReference read GetReference write FReference stored GetReferenceStored;
      property example: TOpenAPIDefinition.TExample read GetExample write FExample stored GetExampleStored;
    end;

    [Flat]
    TLink = class
    private
      FOperationRef: System.String;
      FOperationId: System.String;
      FParameters: TOpenAPIDefinition.TMapOfStrings;
      FRequestBody: any;
      FDescription: System.String;
      FServer: TOpenAPIDefinition.TServer;
      FRequestBodyIsStored: Boolean;

      function GetParameters: TOpenAPIDefinition.TMapOfStrings;
      function GetServer: TOpenAPIDefinition.TServer;
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
      property parameters: TOpenAPIDefinition.TMapOfStrings read GetParameters write FParameters stored GetParametersStored;
      property requestBody: any read FRequestBody write SetRequestBody stored FRequestBodyIsStored;
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      property server: TOpenAPIDefinition.TServer read GetServer write FServer stored GetServerStored;
    end;

    [Flat]
    TLinkOrReference = class
    private
      FReference: TOpenAPIDefinition.TReference;
      FLink: TOpenAPIDefinition.TLink;

      function GetReference: TOpenAPIDefinition.TReference;
      function GetLink: TOpenAPIDefinition.TLink;
      function GetReferenceStored: Boolean;
      function GetLinkStored: Boolean;
    public
      destructor Destroy; override;

      property IsReferenceStored: Boolean read GetReferenceStored;
      property IsLinkStored: Boolean read GetLinkStored;
    published
      property reference: TOpenAPIDefinition.TReference read GetReference write FReference stored GetReferenceStored;
      property link: TOpenAPIDefinition.TLink read GetLink write FLink stored GetLinkStored;
    end;

    [Flat]
    THeader = class
    private
      FDescription: System.String;
      FRequired: System.Boolean;
      FDeprecated: System.Boolean;
      FSchema: TOpenAPIDefinition;
      FContent: TOpenAPIDefinition.TContent;
      FRequiredIsStored: Boolean;
      FDeprecatedIsStored: Boolean;

      function GetSchema: TOpenAPIDefinition;
      function GetContent: TOpenAPIDefinition.TContent;
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
      property schema: TOpenAPIDefinition read GetSchema write FSchema stored GetSchemaStored;
      property content: TOpenAPIDefinition.TContent read GetContent write FContent stored GetContentStored;
    end;

    [Flat]
    THeaderOrReference = class
    private
      FReference: TOpenAPIDefinition.TReference;
      FHeader: TOpenAPIDefinition.THeader;

      function GetReference: TOpenAPIDefinition.TReference;
      function GetHeader: TOpenAPIDefinition.THeader;
      function GetReferenceStored: Boolean;
      function GetHeaderStored: Boolean;
    public
      destructor Destroy; override;

      property IsReferenceStored: Boolean read GetReferenceStored;
      property IsHeaderStored: Boolean read GetHeaderStored;
    published
      property reference: TOpenAPIDefinition.TReference read GetReference write FReference stored GetReferenceStored;
      property header: TOpenAPIDefinition.THeader read GetHeader write FHeader stored GetHeaderStored;
    end;

    TTag = class
    private
      FName: System.String;
      FDescription: System.String;
      FExternalDocs: TOpenAPIDefinition.TExternalDocumentation;

      function GetExternalDocs: TOpenAPIDefinition.TExternalDocumentation;
      function GetDescriptionStored: Boolean;
      function GetExternalDocsStored: Boolean;
    public
      destructor Destroy; override;

      property IsDescriptionStored: Boolean read GetDescriptionStored;
      property IsExternalDocsStored: Boolean read GetExternalDocsStored;
    published
      property name: System.String read FName write FName;
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      property externalDocs: TOpenAPIDefinition.TExternalDocumentation read GetExternalDocs write FExternalDocs stored GetExternalDocsStored;
    end;

    TReference = class
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
    TSchema = class
    public type
      TObject = class
      end;
    private
      FObject: TOpenAPIDefinition.TSchema.TObject;
      FBoolean: System.Boolean;
      FBooleanIsStored: Boolean;

      function GetObject: TOpenAPIDefinition.TSchema.TObject;
      function GetObjectStored: Boolean;
      procedure SetBoolean(const Value: System.Boolean);
    public
      destructor Destroy; override;

      property IsObjectStored: Boolean read GetObjectStored;
      property IsBooleanStored: Boolean read FBooleanIsStored;
    published
      [FieldName('Object')]
      property &Object: TOpenAPIDefinition.TSchema.TObject read GetObject write FObject stored GetObjectStored;
      property Boolean: System.Boolean read FBoolean write SetBoolean stored FBooleanIsStored;
    end;

    [Flat]
    TSecurityScheme = class
    public type
      TType = (apiKey, http, mutualTLS, oauth2, openIdConnect);

      [Flat]
      TTypeApikey = class
      public type
        TIn = (query, header, cookie);
      private
        FName: System.String;
        FIn: TOpenAPIDefinition.TSecurityScheme.TTypeApikey.TIn;
      published
        property name: System.String read FName write FName;
        [FieldName('in')]
        property &In: TOpenAPIDefinition.TSecurityScheme.TTypeApikey.TIn read FIn write FIn;
      end;

      [Flat]
      TTypeHttp = class
      private
        FScheme: System.String;
      published
        property scheme: System.String read FScheme write FScheme;
      end;

      [Flat]
      TTypeHttpBearer = class
      private
        FBearerFormat: System.String;

        function GetBearerFormatStored: Boolean;
      public
        property IsBearerFormatStored: Boolean read GetBearerFormatStored;
      published
        property bearerFormat: System.String read FBearerFormat write FBearerFormat stored GetBearerFormatStored;
      end;

      [Flat]
      TTypeOauth2 = class
      private
        FFlows: TOpenAPIDefinition.TOauthFlows;

        function GetFlows: TOpenAPIDefinition.TOauthFlows;
      public
        destructor Destroy; override;
      published
        property flows: TOpenAPIDefinition.TOauthFlows read GetFlows write FFlows;
      end;

      [Flat]
      TTypeOidc = class
      private
        FOpenIdConnectUrl: System.String;
      published
        property openIdConnectUrl: System.String read FOpenIdConnectUrl write FOpenIdConnectUrl;
      end;
    private
      FType: TOpenAPIDefinition.TSecurityScheme.TType;
      FDescription: System.String;
      FSpecificationExtensions: TOpenAPIDefinition.TSpecificationExtensions;
      FTypeApikey: TOpenAPIDefinition.TSecurityScheme.TTypeApikey;
      FTypeHttp: TOpenAPIDefinition.TSecurityScheme.TTypeHttp;
      FTypeHttpBearer: TOpenAPIDefinition.TSecurityScheme.TTypeHttpBearer;
      FTypeOauth2: TOpenAPIDefinition.TSecurityScheme.TTypeOauth2;
      FTypeOidc: TOpenAPIDefinition.TSecurityScheme.TTypeOidc;

      function GetSpecificationExtensions: TOpenAPIDefinition.TSpecificationExtensions;
      function GetTypeApikey: TOpenAPIDefinition.TSecurityScheme.TTypeApikey;
      function GetTypeHttp: TOpenAPIDefinition.TSecurityScheme.TTypeHttp;
      function GetTypeHttpBearer: TOpenAPIDefinition.TSecurityScheme.TTypeHttpBearer;
      function GetTypeOauth2: TOpenAPIDefinition.TSecurityScheme.TTypeOauth2;
      function GetTypeOidc: TOpenAPIDefinition.TSecurityScheme.TTypeOidc;
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
      property &Type: TOpenAPIDefinition.TSecurityScheme.TType read FType write FType;
      property description: System.String read FDescription write FDescription stored GetDescriptionStored;
      [FieldName('specification-extensions')]
      property SpecificationExtensions: TOpenAPIDefinition.TSpecificationExtensions read GetSpecificationExtensions write FSpecificationExtensions stored GetSpecificationExtensionsStored;
      [FieldName('type-apikey')]
      property TypeApikey: TOpenAPIDefinition.TSecurityScheme.TTypeApikey read GetTypeApikey write FTypeApikey stored GetTypeApikeyStored;
      [FieldName('type-http')]
      property TypeHttp: TOpenAPIDefinition.TSecurityScheme.TTypeHttp read GetTypeHttp write FTypeHttp stored GetTypeHttpStored;
      [FieldName('type-http-bearer')]
      property TypeHttpBearer: TOpenAPIDefinition.TSecurityScheme.TTypeHttpBearer read GetTypeHttpBearer write FTypeHttpBearer stored GetTypeHttpBearerStored;
      [FieldName('type-oauth2')]
      property TypeOauth2: TOpenAPIDefinition.TSecurityScheme.TTypeOauth2 read GetTypeOauth2 write FTypeOauth2 stored GetTypeOauth2Stored;
      [FieldName('type-oidc')]
      property TypeOidc: TOpenAPIDefinition.TSecurityScheme.TTypeOidc read GetTypeOidc write FTypeOidc stored GetTypeOidcStored;
    end;

    [Flat]
    TSecuritySchemeOrReference = class
    private
      FReference: TOpenAPIDefinition.TReference;
      FSecurityScheme: TOpenAPIDefinition.TSecurityScheme;

      function GetReference: TOpenAPIDefinition.TReference;
      function GetSecurityScheme: TOpenAPIDefinition.TSecurityScheme;
      function GetReferenceStored: Boolean;
      function GetSecuritySchemeStored: Boolean;
    public
      destructor Destroy; override;

      property IsReferenceStored: Boolean read GetReferenceStored;
      property IsSecuritySchemeStored: Boolean read GetSecuritySchemeStored;
    published
      property reference: TOpenAPIDefinition.TReference read GetReference write FReference stored GetReferenceStored;
      [FieldName('security-scheme')]
      property SecurityScheme: TOpenAPIDefinition.TSecurityScheme read GetSecurityScheme write FSecurityScheme stored GetSecuritySchemeStored;
    end;

    TOauthFlows = class
    public type
      TImplicit = class
      private
        FAuthorizationUrl: System.String;
        FRefreshUrl: System.String;
        FScopes: TOpenAPIDefinition.TMapOfStrings;

        function GetScopes: TOpenAPIDefinition.TMapOfStrings;
        function GetRefreshUrlStored: Boolean;
      public
        destructor Destroy; override;

        property IsRefreshUrlStored: Boolean read GetRefreshUrlStored;
      published
        property authorizationUrl: System.String read FAuthorizationUrl write FAuthorizationUrl;
        property refreshUrl: System.String read FRefreshUrl write FRefreshUrl stored GetRefreshUrlStored;
        property scopes: TOpenAPIDefinition.TMapOfStrings read GetScopes write FScopes;
      end;

      TPassword = class
      private
        FTokenUrl: System.String;
        FRefreshUrl: System.String;
        FScopes: TOpenAPIDefinition.TMapOfStrings;

        function GetScopes: TOpenAPIDefinition.TMapOfStrings;
        function GetRefreshUrlStored: Boolean;
      public
        destructor Destroy; override;

        property IsRefreshUrlStored: Boolean read GetRefreshUrlStored;
      published
        property tokenUrl: System.String read FTokenUrl write FTokenUrl;
        property refreshUrl: System.String read FRefreshUrl write FRefreshUrl stored GetRefreshUrlStored;
        property scopes: TOpenAPIDefinition.TMapOfStrings read GetScopes write FScopes;
      end;

      TClientCredentials = class
      private
        FTokenUrl: System.String;
        FRefreshUrl: System.String;
        FScopes: TOpenAPIDefinition.TMapOfStrings;

        function GetScopes: TOpenAPIDefinition.TMapOfStrings;
        function GetRefreshUrlStored: Boolean;
      public
        destructor Destroy; override;

        property IsRefreshUrlStored: Boolean read GetRefreshUrlStored;
      published
        property tokenUrl: System.String read FTokenUrl write FTokenUrl;
        property refreshUrl: System.String read FRefreshUrl write FRefreshUrl stored GetRefreshUrlStored;
        property scopes: TOpenAPIDefinition.TMapOfStrings read GetScopes write FScopes;
      end;

      TAuthorizationCode = class
      private
        FAuthorizationUrl: System.String;
        FTokenUrl: System.String;
        FRefreshUrl: System.String;
        FScopes: TOpenAPIDefinition.TMapOfStrings;

        function GetScopes: TOpenAPIDefinition.TMapOfStrings;
        function GetRefreshUrlStored: Boolean;
      public
        destructor Destroy; override;

        property IsRefreshUrlStored: Boolean read GetRefreshUrlStored;
      published
        property authorizationUrl: System.String read FAuthorizationUrl write FAuthorizationUrl;
        property tokenUrl: System.String read FTokenUrl write FTokenUrl;
        property refreshUrl: System.String read FRefreshUrl write FRefreshUrl stored GetRefreshUrlStored;
        property scopes: TOpenAPIDefinition.TMapOfStrings read GetScopes write FScopes;
      end;
    private
      FImplicit: TOpenAPIDefinition.TOauthFlows.TImplicit;
      FPassword: TOpenAPIDefinition.TOauthFlows.TPassword;
      FClientCredentials: TOpenAPIDefinition.TOauthFlows.TClientCredentials;
      FAuthorizationCode: TOpenAPIDefinition.TOauthFlows.TAuthorizationCode;

      function GetImplicit: TOpenAPIDefinition.TOauthFlows.TImplicit;
      function GetPassword: TOpenAPIDefinition.TOauthFlows.TPassword;
      function GetClientCredentials: TOpenAPIDefinition.TOauthFlows.TClientCredentials;
      function GetAuthorizationCode: TOpenAPIDefinition.TOauthFlows.TAuthorizationCode;
      function GetImplicitStored: Boolean;
      function GetPasswordStored: Boolean;
      function GetClientCredentialsStored: Boolean;
      function GetAuthorizationCodeStored: Boolean;
    public
      destructor Destroy; override;

      property IsImplicitStored: Boolean read GetImplicitStored;
      property IsPasswordStored: Boolean read GetPasswordStored;
      property IsClientCredentialsStored: Boolean read GetClientCredentialsStored;
      property IsAuthorizationCodeStored: Boolean read GetAuthorizationCodeStored;
    published
      property implicit: TOpenAPIDefinition.TOauthFlows.TImplicit read GetImplicit write FImplicit stored GetImplicitStored;
      property password: TOpenAPIDefinition.TOauthFlows.TPassword read GetPassword write FPassword stored GetPasswordStored;
      property clientCredentials: TOpenAPIDefinition.TOauthFlows.TClientCredentials read GetClientCredentials write FClientCredentials stored GetClientCredentialsStored;
      property authorizationCode: TOpenAPIDefinition.TOauthFlows.TAuthorizationCode read GetAuthorizationCode write FAuthorizationCode stored GetAuthorizationCodeStored;
    end;

    TSecurityRequirement = class
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

    TSpecificationExtensions = class
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

    TExamples = class
    public type
      TExamples = class
      private
        FExampleOrReference: TDynamicProperty<TOpenAPIDefinition.TExampleOrReference>;

        function GetExampleOrReference: TDynamicProperty<TOpenAPIDefinition.TExampleOrReference>;
        function GetExampleOrReferenceStored: Boolean;
      public
        destructor Destroy; override;

        property IsExampleOrReferenceStored: Boolean read GetExampleOrReferenceStored;
      published
        [FieldName('example-or-reference')]
        property ExampleOrReference: TDynamicProperty<TOpenAPIDefinition.TExampleOrReference> read GetExampleOrReference write FExampleOrReference stored GetExampleOrReferenceStored;
      end;
    private
      FExample: any;
      FExamples: TOpenAPIDefinition.TExamples.TExamples;
      FExampleIsStored: Boolean;

      function GetExamples: TOpenAPIDefinition.TExamples.TExamples;
      function GetExamplesStored: Boolean;
      procedure SetExample(const Value: any);
    public
      destructor Destroy; override;

      property IsExampleStored: Boolean read FExampleIsStored;
      property IsExamplesStored: Boolean read GetExamplesStored;
    published
      property example: any read FExample write SetExample stored FExampleIsStored;
      property examples: TOpenAPIDefinition.TExamples.TExamples read GetExamples write FExamples stored GetExamplesStored;
    end;

    TMapOfStrings = class
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

    [Flat]
    TExplodeForForm = class
    private
      FExplode: System.Boolean;
      FExplodeIsStored: Boolean;

      procedure SetExplode(const Value: System.Boolean);
    public
      property IsExplodeStored: Boolean read FExplodeIsStored;
    published
      property explode: System.Boolean read FExplode write SetExplode stored FExplodeIsStored;
    end;
  private
    FOpenapi: System.String;
    FInfo: TOpenAPIDefinition.TInfo;
    FJsonSchemaDialect: System.String;
    FServers: TArray<TOpenAPIDefinition.TServer>;
    FPaths: TOpenAPIDefinition.TPaths;
    FWebhooks: TOpenAPIDefinition.TWebhooks;
    FComponents: TOpenAPIDefinition.TComponents;
    FSecurity: TArray<TOpenAPIDefinition.TSecurityRequirement>;
    FTags: TArray<TOpenAPIDefinition.TTag>;
    FExternalDocs: TOpenAPIDefinition.TExternalDocumentation;

    function GetInfo: TOpenAPIDefinition.TInfo;
    function GetPaths: TOpenAPIDefinition.TPaths;
    function GetWebhooks: TOpenAPIDefinition.TWebhooks;
    function GetComponents: TOpenAPIDefinition.TComponents;
    function GetExternalDocs: TOpenAPIDefinition.TExternalDocumentation;
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

    function AddServers: TOpenAPIDefinition.TServer;
    function AddSecurity: TOpenAPIDefinition.TSecurityRequirement;
    function AddTags: TOpenAPIDefinition.TTag;

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
    property info: TOpenAPIDefinition.TInfo read GetInfo write FInfo;
    property jsonSchemaDialect: System.String read FJsonSchemaDialect write FJsonSchemaDialect stored GetJsonSchemaDialectStored;
    property servers: TArray<TOpenAPIDefinition.TServer> read FServers write FServers stored GetServersStored;
    property paths: TOpenAPIDefinition.TPaths read GetPaths write FPaths stored GetPathsStored;
    property webhooks: TOpenAPIDefinition.TWebhooks read GetWebhooks write FWebhooks stored GetWebhooksStored;
    property components: TOpenAPIDefinition.TComponents read GetComponents write FComponents stored GetComponentsStored;
    property security: TArray<TOpenAPIDefinition.TSecurityRequirement> read FSecurity write FSecurity stored GetSecurityStored;
    property tags: TArray<TOpenAPIDefinition.TTag> read FTags write FTags stored GetTagsStored;
    property externalDocs: TOpenAPIDefinition.TExternalDocumentation read GetExternalDocs write FExternalDocs stored GetExternalDocsStored;
  end;

implementation

uses System.SysUtils;

{ TOpenAPIDefinition }

destructor TOpenAPIDefinition.Destroy;
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

function TOpenAPIDefinition.GetInfo: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TInfo;
begin
  if not Assigned(FInfo) then
    FInfo := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TInfo.Create;

  Result := FInfo;
end;

function TOpenAPIDefinition.GetJsonSchemaDialectStored: Boolean;
begin
  Result := not FJsonSchemaDialect.IsEmpty;
end;

function TOpenAPIDefinition.AddServers: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TServer;
begin
  Result := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TServer.Create;

  FServers := FServers + [Result];
end;

function TOpenAPIDefinition.GetServersStored: Boolean;
begin
  Result := Assigned(FServers);
end;

function TOpenAPIDefinition.GetPaths: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TPaths;
begin
  if not Assigned(FPaths) then
    FPaths := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TPaths.Create;

  Result := FPaths;
end;

function TOpenAPIDefinition.GetPathsStored: Boolean;
begin
  Result := Assigned(FPaths);
end;

function TOpenAPIDefinition.GetWebhooks: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TWebhooks;
begin
  if not Assigned(FWebhooks) then
    FWebhooks := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TWebhooks.Create;

  Result := FWebhooks;
end;

function TOpenAPIDefinition.GetWebhooksStored: Boolean;
begin
  Result := Assigned(FWebhooks);
end;

function TOpenAPIDefinition.GetComponents: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TComponents;
begin
  if not Assigned(FComponents) then
    FComponents := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TComponents.Create;

  Result := FComponents;
end;

function TOpenAPIDefinition.GetComponentsStored: Boolean;
begin
  Result := Assigned(FComponents);
end;

function TOpenAPIDefinition.AddSecurity: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TSecurityRequirement;
begin
  Result := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TSecurityRequirement.Create;

  FSecurity := FSecurity + [Result];
end;

function TOpenAPIDefinition.GetSecurityStored: Boolean;
begin
  Result := Assigned(FSecurity);
end;

function TOpenAPIDefinition.AddTags: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TTag;
begin
  Result := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TTag.Create;

  FTags := FTags + [Result];
end;

function TOpenAPIDefinition.GetTagsStored: Boolean;
begin
  Result := Assigned(FTags);
end;

function TOpenAPIDefinition.GetExternalDocs: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TExternalDocumentation;
begin
  if not Assigned(FExternalDocs) then
    FExternalDocs := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TExternalDocumentation.Create;

  Result := FExternalDocs;
end;

function TOpenAPIDefinition.GetExternalDocsStored: Boolean;
begin
  Result := Assigned(FExternalDocs);
end;

{ TOpenAPIDefinition.TWebhooks }

destructor TOpenAPIDefinition.TWebhooks.Destroy;
begin
  FPathItem.Free;

  inherited;
end;

function TOpenAPIDefinition.TWebhooks.GetPathItem: TDynamicProperty<TOpenAPIDefinition.TPathItem>;
begin
  if not Assigned(FPathItem) then
    FPathItem := TDynamicProperty<Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TPathItem>.Create;

  Result := FPathItem;
end;

function TOpenAPIDefinition.TWebhooks.GetPathItemStored: Boolean;
begin
  Result := Assigned(FPathItem);
end;

{ TOpenAPIDefinition.TInfo }

destructor TOpenAPIDefinition.TInfo.Destroy;
begin
  FContact.Free;

  FLicense.Free;

  inherited;
end;

function TOpenAPIDefinition.TInfo.GetSummaryStored: Boolean;
begin
  Result := not FSummary.IsEmpty;
end;

function TOpenAPIDefinition.TInfo.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.TInfo.GetTermsOfServiceStored: Boolean;
begin
  Result := not FTermsOfService.IsEmpty;
end;

function TOpenAPIDefinition.TInfo.GetContact: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TContact;
begin
  if not Assigned(FContact) then
    FContact := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TContact.Create;

  Result := FContact;
end;

function TOpenAPIDefinition.TInfo.GetContactStored: Boolean;
begin
  Result := Assigned(FContact);
end;

function TOpenAPIDefinition.TInfo.GetLicense: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TLicense;
begin
  if not Assigned(FLicense) then
    FLicense := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TLicense.Create;

  Result := FLicense;
end;

function TOpenAPIDefinition.TInfo.GetLicenseStored: Boolean;
begin
  Result := Assigned(FLicense);
end;

{ TOpenAPIDefinition.TContact }

function TOpenAPIDefinition.TContact.GetNameStored: Boolean;
begin
  Result := not FName.IsEmpty;
end;

function TOpenAPIDefinition.TContact.GetUrlStored: Boolean;
begin
  Result := not FUrl.IsEmpty;
end;

function TOpenAPIDefinition.TContact.GetEmailStored: Boolean;
begin
  Result := not FEmail.IsEmpty;
end;

{ TOpenAPIDefinition.TLicense }

function TOpenAPIDefinition.TLicense.GetIdentifierStored: Boolean;
begin
  Result := not FIdentifier.IsEmpty;
end;

function TOpenAPIDefinition.TLicense.GetUrlStored: Boolean;
begin
  Result := not FUrl.IsEmpty;
end;

{ TOpenAPIDefinition.TServer }

destructor TOpenAPIDefinition.TServer.Destroy;
begin
  FVariables.Free;

  inherited;
end;

function TOpenAPIDefinition.TServer.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.TServer.GetVariables: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TServer.TVariables;
begin
  if not Assigned(FVariables) then
    FVariables := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TServer.TVariables.Create;

  Result := FVariables;
end;

function TOpenAPIDefinition.TServer.GetVariablesStored: Boolean;
begin
  Result := Assigned(FVariables);
end;

{ TOpenAPIDefinition.TServer.TVariables }

destructor TOpenAPIDefinition.TServer.TVariables.Destroy;
begin
  FServerVariable.Free;

  inherited;
end;

function TOpenAPIDefinition.TServer.TVariables.GetServerVariable: TDynamicProperty<TOpenAPIDefinition.TServerVariable>;
begin
  if not Assigned(FServerVariable) then
    FServerVariable := TDynamicProperty<Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TServerVariable>.Create;

  Result := FServerVariable;
end;

function TOpenAPIDefinition.TServer.TVariables.GetServerVariableStored: Boolean;
begin
  Result := Assigned(FServerVariable);
end;

{ TOpenAPIDefinition.TServerVariable }

function TOpenAPIDefinition.TServerVariable.GetEnumStored: Boolean;
begin
  Result := Assigned(FEnum);
end;

function TOpenAPIDefinition.TServerVariable.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

{ TOpenAPIDefinition.TComponents }

destructor TOpenAPIDefinition.TComponents.Destroy;
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

function TOpenAPIDefinition.TComponents.GetSchemas: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TComponents.TSchemas;
begin
  if not Assigned(FSchemas) then
    FSchemas := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TComponents.TSchemas.Create;

  Result := FSchemas;
end;

function TOpenAPIDefinition.TComponents.GetSchemasStored: Boolean;
begin
  Result := Assigned(FSchemas);
end;

function TOpenAPIDefinition.TComponents.GetResponses: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TComponents.TResponses;
begin
  if not Assigned(FResponses) then
    FResponses := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TComponents.TResponses.Create;

  Result := FResponses;
end;

function TOpenAPIDefinition.TComponents.GetResponsesStored: Boolean;
begin
  Result := Assigned(FResponses);
end;

function TOpenAPIDefinition.TComponents.GetParameters: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TComponents.TParameters;
begin
  if not Assigned(FParameters) then
    FParameters := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TComponents.TParameters.Create;

  Result := FParameters;
end;

function TOpenAPIDefinition.TComponents.GetParametersStored: Boolean;
begin
  Result := Assigned(FParameters);
end;

function TOpenAPIDefinition.TComponents.GetExamples: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TComponents.TExamples;
begin
  if not Assigned(FExamples) then
    FExamples := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TComponents.TExamples.Create;

  Result := FExamples;
end;

function TOpenAPIDefinition.TComponents.GetExamplesStored: Boolean;
begin
  Result := Assigned(FExamples);
end;

function TOpenAPIDefinition.TComponents.GetRequestBodies: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TComponents.TRequestBodies;
begin
  if not Assigned(FRequestBodies) then
    FRequestBodies := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TComponents.TRequestBodies.Create;

  Result := FRequestBodies;
end;

function TOpenAPIDefinition.TComponents.GetRequestBodiesStored: Boolean;
begin
  Result := Assigned(FRequestBodies);
end;

function TOpenAPIDefinition.TComponents.GetHeaders: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TComponents.THeaders;
begin
  if not Assigned(FHeaders) then
    FHeaders := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TComponents.THeaders.Create;

  Result := FHeaders;
end;

function TOpenAPIDefinition.TComponents.GetHeadersStored: Boolean;
begin
  Result := Assigned(FHeaders);
end;

function TOpenAPIDefinition.TComponents.GetSecuritySchemes: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TComponents.TSecuritySchemes;
begin
  if not Assigned(FSecuritySchemes) then
    FSecuritySchemes := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TComponents.TSecuritySchemes.Create;

  Result := FSecuritySchemes;
end;

function TOpenAPIDefinition.TComponents.GetSecuritySchemesStored: Boolean;
begin
  Result := Assigned(FSecuritySchemes);
end;

function TOpenAPIDefinition.TComponents.GetLinks: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TComponents.TLinks;
begin
  if not Assigned(FLinks) then
    FLinks := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TComponents.TLinks.Create;

  Result := FLinks;
end;

function TOpenAPIDefinition.TComponents.GetLinksStored: Boolean;
begin
  Result := Assigned(FLinks);
end;

function TOpenAPIDefinition.TComponents.GetCallbacks: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TComponents.TCallbacks;
begin
  if not Assigned(FCallbacks) then
    FCallbacks := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TComponents.TCallbacks.Create;

  Result := FCallbacks;
end;

function TOpenAPIDefinition.TComponents.GetCallbacksStored: Boolean;
begin
  Result := Assigned(FCallbacks);
end;

function TOpenAPIDefinition.TComponents.GetPathItems: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TComponents.TPathItems;
begin
  if not Assigned(FPathItems) then
    FPathItems := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TComponents.TPathItems.Create;

  Result := FPathItems;
end;

function TOpenAPIDefinition.TComponents.GetPathItemsStored: Boolean;
begin
  Result := Assigned(FPathItems);
end;

function TOpenAPIDefinition.TComponents.GetSpecificationExtensions: TDynamicProperty<any>;
begin
  if not Assigned(FSpecificationExtensions) then
    FSpecificationExtensions := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FSpecificationExtensions;
end;

function TOpenAPIDefinition.TComponents.GetSpecificationExtensionsStored: Boolean;
begin
  Result := Assigned(FSpecificationExtensions);
end;

{ TOpenAPIDefinition.TComponents.TSchemas }

destructor TOpenAPIDefinition.TComponents.TSchemas.Destroy;
begin
  FSchemas.Free;

  inherited;
end;

function TOpenAPIDefinition.TComponents.TSchemas.GetSchemas: TDynamicProperty<TOpenAPIDefinition>;
begin
  if not Assigned(FSchemas) then
    FSchemas := TDynamicProperty<Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition>.Create;

  Result := FSchemas;
end;

function TOpenAPIDefinition.TComponents.TSchemas.GetSchemasStored: Boolean;
begin
  Result := Assigned(FSchemas);
end;

{ TOpenAPIDefinition.TComponents.TResponses }

destructor TOpenAPIDefinition.TComponents.TResponses.Destroy;
begin
  FResponseOrReference.Free;

  inherited;
end;

function TOpenAPIDefinition.TComponents.TResponses.GetResponseOrReference: TDynamicProperty<TOpenAPIDefinition.TResponseOrReference>;
begin
  if not Assigned(FResponseOrReference) then
    FResponseOrReference := TDynamicProperty<Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TResponseOrReference>.Create;

  Result := FResponseOrReference;
end;

function TOpenAPIDefinition.TComponents.TResponses.GetResponseOrReferenceStored: Boolean;
begin
  Result := Assigned(FResponseOrReference);
end;

{ TOpenAPIDefinition.TComponents.TParameters }

destructor TOpenAPIDefinition.TComponents.TParameters.Destroy;
begin
  FParameterOrReference.Free;

  inherited;
end;

function TOpenAPIDefinition.TComponents.TParameters.GetParameterOrReference: TDynamicProperty<TOpenAPIDefinition.TParameterOrReference>;
begin
  if not Assigned(FParameterOrReference) then
    FParameterOrReference := TDynamicProperty<Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TParameterOrReference>.Create;

  Result := FParameterOrReference;
end;

function TOpenAPIDefinition.TComponents.TParameters.GetParameterOrReferenceStored: Boolean;
begin
  Result := Assigned(FParameterOrReference);
end;

{ TOpenAPIDefinition.TComponents.TExamples }

destructor TOpenAPIDefinition.TComponents.TExamples.Destroy;
begin
  FExampleOrReference.Free;

  inherited;
end;

function TOpenAPIDefinition.TComponents.TExamples.GetExampleOrReference: TDynamicProperty<TOpenAPIDefinition.TExampleOrReference>;
begin
  if not Assigned(FExampleOrReference) then
    FExampleOrReference := TDynamicProperty<Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TExampleOrReference>.Create;

  Result := FExampleOrReference;
end;

function TOpenAPIDefinition.TComponents.TExamples.GetExampleOrReferenceStored: Boolean;
begin
  Result := Assigned(FExampleOrReference);
end;

{ TOpenAPIDefinition.TComponents.TRequestBodies }

destructor TOpenAPIDefinition.TComponents.TRequestBodies.Destroy;
begin
  FRequestBodyOrReference.Free;

  inherited;
end;

function TOpenAPIDefinition.TComponents.TRequestBodies.GetRequestBodyOrReference: TDynamicProperty<TOpenAPIDefinition.TRequestBodyOrReference>;
begin
  if not Assigned(FRequestBodyOrReference) then
    FRequestBodyOrReference := TDynamicProperty<Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TRequestBodyOrReference>.Create;

  Result := FRequestBodyOrReference;
end;

function TOpenAPIDefinition.TComponents.TRequestBodies.GetRequestBodyOrReferenceStored: Boolean;
begin
  Result := Assigned(FRequestBodyOrReference);
end;

{ TOpenAPIDefinition.TComponents.THeaders }

destructor TOpenAPIDefinition.TComponents.THeaders.Destroy;
begin
  FHeaderOrReference.Free;

  inherited;
end;

function TOpenAPIDefinition.TComponents.THeaders.GetHeaderOrReference: TDynamicProperty<TOpenAPIDefinition.THeaderOrReference>;
begin
  if not Assigned(FHeaderOrReference) then
    FHeaderOrReference := TDynamicProperty<Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.THeaderOrReference>.Create;

  Result := FHeaderOrReference;
end;

function TOpenAPIDefinition.TComponents.THeaders.GetHeaderOrReferenceStored: Boolean;
begin
  Result := Assigned(FHeaderOrReference);
end;

{ TOpenAPIDefinition.TComponents.TSecuritySchemes }

destructor TOpenAPIDefinition.TComponents.TSecuritySchemes.Destroy;
begin
  FSecuritySchemeOrReference.Free;

  inherited;
end;

function TOpenAPIDefinition.TComponents.TSecuritySchemes.GetSecuritySchemeOrReference: TDynamicProperty<TOpenAPIDefinition.TSecuritySchemeOrReference>;
begin
  if not Assigned(FSecuritySchemeOrReference) then
    FSecuritySchemeOrReference := TDynamicProperty<Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TSecuritySchemeOrReference>.Create;

  Result := FSecuritySchemeOrReference;
end;

function TOpenAPIDefinition.TComponents.TSecuritySchemes.GetSecuritySchemeOrReferenceStored: Boolean;
begin
  Result := Assigned(FSecuritySchemeOrReference);
end;

{ TOpenAPIDefinition.TComponents.TLinks }

destructor TOpenAPIDefinition.TComponents.TLinks.Destroy;
begin
  FLinkOrReference.Free;

  inherited;
end;

function TOpenAPIDefinition.TComponents.TLinks.GetLinkOrReference: TDynamicProperty<TOpenAPIDefinition.TLinkOrReference>;
begin
  if not Assigned(FLinkOrReference) then
    FLinkOrReference := TDynamicProperty<Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TLinkOrReference>.Create;

  Result := FLinkOrReference;
end;

function TOpenAPIDefinition.TComponents.TLinks.GetLinkOrReferenceStored: Boolean;
begin
  Result := Assigned(FLinkOrReference);
end;

{ TOpenAPIDefinition.TComponents.TCallbacks }

destructor TOpenAPIDefinition.TComponents.TCallbacks.Destroy;
begin
  FCallbacksOrReference.Free;

  inherited;
end;

function TOpenAPIDefinition.TComponents.TCallbacks.GetCallbacksOrReference: TDynamicProperty<TOpenAPIDefinition.TCallbacksOrReference>;
begin
  if not Assigned(FCallbacksOrReference) then
    FCallbacksOrReference := TDynamicProperty<Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TCallbacksOrReference>.Create;

  Result := FCallbacksOrReference;
end;

function TOpenAPIDefinition.TComponents.TCallbacks.GetCallbacksOrReferenceStored: Boolean;
begin
  Result := Assigned(FCallbacksOrReference);
end;

{ TOpenAPIDefinition.TComponents.TPathItems }

destructor TOpenAPIDefinition.TComponents.TPathItems.Destroy;
begin
  FPathItem.Free;

  inherited;
end;

function TOpenAPIDefinition.TComponents.TPathItems.GetPathItem: TDynamicProperty<TOpenAPIDefinition.TPathItem>;
begin
  if not Assigned(FPathItem) then
    FPathItem := TDynamicProperty<Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TPathItem>.Create;

  Result := FPathItem;
end;

function TOpenAPIDefinition.TComponents.TPathItems.GetPathItemStored: Boolean;
begin
  Result := Assigned(FPathItem);
end;

{ TOpenAPIDefinition.TPaths }

destructor TOpenAPIDefinition.TPaths.Destroy;
begin
  FSpecificationExtensions.Free;

  inherited;
end;

function TOpenAPIDefinition.TPaths.GetSpecificationExtensions: TDynamicProperty<TOpenAPIDefinition.TPathItem>;
begin
  if not Assigned(FSpecificationExtensions) then
    FSpecificationExtensions := TDynamicProperty<Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TPathItem>.Create;

  Result := FSpecificationExtensions;
end;

function TOpenAPIDefinition.TPaths.GetSpecificationExtensionsStored: Boolean;
begin
  Result := Assigned(FSpecificationExtensions);
end;

{ TOpenAPIDefinition.TPathItem }

destructor TOpenAPIDefinition.TPathItem.Destroy;
begin
  for var AObject in FServers do
    AObject.Free;

  for var AObject in FParameters do
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

function TOpenAPIDefinition.TPathItem.GetRefStored: Boolean;
begin
  Result := not FRef.IsEmpty;
end;

function TOpenAPIDefinition.TPathItem.GetSummaryStored: Boolean;
begin
  Result := not FSummary.IsEmpty;
end;

function TOpenAPIDefinition.TPathItem.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.TPathItem.AddServers: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TServer;
begin
  Result := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TServer.Create;

  FServers := FServers + [Result];
end;

function TOpenAPIDefinition.TPathItem.GetServersStored: Boolean;
begin
  Result := Assigned(FServers);
end;

function TOpenAPIDefinition.TPathItem.AddParameters: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TParameterOrReference;
begin
  Result := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TParameterOrReference.Create;

  FParameters := FParameters + [Result];
end;

function TOpenAPIDefinition.TPathItem.GetParametersStored: Boolean;
begin
  Result := Assigned(FParameters);
end;

function TOpenAPIDefinition.TPathItem.GetGet: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TOperation;
begin
  if not Assigned(FGet) then
    FGet := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TOperation.Create;

  Result := FGet;
end;

function TOpenAPIDefinition.TPathItem.GetGetStored: Boolean;
begin
  Result := Assigned(FGet);
end;

function TOpenAPIDefinition.TPathItem.GetPut: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TOperation;
begin
  if not Assigned(FPut) then
    FPut := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TOperation.Create;

  Result := FPut;
end;

function TOpenAPIDefinition.TPathItem.GetPutStored: Boolean;
begin
  Result := Assigned(FPut);
end;

function TOpenAPIDefinition.TPathItem.GetPost: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TOperation;
begin
  if not Assigned(FPost) then
    FPost := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TOperation.Create;

  Result := FPost;
end;

function TOpenAPIDefinition.TPathItem.GetPostStored: Boolean;
begin
  Result := Assigned(FPost);
end;

function TOpenAPIDefinition.TPathItem.GetDelete: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TOperation;
begin
  if not Assigned(FDelete) then
    FDelete := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TOperation.Create;

  Result := FDelete;
end;

function TOpenAPIDefinition.TPathItem.GetDeleteStored: Boolean;
begin
  Result := Assigned(FDelete);
end;

function TOpenAPIDefinition.TPathItem.GetOptions: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TOperation;
begin
  if not Assigned(FOptions) then
    FOptions := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TOperation.Create;

  Result := FOptions;
end;

function TOpenAPIDefinition.TPathItem.GetOptionsStored: Boolean;
begin
  Result := Assigned(FOptions);
end;

function TOpenAPIDefinition.TPathItem.GetHead: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TOperation;
begin
  if not Assigned(FHead) then
    FHead := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TOperation.Create;

  Result := FHead;
end;

function TOpenAPIDefinition.TPathItem.GetHeadStored: Boolean;
begin
  Result := Assigned(FHead);
end;

function TOpenAPIDefinition.TPathItem.GetPatch: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TOperation;
begin
  if not Assigned(FPatch) then
    FPatch := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TOperation.Create;

  Result := FPatch;
end;

function TOpenAPIDefinition.TPathItem.GetPatchStored: Boolean;
begin
  Result := Assigned(FPatch);
end;

function TOpenAPIDefinition.TPathItem.GetTrace: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TOperation;
begin
  if not Assigned(FTrace) then
    FTrace := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TOperation.Create;

  Result := FTrace;
end;

function TOpenAPIDefinition.TPathItem.GetTraceStored: Boolean;
begin
  Result := Assigned(FTrace);
end;

{ TOpenAPIDefinition.TOperation }

destructor TOpenAPIDefinition.TOperation.Destroy;
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

function TOpenAPIDefinition.TOperation.GetTagsStored: Boolean;
begin
  Result := Assigned(FTags);
end;

function TOpenAPIDefinition.TOperation.GetSummaryStored: Boolean;
begin
  Result := not FSummary.IsEmpty;
end;

function TOpenAPIDefinition.TOperation.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.TOperation.GetExternalDocs: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TExternalDocumentation;
begin
  if not Assigned(FExternalDocs) then
    FExternalDocs := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TExternalDocumentation.Create;

  Result := FExternalDocs;
end;

function TOpenAPIDefinition.TOperation.GetExternalDocsStored: Boolean;
begin
  Result := Assigned(FExternalDocs);
end;

function TOpenAPIDefinition.TOperation.GetOperationIdStored: Boolean;
begin
  Result := not FOperationId.IsEmpty;
end;

function TOpenAPIDefinition.TOperation.AddParameters: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TParameterOrReference;
begin
  Result := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TParameterOrReference.Create;

  FParameters := FParameters + [Result];
end;

function TOpenAPIDefinition.TOperation.GetParametersStored: Boolean;
begin
  Result := Assigned(FParameters);
end;

function TOpenAPIDefinition.TOperation.GetRequestBody: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TRequestBodyOrReference;
begin
  if not Assigned(FRequestBody) then
    FRequestBody := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TRequestBodyOrReference.Create;

  Result := FRequestBody;
end;

function TOpenAPIDefinition.TOperation.GetRequestBodyStored: Boolean;
begin
  Result := Assigned(FRequestBody);
end;

function TOpenAPIDefinition.TOperation.GetResponses: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TResponses;
begin
  if not Assigned(FResponses) then
    FResponses := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TResponses.Create;

  Result := FResponses;
end;

function TOpenAPIDefinition.TOperation.GetResponsesStored: Boolean;
begin
  Result := Assigned(FResponses);
end;

function TOpenAPIDefinition.TOperation.GetCallbacks: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TOperation.TCallbacks;
begin
  if not Assigned(FCallbacks) then
    FCallbacks := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TOperation.TCallbacks.Create;

  Result := FCallbacks;
end;

function TOpenAPIDefinition.TOperation.GetCallbacksStored: Boolean;
begin
  Result := Assigned(FCallbacks);
end;

procedure TOpenAPIDefinition.TOperation.SetDeprecated(const Value: System.Boolean);
begin
  FDeprecated := Value;
  FDeprecatedIsStored := True;
end;

function TOpenAPIDefinition.TOperation.AddSecurity: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TSecurityRequirement;
begin
  Result := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TSecurityRequirement.Create;

  FSecurity := FSecurity + [Result];
end;

function TOpenAPIDefinition.TOperation.GetSecurityStored: Boolean;
begin
  Result := Assigned(FSecurity);
end;

function TOpenAPIDefinition.TOperation.AddServers: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TServer;
begin
  Result := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TServer.Create;

  FServers := FServers + [Result];
end;

function TOpenAPIDefinition.TOperation.GetServersStored: Boolean;
begin
  Result := Assigned(FServers);
end;

{ TOpenAPIDefinition.TOperation.TCallbacks }

destructor TOpenAPIDefinition.TOperation.TCallbacks.Destroy;
begin
  FCallbacksOrReference.Free;

  inherited;
end;

function TOpenAPIDefinition.TOperation.TCallbacks.GetCallbacksOrReference: TDynamicProperty<TOpenAPIDefinition.TCallbacksOrReference>;
begin
  if not Assigned(FCallbacksOrReference) then
    FCallbacksOrReference := TDynamicProperty<Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TCallbacksOrReference>.Create;

  Result := FCallbacksOrReference;
end;

function TOpenAPIDefinition.TOperation.TCallbacks.GetCallbacksOrReferenceStored: Boolean;
begin
  Result := Assigned(FCallbacksOrReference);
end;

{ TOpenAPIDefinition.TExternalDocumentation }

function TOpenAPIDefinition.TExternalDocumentation.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

{ TOpenAPIDefinition.TParameter }

destructor TOpenAPIDefinition.TParameter.Destroy;
begin
  FSchema.Free;

  FContent.Free;

  inherited;
end;

function TOpenAPIDefinition.TParameter.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

procedure TOpenAPIDefinition.TParameter.SetRequired(const Value: System.Boolean);
begin
  FRequired := Value;
  FRequiredIsStored := True;
end;

procedure TOpenAPIDefinition.TParameter.SetDeprecated(const Value: System.Boolean);
begin
  FDeprecated := Value;
  FDeprecatedIsStored := True;
end;

function TOpenAPIDefinition.TParameter.GetSchema: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.Create;

  Result := FSchema;
end;

function TOpenAPIDefinition.TParameter.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function TOpenAPIDefinition.TParameter.GetContent: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TContent;
begin
  if not Assigned(FContent) then
    FContent := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TContent.Create;

  Result := FContent;
end;

function TOpenAPIDefinition.TParameter.GetContentStored: Boolean;
begin
  Result := Assigned(FContent);
end;

procedure TOpenAPIDefinition.TParameter.SetAllowEmptyValue(const Value: System.Boolean);
begin
  FAllowEmptyValue := Value;
  FAllowEmptyValueIsStored := True;
end;

{ TOpenAPIDefinition.TParameterOrReference }

destructor TOpenAPIDefinition.TParameterOrReference.Destroy;
begin
  FReference.Free;

  FParameter.Free;

  inherited;
end;

function TOpenAPIDefinition.TParameterOrReference.GetReference: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TReference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TReference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.TParameterOrReference.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

function TOpenAPIDefinition.TParameterOrReference.GetParameter: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TParameter;
begin
  if not Assigned(FParameter) then
    FParameter := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TParameter.Create;

  Result := FParameter;
end;

function TOpenAPIDefinition.TParameterOrReference.GetParameterStored: Boolean;
begin
  Result := Assigned(FParameter);
end;

{ TOpenAPIDefinition.TRequestBody }

destructor TOpenAPIDefinition.TRequestBody.Destroy;
begin
  FContent.Free;

  inherited;
end;

function TOpenAPIDefinition.TRequestBody.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.TRequestBody.GetContent: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TContent;
begin
  if not Assigned(FContent) then
    FContent := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TContent.Create;

  Result := FContent;
end;

procedure TOpenAPIDefinition.TRequestBody.SetRequired(const Value: System.Boolean);
begin
  FRequired := Value;
  FRequiredIsStored := True;
end;

{ TOpenAPIDefinition.TRequestBodyOrReference }

destructor TOpenAPIDefinition.TRequestBodyOrReference.Destroy;
begin
  FReference.Free;

  FRequestBody.Free;

  inherited;
end;

function TOpenAPIDefinition.TRequestBodyOrReference.GetReference: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TReference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TReference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.TRequestBodyOrReference.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

function TOpenAPIDefinition.TRequestBodyOrReference.GetRequestBody: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TRequestBody;
begin
  if not Assigned(FRequestBody) then
    FRequestBody := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TRequestBody.Create;

  Result := FRequestBody;
end;

function TOpenAPIDefinition.TRequestBodyOrReference.GetRequestBodyStored: Boolean;
begin
  Result := Assigned(FRequestBody);
end;

{ TOpenAPIDefinition.TContent }

destructor TOpenAPIDefinition.TContent.Destroy;
begin
  FMediaType.Free;

  inherited;
end;

function TOpenAPIDefinition.TContent.GetMediaType: TDynamicProperty<TOpenAPIDefinition.TMediaType>;
begin
  if not Assigned(FMediaType) then
    FMediaType := TDynamicProperty<Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TMediaType>.Create;

  Result := FMediaType;
end;

function TOpenAPIDefinition.TContent.GetMediaTypeStored: Boolean;
begin
  Result := Assigned(FMediaType);
end;

{ TOpenAPIDefinition.TMediaType }

destructor TOpenAPIDefinition.TMediaType.Destroy;
begin
  FSchema.Free;

  FEncoding.Free;

  FSpecificationExtensions.Free;

  FExamples.Free;

  inherited;
end;

function TOpenAPIDefinition.TMediaType.GetSchema: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.Create;

  Result := FSchema;
end;

function TOpenAPIDefinition.TMediaType.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function TOpenAPIDefinition.TMediaType.GetEncoding: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TMediaType.TEncoding;
begin
  if not Assigned(FEncoding) then
    FEncoding := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TMediaType.TEncoding.Create;

  Result := FEncoding;
end;

function TOpenAPIDefinition.TMediaType.GetEncodingStored: Boolean;
begin
  Result := Assigned(FEncoding);
end;

function TOpenAPIDefinition.TMediaType.GetSpecificationExtensions: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TSpecificationExtensions;
begin
  if not Assigned(FSpecificationExtensions) then
    FSpecificationExtensions := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TSpecificationExtensions.Create;

  Result := FSpecificationExtensions;
end;

function TOpenAPIDefinition.TMediaType.GetSpecificationExtensionsStored: Boolean;
begin
  Result := Assigned(FSpecificationExtensions);
end;

function TOpenAPIDefinition.TMediaType.GetExamples: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TExamples;
begin
  if not Assigned(FExamples) then
    FExamples := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TExamples.Create;

  Result := FExamples;
end;

function TOpenAPIDefinition.TMediaType.GetExamplesStored: Boolean;
begin
  Result := Assigned(FExamples);
end;

{ TOpenAPIDefinition.TMediaType.TEncoding }

destructor TOpenAPIDefinition.TMediaType.TEncoding.Destroy;
begin
  FEncoding.Free;

  inherited;
end;

function TOpenAPIDefinition.TMediaType.TEncoding.GetEncoding: TDynamicProperty<TOpenAPIDefinition.TEncoding>;
begin
  if not Assigned(FEncoding) then
    FEncoding := TDynamicProperty<Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TEncoding>.Create;

  Result := FEncoding;
end;

function TOpenAPIDefinition.TMediaType.TEncoding.GetEncodingStored: Boolean;
begin
  Result := Assigned(FEncoding);
end;

{ TOpenAPIDefinition.TEncoding }

destructor TOpenAPIDefinition.TEncoding.Destroy;
begin
  FHeaders.Free;

  inherited;
end;

function TOpenAPIDefinition.TEncoding.GetContentTypeStored: Boolean;
begin
  Result := not FContentType.IsEmpty;
end;

function TOpenAPIDefinition.TEncoding.GetHeaders: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TEncoding.THeaders;
begin
  if not Assigned(FHeaders) then
    FHeaders := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TEncoding.THeaders.Create;

  Result := FHeaders;
end;

function TOpenAPIDefinition.TEncoding.GetHeadersStored: Boolean;
begin
  Result := Assigned(FHeaders);
end;

procedure TOpenAPIDefinition.TEncoding.SetStyle(const Value: TOpenAPIDefinition.TEncoding.TStyle);
begin
  FStyle := Value;
  FStyleIsStored := True;
end;

procedure TOpenAPIDefinition.TEncoding.SetExplode(const Value: System.Boolean);
begin
  FExplode := Value;
  FExplodeIsStored := True;
end;

procedure TOpenAPIDefinition.TEncoding.SetAllowReserved(const Value: System.Boolean);
begin
  FAllowReserved := Value;
  FAllowReservedIsStored := True;
end;

{ TOpenAPIDefinition.TEncoding.THeaders }

destructor TOpenAPIDefinition.TEncoding.THeaders.Destroy;
begin
  FHeaderOrReference.Free;

  inherited;
end;

function TOpenAPIDefinition.TEncoding.THeaders.GetHeaderOrReference: TDynamicProperty<TOpenAPIDefinition.THeaderOrReference>;
begin
  if not Assigned(FHeaderOrReference) then
    FHeaderOrReference := TDynamicProperty<Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.THeaderOrReference>.Create;

  Result := FHeaderOrReference;
end;

function TOpenAPIDefinition.TEncoding.THeaders.GetHeaderOrReferenceStored: Boolean;
begin
  Result := Assigned(FHeaderOrReference);
end;

{ TOpenAPIDefinition.TResponses }

destructor TOpenAPIDefinition.TResponses.Destroy;
begin
  FDefault.Free;

  FSpecificationExtensions.Free;

  inherited;
end;

function TOpenAPIDefinition.TResponses.GetDefault: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TResponseOrReference;
begin
  if not Assigned(FDefault) then
    FDefault := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TResponseOrReference.Create;

  Result := FDefault;
end;

function TOpenAPIDefinition.TResponses.GetDefaultStored: Boolean;
begin
  Result := Assigned(FDefault);
end;

function TOpenAPIDefinition.TResponses.GetSpecificationExtensions: TDynamicProperty<TOpenAPIDefinition.TResponseOrReference>;
begin
  if not Assigned(FSpecificationExtensions) then
    FSpecificationExtensions := TDynamicProperty<Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TResponseOrReference>.Create;

  Result := FSpecificationExtensions;
end;

function TOpenAPIDefinition.TResponses.GetSpecificationExtensionsStored: Boolean;
begin
  Result := Assigned(FSpecificationExtensions);
end;

{ TOpenAPIDefinition.TResponse }

destructor TOpenAPIDefinition.TResponse.Destroy;
begin
  FHeaders.Free;

  FContent.Free;

  FLinks.Free;

  inherited;
end;

function TOpenAPIDefinition.TResponse.GetHeaders: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TResponse.THeaders;
begin
  if not Assigned(FHeaders) then
    FHeaders := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TResponse.THeaders.Create;

  Result := FHeaders;
end;

function TOpenAPIDefinition.TResponse.GetHeadersStored: Boolean;
begin
  Result := Assigned(FHeaders);
end;

function TOpenAPIDefinition.TResponse.GetContent: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TContent;
begin
  if not Assigned(FContent) then
    FContent := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TContent.Create;

  Result := FContent;
end;

function TOpenAPIDefinition.TResponse.GetContentStored: Boolean;
begin
  Result := Assigned(FContent);
end;

function TOpenAPIDefinition.TResponse.GetLinks: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TResponse.TLinks;
begin
  if not Assigned(FLinks) then
    FLinks := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TResponse.TLinks.Create;

  Result := FLinks;
end;

function TOpenAPIDefinition.TResponse.GetLinksStored: Boolean;
begin
  Result := Assigned(FLinks);
end;

{ TOpenAPIDefinition.TResponse.THeaders }

destructor TOpenAPIDefinition.TResponse.THeaders.Destroy;
begin
  FHeaderOrReference.Free;

  inherited;
end;

function TOpenAPIDefinition.TResponse.THeaders.GetHeaderOrReference: TDynamicProperty<TOpenAPIDefinition.THeaderOrReference>;
begin
  if not Assigned(FHeaderOrReference) then
    FHeaderOrReference := TDynamicProperty<Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.THeaderOrReference>.Create;

  Result := FHeaderOrReference;
end;

function TOpenAPIDefinition.TResponse.THeaders.GetHeaderOrReferenceStored: Boolean;
begin
  Result := Assigned(FHeaderOrReference);
end;

{ TOpenAPIDefinition.TResponse.TLinks }

destructor TOpenAPIDefinition.TResponse.TLinks.Destroy;
begin
  FLinkOrReference.Free;

  inherited;
end;

function TOpenAPIDefinition.TResponse.TLinks.GetLinkOrReference: TDynamicProperty<TOpenAPIDefinition.TLinkOrReference>;
begin
  if not Assigned(FLinkOrReference) then
    FLinkOrReference := TDynamicProperty<Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TLinkOrReference>.Create;

  Result := FLinkOrReference;
end;

function TOpenAPIDefinition.TResponse.TLinks.GetLinkOrReferenceStored: Boolean;
begin
  Result := Assigned(FLinkOrReference);
end;

{ TOpenAPIDefinition.TResponseOrReference }

destructor TOpenAPIDefinition.TResponseOrReference.Destroy;
begin
  FReference.Free;

  FResponse.Free;

  inherited;
end;

function TOpenAPIDefinition.TResponseOrReference.GetReference: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TReference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TReference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.TResponseOrReference.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

function TOpenAPIDefinition.TResponseOrReference.GetResponse: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TResponse;
begin
  if not Assigned(FResponse) then
    FResponse := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TResponse.Create;

  Result := FResponse;
end;

function TOpenAPIDefinition.TResponseOrReference.GetResponseStored: Boolean;
begin
  Result := Assigned(FResponse);
end;

{ TOpenAPIDefinition.TCallbacks }

destructor TOpenAPIDefinition.TCallbacks.Destroy;
begin
  FPathItem.Free;

  inherited;
end;

function TOpenAPIDefinition.TCallbacks.GetPathItem: TDynamicProperty<TOpenAPIDefinition.TPathItem>;
begin
  if not Assigned(FPathItem) then
    FPathItem := TDynamicProperty<Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TPathItem>.Create;

  Result := FPathItem;
end;

function TOpenAPIDefinition.TCallbacks.GetPathItemStored: Boolean;
begin
  Result := Assigned(FPathItem);
end;

{ TOpenAPIDefinition.TCallbacksOrReference }

destructor TOpenAPIDefinition.TCallbacksOrReference.Destroy;
begin
  FReference.Free;

  FCallbacks.Free;

  inherited;
end;

function TOpenAPIDefinition.TCallbacksOrReference.GetReference: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TReference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TReference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.TCallbacksOrReference.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

function TOpenAPIDefinition.TCallbacksOrReference.GetCallbacks: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TCallbacks;
begin
  if not Assigned(FCallbacks) then
    FCallbacks := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TCallbacks.Create;

  Result := FCallbacks;
end;

function TOpenAPIDefinition.TCallbacksOrReference.GetCallbacksStored: Boolean;
begin
  Result := Assigned(FCallbacks);
end;

{ TOpenAPIDefinition.TExample }

function TOpenAPIDefinition.TExample.GetSummaryStored: Boolean;
begin
  Result := not FSummary.IsEmpty;
end;

function TOpenAPIDefinition.TExample.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

procedure TOpenAPIDefinition.TExample.SetValue(const Value: any);
begin
  FValue := Value;
  FValueIsStored := True;
end;

function TOpenAPIDefinition.TExample.GetExternalValueStored: Boolean;
begin
  Result := not FExternalValue.IsEmpty;
end;

{ TOpenAPIDefinition.TExampleOrReference }

destructor TOpenAPIDefinition.TExampleOrReference.Destroy;
begin
  FReference.Free;

  FExample.Free;

  inherited;
end;

function TOpenAPIDefinition.TExampleOrReference.GetReference: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TReference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TReference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.TExampleOrReference.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

function TOpenAPIDefinition.TExampleOrReference.GetExample: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TExample;
begin
  if not Assigned(FExample) then
    FExample := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TExample.Create;

  Result := FExample;
end;

function TOpenAPIDefinition.TExampleOrReference.GetExampleStored: Boolean;
begin
  Result := Assigned(FExample);
end;

{ TOpenAPIDefinition.TLink }

destructor TOpenAPIDefinition.TLink.Destroy;
begin
  FParameters.Free;

  FServer.Free;

  inherited;
end;

function TOpenAPIDefinition.TLink.GetOperationRefStored: Boolean;
begin
  Result := not FOperationRef.IsEmpty;
end;

function TOpenAPIDefinition.TLink.GetOperationIdStored: Boolean;
begin
  Result := not FOperationId.IsEmpty;
end;

function TOpenAPIDefinition.TLink.GetParameters: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TMapOfStrings;
begin
  if not Assigned(FParameters) then
    FParameters := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TMapOfStrings.Create;

  Result := FParameters;
end;

function TOpenAPIDefinition.TLink.GetParametersStored: Boolean;
begin
  Result := Assigned(FParameters);
end;

procedure TOpenAPIDefinition.TLink.SetRequestBody(const Value: any);
begin
  FRequestBody := Value;
  FRequestBodyIsStored := True;
end;

function TOpenAPIDefinition.TLink.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.TLink.GetServer: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TServer;
begin
  if not Assigned(FServer) then
    FServer := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TServer.Create;

  Result := FServer;
end;

function TOpenAPIDefinition.TLink.GetServerStored: Boolean;
begin
  Result := Assigned(FServer);
end;

{ TOpenAPIDefinition.TLinkOrReference }

destructor TOpenAPIDefinition.TLinkOrReference.Destroy;
begin
  FReference.Free;

  FLink.Free;

  inherited;
end;

function TOpenAPIDefinition.TLinkOrReference.GetReference: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TReference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TReference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.TLinkOrReference.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

function TOpenAPIDefinition.TLinkOrReference.GetLink: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TLink;
begin
  if not Assigned(FLink) then
    FLink := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TLink.Create;

  Result := FLink;
end;

function TOpenAPIDefinition.TLinkOrReference.GetLinkStored: Boolean;
begin
  Result := Assigned(FLink);
end;

{ TOpenAPIDefinition.THeader }

destructor TOpenAPIDefinition.THeader.Destroy;
begin
  FSchema.Free;

  FContent.Free;

  inherited;
end;

function TOpenAPIDefinition.THeader.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

procedure TOpenAPIDefinition.THeader.SetRequired(const Value: System.Boolean);
begin
  FRequired := Value;
  FRequiredIsStored := True;
end;

procedure TOpenAPIDefinition.THeader.SetDeprecated(const Value: System.Boolean);
begin
  FDeprecated := Value;
  FDeprecatedIsStored := True;
end;

function TOpenAPIDefinition.THeader.GetSchema: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition;
begin
  if not Assigned(FSchema) then
    FSchema := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.Create;

  Result := FSchema;
end;

function TOpenAPIDefinition.THeader.GetSchemaStored: Boolean;
begin
  Result := Assigned(FSchema);
end;

function TOpenAPIDefinition.THeader.GetContent: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TContent;
begin
  if not Assigned(FContent) then
    FContent := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TContent.Create;

  Result := FContent;
end;

function TOpenAPIDefinition.THeader.GetContentStored: Boolean;
begin
  Result := Assigned(FContent);
end;

{ TOpenAPIDefinition.THeaderOrReference }

destructor TOpenAPIDefinition.THeaderOrReference.Destroy;
begin
  FReference.Free;

  FHeader.Free;

  inherited;
end;

function TOpenAPIDefinition.THeaderOrReference.GetReference: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TReference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TReference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.THeaderOrReference.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

function TOpenAPIDefinition.THeaderOrReference.GetHeader: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.THeader;
begin
  if not Assigned(FHeader) then
    FHeader := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.THeader.Create;

  Result := FHeader;
end;

function TOpenAPIDefinition.THeaderOrReference.GetHeaderStored: Boolean;
begin
  Result := Assigned(FHeader);
end;

{ TOpenAPIDefinition.TTag }

destructor TOpenAPIDefinition.TTag.Destroy;
begin
  FExternalDocs.Free;

  inherited;
end;

function TOpenAPIDefinition.TTag.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.TTag.GetExternalDocs: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TExternalDocumentation;
begin
  if not Assigned(FExternalDocs) then
    FExternalDocs := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TExternalDocumentation.Create;

  Result := FExternalDocs;
end;

function TOpenAPIDefinition.TTag.GetExternalDocsStored: Boolean;
begin
  Result := Assigned(FExternalDocs);
end;

{ TOpenAPIDefinition.TReference }

function TOpenAPIDefinition.TReference.GetRefStored: Boolean;
begin
  Result := not FRef.IsEmpty;
end;

function TOpenAPIDefinition.TReference.GetSummaryStored: Boolean;
begin
  Result := not FSummary.IsEmpty;
end;

function TOpenAPIDefinition.TReference.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

{ TOpenAPIDefinition.TSchema }

destructor TOpenAPIDefinition.TSchema.Destroy;
begin
  FObject.Free;

  inherited;
end;

function TOpenAPIDefinition.TSchema.GetObject: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TSchema.TObject;
begin
  if not Assigned(FObject) then
    FObject := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TSchema.TObject.Create;

  Result := FObject;
end;

function TOpenAPIDefinition.TSchema.GetObjectStored: Boolean;
begin
  Result := Assigned(FObject);
end;

procedure TOpenAPIDefinition.TSchema.SetBoolean(const Value: System.Boolean);
begin
  FBoolean := Value;
  FBooleanIsStored := True;
end;

{ TOpenAPIDefinition.TSecurityScheme }

destructor TOpenAPIDefinition.TSecurityScheme.Destroy;
begin
  FSpecificationExtensions.Free;

  FTypeApikey.Free;

  FTypeHttp.Free;

  FTypeHttpBearer.Free;

  FTypeOauth2.Free;

  FTypeOidc.Free;

  inherited;
end;

function TOpenAPIDefinition.TSecurityScheme.GetDescriptionStored: Boolean;
begin
  Result := not FDescription.IsEmpty;
end;

function TOpenAPIDefinition.TSecurityScheme.GetSpecificationExtensions: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TSpecificationExtensions;
begin
  if not Assigned(FSpecificationExtensions) then
    FSpecificationExtensions := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TSpecificationExtensions.Create;

  Result := FSpecificationExtensions;
end;

function TOpenAPIDefinition.TSecurityScheme.GetSpecificationExtensionsStored: Boolean;
begin
  Result := Assigned(FSpecificationExtensions);
end;

function TOpenAPIDefinition.TSecurityScheme.GetTypeApikey: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TSecurityScheme.TTypeApikey;
begin
  if not Assigned(FTypeApikey) then
    FTypeApikey := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TSecurityScheme.TTypeApikey.Create;

  Result := FTypeApikey;
end;

function TOpenAPIDefinition.TSecurityScheme.GetTypeApikeyStored: Boolean;
begin
  Result := Assigned(FTypeApikey);
end;

function TOpenAPIDefinition.TSecurityScheme.GetTypeHttp: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TSecurityScheme.TTypeHttp;
begin
  if not Assigned(FTypeHttp) then
    FTypeHttp := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TSecurityScheme.TTypeHttp.Create;

  Result := FTypeHttp;
end;

function TOpenAPIDefinition.TSecurityScheme.GetTypeHttpStored: Boolean;
begin
  Result := Assigned(FTypeHttp);
end;

function TOpenAPIDefinition.TSecurityScheme.GetTypeHttpBearer: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TSecurityScheme.TTypeHttpBearer;
begin
  if not Assigned(FTypeHttpBearer) then
    FTypeHttpBearer := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TSecurityScheme.TTypeHttpBearer.Create;

  Result := FTypeHttpBearer;
end;

function TOpenAPIDefinition.TSecurityScheme.GetTypeHttpBearerStored: Boolean;
begin
  Result := Assigned(FTypeHttpBearer);
end;

function TOpenAPIDefinition.TSecurityScheme.GetTypeOauth2: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TSecurityScheme.TTypeOauth2;
begin
  if not Assigned(FTypeOauth2) then
    FTypeOauth2 := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TSecurityScheme.TTypeOauth2.Create;

  Result := FTypeOauth2;
end;

function TOpenAPIDefinition.TSecurityScheme.GetTypeOauth2Stored: Boolean;
begin
  Result := Assigned(FTypeOauth2);
end;

function TOpenAPIDefinition.TSecurityScheme.GetTypeOidc: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TSecurityScheme.TTypeOidc;
begin
  if not Assigned(FTypeOidc) then
    FTypeOidc := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TSecurityScheme.TTypeOidc.Create;

  Result := FTypeOidc;
end;

function TOpenAPIDefinition.TSecurityScheme.GetTypeOidcStored: Boolean;
begin
  Result := Assigned(FTypeOidc);
end;

{ TOpenAPIDefinition.TSecurityScheme.TTypeHttpBearer }

function TOpenAPIDefinition.TSecurityScheme.TTypeHttpBearer.GetBearerFormatStored: Boolean;
begin
  Result := not FBearerFormat.IsEmpty;
end;

{ TOpenAPIDefinition.TSecurityScheme.TTypeOauth2 }

destructor TOpenAPIDefinition.TSecurityScheme.TTypeOauth2.Destroy;
begin
  FFlows.Free;

  inherited;
end;

function TOpenAPIDefinition.TSecurityScheme.TTypeOauth2.GetFlows: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TOauthFlows;
begin
  if not Assigned(FFlows) then
    FFlows := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TOauthFlows.Create;

  Result := FFlows;
end;

{ TOpenAPIDefinition.TSecuritySchemeOrReference }

destructor TOpenAPIDefinition.TSecuritySchemeOrReference.Destroy;
begin
  FReference.Free;

  FSecurityScheme.Free;

  inherited;
end;

function TOpenAPIDefinition.TSecuritySchemeOrReference.GetReference: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TReference;
begin
  if not Assigned(FReference) then
    FReference := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TReference.Create;

  Result := FReference;
end;

function TOpenAPIDefinition.TSecuritySchemeOrReference.GetReferenceStored: Boolean;
begin
  Result := Assigned(FReference);
end;

function TOpenAPIDefinition.TSecuritySchemeOrReference.GetSecurityScheme: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TSecurityScheme;
begin
  if not Assigned(FSecurityScheme) then
    FSecurityScheme := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TSecurityScheme.Create;

  Result := FSecurityScheme;
end;

function TOpenAPIDefinition.TSecuritySchemeOrReference.GetSecuritySchemeStored: Boolean;
begin
  Result := Assigned(FSecurityScheme);
end;

{ TOpenAPIDefinition.TOauthFlows }

destructor TOpenAPIDefinition.TOauthFlows.Destroy;
begin
  FImplicit.Free;

  FPassword.Free;

  FClientCredentials.Free;

  FAuthorizationCode.Free;

  inherited;
end;

function TOpenAPIDefinition.TOauthFlows.GetImplicit: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TOauthFlows.TImplicit;
begin
  if not Assigned(FImplicit) then
    FImplicit := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TOauthFlows.TImplicit.Create;

  Result := FImplicit;
end;

function TOpenAPIDefinition.TOauthFlows.GetImplicitStored: Boolean;
begin
  Result := Assigned(FImplicit);
end;

function TOpenAPIDefinition.TOauthFlows.GetPassword: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TOauthFlows.TPassword;
begin
  if not Assigned(FPassword) then
    FPassword := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TOauthFlows.TPassword.Create;

  Result := FPassword;
end;

function TOpenAPIDefinition.TOauthFlows.GetPasswordStored: Boolean;
begin
  Result := Assigned(FPassword);
end;

function TOpenAPIDefinition.TOauthFlows.GetClientCredentials: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TOauthFlows.TClientCredentials;
begin
  if not Assigned(FClientCredentials) then
    FClientCredentials := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TOauthFlows.TClientCredentials.Create;

  Result := FClientCredentials;
end;

function TOpenAPIDefinition.TOauthFlows.GetClientCredentialsStored: Boolean;
begin
  Result := Assigned(FClientCredentials);
end;

function TOpenAPIDefinition.TOauthFlows.GetAuthorizationCode: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TOauthFlows.TAuthorizationCode;
begin
  if not Assigned(FAuthorizationCode) then
    FAuthorizationCode := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TOauthFlows.TAuthorizationCode.Create;

  Result := FAuthorizationCode;
end;

function TOpenAPIDefinition.TOauthFlows.GetAuthorizationCodeStored: Boolean;
begin
  Result := Assigned(FAuthorizationCode);
end;

{ TOpenAPIDefinition.TOauthFlows.TImplicit }

destructor TOpenAPIDefinition.TOauthFlows.TImplicit.Destroy;
begin
  FScopes.Free;

  inherited;
end;

function TOpenAPIDefinition.TOauthFlows.TImplicit.GetRefreshUrlStored: Boolean;
begin
  Result := not FRefreshUrl.IsEmpty;
end;

function TOpenAPIDefinition.TOauthFlows.TImplicit.GetScopes: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TMapOfStrings;
begin
  if not Assigned(FScopes) then
    FScopes := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TMapOfStrings.Create;

  Result := FScopes;
end;

{ TOpenAPIDefinition.TOauthFlows.TPassword }

destructor TOpenAPIDefinition.TOauthFlows.TPassword.Destroy;
begin
  FScopes.Free;

  inherited;
end;

function TOpenAPIDefinition.TOauthFlows.TPassword.GetRefreshUrlStored: Boolean;
begin
  Result := not FRefreshUrl.IsEmpty;
end;

function TOpenAPIDefinition.TOauthFlows.TPassword.GetScopes: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TMapOfStrings;
begin
  if not Assigned(FScopes) then
    FScopes := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TMapOfStrings.Create;

  Result := FScopes;
end;

{ TOpenAPIDefinition.TOauthFlows.TClientCredentials }

destructor TOpenAPIDefinition.TOauthFlows.TClientCredentials.Destroy;
begin
  FScopes.Free;

  inherited;
end;

function TOpenAPIDefinition.TOauthFlows.TClientCredentials.GetRefreshUrlStored: Boolean;
begin
  Result := not FRefreshUrl.IsEmpty;
end;

function TOpenAPIDefinition.TOauthFlows.TClientCredentials.GetScopes: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TMapOfStrings;
begin
  if not Assigned(FScopes) then
    FScopes := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TMapOfStrings.Create;

  Result := FScopes;
end;

{ TOpenAPIDefinition.TOauthFlows.TAuthorizationCode }

destructor TOpenAPIDefinition.TOauthFlows.TAuthorizationCode.Destroy;
begin
  FScopes.Free;

  inherited;
end;

function TOpenAPIDefinition.TOauthFlows.TAuthorizationCode.GetRefreshUrlStored: Boolean;
begin
  Result := not FRefreshUrl.IsEmpty;
end;

function TOpenAPIDefinition.TOauthFlows.TAuthorizationCode.GetScopes: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TMapOfStrings;
begin
  if not Assigned(FScopes) then
    FScopes := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TMapOfStrings.Create;

  Result := FScopes;
end;

{ TOpenAPIDefinition.TSecurityRequirement }

destructor TOpenAPIDefinition.TSecurityRequirement.Destroy;
begin
  FArray.Free;

  inherited;
end;

function TOpenAPIDefinition.TSecurityRequirement.GetArray: TDynamicProperty<TArray<System.String>>;
begin
  if not Assigned(FArray) then
    FArray := TDynamicProperty<TArray<System.String>>.Create;

  Result := FArray;
end;

function TOpenAPIDefinition.TSecurityRequirement.GetArrayStored: Boolean;
begin
  Result := Assigned(FArray);
end;

{ TOpenAPIDefinition.TSpecificationExtensions }

destructor TOpenAPIDefinition.TSpecificationExtensions.Destroy;
begin
  FPatternProperty.Free;

  inherited;
end;

function TOpenAPIDefinition.TSpecificationExtensions.GetPatternProperty: TDynamicProperty<any>;
begin
  if not Assigned(FPatternProperty) then
    FPatternProperty := TDynamicProperty<System.Rtti.TValue>.Create;

  Result := FPatternProperty;
end;

function TOpenAPIDefinition.TSpecificationExtensions.GetPatternPropertyStored: Boolean;
begin
  Result := Assigned(FPatternProperty);
end;

{ TOpenAPIDefinition.TExamples }

destructor TOpenAPIDefinition.TExamples.Destroy;
begin
  FExamples.Free;

  inherited;
end;

procedure TOpenAPIDefinition.TExamples.SetExample(const Value: any);
begin
  FExample := Value;
  FExampleIsStored := True;
end;

function TOpenAPIDefinition.TExamples.GetExamples: Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TExamples.TExamples;
begin
  if not Assigned(FExamples) then
    FExamples := Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TExamples.TExamples.Create;

  Result := FExamples;
end;

function TOpenAPIDefinition.TExamples.GetExamplesStored: Boolean;
begin
  Result := Assigned(FExamples);
end;

{ TOpenAPIDefinition.TExamples.TExamples }

destructor TOpenAPIDefinition.TExamples.TExamples.Destroy;
begin
  FExampleOrReference.Free;

  inherited;
end;

function TOpenAPIDefinition.TExamples.TExamples.GetExampleOrReference: TDynamicProperty<TOpenAPIDefinition.TExampleOrReference>;
begin
  if not Assigned(FExampleOrReference) then
    FExampleOrReference := TDynamicProperty<Blue.Print.Open.API.Schema.v31.TOpenAPIDefinition.TExampleOrReference>.Create;

  Result := FExampleOrReference;
end;

function TOpenAPIDefinition.TExamples.TExamples.GetExampleOrReferenceStored: Boolean;
begin
  Result := Assigned(FExampleOrReference);
end;

{ TOpenAPIDefinition.TMapOfStrings }

destructor TOpenAPIDefinition.TMapOfStrings.Destroy;
begin
  FString.Free;

  inherited;
end;

function TOpenAPIDefinition.TMapOfStrings.GetString: TDynamicProperty<System.String>;
begin
  if not Assigned(FString) then
    FString := TDynamicProperty<System.String>.Create;

  Result := FString;
end;

function TOpenAPIDefinition.TMapOfStrings.GetStringStored: Boolean;
begin
  Result := Assigned(FString);
end;

{ TOpenAPIDefinition.TExplodeForForm }

procedure TOpenAPIDefinition.TExplodeForForm.SetExplode(const Value: System.Boolean);
begin
  FExplode := Value;
  FExplodeIsStored := True;
end;

end.
