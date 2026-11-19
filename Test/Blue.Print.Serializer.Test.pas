unit Blue.Print.Serializer.Test;

interface

{$SCOPEDENUMS ON}

uses System.Rtti, System.Classes, Test.Insight.Framework, Blue.Print.Serializer, Blue.Print.Types;

type
  [TestFixture]
  TBluePrintSerializerTest = class
  private
    FLog: TStringList;
    FSerializer: IBluePrintSerializer;

    function CreateSerializer: IBluePrintSerializer;
    function LoadReturn(const Stream: TStream): TStringList;
  public
    [SetupFixture]
    procedure SetupFixture;
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure WhenTryToSerializeAValueWithAnInvalidContentTypeMustRaiseAnError;
    [Test]
    procedure WhenCreateTheObjectOfTheConverterMustPassTheRttiTypeInTheParameter;
    [Test]
    procedure WhenSerializeAnObjectMustCreateTheObjectFirst;
    [Test]
    procedure AfterCreateTheObjectMustSerializeTheProperty;
    [Test]
    procedure MustSerializeAllPropertiesFromTheObject;
    [Test]
    procedure WhenSerializeMustPassTheRttiPropertyInformationHasExpected;
    [Test]
    procedure MustLoadThePropertyValueInTheFieldHasExpected;
    [Test]
    procedure WhenThePropetyHasFieldNameAttributeMustLoadTheFieldNameWithTheValueOfTheAttribute;
    [Test]
    procedure WhenThePropertyHasAnEnumeratorTypeMustLoadTheEnumeratorValueNameInThePropertyValue;
    [Test]
    procedure WhenTheEnumeratorHasTheEnumValueAttributeMustLoadTheValueInTheAttribute;
    [Test]
    procedure WhenThePropertyIsAnArrayTypeMustCreateTheArray;
    [Test]
    procedure MustLoadTheArrayItemsHasExpected;
    [Test]
    procedure MustSerializeOnlyTheStoredProperties;
  end;

  TConverterMock = class(TInterfacedObject, IBluePrintConverter)
  private
    function AppendProperty(const SerializedObject: TValue; const RttiProperty: TRttiProperty; const FieldName: String): TValue;
    function CreateArray: TValue;
    function CreateObject(const RttiType: TRttiType): TValue;
    function LoadStream(const SerializedObject: TValue): TStream;

    procedure AppendArrayItem(const SerializedArray, ArrayItem: TValue);
    procedure LoadPropertyValue(const SerializedProperty: TValue; const PropertyValue: TValue);
  end;

  TMyClass = class
  private
    FField: String;
  published
    property Field: String read FField write FField;
  end;

  TMyClassWithProperties = class
  private
    FField: String;
    FField2: String;
    FField3: String;
  published
    property Field: String read FField write FField;
    property Field2: String read FField2 write FField2;
    property Field3: String read FField3 write FField3;
  end;

  TMyClassWithFieldNameAttribute = class
  private
    FField: String;
  published
    [FieldName('AnotherField')]
    property Field: String read FField write FField;
  end;

  TMyClassWithEnumerator = class
  public type
    Enumerator = (Value1, Value2, Value3);
    [EnumValue('1, 2, 3')]
    Enumerator2 = (Value1, Value2, Value3);
  private
    FMyEnumerator: Enumerator;
    FMyEnumerator2: Enumerator2;
  published
    property MyEnumerator: Enumerator read FMyEnumerator write FMyEnumerator;
    property MyEnumerator2: Enumerator2 read FMyEnumerator2 write FMyEnumerator2;
  end;

  TMyClassWithArray = class
  private
    FMyArray: TArray<String>;
  published
    property MyArray: TArray<String> read FMyArray write FMyArray;
  end;

  TMyClassWithStoredProperty = class
  private
    FField1: String;
    FField2: String;
  public
    StoredField1: Boolean;
    StoredField2: Boolean;
  published
    property Field1: String read FField1 write FField1 stored StoredField1;
    property Field2: String read FField2 write FField2 stored StoredField2;
  end;

implementation

uses System.SysUtils, System.Generics.Collections;

type
  ENoRttiType = class(Exception)
  end;

  ENoRttiProperty = class(Exception)
  end;

const
  BLUE_PRINT_TEST_CONTENT = 'BluePrint/Test';

{ TBluePrintSerializerTest }

procedure TBluePrintSerializerTest.AfterCreateTheObjectMustSerializeTheProperty;
begin
  var MyClass := TMyClass.Create;
  var Value := LoadReturn(FSerializer.Serialize(BLUE_PRINT_TEST_CONTENT, MyClass));

  Assert.IsFalse(Value.IsEmpty);

  Assert.GreaterThan(1, Value.Count);

  Assert.AreEqual('Property Field', Value.Names[1]);

  MyClass.Free;
end;

function TBluePrintSerializerTest.CreateSerializer: IBluePrintSerializer;
begin
  Result := TBluePrintSerializer.Create;
end;

function TBluePrintSerializerTest.LoadReturn(const Stream: TStream): TStringList;
begin
  Result := FLog;
  Stream.Position := 0;

  Result.LoadFromStream(Stream);

  Stream.Free;
end;

procedure TBluePrintSerializerTest.MustLoadTheArrayItemsHasExpected;
begin
  var MyClass := TMyClassWithArray.Create;
  MyClass.MyArray := ['a', 'b', 'c'];
  var Value := LoadReturn(FSerializer.Serialize(BLUE_PRINT_TEST_CONTENT, MyClass));

  Assert.AreEqual('Array[a,b,c]', Value.ValueFromIndex[1]);

  MyClass.Free;
end;

procedure TBluePrintSerializerTest.MustLoadThePropertyValueInTheFieldHasExpected;
begin
  var MyClass := TMyClass.Create;
  MyClass.Field := 'MyValue';
  var Value := LoadReturn(FSerializer.Serialize(BLUE_PRINT_TEST_CONTENT, MyClass));

  Assert.AreEqual('MyValue', Value.ValueFromIndex[1]);

  MyClass.Free;
end;

procedure TBluePrintSerializerTest.MustSerializeAllPropertiesFromTheObject;
begin
  var MyClass := TMyClassWithProperties.Create;
  var Value := LoadReturn(FSerializer.Serialize(BLUE_PRINT_TEST_CONTENT, MyClass));

  Assert.IsFalse(Value.IsEmpty);

  Assert.GreaterThan(3, Value.Count);

  Assert.AreEqual('Property Field', Value.Names[1]);
  Assert.AreEqual('Property Field2', Value.Names[2]);
  Assert.AreEqual('Property Field3', Value.Names[3]);

  MyClass.Free;
end;

procedure TBluePrintSerializerTest.MustSerializeOnlyTheStoredProperties;
begin
  var MyClass := TMyClassWithStoredProperty.Create;
  MyClass.Field1 := 'Value';
  MyClass.Field2 := 'Value2';
  MyClass.StoredField2 := True;
  var Value := LoadReturn(FSerializer.Serialize(BLUE_PRINT_TEST_CONTENT, MyClass));

  Assert.AreEqual('Property Field2=Value2', Value[1]);

  MyClass.Free;
end;

procedure TBluePrintSerializerTest.Setup;
begin
  FLog := TStringList.Create;
  FSerializer := TBluePrintSerializer.Create;
end;

procedure TBluePrintSerializerTest.SetupFixture;
begin
  TBluePrintSerializer.Converters[BLUE_PRINT_TEST_CONTENT] := TConverterMock.Create;
end;

procedure TBluePrintSerializerTest.TearDown;
begin
  FSerializer := nil;

  FLog.Free;
end;

procedure TBluePrintSerializerTest.WhenCreateTheObjectOfTheConverterMustPassTheRttiTypeInTheParameter;
begin
  var MyClass := TMyClass.Create;

  Assert.WillNotRaise(
    procedure
    begin
      LoadReturn(FSerializer.Serialize(BLUE_PRINT_TEST_CONTENT, MyClass));
    end);

  MyClass.Free;
end;

procedure TBluePrintSerializerTest.WhenSerializeAnObjectMustCreateTheObjectFirst;
begin
  var MyClass := TMyClass.Create;
  var Value := LoadReturn(FSerializer.Serialize(BLUE_PRINT_TEST_CONTENT, MyClass));

  Assert.IsFalse(Value.IsEmpty);

  Assert.AreEqual('CreateObject TMyClass', Value[0]);

  MyClass.Free;
end;

procedure TBluePrintSerializerTest.WhenSerializeMustPassTheRttiPropertyInformationHasExpected;
begin
  var MyClass := TMyClass.Create;

  Assert.WillNotRaise(
    procedure
    begin
      LoadReturn(FSerializer.Serialize(BLUE_PRINT_TEST_CONTENT, MyClass));
    end);

  MyClass.Free;
end;

procedure TBluePrintSerializerTest.WhenTheEnumeratorHasTheEnumValueAttributeMustLoadTheValueInTheAttribute;
begin
  var MyClass := TMyClassWithEnumerator.Create;
  MyClass.MyEnumerator2 := TMyClassWithEnumerator.Enumerator2.Value3;
  var Value := LoadReturn(FSerializer.Serialize(BLUE_PRINT_TEST_CONTENT, MyClass));

  Assert.AreEqual('3', Value.ValueFromIndex[2]);

  MyClass.Free;
end;

procedure TBluePrintSerializerTest.WhenThePropertyHasAnEnumeratorTypeMustLoadTheEnumeratorValueNameInThePropertyValue;
begin
  var MyClass := TMyClassWithEnumerator.Create;
  MyClass.MyEnumerator := TMyClassWithEnumerator.Enumerator.Value3;
  var Value := LoadReturn(FSerializer.Serialize(BLUE_PRINT_TEST_CONTENT, MyClass));

  Assert.AreEqual('Value3', Value.ValueFromIndex[1]);

  MyClass.Free;
end;

procedure TBluePrintSerializerTest.WhenThePropertyIsAnArrayTypeMustCreateTheArray;
begin
  var MyClass := TMyClassWithArray.Create;
  var Value := LoadReturn(FSerializer.Serialize(BLUE_PRINT_TEST_CONTENT, MyClass));

  Assert.AreEqual('Array[]', Value.ValueFromIndex[1]);

  MyClass.Free;
end;

procedure TBluePrintSerializerTest.WhenThePropetyHasFieldNameAttributeMustLoadTheFieldNameWithTheValueOfTheAttribute;
begin
  var MyClass := TMyClassWithFieldNameAttribute.Create;
  var Value := LoadReturn(FSerializer.Serialize(BLUE_PRINT_TEST_CONTENT, MyClass));

  Assert.AreEqual('Property AnotherField', Value.Names[1]);

  MyClass.Free;
end;

procedure TBluePrintSerializerTest.WhenTryToSerializeAValueWithAnInvalidContentTypeMustRaiseAnError;
begin
  var Serializer := CreateSerializer;
  Assert.WillRaise(
    procedure
    begin
      Serializer.Serialize('invalid/content', nil);
    end, EInvalidContentTypeForConverter);
end;

{ TConverterMock }

procedure TConverterMock.AppendArrayItem(const SerializedArray, ArrayItem: TValue);
begin
  var ArrayList := SerializedArray.AsType<TStringList>;

  ArrayList.Add(ArrayItem.AsString);
end;

function TConverterMock.AppendProperty(const SerializedObject: TValue; const RttiProperty: TRttiProperty; const FieldName: String): TValue;
begin
  if not Assigned(RttiProperty) then
    raise ENoRttiProperty.Create('No property information');

  var Log := SerializedObject.AsType<TStringList>;
  Result := TValue.From(TPair<TStringList, Integer>.Create(Log, Pred(Log.AddPair('Property ' + FieldName, EmptyStr).Count)));
end;

function TConverterMock.CreateArray: TValue;
begin
  Result := TStringList.Create;
end;

function TConverterMock.CreateObject(const RttiType: TRttiType): TValue;
begin
  if not Assigned(RttiType) then
    raise ENoRttiType.Create('No RTTI Type loaded!');

  var Log := TStringList.Create;
  Log.Add('CreateObject ' + RttiType.Name);

  Result := Log;
end;

procedure TConverterMock.LoadPropertyValue(const SerializedProperty: TValue; const PropertyValue: TValue);
begin
  var PropertyLog := SerializedProperty.AsType<TPair<TStringList, Integer>>;
  var PropertyStringValue: String;

  if PropertyValue.IsType<TStringList> then
  begin
    var Values := PropertyValue.AsType<TStringList>;

    PropertyStringValue := Format('Array[%s]', [Values.CommaText]);

    Values.Free;
  end
  else if not PropertyValue.AsString.IsEmpty then
    PropertyStringValue := PropertyValue.AsString
  else
    PropertyStringValue := 'Empty';

  PropertyLog.Key.ValueFromIndex[PropertyLog.Value] := PropertyStringValue;
end;

function TConverterMock.LoadStream(const SerializedObject: TValue): TStream;
begin
  Result := TStringStream.Create;

  SerializedObject.AsType<TStringList>.SaveToStream(Result);
end;

end.

