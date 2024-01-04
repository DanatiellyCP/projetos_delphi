procedure TFrmPrincipal.ExportaGridCsv(Grid : TDBGrid; Msg:String; Titolo, TituloFiltro:String);
  var
  Lin, Col, i : Integer;
  StringLinha, ArquivoNome, LinhaTitulo : String;
begin
  //nova procedure para exportar grid para CSV - danny - 03-01-2024
  // para essa procedure funcionar precisa ter uma grid no form
  // por isso coloquei uma grid no form principal  DBGridCsv

  MemoCsv.Lines.Clear;

  // colocar linha de filtros aplicados no relatório
  if TituloFiltro <> '' then
  begin
    MemoCsv.Lines.Add(TituloFiltro);
  end;

  //Colocar linha de titulos
  if Titolo <> '' then
  begin
    for i := 0 to Grid.Columns.Count - 1 do
    begin
      if i = 0 then
      begin
       LinhaTitulo := Grid.Fields[i].FieldName;
      end
      else
      begin
        LinhaTitulo := LinhaTitulo + ';' +  Grid.Fields[i].FieldName;
      end;
    end;
    MemoCsv.Lines.Add(LinhaTitulo);
  end;


  // Montar o relatório
  StringLinha := '';

  Grid.DataSource.DataSet.First;
  for Lin:= 0 to Grid.DataSource.DataSet.RecordCount do
  begin
    for Col := 0 to Grid.Columns.Count - 1 do
    begin
      if (Col = 0) then
      begin
        StringLinha := Grid.Columns[Col].Field.Text;
      end
      else
      begin
        StringLinha := StringLinha + ';' + Grid.Columns[Col].Field.Text;
      end;
    end; // fim for coluna
      MemoCsv.Lines.Add(StringLinha);
      Grid.DataSource.DataSet.Next;
  end;//fim for Linhha

  // salvar relatório
  if  SaveDialog1.Execute = True then
  begin
    ArquivoNome := SaveDialog1.FileName;
    MemoCsv.Lines.SaveToFile(ArquivoNome + '.csv');
    //ShowMessage('Arquivo CSV Salvo com sucesso !');
    ShowMessage(Msg);
  end;


end;
