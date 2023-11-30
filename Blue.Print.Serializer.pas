unit Blue.Print.Serializer;

interface

uses System.Rtti, System.TypInfo, Blue.Print.Types, {$IFDEF PAS2JS}JS{$ELSE}System.JSON.Serializers{$ENDIF};

type
  TBluePrintJsonSerializer = class(TInterfacedObject, ISerializer)
  private
{$IFDEF PAS2JS}
    FContext: TRttiContext;
{$ENDIF}

    function Deserialize(const AJson: String; const TypeInfo: PTypeInfo): TValue; inline;
    function Serialize(const AValue: TValue): String; inline;
{$IFDEF PAS2JS}
  protected
    function CreateObject(const JSON: JSValue; RttiType: TRttiType): TObject; virtual;
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

    procedure DeserializeProperties(Instance: TJSObject; RttiType: TRttiType; const JSON: JSValue); virtual;

    property Context: TRttiContext read FContext;
  public
    constructor Create;
{$ENDIF}
  end;

{$IFDEF DCC}
  TJsonSerializerHelper = class helper for TJsonSerializer
    function Deserialize(const AJson: String; const TypeInfo: PTypeInfo): TValue; overload;
    function Serialize(const AValue: TValue): String; inline;
  end;
{$ENDIF}

  TBluePrintXMLSerializer = class(TInterfacedObject, ISerializer)
  private
    function Deserialize(const AJson: String; const TypeInfo: PTypeInfo): TValue; inline;
    function Serialize(const AValue: TValue): String; inline;
  end;

implementation

uses System.Classes, System.SysUtils, System.JSON.Readers, System.JSON.Writers;

{ TBluePrintJsonSerializer }

{$IFDEF PAS2JS}
constructor TBluePrintJsonSerializer.Create;
begin
  inherited;

  FContext := TRTTIContext.Create;
end;

function TBluePrintJsonSerializer.CreateObject(const JSON: JSValue; RttiType: TRttiType): TObject;
begin
  Result := RttiType.AsInstance.MetaClassType.Create;
end;

function TBluePrintJsonSerializer.CreateRecord(RttiType: TRttiType): TJSObject;
var
  RecordType: TRttiRecordType absolute RttiType;

begin
  Result := TJSObject(RecordType.RecordTypeInfo.Module[RecordType.Name]);

  asm
    Result = Object.create(Result);
  end;
end;
{$ENDIF}

function TBluePrintJsonSerializer.Deserialize(const AJson: String; const TypeInfo: PTypeInfo): TValue;
{$IFDEF PAS2JS}
var
  RttiType: TRttiType;

{$ENDIF}
begin
{$IFDEF PAS2JS}
  RttiType := FContext.GetType(TypeInfo);

  Result := DeserializeJSON(TJSJSON.Parse(AJson), RttiType);
{$ELSE}
  var Serializer := TJsonSerializer.Create;

  Result := Serializer.Deserialize(AJson, TypeInfo);

  Serializer.Free;
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
  else if (RttiType.Handle = TypeInfo(TDateTime)) or (RttiType.Handle = TypeInfo(TDate)) or (RttiType.Handle = TypeInfo(TTime)) then
    Result := TValue.From(RFC3339ToDateTime(String(JSON)))
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

procedure TBluePrintJsonSerializer.DeserializeProperties(Instance: TJSObject; RttiType: TRttiType; const JSON: JSValue);
var
  JSONObject: TJSObject absolute JSON;

  Key: String;

  Prop: TRttiProperty;

  Field: TRttiField;

  Member: TRttiMember;

  MemberType: TRttiType;

  Value: TValue;

begin
  for Key in TJSObject.Keys(JSONObject) do
  begin
    Prop := RttiType.GetProperty(Key);

    if Assigned(Prop) then
    begin
      Member := Prop;
      MemberType := Prop.PropertyType;
      Value := Prop.GetValue(Instance);
    end
    else
    begin
      Field := RttiType.GetField(Key);

      if Assigned(Field) then
      begin
        Member := Field;
        MemberType := Field.FieldType;
        Value := Field.GetValue(Instance);
      end
      else
        Member := nil;
    end;

    if Assigned(Member) then
    begin
      Value := DeserializeObjectProperty(Value, Member, MemberType, JSONObject[Key]);

      if Assigned(Prop) then
        SetJSValueProp(Instance, Prop.PropertyTypeInfo, Value.AsJSValue)
      else if Assigned(Field) then
        Field.SetValue(Instance, Value);
    end
    else if jsIn('f' + Key, Instance) then
      Instance['f' + Key] := JSONObject[Key];
  end;
end;

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

function TBluePrintJsonSerializer.Serialize(const AValue: TValue): String;
{$IFDEF PAS2JS}
var
  RttiType: TRttiType;
{$ENDIF}
begin
{$IFDEF PAS2JS}
  RttiType := FContext.GetType(AValue.TypeInfo);

  Result := TJSJSON.stringify(SerializeJSON(AValue, RttiType));

{$ELSE}
  var Serializer := TJsonSerializer.Create;

  Result := Serializer.Serialize(AValue);

  Serializer.Free;
{$ENDIF}
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
  else if (RttiType.Handle = TypeInfo(TDateTime)) or (RttiType.Handle = TypeInfo(TDate)) or (RttiType.Handle = TypeInfo(TTime)) then
    Result := DateTimeToRFC3339(Value.AsExtended)
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

{$IFDEF DCC}
{ TJsonSerializerHelper }

function TJsonSerializerHelper.Deserialize(const AJson: String; const TypeInfo: PTypeInfo): TValue;
var
  LStringReader: TStringReader;

  LJsonReader: TJsonTextReader;

begin
  ContractResolver := TJsonDefaultContractResolver.Create(TJsonMemberSerialization.Public);
  LStringReader := TStringReader.Create(AJson);
  try
    LJsonReader := TJsonTextReader.Create(LStringReader);
    LJsonReader.DateTimeZoneHandling := DateTimeZoneHandling;
    LJsonReader.DateParseHandling := DateParseHandling;
    LJsonReader.MaxDepth := MaxDepth;
    try
      Result := InternalDeserialize(LJsonReader, TypeInfo);
    finally
      LJsonReader.Free;
    end;
  finally
    LStringReader.Free;
  end;
end;

function TJsonSerializerHelper.Serialize(const AValue: TValue): String;
var
  StringBuilder: TStringBuilder;
  StringWriter: TStringWriter;
  JsonWriter: TJsonTextWriter;

begin
  ContractResolver := TJsonDefaultContractResolver.Create(TJsonMemberSerialization.Public);
  StringBuilder := TStringBuilder.Create($7FFF);
  StringWriter := TStringWriter.Create(StringBuilder);
  try
    JsonWriter := TJsonTextWriter.Create(StringWriter);
    JsonWriter.FloatFormatHandling := FloatFormatHandling;
    JsonWriter.DateFormatHandling := DateFormatHandling;
    JsonWriter.DateTimeZoneHandling := DateTimeZoneHandling;
    JsonWriter.StringEscapeHandling := StringEscapeHandling;
    JsonWriter.Formatting := Formatting;

    try
      InternalSerialize(JsonWriter, AValue);
    finally
      JsonWriter.Free;
    end;

    Result := StringBuilder.ToString(True);
  finally
    StringWriter.Free;
    StringBuilder.Free;
  end;
end;
{$ENDIF}

{ TBluePrintXMLSerializer }

function TBluePrintXMLSerializer.Deserialize(const AJson: String; const TypeInfo: PTypeInfo): TValue;
begin

end;

function TBluePrintXMLSerializer.Serialize(const AValue: TValue): String;
begin

end;

end.

