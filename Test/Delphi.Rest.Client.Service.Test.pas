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
    procedure TheBodyParameterMustHaveTheValuesOfCallingProcedure;
  end;

{$M+}
  IServiceTest = interface
    ['{61DCD8A8-AD02-4EA3-AFC7-8425F7B12D6B}']
    procedure TestProcedute;
    procedure TestProcedureWithParam(Param1: String; Param2: Integer);
  end;

implementation

uses System.SysUtils, System.Rtti, Delphi.Rest.Client.Service, Delphi.Mock, Delphi.Rest.Communication;

{ TClientServiceTest }

procedure TClientServiceTest.TheBodyParameterMustHaveTheValuesOfCallingProcedure;
begin
  var Communication := TMock.CreateInterface<IRestCommunication>;

  var Client := TClientService.Create(Communication.Instance);
  var Service := Client.GetService<IServiceTest>;

  Communication.Expect.CustomExpect(
    function (Params: TArray<TValue>): String
    begin
      var Body := Params[1].AsObject as TBody;
      Result := EmptyStr;

      if (Length(Body.Values) < 2) or (Body.Values[0].AsString <> 'String') or (Body.Values[1].AsInteger <> 1234) then
        Result := 'Assert error!';
    end).When.SendRequest(It.IsAny<String>, It.IsAny<TBody>);

  Service.TestProcedureWithParam('String', 1234);

  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);
end;

procedure TClientServiceTest.TheURLOfServerCallMustContainTheNameOfInterfacePlusTheProcedureName;
begin
  var Communication := TMock.CreateInterface<IRestCommunication>;

  var Client := TClientService.Create(Communication.Instance);
  var Service := Client.GetService<IServiceTest>;

  Communication.Expect.Once.When.SendRequest(It.IsEqualTo('/ServiceTest/TestProcedute'), It.IsAny<TBody>);

  Service.TestProcedute;

  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);
end;

procedure TClientServiceTest.WhenCallSendRequestMustSendABodyInParams;
begin
  var Communication := TMock.CreateInterface<IRestCommunication>;

  var Client := TClientService.Create(Communication.Instance);
  var Service := Client.GetService<IServiceTest>;

  Communication.Expect.Once.When.SendRequest(It.IsAny<String>, It.IsNotEqualTo<TBody>(nil));

  Service.TestProcedureWithParam('String', 1234);

  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);
end;

procedure TClientServiceTest.WhenCallTheProcedureMustGenerateTheRequestForServer;
begin
  var Communication := TMock.CreateInterface<IRestCommunication>;

  var Client := TClientService.Create(Communication.Instance);
  var Service := Client.GetService<IServiceTest>;

  Communication.Expect.Once.When.SendRequest(It.IsAny<String>, It.IsAny<TBody>);

  Service.TestProcedute;

  Assert.AreEqual(EmptyStr, Communication.CheckExpectations);
end;

end.

