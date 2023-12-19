unit Blue.Print.Server.Service.Test;

interface

uses Test.Insight.Framework, Blue.Print.Server.Service, Web.HTTPApp;

type
  [TestFixture]
  TBluePrintWebAppServiceTest = class
  private
    FBluePrintService: TBluePrintWebAppService;
    FRequest: TWebResponse;
    FWebAppServices: IWebAppServices;

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
    [TestCase('Array', 'ProcArray', '["abc", "zzz"]')]
    [TestCase('Char', 'ProcChar', 'S')]
    [TestCase('Class', 'ProcClass', '{"Value": 1234}')]
    [TestCase('Enum', 'ProcEnum', '2')]
    [TestCase('Float', 'ProcFloat', '123.456')]
    [TestCase('Int64', 'ProcInt64', '123456789012')]
    [TestCase('Integer', 'ProcInteger', '1234')]
    [TestCase('LString', 'ProcLString', 'abcd')]
    [TestCase('Set', 'ProcSet', '13')]
    [TestCase('String', 'ProcString', 'abcd')]
    [TestCase('UString', 'ProcUString', 'abcd')]
    [TestCase('WChar', 'ProcWChar', 'W')]
    [TestCase('WString', 'ProcWString', 'abcd')]
    procedure MustCallTheProcedureWithTheParamValuePassed(ProcedureName, Value: String);
    [TestCase('Array', 'ProcArray', '["abc", "zzz"]')]
    [TestCase('Char', 'ProcChar', 'S')]
    [TestCase('Class', 'ProcClass', '{"Value": 1234}')]
    [TestCase('Enum', 'ProcEnum', '2')]
    [TestCase('Float', 'ProcFloat', '123.456')]
    [TestCase('Int64', 'ProcInt64', '123456789012')]
    [TestCase('Integer', 'ProcInteger', '1234')]
    [TestCase('LString', 'ProcLString', 'abcd')]
    [TestCase('Set', 'ProcSet', '13')]
    [TestCase('String', 'ProcString', 'abcd')]
    [TestCase('UString', 'ProcUString', 'abcd')]
    [TestCase('WChar', 'ProcWChar', 'W')]
    [TestCase('WString', 'ProcWString', 'abcd')]
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
    procedure WhenTheRequestExecuteAsExpectedTheStatusCode200;
    [Test]
    procedure WhenTheRequestedFunctionAsAReturnMustFillTheContentTypeWithApplicationJSON;
    [Test]
    procedure WhenTheProcedureOfTheRequestIsMarkedWithParamInBodyMustLoadTheParamsValuesFromBody;
    [TestCase('DELETE', 'DELETE', 'True')]
    [TestCase('GET', 'GET', 'True')]
    [TestCase('PATCH', 'PATCH', 'False')]
    [TestCase('POST', 'POST', 'False')]
    [TestCase('PUT', 'PUT', 'False')]
    procedure WhenTheContractHasntAnyAttributeOfParamTypeMustLoadTheParamsByProcedureType(MethodType: String; ParamInURL: Boolean);
    [Test]
    procedure WhenTheContentIsABinaryValueCantRaiseAnyError;
    [Test]
    procedure MustTryToLoadTheProcedureParamsFromTheURLAndTheBody;
    [Test]
    procedure WhenTheParamIsATStreamMustLoadTheFileInTheRequest;
    [Test]
    procedure WhenTheContentIsABinaryValueMustPassTheValueToTheParamOfTheProcedureCalled;
    [Test]
    procedure WhenTheProcedureCalledIsAnArrayOfStreamMustCallTheCorrectProcedure;
    [Test]
    procedure WhenTheProcedureHasMoreThenOneFileMustLoadEachFileInTheCorrecParam;
    [Test]
    procedure IfTheParamIsInTheQueryFieldsCantTryToLoadTheValueFromContent;
    [Test]
    procedure WhenTheParamIsEmptyCantRaiseAnyErrorOfConversion;
    [Test]
    procedure WhenTryToLoadAParamFromTheContentMustLoadOnlyIfTheContentTypeIsFormURLEncoded;
    [Test]
    procedure WhenTryToLoadAParamFromTheContentMustLoadOnlyIfTheContentTypeIsMultiPartFormData;
    [Test]
    procedure WhenTheProcedureBeenCalledHasASigleParamMustLoadTheParamFromTheContent;
    [Test]
    procedure WhenTheProcedureBeenCalledHasASigleParamMustLoadTheParamFromTheContentIfTheContentIsAJSONValue;
    [Test]
    procedure WhenTheProcedureBeenCalledHasASigleParamMustLoadTheParamFromTheContentIfTheContentIsTextPlain;
    [Test]
    procedure WhenTheContentIsEmptyMustReturnTheBadRequestStatus;
    [Test]
    procedure WhenTheServiceContainerIsNotLoadedMustRaiseAnError;
    [Test]
    procedure WhenTheServiceNameHasDotsInTheNameMustHandleTheRequest;
    [Test]
    procedure WhenTheClassHasTheContentTypeAttributeMustReturnThisTypeInTheResponse;
    [Test]
    procedure WhenTheMethodHasTheContenteTypeAttributeMustReturnThisTypeInTheResponse;
    [Test]
    procedure WhenTheServiceDontHaveTheContentTypeAttributeMustReturnTheApplicationJsonContentByDefault;
    [Test]
    procedure IfTheContentTypeAttributeHasACharSetThisMustBeLoadedInTheContentTypeInfo;
    [Test]
    procedure IfTheFunctionDoesntHaveTheAttachmentAttributeCantRaiseAnyError;
    [Test]
    procedure WhenReturnATStreamCantSerializeTheReturn;
    [Test]
    procedure WhenTheFunctionReturnATStreamMustLoadItInTheContentStreamInTheReponseClass;
    [Test]
    procedure WhenTheFunctionReturnANilStreamMustSerializeTheReturn;
    [Test]
    procedure AfterExecuteTheRequestMustSendTheResponseForTheClient;
    [Test]
    procedure AfterHandleTheRequestTheFreeContentPropertyMustByFalse;
    [Test]
    procedure WhenAProcedureHasHeaderAttributeMustLoadTheValuesInTheResponse;
    [Test]
    procedure TheHeaderAttributeMustLoadTheValuesInTheAttribute;
    [Test]
    procedure WhenTheInterfaceHasTheHeaderAttributeMustLoadTheHeadersResponse;
    [Test]
    procedure TheHeaderAttributeMustLoadTheValuedOfTheHeaderAttribute;
  end;

implementation

//uses System.NetEncoding, Winapi.WinInet, Blue.Print.Serializer, System.Net.Mime, System.NetConsts, Web.ReqFiles;


uses Blue.Print.Request.Mock;
{ TBluePrintWebAppServiceTest }

procedure TBluePrintWebAppServiceTest.AfterExecuteTheRequestMustSendTheResponseForTheClient;
begin
//  var Request := CreateRequestMock('/IService/Proc', CONTENTTYPE_APPLICATION_JSON, EmptyStr, EmptyStr);
//  var Response := TWebResponseMock.Create(Request.Instance);
//  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(TService.Create));
//
//  Rest.HandleRequest;
//
//  Assert.IsTrue(Response.Sent);
//
//  Request.Free;
//
//  Response.Free;
end;

procedure TBluePrintWebAppServiceTest.AfterHandleTheExceptionMustSendTheResponseForTheClient;
begin
//  var Request := CreateRequestMock;
//  var Response := TWebResponseMock.Create(Request.Instance);
//  var Handled := False;
//  var Handler := CreateRestService(Request.Instance, Response, nil) as IWebExceptionHandler;
//  var MyException := Exception.Create('Error');
//
//  Handler.HandleException(MyException, Handled);
//
//  Assert.IsTrue(Response.Sent);
//
//  MyException.Free;
//
//  Request.Free;
//
//  Response.Free;
end;

procedure TBluePrintWebAppServiceTest.AfterHandleTheRequestTheFreeContentPropertyMustByFalse;
begin
//  var Request := CreateRequestMock('/IService/Proc', CONTENTTYPE_APPLICATION_JSON, EmptyStr, EmptyStr);
//  var Response := TWebResponseMock.Create(Request.Instance);
//  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(TService.Create));
//
//  Rest.HandleRequest;
//
//  Assert.IsFalse(Response.FreeContentStream);
//
//  Request.Free;
//
//  Response.Free;
end;

procedure TBluePrintWebAppServiceTest.ConvertingParamsAsExpected(ProcedureName, Value: String);
begin
//  var Request := CreateRequestMock(Format('/IService/%s', [ProcedureName]), CONTENTTYPE_APPLICATION_JSON, EmptyStr, 'Value=' + TNetEncoding.URL.Encode(Value));
//  var Response := TWebResponseMock.Create(Request.Instance);
//  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(TService.Create));
//
//  Assert.WillNotRaise(
//    procedure
//    begin
//      Rest.HandleRequest;
//    end);
//
//  Request.Free;
//
//  Response.Free;
end;

procedure TBluePrintWebAppServiceTest.IfDontFindTheProcedureOfRequestMustReturStatusCodeWith404;
begin
//  var Request := CreateRequestMock('/IService/AnyProcudure', CONTENTTYPE_APPLICATION_JSON, EmptyStr, EmptyStr);
//  var Response := TWebResponseMock.Create(Request.Instance);
//  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(TService.Create));
//
//  Rest.HandleRequest;
//
//  Assert.AreEqual(HTTP_STATUS_NOT_FOUND, Response.StatusCode);
//
//  Request.Free;
//
//  Response.Free;
end;

procedure TBluePrintWebAppServiceTest.IfNotFoundTheServiceMustReturnHandledToFalse;
begin
//  var Container := TServiceContainer.Create(False);
//  var Request := CreateRequestMock('/IAnotherService/Procedure', CONTENTTYPE_APPLICATION_JSON, EmptyStr, EmptyStr);
//  var Response := TWebResponseMock.Create(Request.Instance);
//
//  var Rest := CreateRestService(Request.Instance, Response, Container);
//
//  Assert.IsFalse(Rest.HandleRequest);
//
//  Request.Free;
//
//  Response.Free;
end;

procedure TBluePrintWebAppServiceTest.IfTheContentTypeAttributeHasACharSetThisMustBeLoadedInTheContentTypeInfo;
begin
//  var Request := CreateRequestMock('/IContentService/MyCharSetFunction', CONTENTTYPE_APPLICATION_JSON, EmptyStr, EmptyStr);
//  var Response := TWebResponseMock.Create(Request.Instance);
//  var Rest := CreateRestService(Request.Instance, Response, FServiceContainer.Instance);
//
//  Rest.HandleRequest;
//
//  Assert.AreEqual(Format('%s; charset=%s', [CONTENTTYPE_APPLICATION_ATOM_XML, 'MyCharSet']), Response.ContentType);
//
//  Request.Free;
//
//  Response.Free;
end;

procedure TBluePrintWebAppServiceTest.IfTheFunctionDoesntHaveTheAttachmentAttributeCantRaiseAnyError;
begin
//  var Request := CreateRequestMock('/IContentService/MyFunction', CONTENTTYPE_APPLICATION_JSON, EmptyStr, EmptyStr);
//  var Response := TWebResponseMock.Create(Request.Instance);
//  var Rest := CreateRestService(Request.Instance, Response, FServiceContainer.Instance);
//
//  Assert.WillNotRaise(
//    procedure
//    begin
//      Rest.HandleRequest;
//    end);
//
//  Request.Free;
//
//  Response.Free;
end;

procedure TBluePrintWebAppServiceTest.IfTheParamIsInTheQueryFieldsCantTryToLoadTheValueFromContent;
begin
//  var MyService: IService := TService.Create;
//  var Request := CreateRequestMock('/IService/ProcParamString', CONTENTTYPE_APPLICATION_JSON, 'Value=abc', 'Value=');
//  var Response := TWebResponseMock.Create(Request.Instance);
//  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(MyService));
//
//  Rest.HandleRequest;
//
//  Assert.AreEqual('ProcParamString=', MyService.ProcedureCalled);
//
//  Request.Free;
//
//  Response.Free;
end;

procedure TBluePrintWebAppServiceTest.IfTheRequestDontHaveTheProcedureParamMustFillTheStatusCodigoWith404;
begin
//  var Container := TServiceContainer.Create(True);
//  var Request := CreateRequestMock('/IService', CONTENTTYPE_APPLICATION_JSON, EmptyStr, EmptyStr);
//  var Response := TWebResponseMock.Create(Request.Instance);
//  var Rest := CreateRestService(Request.Instance, Response, Container);
//
//  Rest.HandleRequest;
//
//  Assert.AreEqual(HTTP_STATUS_NOT_FOUND, Response.StatusCode);
//
//  Request.Free;
//
//  Response.Free;
end;

procedure TBluePrintWebAppServiceTest.InitContext(const Request: TWebResponse);
begin
  FRequest := Request;

  FWebAppServices.InitContext(FBluePrintService, FRequest.HTTPRequest, FRequest);
end;

procedure TBluePrintWebAppServiceTest.MustCallTheProcedureWithTheParamValuePassed(ProcedureName, Value: String);
begin
//  var Request := CreateRequestMock(Format('/IService/%s', [ProcedureName]), CONTENTTYPE_APPLICATION_JSON, EmptyStr, 'Value=' + TNetEncoding.URL.Encode(Value));
//  var Response := TWebResponseMock.Create(Request.Instance);
//  var Service: IService := TService.Create;
//
//  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(Service));
//
//  Rest.HandleRequest;
//
//  Assert.AreEqual(Format('%s=%s', [ProcedureName, Value]), Service.ProcedureCalled);
//
//  Request.Free;
//
//  Response.Free;
end;

procedure TBluePrintWebAppServiceTest.MustTryToLoadTheProcedureParamsFromTheURLAndTheBody;
begin
//  var MyService: IService := TService.Create;
//  var Request := CreateRequestMock('/IService/ProcedureWithParamsInBody', CONTENTTYPE_APPLICATION_X_WWW_FORM_URLENCODED, 'Param1=abcde', 'Param2=1234');
//  var Response := TWebResponseMock.Create(Request.Instance);
//  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(MyService));
//
//  Rest.HandleRequest;
//
//  Assert.AreEqual('ProcedureWithParamsInBody=abcde,1234', MyService.ProcedureCalled);
//
//  Request.Free;
//
//  Response.Free;
end;

procedure TBluePrintWebAppServiceTest.OnceTheExceptionIsHandledTheStatusCodeMustBe500;
begin
//  var Request := CreateRequestMock;
//  var Response := TWebResponseMock.Create(Request.Instance);
//  var Handled := False;
//  var Handler := CreateRestService(Request.Instance, Response, nil) as IWebExceptionHandler;
//  var MyException := Exception.Create('Error');
//
//  Handler.HandleException(MyException, Handled);
//
//  Assert.AreEqual(500, Response.StatusCode);
//
//  MyException.Free;
//
//  Request.Free;
//
//  Response.Free;
end;

procedure TBluePrintWebAppServiceTest.Setup;
begin
  FBluePrintService := TBluePrintWebAppService.Create(nil);
  FWebAppServices := FBluePrintService;
end;

procedure TBluePrintWebAppServiceTest.TearDown;
begin
  FWebAppServices := nil;

  FBluePrintService.Free;

  FRequest.Free;
end;

procedure TBluePrintWebAppServiceTest.TheExceptionMessageMustBeInTheContentOfTheResponse;
begin
//  var Request := CreateRequestMock;
//  var Response := TWebResponseMock.Create(Request.Instance);
//  var Handled := False;
//  var Handler := CreateRestService(Request.Instance, Response, nil) as IWebExceptionHandler;
//  var MyException := Exception.Create('Error');
//
//  Handler.HandleException(MyException, Handled);
//
//  Assert.AreEqual('Error', Response.Content);
//
//  MyException.Free;
//
//  Request.Free;
//
//  Response.Free;
end;

procedure TBluePrintWebAppServiceTest.TheHeaderAttributeMustLoadTheValuedOfTheHeaderAttribute;
begin
//  var Request := CreateRequestMock('/IContentService/MyProcedure', CONTENTTYPE_APPLICATION_JSON, EmptyStr, EmptyStr);
//  var Response := TWebResponseMock.Create(Request.Instance);
//  var Rest := CreateRestService(Request.Instance, Response, FServiceContainer.Instance);
//
//  Rest.HandleRequest;
//
//  Assert.AreEqual('My Service Header', Response.CustomHeaders.Names[0]);
//  Assert.AreEqual('My Service Value', Response.CustomHeaders.ValueFromIndex[0]);
//  Assert.AreEqual('My Service Header 2', Response.CustomHeaders.Names[1]);
//  Assert.AreEqual('My Service Value 2', Response.CustomHeaders.ValueFromIndex[1]);
//
//  Request.Free;
//
//  Response.Free;
end;

procedure TBluePrintWebAppServiceTest.TheHeaderAttributeMustLoadTheValuesInTheAttribute;
begin
//  var Request := CreateRequestMock('/IContentService/ProcedureWithHeader', CONTENTTYPE_APPLICATION_JSON, EmptyStr, EmptyStr);
//  var Response := TWebResponseMock.Create(Request.Instance);
//  var Rest := CreateRestService(Request.Instance, Response, FServiceContainer.Instance);
//
//  Rest.HandleRequest;
//
//  Assert.AreEqual('My Header', Response.CustomHeaders.Names[0]);
//  Assert.AreEqual('My Value', Response.CustomHeaders.ValueFromIndex[0]);
//  Assert.AreEqual('My Header 2', Response.CustomHeaders.Names[1]);
//  Assert.AreEqual('My Value 2', Response.CustomHeaders.ValueFromIndex[1]);
//
//  Request.Free;
//
//  Response.Free;
end;

procedure TBluePrintWebAppServiceTest.WhenAnExceptionIsHandledMustReturnTrueInTheHandleParam;
begin
//  var Request := CreateRequestMock;
//  var Response := TWebResponseMock.Create(Request.Instance);
//  var Handled := False;
//  var Handler := CreateRestService(Request.Instance, Response, nil) as IWebExceptionHandler;
//  var MyException := Exception.Create('Error');
//
//  Handler.HandleException(MyException, Handled);
//
//  Assert.IsTrue(Handled);
//
//  MyException.Free;
//
//  Request.Free;
//
//  Response.Free;
end;

procedure TBluePrintWebAppServiceTest.WhenAProcedureHasHeaderAttributeMustLoadTheValuesInTheResponse;
begin
//  var Request := CreateRequestMock('/IContentService/ProcedureWithHeader', CONTENTTYPE_APPLICATION_JSON, EmptyStr, EmptyStr);
//  var Response := TWebResponseMock.Create(Request.Instance);
//  var Rest := CreateRestService(Request.Instance, Response, FServiceContainer.Instance);
//
//  Rest.HandleRequest;
//
//  Assert.AreEqual(4, Response.CustomHeaders.Count);
//
//  Request.Free;
//
//  Response.Free;
end;

procedure TBluePrintWebAppServiceTest.WhenCalledTheGetExceptionHandlerMustReturnTheExceptionHandler;
begin
//  var Rest := CreateRestService(nil, nil, nil) as IWebAppServices;
//
//  var Handler := Rest.GetExceptionHandler;
//
//  Assert.IsNotNull(Handler);
end;

procedure TBluePrintWebAppServiceTest.WhenFindTheClassToRespondTheRequestMustReturnHandledToTrue;
begin
//  var Container := TServiceContainer.Create(True);
//  var Request := CreateRequestMock('/IService', CONTENTTYPE_APPLICATION_JSON, EmptyStr, EmptyStr);
//  var Response := TWebResponseMock.Create(Request.Instance);
//
//  var Rest := CreateRestService(Request.Instance, Response, Container);
//
//  Assert.IsTrue(Rest.HandleRequest);
//
//  Request.Free;
//
//  Response.Free;
end;

procedure TBluePrintWebAppServiceTest.WhenReturnATStreamCantSerializeTheReturn;
begin
//  var Request := CreateRequestMock('/IService/ReturnStream', CONTENTTYPE_APPLICATION_JSON, EmptyStr, EmptyStr);
//  var Response := TWebResponseMock.Create(Request.Instance);
//  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(TService.Create));
//  var Serializer := TMock.CreateInterface<IBluePrintSerializer>;
//
//  FRestService.Serializer := Serializer.Instance;
//
//  Serializer.Expect.Never.When.Serialize(It.IsAny<TValue>);
//
//  Rest.HandleRequest;
//
//  Assert.CheckExpectation(Serializer.CheckExpectations);
//
//  Request.Free;
//
//  Response.Free;
end;

procedure TBluePrintWebAppServiceTest.WhenTheAmountOfRequestParametersIsDiferrentFromTheAmoutOfProcedureParametersMustReturnBadRequest(Params: String);
begin
//  var Request := CreateRequestMock('/IService/ProcInteger', CONTENTTYPE_APPLICATION_JSON, EmptyStr, Params);
//  var Response := TWebResponseMock.Create(Request.Instance);
//  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(TService.Create));
//
//  Rest.HandleRequest;
//
//  Assert.AreEqual(HTTP_STATUS_BAD_REQUEST, Response.StatusCode);
//
//  Request.Free;
//
//  Response.Free;
end;

procedure TBluePrintWebAppServiceTest.WhenTheClassHasTheContentTypeAttributeMustReturnThisTypeInTheResponse;
begin
//  var Request := CreateRequestMock('/IContentService/MyFunction', CONTENTTYPE_APPLICATION_JSON, EmptyStr, EmptyStr);
//  var Response := TWebResponseMock.Create(Request.Instance);
//  var Rest := CreateRestService(Request.Instance, Response, FServiceContainer.Instance);
//
//  Rest.HandleRequest;
//
//  Assert.AreEqual(CONTENTTYPE_APPLICATION_OGG, Response.ContentType);
//
//  Request.Free;
//
//  Response.Free;
end;

procedure TBluePrintWebAppServiceTest.WhenTheContentIsABinaryValueCantRaiseAnyError;
begin
//  var Request := CreateRequestMock('/IService/ProcStream', CONTENTTYPE_APPLICATION_JSON, EmptyStr, EmptyStr);
//  var Response := TWebResponseMock.Create(Request.Instance);
//  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(TService.Create));
//
//  Assert.WillNotRaise(
//    procedure
//    begin
//      Rest.HandleRequest;
//    end);
//
//  Request.Free;
//
//  Response.Free;
end;

procedure TBluePrintWebAppServiceTest.WhenTheContentIsABinaryValueMustPassTheValueToTheParamOfTheProcedureCalled;
begin
//  var Content: TBytes := [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
//  var Request := CreateRequestMock('/IService/ProcStream', CONTENTTYPE_IMAGE_PNG, Content, EmptyStr);
//  var Response := TWebResponseMock.Create(Request.Instance);
//  var Service: IService := TService.Create;
//
//  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(Service));
//
//  Rest.HandleRequest;
//
//  Assert.AreEqualMemory(Content, (Service.GetStream.Stream as TCustomMemoryStream).Memory, Length(Content));
//
//  Request.Free;
//
//  Response.Free;
end;

procedure TBluePrintWebAppServiceTest.WhenTheContentIsEmptyMustReturnTheBadRequestStatus;
begin
//  var Request := CreateRequestMock('/IService/ProcString', CONTENTTYPE_APPLICATION_JSON, EmptyStr, EmptyStr);
//  var Response := TWebResponseMock.Create(Request.Instance);
//  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(TService.Create));
//
//  Rest.HandleRequest;
//
//  Assert.AreEqual(HTTP_STATUS_BAD_REQUEST, Response.StatusCode);
//
//  Request.Free;
//
//  Response.Free;
end;

procedure TBluePrintWebAppServiceTest.WhenTheContractHasntAnyAttributeOfParamTypeMustLoadTheParamsByProcedureType(MethodType: String; ParamInURL: Boolean);
begin
//  var Params := 'Param1=abcde&Param2=1234';
//  var Request := TMock.CreateClass<TWebRequestMock>;
//  var RequestBody := TEncoding.UTF8.GetBytes(Params);
//  var Response := TWebResponseMock.Create(Request.Instance);
//
//  Request.Setup.WillReturn('/IService/ProcedureWithOutAttribute').When.GetStringVariable(It.IsEqualTo(URL_INDEX));
//
//  Request.Setup.WillReturn(MethodType).When.GetStringVariable(It.IsEqualTo(METHOD_INDEX));
//
//  Request.Setup.WillReturn(CONTENTTYPE_APPLICATION_X_WWW_FORM_URLENCODED).When.GetStringVariable(It.IsEqualTo(CONTENT_TYPE_INDEX));
//
//  if ParamInURL then
//  begin
//    Request.Setup.WillReturn(Params).When.GetStringVariable(It.IsEqualTo(QUERY_INDEX));
//
//    Request.Expect.Once.When.GetStringVariable(It.IsEqualTo(QUERY_INDEX));
//  end
//  else
//  begin
//    Request.Setup.WillReturn(EmptyStr).When.GetStringVariable(It.IsEqualTo(QUERY_INDEX));
//
//    Request.Setup.WillReturn(Length(RequestBody)).When.GetIntegerVariable(It.IsEqualTo(CONTENT_LENGTH_INDEX));
//
//    Request.Setup.WillReturn(TValue.From(RequestBody)).When.GetRawContent;
//
//    Request.Expect.Once.When.GetRawContent;
//  end;
//
//  Request.Instance.UpdateMethodType;
//
//  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(TService.Create));
//
//  Rest.HandleRequest;
//
//  Assert.AreEqual(EmptyStr, Request.CheckExpectations);
//
//  Request.Free;
//
//  Response.Free;
end;

procedure TBluePrintWebAppServiceTest.WhenTheFunctionReturnANilStreamMustSerializeTheReturn;
begin
//  var Request := CreateRequestMock('/IService/ReturnStreamNil', CONTENTTYPE_APPLICATION_JSON, EmptyStr, EmptyStr);
//  var Response := TWebResponseMock.Create(Request.Instance);
//  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(TService.Create));
//  var Serializer := TMock.CreateInterface<IBluePrintSerializer>;
//
//  FRestService.Serializer := Serializer.Instance;
//
//  Serializer.Expect.Once.When.Serialize(It.IsAny<TValue>);
//
//  Rest.HandleRequest;
//
//  Assert.CheckExpectation(Serializer.CheckExpectations);
//
//  Request.Free;
//
//  Response.Free;
end;

procedure TBluePrintWebAppServiceTest.WhenTheFunctionReturnATStreamMustLoadItInTheContentStreamInTheReponseClass;
begin
//  var Request := CreateRequestMock('/IService/ReturnStream', CONTENTTYPE_APPLICATION_JSON, EmptyStr, EmptyStr);
//  var Response := TWebResponseMock.Create(Request.Instance);
//  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(TService.Create));
//
//  Rest.HandleRequest;
//
//  Assert.IsNotNull(Response.ContentStream);
//
//  Request.Free;
//
//  Response.Free;
end;

procedure TBluePrintWebAppServiceTest.WhenTheInterfaceHasTheHeaderAttributeMustLoadTheHeadersResponse;
begin
//  var Request := CreateRequestMock('/IContentService/MyProcedure', CONTENTTYPE_APPLICATION_JSON, EmptyStr, EmptyStr);
//  var Response := TWebResponseMock.Create(Request.Instance);
//  var Rest := CreateRestService(Request.Instance, Response, FServiceContainer.Instance);
//
//  Rest.HandleRequest;
//
//  Assert.AreEqual(2, Response.CustomHeaders.Count);
//
//  Request.Free;
//
//  Response.Free;
end;

procedure TBluePrintWebAppServiceTest.WhenTheMethodHasTheContenteTypeAttributeMustReturnThisTypeInTheResponse;
begin
//  var Request := CreateRequestMock('/IContentService/MyContentFunction', CONTENTTYPE_APPLICATION_JSON, EmptyStr, EmptyStr);
//  var Response := TWebResponseMock.Create(Request.Instance);
//  var Rest := CreateRestService(Request.Instance, Response, FServiceContainer.Instance);
//
//  Rest.HandleRequest;
//
//  Assert.AreEqual(CONTENTTYPE_APPLICATION_ATOM_XML, Response.ContentType);
//
//  Request.Free;
//
//  Response.Free;
end;

procedure TBluePrintWebAppServiceTest.WhenTheParamIsATStreamMustLoadTheFileInTheRequest;
begin
//  var Request := CreateRequestMock('/IService/ProcStream', CONTENTTYPE_IMAGE_PNG, nil, EmptyStr);
//  var Response := TWebResponseMock.Create(Request.Instance);
//  var Service: IService := TService.Create;
//
//  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(Service));
//
//  Rest.HandleRequest;
//
//  Assert.AreEqual('ProcStream', Service.ProcedureCalled);
//
//  Request.Free;
//
//  Response.Free;
end;

procedure TBluePrintWebAppServiceTest.WhenTheParamIsEmptyCantRaiseAnyErrorOfConversion;
begin
//  var Request := CreateRequestMock('/IService/ProcParamString', CONTENTTYPE_APPLICATION_JSON, EmptyStr, 'Value=');
//  var Response := TWebResponseMock.Create(Request.Instance);
//  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(TService.Create));
//
//  Assert.WillNotRaise(
//    procedure
//    begin
//      Rest.HandleRequest;
//    end);
//
//  Request.Free;
//
//  Response.Free;
end;

procedure TBluePrintWebAppServiceTest.WhenThePathHasMoreThenTwoLevelsMustReturn404;
begin
//  var Request := CreateRequestMock('/IService/Proc/Proc', CONTENTTYPE_APPLICATION_JSON, EmptyStr, EmptyStr);
//  var Response := TWebResponseMock.Create(Request.Instance);
//  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(TService.Create));
//
//  Rest.HandleRequest;
//
//  Assert.AreEqual(HTTP_STATUS_NOT_FOUND, Response.StatusCode);
//
//  Request.Free;
//
//  Response.Free;
end;

procedure TBluePrintWebAppServiceTest.WhenTheProcedureBeenCalledHasASigleParamMustLoadTheParamFromTheContent;
begin
//  var Request := CreateRequestMock('/IService/ProcParamString', CONTENTTYPE_APPLICATION_JSON, 'MyValue', EmptyStr);
//  var Response := TWebResponseMock.Create(Request.Instance);
//  var Service: IService := TService.Create;
//
//  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(Service));
//
//  Rest.HandleRequest;
//
//  Assert.AreEqual('ProcParamString=MyValue', Service.ProcedureCalled);
//
//  Request.Free;
//
//  Response.Free;
//
//  Request := CreateRequestMock('/IService/ProcedureWithOutAttribute', CONTENTTYPE_APPLICATION_JSON, 'Value=abcde', EmptyStr);
//  Response := TWebResponseMock.Create(Request.Instance);
//  Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(Service));
//
//  Rest.HandleRequest;
//
//  Assert.AreEqual(HTTP_STATUS_BAD_REQUEST, Response.StatusCode);
//
//  Request.Free;
//
//  Response.Free;
end;

procedure TBluePrintWebAppServiceTest.WhenTheProcedureBeenCalledHasASigleParamMustLoadTheParamFromTheContentIfTheContentIsAJSONValue;
begin
//  var Request := CreateRequestMock('/IService/ProcParamString', CONTENTTYPE_APPLICATION_JAVASCRIPT, 'MyValue', EmptyStr);
//  var Response := TWebResponseMock.Create(Request.Instance);
//  var Service: IService := TService.Create;
//
//  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(Service));
//
//  Rest.HandleRequest;
//
//  Assert.AreEqual(HTTP_STATUS_BAD_REQUEST, Response.StatusCode);
//
//  Request.Free;
//
//  Response.Free;
//
//  Request := CreateRequestMock('/IService/ProcParamString', CONTENTTYPE_APPLICATION_JSON, 'MyValue', EmptyStr);
//  Response := TWebResponseMock.Create(Request.Instance);
//  Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(Service));
//
//  Rest.HandleRequest;
//
//  Assert.AreEqual(HTTP_STATUS_OK, Response.StatusCode);
//
//  Request.Free;
//
//  Response.Free;
end;

procedure TBluePrintWebAppServiceTest.WhenTheProcedureBeenCalledHasASigleParamMustLoadTheParamFromTheContentIfTheContentIsTextPlain;
begin
//  var Request := CreateRequestMock('/IService/ProcParamString', CONTENTTYPE_APPLICATION_JAVASCRIPT, 'MyValue', EmptyStr);
//  var Response := TWebResponseMock.Create(Request.Instance);
//  var Service: IService := TService.Create;
//
//  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(Service));
//
//  Rest.HandleRequest;
//
//  Assert.AreEqual(HTTP_STATUS_BAD_REQUEST, Response.StatusCode);
//
//  Request.Free;
//
//  Response.Free;
//
//  Request := CreateRequestMock('/IService/ProcParamString', CONTENTTYPE_TEXT_PLAIN + ';charset=UTF-8', 'MyValue', EmptyStr);
//  Response := TWebResponseMock.Create(Request.Instance);
//  Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(Service));
//
//  Rest.HandleRequest;
//
//  Assert.AreEqual(HTTP_STATUS_OK, Response.StatusCode);
//
//  Request.Free;
//
//  Response.Free;
end;

procedure TBluePrintWebAppServiceTest.WhenTheProcedureCalledIsAnArrayOfStreamMustCallTheCorrectProcedure;
begin
//  var Request := CreateRequestMock('/IService/ProcStreamArray', CONTENTTYPE_APPLICATION_JSON, EmptyStr, EmptyStr);
//  var Response := TWebResponseMock.Create(Request.Instance);
//  var Service: IService := TService.Create;
//
//  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(Service));
//
//  Rest.HandleRequest;
//
//  Assert.AreEqual('ProcStreamArray', Service.ProcedureCalled);
//
//  Request.Free;
//
//  Response.Free;
end;

procedure TBluePrintWebAppServiceTest.WhenTheProcedureHasMoreThenOneFileMustLoadEachFileInTheCorrecParam;
begin
//  var Content := TMultipartFormData.Create;
//  var MyFile := TStringStream.Create(EmptyStr);
//  var Service: IService := TService.Create;
//
//  var Container := TServiceContainer.Create(Service);
//
//  Content.AddStream('File1', MyFile, True, 'One.png');
//
//  Content.AddStream('File2', MyFile, False, 'Two.jpg');
//
//  var ContentBytes := TBytesStream.Create(nil);
//
//  ContentBytes.CopyFrom(Content.Stream, 0);
//
//  var Request := CreateRequestMock('/IService/ProcStreamTwoParam', Content.MimeTypeHeader, ContentBytes.Bytes, EmptyStr);
//  var Response := TWebResponseMock.Create(Request.Instance);
//  var Rest := CreateRestService(Request.Instance, Response, Container);
//
//  Rest.HandleRequest;
//
//  Assert.AreEqual('ProcStreamTwoParam=File1=One.png,File2=Two.jpg', Service.ProcedureCalled);
//
//  Response.Free;
//
//  Request.Free;
//
//  Content.Free;
//
//  ContentBytes.Free;
end;

procedure TBluePrintWebAppServiceTest.WhenTheProcedureHaveParamMustCallWithTheParamOfTheRequest;
begin
//  var Request := CreateRequestMock('/IService/ProcParam', CONTENTTYPE_APPLICATION_JSON, EmptyStr, 'Value=123');
//  var Response := TWebResponseMock.Create(Request.Instance);
//  var Service: IService := TService.Create;
//
//  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(Service));
//
//  Rest.HandleRequest;
//
//  Assert.AreEqual('ProcParam=123', Service.ProcedureCalled);
//
//  Request.Free;
//
//  Response.Free;
end;

procedure TBluePrintWebAppServiceTest.WhenTheProcedureOfTheRequestIsMarkedWithParamInBodyMustLoadTheParamsValuesFromBody;
begin
//  var Request := CreateRequestMock('/IService/ProcedureWithParamsInBody', CONTENTTYPE_APPLICATION_X_WWW_FORM_URLENCODED, 'Param1=abcde&Param2=1234', EmptyStr);
//  var Response := TWebResponseMock.Create(Request.Instance);
//
//  Request.Expect.Once.When.GetRawContent;
//
//  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(TService.Create));
//
//  Rest.HandleRequest;
//
//  Assert.AreEqual(EmptyStr, Request.CheckExpectations);
//
//  Request.Free;
//
//  Response.Free;
end;

procedure TBluePrintWebAppServiceTest.WhenTheRequestCallAFunctionAndTheReturnIsAClassMustReturnTheJSONAsSpected;
begin
//  var Request := CreateRequestMock('/IService/FuncClass', CONTENTTYPE_APPLICATION_JSON, EmptyStr, EmptyStr);
//  var Response := TWebResponseMock.Create(Request.Instance);
//  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(TService.Create));
//
//  Rest.HandleRequest;
//
//  Assert.AreEqual('{"Value":5555}', Response.Content);
//
//  Request.Free;
//
//  Response.Free;
end;

procedure TBluePrintWebAppServiceTest.WhenTheRequestedFunctionAsAReturnMustFillTheContentTypeWithApplicationJSON;
begin
//  var Request := CreateRequestMock('/IService/FuncInteger', CONTENTTYPE_APPLICATION_JSON, EmptyStr, EmptyStr);
//  var Response := TWebResponseMock.Create(Request.Instance);
//  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(TService.Create));
//
//  Rest.HandleRequest;
//
//  Assert.AreEqual(CONTENTTYPE_APPLICATION_JSON, Response.ContentType);
//
//  Request.Free;
//
//  Response.Free;
end;

procedure TBluePrintWebAppServiceTest.WhenTheRequestExecuteAsExpectedTheStatusCode200;
begin
//  var Request := CreateRequestMock('IService/ProcParamString', CONTENTTYPE_APPLICATION_JSON, EmptyStr, 'Value=Abc');
//  var Response := TWebResponseMock.Create(Request.Instance);
//  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(TService.Create));
//
//  Rest.HandleRequest;
//
//  Assert.AreEqual(200, Response.StatusCode);
//
//  Request.Free;
//
//  Response.Free;
end;

procedure TBluePrintWebAppServiceTest.WhenTheRequestExecutionWasSucessfullyMustReturnTheJSONResult;
begin
//  var Request := CreateRequestMock('/IService/FuncInteger', CONTENTTYPE_APPLICATION_JSON, EmptyStr, EmptyStr);
//  var Response := TWebResponseMock.Create(Request.Instance);
//  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(TService.Create));
//
//  Rest.HandleRequest;
//
//  Assert.AreEqual('123456', Response.Content);
//
//  Request.Free;
//
//  Response.Free;
end;

procedure TBluePrintWebAppServiceTest.WhenTheRequestHasTwoOrMoreParamsTheHandlerMustReturnTrue;
begin
  InitContext(TWebResponseMock.Create(TWebRequestMock.Create('GET', '/MyService/MyProc/MyParam')));

  Assert.IsTrue(FWebAppServices.HandleRequest);
end;

procedure TBluePrintWebAppServiceTest.WhenTheRequestIsAFileTheRequestMustReturnFalse;
begin
  InitContext(TWebResponseMock.Create(TWebRequestMock.Create('GET', '/AFile.file')));

  Assert.IsFalse(FWebAppServices.HandleRequest);
end;

procedure TBluePrintWebAppServiceTest.WhenTheRequestIsCorrectMustCallTheProcedureRequested;
begin
//  var Request := CreateRequestMock('/IService/Proc', CONTENTTYPE_APPLICATION_JSON, EmptyStr, EmptyStr);
//  var Response := TWebResponseMock.Create(Request.Instance);
//  var Service: IService := TService.Create;
//  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(Service));
//
//  Rest.HandleRequest;
//
//  Assert.AreEqual('Proc', Service.ProcedureCalled);
//
//  Request.Free;
//
//  Response.Free;
end;

procedure TBluePrintWebAppServiceTest.WhenTheRequestIsForAProcedureCantRaiseErrorOfSerialization;
begin
//  var Request := CreateRequestMock;
//  var Response := TWebResponseMock.Create(Request.Instance);
//
//  Request.Setup.WillReturn('/IService/ProcInteger?Value=1234').When.GetStringVariable(It.IsEqualTo(URL_INDEX));
//
//  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(TService.Create));
//
//  Assert.WillNotRaise(
//    procedure
//    begin
//      Rest.HandleRequest;
//    end);
//
//  Request.Free;
//
//  Response.Free;
end;

procedure TBluePrintWebAppServiceTest.WhenTheRequestIsTheRootURLMustReturnHandledToFalse;
begin
  InitContext(TWebResponseMock.Create(TWebRequestMock.Create('GET', '/')));

  Assert.IsFalse(FWebAppServices.HandleRequest);
end;

procedure TBluePrintWebAppServiceTest.WhenTheServiceContainerIsNotLoadedMustRaiseAnError;
begin
//  var Request := CreateRequestMock('/IService/ProcString', CONTENTTYPE_APPLICATION_JSON, EmptyStr, EmptyStr);
//  var Response := TWebResponseMock.Create(Request.Instance);
//  var Rest := CreateRestService(Request.Instance, Response, nil);
//
//  Assert.WillRaise(
//    procedure
//    begin
//      Rest.HandleRequest;
//    end, EServiceContainerNotLoaded);
//
//  Request.Free;
//
//  Response.Free;
end;

procedure TBluePrintWebAppServiceTest.WhenTheServiceDontHaveTheContentTypeAttributeMustReturnTheApplicationJsonContentByDefault;
begin
//  var Request := CreateRequestMock('/IService/FuncInteger', CONTENTTYPE_APPLICATION_JSON, EmptyStr, EmptyStr);
//  var Response := TWebResponseMock.Create(Request.Instance);
//  var Rest := CreateRestService(Request.Instance, Response, FServiceContainer.Instance);
//
//  Rest.HandleRequest;
//
//  Assert.AreEqual(CONTENTTYPE_APPLICATION_JSON, Response.ContentType);
//
//  Request.Free;
//
//  Response.Free;
end;

procedure TBluePrintWebAppServiceTest.WhenTheServiceNameHasDotsInTheNameMustHandleTheRequest;
begin
//  var Request := CreateRequestMock('/IService.My.Another/MyProcedure', CONTENTTYPE_APPLICATION_JSON, EmptyStr, 'Value=123');
//  var Response := TWebResponseMock.Create(Request.Instance);
//  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(TService.Create));
//
//  Assert.IsTrue(Rest.HandleRequest);
//
//  Request.Free;
//
//  Response.Free;
end;

procedure TBluePrintWebAppServiceTest.WhenTheTypeIsInvalidMustRaiseAnError(ProcedureName: String);
begin
//  var Request := CreateRequestMock(Format('/IService/%s', [ProcedureName]), CONTENTTYPE_APPLICATION_JSON, EmptyStr, 'Value=123');
//  var Response := TWebResponseMock.Create(Request.Instance);
//  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(TService.Create));
//
//  Assert.WillRaise(
//    procedure
//    begin
//      Rest.HandleRequest;
//    end, EInvalidParameterType);
//
//  Request.Free;
//
//  Response.Free;
end;

procedure TBluePrintWebAppServiceTest.WhenTryToLoadAParamFromTheContentMustLoadOnlyIfTheContentTypeIsFormURLEncoded;
begin
//  var MyService: IService := TService.Create;
//  var Request := CreateRequestMock('/IService/ProcString', CONTENTTYPE_APPLICATION_X_WWW_FORM_URLENCODED, 'Value=abcde', EmptyStr);
//  var Response := TWebResponseMock.Create(Request.Instance);
//  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(MyService));
//
//  Rest.HandleRequest;
//
//  Assert.AreEqual('ProcString=abcde', MyService.ProcedureCalled);
//
//  Request.Free;
//
//  Response.Free;
//
//  Request := CreateRequestMock('/IService/ProcString', CONTENTTYPE_APPLICATION_JAVASCRIPT, 'Value=abcde', EmptyStr);
//  Response := TWebResponseMock.Create(Request.Instance);
//  Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(MyService));
//
//  Rest.HandleRequest;
//
//  Assert.AreEqual(HTTP_STATUS_BAD_REQUEST, Response.StatusCode);
//
//  Request.Free;
//
//  Response.Free;
end;

procedure TBluePrintWebAppServiceTest.WhenTryToLoadAParamFromTheContentMustLoadOnlyIfTheContentTypeIsMultiPartFormData;
begin
//  var Content :=
//    '--MyMarker'#13#10 +
//    'Content-Disposition: form-data; name="Value"'#13#10 +
//    #13#10 +
//    'MyValue'#13#10 +
//    '--MyMarker--'#13#10;
//
//  var MyService: IService := TService.Create;
//  var Request := CreateRequestMock('/IService/ProcString', CONTENTTYPE_MULTIPART_FORM_DATA + '; boundary=MyMarker', Content, EmptyStr);
//  var Response := TWebResponseMock.Create(Request.Instance);
//  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(MyService));
//
//  Rest.HandleRequest;
//
//  Assert.AreEqual('ProcString=MyValue', MyService.ProcedureCalled);
//
//  Request.Free;
//
//  Response.Free;
//
//  Request := CreateRequestMock('/IService/ProcString', CONTENTTYPE_APPLICATION_JAVASCRIPT, 'Value=abcde', EmptyStr);
//  Response := TWebResponseMock.Create(Request.Instance);
//  Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(MyService));
//
//  Rest.HandleRequest;
//
//  Assert.AreEqual(HTTP_STATUS_BAD_REQUEST, Response.StatusCode);
//
//  Request.Free;
//
//  Response.Free;
end;

end.

