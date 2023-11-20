unit Blue.Print.Remote.Service.Test;

interface

uses DUnitX.TestFramework, System.Rtti, Blue.Print.Remote.Service, Translucent, Translucent.Intf, Blue.Print.Types;

type
  TCommunicationMock = class;

  [TestFixture]
  TRemoteServiceTest = class
  private
    FCommunication: TCommunicationMock;
    FCommunicationInterface: IHTTPCommunication;

    function CreateRemoteService<T: IInvokable>: TRemoteService;
    function GetRemoteService<T: IInvokable>(const URL: String): T;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure WhenCreateServiceMustReturnTheInterfaceFilled;
    [Test]
    procedure WhenGetServiceMustReturnTheInterfaceFilled;
    [Test]
    procedure WhenCallARemoteServiceMustBuildTheURLAsExpected;
    [Test]
    procedure WhenTheInterfaceHasTheRemoteNameMustSendThisNameInTheURLOfTheRequest;
    [Test]
    procedure WhenTheProcedureHasTheRemoteNameAttributeMustSendThisNameInTheURLOfThRequest;
    [TestCase('DELETE', 'TestDelete,Delete')]
    [TestCase('GET', 'TestGet,Get')]
    [TestCase('PATCH', 'TestPatch,Patch')]
    [TestCase('POST', 'TestPost,Post')]
    [TestCase('PUT', 'TestPut,Put')]
    procedure TheRequestMethodMustBeTheSameOfTheAttributeOfTheMethod(const MethodName: String; const RequestType: TRequestMethod);
    [Test]
    procedure WhenTheMethodDontHaveARequestMethodAttributeTheDefaultMethodMustBePost;
    [TestCase('PATCH', 'IServicePatch,Patch')]
    [TestCase('POST', 'IServiceParams,Get')]
    procedure WhenTheMethodDontHaveARequestMethodAttributeAndTheInterfaceHasTheAttributeMustLoadTheRequestMethodFromTheInterface(const InterfaceName: String; const RequestType: TRequestMethod);
    [Test]
    procedure AfterLoadingTheRequestMustSendTheRequestToServer;

    [Test]
    procedure WhenCallSendRequestMustSendABodyInParams;
    [Test]
    procedure WhenCallAFunctionMustReturnTheValueOfFunctionAsSpected;
    [Test]
    procedure WhenCallAFunctionMustConvertTheFunctionParamsInTheGetURL;
    [Test]
    procedure SendingARequestWithOneParamMustPutTheParamSeparatorInTheURLAndTheNameAndValueParam;
    [Test]
    procedure WhenTheRequestHasMoreThenOneParameterMustSepareteThenWithTheSeparetorChar;
    [Test]
    procedure WhenThePropertyOnExceptionIsLoadedMustCallTheEventWhenRaiseAnErrorInTheSyncCall;
    [Test]
    procedure WhenThePropertyOnExceptionIsNotLoadedMustCallTheEventWhenRaiseAnErrorInTheSyncCall;
    [Test]
    procedure WhenFillingAHeaderHasToReturnTheValuesInTheHeadersProperty;
    [Test]
    procedure TheHeadersFilledMustBeLoadedInTheCommunicationInterface;
    [Test]
    procedure WhenFillingThePropertyHeadersHaveToFillThePropertyHeaderWithTheParameterValuesPassed;
    [Test]
    procedure WhenTheMethodHasNoAttributesHaveToUseTheGetMethod;
    [Test]
    procedure WhenTheProcedureHasTheParameterInBodyAttributeMustSendTheParamsInTheBodyOfTheRequest;
    [Test]
    procedure WhenTheProcedureHasTheParameterInQueryAttributeMustSendTheParamsInTheURLOfTheRequest;
    [Test]
    procedure WhenTheProcedureHasTheParameterInPathAttributeMustSendTheParamsInTheURLPathOfTheRequest;
    [TestCase('DELETE', 'rmDelete,True')]
    [TestCase('GET', 'rmGet,True')]
    [TestCase('PATCH', 'rmPatch,False')]
    [TestCase('POST', 'rmPost,False')]
    [TestCase('PUT', 'rmPut,False')]
    procedure IfTheProcedureHasntAnAttributeAboutParamMustSendTheParamByTheTypeOfCommand(Method: TRequestMethod; ParameterInQuery: Boolean);
    [Test]
    procedure WhenTheMethodHasNoAttributesOfParamDefinedMustGetTheAttributeFromInterface;
    [Test]
    procedure WhenTheProcedureBeenCalledHasntParametersTheRequestBodyMustBeEmpty;
    [Test]
    procedure WhenTheProcedureHasAParameterThatIsAFileMustSendTheFileInTheBodyOfTheRequest;
    [Test]
    procedure WhenTheProcedureSendAFileInTheBodyMustLoadTheFileInTheBody;
    [Test]
    procedure WhenTheProcedureHasMoreThenOneParamAndSendingInTheBodyTheRequestMustLoadTheFormDataInTheBody;
    [Test]
    procedure TheParamsOfAProcedureMustBeSentInFormDataObjectAsExpected;
    [Test]
    procedure WhenTheProcedureAsAFileMustLoadTheFormDataValueAsExpected;
    [Test]
    procedure WhenTheProcedureAsAnArrayOfFilesMustAddTheFilesToFormDataAsExpected;
    [Test]
    procedure WhenTheProcedureIsToSendTheParamsInURLAndHaveAnArrayOfFileParamMustSendTheParamInTheBody;
    [Test]
    procedure WhenTheProcedureHasMoreThenOneParamFileParamMustSendTheFilesInTheBodyOfTheRequest;
    [Test]
    procedure WhenSendARequestMoreThenOneTimeMustResetTheRequestBody;
    [Test]
    procedure WhenTheRemoteNameAttributeIsPresentMustChangeTheRemoteNameInTheRequest;
    [Test]
    procedure WhenTheProcedureAsNameAttributeMustLoadTheURLWithTheNameInTheAttribute;
    [Test]
    procedure WhenTheServiceHasABasicAuthenticationAttributeMustSendTheAuthenticationHeaderInTheRequest;
    [Test]
    procedure WhenTheHeaderIsLoadedTheAuthenticationMustBeAppendedToTheHeaders;
    [Test]
    procedure IfTheParameterHasThePathParameterTypeAttributeMustSendTheRequestRespectingThisType;
    [Test]
    procedure IfTheParameterHasTheQueryParameterTypeAttributeMustSendTheRequestRespectingThisType;
    [Test]
    procedure IfTheParameterHasTheBodyParameterTypeAttributeMustSendTheRequestRespectingThisType;
    [Test]
    procedure WhenSendAnFileAndTheFileIsNotFilledCantRaiseAnyError;
    [Test]
    procedure WhenMixTheParameterTypeAttributeMustLoadTheRequestHasExpected;
    [Test]
    procedure WhenTheFunctionOfTheServiceHasTheAttachmentAttributeTheRequestMustMarkTheFileDownloadField;
    [Test]
    procedure WhenDownloadAFileCantRaiseAnyErrorInTheExecution;
    [Test]
    procedure WhenDownloadingAFileMustCallTheRemoteService;
    [Test]
    procedure IfTheProcedureHasAFileTheRequestMethodMustBePost;
    [Test]
    procedure IfTheProcedureHasAnArrayOfFilesTheRequestMethodMustBePost;
  end;

  TCommunicationMock = class(TInterfacedObject, IHTTPCommunication)
  private
    FRequestMethod: TRequestMethod;
    FRequestSended: Boolean;
    FURL: String;

    function SendRequest: String;

    procedure SetHeader(const Name, Value: String);
    procedure SetRequestMethod(const Value: TRequestMethod);
    procedure SetURL(const Value: String);
  public
    property RequestMethod: TRequestMethod read FRequestMethod;
    property RequestSended: Boolean read FRequestSended write FRequestSended;
    property URL: String read FURL;
  end;

  [BasicAuthentication('User', 'Password')]
  [GET]
  IServiceAutenticationTest = interface(IInvokable)
    ['{C99C50FD-92DF-42FB-A928-5C7BF1566C6F}']
    procedure Proc;
  end;

  IServiceTest = interface(IInvokable)
    ['{61DCD8A8-AD02-4EA3-AFC7-8425F7B12D6B}']
    function TestFunction: Integer;

    [DELETE]
    procedure TestDELETE;
    [GET]
    procedure TestGET;
    [PATCH]
    procedure TestPATCH;
    [POST]
    procedure TestPOST;
    [PUT]
    procedure TestPUT;
    procedure TestProcedure;
    procedure TestProcedureWithOneParam(Param: String);
    procedure TestProcedureWithParam(Param1: String; Param2: Integer);
    [ParameterInBody]
    procedure TestProcedureWithParameterInBody(Param1: String; Param2: Integer);
    procedure TestProcedureWithAnFile(MyFile: TRequestFile);
    procedure TestProcedureWithFileAndParams(MayParam: Integer; MyFile: TRequestFile; AnotherParam: String);
    [ParameterInBody]
    procedure TestProcedureFileInTheBody(MyFile: TRequestFile);
    [ParameterInBody]
    procedure TestProcedureFileAnParamInTheBody(MyParam: String; MyFile: TRequestFile);
    [ParameterInBody]
    procedure TestProcedureWithArrayFiles(MyFiles: TArray<TRequestFile>);
    procedure TestProcedureWithArrayFilesInURL(MyFiles: TArray<TRequestFile>);
    procedure TestProceudreMoreThenOneFileParam(MyFile1: TRequestFile; AnParam: String; MyFile2: TRequestFile);
    procedure TestProcedureFileInParam(MyFile: TRequestFile);
    procedure TestProcedureArrayFileInParam(MyFile: TArray<TRequestFile>);
  end;

  [PATCH]
  IServicePatch = interface(IInvokable)
    ['{D4C4C05B-58D7-4F89-BABE-6FCDB10EF15B}']
    procedure TestProcedure;
  end;

  [ParameterInBody]
  [POST]
  IServiceParams = interface(IInvokable)
    ['{CF2BB234-0D53-49FB-979D-650DCEF196F2}']
    [ParameterInBody]
    procedure ParameterInBody(Param: Integer);
    [ParameterInQuery]
    procedure ParameterInQuery(Param: Integer);
    [ParameterInPath]
    procedure ParameterInPath(Param1, Param2: Integer);
    [ParameterInQuery]
    procedure ParameterWithBodyAttribute([ParameterInBody]Param: String);
    [ParameterInBody]
    procedure ParameterWithQueryAttribute([ParameterInQuery]Param: String);
    [ParameterInQuery]
    procedure ParamWithPathAttribute([ParameterInPath]Param: String);
    procedure ProcedureWithMixParamTypeAttribute([ParameterInQuery]Param1, [ParameterInBody]Param2, [ParameterInPath]Param3: Integer);
    procedure ProcedureWithOutAttribute(Param: Integer);
  end;

  IServiceParamsType = interface(IInvokable)
    ['{AC1EF798-4269-4887-B7DF-0D6C3132C3FA}']
    [DELETE]
    procedure TestDELETE(Param: Integer);
    [GET]
    procedure TestGET(Param: Integer);
    [PATCH]
    procedure TestPATCH(Param: Integer);
    [POST]
    procedure TestPOST(Param: Integer);
    [PUT]
    procedure TestPUT(Param: Integer);
  end;

  [RemoteName('AnotherName')]
  IServiceNamed = interface(IInvokable)
    ['{2193F044-762D-4B81-BED2-50EEBD7D172F}']
    procedure Proc;
    [RemoteName('ProcedureWithAnotherName')]
    procedure WithName;
  end;

  IServiceDownload = interface(IInvokable)
    ['{297F3A0A-3B47-4FD6-ACED-6E4114E9B1A0}']
    [Attachment('FileName.txt', 'text/plain')]
    function Download: String;
  end;

implementation

uses System.SysUtils, System.Classes, Blue.Print.Serializer, Web.ReqFiles;

{ TRemoteServiceTest }

procedure TRemoteServiceTest.AfterLoadingTheRequestMustSendTheRequestToServer;
begin
  var Service := GetRemoteService<IServiceNamed>(EmptyStr);

  Service.Proc;

  Assert.IsTrue(FCommunication.RequestSended);
end;

function TRemoteServiceTest.CreateRemoteService<T>: TRemoteService;
begin
  Result := TRemoteService.Create(TypeInfo(T));
  Result.Communication := FCommunication;
end;

function TRemoteServiceTest.GetRemoteService<T>(const URL: String): T;
begin
  Result := CreateRemoteService<T>.GetService<T>(URL);
end;

procedure TRemoteServiceTest.IfTheParameterHasTheBodyParameterTypeAttributeMustSendTheRequestRespectingThisType;
begin
//  var Communication := CreateMockCommunication;
//  var Request := CreateRequest(rmPost, '/ServiceParams/ParameterWithBodyAttribute');
//  var Service := CreateRemoteService<IServiceParams>(Communication.Instance) as IServiceParams;
//
//  Communication.Setup.WillExecute(
//    procedure(const Params: TArray<TValue>)
//    begin
//      var Request := Params[1].AsType<TRestRequest>;
//
//      Assert.AreEqual('abc', Request.Body.AsString);
//    end).When.SendRequest(It.IsAny<TRestRequest>);
//
//  Service.ParameterWithBodyAttribute('abc');
//
//  Request.Free;
end;

procedure TRemoteServiceTest.IfTheParameterHasThePathParameterTypeAttributeMustSendTheRequestRespectingThisType;
begin
//  var Communication := CreateMockCommunication;
//  var Request := CreateRequest(rmPost, '/ServiceParams/ParamWithPathAttribute/abc');
//  var Service := CreateRemoteService<IServiceParams>(Communication.Instance) as IServiceParams;
//
//  Communication.Expect.Once.When.SendRequest(It.SameFields(Request));
//
//  Service.ParamWithPathAttribute('abc');
//
//  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);
//
//  Request.Free;
end;

procedure TRemoteServiceTest.IfTheParameterHasTheQueryParameterTypeAttributeMustSendTheRequestRespectingThisType;
begin
//  var Communication := CreateMockCommunication;
//  var Request := CreateRequest(rmPost, '/ServiceParams/ParameterWithQueryAttribute?Param=abc');
//  var Service := CreateRemoteService<IServiceParams>(Communication.Instance) as IServiceParams;
//
//  Communication.Expect.Once.When.SendRequest(It.SameFields(Request));
//
//  Service.ParameterWithQueryAttribute('abc');
//
//  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);
//
//  Request.Free;
end;

procedure TRemoteServiceTest.IfTheProcedureHasAFileTheRequestMethodMustBePost;
begin
//  var Communication := CreateMockCommunication;
//  var Context := TRttiContext.Create;
//  var Request := CreateRequest(rmPost, '/ServiceTest/TestProcedureFileInParam');
//  var RttiType := Context.GetType(TypeInfo(IServiceTest));
//  var Service := CreateRemoteService(Communication.Instance) as IServiceTest;
//
//  Communication.Expect.Once.When.SendRequest(It.SameFields(Request));
//
//  RttiType.GetMethod('TestProcedureFileInParam').Invoke(TValue.From(Service), [nil]);
//
//  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);
//
//  Request.Free;
end;

procedure TRemoteServiceTest.IfTheProcedureHasAnArrayOfFilesTheRequestMethodMustBePost;
begin
//  var Communication := CreateMockCommunication;
//  var Context := TRttiContext.Create;
//  var Request := CreateRequest(rmPost, '/ServiceTest/TestProcedureArrayFileInParam');
//  var RttiType := Context.GetType(TypeInfo(IServiceTest));
//  var Service := CreateRemoteService(Communication.Instance) as IServiceTest;
//
//  Communication.Expect.Once.When.SendRequest(It.SameFields(Request));
//
//  RttiType.GetMethod('TestProcedureArrayFileInParam').Invoke(TValue.From(Service), [nil]);
//
//  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);
//
//  Request.Free;
end;

procedure TRemoteServiceTest.IfTheProcedureHasntAnAttributeAboutParamMustSendTheParamByTheTypeOfCommand(Method: TRequestMethod; ParameterInQuery: Boolean);
begin
//  var Communication := CreateMockCommunication;
//  var Context := TRttiContext.Create;
//  var MethodName := 'Test' + RESTRequestMethodToString(Method);
//  var ParamValue := '123456';
//  var Request := CreateRequest(Method, '/ServiceParamsType/' + MethodName);
//  var RttiType := Context.GetType(TypeInfo(IServiceParamsType));
//  var Service := CreateRemoteService<IServiceParamsType>(Communication.Instance) as IServiceParamsType;
//
//  if ParameterInQuery then
//    Request.URL := Request.URL + '?Param=' + ParamValue
//  else
//    Request.Body := ParamValue;
//
//  Communication.Expect.Once.When.SendRequest(It.SameFields(Request));
//
//  RttiType.GetMethod(MethodName).Invoke(TValue.From(Service), [123456]);
//
//  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);
//
//  Request.Free;
end;

procedure TRemoteServiceTest.SendingARequestWithOneParamMustPutTheParamSeparatorInTheURLAndTheNameAndValueParam;
begin
//  var Communication := CreateMockCommunication;
//  var Request := CreateRequest('/ServiceTest/TestProcedureWithOneParam?Param=abcd');
//  var Service := CreateRemoteService(Communication.Instance) as IServiceTest;
//
//  Communication.Expect.Once.When.SendRequest(It.SameFields(Request));
//
//  Service.TestProcedureWithOneParam('abcd');
//
//  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);
//
//  Request.Free;
end;

procedure TRemoteServiceTest.Setup;
begin
  FCommunication := TCommunicationMock.Create;
  FCommunicationInterface := FCommunication;
end;

procedure TRemoteServiceTest.TearDown;
begin
  FCommunicationInterface := nil;
end;

procedure TRemoteServiceTest.TheHeadersFilledMustBeLoadedInTheCommunicationInterface;
begin
//  var Communication := TMock.CreateInterface<IRestCommunication>;
//  var Request := CreateRequest('/ServiceTest/TestProcedureWithOneParam?Param=abcd');
//  Request.Headers := 'My Header=abc'#13#10;
//
//  var Client := CreateRemoteService(Communication.Instance);
//  var Service := Client as IServiceTest;
//
//  Communication.Expect.Once.When.SendRequest(It.SameFields(Request));
//
//  Client.Header['My Header'] := 'abc';
//
//  Service.TestProcedureWithOneParam('abcd');
//
//  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);
//
//  Request.Free;
end;

procedure TRemoteServiceTest.TheParamsOfAProcedureMustBeSentInFormDataObjectAsExpected;
begin
//  var Communication := CreateMockCommunication;
//  var Service := CreateRemoteService(Communication.Instance) as IServiceTest;
//
//  Communication.Setup.WillExecute(
//    procedure(const Params: TArray<TValue>)
//    begin
//      var FormValue :=
//        '--%0:s'#13#10 +
//        'Content-Disposition: form-data; name="Param1"'#13#10 +
//        #13#10 +
//        'abc'#13#10 +
//        '--%0:s'#13#10 +
//        'Content-Disposition: form-data; name="Param2"'#13#10 +
//        #13#10 +
//        '123'#13#10 +
//        '--%0:s--'#13#10;
//
//      var Request := Params[1].AsType<TRestRequest>;
//
//      var FormData := Request.Body.AsType<TRESTFormData>;
//
//      Assert.AreEqual(Format(FormValue, [FormData.Boundary]), GetFormDataValue(FormData));
//    end).When.SendRequest(It.IsAny<TRestRequest>);
//
//  Service.TestProcedureWithParameterInBody('abc', 123);
end;

procedure TRemoteServiceTest.TheRequestMethodMustBeTheSameOfTheAttributeOfTheMethod(const MethodName: String; const RequestType: TRequestMethod);
begin
  var Context := TRttiContext.Create;
  var Service := GetRemoteService<IServiceTest>(EmptyStr);

  Context.GetType(TypeInfo(IServiceTest)).GetMethod(MethodName).Invoke(TValue.From(Service), []);

  Assert.AreEqual(RequestType, FCommunication.RequestMethod);

  Context.Free;
end;

procedure TRemoteServiceTest.WhenCallAFunctionMustConvertTheFunctionParamsInTheGetURL;
begin
//  var Communication := CreateMockCommunication;
//  var Request := CreateRequest('/ServiceTest/TestProcedureWithParam?Param1=abc&Param2=123');
//  var Service := CreateRemoteService(Communication.Instance) as IServiceTest;
//
//  Communication.Expect.Once.When.SendRequest(It.SameFields(Request));
//
//  Service.TestProcedureWithParam('abc', 123);
//
//  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);
//
//  Request.Free;
end;

procedure TRemoteServiceTest.WhenCallAFunctionMustReturnTheValueOfFunctionAsSpected;
begin
//  var Communication := CreateMockCommunication;
//  var Request := CreateRequest('/ServiceTest/TestFunction');
//  var Service := CreateRemoteService(Communication.Instance) as IServiceTest;
//
//  Communication.Setup.WillReturn('8888').When.SendRequest(It.SameFields(Request));
//
//  Assert.AreEqual(8888, Service.TestFunction);
//
//  Request.Free;
end;

procedure TRemoteServiceTest.WhenCallARemoteServiceMustBuildTheURLAsExpected;
begin
  var Service := GetRemoteService<IServiceTest>('http://myurl.com/myapi');

  Service.TestProcedure;

  Assert.AreEqual('http://myurl.com/myapi/ServiceTest/TestProcedure', FCommunication.URL);
end;

procedure TRemoteServiceTest.WhenCallSendRequestMustSendABodyInParams;
begin
//  var Communication := CreateMockCommunication;
//  var Request := CreateRequest('/ServiceTest/TestProcedureWithParam?Param1=String&Param2=1234');
//  var Service := CreateRemoteService(Communication.Instance) as IServiceTest;
//
//  Communication.Expect.Once.When.SendRequest(It.SameFields(Request));
//
//  Service.TestProcedureWithParam('String', 1234);
//
//  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);
//
//  Request.Free;
end;

procedure TRemoteServiceTest.WhenCreateServiceMustReturnTheInterfaceFilled;
begin
  var Value := TRemoteService.CreateService<IServiceAutenticationTest>(EmptyStr);

  Assert.IsNotNull(Value);
end;

procedure TRemoteServiceTest.WhenDownloadAFileCantRaiseAnyErrorInTheExecution;
begin
//  var Communication := CreateMockCommunication;
//  var Service := CreateRemoteService<IServiceDownload>(Communication.Instance) as IServiceDownload;
//
//  Assert.WillNotRaise(
//    procedure
//    begin
//      Service.Download;
//    end);
end;

procedure TRemoteServiceTest.WhenDownloadingAFileMustCallTheRemoteService;
begin
//  var Communication := CreateMockCommunication;
//  var Service := CreateRemoteService<IServiceDownload>(Communication.Instance) as IServiceDownload;
//
//  Communication.Expect.Once.When.SendRequest(It.IsAny<TRestRequest>);
//
//  Service.Download;
//
//  Assert.CheckExpectation(Communication.CheckExpectations);
end;

procedure TRemoteServiceTest.WhenFillingAHeaderHasToReturnTheValuesInTheHeadersProperty;
begin
//  var Client := TRemoteService.Create(TypeInfo(IServiceTest));
//
//  Client.Header['My Header'] := 'My Value';
//
//  Assert.AreEqual('My Header=My Value'#13#10, Client.Headers);
//
//  Client.Free;
end;

procedure TRemoteServiceTest.WhenFillingThePropertyHeadersHaveToFillThePropertyHeaderWithTheParameterValuesPassed;
begin
//  var Client := TRemoteService.Create(TypeInfo(IServiceTest));
//
//  Client.Headers := 'My Header=My Value'#13#10'My Header2=My Value';
//
//  Assert.AreEqual('My Value', Client.Header['My Header']);
//
//  Assert.AreEqual('My Value', Client.Header['My Header2']);
//
//  Client.Free;
end;

procedure TRemoteServiceTest.WhenGetServiceMustReturnTheInterfaceFilled;
begin
  var Value := CreateRemoteService<IServiceAutenticationTest>.GetService<IServiceAutenticationTest>(EmptyStr);

  Assert.IsNotNull(Value);
end;

procedure TRemoteServiceTest.WhenMixTheParameterTypeAttributeMustLoadTheRequestHasExpected;
begin
//  var Communication := CreateMockCommunication;
//  var Request := CreateRequest(rmPost, '/ServiceParams/ProcedureWithMixParamTypeAttribute/789?Param1=123');
//  var Service := CreateRemoteService<IServiceParams>(Communication.Instance) as IServiceParams;
//
//  Communication.Setup.WillExecute(
//    procedure(const Params: TArray<TValue>)
//    begin
//      var Request := Params[1].AsType<TRestRequest>;
//
//      Assert.AreEqual('/ServiceParams/ProcedureWithMixParamTypeAttribute/789?Param1=123', Request.URL);
//      Assert.AreEqual('456', Request.Body.AsString);
//    end).When.SendRequest(It.IsAny<TRestRequest>);
//
//  Service.ProcedureWithMixParamTypeAttribute(123, 456, 789);
//
//  Request.Free;
end;

procedure TRemoteServiceTest.WhenSendAnFileAndTheFileIsNotFilledCantRaiseAnyError;
begin
//  var Communication := CreateMockCommunication;
//  var Service := CreateRemoteService(Communication.Instance) as IServiceTest;
//
//  Communication.Expect.Once.When.SendRequest(It.IsAny<TRestRequest>);
//
//  Assert.WillNotRaise(
//    procedure
//    begin
//      Service.TestProcedureWithFileAndParams(12345, nil, 'My File');
//    end);
end;

procedure TRemoteServiceTest.WhenSendARequestMoreThenOneTimeMustResetTheRequestBody;
begin
//  var Communication := CreateMockCommunication;
//  var MyFile := CreateRequestFile;
//  var Service := CreateRemoteService(Communication.Instance) as IServiceTest;
//
//  Communication.Setup.WillExecute(
//    procedure (const Params: TArray<TValue>)
//    begin
//      var FormValue :=
//        '--%0:s'#13#10 +
//        'Content-Disposition: form-data; name="MyFile1"; filename="My File.png"'#13#10 +
//        'Content-Type: image/png'#13#10 +
//        #13#10 +
//        'This is my file!'#13#10 +
//        '--%0:s'#13#10 +
//        'Content-Disposition: form-data; name="MyFile2"; filename="My File.png"'#13#10 +
//        'Content-Type: image/png'#13#10 +
//        #13#10 +
//        'This is my file!'#13#10 +
//        '--%0:s--'#13#10;
//
//      var Request := Params[1].AsType<TRestRequest>;
//
//      var FormData := Request.Body.AsType<TRESTFormData>;
//
//      Assert.AreEqual(Format(FormValue, [FormData.Boundary]), GetFormDataValue(FormData));
//    end).When.SendRequest(It.IsAny<TRestRequest>);
//
//  Service.TestProceudreMoreThenOneFileParam(MyFile, 'Param', MyFile);
//
//  Service.TestProceudreMoreThenOneFileParam(MyFile, 'Param', MyFile);
//
//  MyFile.Free;
end;

procedure TRemoteServiceTest.WhenTheFunctionOfTheServiceHasTheAttachmentAttributeTheRequestMustMarkTheFileDownloadField;
begin
//  var Communication := CreateMockCommunication;
//  var Service := CreateRemoteService<IServiceDownload>(Communication.Instance) as IServiceDownload;
//
//  Communication.Setup.WillExecute(
//    procedure (const Params: TArray<TValue>)
//    begin
//      var Request := Params[1].AsType<TRestRequest>;
//
//      Assert.IsTrue(Request.FileDownload);
//    end).When.SendRequest(It.IsAny<TRestRequest>);
//
//  Service.Download;
end;

procedure TRemoteServiceTest.WhenTheHeaderIsLoadedTheAuthenticationMustBeAppendedToTheHeaders;
begin
//  var Communication := CreateMockCommunication;
//  var Service := CreateRemoteService<IServiceAutenticationTest>(Communication.Instance);
//
//  Service.Header['My Header'] := 'abc';
//
//  Communication.Setup.WillExecute(
//    procedure (const Params: TArray<TValue>)
//    begin
//      var Request := Params[1].AsType<TRestRequest>;
//
//      Assert.AreEqual('My Header=abc'#13#10'Authorization=Basic VXNlcjpQYXNzd29yZA=='#13#10, Request.Headers);
//    end).When.SendRequest(It.IsAny<TRestRequest>);
//
//  (Service as IServiceAutenticationTest).Proc;
end;

procedure TRemoteServiceTest.WhenTheInterfaceHasTheRemoteNameMustSendThisNameInTheURLOfTheRequest;
begin
  var Service := GetRemoteService<IServiceNamed>(EmptyStr);

  Service.Proc;

  Assert.AreEqual('/AnotherName/Proc', FCommunication.URL);
end;

procedure TRemoteServiceTest.WhenTheMethodDontHaveARequestMethodAttributeAndTheInterfaceHasTheAttributeMustLoadTheRequestMethodFromTheInterface(const InterfaceName: String;
  const RequestType: TRequestMethod);
begin
  if InterfaceName = 'IServicePatch' then
  begin
    var Service := GetRemoteService<IServicePatch>(EmptyStr);

    Service.TestProcedure;
  end
  else
  begin
    var Service := GetRemoteService<IServiceAutenticationTest>(EmptyStr);

    Service.Proc;
  end;

  Assert.AreEqual(RequestType, FCommunication.RequestMethod);
end;

procedure TRemoteServiceTest.WhenTheMethodDontHaveARequestMethodAttributeTheDefaultMethodMustBePost;
begin
  var Service := GetRemoteService<IServiceTest>(EmptyStr);

  Service.TestProcedure;

  Assert.AreEqual(TRequestMethod.Post, FCommunication.RequestMethod);
end;

procedure TRemoteServiceTest.WhenTheMethodHasNoAttributesHaveToUseTheGetMethod;
begin
//  var Communication := CreateMockCommunication;
//  var Request := CreateRequest(rmGet, '/ServiceTest/TestProcedure');
//  var Service := CreateRemoteService(Communication.Instance) as IServiceTest;
//
//  Communication.Expect.Once.When.SendRequest(It.SameFields(Request));
//
//  Service.TestProcedure;
//
//  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);
//
//  Request.Free;
end;

procedure TRemoteServiceTest.WhenTheMethodHasNoAttributesOfParamDefinedMustGetTheAttributeFromInterface;
begin
//  var Communication := CreateMockCommunication;
//  var Request := CreateRequest(rmPost, '/ServiceParams/ProcedureWithOutAttribute', '123');
//  var Service := CreateRemoteService<IServiceParams>(Communication.Instance) as IServiceParams;
//
//  Communication.Expect.Once.When.SendRequest(It.SameFields(Request));
//
//  Service.ProcedureWithOutAttribute(123);
//
//  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);
//
//  Request.Free;
end;

procedure TRemoteServiceTest.WhenTheProcedureAsAFileMustLoadTheFormDataValueAsExpected;
begin
//  var Communication := CreateMockCommunication;
//  var MyFile := CreateRequestFile;
//  var Service := CreateRemoteService(Communication.Instance) as IServiceTest;
//
//  Communication.Setup.WillExecute(
//    procedure (const Params: TArray<TValue>)
//    begin
//      var FormValue :=
//        '--%0:s'#13#10 +
//        'Content-Disposition: form-data; name="MyParam"'#13#10 +
//        #13#10 +
//        'MyParam'#13#10 +
//        '--%0:s'#13#10 +
//        'Content-Disposition: form-data; name="MyFile"; filename="My File.png"'#13#10 +
//        'Content-Type: image/png'#13#10 +
//        #13#10 +
//        'This is my file!'#13#10 +
//        '--%0:s--'#13#10;
//
//      var Request := Params[1].AsType<TRestRequest>;
//
//      var FormData := Request.Body.AsType<TRESTFormData>;
//
//      Assert.AreEqual(Format(FormValue, [FormData.Boundary]), GetFormDataValue(FormData));
//    end).When.SendRequest(It.IsAny<TRestRequest>);
//
//  Service.TestProcedureFileAnParamInTheBody('MyParam', MyFile);
//
//  MyFile.Free;
end;

procedure TRemoteServiceTest.WhenTheProcedureAsAnArrayOfFilesMustAddTheFilesToFormDataAsExpected;
begin
//  var Communication := CreateMockCommunication;
//  var MyFile := CreateRequestFile;
//  var Service := CreateRemoteService(Communication.Instance) as IServiceTest;
//
//  Communication.Setup.WillExecute(
//    procedure (const Params: TArray<TValue>)
//    begin
//      var FormValue :=
//        '--%0:s'#13#10 +
//        'Content-Disposition: form-data; name="MyFiles"; filename="My File.png"'#13#10 +
//        'Content-Type: image/png'#13#10 +
//        #13#10 +
//        'This is my file!'#13#10 +
//        '--%0:s'#13#10 +
//        'Content-Disposition: form-data; name="MyFiles"; filename="My File.png"'#13#10 +
//        'Content-Type: image/png'#13#10 +
//        #13#10 +
//        'This is my file!'#13#10 +
//        '--%0:s'#13#10 +
//        'Content-Disposition: form-data; name="MyFiles"; filename="My File.png"'#13#10 +
//        'Content-Type: image/png'#13#10 +
//        #13#10 +
//        'This is my file!'#13#10 +
//        '--%0:s--'#13#10;
//
//      var Request := Params[1].AsType<TRestRequest>;
//
//      var FormData := Request.Body.AsType<TRESTFormData>;
//
//      Assert.AreEqual(Format(FormValue, [FormData.Boundary]), GetFormDataValue(FormData));
//    end).When.SendRequest(It.IsAny<TRestRequest>);
//
//  Service.TestProcedureWithArrayFiles([MyFile, MyFile, MyFile]);
//
//  MyFile.Free;
end;

procedure TRemoteServiceTest.WhenTheProcedureAsNameAttributeMustLoadTheURLWithTheNameInTheAttribute;
begin
//  var Communication := CreateMockCommunication;
//  var Request := CreateRequest('/AnotherName/AnotherName');
//  var Service := CreateRemoteService<IServiceNamed>(Communication.Instance) as IServiceNamed;
//
//  Communication.Expect.Once.When.SendRequest(It.SameFields(Request));
//
//  Service.WithName;
//
//  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);
//
//  Request.Free;
end;

procedure TRemoteServiceTest.WhenTheProcedureBeenCalledHasntParametersTheRequestBodyMustBeEmpty;
begin
//  var Communication := CreateMockCommunication;
//  var Request := CreateRequest('/ServiceTest/TestProcedure');
//  var Service := CreateRemoteService(Communication.Instance) as IServiceTest;
//
//  Request.Body := TValue.Empty;
//
//  Communication.Expect.Once.When.SendRequest(It.SameFields(Request));
//
//  Service.TestProcedure;
//
//  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);
//
//  Request.Free;
end;

procedure TRemoteServiceTest.WhenTheProcedureHasAParameterThatIsAFileMustSendTheFileInTheBodyOfTheRequest;
begin
//  var Communication := CreateMockCommunication;
//  var MyFile := CreateRequestFile;
//  var Request: TRestRequest := nil;
//  var Service := CreateRemoteService(Communication.Instance) as IServiceTest;
//
//  Communication.Setup.WillExecute(
//    procedure (const Params: TArray<TValue>)
//    begin
//      Request := Params[1].AsType<TRestRequest>;
//
//      Assert.AreEqual<TObject>(MyFile, Request.Body.AsObject);
//    end).When.SendRequest(It.IsAny<TRestRequest>);
//
//  Service.TestProcedureWithAnFile(MyFile);
//
//  MyFile.Free;
end;

procedure TRemoteServiceTest.WhenTheProcedureHasMoreThenOneParamAndSendingInTheBodyTheRequestMustLoadTheFormDataInTheBody;
begin
//  var Communication := CreateMockCommunication;
//  var Service := CreateRemoteService(Communication.Instance) as IServiceTest;
//
//  Communication.Setup.WillExecute(
//    procedure (const Params: TArray<TValue>)
//    begin
//      var Request := Params[1].AsType<TRestRequest>;
//
//      Assert.IsTrue(Request.Body.IsType<TRESTFormData>);
//    end).When.SendRequest(It.IsAny<TRestRequest>);
//
//  Service.TestProcedureWithParameterInBody('abc', 123);
end;

procedure TRemoteServiceTest.WhenTheProcedureHasMoreThenOneParamFileParamMustSendTheFilesInTheBodyOfTheRequest;
begin
//  var Communication := CreateMockCommunication;
//  var MyFile := CreateRequestFile;
//  var Service := CreateRemoteService(Communication.Instance) as IServiceTest;
//
//  Communication.Setup.WillExecute(
//    procedure (const Params: TArray<TValue>)
//    begin
//      var FormValue :=
//        '--%0:s'#13#10 +
//        'Content-Disposition: form-data; name="MyFile1"; filename="My File.png"'#13#10 +
//        'Content-Type: image/png'#13#10 +
//        #13#10 +
//        'This is my file!'#13#10 +
//        '--%0:s'#13#10 +
//        'Content-Disposition: form-data; name="MyFile2"; filename="My File.png"'#13#10 +
//        'Content-Type: image/png'#13#10 +
//        #13#10 +
//        'This is my file!'#13#10 +
//        '--%0:s--'#13#10;
//
//      var Request := Params[1].AsType<TRestRequest>;
//
//      var FormData := Request.Body.AsType<TRESTFormData>;
//
//      Assert.AreEqual(Format(FormValue, [FormData.Boundary]), GetFormDataValue(FormData));
//    end).When.SendRequest(It.IsAny<TRestRequest>);
//
//  Service.TestProceudreMoreThenOneFileParam(MyFile, 'Param', MyFile);
//
//  MyFile.Free;
end;

procedure TRemoteServiceTest.WhenTheProcedureHasTheParameterInBodyAttributeMustSendTheParamsInTheBodyOfTheRequest;
begin
//  var Communication := CreateMockCommunication;
//  var Request := CreateRequest(rmPost, '/ServiceParams/ParameterInBody', '1234');
//  var Service := CreateRemoteService<IServiceParams>(Communication.Instance) as IServiceParams;
//
//  Communication.Expect.Once.When.SendRequest(It.SameFields(Request));
//
//  Service.ParameterInBody(1234);
//
//  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);
//
//  Request.Free;
end;

procedure TRemoteServiceTest.WhenTheProcedureHasTheParameterInPathAttributeMustSendTheParamsInTheURLPathOfTheRequest;
begin
//  var Communication := CreateMockCommunication;
//  var Request := CreateRequest(rmPost, '/ServiceParams/ParameterInPath/123/456');
//  var Service := CreateRemoteService<IServiceParams>(Communication.Instance) as IServiceParams;
//
//  Communication.Expect.Once.When.SendRequest(It.SameFields(Request));
//
//  Service.ParameterInPath(123, 456);
//
//  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);
//
//  Request.Free;
end;

procedure TRemoteServiceTest.WhenTheProcedureHasTheParameterInQueryAttributeMustSendTheParamsInTheURLOfTheRequest;
begin
//  var Communication := CreateMockCommunication;
//  var Request := CreateRequest(rmPost, '/ServiceParams/ParameterInQuery?Param=1234');
//  var Service := CreateRemoteService<IServiceParams>(Communication.Instance) as IServiceParams;
//
//  Communication.Expect.Once.When.SendRequest(It.SameFields(Request));
//
//  Service.ParameterInQuery(1234);
//
//  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);
//
//  Request.Free;
end;

procedure TRemoteServiceTest.WhenTheProcedureHasTheRemoteNameAttributeMustSendThisNameInTheURLOfThRequest;
begin
  var Service := GetRemoteService<IServiceNamed>(EmptyStr);

  Service.WithName;

  Assert.AreEqual('/AnotherName/ProcedureWithAnotherName', FCommunication.URL);
end;

procedure TRemoteServiceTest.WhenTheProcedureIsToSendTheParamsInURLAndHaveAnArrayOfFileParamMustSendTheParamInTheBody;
begin
//  var Communication := CreateMockCommunication;
//  var MyFile := CreateRequestFile;
//  var Service := CreateRemoteService(Communication.Instance) as IServiceTest;
//
//  Communication.Setup.WillExecute(
//    procedure (const Params: TArray<TValue>)
//    begin
//      var FormValue :=
//        '--%0:s'#13#10 +
//        'Content-Disposition: form-data; name="MyFiles"; filename="My File.png"'#13#10 +
//        'Content-Type: image/png'#13#10 +
//        #13#10 +
//        'This is my file!'#13#10 +
//        '--%0:s'#13#10 +
//        'Content-Disposition: form-data; name="MyFiles"; filename="My File.png"'#13#10 +
//        'Content-Type: image/png'#13#10 +
//        #13#10 +
//        'This is my file!'#13#10 +
//        '--%0:s'#13#10 +
//        'Content-Disposition: form-data; name="MyFiles"; filename="My File.png"'#13#10 +
//        'Content-Type: image/png'#13#10 +
//        #13#10 +
//        'This is my file!'#13#10 +
//        '--%0:s--'#13#10;
//
//      var Request := Params[1].AsType<TRestRequest>;
//
//      var FormData := Request.Body.AsType<TRESTFormData>;
//
//      Assert.AreEqual(Format(FormValue, [FormData.Boundary]), GetFormDataValue(FormData));
//    end).When.SendRequest(It.IsAny<TRestRequest>);
//
//  Service.TestProcedureWithArrayFilesInURL([MyFile, MyFile, MyFile]);
//
//  MyFile.Free;
end;

procedure TRemoteServiceTest.WhenTheProcedureSendAFileInTheBodyMustLoadTheFileInTheBody;
begin
//  var Communication := CreateMockCommunication;
//  var MyFile := CreateRequestFile;
//  var Request: TRestRequest := nil;
//  var Service := CreateRemoteService(Communication.Instance) as IServiceTest;
//
//  Communication.Setup.WillExecute(
//    procedure (const Params: TArray<TValue>)
//    begin
//      Request := Params[1].AsType<TRestRequest>;
//
//      Assert.AreEqual<TObject>(MyFile, Request.Body.AsObject);
//    end).When.SendRequest(It.IsAny<TRestRequest>);
//
//  Service.TestProcedureFileInTheBody(MyFile);
//
//  MyFile.Free;
end;

procedure TRemoteServiceTest.WhenThePropertyOnExceptionIsLoadedMustCallTheEventWhenRaiseAnErrorInTheSyncCall;
begin
//  var Communication := CreateMockCommunication;
//  var Request := CreateRequest('/ServiceTest/TestProcedureWithOneParam?Param=abcd');
//
//  var ExcetionCalled := False;
//  var Client := CreateRemoteService(Communication.Instance);
//  var Service := Client as IServiceTest;
//  Client.OnExecuteException :=
//    procedure (E: Exception; Serializer: ISerializer)
//    begin
//      ExcetionCalled := True;
//    end;
//
//  Communication.Setup.WillExecute(
//    procedure
//    begin
//      raise Exception.Create('Error Message');
//    end).When.SendRequest(It.SameFields(Request));
//
//  try
//    Service.TestProcedureWithOneParam('abcd');
//  except
//  end;
//
//  Assert.IsTrue(ExcetionCalled);
//
//  Request.Free;
end;

procedure TRemoteServiceTest.WhenThePropertyOnExceptionIsNotLoadedMustCallTheEventWhenRaiseAnErrorInTheSyncCall;
begin
//  var Communication := CreateMockCommunication;
//  var Request := CreateRequest('/ServiceTest/TestProcedureWithOneParam?Param=abcd');
//  var Service := CreateRemoteService(Communication.Instance) as IServiceTest;
//
//  Communication.Setup.WillExecute(
//    procedure
//    begin
//      raise Exception.Create('Error Message');
//    end).When.SendRequest(It.SameFields(Request));
//
//  Assert.WillRaise(
//    procedure
//    begin
//      Service.TestProcedureWithOneParam('abcd');
//    end);
//
//  Request.Free;
end;

procedure TRemoteServiceTest.WhenTheRemoteNameAttributeIsPresentMustChangeTheRemoteNameInTheRequest;
begin
//  var Communication := CreateMockCommunication;
//  var Request := CreateRequest('/AnotherName/Proc');
//  var Service := CreateRemoteService<IServiceNamed>(Communication.Instance) as IServiceNamed;
//
//  Communication.Expect.Once.When.SendRequest(It.SameFields(Request));
//
//  Service.Proc;
//
//  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);
//
//  Request.Free;
end;

procedure TRemoteServiceTest.WhenTheRequestHasMoreThenOneParameterMustSepareteThenWithTheSeparetorChar;
begin
//  var Communication := CreateMockCommunication;
//  var Request := CreateRequest('/ServiceTest/TestProcedureWithParam?Param1=abcd&Param2=1234');
//  var Service := CreateRemoteService(Communication.Instance) as IServiceTest;
//
//  Communication.Expect.Once.When.SendRequest(It.SameFields(Request));
//
//  Service.TestProcedureWithParam('abcd', 1234);
//
//  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);
//
//  Request.Free;
end;

procedure TRemoteServiceTest.WhenTheServiceHasABasicAuthenticationAttributeMustSendTheAuthenticationHeaderInTheRequest;
begin
//  var Communication := CreateMockCommunication;
//  var Service := CreateRemoteService<IServiceAutenticationTest>(Communication.Instance) as IServiceAutenticationTest;
//
//  Communication.Setup.WillExecute(
//    procedure (const Params: TArray<TValue>)
//    begin
//      var Request := Params[1].AsType<TRestRequest>;
//
//      Assert.AreEqual('Authorization=Basic VXNlcjpQYXNzd29yZA=='#13#10, Request.Headers);
//    end).When.SendRequest(It.IsAny<TRestRequest>);
//
//  Service.Proc;
end;

{ TCommunicationMock }

function TCommunicationMock.SendRequest: String;
begin
  RequestSended := True;
end;

procedure TCommunicationMock.SetHeader(const Name, Value: String);
begin

end;

procedure TCommunicationMock.SetRequestMethod(const Value: TRequestMethod);
begin
  FRequestMethod := Value;
end;

procedure TCommunicationMock.SetURL(const Value: String);
begin
  FURL := Value;
end;

end.

