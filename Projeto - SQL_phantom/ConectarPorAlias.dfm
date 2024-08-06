object FrmConectarAlias: TFrmConectarAlias
  Left = 420
  Top = 147
  AutoScroll = False
  BorderIcons = [biSystemMenu]
  Caption = 'Conectar Banco Por Alias'
  ClientHeight = 381
  ClientWidth = 503
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 9
    Top = 15
    Width = 99
    Height = 16
    Caption = 'Lista de Alias:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ListBox1: TListBox
    Left = 8
    Top = 32
    Width = 297
    Height = 341
    ItemHeight = 13
    TabOrder = 0
  end
  object Button1: TButton
    Left = 197
    Top = 4
    Width = 99
    Height = 23
    Caption = 'Listar Alias'
    TabOrder = 1
    OnClick = Button1Click
  end
  object BtnConectarAlias: TButton
    Left = 320
    Top = 346
    Width = 177
    Height = 25
    Caption = 'Conectar'
    TabOrder = 2
    OnClick = BtnConectarAliasClick
  end
end
