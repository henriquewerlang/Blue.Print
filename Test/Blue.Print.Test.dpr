program Blue.Print.Test;

{$STRONGLINKTYPES ON}

uses
  Test.Insight.Framework,
  Blue.Print.Web.Module in '..\Blue.Print.Web.Module.pas',
  Blue.Print.Web.Module.Test in 'Blue.Print.Web.Module.Test.pas',
  Blue.Print.Remote.Service in '..\Blue.Print.Remote.Service.pas',
  Blue.Print.Remote.Service.Test in 'Blue.Print.Remote.Service.Test.pas',
  Blue.Print.Types in '..\Blue.Print.Types.pas',
  Blue.Print.Content.Parser.Test in 'Blue.Print.Content.Parser.Test.pas',
  Blue.Print.Request.Mock in 'Blue.Print.Request.Mock.pas',
  Blue.Print.Serializer in '..\Blue.Print.Serializer.pas',
  Blue.Print.Serializer.Test in 'Blue.Print.Serializer.Test.pas';

begin
  ReportMemoryLeaksOnShutdown := True;

  TTestInsightFramework.ExecuteTests;
end.
