unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TFrmConfiguraAlias = class(TForm)
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Label6: TLabel;
    EditAliasBDE: TEdit;
    GroupBox5: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    EditNomeBancoMy: TEdit;
    EditHost: TEdit;
    EditPass: TEdit;
    EditUser: TEdit;
    BtnConectarMy: TButton;
    BtnConectarBDE: TButton;
    procedure BtnConectarMyClick(Sender: TObject);
    procedure BtnConectarBDEClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConfiguraAlias: TFrmConfiguraAlias;

implementation

uses SQL_Phantom;

{$R *.dfm}

procedure TFrmConfiguraAlias.BtnConectarMyClick(Sender: TObject);
begin
  // conectar Mysql
  if (EditNomeBancoMy.Text <> '') and (EditHost.Text <> '') and (EditUser.Text <> '')  then
  begin
    FrmPrincipal.Connection.HostName := EditHost.Text;
    FrmPrincipal.Connection.Password := EditPass.Text;
    FrmPrincipal.Connection.Database := EditNomeBancoMy.Text;
    FrmPrincipal.Connection.User := EditUser.Text;

    ShowMessage('Banco MySql Configurado com Sucesso :-)');
    Close;

  end
  else
  begin
    ShowMessage('Preencha todos os campos');
  end;

end;

procedure TFrmConfiguraAlias.BtnConectarBDEClick(Sender: TObject);
begin
  //Conectar BDE
  if EditAliasBDE.Text <> '' then
  begin
    FrmPrincipal.SqlBde.Active := False;
    FrmPrincipal.SqlBde.DatabaseName := EditAliasBDE.Text;
    ShowMessage('Banco BDE Conectado com Sucesso :-)');
    Close;
  end
  else
  begin
    ShowMessage('Preencha o campo Nome BDE!');
  end;

end;

end.
