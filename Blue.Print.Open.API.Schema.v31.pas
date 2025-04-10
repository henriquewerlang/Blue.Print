unit Blue.Print.Open.API.Schema.v31;

interface

{$M+}

// File generated from Open API 3.1.json;

uses Blue.Print.Types;

type
  // Forward class declaration
  TOpenAPI31 = class;
  Webhooks = class;
  Security = class;

  TOpenAPI31 = class
  private
    FOpenapi: System.String;
    FServers: TArray<servers>;
    FTags: TArray<tags>;
    FComponents: components;
    FPaths: paths;
    FWebhooks: Webhooks;
    FInfo: info;
    FSecurity: TArray<Security>;
    FExternalDocs: externalDocs;
    FJsonSchemaDialect: System.String;
    function GetWebhooks: Webhooks;
  public
    destructor Destroy; override;

    function AddSecurity: Security;
  published
    property openapi: System.String read FOpenapi write FOpenapi;
    property servers: TArray<servers> read FServers write FServers;
    property tags: TArray<tags> read FTags write FTags;
    property components: components read FComponents write FComponents;
    property paths: paths read FPaths write FPaths;
    property webhooks: Webhooks read GetWebhooks write FWebhooks;
    property info: info read FInfo write FInfo;
    property security: TArray<Security> read FSecurity write FSecurity;
    property externalDocs: externalDocs read FExternalDocs write FExternalDocs;
    property jsonSchemaDialect: System.String read FJsonSchemaDialect write FJsonSchemaDialect;
  end;

  Webhooks = class
  end;

  Security = class
  end;

implementation

uses System.SysUtils;

{ TOpenAPI31 }

destructor TOpenAPI31.Destroy;
begin
  FWebhooks.Free;

  for var AObject in FSecurity do
    AObject.Free;

  inherited;
end;

function TOpenAPI31.GetWebhooks: Webhooks;
begin
  if not Assigned(FWebhooks) then
    FWebhooks := Webhooks.Create;

  Result := FWebhooks;
end;

function TOpenAPI31.AddSecurity: Security;
begin
  Result := Security.Create;

  FSecurity := FSecurity + [Result];
end;

end.
