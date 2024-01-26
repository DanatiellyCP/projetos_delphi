object FrmPrincipal: TFrmPrincipal
  Left = 519
  Top = 180
  Width = 369
  Height = 325
  Caption = 'Senha Segura Delphi'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 176
    Width = 90
    Height = 13
    Caption = 'Senha Informada:  '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 104
    Width = 329
    Height = 25
    Caption = 'Retorno:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button1: TButton
    Left = 48
    Top = 23
    Width = 249
    Height = 41
    Caption = 'Cadastrar Senha'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 8
    Top = 192
    Width = 331
    Height = 33
    BorderStyle = bsNone
    ReadOnly = True
    TabOrder = 1
  end
end
