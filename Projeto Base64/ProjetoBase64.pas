unit ProjetoBase64;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IdCoder, IdCoder3to4, IdCoderMIME, IdBaseComponent,
  ExtCtrls, JPEG, ComCtrls, EncdDecd, JvExExtCtrls, JvImage,
  JvBaseThumbnail, JvThumbImage, ShellAPI;

type
  TForm1 = class(TForm)
    IdEncoderMIME1: TIdEncoderMIME;
    IdDecoderMIME1: TIdDecoderMIME;
    OpenDialog1: TOpenDialog;
    GroupBox1: TGroupBox;
    EditArquivo: TEdit;
    Button1: TButton;
    GroupBox2: TGroupBox;
    Img_view: TImage;
    GroupBox3: TGroupBox;
    BtnGerarBase64: TButton;
    MemoBase64: TMemo;
    BtnGerarImg: TButton;
    BtnBA64ToPdf: TButton;
    procedure BtnGerarBase64Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BtnGerarImgClick(Sender: TObject);
    procedure BtnBA64ToPdfClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BtnGerarBase64Click(Sender: TObject);
  var
  ArquivoPdf, PdfBase64 : String;

  Encoder: TIdEncoderMIME;
  FileStream: TFileStream;
  MemoryStream: TMemoryStream;
  Base64String: String;

begin
   // Botão para gerar base64
  MemoBase64.Clear;

  ArquivoPdf := EditArquivo.Text;

  Encoder := TIdEncoderMIME.Create(nil);

  FileStream := TFileStream.Create(ArquivoPdf, fmOpenRead or fmShareDenyWrite);

  MemoryStream := TMemoryStream.Create;

  MemoryStream.LoadFromStream(FileStream);

  Base64String := Encoder.EncodeStream(MemoryStream);

  MemoryStream.Free;
  FileStream.Free;
  Encoder.Free;

  MemoBase64.Lines.Text := Base64String;


end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  // abrir arquivo que será convertido em base64
  if OpenDialog1.Execute then
  begin
    EditArquivo.Text :=  OpenDialog1.FileName;
  end;



end;

procedure TForm1.BtnGerarImgClick(Sender: TObject);
  var
  decodedStream: TMemoryStream;
  base64Decoder: TIdDecoderMIME;
  JPEGImage: TJPEGImage;

begin
  decodedStream := TMemoryStream.Create;
  base64Decoder := TIdDecoderMIME.Create(nil);
  try
    try
      base64Decoder.DecodeStream(MemoBase64.Text, decodedStream);
      decodedStream.Position := 0;

      JPEGImage := TJPEGImage.Create;
      JPEGImage.LoadFromStream(decodedStream);
      Img_view.Picture.Assign(JPEGImage);
    except
      on E: Exception do
        ShowMessage('Erro ao decodificar a imagem: ' + E.Message);
    end;
  finally
    base64Decoder.Free;
    decodedStream.Free;
  end;


end;

procedure TForm1.BtnBA64ToPdfClick(Sender: TObject);
  var
  DecodedStream: TMemoryStream;
  Decoder: TIdDecoderMIME;
  NomeArquivo : String;
begin
  DecodedStream :=  TMemoryStream.Create;
  Decoder := TIdDecoderMIME.Create(nil);
  NomeArquivo:= 'teste.pdf';
  try
    Decoder.DecodeBegin(DecodedStream);
    Decoder.Decode(MemoBase64.Text);
    Decoder.DecodeEnd;
    DecodedStream.Position := 0;
    DecodedStream.SaveToFile(NomeArquivo);
  finally
    Decoder.Free;
    DecodedStream.Free;
  end;

  ShellExecute(handle,'open',PChar(NomeArquivo), '','',SW_SHOWNORMAL);

end;

end.
