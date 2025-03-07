unit UpdateGeral;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, DB, DBTables, ZAbstractConnection,
  ZConnection, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZAbstractTable, ComCtrls, JvExControls, JvSpeedButton, UButtons_camaleao;

type
  TFrmUpdateGeral = class(TForm)
    GroupBox2: TGroupBox;
    MemoSql: TMemo;
    Label6: TLabel;
    LblInfoArq: TLabel;
    OpenDialog1: TOpenDialog;
    EditDE: TEdit;
    EditPara: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    CBUp: TCheckBox;
    ProgressBar1: TProgressBar;
    Label11: TLabel;
    LblRodando: TLabel;
    Label13: TLabel;
    LblQtd: TLabel;
    MemoLog: TMemo;
    Label1: TLabel;
    BtnUpdate: TBtnPimary;
    BtnLimpar: TBtnLight;
    BtnArq: TBtnSuccess;
    procedure BtnUpdateClick(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
    procedure BtnSuccess1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure UpMySql;
    procedure UpBDE;
  end;

var
  FrmUpdateGeral: TFrmUpdateGeral;

implementation
uses dados;

{$R *.dfm}





procedure TFrmUpdateGeral.UpMySql;
  var
  Ini, Fim, I, Qtd, Cont : Integer;
begin
  if CBUp.Checked = True then
  begin
    Ini := StrToInt(EditDE.Text);
    Fim := StrToInt(EditPara.Text);
  end
  else
  begin
    Ini := 0;
    Fim := MemoSql.Lines.Count - 1;
  end;

  Qtd := (Fim - Ini);
  LblQtd.Caption := IntToStr(Qtd);
  ProgressBar1.Max := Qtd;
  ProgressBar1.Position := 0;
  Application.ProcessMessages;

 Cont := 0;
 for I := Ini to Fim do
  begin
    try
      DmDados.SqlMy.Active := False;
      DmDados.SqlMy.Connection := DmDados.Connection;
      DmDados.SqlMy.SQL.Clear;
      DmDados.SqlMy.SQL.Add(MemoSql.Lines.Strings[I]);
      DmDados.SqlMy.ExecSQL;
    except
    on E: Exception do
    begin
      ShowMessage(E.Message);
      MemoLog.Lines.Add(MemoSql.Lines.Strings[I]);
      MemoLog.Lines.Add(E.Message);
      MemoLog.Lines.Add('========================')
    end;
    end;
   Cont := Cont + 1;
   ProgressBar1.Position := ProgressBar1.Position + 1;
   LblRodando.Caption := IntToStr(Cont);
   Application.ProcessMessages;

  end;
end;

procedure TFrmUpdateGeral.UpBDE;
  var
  Ini, Fim, I, Qtd, Cont : Integer;
begin
   if CBUp.Checked = True then
  begin
    Ini := StrToInt(EditDE.Text);
    Fim := StrToInt(EditPara.Text);
  end
  else
  begin
    Ini := 0;
    Fim := MemoSql.Lines.Count - 1;
  end;

 Qtd := (Fim - Ini);
 LblQtd.Caption := IntToStr(Qtd);
 ProgressBar1.Max := Qtd;
 ProgressBar1.Position := 0;
 Application.ProcessMessages;

 Cont := 0;
 for I := Ini to Fim do
  begin
    try
      DmDados.SqlBDEu.Active := False;
      DmDados.SqlBDEu.SQL.Clear;
      DmDados.SqlBDEu.SQL.Add(MemoSql.Lines.Strings[I]);
      DmDados.SqlBDEu.ExecSQL;
    except
    on E: Exception do
    begin
      ShowMessage(E.Message);
      MemoLog.Lines.Add(MemoSql.Lines.Strings[I]);
      MemoLog.Lines.Add(E.Message);
      MemoLog.Lines.Add('========================')
    end;
    end;
    Cont := Cont + 1;
    ProgressBar1.Position := ProgressBar1.Position + 1;
    LblRodando.Caption := IntToStr(Cont);
    Application.ProcessMessages;
  end;

end;

procedure TFrmUpdateGeral.BtnUpdateClick(Sender: TObject);
var
  Banco, Nome : String;
begin
 // Fazer a query de update
 MemoLog.Lines.Clear;
 MemoLog.Lines.Add('Inicio dos Updates: ' + FormatDateTime('dd-mm-yyyy_HH-MM', Now));


 MemoLog.Lines.Add('Banco Conectado: ' + Banco);
 MemoLog.Lines.Add('Banco ' + Nome);

 if Banco = 'MySql' then
   UpMySql;

 if Banco = 'BDE' then
   UpBDE;


 ShowMessage('UPDATES Realizados Com Sucesso!');

end;

procedure TFrmUpdateGeral.BtnLimparClick(Sender: TObject);
begin
   // Limpar a tela
  MemoSql.Lines.Clear;
  CBUp.Checked := False;
  EditDE.Text := '';
  EditPara.Text := '';
  MemoLog.Lines.Clear;

  Application.ProcessMessages;
end;

procedure TFrmUpdateGeral.BtnSuccess1Click(Sender: TObject);
var
  i : integer;
  Arq : TextFile;
  Query : String;
begin
  // lera arquivo com query

  if OpenDialog1.Execute then
  begin
   MemoSql.Lines.LoadFromFile(OpenDialog1.FileName);
  end;

  LblInfoArq.Caption := 'Linhas ' + IntToStr(MemoSql.Lines.Count);

end;

end.
