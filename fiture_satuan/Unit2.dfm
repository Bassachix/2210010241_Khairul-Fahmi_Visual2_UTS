object DataModule2: TDataModule2
  OldCreateOrder = False
  Left = 217
  Top = 220
  Height = 118
  Width = 215
  object tbl_satuan: TDataSource
    DataSet = qry_satuan
    Left = 136
    Top = 16
  end
  object ZConnection1: TZConnection
    ControlsCodePage = cGET_ACP
    AutoEncodeStrings = False
    Connected = True
    HostName = 'localhost'
    Port = 3306
    Database = 'penjualan'
    User = 'root'
    Protocol = 'mysql'
    LibraryLocation = 'D:\Project Delphi\fiture_satuan\libmysql.dll'
    Left = 24
    Top = 16
  end
  object qry_satuan: TZQuery
    Connection = ZConnection1
    Active = True
    SQL.Strings = (
      'SELECT * FROM satuan;')
    Params = <>
    Left = 80
    Top = 16
  end
end
