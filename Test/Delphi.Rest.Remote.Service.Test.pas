unit Delphi.Rest.Remote.Service.Test;

interface

uses DUnitX.TestFramework, Delphi.Rest.Remote.Service, Delphi.Mock, Delphi.Mock.Intf, Delphi.Rest.Types;

type
  [TestFixture]
  TRemoteServiceTest = class
  private
    function CreateMockCommunication: IMock<IRestCommunication>;
    function CreateRequest(const URL: String): TRestRequest; overload;
    function CreateRequest(Method: TRESTMethod; const URL: String): TRestRequest; overload;
    function CreateRequest(Method: TRESTMethod; const URL, Params: String): TRestRequest; overload;
    function CreateRemoteService(const Communication: IRestCommunication): TRemoteService; overload;
    function CreateRemoteService<T: IInterface>(const Communication: IRestCommunication): TRemoteService; overload;
    function CreateRemoteServiceURL(const URL: String; const Communication: IRestCommunication): TRemoteService; overload;
    function CreateRemoteServiceURL<T: IInterface>(const URL: String; const Communication: IRestCommunication): TRemoteService; overload;

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
    procedure WhenTheProcedureHasTheParamInBodyAttributeMustSendTheParamsInTheBodyOfTheRequest;
    [Test]
    procedure WhenTheProcedureHasTheParamInURLAttributeMustSendTheParamsInTheURLOfTheRequest;
    [TestCase('DELETE', 'rmDelete,True')]
    [TestCase('GET', 'rmGet,True')]
    [TestCase('PATCH', 'rmPatch,False')]
    [TestCase('POST', 'rmPost,False')]
    [TestCase('PUT', 'rmPut,False')]
    procedure IfTheProcedureHasntAnAttributeAboutParamMustSendTheParamByTheTypeOfCommand(Method: TRESTMethod; ParamInURL: Boolean);
    [Test]
    procedure WhenTheMethodHasNoAttributesOfParamDefinedMustGetTheAttributeFromInterface;
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
  end;

  [PATCH]
  IServicePatch = interface(IInvokable)
    ['{D4C4C05B-58D7-4F89-BABE-6FCDB10EF15B}']
    procedure TestProcedure;
  end;

  [ParamInBody]
  [POST]
  IServiceParams = interface(IInvokable)
    ['{CF2BB234-0D53-49FB-979D-650DCEF196F2}']
    [ParamInBody]
    procedure ParamInBody(Param: Integer);
    [ParamInURL]
    procedure ParamInURL(Param: Integer);
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

implementation

uses System.SysUtils, System.Rtti, System.Classes, Delphi.Rest.JSON.Serializer, Delphi.Rest.JSON.Serializer.Intf;

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

function TRemoteServiceTest.CreateRequest(Method: TRESTMethod; const URL, Params: String): TRestRequest;
begin
  Result := TRestRequest.Create;
  Result.Method := Method;
  Result.Params := Params;
  Result.URL := URL;
end;

procedure TRemoteServiceTest.IfTheProcedureHasntAnAttributeAboutParamMustSendTheParamByTheTypeOfCommand(Method: TRESTMethod; ParamInURL: Boolean);
const
  COMMAND_NAME: array[TRESTMethod] of String = ('Delete', 'Get', 'Patch', 'Post', 'Put');

begin
  var Communication := CreateMockCommunication;
  var Context := TRttiContext.Create;
  var MethodName := 'Test' + COMMAND_NAME[Method];
  var ParamValue := 'Param=123456';
  var Request := CreateRequest(Method, '/ServiceParamsType/' + MethodName);
  var RttiType := Context.GetType(TypeInfo(IServiceParamsType));
  var Service := CreateRemoteService<IServiceParamsType>(Communication.Instance) as IServiceParamsType;

  if ParamInURL then
    Request.URL := Request.URL + '?' + ParamValue
  else
    Request.Params := ParamValue;

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
    Method.GetAttributes;
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
  var Request := CreateRequest(rmPost, '/ServiceParams/ProcedureWithOutAttribute', 'Param=123');
  var Service := CreateRemoteService<IServiceParams>(Communication.Instance) as IServiceParams;

  Communication.Expect.Once.When.SendRequest(It.SameFields(Request));

  Service.ProcedureWithOutAttribute(123);

  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);

  Request.Free;
end;

procedure TRemoteServiceTest.WhenTheProcedureHasTheParamInBodyAttributeMustSendTheParamsInTheBodyOfTheRequest;
begin
  var Communication := CreateMockCommunication;
  var Request := CreateRequest(rmPost, '/ServiceParams/ParamInBody', 'Param=1234');
  var Service := CreateRemoteService<IServiceParams>(Communication.Instance) as IServiceParams;

  Communication.Expect.Once.When.SendRequest(It.SameFields(Request));

  Service.ParamInBody(1234);

  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);

  Request.Free;
end;

procedure TRemoteServiceTest.WhenTheProcedureHasTheParamInURLAttributeMustSendTheParamsInTheURLOfTheRequest;
begin
  var Communication := CreateMockCommunication;
  var Request := CreateRequest(rmPost, '/ServiceParams/ParamInURL?Param=1234');
  var Service := CreateRemoteService<IServiceParams>(Communication.Instance) as IServiceParams;

  Communication.Expect.Once.When.SendRequest(It.SameFields(Request));

  Service.ParamInURL(1234);

  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);

  Request.Free;
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

end.

