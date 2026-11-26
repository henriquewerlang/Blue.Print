unit Blue.Print.JSON.Converter;

interface

uses System.Rtti, System.Classes, System.SysUtils, Blue.Print.Serializer;

type
  EInvalidValue = class(Exception)
  public
    constructor Create;
  end;

  TBluePrintJSONConverter = class(TInterfacedObject, IBluePrintConverter)
  private
    function AppendProperty(const SerializedObject: TValue; const RttiProperty: TRttiProperty; const FieldName: String): TValue;
    function CreateArray: TValue;
    function CreateMainObject(const RttiType: TRttiType): TValue;
    function CreateObject(const RttiType: TRttiType): TValue;
    function CreateValue(const Value: TValue): TValue;
    function SaveToStream(const SerializedObject: TValue): TStream;

    procedure AppendArrayItem(const SerializedArray, ArrayItem: TValue);
    procedure LoadPropertyValue(const SerializedProperty, SerializedValue: TValue);
  end;

implementation

uses System.JSON;

{ TBluePrintJSONConverter }

procedure TBluePrintJSONConverter.AppendArrayItem(const SerializedArray, ArrayItem: TValue);
begin
  SerializedArray.AsType<TJSONArray>.AddElement(ArrayItem.AsType<TJSONValue>);
end;

function TBluePrintJSONConverter.AppendProperty(const SerializedObject: TValue; const RttiProperty: TRttiProperty; const FieldName: String): TValue;
begin
  var JSONObject := SerializedObject.AsType<TJSONObject>;
  var JSONPair := TJSONPair.Create(FieldName, nil);
  Result := JSONPair;

  JSONObject.AddPair(JSONPair);
end;

function TBluePrintJSONConverter.CreateArray: TValue;
begin
  Result := TJSONArray.Create;
end;

function TBluePrintJSONConverter.CreateMainObject(const RttiType: TRttiType): TValue;
begin

end;

function TBluePrintJSONConverter.CreateObject(const RttiType: TRttiType): TValue;
begin
  Result := TJSONObject.Create;
end;

function TBluePrintJSONConverter.CreateValue(const Value: TValue): TValue;
begin
  case Value.Kind of
    tkString, tkUString, tkChar, tkWChar, tkLString, tkWString: Result := TJSONString.Create(Value.AsString);
    tkInteger: Result := TJSONNumber.Create(Value.AsInteger);
    tkInt64: Result := TJSONNumber.Create(Value.AsInt64);
    tkFloat: Result := TJSONNumber.Create(Value.AsExtended);
    else raise EInvalidValue.Create;
  end;
end;

procedure TBluePrintJSONConverter.LoadPropertyValue(const SerializedProperty, SerializedValue: TValue);
begin
  SerializedProperty.AsType<TJSONPair>.JsonValue := SerializedValue.AsType<TJSONValue>;
end;

function TBluePrintJSONConverter.SaveToStream(const SerializedObject: TValue): TStream;
begin
  Result := TStringStream.Create(SerializedObject.AsType<TJSONValue>.ToString);
end;

{ EInvalidValue }

constructor EInvalidValue.Create;
begin
  inherited Create('Invalid value for convertion!');
end;

end.
