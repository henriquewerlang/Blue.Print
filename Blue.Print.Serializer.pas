﻿unit Blue.Print.Serializer;

interface

uses System.Rtti, System.TypInfo, Blue.Print.Types, {$IFDEF PAS2JS}BrowserApi.Web, JSApi.JS{$ELSE}System.JSON, Xml.XMLIntf{$ENDIF};

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
{$ENDIF}

  TBluePrintSerializer = class(TInterfacedObject)
  private
    function Deserialize(const Value: String; const TypeInfo: PTypeInfo): TValue;
    function Serialize(const Value: TValue): String;
  protected
    function CreateObject(const RttiType: TRttiInstanceType): TObject;
  end;

  TBluePrintJsonSerializer = class(TBluePrintSerializer, IBluePrintSerializer)
  private
    FContext: TRttiContext;

    function Deserialize(const Value: String; const TypeInfo: PTypeInfo): TValue;
    function GetJSONValue(const JSONValue: TJSONValue): String; inline;
    function Serialize(const Value: TValue): String;
  protected
    function DeserializeArray(const RttiType: TRttiType; const JSONArray: TJSONArray): TValue;
    function DeserializeClassReference(const RttiType: TRttiType; const JSONValue: TJSONValue): TValue;
    function DeserializeType(const RttiType: TRttiType; const JSONValue: TJSONValue): TValue;
    function SerializeArray(const RttiType: TRttiType; const Value: TValue): TJSONArray;
    function SerializeType(const RttiType: TRttiType; Value: TValue): TJSONValue;

    procedure DeserializeFields(const RttiType: TRttiType; const Instance: TValue; const JSONObject: TJSONObject);
    procedure DeserializeProperties(const RttiType: TRttiType; const Instance: TObject; const JSONObject: TJSONObject);
    procedure SerializeFields(const RttiType: TRttiType; const Instance: TValue; const JSONObject: TJSONObject);
    procedure SerializeProperties(const RttiType: TRttiType; const Instance: TObject; const JSONObject: TJSONObject);
  public
    constructor Create;
  end;

  TBluePrintXMLSerializer = class(TBluePrintSerializer, IBluePrintSerializer)
  private
    FContext: TRttiContext;

    function Deserialize(const Value: String; const TypeInfo: PTypeInfo): TValue;
    function LoadAttributes(const RttiObject: TRttiObject; const Node: IXMLNode): IXMLNode;
    function Serialize(const Value: TValue): String;
  protected
    function DeserializeType(const RttiType: TRttiType; const Node: IXMLNode): TValue;

    procedure DeserializeProperties(const RttiType: TRttiType; const Instance: TObject; const Node: IXMLNode);
    procedure SerializeFields(const RttiType: TRttiType; const Instance: TValue; const Node: IXMLNode);
    procedure SerializeProperties(const RttiType: TRttiType; const Instance: TObject; const Node: IXMLNode);
    procedure SerializeType(const RttiType: TRttiType; const Value: TValue; const Node: IXMLNode);
  public
    constructor Create;
  end;

implementation

uses System.Classes, System.SysUtils, System.Generics.Collections{$IFDEF DCC}, Xml.XMLDoc{$ENDIF};

type
  TValueHelper = record helper for TValue
  public
    function ToString(const Format: TFormatSettings): String; overload;
  end;

{$IFDEF PAS2JS}
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
{$ENDIF}

{ TBluePrintSerializer }

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

    tkEnumeration: Result := TValue.FromOrdinal(TypeInfo, GetEnumValue(TypeInfo, Value));

{$IFDEF DCC}
    tkInt64,
{$ENDIF}
    tkInteger: Result := TValue.From(StrToInt64(Value));
    else Result := TValue.Empty;
  end;
end;

function TBluePrintSerializer.Serialize(const Value: TValue): String;
begin
  case Value.Kind of
{$IFDEF DCC}
    tkInt64,
    tkLString,
    tkUString,
    tkWChar,
    tkWString,
{$ENDIF}
    tkChar,
    tkEnumeration,
    tkFloat,
    tkInteger,
    tkString: Result := Value.ToString(TFormatSettings.Invariant);

    else Result := EmptyStr;
  end;
end;

{ TBluePrintJsonSerializer }

constructor TBluePrintJsonSerializer.Create;
begin
  inherited;

  FContext := TRTTIContext.Create;
end;

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
    JSONObject.AddPair(&Property.Name, SerializeType(&Property.PropertyType, &Property.GetValue(Instance)));
end;

function TBluePrintJsonSerializer.SerializeType(const RttiType: TRttiType; Value: TValue): TJSONValue;

  function CreateJSONObject: TJSONObject;
  begin
    Result := TJSONObject.{$IFDEF PAS2JS}New{$ELSE}Create{$ENDIF};
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
    tkString: Result := TJSONString.{$IFDEF PAS2JS}New{$ELSE}Create{$ENDIF}(Value.AsString);

    tkEnumeration: Result := TJSONString.{$IFDEF PAS2JS}New{$ELSE}Create{$ENDIF}(GetEnumName(Value.TypeInfo, Value.AsOrdinal));

    tkFloat: Result := TJSONNumber.{$IFDEF PAS2JS}New{$ELSE}Create{$ENDIF}(Value.AsExtended);
//  Conversão de valores data e hora
//  if (RttiType.Handle = TypeInfo(TDateTime)) or (RttiType.Handle = TypeInfo(TDate)) or (RttiType.Handle = TypeInfo(TTime)) then
//    Result := DateTimeToRFC3339(Value.AsExtended)

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

        SerializeProperties(RttiType, Value.AsObject, TJSONObject(Result));
      end;

    tkArray, tkDynArray: Result := SerializeArray(RttiType, Value);

{$IFDEF DCC}
    tkMRecord,
{$ENDIF}
    tkRecord:
    begin
      if Value.TypeInfo = TypeInfo(TValue) then
      begin
        Value := Value.AsType<TValue>;

        Result := SerializeType(FContext.GetType(Value.TypeInfo), Value)
      end
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

    tkEnumeration: Result := TValue.FromOrdinal(RttiType.Handle, GetEnumValue(RttiType.Handle, GetJSONValue(JSONValue)));

    tkFloat: Result := {$IFDEF PAS2JS}TValue.From(JSONValue){$ELSE}(JSONValue as TJSONNumber).AsDouble{$ENDIF};
//  Conversão de data e hora
//  if (RttiType.Handle = TypeInfo(TDateTime)) or (RttiType.Handle = TypeInfo(TDate)) or (RttiType.Handle = TypeInfo(TTime)) then
//    Result := TValue.From(RFC3339ToDateTime(String(JSON)))

{$IFDEF DCC}
    tkInt64: Result := (JSONValue as TJSONNumber).AsInt64;
{$ENDIF}
    tkInteger: Result := {$IFDEF PAS2JS}TValue.From(JSONValue){$ELSE}(JSONValue as TJSONNumber).AsInt{$ENDIF};

    tkClassRef: Result := DeserializeClassReference(RttiType, JSONValue);

    tkClass:
      if {$IFDEF PAS2JS}JSONValue <> NULL{$ELSE}not JSONValue.Null{$ENDIF} then
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
  FContext := TRttiContext.Create;
end;

function TBluePrintXMLSerializer.Deserialize(const Value: String; const TypeInfo: PTypeInfo): TValue;
{$IFDEF DCC}
var
  XML: IXMLDocument;

{$ENDIF}
begin
{$IFDEF DCC}
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
      XML := TXMLDocument.Create(nil);
      XML.Active := True;

      XML.LoadFromXML(Value);

      var XMLNode := XML.DocumentElement;

      if XMLNode.NodeName = 'soap:Envelope' then
      begin
        XMLNode := XMLNode.ChildNodes.FindNode('soap:Body');

        XMLNode := XMLNode.ChildNodes.First;
      end;

      Result := DeserializeType(FContext.GetType(TypeInfo), XMLNode);
    end;

    else Result := inherited;
  end;
{$ENDIF}
end;

procedure TBluePrintXMLSerializer.DeserializeProperties(const RttiType: TRttiType; const Instance: TObject; const Node: IXMLNode);
{$IFDEF DCC}
var
  ChildNode: IXMLNode;
  Prop: TRttiProperty;
{$ENDIF}

begin
{$IFDEF DCC}
  ChildNode := Node.ChildNodes.First;

  while Assigned(ChildNode) do
  begin
    Prop := RttiType.GetProperty(ChildNode.NodeName);

    if Assigned(Prop) then
      Prop.SetValue(Instance, DeserializeType(Prop.PropertyType, ChildNode));

    ChildNode := ChildNode.NextSibling;
  end;
{$ENDIF}
end;

function TBluePrintXMLSerializer.DeserializeType(const RttiType: TRttiType; const Node: IXMLNode): TValue;
begin
{$IFDEF DCC}
  case RttiType.TypeKind of
{$IFDEF DCC}
    tkLString,
    tkUString,
    tkWChar,
    tkWString,
{$ENDIF}
    tkChar,
    tkString: Result := TValue.From(Node.Text);

    tkEnumeration: Result := TValue.FromOrdinal(RttiType.Handle, GetEnumValue(RttiType.Handle, Node.Text));

    tkFloat: Result := StrToFloat(Node.Text, TFormatSettings.Invariant);
//  Conversão de data e hora
//  if (RttiType.Handle = TypeInfo(TDateTime)) or (RttiType.Handle = TypeInfo(TDate)) or (RttiType.Handle = TypeInfo(TTime)) then
//    Result := TValue.From(RFC3339ToDateTime(String(JSON)))

{$IFDEF DCC}
    tkInt64: Result := StrToInt64(Node.Text);
{$ENDIF}
    tkInteger: Result := StrToInt(Node.Text);

//    tkClassRef: Result := DeserializeClassReference(JSONValue);

    tkClass:
      if Assigned(Node) then
      begin
        Result := TValue.From(CreateObject(RttiType.AsInstance));

        DeserializeProperties(RttiType, Result.AsObject, Node);
      end;

//    tkArray, tkDynArray: Result := DeserializeArray(RttiType, TJSONArray(JSONValue));

{$IFDEF DCC}
    tkMRecord,
{$ENDIF}
    tkRecord:
    begin
      TValue.Make(nil, RttiType.Handle, Result);

//      DeserializeFields(Result, Node);
    end;

    else Result := TValue.Empty;
  end;
{$ENDIF}
end;

function TBluePrintXMLSerializer.LoadAttributes(const RttiObject: TRttiObject; const Node: IXMLNode): IXMLNode;
{$IFDEF DCC}
var
  Attribute: TCustomAttribute;

{$ENDIF}
begin
{$IFDEF DCC}
  Result := Node;

  for Attribute in RttiObject.GetAttributes do
    if Attribute is XMLAttributeAttribute then
    begin
      var XMLAttribute := Attribute as XMLAttributeAttribute;

      Result.Attributes[XMLAttribute.AttributeName] := XMLAttribute.AttributeValue;
    end;
{$ENDIF}
end;

function TBluePrintXMLSerializer.Serialize(const Value: TValue): String;
{$IFDEF DCC}
var
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
{$IFDEF DCC}
    tkMRecord,
{$ENDIF}
    tkRecord,
    tkClass:
    begin
      ValueType := FContext.GetType(Value.TypeInfo);
      XMLDocument := TXMLDocument.Create(nil);
      XMLDocument.Active := True;
      XMLDocument.Version := '1.0';

      SerializeType(ValueType, Value, LoadAttributes(ValueType, XMLDocument.AddChild(GetDocumentName)));

      var XML := TStringStream.Create;

      XMLDocument.SaveToStream(XML);

      Result := XML.DataString;

      XML.Free;
    end;
    else Result := inherited;
  end;
{$ENDIF}
end;

procedure TBluePrintXMLSerializer.SerializeFields(const RttiType: TRttiType; const Instance: TValue; const Node: IXMLNode);
{$IFDEF DCC}
var
  Field: TRttiField;

  function GetFieldName: String;
  var
    NodeName: NodeNameAttribute;

  begin
    NodeName := Field.GetAttribute<NodeNameAttribute>;

    if Assigned(NodeName) then
      Result := NodeName.NodeName
    else
      Result := Field.Name;
  end;

{$ENDIF}
begin
{$IFDEF DCC}
  for Field in RttiType.GetFields do
    SerializeType(Field.FieldType, Field.GetValue(Instance.GetReferenceToRawData), Node.AddChild(GetFieldName));
{$ENDIF}
end;

procedure TBluePrintXMLSerializer.SerializeProperties(const RttiType: TRttiType; const Instance: TObject; const Node: IXMLNode);
{$IFDEF DCC}
var
  &Property: TRttiProperty;

  function GetPropertyName: String;
  var
    NodeName: NodeNameAttribute;

  begin
    NodeName := &Property.GetAttribute<NodeNameAttribute>;

    if Assigned(NodeName) then
      Result := NodeName.NodeName
    else
      Result := &Property.Name;
  end;

{$ENDIF}
begin
{$IFDEF DCC}
  for &Property in RttiType.GetProperties do
    if System.TypInfo.IsStoredProp(Instance, TRttiInstanceProperty(&Property).PropInfo) then
      SerializeType(&Property.PropertyType, &Property.GetValue(Instance), Node.AddChild(GetPropertyName));
{$ENDIF}
end;

procedure TBluePrintXMLSerializer.SerializeType(const RttiType: TRttiType; const Value: TValue; const Node: IXMLNode);
begin
{$IFDEF DCC}
  case Value.Kind of
{$IFDEF DCC}
    tkMRecord,
{$ENDIF}
    tkRecord:
    begin
      if Value.TypeInfo = TypeInfo(TSOAPBody) then
      begin
        var SOAPBody := Value.AsType<TSOAPBody>;

        SerializeType(FContext.GetType(SOAPBody.Body.TypeInfo), SOAPBody.Body, LoadAttributes(SOAPBody.Parameter, LoadAttributes(SOAPBody.Method, Node.AddChild(SOAPBody.Method.Name, EmptyStr)).AddChild(SOAPBody.Parameter.Name, EmptyStr)));
      end
      else if Value.TypeInfo = TypeInfo(TValue) then
        SerializeType(FContext.GetType(Value.AsType<TValue>.TypeInfo), Value.AsType<TValue>, Node)
      else
        SerializeFields(RttiType, Value, Node);
    end;
    tkClass: SerializeProperties(RttiType, Value.AsObject, Node);
    else Node.NodeValue := inherited Serialize(Value.AsType<TValue>);
  end;
{$ENDIF}
end;

{ TValueHelper }

function TValueHelper.ToString(const Format: TFormatSettings): String;
begin
  case TypeInfo^.Kind of
    tkFloat:
    begin
      if TypeInfo = System.TypeInfo(TDate) then
        Exit(DateToStr(AsExtended, Format))
      else if TypeInfo = System.TypeInfo(TTime) then
        Exit(TimeToStr(AsExtended, Format))
      else if TypeInfo = System.TypeInfo(TDateTime) then
        Exit(DateTimeToStr(AsExtended, Format))
      else
        Exit(FloatToStr(AsExtended, Format));
    end;
  end;

  Result := ToString;
end;

end.

