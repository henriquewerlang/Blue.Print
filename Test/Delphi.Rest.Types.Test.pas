unit Delphi.Rest.Types.Test;

interface

uses DUnitX.TestFramework, Delphi.Rest.Types;

type
  [TestFixture]
  TRESTParamAttributeTest = class
  public
    [SetupFixture]
    procedure SetupFixture;
    [Test]
    procedure IfTheInterfaceHasntAnyAttributeMustReturnFalseInTheFunction;
    [Test]
    procedure WhenTheMethodHasTheAttributeParamInBodyMustReturnParamInBodyType;
    [Test]
    procedure WhenTheMethodHasTheAttributeParamInURLMustReturnParamInURLType;
    [Test]
    procedure WhenTheProcedureHasntAttributeMustReturnTrueIfExistsAnAttributeInTheInterface;
    [Test]
    procedure WhenTheProcedureHasntAttributeMustReturnTheParamTypeFromTheInterface;
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
    procedure WhenGetTheTypeOfMethodMustReturnAsExpected(MethodToCompare: TRESTMethod);
    [Test]
    procedure WhenTheProcedureHasntAttributeMustReturnTrueIfTheClassHasTheAttribute;
    [Test]
    procedure WhenTheProcedureHasntAttributeMustReturnTheTypeFromTheClassAttribute;
  end;

  IContractWithOutAttributes = interface(IInvokable)
    ['{1C952251-1DFC-4C36-BA63-FC9D7CC7F7E8}']
    procedure Proc;
  end;

  [ParamInBody]
  IContractTest = interface(IInvokable)
    ['{CF2BB234-0D53-49FB-979D-650DCEF196F2}']
    [ParamInBody]
    procedure ParamInBody;
    [ParamInURL]
    procedure ParamInURL;
    procedure ProcedureWithOutAttribute;
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

implementation

uses System.Rtti;

{ TRESTParamAttributeTest }

procedure TRESTParamAttributeTest.IfTheInterfaceHasntAnyAttributeMustReturnFalseInTheFunction;
begin
  var Method := TRttiContext.Create.GetType(TypeInfo(IContractWithOutAttributes)).GetMethod('Proc');
  var ParamType: TRESTParamType;

  Assert.IsFalse(TRESTParamAttribute.GetParamsInURL(Method, ParamType));
end;

procedure TRESTParamAttributeTest.SetupFixture;
begin
  for var Method in TRttiContext.Create.GetType(TypeInfo(IContractTest)).GetMethods do
  begin
    Method.GetAttributes;

    Method.Parent.GetAttributes;
  end;
end;

procedure TRESTParamAttributeTest.WhenTheMethodHasTheAttributeParamInBodyMustReturnParamInBodyType;
begin
  var Method := TRttiContext.Create.GetType(TypeInfo(IContractTest)).GetMethod('ParamInBody');
  var ParamType: TRESTParamType;

  TRESTParamAttribute.GetParamsInURL(Method, ParamType);

  Assert.AreEqual(ptBody, ParamType);
end;

procedure TRESTParamAttributeTest.WhenTheMethodHasTheAttributeParamInURLMustReturnParamInURLType;
begin
  var Method := TRttiContext.Create.GetType(TypeInfo(IContractTest)).GetMethod('ParamInURL');
  var ParamType: TRESTParamType;

  TRESTParamAttribute.GetParamsInURL(Method, ParamType);

  Assert.AreEqual(ptURL, ParamType);
end;

procedure TRESTParamAttributeTest.WhenTheProcedureHasntAttributeMustReturnTheParamTypeFromTheInterface;
begin
  var Method := TRttiContext.Create.GetType(TypeInfo(IContractTest)).GetMethod('ProcedureWithOutAttribute');
  var ParamType: TRESTParamType;

  TRESTParamAttribute.GetParamsInURL(Method, ParamType);

  Assert.AreEqual(ptBody, ParamType);
end;

procedure TRESTParamAttributeTest.WhenTheProcedureHasntAttributeMustReturnTrueIfExistsAnAttributeInTheInterface;
begin
  var Method := TRttiContext.Create.GetType(TypeInfo(IContractTest)).GetMethod('ProcedureWithOutAttribute');
  var ParamType: TRESTParamType;

  Assert.IsTrue(TRESTParamAttribute.GetParamsInURL(Method, ParamType));
end;

{ TRESTMethodAttributeTest }

procedure TRESTMethodAttributeTest.IfTheMethodHasntAttributeMustReturnFalseInTheFunction;
begin
  var Method := TRttiContext.Create.GetType(TypeInfo(IContractWithOutAttributes)).GetMethod('Proc');
  var MethodType: TRESTMethod;

  Assert.IsFalse(TRESTMethodAttribute.GetMethodType(Method, MethodType));
end;

procedure TRESTMethodAttributeTest.SetupFixture;
begin
  for var Method in TRttiContext.Create.GetType(TypeInfo(IContractMethodType)).GetMethods do
  begin
    Method.GetAttributes;

    Method.Parent.GetAttributes;
  end;
end;

procedure TRESTMethodAttributeTest.WhenGetTheTypeOfMethodMustReturnAsExpected(MethodToCompare: TRESTMethod);
const
  COMMAND_NAME: array[TRESTMethod] of String = ('Delete', 'Get', 'Patch', 'Post', 'Put');

begin
  var Method := TRttiContext.Create.GetType(TypeInfo(IContractMethodType)).GetMethod(COMMAND_NAME[MethodToCompare]);
  var MethodType: TRESTMethod;

  TRESTMethodAttribute.GetMethodType(Method, MethodType);

  Assert.AreEqual(MethodToCompare, MethodType);
end;

procedure TRESTMethodAttributeTest.WhenTheProcedureHasntAttributeMustReturnTheTypeFromTheClassAttribute;
begin
  var Method := TRttiContext.Create.GetType(TypeInfo(IContractMethodType)).GetMethod('ProcedureWithOutAttribute');
  var MethodType: TRESTMethod;

  TRESTMethodAttribute.GetMethodType(Method, MethodType);

  Assert.AreEqual(rmPost, MethodType);
end;

procedure TRESTMethodAttributeTest.WhenTheProcedureHasntAttributeMustReturnTrueIfTheClassHasTheAttribute;
begin
  var Method := TRttiContext.Create.GetType(TypeInfo(IContractMethodType)).GetMethod('ProcedureWithOutAttribute');
  var MethodType: TRESTMethod;

  Assert.IsTrue(TRESTMethodAttribute.GetMethodType(Method, MethodType));
end;

end.
