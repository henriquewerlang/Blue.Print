program Delphi.Rest.Test;

{$IFNDEF TESTINSIGHT}
{$APPTYPE CONSOLE}
{$ENDIF}
{$STRONGLINKTYPES ON}
uses
  FastMM5 in '..\Externals\FastMM5\FastMM5.pas',
  System.SysUtils,
  {$IFDEF TESTINSIGHT}
  TestInsight.DUnitX,
  {$ELSE}
  DUnitX.Loggers.Console,
  {$ENDIF }
  DUnitX.TestFramework,
  DUnitX.MemoryLeakMonitor.FastMM5,
  Delphi.Rest.Server.Service.Component in '..\Delphi.Rest.Server.Service.Component.pas',
  Delphi.Rest.Server.Service.Component.Test in 'Delphi.Rest.Server.Service.Component.Test.pas',
  Delphi.Rest.Remote.Service in '..\Delphi.Rest.Remote.Service.pas',
  Delphi.Rest.Remote.Service.Test in 'Delphi.Rest.Remote.Service.Test.pas',
  Delphi.Rest.Types in '..\Delphi.Rest.Types.pas',
  Delphi.Rest.Types.Test in 'Delphi.Rest.Types.Test.pas';

// Para não remover os itens abaixo.
{$IFNDEF TESTINSIGHT}
var
  runner: ITestRunner;
  results: IRunResults;
  logger: ITestLogger;
  nunitLogger : ITestLogger;
{$ENDIF}
begin
  FastMM_OutputDebugStringEvents := [];
  FastMM_LogToFileEvents := [mmetUnexpectedMemoryLeakSummary, mmetUnexpectedMemoryLeakDetail];
  FastMM_MessageBoxEvents := [mmetDebugBlockDoubleFree, mmetDebugBlockReallocOfFreedBlock, mmetVirtualMethodCallOnFreedObject];

  FastMM_DeleteEventLogFile;

{$IFDEF TESTINSIGHT}
  TestInsight.DUnitX.RunRegisteredTests;
{$ELSE}
  try
    //Check command line options, will exit if invalid
    TDUnitX.CheckCommandLine;
    //Create the test runner
    runner := TDUnitX.CreateRunner;
    //Tell the runner to use RTTI to find Fixtures
    runner.UseRTTI := True;
    //When true, Assertions must be made during tests;
    runner.FailsOnNoAsserts := False;

    //tell the runner how we will log things
    //Log to the console window if desired
    if TDUnitX.Options.ConsoleMode <> TDunitXConsoleMode.Off then
    begin
      logger := TDUnitXConsoleLogger.Create(TDUnitX.Options.ConsoleMode = TDunitXConsoleMode.Quiet);
      runner.AddLogger(logger);
    end;
    //Generate an NUnit compatible XML File
    nunitLogger := TDUnitXXMLNUnitFileLogger.Create(TDUnitX.Options.XMLOutputFile);
    runner.AddLogger(nunitLogger);

    //Run tests
    results := runner.Execute;
    if not results.AllPassed then
      System.ExitCode := EXIT_ERRORS;

    {$IFNDEF CI}
    //We don't want this happening when running under CI.
    if TDUnitX.Options.ExitBehavior = TDUnitXExitBehavior.Pause then
    begin
      System.Write('Done.. press <Enter> key to quit.');
      System.Readln;
    end;
    {$ENDIF}
  except
    on E: Exception do
      System.Writeln(E.ClassName, ': ', E.Message);
  end;
{$ENDIF}
end.
