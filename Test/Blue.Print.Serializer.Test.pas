unit Blue.Print.Serializer.Test;

interface

uses Test.Insight.Framework, Blue.Print.Types;

type
  TMyEnum = (MyValue, MyValue2);

  [TestFixture]
  TBluePrintJsonSerializerTest = class
  private
    FSerializer: IBluePrintSerializer;
  public
    [Setup]
    procedure Setup;
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

implementation

uses System.Rtti, Blue.Print.Serializer;

{ TBluePrintJsonSerializerTest }

procedure TBluePrintJsonSerializerTest.Setup;
begin
  FSerializer := TBluePrintJsonSerializer.Create;
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

procedure TBluePrintJsonSerializerTest.WhenDeserializeAnEnumeratorMustReturnTheEnumeratorValueInTheReturnValue;
begin
  var Value := FSerializer.Deserialize('MyValue', TypeInfo(TMyEnum));

  Assert.AreEqual(MyValue, Value.AsType<TMyEnum>);
end;

procedure TBluePrintJsonSerializerTest.WhenDeserializeAnIntegerMustReturnTheIntegerValueInTheReturnValue;
begin
  var Value := FSerializer.Deserialize('123', TypeInfo(Integer));

  Assert.AreEqual<Integer>(123, Value.AsInteger);
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

procedure TBluePrintJsonSerializerTest.WhenDeserializeAStringMustReturnTheStringInTheReturnValue;
begin
  var Value := FSerializer.Deserialize('abc', TypeInfo(String));

  Assert.AreEqual('abc', Value.ToString);
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

procedure TBluePrintJsonSerializerTest.WhenSerializeAnEnumeretorMustReturnTheNameOfEnumeration;
begin
  var Value := FSerializer.Serialize(TValue.From(MyValue));

  Assert.AreEqual('MyValue', Value);
end;

procedure TBluePrintJsonSerializerTest.WhenSerializeAnIntegerMustReturnTheValueConvertedInString;
begin
  var Value := FSerializer.Serialize(123);

  Assert.AreEqual('123', Value);
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

procedure TBluePrintJsonSerializerTest.WhenSerializeAStringMustReturnTheStringInTheReturnValue;
begin
  var Value := FSerializer.Serialize('abc');

  Assert.AreEqual('abc', Value);
end;

end.

