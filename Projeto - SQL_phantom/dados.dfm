object DmDados: TDmDados
  OldCreateOrder = False
  Left = 241
  Top = 145
  Height = 359
  Width = 726
  object OpenDialog1: TOpenDialog
    Left = 480
    Top = 56
  end
  object TblMySql: TZTable
    Connection = Connection
    Left = 168
    Top = 26
  end
  object Connection: TZConnection
    ControlsCodePage = cGET_ACP
    AutoEncodeStrings = False
    HostName = 'localhost'
    Port = 3306
    User = 'root'
    Protocol = 'mysql-5'
    Left = 656
    Top = 18
  end
  object SqlBde: TQuery
    SQL.Strings = (
      '')
    Left = 80
    Top = 16
  end
  object Sql_my: TZQuery
    Connection = Connection
    ReadOnly = True
    Params = <>
    Left = 16
    Top = 16
  end
  object DsSqlMy: TDataSource
    DataSet = Sql_my
    Left = 17
    Top = 64
  end
  object DsSqlBde: TDataSource
    DataSet = SqlBde
    Left = 80
    Top = 64
  end
end
