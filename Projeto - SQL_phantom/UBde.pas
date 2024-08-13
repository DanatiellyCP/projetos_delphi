unit UBde;

interface

uses dados;

function ExecultaQuery(Query: String; IsExec:Boolean): Integer;

implementation

uses DB;

function ExecultaQuery(Query: String; IsExec:Boolean): Integer;
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
    on E: Exception do
    begin
      ShowMessage(E.Message);
    end;
  end;

end;

end.
 