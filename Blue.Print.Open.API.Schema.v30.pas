unit Blue.Print.Open.API.Schema.v30;

interface

{$M+}
{$SCOPEDENUMS ON}

uses System.Generics.Collections, Blue.Print.Types, Blue.Print.Serializer;

type
  TFormat = (Undefined, int32, int64, float, double, byte, binary, date, datetime, password);
  TParameterLocation = (Undefined, cookie, header, path, query);
  TPropertyType = (Undefined, &array, boolean, null, integer, number, &object, &string);
  TSecurityType = (Undefined, apiKey, http, oauth2, openIdConnect);
  TStyle = (Undefined, matrix, &label, simple, form, spaceDelimited, pipeDelimited, deepObject);

  TExampleObject = class;
  THeaderObject = class;
  TPathItemObject = class;
  TSchemaObject = class;

  TOAuthFlowObject = class
  private
    FauthorizationUrl: String;
    FtokenUrl: String;
    FrefreshUrl: String;
    Fscopes: TMap<String, String>;
  published
    property authorizationUrl: String read FauthorizationUrl write FauthorizationUrl;
    property tokenUrl: String read FtokenUrl write FtokenUrl;
    property refreshUrl: String read FrefreshUrl write FrefreshUrl;
    property scopes: TMap<String, String> read Fscopes write Fscopes;
  end;

  TOAuthFlowsObject = class
  private
    Fimplicit: TOAuthFlowObject;
    Fpassword: TOAuthFlowObject;
    FclientCredentials: TOAuthFlowObject;
    FauthorizationCode: TOAuthFlowObject;
  published
    property implicit: TOAuthFlowObject read Fimplicit write Fimplicit;
    property password: TOAuthFlowObject read Fpassword write Fpassword;
    property clientCredentials: TOAuthFlowObject read FclientCredentials write FclientCredentials;
    property authorizationCode: TOAuthFlowObject read FauthorizationCode write FauthorizationCode;
  end;

  TSecurityRequirementObject = class
  private
    FRequiriments: TMap<String, String>;
  published
    property Requiriments: TMap<String, String> read FRequiriments write FRequiriments;
  end;

  TDiscriminatorObject = class
  private
    FpropertyName: String;
    Fmapping: TMap<String, String>;
  published
    property propertyName: String read FpropertyName write FpropertyName;
    property mapping: TMap<String, String> read Fmapping write Fmapping;
  end;

  TXMLObject = class
  private
    Fname: String;
    Fnamespace: String;
    Fprefix: String;
    Fattribute: Boolean;
    Fwrapped: Boolean;
  published
    property name: String read Fname write Fname;
    property namespace: String read Fnamespace write Fnamespace;
    property prefix: String read Fprefix write Fprefix;
    property attribute: Boolean read Fattribute write Fattribute;
    property wrapped: Boolean read Fwrapped write Fwrapped;
  end;

  TServerVariableObject = class
  private
    Fenum: TArray<String>;
    Fdefault: String;
    Fdescription: String;
  published
    property enum: TArray<String> read Fenum write Fenum;
    property &default: String read Fdefault write Fdefault;
    property description: String read Fdescription write Fdescription;
  end;

  TServerObject = class
  private
    Furl: String;
    Fdescription: String;
    Fvariables: TMap<String, TServerVariableObject>;
  published
    property url: String read Furl write Furl;
    property description: String read Fdescription write Fdescription;
    property variables: TMap<String, TServerVariableObject> read Fvariables write Fvariables;
  end;

  TContactObject = class
  private
    Fname: String;
    Furl: String;
    Femail: String;
  published
    property name: String read Fname write Fname;
    property url: String read Furl write Furl;
    property email: String read Femail write Femail;
  end;

  TLicenseObject = class
  private
    Fname: String;
    Furl: String;
  published
    property name: String read Fname write Fname;
    property url: String read Furl write Furl;
  end;

  TInfoObject = class
  private
    Ftitle: String;
    Fdescription: String;
    FtermsOfService: String;
    Fcontact: TContactObject;
    Flicense: TLicenseObject;
    Fversion: String;
  public
    destructor Destroy; override;
  published
    property title: String read Ftitle write Ftitle;
    property description: String read Fdescription write Fdescription;
    property termsOfService: String read FtermsOfService write FtermsOfService;
    property contact: TContactObject read Fcontact write Fcontact;
    property license: TLicenseObject read Flicense write Flicense;
    property version: String read Fversion write Fversion;
  end;

  TExternalDocumentationObject = class
  private
    Fdescription: String;
    Furl: String;
  published
    property description: String read Fdescription write Fdescription;
    property url: String read Furl write Furl;
  end;

  TEncodingObject = class
  private
    FcontentType: String;
    Fheaders: TMap<String, THeaderObject>;
    Fstyle: TStyle;
    Fexplode: Boolean;
    FallowReserved: Boolean;
  published
    property contentType: String read FcontentType write FcontentType;
    property headers: TMap<String, THeaderObject> read Fheaders write Fheaders;
    property style: TStyle read Fstyle write Fstyle;
    property explode: Boolean read Fexplode write Fexplode;
    property allowReserved: Boolean read FallowReserved write FallowReserved;
  end;

  TMediaTypeObject = class
  private
    Fschema: TSchemaObject;
    Fexamples: TMap<String, TExampleObject>;
    Fexample: String;
    Fencoding: TMap<String, TEncodingObject>;
  published
    property schema: TSchemaObject read Fschema write Fschema;
    property example: String read Fexample write Fexample;
    property examples: TMap<String, TExampleObject> read Fexamples write Fexamples;
    property encoding: TMap<String, TEncodingObject> read Fencoding write Fencoding;
  end;

  TReferenceObject = class
  private
    Fref: String;
  published
    [FieldName('$ref')]
    property ref: String read Fref write Fref;
  end;

  TSchemaObject = class(TReferenceObject)
  private
    Fnullable: Boolean;
    Fdiscriminator: TDiscriminatorObject;
    FreadOnly: Boolean;
    FwriteOnly: Boolean;
    Fxml: TXMLObject;
    FexternalDocs: TExternalDocumentationObject;
    Fexample: String;
    Fdeprecated: Boolean;
    Ftitle: String;
    Ftype: TPropertyType;
    FmultipleOf: Double;
    Fmaximum: Double;
    FexclusiveMaximum: Double;
    Fminimum: Double;
    FexclusiveMinimum: Double;
    FmaxLength: Integer;
    FminLength: Integer;
    Fpattern: String;
    FmaxItems: Integer;
    FminItems: Integer;
    FuniqueItems: Boolean;
    FmaxProperties: Integer;
    FminProperties: Integer;
    Frequired: TArray<String>;
    Fenum: TArray<String>;
    FallOf: TArray<TSchemaObject>;
    FoneOf: TArray<TSchemaObject>;
    FanyOf: Tarray<TSchemaObject>;
    Fnot: TSchemaObject;
    Fitems: TSchemaObject;
    Fproperties: TMap<String, TSchemaObject>;
    FadditionalProperties: Boolean;
    Fdescription: String;
    Fformat: TFormat;
    Fdefault: String;
  published
    property title: String read Ftitle write Ftitle;
    property multipleOf: Double read FmultipleOf write FmultipleOf;
    property maximum: Double read Fmaximum write Fmaximum;
    property exclusiveMaximum: Double read FexclusiveMaximum write FexclusiveMaximum;
    property minimum: Double read Fminimum write Fminimum;
    property exclusiveMinimum: Double read FexclusiveMinimum write FexclusiveMinimum;
    property maxLength: Integer read FmaxLength write FmaxLength;
    property minLength: Integer read FminLength write FminLength;
    property pattern: String read Fpattern write Fpattern;
    property maxItems: Integer read FmaxItems write FmaxItems;
    property minItems: Integer read FminItems write FminItems;
    property uniqueItems: Boolean read FuniqueItems write FuniqueItems;
    property maxProperties: Integer read FmaxProperties write FmaxProperties;
    property minProperties: Integer read FminProperties write FminProperties;
    property required: TArray<String> read Frequired write Frequired;
    property enum: TArray<String> read Fenum write Fenum;
    property &type: TPropertyType read Ftype write Ftype;
    property allOf: TArray<TSchemaObject> read FallOf write FallOf;
    property oneOf: TArray<TSchemaObject> read FoneOf write FoneOf;
    property anyOf: Tarray<TSchemaObject> read FanyOf write FanyOf;
    property &not: TSchemaObject read Fnot write Fnot;
    property items: TSchemaObject read Fitems write Fitems;
    property properties: TMap<String, TSchemaObject> read Fproperties write Fproperties;
    property additionalProperties: Boolean read FadditionalProperties write FadditionalProperties;
    property description: String read Fdescription write Fdescription;
    property format: TFormat read Fformat write Fformat;
    property &default: String read Fdefault write Fdefault;
    property nullable: Boolean read Fnullable write Fnullable;
    property discriminator: TDiscriminatorObject read Fdiscriminator write Fdiscriminator;
    property readOnly: Boolean read FreadOnly write FreadOnly;
    property writeOnly: Boolean read FwriteOnly write FwriteOnly;
    property xml: TXMLObject read Fxml write Fxml;
    property externalDocs: TExternalDocumentationObject read FexternalDocs write FexternalDocs;
    property example: String read Fexample write Fexample;
    property deprecated: Boolean read Fdeprecated write Fdeprecated;
  end;

  TLinkObject = class(TReferenceObject)
  private
    FoperationRef: String;
    FoperationId: String;
    Fparameters: TMap<String, String>;
    FrequestBody: String;
    Fdescription: String;
    Fserver: TServerObject;
  published
    property operationRef: String read FoperationRef write FoperationRef;
    property operationId: String read FoperationId write FoperationId;
    property parameters: TMap<String, String> read Fparameters write Fparameters;
    property requestBody: String read FrequestBody write FrequestBody;
    property description: String read Fdescription write Fdescription;
    property server: TServerObject read Fserver write Fserver;
  end;

  TResponseObject = class(TReferenceObject)
  private
    Fdescription: String;
    Fheaders: TMap<String, THeaderObject>;
    Fcontent: TMap<String, TMediaTypeObject>;
    Flinks: TMap<String, TLinkObject>;
  published
    property description: String read Fdescription write Fdescription;
    property headers: TMap<String, THeaderObject> read Fheaders write Fheaders;
    property content: TMap<String, TMediaTypeObject> read Fcontent write Fcontent;
    property links: TMap<String, TLinkObject> read Flinks write Flinks;
  end;

  TExampleObject = class(TReferenceObject)
  private
    Fsummary: String;
    Fdescription: String;
    Fvalue: String;
    FexternalValue: String;
  published
    property summary: String read Fsummary write Fsummary;
    property description: String read Fdescription write Fdescription;
    property value: String read Fvalue write Fvalue;
    property externalValue: String read FexternalValue write FexternalValue;
  end;

  TParameterObject = class(TReferenceObject)
  private
    Fin: TParameterLocation;
    Fname: String;
    Fdescription: String;
    Frequired: Boolean;
    Fdeprecated: Boolean;
    FallowEmptyValue: Boolean;
    Fstyle: TStyle;
    Fexplode: Boolean;
    FallowReserved: Boolean;
    Fschema: TSchemaObject;
    Fexample: String;
    Fexamples: TMap<String, TExampleObject>;
    Fcontent: TMap<String, TMediaTypeObject>;
  published
    property name: String read Fname write Fname;
    property &in: TParameterLocation read Fin write Fin;
    property description: String read Fdescription write Fdescription;
    property required: Boolean read Frequired write Frequired;
    property deprecated: Boolean read Fdeprecated write Fdeprecated;
    property allowEmptyValue: Boolean read FallowEmptyValue write FallowEmptyValue;

    // For Schema
    property style: TStyle read Fstyle write Fstyle;
    property explode: Boolean read Fexplode write Fexplode;
    property allowReserved: Boolean read FallowReserved write FallowReserved;
    property schema: TSchemaObject read Fschema write Fschema;
    property example: String read Fexample write Fexample;
    property examples: TMap<String, TExampleObject> read Fexamples write Fexamples;

    // For Content
    property content: TMap<String, TMediaTypeObject> read Fcontent write Fcontent;
  end;

  TRequestBodyObject = class(TReferenceObject)
  private
    Fdescription: String;
    Fcontent: TMap<String, TMediaTypeObject>;
    Frequired: Boolean;
  published
    property description: String read Fdescription write Fdescription;
    property content: TMap<String, TMediaTypeObject> read Fcontent write Fcontent;
    property required: Boolean read Frequired write Frequired;
  end;

  THeaderObject = class(TParameterObject)
  end;

  TSecuritySchemeObject = class(TReferenceObject)
  private
    Ftype: TSecurityType;
    Fdescription: String;
    Fname: String;
    Fin: TParameterLocation;
    Fscheme: String;
    FbearerFormat: String;
    Fflows: TOAuthFlowsObject;
    FopenIdConnectUrl: String;
  published
    property &type: TSecurityType read Ftype write Ftype;
    property description: String read Fdescription write Fdescription;
    property name: String read Fname write Fname;
    property &in: TParameterLocation read Fin write Fin;
    property scheme: String read Fscheme write Fscheme;
    property bearerFormat: String read FbearerFormat write FbearerFormat;
    property flows: TOAuthFlowsObject read Fflows write Fflows;
    property openIdConnectUrl: String read FopenIdConnectUrl write FopenIdConnectUrl;
  end;

  TCallbackObject = class(TReferenceObject)
  private
    FExpressions: TMap<String, TPathItemObject>;
  published
    [Default]
    property Expressions: TMap<String, TPathItemObject> read FExpressions write FExpressions;
  end;

  TResponsesObject = class
  private
    Fdefault: TResponseObject;
    FHTTPStatusCode: TMap<Integer, TResponseObject>;
  published
    property &default: TResponseObject read Fdefault write Fdefault;
    [Default]
    property HTTPStatusCode: TMap<Integer, TResponseObject> read FHTTPStatusCode write FHTTPStatusCode;
  end;

  TOperationObject = class
  private
    Ftags: TArray<String>;
    Fsummary: String;
    Fdescription: String;
    FexternalDocs: TExternalDocumentationObject;
    FoperationId: String;
    Fparameters: TArray<TParameterObject>;
    FrequestBody: TRequestBodyObject;
    Fresponses: TResponsesObject;
    Fcallbacks: TMap<String, TCallbackObject>;
    Fdeprecated: Boolean;
    Fsecurity: TArray<TSecurityRequirementObject>;
    Fservers: TArray<TServerObject>;
  published
    property tags: TArray<String> read Ftags write Ftags;
    property summary: String read Fsummary write Fsummary;
    property description: String read Fdescription write Fdescription;
    property externalDocs: TExternalDocumentationObject read FexternalDocs write FexternalDocs;
    property operationId: String read FoperationId write FoperationId;
    property parameters: TArray<TParameterObject> read Fparameters write Fparameters;
    property requestBody: TRequestBodyObject read FrequestBody write FrequestBody;
    property responses: TResponsesObject read Fresponses write Fresponses;
    property callbacks: TMap<String, TCallbackObject> read Fcallbacks write Fcallbacks;
    property deprecated: Boolean read Fdeprecated write Fdeprecated;
    property security: TArray<TSecurityRequirementObject> read Fsecurity write Fsecurity;
    property servers: TArray<TServerObject> read Fservers write Fservers;
  end;

  TPathItemObject = class(TReferenceObject)
  private
    Fsummary: String;
    Fdescription: String;
    Fget: TOperationObject;
    Fput: TOperationObject;
    Fpost: TOperationObject;
    Fdelete: TOperationObject;
    Foptions: TOperationObject;
    Fhead: TOperationObject;
    Fpatch: TOperationObject;
    Ftrace: TOperationObject;
    Fservers: TArray<TServerObject>;
    Fparameters: TArray<TParameterObject>;
  published
    property summary: String read Fsummary write Fsummary;
    property description: String read Fdescription write Fdescription;
    property get: TOperationObject read Fget write Fget;
    property put: TOperationObject read Fput write Fput;
    property post: TOperationObject read Fpost write Fpost;
    property delete: TOperationObject read Fdelete write Fdelete;
    property options: TOperationObject read Foptions write Foptions;
    property head: TOperationObject read Fhead write Fhead;
    property patch: TOperationObject read Fpatch write Fpatch;
    property trace: TOperationObject read Ftrace write Ftrace;
    property servers: TArray<TServerObject> read Fservers write Fservers;
    property parameters: TArray<TParameterObject> read Fparameters write Fparameters;
  end;

  TPathsObject = class
  private
    FPaths: TMap<String, TPathItemObject>;
  published
    [Default]
    property Paths: TMap<String, TPathItemObject> read FPaths write FPaths;
  end;

  TComponentsObject = class
  private
    Fschemas: TMap<String, TSchemaObject>;
    Fresponses: TMap<String, TResponseObject>;
    Fparameters: TMap<String, TParameterObject>;
    Fexamples: TMap<String, TExampleObject>;
    FrequestBodies: TMap<String, TRequestBodyObject>;
    Fheaders: TMap<String, THeaderObject>;
    FsecuritySchemes: TMap<String, TSecuritySchemeObject>;
    Flinks: TMap<String, TLinkObject>;
    Fcallbacks: TMap<String, TCallbackObject>;
  published
    property schemas: TMap<String, TSchemaObject> read Fschemas write Fschemas;
    property responses: TMap<String, TResponseObject> read Fresponses write Fresponses;
    property parameters: TMap<String, TParameterObject> read Fparameters write Fparameters;
    property examples: TMap<String, TExampleObject> read Fexamples write Fexamples;
    property requestBodies: TMap<String, TRequestBodyObject> read FrequestBodies write FrequestBodies;
    property headers: TMap<String, THeaderObject> read Fheaders write Fheaders;
    property securitySchemes: TMap<String, TSecuritySchemeObject> read FsecuritySchemes write FsecuritySchemes;
    property links: TMap<String, TLinkObject> read Flinks write Flinks;
    property callbacks: TMap<String, TCallbackObject> read Fcallbacks write Fcallbacks;
  end;

  TTagObject = class
  private
    Fname: String;
    Fdescription: String;
    FexternalDocs: TExternalDocumentationObject;
  published
    property name: String read Fname write Fname;
    property description: String read Fdescription write Fdescription;
    property externalDocs: TExternalDocumentationObject read FexternalDocs write FexternalDocs;
  end;

  TOpenAPIObject = class
  private
    Fopenapi: String;
    Finfo: TInfoObject;
    Fservers: TArray<TServerObject>;
    Fpaths: TPathsObject;
    Fcomponents: TComponentsObject;
    Ftags: TArray<TTagObject>;
    Fsecurity: TArray<TSecurityRequirementObject>;
    FexternalDocs: TExternalDocumentationObject;
  published
    property openapi: String read Fopenapi write Fopenapi;
    property info: TInfoObject read Finfo write Finfo;
    property servers: TArray<TServerObject> read Fservers write Fservers;
    property paths: TPathsObject read Fpaths write Fpaths;
    property components: TComponentsObject read Fcomponents write Fcomponents;
    property security: TArray<TSecurityRequirementObject> read Fsecurity write Fsecurity;
    property tags: TArray<TTagObject> read Ftags write Ftags;
    property externalDocs: TExternalDocumentationObject read FexternalDocs write FexternalDocs;
  end;

implementation

{ TInfoObject }

destructor TInfoObject.Destroy;
begin
  Fcontact.Free;

  Flicense.Free;

  inherited;
end;

end.

