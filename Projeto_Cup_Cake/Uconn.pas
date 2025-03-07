unit UConn;

interface

uses  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBTables, DBGrids;

function ExecultaQuery(Query: String; IsExec:Boolean; Banco: String): Integer;
function VeriicaCamposTabela(Grid: TDBGrid; Banco: String) : String;
function VeriicaTipoCampo(Grid: TDBGrid; Banco: String) : String;
procedure SelectTabela(Tabela:String; Banco: String; StringCampos: String; StringWhere: String);

function TrataCampo(Tipo:TFieldType; Valor:String): String;
function LevenshteinDistance(const s1, s2: string): Integer;
function Min(a, b: Integer): Integer;


implementation

uses dados, Principal;

function ExecultaQuery(Query: String; IsExec:Boolean; Banco: String): Integer;
begin
  if Banco = 'BDE' then
  begin
     try
        DmDados.SqlBde.Active := False;
        DmDados.SqlBde.SQL.Clear;
        DmDados.SqlBde.SQL.Add(Query);

        if IsExec = False then
        begin
          DmDados.SqlBde.Active := True;
        end
        else
        begin
          DmDados.SqlBde.ExecSQL;
        end;
        Result := DmDados.SqlBde.RecordCount;
      except
      on E: Exception  do
      begin
        ShowMessage(E.Message);
      end;
    end;
  end
  else //// mysql
  begin
    try
        DmDados.Sql_my.Active := False;
        DmDados.Sql_my.SQL.Clear;
        DmDados.Sql_my.SQL.Add(Query);

        if IsExec = False then
        begin
          DmDados.Sql_my.Active := True;
        end
        else
        begin
          DmDados.Sql_my.ExecSQL;
        end;
        Result := DmDados.Sql_my.RecordCount;
      except
      on E: Exception  do
      begin
        ShowMessage(E.Message);
      end;
    end;

  end;

end;

function VeriicaCamposTabela(Grid: TDBGrid; Banco: String) : String;
  var
  I : Integer;
  Retorno : String;
begin
  Retorno := '';

  for i := 0 to Grid.Columns.Count - 1 do
  begin
    if i = 0 then
    begin
      Retorno := Grid.Fields[i].FieldName + #13;
    end
    else
    begin
      Retorno := Retorno +  Grid.Fields[i].FieldName + #13;
    end;
  end;

  Result := Retorno;

end;

function VeriicaTipoCampo(Grid: TDBGrid; Banco: String) : String;
  var Tipo, Retorno : String;
  J, I : Integer;
begin
  if Banco = 'BDE' then
  begin
     Grid.DataSource.DataSet.First;
     //while not Grid.DataSource.DataSet.Eof do
     for I := 1 to 2 do
     begin
        Retorno := '';
        for j := 0 to Grid.Columns.Count -1 do
        begin
          if j = 0 then
          begin
            Retorno := FieldTypeNames[Grid.Fields[J].DataType] + #13;
          end
          else
          begin
            Retorno := Retorno + FieldTypeNames[Grid.Fields[J].DataType] + #13;
          end;
        end;
         Grid.DataSource.DataSet.Next;
     end;

     Result := Retorno;
  end;

  if Banco = 'MySql' then
  begin
     Grid.DataSource.DataSet.First;
     //while not Grid.DataSource.DataSet.Eof do
     for I := 1 to 2 do
     begin
        Retorno := '';
        for j := 0 to Grid.Columns.Count -1 do
        begin
          if j = 0 then
          begin
            Retorno := FieldTypeNames[Grid.Fields[J].DataType] + #13;
          end
          else
          begin
            Retorno := Retorno + FieldTypeNames[Grid.Fields[J].DataType] + #13;
          end;
        end;
         Grid.DataSource.DataSet.Next;
     end;

     Result := Retorno;
  end;

end;

procedure SelectTabela(Tabela:String; Banco: String ; StringCampos: String ; StringWhere: String);
begin
  if Banco = 'BDE' then
  begin
    DmDados.SqlBde.Active := False;
    DmDados.SqlBde.SQL.Clear;
    if StringCampos = '' then
      DmDados.SqlBde.SQL.Add('SELECT * FROM ' + Tabela + StringWhere)
    else
      DmDados.SqlBde.SQL.Add('SELECT ' + StringCampos + ' FROM ' + Tabela + StringWhere);

    DmDados.SqlBde.Active := True;
  end
  else
  begin
    DmDados.Sql_my.Active := False;
    DmDados.Sql_my.SQL.Clear;
    if StringCampos = '' then
      DmDados.Sql_my.SQL.Add('SELECT * FROM ' + Tabela + StringWhere)
    else
      DmDados.Sql_my.SQL.Add('SELECT ' + StringCampos + ' FROM ' + Tabela + StringWhere);

    DmDados.Sql_my.Active := True;
    
  end;
end;


function TrataCampo(Tipo:TFieldType; Valor:String): String;
  var Retorno : String;
  DataEntrada : TDate;
  DataSaida : String;
begin

  Retorno := Valor;

  if Valor <> '' then
  begin
    if Tipo = ftBoolean then
    begin
      if valor = 'False' then
        Retorno := '0'
      else
        Retorno := '1';
    end;

    if Tipo = ftMemo then
    begin
      FrmPrincipal.MemoMemo.Lines.Clear;
      FrmPrincipal.MemoMemo.Text := Valor;
      Retorno := QuotedStr(FrmPrincipal.MemoMemo.Text);
      FrmPrincipal.MemoMemo.Lines.Clear;
    end;

    if Tipo = ftDate then
    begin
       DataEntrada := StrToDate(Valor);
       DataSaida := FormatDateTime('yyyy-mm-dd', DataEntrada);
       Retorno := QuotedStr(DataSaida);
    end;

    if Tipo = ftString then
    begin
      Retorno := QuotedStr(Valor);
    end;


  end
  else
  begin
    Retorno := '';
  end;

  Result := Retorno;


end;

function LevenshteinDistance(const s1, s2: string): Integer;
var
  i, j, cost: Integer;
  d: array of array of Integer;
begin
  SetLength(d, Length(s1) + 1, Length(s2) + 1);

  for i := 0 to Length(s1) do
    d[i, 0] := i;

  for j := 0 to Length(s2) do
    d[0, j] := j;

  for i := 1 to Length(s1) do
  begin
    for j := 1 to Length(s2) do
    begin
      if s1[i] = s2[j] then
        cost := 0
      else
        cost := 1;

      d[i, j] := Min(Min(d[i - 1, j] + 1, d[i, j - 1] + 1), d[i - 1, j - 1] + cost);
    end;
  end;

  Result := d[Length(s1), Length(s2)];
end;

function Min(a, b: Integer): Integer;
begin
  if a < b then
    Result := a
  else
    Result := b;
end;






end.
 