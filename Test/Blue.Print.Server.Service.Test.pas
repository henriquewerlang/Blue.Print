unit Blue.Print.Server.Service.Test;

interface

uses System.SysUtils, System.Classes, System.Rtti, Web.HTTPApp, Rest.Types, DUnitX.TestFramework, Blue.Print.Server.Service, Blue.Print.Types, Blue.Print.Service.Container,
  Translucent, Translucent.Classes, Blue.Print.Request.Mock, Translucent.Intf;

type
  TMyEnumerator = (Enum1, Enum2, Enum3, Enum4);
  TMyEnumeratorSet = set of TMyEnumerator;

  TMyClass = class
  private
    FValue: Integer;
  published
    property Value: Integer read FValue write FValue;
  end;

  [ContentType(CONTENTTYPE_APPLICATION_OGG)]
  [Header('My Service Header', 'My Service Value')]
  [Header('My Service Header 2', 'My Service Value 2')]
  IContentService = interface(IInvokable)
    ['{E43D13E0-B5D6-4EF9-BC4A-A481BCAC0F5C}']
    [Attachment('MyFile.pas', CONTENTTYPE_APPLICATION_ZIP)]
    function MyAttachmentFunction: String;
    [ContentType(CONTENTTYPE_APPLICATION_ATOM_XML, 'MyCharSet')]
    function MyCharSetFunction: String;
    [ContentType(CONTENTTYPE_APPLICATION_ATOM_XML)]
    function MyContentFunction: String;
    function MyFunction: String;

    [Header('My Header', 'My Value')]
    [Header('My Header 2', 'My Value 2')]
    procedure ProcedureWithHeader;
    procedure MyProcedure;
  end;

  IService = interface
    ['{FD524CA4-55CF-4005-B47A-48B220718AA0}']
    function FuncClass: TMyClass;
    function FuncInteger: Integer;
    function GetStream: TRequestFile;
    function ProcedureCalled: String;
    function ReturnStream: TResponseFile;
    function ReturnStreamNil: TResponseFile;

    procedure Proc;
    procedure ProcArray(Value: TArray<String>);
    procedure ProcChar(Value: AnsiChar);
    procedure ProcClass(Value: TMyClass);
    procedure ProcClassRef(Value: TClass);
    procedure ProcEnum(Value: TMyEnumerator);
    procedure ProcFloat(Value: Currency);
    procedure ProcInt64(Value: Int64);
    procedure ProcInteger(Value: Integer);
    procedure ProcInterface(Value: IInterface);
    procedure ProcLString(Value: AnsiString);
    procedure ProcMethod(Value: TNotifyEvent);
    procedure ProcParam(Value: Integer);
    procedure ProcParamString(Value: String);
    procedure ProcPointer(Value: Pointer);
    procedure ProcProcedure(Value: TProc);
    procedure ProcSet(Value: TMyEnumeratorSet);
    procedure ProcStream(Stream: TRequestFile);
    procedure ProcStreamArray(Stream: TArray<TRequestFile>);
    procedure ProcStreamTwoParam(File1, File2: TRequestFile);
    procedure ProcString(Value: ShortString);
    procedure ProcUString(Value: UnicodeString);
    procedure ProcVariant(Value: Variant);
    procedure ProcWChar(Value: Char);
    procedure ProcWString(Value: WideString);
    procedure ProcedureWithParamsInBody(Param1: String; Param2: Integer);
    procedure ProcedureWithOutAttribute(Param1: String; Param2: Integer);
  end;

  [TestFixture]
  TRestServerServiceTest = class
  private
    FContentServiceMock: IMock<IContentService>;
    FRestService: TRestServerService;
    FServiceMock: IMock<IService>;
    FServiceContainer: IMock<IServiceContainer>;

    function CreateRestService(Request: TWebRequest; Response: TWebResponse; Container: IServiceContainer = nil): IWebAppServices;
    function CreateRequestMock: TMockClass<TWebRequestMock>; overload;
    function CreateRequestMock(const URL, ContentType, ContentValue, QueryString: String): TMockClass<TWebRequestMock>; overload;
    function CreateRequestMock(const URL, ContentType: String; const ContentValue: TBytes; const QueryString: String): TMockClass<TWebRequestMock>; overload;
  public
    [Setup]
    procedure Setup;
    [SetupFixture]
    procedure SetupFixture;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure WhenTheRequestIsTheRootURLMustReturnHandledToFalse;
    [Test]
    procedure WhenFindTheClassToRespondTheRequestMustReturnHandledToTrue;
    [Test]
    procedure IfTheRequestDontHaveTheProcedureParamMustFillTheStatusCodigoWith404;
    [Test]
    procedure IfDontFindTheProcedureOfRequestMustReturStatusCodeWith404;
    [Test]
    procedure IfNotFoundTheServiceMustReturnHandledToFalse;
    [Test]
    procedure WhenTheRequestIsCorrectMustCallTheProcedureRequested;
    [Test]
    procedure WhenThePathHasMoreThenTwoLevelsMustReturn404;
    [Test]
    procedure WhenTheProcedureHaveParamMustCallWithTheParamOfTheRequest;
    [TestCase('ClassRef', 'ProcClassRef')]
    [TestCase('Method', 'ProcMethod')]
    [TestCase('Interface', 'ProcInterface')]
    [TestCase('Pointer', 'ProcPointer')]
    [TestCase('Procedure', 'ProcProcedure')]
    [TestCase('Variant', 'ProcVariant')]
    procedure WhenTheTypeIsInvalidMustRaiseAnError(ProcedureName: String);
    [TestCase('Array', 'ProcArray;["abc", "zzz"]', ';')]
    [TestCase('Char', 'ProcChar,S')]
    [TestCase('Class', 'ProcClass,{"Value": 1234}')]
    [TestCase('Enum', 'ProcEnum,2')]
    [TestCase('Float', 'ProcFloat,123.456')]
    [TestCase('Int64', 'ProcInt64,123456789012')]
    [TestCase('Integer', 'ProcInteger,1234')]
    [TestCase('LString', 'ProcLString,abcd')]
    [TestCase('Set', 'ProcSet;13', ';')]
    [TestCase('String', 'ProcString,abcd')]
    [TestCase('UString', 'ProcUString,abcd')]
    [TestCase('WChar', 'ProcWChar,W')]
    [TestCase('WString', 'ProcWString,abcd')]
    procedure MustCallTheProcedureWithTheParamValuePassed(ProcedureName, Value: String);
    [TestCase('Array', 'ProcArray;["abc", "zzz"]', ';')]
    [TestCase('Char', 'ProcChar,S')]
    [TestCase('Class', 'ProcClass,{"Value": 1234}')]
    [TestCase('Enum', 'ProcEnum,2')]
    [TestCase('Float', 'ProcFloat,123.456')]
    [TestCase('Int64', 'ProcInt64,123456789012')]
    [TestCase('Integer', 'ProcInteger,1234')]
    [TestCase('LString', 'ProcLString,abcd')]
    [TestCase('Set', 'ProcSet;13', ';')]
    [TestCase('String', 'ProcString,abcd')]
    [TestCase('UString', 'ProcUString,abcd')]
    [TestCase('WChar', 'ProcWChar,W')]
    [TestCase('WString', 'ProcWString,abcd')]
    procedure ConvertingParamsAsExpected(ProcedureName, Value: String);
    [TestCase('More then', 'Param1=123&Param2=123&Param3=123')]
    [TestCase('Less then', '')]
    procedure WhenTheAmountOfRequestParametersIsDiferrentFromTheAmoutOfProcedureParametersMustReturnBadRequest(Params: String);
    [Test]
    procedure WhenTheRequestExecutionWasSucessfullyMustReturnTheJSONResult;
    [Test]
    procedure WhenTheRequestIsForAProcedureCantRaiseErrorOfSerialization;
    [Test]
    procedure WhenTheRequestCallAFunctionAndTheReturnIsAClassMustReturnTheJSONAsSpected;
    [Test]
    procedure WhenCalledTheGetExceptionHandlerMustReturnTheExceptionHandler;
    [Test]
    procedure WhenAnExceptionIsHandledMustReturnTrueInTheHandleParam;
    [Test]
    procedure OnceTheExceptionIsHandledTheStatusCodeMustBe500;
    [Test]
    procedure TheExceptionMessageMustBeInTheContentOfTheResponse;
    [Test]
    procedure AfterHandleTheExceptionMustSendTheResponseForTheClient;
    [Test]
    procedure WhenTheRequestIsAFileTheRequestMustReturnFalse;
    [Test]
    procedure WhenTheRequestExecuteAsExpectedTheStatusCode200;
    [Test]
    procedure WhenTheRequestedFunctionAsAReturnMustFillTheContentTypeWithApplicationJSON;
    [Test]
    procedure WhenTheProcedureOfTheRequestIsMarkedWithParamInBodyMustLoadTheParamsValuesFromBody;
    [TestCase('DELETE', 'DELETE,True')]
    [TestCase('GET', 'GET,True')]
    [TestCase('PATCH', 'PATCH,False')]
    [TestCase('POST', 'POST,False')]
    [TestCase('PUT', 'PUT,False')]
    procedure WhenTheContractHasntAnyAttributeOfParamTypeMustLoadTheParamsByProcedureType(MethodType: String; ParamInURL: Boolean);
    [Test]
    procedure WhenTheContentIsABinaryValueCantRaiseAnyError;
    [Test]
    procedure MustTryToLoadTheProcedureParamsFromTheURLAndTheBody;
    [Test]
    procedure WhenTheParamIsATStreamMustLoadTheFileInTheRequest;
    [Test]
    procedure WhenTheContentIsABinaryValueMustPassTheValueToTheParamOfTheProcedureCalled;
    [Test]
    procedure WhenTheProcedureCalledIsAnArrayOfStreamMustCallTheCorrectProcedure;
    [Test]
    procedure WhenTheProcedureHasMoreThenOneFileMustLoadEachFileInTheCorrecParam;
    [Test]
    procedure IfTheParamIsInTheQueryFieldsCantTryToLoadTheValueFromContent;
    [Test]
    procedure WhenTheParamIsEmptyCantRaiseAnyErrorOfConversion;
    [Test]
    procedure WhenTryToLoadAParamFromTheContentMustLoadOnlyIfTheContentTypeIsFormURLEncoded;
    [Test]
    procedure WhenTryToLoadAParamFromTheContentMustLoadOnlyIfTheContentTypeIsMultiPartFormData;
    [Test]
    procedure WhenTheProcedureBeenCalledHasASigleParamMustLoadTheParamFromTheContent;
    [Test]
    procedure WhenTheProcedureBeenCalledHasASigleParamMustLoadTheParamFromTheContentIfTheContentIsAJSONValue;
    [Test]
    procedure WhenTheProcedureBeenCalledHasASigleParamMustLoadTheParamFromTheContentIfTheContentIsTextPlain;
    [Test]
    procedure WhenTheContentIsEmptyMustReturnTheBadRequestStatus;
    [Test]
    procedure WhenTheServiceContainerIsNotLoadedMustRaiseAnError;
    [Test]
    procedure WhenTheServiceNameHasDotsInTheNameMustHandleTheRequest;
    [Test]
    procedure WhenTheClassHasTheContentTypeAttributeMustReturnThisTypeInTheResponse;
    [Test]
    procedure WhenTheMethodHasTheContenteTypeAttributeMustReturnThisTypeInTheResponse;
    [Test]
    procedure WhenTheServiceDontHaveTheContentTypeAttributeMustReturnTheApplicationJsonContentByDefault;
    [Test]
    procedure IfTheContentTypeAttributeHasACharSetThisMustBeLoadedInTheContentTypeInfo;
    [Test]
    procedure WhenAFunctionHaveTheAttachmentAttributeMustReturnTheContentTypeAndContentDispositionInTheHeaderResponse;
    [Test]
    procedure IfTheFunctionDoesntHaveTheAttachmentAttributeCantRaiseAnyError;
    [Test]
    procedure WhenReturnATStreamCantSerializeTheReturn;
    [Test]
    procedure WhenTheFunctionReturnATStreamMustLoadItInTheContentStreamInTheReponseClass;
    [Test]
    procedure WhenTheFunctionReturnANilStreamMustSerializeTheReturn;
    [Test]
    procedure AfterExecuteTheRequestMustSendTheResponseForTheClient;
    [Test]
    procedure AfterHandleTheRequestTheFreeContentPropertyMustByFalse;
    [Test]
    procedure WhenAProcedureHasHeaderAttributeMustLoadTheValuesInTheResponse;
    [Test]
    procedure TheHeaderAttributeMustLoadTheValuesInTheAttribute;
    [Test]
    procedure WhenTheInterfaceHasTheHeaderAttributeMustLoadTheHeadersResponse;
    [Test]
    procedure TheHeaderAttributeMustLoadTheValuedOfTheHeaderAttribute;
  end;

  TService = class(TInterfacedObject, IService)
  private
    FMyClass: TMyClass;
    FProcedureCalled: String;
    FStream: TRequestFile;

    function FuncClass: TMyClass;
    function FuncInteger: Integer;
    function GetStream: TRequestFile;
    function ProcedureCalled: String;
    function ReturnStream: TResponseFile;
    function ReturnStreamNil: TResponseFile;

    procedure Proc;
    procedure ProcArray(Value: TArray<String>);
    procedure ProcChar(Value: AnsiChar);
    procedure ProcClass(Value: TMyClass);
    procedure ProcClassRef(Value: TClass);
    procedure ProcEnum(Value: TMyEnumerator);
    procedure ProcFloat(Value: Currency);
    procedure ProcInt64(Value: Int64);
    procedure ProcInteger(Value: Integer);
    procedure ProcInterface(Value: IInterface);
    procedure ProcLString(Value: AnsiString);
    procedure ProcMethod(Value: TNotifyEvent);
    procedure ProcParam(Value: Integer);
    procedure ProcParamString(Param: String);
    procedure ProcPointer(Value: Pointer);
    procedure ProcProcedure(Value: TProc);
    procedure ProcSet(Value: TMyEnumeratorSet);
    procedure ProcStream(Stream: TRequestFile);
    procedure ProcStreamArray(Stream: TArray<TRequestFile>);
    procedure ProcStreamTwoParam(File1, File2: TRequestFile);
    procedure ProcString(Value: ShortString);
    procedure ProcUString(Value: UnicodeString);
    procedure ProcVariant(Value: Variant);
    procedure ProcWChar(Value: Char);
    procedure ProcWString(Value: WideString);
    procedure ProcedureWithParamsInBody(Param1: String; Param2: Integer);
    procedure ProcedureWithOutAttribute(Param1: String; Param2: Integer);
  public
    destructor Destroy; override;
  end;

  TServiceContainer = class(TInterfacedObject, IServiceContainer)
  private
    FInstance: IService;
    FReturnValue: Boolean;

    function GetService(const Name: String; var Info: TRttiType; var Instance: TValue): Boolean;
  public
    constructor Create(ReturnValue: Boolean); overload;
    constructor Create(const Instance: IService); overload;
  end;

implementation

uses System.NetEncoding, Winapi.WinInet, Blue.Print.Serializer, System.Net.Mime, System.NetConsts, Web.ReqFiles;

{ TRestServerServiceTest }

procedure TRestServerServiceTest.AfterExecuteTheRequestMustSendTheResponseForTheClient;
begin
  var Request := CreateRequestMock('/IService/Proc', CONTENTTYPE_APPLICATION_JSON, EmptyStr, EmptyStr);
  var Response := TWebResponseMock.Create(Request.Instance);
  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(TService.Create));

  Rest.HandleRequest;

  Assert.IsTrue(Response.Sent);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.AfterHandleTheExceptionMustSendTheResponseForTheClient;
begin
  var Request := CreateRequestMock;
  var Response := TWebResponseMock.Create(Request.Instance);
  var Handled := False;
  var Handler := CreateRestService(Request.Instance, Response, nil) as IWebExceptionHandler;
  var MyException := Exception.Create('Error');

  Handler.HandleException(MyException, Handled);

  Assert.IsTrue(Response.Sent);

  MyException.Free;

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.AfterHandleTheRequestTheFreeContentPropertyMustByFalse;
begin
  var Request := CreateRequestMock('/IService/Proc', CONTENTTYPE_APPLICATION_JSON, EmptyStr, EmptyStr);
  var Response := TWebResponseMock.Create(Request.Instance);
  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(TService.Create));

  Rest.HandleRequest;

  Assert.IsFalse(Response.FreeContentStream);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.ConvertingParamsAsExpected(ProcedureName, Value: String);
begin
  var Request := CreateRequestMock(Format('/IService/%s', [ProcedureName]), CONTENTTYPE_APPLICATION_JSON, EmptyStr, 'Value=' + TNetEncoding.URL.Encode(Value));
  var Response := TWebResponseMock.Create(Request.Instance);
  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(TService.Create));

  Assert.WillNotRaise(
    procedure
    begin
      Rest.HandleRequest;
    end);

  Request.Free;

  Response.Free;
end;

function TRestServerServiceTest.CreateRequestMock(const URL, ContentType, ContentValue, QueryString: String): TMockClass<TWebRequestMock>;
begin
  Result := CreateRequestMock(URL, ContentType, TEncoding.UTF8.GetBytes(ContentValue), QueryString);
end;

function TRestServerServiceTest.CreateRequestMock(const URL, ContentType: String; const ContentValue: TBytes; const QueryString: String): TMockClass<TWebRequestMock>;
begin
  Result := TMock.CreateClass<TWebRequestMock>;

  Result.Setup.WillReturn('GET').When.GetStringVariable(It.IsEqualTo(METHOD_INDEX));

  Result.Setup.WillReturn(URL).When.GetStringVariable(It.IsEqualTo(URL_INDEX));

  Result.Setup.WillReturn(ContentType).When.GetStringVariable(It.IsEqualTo(CONTENT_TYPE_INDEX));

  Result.Setup.WillReturn(Length(ContentValue)).When.GetIntegerVariable(It.IsEqualTo(CONTENT_LENGTH_INDEX));

  Result.Setup.WillReturn(QueryString).When.GetStringVariable(It.IsEqualTo(QUERY_INDEX));

  Result.Setup.WillReturn(TValue.From(ContentValue)).When.GetRawContent;

  Result.Instance.UpdateMethodType;
end;

function TRestServerServiceTest.CreateRequestMock: TMockClass<TWebRequestMock>;
begin
  Result := CreateRequestMock(EmptyStr, CONTENTTYPE_APPLICATION_JSON, EmptyStr, EmptyStr);
end;

function TRestServerServiceTest.CreateRestService(Request: TWebRequest; Response: TWebResponse; Container: IServiceContainer): IWebAppServices;
begin
  FRestService.ServiceContainer := Container;
  Result := FRestService;

  Result.InitContext(nil, Request, Response);
end;

procedure TRestServerServiceTest.IfDontFindTheProcedureOfRequestMustReturStatusCodeWith404;
begin
  var Request := CreateRequestMock('/IService/AnyProcudure', CONTENTTYPE_APPLICATION_JSON, EmptyStr, EmptyStr);
  var Response := TWebResponseMock.Create(Request.Instance);
  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(TService.Create));

  Rest.HandleRequest;

  Assert.AreEqual(HTTP_STATUS_NOT_FOUND, Response.StatusCode);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.IfNotFoundTheServiceMustReturnHandledToFalse;
begin
  var Container := TServiceContainer.Create(False);
  var Request := CreateRequestMock('/IAnotherService/Procedure', CONTENTTYPE_APPLICATION_JSON, EmptyStr, EmptyStr);
  var Response := TWebResponseMock.Create(Request.Instance);

  var Rest := CreateRestService(Request.Instance, Response, Container);

  Assert.IsFalse(Rest.HandleRequest);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.IfTheContentTypeAttributeHasACharSetThisMustBeLoadedInTheContentTypeInfo;
begin
  var Request := CreateRequestMock('/IContentService/MyCharSetFunction', CONTENTTYPE_APPLICATION_JSON, EmptyStr, EmptyStr);
  var Response := TWebResponseMock.Create(Request.Instance);
  var Rest := CreateRestService(Request.Instance, Response, FServiceContainer.Instance);

  Rest.HandleRequest;

  Assert.AreEqual(Format('%s; charset=%s', [CONTENTTYPE_APPLICATION_ATOM_XML, 'MyCharSet']), Response.ContentType);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.IfTheFunctionDoesntHaveTheAttachmentAttributeCantRaiseAnyError;
begin
  var Request := CreateRequestMock('/IContentService/MyFunction', CONTENTTYPE_APPLICATION_JSON, EmptyStr, EmptyStr);
  var Response := TWebResponseMock.Create(Request.Instance);
  var Rest := CreateRestService(Request.Instance, Response, FServiceContainer.Instance);

  Assert.WillNotRaise(
    procedure
    begin
      Rest.HandleRequest;
    end);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.IfTheParamIsInTheQueryFieldsCantTryToLoadTheValueFromContent;
begin
  var MyService: IService := TService.Create;
  var Request := CreateRequestMock('/IService/ProcParamString', CONTENTTYPE_APPLICATION_JSON, 'Value=abc', 'Value=');
  var Response := TWebResponseMock.Create(Request.Instance);
  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(MyService));

  Rest.HandleRequest;

  Assert.AreEqual('ProcParamString=', MyService.ProcedureCalled);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.IfTheRequestDontHaveTheProcedureParamMustFillTheStatusCodigoWith404;
begin
  var Container := TServiceContainer.Create(True);
  var Request := CreateRequestMock('/IService', CONTENTTYPE_APPLICATION_JSON, EmptyStr, EmptyStr);
  var Response := TWebResponseMock.Create(Request.Instance);
  var Rest := CreateRestService(Request.Instance, Response, Container);

  Rest.HandleRequest;

  Assert.AreEqual(HTTP_STATUS_NOT_FOUND, Response.StatusCode);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.MustCallTheProcedureWithTheParamValuePassed(ProcedureName, Value: String);
begin
  var Request := CreateRequestMock(Format('/IService/%s', [ProcedureName]), CONTENTTYPE_APPLICATION_JSON, EmptyStr, 'Value=' + TNetEncoding.URL.Encode(Value));
  var Response := TWebResponseMock.Create(Request.Instance);
  var Service: IService := TService.Create;

  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(Service));

  Rest.HandleRequest;

  Assert.AreEqual(Format('%s=%s', [ProcedureName, Value]), Service.ProcedureCalled);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.MustTryToLoadTheProcedureParamsFromTheURLAndTheBody;
begin
  var MyService: IService := TService.Create;
  var Request := CreateRequestMock('/IService/ProcedureWithParamsInBody', CONTENTTYPE_APPLICATION_X_WWW_FORM_URLENCODED, 'Param1=abcde', 'Param2=1234');
  var Response := TWebResponseMock.Create(Request.Instance);
  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(MyService));

  Rest.HandleRequest;

  Assert.AreEqual('ProcedureWithParamsInBody=abcde,1234', MyService.ProcedureCalled);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.OnceTheExceptionIsHandledTheStatusCodeMustBe500;
begin
  var Request := CreateRequestMock;
  var Response := TWebResponseMock.Create(Request.Instance);
  var Handled := False;
  var Handler := CreateRestService(Request.Instance, Response, nil) as IWebExceptionHandler;
  var MyException := Exception.Create('Error');

  Handler.HandleException(MyException, Handled);

  Assert.AreEqual(500, Response.StatusCode);

  MyException.Free;

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.Setup;
begin
  FContentServiceMock := TMock.CreateInterface<IContentService>(True);
  FRestService := TRestServerService.Create(nil);
  FServiceMock := TMock.CreateInterface<IService>(True);
  FServiceContainer := TMock.CreateInterface<IServiceContainer>;

  FServiceContainer.Setup.WillExecute(
    function(const Params: TArray<TValue>): TValue
    begin
      var Context := TRttiContext.Create;

      Params[2] := Context.GetType(TypeInfo(IContentService));
      Params[3] := TValue.From(FContentServiceMock.Instance);
      Result := True;
    end).When.GetService(It.IsEqualTo('IContentService'), ItReference<TRttiType>.IsAny.Value, ItReference<TValue>.IsAny.Value);

  FServiceContainer.Setup.WillExecute(
    function(const Params: TArray<TValue>): TValue
    begin
      var Context := TRttiContext.Create;

      Params[2] := Context.GetType(TypeInfo(IService));
      Params[3] := TValue.From(FServiceMock.Instance);
      Result := True;
    end).When.GetService(It.IsEqualTo('IService'), ItReference<TRttiType>.IsAny.Value, ItReference<TValue>.IsAny.Value);
end;

procedure TRestServerServiceTest.SetupFixture;
begin
  CreateRequestMock.Free;

  var Serializer: ISerializer := TBluePrintJsonSerializer.Create;

  Serializer.Serialize('abc');

  Serializer.Deserialize('{"Value": 1234}', TypeInfo(TMyClass)).AsObject.Free;
  Serializer.Deserialize('"C"', TypeInfo(Char));
  Serializer.Deserialize('"C"', TypeInfo(AnsiChar));
  Serializer.Deserialize('[''abc'', ''zzz'']', TypeInfo(TArray<String>));
  Serializer.Deserialize('''my string''', TypeInfo(String));
  Serializer.Deserialize('''my string''', TypeInfo(ShortString));
  Serializer.Deserialize('''my string''', TypeInfo(AnsiString));
  Serializer.Deserialize('1', TypeInfo(TMyEnumerator));
  Serializer.Deserialize('1', TypeInfo(TMyEnumeratorSet));
  Serializer.Deserialize('1234', TypeInfo(Integer));
  Serializer.Deserialize('1234', TypeInfo(Int64));
end;

procedure TRestServerServiceTest.TearDown;
begin
  FServiceContainer := nil;

  FRestService.Free;
end;

procedure TRestServerServiceTest.TheExceptionMessageMustBeInTheContentOfTheResponse;
begin
  var Request := CreateRequestMock;
  var Response := TWebResponseMock.Create(Request.Instance);
  var Handled := False;
  var Handler := CreateRestService(Request.Instance, Response, nil) as IWebExceptionHandler;
  var MyException := Exception.Create('Error');

  Handler.HandleException(MyException, Handled);

  Assert.AreEqual('Error', Response.Content);

  MyException.Free;

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.TheHeaderAttributeMustLoadTheValuedOfTheHeaderAttribute;
begin
  var Request := CreateRequestMock('/IContentService/MyProcedure', CONTENTTYPE_APPLICATION_JSON, EmptyStr, EmptyStr);
  var Response := TWebResponseMock.Create(Request.Instance);
  var Rest := CreateRestService(Request.Instance, Response, FServiceContainer.Instance);

  Rest.HandleRequest;

  Assert.AreEqual('My Service Header', Response.CustomHeaders.Names[0]);
  Assert.AreEqual('My Service Value', Response.CustomHeaders.ValueFromIndex[0]);
  Assert.AreEqual('My Service Header 2', Response.CustomHeaders.Names[1]);
  Assert.AreEqual('My Service Value 2', Response.CustomHeaders.ValueFromIndex[1]);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.TheHeaderAttributeMustLoadTheValuesInTheAttribute;
begin
  var Request := CreateRequestMock('/IContentService/ProcedureWithHeader', CONTENTTYPE_APPLICATION_JSON, EmptyStr, EmptyStr);
  var Response := TWebResponseMock.Create(Request.Instance);
  var Rest := CreateRestService(Request.Instance, Response, FServiceContainer.Instance);

  Rest.HandleRequest;

  Assert.AreEqual('My Header', Response.CustomHeaders.Names[0]);
  Assert.AreEqual('My Value', Response.CustomHeaders.ValueFromIndex[0]);
  Assert.AreEqual('My Header 2', Response.CustomHeaders.Names[1]);
  Assert.AreEqual('My Value 2', Response.CustomHeaders.ValueFromIndex[1]);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenAFunctionHaveTheAttachmentAttributeMustReturnTheContentTypeAndContentDispositionInTheHeaderResponse;
begin
  var Request := CreateRequestMock('/IContentService/MyAttachmentFunction', CONTENTTYPE_APPLICATION_JSON, EmptyStr, EmptyStr);
  var Response := TWebResponseMock.Create(Request.Instance);
  var Rest := CreateRestService(Request.Instance, Response, FServiceContainer.Instance);

  Rest.HandleRequest;

  Assert.AreEqual(CONTENTTYPE_APPLICATION_ZIP, Response.ContentType);
  Assert.AreEqual('attachment; filename="MyFile.pas"', Response.CustomHeaders.Values[sContentDisposition]);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenAnExceptionIsHandledMustReturnTrueInTheHandleParam;
begin
  var Request := CreateRequestMock;
  var Response := TWebResponseMock.Create(Request.Instance);
  var Handled := False;
  var Handler := CreateRestService(Request.Instance, Response, nil) as IWebExceptionHandler;
  var MyException := Exception.Create('Error');

  Handler.HandleException(MyException, Handled);

  Assert.IsTrue(Handled);

  MyException.Free;

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenAProcedureHasHeaderAttributeMustLoadTheValuesInTheResponse;
begin
  var Request := CreateRequestMock('/IContentService/ProcedureWithHeader', CONTENTTYPE_APPLICATION_JSON, EmptyStr, EmptyStr);
  var Response := TWebResponseMock.Create(Request.Instance);
  var Rest := CreateRestService(Request.Instance, Response, FServiceContainer.Instance);

  Rest.HandleRequest;

  Assert.AreEqual(4, Response.CustomHeaders.Count);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenCalledTheGetExceptionHandlerMustReturnTheExceptionHandler;
begin
  var Rest := CreateRestService(nil, nil, nil) as IWebAppServices;

  var Handler := Rest.GetExceptionHandler;

  Assert.IsNotNull(Handler);
end;

procedure TRestServerServiceTest.WhenFindTheClassToRespondTheRequestMustReturnHandledToTrue;
begin
  var Container := TServiceContainer.Create(True);
  var Request := CreateRequestMock('/IService', CONTENTTYPE_APPLICATION_JSON, EmptyStr, EmptyStr);
  var Response := TWebResponseMock.Create(Request.Instance);

  var Rest := CreateRestService(Request.Instance, Response, Container);

  Assert.IsTrue(Rest.HandleRequest);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenReturnATStreamCantSerializeTheReturn;
begin
  var Request := CreateRequestMock('/IService/ReturnStream', CONTENTTYPE_APPLICATION_JSON, EmptyStr, EmptyStr);
  var Response := TWebResponseMock.Create(Request.Instance);
  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(TService.Create));
  var Serializer := TMock.CreateInterface<ISerializer>;

  FRestService.Serializer := Serializer.Instance;

  Serializer.Expect.Never.When.Serialize(It.IsAny<TValue>);

  Rest.HandleRequest;

  Assert.CheckExpectation(Serializer.CheckExpectations);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenTheAmountOfRequestParametersIsDiferrentFromTheAmoutOfProcedureParametersMustReturnBadRequest(Params: String);
begin
  var Request := CreateRequestMock('/IService/ProcInteger', CONTENTTYPE_APPLICATION_JSON, EmptyStr, Params);
  var Response := TWebResponseMock.Create(Request.Instance);
  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(TService.Create));

  Rest.HandleRequest;

  Assert.AreEqual(HTTP_STATUS_BAD_REQUEST, Response.StatusCode);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenTheClassHasTheContentTypeAttributeMustReturnThisTypeInTheResponse;
begin
  var Request := CreateRequestMock('/IContentService/MyFunction', CONTENTTYPE_APPLICATION_JSON, EmptyStr, EmptyStr);
  var Response := TWebResponseMock.Create(Request.Instance);
  var Rest := CreateRestService(Request.Instance, Response, FServiceContainer.Instance);

  Rest.HandleRequest;

  Assert.AreEqual(CONTENTTYPE_APPLICATION_OGG, Response.ContentType);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenTheContentIsABinaryValueCantRaiseAnyError;
begin
  var Request := CreateRequestMock('/IService/ProcStream', CONTENTTYPE_APPLICATION_JSON, EmptyStr, EmptyStr);
  var Response := TWebResponseMock.Create(Request.Instance);
  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(TService.Create));

  Assert.WillNotRaise(
    procedure
    begin
      Rest.HandleRequest;
    end);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenTheContentIsABinaryValueMustPassTheValueToTheParamOfTheProcedureCalled;
begin
  var Content: TBytes := [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  var Request := CreateRequestMock('/IService/ProcStream', CONTENTTYPE_IMAGE_PNG, Content, EmptyStr);
  var Response := TWebResponseMock.Create(Request.Instance);
  var Service: IService := TService.Create;

  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(Service));

  Rest.HandleRequest;

  Assert.AreEqualMemory(Content, (Service.GetStream.Stream as TCustomMemoryStream).Memory, Length(Content));

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenTheContentIsEmptyMustReturnTheBadRequestStatus;
begin
  var Request := CreateRequestMock('/IService/ProcString', CONTENTTYPE_APPLICATION_JSON, EmptyStr, EmptyStr);
  var Response := TWebResponseMock.Create(Request.Instance);
  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(TService.Create));

  Rest.HandleRequest;

  Assert.AreEqual(HTTP_STATUS_BAD_REQUEST, Response.StatusCode);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenTheContractHasntAnyAttributeOfParamTypeMustLoadTheParamsByProcedureType(MethodType: String; ParamInURL: Boolean);
begin
  var Params := 'Param1=abcde&Param2=1234';
  var Request := TMock.CreateClass<TWebRequestMock>;
  var RequestBody := TEncoding.UTF8.GetBytes(Params);
  var Response := TWebResponseMock.Create(Request.Instance);

  Request.Setup.WillReturn('/IService/ProcedureWithOutAttribute').When.GetStringVariable(It.IsEqualTo(URL_INDEX));

  Request.Setup.WillReturn(MethodType).When.GetStringVariable(It.IsEqualTo(METHOD_INDEX));

  Request.Setup.WillReturn(CONTENTTYPE_APPLICATION_X_WWW_FORM_URLENCODED).When.GetStringVariable(It.IsEqualTo(CONTENT_TYPE_INDEX));

  if ParamInURL then
  begin
    Request.Setup.WillReturn(Params).When.GetStringVariable(It.IsEqualTo(QUERY_INDEX));

    Request.Expect.Once.When.GetStringVariable(It.IsEqualTo(QUERY_INDEX));
  end
  else
  begin
    Request.Setup.WillReturn(EmptyStr).When.GetStringVariable(It.IsEqualTo(QUERY_INDEX));

    Request.Setup.WillReturn(Length(RequestBody)).When.GetIntegerVariable(It.IsEqualTo(CONTENT_LENGTH_INDEX));

    Request.Setup.WillReturn(TValue.From(RequestBody)).When.GetRawContent;

    Request.Expect.Once.When.GetRawContent;
  end;

  Request.Instance.UpdateMethodType;

  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(TService.Create));

  Rest.HandleRequest;

  Assert.AreEqual(EmptyStr, Request.CheckExpectations);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenTheFunctionReturnANilStreamMustSerializeTheReturn;
begin
  var Request := CreateRequestMock('/IService/ReturnStreamNil', CONTENTTYPE_APPLICATION_JSON, EmptyStr, EmptyStr);
  var Response := TWebResponseMock.Create(Request.Instance);
  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(TService.Create));
  var Serializer := TMock.CreateInterface<ISerializer>;

  FRestService.Serializer := Serializer.Instance;

  Serializer.Expect.Once.When.Serialize(It.IsAny<TValue>);

  Rest.HandleRequest;

  Assert.CheckExpectation(Serializer.CheckExpectations);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenTheFunctionReturnATStreamMustLoadItInTheContentStreamInTheReponseClass;
begin
  var Request := CreateRequestMock('/IService/ReturnStream', CONTENTTYPE_APPLICATION_JSON, EmptyStr, EmptyStr);
  var Response := TWebResponseMock.Create(Request.Instance);
  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(TService.Create));

  Rest.HandleRequest;

  Assert.IsNotNull(Response.ContentStream);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenTheInterfaceHasTheHeaderAttributeMustLoadTheHeadersResponse;
begin
  var Request := CreateRequestMock('/IContentService/MyProcedure', CONTENTTYPE_APPLICATION_JSON, EmptyStr, EmptyStr);
  var Response := TWebResponseMock.Create(Request.Instance);
  var Rest := CreateRestService(Request.Instance, Response, FServiceContainer.Instance);

  Rest.HandleRequest;

  Assert.AreEqual(2, Response.CustomHeaders.Count);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenTheMethodHasTheContenteTypeAttributeMustReturnThisTypeInTheResponse;
begin
  var Request := CreateRequestMock('/IContentService/MyContentFunction', CONTENTTYPE_APPLICATION_JSON, EmptyStr, EmptyStr);
  var Response := TWebResponseMock.Create(Request.Instance);
  var Rest := CreateRestService(Request.Instance, Response, FServiceContainer.Instance);

  Rest.HandleRequest;

  Assert.AreEqual(CONTENTTYPE_APPLICATION_ATOM_XML, Response.ContentType);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenTheParamIsATStreamMustLoadTheFileInTheRequest;
begin
  var Request := CreateRequestMock('/IService/ProcStream', CONTENTTYPE_IMAGE_PNG, nil, EmptyStr);
  var Response := TWebResponseMock.Create(Request.Instance);
  var Service: IService := TService.Create;

  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(Service));

  Rest.HandleRequest;

  Assert.AreEqual('ProcStream', Service.ProcedureCalled);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenTheParamIsEmptyCantRaiseAnyErrorOfConversion;
begin
  var Request := CreateRequestMock('/IService/ProcParamString', CONTENTTYPE_APPLICATION_JSON, EmptyStr, 'Value=');
  var Response := TWebResponseMock.Create(Request.Instance);
  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(TService.Create));

  Assert.WillNotRaise(
    procedure
    begin
      Rest.HandleRequest;
    end);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenThePathHasMoreThenTwoLevelsMustReturn404;
begin
  var Request := CreateRequestMock('/IService/Proc/Proc', CONTENTTYPE_APPLICATION_JSON, EmptyStr, EmptyStr);
  var Response := TWebResponseMock.Create(Request.Instance);
  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(TService.Create));

  Rest.HandleRequest;

  Assert.AreEqual(HTTP_STATUS_NOT_FOUND, Response.StatusCode);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenTheProcedureBeenCalledHasASigleParamMustLoadTheParamFromTheContent;
begin
  var Request := CreateRequestMock('/IService/ProcParamString', CONTENTTYPE_APPLICATION_JSON, 'MyValue', EmptyStr);
  var Response := TWebResponseMock.Create(Request.Instance);
  var Service: IService := TService.Create;

  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(Service));

  Rest.HandleRequest;

  Assert.AreEqual('ProcParamString=MyValue', Service.ProcedureCalled);

  Request.Free;

  Response.Free;

  Request := CreateRequestMock('/IService/ProcedureWithOutAttribute', CONTENTTYPE_APPLICATION_JSON, 'Value=abcde', EmptyStr);
  Response := TWebResponseMock.Create(Request.Instance);
  Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(Service));

  Rest.HandleRequest;

  Assert.AreEqual(HTTP_STATUS_BAD_REQUEST, Response.StatusCode);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenTheProcedureBeenCalledHasASigleParamMustLoadTheParamFromTheContentIfTheContentIsAJSONValue;
begin
  var Request := CreateRequestMock('/IService/ProcParamString', CONTENTTYPE_APPLICATION_JAVASCRIPT, 'MyValue', EmptyStr);
  var Response := TWebResponseMock.Create(Request.Instance);
  var Service: IService := TService.Create;

  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(Service));

  Rest.HandleRequest;

  Assert.AreEqual(HTTP_STATUS_BAD_REQUEST, Response.StatusCode);

  Request.Free;

  Response.Free;

  Request := CreateRequestMock('/IService/ProcParamString', CONTENTTYPE_APPLICATION_JSON, 'MyValue', EmptyStr);
  Response := TWebResponseMock.Create(Request.Instance);
  Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(Service));

  Rest.HandleRequest;

  Assert.AreEqual(HTTP_STATUS_OK, Response.StatusCode);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenTheProcedureBeenCalledHasASigleParamMustLoadTheParamFromTheContentIfTheContentIsTextPlain;
begin
  var Request := CreateRequestMock('/IService/ProcParamString', CONTENTTYPE_APPLICATION_JAVASCRIPT, 'MyValue', EmptyStr);
  var Response := TWebResponseMock.Create(Request.Instance);
  var Service: IService := TService.Create;

  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(Service));

  Rest.HandleRequest;

  Assert.AreEqual(HTTP_STATUS_BAD_REQUEST, Response.StatusCode);

  Request.Free;

  Response.Free;

  Request := CreateRequestMock('/IService/ProcParamString', CONTENTTYPE_TEXT_PLAIN + ';charset=UTF-8', 'MyValue', EmptyStr);
  Response := TWebResponseMock.Create(Request.Instance);
  Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(Service));

  Rest.HandleRequest;

  Assert.AreEqual(HTTP_STATUS_OK, Response.StatusCode);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenTheProcedureCalledIsAnArrayOfStreamMustCallTheCorrectProcedure;
begin
  var Request := CreateRequestMock('/IService/ProcStreamArray', CONTENTTYPE_APPLICATION_JSON, EmptyStr, EmptyStr);
  var Response := TWebResponseMock.Create(Request.Instance);
  var Service: IService := TService.Create;

  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(Service));

  Rest.HandleRequest;

  Assert.AreEqual('ProcStreamArray', Service.ProcedureCalled);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenTheProcedureHasMoreThenOneFileMustLoadEachFileInTheCorrecParam;
begin
  var Content := TMultipartFormData.Create;
  var MyFile := TStringStream.Create(EmptyStr);
  var Service: IService := TService.Create;

  var Container := TServiceContainer.Create(Service);

  Content.AddStream('File1', MyFile, 'One.png');

  Content.AddStream('File2', MyFile, 'Two.jpg');

  var ContentBytes := TBytesStream.Create(nil);

  ContentBytes.CopyFrom(Content.Stream, 0);

  var Request := CreateRequestMock('/IService/ProcStreamTwoParam', Content.MimeTypeHeader, ContentBytes.Bytes, EmptyStr);
  var Response := TWebResponseMock.Create(Request.Instance);
  var Rest := CreateRestService(Request.Instance, Response, Container);

  Rest.HandleRequest;

  Assert.AreEqual('ProcStreamTwoParam=File1=One.png,File2=Two.jpg', Service.ProcedureCalled);

  Response.Free;

  Request.Free;

  MyFile.Free;

  Content.Free;

  ContentBytes.Free;
end;

procedure TRestServerServiceTest.WhenTheProcedureHaveParamMustCallWithTheParamOfTheRequest;
begin
  var Request := CreateRequestMock('/IService/ProcParam', CONTENTTYPE_APPLICATION_JSON, EmptyStr, 'Value=123');
  var Response := TWebResponseMock.Create(Request.Instance);
  var Service: IService := TService.Create;

  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(Service));

  Rest.HandleRequest;

  Assert.AreEqual('ProcParam=123', Service.ProcedureCalled);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenTheProcedureOfTheRequestIsMarkedWithParamInBodyMustLoadTheParamsValuesFromBody;
begin
  var Request := CreateRequestMock('/IService/ProcedureWithParamsInBody', CONTENTTYPE_APPLICATION_X_WWW_FORM_URLENCODED, 'Param1=abcde&Param2=1234', EmptyStr);
  var Response := TWebResponseMock.Create(Request.Instance);

  Request.Expect.Once.When.GetRawContent;

  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(TService.Create));

  Rest.HandleRequest;

  Assert.AreEqual(EmptyStr, Request.CheckExpectations);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenTheRequestCallAFunctionAndTheReturnIsAClassMustReturnTheJSONAsSpected;
begin
  var Request := CreateRequestMock('/IService/FuncClass', CONTENTTYPE_APPLICATION_JSON, EmptyStr, EmptyStr);
  var Response := TWebResponseMock.Create(Request.Instance);
  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(TService.Create));

  Rest.HandleRequest;

  Assert.AreEqual('{"Value":5555}', Response.Content);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenTheRequestedFunctionAsAReturnMustFillTheContentTypeWithApplicationJSON;
begin
  var Request := CreateRequestMock('/IService/FuncInteger', CONTENTTYPE_APPLICATION_JSON, EmptyStr, EmptyStr);
  var Response := TWebResponseMock.Create(Request.Instance);
  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(TService.Create));

  Rest.HandleRequest;

  Assert.AreEqual(CONTENTTYPE_APPLICATION_JSON, Response.ContentType);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenTheRequestExecuteAsExpectedTheStatusCode200;
begin
  var Request := CreateRequestMock('IService/ProcParamString', CONTENTTYPE_APPLICATION_JSON, EmptyStr, 'Value=Abc');
  var Response := TWebResponseMock.Create(Request.Instance);
  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(TService.Create));

  Rest.HandleRequest;

  Assert.AreEqual(200, Response.StatusCode);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenTheRequestExecutionWasSucessfullyMustReturnTheJSONResult;
begin
  var Request := CreateRequestMock('/IService/FuncInteger', CONTENTTYPE_APPLICATION_JSON, EmptyStr, EmptyStr);
  var Response := TWebResponseMock.Create(Request.Instance);
  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(TService.Create));

  Rest.HandleRequest;

  Assert.AreEqual('123456', Response.Content);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenTheRequestIsAFileTheRequestMustReturnFalse;
begin
  var Request := CreateRequestMock;
  var Response := TWebResponseMock.Create(Request.Instance);

  Request.Setup.WillReturn('IService/ProcParamString/File.file').When.GetStringVariable(It.IsEqualTo(URL_INDEX));

  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(TService.Create));

  Assert.IsFalse(Rest.HandleRequest);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenTheRequestIsCorrectMustCallTheProcedureRequested;
begin
  var Request := CreateRequestMock('/IService/Proc', CONTENTTYPE_APPLICATION_JSON, EmptyStr, EmptyStr);
  var Response := TWebResponseMock.Create(Request.Instance);
  var Service: IService := TService.Create;
  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(Service));

  Rest.HandleRequest;

  Assert.AreEqual('Proc', Service.ProcedureCalled);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenTheRequestIsForAProcedureCantRaiseErrorOfSerialization;
begin
  var Request := CreateRequestMock;
  var Response := TWebResponseMock.Create(Request.Instance);

  Request.Setup.WillReturn('/IService/ProcInteger?Value=1234').When.GetStringVariable(It.IsEqualTo(URL_INDEX));

  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(TService.Create));

  Assert.WillNotRaise(
    procedure
    begin
      Rest.HandleRequest;
    end);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenTheRequestIsTheRootURLMustReturnHandledToFalse;
begin
  var Request := CreateRequestMock;
  var Response := TWebResponseMock.Create(Request.Instance);

  Request.Setup.WillReturn('/').When.GetStringVariable(It.IsEqualTo(URL_INDEX));

  var Rest := CreateRestService(Request.Instance, Response);

  Assert.IsFalse(Rest.HandleRequest);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenTheServiceContainerIsNotLoadedMustRaiseAnError;
begin
  var Request := CreateRequestMock('/IService/ProcString', CONTENTTYPE_APPLICATION_JSON, EmptyStr, EmptyStr);
  var Response := TWebResponseMock.Create(Request.Instance);
  var Rest := CreateRestService(Request.Instance, Response, nil);

  Assert.WillRaise(
    procedure
    begin
      Rest.HandleRequest;
    end, EServiceContainerNotLoaded);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenTheServiceDontHaveTheContentTypeAttributeMustReturnTheApplicationJsonContentByDefault;
begin
  var Request := CreateRequestMock('/IService/FuncInteger', CONTENTTYPE_APPLICATION_JSON, EmptyStr, EmptyStr);
  var Response := TWebResponseMock.Create(Request.Instance);
  var Rest := CreateRestService(Request.Instance, Response, FServiceContainer.Instance);

  Rest.HandleRequest;

  Assert.AreEqual(CONTENTTYPE_APPLICATION_JSON, Response.ContentType);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenTheServiceNameHasDotsInTheNameMustHandleTheRequest;
begin
  var Request := CreateRequestMock('/IService.My.Another/MyProcedure', CONTENTTYPE_APPLICATION_JSON, EmptyStr, 'Value=123');
  var Response := TWebResponseMock.Create(Request.Instance);
  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(TService.Create));

  Assert.IsTrue(Rest.HandleRequest);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenTheTypeIsInvalidMustRaiseAnError(ProcedureName: String);
begin
  var Request := CreateRequestMock(Format('/IService/%s', [ProcedureName]), CONTENTTYPE_APPLICATION_JSON, EmptyStr, 'Value=123');
  var Response := TWebResponseMock.Create(Request.Instance);
  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(TService.Create));

  Assert.WillRaise(
    procedure
    begin
      Rest.HandleRequest;
    end, EInvalidParameterType);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenTryToLoadAParamFromTheContentMustLoadOnlyIfTheContentTypeIsFormURLEncoded;
begin
  var MyService: IService := TService.Create;
  var Request := CreateRequestMock('/IService/ProcString', CONTENTTYPE_APPLICATION_X_WWW_FORM_URLENCODED, 'Value=abcde', EmptyStr);
  var Response := TWebResponseMock.Create(Request.Instance);
  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(MyService));

  Rest.HandleRequest;

  Assert.AreEqual('ProcString=abcde', MyService.ProcedureCalled);

  Request.Free;

  Response.Free;

  Request := CreateRequestMock('/IService/ProcString', CONTENTTYPE_APPLICATION_JAVASCRIPT, 'Value=abcde', EmptyStr);
  Response := TWebResponseMock.Create(Request.Instance);
  Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(MyService));

  Rest.HandleRequest;

  Assert.AreEqual(HTTP_STATUS_BAD_REQUEST, Response.StatusCode);

  Request.Free;

  Response.Free;
end;

procedure TRestServerServiceTest.WhenTryToLoadAParamFromTheContentMustLoadOnlyIfTheContentTypeIsMultiPartFormData;
begin
  var Content :=
    '--MyMarker'#13#10 +
    'Content-Disposition: form-data; name="Value"'#13#10 +
    #13#10 +
    'MyValue'#13#10 +
    '--MyMarker--'#13#10;

  var MyService: IService := TService.Create;
  var Request := CreateRequestMock('/IService/ProcString', CONTENTTYPE_MULTIPART_FORM_DATA + '; boundary=MyMarker', Content, EmptyStr);
  var Response := TWebResponseMock.Create(Request.Instance);
  var Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(MyService));

  Rest.HandleRequest;

  Assert.AreEqual('ProcString=MyValue', MyService.ProcedureCalled);

  Request.Free;

  Response.Free;

  Request := CreateRequestMock('/IService/ProcString', CONTENTTYPE_APPLICATION_JAVASCRIPT, 'Value=abcde', EmptyStr);
  Response := TWebResponseMock.Create(Request.Instance);
  Rest := CreateRestService(Request.Instance, Response, TServiceContainer.Create(MyService));

  Rest.HandleRequest;

  Assert.AreEqual(HTTP_STATUS_BAD_REQUEST, Response.StatusCode);

  Request.Free;

  Response.Free;
end;

{ TServiceContainer }

constructor TServiceContainer.Create(ReturnValue: Boolean);
begin
  FReturnValue := ReturnValue;
end;

constructor TServiceContainer.Create(const Instance: IService);
begin
  Create(True);

  FInstance := Instance;
end;

function TServiceContainer.GetService(const Name: String; var Info: TRttiType; var Instance: TValue): Boolean;
begin
  Instance := TValue.From(FInstance);
  Result := FReturnValue;

  if Result and Assigned(FInstance) then
  begin
    var Context := TRttiContext.Create;
    Info := Context.GetType(TypeInfo(IService));
  end;
end;

{ TService }

destructor TService.Destroy;
begin
  FMyClass.Free;

  inherited;
end;

function TService.FuncClass: TMyClass;
begin
  FMyClass := TMyClass.Create;
  FMyClass.Value := 5555;
  Result := FMyClass;
end;

function TService.FuncInteger: Integer;
begin
  Result := 123456;
end;

function TService.GetStream: TRequestFile;
begin
  Result := FStream;
end;

procedure TService.Proc;
begin
  FProcedureCalled := 'Proc';
end;

procedure TService.ProcArray(Value: TArray<String>);
begin
  if Length(Value) > 0 then
    FProcedureCalled := Format('ProcArray=["%s", "%s"]', [Value[0], Value[1]]);
end;

procedure TService.ProcChar(Value: AnsiChar);
begin
  FProcedureCalled := Format('ProcChar=%s', [Value]);
end;

procedure TService.ProcClass(Value: TMyClass);
begin
  FProcedureCalled := Format('ProcClass={"Value": %d}', [Value.Value]);

  Value.Free;
end;

procedure TService.ProcClassRef(Value: TClass);
begin

end;

function TService.ProcedureCalled: String;
begin
  Result := FProcedureCalled;
end;

procedure TService.ProcedureWithOutAttribute(Param1: String; Param2: Integer);
begin
  FProcedureCalled := Format('ProcedureWithOutAttribute=%s,%d', [Param1, Param2]);
end;

procedure TService.ProcedureWithParamsInBody(Param1: String; Param2: Integer);
begin
  FProcedureCalled := Format('ProcedureWithParamsInBody=%s,%d', [Param1, Param2]);
end;

procedure TService.ProcEnum(Value: TMyEnumerator);
begin
  FProcedureCalled := Format('ProcEnum=%d', [Ord(Value)]);
end;

procedure TService.ProcFloat(Value: Currency);
begin
  FProcedureCalled := Format('ProcFloat=%.3f', [Value], TFormatSettings.Invariant);
end;

procedure TService.ProcInt64(Value: Int64);
begin
  FProcedureCalled := Format('ProcInt64=%d', [Value]);
end;

procedure TService.ProcInteger(Value: Integer);
begin
  FProcedureCalled := Format('ProcInteger=%d', [Value]);
end;

procedure TService.ProcInterface(Value: IInterface);
begin

end;

procedure TService.ProcLString(Value: AnsiString);
begin
  FProcedureCalled := Format('ProcLString=%s', [Value]);
end;

procedure TService.ProcMethod(Value: TNotifyEvent);
begin

end;

procedure TService.ProcParam(Value: Integer);
begin
  FProcedureCalled := Format('%s=%d', ['ProcParam', Value]);
end;

procedure TService.ProcParamString(Param: String);
begin
  FProcedureCalled := Format('%s=%s', ['ProcParamString', Param]);
end;

procedure TService.ProcPointer(Value: Pointer);
begin

end;

procedure TService.ProcProcedure(Value: TProc);
begin

end;

procedure TService.ProcSet(Value: TMyEnumeratorSet);
begin
  FProcedureCalled := Format('ProcSet=%d', [PByte(@Value)^]);
end;

procedure TService.ProcStream(Stream: TRequestFile);
begin
  FProcedureCalled := 'ProcStream';
  FStream := Stream;
end;

procedure TService.ProcStreamArray(Stream: TArray<TRequestFile>);
begin
  FProcedureCalled := 'ProcStreamArray';
end;

procedure TService.ProcStreamTwoParam(File1, File2: TRequestFile);
begin
  FProcedureCalled := Format('ProcStreamTwoParam=File1=%s,File2=%s', [File1.FileName, File2.FileName]);
end;

procedure TService.ProcString(Value: ShortString);
begin
  FProcedureCalled := Format('ProcString=%s', [Value]);
end;

procedure TService.ProcUString(Value: UnicodeString);
begin
  FProcedureCalled := Format('ProcUString=%s', [Value]);
end;

procedure TService.ProcVariant(Value: Variant);
begin

end;

procedure TService.ProcWChar(Value: Char);
begin
  FProcedureCalled := Format('ProcWChar=%s', [Value]);
end;

procedure TService.ProcWString(Value: WideString);
begin
  FProcedureCalled := Format('ProcWString=%s', [Value]);
end;

function TService.ReturnStream: TResponseFile;
begin
  Result := TMemoryStream.Create;
end;

function TService.ReturnStreamNil: TResponseFile;
begin
  Result := nil;
end;

end.

