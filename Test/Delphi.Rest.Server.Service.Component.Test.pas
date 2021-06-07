unit Delphi.Rest.Server.Service.Component.Test;

interface

uses System.SysUtils, System.Classes, System.Rtti, Web.HTTPApp, DUnitX.TestFramework, Delphi.Rest.Server.Service.Component, Delphi.Rest.Types, Delphi.Rest.Service.Container,
  Delphi.Mock, Delphi.Mock.Classes, Delphi.Rest.JSON.Serializer.Intf;

type
  {$RTTI EXPLICIT METHODS([vcProtected, vcPublic])}
  TWebRequestMock = class;

  [TestFixture]
  TRestServerServiceTest = class
  private
    FRestService: TRestServerService;

    function CreateRestService(Request: TWebRequest; Response: TWebResponse; Container: IServiceContainer = nil): IWebAppServices;
    function CreateRequestMock: TMock<TWebRequestMock>;
  public
    [Setup]
    procedure Setup;
    [SetupFixture]
    procedure SetupFixture;
    [TearDown]
    procedure TearDown;
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
    procedure WhenThePathHasMoreThenTwoLevelsMustReturn404;
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
    [TestCase('Enum', 'ProcEnum,2')]
    [TestCase('Float', 'ProcFloat,123.456')]
    [TestCase('Int64', 'ProcInt64,123456789012')]
    [TestCase('Integer', 'ProcInteger,1234')]
    [TestCase('LString', 'ProcLString,''abcd''')]
    [TestCase('Set', 'ProcSet;13', ';')]
    [TestCase('String', 'ProcString,''abcd''')]
    [TestCase('UString', 'ProcUString,''abcd''')]
    [TestCase('WChar', 'ProcWChar,''W''')]
    [TestCase('WString', 'ProcWString,''abcd''')]
    procedure MustCallTheProcedureWithTheParamValuePassed(ProcedureName, Value: String);
    [TestCase('Array', 'ProcArray;[''abc'', ''zzz'']', ';')]
    [TestCase('Char', 'ProcChar,''S''')]
    [TestCase('Class', 'ProcClass,{"Value": 1234}')]
    [TestCase('Enum', 'ProcEnum,2')]
    [TestCase('Float', 'ProcFloat,123.456')]
    [TestCase('Int64', 'ProcInt64,123456789012')]
    [TestCase('Integer', 'ProcInteger,1234')]
    [TestCase('LString', 'ProcLString,''abcd''')]
    [TestCase('Set', 'ProcSet;13', ';')]
    [TestCase('String', 'ProcString,''abcd''')]
    [TestCase('UString', 'ProcUString,''abcd''')]
    [TestCase('WChar', 'ProcWChar,''W''')]
    [TestCase('WString', 'ProcWString,''abcd''')]
    procedure ConvertingParamsAsExpected(ProcedureName, Value: String);
    [TestCase('More then', 'Param1=123&Param2=123&Param3=123')]
    [TestCase('Less then', '')]
    procedure WhenTheAmountOfRequestParametersIsDiferrentFromTheAmoutOfProcedureParametersMustReturnBadRequest(Params: String);
    [Test]
    procedure WhenTheRequestExecutionWasSucessfullyMustReturnTheJSONResult;
    [Test]
    procedure WhenTheRequestIsForAProcedureCantRaiseErrorOfSerialization;
    [Test]
    procedure WhenTheRequestCallAFunctionAndTheReturnIsAClassMustReturnTheJSONAsSpected;
    [Test]
    procedure WhenCalledTheGetExceptionHandlerMustReturnTheExceptionHandler;
    [Test]
    procedure WhenAnExceptionIsHandledMustReturnTrueInTheHandleParam;
    [Test]
    procedure OnceTheExceptionIsHandledTheStatusCodeMustBe500;
    [Test]
    procedure TheExceptionMessageMustBeInTheContentOfTheResponse;
    [Test]
    procedure AfterHandleTheExceptionMustSendTheResponseForTheClient;
    [Test]
    procedure WhenTheRequestIsAFileTheRequestMustReturnFalse;
    [Test]
    procedure WhenTheRequestExecuteAsExpectedTheStatusCode200;
    [Test]
    procedure WhenTheRequestedFunctionAsAReturnMustFillTheContentTypeWithApplicationJSON;
    [Test]
    procedure WhenTheProcedureOfTheRequestIsMarkedWithParamInBodyMustLoadTheParamsValuesFromBody;
    [TestCase('DELETE', 'DELETE,True')]
    [TestCase('GET', 'GET,True')]
    [TestCase('PATCH', 'PATCH,False')]
    [TestCase('POST', 'POST,False')]
    [TestCase('PUT', 'PUT,False')]
    procedure WhenTheContractHasntAnyAttributeOfParamTypeMustLoadTheParamsByProcedureType(MethodType: String; ParamInURL: Boolean);
  end;

  TWebRequestMock = class(TWebRequest)
  protected
    function GetDateVariable(Index: Integer): TDateTime; override;
    function GetIntegerVariable(Index: Integer): Integer; override;
    function GetRawContent: TBytes; override;
    function GetStringVariable(Index: Integer): String; override;
  public
    constructor Create;

    function GetFieldByName(const Name: String): String; override;
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
    FStatusCode: Integer;
    FContent: String;
    FSent: Boolean;
    FIntegerVariable: array[0..200] of Integer;
    FStringVariable: array[0..200] of String;
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
    function Sent: Boolean; override;

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
    function ProcedureCalled: String;

    procedure Proc;
    procedure ProcArray(Value: TArray<String>);
    procedure ProcChar(Value: AnsiChar);
    procedure ProcClass(Value: TMyClass);
    procedure ProcClassRef(Value: TClass);
    procedure ProcEnum(Value: TMyEnumerator);
    procedure ProcFloat(Value: Currency);
    procedure ProcInt64(Value: Int64);
    procedure ProcInteger(Value: Integer);
    procedure ProcInterface(Value: IInterface);
    procedure ProcLString(Value: AnsiString);
    procedure ProcMethod(Value: TNotifyEvent);
    procedure ProcParam(Value: Integer);
    procedure ProcParamString(Value: String);
    procedure ProcPointer(Value: Pointer);
    procedure ProcProcedure(Value: TProc);
    procedure ProcSet(Value: TMyEnumeratorSet);
    procedure ProcString(Value: ShortString);
    procedure ProcUString(Value: UnicodeString);
    procedure ProcVariant(Value: Variant);
    procedure ProcWChar(Value: Char);
    procedure ProcWString(Value: WideString);
    [ParamInBody]
    procedure ProcedureWithParamsInBody(Param1: String; Param2: Integer);
    procedure ProcedureWithOutAttribute(Param1: String; Param2: Integer);
  end;

  TService = class(TInterfacedObject, IService)
  private
    FMyClass: TMyClass;
    FProcedureCalled: String;

    function FuncClass: TMyClass;
    function FuncInteger: Integer;
    function ProcedureCalled: String;

    procedure Proc;
    procedure ProcArray(Value: TArray<String>);
    procedure ProcChar(Value: AnsiChar);
    procedure ProcClass(Value: TMyClass);
    procedure ProcClassRef(Value: TClass);
    procedure ProcEnum(Value: TMyEnumerator);
    procedure ProcFloat(Value: Currency);
    procedure ProcInt64(Value: Int64);
    procedure ProcInteger(Value: Integer);
    procedure ProcInterface(Value: IInterface);
    procedure ProcLString(Value: AnsiString);
    procedure ProcMethod(Value: TNotifyEvent);
    procedure ProcParam(Value: Integer);
    procedure ProcParamString(Param: String);
    procedure ProcPointer(Value: Pointer);
    procedure ProcProcedure(Value: TProc);
    procedure ProcSet(Value: TMyEnumeratorSet);
    procedure ProcString(Value: ShortString);
    procedure ProcUString(Value: UnicodeString);
    procedure ProcVariant(Value: Variant);
    procedure ProcWChar(Value: Char);
    procedure ProcWString(Value: WideString);
    procedure ProcedureWithParamsInBody(Param1: String; Param2: Integer);
    procedure ProcedureWithOutAttribute(Param1: String; Param2: Integer);
  public
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

uses System.NetEncoding, Winapi.WinInet, REST.Types, Delphi.Rest.JSON.Serializer;

const
  CONTENT_LENGTH_INDEX = 16;
  CONTENT_TYPE_INDEX = 15;
  METHOD_INDEX = 0;
  QUERY_INDEX = 3;
  URL_INDEX = 2;

{ TRestServerServiceTest }

procedure TRestServerServiceTest.AfterHandleTheExceptionMustSendTheResponseForTheClient;
begin
  var Request := CreateRequestMock;
  var Response := TWebResponseMock.Create(Request.Instance);
  var Handled := False;
  var Handler := CreateRestService(Request.Instance, Response, nil) as IWebExceptionHandler;
  var MyException := Exception.Create('Error');

  Handler.HandleException(MyException, Handled);

  Assert.IsTrue(Response.Sent);

  MyException.Free;

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.ConvertingParamsAsExpected(ProcedureName, Value: String);
begin
  var Request := CreateRequestMock;
  var Response := TWebResponseMock.Create(Request.Instance);
  var Service: IService := TService.Create;

  var Container := TServiceContainer.Create(Service) as IServiceContainer;

  Request.Setup.WillReturn(Format('/IService/%s', [ProcedureName])).When.GetStringVariable(It.IsEqualTo(URL_INDEX));

  Request.Setup.WillReturn('Value=' + Value).When.GetStringVariable(It.IsEqualTo(QUERY_INDEX));

  var Rest := CreateRestService(Request.Instance, Response, Container);

  Assert.WillNotRaise(
    procedure
    begin
      Rest.HandleRequest;
    end);

  Request.Free;

  Response.Free;
end;

function TRestServerServiceTest.CreateRequestMock: TMock<TWebRequestMock>;
begin
  Result := TMock.CreateClass<TWebRequestMock>;

  Result.Setup.WillReturn('GET').When.GetStringVariable(It.IsEqualTo(METHOD_INDEX));

  Result.Instance.UpdateMethodType;
end;

function TRestServerServiceTest.CreateRestService(Request: TWebRequest; Response: TWebResponse; Container: IServiceContainer): IWebAppServices;
begin
  FRestService.ServiceContainer := Container;
  Result := FRestService;

  Result.InitContext(nil, Request, Response);
end;

procedure TRestServerServiceTest.IfDontFindTheProcedureOfRequestMustReturStatusCodeWith404;
begin
  var Container := TServiceContainer.Create(TService.Create);
  var Request := CreateRequestMock;
  var Response := TWebResponseMock.Create(Request.Instance);

  Request.Setup.WillReturn('/IService/AnyProcudure').When.GetStringVariable(It.IsEqualTo(URL_INDEX));

  var Rest := CreateRestService(Request.Instance, Response, Container);

  Rest.HandleRequest;

  Assert.AreEqual(HTTP_STATUS_NOT_FOUND, Response.StatusCode);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.IfNotFoundTheServiceMustReturnHandledToFalse;
begin
  var Container := TServiceContainer.Create(False);
  var Request := CreateRequestMock;
  var Response := TWebResponseMock.Create(Request.Instance);

  Request.Setup.WillReturn('/IAnotherService/Procedure').When.GetStringVariable(It.IsEqualTo(URL_INDEX));

  var Rest := CreateRestService(Request.Instance, Response, Container);

  Assert.IsFalse(Rest.HandleRequest);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.IfTheRequestDontHaveTheProcedureParamMustFillTheStatusCodigoWith404;
begin
  var Container := TServiceContainer.Create(True);
  var Request := CreateRequestMock;
  var Response := TWebResponseMock.Create(Request.Instance);

  Request.Setup.WillReturn('/IService').When.GetStringVariable(It.IsEqualTo(URL_INDEX));

  var Rest := CreateRestService(Request.Instance, Response, Container);

  Rest.HandleRequest;

  Assert.AreEqual(HTTP_STATUS_NOT_FOUND, Response.StatusCode);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.MustCallTheProcedureWithTheParamValuePassed(ProcedureName, Value: String);
begin
  var Request := CreateRequestMock;
  var Response := TWebResponseMock.Create(Request.Instance);
  var Service: IService := TService.Create;

  var Container := TServiceContainer.Create(Service) as IServiceContainer;

  Request.Setup.WillReturn(Format('/IService/%s', [ProcedureName])).When.GetStringVariable(It.IsEqualTo(URL_INDEX));

  Request.Setup.WillReturn('Value=' + TNetEncoding.URL.Encode(Value)).When.GetStringVariable(It.IsEqualTo(QUERY_INDEX));

  var Rest := CreateRestService(Request.Instance, Response, Container);

  Rest.HandleRequest;

  Assert.AreEqual(Format('%s=%s', [ProcedureName, Value]), Service.ProcedureCalled);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.OnceTheExceptionIsHandledTheStatusCodeMustBe500;
begin
  var Request := CreateRequestMock;
  var Response := TWebResponseMock.Create(Request.Instance);
  var Handled := False;
  var Handler := CreateRestService(Request.Instance, Response, nil) as IWebExceptionHandler;
  var MyException := Exception.Create('Error');

  Handler.HandleException(MyException, Handled);

  Assert.AreEqual(500, Response.StatusCode);

  MyException.Free;

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.Setup;
begin
  FRestService := TRestServerService.Create(nil);
end;

procedure TRestServerServiceTest.SetupFixture;
begin
  CreateRequestMock.Free;

  var Serializer: IRestJsonSerializer := TRestJsonSerializer.Create;

  Serializer.Serialize('abc');

  Serializer.Deserialize('{"Value": 1234}', TypeInfo(TMyClass)).AsObject.Free;
  Serializer.Deserialize('"C"', TypeInfo(Char));
  Serializer.Deserialize('"C"', TypeInfo(AnsiChar));
  Serializer.Deserialize('[''abc'', ''zzz'']', TypeInfo(TArray<String>));
  Serializer.Deserialize('''my string''', TypeInfo(String));
  Serializer.Deserialize('''my string''', TypeInfo(ShortString));
  Serializer.Deserialize('''my string''', TypeInfo(AnsiString));
  Serializer.Deserialize('1', TypeInfo(TMyEnumerator));
  Serializer.Deserialize('1', TypeInfo(TMyEnumeratorSet));
  Serializer.Deserialize('1234', TypeInfo(Integer));
  Serializer.Deserialize('1234', TypeInfo(Int64));
end;

procedure TRestServerServiceTest.TearDown;
begin
  FRestService.Free;
end;

procedure TRestServerServiceTest.TheExceptionMessageMustBeInTheContentOfTheResponse;
begin
  var Request := CreateRequestMock;
  var Response := TWebResponseMock.Create(Request.Instance);
  var Handled := False;
  var Handler := CreateRestService(Request.Instance, Response, nil) as IWebExceptionHandler;
  var MyException := Exception.Create('Error');

  Handler.HandleException(MyException, Handled);

  Assert.AreEqual('Error', Response.Content);

  MyException.Free;

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenAnExceptionIsHandledMustReturnTrueInTheHandleParam;
begin
  var Request := CreateRequestMock;
  var Response := TWebResponseMock.Create(Request.Instance);
  var Handled := False;
  var Handler := CreateRestService(Request.Instance, Response, nil) as IWebExceptionHandler;
  var MyException := Exception.Create('Error');

  Handler.HandleException(MyException, Handled);

  Assert.IsTrue(Handled);

  MyException.Free;

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenCalledTheGetExceptionHandlerMustReturnTheExceptionHandler;
begin
  var Rest := CreateRestService(nil, nil, nil) as IWebAppServices;

  var Handler := Rest.GetExceptionHandler;

  Assert.IsNotNull(Handler);
end;

procedure TRestServerServiceTest.WhenFindTheClassToRespondTheRequestMustReturnHandledToTrue;
begin
  var Container := TServiceContainer.Create(True);
  var Request := CreateRequestMock;
  var Response := TWebResponseMock.Create(Request.Instance);

  Request.Setup.WillReturn('/IService').When.GetStringVariable(It.IsEqualTo(URL_INDEX));

  var Rest := CreateRestService(Request.Instance, Response, Container);

  Assert.IsTrue(Rest.HandleRequest);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenTheAmountOfRequestParametersIsDiferrentFromTheAmoutOfProcedureParametersMustReturnBadRequest(Params: String);
begin
  var Container := TServiceContainer.Create(TService.Create);
  var Request := CreateRequestMock;
  var Response := TWebResponseMock.Create(Request.Instance);

  Request.Setup.WillReturn('/IService/ProcInteger').When.GetStringVariable(It.IsEqualTo(URL_INDEX));

  Request.Setup.WillReturn(Params).When.GetStringVariable(It.IsEqualTo(QUERY_INDEX));

  var Rest := CreateRestService(Request.Instance, Response, Container);

  Rest.HandleRequest;

  Assert.AreEqual(HTTP_STATUS_BAD_REQUEST, Response.StatusCode);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenTheContractHasntAnyAttributeOfParamTypeMustLoadTheParamsByProcedureType(MethodType: String; ParamInURL: Boolean);
begin
  var Params := 'Param1="abcde"&Param2=1234';
  var Request := TMock.CreateClass<TWebRequestMock>;
  var RequestBody := TEncoding.UTF8.GetBytes(Params);
  var Response := TWebResponseMock.Create(Request.Instance);

  Request.Setup.WillReturn('/IService/ProcedureWithOutAttribute').When.GetStringVariable(It.IsEqualTo(URL_INDEX));

  Request.Setup.WillReturn(MethodType).When.GetStringVariable(It.IsEqualTo(METHOD_INDEX));

  Request.Setup.WillReturn(Params).When.GetStringVariable(It.IsEqualTo(QUERY_INDEX));

  Request.Setup.WillReturn(Length(RequestBody)).When.GetIntegerVariable(It.IsEqualTo(CONTENT_LENGTH_INDEX));

  Request.Setup.WillReturn('application/json').When.GetStringVariable(It.IsEqualTo(CONTENT_TYPE_INDEX));

  Request.Setup.WillReturn(TValue.From(RequestBody)).When.GetRawContent;

  if ParamInURL then
    Request.Expect.Once.When.GetStringVariable(It.IsEqualTo(QUERY_INDEX))
  else
    Request.Expect.Once.When.GetRawContent;

  Request.Instance.UpdateMethodType;

  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(TService.Create));

  Rest.HandleRequest;

  Assert.AreEqual(EmptyStr, Request.CheckExpectations);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenThePathHasMoreThenTwoLevelsMustReturn404;
begin
  var Request := CreateRequestMock;
  var Response := TWebResponseMock.Create(Request.Instance);
  var Service := TService.Create;
  var ServiceI: IService := Service;

  var Container := TServiceContainer.Create(ServiceI);

  Request.Setup.WillReturn('/IService/Proc/Proc').When.GetStringVariable(It.IsEqualTo(URL_INDEX));

  var Rest := CreateRestService(Request.Instance, Response, Container);

  Rest.HandleRequest;

  Assert.AreEqual(HTTP_STATUS_NOT_FOUND, Response.StatusCode);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenTheProcedureHaveParamMustCallWithTheParamOfTheRequest;
begin
  var Request := CreateRequestMock;
  var Response := TWebResponseMock.Create(Request.Instance);
  var Service: IService := TService.Create;

  var Container := TServiceContainer.Create(Service) as IServiceContainer;

  Request.Setup.WillReturn('/IService/ProcParam').When.GetStringVariable(It.IsEqualTo(URL_INDEX));

  Request.Setup.WillReturn('Value=123').When.GetStringVariable(It.IsEqualTo(QUERY_INDEX));

  var Rest := CreateRestService(Request.Instance, Response, Container);

  Rest.HandleRequest;

  Assert.AreEqual('ProcParam=123', Service.ProcedureCalled);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenTheProcedureOfTheRequestIsMarkedWithParamInBodyMustLoadTheParamsValuesFromBody;
begin
  var Request := CreateRequestMock;
  var RequestBody := TEncoding.UTF8.GetBytes('Param1="abcde"&Param2=1234');
  var Response := TWebResponseMock.Create(Request.Instance);

  Request.Setup.WillReturn('/IService/ProcedureWithParamsInBody').When.GetStringVariable(It.IsEqualTo(URL_INDEX));

  Request.Setup.WillReturn(EmptyStr).When.GetStringVariable(It.IsEqualTo(QUERY_INDEX));

  Request.Setup.WillReturn(Length(RequestBody)).When.GetIntegerVariable(It.IsEqualTo(CONTENT_LENGTH_INDEX));

  Request.Setup.WillReturn('application/json').When.GetStringVariable(It.IsEqualTo(CONTENT_TYPE_INDEX));

  Request.Setup.WillReturn(TValue.From(RequestBody)).When.GetRawContent;

  Request.Expect.Once.When.GetRawContent;

  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(TService.Create));

  Rest.HandleRequest;

  Assert.AreEqual(EmptyStr, Request.CheckExpectations);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenTheRequestCallAFunctionAndTheReturnIsAClassMustReturnTheJSONAsSpected;
begin
  var Container := TServiceContainer.Create(TService.Create);
  var Request := CreateRequestMock;
  var Response := TWebResponseMock.Create(Request.Instance);

  Request.Setup.WillReturn('/IService/FuncClass').When.GetStringVariable(It.IsEqualTo(URL_INDEX));

  Request.Setup.WillReturn(EmptyStr).When.GetStringVariable(It.IsEqualTo(QUERY_INDEX));

  var Rest := CreateRestService(Request.Instance, Response, Container);

  Rest.HandleRequest;

  Assert.AreEqual('{"Value":5555}', Response.Content);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenTheRequestedFunctionAsAReturnMustFillTheContentTypeWithApplicationJSON;
begin
  var Container := TServiceContainer.Create(TService.Create);
  var Request := CreateRequestMock;
  var Response := TWebResponseMock.Create(Request.Instance);

  Request.Setup.WillReturn('/IService/FuncInteger').When.GetStringVariable(It.IsEqualTo(URL_INDEX));

  Request.Setup.WillReturn(EmptyStr).When.GetStringVariable(It.IsEqualTo(QUERY_INDEX));

  var Rest := CreateRestService(Request.Instance, Response, Container);

  Rest.HandleRequest;

  Assert.AreEqual(CONTENTTYPE_APPLICATION_JSON, Response.ContentType);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenTheRequestExecuteAsExpectedTheStatusCode200;
begin
  var Request := CreateRequestMock;
  var Response := TWebResponseMock.Create(Request.Instance);
  var Service: IService := TService.Create;

  var Container := TServiceContainer.Create(Service) as IServiceContainer;

  Request.Setup.WillReturn('IService/ProcParamString').When.GetStringVariable(It.IsEqualTo(URL_INDEX));

  Request.Setup.WillReturn('Value="Abc"').When.GetStringVariable(It.IsEqualTo(QUERY_INDEX));

  var Rest := CreateRestService(Request.Instance, Response, Container);

  Rest.HandleRequest;

  Assert.AreEqual(200, Response.StatusCode);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenTheRequestExecutionWasSucessfullyMustReturnTheJSONResult;
begin
  var Container := TServiceContainer.Create(TService.Create);
  var Request := CreateRequestMock;
  var Response := TWebResponseMock.Create(Request.Instance);

  Request.Setup.WillReturn('/IService/FuncInteger').When.GetStringVariable(It.IsEqualTo(URL_INDEX));

  Request.Setup.WillReturn(EmptyStr).When.GetStringVariable(It.IsEqualTo(QUERY_INDEX));

  var Rest := CreateRestService(Request.Instance, Response, Container);

  Rest.HandleRequest;

  Assert.AreEqual('123456', Response.Content);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenTheRequestIsAFileTheRequestMustReturnFalse;
begin
  var Container := TServiceContainer.Create(TService.Create);
  var Request := CreateRequestMock;
  var Response := TWebResponseMock.Create(Request.Instance);

  Request.Setup.WillReturn('IService/ProcParamString/File.file').When.GetStringVariable(It.IsEqualTo(URL_INDEX));

  var Rest := CreateRestService(Request.Instance, Response, Container);

  Assert.IsFalse(Rest.HandleRequest);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenTheRequestIsCorrectMustCallTheProcedureRequested;
begin
  var Request := CreateRequestMock;
  var Response := TWebResponseMock.Create(Request.Instance);
  var Service := TService.Create;
  var ServiceI: IService := Service;

  var Container := TServiceContainer.Create(ServiceI);

  Request.Setup.WillReturn('/IService/Proc').When.GetStringVariable(It.IsEqualTo(URL_INDEX));

  Request.Setup.WillReturn(EmptyStr).When.GetStringVariable(It.IsEqualTo(QUERY_INDEX));

  var Rest := CreateRestService(Request.Instance, Response, Container);

  Rest.HandleRequest;

  Assert.AreEqual('Proc', Service.ProcedureCalled);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenTheRequestIsForAProcedureCantRaiseErrorOfSerialization;
begin
  var Container := TServiceContainer.Create(TService.Create);
  var Request := CreateRequestMock;
  var Response := TWebResponseMock.Create(Request.Instance);

  Request.Setup.WillReturn('/IService/ProcInteger?Value=1234').When.GetStringVariable(It.IsEqualTo(URL_INDEX));

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
  var Request := CreateRequestMock;
  var Response := TWebResponseMock.Create(Request.Instance);

  Request.Setup.WillReturn('/').When.GetStringVariable(It.IsEqualTo(URL_INDEX));

  var Rest := CreateRestService(Request.Instance, Response);

  Assert.IsFalse(Rest.HandleRequest);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenTheTypeIsInvalidMustRaiseAnError(ProcedureName: String);
begin
  var Request := CreateRequestMock;
  var Response := TWebResponseMock.Create(Request.Instance);
  var Service: IService := TService.Create;

  var Container := TServiceContainer.Create(Service);

  Request.Setup.WillReturn(Format('/IService/%s', [ProcedureName])).When.GetStringVariable(It.IsEqualTo(URL_INDEX));

  Request.Setup.WillReturn('Value=123').When.GetStringVariable(It.IsEqualTo(QUERY_INDEX));

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
  Result := FStringVariable[Index];
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

procedure TWebResponseMock.SetIntegerVariable(Index, Value: Integer);
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
  FStringVariable[Index] := Value;
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
  FProcedureCalled := 'Proc';
end;

procedure TService.ProcArray(Value: TArray<String>);
begin
  if Length(Value) > 0 then
    FProcedureCalled := Format('ProcArray=[''%s'', ''%s'']', [Value[0], Value[1]]);
end;

procedure TService.ProcChar(Value: AnsiChar);
begin
  FProcedureCalled := Format('ProcChar=''%s''', [Value]);
end;

procedure TService.ProcClass(Value: TMyClass);
begin
  FProcedureCalled := Format('ProcClass={"Value": %d}', [Value.Value]);

  Value.Free;
end;

procedure TService.ProcClassRef(Value: TClass);
begin

end;

function TService.ProcedureCalled: String;
begin
  Result := FProcedureCalled;
end;

procedure TService.ProcedureWithOutAttribute(Param1: String; Param2: Integer);
begin
  FProcedureCalled := Format('ProcedureWithOutAttribute=%s,%d', [Param1, Param2]);
end;

procedure TService.ProcedureWithParamsInBody(Param1: String; Param2: Integer);
begin
  FProcedureCalled := Format('ProcedureWithParamsInBody=%s,%d', [Param1, Param2]);
end;

procedure TService.ProcEnum(Value: TMyEnumerator);
begin
  FProcedureCalled := Format('ProcEnum=%d', [Ord(Value)]);
end;

procedure TService.ProcFloat(Value: Currency);
begin
  FProcedureCalled := Format('ProcFloat=%.3f', [Value], TFormatSettings.Invariant);
end;

procedure TService.ProcInt64(Value: Int64);
begin
  FProcedureCalled := Format('ProcInt64=%d', [Value]);
end;

procedure TService.ProcInteger(Value: Integer);
begin
  FProcedureCalled := Format('ProcInteger=%d', [Value]);
end;

procedure TService.ProcInterface(Value: IInterface);
begin

end;

procedure TService.ProcLString(Value: AnsiString);
begin
  FProcedureCalled := Format('ProcLString=''%s''', [Value]);
end;

procedure TService.ProcMethod(Value: TNotifyEvent);
begin

end;

procedure TService.ProcParam(Value: Integer);
begin
  FProcedureCalled := Format('%s=%d', ['ProcParam', Value]);
end;

procedure TService.ProcParamString(Param: String);
begin

end;

procedure TService.ProcPointer(Value: Pointer);
begin

end;

procedure TService.ProcProcedure(Value: TProc);
begin

end;

procedure TService.ProcSet(Value: TMyEnumeratorSet);
begin
  FProcedureCalled := Format('ProcSet=%d', [PByte(@Value)^]);
end;

procedure TService.ProcString(Value: ShortString);
begin
  FProcedureCalled := Format('ProcString=''%s''', [Value]);
end;

procedure TService.ProcUString(Value: UnicodeString);
begin
  FProcedureCalled := Format('ProcUString=''%s''', [Value]);
end;

procedure TService.ProcVariant(Value: Variant);
begin

end;

procedure TService.ProcWChar(Value: Char);
begin
  FProcedureCalled := Format('ProcWChar=''%s''', [Value]);
end;

procedure TService.ProcWString(Value: WideString);
begin
  FProcedureCalled := Format('ProcWString=''%s''', [Value]);
end;

end.

