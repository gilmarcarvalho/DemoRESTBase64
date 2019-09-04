unit uDmServer;

{*******************************************************************************
    Project link   : https://https://github.com/gilmarcarvalho/DemoRESTBase64
    Created In     : 2019-09-04 13:18:10
    Created By     : Gilmar Alves de Carvalho - (linkedin.com/in/gilmar-carvalho)
*******************************************************************************}

interface

uses
  System.SysUtils, System.Classes, IPPeerServer, Datasnap.DSCommonServer,
  Datasnap.DSServer, Datasnap.DSHTTP;

type
  TDMServer = class(TDataModule)
    DSServerClass1: TDSServerClass;
    DSHTTPService1: TDSHTTPService;
    DSServer1: TDSServer;
    procedure DSServerClass1GetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMServer: TDMServer;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uModel, ufMain;

{$R *.dfm}

procedure TDMServer.DSServerClass1GetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
 PersistentClass:=umodel.tpessoa;
end;

end.
