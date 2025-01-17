unit Blue.Print.Web.Module.Test;

interface

uses System.Classes, System.Rtti, System.TypInfo, System.Generics.Collections, Test.Insight.Framework, Blue.Print.Web.Module, Web.HTTPApp, Blue.Print.Types;

type
  TMyService = class;
  TSerializerMock = class;

  [TestFixture]
  TBluePrintWebModuleTest = class
  private
    FBluePrintWebModule: TBluePrintWebModule;
    FMyService: TMyService;
    FReponse: TWebResponse;
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
    [Test]
    procedure WhenTryToGetTheGetWebAppServicesMustReturnTheCurrentInstanceOfTheService;
    [Test]
    procedure WhenTheMethodCalledIsAProcedureMustReturnTheStatusCode204;
    [Test]
    procedure WhenHandleAHTTPExceptionCanChangeTheStatusCodeFromTheResponse;
    [Test]
    procedure WhenIsRaisedANotFoundErrorMustLoadTheStatusCodeOfTheException;
    [Test]
    procedure WhenTheProcedureHasMoreTheOneVersionMustCheckTheParamCountToCallTheCorrectProcedure;
    [Test]
    procedure WhenTheRequestHasABodyMustCallTheProcedureWithOneParam;
    [Test]
    procedure WhenTheRequestHasABodyMustLoadTheBodyValueInTheLastParamFromTheMethod;
    [Test]
    procedure WhenReturningARequestMustLoadTheContentTypeFromTheSerializer;
    [Test]
    procedure WhenReturningAStreamInAFunctionCantRaiseAnyError;
    [Test]
    procedure WhenTheReturnIsAnTStreamClassMustLoadTheContentStreamPropertyInTheWebResponse;
    [Test]
    procedure WhenTheReturningStreamIsTheBluePrintStreamMustLoadTheContentValueAsExpected;
  end;

  TMyService = class
  private
    FMyStream: TStream;
    FParamsOfProcedureCalled: String;
    FProcedureCalled: String;
  public
    function MyFunc: String;
    function MyStream: TStream;

    procedure MyProc;
    procedure MyProc2(const Param1, Param2: String);
    procedure SameName; overload;
    procedure SameName(const Param1: String); overload;
    procedure SameName(const Param1, Param2: String); overload;
    procedure SameName(const Param1, Param2, Param3: String); overload;

    property ParamsOfProcedureCalled: String read FParamsOfProcedureCalled write FParamsOfProcedureCalled;
    property ProcedureCalled: String read FProcedureCalled write FProcedureCalled;
  end;

  TSerializerMock = class(TInterfacedObject, IBluePrintSerializer)
  private
    FDeserializeValues: TList<TValue>;
    FSerializeValues: TList<TValue>;

    function Deserialize(const Value: String; const TypeInfo: PTypeInfo): TValue;
    function GetContentType: String;
    function Serialize(const Value: TValue): String;

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

{ TBluePrintWebModuleTest }

procedure TBluePrintWebModuleTest.AfterHandleTheExceptionMustSendTheResponseForTheClient;
begin
  var Handled := False;
  var Handler := FBluePrintWebModule as IWebExceptionHandler;
  var MyException := Exception.Create('Error');

  InitContext(TWebResponseMock.Create(TWebRequestMock.Create('GET', EmptyStr)));

  Handler.HandleException(MyException, Handled);

  Assert.IsTrue(FReponse.Sent);

  MyException.Free;
end;

function TBluePrintWebModuleTest.FindService(const ServiceName: String): TValue;
begin
  if ServiceName = 'MyService' then
    Result := FMyService
  else
    Result := TValue.Empty;
end;

procedure TBluePrintWebModuleTest.IfTheEventOnFindServiceIsntLoadedMustRaiseAnError;
begin
  FBluePrintWebModule.OnFindService := nil;

  InitContext(TWebResponseMock.Create(TWebRequestMock.Create('GET', '/MyService/MyProc')));

  Assert.WillRaise(
    procedure
    begin
      FWebAppServices.HandleRequest;
    end, EFindServiceError);
end;

procedure TBluePrintWebModuleTest.IfTheMethodCallIsAFunctionMustLoadTheContentWithTheValueReturnedByTheFunction;
begin
  FSerializer.SerializeValues := ['abc'];

  InitContext(TWebResponseMock.Create(TWebRequestMock.Create('GET', '/MyService/MyFunc')));

  FWebAppServices.HandleRequest;

  Assert.AreEqual('abc', FReponse.Content);
end;

procedure TBluePrintWebModuleTest.IfTheMethodIsFoundMustCallTheProcedure;
begin
  InitContext(TWebResponseMock.Create(TWebRequestMock.Create('GET', '/MyService/MyProc')));

  FWebAppServices.HandleRequest;

  Assert.AreEqual('MyProc', FMyService.ProcedureCalled);
end;

procedure TBluePrintWebModuleTest.IfTheQueryFieldIsRepeatedMustReplaceTheValueAndDontRaiseAnyError;
begin
  FSerializer.DeserializeValues := ['Value1', 'Value2', 'Value3', 'Value4'];
  var Request := TWebRequestMock.Create('GET', '/MyService/MyProc2');
  Request.QueryFields := 'Param1=V&Param2=V&Param2=V&Param2=V';

  InitContext(TWebResponseMock.Create(Request));

  FWebAppServices.HandleRequest;

  Assert.AreEqual('MyProc2', FMyService.ProcedureCalled);
  Assert.AreEqual('Value1,Value4', FMyService.ParamsOfProcedureCalled);
end;

procedure TBluePrintWebModuleTest.InitContext(const Request: TWebResponse);
begin
  FReponse := Request;

  FWebAppServices.InitContext(FBluePrintWebModule, FReponse.HTTPRequest, FReponse);
end;

procedure TBluePrintWebModuleTest.OnceTheExceptionIsHandledTheStatusCodeMustBe500;
begin
  var Handled := False;
  var Handler := FBluePrintWebModule as IWebExceptionHandler;
  var MyException := Exception.Create('Error');

  InitContext(TWebResponseMock.Create(TWebRequestMock.Create('GET', EmptyStr)));

  Handler.HandleException(MyException, Handled);

  Assert.AreEqual(500, FReponse.StatusCode);

  MyException.Free;
end;

procedure TBluePrintWebModuleTest.Setup;
begin
  FBluePrintWebModule := TBluePrintWebModule.Create(nil);
  FBluePrintWebModule.OnFindService := FindService;
  FMyService := TMyService.Create;
  FSerializer := TSerializerMock.Create;
  FWebAppServices := FBluePrintWebModule;

  FBluePrintWebModule.Serializer := FSerializer;
end;

procedure TBluePrintWebModuleTest.TearDown;
begin
  FWebAppServices := nil;

  FBluePrintWebModule.Free;

  FMyService.Free;

  FreeAndNil(FReponse);
end;

procedure TBluePrintWebModuleTest.TheExceptionMessageMustBeInTheContentOfTheResponse;
begin
  var Handled := False;
  var Handler := FBluePrintWebModule as IWebExceptionHandler;
  var MyException := Exception.Create('Error');

  InitContext(TWebResponseMock.Create(TWebRequestMock.Create('GET', EmptyStr)));

  Handler.HandleException(MyException, Handled);

  Assert.AreEqual('Error', FReponse.Content);

  MyException.Free;
end;

procedure TBluePrintWebModuleTest.WhenAnExceptionIsHandledMustReturnTrueInTheHandleParam;
begin
  var Handled := False;
  var Handler := FBluePrintWebModule as IWebExceptionHandler;
  var MyException := Exception.Create('Error');

  InitContext(TWebResponseMock.Create(TWebRequestMock.Create('GET', EmptyStr)));

  Handler.HandleException(MyException, Handled);

  Assert.IsTrue(Handled);

  MyException.Free;
end;

procedure TBluePrintWebModuleTest.WhenDontFindTheServiceMustRaiseENotFoundError;
begin
  InitContext(TWebResponseMock.Create(TWebRequestMock.Create('GET', '/NotService/MyProc')));

  Assert.WillRaise(
    procedure
    begin
      FWebAppServices.HandleRequest
    end, EHTTPErrorNotFound);
end;

procedure TBluePrintWebModuleTest.WhenGetTheExceptionHandlerMustReturnTheCurrentInstanceOfTheWebService;
begin
  Assert.AreEqual(FBluePrintWebModule, FWebAppServices.ExceptionHandler);
end;

procedure TBluePrintWebModuleTest.WhenHandleAHTTPExceptionCanChangeTheStatusCodeFromTheResponse;
begin
  var Handled := False;
  var Handler := FBluePrintWebModule as IWebExceptionHandler;
  var MyException := EHTTPStatusError.Create(525);

  InitContext(TWebResponseMock.Create(TWebRequestMock.Create('GET', EmptyStr)));

  Handler.HandleException(MyException, Handled);

  Assert.AreEqual(525, FReponse.StatusCode);

  MyException.Free;
end;

procedure TBluePrintWebModuleTest.WhenIsRaisedANotFoundErrorMustLoadTheStatusCodeOfTheException;
begin
  var Handled := False;
  var Handler := FBluePrintWebModule as IWebExceptionHandler;
  var MyException := EHTTPErrorNotFound.Create;

  InitContext(TWebResponseMock.Create(TWebRequestMock.Create('GET', EmptyStr)));

  Handler.HandleException(MyException, Handled);

  Assert.AreEqual(404, FReponse.StatusCode);

  MyException.Free;
end;

procedure TBluePrintWebModuleTest.WhenReturningARequestMustLoadTheContentTypeFromTheSerializer;
begin
  FSerializer.SerializeValues := ['abc'];

  InitContext(TWebResponseMock.Create(TWebRequestMock.Create('GET', '/MyService/MyFunc')));

  FWebAppServices.HandleRequest;

  Assert.AreEqual('serializer/type', FReponse.ContentType);
end;

procedure TBluePrintWebModuleTest.WhenReturningAStreamInAFunctionCantRaiseAnyError;
begin
  InitContext(TWebResponseMock.Create(TWebRequestMock.Create('GET', '/MyService/MyStream')));

  Assert.WillNotRaise(
    procedure
    begin
      FWebAppServices.HandleRequest;
    end);
end;

procedure TBluePrintWebModuleTest.WhenTheMethodCalledDontExistsMustRaiseENotFoundError;
begin
  InitContext(TWebResponseMock.Create(TWebRequestMock.Create('GET', '/MyService/NoProc')));

  Assert.WillRaise(
    procedure
    begin
      FWebAppServices.HandleRequest
    end, EHTTPErrorNotFound);
end;

procedure TBluePrintWebModuleTest.WhenTheMethodCalledIsAProcedureMustReturnTheStatusCode204;
begin
  InitContext(TWebResponseMock.Create(TWebRequestMock.Create('GET', '/MyService/MyProc')));

  FWebAppServices.HandleRequest;

  Assert.AreEqual(204, FReponse.StatusCode);
end;

procedure TBluePrintWebModuleTest.WhenTheProcedureHasMoreTheOneVersionMustCheckTheParamCountToCallTheCorrectProcedure;
begin
  FSerializer.DeserializeValues := ['Value1', 'Value2'];
  var Request := TWebRequestMock.Create('GET', '/MyService/SameName');
  Request.QueryFields := 'Param1=V&Param2=V';

  InitContext(TWebResponseMock.Create(Request));

  FWebAppServices.HandleRequest;

  Assert.AreEqual('SameName', FMyService.ProcedureCalled);
  Assert.AreEqual('Value1,Value2', FMyService.ParamsOfProcedureCalled);
end;

procedure TBluePrintWebModuleTest.WhenTheRequestDontHaveEnoughParamsMustRaiseABadRequestError;
begin
  FSerializer.DeserializeValues := ['Value1'];

  InitContext(TWebResponseMock.Create(TWebRequestMock.Create('GET', '/MyService/MyProc2/Value1')));

  Assert.WillRaise(
    procedure
    begin
      FWebAppServices.HandleRequest;
    end, EHTTPErrorBadRequest);
end;

procedure TBluePrintWebModuleTest.WhenTheRequestHasABodyMustCallTheProcedureWithOneParam;
begin
  FSerializer.DeserializeValues := ['Value1'];
  var Request := TWebRequestMock.Create('GET', '/MyService/SameName');
  Request.ContentLength := 25;

  InitContext(TWebResponseMock.Create(Request));

  FWebAppServices.HandleRequest;

  Assert.AreEqual('SameName', FMyService.ProcedureCalled);
  Assert.AreEqual('Value1', FMyService.ParamsOfProcedureCalled);
end;

procedure TBluePrintWebModuleTest.WhenTheRequestHasABodyMustLoadTheBodyValueInTheLastParamFromTheMethod;
begin
  FSerializer.DeserializeValues := ['Value1', 'Value2'];
  var Request := TWebRequestMock.Create('GET', '/MyService/SameName/P1');
  Request.ContentLength := 25;

  InitContext(TWebResponseMock.Create(Request));

  FWebAppServices.HandleRequest;

  Assert.AreEqual('SameName', FMyService.ProcedureCalled);
  Assert.AreEqual('Value1,Value2', FMyService.ParamsOfProcedureCalled);
end;

procedure TBluePrintWebModuleTest.WhenTheRequestHasPathParamsMustLoadThisValuesInTheParamsOfTheProcedureCalled;
begin
  FSerializer.DeserializeValues := ['Value1', 'Value2'];

  InitContext(TWebResponseMock.Create(TWebRequestMock.Create('GET', '/MyService/MyProc2/Value1/Value2')));

  FWebAppServices.HandleRequest;

  Assert.AreEqual('MyProc2', FMyService.ProcedureCalled);
  Assert.AreEqual('Value1,Value2', FMyService.ParamsOfProcedureCalled);
end;

procedure TBluePrintWebModuleTest.WhenTheRequestHasTooMuchParamsMustRaiseABadRequestError;
begin
  FSerializer.DeserializeValues := ['Value1', 'Value2'];

  InitContext(TWebResponseMock.Create(TWebRequestMock.Create('GET', '/MyService/MyProc2/Value1/Value2/Value3/Value4')));

  Assert.WillRaise(
    procedure
    begin
      FWebAppServices.HandleRequest;
    end, EHTTPErrorBadRequest);
end;

procedure TBluePrintWebModuleTest.WhenTheRequestHasTwoOrMoreParamsTheHandlerMustReturnTrue;
begin
  FSerializer.DeserializeValues := ['MyParam', 'MyParam'];

  InitContext(TWebResponseMock.Create(TWebRequestMock.Create('GET', '/MyService/MyProc2/MyParam/MyParam')));

  Assert.IsTrue(FWebAppServices.HandleRequest);
end;

procedure TBluePrintWebModuleTest.WhenTheRequestIsAFileTheRequestMustReturnFalse;
begin
  InitContext(TWebResponseMock.Create(TWebRequestMock.Create('GET', '/AFile.file')));

  Assert.IsFalse(FWebAppServices.HandleRequest);
end;

procedure TBluePrintWebModuleTest.WhenTheRequestIsSuccessfullyExecutedMustReturnTheStatusCode200;
begin
  FSerializer.SerializeValues := ['Value'];

  InitContext(TWebResponseMock.Create(TWebRequestMock.Create('GET', '/MyService/MyFunc')));

  FWebAppServices.HandleRequest;

  Assert.AreEqual(200, FReponse.StatusCode);
end;

procedure TBluePrintWebModuleTest.WhenTheRequestIsTheRootURLMustReturnHandledToFalse;
begin
  InitContext(TWebResponseMock.Create(TWebRequestMock.Create('GET', '/')));

  Assert.IsFalse(FWebAppServices.HandleRequest);
end;

procedure TBluePrintWebModuleTest.WhenTheRequestSendQueryFieldsMustLoadTheParamValueHasExpected;
begin
  FSerializer.DeserializeValues := ['Value1', 'Value2'];
  var Request := TWebRequestMock.Create('GET', '/MyService/MyProc2');
  Request.QueryFields := 'Param1=V&Param2=V';

  InitContext(TWebResponseMock.Create(Request));

  FWebAppServices.HandleRequest;

  Assert.AreEqual('MyProc2', FMyService.ProcedureCalled);
  Assert.AreEqual('Value1,Value2', FMyService.ParamsOfProcedureCalled);
end;

procedure TBluePrintWebModuleTest.WhenTheReturningStreamIsTheBluePrintStreamMustLoadTheContentValueAsExpected;
begin
  FMyService.FMyStream := TBluePrintStream.Create(TMemoryStream.Create, 'MyContentType');

  InitContext(TWebResponseMock.Create(TWebRequestMock.Create('GET', '/MyService/MyStream')));

  FWebAppServices.HandleRequest;

  Assert.AreEqual('MyContentType', FReponse.ContentType);
end;

procedure TBluePrintWebModuleTest.WhenTheReturnIsAnTStreamClassMustLoadTheContentStreamPropertyInTheWebResponse;
begin
  InitContext(TWebResponseMock.Create(TWebRequestMock.Create('GET', '/MyService/MyStream')));

  FWebAppServices.HandleRequest;

  Assert.AreEqual(FMyService.FMyStream, FReponse.ContentStream);
end;

procedure TBluePrintWebModuleTest.WhenTryToGetTheGetWebAppServicesMustReturnTheCurrentInstanceOfTheService;
begin
  Assert.AreEqual(FBluePrintWebModule, TObject((FWebAppServices as IGetWebAppServices).GetWebAppServices));
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

function TMyService.MyStream: TStream;
begin
  if not Assigned(FMyStream) then
    FMyStream := TMemoryStream.Create;

  Result := FMyStream;
end;

procedure TMyService.SameName;
begin
  FProcedureCalled := 'SameName';
end;

procedure TMyService.SameName(const Param1: String);
begin
  FProcedureCalled := 'SameName';
  ParamsOfProcedureCalled := Param1;
end;

procedure TMyService.SameName(const Param1, Param2: String);
begin
  FProcedureCalled := 'SameName';
  ParamsOfProcedureCalled := Param1 + ',' + Param2;
end;

procedure TMyService.SameName(const Param1, Param2, Param3: String);
begin
  FProcedureCalled := 'SameName';
  ParamsOfProcedureCalled := Param1 + ',' + Param2 + ',' + Param3;
end;

{ TSerializerMock }

constructor TSerializerMock.Create;
begin
  FDeserializeValues := TList<TValue>.Create;
  FSerializeValues := TList<TValue>.Create;
end;

function TSerializerMock.Deserialize(const Value: String; const TypeInfo: PTypeInfo): TValue;
begin
  Result := FDeserializeValues.ExtractAt(0);
end;

destructor TSerializerMock.Destroy;
begin
  FDeserializeValues.Free;

  FSerializeValues.Free;

  inherited;
end;

function TSerializerMock.GetContentType: String;
begin
  Result := 'serializer/type';
end;

function TSerializerMock.Serialize(const Value: TValue): String;
begin
  Result := FSerializeValues.ExtractAt(0).ToString;
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

