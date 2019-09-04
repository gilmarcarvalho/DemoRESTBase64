program Server;

uses
  Vcl.Forms,
  ufMain in 'ufMain.pas' {fMain},
  uDmServer in 'uDmServer.pas' {DMServer: TDataModule},
  uModel in 'uModel.pas',
  uMyUtils in 'uMyUtils.pas';

{$R *.res}

begin
  //system.ReportMemoryLeaksOnShutdown:=true;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfMain, fMain);
  Application.CreateForm(TDMServer, DMServer);
  Application.Run;
end.
