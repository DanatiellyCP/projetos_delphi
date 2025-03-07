unit dados;

interface

uses
  SysUtils, Classes, ZAbstractTable, ZDataset, ZAbstractConnection,
  ZConnection, DBTables, DB, ZAbstractRODataset, ZAbstractDataset;

type
  TDmDados = class(TDataModule)
    Sql_my: TZQuery;
    DsSqlMy: TDataSource;
    SqlBde: TQuery;
    DsSqlBde: TDataSource;
    Connection: TZConnection;
    TblMySql: TZTable;
    TblBDE: TTable;
    DsMySql: TDataSource;
    DsBDE: TDataSource;
    SqlMy: TZQuery;
    SqlBDEu: TQuery;
    SqlGeralMy: TZQuery;
    DsSqlGeralMy: TDataSource;
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
