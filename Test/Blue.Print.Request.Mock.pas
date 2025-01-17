unit Blue.Print.Request.Mock;

interface

uses System.Classes, System.SysUtils, Web.HTTPApp, System.Generics.Collections;

type
  TIntegerVariable = {$IF CompilerVersion >= 35.0}Int64{$ELSE}Integer{$ENDIF};

  TWebRequestMock = class(TWebRequest)
  private
    FHeaders: TDictionary<String, String>;
    FStringVariables: TDictionary<Integer, String>;

    function GetHeader(const HeaderName: String): String;

    procedure SetHeader(const HeaderName, Value: String);
    procedure SetIntegerVariable(const Index: Integer; const Value: TIntegerVariable);
  public
    constructor Create(const MethodName, Path: String);

    destructor Destroy; override;

    function GetDateVariable(Index: Integer): TDateTime; override;
    function GetFieldByName(const Name: String): String; override;
    function GetIntegerVariable(Index: Integer): TIntegerVariable; override;
    function GetRawContent: TBytes; override;
    function GetStringVariable(Index: Integer): String; override;
    function ReadClient(var Buffer; Count: Integer): Integer; override;
    function ReadString(Count: Integer): String; override;
    function TranslateURI(const URI: String): String; override;
    function WriteClient(var Buffer; Count: Integer): Integer; override;
    function WriteHeaders(StatusCode: Integer; const ReasonString, Headers: String): Boolean; override;
    function WriteString(const AString: String): Boolean; override;

    procedure SetStringVariable(const Index: Integer; const Value: String);
    procedure UpdateMethodType;

    property ContentLength: TIntegerVariable index 16 read GetIntegerVariable write SetIntegerVariable;
    property Headers[const HeaderName: String]: String read GetHeader write SetHeader;
    property Method: string index 0 read GetStringVariable write SetStringVariable;
    property PathInfo: String index 4 read GetStringVariable write SetStringVariable;
    property QueryFields: String index 3 read GetStringVariable write SetStringVariable;
  end;

  TWebResponseMock = class(TWebResponse)
  private
    FContent: String;
    FIntegerVariable: TDictionary<Integer, TIntegerVariable>;
    FRequest: TWebRequest;
    FSent: Boolean;
    FStatusCode: Integer;
    FStringVariables: TDictionary<Integer, String>;
  protected
    function GetContent: String; override;
    function GetDateVariable(Index: Integer): TDateTime; override;
    function GetIntegerVariable(Index: Integer): TIntegerVariable; override;
    function GetLogMessage: String; override;
    function GetStatusCode: Integer; override;
    function GetStringVariable(Index: Integer): String; override;

    procedure SetContent(const Value: String); override;
    procedure SetDateVariable(Index: Integer; const Value: TDateTime); override;
    procedure SetIntegerVariable(Index: Integer; Value: TIntegerVariable); override;
    procedure SetLogMessage(const Value: String); override;
    procedure SetStatusCode(Value: Integer); override;
    procedure SetStringVariable(Index: Integer; const Value: String); override;
  public
    constructor Create(Request: TWebRequest);

    destructor Destroy; override;

    function Sent: Boolean; override;

    procedure SendRedirect(const URI: String); override;
    procedure SendResponse; override;
    procedure SendStream(AStream: TStream); override;
  end;

implementation

{ TWebRequestMock }

constructor TWebRequestMock.Create(const MethodName, Path: String);
begin
  FHeaders := TDictionary<String, String>.Create;
  FStringVariables := TDictionary<Integer, String>.Create;
  Method := MethodName;
  PathInfo := Path;

  inherited Create;
end;

destructor TWebRequestMock.Destroy;
begin
  FHeaders.Free;

  FStringVariables.Free;

  inherited;
end;

function TWebRequestMock.GetDateVariable(Index: Integer): TDateTime;
begin
  Result := 0;
end;

function TWebRequestMock.GetFieldByName(const Name: String): String;
begin
  Result := EmptyStr;

  FHeaders.TryGetValue(Name, Result);
end;

function TWebRequestMock.GetHeader(const HeaderName: String): String;
begin
  Result := FHeaders[HeaderName];
end;

function TWebRequestMock.GetIntegerVariable(Index: Integer): TIntegerVariable;
begin
  Result := StrToInt64Def(GetStringVariable(Index), 0);
end;

function TWebRequestMock.GetRawContent: TBytes;
begin
  Result := nil;
end;

function TWebRequestMock.GetStringVariable(Index: Integer): String;
begin
  FStringVariables.TryGetValue(Index, Result);
end;

function TWebRequestMock.ReadClient(var Buffer; Count: Integer): Integer;
begin
  Result := 0;
end;

function TWebRequestMock.ReadString(Count: Integer): String;
begin
  Result := EmptyStr;
end;

procedure TWebRequestMock.SetHeader(const HeaderName, Value: String);
begin
  FHeaders.AddOrSetValue(HeaderName, Value);
end;

procedure TWebRequestMock.SetIntegerVariable(const Index: Integer; const Value: TIntegerVariable);
begin
  FStringVariables.AddOrSetValue(Index, Value.ToString);
end;

procedure TWebRequestMock.SetStringVariable(const Index: Integer; const Value: String);
begin
  FStringVariables.AddOrSetValue(Index, Value);
end;

function TWebRequestMock.TranslateURI(const URI: String): String;
begin
  Result := EmptyStr;
end;

procedure TWebRequestMock.UpdateMethodType;
begin
  inherited UpdateMethodType;
end;

function TWebRequestMock.WriteClient(var Buffer; Count: Integer): Integer;
begin
  Result := 0;
end;

function TWebRequestMock.WriteHeaders(StatusCode: Integer; const ReasonString, Headers: String): Boolean;
begin
  Result := False;
end;

function TWebRequestMock.WriteString(const AString: String): Boolean;
begin
  Result := False;
end;

{ TWebResponseMock }

constructor TWebResponseMock.Create(Request: TWebRequest);
begin
  inherited;

  FIntegerVariable := TDictionary<Integer, TIntegerVariable>.Create;
  FRequest := Request;
  FStringVariables := TDictionary<Integer, String>.Create;
end;

destructor TWebResponseMock.Destroy;
begin
  FRequest.Free;

  FIntegerVariable.Free;

  FStringVariables.Free;

  inherited;
end;

function TWebResponseMock.GetContent: String;
begin
  Result := FContent;
end;

function TWebResponseMock.GetDateVariable(Index: Integer): TDateTime;
begin
  Result := 0;
end;

function TWebResponseMock.GetIntegerVariable(Index: Integer): TIntegerVariable;
begin
  Result := FIntegerVariable[Index];
end;

function TWebResponseMock.GetLogMessage: String;
begin

end;

function TWebResponseMock.GetStatusCode: Integer;
begin
  Result := FStatusCode;
end;

function TWebResponseMock.GetStringVariable(Index: Integer): String;
begin
  FStringVariables.TryGetValue(Index, Result);
end;

procedure TWebResponseMock.SendRedirect(const URI: String);
begin
  inherited;

end;

procedure TWebResponseMock.SendResponse;
begin
  inherited;

  FSent := True;
end;

procedure TWebResponseMock.SendStream(AStream: TStream);
begin
  inherited;

end;

function TWebResponseMock.Sent: Boolean;
begin
  Result := FSent;
end;

procedure TWebResponseMock.SetContent(const Value: String);
begin
  inherited;

  FContent := Value;
end;

procedure TWebResponseMock.SetDateVariable(Index: Integer; const Value: TDateTime);
begin
  inherited;

end;

procedure TWebResponseMock.SetIntegerVariable(Index: Integer; Value: TIntegerVariable);
begin
  FIntegerVariable.AddOrSetValue(Index, Value);
end;

procedure TWebResponseMock.SetLogMessage(const Value: String);
begin
  inherited;

end;

procedure TWebResponseMock.SetStatusCode(Value: Integer);
begin
  FStatusCode := Value;
end;

procedure TWebResponseMock.SetStringVariable(Index: Integer; const Value: String);
begin
  FStringVariables.AddOrSetValue(Index, Value);
end;

end.

