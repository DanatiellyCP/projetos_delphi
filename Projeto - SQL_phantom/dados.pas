unit dados;

interface

uses
  SysUtils, Classes, DB, ZDataset, DBTables, ZAbstractConnection,
  ZConnection, ZAbstractRODataset, ZAbstractDataset, ZAbstractTable,
  Dialogs;

type
  TDmDados = class(TDataModule)
    OpenDialog1: TOpenDialog;
    TblMySql: TZTable;
    Connection: TZConnection;
    SqlBde: TQuery;
    Sql_my: TZQuery;
    DsSqlMy: TDataSource;
    DsSqlBde: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmDados: TDmDados;

implementation

{$R *.dfm}

end.
