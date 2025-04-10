unit Blue.Print.Open.API.Schema.v30;

interface

{$M+}

// File generated from Open API 3.0.json;

uses Blue.Print.Types;

type
  // Forward class declaration
  TOpenAPI30 = class;
  License = class;
  Contact = class;
  Info = class;
  Variables = class;
  Servers = class;
  Security = class;
  ExternalDocs = class;
  Tags = class;
  RequestBodies = class;
  Responses = class;
  Callbacks = class;
  SecuritySchemes = class;
  Links = class;
  Schemas = class;
  Parameters = class;
  Headers = class;
  Examples = class;
  Components = class;
  Paths = class;

  TOpenAPI30 = class
  private
    FOpenapi: System.String;
    FInfo: Info;
    FServers: TArray<Servers>;
    FSecurity: TArray<Security>;
    FTags: TArray<Tags>;
    FComponents: Components;
    FExternalDocs: ExternalDocs;
    FPaths: Paths;
    function GetInfo: Info;
    function GetComponents: Components;
    function GetExternalDocs: ExternalDocs;
    function GetPaths: Paths;
  public
    destructor Destroy; override;

    function AddServers: Servers;
    function AddSecurity: Security;
    function AddTags: Tags;
  published
    property openapi: System.String read FOpenapi write FOpenapi;
    property info: Info read GetInfo write FInfo;
    property servers: TArray<Servers> read FServers write FServers;
    property security: TArray<Security> read FSecurity write FSecurity;
    property tags: TArray<Tags> read FTags write FTags;
    property components: Components read GetComponents write FComponents;
    property externalDocs: ExternalDocs read GetExternalDocs write FExternalDocs;
    property paths: Paths read GetPaths write FPaths;
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

  Variables = class
  end;

  Servers = class
  private
    FVariables: Variables;
    FDescription: System.String;
    FUrl: System.String;
    function GetVariables: Variables;
  public
    destructor Destroy; override;
  published
    property variables: Variables read GetVariables write FVariables;
    property description: System.String read FDescription write FDescription;
    property url: System.String read FUrl write FUrl;
  end;

  Security = class
  end;

  ExternalDocs = class
  private
    FDescription: System.String;
    FUrl: System.String;
  published
    property description: System.String read FDescription write FDescription;
    property url: System.String read FUrl write FUrl;
  end;

  Tags = class
  private
    FName: System.String;
    FDescription: System.String;
    FExternalDocs: ExternalDocs;
    function GetExternalDocs: ExternalDocs;
  public
    destructor Destroy; override;
  published
    property name: System.String read FName write FName;
    property description: System.String read FDescription write FDescription;
    property externalDocs: ExternalDocs read GetExternalDocs write FExternalDocs;
  end;

  RequestBodies = class
  end;

  Responses = class
  end;

  Callbacks = class
  end;

  SecuritySchemes = class
  end;

  Links = class
  end;

  Schemas = class
  end;

  Parameters = class
  end;

  Headers = class
  end;

  Examples = class
  end;

  Components = class
  private
    FRequestBodies: RequestBodies;
    FResponses: Responses;
    FCallbacks: Callbacks;
    FSecuritySchemes: SecuritySchemes;
    FLinks: Links;
    FSchemas: Schemas;
    FParameters: Parameters;
    FHeaders: Headers;
    FExamples: Examples;
    function GetRequestBodies: RequestBodies;
    function GetResponses: Responses;
    function GetCallbacks: Callbacks;
    function GetSecuritySchemes: SecuritySchemes;
    function GetLinks: Links;
    function GetSchemas: Schemas;
    function GetParameters: Parameters;
    function GetHeaders: Headers;
    function GetExamples: Examples;
  public
    destructor Destroy; override;
  published
    property requestBodies: RequestBodies read GetRequestBodies write FRequestBodies;
    property responses: Responses read GetResponses write FResponses;
    property callbacks: Callbacks read GetCallbacks write FCallbacks;
    property securitySchemes: SecuritySchemes read GetSecuritySchemes write FSecuritySchemes;
    property links: Links read GetLinks write FLinks;
    property schemas: Schemas read GetSchemas write FSchemas;
    property parameters: Parameters read GetParameters write FParameters;
    property headers: Headers read GetHeaders write FHeaders;
    property examples: Examples read GetExamples write FExamples;
  end;

  Paths = class
  end;

implementation

uses System.SysUtils;

{ TOpenAPI30 }

destructor TOpenAPI30.Destroy;
begin
  FInfo.Free;

  for var AObject in FServers do
    AObject.Free;

  for var AObject in FSecurity do
    AObject.Free;

  for var AObject in FTags do
    AObject.Free;

  FComponents.Free;

  FExternalDocs.Free;

  FPaths.Free;

  inherited;
end;

function TOpenAPI30.GetInfo: Info;
begin
  if not Assigned(FInfo) then
    FInfo := Info.Create;

  Result := FInfo;
end;

function TOpenAPI30.AddServers: Servers;
begin
  Result := Servers.Create;

  FServers := FServers + [Result];
end;

function TOpenAPI30.AddSecurity: Security;
begin
  Result := Security.Create;

  FSecurity := FSecurity + [Result];
end;

function TOpenAPI30.AddTags: Tags;
begin
  Result := Tags.Create;

  FTags := FTags + [Result];
end;

function TOpenAPI30.GetComponents: Components;
begin
  if not Assigned(FComponents) then
    FComponents := Components.Create;

  Result := FComponents;
end;

function TOpenAPI30.GetExternalDocs: ExternalDocs;
begin
  if not Assigned(FExternalDocs) then
    FExternalDocs := ExternalDocs.Create;

  Result := FExternalDocs;
end;

function TOpenAPI30.GetPaths: Paths;
begin
  if not Assigned(FPaths) then
    FPaths := Paths.Create;

  Result := FPaths;
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

{ Servers }

destructor Servers.Destroy;
begin
  FVariables.Free;

  inherited;
end;

function Servers.GetVariables: Variables;
begin
  if not Assigned(FVariables) then
    FVariables := Variables.Create;

  Result := FVariables;
end;

{ Tags }

destructor Tags.Destroy;
begin
  FExternalDocs.Free;

  inherited;
end;

function Tags.GetExternalDocs: ExternalDocs;
begin
  if not Assigned(FExternalDocs) then
    FExternalDocs := ExternalDocs.Create;

  Result := FExternalDocs;
end;

{ Components }

destructor Components.Destroy;
begin
  FRequestBodies.Free;

  FResponses.Free;

  FCallbacks.Free;

  FSecuritySchemes.Free;

  FLinks.Free;

  FSchemas.Free;

  FParameters.Free;

  FHeaders.Free;

  FExamples.Free;

  inherited;
end;

function Components.GetRequestBodies: RequestBodies;
begin
  if not Assigned(FRequestBodies) then
    FRequestBodies := RequestBodies.Create;

  Result := FRequestBodies;
end;

function Components.GetResponses: Responses;
begin
  if not Assigned(FResponses) then
    FResponses := Responses.Create;

  Result := FResponses;
end;

function Components.GetCallbacks: Callbacks;
begin
  if not Assigned(FCallbacks) then
    FCallbacks := Callbacks.Create;

  Result := FCallbacks;
end;

function Components.GetSecuritySchemes: SecuritySchemes;
begin
  if not Assigned(FSecuritySchemes) then
    FSecuritySchemes := SecuritySchemes.Create;

  Result := FSecuritySchemes;
end;

function Components.GetLinks: Links;
begin
  if not Assigned(FLinks) then
    FLinks := Links.Create;

  Result := FLinks;
end;

function Components.GetSchemas: Schemas;
begin
  if not Assigned(FSchemas) then
    FSchemas := Schemas.Create;

  Result := FSchemas;
end;

function Components.GetParameters: Parameters;
begin
  if not Assigned(FParameters) then
    FParameters := Parameters.Create;

  Result := FParameters;
end;

function Components.GetHeaders: Headers;
begin
  if not Assigned(FHeaders) then
    FHeaders := Headers.Create;

  Result := FHeaders;
end;

function Components.GetExamples: Examples;
begin
  if not Assigned(FExamples) then
    FExamples := Examples.Create;

  Result := FExamples;
end;

end.
