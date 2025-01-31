unit Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Buttons, StdCtrls, DBTables, Grids, DBGrids,
  DB, ExtCtrls, JvExControls, JvSpeedButton, UButtons_camaleao;

type TCamposTipo = record
  Campo : String;
  Tipo : String;
end;

type
  TFrmPrincipal = class(TForm)
    PageControl1: TPageControl;
    TSBancos: TTabSheet;
    TSCompTab: TTabSheet;
    MemoCampos: TMemo;
    DBGridTabela: TDBGrid;
    TxtNomeTabela: TEdit;
    Label1: TLabel;
    MemoTipos: TMemo;
    DBGridTabelaMy: TDBGrid;
    MemoCamposMy: TMemo;
    MemoTipoMy: TMemo;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    TxtNomeTabelaMy: TEdit;
    MemoComp: TMemo;
    SaveDialog1: TSaveDialog;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    Label10: TLabel;
    ListBox1: TListBox;
    Session1: TSession;
    GroupBox2: TGroupBox;
    Label11: TLabel;
    QtdTabelas: TLabel;
    ListBoxTabelas: TListBox;
    Memo1: TMemo;
    Memo2: TMemo;
    Label12: TLabel;
    Label13: TLabel;
    LblQtdCampos: TLabel;
    MemoGetDados: TMemo;
    Label14: TLabel;
    MemoRelatorio: TMemo;
    BtnListarAlias: TBtnSuccess;
    BtnConectar: TBtnDark;
    BtnTeste: TBtnDark;
    BtnUpGeral: TBtnDark;
    BtnPimary1: TBtnPimary;
    BtnComp: TBtnInfo;
    BtnGerarLista: TBtnWarning;
    BtnLimpar: TBtnLight;
    BtnPegarTabelas: TBtnPimary;
    BtnGerarRelatorio: TBtnSecundary;
    MemoMemo: TMemo;
    TabSheet2: TTabSheet;
    GroupBox3: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label15: TLabel;
    MemoCampsMy: TMemo;
    MemoTipsMy: TMemo;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    BtnConectarMy: TBtnPimary;
    EditNomeBancoMy: TEdit;
    EditHost: TEdit;
    EditPass: TEdit;
    EditUser: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    ListBoxTabelasMy: TListBox;
    BtnGerarClasseMy: TBtnSuccess;
    MemoArqClasse: TMemo;
    Label21: TLabel;
    BtnSqlBde: TBtnDark;
    BtnSqlMy: TBtnDark;
    BtnCriarProjeto: TBtnDark;
    procedure ListBox1Click(Sender: TObject);
    procedure ListBoxTabelasClick(Sender: TObject);
    procedure BtnConectarClick(Sender: TObject);
    procedure BtnTesteClick(Sender: TObject);
    procedure BtnUpGeralClick(Sender: TObject);
    procedure BtnListarAliasClick(Sender: TObject);
    procedure BtnPimary1Click(Sender: TObject);
    procedure BtnCompClick(Sender: TObject);
    procedure BtnWarning1Click(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
    procedure BtnPegarTabelasClick(Sender: TObject);
    procedure BtnGerarRelatorioClick(Sender: TObject);
    procedure BtnConectarMyClick(Sender: TObject);
    procedure ListBoxTabelasMyClick(Sender: TObject);
    procedure BtnGerarClasseMyClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure limpa;
    function DiferencaMemo(MemoComparar, MemoBase:TMemo):TStringList;
    procedure CarregarDadosCampos(Campo:String);
    procedure CreateClassMySql;
    function EspacosVazios(TamanhoCampo: Integer): String;
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation
  uses Conexao, Dados, UConn, UpdateGeral, ZConnection;

{$R *.dfm}

procedure TFrmPrincipal.limpa;
begin
  MemoCampos.Lines.clear;
  MemoTipos.Lines.Clear;
  MemoCamposMy.Lines.clear;
  MemoTipoMy.Lines.Clear;

  TxtNomeTabela.Text := '';
  TxtNomeTabelaMy.Text := '';

  DmDados.SqlBde.Active := False;
  DmDados.SqlBde.SQL.Clear;

  DmDados.Sql_my.Active := False;
  DmDados.Sql_my.SQL.Clear;

  Application.ProcessMessages;



end;



function TFrmPrincipal.DiferencaMemo(MemoComparar, MemoBase: TMemo): TStringList;
  var
  I, J:Integer;
  Lista:TStringList;

begin
   Lista := TStringList.Create;

   for I := 0 To MemoComparar.lines.Count do
   begin
      for J := 0 to MemoBase.Lines.Count do
      begin
        if MemoComparar.Lines[I] = MemoBase.Lines[J] then
        begin
          Lista.Add(MemoComparar.Lines[I]);
        end;

      end;

   end;

  Result := Lista;

end;



procedure TFrmPrincipal.ListBox1Click(Sender: TObject);
  var
  MyStringList: TStringList;
  i: integer;
begin
  // Exibir as tabelas do alias selecionado
  ListBoxTabelas.Items.Clear;
  Application.ProcessMessages;


  MyStringList := TStringList.Create;
  Session.GetTableNames(ListBox1.Items[ListBox1.ItemIndex] , '', True, False, MyStringList);

  for I := 0 to MyStringList.Count - 1 do
    ListBoxTabelas.Items.Add(MyStringList[I]);


  QtdTabelas.Caption := IntToStr(ListBoxTabelas.Items.Count);

end;

procedure TFrmPrincipal.ListBoxTabelasClick(Sender: TObject);
  var
  TabelaCampos, TabelaTipos: String;
  Tabela : String;
  TabelasStringList: TStringList;
  I : Integer;
  NomeTabela, NomeBanco : String;
begin
  // Listar campos da tabela selecionada
  // Verificar tipo de campos da tabela

  Memo1.Lines.Clear;
  Memo2.Lines.Clear;
  LblQtdCampos.Caption := '000';
  Application.ProcessMessages;

  NomeBanco := '';
  NomeTabela := '';

  NomeBanco := ListBox1.Items[ListBox1.ItemIndex];
  NomeTabela := StringReplace(ListBoxTabelas.Items[ListBoxTabelas.ItemIndex],'.DB','',[rfReplaceAll]);
  TabelasStringList := TStringList.Create;

  //ShowMessage(NomeBanco + ' ' + NomeTabela);

  Session.GetFieldNames(NomeBanco, NomeTabela, TabelasStringList);

  //ShowMessage(IntToStr(TabelasStringList.Count));

  for I := 0 to TabelasStringList.Count-1 do
  begin
    Memo1.Lines.Add(TabelasStringList[I]);
  end;

  LblQtdCampos.Caption := IntToStr(Memo1.Lines.Count);
  Application.ProcessMessages;


  DmDados.SqlBde.Active := False;
  DmDados.SqlBde.DatabaseName := NomeBanco;
  DmDados.SqlBde.SQL.Clear;
  DmDados.SqlBde.SQL.Add('SELECT * FROM ' + NomeTabela);
  DmDados.SqlBde.Active := True;

  TabelaTipos := VeriicaTipoCampo(DBGridTabela, 'BDE');
  Memo2.Lines.Clear;
  Memo2.Lines.Text := TabelaTipos;
  Application.ProcessMessages;



end;

procedure TFrmPrincipal.CarregarDadosCampos(Campo: String);
   var
  TabelaCampos, TabelaTipos: String;
  Tabela : String;
  TabelasStringList: TStringList;
  I : Integer;
  NomeTabela, NomeBanco : String;
begin
   Memo1.Lines.Clear;
  Memo2.Lines.Clear;
  LblQtdCampos.Caption := '000';
  Application.ProcessMessages;

  NomeBanco := '';
  NomeTabela := '';

  NomeBanco := ListBox1.Items[ListBox1.ItemIndex];
  NomeTabela := Campo;  //StringReplace(ListBoxTabelas.Items[ListBoxTabelas.ItemIndex],'.DB','',[rfReplaceAll]);
  TabelasStringList := TStringList.Create;

  //ShowMessage(NomeBanco + ' ' + NomeTabela);

  Session.GetFieldNames(NomeBanco, NomeTabela, TabelasStringList);

  //ShowMessage(IntToStr(TabelasStringList.Count));

  for I := 0 to TabelasStringList.Count-1 do
  begin
    Memo1.Lines.Add(TabelasStringList[I]);
  end;

  LblQtdCampos.Caption := IntToStr(Memo1.Lines.Count);
  Application.ProcessMessages;


  DmDados.SqlBde.Active := False;
  DmDados.SqlBde.DatabaseName := NomeBanco;
  DmDados.SqlBde.SQL.Clear;
  DmDados.SqlBde.SQL.Add('SELECT * FROM ' + NomeTabela);
  DmDados.SqlBde.Active := True;

  TabelaTipos := VeriicaTipoCampo(DBGridTabela, 'BDE');
  Memo2.Lines.Clear;
  Memo2.Lines.Text := TabelaTipos;
  Application.ProcessMessages;

end;

procedure TFrmPrincipal.BtnConectarClick(Sender: TObject);
begin
  FrmConexao.Show;
end;

procedure TFrmPrincipal.BtnTesteClick(Sender: TObject);
  var
  dist: Integer;
  Palavra1, Palavra2 : String;
begin
   Palavra1 := InputBox('Primeira Palavra ' ,'', '');
  Palavra2 := InputBox('Segunda Palavra ' ,'', '');

  //dist := LevenshteinDistance('DtCadastro', 'Data_Cadastro');

  dist := LevenshteinDistance(Palavra1, Palavra2);
  ShowMessage('Distância de Levenshtein: ' + IntToStr(dist));
end;

procedure TFrmPrincipal.BtnUpGeralClick(Sender: TObject);
begin
   // chamar o exe de updates geral
  //WinExec('Updates.exe', sw_show);

  FrmUpdateGeral.Show;
end;

procedure TFrmPrincipal.BtnListarAliasClick(Sender: TObject);
var
  MyStringList: TStringList;
  i: integer;
begin
  MyStringList := TStringList.Create;
  Session.GetAliasNames(MyStringList);
  for I := 0 to MyStringList.Count - 1 do
    ListBox1.Items.Add(MyStringList[I]);
end;

procedure TFrmPrincipal.BtnPimary1Click(Sender: TObject);
  var
  TabelaCampos, TabelaTipos: String;
  Tabela : String;

  TabelaCamposMy, TabelaTiposMy: String;
  TabelaMy : String;

begin
 // Verificar tipo de campos da tabela
 Tabela := TxtNomeTabela.Text;

 SelectTabela(Tabela, 'BDE', '', '');

 TabelaCampos := VeriicaCamposTabela(DBGridTabela, 'BDE');
 MemoCampos.Lines.Clear;
 MemoCampos.Lines.Text := TabelaCampos;
 Application.ProcessMessages;


 TabelaTipos := VeriicaTipoCampo(DBGridTabela, 'BDE');
 MemoTipos.Lines.Clear;
 MemoTipos.Lines.Text := TabelaTipos;
 Application.ProcessMessages;

 //************ mysql ***********************

 TabelaMy := TxtNomeTabelaMy.Text;

 SelectTabela(TabelaMy, 'MySql', '', '');

 TabelaCamposMy := VeriicaCamposTabela(DBGridTabelaMy, 'MySql');
 MemoCamposMy.Lines.Clear;
 MemoCamposMy.Lines.Text := TabelaCamposMy;
 Application.ProcessMessages;


 TabelaTiposMy := VeriicaTipoCampo(DBGridTabelaMy, 'MySql');
 MemoTipoMy.Lines.Clear;
 MemoTipoMy.Lines.Text := TabelaTiposMy;
 Application.ProcessMessages;

end;

procedure TFrmPrincipal.BtnCompClick(Sender: TObject);
 var
  Titulo, Linhas : String;
  I, MaiorMemo : Integer;
begin

  Titulo := '';
  Linhas := '';

  If MemoCampos.Lines.Count >= MemoCamposMy.Lines.Count then
  begin
    MaiorMemo := MemoCampos.Lines.Count
  end
  else
  begin
    MaiorMemo := MemoCamposMy.Lines.Count;
  end;

  Titulo := 'CampoBDE;TipoBDE;CampoMySql;TipoMySql';

  MemoComp.Lines.Add(Titulo);

  for I := 0 to MaiorMemo do
  begin
    Linhas := MemoCampos.Lines.Strings[I] + ';' + MemoTipos.Lines.Strings[i] + ';' + MemoCamposMy.Lines.Strings[i] + ';' + MemoTipoMy.Lines.Strings[I];
    MemoComp.Lines.Add(Linhas);
  end;

  ShowMessage('Pronto!');

end;

procedure TFrmPrincipal.BtnWarning1Click(Sender: TObject);
 var local : String;
   Lista, ListaFim : TStringList;
   I, J : Integer;

begin

  //MemoComp.Lines.SaveToFile('Comp_' + TxtNomeTabela.Text + '.csv');

  Lista := TStringList.Create;
  ListaFim := TStringList.Create;

  for I := 0 to MemoCampos.Lines.Count -1 do
  begin
    for J := 0 to MemoCamposMy.Lines.Count -1 do
    begin
      //if (MemoCampos.Lines[i] = MemoCamposMy.Lines[j]) then
      if LevenshteinDistance(MemoCampos.Lines[i], MemoCamposMy.Lines[j]) < 5 then
      begin
        // Adiciona a string encontrada na ListaComuns
        Lista.Add(MemoCampos.Lines[i]);
        Break;  // Sai do loop de Memo2 para evitar duplicatas na ListaComuns
      end;
    end;

  end;

  if SaveDialog1.Execute then
  begin
    Lista.SaveToFile(SaveDialog1.FileName + '.csv');
  end;


  ShowMessage('Feito !!!');
end;

procedure TFrmPrincipal.BtnLimparClick(Sender: TObject);
begin
  TxtNomeTabela.Text := '';
  TxtNomeTabelaMy.Text := '';

  MemoCampos.Lines.Clear;
  MemoTipos.Lines.Clear;
  MemoCamposMy.Lines.Clear;
  MemoTipoMy.Lines.Clear;

  MemoComp.Lines.Clear;

  Application.ProcessMessages;

end;

procedure TFrmPrincipal.BtnPegarTabelasClick(Sender: TObject);
var
  I : Integer;
begin
  // Passar as tabelas selecionadas para um memo para poder copiar

  for I := 0 to ListBoxTabelas.Count - 1 do
  begin
    MemoGetDados.Lines.Add(IntToStr(I +1) + ' - ' + StringReplace(ListBoxTabelas.Items.Strings[I], '.DB','',[rfReplaceAll]));
  end;
end;

procedure TFrmPrincipal.BtnGerarRelatorioClick(Sender: TObject);
var
  I, J : Integer;
  MyStringList: TStringList;
begin
  // Gerar relatório listando as tabelas de um banco, com os dados e seus tipos
   MyStringList := TStringList.Create;
  Session.GetTableNames(ListBox1.Items[ListBox1.ItemIndex] , '', True, False, MyStringList);

  MemoRelatorio.Lines.Clear;
  MemoRelatorio.Lines.Add('Banco;Tabelas');
  MemoRelatorio.Lines.Add('');

  for I := 0 to ListBoxTabelas.Count - 1 do
  begin
     MemoRelatorio.Lines.Add(''+';'+StringReplace(ListBoxTabelas.Items.Strings[I], '.DB','',[rfReplaceAll]));
     try
      CarregarDadosCampos(StringReplace(ListBoxTabelas.Items.Strings[I], '.DB','',[rfReplaceAll]));
     except
     end;

     MemoRelatorio.Lines.Add(''+';'+''+';'+ 'Campos' +';'+ 'Tipo');
    for J := 0 to Memo1.Lines.Count -1 do
    begin
      MemoRelatorio.Lines.Add(''+';'+''+';'+Memo1.Lines.Strings[J] +';'+ Memo2.Lines.Strings[J]);
    end;
  end;

  if SaveDialog1.Execute then
  begin
    MemoRelatorio.Lines.SaveToFile(SaveDialog1.FileName + '.csv');
  end;


end;

procedure TFrmPrincipal.BtnConectarMyClick(Sender: TObject);
  var
  TabelaMy, TabelaCamposMy, TabelaTiposMy, Schemaname : String;
begin
  // Conectar a um banco mysql e listar as suas tabelas
  if (EditNomeBancoMy.Text <> '') and (EditHost.Text <> '') and (EditUser.Text <> '')  then
  begin
    DmDados.Connection.HostName := EditHost.Text;
    DmDados.Connection.Password := EditPass.Text;
    DmDados.Connection.Database := EditNomeBancoMy.Text;
    DmDados.Connection.User := EditUser.Text;

     //************ Listar tabelas mysql ***********************
    Schemaname := DmDados.Connection.Database;
    DmDados.SqlGeralMy.Active := False;
    DmDados.SqlGeralMy.SQL.Clear;
    DmDados.SqlGeralMy.SQL.Add('SHOW TABLES FROM ' + Schemaname);
    DmDados.SqlGeralMy.ExecSQL;

    DmDados.SqlGeralMy.Open;
    DmDados.SqlGeralMy.First;

    while not DmDados.SqlGeralMy.Eof do
    begin
      ListBoxTabelasMy.Items.Add(DmDados.SqlGeralMy.FieldByName('Tables_in_' + Schemaname).AsString);
      DmDados.SqlGeralMy.Next;
    end;
    ShowMessage('Banco MySql Configurado com Sucesso :-)');
    Application.ProcessMessages;


  end
  else
  begin
    ShowMessage('Preencha todos os campos');
  end;




end;

procedure TFrmPrincipal.ListBoxTabelasMyClick(Sender: TObject);
   var
  TabelaCampos, TabelaTipos: String;
  Tabela : String;
  TabelasStringList: TStringList;
  I : Integer;
  NomeTabela, NomeBanco : String;
begin
  // Listar Campos da tabela selecionada
  // Verificar tipo de campos da tabela

  MemoCampsMy.Lines.Clear;
  MemoTipsMy.Lines.Clear;
  Label15.Caption := '000';
  Application.ProcessMessages;

  NomeBanco := '';
  NomeTabela := '';

  NomeBanco := DmDados.Connection.Database;
  NomeTabela := ListBoxTabelasMy.Items[ListBoxTabelasMy.ItemIndex];
  TabelasStringList := TStringList.Create;

  Label15.Caption := IntToStr(MemoCampsMy.Lines.Count);
  Application.ProcessMessages;


  DmDados.Sql_my.Active := False;
  DmDados.Sql_my.SQL.Clear;
  DmDados.Sql_my.SQL.Add('SELECT * FROM ' + NomeTabela);
  DmDados.Sql_my.Active := True;

  DmDados.Sql_my.GetFieldNames(TabelasStringList);
  for I := 0 to TabelasStringList.Count-1 do
  begin
    MemoCampsMy.Lines.Add(TabelasStringList[I]);
  end;

  TabelaTipos := VeriicaTipoCampo(DBGridTabelaMy, 'MySql');
  MemoTipsMy.Lines.Clear;
  MemoTipsMy.Lines.Text := TabelaTipos;
  Application.ProcessMessages;


end;

procedure TFrmPrincipal.CreateClassMySql;
  var
  NomeTabela, NomeClasse, Atributos, Metodos, Campo, FCampo, UsesProjeto : String;
  ScriptClasse : String;
  Espacos : String;
  I : Integer;


begin
  // Procedure para criar arquivo de classe a partir de tabela MySql
  Espacos := '														';

  NomeTabela :=  ListBoxTabelasMy.Items[ListBoxTabelasMy.ItemIndex];
  NomeClasse :=  'U' + NomeTabela;

  NomeTabela := Copy(NomeTabela, 0, length(NomeTabela) -1);
  ScriptClasse := 'unit ' +  NomeClasse + #13 + #13;

  UsesProjeto := ' UConnection, UFunctions_Helper;';
  ScriptClasse := ScriptClasse + 'interface' + #13 +
  ' uses ' + #13 +
  ' SysUtils, Variants, Classes, Forms, Graphics, Controls, ' + #13 +
  ' StdCtrls, Mask, ExtCtrls, Messages, Dialogs, ' + #13;
  ScriptClasse := ScriptClasse + UsesProjeto + ' // Units necessárias para projeto' + #13 + #13;


  ScriptClasse := ScriptClasse + ' type T'+NomeTabela+' = class' + #13;
  ScriptClasse := ScriptClasse + ' private' + #13;

  Atributos := '';
  for I := 0 to MemoCampsMy.Lines.Count -1 do
  begin
    Atributos :=  Atributos + '   F'+MemoCampsMy.Lines.Strings[I]+': String;' + #13;
  end;

  ScriptClasse := ScriptClasse + Atributos + #13 + #13;


  ScriptClasse := ScriptClasse + ' { private declarations }'+ #13;
  ScriptClasse := ScriptClasse + ' protected' + #13;
  ScriptClasse := ScriptClasse + ' { protected declarations }'+ #13;
  ScriptClasse := ScriptClasse + ' public' + #13;
  ScriptClasse := ScriptClasse + ' { public declarations }' + #13;
  ScriptClasse := ScriptClasse + '  Function Buscar_'+ NomeTabela +'PorCodigo(Codigo : String): Boolean;' + #13;
  ScriptClasse := ScriptClasse + '  Function Buscar_' +NomeTabela+'PorCampo(Campo : String): Boolean;' + #13 + #13;

  ScriptClasse := ScriptClasse + '  published' + #13;
  ScriptClasse := ScriptClasse + '  { published declarations }' + #13;


  // Propriedades
  Metodos := '';
  Campo := '';
  FCampo := '';
  for I := 0 to MemoCampsMy.Lines.Count -1 do
  begin
    Campo := MemoCampsMy.Lines.Strings[I];
    FCampo := 'F'+Campo;
                            //property Codigo       : string read FCodigo       write FCodigo;
    Espacos := EspacosVazios(length(FCampo));
    Metodos :=  Metodos +  '    property ' + Campo + Espacos + ':string read' + Espacos + FCampo + '    ' + 'write' + Espacos + FCampo + ';' + #13;
  end;

  ScriptClasse := ScriptClasse + Metodos + #13 + #13;
  ScriptClasse := ScriptClasse + 'end;' + #13 + #13;

  //Metodos externos da classe
  ScriptClasse := ScriptClasse + '  //Metodos  do arquivo Unit:' + #13;
  ScriptClasse := ScriptClasse + '  procedure Cadastrar_' + NomeTabela + '(' + 'Obj_' + NomeTabela +'  : T'+NomeTabela+');' + #13;
  ScriptClasse := ScriptClasse + '  procedure Editar_'    + NomeTabela + '(' + 'Obj_' + NomeTabela + ' : T'+NomeTabela+');' + #13;
  ScriptClasse := ScriptClasse + '  procedure Excluir_'   + NomeTabela + '(Codigo : Integer);' + #13 + #13;


  ScriptClasse := ScriptClasse + ' implementation' + #13 + #13;
  ScriptClasse := ScriptClasse + '{ T' + NomeTabela + ' }' + #13 + #13;

  // Implementando Métodos da classe
  ScriptClasse := ScriptClasse + '  // Implementando os Metodos, procedures e funções da Classe e da Unit' + #13;
  //Buscar Dados por Codigo
  ScriptClasse := ScriptClasse + 'function T'+NomeTabela+'.Buscar_' + NomeTabela +'PorCodigo(Codigo: String): Bollean;' + #13;
  ScriptClasse := ScriptClasse + 'begin' + #13;
  ScriptClasse := ScriptClasse + ' Pesquisar(Codigo,' + NomeTabela + ');' + #13 + #13;
  ScriptClasse := ScriptClasse + 'end;' + #13 + #13;

  //Buscar Dados por campo String
  ScriptClasse := ScriptClasse + 'function T'+NomeTabela+'.Buscar_' + NomeTabela +'PorCampo(Campo: String): Bollean;' + #13;
  ScriptClasse := ScriptClasse + 'begin' + #13;
  ScriptClasse := ScriptClasse + ' Pesquisar(' + NomeTabela + ', Campo' + ', Campo);' + #13 + #13;
  ScriptClasse := ScriptClasse + 'end;' + #13 + #13;

  //Criar aqui as funções e procedures de Criar, Editar e excluir

  ScriptClasse := ScriptClasse + '  //Inserir aqui as funções e procedures de Criar, Editar e excluir' + #13;
  ScriptClasse := ScriptClasse + '  procedure Cadastrar_' + NomeTabela + '(' + 'Obj_' + NomeTabela +'  : T'+NomeTabela+');' + #13;
  ScriptClasse := ScriptClasse + '  begin' + #13;
  ScriptClasse := ScriptClasse + '  end;' + #13 + #13;


  ScriptClasse := ScriptClasse + '  procedure Editar_'    + NomeTabela + '(' + 'Obj_' + NomeTabela + ' : T'+NomeTabela+');' + #13;
  ScriptClasse := ScriptClasse + '  begin' + #13;
  ScriptClasse := ScriptClasse + '  end;' + #13 + #13;

  ScriptClasse := ScriptClasse + '  procedure Excluir_'    + NomeTabela + '(Codigo : Integer);' + #13;
  ScriptClasse := ScriptClasse + '  begin' + #13;
  ScriptClasse := ScriptClasse + '  end;' + #13 + #13;


  ScriptClasse := ScriptClasse + '  // ----------------------------------------------------------------' + #13;


  ScriptClasse := ScriptClasse + '{ T' + NomeTabela + ' }' + #13 + #13 + 'end.';
  MemoArqClasse.Lines.Text := ScriptClasse;
  Application.ProcessMessages;

end;

procedure TFrmPrincipal.BtnGerarClasseMyClick(Sender: TObject);
begin
  ///
  MemoArqClasse.Lines.Clear;
  Application.ProcessMessages;
  CreateClassMySql;

end;

function TFrmPrincipal.EspacosVazios(TamanhoCampo: Integer): String;
  var I, EspacoPadrao, EspacoFinal : Integer;
  Espaco : Char;
  EspacoRetorno : String;
begin
  Espaco := ' ';

  EspacoPadrao := 30 - (TamanhoCampo);

  EspacoRetorno := '';
  for I:= 0 to EspacoPadrao do
  begin
    EspacoRetorno := EspacoRetorno + Espaco;
  end;

  Result := EspacoRetorno;


end;

end.
