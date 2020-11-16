object DataModuleWK: TDataModuleWK
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 326
  Width = 577
  object FDConnectionWK: TFDConnection
    Params.Strings = (
      'Database=dbwk'
      'User_Name=root'
      'Password=aBm21051982'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 336
    Top = 152
  end
  object FDPhysMySQLDriverLinkWK: TFDPhysMySQLDriverLink
    VendorLib = 'D:\Sistema\WKAtualizado\libmysql.dll'
    Left = 104
    Top = 152
  end
  object FDGUIxWaitCursorWK: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 232
    Top = 152
  end
end
