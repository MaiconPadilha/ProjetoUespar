object F_Principal: TF_Principal
  Left = 0
  Top = 0
  Caption = 'Menu Principal'
  ClientHeight = 435
  ClientWidth = 647
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 272
    Top = 216
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object Estado1: TMenuItem
        Caption = 'Estado'
        OnClick = Estado1Click
      end
      object Cidades1: TMenuItem
        Caption = 'Cidades'
      end
      object Clientes1: TMenuItem
        Caption = 'Clientes'
      end
    end
  end
end
