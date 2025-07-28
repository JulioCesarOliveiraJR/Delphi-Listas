object dm: Tdm
  OnCreate = DataModuleCreate
  Height = 550
  Width = 343
  object conn: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Julio\Desktop\02 - Populando uma listview\Font' +
        'es\DB\banco.db'
      'OpenMode=ReadWrite'
      'LockingMode=Normal'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    Left = 56
    Top = 24
  end
  object qry_geral: TFDQuery
    Connection = conn
    Left = 136
    Top = 24
  end
end
