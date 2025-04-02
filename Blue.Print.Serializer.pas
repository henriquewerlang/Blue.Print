unit Blue.Print.Serializer;

interface

uses System.SysUtils, System.Rtti, System.TypInfo, Blue.Print.Types, {$IFDEF PAS2JS}BrowserApi.Web, JSApi.JS{$ELSE}System.JSON, Xml.XMLIntf{$ENDIF};

type
{$IFDEF PAS2JS}
  IXMLDocument = TJSXMLDocument;
  IXMLNode = TJSNode;
  PTypeInfo = TTypeInfo;
  TJSONArray = TJSArray;
  TJSONNumber = TJSNumber;
  TJSONObject = TJSObject;
  TJSONString = TJSString;
  TJSONValue = JSValue;
{$ELSE}
  TJSONValue = System.JSON.TJSONValue;
{$ENDIF}

  EInvalidXMLDocument = class(Exception)
  public
    constructor Create;
  end;

  TBluePrintSerializer = class(TInterfacedObject)
  private
    function Deserialize(const Value: String; const TypeInfo: PTypeInfo): TValue;
    function Serialize(const Value: TValue): String;

    procedure SetFormatSettings(const Value: TFormatSettings);
  protected
    FContext: TRttiContext;
    FContentType: String;
    FFormatSettings: TFormatSettings;

    function CreateObject(const RttiType: TRttiInstanceType): TObject; virtual;
    function GetContentType: String;
    function GetEnumerationNames(const TypeInfo: PTypeInfo): TArray<String>;
    function GetEnumerationValue(const TypeInfo: PTypeInfo; const Value: String): TValue;
  public
    constructor Create;

    destructor Destroy; override;
  end;

  TBluePrintJsonSerializer = class(TBluePrintSerializer, IBluePrintSerializer)
  private
    function Deserialize(const Value: String; const TypeInfo: PTypeInfo): TValue;
    function GetJSONValue(const JSONValue: TJSONValue): String; inline;
    function Serialize(const Value: TValue): String;
  protected
    function DeserializeArray(const RttiType: TRttiType; const JSONArray: TJSONArray): TValue;
    function DeserializeClassReference(const RttiType: TRttiType; const JSONValue: TJSONValue): TValue;
    function DeserializeType(const RttiType: TRttiType; const JSONValue: TJSONValue): TValue; virtual;
    function SerializeArray(const RttiType: TRttiType; const Value: TValue): TJSONArray;
    function SerializeType(const RttiType: TRttiType; const Value: TValue): TJSONValue; virtual;

    procedure DeserializeFields(const RttiType: TRttiType; const Instance: TValue; const JSONObject: TJSONObject);
    procedure DeserializeProperties(const RttiType: TRttiType; const Instance: TObject; const JSONObject: TJSONObject);
    procedure SerializeFields(const RttiType: TRttiType; const Instance: TValue; const JSONObject: TJSONObject);
    procedure SerializeProperties(const RttiType: TRttiType; const Instance: TObject; const JSONObject: TJSONObject);
  end;

  TBluePrintXMLSerializer = class(TBluePrintSerializer, IBluePrintSerializer)
  private
    function Deserialize(const Value: String; const TypeInfo: PTypeInfo): TValue;
    function GetFormatValue(const RttiMember: TRttiMember): String;
    function GetNodeName(const RttiMember: TRttiMember): String;
    function GetNamespaceValue(const RttiObject: TRttiObject; const Namespace: String): String;
    function LoadAttributes(const RttiObject: TRttiObject; const Node: IXMLNode): IXMLNode;
    function LoadAttributeValue(const Member: TRttiDataMember; const Instance: TObject; const Node: IXMLNode): Boolean;
    function Serialize(const Value: TValue): String;
  protected
    function DeserializeArray(const RttiType: TRttiType; const Node: IXMLNode): TValue;
    function DeserializeType(const RttiType: TRttiType; const Node: IXMLNode): TValue;

    procedure DeserializeProperties(const RttiType: TRttiType; const Instance: TObject; const Node: IXMLNode);
    procedure SerializeFields(const RttiType: TRttiType; const Instance: TValue; const Node: IXMLNode; const Namespace: String);
    procedure SerializeArray(const RttiType: TRttiType; const Value: TValue; const Node: IXMLNode; const Namespace, ValueFormat: String);
    procedure SerializeProperties(const RttiType: TRttiType; const Instance: TObject; const Node: IXMLNode; const Namespace: String);
    procedure SerializeType(const RttiType: TRttiType; const Value: TValue; const Node: IXMLNode; const Namespace, ValueFormat: String);
  public
    constructor Create;

    class function GetCurrentTimeZone: String;
  end;

implementation

uses System.Classes, System.Generics.Collections, System.DateUtils, {$IFDEF DCC}System.SysConst, Xml.XMLDoc, REST.Types{$ELSE}System.RTLConsts{$ENDIF};

{$IFDEF PAS2JS}
type
  TJSObjectHelper = class helper for TJSObject
  public
    procedure AddPair(const Name: String; const Value: JSValue);
  end;

  TJArrayHelper = class helper for TJSArray
  public
    procedure AddElement(const Value: JSValue);
  end;

{ TJArrayHelper }

procedure TJArrayHelper.AddElement(const Value: JSValue);
begin
  Self.Push(Value);
end;

{ TJSObjectHelper }

procedure TJSObjectHelper.AddPair(const Name: String; const Value: JSValue);
begin
  Self[Name] := Value;
end;

const
  CONTENTTYPE_APPLICATION_JSON = 'application/json';
  CONTENTTYPE_APPLICATION_XML = 'application/xml';
  CONTENTTYPE_TEXT_PLAIN = 'text/plain';
{$ENDIF}

type
  TValueHelper = record helper for TValue
  public
    procedure SetArrayLength(const Value: NativeInt);
  end;

{ TBluePrintSerializer }

constructor TBluePrintSerializer.Create;
begin
  inherited;

  FContext := TRTTIContext.Create;
end;

function TBluePrintSerializer.CreateObject(const RttiType: TRttiInstanceType): TObject;
begin
  Result := RttiType.MetaClassType.Create;
end;

function TBluePrintSerializer.Deserialize(const Value: String; const TypeInfo: PTypeInfo): TValue;
begin
  case TypeInfo.Kind of
{$IFDEF DCC}
    tkLString,
    tkUString,
    tkWChar,
    tkWString,
{$ENDIF}
    tkChar,
    tkString: Result := TValue.From(Value);

{$IFDEF PAS2JS}
    tkBool,
{$ENDIF}
    tkEnumeration: Result := GetEnumerationValue(TypeInfo, Value);

{$IFDEF DCC}
    tkInt64,
{$ENDIF}
    tkInteger: Result := TValue.From(StrToInt64(Value));
    else Result := TValue.Empty;
  end;
end;

destructor TBluePrintSerializer.Destroy;
begin
  FContext.Free;

  inherited;
end;

function TBluePrintSerializer.GetContentType: String;
begin
  Result := FContentType;
end;

function TBluePrintSerializer.GetEnumerationNames(const TypeInfo: PTypeInfo): TArray<String>;
var
  Attribute: EnumValueAttribute;

  Enumeration: TRttiEnumerationType;

begin
  Enumeration := TRttiEnumerationType(FContext.GetType(TypeInfo));

  Attribute := Enumeration.GetAttribute<EnumValueAttribute>;

  if Assigned(Attribute) then
    Result := Attribute.Names
  else
    Result := Enumeration.GetNames;
end;

function TBluePrintSerializer.GetEnumerationValue(const TypeInfo: PTypeInfo; const Value: String): TValue;
var
  CurrentValue: Int64;
  EnumName: String;

begin
  CurrentValue := -1;

  for EnumName in GetEnumerationNames(TypeInfo) do
  begin
    Inc(CurrentValue);

    if EnumName = Value then
      Break;
  end;

  Result := TValue.FromOrdinal(TypeInfo, CurrentValue);
end;

function TBluePrintSerializer.Serialize(const Value: TValue): String;
begin
  FContentType := CONTENTTYPE_TEXT_PLAIN;

  case Value.Kind of
{$IFDEF DCC}
    tkInt64,
    tkLString,
    tkUString,
    tkWChar,
    tkWString,
{$ENDIF}
    tkChar,
    tkFloat,
    tkInteger,
    tkString: Result := Value.ToString(TFormatSettings.Invariant);

{$IFDEF PAS2JS}
    tkBool,
{$ENDIF}
    tkEnumeration: Result := GetEnumerationNames(Value.TypeInfo)[Value.AsOrdinal()];

    else Result := EmptyStr;
  end;
end;

procedure TBluePrintSerializer.SetFormatSettings(const Value: TFormatSettings);
begin
  FFormatSettings := Value;
end;

{ TBluePrintJsonSerializer }

function TBluePrintJsonSerializer.Serialize(const Value: TValue): String;
var
  JSON: TJSONValue;

begin
  case Value.Kind of
{$IFDEF DCC}
    tkMRecord,
{$ENDIF}
    tkArray,
    tkClass,
    tkClassRef,
    tkDynArray,
    tkRecord:
    begin
      FContentType := CONTENTTYPE_APPLICATION_JSON;
      JSON := SerializeType(FContext.GetType(Value.TypeInfo), Value);

      Result := {$IFDEF DCC}JSON.ToJSON{$ELSE}TJSJSON.stringify(JSON){$ENDIF};

{$IFDEF DCC}
      JSON.Free;
{$ENDIF}
    end;
    else Result := inherited;
  end;
end;

function TBluePrintJsonSerializer.SerializeArray(const RttiType: TRttiType; const Value: TValue): TJSONArray;
var
  A: NativeInt;
  ElementValue: TValue;

begin
  Result := TJSONArray.{$IFDEF PAS2JS}New{$ELSE}Create{$ENDIF};

  for A := 0 to Pred(Value.GetArrayLength) do
  begin
    ElementValue := Value.GetArrayElement(A);

    Result.AddElement(SerializeType(FContext.GetType(ElementValue.TypeInfo), ElementValue));
  end;
end;

procedure TBluePrintJsonSerializer.SerializeFields(const RttiType: TRttiType; const Instance: TValue; const JSONObject: TJSONObject);
var
  Field: TRttiField;

begin
  for Field in RttiType.GetFields do
    if Field.Visibility in [mvPublic, mvPublished] then
      JSONObject.AddPair(Field.Name, SerializeType(Field.FieldType, Field.GetValue(Instance.GetReferenceToRawData)));
end;

procedure TBluePrintJsonSerializer.SerializeProperties(const RttiType: TRttiType; const Instance: TObject; const JSONObject: TJSONObject);
var
  &Property: TRttiProperty;

begin
  for &Property in RttiType.GetProperties do
    if (&Property.Visibility = mvPublished) and System.TypInfo.IsStoredProp(Instance, TRttiInstanceProperty(&Property).{$IFDEF DCC}PropInfo{$ELSE}PropertyTypeInfo{$ENDIF}) then
      JSONObject.AddPair(&Property.Name, SerializeType(&Property.PropertyType, &Property.GetValue(Instance)));
end;

function TBluePrintJsonSerializer.SerializeType(const RttiType: TRttiType; const Value: TValue): TJSONValue;

  function CreateJSONObject: TJSONObject;
  begin
    Result := TJSONObject.{$IFDEF PAS2JS}New{$ELSE}Create{$ENDIF};
  end;

  function NewString(const Value: String): TJSONString;
  begin
    Result := TJSONString.{$IFDEF PAS2JS}New{$ELSE}Create{$ENDIF}(Value);
  end;

begin
  Result := nil;

  case RttiType.TypeKind of
{$IFDEF DCC}
    tkLString,
    tkUString,
    tkWChar,
    tkWString,
{$ENDIF}
    tkChar,
    tkString: Result := NewString(Value.AsString);

{$IFDEF PAS2JS}
    tkBool,
{$ENDIF}
    tkEnumeration:
    begin
      if Value.TypeInfo = TypeInfo(Boolean) then
        Result := {$IFDEF DCC}TJSONBool.Create{$ENDIF}(Value.AsBoolean)
      else
        Result := NewString(inherited Serialize(Value));
    end;

    tkFloat:
    begin
      if (RttiType.Handle = TypeInfo(TDateTime)) or (RttiType.Handle = TypeInfo(TDate)) or (RttiType.Handle = TypeInfo(TTime)) then
        Result := NewString(DateToISO8601(Value.AsExtended))
      else
        Result := TJSONNumber.{$IFDEF PAS2JS}New{$ELSE}Create{$ENDIF}(Value.AsExtended);
    end;

{$IFDEF DCC}
    tkInt64,
{$ENDIF}
    tkInteger: Result := TJSONNumber.{$IFDEF PAS2JS}New{$ELSE}Create{$ENDIF}(Value.{$IFDEF PAS2JS}AsInteger{$ELSE}AsInt64{$ENDIF});

    tkClassRef: Result := SerializeType(FContext.GetType(TypeInfo(String)), TValue.From(Value.AsClass.QualifiedClassName));

    tkClass:
      if Value.IsEmpty then
        Result := {$IFDEF PAS2JS}NULL{$ELSE}TJSONNull.Create{$ENDIF}
      else
      begin
        Result := CreateJSONObject;

        SerializeProperties(FContext.GetType(Value.TypeInfo), Value.AsObject, TJSONObject(Result));
      end;

    tkArray, tkDynArray: Result := SerializeArray(RttiType, Value);

{$IFDEF DCC}
    tkMRecord,
{$ENDIF}
    tkRecord:
    begin
      if Value.TypeInfo = TypeInfo(TValue) then
        Result := SerializeType(FContext.GetType(Value.AsType<TValue>().TypeInfo), Value.AsType<TValue>())
      else
      begin
        Result := CreateJSONObject;

        SerializeFields(RttiType, Value, TJSONObject(Result));
      end;
    end;
  end;
end;

procedure TBluePrintJsonSerializer.DeserializeProperties(const RttiType: TRttiType; const Instance: TObject; const JSONObject: TJSONObject);
var
  Key: {$IFDEF PAS2JS}String{$ELSE}TJSONPair{$ENDIF};
  Prop: TRttiProperty;

begin
  for Key in {$IFDEF PAS2JS}TJSObject.Keys{$ENDIF}(JSONObject) do
  begin
    Prop := RttiType.GetProperty(Key{$IFDEF DCC}.JsonString.Value{$ENDIF});

    if Assigned(Prop) then
      Prop.SetValue(Instance, DeserializeType(Prop.PropertyType, {$IFDEF PAS2JS}JSONObject[Key]{$ELSE}Key.JsonValue{$ENDIF}));
  end;
end;

function TBluePrintJsonSerializer.DeserializeType(const RttiType: TRttiType; const JSONValue: TJSONValue): TValue;
begin
  case RttiType.TypeKind of
{$IFDEF DCC}
    tkLString,
    tkUString,
    tkWChar,
    tkWString,
{$ENDIF}
    tkChar,
    tkString: Result := TValue.From(GetJSONValue(JSONValue));

{$IFDEF PAS2JS}
    tkBool: Result := TValue.From<Boolean>(JSONValue = True);
{$ENDIF}
    tkEnumeration: Result := GetEnumerationValue(RttiType.Handle, {$IFDEF PAS2JS}String(JSONValue){$ELSE}JSONValue.Value{$ENDIF});

    tkFloat:
    begin
      if (RttiType.Handle = TypeInfo(TDateTime)) or (RttiType.Handle = TypeInfo(TDate)) or (RttiType.Handle = TypeInfo(TTime)) then
        Result := TValue.From(ISO8601ToDate(GetJSONValue(JSONValue)))
      else
        Result := TValue.From({$IFDEF PAS2JS}Double(JSONValue){$ELSE}(JSONValue as TJSONNumber).AsDouble{$ENDIF});
    end;

{$IFDEF DCC}
    tkInt64: Result := (JSONValue as TJSONNumber).AsInt64;
{$ENDIF}
    tkInteger: Result := TValue.From({$IFDEF PAS2JS}Integer(JSONValue){$ELSE}(JSONValue as TJSONNumber).AsInt{$ENDIF});

    tkClassRef: Result := DeserializeClassReference(RttiType, JSONValue);

    tkClass:
      if {$IFDEF PAS2JS}JSONValue = NULL{$ELSE}JSONValue.Null{$ENDIF} then
        TValue.Make(nil, RttiType.Handle, Result)
      else
      begin
        Result := TValue.From(CreateObject(RttiType.AsInstance));

        DeserializeProperties(RttiType, Result.AsObject, TJSONObject(JSONValue));
      end;

    tkArray, tkDynArray: Result := DeserializeArray(RttiType, TJSONArray(JSONValue));

{$IFDEF DCC}
    tkMRecord,
{$ENDIF}
    tkRecord:
    begin
      TValue.Make(nil, RttiType.Handle, Result);

      DeserializeFields(RttiType, Result, TJSONObject(JSONValue));
    end;

    else Result := TValue.Empty;
  end;
end;

function TBluePrintJsonSerializer.GetJSONValue(const JSONValue: TJSONValue): String;
begin
  Result := String(JSONValue{$IFDEF DCC}.Value{$ENDIF});
end;

function TBluePrintJsonSerializer.Deserialize(const Value: String; const TypeInfo: PTypeInfo): TValue;
var
  JSON: TJSONValue;

begin
  case TypeInfo.Kind of
{$IFDEF DCC}
    tkMRecord,
{$ENDIF}
    tkArray,
    tkClass,
    tkClassRef,
    tkDynArray,
    tkRecord:
    begin
      JSON := {$IFDEF PAS2JS}TJSJSON.Parse{$ELSE}TJSONValue.ParseJSONValue{$ENDIF}(Value);

      Result := DeserializeType(FContext.GetType(TypeInfo), JSON);

{$IFDEF PAS2JS}
      JSON := nil;
{$ELSE}
      JSON.Free;
{$ENDIF}
    end;

    else Result := inherited;
  end;
end;

function TBluePrintJsonSerializer.DeserializeArray(const RttiType: TRttiType; const JSONArray: TJSONArray): TValue;
var
  ArrayElementType: TRttiType;
  ArrayItems: TArray<TValue>;
  Count: Integer;
  Index: Integer;

begin
  Count := JSONArray.{$IFDEF PAS2JS}Length{$ELSE}Count{$ENDIF};

  SetLength(ArrayItems, Count);

{$IFDEF DCC}
  if RttiType is TRttiArrayType then
    ArrayElementType := TRttiArrayType(RttiType).ElementType
  else
{$ENDIF}
    ArrayElementType := TRttiDynamicArrayType(RttiType).ElementType;

  for Index := 0 to Pred(Count) do
    ArrayItems[Index] := DeserializeType(ArrayElementType, JSONArray[Index]);

  Result := TValue.FromArray(RttiType.Handle, ArrayItems);
end;

function TBluePrintJsonSerializer.DeserializeClassReference(const RttiType: TRttiType; const JSONValue: TJSONValue): TValue;
var
  ClassReferenceType: TRttiInstanceType;

begin
  ClassReferenceType := FContext.FindType(GetJSONValue(JSONValue)) as TRttiInstanceType;

  if Assigned(ClassReferenceType) then
    Result := TValue.From(ClassReferenceType.MetaclassType)
  else
    Result := TValue.Empty;
end;

procedure TBluePrintJsonSerializer.DeserializeFields(const RttiType: TRttiType; const Instance: TValue; const JSONObject: TJSONObject);
var
  Field: TRttiField;
  Key: {$IFDEF PAS2JS}String{$ELSE}TJSONPair{$ENDIF};

begin
  for Key in {$IFDEF PAS2JS}TJSObject.Keys{$ENDIF}(JSONObject) do
  begin
    Field := RttiType.GetField(Key{$IFDEF DCC}.JsonString.Value{$ENDIF});

    if Assigned(Field) then
      Field.SetValue(Instance.GetReferenceToRawData, DeserializeType(Field.FieldType, {$IFDEF PAS2JS}JSONObject[Key]{$ELSE}Key.JsonValue{$ENDIF}));
  end;
end;

{ TBluePrintXMLSerializer }

constructor TBluePrintXMLSerializer.Create;
begin
  inherited;

{$IFDEF DCC}
  FFormatSettings := TFormatSettings.Invariant;
  FFormatSettings.DateSeparator := '-';
  FFormatSettings.DecimalSeparator := '.';
  FFormatSettings.ThousandSeparator := #0;
  FFormatSettings.TimeSeparator := ':';
{$ENDIF}
end;

function TBluePrintXMLSerializer.Deserialize(const Value: String; const TypeInfo: PTypeInfo): TValue;
begin
{$IFDEF DCC}
  case TypeInfo.Kind of
    tkArray,
    tkClass,
    tkClassRef,
    tkDynArray,
    tkMRecord,
    tkRecord:
    begin
      var XML := NewXMLDocument;

      XML.LoadFromXML(Value);

      if Assigned(XML.DocumentElement) then
      begin
        var XMLNode := XML.DocumentElement;

        if XMLNode.LocalName = 'Envelope' then
        begin
          XMLNode := XMLNode.ChildNodes.First;

          while XMLNode.LocalName <> 'Body' do
            XMLNode := XMLNode.NextSibling;

          XMLNode := XMLNode.ChildNodes.First;
        end;

        Result := DeserializeType(FContext.GetType(TypeInfo), XMLNode);
      end
      else
        raise EInvalidXMLDocument.Create;
    end;

    else Result := inherited;
  end;
{$ENDIF}
end;

function TBluePrintXMLSerializer.DeserializeArray(const RttiType: TRttiType; const Node: IXMLNode): TValue;
begin
{$IFDEF DCC}
  var ArrayElementType: TRttiType;

  if RttiType is TRttiArrayType then
    ArrayElementType := TRttiArrayType(RttiType).ElementType
  else
    ArrayElementType := TRttiDynamicArrayType(RttiType).ElementType;

  Result := DeserializeType(ArrayElementType, Node);
{$ENDIF}
end;

procedure TBluePrintXMLSerializer.DeserializeProperties(const RttiType: TRttiType; const Instance: TObject; const Node: IXMLNode);
{$IFDEF DCC}
const
  TEXT_NODE_NAME = '#text';

  function FindPropertyValue: TRttiProperty;
  begin
    Result := nil;

    for var Prop in RttiType.GetProperties do
      if Prop.HasAttribute<XMLValueAttribute> then
        Exit(Prop);
  end;

  procedure LoadPropertyValue(const Node: IXMLNode);
  begin
    if Node.NodeName = TEXT_NODE_NAME then
      FindPropertyValue.SetValue(Instance, TValue.FromVariant(Node.NodeValue))
    else
    begin
      var Prop := RttiType.GetProperty(Node.NodeName);

      if Assigned(Prop) then
      begin
        var Value := DeserializeType(Prop.PropertyType, Node);

        if (Prop.PropertyType is TRttiArrayType) or (Prop.PropertyType is TRttiDynamicArrayType) then
        begin
          var PropertyValue := Prop.GetValue(Instance);
          var ValueIndex := PropertyValue.GetArrayLength;

          PropertyValue.SetArrayLength(Succ(ValueIndex));

          PropertyValue.SetArrayElement(ValueIndex, Value);

          Value := PropertyValue;
        end;

        Prop.SetValue(Instance, Value);
      end;
    end;
  end;

{$ENDIF}
begin
{$IFDEF DCC}
  var ChildNode := Node.ChildNodes.First;

  while Assigned(ChildNode) do
  begin
    LoadPropertyValue(ChildNode);

    if Assigned(ChildNode) then
      ChildNode := ChildNode.NextSibling;
  end;

  for var A := 0 to Pred(Node.AttributeNodes.Count) do
    LoadPropertyValue(Node.AttributeNodes[A]);
{$ENDIF}
end;

function TBluePrintXMLSerializer.DeserializeType(const RttiType: TRttiType; const Node: IXMLNode): TValue;
begin
{$IFDEF DCC}
  case RttiType.TypeKind of
    tkLString,
    tkUString,
    tkWChar,
    tkWString,
    tkChar,
    tkString: Result := TValue.From(Node.Text);

{$IFDEF PAS2JS}
    tkBool,
{$ENDIF}
    tkEnumeration: Result := GetEnumerationValue(RttiType.Handle, Node.Text);

    tkFloat:
    begin
      if RttiType.Handle = TypeInfo(TDateTime) then
        Result := TValue.From(ISO8601ToDate(Node.Text, []))
      else if RttiType.Handle = TypeInfo(TDate) then
        Result := TValue.From(ISO8601ToDate(Node.Text))
      else if RttiType.Handle = TypeInfo(TTime) then
        Result := TValue.From(StrToTime(Node.Text))
      else
        Result := StrToFloat(Node.Text, TFormatSettings.Invariant);
    end;

    tkInt64: Result := StrToInt64(Node.Text);
    tkInteger: Result := StrToInt(Node.Text);

//    tkClassRef: Result := DeserializeClassReference(JSONValue);

    tkClass:
      if Assigned(Node) then
      begin
        Result := TValue.From(CreateObject(RttiType.AsInstance));

        DeserializeProperties(RttiType, Result.AsObject, Node);
      end;

    tkMRecord,
    tkRecord:
    begin
      TValue.Make(nil, RttiType.Handle, Result);

//      DeserializeFields(Result, Node);
    end;
    tkDynArray,
    tkArray: Result := DeserializeArray(RttiType, Node);
    else Result := TValue.Empty;
  end;
{$ENDIF}
end;

class function TBluePrintXMLSerializer.GetCurrentTimeZone: String;
begin
{$IFDEF DCC}
  Result := TTimeZone.Local.Abbreviation.Substring(3);

  if Result.Length < 5 then
    Result := Result + ':00';
{$ENDIF}
end;

function TBluePrintXMLSerializer.GetFormatValue(const RttiMember: TRttiMember): String;
begin
{$IFDEF DCC}
  Result := EmptyStr;

  var FormatAttribute := RttiMember.GetAttribute<TFormatAttribute>;

  if Assigned(FormatAttribute) then
    Result := FormatAttribute.Format;
{$ENDIF}
end;

function TBluePrintXMLSerializer.GetNamespaceValue(const RttiObject: TRttiObject; const Namespace: String): String;
begin
{$IFDEF DCC}
  Result := Namespace;

  for var Attribute in RttiObject.GetAttributes do
    if Attribute is XMLNamespaceAttribute then
      Exit((Attribute as XMLNamespaceAttribute).Namespace);
{$ENDIF}
end;

function TBluePrintXMLSerializer.GetNodeName(const RttiMember: TRttiMember): String;
begin
{$IFDEF DCC}
  var NodeNameAttribute := RttiMember.GetAttribute<NodeNameAttribute>;

  if Assigned(NodeNameAttribute) then
    Result := NodeNameAttribute.NodeName
  else
    Result := RttiMember.Name;
{$ENDIF}
end;

function TBluePrintXMLSerializer.LoadAttributes(const RttiObject: TRttiObject; const Node: IXMLNode): IXMLNode;
begin
{$IFDEF DCC}
  Result := Node;

  for var Attribute in RttiObject.GetAttributes do
    if Attribute is XMLAttributeAttribute then
    begin
      var XMLAttribute := Attribute as XMLAttributeAttribute;

      Node.Attributes[XMLAttribute.AttributeName] := XMLAttribute.AttributeValue;
    end;
{$ENDIF}
end;

function TBluePrintXMLSerializer.LoadAttributeValue(const Member: TRttiDataMember; const Instance: TObject; const Node: IXMLNode): Boolean;
begin
{$IFDEF DCC}
   Result := False;

  for var Attribute in Member.GetAttributes do
    if Attribute is XMLAttributeValueAttribute then
    begin
      Node.Attributes[Member.Name] := Member.GetValue(Instance).ToString;
      Result := True;
    end;
{$ENDIF}
end;

function TBluePrintXMLSerializer.Serialize(const Value: TValue): String;
{$IFDEF DCC}
var
  Namespace: String;
  ValueType: TRttiType;
  XMLDocument: IXMLDocument;

  function GetDocumentName: String;
  var
    NodeName: NodeNameAttribute;

  begin
    NodeName := ValueType.GetAttribute<NodeNameAttribute>;

    if Assigned(NodeName) then
      Result := NodeName.NodeName
    else
      Result := 'Document';
  end;
{$ENDIF}

begin
{$IFDEF DCC}
  case Value.Kind of
    tkMRecord,
    tkRecord,
    tkClass:
    begin
      ValueType := FContext.GetType(Value.TypeInfo);
      XMLDocument := NewXMLDocument;
      XMLDocument.Encoding := 'UTF-8';
      XMLDocument.Version := '1.0';

      Namespace := GetNamespaceValue(ValueType, EmptyStr);

      SerializeType(ValueType, Value, XMLDocument.AddChild(GetDocumentName, Namespace), GetNamespaceValue(ValueType, Namespace), EmptyStr);

      var XML := TStringStream.Create(Emptystr, TEncoding.UTF8);

      XMLDocument.SaveToStream(XML);

      FContentType := CONTENTTYPE_APPLICATION_XML;
      Result := XML.DataString;

      XML.Free;
    end;
    else Result := inherited;
  end;
{$ENDIF}
end;

procedure TBluePrintXMLSerializer.SerializeArray(const RttiType: TRttiType; const Value: TValue; const Node: IXMLNode; const Namespace, ValueFormat: String);
begin
{$IFDEF DCC}
  var NodeName := Node.NodeName;
  var ParentNode := Node.ParentNode;

  ParentNode.ChildNodes.Remove(Node);

  for var A := 0 to Pred(Value.GetArrayLength) do
  begin
    var ElementValue := Value.GetArrayElement(A);

    SerializeType(FContext.GetType(ElementValue.TypeInfo), ElementValue, ParentNode.AddChild(NodeName, Namespace), Namespace, ValueFormat);
  end;
{$ENDIF}
end;

procedure TBluePrintXMLSerializer.SerializeFields(const RttiType: TRttiType; const Instance: TValue; const Node: IXMLNode; const Namespace: String);
begin
{$IFDEF DCC}
  for var Field in RttiType.GetFields do
    SerializeType(Field.FieldType, Field.GetValue(Instance.GetReferenceToRawData), Node.AddChild(GetNodeName(Field)), Namespace, '');
{$ENDIF}
end;

procedure TBluePrintXMLSerializer.SerializeProperties(const RttiType: TRttiType; const Instance: TObject; const Node: IXMLNode; const Namespace: String);
begin
{$IFDEF DCC}
  for var &Property in RttiType.GetProperties do
    if (&Property.Visibility = mvPublished) and System.TypInfo.IsStoredProp(Instance, TRttiInstanceProperty(&Property).PropInfo) and not LoadAttributeValue(&Property, Instance, Node) then
    begin
      var PropertyValue := &Property.GetValue(Instance);

      if not PropertyValue.IsEmpty then
      begin
        var CurrentNamespace := GetNamespaceValue(&Property.PropertyType, Namespace);

        SerializeType(&Property.PropertyType, PropertyValue, LoadAttributes(&Property, Node.AddChild(GetNodeName(&Property), CurrentNamespace)), CurrentNamespace, GetFormatValue(&Property));
      end;
    end;
{$ENDIF}
end;

procedure TBluePrintXMLSerializer.SerializeType(const RttiType: TRttiType; const Value: TValue; const Node: IXMLNode; const Namespace, ValueFormat: String);
{$IFDEF DCC}

  function GetValueFormat: String;
  begin
    Result := ValueFormat;

    if Result.IsEmpty then
      if RttiType.Handle = TypeInfo(TDateTime) then
        Result := 'YYYY-MM-DD"T"HH:NN:SSOOOO'
      else if RttiType.Handle = TypeInfo(TDate) then
        Result := 'YYYY-MM-DD'
      else if RttiType.Handle = TypeInfo(TTime) then
        Result := 'HH:NN:SS';
  end;

{$ENDIF}
begin
{$IFDEF DCC}
  case Value.Kind of
    tkMRecord,
    tkRecord:
    begin
      if Value.TypeInfo = TypeInfo(TSOAPBody) then
      begin
        var SOAPBody := Value.AsType<TSOAPBody>;

        SerializeType(FContext.GetType(SOAPBody.Body.TypeInfo), SOAPBody.Body, LoadAttributes(SOAPBody.Parameter, Node.AddChild(SOAPBody.Parameter.Name, GetNamespaceValue(SOAPBody.Parameter, Namespace))), Namespace, ValueFormat);
      end
      else if Value.TypeInfo = TypeInfo(TValue) then
        SerializeType(FContext.GetType(Value.AsType<TValue>.TypeInfo), Value.AsType<TValue>, Node, Namespace, ValueFormat)
      else
        SerializeFields(RttiType, Value, LoadAttributes(RttiType, Node), Namespace);
    end;

    tkClass:
    begin
      LoadAttributes(RttiType, Node);

      if not Value.IsEmpty then
      begin
        var ClassType := FContext.GetType(Value.TypeInfo);

        SerializeProperties(ClassType, Value.AsObject, Node, GetNamespaceValue(ClassType, Namespace));
      end;
    end;

    tkInteger,
    tkInt64,
    tkFloat:
    begin
      if RttiType.Handle = TypeInfo(TDateTime) then
        Node.NodeValue := FormatDateTime(GetValueFormat.Replace('OOOO', Format('"%s"', [GetCurrentTimeZone]), [rfIgnoreCase]), Value.AsExtended, FFormatSettings)
      else if RttiType.Handle = TypeInfo(TDate) then
        Node.NodeValue := FormatDateTime(GetValueFormat, Value.AsExtended, FFormatSettings)
      else if RttiType.Handle = TypeInfo(TTime) then
        Node.NodeValue := FormatDateTime(GetValueFormat, Value.AsExtended, FFormatSettings)
      else
        Node.NodeValue := FormatFloat(GetValueFormat, Value.AsExtended, FFormatSettings);
    end;

    tkDynArray,
    tkArray: SerializeArray(RttiType, Value, Node, Namespace, ValueFormat);

    else
    begin
      var NodeValue := inherited Serialize(Value);

      if not NodeValue.IsEmpty then
        Node.NodeValue := NodeValue;
    end;
  end;
{$ENDIF}
end;

{ EInvalidXMLDocument }

constructor EInvalidXMLDocument.Create;
begin
  inherited Create('The XML is invalid!');
end;

{ TValueHelper }

procedure TValueHelper.SetArrayLength(const Value: NativeInt);
begin
  if TypeInfo{$IFDEF DCC}^{$ENDIF}.Kind <> tkDynArray then
    raise EInvalidCast.{$IFDEF PAS2JS}Create(SErrInvalidTypecast){$ELSE}CreateRes(@SInvalidCast){$ENDIF};

{$IFDEF PAS2JS}
  SetArrayLength(Value);
{$ELSE}
  DynArraySetLength(PPointer(GetReferenceToRawData)^, TypeInfo, 1, @Value);
{$ENDIF}
end;

end.

