program Base64;

uses
  Forms,
  ProjetoBase64 in 'ProjetoBase64.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
