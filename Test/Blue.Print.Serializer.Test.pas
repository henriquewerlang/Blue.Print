unit Blue.Print.Serializer.Test;

interface

{$SCOPEDENUMS ON}

uses System.Rtti, System.Classes, System.Generics.Collections, Test.Insight.Framework, Blue.Print.Serializer, Blue.Print.Types;

type
  TMockObject = class;

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

  TMockProperty = class
  private
    FName: String;
    FValue: TValue;
  public
    destructor Destroy; override;

    property Name: String read FName write FName;
    property Value: TValue read FValue write FValue;
  end;

  TMockObject = class
  private
    FProperties: TArray<TMockProperty>;
    FName: String;
  public
    destructor Destroy; override;

    function AddProperty(const Name: String): TMockProperty;

    property Name: String read FName write FName;
    property Properties: TArray<TMockProperty> read FProperties write FProperties;
  end;

  TMockArray = class
  private
    FItems: TArray<TValue>;
  public
    property Items: TArray<TValue> read FItems write FItems;
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

implementation

uses System.SysUtils;

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

  var MockArray := Value.Properties[0].Value.AsType<TMockArray>;

  Assert.AreEqual(3, Length(MockArray.Items));

  Assert.AreEqual('a', MockArray.Items[0].AsString);
  Assert.AreEqual('b', MockArray.Items[1].AsString);
  Assert.AreEqual('c', MockArray.Items[2].AsString);

  MyClass.Free;
end;

procedure TBluePrintSerializerTest.MustLoadThePropertyValueInTheFieldHasExpected;
begin
  var MyClass := TMyClass.Create;
  MyClass.Field := 'MyValue';
  var Value := LoadReturn(FSerializer.Serialize(BLUE_PRINT_TEST_CONTENT, MyClass));

  Assert.AreEqual('MyValue', Value.Properties[0].Value.AsString);

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

  Assert.AreEqual('Value2', Value.Properties[0].Value.AsString);

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

  Assert.AreEqual('3', Value.Properties[1].Value.AsString);

  MyClass.Free;
end;

procedure TBluePrintSerializerTest.WhenThePropertyHasAnEnumeratorTypeMustLoadTheEnumeratorValueNameInThePropertyValue;
begin
  var MyClass := TMyClassWithEnumerator.Create;
  MyClass.MyEnumerator := TMyClassWithEnumerator.Enumerator.Value3;
  var Value := LoadReturn(FSerializer.Serialize(BLUE_PRINT_TEST_CONTENT, MyClass));

  Assert.AreEqual('Value3', Value.Properties[0].Value.AsString);

  MyClass.Free;
end;

procedure TBluePrintSerializerTest.WhenThePropertyIsAnArrayTypeMustCreateTheArray;
begin
  var MyClass := TMyClassWithArray.Create;
  var Value := LoadReturn(FSerializer.Serialize(BLUE_PRINT_TEST_CONTENT, MyClass));

  Assert.AreEqual(TMockArray, Value.Properties[0].Value.AsObject.ClassType);

  MyClass.Free;
end;

procedure TBluePrintSerializerTest.WhenThePropertyIsAnObjectMustCreateTheObjectHasExpected;
begin
  var MyClass := TMyClassWithObjectProperty.Create;
  MyClass.Field := TMyClass.Create;
  var Value := LoadReturn(FSerializer.Serialize(BLUE_PRINT_TEST_CONTENT, MyClass));

  Assert.IsNotNil(Value.Properties[0].Value.AsType<TValue>.AsObject);

  Assert.AreEqual('TMyClass', Value.Properties[0].Value.AsType<TValue>.AsType<TMockObject>.Name);

  MyClass.Field.Free;

  MyClass.Free;
end;

procedure TBluePrintSerializerTest.WhenThePropertyIsAnObjectMustLoadThePropertiesFromTheAnotherClass;
begin
  var MyClass := TMyClassWithObjectProperty.Create;
  MyClass.Field := TMyClass.Create;
  MyClass.Field.Field := 'abc';
  var Value := LoadReturn(FSerializer.Serialize(BLUE_PRINT_TEST_CONTENT, MyClass));

  Assert.IsNotNil(Value.Properties[0].Value.AsType<TValue>.AsObject);

  Assert.AreEqual(1, Length(Value.Properties[0].Value.AsType<TValue>.AsType<TMockObject>.Properties));
  Assert.AreEqual('Field', Value.Properties[0].Value.AsType<TValue>.AsType<TMockObject>.Properties[0].Name);
  Assert.AreEqual('abc', Value.Properties[0].Value.AsType<TValue>.AsType<TMockObject>.Properties[0].Value.AsString);

  MyClass.Field.Free;

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

procedure TConverterMock.AppendArrayItem(const SerializedArray, ArrayItem: TValue);
begin
  var ArrayList := SerializedArray.AsType<TMockArray>;

  ArrayList.Items := ArrayList.Items + [ArrayItem];
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
  Result := TValue.From(TValue.From(MockObject));
end;

procedure TConverterMock.LoadPropertyValue(const SerializedProperty: TValue; const PropertyValue: TValue);
begin
  var PropertyMock := SerializedProperty.AsType<TMockProperty>;

  PropertyMock.Value := PropertyValue;
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

  procedure DestroyObject(const Value: TValue);
  begin
    if Value.IsObject then
      Value.AsObject.Free
  end;

begin
  if Value.TypeInfo = TypeInfo(TValue) then
    DestroyObject(Value.AsType<TValue>);

  DestroyObject(Value);

  inherited;
end;

end.

