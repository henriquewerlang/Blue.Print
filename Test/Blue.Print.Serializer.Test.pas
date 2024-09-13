﻿unit Blue.Print.Serializer.Test;

interface

{$SCOPEDENUMS ON}

uses System.Rtti, Test.Insight.Framework, Blue.Print.Types, Blue.Print.Serializer;

type
  TBluePrintSerializerTest = class
  private
    FSerializer: IBluePrintSerializer;
  public
    [Test]
    procedure WhenSerializeAStringMustReturnTheStringInTheReturnValue;
    [Test]
    procedure WhenSerializeAnIntegerMustReturnTheValueConvertedInString;
    [Test]
    procedure WhenSerializeAnEnumeretorMustReturnTheNameOfEnumeration;
    [Test]
    procedure WhenDeserializeAStringMustReturnTheStringInTheReturnValue;
    [Test]
    procedure WhenDeserializeAnIntegerMustReturnTheIntegerValueInTheReturnValue;
    [Test]
    procedure WhenDeserializeAnEnumeratorMustReturnTheEnumeratorValueInTheReturnValue;
    [Test]
    procedure WhenSerializeAnFloatNumberMustReturnTheStringAsExpected;
    [Test]
    procedure WhenSerializeABooleanValueMustReturnTheValueAsExpected;
    [Test]
    procedure WhenDeserializeABooleanValueMustReturnTheValueAsExpected;
    [Test]
    procedure WhenSerializeASimpleTypeTheContentTypeMustBePlainText;
    [Test]
    procedure WhenSerializeAnEnumerationWithTheEnumValueAttributeMustSerializeTheValueFromAttribute;
    [Test]
    procedure WhenDeserializeAnEnumerationWithTheEnumValueAttributeMustUseTheAttributeNameToReturnTheEnumerationValue;
    [Test]
    procedure WhenGetTheCurrentTimezoneMustReturnTheValueAsExpected;
  end;

  [TestFixture]
  TBluePrintJsonSerializerTest = class(TBluePrintSerializerTest)
  public
    [Setup]
    procedure Setup;
    [Test]
    procedure WhenSerializeAnObjectMustGenerateTheJSONAsExpected;
    [Test]
    procedure WhenDeserializeAnObjectMustCreateAndLoadThePropertiesAsExpected;
    [Test]
    procedure WhenSerializeAnArrayMustGenerateTheJSONAsExpected;
    [Test]
    procedure WhenDeserializeAnArrayMustLoadTheArrayAsExpected;
    [Test]
    procedure WhenSerializeARecordMustGenerateTheJSONAsExpected;
    [Test]
    procedure WhenDeserializeARecordMustLoadTheRecordsFieldsAsExpected;
    [Test]
    procedure WhenSerializeAClassReferenceMustGenerateTheFullQualifiedNameOfTheClass;
    [Test]
    procedure WhenDeserializeAClassReferenceMustLocateTheClassTypeByNameAndLoadTheValueAsExpected;
    [Test]
    procedure WhenSerializeAClassWithAPropertyWithAnObjectAndTheObjectIsNilMustGenerateTheJSONWithNullValue;
    [Test]
    procedure WhenDeserializeAClassWithAPropertyWithAnObjectAndTheJSONValueIsNullCantCreateTheObjectProperty;
    [Test]
    procedure WhenDeserializeAClassReferenceAndTheTypeIsntFoundCantRaiseError;
    [Test]
    procedure WhenDeserializeAClassReferenceAndTheTypeIsntFoundMustReturnTheValueEmpty;
    [Test]
    procedure OnlyPublicFieldsCanBeSerializedInTheRecordType;
    [Test]
    procedure WhenTheValueTypeIsATValueRecordMustSerializeThenInternalValueOfThisType;
    [Test]
    procedure WhenSerializeADateOrTimeMustSerializeTheValueAsExpected;
    [Test]
    procedure WhenDeserializeADateOrTimeMustLoadTheFieldsAsExpected;
    [Test]
    procedure WhenSerializeABooleanPropertyMustGenerateTheJSONAsExpected;
    [Test]
    procedure WhenDeserializeABooleanPropertyMustLoadThePropetyAsExpected;
    [Test]
    procedure WhenSerializeAComplexTypeMustReturnApplicationJSONInTheContentType;
    [Test]
    procedure WhenSerializeAPropertyWithStoredOnlyCanSerializeTheValueIfThePropetyIsStored;
    [Test]
    procedure OnlyPublishedPropertiesCantBeSerialized;
    [Test]
    procedure WhenSerializeAPropertyObjectMustLoadThePropertyFromTheObjectTypeAndNotTheProperyType;
    [Test]
    procedure WhenDeserializeAClassWithAnEnumeratorWithEnumValueAttributeMustLoadTheEnumaratorValueAsExpected;
  end;

  [TestFixture]
  TBluePrintXMLSerializerTest = class(TBluePrintSerializerTest)
  public
    [Setup]
    procedure Setup;
    [Test]
    procedure WhenSerializarAnObjectMustGenerateTheXMLAsExpected;
    [Test]
    procedure WhenThePropertyHasTheNodeNameAttributeMustGenerateTheXMLWithTheNameInTheAttribute;
    [Test]
    procedure WhenSerializeAnRecordMustLoadAllFieldsFromTheRecordAsExpected;
    [Test]
    procedure WhenSerializeATValueRecordMustSerializeTheValueFromTheRecord;
    [Test]
    procedure WhenSerializeASOAPBodyTheDocumentNameMustBeTheNameOfTheSOAPBodyType;
    [Test]
    procedure WhenSerializeAnObjectWithAnotherObjectMustGenerateTheXMLAsExpected;
    [Test]
    procedure WhenTheRecordFieldHaveTheNodeNameAttributeMustSerializeTheRecordAsExpected;
    [Test]
    procedure WhenTheClassHasTheNodeNameAttributeTheDocumentMustBeChangedToTheNameInTheAttribute;
    [Test]
    procedure WhenTheClassHasTheXMLAttributeMustLoadThisInfoTheTheNodeAsExpected;
    [Test]
    procedure WhenDeserializeAnObjectMustLoadThePropertiesAsExpected;
    [Test]
    procedure WhenDeserializeASOAPObjectMustLoadTheObjectAsExpected;
    [Test]
    procedure WhenTheParameterHasXMLAttributesThisValueMustBeLoadedInTheXMLAsExpected;
    [Test]
    procedure WhenThePropertyHasTheStoredPropertyTheValueMustBeSerializedOnlyIfThisPropertyIsTrue;
    [Test]
    procedure WhenSerializeAComplexTypeMustReturnApplicationXMLInTheContentType;
    [Test]
    procedure WhenSerializeAnObjectWithANilPropertyCanRaiseError;
    [Test]
    procedure WhenSerializeAPropertyWithXMLAttributeMustLoadTheValueAttributeFromPropertyAndNameInTheClassNode;
    [Test]
    procedure WhenAClassHasAChildWithXMLAttributeMustLoadTheAttributeAsExpected;
    [Test]
    procedure EvenTheChildClassPropertyIsEmptyMustLoadTheAttributesAsExpected;
    [Test]
    procedure WhenAClassHasTheNamespaceAttributeTheChildNodesCantCleanUpTheNameSpace;
    [Test]
    procedure WhenDeserializeSOAPObjectMustCheckTheLocalNameFromTheNodeNotTheNodeName;
    [Test]
    procedure WhenTheSOAPParamHasTheNamespaceAttributeMustLoadThisNamespaceInTheXML;
    [Test]
    procedure WhenSerializeADateOrTimeValueMustGenerateTheNodesValuesAsExpected;
    [Test]
    procedure WhenDeserializeADateOrTimeValueMustLoadThePropertiesWithTheExpectedValues;
    [Test]
    procedure OnlyPublishedPropertiesCantBeSerialized;
    [Test]
    procedure WhenSerializeAPropertyObjectMustLoadThePropertyFromTheObjectTypeAndNotTheProperyType;
    [Test]
    procedure WhenAClassHasAnArrayPropertyMustSerializeTheValuesAsExpected;
    [Test]
    procedure WhenDeserializeAClassWithAnArrayPropertyMustLoadTheClassAsExpected;
    [Test]
    procedure WhenAChildClassHasXMLNamespaceAttributeMustLoadTheNamespaceFromThisClass;
    [Test]
    procedure WhenThePropertyHasTheNamespaceAttributeMustLoadThisNameSpaceInTheXML;
    [Test]
    procedure WhenDeserializeAClassWithAnEnumeratorWithEnumValueAttributeMustLoadTheEnumaratorValueAsExpected;
  end;

  TMyEnum = (MyValue, MyValue2);
  [EnumValue('1, 2, abc')]
  TMyEnumWithAttribute = (MyValue, MyValue2, MyValue3);

  TMyObject = class
  private
    FMyProp1: String;
    FMyProp2: Integer;
    FMyProp3: Double;
    FMyProp4: TMyEnum;
  published
    property MyProp1: String read FMyProp1 write FMyProp1;
    property MyProp2: Integer read FMyProp2 write FMyProp2;
    property MyProp3: Double read FMyProp3 write FMyProp3;
    property MyProp4: TMyEnum read FMyProp4 write FMyProp4;
  end;

  TMyClassWithNode = class
  private
    FMyProperty: String;
  published
    [NodeName('MyNode')]
    property MyProperty: String read FMyProperty write FMyProperty;
  end;

  [NodeName('MyDocument')]
  TMyClassWithNodeNameAttribute = class
  private
    FMyProperty: String;
  published
    property MyProperty: String read FMyProperty write FMyProperty;
  end;

  [XMLAttribute('MyAttribute', 'MyValue')]
  TMyClassWithXMLAttribute = class
  private
    FMyProperty: String;
  published
    property MyProperty: String read FMyProperty write FMyProperty;
  end;

  TMyClassWithChildWithXMLAttribute = class
  private
    FMyProp: TMyClassWithXMLAttribute;
  published
    property MyProp: TMyClassWithXMLAttribute read FMyProp write FMyProp;
  end;

  TMyObjectParent = class
  private
    FMyObject: TMyObject;
    FError: String;
  published
    property Error: String read FError write FError;
    property MyObject: TMyObject read FMyObject write FMyObject;
  end;

  TMyObjectInherited = class(TMyObject)
  private
    FAnother: Integer;
  published
    property Another: Integer read FAnother write FAnother;
  end;

  TMyRecord = record
  public
    MyField1: String;
    MyField2: Integer;
    MyField3: Double;
    MyField4: TMyEnum;
  end;

  TMyPrivateRecord = record
  private
    FMyPrivateField: String;
  public
    MyPublicField: String;
    property MyPrivateField: String read FMyPrivateField write FMyPrivateField;
  end;

  TMyRecordWithAttribute = record
  public
    [NodeName('AnotherName')]
    MyField: String;
  end;

  TMyTValueClass = class
  private
    FValue: TValue;
  published
    property Value: TValue read FValue write FValue;
  end;

  TMyClassWithStoredProperty = class
  private
    FMyProperty: Integer;
    FMyPropertyStored: Boolean;
  protected
    property MyPropertyStored: Boolean read FMyPropertyStored write FMyPropertyStored;
  published
    property MyProperty: Integer read FMyProperty write FMyProperty stored FMyPropertyStored;
  end;

  TMyDateAndTimeClass = class
  private
    FMyDate: TDate;
    FMyTime: TTime;
    FMyDateTime: TDateTime;
  published
    property MyDate: TDate read FMyDate write FMyDate;
    property MyTime: TTime read FMyTime write FMyTime;
    property MyDateTime: TDateTime read FMyDateTime write FMyDateTime;
  end;

  TMyBooleanClass = class
  private
    FMyProp: Boolean;
  published
    property MyProp: Boolean read FMyProp write FMyProp;
  end;

  TMyClassWithPropertyAttribute = class
  private
    FMyProp: String;
  published
    [XMLAttributeValue]
    property MyProp: String read FMyProp write FMyProp;
  end;

  [XMLNamespace('MyNamespace')]
  TMyClassWithNamespace = class
  private
    FMyProp: TMyClassWithChildWithXMLAttribute;
  published
    property MyProp: TMyClassWithChildWithXMLAttribute read FMyProp write FMyProp;
  end;

  TMyClassWithEnumValues = class
  private
    FMyProp: TMyEnumWithAttribute;
  published
    property MyProp: TMyEnumWithAttribute read FMyProp write FMyProp;
  end;

  TMyPublishedClass = class
  private
    FMyPublic: Integer;
    FMyPublished: Integer;
    FMyProtected: Integer;
    FMyPrivate: Integer;

    property MyPrivate: Integer read FMyPrivate write FMyPrivate;
  protected
    property MyProtected: Integer read FMyProtected write FMyProtected;
  public
    property MyPublic: Integer read FMyPublic write FMyPublic;
  published
    property MyPublished: Integer read FMyPublished write FMyPublished;
  end;

  TMyClassWithArray = class
  private
    FMyArray: TArray<Integer>;
  published
    property MyArray: TArray<Integer> read FMyArray write FMyArray;
  end;

  [XMLNamespace('Another')]
  TMyClassWithNamespaceParent = class
  private
    FMyProp: TMyClassWithNamespace;
  published
    property MyProp: TMyClassWithNamespace read FMyProp write FMyProp;
  end;

  TMyClassWithPropertyWithNamespaceAttribute = class
  private
    FMyProp: String;
  published
    [XMLAttribute('MyAtt', 'MyValue')]
    property MyProp: String read FMyProp write FMyProp;
  end;

  ISOAPService = interface(IInvokable)
    ['{BBBBC6F3-1730-40F4-A1B1-CC7CA6F08F5D}']
    procedure MyMethod(const MyParam: Integer);
    procedure MyMethodWithParamAttribute([XMLAttribute('MyAttribute', 'MyValue')] const MyParam: Integer);
    procedure MyMethodWithNamespace([XMLNamespace('MySpace')] const MyParam: TMyBooleanClass);
  end;

implementation

uses System.SysUtils, System.DateUtils, REST.Types;

{ TBluePrintSerializerTest }

procedure TBluePrintSerializerTest.WhenDeserializeABooleanValueMustReturnTheValueAsExpected;
begin
  var Value := FSerializer.Deserialize('True', TypeInfo(Boolean));

  Assert.AreEqual(True, Value.AsBoolean);
end;

procedure TBluePrintSerializerTest.WhenDeserializeAnEnumerationWithTheEnumValueAttributeMustUseTheAttributeNameToReturnTheEnumerationValue;
begin
  var Value := FSerializer.Deserialize('abc', TypeInfo(TMyEnumWithAttribute));

  Assert.AreEqual(TMyEnumWithAttribute.MyValue3, Value.AsType<TMyEnumWithAttribute>);
end;

procedure TBluePrintSerializerTest.WhenDeserializeAnEnumeratorMustReturnTheEnumeratorValueInTheReturnValue;
begin
  var Value := FSerializer.Deserialize('MyValue', TypeInfo(TMyEnum));

  Assert.AreEqual(TMyEnum.MyValue, Value.AsType<TMyEnum>);
end;

procedure TBluePrintSerializerTest.WhenDeserializeAnIntegerMustReturnTheIntegerValueInTheReturnValue;
begin
  var Value := FSerializer.Deserialize('123', TypeInfo(Integer));

  Assert.AreEqual<Integer>(123, Value.AsInteger);
end;

procedure TBluePrintSerializerTest.WhenDeserializeAStringMustReturnTheStringInTheReturnValue;
begin
  var Value := FSerializer.Deserialize('abc', TypeInfo(String));

  Assert.AreEqual('abc', Value.ToString);
end;

procedure TBluePrintSerializerTest.WhenGetTheCurrentTimezoneMustReturnTheValueAsExpected;
begin
  var CurrentTimezone := TTimeZone.Local.Abbreviation.Substring(3) + ':00';

  Assert.AreEqual(CurrentTimezone, TBluePrintSerializer.GetCurrentTimeZone);
end;

procedure TBluePrintSerializerTest.WhenSerializeABooleanValueMustReturnTheValueAsExpected;
begin
  var Value := FSerializer.Serialize(TValue.From(True));

  Assert.AreEqual('True', Value);
end;

procedure TBluePrintSerializerTest.WhenSerializeAnEnumerationWithTheEnumValueAttributeMustSerializeTheValueFromAttribute;
begin
  var Value := FSerializer.Serialize(TValue.From(TMyEnumWithAttribute.MyValue3));

  Assert.AreEqual('abc', Value);
end;

procedure TBluePrintSerializerTest.WhenSerializeAnEnumeretorMustReturnTheNameOfEnumeration;
begin
  var Value := FSerializer.Serialize(TValue.From(TMyEnum.MyValue));

  Assert.AreEqual('MyValue', Value);
end;

procedure TBluePrintSerializerTest.WhenSerializeAnFloatNumberMustReturnTheStringAsExpected;
begin
  var Value := FSerializer.Serialize(123.456);

  Assert.AreEqual('123.456', Value);
end;

procedure TBluePrintSerializerTest.WhenSerializeAnIntegerMustReturnTheValueConvertedInString;
begin
  var Value := FSerializer.Serialize(123);

  Assert.AreEqual('123', Value);
end;

procedure TBluePrintSerializerTest.WhenSerializeASimpleTypeTheContentTypeMustBePlainText;
begin
  FSerializer.Serialize('abc');

  Assert.AreEqual(CONTENTTYPE_TEXT_PLAIN, FSerializer.ContentType);
end;

procedure TBluePrintSerializerTest.WhenSerializeAStringMustReturnTheStringInTheReturnValue;
begin
  var Value := FSerializer.Serialize('abc');

  Assert.AreEqual('abc', Value);
end;

{ TBluePrintJsonSerializerTest }

procedure TBluePrintJsonSerializerTest.OnlyPublicFieldsCanBeSerializedInTheRecordType;
begin
  var MyRecord: TMyPrivateRecord;
  MyRecord.MyPublicField := 'abc';
  MyRecord.MyPrivateField := 'def';

  var Value := FSerializer.Serialize(TValue.From(MyRecord));

  Assert.AreEqual('{"MyPublicField":"abc"}', Value);
end;

procedure TBluePrintJsonSerializerTest.OnlyPublishedPropertiesCantBeSerialized;
begin
  var MyClass := TMyPublishedClass.Create;
  MyClass.MyPrivate := 1;
  MyClass.MyProtected := 2;
  MyClass.MyPublic := 3;
  MyClass.MyPublished := 4;
  var Value := FSerializer.Serialize(MyClass);

  Assert.AreEqual('{"MyPublished":4}', Value);

  MyClass.Free;
end;

procedure TBluePrintJsonSerializerTest.Setup;
begin
  FSerializer := TBluePrintJsonSerializer.Create;
end;

procedure TBluePrintJsonSerializerTest.WhenDeserializeABooleanPropertyMustLoadThePropetyAsExpected;
begin
  var Value := FSerializer.Deserialize('{"MyProp":true}', TypeInfo(TMyBooleanClass));

  var MyObject := Value.AsType<TMyBooleanClass>;

  Assert.AreEqual(True, MyObject.MyProp);

  MyObject.Free;
end;

procedure TBluePrintJsonSerializerTest.WhenDeserializeAClassReferenceAndTheTypeIsntFoundCantRaiseError;
begin
  Assert.WillNotRaise(
    procedure
    begin
      FSerializer.Deserialize('"Blue.Print.Serializer.Test.InvalidName"', TypeInfo(TClass));
    end);
end;

procedure TBluePrintJsonSerializerTest.WhenDeserializeAClassReferenceAndTheTypeIsntFoundMustReturnTheValueEmpty;
begin
  var Value := FSerializer.Deserialize('"Blue.Print.Serializer.Test.InvalidName"', TypeInfo(TClass));

  Assert.IsTrue(Value.IsEmpty);
end;

procedure TBluePrintJsonSerializerTest.WhenDeserializeAClassReferenceMustLocateTheClassTypeByNameAndLoadTheValueAsExpected;
begin
  var Value := FSerializer.Deserialize('"Blue.Print.Serializer.Test.TMyObject"', TypeInfo(TClass));

  Assert.AreEqual<TClass>(TMyObject, Value.AsClass);
end;

procedure TBluePrintJsonSerializerTest.WhenDeserializeAClassWithAnEnumeratorWithEnumValueAttributeMustLoadTheEnumaratorValueAsExpected;
begin
  var Value := FSerializer.Deserialize('{"MyProp":"abc"}', TypeInfo(TMyClassWithEnumValues));

  Assert.AreEqual(TMyEnumWithAttribute.MyValue3, Value.AsType<TMyClassWithEnumValues>.MyProp);

  Value.AsObject.Free;
end;

procedure TBluePrintJsonSerializerTest.WhenDeserializeAClassWithAPropertyWithAnObjectAndTheJSONValueIsNullCantCreateTheObjectProperty;
begin
  var Value := FSerializer.Deserialize('{"Error":"Error value","MyObject":null}', TypeInfo(TMyObjectParent));

  Assert.IsNil(Value.AsType<TMyObjectParent>.MyObject);

  Value.AsObject.Free;
end;

procedure TBluePrintJsonSerializerTest.WhenDeserializeADateOrTimeMustLoadTheFieldsAsExpected;
begin
  var Value := FSerializer.Deserialize('{"MyDate":"2024-05-21T00:00:00.000Z","MyTime":"1899-12-30T01:02:03.000Z","MyDateTime":"2024-05-21T01:02:03.000Z"}', TypeInfo(TMyDateAndTimeClass));

  var MyObject := Value.AsType<TMyDateAndTimeClass>;

  Assert.AreEqual<TDateTime>(EncodeDate(2024, 05, 21), MyObject.MyDate);
  Assert.AreEqual<TDateTime>(EncodeDateTime(2024, 05, 21, 01, 02, 03, 000), MyObject.MyDateTime);
  Assert.AreEqual<TDateTime>(EncodeTime(01, 02, 03, 000), MyObject.Mytime);

  MyObject.Free;
end;

procedure TBluePrintJsonSerializerTest.WhenDeserializeAnArrayMustLoadTheArrayAsExpected;
begin
  var Value := FSerializer.Deserialize('[123,456,789]', TypeInfo(TArray<Integer>));

  Assert.AreEqual<NativeInt>(3, Value.GetArrayLength);
  Assert.AreEqual<Integer>(123, Value.GetArrayElement(0).AsInteger);
  Assert.AreEqual<Integer>(456, Value.GetArrayElement(1).AsInteger);
  Assert.AreEqual<Integer>(789, Value.GetArrayElement(2).AsInteger);
end;

procedure TBluePrintJsonSerializerTest.WhenDeserializeAnObjectMustCreateAndLoadThePropertiesAsExpected;
begin
  var Value := FSerializer.Deserialize('{"MyProp1":"abc","MyProp2":123,"MyProp3":123.456,"MyProp4":"MyValue"}', TypeInfo(TMyObject)).AsType<TMyObject>;

  Assert.IsNotNil(Value);
  Assert.AreEqual('abc', Value.MyProp1);
  Assert.AreEqual<Integer>(123, Value.MyProp2);
  Assert.AreEqual<Double>(123.456, Value.MyProp3);
  Assert.AreEqual(TMyEnum.MyValue, Value.MyProp4);

  Value.Free;
end;

procedure TBluePrintJsonSerializerTest.WhenDeserializeARecordMustLoadTheRecordsFieldsAsExpected;
begin
  var MyRecord: TMyRecord;

  var Value := FSerializer.Deserialize('{"MyField1":"abc","MyField2":123,"MyField3":123.456,"MyField4":"MyValue2"}', TypeInfo(TMyRecord)).AsType<TMyRecord>;

  Assert.AreEqual('abc', Value.MyField1);
  Assert.AreEqual<Integer>(123, Value.MyField2);
  Assert.AreEqual<Double>(123.456, Value.MyField3);
  Assert.AreEqual(TMyEnum.MyValue2, Value.MyField4);
end;

procedure TBluePrintJsonSerializerTest.WhenSerializeABooleanPropertyMustGenerateTheJSONAsExpected;
begin
  var MyObject := TMyBooleanClass.Create;
  MyObject.MyProp := True;
  var Value := FSerializer.Serialize(MyObject);

  Assert.AreEqual('{"MyProp":true}', Value);

  MyObject.Free;
end;

procedure TBluePrintJsonSerializerTest.WhenSerializeAClassReferenceMustGenerateTheFullQualifiedNameOfTheClass;
begin
  var ClassValue: TClass := TMyObject;
  var Value := FSerializer.Serialize(TValue.From(ClassValue));

  Assert.AreEqual('"Blue.Print.Serializer.Test.TMyObject"', Value);
end;

procedure TBluePrintJsonSerializerTest.WhenSerializeAClassWithAPropertyWithAnObjectAndTheObjectIsNilMustGenerateTheJSONWithNullValue;
begin
  var MyObject := TMyObjectParent.Create;
  var Value := FSerializer.Serialize(MyObject);

  Assert.AreEqual('{"Error":"","MyObject":null}', Value);

  MyObject.Free;
end;

procedure TBluePrintJsonSerializerTest.WhenSerializeAComplexTypeMustReturnApplicationJSONInTheContentType;
begin
  var MyObject := TMyBooleanClass.Create;

  FSerializer.Serialize(MyObject);

  Assert.AreEqual(CONTENTTYPE_APPLICATION_JSON, FSerializer.ContentType);

  MyObject.Free;
end;

procedure TBluePrintJsonSerializerTest.WhenSerializeADateOrTimeMustSerializeTheValueAsExpected;
begin
  var MyObject := TMyDateAndTimeClass.Create;
  MyObject.MyDate := EncodeDate(2024, 05, 21);
  MyObject.MyDateTime := EncodeDateTime(2024, 05, 21, 01, 02, 03, 000);
  MyObject.MyTime := EncodeTime(01, 02, 03, 000);

  var Value := FSerializer.Serialize(MyObject);

  Assert.AreEqual('{"MyDate":"2024-05-21T00:00:00.000Z","MyTime":"1899-12-30T01:02:03.000Z","MyDateTime":"2024-05-21T01:02:03.000Z"}', Value);

  MyObject.Free;
end;

procedure TBluePrintJsonSerializerTest.WhenSerializeAnArrayMustGenerateTheJSONAsExpected;
begin
  var Value := FSerializer.Serialize(TValue.From<TArray<Integer>>([123, 456, 789]));

  Assert.AreEqual('[123,456,789]', Value);
end;

procedure TBluePrintJsonSerializerTest.WhenSerializeAnObjectMustGenerateTheJSONAsExpected;
begin
  var MyObject := TMyObject.Create;
  MyObject.MyProp1 := 'abc';
  MyObject.MyProp2 := 123;
  MyObject.MyProp3 := 123.456;
  var Value := FSerializer.Serialize(MyObject);

  Assert.AreEqual('{"MyProp1":"abc","MyProp2":123,"MyProp3":123.456,"MyProp4":"MyValue"}', Value);

  MyObject.Free;
end;

procedure TBluePrintJsonSerializerTest.WhenSerializeAPropertyObjectMustLoadThePropertyFromTheObjectTypeAndNotTheProperyType;
begin
  var MyClass := TMyObjectParent.Create;
  MyClass.MyObject := TMyObjectInherited.Create;

  var Value := FSerializer.Serialize(MyClass);

  Assert.AreEqual('{"Error":"","MyObject":{"Another":0,"MyProp1":"","MyProp2":0,"MyProp3":0.0,"MyProp4":"MyValue"}}', FSerializer.Serialize(MyClass));

  MyClass.MyObject.Free;

  MyClass.Free;
end;

procedure TBluePrintJsonSerializerTest.WhenSerializeAPropertyWithStoredOnlyCanSerializeTheValueIfThePropetyIsStored;
begin
  var MyObject := TMyClassWithStoredProperty.Create;
  MyObject.MyProperty := 123;

  Assert.AreEqual('{}', FSerializer.Serialize(MyObject));

  MyObject.Free;
end;

procedure TBluePrintJsonSerializerTest.WhenSerializeARecordMustGenerateTheJSONAsExpected;
begin
  var MyRecord: TMyRecord;
  MyRecord.MyField1 := 'abc';
  MyRecord.MyField2 := 123;
  MyRecord.MyField3 := 123.456;
  MyRecord.MyField4 := TMyEnum.MyValue;
  var Value := FSerializer.Serialize(TValue.From(MyRecord));

  Assert.AreEqual('{"MyField1":"abc","MyField2":123,"MyField3":123.456,"MyField4":"MyValue"}', Value);
end;

procedure TBluePrintJsonSerializerTest.WhenTheValueTypeIsATValueRecordMustSerializeThenInternalValueOfThisType;
begin
  var MyObject := TMyTValueClass.Create;
  MyObject.Value := 'abc';

  var Value := FSerializer.Serialize(MyObject);

  Assert.AreEqual('{"Value":"abc"}', Value);

  MyObject.Free;
end;

{ TBluePrintXMLSerializerTest }

procedure TBluePrintXMLSerializerTest.EvenTheChildClassPropertyIsEmptyMustLoadTheAttributesAsExpected;
begin
  var MyClass := TMyClassWithChildWithXMLAttribute.Create;
  var Value := FSerializer.Serialize(MyClass);

  Assert.AreEqual('<?xml version="1.0" encoding="UTF-8"?>'#13#10'<Document><MyProp MyAttribute="MyValue"/></Document>'#13#10, Value);

  MyClass.Free;
end;

procedure TBluePrintXMLSerializerTest.OnlyPublishedPropertiesCantBeSerialized;
begin
  var MyClass := TMyPublishedClass.Create;
  MyClass.MyPrivate := 1;
  MyClass.MyProtected := 2;
  MyClass.MyPublic := 3;
  MyClass.MyPublished := 4;
  var Value := FSerializer.Serialize(MyClass);

  Assert.AreEqual('<?xml version="1.0" encoding="UTF-8"?>'#13#10'<Document><MyPublished>4</MyPublished></Document>'#13#10, Value);

  MyClass.Free;
end;

procedure TBluePrintXMLSerializerTest.Setup;
begin
  FSerializer := TBluePrintXMLSerializer.Create;
end;

procedure TBluePrintXMLSerializerTest.WhenAChildClassHasXMLNamespaceAttributeMustLoadTheNamespaceFromThisClass;
begin
  var MyClass := TMyClassWithNamespaceParent.Create;
  MyClass.MyProp := TMyClassWithNamespace.Create;

  Assert.AreEqual('<?xml version="1.0" encoding="UTF-8"?>'#13#10'<Document xmlns="Another"><MyProp xmlns="MyNamespace"><MyProp/></MyProp></Document>'#13#10, FSerializer.Serialize(MyClass));

  MyClass.MyProp.Free;

  MyClass.Free;
end;

procedure TBluePrintXMLSerializerTest.WhenAClassHasAChildWithXMLAttributeMustLoadTheAttributeAsExpected;
begin
  var MyClass := TMyClassWithChildWithXMLAttribute.Create;
  MyClass.MyProp := TMyClassWithXMLAttribute.Create;

  var Value := FSerializer.Serialize(MyClass);

  Assert.AreEqual('<?xml version="1.0" encoding="UTF-8"?>'#13#10'<Document><MyProp MyAttribute="MyValue"><MyProperty></MyProperty></MyProp></Document>'#13#10, Value);

  MyClass.MyProp.Free;

  MyClass.Free;
end;

procedure TBluePrintXMLSerializerTest.WhenAClassHasAnArrayPropertyMustSerializeTheValuesAsExpected;
begin
  var MyClass := TMyClassWithArray.Create;
  MyClass.MyArray := [1, 2, 3];
  var Value := FSerializer.Serialize(MyClass);

  Assert.AreEqual('<?xml version="1.0" encoding="UTF-8"?>'#13#10'<Document><MyArray>1</MyArray><MyArray>2</MyArray><MyArray>3</MyArray></Document>'#13#10, Value);

  MyClass.Free;
end;

procedure TBluePrintXMLSerializerTest.WhenAClassHasTheNamespaceAttributeTheChildNodesCantCleanUpTheNameSpace;
begin
  var MyClass := TMyClassWithNamespace.Create;
  MyClass.MyProp := TMyClassWithChildWithXMLAttribute.Create;
  MyClass.MyProp.MyProp := TMyClassWithXMLAttribute.Create;

  var Value := FSerializer.Serialize(MyClass);

  Assert.AreEqual('<?xml version="1.0" encoding="UTF-8"?>'#13#10'<Document xmlns="MyNamespace"><MyProp><MyProp MyAttribute="MyValue"><MyProperty></MyProperty></MyProp></MyProp></Document>'#13#10, Value);

  MyClass.MyProp.MyProp.Free;

  MyClass.MyProp.Free;

  MyClass.Free;
end;

procedure TBluePrintXMLSerializerTest.WhenDeserializeAClassWithAnArrayPropertyMustLoadTheClassAsExpected;
begin
  var Value := FSerializer.Deserialize('<?xml version="1.0" encoding="UTF-8"?>'#13#10'<Document><MyArray>1</MyArray><MyArray>2</MyArray><MyArray>3</MyArray></Document>'#13#10, TypeInfo(TMyClassWithArray)).AsType<TMyClassWithArray>;

  Assert.AreEqual<NativeInt>(3, Length(Value.MyArray));
  Assert.AreEqual<NativeInt>(1, Value.MyArray[0]);
  Assert.AreEqual<NativeInt>(2, Value.MyArray[1]);
  Assert.AreEqual<NativeInt>(3, Value.MyArray[2]);

  Value.Free;
end;

procedure TBluePrintXMLSerializerTest.WhenDeserializeAClassWithAnEnumeratorWithEnumValueAttributeMustLoadTheEnumaratorValueAsExpected;
begin
  var Value := FSerializer.Deserialize('<Document><MyProp>abc</MyProp></Document>', TypeInfo(TMyClassWithEnumValues));

  Assert.AreEqual(TMyEnumWithAttribute.MyValue3, Value.AsType<TMyClassWithEnumValues>.MyProp);

  Value.AsObject.Free;
end;

procedure TBluePrintXMLSerializerTest.WhenDeserializeADateOrTimeValueMustLoadThePropertiesWithTheExpectedValues;
begin
  var Value := FSerializer.Deserialize(Format('<?xml version="1.0" encoding="UTF-8"?>'#13#10'<Document><MyDate>2024-05-21</MyDate><MyTime>01:02:03</MyTime><MyDateTime>2024-05-21T01:02:03%s</MyDateTime></Document>'#13#10,
    [TBluePrintSerializer.GetCurrentTimeZone]), TypeInfo(TMyDateAndTimeClass));

  var MyObject := Value.AsType<TMyDateAndTimeClass>;

  Assert.IsTrue(MyObject.MyDate = EncodeDate(2024, 05, 21));
  Assert.IsTrue(MyObject.MyDateTime = EncodeDateTime(2024, 05, 21, 01, 02, 03, 000));
  Assert.IsTrue(MyObject.MyTime = EncodeTime(01, 02, 03, 000));

  MyObject.Free;
end;

procedure TBluePrintXMLSerializerTest.WhenDeserializeAnObjectMustLoadThePropertiesAsExpected;
begin
  var Value := FSerializer.Deserialize('<Document><MyProp1>abc</MyProp1><MyProp2>123</MyProp2><MyProp3>123.456</MyProp3><MyProp4>MyValue2</MyProp4></Document>', TypeInfo(TMyObject)).AsType<TMyObject>;

  Assert.IsNotNil(Value);
  Assert.AreEqual('abc', Value.MyProp1);
  Assert.AreEqual<Integer>(123, Value.MyProp2);
  Assert.AreEqual<Double>(123.456, Value.MyProp3);
  Assert.AreEqual(TMyEnum.MyValue2, Value.MyProp4);

  Value.Free;
end;

procedure TBluePrintXMLSerializerTest.WhenDeserializeASOAPObjectMustLoadTheObjectAsExpected;
begin
  var Value := FSerializer.Deserialize(
    '<?xml version="1.0" encoding="UTF-8"?>'#13#10'<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://www.w3.org/2003/05/soap-envelope"><SOAP-ENV:Body><Document><MyProp1>abc</MyProp1><MyProp2>123</MyProp2><MyProp3>123.456</MyProp3><MyProp4>MyValue2</MyProp4></Document></SOAP-ENV:Body></SOAP-ENV:Envelope>',
    TypeInfo(TMyObject)).AsType<TMyObject>;

  Assert.IsNotNil(Value);
  Assert.AreEqual('abc', Value.MyProp1);
  Assert.AreEqual<Integer>(123, Value.MyProp2);
  Assert.AreEqual<Double>(123.456, Value.MyProp3);
  Assert.AreEqual(TMyEnum.MyValue2, Value.MyProp4);

  Value.Free;
end;

procedure TBluePrintXMLSerializerTest.WhenDeserializeSOAPObjectMustCheckTheLocalNameFromTheNodeNotTheNodeName;
begin
  var Value := FSerializer.Deserialize(
    '<?xml version="1.0" encoding="UTF-8"?>'#13#10'<any:Envelope xmlns:any="http://www.w3.org/2003/05/soap-envelope"><any:Body><Document><MyProp1>abc</MyProp1><MyProp2>123</MyProp2><MyProp3>123.456</MyProp3><MyProp4>MyValue2</MyProp4></Document></any:Body></any:Envelope>',
    TypeInfo(TMyObject)).AsType<TMyObject>;

  Assert.IsNotNil(Value);
  Assert.AreEqual('abc', Value.MyProp1);
  Assert.AreEqual<Integer>(123, Value.MyProp2);
  Assert.AreEqual<Double>(123.456, Value.MyProp3);
  Assert.AreEqual(TMyEnum.MyValue2, Value.MyProp4);

  Value.Free;
end;

procedure TBluePrintXMLSerializerTest.WhenSerializarAnObjectMustGenerateTheXMLAsExpected;
begin
  var MyObject := TMyObject.Create;
  MyObject.MyProp1 := 'abc';
  MyObject.MyProp2 := 123;
  MyObject.MyProp3 := 123.456;
  var Value := FSerializer.Serialize(MyObject);

  Assert.AreEqual('<?xml version="1.0" encoding="UTF-8"?>'#13#10'<Document><MyProp1>abc</MyProp1><MyProp2>123</MyProp2><MyProp3>123.456</MyProp3><MyProp4>MyValue</MyProp4></Document>'#13#10, Value);

  MyObject.Free;
end;

procedure TBluePrintXMLSerializerTest.WhenSerializeAComplexTypeMustReturnApplicationXMLInTheContentType;
begin
  var MyObject := TMyBooleanClass.Create;

  FSerializer.Serialize(MyObject);

  Assert.AreEqual(CONTENTTYPE_APPLICATION_XML, FSerializer.ContentType);

  MyObject.Free;
end;

procedure TBluePrintXMLSerializerTest.WhenSerializeADateOrTimeValueMustGenerateTheNodesValuesAsExpected;
begin
  var MyObject := TMyDateAndTimeClass.Create;
  MyObject.MyDate := EncodeDate(2024, 05, 21);
  MyObject.MyDateTime := EncodeDateTime(2024, 05, 21, 01, 02, 03, 000);
  MyObject.MyTime := EncodeTime(01, 02, 03, 000);

  var Value := FSerializer.Serialize(MyObject);

  Assert.AreEqual(Format('<?xml version="1.0" encoding="UTF-8"?>'#13#10'<Document><MyDate>2024-05-21</MyDate><MyTime>01:02:03</MyTime><MyDateTime>2024-05-21T01:02:03%s</MyDateTime></Document>'#13#10, [TBluePrintSerializer.GetCurrentTimeZone]), Value);

  MyObject.Free;
end;

procedure TBluePrintXMLSerializerTest.WhenSerializeAnObjectWithANilPropertyCanRaiseError;
begin
  var MyObject := TMyObjectParent.Create;

  Assert.WillNotRaise(
    procedure
    begin
      FSerializer.Serialize(MyObject);
    end);

  MyObject.Free;
end;

procedure TBluePrintXMLSerializerTest.WhenSerializeAnObjectWithAnotherObjectMustGenerateTheXMLAsExpected;
begin
  var MyObject := TMyObjectParent.Create;
  MyObject.MyObject := TMyObject.Create;

  Assert.AreEqual('<?xml version="1.0" encoding="UTF-8"?>'#13#10'<Document><Error></Error><MyObject><MyProp1></MyProp1><MyProp2>0</MyProp2><MyProp3>0</MyProp3><MyProp4>MyValue</MyProp4></MyObject></Document>'#13#10, FSerializer.Serialize(MyObject));

  MyObject.MyObject.Free;

  MyObject.Free;
end;

procedure TBluePrintXMLSerializerTest.WhenSerializeAnRecordMustLoadAllFieldsFromTheRecordAsExpected;
begin
  var MyRecord: TMyRecord;
  MyRecord.MyField1 := 'abc';
  MyRecord.MyField2 := 123;
  MyRecord.MyField3 := 123.456;
  var Value := FSerializer.Serialize(TValue.From(MyRecord));

  Assert.AreEqual('<?xml version="1.0" encoding="UTF-8"?>'#13#10'<Document><MyField1>abc</MyField1><MyField2>123</MyField2><MyField3>123.456</MyField3><MyField4>MyValue</MyField4></Document>'#13#10, Value);
end;

procedure TBluePrintXMLSerializerTest.WhenSerializeAPropertyObjectMustLoadThePropertyFromTheObjectTypeAndNotTheProperyType;
begin
  var MyClass := TMyObjectParent.Create;
  MyClass.MyObject := TMyObjectInherited.Create;

  var Value := FSerializer.Serialize(MyClass);

  Assert.AreEqual('<?xml version="1.0" encoding="UTF-8"?>'#13#10'<Document><Error></Error><MyObject><Another>0</Another><MyProp1></MyProp1><MyProp2>0</MyProp2><MyProp3>0</MyProp3><MyProp4>MyValue</MyProp4></MyObject></Document>'#13#10, FSerializer.Serialize(MyClass));

  MyClass.MyObject.Free;

  MyClass.Free;
end;

procedure TBluePrintXMLSerializerTest.WhenSerializeAPropertyWithXMLAttributeMustLoadTheValueAttributeFromPropertyAndNameInTheClassNode;
begin
  var MyClass := TMyClassWithPropertyAttribute.Create;
  MyClass.MyProp := 'MyValue';

  var Value := FSerializer.Serialize(MyClass);

  Assert.AreEqual('<?xml version="1.0" encoding="UTF-8"?>'#13#10'<Document MyProp="MyValue"/>'#13#10, Value);

  MyClass.Free;
end;

procedure TBluePrintXMLSerializerTest.WhenSerializeASOAPBodyTheDocumentNameMustBeTheNameOfTheSOAPBodyType;
begin
  var RttiContext := TRttiContext.Create;
  var RttiInterface := RttiContext.GetType(TypeInfo(ISOAPService));

  var RttiMethod := RttiInterface.GetMethod('MyMethod');
  var SOAPRequest := TSOAPEnvelop.Create(RttiMethod.GetParameters[0], 'abc');

  Assert.AreEqual('<?xml version="1.0" encoding="UTF-8"?>'#13#10'<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://www.w3.org/2003/05/soap-envelope" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"><SOAP-ENV:Body><MyParam>abc</MyParam></SOAP-ENV:Body></SOAP-ENV:Envelope>'#13#10,
    FSerializer.Serialize(TValue.From(SOAPRequest)));

  RttiContext.Free;
end;

procedure TBluePrintXMLSerializerTest.WhenSerializeATValueRecordMustSerializeTheValueFromTheRecord;
begin
  var Value: TValue := 'abc';

  Assert.AreEqual('<?xml version="1.0" encoding="UTF-8"?>'#13#10'<Document>abc</Document>'#13#10, FSerializer.Serialize(TValue.From(Value)));
end;

procedure TBluePrintXMLSerializerTest.WhenTheClassHasTheNodeNameAttributeTheDocumentMustBeChangedToTheNameInTheAttribute;
begin
  var MyClass := TMyClassWithNodeNameAttribute.Create;
  MyClass.MyProperty := 'abc';

  Assert.AreEqual('<?xml version="1.0" encoding="UTF-8"?>'#13#10'<MyDocument><MyProperty>abc</MyProperty></MyDocument>'#13#10, FSerializer.Serialize(MyClass));

  MyClass.Free;
end;

procedure TBluePrintXMLSerializerTest.WhenTheClassHasTheXMLAttributeMustLoadThisInfoTheTheNodeAsExpected;
begin
  var MyObject := TMyClassWithXMLAttribute.Create;
  MyObject.MyProperty := 'abc';

  Assert.AreEqual('<?xml version="1.0" encoding="UTF-8"?>'#13#10'<Document MyAttribute="MyValue"><MyProperty>abc</MyProperty></Document>'#13#10, FSerializer.Serialize(MyObject));

  MyObject.Free;
end;

procedure TBluePrintXMLSerializerTest.WhenTheParameterHasXMLAttributesThisValueMustBeLoadedInTheXMLAsExpected;
begin
  var RttiContext := TRttiContext.Create;
  var RttiInterface := RttiContext.GetType(TypeInfo(ISOAPService));

  var RttiMethod := RttiInterface.GetMethod('MyMethodWithParamAttribute');
  var SOAPRequest := TSOAPEnvelop.Create(RttiMethod.GetParameters[0], 'abc');

  Assert.AreEqual('<?xml version="1.0" encoding="UTF-8"?>'#13#10'<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://www.w3.org/2003/05/soap-envelope" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"><SOAP-ENV:Body><MyParam MyAttribute="MyValue">abc</MyParam></SOAP-ENV:Body></SOAP-ENV:Envelope>'#13#10,
    FSerializer.Serialize(TValue.From(SOAPRequest)));

  RttiContext.Free;
end;

procedure TBluePrintXMLSerializerTest.WhenThePropertyHasTheNamespaceAttributeMustLoadThisNameSpaceInTheXML;
begin
  var MyClass := TMyClassWithPropertyWithNamespaceAttribute.Create;

  Assert.AreEqual('<?xml version="1.0" encoding="UTF-8"?>'#13#10'<Document><MyProp MyAtt="MyValue"></MyProp></Document>'#13#10, FSerializer.Serialize(MyClass));

  MyClass.Free;
end;

procedure TBluePrintXMLSerializerTest.WhenThePropertyHasTheNodeNameAttributeMustGenerateTheXMLWithTheNameInTheAttribute;
begin
  var MyObject := TMyClassWithNode.Create;
  MyObject.MyProperty := 'abc';

  Assert.AreEqual('<?xml version="1.0" encoding="UTF-8"?>'#13#10'<Document><MyNode>abc</MyNode></Document>'#13#10, FSerializer.Serialize(MyObject));

  MyObject.Free;
end;

procedure TBluePrintXMLSerializerTest.WhenThePropertyHasTheStoredPropertyTheValueMustBeSerializedOnlyIfThisPropertyIsTrue;
begin
  var MyObject := TMyClassWithStoredProperty.Create;
  MyObject.MyProperty := 123;

  Assert.AreEqual('<?xml version="1.0" encoding="UTF-8"?>'#13#10'<Document/>'#13#10, FSerializer.Serialize(MyObject));

  MyObject.Free;
end;

procedure TBluePrintXMLSerializerTest.WhenTheRecordFieldHaveTheNodeNameAttributeMustSerializeTheRecordAsExpected;
begin
  var MyRecord: TMyRecordWithAttribute;
  MyRecord.MyField := 'abc';

  Assert.AreEqual('<?xml version="1.0" encoding="UTF-8"?>'#13#10'<Document><AnotherName>abc</AnotherName></Document>'#13#10, FSerializer.Serialize(TValue.From(MyRecord)));
end;

procedure TBluePrintXMLSerializerTest.WhenTheSOAPParamHasTheNamespaceAttributeMustLoadThisNamespaceInTheXML;
begin
  var RttiContext := TRttiContext.Create;
  var RttiInterface := RttiContext.GetType(TypeInfo(ISOAPService));

  var RttiMethod := RttiInterface.GetMethod('MyMethodWithNamespace');
  var SOAPRequest := TSOAPEnvelop.Create(RttiMethod.GetParameters[0], nil);

  Assert.AreEqual('<?xml version="1.0" encoding="UTF-8"?>'#13#10'<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://www.w3.org/2003/05/soap-envelope" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">'
    + '<SOAP-ENV:Body><MyParam xmlns="MySpace"></MyParam></SOAP-ENV:Body></SOAP-ENV:Envelope>'#13#10, FSerializer.Serialize(TValue.From(SOAPRequest)));

  RttiContext.Free;
end;

end.

