object FrmConexao: TFrmConexao
  Left = 323
  Top = 180
  Width = 698
  Height = 488
  Caption = 'Conex'#227'o'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox3: TGroupBox
    Left = 22
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
      Font.Color = clBlack
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
      Height = 241
      Caption = 'MySQL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
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
      Left = 30
      Top = 353
      Width = 178
      Height = 25
      Caption = 'Conectar MySql'
      TabOrder = 3
    end
    object BtnConectarBDE: TButton
      Left = 35
      Top = 75
      Width = 178
      Height = 25
      Caption = 'Conectar BDE'
      TabOrder = 1
    end
  end
  object GroupBox1: TGroupBox
    Left = 320
    Top = 6
    Width = 337
    Height = 393
    Caption = 'Conectar Por ALIAS  '
    TabOrder = 1
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
    object Button1: TButton
      Left = 236
      Top = 11
      Width = 59
      Height = 19
      Caption = 'Listar Alias'
      TabOrder = 0
    end
    object ListBox1: TListBox
      Left = 8
      Top = 32
      Width = 297
      Height = 321
      ItemHeight = 13
      TabOrder = 1
    end
    object BtnConectarAlias: TButton
      Left = 232
      Top = 360
      Width = 65
      Height = 25
      Caption = 'Conectar'
      TabOrder = 2
    end
  end
end
