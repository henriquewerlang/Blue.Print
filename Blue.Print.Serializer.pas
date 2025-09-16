unit Blue.Print.Serializer;

interface

uses System.SysUtils, System.Rtti, System.TypInfo, System.Generics.Collections, Blue.Print.Types, {$IFDEF PAS2JS}BrowserApi.Web, JSApi.JS{$ELSE}System.JSON, Xml.XMLIntf{$ENDIF};

type
{$IFDEF PAS2JS}
  IXMLDocument = TJSXMLDocument;
  IXMLNode = TJSNode;
  PTypeInfo = TTypeInfo;
  TJSONArray = TJSArray;
  TJSONObject = TJSObject;
  TJSONValue = JSValue;
{$ELSE}
  TJSONValue = System.JSON.TJSONValue;
{$ENDIF}
  JSONKeyType = {$IFDEF PAS2JS}String{$ELSE}TJSONPair{$ENDIF};

  EInvalidXMLDocument = class(Exception)
  public
    constructor Create;
  end;

  TBluePrintSerializer = class(TInterfacedObject)
  protected
    FContext: TRttiContext;
    FContentType: String;
    FFormatSettings: TFormatSettings;

    function CheckPropertyInstance(const Instance: TValue; const &Property: TRttiProperty): TValue;
    function CreateObject(const RttiType: TRttiInstanceType): TObject; virtual;
    function Deserialize(const Value: String; const TypeInfo: PTypeInfo): TValue;
    function FindPropertyByName(const RttiType: TRttiType; const PropertyName: String): TRttiProperty;
    function GetContentType: String;
    function GetEnumerationNames(const Enumeration: TRttiType): TArray<String>; overload;
    function GetEnumerationNames(const TypeInfo: PTypeInfo): TArray<String>; overload;
    function GetEnumerationValue(const TypeInfo: PTypeInfo; const Value: String): TValue;
    function GetFieldName(const RttiObject: TRttiNamedObject): String;
    function GetPublishedProperties(const RttiType: TRttiType): TArray<TRttiProperty>;
    function Serialize(const Value: TValue): String;

    procedure SetFormatSettings(const Value: TFormatSettings);
  public
    constructor Create;

    destructor Destroy; override;
  end;

  TBluePrintJSONSerializer = class(TBluePrintSerializer, IBluePrintSerializer)
  private
    function CreateInteger(const Value: Integer): TJSONValue;
    function CreateInt64(const Value: Int64): TJSONValue;
    function CreateNumber(const Value: Double): TJSONValue;
    function CreateString(const Value: String): TJSONValue;
    function GetNumber(const JSONValue: TJSONValue): Double;
    function GetString(const JSONValue: TJSONValue): String; inline;
    function IsNumber(const JSONValue: TJSONValue): Boolean;
    function IsString(const JSONValue: TJSONValue): Boolean;
  protected
    function Deserialize(const Value: String; const TypeInfo: PTypeInfo): TValue;
    function DeserializeArray(const RttiType: TRttiType; const JSONArray: TJSONArray): TValue;
    function DeserializeClassReference(const RttiType: TRttiType; const JSONValue: TJSONValue): TValue;
    function DeserializeType(const RttiType: TRttiType; const JSONValue: TJSONValue): TValue; virtual;
    function Serialize(const Value: TValue): String;
    function SerializeArray(const RttiType: TRttiType; const Value: TValue): TJSONArray;
    function SerializeFlatObject(const RttiType: TRttiType; const Instance: TValue): TJSONValue;
    function SerializeType(const RttiType: TRttiType; const Value: TValue): TJSONValue; virtual;

    procedure DeserializeDynamicPropertyValue(const RttiType: TRttiInstanceType; const Instance: TObject; const PropertyName: String; const Value: TJSONValue);
    procedure DeserializeFields(const RttiType: TRttiType; const Instance: TValue; const JSONObject: TJSONObject);
    procedure DeserializeFlatObject(const RttiType: TRttiType; const Instance: TValue; const JSONValue: TJSONValue);
    procedure DeserializeProperties(const RttiType: TRttiType; const Instance: TObject; const JSONObject: TJSONObject);
    procedure SerializeDynamicProperty(const RttiType: TRttiInstanceType; const Instance: TObject; const JSONObject: TJSONObject);
    procedure SerializeFields(const RttiType: TRttiType; const Instance: TValue; const JSONObject: TJSONObject);
    procedure SerializeProperties(const RttiType: TRttiType; const Instance: TObject; const JSONObject: TJSONObject);
  end;

  TBluePrintXMLSerializer = class(TBluePrintSerializer, IBluePrintSerializer)
  private
    function GetFormatValue(const RttiMember: TRttiMember): String;
    function GetNamespaceValue(const RttiObject: TRttiObject; const Namespace: String): String;
    function LoadAttributes(const RttiObject: TRttiObject; const Node: IXMLNode): IXMLNode;
    function LoadAttributeValue(const Member: TRttiDataMember; const Instance: TObject; const Node: IXMLNode): Boolean;
  protected
    function Deserialize(const Value: String; const TypeInfo: PTypeInfo): TValue;
    function DeserializeArray(const RttiType: TRttiType; const Node: IXMLNode): TValue;
    function DeserializeType(const RttiType: TRttiType; const Node: IXMLNode): TValue;
    function Serialize(const Value: TValue): String;

    procedure DeserializeProperties(const RttiType: TRttiType; const Instance: TObject; const Node: IXMLNode);
    procedure SerializeArray(const RttiType: TRttiType; const Value: TValue; const Node: IXMLNode; const Namespace, ValueFormat: String);
    procedure SerializeFields(const RttiType: TRttiType; const Instance: TValue; const Node: IXMLNode; const Namespace: String);
    procedure SerializeProperties(const RttiType: TRttiType; const Instance: TObject; const Node: IXMLNode; const Namespace: String);
    procedure SerializeType(const RttiType: TRttiType; const Value: TValue; const Node: IXMLNode; const Namespace, ValueFormat: String);
  public
    constructor Create;

    class function GetCurrentTimeZone: String;
  end;

implementation

uses System.Classes, System.DateUtils, {$IFDEF DCC}System.SysConst, System.RegularExpressions, Xml.XMLDoc, REST.Types{$ELSE}System.RTLConsts{$ENDIF};

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

function CheckRegularExpression(const Value, Pattern: String): Boolean; inline;
begin
{$IFDEF DCC}
  Result := TRegEx.IsMatch(Value, Pattern);
{$ELSE}
  Result := False;
{$ENDIF}
end;

type
  TValueHelper = record helper for TValue
  public
    procedure SetArrayLength(const Value: NativeInt);
  end;

{ TBluePrintSerializer }

function TBluePrintSerializer.CheckPropertyInstance(const Instance: TValue; const &Property: TRttiProperty): TValue;
begin
  Result := &Property.GetValue(Instance.AsObject);

  if Result.IsEmpty then
  begin
    Result := TValue.From(CreateObject(&Property.PropertyType.AsInstance));

    &Property.SetValue(Instance.AsObject, Result);
  end;
end;

constructor TBluePrintSerializer.Create;
begin
  inherited;

  FContext := TRTTIContext.Create;
end;

function TBluePrintSerializer.CreateObject(const RttiType: TRttiInstanceType): TObject;
var
  ConstructorMethod: TRttiMethod;

begin
  Result := nil;

  for ConstructorMethod in RttiType.GetMethods('Create') do
    if Length(ConstructorMethod.GetParameters) = 0 then
      Exit(ConstructorMethod.Invoke(RttiType.AsInstance.MetaclassType, []).AsObject);
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

function TBluePrintSerializer.FindPropertyByName(const RttiType: TRttiType; const PropertyName: String): TRttiProperty;
var
  PatternProperty: PatternPropertyAttribute;
  &Property: TRttiProperty;

begin
  Result := nil;

  for &Property in RttiType.GetProperties do
  begin
    PatternProperty := &Property.GetAttribute<PatternPropertyAttribute>;

    if Assigned(PatternProperty) then
    begin
      if CheckRegularExpression(PropertyName, PatternProperty.Regex) then
        Exit(&Property);
    end
    else if &Property.PropertyType.IsDynamicProperty then
      Result := &Property
    else if AnsiSameText(GetFieldName(&Property), PropertyName) then
      Exit(&Property);
  end;
end;

function TBluePrintSerializer.GetContentType: String;
begin
  Result := FContentType;
end;

function TBluePrintSerializer.GetEnumerationNames(const TypeInfo: PTypeInfo): TArray<String>;
begin
  Result := GetEnumerationNames(FContext.GetType(TypeInfo));
end;

function TBluePrintSerializer.GetEnumerationNames(const Enumeration: TRttiType): TArray<String>;
var
  Attribute: EnumValueAttribute;

begin
  Attribute := Enumeration.GetAttribute<EnumValueAttribute>;

  if Assigned(Attribute) then
    Result := Attribute.Names
  else
    Result := TRttiEnumerationType(Enumeration).GetNames;
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

function TBluePrintSerializer.GetFieldName(const RttiObject: TRttiNamedObject): String;
var
  FieldName: FieldNameAttribute;

begin
  FieldName := RttiObject.GetAttribute<FieldNameAttribute>;

  if Assigned(FieldName) then
    Result := FieldName.Name
  else
    Result := RttiObject.Name;
end;

function TBluePrintSerializer.GetPublishedProperties(const RttiType: TRttiType): TArray<TRttiProperty>;
var
  &Property: TRttiProperty;

begin
  Result := nil;

  for &Property in RttiType.GetProperties do
    if &Property.Visibility = mvPublished then
      Result := Result + [&Property];
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

{ TBluePrintJSONSerializer }

function TBluePrintJSONSerializer.Serialize(const Value: TValue): String;
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

      FContentType := CONTENTTYPE_APPLICATION_JSON;
      Result := {$IFDEF DCC}JSON.ToJSON{$ELSE}TJSJSON.stringify(JSON){$ENDIF};

{$IFDEF DCC}
      JSON.Free;
{$ENDIF}
    end;
    else Result := inherited;
  end;
end;

function TBluePrintJSONSerializer.SerializeArray(const RttiType: TRttiType; const Value: TValue): TJSONArray;
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

procedure TBluePrintJSONSerializer.SerializeFields(const RttiType: TRttiType; const Instance: TValue; const JSONObject: TJSONObject);
var
  Field: TRttiField;

begin
  for Field in RttiType.GetFields do
    if Field.Visibility in [mvPublic, mvPublished] then
      JSONObject.AddPair(Field.Name, SerializeType(Field.FieldType, Field.GetValue(Instance.GetReferenceToRawData)));
end;

function TBluePrintJSONSerializer.SerializeFlatObject(const RttiType: TRttiType; const Instance: TValue): TJSONValue;
var
  &Property: TRttiProperty;

begin
  Result := nil;

  for &Property in GetPublishedProperties(RttiType) do
    if System.TypInfo.IsStoredProp(Instance.AsObject, TRttiInstanceProperty(&Property).{$IFDEF DCC}PropInfo{$ELSE}PropertyTypeInfo{$ENDIF}) then
      Exit(SerializeType(&Property.PropertyType, &Property.GetValue(Instance.AsObject)));
end;

procedure TBluePrintJSONSerializer.SerializeDynamicProperty(const RttiType: TRttiInstanceType; const Instance: TObject; const JSONObject: TJSONObject);
begin
  raise Exception.Create('Not implemented yet!');
end;

procedure TBluePrintJSONSerializer.SerializeProperties(const RttiType: TRttiType; const Instance: TObject; const JSONObject: TJSONObject);
var
  &Property: TRttiProperty;

begin
  for &Property in GetPublishedProperties(RttiType) do
    if System.TypInfo.IsStoredProp(Instance, TRttiInstanceProperty(&Property).{$IFDEF DCC}PropInfo{$ELSE}PropertyTypeInfo{$ENDIF}) then
      JSONObject.AddPair(GetFieldName(&Property), SerializeType(&Property.PropertyType, &Property.GetValue(Instance)));
end;

function TBluePrintJSONSerializer.SerializeType(const RttiType: TRttiType; const Value: TValue): TJSONValue;

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
    tkString: Result := CreateString(Value.AsString);

{$IFDEF PAS2JS}
    tkBool,
{$ENDIF}
    tkEnumeration:
    begin
      if Value.TypeInfo = TypeInfo(Boolean) then
        Result := {$IFDEF DCC}TJSONBool.Create{$ENDIF}(Value.AsBoolean)
      else
        Result := CreateString(inherited Serialize(Value));
    end;

    tkFloat:
    begin
      if (RttiType.Handle = TypeInfo(TDateTime)) or (RttiType.Handle = TypeInfo(TDate)) or (RttiType.Handle = TypeInfo(TTime)) then
        Result := CreateString(DateToISO8601(Value.AsExtended))
      else
        Result := CreateNumber(Value.AsExtended);
    end;

{$IFDEF DCC}
    tkInt64: Result := CreateInt64(Value.AsInt64);

{$ENDIF}
    tkInteger: Result := CreateInteger(Value.AsInteger);

    tkClassRef: Result := SerializeType(FContext.GetType(TypeInfo(String)), TValue.From(Value.AsClass.QualifiedClassName));

    tkClass:
      if Value.IsEmpty then
        Result := {$IFDEF PAS2JS}NULL{$ELSE}TJSONNull.Create{$ENDIF}
      else if RttiType.HasAttribute<FlatAttribute> then
        Result := SerializeFlatObject(RttiType, Value)
      else
      begin
        Result := CreateJSONObject;

        if RttiType.IsDynamicProperty then
          SerializeDynamicProperty(FContext.GetType(Value.TypeInfo).AsInstance, Value.AsObject, TJSONObject(Result))
        else
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

procedure TBluePrintJSONSerializer.DeserializeProperties(const RttiType: TRttiType; const Instance: TObject; const JSONObject: TJSONObject);
var
  DynamicPropertyInstance: TValue;
  Key: JSONKeyType;
  Prop: TRttiProperty;

  function GetKeyValue: String;
  begin
    Result := Key{$IFDEF DCC}.JsonString.Value{$ENDIF};
  end;

  function GetValue: TJSONValue;
  begin
    Result := {$IFDEF PAS2JS}JSONObject[Key]{$ELSE}Key.JsonValue{$ENDIF};
  end;

  function FindProperty: TRttiProperty;
  begin
    Result := FindPropertyByName(RttiType, GetKeyValue);
  end;

begin
  for Key in {$IFDEF PAS2JS}TJSObject.Keys{$ENDIF}(JSONObject) do
  begin
    Prop := FindProperty;

    if Assigned(Prop) then
      if Prop.PropertyType.IsDynamicProperty then
      begin
        DynamicPropertyInstance := CheckPropertyInstance(TValue.From(Instance), Prop);

        DeserializeDynamicPropertyValue(Prop.PropertyType.AsInstance, DynamicPropertyInstance.AsObject, GetKeyValue, GetValue);
      end
      else
        Prop.SetValue(Instance, DeserializeType(Prop.PropertyType, GetValue));
  end;
end;

function TBluePrintJSONSerializer.DeserializeType(const RttiType: TRttiType; const JSONValue: TJSONValue): TValue;
begin
  case RttiType.TypeKind of
{$IFDEF DCC}
    tkLString,
    tkUString,
    tkWChar,
    tkWString,
{$ENDIF}
    tkChar,
    tkString: Result := TValue.From(GetString(JSONValue));

{$IFDEF PAS2JS}
    tkBool: Result := TValue.From<Boolean>(JSONValue = True);
{$ENDIF}

    tkEnumeration: Result := GetEnumerationValue(RttiType.Handle, {$IFDEF PAS2JS}String(JSONValue){$ELSE}JSONValue.Value{$ENDIF});

    tkFloat:
    begin
      if (RttiType.Handle = TypeInfo(TDateTime)) or (RttiType.Handle = TypeInfo(TDate)) or (RttiType.Handle = TypeInfo(TTime)) then
        Result := TValue.From(ISO8601ToDate(GetString(JSONValue)))
      else if IsNumber(JSONValue) then
        Result := TValue.From(GetNumber(JSONValue));
    end;

{$IFDEF DCC}
    tkInt64: Result := (JSONValue as TJSONNumber).AsInt64;
{$ENDIF}

    tkInteger: Result := TValue.From(Trunc(GetNumber(JSONValue)));

    tkClassRef: Result := DeserializeClassReference(RttiType, JSONValue);

    tkClass:
      if {$IFDEF PAS2JS}JSONValue = NULL{$ELSE}JSONValue.Null{$ENDIF} then
        TValue.Make(nil, RttiType.Handle, Result)
      else
      begin
        Result := TValue.From(CreateObject(RttiType.AsInstance));

        if RttiType.HasAttribute<FlatAttribute> then
          DeserializeFlatObject(RttiType, Result, JSONValue)
        else if JSONValue is TJSONObject then
          DeserializeProperties(RttiType, Result.AsObject, TJSONObject(JSONValue));
      end;

    tkArray, tkDynArray: Result := DeserializeArray(RttiType, TJSONArray(JSONValue));

{$IFDEF DCC}
    tkMRecord,
{$ENDIF}
    tkRecord:
    begin
      if RttiType.Handle = TypeInfo(TValue) then
        if IsNumber(JSONValue) then
          Result := TValue.From(GetNumber(JSONValue))
        else
          Result := TValue.From(GetString(JSONValue))
      else
      begin
        TValue.Make(nil, RttiType.Handle, Result);

        DeserializeFields(RttiType, Result, TJSONObject(JSONValue));
      end;
    end;

    else Result := TValue.Empty;
  end;
end;

function TBluePrintJSONSerializer.GetNumber(const JSONValue: TJSONValue): Double;
begin
{$IFDEF DCC}
  Result := TJSONNumber(JSONValue).AsDouble;
{$ELSE}
  Result := ToNumber(JSONValue);
{$ENDIF}
end;

function TBluePrintJSONSerializer.GetString(const JSONValue: TJSONValue): String;
begin
{$IFDEF DCC}
  Result := TJSONString(JSONValue).Value;
{$ELSE}
  Result := String(JSONValue);
{$ENDIF}
end;

function TBluePrintJSONSerializer.IsNumber(const JSONValue: TJSONValue): Boolean;
begin
{$IFDEF DCC}
  Result := JSONValue is TJSONNumber;
{$ELSE}
  Result := JSApi.JS.IsNumber(JSONValue);
{$ENDIF}
end;

function TBluePrintJSONSerializer.IsString(const JSONValue: TJSONValue): Boolean;
begin
{$IFDEF DCC}
  Result := JSONValue is TJSONString;
{$ELSE}
  Result := JSApi.JS.IsString(JSONValue);
{$ENDIF}
end;

function TBluePrintJSONSerializer.CreateInt64(const Value: Int64): TJSONValue;
begin
{$IFDEF DCC}
  Result := TJSONNumber.Create(Value);
{$ELSE}
  Result := TJSBigInt.New(Value);
{$ENDIF}
end;

function TBluePrintJSONSerializer.CreateInteger(const Value: Integer): TJSONValue;
begin
{$IFDEF DCC}
  Result := TJSONNumber.Create(Value);
{$ELSE}
  Result := TJSNumber.New(Value);
{$ENDIF}
end;

function TBluePrintJSONSerializer.CreateNumber(const Value: Double): TJSONValue;
begin
{$IFDEF DCC}
  Result := TJSONNumber.Create(Value);
{$ELSE}
  Result := TJSNumber.New(Value);
{$ENDIF}
end;

function TBluePrintJSONSerializer.CreateString(const Value: String): TJSONValue;
begin
{$IFDEF DCC}
  Result := TJSONString.Create(Value);
{$ELSE}
  Result := TJSString.New(Value);
{$ENDIF}
end;

function TBluePrintJSONSerializer.Deserialize(const Value: String; const TypeInfo: PTypeInfo): TValue;
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

      try
        Result := DeserializeType(FContext.GetType(TypeInfo), JSON);
      finally
{$IFDEF PAS2JS}
        JSON := nil;
{$ELSE}
        JSON.Free;
{$ENDIF}
      end;
    end;

    else Result := inherited;
  end;
end;

function TBluePrintJSONSerializer.DeserializeArray(const RttiType: TRttiType; const JSONArray: TJSONArray): TValue;
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

function TBluePrintJSONSerializer.DeserializeClassReference(const RttiType: TRttiType; const JSONValue: TJSONValue): TValue;
var
  ClassReferenceType: TRttiInstanceType;

begin
  ClassReferenceType := FContext.FindType(GetString(JSONValue)) as TRttiInstanceType;

  if Assigned(ClassReferenceType) then
    Result := TValue.From(ClassReferenceType.MetaclassType)
  else
    Result := TValue.Empty;
end;

procedure TBluePrintJSONSerializer.DeserializeDynamicPropertyValue(const RttiType: TRttiInstanceType; const Instance: TObject; const PropertyName: String; const Value: TJSONValue);
var
  Parameters: TArray<TRttiParameter>;
  WriteMethod: TRttiMethod;

begin
{$IFDEF DCC}
  WriteMethod := RttiType.GetDeclaredIndexedProperties[0].WriteMethod;

  Parameters := WriteMethod.GetParameters;

  WriteMethod.Invoke(Instance, [PropertyName, DeserializeType(Parameters[1].ParamType, Value)]);
{$ENDIF}
end;

procedure TBluePrintJSONSerializer.DeserializeFields(const RttiType: TRttiType; const Instance: TValue; const JSONObject: TJSONObject);
var
  Field: TRttiField;
  Key: JSONKeyType;

begin
  for Key in {$IFDEF PAS2JS}TJSObject.Keys{$ENDIF}(JSONObject) do
  begin
    Field := RttiType.GetField(Key{$IFDEF DCC}.JsonString.Value{$ENDIF});

    if Assigned(Field) then
      Field.SetValue(Instance.GetReferenceToRawData, DeserializeType(Field.FieldType, {$IFDEF PAS2JS}JSONObject[Key]{$ELSE}Key.JsonValue{$ENDIF}));
  end;
end;

procedure TBluePrintJSONSerializer.DeserializeFlatObject(const RttiType: TRttiType; const Instance: TValue; const JSONValue: TJSONValue);
type
  TJSONTypes = set of TTypeKind;

var
  PropertyPath: TStack<TRttiProperty>;

  function FindPropertyPath(const RttiType: TRttiType; const JSONValue: TJSONValue): Boolean;
  var
    FlatInfo: FlatAttribute;
    FlatProperty: TRttiProperty;

    function IsBooleanValue: Boolean;
    begin
      Result := {$IFDEF DCC}JSONValue is TJSONBool{$ELSE}IsBoolean(JSONValue){$ENDIF};
    end;

    function GetJSONObject: TJSONObject;
    begin
      Result := {$IFDEF DCC}(JSONValue as TJSONObject){$ELSE}TJSONObject(JSONValue){$ENDIF};
    end;

    function CheckEnumerationValue(const JSONValue: String; const Values: TArray<String>): Boolean;
    var
      Value: String;

    begin
      Result := False;

      for Value in Values do
        if AnsiSameText(Value, JSONValue) then
          Exit(True);
    end;

    function GetJSONFieldValue(const FieldName: String): TJSONValue;
    begin
{$IFDEF DCC}
      var JSONPair := GetJSONObject.Get(FieldName);

      if Assigned(JSONPair) then
        Result := JSONPair.JsonValue
{$ELSE}
      if GetJSONObject.hasOwnProperty(FieldName) then
        Result := GetJSONObject[FieldName]
{$ENDIF}
      else
        Result := nil;
    end;

    function CheckProperty: Boolean;

      function GetJSONType: TTypeKinds;
      begin
        if IsNumber(JSONValue) then
          Result := [tkInteger, {$IFDEF DCC}tkInt64, {$ENDIF}tkFloat]
        else if IsString(JSONValue) or IsBooleanValue then
          Result := [{$IFDEF DCC}tkLString, tkUString, tkWChar, tkWString, {$ENDIF}tkChar, tkString, tkEnumeration]
        else if JSONValue is TJSONArray then
          Result := [tkArray, tkDynArray]
        else if JSONValue is TJSONObject then
          Result := [tkClass]
        else
          Result := [];
      end;

      function CheckFieldExists: Boolean;
      var
        JSONFieldName: TJSONValue;

        function HasFields: Boolean;
        begin
{$IFDEF DCC}
          Result := GetJSONObject.Count > 0;
{$ELSE}
          Result := Assigned(TJSObject.Keys(GetJSONObject));
{$ENDIF}
        end;

      begin
        JSONFieldName := nil;

        if HasFields then
{$IFDEF DCC}
          JSONFieldName := GetJSONObject.Pairs[0].JsonString;
{$ELSE}
          JSONFieldName := TJSObject.Keys(GetJSONObject)[0];
{$ENDIF}

        Result := not HasFields or Assigned(FindPropertyByName(RttiType, GetString(JSONFieldName)));
      end;

    var
      TypeKind: TTypeKind;

    begin
      Result := False;
      TypeKind := RttiType.TypeKind;

      if TypeKind in GetJSONType then
        case TypeKind of
          tkEnumeration: Result := CheckEnumerationValue(GetString(JSONValue), GetEnumerationNames(RttiType));
          tkClass: Result := CheckFieldExists;
          else Result := True;
        end;
    end;

    function FindEnumeratorProperty: Boolean;
    var
      EnumeratorProperty: TRttiProperty;
      JSONPropertyValue: TJSONValue;

    begin
      EnumeratorProperty := FindPropertyByName(FlatProperty.PropertyType, FlatInfo.EnumeratorPropertyName);
      JSONPropertyValue := GetJSONFieldValue(FlatInfo.EnumeratorPropertyName);
      Result := False;

      if Assigned(EnumeratorProperty) and Assigned(JSONPropertyValue) then
        case EnumeratorProperty.PropertyType.TypeKind of
          tkEnumeration: Result := CheckEnumerationValue(GetString(JSONPropertyValue), GetEnumerationNames(EnumeratorProperty.PropertyType));
          tkClass:
          begin
            Result := EnumeratorProperty.PropertyType.HasAttribute<FlatAttribute> and FindPropertyPath(EnumeratorProperty.PropertyType, JSONPropertyValue);

            if Result then
              PropertyPath.Push(EnumeratorProperty);
          end;
        end
      else
        Result := FindPropertyPath(FlatProperty.PropertyType, JSONValue);

      if Result then
        PropertyPath.Push(FlatProperty);
    end;

  begin
    FlatInfo := RttiType.GetAttribute<FlatAttribute>;
    Result := False;

    if Assigned(FlatInfo) then
    begin
      for FlatProperty in GetPublishedProperties(RttiType) do
        if not FlatInfo.EnumeratorPropertyName.IsEmpty then
        begin
          if FindEnumeratorProperty then
            Exit(True)
        end
        else if FindPropertyPath(FlatProperty.PropertyType, JSONValue) then
        begin
          PropertyPath.Push(FlatProperty);

          Exit(True)
        end;

//      if not FlatInfo.EnumeratorPropertyName.IsEmpty then
//      begin
//        PropertyPath.Push(GetPublishedProperties(RttiType)[0]);
//
//        Exit(True)
//      end;
    end
    else
      Result := CheckProperty;
  end;

var
  CurrentInstance: TValue;
  &Property: TRttiProperty;

begin
  PropertyPath := TStack<TRttiProperty>.Create;

  if FindPropertyPath(RttiType, JSONValue) then
  begin
    CurrentInstance := Instance;

    while PropertyPath.Count > 1 do
    begin
      &Property := PropertyPath.Pop;

      CurrentInstance := CheckPropertyInstance(CurrentInstance, &Property);
    end;

    &Property := PropertyPath.Pop;

    &Property.SetValue(CurrentInstance.AsObject, DeserializeType(&Property.PropertyType, JSONValue));
  end;

  PropertyPath.Free;
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
      var Prop := FindPropertyByName(RttiType, Node.NodeName);

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
      Node.Attributes[Member.Name] := Serialize(Member.GetValue(Instance));
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
    DocumentName: DocumentNameAttribute;

  begin
    DocumentName := ValueType.GetAttribute<DocumentNameAttribute>;

    if Assigned(DocumentName) then
      Result := DocumentName.Name
    else
      Result := ValueType.Name;
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
    SerializeType(Field.FieldType, Field.GetValue(Instance.GetReferenceToRawData), Node.AddChild(GetFieldName(Field)), Namespace, '');
{$ENDIF}
end;

procedure TBluePrintXMLSerializer.SerializeProperties(const RttiType: TRttiType; const Instance: TObject; const Node: IXMLNode; const Namespace: String);
begin
{$IFDEF DCC}
  for var &Property in GetPublishedProperties(RttiType) do
    if System.TypInfo.IsStoredProp(Instance, TRttiInstanceProperty(&Property).PropInfo) and not LoadAttributeValue(&Property, Instance, Node) then
    begin
      var PropertyValue := &Property.GetValue(Instance);

      if not PropertyValue.IsEmpty then
      begin
        var CurrentNamespace := GetNamespaceValue(&Property.PropertyType, Namespace);
        var NodeValue := Node;

        if not &Property.HasAttribute<XMLValueAttribute> then
          NodeValue := Node.AddChild(GetFieldName(&Property), CurrentNamespace);

        SerializeType(&Property.PropertyType, PropertyValue, LoadAttributes(&Property, NodeValue), CurrentNamespace, GetFormatValue(&Property));
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

        var ParentNode: IXMLNode := nil;

        for var Part in SOAPBody.Parts do
        begin
          var Parameter := Part.Key;

          if not Assigned(ParentNode) then
            ParentNode := Node.AddChild(TRttiMethod(Parameter.Parent).Name, GetNamespaceValue(Parameter.Parent, Namespace));

          SerializeType(FContext.GetType(Parameter.ParamType.Handle), Part.Value, LoadAttributes(Parameter, ParentNode.AddChild(Parameter.Name, GetNamespaceValue(Parameter, Namespace))), Namespace, ValueFormat);
        end;
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

