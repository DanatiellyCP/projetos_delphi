object FrmUpdateGeral: TFrmUpdateGeral
  Left = 190
  Top = 126
  Width = 924
  Height = 473
  BorderIcons = [biSystemMenu]
  Caption = 'Update Geral'
  Color = clCream
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox2: TGroupBox
    Left = 16
    Top = 8
    Width = 885
    Height = 412
    Align = alCustom
    Caption = 'SQL'
    TabOrder = 0
    object Label6: TLabel
      Left = 4
      Top = 43
      Width = 129
      Height = 16
      Caption = 'Informa'#231#245'es Arquivo: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object LblInfoArq: TLabel
      Left = 210
      Top = 41
      Width = 112
      Height = 16
      Caption = '----------------------------'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 8
      Top = 299
      Width = 18
      Height = 16
      Caption = 'De'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 127
      Top = 298
      Width = 20
      Height = 16
      Caption = 'At'#233
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 323
      Top = 348
      Width = 81
      Height = 16
      Caption = 'Rodando ...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LblRodando: TLabel
      Left = 410
      Top = 348
      Width = 25
      Height = 16
      Caption = '000'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label13: TLabel
      Left = 2
      Top = 350
      Width = 126
      Height = 16
      Caption = 'Tamanho do Lote:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LblQtd: TLabel
      Left = 138
      Top = 350
      Width = 25
      Height = 16
      Caption = '000'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 594
      Top = 11
      Width = 26
      Height = 16
      Caption = 'Log:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object BtnUpdate: TBtnPimary
      Left = 478
      Top = 273
      Width = 105
      Height = 24
      Caption = 'Updates'
      Color = 16744448
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -13
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      ParentFont = False
      OnClick = BtnUpdateClick
      CorHover = clGrayText
      CorPadrao = 16744448
      FontePadrao = 'MS Sans Serif'
    end
    object BtnLimpar: TBtnLight
      Left = 478
      Top = 306
      Width = 105
      Height = 24
      Caption = 'Limpar'
      Color = 15987699
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -13
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      ParentFont = False
      OnClick = BtnLimparClick
      CorHover = clGrayText
      CorPadrao = 15987699
    end
    object BtnArq: TBtnSuccess
      Left = 7
      Top = 15
      Width = 171
      Height = 22
      Caption = 'Carregar Arquivo Querys'
      Color = 1550909
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -13
      HotTrackFont.Name = 'MS Sans Serif'
      HotTrackFont.Style = []
      ParentFont = False
      OnClick = BtnSuccess1Click
      CorHover = clGrayText
      CorPadrao = 1550909
    end
    object MemoSql: TMemo
      Left = 2
      Top = 57
      Width = 581
      Height = 212
      Align = alCustom
      ScrollBars = ssBoth
      TabOrder = 0
    end
    object EditDE: TEdit
      Left = 32
      Top = 295
      Width = 90
      Height = 21
      TabOrder = 1
    end
    object EditPara: TEdit
      Left = 150
      Top = 294
      Width = 90
      Height = 21
      TabOrder = 2
    end
    object CBUp: TCheckBox
      Left = 8
      Top = 274
      Width = 142
      Height = 17
      Caption = 'Fazer Updates Por Lotes'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object ProgressBar1: TProgressBar
      Left = 2
      Top = 365
      Width = 875
      Height = 35
      Align = alCustom
      TabOrder = 4
    end
    object MemoLog: TMemo
      Left = 592
      Top = 28
      Width = 281
      Height = 311
      TabOrder = 5
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 496
    Top = 16
  end
end
