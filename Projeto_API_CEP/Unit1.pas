unit Unit1;

// Projeto que consulta endereços de CEPs Brasil
// A ideia é ser um exeplo de acesso a APIs usando delphi
// Projeto contruido em delphi 7
// Usando apenas Indy
// consulta na API da viacep.com.br

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, IdIOHandler, IdIOHandlerSocket, IdSSLOpenSSL,
  IdIOHandlerStack, IdSSL, ComCtrls, UrlMon;  //UrlMon nova teste

type
  TForm1 = class(TForm)
    IdHTTP1Old: TIdHTTP;
    Button1: TButton;
    Memo1: TMemo;
    Edit1: TEdit;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    IdHTTP1: TIdHTTP;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    LabelUF: TLabel;
    LabelLocalidade: TLabel;
    LabelBairro: TLabel;
    LabelLogra: TLabel;
    LabelCep: TLabel;
    BtnLimpar: TButton;
    procedure Button1Click(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ConectarApiCep;
    procedure Limpar;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
   ConectarApiCep;
end;

procedure TForm1.ConectarApiCep;
  var
  URL, Retorno, titulo: String;
  JsonStreamRetorno, JsonStreamEnvio: TStringStream;
  RetornoLimpo, CEP, Logradouro, Bairro, Localidade, UF : String;

  WebPageContent : AnsiString;
begin
  IdSSLIOHandlerSocketOpenSSL1.SSLOptions.SSLVersions := [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2]; // coloquei o camponente IdSSLIOHandlerSocketOpenSSL1 - e adicionei essa linha para parar o erro de ssl

  titulo := Edit1.Text;

  URL := 'https://viacep.com.br/ws/'+ Edit1.Text+'/json/?callback=?';


  JsonStreamEnvio := TStringStream.Create('');  //AQUI VAI O CONTEÚDO NO FORMATO Json
  JsonStreamRetorno := TStringStream.Create('');

  // Init request:
  try
    idHttp1.Request.ContentType := 'application/json';
    idhttp1.Request.AcceptCharSet := 'UTF-8';
    IdHttp1.IOHandler := IdSSLIOHandlerSocketOpenSSL1;  //IdSSLIOHandlerSocket1;

    // Set username and password:
    idHttp1.Request.Clear;
    idHttp1.Request.BasicAuthentication := False;


    IdHTTP1.Request.Accept := 'application/json, text/javascript, */*; q=0.01';

    idHttp1.Response.ContentType := 'application/json';
    idHttp1.Response.ContentType  := 'UTF-8';

    IdHTTP1.Response.ContentType :=  'application/json, text/javascript, */*; q=0.01';

    {Retorno := idHttp1.Get(URL);  // Para o site de CEP só funciona o GET
    memo1.Lines.LoadFromStream(JsonStreamRetorno);
    ShowMessage(Retorno);
    memo1.Lines.Text := Retorno;}

    // desse modo a requisição trata os erros de acento formato UTF8
    idHttp1.Get(URL, JsonStreamRetorno);
    JsonStreamRetorno.Position := 0;
    WebPageContent  := JsonStreamRetorno.DataString;
    memo1.Lines.Text :=  UTF8Decode(WebPageContent);


    //separando os dados do retorno do CEP

    CEP := Memo1.Lines.Strings[1];
    CEP := StringReplace(CEP, '"cep": "', '', [rfReplaceAll, rfIgnoreCase]);
    CEP := StringReplace(CEP, '",', '', [rfReplaceAll, rfIgnoreCase]);

    Logradouro := Memo1.Lines.Strings[2];
    Logradouro := StringReplace(Logradouro, '"logradouro": "', '', [rfReplaceAll, rfIgnoreCase]);
    Logradouro := StringReplace(Logradouro, '",', '', [rfReplaceAll, rfIgnoreCase]);

    Bairro := Memo1.Lines.Strings[4];
    Bairro := StringReplace(Bairro, '"bairro": "', '', [rfReplaceAll, rfIgnoreCase]);
    Bairro := StringReplace(Bairro, '",', '', [rfReplaceAll, rfIgnoreCase]);

    Localidade :=  Memo1.Lines.Strings[5];
    Localidade := StringReplace(Localidade, '"localidade": "', '', [rfReplaceAll, rfIgnoreCase]);
    Localidade := StringReplace(Localidade, '",', '', [rfReplaceAll, rfIgnoreCase]);

    UF := Memo1.Lines.Strings[6];
    UF := StringReplace(UF, '"uf": "', '', [rfReplaceAll, rfIgnoreCase]);
    UF := StringReplace(UF, '",', '', [rfReplaceAll, rfIgnoreCase]);

    LabelCep.Caption := LabelCep.Caption + CEP;
    LabelLogra.Caption := LabelLogra.Caption + Logradouro;
    LabelBairro.Caption := LabelBairro.Caption + Bairro;
    LabelLocalidade.Caption  := LabelLocalidade.Caption + Localidade;
    LabelUF.Caption := LabelUF.Caption + UF;


   finally
   end;


end;

procedure TForm1.Limpar;
begin
  // limpar labels e componentes
  Edit1.Text := '';
  Memo1.Lines.Clear;

  LabelCep.Caption := 'Cep: ';
  LabelLogra.Caption := 'Logradouro: ';
  LabelBairro.Caption := 'Bairro: ';
  LabelLocalidade.Caption := 'Localidade: ';
  LabelUF.Caption := 'UF: ';

  Application.ProcessMessages;

end;

procedure TForm1.BtnLimparClick(Sender: TObject);
begin
  Limpar;
end;

end.
