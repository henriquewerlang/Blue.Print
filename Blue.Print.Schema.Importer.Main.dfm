object Main: TMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'XSD Importer'
  ClientHeight = 191
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
    Top = 58
    Width = 66
    Height = 15
    Caption = 'Schema File:'
  end
  object lblConfigurationFile: TLabel
    Left = 8
    Top = 8
    Width = 98
    Height = 15
    Caption = 'Configuration File:'
  end
  object lblOutputFolder: TLabel
    Left = 8
    Top = 108
    Width = 41
    Height = 15
    Caption = 'Output:'
  end
  object SchemaFileName: TEdit
    Left = 8
    Top = 79
    Width = 393
    Height = 23
    TabOrder = 2
    TextHint = 'Schema file name'
  end
  object SelectSchemaFile: TButton
    Left = 407
    Top = 79
    Width = 26
    Height = 23
    Caption = '...'
    TabOrder = 3
    OnClick = SelectSchemaFileClick
  end
  object GenerateFiles: TButton
    Left = 8
    Top = 158
    Width = 75
    Height = 25
    Caption = 'Generate'
    Default = True
    TabOrder = 6
    OnClick = GenerateFilesClick
  end
  object ConfigurationFile: TEdit
    Left = 8
    Top = 29
    Width = 393
    Height = 23
    TabOrder = 0
    TextHint = 'Configuration file name'
  end
  object SelectConfigurationFile: TButton
    Left = 407
    Top = 29
    Width = 26
    Height = 23
    Caption = '...'
    TabOrder = 1
    OnClick = SelectConfigurationFileClick
  end
  object OutputFolder: TEdit
    Left = 8
    Top = 129
    Width = 393
    Height = 23
    TabOrder = 4
    TextHint = 'Output unit folder'
  end
  object SelectOutputFolder: TButton
    Left = 407
    Top = 128
    Width = 26
    Height = 25
    Caption = '...'
    TabOrder = 5
    OnClick = SelectOutputFolderClick
  end
  object OpenSchemaFile: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <
      item
        DisplayName = 'Schema file'
        FileMask = '*.xsd'
      end>
    Options = [fdoPathMustExist, fdoFileMustExist]
    Left = 40
    Top = 16
  end
  object OpenConfigurationFile: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <
      item
        DisplayName = 'Configuration File'
        FileMask = '*.json'
      end>
    Options = [fdoPathMustExist, fdoFileMustExist]
    Left = 168
    Top = 16
  end
  object OpenOutputFolder: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = [fdoPickFolders, fdoPathMustExist]
    Left = 296
    Top = 16
  end
end
