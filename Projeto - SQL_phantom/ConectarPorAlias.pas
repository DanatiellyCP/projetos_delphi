unit ConectarPorAlias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,
  dbTables;   // uso essa para usar session

type
  TFrmConectarAlias = class(TForm)
    ListBox1: TListBox;
    Button1: TButton;
    Label1: TLabel;
    BtnConectarAlias: TButton;
    procedure Button1Click(Sender: TObject);
    procedure BtnConectarAliasClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConectarAlias: TFrmConectarAlias;

implementation

uses SQL_Phantom;

{$R *.dfm}

procedure TFrmConectarAlias.Button1Click(Sender: TObject);
  var
  MyStringList: TStringList;
  i: integer;
begin
  MyStringList := TStringList.Create;
  Session.GetAliasNames(MyStringList);
  for I := 0 to MyStringList.Count - 1 do
    ListBox1.Items.Add(MyStringList[I]);

end;

procedure TFrmConectarAlias.BtnConectarAliasClick(Sender: TObject);
begin
  // conectar Banco com o alias selecionado da lista dos existentes
  //ShowMessage(ListBox1.Items[ListBox1.ItemIndex]);

  //limpar a tela BDE antes de conectar
  FrmPrincipal.BtnLimparBDE.Click;

  FrmPrincipal.SqlBde.Active := False;
  FrmPrincipal.SqlBde.DatabaseName := ListBox1.Items[ListBox1.ItemIndex];
  ShowMessage('Banco BDE Conectado com Sucesso :-)');
  Close;
  
end;

end.
