unit Blue.Print.Serializer;

interface

uses System.Rtti, System.TypInfo, Blue.Print.Types, {$IFDEF PAS2JS}JS{$ELSE}System.JSON{$ENDIF};

type
{$IFDEF PAS2JS}
  PTypeInfo = TTypeInfo;
  TJSONArray = TJSArray;
  TJSONNumber = TJSNumber;
  TJSONObject = TJSObject;
  TJSONString = TJSString;
  TJSONValue = JSValue;
{$ENDIF}

  TBluePrintJsonSerializer = class(TInterfacedObject, IBluePrintSerializer)
  private
    FContext: TRttiContext;

    function Deserialize(const Value: String; const TypeInfo: PTypeInfo): TValue;
    function Serialize(const Value: TValue): String;
  protected
    function CreateObject(const RttiType: TRttiInstanceType): TObject; virtual;
    function DeserializeArray(const RttiType: TRttiType; const JSONArray: TJSONArray): TValue;
    function DeserializeType(const RttiType: TRttiType; const JSONValue: TJSONValue): TValue;
    function SerializeArray(const Value: TValue): TJSONArray;
    function SerializeType(const Value: TValue): TJSONValue;

    procedure DeserializeProperties(const Instance: TObject; const JSONObject: TJSONObject); virtual;
    procedure SerializeProperties(const Instance: TObject; const JSONObject: TJSONObject);

//    function CreateRecord(RttiType: TRttiType): TJSObject; virtual;
//    function DeserializeClassRef(const JSON: JSValue; RttiType: TRttiType): TValue; virtual;
//    function DeserializeEnumerator(const JSON: JSValue; RttiType: TRttiType): TValue; virtual;
//    function DeserializeJSON(const JSON: JSValue; RttiType: TRttiType): TValue; virtual;
//    function DeserializeObject(const JSON: JSValue; RttiType: TRttiType): TValue; virtual;
//    function DeserializeObjectProperty(const PropertyValue: TValue; const Member: TRttiMember; const RttiType: TRttiType; const JSON: JSValue): TValue; virtual;
//    function DeserializeRecord(const JSON: JSValue; RttiType: TRttiType): TValue; virtual;
//    function SerializeJSON(const Value: TValue; RttiType: TRttiType): JSValue; virtual;
//    function SerializeObject(const Value: TValue; RttiType: TRttiInstanceType): JSValue; virtual;
  public
    constructor Create;
  end;

  TBluePrintXMLSerializer = class(TInterfacedObject, IBluePrintSerializer)
  private
    function Deserialize(const Value: String; const TypeInfo: PTypeInfo): TValue;
    function Serialize(const Value: TValue): String;
  end;

implementation

uses System.SysUtils, System.Generics.Collections;

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

//function TBluePrintJsonSerializer.CreateRecord(RttiType: TRttiType): TJSObject;
//var
//  RecordType: TRttiRecordType absolute RttiType;
//
//begin
//  Result := TJSObject(RecordType.RecordTypeInfo.Module[RecordType.Name]);
//
//  asm
//    Result = Object.create(Result);
//  end;
//end;

function TBluePrintJsonSerializer.Serialize(const Value: TValue): String;
var
  JSON: TJSONValue;

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
    tkInteger,
    tkString: Result := Value.ToString;

    tkArray, tkDynArray,
    tkClass:
    begin
      JSON := SerializeType(Value);

{$IFDEF DCC}
      Result := JSON.ToJSON;
{$ELSE}
      TJSJSON.stringify(JSON);
{$ENDIF}

{$IFDEF DCC}
      JSON.Free;
{$ELSE}
      JSON := nil;
{$ENDIF}
    end;

    tkRecord: ;
{$IFDEF DCC}
    tkMRecord: ;
{$ENDIF}
    else Result := '';
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

    tkClass:
    begin
      Result := TJSONObject.{$IFDEF PAS2JS}New{$ELSE}Create{$ENDIF};

      SerializeProperties(Value.AsObject, TJSONObject(Result));
    end;

    tkArray, tkDynArray: Result := SerializeArray(Value);

    tkRecord: ;
{$IFDEF DCC}
    tkMRecord: ;
{$ENDIF}
  end;
end;

//function TBluePrintJsonSerializer.DeserializeClassRef(const JSON: JSValue; RttiType: TRttiType): TValue;
//var
//  ClassRefType: TRttiInstanceType;
//
//begin
//  ClassRefType := FContext.FindType(String(JSON)) as TRttiInstanceType;
//
//  if Assigned(ClassRefType) then
//    Result := TValue.From(ClassRefType.MetaclassType)
//  else
//    Result := TValue.Empty;
//end;

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
    Prop := RttiType.GetProperty(Key{$IFDEF DCC}.JsonString.Value{$ENDIF});

    if Assigned(Prop) then
      Prop.SetValue(Instance, DeserializeType(Prop.PropertyType, {$IFDEF PAS2JS}JSONObject[Key]{$ELSE}Key.JsonValue{$ENDIF}));
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
{$IFDEF DCC}
    tkLString,
    tkUString,
    tkWChar,
    tkWString,
{$ENDIF}
    tkChar,
    tkString: Result := TValue.From(JSONValue{$IFDEF DCC}.Value{$ENDIF});

    tkEnumeration: Result := TValue.FromOrdinal(RttiType.Handle, GetEnumValue(RttiType.Handle, String(JSONValue{$IFDEF DCC}.Value{$ENDIF})));

    tkFloat: Result := {$IFDEF PAS2JS}TValue.From(JSONValue){$ELSE}(JSONValue as TJSONNumber).AsDouble{$ENDIF};
//  Conversão de data e hora
//  if (RttiType.Handle = TypeInfo(TDateTime)) or (RttiType.Handle = TypeInfo(TDate)) or (RttiType.Handle = TypeInfo(TTime)) then
//    Result := TValue.From(RFC3339ToDateTime(String(JSON)))

{$IFDEF DCC}
    tkInt64: Result := (JSONValue as TJSONNumber).AsInt64;
{$ENDIF}
    tkInteger: Result := {$IFDEF PAS2JS}TValue.From(JSONValue){$ELSE}(JSONValue as TJSONNumber).AsInt{$ENDIF};

    tkClass:
    begin
      Result := TValue.From(CreateObject(RttiType.AsInstance));

      DeserializeProperties(Result.AsObject, TJSONObject(JSONValue));
    end;

    tkArray, tkDynArray: Result := DeserializeArray(RttiType, TJSONArray(JSONValue));

    tkRecord: ;

{$IFDEF DCC}
    tkMRecord: ;
{$ENDIF}

    else Result := TValue.Empty;
  end;
end;

//function TBluePrintJsonSerializer.DeserializeRecord(const JSON: JSValue; RttiType: TRttiType): TValue;
//var
//  CurrentRecord: TJSObject;
//
//begin
//  if JSON = NULL then
//    Result := TValue.Empty
//  else
//  begin
//    CurrentRecord := CreateRecord(RttiType);
//    Result := TValue.From(TObject(CurrentRecord));
//
//    DeserializeProperties(CurrentRecord, RttiType, JSON);
//  end;
//end;

function TBluePrintJsonSerializer.Deserialize(const Value: String; const TypeInfo: PTypeInfo): TValue;
var
  JSON: TJSONValue;

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

    tkArray, tkDynArray,
    tkClass:
    begin
      JSON := {$IFDEF PAS2JS}TJSJSON.Parse{$ELSE}TJSONValue.ParseJSONValue{$ENDIF}(Value);

      Result := DeserializeType(FContext.GetType(TypeInfo), JSON);

{$IFDEF PAS2JS}
      JSON := nil;
{$ELSE}
      JSON.Free;
{$ENDIF}
    end;

    tkRecord: ;

{$IFDEF DCC}
    tkMRecord: ;
{$ENDIF}

    else Result := TValue.Empty;
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

