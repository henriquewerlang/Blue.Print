unit Blue.Print.Serializer.Test;

interface

{$SCOPEDENUMS ON}

uses System.Rtti, System.Classes, System.Generics.Collections, Test.Insight.Framework, Blue.Print.Serializer, Blue.Print.Types;

type
  TMockArray = class;
  TMockConvertedValue = class;
  TMockObject = class;
  TMockValue = class;

  [TestFixture]
  TBluePrintSerializerTest = class
  private
    FMockObject: TMockObject;
    FSerializer: IBluePrintSerializer;

    function CreateSerializer: IBluePrintSerializer;
    function LoadReturn(const Stream: TStream): TMockObject;
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
    [Test]
    procedure OnlyPublishedPropertiesCanBeSerialized;
    [Test]
    procedure MustRespectTheDeclarationOrderOfThePropertiesInTheGeneratedObject;
    [Test]
    procedure WhenThePropertyIsAnObjectMustCreateTheObjectHasExpected;
    [Test]
    procedure WhenThePropertyIsAnObjectMustLoadThePropertiesFromTheAnotherClass;
    [Test]
    procedure WhenThePropertyHasAFlatTypeAndTheFlatPropertiesIsntLoadedCantLoadThePropertyValue;
    [Test]
    procedure MustLoadTheFirstFlatPropertyInThePropertyValueHasExpected;
    [Test]
    procedure WhenTheFlatValueIsAnObjectMustSerializeTheObjectHasExpected;
    [Test]
    procedure WhenThePropertyValueIsntSerializedMustCallTheConvertValueFromTheConverterHasExpected;
  end;

  TConverterMock = class(TInterfacedObject, IBluePrintConverter)
  private
    function AppendProperty(const SerializedObject: TValue; const RttiProperty: TRttiProperty; const FieldName: String): TValue;
    function CreateArray: TValue;
    function CreateObject(const RttiType: TRttiType): TValue;
    function CreateValue(const Value: TValue): TValue;
    function GetMockValue(const Value: TValue): TMockValue;
    function LoadStream(const SerializedObject: TValue): TStream;

    procedure AppendArrayItem(const SerializedArray, SerializedValue: TValue);
    procedure LoadPropertyValue(const SerializedProperty: TValue; const PropertyValue: TValue);
  end;

  TMockValue = class
  private
    function GetAsArray: TMockArray;
    function GetAsConvertedValue: TMockConvertedValue;
    function GetAsObject: TMockObject;
  public
    property AsArray: TMockArray read GetAsArray;
    property AsConvertedValue: TMockConvertedValue read GetAsConvertedValue;
    property AsObject: TMockObject read GetAsObject;
  end;

  TMockConvertedValue = class(TMockValue)
  private
    FValue: String;
  public
    constructor Create(const ConvertedValue: String);

    property Value: String read FValue;
  end;

  TMockProperty = class
  private
    FName: String;
    FValue: TMockValue;
  public
    destructor Destroy; override;

    property Name: String read FName write FName;
    property Value: TMockValue read FValue write FValue;
  end;

  TMockObject = class(TMockValue)
  private
    FProperties: TArray<TMockProperty>;
    FName: String;
  public
    destructor Destroy; override;

    function AddProperty(const Name: String): TMockProperty;

    property Name: String read FName write FName;
    property Properties: TArray<TMockProperty> read FProperties write FProperties;
  end;

  TMockArray = class(TMockValue)
  private
    FItems: TArray<TMockValue>;
  public
    destructor Destroy; override;

    property Items: TArray<TMockValue> read FItems write FItems;
  end;

  TMockStream = class(TStream)
  private
    FMockObject: TMockObject;
  public
    constructor Create(const MockObject: TMockObject);

    property MockObject: TMockObject read FMockObject write FMockObject;
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
    FField: String;
    FField2: String;
  public
    StoredField: Boolean;
    StoredField2: Boolean;
  published
    property Field: String read FField write FField stored StoredField;
    property Field2: String read FField2 write FField2 stored StoredField2;
  end;

  TMyClassWithPublicProperty = class
  private
    FField: String;
    FField2: String;
  public
    property Field: String read FField write FField;
  published
    property Field2: String read FField2 write FField2;
  end;

  TMyClassDerived = class(TMyClassWithPublicProperty)
  private
    FField3: String;
  published
    property Field3: String read FField3 write FField3;
  end;

  TMyClassWithObjectProperty = class
  private
    FField: TMyClass;
  published
    property Field: TMyClass read FField write FField;
  end;

  [Flat]
  TMyFlatClass = class
  private
    FFlatField: String;
    FFlatFieldStored: Boolean;
    FFlatField2: TMyClassWithProperties;
    FFlatField2Stored: Boolean;
    FFlatField3: String;
    FFlatField3Stored: Boolean;
    procedure SetFlatField(const Value: String);
    procedure SetFlatField3(const Value: String);
    procedure SetFlatField2(const Value: TMyClassWithProperties);
  published
    property FlatField: String read FFlatField write SetFlatField stored FFlatFieldStored;
    property FlatField2: TMyClassWithProperties read FFlatField2 write SetFlatField2 stored FFlatField2Stored;
    property FlatField3: String read FFlatField3 write SetFlatField3 stored FFlatField3Stored;
  end;

  TMyClassWithFlatProperty = class
  private
    FField: TMyFlatClass;
  published
    property Field: TMyFlatClass read FField write FField;
  end;

  TMyClassWithSimpleTypes = class
  public type
    TMyEnumerator = (Value, Value2, Value3);
  private
    FField: String;
    FField2: Integer;
    FField3: Double;
    FField4: Int64;
    FField5: TMyEnumerator;
  published
    property Field: String read FField write FField;
    property Field2: Integer read FField2 write FField2;
    property Field3: Double read FField3 write FField3;
    property Field4: Int64 read FField4 write FField4;
    property Field5: TMyEnumerator read FField5 write FField5;
  end;

implementation

uses System.SysUtils;

type
  ENoRttiType = class(Exception)
  end;

  ENoRttiProperty = class(Exception)
  end;

  ENotConvertedValue = class(Exception)
  end;

const
  BLUE_PRINT_TEST_CONTENT = 'BluePrint/Test';

{ TBluePrintSerializerTest }

procedure TBluePrintSerializerTest.AfterCreateTheObjectMustSerializeTheProperty;
begin
  var MyClass := TMyClass.Create;
  var Value := LoadReturn(FSerializer.Serialize(BLUE_PRINT_TEST_CONTENT, MyClass));

  Assert.IsNotNil(Value);

  Assert.AreEqual(1, Length(Value.Properties));

  Assert.AreEqual('Field', Value.Properties[0].Name);

  MyClass.Free;
end;

function TBluePrintSerializerTest.CreateSerializer: IBluePrintSerializer;
begin
  Result := TBluePrintSerializer.Create;
end;

function TBluePrintSerializerTest.LoadReturn(const Stream: TStream): TMockObject;
begin
  FMockObject := TMockStream(Stream).MockObject;
  Result := FMockObject;

  Stream.Free;
end;

procedure TBluePrintSerializerTest.MustLoadTheArrayItemsHasExpected;
begin
  var MyClass := TMyClassWithArray.Create;
  MyClass.MyArray := ['a', 'b', 'c'];
  var Value := LoadReturn(FSerializer.Serialize(BLUE_PRINT_TEST_CONTENT, MyClass));

  var MockArray := Value.Properties[0].Value.AsArray;

  Assert.AreEqual(3, Length(MockArray.Items));

  Assert.AreEqual('a', MockArray.Items[0].AsConvertedValue.Value);
  Assert.AreEqual('b', MockArray.Items[1].AsConvertedValue.Value);
  Assert.AreEqual('c', MockArray.Items[2].AsConvertedValue.Value);

  MyClass.Free;
end;

procedure TBluePrintSerializerTest.MustLoadTheFirstFlatPropertyInThePropertyValueHasExpected;
begin
  var MyClass := TMyClassWithFlatProperty.Create;
  MyClass.Field := TMyFlatClass.Create;
  MyClass.Field.FlatField := 'aaa';
  MyClass.Field.FlatField3 := 'zzz';
  var Value := LoadReturn(FSerializer.Serialize(BLUE_PRINT_TEST_CONTENT, MyClass));

  Assert.AreEqual('aaa', Value.Properties[0].Value.AsConvertedValue.Value);

  MyClass.Field.Free;

  MyClass.Free;
end;

procedure TBluePrintSerializerTest.MustLoadThePropertyValueInTheFieldHasExpected;
begin
  var MyClass := TMyClass.Create;
  MyClass.Field := 'MyValue';
  var Value := LoadReturn(FSerializer.Serialize(BLUE_PRINT_TEST_CONTENT, MyClass));

  Assert.AreEqual('MyValue', Value.Properties[0].Value.AsConvertedValue.Value);

  MyClass.Free;
end;

procedure TBluePrintSerializerTest.MustRespectTheDeclarationOrderOfThePropertiesInTheGeneratedObject;
begin
  var MyClass := TMyClassDerived.Create;
  var Value := LoadReturn(FSerializer.Serialize(BLUE_PRINT_TEST_CONTENT, MyClass));

  Assert.AreEqual('Field2', Value.Properties[0].Name);
  Assert.AreEqual('Field3', Value.Properties[1].Name);

  MyClass.Free;
end;

procedure TBluePrintSerializerTest.MustSerializeAllPropertiesFromTheObject;
begin
  var MyClass := TMyClassWithProperties.Create;
  var Value := LoadReturn(FSerializer.Serialize(BLUE_PRINT_TEST_CONTENT, MyClass));

  Assert.AreEqual(3, Length(Value.Properties));

  Assert.AreEqual('Field', Value.Properties[0].Name);
  Assert.AreEqual('Field2', Value.Properties[1].Name);
  Assert.AreEqual('Field3', Value.Properties[2].Name);

  MyClass.Free;
end;

procedure TBluePrintSerializerTest.MustSerializeOnlyTheStoredProperties;
begin
  var MyClass := TMyClassWithStoredProperty.Create;
  MyClass.Field := 'Value';
  MyClass.Field2 := 'Value2';
  MyClass.StoredField2 := True;
  var Value := LoadReturn(FSerializer.Serialize(BLUE_PRINT_TEST_CONTENT, MyClass));

  Assert.AreEqual('Field2', Value.Properties[0].Name);

  Assert.AreEqual('Value2', Value.Properties[0].Value.AsConvertedValue.Value);

  MyClass.Free;
end;

procedure TBluePrintSerializerTest.OnlyPublishedPropertiesCanBeSerialized;
begin
  var MyClass := TMyClassWithPublicProperty.Create;
  var Value := LoadReturn(FSerializer.Serialize(BLUE_PRINT_TEST_CONTENT, MyClass));

  Assert.AreEqual('Field2', Value.Properties[0].Name);

  MyClass.Free;
end;

procedure TBluePrintSerializerTest.Setup;
begin
  FSerializer := TBluePrintSerializer.Create;
end;

procedure TBluePrintSerializerTest.SetupFixture;
begin
  TBluePrintSerializer.Converters[BLUE_PRINT_TEST_CONTENT] := TConverterMock.Create;
end;

procedure TBluePrintSerializerTest.TearDown;
begin
  FSerializer := nil;

  FMockObject.Free;
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

  Assert.IsNotNil(Value);

  Assert.AreEqual('TMyClass', Value.Name);

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

  Assert.AreEqual('3', Value.Properties[1].Value.AsConvertedValue.Value);

  MyClass.Free;
end;

procedure TBluePrintSerializerTest.WhenTheFlatValueIsAnObjectMustSerializeTheObjectHasExpected;
begin
  var MyClass := TMyClassWithFlatProperty.Create;
  MyClass.Field := TMyFlatClass.Create;
  MyClass.Field.FlatField2 := TMyClassWithProperties.Create;
  MyClass.Field.FlatField2.Field2 := 'abc';
  var Value := LoadReturn(FSerializer.Serialize(BLUE_PRINT_TEST_CONTENT, MyClass));

  var PropertyValue := Value.Properties[0].Value;

  Assert.AreEqual(TMockObject, PropertyValue.ClassType);

  Assert.AreEqual(3, Length(PropertyValue.AsObject.Properties));

  Assert.AreEqual('abc', PropertyValue.AsObject.Properties[1].Value.AsConvertedValue.Value);

  MyClass.Field.FlatField2.Free;

  MyClass.Field.Free;

  MyClass.Free;
end;

procedure TBluePrintSerializerTest.WhenThePropertyHasAFlatTypeAndTheFlatPropertiesIsntLoadedCantLoadThePropertyValue;
begin
  var MyClass := TMyClassWithFlatProperty.Create;
  MyClass.Field := TMyFlatClass.Create;
  var Value := LoadReturn(FSerializer.Serialize(BLUE_PRINT_TEST_CONTENT, MyClass));

  Assert.IsNil(Value.Properties[0].Value);

  MyClass.Field.Free;

  MyClass.Free;
end;

procedure TBluePrintSerializerTest.WhenThePropertyHasAnEnumeratorTypeMustLoadTheEnumeratorValueNameInThePropertyValue;
begin
  var MyClass := TMyClassWithEnumerator.Create;
  MyClass.MyEnumerator := TMyClassWithEnumerator.Enumerator.Value3;
  var Value := LoadReturn(FSerializer.Serialize(BLUE_PRINT_TEST_CONTENT, MyClass));

  Assert.AreEqual('Value3', Value.Properties[0].Value.AsConvertedValue.Value);

  MyClass.Free;
end;

procedure TBluePrintSerializerTest.WhenThePropertyIsAnArrayTypeMustCreateTheArray;
begin
  var MyClass := TMyClassWithArray.Create;
  var Value := LoadReturn(FSerializer.Serialize(BLUE_PRINT_TEST_CONTENT, MyClass));

  Assert.AreEqual(TMockArray, Value.Properties[0].Value.ClassType);

  MyClass.Free;
end;

procedure TBluePrintSerializerTest.WhenThePropertyIsAnObjectMustCreateTheObjectHasExpected;
begin
  var MyClass := TMyClassWithObjectProperty.Create;
  MyClass.Field := TMyClass.Create;
  var Value := LoadReturn(FSerializer.Serialize(BLUE_PRINT_TEST_CONTENT, MyClass));

  Assert.IsNotNil(Value.Properties[0].Value);

  Assert.AreEqual(TMockObject, Value.Properties[0].Value.ClassType);

  Assert.AreEqual('TMyClass', Value.Properties[0].Value.AsObject.Name);

  MyClass.Field.Free;

  MyClass.Free;
end;

procedure TBluePrintSerializerTest.WhenThePropertyIsAnObjectMustLoadThePropertiesFromTheAnotherClass;
begin
  var MyClass := TMyClassWithObjectProperty.Create;
  MyClass.Field := TMyClass.Create;
  MyClass.Field.Field := 'abc';
  var Value := LoadReturn(FSerializer.Serialize(BLUE_PRINT_TEST_CONTENT, MyClass));

  Assert.IsNotNil(Value.Properties[0].Value);

  Assert.AreEqual(1, Length(Value.Properties[0].Value.AsObject.Properties));
  Assert.AreEqual('Field', Value.Properties[0].Value.AsObject.Properties[0].Name);
  Assert.AreEqual('abc', Value.Properties[0].Value.AsObject.Properties[0].Value.AsConvertedValue.Value);

  MyClass.Field.Free;

  MyClass.Free;
end;

procedure TBluePrintSerializerTest.WhenThePropertyValueIsntSerializedMustCallTheConvertValueFromTheConverterHasExpected;
begin
  var MyClass := TMyClassWithSimpleTypes.Create;
  MyClass.Field := 'abc';
  MyClass.Field2 := 123;
  MyClass.Field3 := 123.456;
  MyClass.Field4 := 789;
  MyClass.Field5 := TMyClassWithSimpleTypes.TMyEnumerator.Value2;
  var Value: TMockObject;

  Assert.WillNotRaise(
    procedure
    begin
      Value := LoadReturn(FSerializer.Serialize(BLUE_PRINT_TEST_CONTENT, MyClass));
    end);

  Assert.AreEqual('abc', Value.Properties[0].Value.AsConvertedValue.Value);
  Assert.AreEqual('123', Value.Properties[1].Value.AsConvertedValue.Value);
  Assert.AreEqual(FloatToStr(123.456), Value.Properties[2].Value.AsConvertedValue.Value);
  Assert.AreEqual('789', Value.Properties[3].Value.AsConvertedValue.Value);
  Assert.AreEqual('Value2', Value.Properties[4].Value.AsConvertedValue.Value);

  MyClass.Free;
end;

procedure TBluePrintSerializerTest.WhenThePropetyHasFieldNameAttributeMustLoadTheFieldNameWithTheValueOfTheAttribute;
begin
  var MyClass := TMyClassWithFieldNameAttribute.Create;
  var Value := LoadReturn(FSerializer.Serialize(BLUE_PRINT_TEST_CONTENT, MyClass));

  Assert.AreEqual('AnotherField', Value.Properties[0].Name);

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

procedure TConverterMock.AppendArrayItem(const SerializedArray, SerializedValue: TValue);
begin
  var ArrayList := SerializedArray.AsType<TMockArray>;

  ArrayList.Items := ArrayList.Items + [GetMockValue(SerializedValue)];
end;

function TConverterMock.AppendProperty(const SerializedObject: TValue; const RttiProperty: TRttiProperty; const FieldName: String): TValue;
begin
  if not Assigned(RttiProperty) then
    raise ENoRttiProperty.Create('No property information');

  if SerializedObject.IsType<TMockObject> then
  begin
    var MockObject := SerializedObject.AsType<TMockObject>;
    Result := MockObject.AddProperty(FieldName);
  end
  else
    Result := AppendProperty(SerializedObject.AsType<TValue>, RttiProperty, FieldName);
end;

function TConverterMock.CreateArray: TValue;
begin
  Result := TMockArray.Create;
end;

function TConverterMock.CreateObject(const RttiType: TRttiType): TValue;
begin
  if not Assigned(RttiType) then
    raise ENoRttiType.Create('No RTTI Type loaded!');

  var MockObject := TMockObject.Create;
  MockObject.Name := RttiType.Name;
  Result := MockObject;
end;

function TConverterMock.CreateValue(const Value: TValue): TValue;
begin
  Result := TMockConvertedValue.Create(Value.ToString);
end;

function TConverterMock.GetMockValue(const Value: TValue): TMockValue;
begin
  if Value.IsType<TMockValue> then
    Result := Value.AsType<TMockValue>
  else
    raise ENotConvertedValue.Create('Must call convert value first!');
end;

procedure TConverterMock.LoadPropertyValue(const SerializedProperty: TValue; const PropertyValue: TValue);
begin
  var PropertyMock := SerializedProperty.AsType<TMockProperty>;

  PropertyMock.Value := GetMockValue(PropertyValue);
end;

function TConverterMock.LoadStream(const SerializedObject: TValue): TStream;
begin
  Result := TMockStream.Create(SerializedObject.AsType<TValue>.AsType<TMockObject>);
end;

{ TMockObject }

function TMockObject.AddProperty(const Name: String): TMockProperty;
begin
  Result := TMockProperty.Create;
  Result.Name := Name;

  Properties := Properties + [Result];
end;

destructor TMockObject.Destroy;
begin
  for var MockProperty in Properties do
    MockProperty.Free;

  inherited;
end;

{ TMockStream }

constructor TMockStream.Create(const MockObject: TMockObject);
begin
  inherited Create;

  FMockObject := MockObject;
end;

{ TMockProperty }

destructor TMockProperty.Destroy;
begin
  FValue.Free;

  inherited;
end;

{ TMyFlatClass }

procedure TMyFlatClass.SetFlatField(const Value: String);
begin
  FFlatField := Value;
  FFlatFieldStored := True;
end;

procedure TMyFlatClass.SetFlatField2(const Value: TMyClassWithProperties);
begin
  FFlatField2 := Value;
  FFlatField2Stored := True;
end;

procedure TMyFlatClass.SetFlatField3(const Value: String);
begin
  FFlatField3 := Value;
  FFlatField3Stored := True;
end;

{ TMockConvertedValue }

constructor TMockConvertedValue.Create(const ConvertedValue: String);
begin
  FValue := ConvertedValue;
end;

{ TMockValue }

function TMockValue.GetAsArray: TMockArray;
begin
  Result := Self as TMockArray;
end;

function TMockValue.GetAsConvertedValue: TMockConvertedValue;
begin
  Result := Self as TMockConvertedValue;
end;

function TMockValue.GetAsObject: TMockObject;
begin
  Result := Self as TMockObject;
end;

{ TMockArray }

destructor TMockArray.Destroy;
begin
  for var Item in Items do
    Item.Free;

  inherited;
end;

end.

