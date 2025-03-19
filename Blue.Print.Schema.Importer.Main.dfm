object Main: TMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'XSD Importer'
  ClientHeight = 89
  ClientWidth = 442
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object lblSchemaFile: TLabel
    Left = 8
    Top = 8
    Width = 66
    Height = 15
    Caption = 'Schema File:'
  end
  object SchemaFileName: TEdit
    Left = 8
    Top = 29
    Width = 393
    Height = 23
    TabOrder = 0
    TextHint = 'Schema file name'
  end
  object SelectSchemaFile: TButton
    Left = 407
    Top = 29
    Width = 26
    Height = 23
    Caption = '...'
    TabOrder = 1
    OnClick = SelectSchemaFileClick
  end
  object GenerateFiles: TButton
    Left = 8
    Top = 58
    Width = 75
    Height = 25
    Caption = 'Generate'
    Default = True
    TabOrder = 2
    OnClick = GenerateFilesClick
  end
  object OpenSchemaFile: TOpenDialog
    Filter = 'Schema file|*.xsd'
    Options = [ofHideReadOnly, ofFileMustExist, ofEnableSizing]
    Left = 280
    Top = 16
  end
end
