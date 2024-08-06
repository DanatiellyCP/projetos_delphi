unit SQL_Phantom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ZAbstractConnection, ZConnection, DB,
  DBTables, ZAbstractRODataset, ZAbstractDataset, ZDataset, ComCtrls, ComObj,
  ZAbstractTable, ShellApi, IdBaseComponent, IdCoder, IdCoder3to4,
  IdCoderMIME;

type
  TFrmPrincipal = class(TForm)
    Connection: TZConnection;
    SaveDialog1: TSaveDialog;
    Sql_my: TZQuery;
    SqlBde: TQuery;
    DsSqlMy: TDataSource;
    DsSqlBde: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    MemoSqlBDE: TMemo;
    GroupBox1: TGroupBox;
    BtnSqlBde: TButton;
    Label2: TLabel;
    DBGridBDE: TDBGrid;
    Label3: TLabel;
    BtnExportaExcelBde: TButton;
    Label4: TLabel;
    MemoSqlMy: TMemo;
    GroupBox2: TGroupBox;
    BtnSqlMy: TButton;
    Label5: TLabel;
    DBGrid2: TDBGrid;
    BtnExportaExcelMySql: TButton;
    Button1: TButton;
    BtnInsertBDE: TButton;
    BtnDeleteBDE: TButton;
    BtnInsertMy: TButton;
    BtnDeleteMy: TButton;
    Memo1: TMemo;
    Button2: TButton;
    MemoMySql: TMemo;
    Button3: TButton;
    BtnLimparBDE: TButton;
    BtnLimparMySql: TButton;
    BtnVoltaBDE: TButton;
    BtnVoltarMySql: TButton;
    BtnConnectarAlias: TButton;
    TabSheet3: TTabSheet;
    Label1: TLabel;
    BtnTransferir: TButton;
    Label6: TLabel;
    EditTabelaMySql: TEdit;
    EdittTabelaBDE: TEdit;
    TblMySql: TZTable;
    ProgressBar1: TProgressBar;
    Label7: TLabel;
    DBGrid1: TDBGrid;
    MemoMemo: TMemo;
    BtnBkBanco: TButton;
    BtnUpdateMy: TButton;
    BtnAlterMy: TButton;
    BtnUpdateBDE: TButton;
    BtnAlterBDE: TButton;
    MemoConvert: TMemo;
    RichEditBlob: TRichEdit;
    MemoTextoLimpo: TMemo;
    procedure BtnSqlBdeClick(Sender: TObject);
    procedure BtnSqlMyClick(Sender: TObject);
    procedure BtnExportaExcelBdeClick(Sender: TObject);
    procedure BtnExportaExcelMySqlClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BtnInsertBDEClick(Sender: TObject);
    procedure BtnDeleteBDEClick(Sender: TObject);
    procedure BtnInsertMyClick(Sender: TObject);
    procedure BtnDeleteMyClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure BtnLimparBDEClick(Sender: TObject);
    procedure BtnLimparMySqlClick(Sender: TObject);
    procedure BtnVoltaBDEClick(Sender: TObject);
    procedure BtnVoltarMySqlClick(Sender: TObject);
    procedure BtnConnectarAliasClick(Sender: TObject);
    procedure BtnTransferirClick(Sender: TObject);
    procedure BtnBkBancoClick(Sender: TObject);
    procedure BtnUpdateMyClick(Sender: TObject);
    procedure BtnAlterMyClick(Sender: TObject);
    procedure BtnUpdateBDEClick(Sender: TObject);
    procedure BtnAlterBDEClick(Sender: TObject);
    procedure DBGrid2DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    function ExportarExcel(Query1: Tquery): boolean;
    function ExportarCsv(Query1: Tquery): boolean;
    function ExportarExcel_Mysql(Query1: TZQuery): boolean;
    function ExportarCsvMySql(Query1: TZQuery): boolean;
    function DiretoriodoExecutavel: String;
    function ChecarBDConectado(TipoBanco : String): boolean;
    function ConvertTipoMemo(TextoCampo:String) : String;
    function TrocaCaracterEspecial(aTexto : string; aLimExt : boolean) : string;
    function EliminaFormatacaoBlob(TextoBlob: String): String;
  end;

var
  FrmPrincipal: TFrmPrincipal;
  TextoSqlBDELog, TextoSqlMySqlLog : String;
implementation
uses Unit1, ConectarPorAlias;

{$R *.dfm}

procedure TFrmPrincipal.BtnSqlBdeClick(Sender: TObject);
begin
  //******* BDE ********************
  if ChecarBDConectado('BDE') = false then
  begin
    ShowMessage('Banco BDE não está conectado.' + #13 + 'Configure o Alias BDE');
    abort;
    exit;
  end;
  try
    TextoSqlBDELog := '';
    TextoSqlBDELog := MemoSqlBDE.Text;
    SqlBde.Active := False;
    SqlBde.SQL.Clear;
    SqlBde.SQL.Add(MemoSqlBDE.Text);
    SqlBde.Active := True;
    Label3.Caption := 'Resultado: ' + IntToStr(SqlBde.RecordCount);
  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
    end;
  end;

end;

procedure TFrmPrincipal.BtnSqlMyClick(Sender: TObject);
begin
  //********** MY_SQL ******************

  if ChecarBDConectado('MySql') = false then
  begin
    ShowMessage('Banco MySql não está conectado.' + #13 + 'Configure o banco Mysql.');
    abort;
    exit;
  end;
  try
    TextoSqlMySqlLog := '';
    TextoSqlMySqlLog := MemoSqlMy.Text;
    Sql_my.Active := False;
    Sql_my.SQL.Clear;
    Sql_my.SQL.Add(MemoSqlMy.Text);
    Sql_my.Active := True;
    Label5.Caption := 'Resultado: ' + IntToStr(Sql_my.RecordCount);
  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
    end;
  end;


end;

function TFrmPrincipal.ExportarExcel(Query1: Tquery): boolean;
  var
  linha, coluna : integer;
  planilha : variant;
  valorcampo, ArquivoNome : string;
begin
  // Função para exportar grides e dataSet para excel

  planilha:= CreateoleObject('Excel.Application');
  planilha.WorkBooks.add(1);
  planilha.caption := 'Dados do sistema para Excel';
  //planilha.visible := true;

  Query1.First;

  for linha := 0 to Query1.RecordCount - 1 do
  begin
    for coluna := 1 to Query1.FieldCount do
    begin
      //valorcampo := Query1.Fields[coluna - 1].AsString;
      //planilha.cells[linha + 2,coluna] := valorCampo;
      planilha.cells[linha + 2,coluna] := Query1.Fields[coluna - 1].Value;
    end;
    Query1.Next;
  end;
  for coluna := 1 to Query1.FieldCount do
  begin
    valorcampo := Query1.Fields[coluna - 1].DisplayLabel;
    planilha.cells[1,coluna] := valorcampo;
  end;
  planilha.columns.Autofit;

  if  SaveDialog1.Execute = True then
    begin
        ArquivoNome := SaveDialog1.FileName;
    end;


  planilha.ActiveWorkbook.SaveAs(ArquivoNome); // para salvar a planilha gerada com um nome e um caminho
  ShowMessage('Processo concluído com sucesso !');
  planilha.visible := true;

end;

procedure TFrmPrincipal.BtnExportaExcelBdeClick(Sender: TObject);
begin
  //BDE
    ExportarExcel(SqlBde);
end;

function TFrmPrincipal.ExportarExcel_Mysql(Query1: TZQuery): boolean;
  var
  linha, coluna : integer;
  planilha : variant;
  valorcampo, ArquivoNome : string;
begin
  // Função para exportar grides e dataSet para excel
  // Danny - 24-02-2023

  planilha:= CreateoleObject('Excel.Application');
  planilha.WorkBooks.add(1);
  planilha.caption := 'Dados do sistema para Excel';
  //planilha.visible := true;

  Query1.First;

  for linha := 0 to Query1.RecordCount - 1 do
  begin
    for coluna := 1 to Query1.FieldCount do
    begin
      //valorcampo := Query1.Fields[coluna - 1].AsString;
      //planilha.cells[linha + 2,coluna] := valorCampo;
      planilha.cells[linha + 2,coluna] := Query1.Fields[coluna - 1].Value;
    end;
    Query1.Next;
  end;
  for coluna := 1 to Query1.FieldCount do
  begin
    valorcampo := Query1.Fields[coluna - 1].DisplayLabel;
    planilha.cells[1,coluna] := valorcampo;
  end;
  planilha.columns.Autofit;

  if  SaveDialog1.Execute = True then
    begin
        ArquivoNome := SaveDialog1.FileName;
    end;


  planilha.ActiveWorkbook.SaveAs(ArquivoNome); // para salvar a planilha gerada com um nome e um caminho
  ShowMessage('Processo concluído com sucesso !');
  planilha.visible := true;

end;

procedure TFrmPrincipal.BtnExportaExcelMySqlClick(Sender: TObject);
begin
  // MySql
  ExportarExcel_Mysql(Sql_my);
end;

function TFrmPrincipal.DiretoriodoExecutavel: String;
begin
  Result := ExtractFilePath(ParamStr(0));
end;

procedure TFrmPrincipal.Button1Click(Sender: TObject);
begin
  FrmConfiguraAlias.ShowModal;
end;

procedure TFrmPrincipal.BtnInsertBDEClick(Sender: TObject);
begin
  // Fazer query de inserssão BDE

  if ChecarBDConectado('BDE') = false then
  begin
    ShowMessage('Banco BDE não está conectado.' + #13 + 'Configure o Alias BDE');
    abort;
    exit;
  end;
  Try
    TextoSqlBDELog := '';
    TextoSqlBDELog := MemoSqlBDE.Text;
    SqlBde.Active := False;
    SqlBde.SQL.Clear;
    SqlBde.SQL.Add(MemoSqlBDE.Text);
    SqlBde.ExecSQL;
    Label3.Caption := 'Resultado: ' + IntToStr(SqlBde.RowsAffected) + ' Linhas afetadas.';
    ShowMessage('INSERT Realizado com Sucesso! ');
  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
    end;
  end;


end;

procedure TFrmPrincipal.BtnDeleteBDEClick(Sender: TObject);
begin
  // delete sql BDE

  if ChecarBDConectado('BDE') = false then
  begin
    ShowMessage('Banco BDE não está conectado.' + #13 + 'Configure o Alias BDE');
    abort;
    exit;
  end;
  try
    TextoSqlBDELog := '';
    TextoSqlBDELog := MemoSqlBDE.Text;
    SqlBde.Active := False;
    SqlBde.SQL.Clear;
    SqlBde.SQL.Add(MemoSqlBDE.Text);
    SqlBde.ExecSQL;
    Label3.Caption := 'Resultado: ' + IntToStr(SqlBde.RowsAffected) + ' Linhas afetadas.';
    ShowMessage('DELETE Realizado com Sucesso! ');
  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
    end;
  end;

end;

procedure TFrmPrincipal.BtnInsertMyClick(Sender: TObject);
begin
  // INSERT MySql

  if ChecarBDConectado('MySql') = false then
  begin
    ShowMessage('Banco MySql não está conectado.' + #13 + 'Configure o banco Mysql.');
    abort;
    exit;
  end;
  try
    TextoSqlMySqlLog := '';
    TextoSqlMySqlLog := MemoSqlMy.Text;
    Sql_My.Active := False;
    Sql_My.SQL.Clear;
    Sql_My.SQL.Add(MemoSqlMy.Text);
    Sql_My.ExecSQL;
    Label5.Caption := 'Resultado: ' + IntToStr(Sql_My.RowsAffected) + ' Linhas afetadas.';
    ShowMessage('INSERT Realizado com Sucesso! ');
  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
    end;
  end;

end;

procedure TFrmPrincipal.BtnDeleteMyClick(Sender: TObject);
begin
  // DELETE MySql
  if ChecarBDConectado('MySql') = false then
  begin
    ShowMessage('Banco MySql não está conectado.' + #13 + 'Configure o banco Mysql.');
    abort;
    exit;
  end;
  try
    TextoSqlMySqlLog := '';
    TextoSqlMySqlLog := MemoSqlMy.Text;
    Sql_My.Active := False;
    Sql_My.SQL.Clear;
    Sql_My.SQL.Add(MemoSqlMy.Text);
    Sql_My.ExecSQL;
    Label5.Caption := 'Resultado: ' + IntToStr(Sql_My.RowsAffected) + ' Linhas afetadas.';
    ShowMessage('DELETE Realizado com Sucesso! ');
  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
    end;
  end;

end;

function TFrmPrincipal.ChecarBDConectado(TipoBanco: String): boolean;
begin
  //função para conferir se o banco está mesmo conectado, antes de fazer querys
  if TipoBanco = 'MySql' then
  begin
      if Connection.Database <> '' then
      begin
        result := True;
      end
      else
      begin
        result := False;
      end;
  end;

  if TipoBanco = 'BDE' then
  begin
    if SqlBde.DatabaseName <> '' then
    begin
      result := True;
    end
    else
    begin
      result := False;
    end;
  end;

end;

function TFrmPrincipal.ExportarCsv(Query1: Tquery): boolean;
  var
  i, j, linha, coluna : integer;
  valorcampo, ArquivoNome : string;
  StringTitulo, StringValores : String;
begin
  // teste para exportar query BDE para csv direto - danny - 09-06-2023
  StringTitulo := '';
  for i := 0 to DBGridBDE.Columns.Count - 1 do
  begin
    if i = 0 then
    begin
       StringTitulo := DBGridBDE.Fields[i].FieldName;
    end
    else
    begin
      StringTitulo := StringTitulo + ';' +  DBGridBDE.Fields[i].FieldName;
    end;

  end;

  Memo1.Lines.Add(StringTitulo);

  DBGridBDE.DataSource.DataSet.First;
  while not DBGridBDE.DataSource.DataSet.Eof do
  begin
    StringValores := '';

    for j := 0 to DBGridBDE.Columns.Count -1 do
    begin

      if j = 0 then
      begin
        StringValores := DBGridBDE.Fields[j].Text;
      end
      else
      begin
        StringValores := StringValores + ';' +  DBGridBDE.Fields[j].Text;
      end;

    end;
    Memo1.Lines.Add(StringValores);
    DBGridBDE.DataSource.DataSet.Next;
  end;


  if  SaveDialog1.Execute = True then
  begin
    ArquivoNome := SaveDialog1.FileName;
    Memo1.Lines.SaveToFile(ArquivoNome + '.csv');
    ShowMessage('Arquivo CSV Salvo com sucesso !');
  end;

end;

procedure TFrmPrincipal.Button2Click(Sender: TObject);
begin
  // chamar a função de geração de csv BDE
  ExportarCsv(SqlBde);

end;

function TFrmPrincipal.ExportarCsvMySql(Query1: TZQuery): boolean;
  var
  i, j, linha, coluna : integer;
  valorcampo, ArquivoNome : string;
  StringTitulo, StringValores, BlobToString : String;
begin
  // função para exportar query MySql para csv
  MemoMySql.Clear;
  StringTitulo := '';
  for i := 0 to DBGrid2.Columns.Count - 1 do
  begin
    if i = 0 then
    begin
      StringTitulo := DBGrid2.Fields[i].FieldName;
    end
    else
    begin
      StringTitulo := StringTitulo + ';' +  DBGrid2.Fields[i].FieldName;
    end;

  end;

  MemoMySql.Lines.Add(StringTitulo);

  DBGrid2.DataSource.DataSet.First;
  while not DBGrid2.DataSource.DataSet.Eof do
  begin

    StringValores := '';
    for j := 0 to DBGrid2.Columns.Count -1 do
    begin
      if j = 0 then
      begin
        StringValores := DBGrid2.Fields[j].Text;
      end
      else
      begin
        StringValores := StringValores + ';' + DBGrid2.Fields[j].Text;
      end;

    end;
    MemoMySql.Lines.Add(StringValores);
    DBGrid2.DataSource.DataSet.Next;
  end;


  if  SaveDialog1.Execute = True then
  begin
    ArquivoNome := SaveDialog1.FileName;
    MemoMySql.Lines.SaveToFile(ArquivoNome + '.csv');
    ShowMessage('Arquivo CSV Salvo com sucesso !');
  end;


end;

procedure TFrmPrincipal.Button3Click(Sender: TObject);
begin
  // chamar função de gerar CSV MySql
  ExportarCsvMySql(Sql_my);

end;

procedure TFrmPrincipal.BtnLimparBDEClick(Sender: TObject);
begin
  // Botão para limpar a tela BDE
  MemoSqlBDE.Clear;
  SqlBde.Active := False;
  SqlBde.SQL.Clear;
  Memo1.Clear;
  Label3.Caption := 'Resultado: ';

end;

procedure TFrmPrincipal.BtnLimparMySqlClick(Sender: TObject);
begin
  // botão limpar tela MySql
  MemoSqlMy.Clear;
  Sql_my.Active := False;
  Sql_my.SQL.Clear;
  MemoMySql.Clear;
  Label5.Caption := 'Resultado: ';

end;


procedure TFrmPrincipal.BtnVoltaBDEClick(Sender: TObject);
begin
   MemoSqlBDE.Clear;
   MemoSqlBDE.Text := TextoSqlBDELog;
end;

procedure TFrmPrincipal.BtnVoltarMySqlClick(Sender: TObject);
begin
  MemoSqlMy.Clear;
  MemoSqlMy.Text := TextoSqlMySqlLog;
end;

procedure TFrmPrincipal.BtnConnectarAliasClick(Sender: TObject);
begin
  FrmConectarAlias.ShowModal;
end;

procedure TFrmPrincipal.BtnTransferirClick(Sender: TObject);
  var
  TotCampos, QtdLinnhas, Cont, vlLinha : Integer;
begin
  // Exportar dados da tabela BDE para a tabela MySql

  // conectar tabela Mysql
  TblMySql.TableName := EditTabelaMySql.Text;
  TblMySql.Active := True;

  SqlBde.Active := False;
  SqlBde.SQL.Clear;
  SqlBde.SQL.Add('SELECT * FROM ' + EdittTabelaBDE.Text);
  SqlBde.Active := True;

  QtdLinnhas := SqlBde.RecordCount;
  ProgressBar1.Max := QtdLinnhas;
  Label7.Caption := 'Status: ' + 'Inserindo 0 / ' + IntToStr(QtdLinnhas);
  Application.ProcessMessages;

  ProgressBar1.Position := 0;
  Cont := 0;

  //***** Laço Pela DbGride  ********************************
  Cont := 0;
  with DBGrid1.DataSource.DataSet do
  begin
      First;
      for vlLinha := 0 to RecordCount - 1 do
      begin
        DBGrid1.SelectedRows.CurrentRowSelected := True;
        // iserir a linha no Mysql
        TblMySql.Insert;
        for TotCampos := 0 to DBGrid1.DataSource.DataSet.Fields.Count - 1 do
        begin
          //if (DBGrid1.DataSource.DataSet.Fields[TotCampos].AsString = 'True') or (DBGrid1.DataSource.DataSet.Fields[TotCampos].AsString = 'False')
          if (DBGrid1.DataSource.DataSet.Fields[TotCampos].DataType = ftBoolean ) or (DBGrid1.DataSource.DataSet.Fields[TotCampos].DataType = ftMemo) then
          begin
            if (DBGrid1.DataSource.DataSet.Fields[TotCampos].AsString = 'True') then
            begin
              TblMySql.Fields[TotCampos].AsString := '1';
            end;
            if (DBGrid1.DataSource.DataSet.Fields[TotCampos].AsString = 'False') then
            begin
              TblMySql.Fields[TotCampos].AsString := '0';
            end;

            if (DBGrid1.DataSource.DataSet.Fields[TotCampos].DataType = ftMemo) then
            begin
              MemoMemo.Lines.Clear;
              MemoMemo.Text := DBGrid1.DataSource.DataSet.Fields[TotCampos].AsString;
              TblMySql.Fields[TotCampos].Value :=  MemoMemo.Text;
              MemoMemo.Lines.Clear;
            end;

          end
          else
          begin
            TblMySql.Fields[TotCampos].AsString :=  DBGrid1.DataSource.DataSet.Fields[TotCampos].AsString;
          end;



          //TblMySql.Fields[TotCampos].AsString :=  DBGrid1.DataSource.DataSet.Fields[TotCampos].AsString;
        end;
        TblMySql.Post;
        DBGrid1.SelectedRows.CurrentRowSelected := False;

        //teste dos contadores aqui
        Cont := Cont + 1;
        ProgressBar1.Position := ProgressBar1.Position + 1;
        Label7.Caption := 'Status: ' + 'Inserindo ' + IntToStr(Cont) + ' / ' + IntToStr(QtdLinnhas);
        Application.ProcessMessages;
        //--------------------------------

        Next;
      end;

  end;




  //*********************************************************





  ShowMessage('Transferência Realizada com Sucesso !!!');



end;

procedure TFrmPrincipal.BtnBkBancoClick(Sender: TObject);
  var
  caminhoBD, caminhoDUMP, nome : string;
begin
  // Botão para exportar arquivo Dump de Banco Mysql
  // Ainda mexendo nessa função, não está pronta ainda - boão invisivel

   nome :=  FormatDateTime('dd-mm-yyyy', now);
   caminhoBD := GetCurrentDir + '\BD\';
   caminhoBD := caminhoBD + nome +'.sql';
   caminhoDUMP := GetCurrentDir + '\BD\mysqldump.exe';

   ShowMessage('Caminho: ' + caminhoDUMP);

   ShellExecute(handle,'open', 'cmd.exe',Pchar(caminhoDUMP + 'mysqldump -u root -p nome_banco' + caminhoBD),nil, SW_SHOW );

   //backupDados := true;


   ShowMessage('Acabou!');

end;

procedure TFrmPrincipal.BtnUpdateMyClick(Sender: TObject);
begin
  // Query de Update MySql - Danny - 24-10-2023

  if ChecarBDConectado('MySql') = false then
  begin
    ShowMessage('Banco MySql não está conectado.' + #13 + 'Configure o banco Mysql.');
    abort;
    exit;
  end;
  try
    TextoSqlMySqlLog := '';
    TextoSqlMySqlLog := MemoSqlMy.Text;
    Sql_My.Active := False;
    Sql_My.SQL.Clear;
    Sql_My.SQL.Add(MemoSqlMy.Text);
    Sql_My.ExecSQL;
    Label5.Caption := 'Resultado: ' + IntToStr(Sql_My.RowsAffected) + ' Linhas afetadas.';
    ShowMessage('UPDATE Realizado com Sucesso! ');
  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
    end;
  end;




end;

procedure TFrmPrincipal.BtnAlterMyClick(Sender: TObject);
begin
  // Botão de fazer Alter Tabel MySql - danny - 24-10-2023

  if ChecarBDConectado('MySql') = false then
  begin
    ShowMessage('Banco MySql não está conectado.' + #13 + 'Configure o banco Mysql.');
    abort;
    exit;
  end;
  try
    TextoSqlMySqlLog := '';
    TextoSqlMySqlLog := MemoSqlMy.Text;
    Sql_My.Active := False;
    Sql_My.SQL.Clear;
    Sql_My.SQL.Add(MemoSqlMy.Text);
    Sql_My.ExecSQL;
    Label5.Caption := 'Resultado: ' + IntToStr(Sql_My.RowsAffected) + ' Linhas afetadas.';
    ShowMessage('ALTER TABLE  Realizado com Sucesso! ');
  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
    end;
  end;




end;

procedure TFrmPrincipal.BtnUpdateBDEClick(Sender: TObject);
begin
  //Botão de Update BDE - danny - 24-10-2023

  if ChecarBDConectado('BDE') = false then
  begin
    ShowMessage('Banco BDE não está conectado.' + #13 + 'Configure o Alias BDE');
    abort;
    exit;
  end;
  try
    TextoSqlBDELog := '';
    TextoSqlBDELog := MemoSqlBDE.Text;
    SqlBde.Active := False;
    SqlBde.SQL.Clear;
    SqlBde.SQL.Add(MemoSqlBDE.Text);
    SqlBde.ExecSQL;
    Label3.Caption := 'Resultado: ' + IntToStr(SqlBde.RowsAffected) + ' Linhas afetadas.';
    ShowMessage('UPDATE Realizado com Sucesso! ');
  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
    end;
  end;




end;

procedure TFrmPrincipal.BtnAlterBDEClick(Sender: TObject);
begin
   //Botão de Alterar Tabela BDE - Danny - 24-10-2023

  if ChecarBDConectado('BDE') = false then
  begin
    ShowMessage('Banco BDE não está conectado.' + #13 + 'Configure o Alias BDE');
    abort;
    exit;
  end;
  try
    TextoSqlBDELog := '';
    TextoSqlBDELog := MemoSqlBDE.Text;
    SqlBde.Active := False;
    SqlBde.SQL.Clear;
    SqlBde.SQL.Add(MemoSqlBDE.Text);
    SqlBde.ExecSQL;
    Label3.Caption := 'Resultado: ' + IntToStr(SqlBde.RowsAffected) + ' Linhas afetadas.';
    ShowMessage('ALTER TABLE Realizado com Sucesso! ');
  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
    end;
  end;


end;

function TFrmPrincipal.ConvertTipoMemo(TextoCampo: String) : String;
  var Resultado, TextoBlob : String;
begin
  MemoConvert.Lines.Clear;

  MemoTextoLimpo.Lines.Clear;

  MemoConvert.Text := TextoCampo;
  Resultado := TrocaCaracterEspecial(MemoConvert.Text, True);//  MemoConvert.Text;
  MemoMemo.Lines.Clear;

  Result := Resultado;

end;

function TFrmPrincipal.TrocaCaracterEspecial(aTexto: string; aLimExt: boolean): string;
  const
  //Lista de caracteres especiais
  xCarEsp: array[1..38] of String = ('á', 'à', 'ã', 'â', 'ä','Á', 'À', 'Ã', 'Â', 'Ä',
                                     'é', 'è','É', 'È','í', 'ì','Í', 'Ì',
                                     'ó', 'ò', 'ö','õ', 'ô','Ó', 'Ò', 'Ö', 'Õ', 'Ô',
                                     'ú', 'ù', 'ü','Ú','Ù', 'Ü','ç','Ç','ñ','Ñ');
  //Lista de caracteres para troca
  xCarTro: array[1..38] of String = ('a', 'a', 'a', 'a', 'a','A', 'A', 'A', 'A', 'A',
                                     'e', 'e','E', 'E','i', 'i','I', 'I',
                                     'o', 'o', 'o','o', 'o','O', 'O', 'O', 'O', 'O',
                                     'u', 'u', 'u','u','u', 'u','c','C','n', 'N');
  //Lista de Caracteres Extras
  xCarExt: array[1..48] of string = ('<','>','!','@','#','$','%','¨','&','*',
                                     '(',')','_','+','=','{','}','[',']','?',
                                     ';',':',',','|','*','"','~','^','´','`',
                                     '¨','æ','Æ','ø','£','Ø','ƒ','ª','º','¿',
                                     '®','½','¼','ß','µ','þ','ý','Ý');
  var
  xTexto : string;
  i : Integer;
begin
    xTexto := aTexto;
   for i:=1 to 38 do
     xTexto := StringReplace(xTexto, xCarEsp[i], xCarTro[i], [rfreplaceall]);
   //De acordo com o parâmetro aLimExt, elimina caracteres extras.  
   if (aLimExt) then
     for i:=1 to 48 do
       xTexto := StringReplace(xTexto, xCarExt[i], '', [rfreplaceall]);  
   Result := xTexto;
end;

function TFrmPrincipal.EliminaFormatacaoBlob(TextoBlob: String): String;
  var
  TextoLimpo: String;
  streStream: TStringStream;
begin

  RichEditBlob.Lines.Clear;
  MemoTextoLimpo.Lines.Clear;

  streStream := TStringStream.Create(TextoBlob);

  RichEditBlob.Lines.LoadFromStream(streStream);
  MemoTextoLimpo.Text :=  RichEditBlob.Text;
  TextoLimpo :=  MemoTextoLimpo.Text;

  Result := TextoLimpo;

end;

procedure TFrmPrincipal.DBGrid2DrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);

  var S : String;
begin
  if Field.IsBlob then
  begin
     S := (EliminaFormatacaoBlob(Field.Value)) ; //EliminaFormatacaoBlob(Field.AsString);
     DBGrid2.DataSource.DataSet.FieldByName(Field.Name).DisplayLabel := S;
  end;
end;

end.
