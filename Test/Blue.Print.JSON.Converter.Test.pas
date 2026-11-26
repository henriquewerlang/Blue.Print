unit Blue.Print.JSON.Converter.Test;

interface

uses Test.Insight.Framework, Blue.Print.JSON.Converter, Blue.Print.Serializer;

type
  [TestFixture]
  TBluePrintJSONConverterTest = class
  private
    FConverter: IBluePrintConverter;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure WhenCallTheCreateObjectMustCreateAJSONObject;
    [Test]
    procedure WhenCallTheCreateArrayMustCreateAJSONArray;
    [Test]
    procedure WhenCallTheAppendPropertyMustCreateAJSONPair;
    [Test]
    procedure TheAppendPropertyMustLoadTheFieldNameInTheJSONStringValueFromTheJSONPair;
    [Test]
    procedure TheCreatedPairMustBeAppendedInTheJSONObject;
    [Test]
    procedure WhenLoadThePropertyValueMustLoadThePairValueHasExpected;
    [Test]
    procedure WhenConvertValueUsingAStringMustLoadAJONStringClassWithTheValue;
    [Test]
    procedure WhenConvertValueUsingAnIntegerMustLoadAJSONNumberWitheTheValueLoaded;
    [Test]
    procedure WhenConvertValueUsingAnInteger64MustLoadAJSONNumberWitheTheValueLoaded;
    [Test]
    procedure WhenConvertValueUsingADoubleMustLoadAJSONNumberWitheTheValueLoaded;
    [Test]
    procedure WhenConvertAnInvalidValueMustRaiseAnError;
    [Test]
    procedure WhenAppendAnArrayValueMustLoadTheValueInTheArrayItemsHasExpected;
    [Test]
    procedure WhenLoadTheStreamValueMustLoadTheJSONValueHasExpected;
  end;

implementation

uses System.JSON, System.Rtti, System.SysUtils, System.Classes;

{ TBluePrintJSONConverterTest }

procedure TBluePrintJSONConverterTest.Setup;
begin
  FConverter := TBluePrintJSONConverter.Create;
end;

procedure TBluePrintJSONConverterTest.TearDown;
begin
  FConverter := nil;
end;

procedure TBluePrintJSONConverterTest.TheAppendPropertyMustLoadTheFieldNameInTheJSONStringValueFromTheJSONPair;
begin
  var JSONObject := TJSONObject.Create;
  var Value := FConverter.AppendProperty(JSONObject, nil, 'MyField');

  Assert.IsFalse(Value.IsEmpty);

  Assert.AreEqual('MyField', Value.AsType<TJSONPair>.JsonString.Value);

  JSONObject.Free;
end;

procedure TBluePrintJSONConverterTest.TheCreatedPairMustBeAppendedInTheJSONObject;
begin
  var JSONObject := TJSONObject.Create;

  FConverter.AppendProperty(JSONObject, nil, 'MyField');

  FConverter.AppendProperty(JSONObject, nil, 'MyField2');

  FConverter.AppendProperty(JSONObject, nil, 'MyField3');

  Assert.AreEqual(3, JSONObject.Count);

  JSONObject.Free;
end;

procedure TBluePrintJSONConverterTest.WhenAppendAnArrayValueMustLoadTheValueInTheArrayItemsHasExpected;
begin
  var ArrayValue := FConverter.CreateArray;

  FConverter.AppendArrayItem(ArrayValue, TJSONString.Create('a'));

  FConverter.AppendArrayItem(ArrayValue, TJSONString.Create('b'));

  FConverter.AppendArrayItem(ArrayValue, TJSONString.Create('c'));

  var JSONArray := ArrayValue.AsType<TJSONArray>;

  Assert.AreEqual(3, JSONArray.Count);

  Assert.AreEqual(TJSONString, JSONArray.Items[0].ClassType);

  Assert.AreEqual('a', JSONArray.Items[0].Value);

  Assert.AreEqual('b', JSONArray.Items[1].Value);

  Assert.AreEqual('c', JSONArray.Items[2].Value);

  JSONArray.Free;
end;

procedure TBluePrintJSONConverterTest.WhenCallTheAppendPropertyMustCreateAJSONPair;
begin
  var JSONObject := TJSONObject.Create;
  var Value := FConverter.AppendProperty(JSONObject, nil, 'MyField');

  Assert.IsFalse(Value.IsEmpty);

  Assert.AreEqual(TJSONPair, Value.AsObject.ClassType);

  JSONObject.Free;
end;

procedure TBluePrintJSONConverterTest.WhenCallTheCreateArrayMustCreateAJSONArray;
begin
  var Value := FConverter.CreateArray;

  Assert.IsFalse(Value.IsEmpty);

  Assert.AreEqual(TJSONArray, Value.AsObject.ClassType);

  Value.AsObject.Free;
end;

procedure TBluePrintJSONConverterTest.WhenCallTheCreateObjectMustCreateAJSONObject;
begin
  var Value := FConverter.CreateObject(nil);

  Assert.IsFalse(Value.IsEmpty);

  Assert.AreEqual(TJSONObject, Value.AsObject.ClassType);

  Value.AsObject.Free;
end;

procedure TBluePrintJSONConverterTest.WhenConvertValueUsingAStringMustLoadAJONStringClassWithTheValue;
begin
  var Value := FConverter.CreateValue('My Value');

  Assert.IsFalse(Value.IsEmpty);

  Assert.AreEqual(TJSONString, Value.AsObject.ClassType);

  Assert.AreEqual('My Value', Value.AsType<TJSONString>.Value);

  Value.AsObject.Free;
end;

procedure TBluePrintJSONConverterTest.WhenConvertAnInvalidValueMustRaiseAnError;
begin
  Assert.WillRaise(
    procedure
    begin
      FConverter.CreateValue(Self);
    end, EInvalidValue);
end;

procedure TBluePrintJSONConverterTest.WhenConvertValueUsingADoubleMustLoadAJSONNumberWitheTheValueLoaded;
begin
  var Value := FConverter.CreateValue(1234.5678);

  Assert.IsFalse(Value.IsEmpty);

  Assert.AreEqual(TJSONNumber, Value.AsObject.ClassType);

  Assert.AreEqual(FloatToStr(1234.5678), FloatToStr(Value.AsType<TJSONNumber>.AsDouble));

  Value.AsObject.Free;
end;

procedure TBluePrintJSONConverterTest.WhenConvertValueUsingAnInteger64MustLoadAJSONNumberWitheTheValueLoaded;
begin
  var Value := FConverter.CreateValue(Int64(1234));

  Assert.IsFalse(Value.IsEmpty);

  Assert.AreEqual(TJSONNumber, Value.AsObject.ClassType);

  Assert.AreEqual(1234, Value.AsType<TJSONNumber>.AsInt);

  Value.AsObject.Free;
end;

procedure TBluePrintJSONConverterTest.WhenConvertValueUsingAnIntegerMustLoadAJSONNumberWitheTheValueLoaded;
begin
  var Value := FConverter.CreateValue(1234);

  Assert.IsFalse(Value.IsEmpty);

  Assert.AreEqual(TJSONNumber, Value.AsObject.ClassType);

  Assert.AreEqual(1234, Value.AsType<TJSONNumber>.AsInt);

  Value.AsObject.Free;
end;

procedure TBluePrintJSONConverterTest.WhenLoadThePropertyValueMustLoadThePairValueHasExpected;
begin
  var JSONObject := TJSONObject.Create;

  FConverter.LoadPropertyValue(FConverter.AppendProperty(JSONObject, nil, 'MyField'), TJSONString.Create('Value'));

  Assert.AreEqual('Value', TJSONString(JSONObject.Pairs[0].JsonValue).Value);

  JSONObject.Free;
end;

procedure TBluePrintJSONConverterTest.WhenLoadTheStreamValueMustLoadTheJSONValueHasExpected;
begin
  var JSONObject := FConverter.CreateObject(nil);

  FConverter.LoadPropertyValue(FConverter.AppendProperty(JSONObject, nil, 'Field'), FConverter.CreateValue('abc'));
  FConverter.LoadPropertyValue(FConverter.AppendProperty(JSONObject, nil, 'Field2'), FConverter.CreateValue(123));
  FConverter.LoadPropertyValue(FConverter.AppendProperty(JSONObject, nil, 'Field3'), FConverter.CreateValue(123.456));

  var Stream := FConverter.SaveToStream(JSONObject);

  Assert.IsNotNil(Stream);

  Assert.AreEqual('{"Field":"abc","Field2":123,"Field3":123.456}', (Stream as TStringStream).DataString);

  Stream.Free;

  JSONObject.AsObject.Free
end;

end.
