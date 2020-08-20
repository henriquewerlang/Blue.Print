unit Delphi.Rest.Server.Service.Component;

interface

uses System.Classes, Web.HTTPApp;

type
  TRestServerService = class(TComponent, IGetWebAppServices, IWebAppServices)
  private
    // IGetWebAppServices
    function GetWebAppServices: IWebAppServices;

    // IWebAppServices
    function GetActive: Boolean;
    function GetExceptionHandler: TObject;
    function HandleRequest: Boolean;

    procedure FinishContext;
    procedure InitContext(WebModule: TComponent; Request: TWebRequest; Response: TWebResponse);
  end;

implementation

{ TRestServerService }

procedure TRestServerService.FinishContext;
begin

end;

function TRestServerService.GetActive: Boolean;
begin
  Result := False;
end;

function TRestServerService.GetExceptionHandler: TObject;
begin
  Result := nil;
end;

function TRestServerService.GetWebAppServices: IWebAppServices;
begin
  Result := Self;
end;

function TRestServerService.HandleRequest: Boolean;
begin
  Result := False;
end;

procedure TRestServerService.InitContext(WebModule: TComponent; Request: TWebRequest; Response: TWebResponse);
begin

end;

end.
