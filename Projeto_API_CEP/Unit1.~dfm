object Form1: TForm1
  Left = 236
  Top = 56
  AutoScroll = False
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Conectar API CEP'
  ClientHeight = 570
  ClientWidth = 855
  Color = clWhite
  Font.Charset = ANSI_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 54
    Width = 67
    Height = 23
    Caption = 'Retorno:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -19
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = -2
    Width = 34
    Height = 23
    Caption = 'CEP:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -19
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 693
    Top = 13
    Width = 149
    Height = 27
    BiDiMode = bdLeftToRight
    Caption = 'Conectar API'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 76
    Width = 841
    Height = 266
    Color = clWindowText
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object Edit1: TEdit
    Left = 8
    Top = 20
    Width = 678
    Height = 21
    BiDiMode = bdLeftToRight
    Ctl3D = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentBiDiMode = False
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 2
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 345
    Width = 841
    Height = 181
    Caption = 'Resultado: '
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object LabelUF: TLabel
      Left = 8
      Top = 155
      Width = 25
      Height = 19
      Caption = 'UF: '
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
    end
    object LabelLocalidade: TLabel
      Left = 8
      Top = 121
      Width = 78
      Height = 19
      Caption = 'Localidade: '
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
    end
    object LabelBairro: TLabel
      Left = 8
      Top = 85
      Width = 47
      Height = 19
      Caption = 'Bairro: '
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
    end
    object LabelLogra: TLabel
      Left = 8
      Top = 50
      Width = 81
      Height = 19
      Caption = 'Logradouro: '
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
    end
    object LabelCep: TLabel
      Left = 8
      Top = 22
      Width = 33
      Height = 19
      Caption = 'Cep: '
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
    end
  end
  object BtnLimpar: TButton
    Left = 760
    Top = 533
    Width = 88
    Height = 25
    Caption = 'Limpar'
    TabOrder = 4
    OnClick = BtnLimparClick
  end
  object IdHTTP1Old: TIdHTTP
    IOHandler = IdSSLIOHandlerSocketOpenSSL1
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.ContentType = 'text/html'
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 528
    Top = 48
  end
  object IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL
    MaxLineAction = maException
    Port = 0
    DefaultPort = 0
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 560
    Top = 48
  end
  object IdHTTP1: TIdHTTP
    HandleRedirects = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.ContentType = #39'application/x-www-form-urlencoded'#39';'
    Request.Accept = #39'text/html, */*'#39';'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 488
    Top = 48
  end
end
