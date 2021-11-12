unit Delphi.Rest.Types;

interface

uses System.Rtti, System.Classes, {$IFDEF PAS2JS}Web{$ELSE}Web.HTTPApp, System.Net.Mime{$ENDIF};

type
  TRESTMethod = (rmDelete, rmGet, rmPatch, rmPost, rmPut);
  TRESTParamType = (ptBody, ptURL);

  TRESTFile = {$IFDEF PAS2JS}TJSHTMLFile{$ELSE}TAbstractWebRequestFile{$ENDIF};
  TRESTFormData = {$IFDEF PAS2JS}TJSFormData{$ELSE}TMultipartFormData{$ENDIF};

  TRESTMethodAttribute = class(TCustomAttribute)
  private
    FMethod: TRESTMethod;
  public
    constructor Create(Method: TRESTMethod);

    class function GetMethodType(Method: TRttiMethod; var MethodType: TRESTMethod): Boolean;

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
  public
    constructor Create(ParamType: TRESTParamType);

    class function GetParamsInURL(Method: TRttiMethod; var ParamType: TRESTParamType): Boolean;

    property ParamType: TRESTParamType read FParamType write FParamType;
  end;

  ParamInBody = class(TRESTParamAttribute)
  public
    constructor Create;
  end;

  ParamInURL = class(TRESTParamAttribute)
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

implementation

uses System.SysUtils;

{ TRESTMethodAttribute }

constructor TRESTMethodAttribute.Create(Method: TRESTMethod);
begin
  inherited Create;

  FMethod := Method;
end;

class function TRESTMethodAttribute.GetMethodType(Method: TRttiMethod; var MethodType: TRESTMethod): Boolean;

  function GetTypeFromAttributes(RttiType: TRttiObject; var Value: TRESTMethod): Boolean;
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

begin
  Result := GetTypeFromAttributes(Method, MethodType) or GetTypeFromAttributes(Method.Parent, MethodType);
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

constructor TRESTParamAttribute.Create(ParamType: TRESTParamType);
begin
  inherited Create;

  FParamType := ParamType;
end;

class function TRESTParamAttribute.GetParamsInURL(Method: TRttiMethod; var ParamType: TRESTParamType): Boolean;

  function GetTypeFromAttributes(RttiType: TRttiObject; var Value: TRESTParamType): Boolean;
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

begin
  Result := GetTypeFromAttributes(Method, ParamType) or GetTypeFromAttributes(Method.Parent, ParamType);
end;

{ ParamInBody }

constructor ParamInBody.Create;
begin
  inherited Create(ptBody);
end;

{ ParamInURL }

constructor ParamInURL.Create;
begin
  inherited Create(ptURL);
end;

{ RemoteNameAttribute }

constructor RemoteNameAttribute.Create(const RemoteName: String);
begin
  inherited Create;

  FRemoteName := RemoteName;
end;

end.

