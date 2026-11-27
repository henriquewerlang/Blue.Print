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
    function Deserialize<T>: T;
    function Serialize(const Value: TValue): TMockObject;
  public
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
    [Test]
    procedure WhenStartToSerializeAnObjectMustCallTheCreateMainObjectInTheInterfaceHasExpected;
    [Test]
    procedure WhenCallTheCreateMainObjectMustLoadTheRttiInfoHasExpected;
    [Test]
    procedure TheMainObjectMustBeSavedInTheStreamHasExpected;
    [Test]
    procedure IfTheMainObjectIsAnObjectTypeMustDestroyTheInstanceAfterSerialize;
    [Test]
    procedure WhenTheMainObjectIsntAnObjectCantTryToDetroyTheObject;
    [Test]
    procedure IfTheConverterDontExistsMustRaiseErrorWhenDeserializeAnValue;
    [Test]
    procedure WhenDeserializeAnClassMustCreateTheObjectHasExpected;
    [Test]
    procedure MustLoadThePropertyWithTheValueHasExpected;
    [Test]
    procedure MustConvertThePropertyValueBeforeLoadTheValueInTheClassProperty;
    [Test]
    procedure MustLoadAllPropertiesFromTheClassWithTheValuesHasExpected;
    [Test]
    procedure MustDestroyTheSerializedObjectIfItIsAnObject;
    [Test]
    procedure IfTheMainObjectIsntAnObjectCantDestroyTheValue;
  end;

  TConverterMock = class(TInterfacedObject, IBluePrintConverter)
  protected
    function AppendProperty(const SerializedObject: TValue; const RttiProperty: TRttiProperty; const FieldName: String): TValue;
    function ConvertValue(const SerializedValue: TValue): TValue;
    function CreateArray: TValue;
    function CreateMainObject(const RttiType: TRttiType): TValue;
    function CreateObject(const RttiType: TRttiType): TValue;
    function CreateValue(const Value: TValue): TValue;
    function GetFields(const SerializedObject: TValue): TArray<TFieldInfo>;
    function GetMockObject(const SerializedObject: TValue): TMockObject;
    function GetMockValue(const Value: TValue): TMockValue;
    function LoadFromStream(const Stream: TStream): TValue;
    function SaveToStream(const SerializedObject: TValue): TStream;

    procedure AppendArrayItem(const SerializedArray, SerializedValue: TValue);
    procedure LoadPropertyValue(const SerializedProperty: TValue; const PropertyValue: TValue);
  end;

  TConverterMockMainObject = class(TConverterMock, IBluePrintConverter)
  private
    FLoadTValue: Boolean;
    FMainObjectCalled: Boolean;
    FMainObjectSaved: Boolean;
  protected
    function CreateMainObject(const RttiType: TRttiType): TValue;
    function LoadFromStream(const Stream: TStream): TValue;
    function SaveToStream(const SerializedObject: TValue): TStream;
  public
    constructor Create(const LoadTValue: Boolean = False);

    property MainObjectCalled: Boolean read FMainObjectCalled write FMainObjectCalled;
    property MainObjectSaved: Boolean read FMainObjectSaved write FMainObjectSaved;
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

  TMockMainObject = class(TMockObject)
  public
    destructor Destroy; override;
  public class var
    ObjectDestroyed: Boolean;
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

const
  BLUE_PRINT_TEST_CONTENT = 'BluePrint/Test';

implementation

uses System.SysUtils;

type
  ENoRttiType = class(Exception)
  end;

  ENoRttiProperty = class(Exception)
  end;

  ENotConvertedValue = class(Exception)
  end;

{ TBluePrintSerializerTest }

procedure TBluePrintSerializerTest.AfterCreateTheObjectMustSerializeTheProperty;
begin
  var MyClass := TMyClass.Create;
  var Value := Serialize(MyClass);

  Assert.IsNotNil(Value);

  Assert.AreEqual(1, Length(Value.Properties));

  Assert.AreEqual('Field', Value.Properties[0].Name);

  MyClass.Free;
end;

function TBluePrintSerializerTest.CreateSerializer: IBluePrintSerializer;
begin
  Result := TBluePrintSerializer.Create;
end;

function TBluePrintSerializerTest.Deserialize<T>: T;
begin
  var Stream := TMockStream.Create(FMockObject);

  Result := FSerializer.Deserialize(BLUE_PRINT_TEST_CONTENT, TypeInfo(T), Stream).AsType<T>;

  Stream.Free;
end;

procedure TBluePrintSerializerTest.IfTheConverterDontExistsMustRaiseErrorWhenDeserializeAnValue;
begin
  Assert.WillRaise(
    procedure
    begin
      FSerializer.Deserialize('invalid/content', nil, nil);
    end, EInvalidContentTypeForConverter);
end;

procedure TBluePrintSerializerTest.IfTheMainObjectIsAnObjectTypeMustDestroyTheInstanceAfterSerialize;
begin
  var Converter := TConverterMockMainObject.Create;
  TBluePrintSerializer.Converters[BLUE_PRINT_TEST_CONTENT] := Converter;
  TMockMainObject.ObjectDestroyed := False;

  var MyClass := TMyClass.Create;

  FSerializer.Serialize(BLUE_PRINT_TEST_CONTENT, MyClass).Free;

  Assert.IsTrue(TMockMainObject.ObjectDestroyed);

  MyClass.Free;
end;

procedure TBluePrintSerializerTest.IfTheMainObjectIsntAnObjectCantDestroyTheValue;
begin
  var Converter := TConverterMockMainObject.Create(True);
  TBluePrintSerializer.Converters[BLUE_PRINT_TEST_CONTENT] := Converter;
  var MainObject := TMockMainObject.Create;
  TMockMainObject.ObjectDestroyed := False;
  var Stream := TMockStream.Create(MainObject);

  FSerializer.Deserialize(BLUE_PRINT_TEST_CONTENT, TypeInfo(TMyClass), Stream).AsObject.Free;

  Assert.IsFalse(TMockMainObject.ObjectDestroyed);

  MainObject.Free;

  Stream.Free;
end;

procedure TBluePrintSerializerTest.MustConvertThePropertyValueBeforeLoadTheValueInTheClassProperty;
begin
  FMockObject := TMockObject.Create;
  FMockObject.AddProperty('Field').Value := TMockConvertedValue.Create('xxx');

  var Value := Deserialize<TMyClass>;

  Assert.AreEqual('xxx', Value.Field);

  Value.Free;
end;

procedure TBluePrintSerializerTest.MustDestroyTheSerializedObjectIfItIsAnObject;
begin
  var Converter := TConverterMockMainObject.Create;
  TBluePrintSerializer.Converters[BLUE_PRINT_TEST_CONTENT] := Converter;
  TMockMainObject.ObjectDestroyed := False;
  var Stream := TMockStream.Create(TMockMainObject.Create);

  FSerializer.Deserialize(BLUE_PRINT_TEST_CONTENT, TypeInfo(TMyClass), Stream).AsObject.Free;

  Assert.IsTrue(TMockMainObject.ObjectDestroyed);

  Stream.Free;
end;

procedure TBluePrintSerializerTest.MustLoadAllPropertiesFromTheClassWithTheValuesHasExpected;
begin
  FMockObject := TMockObject.Create;
  FMockObject.AddProperty('Field').Value := TMockConvertedValue.Create('aaa');
  FMockObject.AddProperty('Field2').Value := TMockConvertedValue.Create('bbb');
  FMockObject.AddProperty('Field3').Value := TMockConvertedValue.Create('ccc');

  var Value := Deserialize<TMyClassWithProperties>;

  Assert.AreEqual('aaa', Value.Field);
  Assert.AreEqual('bbb', Value.Field2);
  Assert.AreEqual('ccc', Value.Field3);

  Value.Free;
end;

procedure TBluePrintSerializerTest.MustLoadTheArrayItemsHasExpected;
begin
  var MyClass := TMyClassWithArray.Create;
  MyClass.MyArray := ['a', 'b', 'c'];
  var Value := Serialize(MyClass);

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
  var Value := Serialize(MyClass);

  Assert.AreEqual('aaa', Value.Properties[0].Value.AsConvertedValue.Value);

  MyClass.Field.Free;

  MyClass.Free;
end;

procedure TBluePrintSerializerTest.MustLoadThePropertyValueInTheFieldHasExpected;
begin
  var MyClass := TMyClass.Create;
  MyClass.Field := 'MyValue';
  var Value := Serialize(MyClass);

  Assert.AreEqual('MyValue', Value.Properties[0].Value.AsConvertedValue.Value);

  MyClass.Free;
end;

procedure TBluePrintSerializerTest.MustLoadThePropertyWithTheValueHasExpected;
begin
  FMockObject := TMockObject.Create;
  FMockObject.AddProperty('Field').Value := TMockConvertedValue.Create('abc');

  var Value := Deserialize<TMyClass>;

  Assert.AreEqual('abc', Value.Field);

  Value.Free;
end;

procedure TBluePrintSerializerTest.MustRespectTheDeclarationOrderOfThePropertiesInTheGeneratedObject;
begin
  var MyClass := TMyClassDerived.Create;
  var Value := Serialize(MyClass);

  Assert.AreEqual('Field2', Value.Properties[0].Name);
  Assert.AreEqual('Field3', Value.Properties[1].Name);

  MyClass.Free;
end;

procedure TBluePrintSerializerTest.MustSerializeAllPropertiesFromTheObject;
begin
  var MyClass := TMyClassWithProperties.Create;
  var Value := Serialize(MyClass);

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
  var Value := Serialize(MyClass);

  Assert.AreEqual('Field2', Value.Properties[0].Name);

  Assert.AreEqual('Value2', Value.Properties[0].Value.AsConvertedValue.Value);

  MyClass.Free;
end;

procedure TBluePrintSerializerTest.OnlyPublishedPropertiesCanBeSerialized;
begin
  var MyClass := TMyClassWithPublicProperty.Create;
  var Value := Serialize(MyClass);

  Assert.AreEqual('Field2', Value.Properties[0].Name);

  MyClass.Free;
end;

function TBluePrintSerializerTest.Serialize(const Value: TValue): TMockObject;
begin
  var Stream := FSerializer.Serialize(BLUE_PRINT_TEST_CONTENT, Value);

  FMockObject := TMockStream(Stream).MockObject;
  Result := FMockObject;

  Stream.Free;
end;

procedure TBluePrintSerializerTest.Setup;
begin
  FMockObject := nil;
  FSerializer := TBluePrintSerializer.Create;
  TBluePrintSerializer.Converters[BLUE_PRINT_TEST_CONTENT] := TConverterMock.Create;
end;

procedure TBluePrintSerializerTest.TearDown;
begin
  FSerializer := nil;

  FMockObject.Free;
end;

procedure TBluePrintSerializerTest.TheMainObjectMustBeSavedInTheStreamHasExpected;
begin
  var Converter := TConverterMockMainObject.Create;
  TBluePrintSerializer.Converters[BLUE_PRINT_TEST_CONTENT] := Converter;

  var MyClass := TMyClass.Create;

  FSerializer.Serialize(BLUE_PRINT_TEST_CONTENT, MyClass).Free;

  Assert.IsTrue(Converter.MainObjectSaved);

  MyClass.Free;
end;

procedure TBluePrintSerializerTest.WhenCallTheCreateMainObjectMustLoadTheRttiInfoHasExpected;
begin
  var Converter := TConverterMockMainObject.Create;
  TBluePrintSerializer.Converters[BLUE_PRINT_TEST_CONTENT] := Converter;

  var MyClass := TMyClass.Create;

  Assert.WillNotRaise(
    procedure
    begin
      FSerializer.Serialize(BLUE_PRINT_TEST_CONTENT, MyClass).Free;
    end);

  MyClass.Free;
end;

procedure TBluePrintSerializerTest.WhenCreateTheObjectOfTheConverterMustPassTheRttiTypeInTheParameter;
begin
  var MyClass := TMyClass.Create;

  Assert.WillNotRaise(
    procedure
    begin
      Serialize(MyClass);
    end);

  MyClass.Free;
end;

procedure TBluePrintSerializerTest.WhenDeserializeAnClassMustCreateTheObjectHasExpected;
begin
  FMockObject := TMockObject.Create;

  var Value := Deserialize<TMyClass>;

  Assert.IsNotNil(Value);

  Value.Free;
end;

procedure TBluePrintSerializerTest.WhenSerializeAnObjectMustCreateTheObjectFirst;
begin
  var MyClass := TMyClass.Create;
  var Value := Serialize(MyClass);

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
      Serialize(MyClass);
    end);

  MyClass.Free;
end;

procedure TBluePrintSerializerTest.WhenStartToSerializeAnObjectMustCallTheCreateMainObjectInTheInterfaceHasExpected;
begin
  var Converter := TConverterMockMainObject.Create;
  TBluePrintSerializer.Converters[BLUE_PRINT_TEST_CONTENT] := Converter;

  var MyClass := TMyClass.Create;

  FSerializer.Serialize(BLUE_PRINT_TEST_CONTENT, MyClass).Free;

  Assert.IsTrue(Converter.MainObjectCalled);

  MyClass.Free;
end;

procedure TBluePrintSerializerTest.WhenTheEnumeratorHasTheEnumValueAttributeMustLoadTheValueInTheAttribute;
begin
  var MyClass := TMyClassWithEnumerator.Create;
  MyClass.MyEnumerator2 := TMyClassWithEnumerator.Enumerator2.Value3;
  var Value := Serialize(MyClass);

  Assert.AreEqual('3', Value.Properties[1].Value.AsConvertedValue.Value);

  MyClass.Free;
end;

procedure TBluePrintSerializerTest.WhenTheFlatValueIsAnObjectMustSerializeTheObjectHasExpected;
begin
  var MyClass := TMyClassWithFlatProperty.Create;
  MyClass.Field := TMyFlatClass.Create;
  MyClass.Field.FlatField2 := TMyClassWithProperties.Create;
  MyClass.Field.FlatField2.Field2 := 'abc';
  var Value := Serialize(MyClass);

  var PropertyValue := Value.Properties[0].Value;

  Assert.AreEqual(TMockObject, PropertyValue.ClassType);

  Assert.AreEqual(3, Length(PropertyValue.AsObject.Properties));

  Assert.AreEqual('abc', PropertyValue.AsObject.Properties[1].Value.AsConvertedValue.Value);

  MyClass.Field.FlatField2.Free;

  MyClass.Field.Free;

  MyClass.Free;
end;

procedure TBluePrintSerializerTest.WhenTheMainObjectIsntAnObjectCantTryToDetroyTheObject;
begin
  var Converter := TConverterMockMainObject.Create(True);
  TBluePrintSerializer.Converters[BLUE_PRINT_TEST_CONTENT] := Converter;
  TMockMainObject.ObjectDestroyed := False;

  var MyClass := TMyClass.Create;

  Serialize(MyClass);

  Assert.IsFalse(TMockMainObject.ObjectDestroyed);

  MyClass.Free;
end;

procedure TBluePrintSerializerTest.WhenThePropertyHasAFlatTypeAndTheFlatPropertiesIsntLoadedCantLoadThePropertyValue;
begin
  var MyClass := TMyClassWithFlatProperty.Create;
  MyClass.Field := TMyFlatClass.Create;
  var Value := Serialize(MyClass);

  Assert.IsNil(Value.Properties[0].Value);

  MyClass.Field.Free;

  MyClass.Free;
end;

procedure TBluePrintSerializerTest.WhenThePropertyHasAnEnumeratorTypeMustLoadTheEnumeratorValueNameInThePropertyValue;
begin
  var MyClass := TMyClassWithEnumerator.Create;
  MyClass.MyEnumerator := TMyClassWithEnumerator.Enumerator.Value3;
  var Value := Serialize(MyClass);

  Assert.AreEqual('Value3', Value.Properties[0].Value.AsConvertedValue.Value);

  MyClass.Free;
end;

procedure TBluePrintSerializerTest.WhenThePropertyIsAnArrayTypeMustCreateTheArray;
begin
  var MyClass := TMyClassWithArray.Create;
  var Value := Serialize(MyClass);

  Assert.AreEqual(TMockArray, Value.Properties[0].Value.ClassType);

  MyClass.Free;
end;

procedure TBluePrintSerializerTest.WhenThePropertyIsAnObjectMustCreateTheObjectHasExpected;
begin
  var MyClass := TMyClassWithObjectProperty.Create;
  MyClass.Field := TMyClass.Create;
  var Value := Serialize(MyClass);

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
  var Value := Serialize(MyClass);

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
      Value := Serialize(MyClass);
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
  var Value := Serialize(MyClass);

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

  Result := GetMockObject(SerializedObject).AddProperty(FieldName);
end;

function TConverterMock.ConvertValue(const SerializedValue: TValue): TValue;
begin
  Result := GetMockValue(SerializedValue).AsConvertedValue.Value;
end;

function TConverterMock.CreateArray: TValue;
begin
  Result := TMockArray.Create;
end;

function TConverterMock.CreateMainObject(const RttiType: TRttiType): TValue;
begin
  Result := CreateObject(RttiType);

  Result := TValue.From(Result);
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

function TConverterMock.GetFields(const SerializedObject: TValue): TArray<TFieldInfo>;
begin
  Result := nil;

  for var MockProperty in GetMockObject(SerializedObject).Properties do
    Result := Result + [TFieldInfo.Create(MockProperty.Name, MockProperty.Value)];
end;

function TConverterMock.GetMockObject(const SerializedObject: TValue): TMockObject;
begin
  if not SerializedObject.IsType<TMockObject> then
    Result := GetMockObject(SerializedObject.AsType<TValue>)
  else
    Result := SerializedObject.AsType<TMockObject>;
end;

function TConverterMock.GetMockValue(const Value: TValue): TMockValue;
begin
  if Value.IsType<TMockValue> then
    Result := Value.AsType<TMockValue>
  else
    raise ENotConvertedValue.Create('Must call convert value first!');
end;

function TConverterMock.LoadFromStream(const Stream: TStream): TValue;
begin
  Result := TMockStream(Stream).MockObject;

  Result := TValue.From(Result);
end;

procedure TConverterMock.LoadPropertyValue(const SerializedProperty: TValue; const PropertyValue: TValue);
begin
  var PropertyMock := SerializedProperty.AsType<TMockProperty>;

  PropertyMock.Value := GetMockValue(PropertyValue);
end;

function TConverterMock.SaveToStream(const SerializedObject: TValue): TStream;
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

{ TConverterMockMainObject }

constructor TConverterMockMainObject.Create(const LoadTValue: Boolean);
begin
  inherited Create;

  FLoadTValue := LoadTValue;
end;

function TConverterMockMainObject.CreateMainObject(const RttiType: TRttiType): TValue;
begin
  if not Assigned(RttiType) then
    raise ENoRttiType.Create('No RTTI Type loaded!');

  MainObjectCalled := True;
  var MockObject := TMockMainObject.Create;
  MockObject.Name := 'MyMockObject';

  Result := MockObject;

  if FLoadTValue then
    Result := TValue.From(Result);
end;

function TConverterMockMainObject.LoadFromStream(const Stream: TStream): TValue;
begin
  Result := inherited LoadFromStream(Stream);

  if not FLoadTValue then
    Result := Result.AsType<TValue>.AsObject;
end;

function TConverterMockMainObject.SaveToStream(const SerializedObject: TValue): TStream;
begin
  var MainObject := SerializedObject;

  if FLoadTValue then
    MainObject := MainObject.AsType<TValue>;

  MainObjectSaved := MainObject.AsType<TMockObject>.Name = 'MyMockObject';

  Result := inherited SaveToStream(SerializedObject);
end;

{ TMockMainObject }

destructor TMockMainObject.Destroy;
begin
  ObjectDestroyed := True;

  inherited;
end;

end.

