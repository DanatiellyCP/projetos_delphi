unit Senha_Segura;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFrmPrincipal = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation
uses  redefine_senha;

{$R *.dfm}

procedure TFrmPrincipal.Button1Click(Sender: TObject);
begin
  Label2.Font.Color := clBlue;
  Label2.Caption := 'Resposta';
  Edit1.Text := '';

  Application.CreateForm(TFrmRedefineSenha, FrmRedefineSenha);
  FrmRedefineSenha.ShowModal;
  FrmRedefineSenha.Destroy;

  Application.ProcessMessages;

  if  Edit1.Text <> '' then
  begin
    Label2.Font.Color := clBlue;
    Label2.Caption := 'Resposta: SENHA ACEITA COM SUCESSO!';
  end
  else
  begin
    Label2.Font.Color := clRed;
    Label2.Caption := 'Resposta: Senha inválida ;( ';
  end;

  Application.ProcessMessages;

end;

end.
