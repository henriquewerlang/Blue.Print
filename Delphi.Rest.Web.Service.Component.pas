unit Delphi.Rest.Web.Service.Component;

interface

uses System.Classes, Web.HTTPApp;

type
  TRestWebService = class(TComponent, IGetWebAppServices, IWebAppServices)
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

{ TRestWebService }

procedure TRestWebService.FinishContext;
begin

end;

function TRestWebService.GetActive: Boolean;
begin
  Result := False;
end;

function TRestWebService.GetExceptionHandler: TObject;
begin
  Result := nil;
end;

function TRestWebService.GetWebAppServices: IWebAppServices;
begin
  Result := Self;
end;

function TRestWebService.HandleRequest: Boolean;
begin
  Result := False;
end;

procedure TRestWebService.InitContext(WebModule: TComponent; Request: TWebRequest; Response: TWebResponse);
begin

end;

end.
