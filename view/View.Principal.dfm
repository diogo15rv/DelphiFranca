object ViewPrincipal: TViewPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'ProvaDelphiApp - Principal'
  ClientHeight = 564
  ClientWidth = 962
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 912
    Top = 16
    object T1: TMenuItem
      Caption = 'Tarefas'
      object menuTarefa1: TMenuItem
        Caption = 'Tarefa 1'
        OnClick = menuTarefa1Click
      end
      object menuTarefa2: TMenuItem
        Caption = 'Tarefa 2'
        OnClick = menuTarefa2Click
      end
      object menuTarefa3: TMenuItem
        Caption = 'Tarefa 3'
        OnClick = menuTarefa3Click
      end
    end
  end
end
