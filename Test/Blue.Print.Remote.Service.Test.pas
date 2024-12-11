unit Blue.Print.Remote.Service.Test;

interface

uses System.Rtti, System.Classes, System.TypInfo, System.Generics.Collections, System.SysUtils, Test.Insight.Framework, Blue.Print.Remote.Service, Blue.Print.Types;

type
  TCommunicationMock = class;
  TSerializerMock = class;

  [TestFixture]
  TRemoteServiceTest = class
  private
    FCommunication: TCommunicationMock;
    FCommunicationInterface: IHTTPCommunication;
    FSerializer: TSerializerMock;
    FSerializerInterface: IBluePrintSerializer;

    function CreateRemoteService<T: IInvokable>: TRemoteService;
    function GetRemoteService<T: IInvokable>(const URL: String): T;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure WhenGetServiceMustReturnTheInterfaceFilled;
    [Test]
    procedure WhenCallARemoteServiceMustBuildTheURLAsExpected;
    [Test]
    procedure WhenTheInterfaceHasTheRemoteNameMustSendThisNameInTheURLOfTheRequest;
    [Test]
    procedure WhenTheProcedureHasTheRemoteNameAttributeMustSendThisNameInTheURLOfThRequest;
    [TestCase('DELETE', 'TestDelete', 'TRequestMethod.Delete')]
    [TestCase('GET', 'TestGet', 'TRequestMethod.Get')]
    [TestCase('PATCH', 'TestPatch', 'TRequestMethod.Patch')]
    [TestCase('POST', 'TestPost', 'TRequestMethod.Post')]
    [TestCase('PUT', 'TestPut', 'TRequestMethod.Put')]
    procedure TheRequestMethodMustBeTheSameOfTheAttributeOfTheMethod(const MethodName: String; const RequestType: TRequestMethod);
    [Test]
    procedure WhenTheMethodDontHaveARequestMethodAttributeTheDefaultMethodMustBePost;
    [TestCase('PATCH', 'IServicePatch', 'TRequestMethod.Patch')]
    [TestCase('POST', 'IServiceParams', 'TRequestMethod.Get')]
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
    [Test]
    procedure WhenTheParamOfAnProcedureIsAnObjectMustSendTheValueInTheBodyOfTheRequest;
    [Test]
    procedure WhenTheParameterHasTheBodyAttributeMustSerializeTheValueBeforFillTheBodyValue;
    [Test]
    procedure WhenAFunctionIsCalledMustReturnTheValueOfTheCalledFunctionToTheCaller;
    [Test]
    procedure WhenAFunctionIsCalledMustDeserializeTheValueBeforeReturingTheValueForTheCaller;
    [Test]
    procedure WhenCallAnProcedureCanNotDeserializeTheReturningValue;
    [Test]
    procedure WhenTheRemoteNameAttributeInTheInterfaceIsEmptyCantPutTheBackslashInTheURL;
    [Test]
    procedure WhenTheRemoteNameAttributeInTheMethodIsEmptyCantPutTheBackslashInTheURL;
    [Test]
    procedure WhenTheInterfaceHasTheSoapServiceAttributeTheMethodNameMustBeLoadedInTheSoapActionHeader;
    [Test]
    procedure TheSoapActionHeaderMustBeLoadedOnlyIfTheSoapServiceAttributeIsLoadedInTheInterface;
    [Test]
    procedure WhenTheInterfaceHasTheSoapServiceAttributeMustLoadTheContentTypeHeaderWithTheSoapContentTypeValue;
    [Test]
    procedure WhenTheMethodHasTheSOAPActionAttributeMustLoadTheHeaderWithTheAttributeName;
    [Test]
    procedure WhenTheInterfaceHasTheSOAPServiceAttributeTheMethodCallCantBeLoadedInTheURLPath;
    [Test]
    procedure WhenSendASOAPRequestMustSerializeTheSOAPEnvelopInTheRequest;
    [Test]
    procedure WhenTheInterfaceHasTheSOAPServiceAttributeTheDefaultSerializerMustBeTheXMLSerializer;
    [Test]
    procedure WhenTheInterfaceHasntTheSOAPServiceAttributeTheDefaultSerializerMustBeTheJSONSerializer;
    [Test]
    procedure WhenCreateTheRemoteClassTheSerializerInTheParamsCantBeReplacedByAnotherSerializer;
    [Test]
    procedure WhenTheProcedureHasTheContentTypeAttributeMustFillTheHeaderInTheRequest;
    [Test]
    procedure WhenTheParamOfAProcedureHasTheAuthorizationAttributeMustLoadTheAuthorizationHeaderWithTheParamValue;
    [Test]
    procedure WhenInterfaceIsInheritedFromAnotherInterfaceMustSendTheBasePathWithTheNameOfTheHighInterface;
    [Test]
    procedure WhenTheInterfaceHasTheSoapServiceAttributeMustConcatTheBaseServiceNameInTheSOAPActionHeader;
    [Test]
    procedure WhenTheMethodHasTheAuthorizationAttributeThisValueCanBeLoadedInTheURLOfTheRequest;
    [Test]
    procedure WhenTheRequestHasAnBodyParamMustLoadTheContentTypeFromTheSerializerAsExpected;
    [Test]
    procedure WhenTheProcedureHasTheContentTypeAttributeMustLoadTheValueFromAttributeNotFromTheSerializer;
    [Test]
    procedure WhenCallAProcedureWithoutBodyParamCantLoadTheContentTypeOfTheRequest;
    [Test]
    procedure WhenLoadTheAuthorizationInformationMustLoadTheAuthorizationHeaderWithThisValue;
    [Test]
    procedure WhenTheInterfaceIsASOAPServiceTheContentTypeMustBeTheSOAPContentType;
    [Test]
    procedure TheSOAPContentTypeMustBeAppendedTheActionValue;
    [Test]
    procedure WhenTheInterfaceHasTheHeaderAttributeMustLoadTheHeaderValueInTheRequest;
    [Test]
    procedure WhenTheMethodHasTheHeaderAttributeMustLoadTheHeaderValueInTheRequest;
    [Test]
    procedure WhenFillAHeaderWithTheIHeadersInterfaceMustLoadTheValueInTheHeaderOfTheCommunication;
  end;

  TCommunicationMock = class(TInterfacedObject, IHTTPCommunication)
  private
    FBody: TStream;
    FHeaders: TDictionary<String, String>;
    FRequestMethod: TRequestMethod;
    FRequestSended: Boolean;
    FResponseValue: String;
    FURL: String;

    function GetHeader(const HeaderName: String): String;

    procedure SendRequest(const RequestMethod: TRequestMethod; const URL, Body: String; const AsyncRequest: Boolean; const CompleteEvent: TProc<String>; const ErrorEvent: TProc<Exception>);
    procedure SetCertificate(const Value: TStream; const Password: String);
    procedure SetHeader(const HeaderName, Value: String);
  public
    constructor Create;

    destructor Destroy; override;

    function GetBodyAsString: String;

    property Body: TStream read FBody;
    property Header[const HeaderName: String]: String read GetHeader write SetHeader;
    property ResponseValue: String read FResponseValue write FResponseValue;
    property RequestMethod: TRequestMethod read FRequestMethod;
    property RequestSended: Boolean read FRequestSended;
    property URL: String read FURL;
  end;

  TSerializerMock = class(TInterfacedObject, IBluePrintSerializer)
  private
    FDeserializeCalled: Boolean;
    FReturnValue: TValue;
    FSerializeValue: TValue;

    function Deserialize(const Value: String; const TypeInfo: PTypeInfo): TValue;
    function GetContentType: String;
    function Serialize(const Value: TValue): String;
  public
    property DeserializeCalled: Boolean read FDeserializeCalled;
    property ReturnValue: TValue read FReturnValue write FReturnValue;
    property SerializeValue: TValue read FSerializeValue;
  end;

  TMyObject = class
  private
    FValue: String;
  published
    property Value: String read FValue write FValue;
  end;

  [RemoteName('Serviçe')]
  ILocaleCharsService = interface(IInvokable)
    ['{04EA0C43-7C73-4ED1-A2B6-8B1E64ABC149}']
    procedure Proc;
    procedure Service(const Serviçe: String);
  end;

  [Header('InterfaceHeader', 'Interface Header')]
  [Header('InterfaceHeader2', 'Interface Header 2')]
  IServiceTest = interface(IInvokable)
    ['{61DCD8A8-AD02-4EA3-AFC7-8425F7B12D6B}']
    function TestFunction: String;

    procedure AuthorizationProcedure([Authorization]const AuthorizationValue: String);
    [ContentType('MyContent-Type')]
    procedure FillContentType;
    procedure ParameterInBody([Body]Param1: String);
    procedure ParameterInPath([Path]Param1: String; [Path]Param2: Integer);
    procedure ParameterMyObject([Body]Param1: TMyObject);
    [ContentType('MyContent-Type')]
    procedure ParameterWithContentType([Body]Param1: TMyObject);
    [RemoteName('Pãram')]
    procedure ProcedureWithRemoteNameLocaleChars;
    procedure SendObject(const AObject: TObject);
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
    [Header('MethodHeader', 'Method Header')]
    [Header('MethodHeader2', 'Method Header 2')]
    procedure TestHeader;
  end;

  IInheritedServiceTest = interface(IServiceTest)
    ['{C33D5E2F-D84C-46C9-82FC-DA339FFEAC4E}']
    procedure MyProcedure;
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
    [RemoteName('')]
    procedure WithoutRemoteName;
  end;

  [RemoteName('')]
  IEmptyServiceName = interface(IInvokable)
    ['{C79A8BD0-165A-4F59-8BE5-49BA0BCFFF5E}']
    procedure MyProc;
  end;

  [SoapService('MyService')]
  ISOAPService = interface(IInvokable)
    ['{29F73745-0A70-4C1A-9617-45A8711D7173}']
    procedure SoapBodyMethod(const [Body] Body: String);
    procedure SoapMethod;
    [SoapAction('MyAction')]
    procedure SoapNamedMethod;
  end;

implementation

uses Blue.Print.Serializer, Web.ReqFiles{$IFDEF DCC}, REST.Types{$ENDIF};

{ TRemoteServiceTest }

procedure TRemoteServiceTest.AfterLoadingTheRequestMustSendTheRequestToServer;
begin
  var Service := GetRemoteService<IServiceNamed>(EmptyStr);

  Service.Proc;

  Assert.IsTrue(FCommunication.RequestSended);
end;

function TRemoteServiceTest.CreateRemoteService<T>: TRemoteService;
begin
  Result := TRemoteService.Create(TypeInfo(T), FSerializer);
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
  FSerializer := TSerializerMock.Create;
  FSerializerInterface := FSerializer;
end;

procedure TRemoteServiceTest.TearDown;
begin
  FCommunicationInterface := nil;
  FSerializerInterface := nil;
end;

procedure TRemoteServiceTest.TheParamsOfTheProcedureMustBeLoadedInTheQueryByDefault;
begin
  var Service := GetRemoteService<IServiceTest>(EmptyStr);

  Service.TestProcedureWithParam('abc', 123);

  Assert.AreEqual('/IServiceTest/TestProcedureWithParam/?Param1=abc&Param2=123', FCommunication.URL);
end;

procedure TRemoteServiceTest.TheRequestMethodMustBeTheSameOfTheAttributeOfTheMethod(const MethodName: String; const RequestType: TRequestMethod);
begin
  var Context := TRttiContext.Create;
  var Service := GetRemoteService<IServiceTest>(EmptyStr);

  Context.GetType(TypeInfo(IServiceTest)).GetMethod(MethodName).Invoke(TValue.From(Service), []);

  Assert.AreEqual(RequestType, FCommunication.RequestMethod);

  Context.Free;
end;

procedure TRemoteServiceTest.TheSoapActionHeaderMustBeLoadedOnlyIfTheSoapServiceAttributeIsLoadedInTheInterface;
begin
  var Service := GetRemoteService<IServiceTest>(EmptyStr);

  Service.TestProcedure;

  Assert.AreEqual(EmptyStr, FCommunication.Header['SOAPAction']);
end;

procedure TRemoteServiceTest.TheSOAPContentTypeMustBeAppendedTheActionValue;
begin
  var Service := GetRemoteService<ISOAPService>(EmptyStr);

  Service.SoapNamedMethod;

  Assert.AreEqual('application/soap+xml;action=MyService/MyAction', FCommunication.Header['Content-Type']);
end;

procedure TRemoteServiceTest.WhenAFunctionIsCalledMustDeserializeTheValueBeforeReturingTheValueForTheCaller;
begin
  FSerializer.ReturnValue := 'Serializer';
  var Service := GetRemoteService<IServiceTest>(EmptyStr);

  FCommunication.ResponseValue := 'abc';

  var ReturnValue := Service.TestFunction;

  Assert.AreEqual(FSerializer.ReturnValue.AsString, ReturnValue);
end;

procedure TRemoteServiceTest.WhenAFunctionIsCalledMustReturnTheValueOfTheCalledFunctionToTheCaller;
begin
  FSerializer.ReturnValue := 'abc';
  var Service := GetRemoteService<IServiceTest>(EmptyStr);

  FCommunication.ResponseValue := 'abc';

  var ReturnValue := Service.TestFunction;

  Assert.AreEqual('abc', ReturnValue);
end;

procedure TRemoteServiceTest.WhenAParamHasTheBodyAttributeMustLoadTheParamValueInTheBodyOfTheRequest;
begin
  var Service := GetRemoteService<IServiceTest>(EmptyStr);
  FSerializer.ReturnValue := 'Value';

  Service.ParameterInBody('Value');

  Assert.IsNotNil(FCommunication.Body);

  Assert.AreEqual('Value', FCommunication.GetBodyAsString);
end;

procedure TRemoteServiceTest.WhenCallAnProcedureCanNotDeserializeTheReturningValue;
begin
  var Service := GetRemoteService<IServiceTest>(EmptyStr);

  Service.TestProcedure;

  Assert.IsFalse(FSerializer.DeserializeCalled);
end;

procedure TRemoteServiceTest.WhenCallAProcedureWithoutBodyParamCantLoadTheContentTypeOfTheRequest;
begin
  var Service := GetRemoteService<IServiceTest>(EmptyStr);

  Service.ParameterInPath('', 0);

  Assert.AreEqual(EmptyStr, FCommunication.Header['Content-Type']);
end;

procedure TRemoteServiceTest.WhenCallARemoteServiceMustBuildTheURLAsExpected;
begin
  var Service := GetRemoteService<IServiceTest>('http://myurl.com/myapi');

  Service.TestProcedure;

  Assert.AreEqual('http://myurl.com/myapi/IServiceTest/TestProcedure', FCommunication.URL);
end;

procedure TRemoteServiceTest.WhenCreateTheRemoteClassTheSerializerInTheParamsCantBeReplacedByAnotherSerializer;
begin
  var RemoteClass := TRemoteService.Create(TypeInfo(IServiceNamed), TSerializerMock.Create);

  Assert.AreEqual(TSerializerMock, TObject(RemoteClass.Serializer).ClassType);

  RemoteClass.Free;
end;

procedure TRemoteServiceTest.WhenFillAHeaderWithTheIHeadersInterfaceMustLoadTheValueInTheHeaderOfTheCommunication;
begin
  var Service := GetRemoteService<IServiceTest>(EmptyStr) as IHeaders;

  Service.Header['MyHeader'] := 'My Value';

  Assert.AreEqual('My Value', FCommunication.Header['MyHeader']);
end;

procedure TRemoteServiceTest.WhenGetServiceMustReturnTheInterfaceFilled;
begin
  var Value := CreateRemoteService<IServiceNamed>.GetService<IServiceNamed>(EmptyStr);

  Assert.IsNotNil(Value);
end;

procedure TRemoteServiceTest.WhenInterfaceIsInheritedFromAnotherInterfaceMustSendTheBasePathWithTheNameOfTheHighInterface;
begin
  var Service := GetRemoteService<IInheritedServiceTest>(EmptyStr);

  Service.TestProcedure;

  Assert.AreEqual('/IInheritedServiceTest/TestProcedure', FCommunication.URL);
end;

procedure TRemoteServiceTest.WhenLoadTheAuthorizationInformationMustLoadTheAuthorizationHeaderWithThisValue;
begin
  var Service := GetRemoteService<IServiceTest>(EmptyStr) as IAuthorization;

  Service.Value := 'Value Token';

  Assert.AreEqual('Value Token', FCommunication.Header['Authorization']);
end;

procedure TRemoteServiceTest.WhenSendASOAPRequestMustSerializeTheSOAPEnvelopInTheRequest;
begin
  var Service := GetRemoteService<ISOAPService>('Host');

  Service.SoapBodyMethod('Value');

  Assert.AreEqual(TypeInfo(TSOAPEnvelop), FSerializer.SerializeValue.TypeInfo);
end;

procedure TRemoteServiceTest.WhenTheInterfaceHasntTheSOAPServiceAttributeTheDefaultSerializerMustBeTheJSONSerializer;
begin
  var RemoteClass := TRemoteService.Create(TypeInfo(IServiceNamed), nil);

  Assert.AreEqual(TBluePrintJsonSerializer, TObject(RemoteClass.Serializer).ClassType);

  RemoteClass.Free;
end;

procedure TRemoteServiceTest.WhenTheInterfaceHasRemoteNameWithLocaleCharsMustEncodeTheName;
begin
  var Service := GetRemoteService<ILocaleCharsService>(EmptyStr);

  Service.Proc;

  Assert.AreEqual('/Servi%C3%A7e/Proc', FCommunication.URL);
end;

procedure TRemoteServiceTest.WhenTheInterfaceHasTheHeaderAttributeMustLoadTheHeaderValueInTheRequest;
begin
  var Service := GetRemoteService<IServiceTest>(EmptyStr);

  Service.TestGET;

  Assert.AreEqual('Interface Header', FCommunication.Header['InterfaceHeader']);
  Assert.AreEqual('Interface Header 2', FCommunication.Header['InterfaceHeader2']);
end;

procedure TRemoteServiceTest.WhenTheInterfaceHasTheRemoteNameMustSendThisNameInTheURLOfTheRequest;
begin
  var Service := GetRemoteService<IServiceNamed>(EmptyStr);

  Service.Proc;

  Assert.AreEqual('/AnotherName/Proc', FCommunication.URL);
end;

procedure TRemoteServiceTest.WhenTheInterfaceHasTheSoapServiceAttributeMustConcatTheBaseServiceNameInTheSOAPActionHeader;
begin
  var Service := GetRemoteService<ISOAPService>(EmptyStr);

  Service.SoapNamedMethod;

  Assert.AreEqual('application/soap+xml;action=MyService/MyAction', FCommunication.Header['Content-Type']);
end;

procedure TRemoteServiceTest.WhenTheInterfaceHasTheSoapServiceAttributeMustLoadTheContentTypeHeaderWithTheSoapContentTypeValue;
begin
  var Service := GetRemoteService<ISOAPService>(EmptyStr);

  Service.SoapMethod;

  Assert.StartWith(CONTENTTYPE_APPLICATION_SOAP_XML, FCommunication.Header['Content-Type']);
end;

procedure TRemoteServiceTest.WhenTheInterfaceHasTheSOAPServiceAttributeTheDefaultSerializerMustBeTheXMLSerializer;
begin
  var RemoteClass := TRemoteService.Create(TypeInfo(ISOAPService), nil);

  Assert.AreEqual(TBluePrintXMLSerializer, TObject(RemoteClass.Serializer).ClassType);

  RemoteClass.Free;
end;

procedure TRemoteServiceTest.WhenTheInterfaceHasTheSOAPServiceAttributeTheMethodCallCantBeLoadedInTheURLPath;
begin
  var Service := GetRemoteService<ISOAPService>('Host');

  Service.SoapMethod;

  Assert.AreEqual('Host/ISOAPService', FCommunication.URL);
end;

procedure TRemoteServiceTest.WhenTheInterfaceHasTheSoapServiceAttributeTheMethodNameMustBeLoadedInTheSoapActionHeader;
begin
  var Service := GetRemoteService<ISOAPService>(EmptyStr);

  Service.SoapMethod;

  Assert.AreEqual('application/soap+xml;action=MyService/SoapMethod', FCommunication.Header['Content-Type']);
end;

procedure TRemoteServiceTest.WhenTheInterfaceIsASOAPServiceTheContentTypeMustBeTheSOAPContentType;
begin
  var Service := GetRemoteService<ISOAPService>(EmptyStr);

  Service.SoapMethod;

  Assert.StartWith('application/soap+xml', FCommunication.Header['Content-Type']);
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
    var Service := GetRemoteService<IServiceNamed>(EmptyStr);

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

procedure TRemoteServiceTest.WhenTheMethodHasTheAuthorizationAttributeThisValueCanBeLoadedInTheURLOfTheRequest;
begin
  var Service := GetRemoteService<IServiceTest>(EmptyStr);

  Service.AuthorizationProcedure('My Value');

  Assert.AreEqual('/IServiceTest/AuthorizationProcedure', FCommunication.URL);
end;

procedure TRemoteServiceTest.WhenTheMethodHasTheHeaderAttributeMustLoadTheHeaderValueInTheRequest;
begin
  var Service := GetRemoteService<IServiceTest>(EmptyStr);

  Service.TestHeader;

  Assert.AreEqual('Method Header', FCommunication.Header['MethodHeader']);
  Assert.AreEqual('Method Header 2', FCommunication.Header['MethodHeader2']);
end;

procedure TRemoteServiceTest.WhenTheMethodHasTheSOAPActionAttributeMustLoadTheHeaderWithTheAttributeName;
begin
  var Service := GetRemoteService<ISOAPService>(EmptyStr);

  Service.SoapNamedMethod;

  Assert.AreEqual('application/soap+xml;action=MyService/MyAction', FCommunication.Header['Content-Type']);
end;

procedure TRemoteServiceTest.WhenTheParamHasThePathAttributeTheValueOfTheParamMustBeLoadedInTheURLOfTheRequest;
begin
  var Service := GetRemoteService<IServiceTest>(EmptyStr);

  Service.ParameterInPath('ããã', 123);

  Assert.AreEqual('/IServiceTest/ParameterInPath/%C3%A3%C3%A3%C3%A3/123', FCommunication.URL);
end;

procedure TRemoteServiceTest.WhenTheParamOfAnProcedureIsAnObjectMustSendTheValueInTheBodyOfTheRequest;
begin
  var Service := GetRemoteService<IServiceTest>(EmptyStr);
  FSerializer.ReturnValue := 'JSON';

  Service.SendObject(Self);

  Assert.AreEqual('JSON', FCommunication.GetBodyAsString);
end;

procedure TRemoteServiceTest.WhenTheParamOfAProcedureHasTheAuthorizationAttributeMustLoadTheAuthorizationHeaderWithTheParamValue;
begin
  var Service := GetRemoteService<IServiceTest>(EmptyStr);

  Service.AuthorizationProcedure('My Value');

  Assert.AreEqual('My Value', FCommunication.Header['Authorization']);
end;

procedure TRemoteServiceTest.WhenTheParamValueHasLocaleCharsMustEncodeTheURL;
begin
  var Service := GetRemoteService<IServiceTest>(EmptyStr);

  Service.TestProcedureWithParam('ããã', 123);

  Assert.AreEqual('/IServiceTest/TestProcedureWithParam/?Param1=%C3%A3%C3%A3%C3%A3&Param2=123', FCommunication.URL);
end;

procedure TRemoteServiceTest.WhenTheParameterHasTheBodyAttributeMustSerializeTheValueBeforFillTheBodyValue;
begin
  var Service := GetRemoteService<IServiceTest>(EmptyStr);
  FSerializer.ReturnValue := 'Serializer';

  Service.ParameterInBody('Value');

  Assert.IsNotNil(FCommunication.Body);

  Assert.AreEqual(FSerializer.ReturnValue.AsString, FCommunication.GetBodyAsString);
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

  Assert.AreEqual('/IServiceTest/P%C3%A3ram', FCommunication.URL);
end;

procedure TRemoteServiceTest.WhenTheProcedureHasTheContentTypeAttributeMustFillTheHeaderInTheRequest;
begin
  var Service := GetRemoteService<IServiceTest>(EmptyStr);

  Service.FillContentType;

  Assert.AreEqual('MyContent-Type', FCommunication.Header['Content-Type']);
end;

procedure TRemoteServiceTest.WhenTheProcedureHasTheContentTypeAttributeMustLoadTheValueFromAttributeNotFromTheSerializer;
begin
  var MyObject := TMyObject.Create;
  var Service := GetRemoteService<IServiceTest>(EmptyStr);

  Service.ParameterWithContentType(MyObject);

  Assert.AreEqual('MyContent-Type', FCommunication.Header['Content-Type']);

  MyObject.Free;
end;

procedure TRemoteServiceTest.WhenTheProcedureHasTheRemoteNameAttributeMustSendThisNameInTheURLOfThRequest;
begin
  var Service := GetRemoteService<IServiceNamed>(EmptyStr);

  Service.WithName;

  Assert.AreEqual('/AnotherName/ProcedureWithAnotherName', FCommunication.URL);
end;

procedure TRemoteServiceTest.WhenTheRemoteNameAttributeInTheInterfaceIsEmptyCantPutTheBackslashInTheURL;
begin
  var Service := GetRemoteService<IEmptyServiceName>(EmptyStr);

  Service.MyProc;

  Assert.AreEqual('/MyProc', FCommunication.URL);
end;

procedure TRemoteServiceTest.WhenTheRemoteNameAttributeInTheMethodIsEmptyCantPutTheBackslashInTheURL;
begin
  var Service := GetRemoteService<IServiceNamed>(EmptyStr);

  Service.WithoutRemoteName;

  Assert.AreEqual('/AnotherName', FCommunication.URL);
end;

procedure TRemoteServiceTest.WhenTheRequestDontHaveParamInBodyCantLoadTheBodyRequest;
begin
  var Service := GetRemoteService<IServiceTest>(EmptyStr);

  Service.TestProcedure;

  Assert.IsNil(FCommunication.Body);
end;

procedure TRemoteServiceTest.WhenTheRequestHasAnBodyParamMustLoadTheContentTypeFromTheSerializerAsExpected;
begin
  FSerializer.ReturnValue := 'abc';
  var MyObject := TMyObject.Create;
  var Service := GetRemoteService<IServiceTest>(EmptyStr);

  Service.ParameterMyObject(MyObject);

  Assert.AreEqual('serializer/content', FCommunication.Header['Content-Type']);

  MyObject.Free;
end;

{ TCommunicationMock }

constructor TCommunicationMock.Create;
begin
  FHeaders := TDictionary<String, String>.Create;
end;

destructor TCommunicationMock.Destroy;
begin
  FBody.Free;

  FHeaders.Free;

  inherited;
end;

function TCommunicationMock.GetBodyAsString: String;
begin
  var Reader := TStreamReader.Create(FBody, TEncoding.UTF8);

  Result := Reader.ReadToEnd;

  Reader.Free;
end;

function TCommunicationMock.GetHeader(const HeaderName: String): String;
begin
  Result := EmptyStr;

  FHeaders.TryGetValue(HeaderName, Result);
end;

procedure TCommunicationMock.SendRequest(const RequestMethod: TRequestMethod; const URL, Body: String; const AsyncRequest: Boolean; const CompleteEvent: TProc<String>; const ErrorEvent: TProc<Exception>);
begin
  FRequestMethod := RequestMethod;
  FRequestSended := True;
  FURL := URL;

  if not Body.IsEmpty then
    FBody := TStringStream.Create(Body);

  CompleteEvent(ResponseValue);
end;

procedure TCommunicationMock.SetCertificate(const Value: TStream; const Password: String);
begin

end;

procedure TCommunicationMock.SetHeader(const HeaderName, Value: String);
begin
  FHeaders.AddOrSetValue(HeaderName, Value);
end;

{ TSerializerMock }

function TSerializerMock.Deserialize(const Value: String; const TypeInfo: PTypeInfo): TValue;
begin
  FDeserializeCalled := True;
  Result := FReturnValue;

  if FReturnValue.TypeInfo <> TypeInfo then
    raise Exception.Create('Types mismatch!');
end;

function TSerializerMock.GetContentType: String;
begin
  Result := 'serializer/content';
end;

function TSerializerMock.Serialize(const Value: TValue): String;
begin
  FSerializeValue := Value;
  Result := FReturnValue.AsString;
end;

end.

