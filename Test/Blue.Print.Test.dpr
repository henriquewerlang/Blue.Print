program Blue.Print.Test;

{$STRONGLINKTYPES ON}

uses
  FastMM5 in '..\Externals\FastMM5\FastMM5.pas',
  System.SysUtils,
  TestInsight.DUnitX,
  DUnitX.TestFramework,
  DUnitX.MemoryLeakMonitor.FastMM5,
  Blue.Print.Server.Service in '..\Blue.Print.Server.Service.pas',
  Blue.Print.Server.Service.Test in 'Blue.Print.Server.Service.Test.pas',
  Blue.Print.Remote.Service in '..\Blue.Print.Remote.Service.pas',
  Blue.Print.Remote.Service.Test in 'Blue.Print.Remote.Service.Test.pas',
  Blue.Print.Types in '..\Blue.Print.Types.pas',
  Blue.Print.Types.Test in 'Blue.Print.Types.Test.pas',
  Blue.Print.Content.Parser.Test in 'Blue.Print.Content.Parser.Test.pas',
  Blue.Print.Request.Mock in 'Blue.Print.Request.Mock.pas',
  Blue.Print.Service.Container in '..\Blue.Print.Service.Container.pas',
  Blue.Print.Serializer in '..\Blue.Print.Serializer.pas';

begin
  FastMM_OutputDebugStringEvents := [];
  FastMM_LogToFileEvents := [mmetUnexpectedMemoryLeakSummary, mmetUnexpectedMemoryLeakDetail];
  FastMM_MessageBoxEvents := [];

  FastMM_DeleteEventLogFile;

  FastMM_EnterDebugMode;

  TestInsight.DUnitX.RunRegisteredTests;
end.
