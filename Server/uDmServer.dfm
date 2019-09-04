object DMServer: TDMServer
  OldCreateOrder = False
  Height = 288
  Width = 401
  object DSServerClass1: TDSServerClass
    OnGetClass = DSServerClass1GetClass
    Server = DSServer1
    Left = 140
    Top = 40
  end
  object DSHTTPService1: TDSHTTPService
    HttpPort = 8080
    Server = DSServer1
    Filters = <>
    Left = 248
    Top = 20
  end
  object DSServer1: TDSServer
    AutoStart = False
    Left = 244
    Top = 80
  end
end
