program SenhaSegura;

uses
  Forms,
  Senha_Segura in 'Senha_Segura.pas' {FrmPrincipal},
  redefine_senha in 'redefine_senha.pas' {FrmRedefineSenha};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TFrmRedefineSenha, FrmRedefineSenha);
  Application.Run;
end.
