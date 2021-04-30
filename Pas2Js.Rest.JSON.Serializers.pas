unit Pas2Js.Rest.JSON.Serializers;

interface

uses Rtti, JS, TypInfo, Delphi.Rest.JSON.Serializer.Intf;

type
  TRestJsonSerializer = class(TInterfacedObject, IRestJsonSerializer)
  private
    function Deserialize(const AJson: String; TypeInfo: PTypeInfo): TValue;
    function Serialize(const AValue: TValue): String;
  protected
    FContext: TRttiContext;

    function CreateObject(RttiType: TRttiType): TObject; virtual;
    function CreateRecord(RttiType: TRttiType): TJSObject; virtual;
    function DeserializeArray(const JSON: JSValue; RttiType: TRttiType): TValue; virtual;
    function DeserializeClassRef(const JSON: JSValue; RttiType: TRttiType): TValue; virtual;
    function DeserializeEnumerator(const JSON: JSValue; RttiType: TRttiType): TValue; virtual;
    function DeserializeJSON(const JSON: JSValue; RttiType: TRttiType): TValue; virtual;
    function DeserializeObject(const JSON: JSValue; RttiType: TRttiType): TValue; virtual;
    function DeserializeObjectProperty(const Value: TValue; RttiType: TRttiType; const JSON: JSValue): TValue; virtual;
    function DeserializeRecord(const JSON: JSValue; RttiType: TRttiType): TValue; virtual;
    function SerializeArray(const Value: TValue; RttiType: TRttiDynamicArrayType): JSValue; virtual;
    function SerializeJSON(const Value: TValue; RttiType: TRttiType): JSValue; virtual;
    function SerializeObject(const Value: TValue; RttiType: TRttiInstanceType): JSValue; virtual;

    procedure DeserializeProperties(Instance: TJSObject; RttiType: TRttiType; const JSON: JSValue); virtual;
  public
    constructor Create;
  end;

implementation

uses SysUtils, DateUtils;

{ TRestJsonSerializer }

constructor TRestJsonSerializer.Create;
begin
  inherited;

  FContext := TRTTIContext.Create;
end;

function TRestJsonSerializer.CreateObject(RttiType: TRttiType): TObject;
begin
{$IFDEF PAS2JS}
  asm
    Result = Object.create(RttiType.FTypeInfo.class);
    Result.$init();
  end;
{$ENDIF}
end;

function TRestJsonSerializer.CreateRecord(RttiType: TRttiType): TJSObject;
var
  RecordType: TRttiRecordType absolute RttiType;

begin
{$IFDEF PAS2JS}
  Result := TJSObject(RecordType.RecordTypeInfo.Module[RecordType.Name]);

  asm
    Result = Object.create(Result);
  end;
{$ENDIF}
end;

function TRestJsonSerializer.Deserialize(const AJson: String; TypeInfo: PTypeInfo): TValue;
var
  RttiType: TRttiType;

begin
  RttiType := FContext.GetType(TypeInfo);

  Result := DeserializeJSON(TJSJSON.Parse(AJson), RttiType);
end;

function TRestJsonSerializer.DeserializeArray(const JSON: JSValue; RttiType: TRttiType): TValue;
var
  A: Integer;

  RttiArrayType: TRttiDynamicArrayType absolute RttiType;

  JSONArray: TJSArray absolute JSON;

  Values: TArray<TValue>;

begin
  SetLength(Values, JSONArray.Length);

  for A := 0 to Pred(JSONArray.Length) do
    Values[A] := DeserializeJSON(JSONArray[A], RttiArrayType.ElementType);

  Result := TValue.FromArray(RttiArrayType.Handle, Values);
end;

function TRestJsonSerializer.DeserializeClassRef(const JSON: JSValue; RttiType: TRttiType): TValue;
var
  ClassRefType: TRttiInstanceType;

begin
  ClassRefType := FContext.FindType(String(JSON)) as TRttiInstanceType;

  if Assigned(ClassRefType) then
    Result := TValue.From(ClassRefType.MetaclassType)
  else
    Result := TValue.Empty;
end;

function TRestJsonSerializer.DeserializeEnumerator(const JSON: JSValue; RttiType: TRttiType): TValue;
begin
  Result := TValue.FromOrdinal(RttiType.Handle, JSON);
end;

function TRestJsonSerializer.DeserializeJSON(const JSON: JSValue; RttiType: TRttiType): TValue;
begin
  if RttiType.IsInstance  then
    Result := DeserializeObject(JSON, RttiType)
  else if RttiType.IsRecord then
    Result := DeserializeRecord(JSON, RttiType)
  else if RttiType is TRttiClassRefType then
    Result := DeserializeClassRef(JSON, RttiType)
  else if RttiType is TRttiDynamicArrayType then
    Result := DeserializeArray(JSON, RttiType)
  else if RttiType is TRttiEnumerationType then
    Result := DeserializeEnumerator(JSON, RttiType)
  else if (RttiType.Handle = TypeInfo(TDateTime)) or (RttiType.Handle = TypeInfo(TDate)) or (RttiType.Handle = TypeInfo(TTime)) then
    Result := TValue.From(RFC3339ToDateTime(String(JSON)))
  else
    Result := TValue.FromJSValue(JSON);
end;

function TRestJsonSerializer.DeserializeObject(const JSON: JSValue; RttiType: TRttiType): TValue;
var
  CurrentObject: TObject;

begin
  if JSON = NULL then
    Result := TValue.Empty
  else
  begin
    CurrentObject := CreateObject(RttiType);
    Result := TValue.FromJSValue(CurrentObject);

    DeserializeProperties(TJSObject(CurrentObject), RttiType, JSON);
  end;
end;

function TRestJsonSerializer.DeserializeObjectProperty(const Value: TValue; RttiType: TRttiType; const JSON: JSValue): TValue;
begin
  Result := DeserializeJSON(JSON, RttiType);
end;

procedure TRestJsonSerializer.DeserializeProperties(Instance: TJSObject; RttiType: TRttiType; const JSON: JSValue);
var
  JSONObject: TJSObject absolute JSON;

  Key: String;

  Prop: TRttiProperty;

  Field: TRttiField;

  Value: TValue;

  KeyType: TRttiType;

begin
  for Key in TJSObject.Keys(JSONObject) do
  begin
    Field := RttiType.GetField('F' + Key);
    KeyType := nil;
    Prop := RttiType.GetProperty(Key);

    if not Assigned(Field) then
      Field := RttiType.GetField(Key);

    if Assigned(Prop) then
    begin
      KeyType := Prop.PropertyType;
      Value := Prop.GetValue(Instance);
    end
    else if Assigned(Field) then
    begin
      KeyType := Field.FieldType;
      Value := Field.GetValue(Instance);
    end;

    if Assigned(KeyType) then
    begin
      Value := DeserializeObjectProperty(Value, KeyType, JSONObject[Key]);

      if Assigned(Prop) then
        Prop.SetValue(Instance, Value)
      else if Assigned(Field) then
        Field.SetValue(Instance, Value);
    end
    else if Instance.hasOwnProperty('f' + Key) then
      Instance['f' + Key] := JSONObject[Key];
  end;
end;

function TRestJsonSerializer.DeserializeRecord(const JSON: JSValue; RttiType: TRttiType): TValue;
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

function TRestJsonSerializer.Serialize(const AValue: TValue): String;
var
  RttiType: TRttiType;

begin
  RttiType := FContext.GetType(AValue.TypeInfo);

  Result := TJSJSON.stringify(SerializeJSON(AValue, RttiType));
end;

function TRestJsonSerializer.SerializeArray(const Value: TValue; RttiType: TRttiDynamicArrayType): JSValue;
var
  A: Integer;

  NewArray: TArray<JSValue>;

begin
  SetLength(NewArray, Value.GetArrayLength);

  for A := 0 to Pred(Value.GetArrayLength) do
    NewArray[A] := SerializeJSON(Value.GetArrayElement(A), RttiType.ElementType);

  Result := NewArray;
end;

function TRestJsonSerializer.SerializeJSON(const Value: TValue; RttiType: TRttiType): JSValue;
begin
  if RttiType.IsInstance then
    Result := SerializeObject(Value, RttiType.AsInstance)
  else if RttiType is TRttiDynamicArrayType then
    Result := SerializeArray(Value, RttiType as TRttiDynamicArrayType)
  else if (RttiType.Handle = TypeInfo(TDateTime)) or (RttiType.Handle = TypeInfo(TDate)) or (RttiType.Handle = TypeInfo(TTime)) then
    Result := DateTimeToRFC3339(Value.AsExtended)
  else
    Result := Value.AsJSValue;
end;

function TRestJsonSerializer.SerializeObject(const Value: TValue; RttiType: TRttiInstanceType): JSValue;
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

end.

