unit Blue.Print.Types;

interface

uses System.Rtti, System.Classes, System.SysUtils, System.TypInfo, {$IFDEF PAS2JS}Web{$ELSE}Web.HTTPApp, System.Net.Mime, System.NetEncoding{$ENDIF};

{$SCOPEDENUMS ON}

type
  TParameterType = (Body, Query, Path);
  TRequestFile = {$IFDEF PAS2JS}TJSHTMLFile{$ELSE}TAbstractWebRequestFile{$ENDIF};
  TRequestMethod = (Delete, Get, Patch, Post, Put);
  TResponseFile = {$IFDEF PAS2JS}TJSBlob{$ELSE}TStream{$ENDIF};

  IBluePrintSerializer = interface
    ['{5848116B-902F-4FF8-BE8F-D53F586C400E}']
    function Deserialize(const Value: TStream; const TypeInfo: PTypeInfo): TValue;

    procedure Serialize(const Value: TValue; const Output: TStream);
  end;

  EHTTPStatusError = class(Exception)
  private
    FStatusCode: Integer;
  public
    constructor Create(const StatusCode: Integer; const URL: String);

    property StatusCode: Integer read FStatusCode;
  end;

  TRequestMethodAttribute = class(TCustomAttribute)
  private
    FMethod: TRequestMethod;

    constructor Create(const Method: TRequestMethod);
  public
    property Method: TRequestMethod read FMethod;
  end;

  DeleteAttribute = class(TRequestMethodAttribute)
  public
    constructor Create;
  end;

  GetAttribute = class(TRequestMethodAttribute)
  public
    constructor Create;
  end;

  PatchAttribute = class(TRequestMethodAttribute)
  public
    constructor Create;
  end;

  PostAttribute = class(TRequestMethodAttribute)
  public
    constructor Create;
  end;

  PutAttribute = class(TRequestMethodAttribute)
  public
    constructor Create;
  end;

  TParameterAttribute = class(TCustomAttribute)
  private
    FParamType: TParameterType;

    constructor Create(const ParamType: TParameterType);
  public
    property ParamType: TParameterType read FParamType;
  end;

  Body = class(TParameterAttribute)
  public
    constructor Create;
  end;

  Query = class(TParameterAttribute)
  public
    constructor Create;
  end;

  Path = class(TParameterAttribute)
  public
    constructor Create;
  end;

  RemoteNameAttribute = class(TCustomAttribute)
  private
    FRemoteName: String;
  public
    constructor Create(const RemoteName: String);

    property RemoteName: String read FRemoteName write FRemoteName;
  end;

  TAuthentication = class(TCustomAttribute)
  private
    class function GetHeaderFromAttribute(const RttiType: TRttiObject; var AuthenticationName, AuthenticationValue: String): Boolean;
  private
    FName: String;

    constructor Create(const Name: String);
  public
    class function LoadHeaders(const Method: TRttiMethod; var AuthenticationName, AuthenticationValue: String): Boolean;

    function LoadHeaderValue: String; virtual;

    property Name: String read FName;
  end;

  BasicAuthenticationAttribute = class(TAuthentication)
  private
    FPassword: String;
    FUser: String;
  public
    constructor Create(const User, Password: String);

    function LoadHeaderValue: String; override;
  end;

  ContentTypeAttribute = class(TCustomAttribute)
  private
    FContentType: String;
    FCharSet: String;
  public
    constructor Create(const ContentType: String); overload;
    constructor Create(const ContentType, CharSet: String); overload;

    property CharSet: String read FCharSet;
    property ContentType: String read FContentType;
  end;

  AttachmentAttribute = class(ContentTypeAttribute)
  private
    FFileName: String;
  public
    constructor Create(const FileName, ContentType: String); reintroduce;

    property FileName: String read FFileName;
  end;

  HeaderAttribute = class(TCustomAttribute)
  private
    FName: String;
    FValue: String;
  public
    constructor Create(const Name, Value: String);

    property Name: String read FName;
    property Value: String read FValue;
  end;

function IsTypeKindString(const TypeKind: TTypeKind): Boolean;

implementation

function IsTypeKindString(const TypeKind: TTypeKind): Boolean;
begin
  Result := TypeKind in [{$IFDEF DCC}tkAnsiChar, tkAnsiString, tkLString, tkWString, tkUString, tkWChar, {$ENDIF}tkChar, tkString];
end;

function ConvertToBase64(const Value: String): String;
begin
  Result :=
    {$IFDEF PAS2JS}
    Window.btoa
    {$ELSE}
    TBase64Encoding.Base64.Encode
    {$ENDIF}
      (Value);
end;

{ EHTTPStatusError }

constructor EHTTPStatusError.Create(const StatusCode: Integer; const URL: String);
begin
  inherited CreateFmt('HTTP Error %d for URL %s', [StatusCode, URL]);

  FStatusCode := StatusCode;
end;

{ TRequestMethodAttribute }

constructor TRequestMethodAttribute.Create(const Method: TRequestMethod);
begin
  inherited Create;

  FMethod := Method;
end;

{ POSTAttribute }

constructor POSTAttribute.Create;
begin
  inherited Create(TRequestMethod.Post);
end;

{ GETAttribute }

constructor GETAttribute.Create;
begin
  inherited Create(TRequestMethod.Get);
end;

{ DELETEAttribute }

constructor DELETEAttribute.Create;
begin
  inherited Create(TRequestMethod.Delete);
end;

{ PATCHAttribute }

constructor PATCHAttribute.Create;
begin
  inherited Create(TRequestMethod.Patch);
end;

{ PUTAttribute }

constructor PUTAttribute.Create;
begin
  inherited Create(TRequestMethod.Put);
end;

{ TParameterAttribute }

constructor TParameterAttribute.Create(const ParamType: TParameterType);
begin
  inherited Create;

  FParamType := ParamType;
end;

{ Body }

constructor Body.Create;
begin
  inherited Create(TParameterType.Body);
end;

{ Query }

constructor Query.Create;
begin
  inherited Create(TParameterType.Query);
end;

{ Path }

constructor Path.Create;
begin
  inherited Create(TParameterType.Path);
end;

{ RemoteNameAttribute }

constructor RemoteNameAttribute.Create(const RemoteName: String);
begin
  inherited Create;

  FRemoteName := RemoteName;
end;

{ TAuthentication }

constructor TAuthentication.Create(const Name: String);
begin
  inherited Create;

  FName := Name;
end;

class function TAuthentication.GetHeaderFromAttribute(const RttiType: TRttiObject; var AuthenticationName, AuthenticationValue: String): Boolean;
var
  Attribute: TCustomAttribute;

begin
  AuthenticationValue := EmptyStr;
  Result := False;

  for Attribute in RttiType.GetAttributes do
    if Attribute is TAuthentication then
    begin
      AuthenticationName := TAuthentication(Attribute).Name;
      AuthenticationValue := TAuthentication(Attribute).LoadHeaderValue;

      Exit(True);
    end;
end;

class function TAuthentication.LoadHeaders(const Method: TRttiMethod; var AuthenticationName, AuthenticationValue: String): Boolean;
begin
  Result := GetHeaderFromAttribute(Method, AuthenticationName, AuthenticationValue) or GetHeaderFromAttribute(Method.Parent, AuthenticationName, AuthenticationValue);
end;

function TAuthentication.LoadHeaderValue: String;
begin
  Result := EmptyStr;
end;

{ BasicAuthenticationAttribute }

constructor BasicAuthenticationAttribute.Create(const User, Password: String);
begin
  inherited Create('Basic');

  FPassword := Password;
  FUser := User;
end;

function BasicAuthenticationAttribute.LoadHeaderValue: String;
begin
  Result := ConvertToBase64(Format('%s:%s', [FUser, FPassword]));
end;

{ ContentTypeAttribute }

constructor ContentTypeAttribute.Create(const ContentType: String);
begin
  inherited Create;

  FContentType := ContentType;
end;

constructor ContentTypeAttribute.Create(const ContentType, CharSet: String);
begin
  Create(ContentType);

  FCharSet := CharSet;
end;

{ AttachmentAttribute }

constructor AttachmentAttribute.Create(const FileName, ContentType: String);
begin
  inherited Create(ContentType);

  FFileName := FileName;
end;

{ HeaderAttribute }

constructor HeaderAttribute.Create(const Name, Value: String);
begin
  inherited Create;

  FName := Name;
  FValue := Value;
end;

end.

