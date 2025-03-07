unit Conexao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBTables, JvExControls, JvSpeedButton,
  UButtons_camaleao;

type
  TFrmConexao = class(TForm)
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
    GroupBox1: TGroupBox;
    Label1: TLabel;
    ListBox1: TListBox;
    Session1: TSession;
    BtnConectarBDE: TBtnPimary;
    BtnConectarMy: TBtnPimary;
    BtnListarAlias: TBtnSuccess;
    BtnConectarAlias: TBtnPimary;
    procedure BtnPimary1Click(Sender: TObject);
    procedure BtnConectarMyClick(Sender: TObject);
    procedure BtnListarAliasClick(Sender: TObject);
    procedure BtnConectarAliasClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConexao: TFrmConexao;

implementation

uses dados;

{$R *.dfm}

procedure TFrmConexao.BtnPimary1Click(Sender: TObject);
begin
   //Conectar BDE
  if EditAliasBDE.Text <> '' then
  begin
    DmDados.SqlBde.Active := False;
    DmDados.SqlBde.DatabaseName := EditAliasBDE.Text;
    ShowMessage('Banco BDE Conectado com Sucesso :-)');
    //Close;
  end
  else
  begin
    ShowMessage('Preencha o campo Nome BDE!');
  end;

end;

procedure TFrmConexao.BtnConectarMyClick(Sender: TObject);
begin
   // conectar Mysql
  if (EditNomeBancoMy.Text <> '') and (EditHost.Text <> '') and (EditUser.Text <> '')  then
  begin
    DmDados.Connection.HostName := EditHost.Text;
    DmDados.Connection.Password := EditPass.Text;
    DmDados.Connection.Database := EditNomeBancoMy.Text;
    DmDados.Connection.User := EditUser.Text;

    ShowMessage('Banco MySql Configurado com Sucesso :-)');
    Close;

  end
  else
  begin
    ShowMessage('Preencha todos os campos');
  end;

end;

procedure TFrmConexao.BtnListarAliasClick(Sender: TObject);
 var
  MyStringList: TStringList;
  i: integer;
begin
   MyStringList := TStringList.Create;
  Session.GetAliasNames(MyStringList);
  for I := 0 to MyStringList.Count - 1 do
    ListBox1.Items.Add(MyStringList[I]);


end;

procedure TFrmConexao.BtnConectarAliasClick(Sender: TObject);
begin
  DmDados.SqlBde.Active := False;
  DmDados.SqlBde.DatabaseName := ListBox1.Items[ListBox1.ItemIndex];
  ShowMessage('Banco BDE Conectado com Sucesso :-)');
  Close;
end;

end.
