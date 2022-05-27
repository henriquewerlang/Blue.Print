unit Delphi.Rest.Types.Test;

interface

uses DUnitX.TestFramework, Delphi.Rest.Types, Rest.Types;

type
  [TestFixture]
  TRESTParamAttributeTest = class
  public
    [SetupFixture]
    procedure SetupFixture;
    [Test]
    procedure IfTheInterfaceHasntAnyAttributeMustReturnFalseInTheFunction;
    [Test]
    procedure WhenTheMethodHasTheAttributeParameterInBodyMustReturnParameterInBodyType;
    [Test]
    procedure WhenTheMethodHasTheAttributeParameterInQueryMustReturnParameterInQueryType;
    [Test]
    procedure WhenTheProcedureHasntAttributeMustReturnTrueIfExistsAnAttributeInTheInterface;
    [Test]
    procedure WhenTheProcedureHasntAttributeMustReturnTheParamTypeFromTheInterface;
    [Test]
    procedure WhenTheMethodHasTheAttributeParameterInPathMustReturnParameterInPathType;
    [Test]
    procedure IfTheParamHasntParamTypeAttributeTheFunctionGetParamTypeMustReturnFalse;
    [Test]
    procedure WhenTheParamOfTheProcedureHasTheParamTypeAttributeMustReturnTheTypeFromTheParam;
    [Test]
    procedure IfTheParamHasntTheParamTypeAttributeButTheMethodHasMustReturnTrueInTheGetParamFunction;
    [Test]
    procedure IfTheParamHasntTheParamTypeAttributeButTheMethodHasMustReturnTheTypeOfMethodInTheGetParamFunction;
  end;

  [TestFixture]
  TRESTMethodAttributeTest = class
  public
    [SetupFixture]
    procedure SetupFixture;
    [Test]
    procedure IfTheMethodHasntAttributeMustReturnFalseInTheFunction;
    [TestCase('DELETE', 'rmDelete')]
    [TestCase('GET', 'rmGet')]
    [TestCase('PATCH', 'rmPatch')]
    [TestCase('POST', 'rmPost')]
    [TestCase('PUT', 'rmPut')]
    procedure WhenGetTheTypeOfMethodMustReturnAsExpected(MethodToCompare: TRESTRequestMethod);
    [Test]
    procedure WhenTheProcedureHasntAttributeMustReturnTrueIfTheClassHasTheAttribute;
    [Test]
    procedure WhenTheProcedureHasntAttributeMustReturnTheTypeFromTheClassAttribute;
  end;

  [TestFixture]
  TAuthenticationTest = class
  public
    [SetupFixture]
    procedure SetupFixture;
    [Test]
    procedure TheBasicAuthenticationAttributeMustReturnTheUserNameAndPasswordInBase64;
    [Test]
    procedure WhenFindInTheMethodAnAttributeOfAuthenticationMustReturnTrueInLoadHeaders;
    [Test]
    procedure IfTheMethodDoesntHaveAnAuthenticationAttributeMustLoadFromParentOfTheMehod;
    [Test]
    procedure IfTheMethodAndTheParentDontHaveAnAutenticationAtttributeMustReturnFalseInLoadHeadersFunction;
    [Test]
    procedure WhenTheMethodAndTheParentHaveAnAuthenticationAttributeMustReturnTheValueOnlyFromMethod;
    [Test]
    procedure WhenLoadTheHeaderValueMustReturnTheNameOfAuthentication;
  end;

  IContractWithOutAttributes = interface(IInvokable)
    ['{1C952251-1DFC-4C36-BA63-FC9D7CC7F7E8}']
    procedure Proc;
    procedure ProcWithParameter(AParam: Integer);
  end;

  [ParameterInBody]
  IContractTest = interface(IInvokable)
    ['{CF2BB234-0D53-49FB-979D-650DCEF196F2}']
    [ParameterInBody]
    procedure ParameterInBody(AParam: Integer);
    [ParameterInPath]
    procedure ParameterInPath(AParam: Integer);
    [ParameterInQuery]
    procedure ParameterInQuery(AParam: Integer);
    [ParameterInQuery]
    procedure ParamWithBodyAttribute([ParameterInPath]Param: String);
    procedure ProcedureWithOutAttribute(AParam: Integer);
    [ParameterInQuery]
    procedure ProcedureWithParameter(Param: Integer);
  end;

  [POST]
  IContractMethodType = interface(IInvokable)
    ['{AC1EF798-4269-4887-B7DF-0D6C3132C3FA}']
    [DELETE]
    procedure Delete;
    [GET]
    procedure Get;
    [PATCH]
    procedure Patch;
    [POST]
    procedure Post;
    [PUT]
    procedure Put;
    procedure ProcedureWithOutAttribute;
  end;

  [BasicAuthentication('User Name', 'Password')]
  IBasicAuthenticationService = interface(IInvokable)
    ['{71838152-F1D7-4054-98AD-B3609D48C959}']
    procedure Proc;
    [BasicAuthentication('Another User', 'Another Password')]
    procedure Proc2;
  end;

  IBasicAuthenticationService2 = interface(IInvokable)
    ['{6BA9CFC2-5C44-4F58-A4D7-CA0C7E70E02A}']
    [BasicAuthentication('User Name', 'Password')]
    procedure AuthenticatedProc;
  end;

implementation

uses System.Rtti, System.SysUtils, System.NetEncoding;

procedure LoadAttributes(TypeInfo: Pointer);
begin
  for var Method in TRttiContext.Create.GetType(TypeInfo).GetMethods do
  begin
    Method.GetAttributes;

    Method.Parent.GetAttributes;

    for var Parameter in Method.GetParameters do
      Parameter.GetAttributes;
  end;
end;

{ TRESTParamAttributeTest }

procedure TRESTParamAttributeTest.IfTheInterfaceHasntAnyAttributeMustReturnFalseInTheFunction;
begin
  var Method := TRttiContext.Create.GetType(TypeInfo(IContractWithOutAttributes)).GetMethod('ProcWithParameter');
  var ParamType: TRESTParamType;

  Assert.IsFalse(TRESTParamAttribute.GetParamAtrributeType(Method.GetParameters[0], ParamType));
end;

procedure TRESTParamAttributeTest.IfTheParamHasntParamTypeAttributeTheFunctionGetParamTypeMustReturnFalse;
begin
  var Method := TRttiContext.Create.GetType(TypeInfo(IContractWithOutAttributes)).GetMethod('ProcWithParameter');
  var ParamType: TRESTParamType;

  Assert.IsFalse(TRESTParamAttribute.GetParamAtrributeType(Method.GetParameters[0], ParamType));
end;

procedure TRESTParamAttributeTest.IfTheParamHasntTheParamTypeAttributeButTheMethodHasMustReturnTheTypeOfMethodInTheGetParamFunction;
begin
  var Method := TRttiContext.Create.GetType(TypeInfo(IContractTest)).GetMethod('ProcedureWithParameter');
  var ParamType: TRESTParamType;

  TRESTParamAttribute.GetParamAtrributeType(Method.GetParameters[0], ParamType);

  Assert.AreEqual(ptQuery, ParamType);
end;

procedure TRESTParamAttributeTest.IfTheParamHasntTheParamTypeAttributeButTheMethodHasMustReturnTrueInTheGetParamFunction;
begin
  var Method := TRttiContext.Create.GetType(TypeInfo(IContractTest)).GetMethod('ProcedureWithParameter');
  var ParamType: TRESTParamType;

  Assert.IsTrue(TRESTParamAttribute.GetParamAtrributeType(Method.GetParameters[0], ParamType));
end;

procedure TRESTParamAttributeTest.SetupFixture;
begin
  LoadAttributes(TypeInfo(IContractTest));

  LoadAttributes(TypeInfo(IContractWithOutAttributes));
end;

procedure TRESTParamAttributeTest.WhenTheMethodHasTheAttributeParameterInBodyMustReturnParameterInBodyType;
begin
  var Method := TRttiContext.Create.GetType(TypeInfo(IContractTest)).GetMethod('ParameterInBody');
  var ParamType: TRESTParamType;

  TRESTParamAttribute.GetParamAtrributeType(Method.GetParameters[0], ParamType);

  Assert.AreEqual(ptBody, ParamType);
end;

procedure TRESTParamAttributeTest.WhenTheMethodHasTheAttributeParameterInPathMustReturnParameterInPathType;
begin
  var Method := TRttiContext.Create.GetType(TypeInfo(IContractTest)).GetMethod('ParameterInPath');
  var ParamType: TRESTParamType;

  TRESTParamAttribute.GetParamAtrributeType(Method.GetParameters[0], ParamType);

  Assert.AreEqual(ptPath, ParamType);
end;

procedure TRESTParamAttributeTest.WhenTheMethodHasTheAttributeParameterInQueryMustReturnParameterInQueryType;
begin
  var Method := TRttiContext.Create.GetType(TypeInfo(IContractTest)).GetMethod('ParameterInQuery');
  var ParamType: TRESTParamType;

  TRESTParamAttribute.GetParamAtrributeType(Method.GetParameters[0], ParamType);

  Assert.AreEqual(ptQuery, ParamType);
end;

procedure TRESTParamAttributeTest.WhenTheParamOfTheProcedureHasTheParamTypeAttributeMustReturnTheTypeFromTheParam;
begin
  var Method := TRttiContext.Create.GetType(TypeInfo(IContractTest)).GetMethod('ParamWithBodyAttribute');
  var ParamType: TRESTParamType;

  TRESTParamAttribute.GetParamAtrributeType(Method.GetParameters[0], ParamType);

  Assert.AreEqual(ptPath, ParamType);
end;

procedure TRESTParamAttributeTest.WhenTheProcedureHasntAttributeMustReturnTheParamTypeFromTheInterface;
begin
  var Method := TRttiContext.Create.GetType(TypeInfo(IContractTest)).GetMethod('ProcedureWithOutAttribute');
  var ParamType: TRESTParamType;

  TRESTParamAttribute.GetParamAtrributeType(Method.GetParameters[0], ParamType);

  Assert.AreEqual(ptBody, ParamType);
end;

procedure TRESTParamAttributeTest.WhenTheProcedureHasntAttributeMustReturnTrueIfExistsAnAttributeInTheInterface;
begin
  var Method := TRttiContext.Create.GetType(TypeInfo(IContractTest)).GetMethod('ProcedureWithOutAttribute');
  var ParamType: TRESTParamType;

  Assert.IsTrue(TRESTParamAttribute.GetParamAtrributeType(Method.GetParameters[0], ParamType));
end;

{ TRESTMethodAttributeTest }

procedure TRESTMethodAttributeTest.IfTheMethodHasntAttributeMustReturnFalseInTheFunction;
begin
  var Method := TRttiContext.Create.GetType(TypeInfo(IContractWithOutAttributes)).GetMethod('Proc');
  var MethodType: TRESTRequestMethod;

  Assert.IsFalse(TRESTRequestMethodAttribute.GetMethodType(Method, MethodType));
end;

procedure TRESTMethodAttributeTest.SetupFixture;
begin
  for var Method in TRttiContext.Create.GetType(TypeInfo(IContractMethodType)).GetMethods do
  begin
    Method.GetAttributes;

    Method.Parent.GetAttributes;
  end;
end;

procedure TRESTMethodAttributeTest.WhenGetTheTypeOfMethodMustReturnAsExpected(MethodToCompare: TRESTRequestMethod);
const
  COMMAND_NAME: array[TRESTRequestMethod] of String = ('Delete', 'Get', 'Patch', 'Post', 'Put');

begin
  var Method := TRttiContext.Create.GetType(TypeInfo(IContractMethodType)).GetMethod(COMMAND_NAME[MethodToCompare]);
  var MethodType: TRESTRequestMethod;

  TRESTRequestMethodAttribute.GetMethodType(Method, MethodType);

  Assert.AreEqual(MethodToCompare, MethodType);
end;

procedure TRESTMethodAttributeTest.WhenTheProcedureHasntAttributeMustReturnTheTypeFromTheClassAttribute;
begin
  var Method := TRttiContext.Create.GetType(TypeInfo(IContractMethodType)).GetMethod('ProcedureWithOutAttribute');
  var MethodType: TRESTRequestMethod;

  TRESTRequestMethodAttribute.GetMethodType(Method, MethodType);

  Assert.AreEqual(rmPost, MethodType);
end;

procedure TRESTMethodAttributeTest.WhenTheProcedureHasntAttributeMustReturnTrueIfTheClassHasTheAttribute;
begin
  var Method := TRttiContext.Create.GetType(TypeInfo(IContractMethodType)).GetMethod('ProcedureWithOutAttribute');
  var MethodType: TRESTRequestMethod;

  Assert.IsTrue(TRESTRequestMethodAttribute.GetMethodType(Method, MethodType));
end;

{ TAuthenticationTest }

procedure TAuthenticationTest.IfTheMethodAndTheParentDontHaveAnAutenticationAtttributeMustReturnFalseInLoadHeadersFunction;
begin
  var AuthenticationName := EmptyStr;
  var AuthenticationValue := EmptyStr;
  var Method := TRttiContext.Create.GetType(TypeInfo(IContractMethodType)).GetMethod('ProcedureWithOutAttribute');

  Assert.IsFalse(TAuthentication.LoadHeaders(Method, AuthenticationName, AuthenticationValue));
end;

procedure TAuthenticationTest.IfTheMethodDoesntHaveAnAuthenticationAttributeMustLoadFromParentOfTheMehod;
begin
  var AuthenticationName := EmptyStr;
  var AuthenticationValue := EmptyStr;
  var Method := TRttiContext.Create.GetType(TypeInfo(IBasicAuthenticationService)).GetMethod('Proc');

  Assert.IsTrue(TAuthentication.LoadHeaders(Method, AuthenticationName, AuthenticationValue));
end;

procedure TAuthenticationTest.SetupFixture;
begin
  LoadAttributes(TypeInfo(IBasicAuthenticationService));

  LoadAttributes(TypeInfo(IBasicAuthenticationService2));

  LoadAttributes(TypeInfo(IContractMethodType));

  TBase64Encoding.Base64.Encode('User Name;Password');
end;

procedure TAuthenticationTest.TheBasicAuthenticationAttributeMustReturnTheUserNameAndPasswordInBase64;
begin
  var Attribute := BasicAuthenticationAttribute.Create('User Name', 'Password');

  Assert.AreEqual(TBase64Encoding.Base64.Encode('User Name:Password'), Attribute.LoadHeaderValue);

  Attribute.Free;
end;

procedure TAuthenticationTest.WhenFindInTheMethodAnAttributeOfAuthenticationMustReturnTrueInLoadHeaders;
begin
  var AuthenticationName := EmptyStr;
  var AuthenticationValue := EmptyStr;
  var Method := TRttiContext.Create.GetType(TypeInfo(IBasicAuthenticationService2)).GetMethod('AuthenticatedProc');

  Assert.IsTrue(TAuthentication.LoadHeaders(Method, AuthenticationName, AuthenticationValue));
end;

procedure TAuthenticationTest.WhenLoadTheHeaderValueMustReturnTheNameOfAuthentication;
begin
  var AuthenticationName := EmptyStr;
  var AuthenticationValue := EmptyStr;
  var Method := TRttiContext.Create.GetType(TypeInfo(IBasicAuthenticationService)).GetMethod('Proc');

  TAuthentication.LoadHeaders(Method, AuthenticationName, AuthenticationValue);

  Assert.AreEqual('Basic', AuthenticationName);
end;

procedure TAuthenticationTest.WhenTheMethodAndTheParentHaveAnAuthenticationAttributeMustReturnTheValueOnlyFromMethod;
begin
  var AuthenticationName := EmptyStr;
  var AuthenticationValue := EmptyStr;
  var Method := TRttiContext.Create.GetType(TypeInfo(IBasicAuthenticationService)).GetMethod('Proc2');

  TAuthentication.LoadHeaders(Method, AuthenticationName, AuthenticationValue);

  Assert.AreEqual(TBase64Encoding.Base64.Encode('Another User:Another Password'), AuthenticationValue);
end;

end.

