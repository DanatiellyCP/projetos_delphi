object FrmConfiguraAlias: TFrmConfiguraAlias
  Left = 533
  Top = 125
  AutoScroll = False
  BorderIcons = [biSystemMenu]
  Caption = 'Configurar Alias '
  ClientHeight = 411
  ClientWidth = 270
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox3: TGroupBox
    Left = 7
    Top = 6
    Width = 257
    Height = 399
    Caption = 'Configurar Conex'#227'o com Banco '
    TabOrder = 0
    object GroupBox4: TGroupBox
      Left = 8
      Top = 17
      Width = 233
      Height = 92
      Caption = 'BDE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Label6: TLabel
        Left = 5
        Top = 16
        Width = 62
        Height = 13
        Caption = 'Nome Banco'
      end
      object EditAliasBDE: TEdit
        Left = 6
        Top = 34
        Width = 220
        Height = 21
        TabOrder = 0
      end
    end
    object GroupBox5: TGroupBox
      Left = 8
      Top = 146
      Width = 233
      Height = 235
      Caption = 'MySQL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object Label7: TLabel
        Left = 5
        Top = 16
        Width = 62
        Height = 13
        Caption = 'Nome Banco'
      end
      object Label8: TLabel
        Left = 5
        Top = 64
        Width = 22
        Height = 13
        Caption = 'Host'
      end
      object Label9: TLabel
        Left = 5
        Top = 160
        Width = 31
        Height = 13
        Caption = 'Senha'
      end
      object Label10: TLabel
        Left = 5
        Top = 112
        Width = 36
        Height = 13
        Caption = 'Usu'#225'rio'
      end
      object EditNomeBancoMy: TEdit
        Left = 5
        Top = 32
        Width = 220
        Height = 21
        TabOrder = 0
      end
      object EditHost: TEdit
        Left = 5
        Top = 80
        Width = 220
        Height = 21
        TabOrder = 1
      end
      object EditPass: TEdit
        Left = 5
        Top = 176
        Width = 220
        Height = 21
        TabOrder = 3
      end
      object EditUser: TEdit
        Left = 5
        Top = 128
        Width = 220
        Height = 21
        TabOrder = 2
      end
    end
    object BtnConectarMy: TButton
      Left = 35
      Top = 348
      Width = 178
      Height = 25
      Caption = 'Conectar MySql'
      TabOrder = 3
      OnClick = BtnConectarMyClick
    end
    object BtnConectarBDE: TButton
      Left = 35
      Top = 75
      Width = 178
      Height = 25
      Caption = 'Conectar BDE'
      TabOrder = 1
      OnClick = BtnConectarBDEClick
    end
  end
end
