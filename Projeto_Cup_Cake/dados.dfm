object DmDados: TDmDados
  OldCreateOrder = False
  Left = 290
  Top = 240
  Height = 328
  Width = 700
  object Sql_my: TZQuery
    Connection = Connection
    ReadOnly = True
    Params = <>
    Left = 16
    Top = 8
  end
  object DsSqlMy: TDataSource
    DataSet = Sql_my
    Left = 17
    Top = 56
  end
  object SqlBde: TQuery
    SQL.Strings = (
      '')
    Left = 112
    Top = 8
  end
  object DsSqlBde: TDataSource
    DataSet = SqlBde
    Left = 112
    Top = 56
  end
  object Connection: TZConnection
    ControlsCodePage = cGET_ACP
    AutoEncodeStrings = False
    Properties.Strings = (
      'AutoEncodeStrings=ON')
    Port = 3306
    Protocol = 'mysql-5'
    Left = 624
    Top = 18
  end
  object TblMySql: TZTable
    Connection = Connection
    Left = 256
    Top = 18
  end
  object TblBDE: TTable
    Left = 344
    Top = 16
  end
  object DsMySql: TDataSource
    DataSet = TblMySql
    Left = 262
    Top = 69
  end
  object DsBDE: TDataSource
    DataSet = TblBDE
    Left = 349
    Top = 61
  end
  object SqlMy: TZQuery
    Connection = Connection
    Params = <>
    Left = 464
    Top = 25
  end
  object SqlBDEu: TQuery
    Left = 464
    Top = 75
  end
  object SqlGeralMy: TZQuery
    Connection = Connection
    ReadOnly = True
    Params = <>
    Left = 24
    Top = 160
  end
  object DsSqlGeralMy: TDataSource
    DataSet = SqlGeralMy
    Left = 25
    Top = 208
  end
end
