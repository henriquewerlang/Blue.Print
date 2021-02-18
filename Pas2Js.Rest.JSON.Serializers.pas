unit Pas2Js.Rest.JSON.Serializers;

interface

uses Rtti, JS, TypInfo, Delphi.Rest.JSON.Serializer.Intf;

type
  TRestJsonSerializer = class(TInterfacedObject, IRestJsonSerializer)
  private
    function Deserialize(const AJson: String; TypeInfo: PTypeInfo): TValue;
    function Serialize(const AValue: TValue): String;
  protected
    function CreateObject(RttiType: TRttiType): TObject; virtual;
    function DeserializeArray(const JSON: JSValue; RttiType: TRttiType): TValue; virtual;
    function DeserializeClassRef(const JSON: JSValue; RttiType: TRttiType): TValue; virtual;
    function DeserializeJSON(const JSON: JSValue; RttiType: TRttiType): TValue; virtual;
    function DeserializeObject(const JSON: JSValue; RttiType: TRttiType): TValue; virtual;
    function DeserializeObjectProperty(const Value: TValue; RttiType: TRttiType; const JSON: JSValue): TValue; virtual;
    function SerializeArray(const Value: TValue; RttiType: TRttiDynamicArrayType): JSValue; virtual;
    function SerializeJSON(const Value: TValue; RttiType: TRttiType): JSValue; virtual;
    function SerializeObject(const Value: TValue; RttiType: TRttiInstanceType): JSValue; virtual;
  end;

implementation

uses SysUtils, DateUtils;

{ TRestJsonSerializer }

function TRestJsonSerializer.CreateObject(RttiType: TRttiType): TObject;
begin
{$IFDEF PAS2JS}
  asm
    Result = Object.create(RttiType.FTypeInfo.class);
    Result.$init();
  end;
{$ENDIF}
end;

function TRestJsonSerializer.Deserialize(const AJson: String; TypeInfo: PTypeInfo): TValue;
var
  Context: TRTTIContext;

  RttiType: TRttiType;

begin
  Context := TRTTIContext.Create;
  RttiType := Context.GetType(TypeInfo);

  Result := DeserializeJSON(TJSJSON.Parse(AJson), RttiType);

  Context.Free;
end;

function TRestJsonSerializer.DeserializeArray(const JSON: JSValue; RttiType: TRttiType): TValue;
var
  RttiArrayType: TRttiDynamicArrayType absolute RttiType;

  Value: JSValue;

  ValueArray: TJSArray absolute JSON;

  Return: TJSArray;

begin
  Return := TJSArray.new;

  for Value in ValueArray do
    Return.Push(DeserializeJSON(Value, RttiArrayType.ElementType).AsJSValue);

  Result := TValue.FromJSValue(Return);
end;

function TRestJsonSerializer.DeserializeClassRef(const JSON: JSValue; RttiType: TRttiType): TValue;
var
  Context: TRTTIContext;

  ClassRefType: TRttiInstanceType;

begin
  Context := TRTTIContext.Create;
  ClassRefType := Context.FindType(String(JSON)) as TRttiInstanceType;

  if Assigned(ClassRefType) then
    Result := TValue.From(ClassRefType.MetaclassType)
  else
    Result := TValue.Empty;
end;

function TRestJsonSerializer.DeserializeJSON(const JSON: JSValue; RttiType: TRttiType): TValue;
begin
  if RttiType.IsInstance  then
    Result := DeserializeObject(JSON, RttiType)
  else if RttiType is TRttiClassRefType then
    Result := DeserializeClassRef(JSON, RttiType)
  else if RttiType is TRttiDynamicArrayType then
    Result := DeserializeArray(JSON, RttiType)
  else if (RttiType.Handle = TypeInfo(TDateTime)) or (RttiType.Handle = TypeInfo(TDate)) or (RttiType.Handle = TypeInfo(TTime)) then
    Result := TValue.From(RFC3339ToDateTime(String(JSON)))
  else
    Result := TValue.FromJSValue(JSON);
end;

function TRestJsonSerializer.DeserializeObject(const JSON: JSValue; RttiType: TRttiType): TValue;
var
  JSONObject: TJSObject absolute JSON;

  FieldName, Key: String;

  Prop: TRttiProperty;

  Field: TRttiField;

  Value: TValue;

  KeyType: TRttiType;

  ResultJSObject: TJSObject;

  CurrentObject: TObject;

begin
  if JSON = NULL then
    Result := TValue.Empty
  else
  begin
    CurrentObject := CreateObject(RttiType);
    ResultJSObject := TJSObject(CurrentObject);
    Result := TValue.FromJSValue(CurrentObject);

    for Key in TJSObject.Keys(JSONObject) do
    begin
      FieldName := 'F' + Key;
      Prop := RttiType.GetProperty(Key);
      KeyType := nil;

      Field := RttiType.GetField(FieldName);

      if Assigned(Prop) then
      begin
        KeyType := Prop.PropertyType;
        Value := Prop.GetValue(CurrentObject);
      end
      else if Assigned(Field) then
      begin
        KeyType := Field.FieldType;
        Value := Prop.GetValue(CurrentObject);
      end;

      if Assigned(KeyType) then
      begin
        Value := DeserializeObjectProperty(Value, KeyType, JSONObject[Key]);

        if Assigned(Prop) then
          Prop.SetValue(Result.AsObject, Value)
        else
          Field.SetValue(Result.AsObject, Value);
      end
      else if ResultJSObject.hasOwnProperty(FieldName) then
        ResultJSObject[FieldName] := JSONObject[Key]
      else
        ResultJSObject['f' + Key] := JSONObject[Key];
    end;
  end;
end;

function TRestJsonSerializer.DeserializeObjectProperty(const Value: TValue; RttiType: TRttiType; const JSON: JSValue): TValue;
begin
  Result := DeserializeJSON(JSON, RttiType);
end;

function TRestJsonSerializer.Serialize(const AValue: TValue): String;
var
  Context: TRTTIContext;

  RttiType: TRttiType;

begin
  Context := TRTTIContext.Create;
  RttiType := Context.GetType(AValue.TypeInfo);

  Result := TJSJSON.stringify(SerializeJSON(AValue, RttiType));

  Context.Free;
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

