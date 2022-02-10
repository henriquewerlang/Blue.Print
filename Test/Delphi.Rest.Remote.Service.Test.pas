unit Delphi.Rest.Remote.Service.Test;

interface

uses DUnitX.TestFramework, System.Rtti, Delphi.Rest.Remote.Service, Delphi.Mock, Delphi.Mock.Intf, Delphi.Rest.Types;

type
  [TestFixture]
  TRemoteServiceTest = class
  private
    function CreateMockCommunication: IMock<IRestCommunication>;
    function CreateRequest(const URL: String): TRestRequest; overload;
    function CreateRequest(Method: TRESTMethod; const URL: String): TRestRequest; overload;
    function CreateRequest(Method: TRESTMethod; const URL, Body: String): TRestRequest; overload;
    function CreateRequest(Method: TRESTMethod; const URL: String; Body: TValue): TRestRequest; overload;
    function CreateRemoteService(const Communication: IRestCommunication): TRemoteService; overload;
    function CreateRemoteService<T: IInterface>(const Communication: IRestCommunication): TRemoteService; overload;
    function CreateRemoteServiceURL(const URL: String; const Communication: IRestCommunication): TRemoteService; overload;
    function CreateRemoteServiceURL<T: IInterface>(const URL: String; const Communication: IRestCommunication): TRemoteService; overload;
    function GetFormDataValue(FormData: TRESTFormData): String;
    function CreateRequestFile: TRESTFile;

    procedure RegisterLeak<T: IInterface>;
  public
    [SetupFixture]
    procedure SetupFixture;
    [Test]
    procedure WhenCallTheProcedureMustGenerateTheRequestForServer;
    [Test]
    procedure TheURLOfServerCallMustContainTheNameOfInterfacePlusTheProcedureName;
    [Test]
    procedure WhenCallSendRequestMustSendABodyInParams;
    [Test]
    procedure TheURLPassedInConstructorMustContatWithTheRequestURL;
    [Test]
    procedure WhenCallAFunctionMustReturnTheValueOfFunctionAsSpected;
    [Test]
    procedure WhenCallAFunctionMustConvertTheFunctionParamsInTheGetURL;
    [Test]
    procedure SendingARequestWithoutParamsMustLoadTheURLWithoutParamSeparator;
    [Test]
    procedure SendingARequestWithOneParamMustPutTheParamSeparatorInTheURLAndTheNameAndValueParam;
    [Test]
    procedure WhenTheRequestHasMoreThenOneParameterMustSepareteThenWithTheSeparetorChar;
    [Test]
    procedure WhenThePropertyOnExceptionIsLoadedMustCallTheEventWhenRaiseAnErrorInTheSyncCall;
    [Test]
    procedure WhenThePropertyOnExceptionIsNotLoadedMustCallTheEventWhenRaiseAnErrorInTheSyncCall;
    [Test]
    procedure TheFilledHeadersMustKeepTheValues;
    [Test]
    procedure WhenFillingAHeaderHasToReturnTheValuesInTheHeadersProperty;
    [Test]
    procedure TheHeadersFilledMustBeLoadedInTheCommunicationInterface;
    [Test]
    procedure WhenFillingThePropertyHeadersHaveToFillThePropertyHeaderWithTheParameterValuesPassed;
    [TestCase('DELETE', 'rmDelete')]
    [TestCase('GET', 'rmGet')]
    [TestCase('PATCH', 'rmPatch')]
    [TestCase('POST', 'rmPost')]
    [TestCase('PUT', 'rmPut')]
    procedure TheHTTPMethodMustFollowTheAnotationOfTheProcedure(MethodToCompare: TRESTMethod);
    [Test]
    procedure WhenTheMethodHasNoAttributesHaveToUseTheGetMethod;
    [Test]
    procedure WhenTheMethodHasMustGetTheAttributeFromTheInterface;
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
    procedure IfTheProcedureHasntAnAttributeAboutParamMustSendTheParamByTheTypeOfCommand(Method: TRESTMethod; ParameterInQuery: Boolean);
    [Test]
    procedure WhenTheMethodHasNoAttributesOfParamDefinedMustGetTheAttributeFromInterface;
    [Test]
    procedure WhenTheProcedureBeenCalledHasntParametersTheRequestBodyMustBeEmpty;
    [Test]
    procedure WhenTheProcedureHasAParameterThatIsAFileMustSendTheFileInTheBodyOfTheRequest;
    [Test]
    procedure WhenTheProcedureAsParamsWithFilesTheRequestParamSeparatorMustBeBuildCorrectly;
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
  end;

  [BasicAuthentication('User', 'Password')]
  IServiceAutenticationTest = interface(IInvokable)
    ['{C99C50FD-92DF-42FB-A928-5C7BF1566C6F}']
    procedure Proc;
  end;

  IServiceTest = interface(IInvokable)
    ['{61DCD8A8-AD02-4EA3-AFC7-8425F7B12D6B}']
    function TestFunction: Integer;

    [DELETE]
    procedure TestDelete;
    [GET]
    procedure TestGet;
    [PATCH]
    procedure TestPatch;
    [POST]
    procedure TestPost;
    [PUT]
    procedure TestPut;
    procedure TestProcedure;
    procedure TestProcedureWithOneParam(Param: String);
    procedure TestProcedureWithParam(Param1: String; Param2: Integer);
    [ParameterInBody]
    procedure TestProcedureWithParameterInBody(Param1: String; Param2: Integer);
    procedure TestProcedureWithAnFile(MyFile: TRESTFile);
    procedure TestProcedureWithFileAndParams(MayParam: Integer; MyFile: TRESTFile; AnotherParam: String);
    [ParameterInBody]
    procedure TestProcedureFileInTheBody(MyFile: TRESTFile);
    [ParameterInBody]
    procedure TestProcedureFileAnParamInTheBody(MyParam: String; MyFile: TRESTFile);
    [ParameterInBody]
    procedure TestProcedureWithArrayFiles(MyFiles: TArray<TRESTFile>);
    procedure TestProcedureWithArrayFilesInURL(MyFiles: TArray<TRESTFile>);
    procedure TestProceudreMoreThenOneFileParam(MyFile1: TRESTFile; AnParam: String; MyFile2: TRESTFile);
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
    procedure TestDelete(Param: Integer);
    [GET]
    procedure TestGet(Param: Integer);
    [PATCH]
    procedure TestPatch(Param: Integer);
    [POST]
    procedure TestPost(Param: Integer);
    [PUT]
    procedure TestPut(Param: Integer);
  end;

  [RemoteName('AnotherName')]
  IServiceNamed = interface(IInvokable)
    ['{2193F044-762D-4B81-BED2-50EEBD7D172F}']
    procedure Proc;
    [RemoteName('AnotherName')]
    procedure WithName;
  end;

implementation

uses System.SysUtils, System.Classes, Delphi.Rest.JSON.Serializer, Delphi.Rest.JSON.Serializer.Intf, Web.ReqFiles;

{ TRemoteServiceTest }

function TRemoteServiceTest.CreateMockCommunication: IMock<IRestCommunication>;
begin
  Result := TMock.CreateInterface<IRestCommunication>;
end;

function TRemoteServiceTest.CreateRemoteService(const Communication: IRestCommunication): TRemoteService;
begin
  Result := CreateRemoteService<IServiceTest>(Communication);
end;

function TRemoteServiceTest.CreateRemoteService<T>(const Communication: IRestCommunication): TRemoteService;
begin
  Result := CreateRemoteServiceURL<T>(EmptyStr, Communication);
end;

function TRemoteServiceTest.CreateRemoteServiceURL(const URL: String; const Communication: IRestCommunication): TRemoteService;
begin
  Result := CreateRemoteServiceURL<IServiceTest>(URL, Communication);
end;

function TRemoteServiceTest.CreateRemoteServiceURL<T>(const URL: String; const Communication: IRestCommunication): TRemoteService;
begin
  Result := TRemoteServiceTyped<T>.Create;
  Result.Communication := Communication;
  Result.Serializer := TRestJsonSerializer.Create;
  Result.URL := URL;
end;

function TRemoteServiceTest.CreateRequest(Method: TRESTMethod; const URL: String): TRestRequest;
begin
  Result := CreateRequest(Method, URL, EmptyStr);
end;

function TRemoteServiceTest.CreateRequest(Method: TRESTMethod; const URL, Body: String): TRestRequest;
begin
  Result := CreateRequest(Method, URL, TValue.From(Body));

  if Body.IsEmpty then
    Result.Body := TValue.Empty;
end;

procedure TRemoteServiceTest.IfTheParameterHasTheBodyParameterTypeAttributeMustSendTheRequestRespectingThisType;
begin
  var Communication := CreateMockCommunication;
  var Request := CreateRequest(rmPost, '/ServiceParams/ParameterWithBodyAttribute');
  var Service := CreateRemoteService<IServiceParams>(Communication.Instance) as IServiceParams;

  Communication.Setup.WillExecute(
    procedure(const Params: TArray<TValue>)
    begin
      var Request := Params[1].AsType<TRestRequest>;

      Assert.AreEqual('"abc"', Request.Body.AsString);
    end).When.SendRequest(It.IsAny<TRestRequest>);

  Service.ParameterWithBodyAttribute('abc');

  Request.Free;
end;

procedure TRemoteServiceTest.IfTheParameterHasThePathParameterTypeAttributeMustSendTheRequestRespectingThisType;
begin
  var Communication := CreateMockCommunication;
  var Request := CreateRequest(rmPost, '/ServiceParams/ParamWithPathAttribute/abc');
  var Service := CreateRemoteService<IServiceParams>(Communication.Instance) as IServiceParams;

  Communication.Expect.Once.When.SendRequest(It.SameFields(Request));

  Service.ParamWithPathAttribute('abc');

  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);

  Request.Free;
end;

procedure TRemoteServiceTest.IfTheParameterHasTheQueryParameterTypeAttributeMustSendTheRequestRespectingThisType;
begin
  var Communication := CreateMockCommunication;
  var Request := CreateRequest(rmPost, '/ServiceParams/ParameterWithQueryAttribute?Param="abc"');
  var Service := CreateRemoteService<IServiceParams>(Communication.Instance) as IServiceParams;

  Communication.Expect.Once.When.SendRequest(It.SameFields(Request));

  Service.ParameterWithQueryAttribute('abc');

  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);

  Request.Free;
end;

procedure TRemoteServiceTest.IfTheProcedureHasntAnAttributeAboutParamMustSendTheParamByTheTypeOfCommand(Method: TRESTMethod; ParameterInQuery: Boolean);
const
  COMMAND_NAME: array[TRESTMethod] of String = ('Delete', 'Get', 'Patch', 'Post', 'Put');

begin
  var Communication := CreateMockCommunication;
  var Context := TRttiContext.Create;
  var MethodName := 'Test' + COMMAND_NAME[Method];
  var ParamValue := '123456';
  var Request := CreateRequest(Method, '/ServiceParamsType/' + MethodName);
  var RttiType := Context.GetType(TypeInfo(IServiceParamsType));
  var Service := CreateRemoteService<IServiceParamsType>(Communication.Instance) as IServiceParamsType;

  if ParameterInQuery then
    Request.URL := Request.URL + '?Param=' + ParamValue
  else
    Request.Body := ParamValue;

  Communication.Expect.Once.When.SendRequest(It.SameFields(Request));

  RttiType.GetMethod(MethodName).Invoke(TValue.From(Service), [123456]);

  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);

  Request.Free;
end;

function TRemoteServiceTest.CreateRequest(const URL: String): TRestRequest;
begin
  Result := CreateRequest(rmGet, URL);
end;

procedure TRemoteServiceTest.RegisterLeak<T>;
begin
  var RttiType := TRttiContext.Create.GetType(TypeInfo(T)) as TRttiInterfaceType;
  var Service: T;

  CreateRemoteService<T>(nil).QueryInterface(RttiType.GUID, Service);

  Service := nil;

  RttiType.GetAttributes;

  for var Method in RttiType.GetMethods do
  begin
    Method.GetAttributes;

    for var Parameter in Method.GetParameters do
      Parameter.GetAttributes;
  end;
end;

procedure TRemoteServiceTest.SendingARequestWithOneParamMustPutTheParamSeparatorInTheURLAndTheNameAndValueParam;
begin
  var Communication := CreateMockCommunication;
  var Request := CreateRequest('/ServiceTest/TestProcedureWithOneParam?Param="abcd"');
  var Service := CreateRemoteService(Communication.Instance) as IServiceTest;

  Communication.Expect.Once.When.SendRequest(It.SameFields(Request));

  Service.TestProcedureWithOneParam('abcd');

  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);

  Request.Free;
end;

procedure TRemoteServiceTest.SendingARequestWithoutParamsMustLoadTheURLWithoutParamSeparator;
begin
  var Communication := CreateMockCommunication;
  var Request := CreateRequest('/ServiceTest/TestProcedure');
  var Service := CreateRemoteService(Communication.Instance) as IServiceTest;

  Communication.Expect.Once.When.SendRequest(It.SameFields(Request));

  Service.TestProcedure;

  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);

  Request.Free;
end;

procedure TRemoteServiceTest.SetupFixture;
begin
  var Serializer := TRestJsonSerializer.Create as IRestJsonSerializer;

  Serializer.Serialize('abc');

  CreateMockCommunication;

  RegisterLeak<IServiceParams>;

  RegisterLeak<IServicePatch>;

  RegisterLeak<IServiceTest>;

  RegisterLeak<IServiceParamsType>;

  RegisterLeak<IServiceNamed>;
end;

procedure TRemoteServiceTest.TheFilledHeadersMustKeepTheValues;
begin
  var Client := TRemoteServiceTyped<IServiceTest>.Create;

  Client.Header['My Header'] := 'My Value';

  Assert.AreEqual('My Value', Client.Header['My Header']);

  Client.Free;
end;

procedure TRemoteServiceTest.TheHeadersFilledMustBeLoadedInTheCommunicationInterface;
begin
  var Communication := TMock.CreateInterface<IRestCommunication>;
  var Request := CreateRequest('/ServiceTest/TestProcedureWithOneParam?Param="abcd"');
  Request.Headers := 'My Header=abc'#13#10;

  var Client := CreateRemoteService(Communication.Instance);
  var Service := Client as IServiceTest;

  Communication.Expect.Once.When.SendRequest(It.SameFields(Request));

  Client.Header['My Header'] := 'abc';

  Service.TestProcedureWithOneParam('abcd');

  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);

  Request.Free;
end;

procedure TRemoteServiceTest.TheHTTPMethodMustFollowTheAnotationOfTheProcedure(MethodToCompare: TRESTMethod);
const
  COMMAND_NAME: array[TRESTMethod] of String = ('Delete', 'Get', 'Patch', 'Post', 'Put');

begin
  var Communication := CreateMockCommunication;
  var Context := TRttiContext.Create;
  var MethodName := 'Test' + COMMAND_NAME[MethodToCompare];
  var Request := CreateRequest(MethodToCompare, '/ServiceTest/' + MethodName);
  var RttiType := Context.GetType(TypeInfo(IServiceTest));
  var Service := CreateRemoteService(Communication.Instance) as IServiceTest;

  Communication.Expect.Once.When.SendRequest(It.SameFields(Request));

  RttiType.GetMethod(MethodName).Invoke(TValue.From(Service), []);

  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);

  Request.Free;
end;

procedure TRemoteServiceTest.TheParamsOfAProcedureMustBeSentInFormDataObjectAsExpected;
begin
  var Communication := CreateMockCommunication;
  var Service := CreateRemoteService(Communication.Instance) as IServiceTest;

  Communication.Setup.WillExecute(
    procedure(const Params: TArray<TValue>)
    begin
      var FormValue :=
        '--%0:s'#13#10 +
        'Content-Disposition: form-data; name="Param1"'#13#10 +
        #13#10 +
        '"abc"'#13#10 +
        '--%0:s'#13#10 +
        'Content-Disposition: form-data; name="Param2"'#13#10 +
        #13#10 +
        '123'#13#10 +
        '--%0:s--'#13#10;

      var Request := Params[1].AsType<TRestRequest>;

      var FormData := Request.Body.AsType<TRESTFormData>;

      Assert.AreEqual(Format(FormValue, [FormData.Boundary]), GetFormDataValue(FormData));
    end).When.SendRequest(It.IsAny<TRestRequest>);

  Service.TestProcedureWithParameterInBody('abc', 123);
end;

procedure TRemoteServiceTest.TheURLOfServerCallMustContainTheNameOfInterfacePlusTheProcedureName;
begin
  var Communication := CreateMockCommunication;
  var Request := CreateRequest('/ServiceTest/TestProcedure');
  var Service := CreateRemoteService(Communication.Instance) as IServiceTest;

  Communication.Expect.Once.When.SendRequest(It.SameFields(Request));

  Service.TestProcedure;

  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);

  Request.Free;
end;

procedure TRemoteServiceTest.TheURLPassedInConstructorMustContatWithTheRequestURL;
begin
  var Communication := CreateMockCommunication;
  var Request := CreateRequest(rmGet, 'http://myurl.com/ServiceTest/TestProcedure');
  var Service := CreateRemoteServiceURL('http://myurl.com', Communication.Instance) as IServiceTest;

  Communication.Expect.Once.When.SendRequest(It.SameFields(Request));

  Service.TestProcedure;

  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);

  Request.Free;
end;

procedure TRemoteServiceTest.WhenCallAFunctionMustConvertTheFunctionParamsInTheGetURL;
begin
  var Communication := CreateMockCommunication;
  var Request := CreateRequest('/ServiceTest/TestProcedureWithParam?Param1="abc"&Param2=123');
  var Service := CreateRemoteService(Communication.Instance) as IServiceTest;

  Communication.Expect.Once.When.SendRequest(It.SameFields(Request));

  Service.TestProcedureWithParam('abc', 123);

  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);

  Request.Free;
end;

procedure TRemoteServiceTest.WhenCallAFunctionMustReturnTheValueOfFunctionAsSpected;
begin
  var Communication := CreateMockCommunication;
  var Request := CreateRequest('/ServiceTest/TestFunction');
  var Service := CreateRemoteService(Communication.Instance) as IServiceTest;

  Communication.Setup.WillReturn('8888').When.SendRequest(It.SameFields(Request));

  Assert.AreEqual(8888, Service.TestFunction);

  Request.Free;
end;

procedure TRemoteServiceTest.WhenCallSendRequestMustSendABodyInParams;
begin
  var Communication := CreateMockCommunication;
  var Request := CreateRequest('/ServiceTest/TestProcedureWithParam?Param1="String"&Param2=1234');
  var Service := CreateRemoteService(Communication.Instance) as IServiceTest;

  Communication.Expect.Once.When.SendRequest(It.SameFields(Request));

  Service.TestProcedureWithParam('String', 1234);

  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);

  Request.Free;
end;

procedure TRemoteServiceTest.WhenCallTheProcedureMustGenerateTheRequestForServer;
begin
  var Communication := CreateMockCommunication;
  var Request := CreateRequest('/ServiceTest/TestProcedure');
  var Service := CreateRemoteService(Communication.Instance) as IServiceTest;

  Communication.Expect.Once.When.SendRequest(It.SameFields(Request));

  Service.TestProcedure;

  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);

  Request.Free;
end;

procedure TRemoteServiceTest.WhenFillingAHeaderHasToReturnTheValuesInTheHeadersProperty;
begin
  var Client := TRemoteServiceTyped<IServiceTest>.Create;

  Client.Header['My Header'] := 'My Value';

  Assert.AreEqual('My Header=My Value'#13#10, Client.Headers);

  Client.Free;
end;

procedure TRemoteServiceTest.WhenFillingThePropertyHeadersHaveToFillThePropertyHeaderWithTheParameterValuesPassed;
begin
  var Client := TRemoteServiceTyped<IServiceTest>.Create;

  Client.Headers := 'My Header=My Value'#13#10'My Header2=My Value';

  Assert.AreEqual('My Value', Client.Header['My Header']);

  Assert.AreEqual('My Value', Client.Header['My Header2']);

  Client.Free;
end;

procedure TRemoteServiceTest.WhenMixTheParameterTypeAttributeMustLoadTheRequestHasExpected;
begin
  var Communication := CreateMockCommunication;
  var Request := CreateRequest(rmPost, '/ServiceParams/ProcedureWithMixParamTypeAttribute/789?Param1=123');
  var Service := CreateRemoteService<IServiceParams>(Communication.Instance) as IServiceParams;

  Communication.Setup.WillExecute(
    procedure(const Params: TArray<TValue>)
    begin
      var Request := Params[1].AsType<TRestRequest>;

      Assert.AreEqual('/ServiceParams/ProcedureWithMixParamTypeAttribute/789?Param1=123', Request.URL);
      Assert.AreEqual('456', Request.Body.AsString);
    end).When.SendRequest(It.IsAny<TRestRequest>);

  Service.ProcedureWithMixParamTypeAttribute(123, 456, 789);

  Request.Free;
end;

procedure TRemoteServiceTest.WhenSendAnFileAndTheFileIsNotFilledCantRaiseAnyError;
begin
  var Communication := CreateMockCommunication;
  var Service := CreateRemoteService(Communication.Instance) as IServiceTest;

  Communication.Expect.Once.When.SendRequest(It.IsAny<TRestRequest>);

  Assert.WillNotRaise(
    procedure
    begin
      Service.TestProcedureWithFileAndParams(12345, nil, 'My File');
    end);
end;

procedure TRemoteServiceTest.WhenSendARequestMoreThenOneTimeMustResetTheRequestBody;
begin
  var Communication := CreateMockCommunication;
  var MyFile := CreateRequestFile;
  var Service := CreateRemoteService(Communication.Instance) as IServiceTest;

  Communication.Setup.WillExecute(
    procedure (const Params: TArray<TValue>)
    begin
      var FormValue :=
        '--%0:s'#13#10 +
        'Content-Disposition: form-data; name="MyFile1"; filename="My File.png"'#13#10 +
        'Content-Type: image/png'#13#10 +
        #13#10 +
        'This is my file!'#13#10 +
        '--%0:s'#13#10 +
        'Content-Disposition: form-data; name="MyFile2"; filename="My File.png"'#13#10 +
        'Content-Type: image/png'#13#10 +
        #13#10 +
        'This is my file!'#13#10 +
        '--%0:s--'#13#10;

      var Request := Params[1].AsType<TRestRequest>;

      var FormData := Request.Body.AsType<TRESTFormData>;

      Assert.AreEqual(Format(FormValue, [FormData.Boundary]), GetFormDataValue(FormData));
    end).When.SendRequest(It.IsAny<TRestRequest>);

  Service.TestProceudreMoreThenOneFileParam(MyFile, 'Param', MyFile);

  Service.TestProceudreMoreThenOneFileParam(MyFile, 'Param', MyFile);

  MyFile.Free;
end;

procedure TRemoteServiceTest.WhenTheHeaderIsLoadedTheAuthenticationMustBeAppendedToTheHeaders;
begin
  var Communication := CreateMockCommunication;
  var Service := CreateRemoteService<IServiceAutenticationTest>(Communication.Instance);

  Service.Header['My Header'] := 'abc';

  Communication.Setup.WillExecute(
    procedure (const Params: TArray<TValue>)
    begin
      var Request := Params[1].AsType<TRestRequest>;

      Assert.AreEqual('My Header=abc'#13#10'Authorization=Basic VXNlcjpQYXNzd29yZA=='#13#10, Request.Headers);
    end).When.SendRequest(It.IsAny<TRestRequest>);

  (Service as IServiceAutenticationTest).Proc;
end;

procedure TRemoteServiceTest.WhenTheMethodHasMustGetTheAttributeFromTheInterface;
begin
  var Communication := CreateMockCommunication;
  var Request := CreateRequest(rmPatch, '/ServicePatch/TestProcedure');
  var Service := CreateRemoteService<IServicePatch>(Communication.Instance) as IServicePatch;

  Communication.Expect.Once.When.SendRequest(It.SameFields(Request));

  Service.TestProcedure;

  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);

  Request.Free;
end;

procedure TRemoteServiceTest.WhenTheMethodHasNoAttributesHaveToUseTheGetMethod;
begin
  var Communication := CreateMockCommunication;
  var Request := CreateRequest(rmGet, '/ServiceTest/TestProcedure');
  var Service := CreateRemoteService(Communication.Instance) as IServiceTest;

  Communication.Expect.Once.When.SendRequest(It.SameFields(Request));

  Service.TestProcedure;

  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);

  Request.Free;
end;

procedure TRemoteServiceTest.WhenTheMethodHasNoAttributesOfParamDefinedMustGetTheAttributeFromInterface;
begin
  var Communication := CreateMockCommunication;
  var Request := CreateRequest(rmPost, '/ServiceParams/ProcedureWithOutAttribute', '123');
  var Service := CreateRemoteService<IServiceParams>(Communication.Instance) as IServiceParams;

  Communication.Expect.Once.When.SendRequest(It.SameFields(Request));

  Service.ProcedureWithOutAttribute(123);

  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);

  Request.Free;
end;

procedure TRemoteServiceTest.WhenTheProcedureAsAFileMustLoadTheFormDataValueAsExpected;
begin
  var Communication := CreateMockCommunication;
  var MyFile := CreateRequestFile;
  var Service := CreateRemoteService(Communication.Instance) as IServiceTest;

  Communication.Setup.WillExecute(
    procedure (const Params: TArray<TValue>)
    begin
      var FormValue :=
        '--%0:s'#13#10 +
        'Content-Disposition: form-data; name="MyParam"'#13#10 +
        #13#10 +
        '"MyParam"'#13#10 +
        '--%0:s'#13#10 +
        'Content-Disposition: form-data; name="MyFile"; filename="My File.png"'#13#10 +
        'Content-Type: image/png'#13#10 +
        #13#10 +
        'This is my file!'#13#10 +
        '--%0:s--'#13#10;

      var Request := Params[1].AsType<TRestRequest>;

      var FormData := Request.Body.AsType<TRESTFormData>;

      Assert.AreEqual(Format(FormValue, [FormData.Boundary]), GetFormDataValue(FormData));
    end).When.SendRequest(It.IsAny<TRestRequest>);

  Service.TestProcedureFileAnParamInTheBody('MyParam', MyFile);

  MyFile.Free;
end;

procedure TRemoteServiceTest.WhenTheProcedureAsAnArrayOfFilesMustAddTheFilesToFormDataAsExpected;
begin
  var Communication := CreateMockCommunication;
  var MyFile := CreateRequestFile;
  var Service := CreateRemoteService(Communication.Instance) as IServiceTest;

  Communication.Setup.WillExecute(
    procedure (const Params: TArray<TValue>)
    begin
      var FormValue :=
        '--%0:s'#13#10 +
        'Content-Disposition: form-data; name="MyFiles"; filename="My File.png"'#13#10 +
        'Content-Type: image/png'#13#10 +
        #13#10 +
        'This is my file!'#13#10 +
        '--%0:s'#13#10 +
        'Content-Disposition: form-data; name="MyFiles"; filename="My File.png"'#13#10 +
        'Content-Type: image/png'#13#10 +
        #13#10 +
        'This is my file!'#13#10 +
        '--%0:s'#13#10 +
        'Content-Disposition: form-data; name="MyFiles"; filename="My File.png"'#13#10 +
        'Content-Type: image/png'#13#10 +
        #13#10 +
        'This is my file!'#13#10 +
        '--%0:s--'#13#10;

      var Request := Params[1].AsType<TRestRequest>;

      var FormData := Request.Body.AsType<TRESTFormData>;

      Assert.AreEqual(Format(FormValue, [FormData.Boundary]), GetFormDataValue(FormData));
    end).When.SendRequest(It.IsAny<TRestRequest>);

  Service.TestProcedureWithArrayFiles([MyFile, MyFile, MyFile]);

  MyFile.Free;
end;

procedure TRemoteServiceTest.WhenTheProcedureAsNameAttributeMustLoadTheURLWithTheNameInTheAttribute;
begin
  var Communication := CreateMockCommunication;
  var Request := CreateRequest('/AnotherName/AnotherName');
  var Service := CreateRemoteService<IServiceNamed>(Communication.Instance) as IServiceNamed;

  Communication.Expect.Once.When.SendRequest(It.SameFields(Request));

  Service.WithName;

  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);

  Request.Free;
end;

procedure TRemoteServiceTest.WhenTheProcedureAsParamsWithFilesTheRequestParamSeparatorMustBeBuildCorrectly;
begin
  var Communication := CreateMockCommunication;
  var Request: TRestRequest := nil;
  var Service := CreateRemoteService(Communication.Instance) as IServiceTest;

  Communication.Setup.WillExecute(
    procedure (const Params: TArray<TValue>)
    begin
      Request := Params[1].AsType<TRestRequest>;

      Assert.AreEqual('/ServiceTest/TestProcedureWithFileAndParams?MayParam=12345&AnotherParam="My File"', Request.URL);
    end).When.SendRequest(It.IsAny<TRestRequest>);

  Service.TestProcedureWithFileAndParams(12345, nil, 'My File');
end;

procedure TRemoteServiceTest.WhenTheProcedureBeenCalledHasntParametersTheRequestBodyMustBeEmpty;
begin
  var Communication := CreateMockCommunication;
  var Request := CreateRequest('/ServiceTest/TestProcedure');
  var Service := CreateRemoteService(Communication.Instance) as IServiceTest;

  Request.Body := TValue.Empty;

  Communication.Expect.Once.When.SendRequest(It.SameFields(Request));

  Service.TestProcedure;

  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);

  Request.Free;
end;

procedure TRemoteServiceTest.WhenTheProcedureHasAParameterThatIsAFileMustSendTheFileInTheBodyOfTheRequest;
begin
  var Communication := CreateMockCommunication;
  var MyFile := CreateRequestFile;
  var Request: TRestRequest := nil;
  var Service := CreateRemoteService(Communication.Instance) as IServiceTest;

  Communication.Setup.WillExecute(
    procedure (const Params: TArray<TValue>)
    begin
      Request := Params[1].AsType<TRestRequest>;

      Assert.AreEqual<TObject>(MyFile, Request.Body.AsObject);
    end).When.SendRequest(It.IsAny<TRestRequest>);

  Service.TestProcedureWithAnFile(MyFile);

  MyFile.Free;
end;

procedure TRemoteServiceTest.WhenTheProcedureHasMoreThenOneParamAndSendingInTheBodyTheRequestMustLoadTheFormDataInTheBody;
begin
  var Communication := CreateMockCommunication;
  var Service := CreateRemoteService(Communication.Instance) as IServiceTest;

  Communication.Setup.WillExecute(
    procedure (const Params: TArray<TValue>)
    begin
      var Request := Params[1].AsType<TRestRequest>;

      Assert.IsTrue(Request.Body.IsType<TRESTFormData>);
    end).When.SendRequest(It.IsAny<TRestRequest>);

  Service.TestProcedureWithParameterInBody('abc', 123);
end;

procedure TRemoteServiceTest.WhenTheProcedureHasMoreThenOneParamFileParamMustSendTheFilesInTheBodyOfTheRequest;
begin
  var Communication := CreateMockCommunication;
  var MyFile := CreateRequestFile;
  var Service := CreateRemoteService(Communication.Instance) as IServiceTest;

  Communication.Setup.WillExecute(
    procedure (const Params: TArray<TValue>)
    begin
      var FormValue :=
        '--%0:s'#13#10 +
        'Content-Disposition: form-data; name="MyFile1"; filename="My File.png"'#13#10 +
        'Content-Type: image/png'#13#10 +
        #13#10 +
        'This is my file!'#13#10 +
        '--%0:s'#13#10 +
        'Content-Disposition: form-data; name="MyFile2"; filename="My File.png"'#13#10 +
        'Content-Type: image/png'#13#10 +
        #13#10 +
        'This is my file!'#13#10 +
        '--%0:s--'#13#10;

      var Request := Params[1].AsType<TRestRequest>;

      var FormData := Request.Body.AsType<TRESTFormData>;

      Assert.AreEqual(Format(FormValue, [FormData.Boundary]), GetFormDataValue(FormData));
    end).When.SendRequest(It.IsAny<TRestRequest>);

  Service.TestProceudreMoreThenOneFileParam(MyFile, 'Param', MyFile);

  MyFile.Free;
end;

procedure TRemoteServiceTest.WhenTheProcedureHasTheParameterInBodyAttributeMustSendTheParamsInTheBodyOfTheRequest;
begin
  var Communication := CreateMockCommunication;
  var Request := CreateRequest(rmPost, '/ServiceParams/ParameterInBody', '1234');
  var Service := CreateRemoteService<IServiceParams>(Communication.Instance) as IServiceParams;

  Communication.Expect.Once.When.SendRequest(It.SameFields(Request));

  Service.ParameterInBody(1234);

  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);

  Request.Free;
end;

procedure TRemoteServiceTest.WhenTheProcedureHasTheParameterInPathAttributeMustSendTheParamsInTheURLPathOfTheRequest;
begin
  var Communication := CreateMockCommunication;
  var Request := CreateRequest(rmPost, '/ServiceParams/ParameterInPath/123/456');
  var Service := CreateRemoteService<IServiceParams>(Communication.Instance) as IServiceParams;

  Communication.Expect.Once.When.SendRequest(It.SameFields(Request));

  Service.ParameterInPath(123, 456);

  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);

  Request.Free;
end;

procedure TRemoteServiceTest.WhenTheProcedureHasTheParameterInQueryAttributeMustSendTheParamsInTheURLOfTheRequest;
begin
  var Communication := CreateMockCommunication;
  var Request := CreateRequest(rmPost, '/ServiceParams/ParameterInQuery?Param=1234');
  var Service := CreateRemoteService<IServiceParams>(Communication.Instance) as IServiceParams;

  Communication.Expect.Once.When.SendRequest(It.SameFields(Request));

  Service.ParameterInQuery(1234);

  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);

  Request.Free;
end;

procedure TRemoteServiceTest.WhenTheProcedureIsToSendTheParamsInURLAndHaveAnArrayOfFileParamMustSendTheParamInTheBody;
begin
  var Communication := CreateMockCommunication;
  var MyFile := CreateRequestFile;
  var Service := CreateRemoteService(Communication.Instance) as IServiceTest;

  Communication.Setup.WillExecute(
    procedure (const Params: TArray<TValue>)
    begin
      var FormValue :=
        '--%0:s'#13#10 +
        'Content-Disposition: form-data; name="MyFiles"; filename="My File.png"'#13#10 +
        'Content-Type: image/png'#13#10 +
        #13#10 +
        'This is my file!'#13#10 +
        '--%0:s'#13#10 +
        'Content-Disposition: form-data; name="MyFiles"; filename="My File.png"'#13#10 +
        'Content-Type: image/png'#13#10 +
        #13#10 +
        'This is my file!'#13#10 +
        '--%0:s'#13#10 +
        'Content-Disposition: form-data; name="MyFiles"; filename="My File.png"'#13#10 +
        'Content-Type: image/png'#13#10 +
        #13#10 +
        'This is my file!'#13#10 +
        '--%0:s--'#13#10;

      var Request := Params[1].AsType<TRestRequest>;

      var FormData := Request.Body.AsType<TRESTFormData>;

      Assert.AreEqual(Format(FormValue, [FormData.Boundary]), GetFormDataValue(FormData));
    end).When.SendRequest(It.IsAny<TRestRequest>);

  Service.TestProcedureWithArrayFilesInURL([MyFile, MyFile, MyFile]);

  MyFile.Free;
end;

procedure TRemoteServiceTest.WhenTheProcedureSendAFileInTheBodyMustLoadTheFileInTheBody;
begin
  var Communication := CreateMockCommunication;
  var MyFile := CreateRequestFile;
  var Request: TRestRequest := nil;
  var Service := CreateRemoteService(Communication.Instance) as IServiceTest;

  Communication.Setup.WillExecute(
    procedure (const Params: TArray<TValue>)
    begin
      Request := Params[1].AsType<TRestRequest>;

      Assert.AreEqual<TObject>(MyFile, Request.Body.AsObject);
    end).When.SendRequest(It.IsAny<TRestRequest>);

  Service.TestProcedureFileInTheBody(MyFile);

  MyFile.Free;
end;

procedure TRemoteServiceTest.WhenThePropertyOnExceptionIsLoadedMustCallTheEventWhenRaiseAnErrorInTheSyncCall;
begin
  var Communication := CreateMockCommunication;
  var Request := CreateRequest('/ServiceTest/TestProcedureWithOneParam?Param="abcd"');

  var ExcetionCalled := False;
  var Client := CreateRemoteService(Communication.Instance);
  var Service := Client as IServiceTest;
  Client.OnExecuteException :=
    procedure (E: Exception; Serializer: IRestJsonSerializer)
    begin
      ExcetionCalled := True;
    end;

  Communication.Setup.WillExecute(
    procedure
    begin
      raise Exception.Create('Error Message');
    end).When.SendRequest(It.SameFields(Request));

  try
    Service.TestProcedureWithOneParam('abcd');
  except
  end;

  Assert.IsTrue(ExcetionCalled);

  Request.Free;
end;

procedure TRemoteServiceTest.WhenThePropertyOnExceptionIsNotLoadedMustCallTheEventWhenRaiseAnErrorInTheSyncCall;
begin
  var Request := CreateRequest('/ServiceTest/TestProcedureWithOneParam?Param="abcd"');

  Assert.WillRaise(
    procedure
    begin
      var Communication := CreateMockCommunication;
      var Service := CreateRemoteService(Communication.Instance) as IServiceTest;

      Communication.Setup.WillExecute(
        procedure
        begin
          raise Exception.Create('Error Message');
        end).When.SendRequest(It.SameFields(Request));

      Service.TestProcedureWithOneParam('abcd');
    end, Exception);

  Request.Free;
end;

procedure TRemoteServiceTest.WhenTheRemoteNameAttributeIsPresentMustChangeTheRemoteNameInTheRequest;
begin
  var Communication := CreateMockCommunication;
  var Request := CreateRequest('/AnotherName/Proc');
  var Service := CreateRemoteService<IServiceNamed>(Communication.Instance) as IServiceNamed;

  Communication.Expect.Once.When.SendRequest(It.SameFields(Request));

  Service.Proc;

  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);

  Request.Free;
end;

procedure TRemoteServiceTest.WhenTheRequestHasMoreThenOneParameterMustSepareteThenWithTheSeparetorChar;
begin
  var Communication := CreateMockCommunication;
  var Request := CreateRequest('/ServiceTest/TestProcedureWithParam?Param1="abcd"&Param2=1234');
  var Service := CreateRemoteService(Communication.Instance) as IServiceTest;

  Communication.Expect.Once.When.SendRequest(It.SameFields(Request));

  Service.TestProcedureWithParam('abcd', 1234);

  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);

  Request.Free;
end;

procedure TRemoteServiceTest.WhenTheServiceHasABasicAuthenticationAttributeMustSendTheAuthenticationHeaderInTheRequest;
begin
  var Communication := CreateMockCommunication;
  var Service := CreateRemoteService<IServiceAutenticationTest>(Communication.Instance) as IServiceAutenticationTest;

  Communication.Setup.WillExecute(
    procedure (const Params: TArray<TValue>)
    begin
      var Request := Params[1].AsType<TRestRequest>;

      Assert.AreEqual('Authorization=Basic VXNlcjpQYXNzd29yZA=='#13#10, Request.Headers);
    end).When.SendRequest(It.IsAny<TRestRequest>);

  Service.Proc;
end;

function TRemoteServiceTest.CreateRequest(Method: TRESTMethod; const URL: String; Body: TValue): TRestRequest;
begin
  Result := TRestRequest.Create;
  Result.Body := Body;
  Result.Method := Method;
  Result.URL := URL;
end;

function TRemoteServiceTest.CreateRequestFile: TRESTFile;
const
  CONTENT: AnsiString = 'This is my file!'#0;

begin
  Result := TWebRequestFile.Create(EmptyStr, 'My File.png', EmptyStr, @CONTENT[1], 16);
end;

function TRemoteServiceTest.GetFormDataValue(FormData: TRESTFormData): String;
begin
  Result := String(PAnsiChar(TMemoryStream(FormData.Stream).Memory));

  SetLength(Result, FormData.Stream.Size);
end;

end.

