unit Blue.Print.Serializer;

interface

uses System.Rtti, System.TypInfo, System.JSON, Blue.Print.Types{$IFDEF PAS2JS}, JS{$ENDIF};

type
  TBluePrintJsonSerializer = class(TInterfacedObject, IBluePrintSerializer)
  private
    FContext: TRttiContext;

    function Deserialize(const Value: String; const TypeInfo: PTypeInfo): TValue;
    function Serialize(const Value: TValue): String;
  protected
    function CreateObject(const RttiType: TRttiInstanceType): TObject; virtual;
    function DeserializeArray(const RttiType: TRttiType; const JSONArray: TJSONArray): TValue;
    function DeserializeType(const RttiType: TRttiType; const JSONValue: TJSONValue): TValue;

    procedure DeserializeProperties(const Instance: TObject; const JSONObject: TJSONObject); virtual;
{$IFDEF PAS2JS}
    function CreateRecord(RttiType: TRttiType): TJSObject; virtual;
    function DeserializeArray(const JSON: JSValue; RttiType: TRttiType): TValue; virtual;
    function DeserializeClassRef(const JSON: JSValue; RttiType: TRttiType): TValue; virtual;
    function DeserializeEnumerator(const JSON: JSValue; RttiType: TRttiType): TValue; virtual;
    function DeserializeJSON(const JSON: JSValue; RttiType: TRttiType): TValue; virtual;
    function DeserializeObject(const JSON: JSValue; RttiType: TRttiType): TValue; virtual;
    function DeserializeObjectProperty(const PropertyValue: TValue; const Member: TRttiMember; const RttiType: TRttiType; const JSON: JSValue): TValue; virtual;
    function DeserializeRecord(const JSON: JSValue; RttiType: TRttiType): TValue; virtual;
    function SerializeArray(const Value: TValue; RttiType: TRttiDynamicArrayType): JSValue; virtual;
    function SerializeJSON(const Value: TValue; RttiType: TRttiType): JSValue; virtual;
    function SerializeObject(const Value: TValue; RttiType: TRttiInstanceType): JSValue; virtual;

    property Context: TRttiContext read FContext;
{$ENDIF}
  public
    constructor Create;
  end;

  TBluePrintXMLSerializer = class(TInterfacedObject, IBluePrintSerializer)
  private
    function Deserialize(const Value: String; const TypeInfo: PTypeInfo): TValue;
    function Serialize(const Value: TValue): String;
  end;

implementation

uses System.SysUtils;

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

{$IFDEF PAS2JS}
function TBluePrintJsonSerializer.CreateRecord(RttiType: TRttiType): TJSObject;
var
  RecordType: TRttiRecordType absolute RttiType;

begin
//  Result := TJSObject(RecordType.RecordTypeInfo.Module[RecordType.Name]);
//
//  asm
//    Result = Object.create(Result);
//  end;
end;
{$ENDIF}

function TBluePrintJsonSerializer.Serialize(const Value: TValue): String;
begin
  case Value.Kind of
    tkChar,
    tkEnumeration,
    tkInt64,
    tkInteger,
    tkLString,
    tkString,
    tkUString,
    tkWChar,
    tkWString: Result := Value.ToString;

    tkClass: Result := '{"MyProp1":"","MyProp2":0}';

    tkArray, tkDynArray: Result := '[123,456,789]';

    tkRecord: ;
    tkMRecord: ;
    else Result := '';
  end;
{$IFDEF PAS2JS}
//  Result := TJSJSON.stringify(SerializeJSON(Value, FContext.GetType(AValue.TypeInfo)));
{$ELSE}
//  var Serializer := TJsonSerializer.Create;
//
//  Result := Serializer.Serialize(Value);
//
//  Serializer.Free;
{$ENDIF}
end;

{$IFDEF PAS2JS}
function TBluePrintJsonSerializer.DeserializeArray(const JSON: JSValue; RttiType: TRttiType): TValue;
var
  A: Integer;

  RttiArrayType: TRttiDynamicArrayType absolute RttiType;

  JSONArray: TJSArray absolute JSON;

  Values: TArray<TValue>;

begin
  if Assigned(JSONArray) then
  begin
    SetLength(Values, JSONArray.Length);

    for A := 0 to Pred(JSONArray.Length) do
      Values[A] := DeserializeJSON(JSONArray[A], RttiArrayType.ElementType);
  end
  else
    Values := nil;

  Result := TValue.FromArray(RttiArrayType.Handle, Values);
end;

function TBluePrintJsonSerializer.DeserializeClassRef(const JSON: JSValue; RttiType: TRttiType): TValue;
var
  ClassRefType: TRttiInstanceType;

begin
  ClassRefType := FContext.FindType(String(JSON)) as TRttiInstanceType;

  if Assigned(ClassRefType) then
    Result := TValue.From(ClassRefType.MetaclassType)
  else
    Result := TValue.Empty;
end;

function TBluePrintJsonSerializer.DeserializeEnumerator(const JSON: JSValue; RttiType: TRttiType): TValue;
begin
  Result := TValue.FromOrdinal(RttiType.Handle, JSON);
end;

function TBluePrintJsonSerializer.DeserializeJSON(const JSON: JSValue; RttiType: TRttiType): TValue;
begin
  if RttiType.IsInstance then
    Result := DeserializeObject(JSON, RttiType)
  else if RttiType.IsRecord then
    Result := DeserializeRecord(JSON, RttiType)
  else if RttiType is TRttiClassRefType then
    Result := DeserializeClassRef(JSON, RttiType)
  else if RttiType is TRttiDynamicArrayType then
    Result := DeserializeArray(JSON, RttiType)
  else if RttiType is TRttiEnumerationType then
    Result := DeserializeEnumerator(JSON, RttiType)
//  else if (RttiType.Handle = TypeInfo(TDateTime)) or (RttiType.Handle = TypeInfo(TDate)) or (RttiType.Handle = TypeInfo(TTime)) then
//    Result := TValue.From(RFC3339ToDateTime(String(JSON)))
  else
    TValue.Make(JSON, RttiType.Handle, Result);
end;

function TBluePrintJsonSerializer.DeserializeObject(const JSON: JSValue; RttiType: TRttiType): TValue;
var
  CurrentObject: TObject;

begin
  if JSON = NULL then
    Result := TValue.Empty
  else
  begin
    CurrentObject := CreateObject(JSON, RttiType);
    Result := TValue.From(CurrentObject);

    DeserializeProperties(TJSObject(CurrentObject), RttiType, JSON);
  end;
end;

function TBluePrintJsonSerializer.DeserializeObjectProperty(const PropertyValue: TValue; const Member: TRttiMember; const RttiType: TRttiType; const JSON: JSValue): TValue;
begin
  Result := DeserializeJSON(JSON, RttiType);
end;
{$ENDIF}

procedure TBluePrintJsonSerializer.DeserializeProperties(const Instance: TObject; const JSONObject: TJSONObject);
var
  Key: {$IFDEF PAS2JS}String{$ELSE}TJSONPair{$ENDIF};

  Prop: TRttiProperty;

  RttiType: TRttiType;

//  JSONObject: TJSObject absolute JSON;
//
//  Field: TRttiField;
//
//  Value: TValue;

begin
  RttiType := FContext.GetType(Instance.ClassType);

  for Key in {$IFDEF PAS2JS}TJSObject.Keys{$ENDIF}(JSONObject) do
  begin
    Prop := RttiType.GetProperty(Key{$IFNDEF PAS2JS}.JsonString.Value{$ENDIF});

    if Assigned(Prop) then
      Prop.SetValue(Instance, DeserializeType(Prop.PropertyType, Key.JsonValue));
//    else
//    begin
//      Field := RttiType.GetField(Key);
//
//      if Assigned(Field) then
//      begin
//        Member := Field;
//        MemberType := Field.FieldType;
//        Value := Field.GetValue(Instance);
//      end
//      else
//        Member := nil;
//
//    if Assigned(Member) then
//    begin
//      Value := DeserializeObjectProperty(Value, Member, MemberType, JSONObject[Key]);
//
//      if Assigned(Prop) then
//        SetJSValueProp(Instance, Prop.PropertyTypeInfo, Value.AsJSValue)
//      else if Assigned(Field) then
//        Field.SetValue(Instance, Value);
//    end
//    else if jsIn('f' + Key, Instance) then
//      Instance['f' + Key] := JSONObject[Key];
  end;
end;

function TBluePrintJsonSerializer.DeserializeType(const RttiType: TRttiType; const JSONValue: TJSONValue): TValue;
begin
  case RttiType.TypeKind of
    tkChar,
    tkLString,
    tkString,
    tkUString,
    tkWChar,
    tkWString: Result := JSONValue.Value;

    tkEnumeration: Result := TValue.FromOrdinal(RttiType.Handle, GetEnumValue(RttiType.Handle, JSONValue.Value));

    tkInt64,
    tkInteger: Result := StrToInt64(JSONValue.Value);

    tkClass:
    begin
      Result := CreateObject(RttiType.AsInstance);

      DeserializeProperties(Result.AsObject, JSONValue as TJSONObject);
    end;

    tkArray, tkDynArray: Result := DeserializeArray(RttiType, JSONValue as TJSONArray);

    tkRecord: ;

    tkMRecord: ;

    else Result := TValue.Empty;
  end;
end;

{$IFDEF PAS2JS}
function TBluePrintJsonSerializer.DeserializeRecord(const JSON: JSValue; RttiType: TRttiType): TValue;
var
  CurrentRecord: TJSObject;

begin
  if JSON = NULL then
    Result := TValue.Empty
  else
  begin
    CurrentRecord := CreateRecord(RttiType);
    Result := TValue.From(TObject(CurrentRecord));

    DeserializeProperties(CurrentRecord, RttiType, JSON);
  end;
end;
{$ENDIF}

function TBluePrintJsonSerializer.Deserialize(const Value: String; const TypeInfo: PTypeInfo): TValue;
var
  JSON: TJSONValue;

begin
  case TypeInfo.Kind of
    tkChar,
    tkLString,
    tkString,
    tkUString,
    tkWChar,
    tkWString: Result := Value;

    tkEnumeration: Result := TValue.FromOrdinal(TypeInfo, GetEnumValue(TypeInfo, Value));

    tkInt64,
    tkInteger: Result := StrToInt64(Value);

    tkArray, tkDynArray,
    tkClass:
    begin
      JSON := TJSONValue.ParseJSONValue(Value);

      Result := DeserializeType(FContext.GetType(TypeInfo), JSON);

      JSON.Free;
    end;

    tkRecord: ;

    tkMRecord: ;

    else Result := TValue.Empty;
  end;
{$IFDEF PAS2JS}
//  Result := DeserializeJSON(TJSJSON.Parse(Value), FContext.GetType(TypeInfo));
{$ENDIF}
end;

function TBluePrintJsonSerializer.DeserializeArray(const RttiType: TRttiType; const JSONArray: TJSONArray): TValue;
var
  ArrayElementType: TRttiType;

  ArrayItems: TArray<TValue>;

  Index: Integer;

begin
  SetLength(ArrayItems, JSONArray.Count);

  if RttiType is TRttiDynamicArrayType then
    ArrayElementType := TRttiDynamicArrayType(RttiType).ElementType
  else
    ArrayElementType := TRttiArrayType(RttiType).ElementType;

  for Index := 0 to Pred(JSONArray.Count) do
    ArrayItems[Index] := DeserializeType(ArrayElementType, JSONArray[Index]);

  Result := TValue.FromArray(RttiType.Handle, ArrayItems);
end;

{$IFDEF PAS2JS}
function TBluePrintJsonSerializer.SerializeArray(const Value: TValue; RttiType: TRttiDynamicArrayType): JSValue;
var
  A: Integer;

  NewArray: TArray<JSValue>;

begin
  SetLength(NewArray, Value.GetArrayLength);

  for A := 0 to Pred(Value.GetArrayLength) do
    NewArray[A] := SerializeJSON(Value.GetArrayElement(A), RttiType.ElementType);

  Result := NewArray;
end;

function TBluePrintJsonSerializer.SerializeJSON(const Value: TValue; RttiType: TRttiType): JSValue;
begin
  if RttiType.IsInstance then
    Result := SerializeObject(Value, RttiType.AsInstance)
  else if RttiType is TRttiDynamicArrayType then
    Result := SerializeArray(Value, RttiType as TRttiDynamicArrayType)
//  else if (RttiType.Handle = TypeInfo(TDateTime)) or (RttiType.Handle = TypeInfo(TDate)) or (RttiType.Handle = TypeInfo(TTime)) then
//    Result := DateTimeToRFC3339(Value.AsExtended)
  else
    Result := Value.AsJSValue;
end;

function TBluePrintJsonSerializer.SerializeObject(const Value: TValue; RttiType: TRttiInstanceType): JSValue;
var
  Prop: TRttiProperty;

  Return: TJSObject;

begin
  if Value.IsEmpty then
    Result := NULL
  else
  begin
    Return := TJSObject.new;

    for Prop in RttiType.GetProperties do
      Return[Prop.Name] := SerializeJSON(Prop.GetValue(Value.AsObject), Prop.PropertyType);

    Result := Return;
  end;
end;
{$ENDIF}

{ TBluePrintXMLSerializer }

function TBluePrintXMLSerializer.Deserialize(const Value: String; const TypeInfo: PTypeInfo): TValue;
begin
  Result := TValue.Empty;
end;

function TBluePrintXMLSerializer.Serialize(const Value: TValue): String;
begin
  Result := EmptyStr;
end;

end.

