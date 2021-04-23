unit Delphi.Rest.Remote.Service.Test;

interface

uses DUnitX.TestFramework, Delphi.Rest.Remote.Service, Delphi.Mock, Delphi.Mock.Intf;

type
  [TestFixture]
  TRemoteServiceTest = class
  private
    function CreateRemoteService(const Communication: IRestCommunication): TRemoteService;
    function CreateRemoteServiceURL(const URL: String; const Communication: IRestCommunication): TRemoteService;
    function CreateMockCommunication: IMock<IRestCommunication>;
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
    procedure WhenFillAHeaderMustPassTheValuesToTheCommunicationInterface;
    [Test]
    procedure TheFilledHeadersMustKeepTheValues;
    [Test]
    procedure TheHeadersFilledMustBeLoadedInTheCommunicationInterface;
    [Test]
    procedure WhenFillingAHeaderHasToReturnTheValuesInTheHeadersProperty;
    [Test]
    procedure WhenFillingThePropertyHeadersHaveToFillThePropertyHeaderWithTheParameterValuesPassed;
  end;

  IServiceTest = interface(IInvokable)
    ['{61DCD8A8-AD02-4EA3-AFC7-8425F7B12D6B}']
    function TestFunction: Integer;

    procedure TestProcedure;
    procedure TestProcedureWithOneParam(Param: String);
    procedure TestProcedureWithParam(Param1: String; Param2: Integer);
  end;

implementation

uses System.SysUtils, System.Rtti, System.Classes, Delphi.Rest.JSON.Serializer, Delphi.Rest.JSON.Serializer.Intf;

{ TRemoteServiceTest }

function TRemoteServiceTest.CreateMockCommunication: IMock<IRestCommunication>;
begin
  Result := TMock.CreateInterface<IRestCommunication>;

  Result.Setup.WillReturn(nil).When.SetHeaders(It.IsAny<TStrings>);
end;

function TRemoteServiceTest.CreateRemoteService(const Communication: IRestCommunication): TRemoteService;
begin
  Result := CreateRemoteServiceURL(EmptyStr, Communication);
end;

function TRemoteServiceTest.CreateRemoteServiceURL(const URL: String; const Communication: IRestCommunication): TRemoteService;
begin
  Result := TRemoteServiceTyped<IServiceTest>.Create;
  Result.Communication := Communication;
  Result.Serializer := TRestJsonSerializer.Create;
  Result.URL := URL;
end;

procedure TRemoteServiceTest.SendingARequestWithOneParamMustPutTheParamSeparatorInTheURLAndTheNameAndValueParam;
begin
  var Communication := CreateMockCommunication;

  var Client := CreateRemoteService(Communication.Instance);
  var Service := Client as IServiceTest;

  Communication.Expect.Once.When.SendRequestSync(It.IsEqualTo('/ServiceTest/TestProcedureWithOneParam?Param="abcd"'));

  Service.TestProcedureWithOneParam('abcd');

  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);
end;

procedure TRemoteServiceTest.SendingARequestWithoutParamsMustLoadTheURLWithoutParamSeparator;
begin
  var Communication := CreateMockCommunication;

  var Client := CreateRemoteService(Communication.Instance);
  var Service := Client as IServiceTest;

  Communication.Expect.Once.When.SendRequestSync(It.IsEqualTo('/ServiceTest/TestProcedure'));

  Service.TestProcedure;

  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);
end;

procedure TRemoteServiceTest.SetupFixture;
begin
  var Client := CreateRemoteService(nil);
  var Serializer: IRestJsonSerializer := TRestJsonSerializer.Create;
  var Service := Client as IServiceTest;

  CreateMockCommunication;

  Serializer.Serialize('abc');
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
  var HeaderCount := 0;

  var Client := CreateRemoteService(Communication.Instance);
  var Service := Client as IServiceTest;

  Communication.Expect.Once.When.SendRequestSync(It.IsAny<String>);

  Communication.Expect.CustomExpect(
    function (Values: TArray<TValue>): String
    begin
      if Values[0].AsObject is TStrings then
        HeaderCount := HeaderCount + Values[0].AsType<TStrings>.Count;

      Result := EmptyStr;
    end).When.SetHeaders(It.IsAny<TStrings>);

  Client.Header['My Header'] := 'abc';
  Service.TestProcedureWithOneParam('abcd');

  Assert.AreEqual(1, HeaderCount);
end;

procedure TRemoteServiceTest.TheURLOfServerCallMustContainTheNameOfInterfacePlusTheProcedureName;
begin
  var Communication := CreateMockCommunication;

  var Client := CreateRemoteService(Communication.Instance);
  var Service := Client as IServiceTest;

  Communication.Expect.Once.When.SendRequestSync(It.IsEqualTo('/ServiceTest/TestProcedure'));

  Service.TestProcedure;

  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);
end;

procedure TRemoteServiceTest.TheURLPassedInConstructorMustContatWithTheRequestURL;
begin
  var Communication := CreateMockCommunication;

  var Client := CreateRemoteServiceURL('http://myurl.com', Communication.Instance);
  var Service := Client as IServiceTest;

  Communication.Expect.Once.When.SendRequestSync(It.IsEqualTo('http://myurl.com/ServiceTest/TestProcedure'));

  Service.TestProcedure;

  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);
end;

procedure TRemoteServiceTest.WhenCallAFunctionMustConvertTheFunctionParamsInTheGetURL;
begin
  var Communication := CreateMockCommunication;

  var Client := CreateRemoteService(Communication.Instance);
  var Service := Client as IServiceTest;

  Communication.Expect.Once.When.SendRequestSync(It.IsEqualTo('/ServiceTest/TestProcedureWithParam?Param1="abc"&Param2=123'));

  Service.TestProcedureWithParam('abc', 123);

  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);
end;

procedure TRemoteServiceTest.WhenCallAFunctionMustReturnTheValueOfFunctionAsSpected;
begin
  var Communication := CreateMockCommunication;

  var Client := CreateRemoteService(Communication.Instance);
  var Service := Client as IServiceTest;

  Communication.Setup.WillReturn('8888').When.SendRequestSync(It.IsAny<String>);

  Assert.AreEqual(8888, Service.TestFunction);
end;

procedure TRemoteServiceTest.WhenCallSendRequestMustSendABodyInParams;
begin
  var Communication := CreateMockCommunication;

  var Client := CreateRemoteService(Communication.Instance);
  var Service := Client as IServiceTest;

  Communication.Expect.Once.When.SendRequestSync(It.IsAny<String>);

  Service.TestProcedureWithParam('String', 1234);

  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);
end;

procedure TRemoteServiceTest.WhenCallTheProcedureMustGenerateTheRequestForServer;
begin
  var Communication := CreateMockCommunication;

  var Client := CreateRemoteService(Communication.Instance);
  var Service := Client as IServiceTest;

  Communication.Expect.Once.When.SendRequestSync(It.IsAny<String>);

  Service.TestProcedure;

  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);
end;

procedure TRemoteServiceTest.WhenFillAHeaderMustPassTheValuesToTheCommunicationInterface;
begin
  var Communication := TMock.CreateInterface<IRestCommunication>;

  var Client := CreateRemoteService(Communication.Instance);
  var Service := Client as IServiceTest;

  Communication.Expect.Once.When.SendRequestSync(It.IsAny<String>);

  Communication.Expect.Once.When.SetHeaders(It.IsAny<TStrings>);

  Service.TestProcedureWithOneParam('abcd');

  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);
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

procedure TRemoteServiceTest.WhenThePropertyOnExceptionIsLoadedMustCallTheEventWhenRaiseAnErrorInTheSyncCall;
begin
  var Communication := CreateMockCommunication;

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
    end).When.SendRequestSync(It.IsAny<String>);

  try
    Service.TestProcedureWithOneParam('abcd');
  except
  end;

  Assert.IsTrue(ExcetionCalled);
end;

procedure TRemoteServiceTest.WhenThePropertyOnExceptionIsNotLoadedMustCallTheEventWhenRaiseAnErrorInTheSyncCall;
begin
  Assert.WillRaise(
    procedure
    begin
      var Communication := CreateMockCommunication;

      var Client := CreateRemoteService(Communication.Instance);
      var Service := Client as IServiceTest;

      Communication.Setup.WillExecute(
        procedure
        begin
          raise Exception.Create('Error Message');
        end).When.SendRequestSync(It.IsAny<String>);

      Service.TestProcedureWithOneParam('abcd');
    end, Exception);
end;

procedure TRemoteServiceTest.WhenTheRequestHasMoreThenOneParameterMustSepareteThenWithTheSeparetorChar;
begin
  var Communication := CreateMockCommunication;

  var Client := CreateRemoteService(Communication.Instance);
  var Service := Client as IServiceTest;

  Communication.Expect.Once.When.SendRequestSync(It.IsEqualTo('/ServiceTest/TestProcedureWithParam?Param1="abcd"&Param2=1234'));

  Service.TestProcedureWithParam('abcd', 1234);

  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);
end;

end.

