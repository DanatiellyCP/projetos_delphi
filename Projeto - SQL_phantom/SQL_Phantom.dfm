object FrmPrincipal: TFrmPrincipal
  Left = 334
  Top = 82
  AutoScroll = False
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'SQL Phantom V. 06/08/2024'
  ClientHeight = 624
  ClientWidth = 885
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 8
    Top = 32
    Width = 865
    Height = 585
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'BDE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      object Label2: TLabel
        Left = 11
        Top = 29
        Width = 21
        Height = 13
        Caption = 'SQL'
      end
      object Label3: TLabel
        Left = 11
        Top = 221
        Width = 51
        Height = 13
        Caption = 'Resultado:'
      end
      object Label8: TLabel
        Left = 216
        Top = 9
        Width = 236
        Height = 29
        Caption = 'Banco BDE Paradox'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -24
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object MemoSqlBDE: TMemo
        Left = 8
        Top = 45
        Width = 689
        Height = 110
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object GroupBox1: TGroupBox
        Left = 8
        Top = 158
        Width = 689
        Height = 57
        Caption = 'Comandos'
        TabOrder = 1
        object BtnSqlBde: TButton
          Left = 8
          Top = 24
          Width = 75
          Height = 25
          Caption = 'Executa SQL'
          TabOrder = 0
          OnClick = BtnSqlBdeClick
        end
        object BtnInsertBDE: TButton
          Left = 99
          Top = 24
          Width = 75
          Height = 25
          Caption = 'Insert SQL'
          TabOrder = 1
          OnClick = BtnInsertBDEClick
        end
        object BtnDeleteBDE: TButton
          Left = 192
          Top = 24
          Width = 75
          Height = 25
          Caption = 'Delete SQL'
          TabOrder = 2
          OnClick = BtnDeleteBDEClick
        end
        object BtnUpdateBDE: TButton
          Left = 288
          Top = 24
          Width = 75
          Height = 25
          Caption = 'Update SQL'
          TabOrder = 3
          OnClick = BtnUpdateBDEClick
        end
        object BtnAlterBDE: TButton
          Left = 384
          Top = 24
          Width = 110
          Height = 25
          Caption = 'Alter Table SQL'
          TabOrder = 4
          OnClick = BtnAlterBDEClick
        end
      end
      object DBGridBDE: TDBGrid
        Left = 8
        Top = 237
        Width = 697
        Height = 248
        DataSource = DsSqlBde
        ReadOnly = True
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clGray
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object BtnExportaExcelBde: TButton
        Left = 579
        Top = 496
        Width = 123
        Height = 25
        Caption = 'Exportar'
        TabOrder = 3
        OnClick = BtnExportaExcelBdeClick
      end
      object Memo1: TMemo
        Left = 8
        Top = 497
        Width = 545
        Height = 53
        ScrollBars = ssBoth
        TabOrder = 4
        Visible = False
      end
      object Button2: TButton
        Left = 580
        Top = 527
        Width = 125
        Height = 22
        Caption = 'Exportar CSV'
        TabOrder = 5
        OnClick = Button2Click
      end
      object BtnLimparBDE: TButton
        Left = 706
        Top = 63
        Width = 47
        Height = 25
        Caption = 'Limpar'
        TabOrder = 6
        OnClick = BtnLimparBDEClick
      end
      object BtnVoltaBDE: TButton
        Left = 706
        Top = 31
        Width = 47
        Height = 25
        Caption = '<'
        TabOrder = 7
        OnClick = BtnVoltaBDEClick
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'MySql'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImageIndex = 1
      ParentFont = False
      object Label4: TLabel
        Left = 11
        Top = 32
        Width = 21
        Height = 13
        Caption = 'SQL'
      end
      object Label5: TLabel
        Left = 11
        Top = 224
        Width = 51
        Height = 13
        Caption = 'Resultado:'
      end
      object Label9: TLabel
        Left = 216
        Top = 9
        Width = 153
        Height = 29
        Caption = 'Banco MySql'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -24
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object MemoSqlMy: TMemo
        Left = 8
        Top = 48
        Width = 689
        Height = 110
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object GroupBox2: TGroupBox
        Left = 8
        Top = 161
        Width = 689
        Height = 57
        Caption = 'Comandos'
        TabOrder = 1
        object BtnSqlMy: TButton
          Left = 8
          Top = 24
          Width = 75
          Height = 25
          Caption = 'Executa SQL'
          TabOrder = 0
          OnClick = BtnSqlMyClick
        end
        object BtnInsertMy: TButton
          Left = 99
          Top = 24
          Width = 75
          Height = 25
          Caption = 'Insert SQL'
          TabOrder = 1
          OnClick = BtnInsertMyClick
        end
        object BtnDeleteMy: TButton
          Left = 192
          Top = 24
          Width = 75
          Height = 25
          Caption = 'Delete SQL'
          TabOrder = 2
          OnClick = BtnDeleteMyClick
        end
        object BtnBkBanco: TButton
          Left = 608
          Top = 24
          Width = 75
          Height = 25
          Caption = 'BK Banco'
          Enabled = False
          TabOrder = 3
          Visible = False
          OnClick = BtnBkBancoClick
        end
        object BtnUpdateMy: TButton
          Left = 288
          Top = 24
          Width = 75
          Height = 25
          Caption = 'Update SQL'
          TabOrder = 4
          OnClick = BtnUpdateMyClick
        end
        object BtnAlterMy: TButton
          Left = 384
          Top = 24
          Width = 110
          Height = 25
          Caption = 'Alter Table SQL'
          TabOrder = 5
          OnClick = BtnAlterMyClick
        end
      end
      object DBGrid2: TDBGrid
        Left = 8
        Top = 240
        Width = 697
        Height = 248
        DataSource = DsSqlMy
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clGray
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawDataCell = DBGrid2DrawDataCell
      end
      object BtnExportaExcelMySql: TButton
        Left = 579
        Top = 491
        Width = 123
        Height = 25
        Caption = 'Exportar'
        TabOrder = 3
        OnClick = BtnExportaExcelMySqlClick
      end
      object MemoMySql: TMemo
        Left = 8
        Top = 492
        Width = 545
        Height = 53
        ScrollBars = ssBoth
        TabOrder = 4
        Visible = False
      end
      object Button3: TButton
        Left = 580
        Top = 522
        Width = 125
        Height = 22
        Caption = 'Exportar CSV'
        TabOrder = 5
        OnClick = Button3Click
      end
      object BtnLimparMySql: TButton
        Left = 706
        Top = 79
        Width = 47
        Height = 25
        Caption = 'Limpar'
        TabOrder = 6
        OnClick = BtnLimparMySqlClick
      end
      object BtnVoltarMySql: TButton
        Left = 706
        Top = 47
        Width = 47
        Height = 25
        Caption = '<'
        TabOrder = 7
        OnClick = BtnVoltarMySqlClick
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Migrar BDE -> MySql'
      ImageIndex = 2
      object Label1: TLabel
        Left = 8
        Top = 12
        Width = 107
        Height = 13
        Caption = 'Nome da Tabela BDE:'
      end
      object Label6: TLabel
        Left = 8
        Top = 72
        Width = 114
        Height = 13
        Caption = 'Nome da Tabela MySql:'
      end
      object Label7: TLabel
        Left = 24
        Top = 391
        Width = 33
        Height = 13
        Caption = 'Status:'
        Visible = False
      end
      object BtnTransferir: TButton
        Left = 144
        Top = 472
        Width = 409
        Height = 41
        Caption = 'Tranferir'
        TabOrder = 0
        OnClick = BtnTransferirClick
      end
      object EditTabelaMySql: TEdit
        Left = 8
        Top = 88
        Width = 713
        Height = 21
        TabOrder = 1
      end
      object EdittTabelaBDE: TEdit
        Left = 8
        Top = 30
        Width = 713
        Height = 21
        TabOrder = 2
      end
      object ProgressBar1: TProgressBar
        Left = 16
        Top = 408
        Width = 697
        Height = 33
        TabOrder = 3
      end
      object DBGrid1: TDBGrid
        Left = 8
        Top = 136
        Width = 705
        Height = 241
        DataSource = DsSqlBde
        TabOrder = 4
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object MemoMemo: TMemo
        Left = 576
        Top = 432
        Width = 185
        Height = 89
        TabOrder = 5
        Visible = False
      end
    end
  end
  object Button1: TButton
    Left = 8
    Top = 5
    Width = 208
    Height = 21
    Caption = 'Conectar Banco'
    TabOrder = 1
    OnClick = Button1Click
  end
  object BtnConnectarAlias: TButton
    Left = 232
    Top = 5
    Width = 208
    Height = 21
    Caption = 'Conectar Por Alias BDE'
    TabOrder = 2
    OnClick = BtnConnectarAliasClick
  end
  object MemoConvert: TMemo
    Left = 1040
    Top = 48
    Width = 369
    Height = 89
    TabOrder = 3
  end
  object RichEditBlob: TRichEdit
    Left = 1048
    Top = 304
    Width = 361
    Height = 89
    Lines.Strings = (
      'RichEditBlob')
    TabOrder = 4
  end
  object MemoTextoLimpo: TMemo
    Left = 1040
    Top = 160
    Width = 369
    Height = 89
    TabOrder = 5
  end
  object Connection: TZConnection
    ControlsCodePage = cGET_ACP
    AutoEncodeStrings = False
    HostName = 'localhost'
    Port = 3306
    User = 'root'
    Protocol = 'mysql-5'
    Left = 720
    Top = 2
  end
  object SaveDialog1: TSaveDialog
    Left = 588
    Top = 5
  end
  object Sql_my: TZQuery
    Connection = Connection
    ReadOnly = True
    Params = <>
    Left = 640
  end
  object SqlBde: TQuery
    SQL.Strings = (
      '')
    Left = 680
  end
  object DsSqlMy: TDataSource
    DataSet = Sql_my
    Left = 641
    Top = 32
  end
  object DsSqlBde: TDataSource
    DataSet = SqlBde
    Left = 680
    Top = 32
  end
  object TblMySql: TZTable
    Connection = Connection
    Left = 752
    Top = 2
  end
  object OpenDialog1: TOpenDialog
    Left = 792
    Top = 8
  end
end
