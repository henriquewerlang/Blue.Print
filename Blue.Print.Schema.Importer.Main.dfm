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
  object ImportXSD: TButton
    Left = 8
    Top = 158
    Width = 73
    Height = 25
    Caption = 'Import XSD'
    Default = True
    TabOrder = 6
    OnClick = ImportXSDClick
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
  object ImportJSONSchema: TButton
    Left = 87
    Top = 158
    Width = 121
    Height = 25
    Caption = 'Import JSON Schema'
    Default = True
    TabOrder = 7
    OnClick = ImportJSONSchemaClick
  end
  object ImportOpenAPI: TButton
    Left = 214
    Top = 158
    Width = 107
    Height = 25
    Caption = 'Import Open API'
    Default = True
    TabOrder = 8
    OnClick = ImportOpenAPIClick
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
  object OpenAPI: TPopupMenu
    Left = 392
    Top = 16
    object OpenAPI20: TMenuItem
      Caption = '2.0'
      OnClick = OpenAPI20Click
    end
    object OpenAPI30: TMenuItem
      Caption = '3.0'
      OnClick = OpenAPI30Click
    end
    object OpenAPI31: TMenuItem
      Caption = '3.1'
      OnClick = OpenAPI31Click
    end
  end
end
