object Form1: TForm1
  Left = 493
  Top = 156
  Width = 723
  Height = 480
  Caption = 'Trabalhando com Base64'
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
  object GroupBox1: TGroupBox
    Left = 6
    Top = 1
    Width = 697
    Height = 72
    Caption = 'Abrir Arquivo '
    TabOrder = 0
    object EditArquivo: TEdit
      Left = 8
      Top = 19
      Width = 537
      Height = 32
      TabOrder = 0
    end
    object Button1: TButton
      Left = 557
      Top = 21
      Width = 121
      Height = 25
      Caption = 'Abrir Arquivo'
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 80
    Width = 209
    Height = 201
    Caption = 'Imagem'
    TabOrder = 1
    object Img_view: TImage
      Left = 7
      Top = 18
      Width = 194
      Height = 175
      Stretch = True
    end
  end
  object GroupBox3: TGroupBox
    Left = 376
    Top = 80
    Width = 324
    Height = 348
    Caption = 'Base64'
    TabOrder = 2
    object BtnGerarBase64: TButton
      Left = 7
      Top = 16
      Width = 119
      Height = 25
      Caption = 'Gerar Base64'
      TabOrder = 0
      OnClick = BtnGerarBase64Click
    end
    object MemoBase64: TMemo
      Left = 5
      Top = 46
      Width = 312
      Height = 252
      ScrollBars = ssVertical
      TabOrder = 1
    end
    object BtnGerarImg: TButton
      Left = 195
      Top = 308
      Width = 115
      Height = 29
      Caption = 'Gerar Imagem'
      TabOrder = 2
      OnClick = BtnGerarImgClick
    end
    object BtnBA64ToPdf: TButton
      Left = 7
      Top = 308
      Width = 115
      Height = 29
      Caption = 'Gerar PDF Base64'
      TabOrder = 3
      OnClick = BtnBA64ToPdfClick
    end
  end
  object IdEncoderMIME1: TIdEncoderMIME
    FillChar = '='
    Left = 288
    Top = 88
  end
  object IdDecoderMIME1: TIdDecoderMIME
    FillChar = '='
    Left = 320
    Top = 88
  end
  object OpenDialog1: TOpenDialog
    Left = 256
    Top = 88
  end
end
