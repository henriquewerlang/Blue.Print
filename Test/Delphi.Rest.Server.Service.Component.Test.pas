unit Delphi.Rest.Server.Service.Component.Test;

interface

uses System.SysUtils, System.Classes, System.Rtti, Web.HTTPApp, DUnitX.TestFramework, Delphi.Rest.Server.Service.Component, Delphi.Rest.Service.Container;

type
  [TestFixture]
  TRestServerServiceTest = class(TComponent)
  private
    function CreateRestService(Request: TWebRequest; Response: TWebResponse; Container: IServiceContainer = nil): IWebAppServices;
  public
    [Test]
    procedure WhenTheRequestIsTheRootURLMustReturnHandledToFalse;
    [Test]
    procedure WhenFindTheClassToRespondTheRequestMustReturnHandledToTrue;
    [Test]
    procedure IfTheRequestDontHaveTheProcedureParamMustFillTheStatusCodigoWith404;
    [Test]
    procedure IfDontFindTheProcedureOfRequestMustReturStatusCodeWith404;
    [Test]
    procedure IfNotFoundTheServiceMustReturnHandledToFalse;
    [Test]
    procedure WhenTheRequestIsCorrectMustCallTheProcedureRequested;
    [Test]
    procedure WhenTheProcedureHaveParamMustCallWithTheParamOfTheRequest;
    [TestCase('ClassRef', 'ProcClassRef')]
    [TestCase('Method', 'ProcMethod')]
    [TestCase('Interface', 'ProcInterface')]
    [TestCase('Pointer', 'ProcPointer')]
    [TestCase('Procedure', 'ProcProcedure')]
    [TestCase('Variant', 'ProcVariant')]
    procedure WhenTheTypeIsInvalidMustRaiseAnError(ProcedureName: String);
    [TestCase('Array', 'ProcArray;[''abc'', ''zzz'']', ';')]
    [TestCase('Char', 'ProcChar,''S''')]
    [TestCase('Class', 'ProcClass,{"Value": 1234}')]
    [TestCase('Enum', 'ProcEnum,Enum3')]
    [TestCase('Float', 'ProcFloat,123.456')]
    [TestCase('Int64', 'ProcInt64,123456789012')]
    [TestCase('Integer', 'ProcInteger,1234')]
    [TestCase('LString', 'ProcLString,''abcd''')]
    [TestCase('Set', 'ProcSet;[Enum1, Enum3,Enum4]', ';')]
    [TestCase('String', 'ProcString,''abcd''')]
    [TestCase('UString', 'ProcUString,''abcd''')]
    [TestCase('WChar', 'ProcWChar,''W''')]
    [TestCase('WString', 'ProcWString,''abcd''')]
    procedure ConvertingParamsAsExpected(ProcedureName, Value: String);
    [TestCase('More then', '123/123/123')]
    [TestCase('Less then', '')]
    procedure WhenTheAmountOfRequestParametersIsDiferrentFromTheAmoutOfProcedureParametersMustReturnBadRequest(Params: String);
    [Test]
    procedure WhenTheRequestExecutionWasSucessfullyMustReturnTheJSONResult;
    [Test]
    procedure WhenTheRequestIsForAProcedureCantRaiseErrorOfSerialization;
    [Test]
    procedure WhenTheRequestCallAFunctionAndTheReturnIsAClassMustReturnTheJSONAsSpected;
  end;

  {$RTTI EXPLICIT METHODS([vcProtected, vcPublic])}
  TWebRequestMock = class(TWebRequest)
  protected
    function GetRawContent: TBytes; override;
    function GetStringVariable(Index: Integer): String; override;
    function GetDateVariable(Index: Integer): TDateTime; override;
    function GetIntegerVariable(Index: Integer): Integer; override;
  public
    constructor Create;

    function ReadClient(var Buffer; Count: Integer): Integer; override;
    function ReadString(Count: Integer): String; override;
    function TranslateURI(const URI: String): String; override;
    function WriteClient(var Buffer; Count: Integer): Integer; override;
    function WriteString(const AString: String): Boolean; override;
    function WriteHeaders(StatusCode: Integer; const ReasonString, Headers: String): Boolean; override;
    function GetFieldByName(const Name: String): String; override;
  end;

  TWebResponseMock = class(TWebResponse)
  private
    FStatusCode: Integer;
    FContent: String;
  protected
    function GetContent: String; override;
    function GetDateVariable(Index: Integer): TDateTime; override;
    function GetIntegerVariable(Index: Integer): Integer; override;
    function GetLogMessage: String; override;
    function GetStatusCode: Integer; override;
    function GetStringVariable(Index: Integer): String; override;

    procedure SetContent(const Value: String); override;
    procedure SetDateVariable(Index: Integer; const Value: TDateTime); override;
    procedure SetIntegerVariable(Index: Integer; Value: Integer); override;
    procedure SetLogMessage(const Value: String); override;
    procedure SetStatusCode(Value: Integer); override;
    procedure SetStringVariable(Index: Integer; const Value: String); override;
  public
    procedure SendRedirect(const URI: String); override;
    procedure SendResponse; override;
    procedure SendStream(AStream: TStream); override;
  end;

  TMyEnumerator = (Enum1, Enum2, Enum3, Enum4);
  TMyEnumeratorSet = set of TMyEnumerator;

  TMyClass = class
  private
    FValue: Integer;
  published
    property Value: Integer read FValue write FValue;
  end;

  IService = interface
    ['{FD524CA4-55CF-4005-B47A-48B220718AA0}']
    function FuncClass: TMyClass;
    function FuncInteger: Integer;

    procedure Proc;
    procedure ProcArray(Value: TArray<String>);
    procedure ProcChar(Value: AnsiChar);
    procedure ProcClass(&Class: TMyClass);
    procedure ProcClassRef(&Class: TClass);
    procedure ProcEnum(Value: TMyEnumerator);
    procedure ProcFloat(Value: Currency);
    procedure ProcInt64(Value: Int64);
    procedure ProcInteger(Value: Integer);
    procedure ProcInterface(&Interface: IInterface);
    procedure ProcLString(Value: AnsiString);
    procedure ProcMethod(Method: TNotifyEvent);
    procedure ProcParam(Param: Integer);
    procedure ProcPointer(P: Pointer);
    procedure ProcProcedure(Proc: TProc);
    procedure ProcSet(Value: TMyEnumeratorSet);
    procedure ProcString(Value: ShortString);
    procedure ProcUString(Value: UnicodeString);
    procedure ProcVariant(V: Variant);
    procedure ProcWChar(Value: Char);
    procedure ProcWString(Value: WideString);
  end;

  TService = class(TInterfacedObject, IService)
  private
    FMyClass: TMyClass;

    function FuncClass: TMyClass;
    function FuncInteger: Integer;

    procedure Proc;
    procedure ProcArray(Value: TArray<String>);
    procedure ProcChar(Value: AnsiChar);
    procedure ProcClass(&Class: TMyClass);
    procedure ProcClassRef(&Class: TClass);
    procedure ProcEnum(Value: TMyEnumerator);
    procedure ProcFloat(Value: Currency);
    procedure ProcInt64(Value: Int64);
    procedure ProcInteger(Value: Integer);
    procedure ProcInterface(&Interface: IInterface);
    procedure ProcLString(Value: AnsiString);
    procedure ProcMethod(Method: TNotifyEvent);
    procedure ProcParam(Param: Integer);
    procedure ProcPointer(P: Pointer);
    procedure ProcProcedure(Proc: TProc);
    procedure ProcSet(Value: TMyEnumeratorSet);
    procedure ProcString(Value: ShortString);
    procedure ProcUString(Value: UnicodeString);
    procedure ProcVariant(V: Variant);
    procedure ProcWChar(Value: Char);
    procedure ProcWString(Value: WideString);
  public
    ProcedureCalled: String;

    destructor Destroy; override;
  end;

  TServiceContainer = class(TInterfacedObject, IServiceContainer)
  private
    FInstance: IService;
    FReturnValue: Boolean;

    function GetService(const Name: String; out Info: TRttiType; out Instance: TValue): Boolean;
  public
    constructor Create(ReturnValue: Boolean); overload;
    constructor Create(const Instance: IService); overload;
  end;

implementation

uses Winapi.WinInet, Delphi.Mock;

{ TRestServerServiceTest }

procedure TRestServerServiceTest.ConvertingParamsAsExpected(ProcedureName, Value: String);
begin
  var Request := TMock.CreateClass<TWebRequestMock>;
  var Response := TWebResponseMock.Create(Request.Instance);
  var Service := TService.Create;
  var ServiceI: IService := Service;

  var Container := TServiceContainer.Create(ServiceI);

  Request.Setup.WillReturn(Format('/IService/%s/%s', [ProcedureName, Value])).When.GetStringVariable(It.IsAny<Integer>);

  var Rest := CreateRestService(Request.Instance, Response, Container);

  Assert.WillNotRaise(
    procedure
    begin
      Rest.HandleRequest;
    end);

  Request.Free;

  Response.Free;
end;

function TRestServerServiceTest.CreateRestService(Request: TWebRequest; Response: TWebResponse; Container: IServiceContainer): IWebAppServices;
begin
  var Rest := TRestServerService.Create(Self);
  Rest.ServiceContainer := Container;
  Result := Rest;

  Result.InitContext(nil, Request, Response);
end;

procedure TRestServerServiceTest.IfDontFindTheProcedureOfRequestMustReturStatusCodeWith404;
begin
  var Container := TServiceContainer.Create(TService.Create);
  var Request := TMock.CreateClass<TWebRequestMock>;
  var Response := TWebResponseMock.Create(Request.Instance);

  Request.Setup.WillReturn('/IService/AnyProcudure').When.GetStringVariable(It.IsAny<Integer>);

  var Rest := CreateRestService(Request.Instance, Response, Container);

  Rest.HandleRequest;

  Assert.AreEqual(HTTP_STATUS_NOT_FOUND, Response.StatusCode);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.IfNotFoundTheServiceMustReturnHandledToFalse;
begin
  var Container := TServiceContainer.Create(False);
  var Request := TMock.CreateClass<TWebRequestMock>;
  var Response := TWebResponseMock.Create(Request.Instance);

  Request.Setup.WillReturn('/IAnotherService/Procedure').When.GetStringVariable(It.IsAny<Integer>);

  var Rest := CreateRestService(Request.Instance, Response, Container);

  Assert.IsFalse(Rest.HandleRequest);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.IfTheRequestDontHaveTheProcedureParamMustFillTheStatusCodigoWith404;
begin
  var Container := TServiceContainer.Create(True);
  var Request := TMock.CreateClass<TWebRequestMock>;
  var Response := TWebResponseMock.Create(Request.Instance);

  Request.Setup.WillReturn('/IService').When.GetStringVariable(It.IsAny<Integer>);

  var Rest := CreateRestService(Request.Instance, Response, Container);

  Rest.HandleRequest;

  Assert.AreEqual(HTTP_STATUS_NOT_FOUND, Response.StatusCode);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenFindTheClassToRespondTheRequestMustReturnHandledToTrue;
begin
  var Container := TServiceContainer.Create(True);
  var Request := TMock.CreateClass<TWebRequestMock>;
  var Response := TWebResponseMock.Create(Request.Instance);

  Request.Setup.WillReturn('/IService').When.GetStringVariable(It.IsAny<Integer>);

  var Rest := CreateRestService(Request.Instance, Response, Container);

  Assert.IsTrue(Rest.HandleRequest);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenTheAmountOfRequestParametersIsDiferrentFromTheAmoutOfProcedureParametersMustReturnBadRequest(Params: String);
begin
  var Container := TServiceContainer.Create(TService.Create);
  var Request := TMock.CreateClass<TWebRequestMock>;
  var Response := TWebResponseMock.Create(Request.Instance);

  Request.Setup.WillReturn('/IService/ProcInteger/' + Params).When.GetStringVariable(It.IsAny<Integer>);

  var Rest := CreateRestService(Request.Instance, Response, Container);

  Rest.HandleRequest;

  Assert.AreEqual(HTTP_STATUS_BAD_REQUEST, Response.StatusCode);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenTheProcedureHaveParamMustCallWithTheParamOfTheRequest;
begin
  var Request := TMock.CreateClass<TWebRequestMock>;
  var Response := TWebResponseMock.Create(Request.Instance);
  var Service := TService.Create;
  var ServiceI: IService := Service;

  var Container := TServiceContainer.Create(ServiceI);

  Request.Setup.WillReturn('/IService/ProcParam/123').When.GetStringVariable(It.IsAny<Integer>);

  var Rest := CreateRestService(Request.Instance, Response, Container);

  Rest.HandleRequest;

  Assert.AreEqual('ProcParam=123', Service.ProcedureCalled);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenTheRequestCallAFunctionAndTheReturnIsAClassMustReturnTheJSONAsSpected;
begin
  var Container := TServiceContainer.Create(TService.Create);
  var Request := TMock.CreateClass<TWebRequestMock>;
  var Response := TWebResponseMock.Create(Request.Instance);

  Request.Setup.WillReturn('/IService/FuncClass').When.GetStringVariable(It.IsAny<Integer>);

  var Rest := CreateRestService(Request.Instance, Response, Container);

  Rest.HandleRequest;

  Assert.AreEqual('{"Value":5555}', Response.Content);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenTheRequestExecutionWasSucessfullyMustReturnTheJSONResult;
begin
  var Container := TServiceContainer.Create(TService.Create);
  var Request := TMock.CreateClass<TWebRequestMock>;
  var Response := TWebResponseMock.Create(Request.Instance);

  Request.Setup.WillReturn('/IService/FuncInteger').When.GetStringVariable(It.IsAny<Integer>);

  var Rest := CreateRestService(Request.Instance, Response, Container);

  Rest.HandleRequest;

  Assert.AreEqual('123456', Response.Content);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenTheRequestIsCorrectMustCallTheProcedureRequested;
begin
  var Request := TMock.CreateClass<TWebRequestMock>;
  var Response := TWebResponseMock.Create(Request.Instance);
  var Service := TService.Create;
  var ServiceI: IService := Service;

  var Container := TServiceContainer.Create(ServiceI);

  Request.Setup.WillReturn('/IService/Proc').When.GetStringVariable(It.IsAny<Integer>);

  var Rest := CreateRestService(Request.Instance, Response, Container);

  Rest.HandleRequest;

  Assert.AreEqual('Proc', Service.ProcedureCalled);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenTheRequestIsForAProcedureCantRaiseErrorOfSerialization;
begin
  var Container := TServiceContainer.Create(TService.Create);
  var Request := TMock.CreateClass<TWebRequestMock>;
  var Response := TWebResponseMock.Create(Request.Instance);

  Request.Setup.WillReturn('/IService/ProcInteger/1234').When.GetStringVariable(It.IsAny<Integer>);

  var Rest := CreateRestService(Request.Instance, Response, Container);

  Assert.WillNotRaise(
    procedure
    begin
      Rest.HandleRequest;
    end);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenTheRequestIsTheRootURLMustReturnHandledToFalse;
begin
  var Request := TMock.CreateClass<TWebRequestMock>;
  var Response := TWebResponseMock.Create(Request.Instance);

  Request.Setup.WillReturn('/').When.GetStringVariable(It.IsAny<Integer>);

  var Rest := CreateRestService(Request.Instance, Response);

  Assert.IsFalse(Rest.HandleRequest);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenTheTypeIsInvalidMustRaiseAnError(ProcedureName: String);
begin
  var Request := TMock.CreateClass<TWebRequestMock>;
  var Response := TWebResponseMock.Create(Request.Instance);
  var Service := TService.Create;
  var ServiceI: IService := Service;

  var Container := TServiceContainer.Create(ServiceI);

  Request.Setup.WillReturn(Format('/IService/%s/123', [ProcedureName])).When.GetStringVariable(It.IsAny<Integer>);

  var Rest := CreateRestService(Request.Instance, Response, Container);

  Assert.WillRaise(
    procedure
    begin
      Rest.HandleRequest;
    end, EInvalidParameterType);

  Request.Free;

  Response.Free;
end;

{ TWebRequestMock }

constructor TWebRequestMock.Create;
begin

end;

function TWebRequestMock.GetDateVariable(Index: Integer): TDateTime;
begin
  Result := 0;
end;

function TWebRequestMock.GetFieldByName(const Name: String): String;
begin
  Result := EmptyStr;
end;

function TWebRequestMock.GetIntegerVariable(Index: Integer): Integer;
begin
  Result := 0;
end;

function TWebRequestMock.GetRawContent: TBytes;
begin
  Result := nil;
end;

function TWebRequestMock.GetStringVariable(Index: Integer): String;
begin
  Result := EmptyStr;
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

function TWebResponseMock.GetContent: String;
begin
  Result := FContent;
end;

function TWebResponseMock.GetDateVariable(Index: Integer): TDateTime;
begin
  Result := 0;
end;

function TWebResponseMock.GetIntegerVariable(Index: Integer): Integer;
begin
  Result := 0;
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

end;

procedure TWebResponseMock.SendRedirect(const URI: String);
begin
  inherited;

end;

procedure TWebResponseMock.SendResponse;
begin
  inherited;

end;

procedure TWebResponseMock.SendStream(AStream: TStream);
begin
  inherited;

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

procedure TWebResponseMock.SetIntegerVariable(Index, Value: Integer);
begin
  inherited;

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
  inherited;

end;

{ TServiceContainer }

constructor TServiceContainer.Create(ReturnValue: Boolean);
begin
  FReturnValue := ReturnValue;
end;

constructor TServiceContainer.Create(const Instance: IService);
begin
  Create(True);

  FInstance := Instance;
end;

function TServiceContainer.GetService(const Name: String; out Info: TRttiType; out Instance: TValue): Boolean;
begin
  Instance := TValue.From(FInstance);
  Result := FReturnValue;

  if Result and Assigned(FInstance) then
  begin
    var Context := TRttiContext.Create;
    Info := Context.GetType(TypeInfo(IService));
  end;
end;

{ TService }

destructor TService.Destroy;
begin
  FMyClass.Free;

  inherited;
end;

function TService.FuncClass: TMyClass;
begin
  FMyClass := TMyClass.Create;
  FMyClass.Value := 5555;
  Result := FMyClass;
end;

function TService.FuncInteger: Integer;
begin
  Result := 123456;
end;

procedure TService.Proc;
begin
  ProcedureCalled := 'Proc';
end;

procedure TService.ProcArray(Value: TArray<String>);
begin
  if (Length(Value) = 0) or (Value[0] <> 'abc') or (Value[1] <> 'zzz') then
    raise Exception.Create('Value invalid');
end;

procedure TService.ProcChar(Value: AnsiChar);
begin
  if Value <> 'S' then
    raise Exception.Create('Value invalid');
end;

procedure TService.ProcClass(&Class: TMyClass);
begin
  if not Assigned(&Class) or (&Class.Value <> 1234) then
    raise Exception.Create('Value invalid');

  &Class.Free;
end;

procedure TService.ProcClassRef(&Class: TClass);
begin

end;

procedure TService.ProcEnum(Value: TMyEnumerator);
begin
  if Value <> Enum3 then
    raise Exception.Create('Value invalid');
end;

procedure TService.ProcFloat(Value: Currency);
begin
  if Value <> 123.456 then
    raise Exception.Create('Value invalid');
end;

procedure TService.ProcInt64(Value: Int64);
begin
  if Value <> 123456789012 then
    raise Exception.Create('Value invalid');
end;

procedure TService.ProcInteger(Value: Integer);
begin
  if Value <> 1234 then
    raise Exception.Create('Value invalid');
end;

procedure TService.ProcInterface(&Interface: IInterface);
begin

end;

procedure TService.ProcLString(Value: AnsiString);
begin
  if Value <> 'abcd' then
    raise Exception.Create('Value invalid');
end;

procedure TService.ProcMethod(Method: TNotifyEvent);
begin

end;

procedure TService.ProcParam(Param: Integer);
begin
  ProcedureCalled := Format('%s=%d', ['ProcParam', Param]);
end;

procedure TService.ProcPointer(P: Pointer);
begin

end;

procedure TService.ProcProcedure(Proc: TProc);
begin

end;

procedure TService.ProcSet(Value: TMyEnumeratorSet);
begin
  if Value <> [Enum1,Enum3,Enum4] then
    raise Exception.Create('Value invalid');
end;

procedure TService.ProcString(Value: ShortString);
begin
  if Value <> 'abcd' then
    raise Exception.Create('Value invalid');
end;

procedure TService.ProcUString(Value: UnicodeString);
begin
  if Value <> 'abcd' then
    raise Exception.Create('Value invalid');
end;

procedure TService.ProcVariant(V: Variant);
begin

end;

procedure TService.ProcWChar(Value: Char);
begin
  if Value <> 'W' then
    raise Exception.Create('Value invalid');
end;

procedure TService.ProcWString(Value: WideString);
begin
  if Value <> 'abcd' then
    raise Exception.Create('Value invalid');
end;

end.

