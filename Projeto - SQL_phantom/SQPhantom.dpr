program SQPhantom;

uses
  Forms,
  SQL_Phantom in 'SQL_Phantom.pas' {FrmPrincipal},
  Unit1 in 'Unit1.pas' {FrmConfiguraAlias},
  ConectarPorAlias in 'ConectarPorAlias.pas' {FrmConectarAlias};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TFrmConfiguraAlias, FrmConfiguraAlias);
  Application.CreateForm(TFrmConectarAlias, FrmConectarAlias);
  Application.Run;
end.
