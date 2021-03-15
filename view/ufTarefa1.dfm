object fTarefa1: TfTarefa1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Tarefa 1'
  ClientHeight = 267
  ClientWidth = 599
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblColunas: TLabel
    Left = 8
    Top = 8
    Width = 38
    Height = 13
    Caption = 'Colunas'
  end
  object lblTabelas: TLabel
    Left = 176
    Top = 8
    Width = 37
    Height = 13
    Caption = 'Tabelas'
  end
  object lblCondicoes: TLabel
    Left = 343
    Top = 8
    Width = 49
    Height = 13
    Caption = 'Condi'#231#245'es'
  end
  object lblSQLGerado: TLabel
    Left = 8
    Top = 136
    Width = 57
    Height = 13
    Caption = 'SQL Gerado'
  end
  object mmoColunas: TMemo
    Left = 8
    Top = 23
    Width = 154
    Height = 94
    TabOrder = 0
  end
  object mmoTabelas: TMemo
    Left = 176
    Top = 23
    Width = 154
    Height = 94
    TabOrder = 1
  end
  object mmoCondicoes: TMemo
    Left = 343
    Top = 23
    Width = 154
    Height = 94
    TabOrder = 2
  end
  object mmoSQLGerado: TMemo
    Left = 8
    Top = 151
    Width = 584
    Height = 110
    TabOrder = 3
  end
  object btnGerarSQL: TButton
    Left = 512
    Top = 56
    Width = 80
    Height = 25
    Caption = 'GerarSQL'
    TabOrder = 4
    OnClick = btnGerarSQLClick
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 288
    Top = 136
  end
  object FDPhysTDataDriverLink1: TFDPhysTDataDriverLink
    Left = 416
    Top = 136
  end
end
