unit Blue.Print.Types;

interface

uses System.Rtti, System.Classes, System.SysUtils, System.TypInfo, System.Generics.Collections, {$IFDEF PAS2JS}JSApi.JS, BrowserAPI.Web, BrowserApi.WebOrWorker{$ELSE}Web.HTTPApp, System.Net.Mime, System.NetEncoding{$ENDIF};

{$SCOPEDENUMS ON}

const
  SOAP_BODY_NODENAME = 'SOAP-ENV:Body';
  SOAP_ENVELOP_NODENAME = 'SOAP-ENV:Envelope';

type
{$IFDEF PAS2JS}
  PTypeInfo = TTypeInfo;
{$ENDIF}
  TParameterType = (Body, Query, Path);
  TRequestFile = {$IFDEF PAS2JS}TJSHTMLFile{$ELSE}TAbstractWebRequestFile{$ENDIF};
  TRequestMethod = (Delete, Get, Patch, Post, Put, Options);
  TResponseFile = {$IFDEF PAS2JS}TJSBlob{$ELSE}TStream{$ENDIF};

  IBluePrintSerializer = interface
    ['{5848116B-902F-4FF8-BE8F-D53F586C400E}']
    function GetContentType: String;
    function Deserialize(const Value: String; const TypeInfo: PTypeInfo): TValue;
    function Serialize(const Value: TValue): String;

    procedure SetFormatSettings(const Value: TFormatSettings);

    property ContentType: String read GetContentType;
    property FormatSettings: TFormatSettings write SetFormatSettings;
  end;

  EHTTPStatusError = class(Exception)
  private
    FStatusCode: Integer;
  public
    constructor Create(const StatusCode: Integer); overload;
    constructor Create(const StatusCode: Integer; const Message: String); overload;

    property StatusCode: Integer read FStatusCode write FStatusCode;
  end;

  EHTTPErrorNotFound = class(EHTTPStatusError)
  public
    constructor Create;
  end;

  EHTTPErrorBadRequest = class(EHTTPStatusError)
  public
    constructor Create(const ErrorMessage: String);
  end;

  TRequestMethodAttribute = class(TCustomAttribute)
  private
    FMethod: TRequestMethod;

    constructor Create(const Method: TRequestMethod);
  public
    property Method: TRequestMethod read FMethod;
  end;

  DeleteAttribute = class(TRequestMethodAttribute)
  public
    constructor Create;
  end;

  GetAttribute = class(TRequestMethodAttribute)
  public
    constructor Create;
  end;

  PatchAttribute = class(TRequestMethodAttribute)
  public
    constructor Create;
  end;

  PostAttribute = class(TRequestMethodAttribute)
  public
    constructor Create;
  end;

  PutAttribute = class(TRequestMethodAttribute)
  public
    constructor Create;
  end;

  OptionsAttribute = class(TRequestMethodAttribute)
  public
    constructor Create;
  end;

  EnumValueAttribute = class(TCustomAttribute)
  private
    FNames: TArray<String>;
  public
    constructor Create(const Values: String; const ValueSeparator: String = ', ');

    property Names: TArray<String> read FNames;
  end;

  FieldNameAttribute = class(TCustomAttribute)
  private
    FName: String;
  public
    constructor Create(const Name: String);

    property Name: String read FName write FName;
  end;

  NodeNameAttribute = class(FieldNameAttribute)
  end;

  DocumentNameAttribute = class(TCustomAttribute)
  private
    FName: String;
  public
    constructor Create(const Name: String);

    property Name: String read FName write FName;
  end;

  FlatAttribute = class(TCustomAttribute)
  private
    FEnumeratorPropertyName: String;
  public
    constructor Create; overload;
    constructor Create(const EnumeratorPropertyName: String); overload;

    property EnumeratorPropertyName: String read FEnumeratorPropertyName write FEnumeratorPropertyName;
  end;

  PatternPropertyAttribute = class(TCustomAttribute)
  private
    FRegex: String;
  public
    constructor Create(const Regex: String);

    property Regex: String read FRegex write FRegex;
  end;

  XMLAttributeAttribute = class(TCustomAttribute)
  private
    FAttributeName: String;
    FAttributeValue: String;
  public
    constructor Create(const AttributeName, AttributeValue: String);

    property AttributeName: String read FAttributeName;
    property AttributeValue: String read FAttributeValue;
  end;

  XMLAttributeValueAttribute = class(TCustomAttribute)
  end;

  XMLNamespaceAttribute = class(TCustomAttribute)
  private
    FNamespace: String;
  public
    constructor Create(const Namespace: String);

    property Namespace: String read FNamespace;
  end;

  XMLValueAttribute = class(TCustomAttribute);

  TParameterAttribute = class(TCustomAttribute)
  private
    FParamType: TParameterType;

    constructor Create(const ParamType: TParameterType);
  public
    property ParamType: TParameterType read FParamType;
  end;

  BodyAttribute = class(TParameterAttribute)
  public
    constructor Create;
  end;

  QueryAttribute = class(TParameterAttribute)
  public
    constructor Create;
  end;

  PathAttribute = class(TParameterAttribute)
  public
    constructor Create;
  end;

  RemoteNameAttribute = class(TCustomAttribute)
  private
    FRemoteName: String;
  public
    constructor Create(const RemoteName: String);

    property RemoteName: String read FRemoteName write FRemoteName;
  end;

  ContentTypeAttribute = class(TCustomAttribute)
  private
    FContentType: String;
  public
    constructor Create(const ContentType: String);

    property ContentType: String read FContentType;
  end;

  CharSetAttribute = class(TCustomAttribute)
  private
    FCharSet: String;
  public
    constructor Create(const CharSet: String);

    property CharSet: String read FCharSet write FCharSet;
  end;

  AttachmentAttribute = class(ContentTypeAttribute)
  private
    FFileName: String;
  public
    constructor Create(const FileName, ContentType: String); reintroduce;

    property FileName: String read FFileName;
  end;

  HeaderAttribute = class(TCustomAttribute)
  private
    FName: String;
    FValue: String;
  public
    constructor Create(const Name, Value: String);

    property Name: String read FName;
    property Value: String read FValue;
  end;

  SOAPServiceAttribute = class(ContentTypeAttribute)
  public
    constructor Create;
  end;

  SOAPActionAttribute = class(TCustomAttribute)
  private
    FActionName: String;
  public
    constructor Create(const ActionName: String);

    property ActionName: String read FActionName;
  end;

  AuthorizationAttribute = class(TCustomAttribute);

  TFormatAttribute = class(TCustomAttribute)
  private
    FFormat: String;
  public
    constructor Create(const Format: String);

    property Format: String read FFormat write FFormat;
  end;

  NumberFormatAttribute = class(TFormatAttribute)
  end;

  DateTimeFormatAttribute = class(TFormatAttribute)
  end;

  TBluePrintStream = class(TStream)
  private
    FContentType: String;
    FStream: TStream;
  protected
    function GetSize: {$IFDEF DCC}Int64{$ELSE}NativeInt{$ENDIF}; override;

    procedure SetSize(const NewSize: {$IFDEF DCC}Int64{$ELSE}NativeInt{$ENDIF}); overload; override;
  public
    constructor Create(const Stream: TStream; const ContentType: String);

    destructor Destroy; override;

    {$IFDEF PAS2JS}
    function Read(Buffer: TBytes; Offset, Count: LongInt): LongInt; override;
    function Write(const Buffer: TBytes; Offset, Count: LongInt): LongInt; override;
    {$ELSE}
    function Read(var Buffer; Count: TNativeCount): TNativeCount; overload; override;
    function Seek(const Offset: Int64; Origin: TSeekOrigin): Int64; override;
    function Write(const Buffer; Count: TNativeCount): TNativeCount; overload; override;
    {$ENDIF}

    property ContentType: String read FContentType;
    property Stream: TStream read FStream;
  end;

  TBlobStream = class(TStream)
{$IFDEF PAS2JS}
  private
    FBlob: TJSBlob;
  protected
    function GetSize: NativeInt; override;
  public
    constructor Create(const Blob: TJSBlob);

    function Read(Buffer: TBytes; Offset, Count: LongInt): LongInt; override;
    function Write(const Buffer: TBytes; Offset, Count: LongInt): LongInt; override;

    property Blob: TJSBlob read FBlob;
{$ENDIF}
  end;

  TSOAPBody = record
  public
    Body: TValue;
    Parameter: TRttiParameter;
  end;

  [DocumentName(SOAP_ENVELOP_NODENAME)]
  [XMLAttribute('xmlns:SOAP-ENV', 'http://www.w3.org/2003/05/soap-envelope')]
  [XMLAttribute('xmlns:xsd', 'http://www.w3.org/2001/XMLSchema')]
  [XMLAttribute('xmlns:xsi', 'http://www.w3.org/2001/XMLSchema-instance')]
  TSOAPEnvelop = record
  public
    [NodeName(SOAP_BODY_NODENAME)]
    SOAPBody: TSOAPBody;

    constructor Create(const Parameter: TRttiParameter; const Body: TValue);
  end;

  TDynamicProperty<V> = class(TList<TPair<String, V>>)
  private
    function GetDynamicPropertyItem(const Key: String): V;
    function GetValues: TArray<V>;

    procedure SetDynamicPropertyItem(const Key: String; const Value: V);
  public
    function ContainsKey(const Key: String): Boolean;
    function IndexOf(const Key: String): NativeInt;

    procedure Add(const Key: String; const Value: V);

    property DynamicProperty[const Key: String]: V read GetDynamicPropertyItem write SetDynamicPropertyItem; default;
    property Values: TArray<V> read GetValues;
  end;

  TRttiTypeHelper = class helper for TRttiType
  public
    function AsInterface: TRttiInterfaceType;
    function IsDynamicProperty: Boolean;
    function IsInterface: Boolean;
  end;

function IsTypeKindString(const TypeKind: TTypeKind): Boolean;

const
  HTTP_STATUS_OK = 200;
  HTTP_STATUS_BAD_REQUEST = 400;
  HTTP_STATUS_NO_CONTENT = 204;
  HTTP_STATUS_NOT_FOUND = 404;
  HTTP_STATUS_SERVER_ERROR = 500;

implementation

uses REST.Types;

function IsTypeKindString(const TypeKind: TTypeKind): Boolean;
begin
  Result := TypeKind in [{$IFDEF DCC}tkAnsiChar, tkAnsiString, tkLString, tkWString, tkUString, tkWChar, {$ENDIF}tkChar, tkString];
end;

function ConvertToBase64(const Value: String): String;
begin
  Result :=
    {$IFDEF PAS2JS}
    Window.btoa
    {$ELSE}
    TBase64Encoding.Base64.Encode
    {$ENDIF}
      (Value);
end;

{ EHTTPStatusError }

constructor EHTTPStatusError.Create(const StatusCode: Integer);
begin
  Create(StatusCode, Format('HTTP Error %d', [StatusCode]));
end;

constructor EHTTPStatusError.Create(const StatusCode: Integer; const Message: String);
begin
  inherited Create(Message);

  FStatusCode := StatusCode;
end;

{ TRequestMethodAttribute }

constructor TRequestMethodAttribute.Create(const Method: TRequestMethod);
begin
  inherited Create;

  FMethod := Method;
end;

{ POSTAttribute }

constructor POSTAttribute.Create;
begin
  inherited Create(TRequestMethod.Post);
end;

{ GETAttribute }

constructor GETAttribute.Create;
begin
  inherited Create(TRequestMethod.Get);
end;

{ DELETEAttribute }

constructor DELETEAttribute.Create;
begin
  inherited Create(TRequestMethod.Delete);
end;

{ PATCHAttribute }

constructor PATCHAttribute.Create;
begin
  inherited Create(TRequestMethod.Patch);
end;

{ PUTAttribute }

constructor PUTAttribute.Create;
begin
  inherited Create(TRequestMethod.Put);
end;

{ TParameterAttribute }

constructor TParameterAttribute.Create(const ParamType: TParameterType);
begin
  inherited Create;

  FParamType := ParamType;
end;

{ BodyAttribute }

constructor BodyAttribute.Create;
begin
  inherited Create(TParameterType.Body);
end;

{ QueryAttribute }

constructor QueryAttribute.Create;
begin
  inherited Create(TParameterType.Query);
end;

{ PathAttribute }

constructor PathAttribute.Create;
begin
  inherited Create(TParameterType.Path);
end;

{ RemoteNameAttribute }

constructor RemoteNameAttribute.Create(const RemoteName: String);
begin
  inherited Create;

  FRemoteName := RemoteName;
end;

{ ContentTypeAttribute }

constructor ContentTypeAttribute.Create(const ContentType: String);
begin
  inherited Create;

  FContentType := ContentType;
end;

{ AttachmentAttribute }

constructor AttachmentAttribute.Create(const FileName, ContentType: String);
begin
  inherited Create(ContentType);

  FFileName := FileName;
end;

{ HeaderAttribute }

constructor HeaderAttribute.Create(const Name, Value: String);
begin
  inherited Create;

  FName := Name;
  FValue := Value;
end;

{ EHTTPErrorNotFound }

constructor EHTTPErrorNotFound.Create;
begin
  inherited Create(HTTP_STATUS_NOT_FOUND);
end;

{ EHTTPErrorBadRequest }

constructor EHTTPErrorBadRequest.Create(const ErrorMessage: String);
begin
  inherited Create(HTTP_STATUS_BAD_REQUEST, ErrorMessage);
end;

{ SOAPActionAttribute }

constructor SOAPActionAttribute.Create(const ActionName: String);
begin
  inherited Create;

  FActionName := ActionName;
end;

{ SOAPServiceAttribute }

constructor SOAPServiceAttribute.Create;
begin
  inherited Create(CONTENTTYPE_APPLICATION_SOAP_XML);
end;

{ TSOAPEnvelop }

constructor TSOAPEnvelop.Create(const Parameter: TRttiParameter; const Body: TValue);
begin
  SOAPBody.Body := Body;
  SOAPBody.Parameter := Parameter;
end;

{ XMLAttributeAttribute }

constructor XMLAttributeAttribute.Create(const AttributeName, AttributeValue: String);
begin
  inherited Create;

  FAttributeName := AttributeName;
  FAttributeValue := AttributeValue;
end;

{ XMLNamespaceAttribute }

constructor XMLNamespaceAttribute.Create(const Namespace: String);
begin
  inherited Create;

  FNamespace := Namespace;
end;

{ EnumValueAttribute }

constructor EnumValueAttribute.Create(const Values, ValueSeparator: String);
begin
  inherited Create;

  FNames := Values.Split([ValueSeparator]);
end;

{ OptionsAttribute }

constructor OptionsAttribute.Create;
begin
  inherited Create(TRequestMethod.Options);
end;

{ CharSetAttribute }

constructor CharSetAttribute.Create(const CharSet: String);
begin
  inherited Create;

  FCharSet := CharSet;
end;

{ TBluePrintStream }

constructor TBluePrintStream.Create(const Stream: TStream; const ContentType: String);
begin
  inherited Create;

  FContentType := ContentType;
  FStream := Stream;
end;

destructor TBluePrintStream.Destroy;
begin
  FStream.Free;

  inherited;
end;

function TBluePrintStream.GetSize: {$IFDEF DCC}Int64{$ELSE}NativeInt{$ENDIF};
begin
  Result := FStream.Size;
end;

procedure TBluePrintStream.SetSize(const NewSize: {$IFDEF DCC}Int64{$ELSE}NativeInt{$ENDIF});
begin
  FStream.Size := NewSize;
end;

{$IFDEF PAS2JS}
function TBluePrintStream.Read(Buffer: TBytes; OffSet, Count: LongInt): LongInt;
begin
  Result := FStream.Read(Buffer, OffSet, Count);
end;

function TBluePrintStream.Write(const Buffer: TBytes; OffSet, Count: LongInt): LongInt;
begin
  Result := FStream.Write(Buffer, OffSet, Count);
end;
{$ELSE}
function TBluePrintStream.Read(var Buffer; Count: TNativeCount): TNativeCount;
begin
  Result := FStream.Read(Buffer, Count);
end;

function TBluePrintStream.Seek(const Offset: Int64; Origin: TSeekOrigin): Int64;
begin
  Result := FStream.Seek(Offset, Origin);
end;

function TBluePrintStream.Write(const Buffer; Count: TNativeCount): TNativeCount;
begin
  Result := FStream.Write(Buffer, Count);
end;
{$ENDIF}

{$IFDEF PAS2JS}
{ TBlobStream }

constructor TBlobStream.Create(const Blob: TJSBlob);
begin
  inherited Create;

  FBlob := Blob;
end;

function TBlobStream.GetSize: NativeInt;
begin
  Result := FBlob.Size;
end;

function TBlobStream.Read(Buffer: TBytes; Offset, Count: LongInt): LongInt;
begin
  ReadNotImplemented;
end;

function TBlobStream.Write(const Buffer: TBytes; Offset, Count: LongInt): LongInt;
begin
  WriteNotImplemented;
end;
{$ENDIF}

{ TRttiTypeHelper }

function TRttiTypeHelper.AsInterface: TRttiInterfaceType;
begin
  Result := Self as TRttiInterfaceType;
end;

function TRttiTypeHelper.IsDynamicProperty: Boolean;
begin
  Result := Self.QualifiedName.StartsWith('Blue.Print.Types.TDynamicProperty<');
end;

function TRttiTypeHelper.IsInterface: Boolean;
begin
  Result := Self is TRttiInterfaceType;
end;

{ TFormatAttribute }

constructor TFormatAttribute.Create(const Format: String);
begin
  inherited Create;

  FFormat := Format;
end;

{ FieldNameAttribute }

constructor FieldNameAttribute.Create(const Name: String);
begin
  inherited Create;

  FName := Name;
end;

{ TDynamicProperty<V> }

procedure TDynamicProperty<V>.Add(const Key: String; const Value: V);
begin
  inherited Add(TPair<String, V>.Create(Key, Value));
end;

function TDynamicProperty<V>.ContainsKey(const Key: String): Boolean;
begin
  Result := IndexOf(Key) > -1;
end;

function TDynamicProperty<V>.GetDynamicPropertyItem(const Key: String): V;
var
  ItemIndex: NativeInt;

begin
  ItemIndex := IndexOf(Key);

  if ItemIndex > -1 then
    Result := Items[ItemIndex].Value
  else
    Result := Default(V);
end;

function TDynamicProperty<V>.GetValues: TArray<V>;
var
  Item: TPair<String, V>;

begin
  Result := nil;

  for Item in Self do
    Result := Result + [Item.Value];
end;

function TDynamicProperty<V>.IndexOf(const Key: String): NativeInt;
var
  A: NativeInt;

begin
  for A := 0 to Pred(Count) do
    if Items[A].Key = Key then
      Exit(A);

  Result := -1;
end;

procedure TDynamicProperty<V>.SetDynamicPropertyItem(const Key: String; const Value: V);
var
  ItemIndex: NativeInt;

begin
  ItemIndex := IndexOf(Key);

  if ItemIndex > -1 then
    Items[ItemIndex] := TPair<String, V>.Create(Key, Value)
  else
    Add(Key, Value);
end;

{ FlatAttribute }

constructor FlatAttribute.Create(const EnumeratorPropertyName: String);
begin
  Create;

  FEnumeratorPropertyName := EnumeratorPropertyName;
end;

constructor FlatAttribute.Create;
begin
  inherited;
end;

{ PatternPropertyAttribute }

constructor PatternPropertyAttribute.Create(const Regex: String);
begin
  inherited Create;

  FRegex := Regex;
end;

{ DocumentNameAttribute }

constructor DocumentNameAttribute.Create(const Name: String);
begin
  inherited Create;

  FName := Name;
end;

end.

