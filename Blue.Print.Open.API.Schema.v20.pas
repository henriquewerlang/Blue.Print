unit Blue.Print.Open.API.Schema.v20;

interface

{$M+}

// File generated from Open API 2.0.json;

uses Blue.Print.Types;

type
  // Forward class declaration
  TOpenAPI20 = class;
  ExternalDocs = class;
  Tags = class;
  Paths = class;
  Responses = class;
  License = class;
  Contact = class;
  Info = class;
  Security = class;
  Parameters = class;
  Definitions = class;
  SecurityDefinitions = class;

  TOpenAPI20 = class
  private
    FExternalDocs: ExternalDocs;
    FTags: TArray<Tags>;
    FBasePath: System.String;
    FSwagger: System.String;
    FConsumes: consumes;
    FPaths: Paths;
    FResponses: Responses;
    FInfo: Info;
    FSchemes: System.String;
    FSecurity: Security;
    FParameters: Parameters;
    FDefinitions: Definitions;
    FProduces: produces;
    FHost: System.String;
    FSecurityDefinitions: SecurityDefinitions;
    function GetExternalDocs: ExternalDocs;
    function GetPaths: Paths;
    function GetResponses: Responses;
    function GetInfo: Info;
    function GetSecurity: Security;
    function GetParameters: Parameters;
    function GetDefinitions: Definitions;
    function GetSecurityDefinitions: SecurityDefinitions;
  public
    destructor Destroy; override;

    function AddTags: Tags;
  published
    property externalDocs: ExternalDocs read GetExternalDocs write FExternalDocs;
    property tags: TArray<Tags> read FTags write FTags;
    property basePath: System.String read FBasePath write FBasePath;
    property swagger: System.String read FSwagger write FSwagger;
    property consumes: consumes read FConsumes write FConsumes;
    property paths: Paths read GetPaths write FPaths;
    property responses: Responses read GetResponses write FResponses;
    property info: Info read GetInfo write FInfo;
    property schemes: System.String read FSchemes write FSchemes;
    property security: Security read GetSecurity write FSecurity;
    property parameters: Parameters read GetParameters write FParameters;
    property definitions: Definitions read GetDefinitions write FDefinitions;
    property produces: produces read FProduces write FProduces;
    property host: System.String read FHost write FHost;
    property securityDefinitions: SecurityDefinitions read GetSecurityDefinitions write FSecurityDefinitions;
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

  Paths = class
  end;

  Responses = class
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

  Security = class
  end;

  Parameters = class
  end;

  Definitions = class
  end;

  SecurityDefinitions = class
  end;

implementation

uses System.SysUtils;

{ TOpenAPI20 }

destructor TOpenAPI20.Destroy;
begin
  FExternalDocs.Free;

  for var AObject in FTags do
    AObject.Free;

  FPaths.Free;

  FResponses.Free;

  FInfo.Free;

  FSecurity.Free;

  FParameters.Free;

  FDefinitions.Free;

  FSecurityDefinitions.Free;

  inherited;
end;

function TOpenAPI20.GetExternalDocs: ExternalDocs;
begin
  if not Assigned(FExternalDocs) then
    FExternalDocs := ExternalDocs.Create;

  Result := FExternalDocs;
end;

function TOpenAPI20.AddTags: Tags;
begin
  Result := Tags.Create;

  FTags := FTags + [Result];
end;

function TOpenAPI20.GetPaths: Paths;
begin
  if not Assigned(FPaths) then
    FPaths := Paths.Create;

  Result := FPaths;
end;

function TOpenAPI20.GetResponses: Responses;
begin
  if not Assigned(FResponses) then
    FResponses := Responses.Create;

  Result := FResponses;
end;

function TOpenAPI20.GetInfo: Info;
begin
  if not Assigned(FInfo) then
    FInfo := Info.Create;

  Result := FInfo;
end;

function TOpenAPI20.GetSecurity: Security;
begin
  if not Assigned(FSecurity) then
    FSecurity := Security.Create;

  Result := FSecurity;
end;

function TOpenAPI20.GetParameters: Parameters;
begin
  if not Assigned(FParameters) then
    FParameters := Parameters.Create;

  Result := FParameters;
end;

function TOpenAPI20.GetDefinitions: Definitions;
begin
  if not Assigned(FDefinitions) then
    FDefinitions := Definitions.Create;

  Result := FDefinitions;
end;

function TOpenAPI20.GetSecurityDefinitions: SecurityDefinitions;
begin
  if not Assigned(FSecurityDefinitions) then
    FSecurityDefinitions := SecurityDefinitions.Create;

  Result := FSecurityDefinitions;
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

end.
