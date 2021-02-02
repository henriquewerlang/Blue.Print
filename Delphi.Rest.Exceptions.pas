unit Delphi.Rest.Exceptions;

interface

uses System.SysUtils;

type
  EHTTPStatusError = class(Exception)
  private
    FStatusCode: Integer;
    FContent: String;
  public
    constructor Create(const StatusCode: Integer; const Content: String);

    property Content: String read FContent;
    property StatusCode: Integer read FStatusCode;
  end;

implementation

{ EHTTPStatusError }

constructor EHTTPStatusError.Create(const StatusCode: Integer; const Content: String);
begin
  inherited CreateFmt('HTTP Error %d', [StatusCode]);

  FContent := Content;
  FStatusCode := StatusCode;
end;

end.
