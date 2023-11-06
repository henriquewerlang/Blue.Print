unit Blue.Print.Content.Parser.Test;

interface

uses DUnitX.TestFramework;

type
  [TestFixture]
  TImageContentParserTest = class
  public
    [SetupFixture]
    procedure Setup;
    [Test]
    procedure CanParseMustReturnTrueIfTheContentTypeStartWithImage;
    [Test]
    procedure TheContentFieldsMustReturnAnEmptyStringList;
    [Test]
    procedure WhenIsCalledTheGetFilesMustLoadTheFileInTheFilesList;
    [Test]
    procedure WhenGetTheFileMustReturnAFile;
    [Test]
    procedure TheFileMustBeLoadedWithTheContentOfTheImageInTheRequest;
    [Test]
    procedure TheContentOfTheFileMustReturnTheRequestImage;
  end;

implementation

uses System.Classes, System.Rtti, Blue.Print.Server.Service, Blue.Print.Request.Mock, Translucent;

{ TImageContentParserTest }

procedure TImageContentParserTest.CanParseMustReturnTrueIfTheContentTypeStartWithImage;
begin
  var Request := TMock.CreateClass<TWebRequestMock>;

  Request.Setup.WillReturn('image/png').When.GetStringVariable(It.IsEqualTo(CONTENT_TYPE_INDEX));

  Assert.IsTrue(TImageContentParser.CanParse(Request.Instance));

  Request.Free;
end;

procedure TImageContentParserTest.Setup;
begin
  TMock.CreateClass<TWebRequestMock>.Free;
end;

procedure TImageContentParserTest.TheContentFieldsMustReturnAnEmptyStringList;
begin
  var Parser := TImageContentParser.Create(nil);

  Assert.AreNotEqual<Pointer>(nil, Parser.GetContentFields);

  Parser.Free;
end;

procedure TImageContentParserTest.TheContentOfTheFileMustReturnTheRequestImage;
begin
  var ImageFile := TBytesStream.Create;
  var Request := TMock.CreateClass<TWebRequestMock>;

  var Parser := TImageContentParser.Create(Request.Instance);

  ImageFile.LoadFromFile('..\..\..\Resource\Image.png');

  Request.Setup.WillReturn(TValue.From(ImageFile.Bytes)).When.RawContent;

  Request.Setup.WillReturn(ImageFile.Size).When.GetIntegerVariable(It.IsEqualTo(CONTENT_LENGTH_INDEX));

  Assert.AreEqualMemory(ImageFile.Bytes, (Parser.GetFiles[0].Stream as TCustomMemoryStream).Memory, ImageFile.Size);

  Request.Free;

  Parser.Free;

  ImageFile.Free;
end;

procedure TImageContentParserTest.TheFileMustBeLoadedWithTheContentOfTheImageInTheRequest;
begin
  var ImageFile := TBytesStream.Create;
  var Request := TMock.CreateClass<TWebRequestMock>;

  var Parser := TImageContentParser.Create(Request.Instance);

  ImageFile.LoadFromFile('..\..\..\Resource\Image.png');

  Request.Setup.WillReturn(TValue.From(ImageFile.Bytes)).When.RawContent;

  Request.Setup.WillReturn(ImageFile.Size).When.GetIntegerVariable(It.IsEqualTo(CONTENT_LENGTH_INDEX));

  Assert.AreEqual(ImageFile.Size, Parser.GetFiles[0].Stream.Size);

  Request.Free;

  Parser.Free;

  ImageFile.Free;
end;

procedure TImageContentParserTest.WhenGetTheFileMustReturnAFile;
begin
  var Request := TMock.CreateClass<TWebRequestMock>;

  var Parser := TImageContentParser.Create(Request.Instance);

  Request.Setup.WillReturn(nil).When.GetRawContent;

  Request.Setup.WillReturn(0).When.GetIntegerVariable(It.IsEqualTo(CONTENT_LENGTH_INDEX));

  Assert.AreNotEqual<Pointer>(nil, Parser.GetFiles[0]);

  Request.Free;

  Parser.Free;
end;

procedure TImageContentParserTest.WhenIsCalledTheGetFilesMustLoadTheFileInTheFilesList;
begin
  var Request := TMock.CreateClass<TWebRequestMock>;

  var Parser := TImageContentParser.Create(Request.Instance);

  Request.Setup.WillReturn(nil).When.GetRawContent;

  Request.Setup.WillReturn(0).When.GetIntegerVariable(It.IsEqualTo(CONTENT_LENGTH_INDEX));

  Assert.AreEqual(1, Parser.GetFiles.Count);

  Request.Free;

  Parser.Free;
end;

end.

