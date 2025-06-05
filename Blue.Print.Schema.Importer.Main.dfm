object Main: TMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'XSD Importer'
  ClientHeight = 95
  ClientWidth = 442
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object lblConfigurationFile: TLabel
    Left = 8
    Top = 8
    Width = 98
    Height = 15
    Caption = 'Configuration File:'
  end
  object ImportSchema: TButton
    Left = 8
    Top = 58
    Width = 73
    Height = 25
    Caption = 'Import'
    Default = True
    TabOrder = 2
    OnClick = ImportSchemaClick
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
  object OpenConfigurationFile: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <
      item
        DisplayName = 'Configuration File'
        FileMask = '*.json'
      end>
    Options = [fdoPathMustExist, fdoFileMustExist]
    Left = 296
    Top = 16
  end
end
