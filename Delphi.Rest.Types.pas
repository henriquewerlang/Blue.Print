unit Delphi.Rest.Types;

interface

uses System.Rtti, System.Classes, {$IFDEF PAS2JS}Web{$ELSE}Web.HTTPApp, System.Net.Mime, System.NetEncoding{$ENDIF};

type
  TRESTMethod = (rmDelete, rmGet, rmPatch, rmPost, rmPut);
  TRESTParamType = (ptBody, ptQuery, ptPath);

  TRESTFile = {$IFDEF PAS2JS}TJSHTMLFile{$ELSE}TAbstractWebRequestFile{$ENDIF};
  TRESTFormData = {$IFDEF PAS2JS}TJSFormData{$ELSE}TMultipartFormData{$ENDIF};

  TRESTMethodAttribute = class(TCustomAttribute)
  private
    FMethod: TRESTMethod;

    class function GetTypeFromAttributes(const RttiType: TRttiObject; var Value: TRESTMethod): Boolean;
  public
    constructor Create(const Method: TRESTMethod);

    class function GetMethodType(const Method: TRttiMethod; var MethodType: TRESTMethod): Boolean;

    property Method: TRESTMethod read FMethod write FMethod;
  end;

  DELETEAttribute = class(TRESTMethodAttribute)
  public
    constructor Create;
  end;

  GETAttribute = class(TRESTMethodAttribute)
  public
    constructor Create;
  end;

  PATCHAttribute = class(TRESTMethodAttribute)
  public
    constructor Create;
  end;

  POSTAttribute = class(TRESTMethodAttribute)
  public
    constructor Create;
  end;

  PUTAttribute = class(TRESTMethodAttribute)
  public
    constructor Create;
  end;

  TRESTParamAttribute = class(TCustomAttribute)
  private
    FParamType: TRESTParamType;

    class function GetTypeFromAttributes(const RttiType: TRttiObject; var Value: TRESTParamType): Boolean;
  public
    constructor Create(const ParamType: TRESTParamType);

    class function GetParamAtrributeType(const Method: TRttiMethod; var ParamType: TRESTParamType): Boolean;

    property ParamType: TRESTParamType read FParamType write FParamType;
  end;

  ParamInBody = class(TRESTParamAttribute)
  public
    constructor Create;
  end;

  ParamInQuery = class(TRESTParamAttribute)
  public
    constructor Create;
  end;

  ParamInPath = class(TRESTParamAttribute)
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
  public
    constructor Create(const Name: String);

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

implementation

uses System.SysUtils;

function ConvertToBase64(const Value: String): String;
begin
  Result :=
    {$IFDEF PAS2JS}
    Window.btoa
    {$ELSE}
    TBase64Encoding.Base64String.Encode
    {$ENDIF}
      (Value);
end;

{ TRESTMethodAttribute }

constructor TRESTMethodAttribute.Create(const Method: TRESTMethod);
begin
  inherited Create;

  FMethod := Method;
end;

class function TRESTMethodAttribute.GetMethodType(const Method: TRttiMethod; var MethodType: TRESTMethod): Boolean;
begin
  Result := GetTypeFromAttributes(Method, MethodType) or GetTypeFromAttributes(Method.Parent, MethodType);
end;

class function TRESTMethodAttribute.GetTypeFromAttributes(const RttiType: TRttiObject; var Value: TRESTMethod): Boolean;
var
  Attribute: TCustomAttribute;

begin
  Result := False;

  for Attribute in RttiType.GetAttributes do
    if Attribute is TRESTMethodAttribute then
    begin
      Value := TRESTMethodAttribute(Attribute).Method;

      Exit(True);
    end;
end;

{ POSTAttribute }

constructor POSTAttribute.Create;
begin
  inherited Create(rmPost);
end;

{ GETAttribute }

constructor GETAttribute.Create;
begin
  inherited Create(rmGet);
end;

{ DELETEAttribute }

constructor DELETEAttribute.Create;
begin
  inherited Create(rmDelete);
end;

{ PATCHAttribute }

constructor PATCHAttribute.Create;
begin
  inherited Create(rmPatch);
end;

{ PUTAttribute }

constructor PUTAttribute.Create;
begin
  inherited Create(rmPut);
end;

{ TRESTParamAttribute }

constructor TRESTParamAttribute.Create(const ParamType: TRESTParamType);
begin
  inherited Create;

  FParamType := ParamType;
end;

class function TRESTParamAttribute.GetParamAtrributeType(const Method: TRttiMethod; var ParamType: TRESTParamType): Boolean;
begin
  Result := GetTypeFromAttributes(Method, ParamType) or GetTypeFromAttributes(Method.Parent, ParamType);
end;

class function TRESTParamAttribute.GetTypeFromAttributes(const RttiType: TRttiObject; var Value: TRESTParamType): Boolean;
var
  Attribute: TCustomAttribute;

begin
  Result := False;

  for Attribute in RttiType.GetAttributes do
    if Attribute is TRESTParamAttribute then
    begin
      Value := TRESTParamAttribute(Attribute).ParamType;

      Exit(True);
    end;
end;

{ ParamInBody }

constructor ParamInBody.Create;
begin
  inherited Create(ptBody);
end;

{ ParamInQuery }

constructor ParamInQuery.Create;
begin
  inherited Create(ptQuery);
end;

{ ParamInPath }

constructor ParamInPath.Create;
begin
  inherited Create(ptPath);
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

end.

