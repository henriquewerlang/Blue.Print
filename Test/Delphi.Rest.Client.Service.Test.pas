unit Delphi.Rest.Client.Service.Test;

interface

uses DUnitX.TestFramework;

type
  [TestFixture]
  TClientServiceTest = class
  public
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
  end;

{$M+}
  IServiceTest = interface
    ['{61DCD8A8-AD02-4EA3-AFC7-8425F7B12D6B}']
    function TestFunction: Integer;

    procedure TestProcedute;
    procedure TestProcedureWithParam(Param1: String; Param2: Integer);
  end;

implementation

uses System.SysUtils, System.Rtti, Delphi.Rest.Client.Service, Delphi.Mock, Delphi.Rest.Communication;

{ TClientServiceTest }

procedure TClientServiceTest.TheURLOfServerCallMustContainTheNameOfInterfacePlusTheProcedureName;
begin
  var Communication := TMock.CreateInterface<IRestCommunication>;

  var Client := TClientService.Create(EmptyStr, Communication.Instance);
  var Service := Client.GetService<IServiceTest>;

  Communication.Expect.Once.When.SendRequest(It.IsEqualTo('/ServiceTest/TestProcedute'), It.IsAny<TBody>);

  Service.TestProcedute;

  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);

  Client.Free;
end;

procedure TClientServiceTest.TheURLPassedInConstructorMustContatWithTheRequestURL;
begin
  var Communication := TMock.CreateInterface<IRestCommunication>;

  var Client := TClientService.Create('http://myurl.com', Communication.Instance);
  var Service := Client.GetService<IServiceTest>;

  Communication.Expect.Once.When.SendRequest(It.IsEqualTo('http://myurl.com/ServiceTest/TestProcedute'), It.IsAny<TBody>);

  Service.TestProcedute;

  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);

  Client.Free;
end;

procedure TClientServiceTest.WhenCallAFunctionMustConvertTheFunctionParamsInTheGetURL;
begin
  var Communication := TMock.CreateInterface<IRestCommunication>;

  var Client := TClientService.Create(EmptyStr, Communication.Instance);
  var Service := Client.GetService<IServiceTest>;

  Communication.Expect.Once.When.SendRequest(It.IsEqualTo('/ServiceTest/TestProcedureWithParam/"abc"/123'), It.IsAny<TBody>);

  Service.TestProcedureWithParam('abc', 123);

  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);

  Client.Free;
end;

procedure TClientServiceTest.WhenCallAFunctionMustReturnTheValueOfFunctionAsSpected;
begin
  var Communication := TMock.CreateInterface<IRestCommunication>;

  var Client := TClientService.Create(EmptyStr, Communication.Instance);
  var Service := Client.GetService<IServiceTest>;

  Communication.Setup.WillReturn('8888').When.SendRequest(It.IsAny<String>, It.IsAny<TBody>);

  Assert.AreEqual(8888, Service.TestFunction);

  Client.Free;
end;

procedure TClientServiceTest.WhenCallSendRequestMustSendABodyInParams;
begin
  var Communication := TMock.CreateInterface<IRestCommunication>;

  var Client := TClientService.Create(EmptyStr, Communication.Instance);
  var Service := Client.GetService<IServiceTest>;

  Communication.Expect.Once.When.SendRequest(It.IsAny<String>, It.IsNotEqualTo<TBody>(nil));

  Service.TestProcedureWithParam('String', 1234);

  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);

  Client.Free;
end;

procedure TClientServiceTest.WhenCallTheProcedureMustGenerateTheRequestForServer;
begin
  var Communication := TMock.CreateInterface<IRestCommunication>;

  var Client := TClientService.Create(EmptyStr, Communication.Instance);
  var Service := Client.GetService<IServiceTest>;

  Communication.Expect.Once.When.SendRequest(It.IsAny<String>, It.IsAny<TBody>);

  Service.TestProcedute;

  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);

  Client.Free;
end;

end.

