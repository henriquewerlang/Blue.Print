unit Blue.Print.Content.Parser;

interface

uses System.Classes, Web.HTTPApp, Web.ReqFiles;

type
  TImageContentParser = class(TAbstractContentParser)
  private
    FContentFiels: TStrings;
    FFiles: TWebRequestFiles;

    procedure LoadImagem;
  public
    destructor Destroy; override;

    class function CanParse(AWebRequest: TWebRequest): Boolean; override;

    function GetContentFields: TStrings; override;
    function GetFiles: TAbstractWebRequestFiles; override;
  end;

implementation

uses System.SysUtils, Web.ReqMulti;

{ TImageContentParser }

class function TImageContentParser.CanParse(AWebRequest: TWebRequest): Boolean;
begin
  Result := AWebRequest.ContentType.StartsWith('image/');
end;

destructor TImageContentParser.Destroy;
begin
  FFiles.Free;

  FContentFiels.Free;

  inherited;
end;

function TImageContentParser.GetContentFields: TStrings;
begin
  if not Assigned(FContentFiels) then
    FContentFiels := TStringList.Create;

  Result := FContentFiels;
end;

function TImageContentParser.GetFiles: TAbstractWebRequestFiles;
begin
  if not Assigned(FFiles) then
  begin
    FFiles := TWebRequestFiles.Create;

    LoadImagem;
  end;

  Result := FFiles;
end;

procedure TImageContentParser.LoadImagem;
begin
  FFiles.Add(EmptyStr, EmptyStr, EmptyStr, WebRequest.RawContent, WebRequest.ContentLength);
end;

initialization
  RegisterContentParser(TImageContentParser);

end.
