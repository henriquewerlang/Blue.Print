unit Blue.Print.Serializer.Test;

interface

uses System.Rtti, Test.Insight.Framework, Blue.Print.Types, Blue.Print.Serializer;

type
  TMyEnum = (MyValue, MyValue2);

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
    procedure WhenTheMethodHasXMLAttributesThisValueMustBeLoadedInTheXMLAsExpected;
    [Test]
    procedure WhenTheParameterHasXMLAttributesThisValueMustBeLoadedInTheXMLAsExpected;
  end;

  TMyObject = class
  private
    FMyProp1: String;
    FMyProp2: Integer;
    FMyProp3: Double;
    FMyProp4: TMyEnum;
  public
    property MyProp1: String read FMyProp1 write FMyProp1;
    property MyProp2: Integer read FMyProp2 write FMyProp2;
    property MyProp3: Double read FMyProp3 write FMyProp3;
    property MyProp4: TMyEnum read FMyProp4 write FMyProp4;
  end;

  TMyClassWithNode = class
  private
    FMyProperty: String;
  public
    [NodeName('MyNode')]
    property MyProperty: String read FMyProperty write FMyProperty;
  end;

  [NodeName('MyDocument')]
  TMyClassWithNodeNameAttribute = class
  private
    FMyProperty: String;
  public
    property MyProperty: String read FMyProperty write FMyProperty;
  end;

  [XMLAttribute('MyAttribute', 'MyValue')]
  TMyClassWithXMLAttribute = class
  private
    FMyProperty: String;
  public
    property MyProperty: String read FMyProperty write FMyProperty;
  end;

  TMyObjectParent = class
  private
    FMyObject: TMyObject;
  public
    property MyObject: TMyObject read FMyObject write FMyObject;
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
  public
    property Value: TValue read FValue write FValue;
  end;

  ISOAPService = interface(IInvokable)
    ['{BBBBC6F3-1730-40F4-A1B1-CC7CA6F08F5D}']
    procedure MyMethod(const MyParam: Integer);
    [XMLAttribute('MyAttribute', 'MyValue')]
    procedure MyMethodWithAttribute(const MyParam: Integer);
    procedure MyMethodWithParamAttribute([XMLAttribute('MyAttribute', 'MyValue')]const MyParam: Integer);
  end;

implementation

{ TBluePrintSerializerTest }

procedure TBluePrintSerializerTest.WhenDeserializeAnEnumeratorMustReturnTheEnumeratorValueInTheReturnValue;
begin
  var Value := FSerializer.Deserialize('MyValue', TypeInfo(TMyEnum));

  Assert.AreEqual(MyValue, Value.AsType<TMyEnum>);
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

procedure TBluePrintSerializerTest.WhenSerializeAnEnumeretorMustReturnTheNameOfEnumeration;
begin
  var Value := FSerializer.Serialize(TValue.From(MyValue));

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

procedure TBluePrintJsonSerializerTest.Setup;
begin
  FSerializer := TBluePrintJsonSerializer.Create;
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

procedure TBluePrintJsonSerializerTest.WhenDeserializeAClassWithAPropertyWithAnObjectAndTheJSONValueIsNullCantCreateTheObjectProperty;
begin
  var Value := FSerializer.Deserialize('{"MyObject":null}', TypeInfo(TMyObjectParent));

  Assert.IsNil(Value.AsType<TMyObjectParent>.MyObject);

  Value.AsObject.Free;
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
  Assert.AreEqual(MyValue, Value.MyProp4);

  Value.Free;
end;

procedure TBluePrintJsonSerializerTest.WhenDeserializeARecordMustLoadTheRecordsFieldsAsExpected;
begin
  var MyRecord: TMyRecord;

  var Value := FSerializer.Deserialize('{"MyField1":"abc","MyField2":123,"MyField3":123.456,"MyField4":"MyValue2"}', TypeInfo(TMyRecord)).AsType<TMyRecord>;

  Assert.AreEqual('abc', Value.MyField1);
  Assert.AreEqual<Integer>(123, Value.MyField2);
  Assert.AreEqual<Double>(123.456, Value.MyField3);
  Assert.AreEqual(MyValue2, Value.MyField4);
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

  Assert.AreEqual('{"MyObject":null}', Value);

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

procedure TBluePrintJsonSerializerTest.WhenSerializeARecordMustGenerateTheJSONAsExpected;
begin
  var MyRecord: TMyRecord;
  MyRecord.MyField1 := 'abc';
  MyRecord.MyField2 := 123;
  MyRecord.MyField3 := 123.456;
  MyRecord.MyField4 := MyValue;
  var Value := FSerializer.Serialize(TValue.From(MyRecord));

  Assert.AreEqual('{"MyField1":"abc","MyField2":123,"MyField3":123.456,"MyField4":"MyValue"}', Value);
end;

procedure TBluePrintJsonSerializerTest.WhenTheValueTypeIsATValueRecordMustSerializeThenInternalValueOfThisType;
begin
  var MyObject := TMyTValueClass.Create;
  MyObject.Value := 'abc';

  var Value := FSerializer.Serialize(MyObject);

  Assert.AreEqual('{"Value":"abc"}', Value);
end;

{ TBluePrintXMLSerializerTest }

procedure TBluePrintXMLSerializerTest.Setup;
begin
  FSerializer := TBluePrintXMLSerializer.Create;
end;

procedure TBluePrintXMLSerializerTest.WhenDeserializeAnObjectMustLoadThePropertiesAsExpected;
begin
  var Value := FSerializer.Deserialize('<Document><MyProp1>abc</MyProp1><MyProp2>123</MyProp2><MyProp3>123.456</MyProp3><MyProp4>MyValue2</MyProp4></Document>', TypeInfo(TMyObject)).AsType<TMyObject>;

  Assert.IsNotNil(Value);
  Assert.AreEqual('abc', Value.MyProp1);
  Assert.AreEqual<Integer>(123, Value.MyProp2);
  Assert.AreEqual<Double>(123.456, Value.MyProp3);
  Assert.AreEqual(MyValue2, Value.MyProp4);

  Value.Free;
end;

procedure TBluePrintXMLSerializerTest.WhenDeserializeASOAPObjectMustLoadTheObjectAsExpected;
begin
  var Value := FSerializer.Deserialize(
    '<?xml version="1.0"?>'#13#10'<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"><soap:Body><Document><MyProp1>abc</MyProp1><MyProp2>123</MyProp2><MyProp3>123.456</MyProp3><MyProp4>MyValue2</MyProp4></Document></soap:Body></soap:Envelope>',
    TypeInfo(TMyObject)).AsType<TMyObject>;

  Assert.IsNotNil(Value);
  Assert.AreEqual('abc', Value.MyProp1);
  Assert.AreEqual<Integer>(123, Value.MyProp2);
  Assert.AreEqual<Double>(123.456, Value.MyProp3);
  Assert.AreEqual(MyValue2, Value.MyProp4);

  Value.Free;
end;

procedure TBluePrintXMLSerializerTest.WhenSerializarAnObjectMustGenerateTheXMLAsExpected;
begin
  var MyObject := TMyObject.Create;
  MyObject.MyProp1 := 'abc';
  MyObject.MyProp2 := 123;
  MyObject.MyProp3 := 123.456;
  var Value := FSerializer.Serialize(MyObject);

  Assert.AreEqual('<?xml version="1.0"?>'#13#10'<Document><MyProp1>abc</MyProp1><MyProp2>123</MyProp2><MyProp3>123.456</MyProp3><MyProp4>MyValue</MyProp4></Document>'#13#10, Value);

  MyObject.Free;
end;

procedure TBluePrintXMLSerializerTest.WhenSerializeAnObjectWithAnotherObjectMustGenerateTheXMLAsExpected;
begin
  var MyObject := TMyObjectParent.Create;
  MyObject.MyObject := TMyObject.Create;

  Assert.AreEqual('<?xml version="1.0"?>'#13#10'<Document><MyObject><MyProp1></MyProp1><MyProp2>0</MyProp2><MyProp3>0</MyProp3><MyProp4>MyValue</MyProp4></MyObject></Document>'#13#10, FSerializer.Serialize(MyObject));

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

  Assert.AreEqual('<?xml version="1.0"?>'#13#10'<Document><MyField1>abc</MyField1><MyField2>123</MyField2><MyField3>123.456</MyField3><MyField4>MyValue</MyField4></Document>'#13#10, Value);
end;

procedure TBluePrintXMLSerializerTest.WhenSerializeASOAPBodyTheDocumentNameMustBeTheNameOfTheSOAPBodyType;
begin
  var RttiContext := TRttiContext.Create;
  var RttiInterface := RttiContext.GetType(TypeInfo(ISOAPService));

  var RttiMethod := RttiInterface.GetMethod('MyMethod');
  var SOAPRequest := TSOAPEnvelop.Create(RttiMethod, RttiMethod.GetParameters[0], 'abc');

  Assert.AreEqual('<?xml version="1.0"?>'#13#10'<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"><SOAP-ENV:Body><MyMethod><MyParam>abc</MyParam></MyMethod></SOAP-ENV:Body></SOAP-ENV:Envelope>'#13#10,
    FSerializer.Serialize(TValue.From(SOAPRequest)));
end;

procedure TBluePrintXMLSerializerTest.WhenSerializeATValueRecordMustSerializeTheValueFromTheRecord;
begin
  var Value: TValue := 'abc';

  Assert.AreEqual('<?xml version="1.0"?>'#13#10'<Document>abc</Document>'#13#10, FSerializer.Serialize(TValue.From(Value)));
end;

procedure TBluePrintXMLSerializerTest.WhenTheClassHasTheNodeNameAttributeTheDocumentMustBeChangedToTheNameInTheAttribute;
begin
  var MyClass := TMyClassWithNodeNameAttribute.Create;
  MyClass.MyProperty := 'abc';

  Assert.AreEqual('<?xml version="1.0"?>'#13#10'<MyDocument><MyProperty>abc</MyProperty></MyDocument>'#13#10, FSerializer.Serialize(MyClass));
end;

procedure TBluePrintXMLSerializerTest.WhenTheClassHasTheXMLAttributeMustLoadThisInfoTheTheNodeAsExpected;
begin
  var MyObject := TMyClassWithXMLAttribute.Create;
  MyObject.MyProperty := 'abc';

  Assert.AreEqual('<?xml version="1.0"?>'#13#10'<Document MyAttribute="MyValue"><MyProperty>abc</MyProperty></Document>'#13#10, FSerializer.Serialize(MyObject));
end;

procedure TBluePrintXMLSerializerTest.WhenTheMethodHasXMLAttributesThisValueMustBeLoadedInTheXMLAsExpected;
begin
  var RttiContext := TRttiContext.Create;
  var RttiInterface := RttiContext.GetType(TypeInfo(ISOAPService));

  var RttiMethod := RttiInterface.GetMethod('MyMethodWithAttribute');
  var SOAPRequest := TSOAPEnvelop.Create(RttiMethod, RttiMethod.GetParameters[0], 'abc');

  Assert.AreEqual('<?xml version="1.0"?>'#13#10'<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"><SOAP-ENV:Body><MyMethodWithAttribute MyAttribute="MyValue"><MyParam>abc</MyParam></MyMethodWithAttribute></SOAP-ENV:Body></SOAP-ENV:Envelope>'#13#10,
    FSerializer.Serialize(TValue.From(SOAPRequest)));
end;

procedure TBluePrintXMLSerializerTest.WhenTheParameterHasXMLAttributesThisValueMustBeLoadedInTheXMLAsExpected;
begin
  var RttiContext := TRttiContext.Create;
  var RttiInterface := RttiContext.GetType(TypeInfo(ISOAPService));

  var RttiMethod := RttiInterface.GetMethod('MyMethodWithParamAttribute');
  var SOAPRequest := TSOAPEnvelop.Create(RttiMethod, RttiMethod.GetParameters[0], 'abc');

  Assert.AreEqual('<?xml version="1.0"?>'#13#10'<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"><SOAP-ENV:Body><MyMethodWithParamAttribute><MyParam MyAttribute="MyValue">abc</MyParam></MyMethodWithParamAttribute></SOAP-ENV:Body></SOAP-ENV:Envelope>'#13#10,
    FSerializer.Serialize(TValue.From(SOAPRequest)));
end;

procedure TBluePrintXMLSerializerTest.WhenThePropertyHasTheNodeNameAttributeMustGenerateTheXMLWithTheNameInTheAttribute;
begin
  var MyObject := TMyClassWithNode.Create;
  MyObject.MyProperty := 'abc';

  Assert.AreEqual('<?xml version="1.0"?>'#13#10'<Document><MyNode>abc</MyNode></Document>'#13#10, FSerializer.Serialize(MyObject));
end;

procedure TBluePrintXMLSerializerTest.WhenTheRecordFieldHaveTheNodeNameAttributeMustSerializeTheRecordAsExpected;
begin
  var MyRecord: TMyRecordWithAttribute;
  MyRecord.MyField := 'abc';

  Assert.AreEqual('<?xml version="1.0"?>'#13#10'<Document><AnotherName>abc</AnotherName></Document>'#13#10, FSerializer.Serialize(TValue.From(MyRecord)));
end;

end.

