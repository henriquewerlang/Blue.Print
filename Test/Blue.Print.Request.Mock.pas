unit Blue.Print.Request.Mock;

interface

uses System.Classes, System.SysUtils, Web.HTTPApp, System.Generics.Collections;

type
  TIntegerVariable = {$IF CompilerVersion >= 35.0}Int64{$ELSE}Integer{$ENDIF};

  TWebRequestMock = class(TWebRequest)
  private
    FStringVariables: TDictionary<Integer, String>;
  public
    constructor Create(const Method, URL: String);

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

    procedure UpdateMethodType;
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

const
  CONTENT_LENGTH_INDEX = 16;
  CONTENT_TYPE_INDEX = 15;
  METHOD_INDEX = 0;
  QUERY_INDEX = 3;
  URL_INDEX = 4;

implementation

{ TWebRequestMock }

constructor TWebRequestMock.Create(const Method, URL: String);
begin
  FStringVariables := TDictionary<Integer, String>.Create;

  FStringVariables.Add(METHOD_INDEX, Method);
  FStringVariables.Add(URL_INDEX, URL);

  inherited Create;
end;

destructor TWebRequestMock.Destroy;
begin
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
end;

function TWebRequestMock.GetIntegerVariable(Index: Integer): TIntegerVariable;
begin
  Result := 0;
end;

function TWebRequestMock.GetRawContent: TBytes;
begin
  Result := nil;
end;

function TWebRequestMock.GetStringVariable(Index: Integer): String;
begin
  Result := FStringVariables[Index];
end;

function TWebRequestMock.ReadClient(var Buffer; Count: Integer): Integer;
begin
  Result := 0;
end;

function TWebRequestMock.ReadString(Count: Integer): String;
begin
  Result := EmptyStr;
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

  FRequest := Request;
end;

destructor TWebResponseMock.Destroy;
begin
  FRequest.Free;

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
  Result := FStringVariables[Index];
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
  FIntegerVariable[Index] := Value;
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
  FStringVariables[Index] := Value;
end;

end.

