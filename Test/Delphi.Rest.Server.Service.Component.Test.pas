unit Delphi.Rest.Server.Service.Component.Test;

interface

uses DUnitX.TestFramework;

type
  [TestFixture]
  TRestServerServiceTest = class
  public
//    [Test]
    procedure IfThePathNotFoundMustReturnStatusCode404;
  end;

implementation

uses Delphi.Rest.Server.Service.Component, Web.HTTPApp, Delphi.Mock;

{ TRestServerServiceTest }

procedure TRestServerServiceTest.IfThePathNotFoundMustReturnStatusCode404;
begin
//  var Rest := TRestServerService.Create(nil) as IWebAppServices;
//  var Request := TMock.CreateClass<TWebRequest>.Setup.Instance;
//  var Response := TMock.CreateClass<TWebResponse>.Setup.Instance;
//
//  Rest.InitContext(nil, Request, Response);
end;

end.
