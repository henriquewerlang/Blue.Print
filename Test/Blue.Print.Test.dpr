program Blue.Print.Test;

{$STRONGLINKTYPES ON}

uses
  Test.Insight.Framework,
  Blue.Print.Types in '..\Blue.Print.Types.pas',
  Blue.Print.Web.Module.Test in 'Blue.Print.Web.Module.Test.pas',
  Blue.Print.Web.Module in '..\Blue.Print.Web.Module.pas',
  Blue.Print.Remote.Service.Test in 'Blue.Print.Remote.Service.Test.pas',
  Blue.Print.Remote.Service in '..\Blue.Print.Remote.Service.pas',
  Blue.Print.Content.Parser.Test in 'Blue.Print.Content.Parser.Test.pas',
  Blue.Print.Request.Mock in 'Blue.Print.Request.Mock.pas',
  Blue.Print.Serializer.Test in 'Blue.Print.Serializer.Test.pas',
  Blue.Print.Serializer in '..\Blue.Print.Serializer.pas',
  Blue.Print.Schema.Importer.Test in 'Blue.Print.Schema.Importer.Test.pas',
  Blue.Print.Schema.Importer in '..\Blue.Print.Schema.Importer.pas',
  Blue.Print.OpenAPI20.Schema.Converter in '..\Blue.Print.OpenAPI20.Schema.Converter.pas',
  Blue.Print.OpenAPI30.Schema.Converter in '..\Blue.Print.OpenAPI30.Schema.Converter.pas',
  Blue.Print.OpenAPI31.Schema.Converter in '..\Blue.Print.OpenAPI31.Schema.Converter.pas',
  Blue.Print.OpenAPI32.Schema.Converter in '..\Blue.Print.OpenAPI32.Schema.Converter.pas',
  Blue.Print.XSD.Schema.Converter in '..\Blue.Print.XSD.Schema.Converter.pas',
  Blue.Print.WSDL.Schema.Converter in '..\Blue.Print.WSDL.Schema.Converter.pas';

begin
  ReportMemoryLeaksOnShutdown := True;

  TTestInsightFramework.ExecuteTests;
end.
