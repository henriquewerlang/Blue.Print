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
    function SerializeArray(const Value: TValue; RttiType: TRttiDynamicArrayType): JSValue; virtual;
    function SerializeJSON(const Value: TValue; RttiType: TRttiType): JSValue; virtual;
    function SerializeObject(const Value: TValue; RttiType: TRttiInstanceType): JSValue; virtual;
  end;

implementation

uses SysUtils, DateUtils;

{ TRestJsonSerializer }

function TRestJsonSerializer.CreateObject(RttiType: TRttiType): TObject;
var
  Method: TRttiMethod;

begin
  for Method in RttiType.GetMethods do
    if (Method.MethodKind = mkConstructor) and (Length(Method.MethodTypeInfo.ProcSig.Params) = 0) then
      Exit(Method.Invoke(TJSObject(TRttiInstanceType(RttiType).MetaClassType), nil).AsObject);

  Result := TObject(TJSObject.Create(TJSObject(TRttiInstanceType(RttiType).MetaClassType)));

  asm
    Result.$init();
  end;
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

  Result := TValue.From(ClassRefType.MetaclassType);
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

begin
  if JSON = NULL then
    Result := TValue.Empty
  else
  begin
    Result := TValue.FromJSValue(CreateObject(RttiType));

    for Key in TJSObject.Keys(JSONObject) do
    begin
      FieldName := 'F' + Key;
      Prop := RttiType.GetProperty(Key);
      KeyType := nil;

      Field := RttiType.GetField(FieldName);

      if Assigned(Prop) then
        KeyType := Prop.PropertyType
      else if Assigned(Field) then
        KeyType := Field.FieldType;

      if Assigned(KeyType) then
      begin
        Value := DeserializeJSON(JSONObject[Key], KeyType);

        if Assigned(Prop) then
          Prop.SetValue(Result.AsObject, Value)
        else
          Field.SetValue(Result.AsObject, Value);
      end
      else
      begin
        ResultJSObject := TJSObject(Result.AsObject);

        if ResultJSObject.hasOwnProperty(FieldName) then
          ResultJSObject[FieldName] := JSONObject[Key]
        else
          ResultJSObject['f' + Key] := JSONObject[Key];
      end;
    end;
  end;
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

