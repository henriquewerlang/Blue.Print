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
  end;

  TBluePrintJsonSerializer = class(TBluePrintSerializer, IBluePrintSerializer)
  private
    FContext: TRttiContext;

    function Deserialize(const Value: String; const TypeInfo: PTypeInfo): TValue;
    function GetJSONValue(const JSONValue: TJSONValue): String; inline;
    function Serialize(const Value: TValue): String;
  protected
    function CreateObject(const RttiType: TRttiInstanceType): TObject;
    function DeserializeArray(const RttiType: TRttiType; const JSONArray: TJSONArray): TValue;
    function DeserializeClassReference(const JSONValue: TJSONValue): TValue;
    function DeserializeType(const RttiType: TRttiType; const JSONValue: TJSONValue): TValue;
    function SerializeArray(const Value: TValue): TJSONArray;
    function SerializeType(const Value: TValue): TJSONValue;

    procedure DeserializeFields(const Instance: TValue; const JSONObject: TJSONObject);
    procedure DeserializeProperties(const Instance: TObject; const JSONObject: TJSONObject);
    procedure SerializeFields(const Instance: TValue; const JSONObject: TJSONObject);
    procedure SerializeProperties(const Instance: TObject; const JSONObject: TJSONObject);
  public
    constructor Create;
  end;

  TBluePrintXMLSerializer = class(TBluePrintSerializer, IBluePrintSerializer)
  private
    FContext: TRttiContext;

    function Deserialize(const Value: String; const TypeInfo: PTypeInfo): TValue;
    function Serialize(const Value: TValue): String;
  protected
    procedure SerializeFields(const Instance: TValue; const Node: IXMLNode);
    procedure SerializeProperties(const Instance: TObject; const Node: IXMLNode);
    procedure SerializeType(const Value: TValue; const Node: IXMLNode);
  public
    constructor Create;
  end;

implementation

uses System.SysUtils, System.Generics.Collections{$IFDEF DCC}, Xml.XMLDoc{$ENDIF};

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
{$ENDIF}

{ TBluePrintSerializer }

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

function TBluePrintJsonSerializer.CreateObject(const RttiType: TRttiInstanceType): TObject;
begin
  Result := RttiType.MetaClassType.Create;
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
      JSON := SerializeType(Value);

      Result := {$IFDEF DCC}JSON.ToJSON{$ELSE}TJSJSON.stringify(JSON){$ENDIF};

{$IFDEF DCC}
      JSON.Free;
{$ENDIF}
    end;
    else Result := inherited;
  end;
end;

function TBluePrintJsonSerializer.SerializeArray(const Value: TValue): TJSONArray;
var
  A: NativeInt;

begin
  Result := TJSONArray.{$IFDEF PAS2JS}New{$ELSE}Create{$ENDIF};

  for A := 0 to Pred(Value.GetArrayLength) do
    Result.AddElement(SerializeType(Value.GetArrayElement(A)));
end;

procedure TBluePrintJsonSerializer.SerializeFields(const Instance: TValue; const JSONObject: TJSONObject);
var
  Field: TRttiField;

  RttiType: TRttiType;

begin
  RttiType := FContext.GetType(Instance.TypeInfo);

  for Field in RttiType.GetFields do
    if Field.Visibility in [mvPublic, mvPublished] then
      JSONObject.AddPair(Field.Name, SerializeType(Field.GetValue(Instance.GetReferenceToRawData)));
end;

procedure TBluePrintJsonSerializer.SerializeProperties(const Instance: TObject; const JSONObject: TJSONObject);
var
  &Property: TRttiProperty;

  RttiType: TRttiType;

begin
  RttiType := FContext.GetType(Instance.ClassType);

  for &Property in RttiType.GetProperties do
    JSONObject.AddPair(&Property.Name, SerializeType(&Property.GetValue(Instance)));
end;

function TBluePrintJsonSerializer.SerializeType(const Value: TValue): TJSONValue;

  function CreateJSONObject: TJSONObject;
  begin
    Result := TJSONObject.{$IFDEF PAS2JS}New{$ELSE}Create{$ENDIF};
  end;

var
  RttiType: TRttiType;

begin
  Result := nil;
  RttiType := FContext.GetType(Value.TypeInfo);

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

    tkClassRef: Result := SerializeType(TValue.From(Value.AsClass.QualifiedClassName));

    tkClass:
      if Value.IsEmpty then
        Result := {$IFDEF PAS2JS}NULL{$ELSE}TJSONNull.Create{$ENDIF}
      else
      begin
        Result := CreateJSONObject;

        SerializeProperties(Value.AsObject, TJSONObject(Result));
      end;

    tkArray, tkDynArray: Result := SerializeArray(Value);

{$IFDEF DCC}
    tkMRecord,
{$ENDIF}
    tkRecord:
    begin
      if Value.TypeInfo = TypeInfo(TValue) then
        Result := SerializeType(Value.AsType<TValue>)
      else
      begin
        Result := CreateJSONObject;

        SerializeFields(Value, TJSONObject(Result));
      end;
    end;
  end;
end;

procedure TBluePrintJsonSerializer.DeserializeProperties(const Instance: TObject; const JSONObject: TJSONObject);
var
  Key: {$IFDEF PAS2JS}String{$ELSE}TJSONPair{$ENDIF};

  Prop: TRttiProperty;

  RttiType: TRttiType;

begin
  RttiType := FContext.GetType(Instance.ClassType);

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

    tkClassRef: Result := DeserializeClassReference(JSONValue);

    tkClass:
      if {$IFDEF PAS2JS}JSONValue <> NULL{$ELSE}not JSONValue.Null{$ENDIF} then
      begin
        Result := TValue.From(CreateObject(RttiType.AsInstance));

        DeserializeProperties(Result.AsObject, TJSONObject(JSONValue));
      end;

    tkArray, tkDynArray: Result := DeserializeArray(RttiType, TJSONArray(JSONValue));

{$IFDEF DCC}
    tkMRecord,
{$ENDIF}
    tkRecord:
    begin
      TValue.Make(nil, RttiType.Handle, Result);

      DeserializeFields(Result, TJSONObject(JSONValue));
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

function TBluePrintJsonSerializer.DeserializeClassReference(const JSONValue: TJSONValue): TValue;
var
  RttiType: TRttiInstanceType;

begin
  RttiType := FContext.FindType(GetJSONValue(JSONValue)) as TRttiInstanceType;

  if Assigned(RttiType) then
    Result := TValue.From(RttiType.MetaclassType)
  else
    Result := TValue.Empty;
end;

procedure TBluePrintJsonSerializer.DeserializeFields(const Instance: TValue; const JSONObject: TJSONObject);
var
  Field: TRttiField;
  Key: {$IFDEF PAS2JS}String{$ELSE}TJSONPair{$ENDIF};
  RttiType: TRttiType;

begin
  RttiType := FContext.GetType(Instance.TypeInfo);

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
begin
  Result := inherited;
end;

function TBluePrintXMLSerializer.Serialize(const Value: TValue): String;
var
  ValueType: TRttiType;
  XML: IXMLDocument;

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

  function LoadAttributes(const Node: IXMLNode): IXMLNode;
  var
    XMLAttribute: XMLAttributeAttribute;

  begin
    Result := Node;
    XMLAttribute := ValueType.GetAttribute<XMLAttributeAttribute>;

{$IFDEF DCC}
    if Assigned(XMLAttribute) then
      Result.Attributes[XMLAttribute.AttributeName] := XMLAttribute.AttributeValue;
{$ENDIF}
  end;

begin
  case Value.Kind of
{$IFDEF DCC}
    tkMRecord,
{$ENDIF}
    tkRecord,
    tkClass:
    begin
{$IFDEF DCC}
      ValueType := FContext.GetType(Value.TypeInfo);
      XML := TXMLDocument.Create(nil);
      XML.Active := True;

      SerializeType(Value, LoadAttributes(XML.AddChild(GetDocumentName)));

      XML.SaveToXML(Result);
{$ENDIF}
    end;
    else Result := inherited;
  end;
end;

procedure TBluePrintXMLSerializer.SerializeFields(const Instance: TValue; const Node: IXMLNode);
var
  Field: TRttiField;
  RttiType: TRttiType;

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

begin
  RttiType := FContext.GetType(Instance.TypeInfo);

{$IFDEF DCC}
  for Field in RttiType.GetFields do
    SerializeType(Field.GetValue(Instance.GetReferenceToRawData), Node.AddChild(GetFieldName));
{$ENDIF}
end;

procedure TBluePrintXMLSerializer.SerializeProperties(const Instance: TObject; const Node: IXMLNode);
var
  &Property: TRttiProperty;
  RttiType: TRttiType;

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

begin
  RttiType := FContext.GetType(Instance.ClassType);

{$IFDEF DCC}
  for &Property in RttiType.GetProperties do
    SerializeType(&Property.GetValue(Instance), Node.AddChild(GetPropertyName));
{$ENDIF}
end;

procedure TBluePrintXMLSerializer.SerializeType(const Value: TValue; const Node: IXMLNode);
begin
  case Value.Kind of
{$IFDEF DCC}
    tkMRecord,
{$ENDIF}
    tkRecord:
    begin
{$IFDEF DCC}
      if Value.TypeInfo = TypeInfo(TSOAPBody) then
        SerializeType(Value.AsType<TSOAPBody>.Body, Node.AddChild(Value.AsType<TSOAPBody>.DocumentName, EmptyStr))
      else if Value.TypeInfo = TypeInfo(TValue) then
        SerializeType(Value.AsType<TValue>, Node)
      else
        SerializeFields(Value, Node);
{$ENDIF}
    end;
    tkClass: SerializeProperties(Value.AsObject, Node);
    else Node.NodeValue := inherited Serialize(Value.AsType<TValue>);
  end;
end;

end.

