unit Blue.Print.Remote.Service.Test;

interface

uses DUnitX.TestFramework, System.Rtti, System.Classes, Blue.Print.Remote.Service, Translucent, Translucent.Intf, Blue.Print.Types;

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
    procedure TheParamsOfTheProcedureMustBeLoadedInTheQueryByDefault;
    [Test]
    procedure WhenTheParamValueHasLocaleCharsMustEncodeTheURL;
    [Test]
    procedure WhenTheProcedureHasRemoteNameWithLocaleCharsMustEncodeTheName;
    [Test]
    procedure WhenTheInterfaceHasRemoteNameWithLocaleCharsMustEncodeTheName;
    [Test]
    procedure WhenTheParamHasLocaleCharsMustEncodeTheName;
    [Test]
    procedure WhenTheParamHasThePathAttributeTheValueOfTheParamMustBeLoadedInTheURLOfTheRequest;
    [Test]
    procedure WhenAParamHasTheBodyAttributeMustLoadTheParamValueInTheBodyOfTheRequest;
    [Test]
    procedure WhenTheRequestDontHaveParamInBodyCantLoadTheBodyRequest;
  end;

  TCommunicationMock = class(TInterfacedObject, IHTTPCommunication)
  private
    FBody: TStream;
    FRequestMethod: TRequestMethod;
    FRequestSended: Boolean;
    FURL: String;

    function SendRequest(const RequestMethod: TRequestMethod; const URL: String; const Body: TStream): TStream;
  public
    destructor Destroy; override;

    property Body: TStream read FBody;
    property RequestMethod: TRequestMethod read FRequestMethod;
    property RequestSended: Boolean read FRequestSended;
    property URL: String read FURL;
  end;

  [BasicAuthentication('User', 'Password')]
  [GET]
  IServiceAutenticationTest = interface(IInvokable)
    ['{C99C50FD-92DF-42FB-A928-5C7BF1566C6F}']
    procedure Proc;
  end;

  [RemoteName('Serviçe')]
  ILocaleCharsService = interface(IInvokable)
    ['{04EA0C43-7C73-4ED1-A2B6-8B1E64ABC149}']
    procedure Proc;
    procedure Service(const Serviçe: String);
  end;

  IServiceTest = interface(IInvokable)
    ['{61DCD8A8-AD02-4EA3-AFC7-8425F7B12D6B}']
    function TestFunction: Integer;

    procedure ParameterInBody([Body]Param1: String);
    procedure ParameterInPath([Path]Param1: String; [Path]Param2: Integer);
    [RemoteName('Pãram')]
    procedure ProcedureWithRemoteNameLocaleChars;
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
    procedure TestProcedureWithParam(Param1: String; Param2: Integer);
  end;

  [PATCH]
  IServicePatch = interface(IInvokable)
    ['{D4C4C05B-58D7-4F89-BABE-6FCDB10EF15B}']
    procedure TestProcedure;
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

uses System.SysUtils, Blue.Print.Serializer, Web.ReqFiles;

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

procedure TRemoteServiceTest.Setup;
begin
  FCommunication := TCommunicationMock.Create;
  FCommunicationInterface := FCommunication;
end;

procedure TRemoteServiceTest.TearDown;
begin
  FCommunicationInterface := nil;
end;

procedure TRemoteServiceTest.TheParamsOfTheProcedureMustBeLoadedInTheQueryByDefault;
begin
  var Service := GetRemoteService<IServiceTest>(EmptyStr);

  Service.TestProcedureWithParam('abc', 123);

  Assert.AreEqual('/ServiceTest/TestProcedureWithParam/?Param1=abc;Param2=123', FCommunication.URL);
end;

procedure TRemoteServiceTest.TheRequestMethodMustBeTheSameOfTheAttributeOfTheMethod(const MethodName: String; const RequestType: TRequestMethod);
begin
  var Context := TRttiContext.Create;
  var Service := GetRemoteService<IServiceTest>(EmptyStr);

  Context.GetType(TypeInfo(IServiceTest)).GetMethod(MethodName).Invoke(TValue.From(Service), []);

  Assert.AreEqual(RequestType, FCommunication.RequestMethod);

  Context.Free;
end;

procedure TRemoteServiceTest.WhenAParamHasTheBodyAttributeMustLoadTheParamValueInTheBodyOfTheRequest;
begin
  var Service := GetRemoteService<IServiceTest>(EmptyStr);

  Service.ParameterInBody('Value');

  Assert.IsNotNull(FCommunication.Body);

  Assert.AreEqual<Int64>(10, FCommunication.Body.Size);
end;

procedure TRemoteServiceTest.WhenCallARemoteServiceMustBuildTheURLAsExpected;
begin
  var Service := GetRemoteService<IServiceTest>('http://myurl.com/myapi');

  Service.TestProcedure;

  Assert.AreEqual('http://myurl.com/myapi/ServiceTest/TestProcedure', FCommunication.URL);
end;

procedure TRemoteServiceTest.WhenCreateServiceMustReturnTheInterfaceFilled;
begin
  var Value := TRemoteService.CreateService<IServiceAutenticationTest>(EmptyStr);

  Assert.IsNotNull(Value);
end;

procedure TRemoteServiceTest.WhenGetServiceMustReturnTheInterfaceFilled;
begin
  var Value := CreateRemoteService<IServiceAutenticationTest>.GetService<IServiceAutenticationTest>(EmptyStr);

  Assert.IsNotNull(Value);
end;

procedure TRemoteServiceTest.WhenTheInterfaceHasRemoteNameWithLocaleCharsMustEncodeTheName;
begin
  var Service := GetRemoteService<ILocaleCharsService>(EmptyStr);

  Service.Proc;

  Assert.AreEqual('/Servi%C3%A7e/Proc', FCommunication.URL);
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

procedure TRemoteServiceTest.WhenTheParamHasThePathAttributeTheValueOfTheParamMustBeLoadedInTheURLOfTheRequest;
begin
  var Service := GetRemoteService<IServiceTest>(EmptyStr);

  Service.ParameterInPath('ããã', 123);

  Assert.AreEqual('/ServiceTest/ParameterInPath/%C3%A3%C3%A3%C3%A3/123', FCommunication.URL);
end;

procedure TRemoteServiceTest.WhenTheParamValueHasLocaleCharsMustEncodeTheURL;
begin
  var Service := GetRemoteService<IServiceTest>(EmptyStr);

  Service.TestProcedureWithParam('ããã', 123);

  Assert.AreEqual('/ServiceTest/TestProcedureWithParam/?Param1=%C3%A3%C3%A3%C3%A3;Param2=123', FCommunication.URL);
end;

procedure TRemoteServiceTest.WhenTheParamHasLocaleCharsMustEncodeTheName;
begin
  var Service := GetRemoteService<ILocaleCharsService>(EmptyStr);

  Service.Service('abc');

  Assert.AreEqual('/Servi%C3%A7e/Service/?Servi%C3%A7e=abc', FCommunication.URL);
end;

procedure TRemoteServiceTest.WhenTheProcedureHasRemoteNameWithLocaleCharsMustEncodeTheName;
begin
  var Service := GetRemoteService<IServiceTest>(EmptyStr);

  Service.ProcedureWithRemoteNameLocaleChars;

  Assert.AreEqual('/ServiceTest/P%C3%A3ram', FCommunication.URL);
end;

procedure TRemoteServiceTest.WhenTheProcedureHasTheRemoteNameAttributeMustSendThisNameInTheURLOfThRequest;
begin
  var Service := GetRemoteService<IServiceNamed>(EmptyStr);

  Service.WithName;

  Assert.AreEqual('/AnotherName/ProcedureWithAnotherName', FCommunication.URL);
end;

procedure TRemoteServiceTest.WhenTheRequestDontHaveParamInBodyCantLoadTheBodyRequest;
begin
  var Service := GetRemoteService<IServiceTest>(EmptyStr);

  Service.TestProcedure;

  Assert.IsNull(FCommunication.Body);
end;

{ TCommunicationMock }

destructor TCommunicationMock.Destroy;
begin
  FBody.Free;

  inherited;
end;

function TCommunicationMock.SendRequest(const RequestMethod: TRequestMethod; const URL: String; const Body: TStream): TStream;
begin
  FBody := Body;
  FRequestSended := True;
  Result := nil;

  if Assigned(FBody) then
    FBody.Position := 0;
end;

end.

