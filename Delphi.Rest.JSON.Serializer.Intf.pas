unit Delphi.Rest.JSON.Serializer.Intf;

interface

uses System.Rtti, System.TypInfo;

type
  IRestJsonSerializer = interface
    ['{5848116B-902F-4FF8-BE8F-D53F586C400E}']
    function Deserialize(const AJson: String; TypeInfo: PTypeInfo): TValue;
    function Serialize(const AValue: TValue): String;
  end;

implementation

end.

