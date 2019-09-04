unit ufMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ExtDlgs,
  System.NetEncoding, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, cxImage;

type
  TfMain = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMain: TfMain;

implementation

uses umyUtils, uDmServer;

{$R *.dfm}

procedure TfMain.Button1Click(Sender: TObject);
begin
  if dmserver.DSServer1.Started then
  begin
    Label1.Caption:='Servidor parado';
    button1.Caption:='iniciar';
    dmserver.DSServer1.Stop;
  end else begin
    Label1.Caption:='Servidor iniciado';
    button1.Caption:='Parar';
    dmserver.DSServer1.Start
  end;


end;

end.
