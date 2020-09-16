unit Delphi.Rest.JSON.Serializer;

interface

uses System.Rtti, System.TypInfo,
  {$IFDEF DCC}
  System.JSON.Serializers, System.Classes, System.JSON.Readers
  {$ELSE}
  JSON.Serializers.Pas2Js
  {$ENDIF}
  ;

type
  TRestJsonSerializer = class
  public
    function Serialize(const AValue: TValue): String; inline;
    function Deserialize(const AJson: String; TypeInfo: PTypeInfo): TValue; inline;
  end;

  {$IFDEF DCC}
  TJsonSerializerHelper = class helper for TJsonSerializer
    function Deserialize(const AJson: String; TypeInfo: PTypeInfo): TValue; overload;
  end;
  {$ENDIF}

implementation

{ TRestJsonSerializer }

function TRestJsonSerializer.Deserialize(const AJson: String; TypeInfo: PTypeInfo): TValue;
var
  Serializer: TJsonSerializer;

begin
  Serializer := TJsonSerializer.Create;

  Result := Serializer.Deserialize(AJson, TypeInfo);

  Serializer.Free;
end;

function TRestJsonSerializer.Serialize(const AValue: TValue): String;
var
  Serializer: TJsonSerializer;

begin
  Serializer := TJsonSerializer.Create;

  Result := Serializer.Serialize(AValue);

  Serializer.Free;
end;

{$IFDEF DCC}
{ TJsonSerializerHelper }

function TJsonSerializerHelper.Deserialize(const AJson: String; TypeInfo: PTypeInfo): TValue;
var
  LStringReader: TStringReader;

  LJsonReader: TJsonTextReader;
begin
  LStringReader := TStringReader.Create(AJson);
  try
    LJsonReader := TJsonTextReader.Create(LStringReader);
    LJsonReader.DateTimeZoneHandling := DateTimeZoneHandling;
    LJsonReader.DateParseHandling := DateParseHandling;
    LJsonReader.MaxDepth := MaxDepth;
    try
      Result := InternalDeserialize(LJsonReader, TypeInfo);
    finally
      LJsonReader.Free;
    end;
  finally
    LStringReader.Free;
  end;
end;
{$ENDIF}

end.

