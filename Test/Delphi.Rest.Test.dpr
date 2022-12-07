program Delphi.Rest.Test;

{$STRONGLINKTYPES ON}

uses
  FastMM5 in '..\Externals\FastMM5\FastMM5.pas',
  System.SysUtils,
  TestInsight.DUnitX,
  DUnitX.TestFramework,
  DUnitX.MemoryLeakMonitor.FastMM5,
  Delphi.Rest.Server.Service in '..\Delphi.Rest.Server.Service.pas',
  Delphi.Rest.Server.Service.Test in 'Delphi.Rest.Server.Service.Test.pas',
  Delphi.Rest.Remote.Service in '..\Delphi.Rest.Remote.Service.pas',
  Delphi.Rest.Remote.Service.Test in 'Delphi.Rest.Remote.Service.Test.pas',
  Delphi.Rest.Types in '..\Delphi.Rest.Types.pas',
  Delphi.Rest.Types.Test in 'Delphi.Rest.Types.Test.pas',
  Delphi.Rest.Content.Parser.Test in 'Delphi.Rest.Content.Parser.Test.pas',
  Delphi.Rest.Request.Mock in 'Delphi.Rest.Request.Mock.pas',
  Delphi.Rest.Service.Container in '..\Delphi.Rest.Service.Container.pas',
  Delphi.Rest.JSON.Serializer.Intf in '..\Delphi.Rest.JSON.Serializer.Intf.pas',
  Delphi.Rest.JSON.Serializer in '..\Delphi.Rest.JSON.Serializer.pas',
  Delphi.Rest.Content.Parser in '..\Delphi.Rest.Content.Parser.pas',
  Delphi.Rest.Exceptions in '..\Delphi.Rest.Exceptions.pas';

begin
  FastMM_OutputDebugStringEvents := [];
  FastMM_LogToFileEvents := [mmetUnexpectedMemoryLeakSummary, mmetUnexpectedMemoryLeakDetail];
  FastMM_MessageBoxEvents := [];

  FastMM_DeleteEventLogFile;

  FastMM_EnterDebugMode;

  TestInsight.DUnitX.RunRegisteredTests;
end.
