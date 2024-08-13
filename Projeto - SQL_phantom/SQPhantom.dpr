program SQPhantom;

uses
  Forms,
  SQL_Phantom in 'SQL_Phantom.pas' {FrmPrincipal},
  Unit1 in 'Unit1.pas' {FrmConfiguraAlias},
  ConectarPorAlias in 'ConectarPorAlias.pas' {FrmConectarAlias},
  dados in 'dados.pas' {DmDados: TDataModule},
  Conexao in 'Conexao.pas' {FrmConexao};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'SQL Phantom';
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TFrmConfiguraAlias, FrmConfiguraAlias);
  Application.CreateForm(TFrmConectarAlias, FrmConectarAlias);
  Application.CreateForm(TDmDados, DmDados);
  Application.CreateForm(TFrmConexao, FrmConexao);
  Application.Run;
end.
