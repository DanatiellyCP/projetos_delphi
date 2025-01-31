program CupCake;

uses
  Forms,
  Principal in 'Principal.pas' {FrmPrincipal},
  dados in 'dados.pas' {DmDados: TDataModule},
  Conexao in 'Conexao.pas' {FrmConexao},
  UConn in 'Uconn.pas',
  UpdateGeral in 'UpdateGeral.pas' {FrmUpdateGeral},
  UButtons_camaleao in 'libs\UButtons_camaleao.pas',
  UButtons_camaleao_static in 'libs\UButtons_camaleao_static.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TDmDados, DmDados);
  Application.CreateForm(TFrmConexao, FrmConexao);
  Application.CreateForm(TFrmUpdateGeral, FrmUpdateGeral);
  Application.Run;
end.
