unit Blue.Print.Server.Service.Test;

interface

uses System.Classes, System.Rtti, System.TypInfo, System.Generics.Collections, Test.Insight.Framework, Blue.Print.Server.Service, Web.HTTPApp, Blue.Print.Types;

type
  TMyService = class;
  TSerializerMock = class;

  [TestFixture]
  TBluePrintWebAppServiceTest = class
  private
    FBluePrintService: TBluePrintWebAppService;
    FMyService: TMyService;
    FRequest: TWebResponse;
    FSerializer: TSerializerMock;
    FWebAppServices: IWebAppServices;

    function FindService(const ServiceName: String): TValue;

    procedure InitContext(const Request: TWebResponse);
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure WhenTheRequestIsTheRootURLMustReturnHandledToFalse;
    [Test]
    procedure WhenTheRequestIsAFileTheRequestMustReturnFalse;
    [Test]
    procedure WhenTheRequestHasTwoOrMoreParamsTheHandlerMustReturnTrue;
    [Test]
    procedure WhenDontFindTheServiceMustRaiseENotFoundError;
    [Test]
    procedure WhenTheMethodCalledDontExistsMustRaiseENotFoundError;
    [Test]
    procedure IfTheMethodIsFoundMustCallTheProcedure;
    [Test]
    procedure WhenTheRequestIsSuccessfullyExecutedMustReturnTheStatusCode200;
    [Test]
    procedure IfTheMethodCallIsAFunctionMustLoadTheContentWithTheValueReturnedByTheFunction;
    [Test]
    procedure WhenTheRequestHasPathParamsMustLoadThisValuesInTheParamsOfTheProcedureCalled;
    [Test]
    procedure WhenTheRequestHasTooMuchParamsMustRaiseABadRequestError;
    [Test]
    procedure WhenTheRequestDontHaveEnoughParamsMustRaiseABadRequestError;
    [Test]
    procedure WhenTheRequestSendQueryFieldsMustLoadTheParamValueHasExpected;
    [Test]
    procedure IfTheQueryFieldIsRepeatedMustReplaceTheValueAndDontRaiseAnyError;
    [Test]
    procedure IfTheEventOnFindServiceIsntLoadedMustRaiseAnError;
    [Test]
    procedure WhenGetTheExceptionHandlerMustReturnTheCurrentInstanceOfTheWebService;
    [Test]
    procedure WhenAnExceptionIsHandledMustReturnTrueInTheHandleParam;
    [Test]
    procedure OnceTheExceptionIsHandledTheStatusCodeMustBe500;
    [Test]
    procedure TheExceptionMessageMustBeInTheContentOfTheResponse;
    [Test]
    procedure AfterHandleTheExceptionMustSendTheResponseForTheClient;
  end;

  TMyService = class
  private
    FParamsOfProcedureCalled: String;
    FProcedureCalled: String;
  public
    function MyFunc: String;

    procedure MyProc;
    procedure MyProc2(const Param1, Param2: String);

    property ParamsOfProcedureCalled: String read FParamsOfProcedureCalled write FParamsOfProcedureCalled;
    property ProcedureCalled: String read FProcedureCalled write FProcedureCalled;
  end;

  TSerializerMock = class(TInterfacedObject, IBluePrintSerializer)
  private
    FDeserializeValues: TList<TValue>;
    FSerializeValues: TList<TValue>;

    function Deserialize(const Value: TStream; const TypeInfo: PTypeInfo): TValue;

    procedure Serialize(const Value: TValue; const Stream: TStream);
    procedure SetDeserializeValues(const Value: TArray<TValue>);
    procedure SetSerializeValues(const Value: TArray<TValue>);
  public
    constructor Create;

    destructor Destroy; override;

    property DeserializeValues: TArray<TValue> write SetDeserializeValues;
    property SerializeValues: TArray<TValue> write SetSerializeValues;
  end;

implementation

uses System.SysUtils, Blue.Print.Request.Mock;

{ TBluePrintWebAppServiceTest }

procedure TBluePrintWebAppServiceTest.AfterHandleTheExceptionMustSendTheResponseForTheClient;
begin
  var Handled := False;
  var Handler := FBluePrintService as IWebExceptionHandler;
  var MyException := Exception.Create('Error');

  InitContext(TWebResponseMock.Create(TWebRequestMock.Create('GET', EmptyStr)));

  Handler.HandleException(MyException, Handled);

  Assert.IsTrue(FRequest.Sent);

  MyException.Free;
end;

function TBluePrintWebAppServiceTest.FindService(const ServiceName: String): TValue;
begin
  if ServiceName = 'MyService' then
    Result := FMyService
  else
    Result := TValue.Empty;
end;

procedure TBluePrintWebAppServiceTest.IfTheEventOnFindServiceIsntLoadedMustRaiseAnError;
begin
  FBluePrintService.OnFindService := nil;

  InitContext(TWebResponseMock.Create(TWebRequestMock.Create('GET', '/MyService/MyProc')));

  Assert.WillRaise(
    procedure
    begin
      FWebAppServices.HandleRequest;
    end, EFindServiceError);
end;

procedure TBluePrintWebAppServiceTest.IfTheMethodCallIsAFunctionMustLoadTheContentWithTheValueReturnedByTheFunction;
begin
  FSerializer.SerializeValues := ['abc'];

  InitContext(TWebResponseMock.Create(TWebRequestMock.Create('GET', '/MyService/MyFunc')));

  FWebAppServices.HandleRequest;

  var StreamReader := TStreamReader.Create(FRequest.ContentStream);

  Assert.AreEqual('abc', StreamReader.ReadLine);

  StreamReader.Free;
end;

procedure TBluePrintWebAppServiceTest.IfTheMethodIsFoundMustCallTheProcedure;
begin
  InitContext(TWebResponseMock.Create(TWebRequestMock.Create('GET', '/MyService/MyProc')));

  FWebAppServices.HandleRequest;

  Assert.AreEqual('MyProc', FMyService.ProcedureCalled);
end;

procedure TBluePrintWebAppServiceTest.IfTheQueryFieldIsRepeatedMustReplaceTheValueAndDontRaiseAnyError;
begin
  FSerializer.DeserializeValues := ['Value1', 'Value2', 'Value3', 'Value4'];

  InitContext(TWebResponseMock.Create(TWebRequestMock.Create('GET', '/MyService/MyProc2', 'Param1=V&Param2=V&Param2=V&Param2=V')));

  FWebAppServices.HandleRequest;

  Assert.AreEqual('MyProc2', FMyService.ProcedureCalled);
  Assert.AreEqual('Value1,Value4', FMyService.ParamsOfProcedureCalled);
end;

procedure TBluePrintWebAppServiceTest.InitContext(const Request: TWebResponse);
begin
  FRequest := Request;

  FWebAppServices.InitContext(FBluePrintService, FRequest.HTTPRequest, FRequest);
end;

procedure TBluePrintWebAppServiceTest.OnceTheExceptionIsHandledTheStatusCodeMustBe500;
begin
  var Handled := False;
  var Handler := FBluePrintService as IWebExceptionHandler;
  var MyException := Exception.Create('Error');

  InitContext(TWebResponseMock.Create(TWebRequestMock.Create('GET', EmptyStr)));

  Handler.HandleException(MyException, Handled);

  Assert.AreEqual<Integer>(500, FRequest.StatusCode);

  MyException.Free;
end;

procedure TBluePrintWebAppServiceTest.Setup;
begin
  FBluePrintService := TBluePrintWebAppService.Create(nil);
  FBluePrintService.OnFindService := FindService;
  FMyService := TMyService.Create;
  FSerializer := TSerializerMock.Create;
  FWebAppServices := FBluePrintService;

  FBluePrintService.Serializer := FSerializer;
end;

procedure TBluePrintWebAppServiceTest.TearDown;
begin
  FWebAppServices := nil;

  FBluePrintService.Free;

  FMyService.Free;

  FreeAndNil(FRequest);
end;

procedure TBluePrintWebAppServiceTest.TheExceptionMessageMustBeInTheContentOfTheResponse;
begin
  var Handled := False;
  var Handler := FBluePrintService as IWebExceptionHandler;
  var MyException := Exception.Create('Error');

  InitContext(TWebResponseMock.Create(TWebRequestMock.Create('GET', EmptyStr)));

  Handler.HandleException(MyException, Handled);

  Assert.AreEqual('Error', FRequest.Content);

  MyException.Free;
end;

procedure TBluePrintWebAppServiceTest.WhenAnExceptionIsHandledMustReturnTrueInTheHandleParam;
begin
  var Handled := False;
  var Handler := FBluePrintService as IWebExceptionHandler;
  var MyException := Exception.Create('Error');

  InitContext(TWebResponseMock.Create(TWebRequestMock.Create('GET', EmptyStr)));

  Handler.HandleException(MyException, Handled);

  Assert.IsTrue(Handled);

  MyException.Free;
end;

procedure TBluePrintWebAppServiceTest.WhenDontFindTheServiceMustRaiseENotFoundError;
begin
  InitContext(TWebResponseMock.Create(TWebRequestMock.Create('GET', '/NotService/MyProc')));

  Assert.WillRaise(
    procedure
    begin
      FWebAppServices.HandleRequest
    end, EHTTPErrorNotFound);
end;

procedure TBluePrintWebAppServiceTest.WhenGetTheExceptionHandlerMustReturnTheCurrentInstanceOfTheWebService;
begin
  Assert.AreEqual<TObject>(FBluePrintService, FWebAppServices.ExceptionHandler);
end;

procedure TBluePrintWebAppServiceTest.WhenTheMethodCalledDontExistsMustRaiseENotFoundError;
begin
  InitContext(TWebResponseMock.Create(TWebRequestMock.Create('GET', '/MyService/NoProc')));

  Assert.WillRaise(
    procedure
    begin
      FWebAppServices.HandleRequest
    end, EHTTPErrorNotFound);
end;

procedure TBluePrintWebAppServiceTest.WhenTheRequestDontHaveEnoughParamsMustRaiseABadRequestError;
begin
  FSerializer.DeserializeValues := ['Value1'];

  InitContext(TWebResponseMock.Create(TWebRequestMock.Create('GET', '/MyService/MyProc2/Value1')));

  Assert.WillRaise(
    procedure
    begin
      FWebAppServices.HandleRequest;
    end, EHTTPErrorBadRequest);
end;

procedure TBluePrintWebAppServiceTest.WhenTheRequestHasPathParamsMustLoadThisValuesInTheParamsOfTheProcedureCalled;
begin
  FSerializer.DeserializeValues := ['Value1', 'Value2'];

  InitContext(TWebResponseMock.Create(TWebRequestMock.Create('GET', '/MyService/MyProc2/Value1/Value2')));

  FWebAppServices.HandleRequest;

  Assert.AreEqual('MyProc2', FMyService.ProcedureCalled);
  Assert.AreEqual('Value1,Value2', FMyService.ParamsOfProcedureCalled);
end;

procedure TBluePrintWebAppServiceTest.WhenTheRequestHasTooMuchParamsMustRaiseABadRequestError;
begin
  FSerializer.DeserializeValues := ['Value1', 'Value2'];

  InitContext(TWebResponseMock.Create(TWebRequestMock.Create('GET', '/MyService/MyProc2/Value1/Value2/Value3/Value4')));

  Assert.WillRaise(
    procedure
    begin
      FWebAppServices.HandleRequest;
    end, EHTTPErrorBadRequest);
end;

procedure TBluePrintWebAppServiceTest.WhenTheRequestHasTwoOrMoreParamsTheHandlerMustReturnTrue;
begin
  FSerializer.DeserializeValues := ['MyParam', 'MyParam'];

  InitContext(TWebResponseMock.Create(TWebRequestMock.Create('GET', '/MyService/MyProc2/MyParam/MyParam')));

  Assert.IsTrue(FWebAppServices.HandleRequest);
end;

procedure TBluePrintWebAppServiceTest.WhenTheRequestIsAFileTheRequestMustReturnFalse;
begin
  InitContext(TWebResponseMock.Create(TWebRequestMock.Create('GET', '/AFile.file')));

  Assert.IsFalse(FWebAppServices.HandleRequest);
end;

procedure TBluePrintWebAppServiceTest.WhenTheRequestIsSuccessfullyExecutedMustReturnTheStatusCode200;
begin
  InitContext(TWebResponseMock.Create(TWebRequestMock.Create('GET', '/MyService/MyProc')));

  FWebAppServices.HandleRequest;

  Assert.AreEqual<Integer>(200, FRequest.StatusCode);
end;

procedure TBluePrintWebAppServiceTest.WhenTheRequestIsTheRootURLMustReturnHandledToFalse;
begin
  InitContext(TWebResponseMock.Create(TWebRequestMock.Create('GET', '/')));

  Assert.IsFalse(FWebAppServices.HandleRequest);
end;

procedure TBluePrintWebAppServiceTest.WhenTheRequestSendQueryFieldsMustLoadTheParamValueHasExpected;
begin
  FSerializer.DeserializeValues := ['Value1', 'Value2'];

  InitContext(TWebResponseMock.Create(TWebRequestMock.Create('GET', '/MyService/MyProc2', 'Param1=V&Param2=V')));

  FWebAppServices.HandleRequest;

  Assert.AreEqual('MyProc2', FMyService.ProcedureCalled);
  Assert.AreEqual('Value1,Value2', FMyService.ParamsOfProcedureCalled);
end;

{ TMyService }

function TMyService.MyFunc: String;
begin
  FProcedureCalled := 'MyFunc';
  Result := 'abc';
end;

procedure TMyService.MyProc;
begin
  FProcedureCalled := 'MyProc';
end;

procedure TMyService.MyProc2(const Param1, Param2: String);
begin
  FProcedureCalled := 'MyProc2';
  ParamsOfProcedureCalled := Param1 + ',' + Param2;
end;

{ TSerializerMock }

constructor TSerializerMock.Create;
begin
  FDeserializeValues := TList<TValue>.Create;
  FSerializeValues := TList<TValue>.Create;
end;

function TSerializerMock.Deserialize(const Value: TStream; const TypeInfo: PTypeInfo): TValue;
begin
  Result := FDeserializeValues.ExtractAt(0);
end;

destructor TSerializerMock.Destroy;
begin
  FDeserializeValues.Free;

  FSerializeValues.Free;

  inherited;
end;

procedure TSerializerMock.Serialize(const Value: TValue; const Stream: TStream);
begin
  var StreamWriter := TStreamWriter.Create(Stream);

  StreamWriter.Write(FSerializeValues.ExtractAt(0).ToString);

  StreamWriter.Free;
end;

procedure TSerializerMock.SetDeserializeValues(const Value: TArray<TValue>);
begin
  FDeserializeValues.AddRange(Value);
end;

procedure TSerializerMock.SetSerializeValues(const Value: TArray<TValue>);
begin
  FSerializeValues.AddRange(Value);
end;

end.

