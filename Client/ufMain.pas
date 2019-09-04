unit ufMain;

{*******************************************************************************
    Project link   : https://https://github.com/gilmarcarvalho/DemoRESTBase64
    Created In     : 2019-09-04 13:18:10
    Created By     : Gilmar Alves de Carvalho - (linkedin.com/in/gilmar-carvalho)
*******************************************************************************}


interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
System.Classes, Vcl.Graphics,  Vcl.Controls, Vcl.Forms,  Data.DB,
FireDAC.Stan.Intf,   FireDAC.Stan.Option, FireDAC.Stan.Param,
FireDAC.Stan.Error, FireDAC.DatS,  FireDAC.Phys.Intf, FireDAC.DApt.Intf,
 FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids,
 Vcl.DBGrids,  Data.Bind.Components, Data.Bind.ObjectScope,
 Vcl.StdCtrls,  Vcl.ExtCtrls,  Vcl.ValEdit, Vcl.ComCtrls,System.NetEncoding,
 Vcl.Imaging.Jpeg, WSClient,Dialogs;

type
  TfMain = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Label4: TLabel;
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    DBGrid3: TDBGrid;
    FDMemTable1: TFDMemTable;
    DataSource1: TDataSource;
    Panel1: TPanel;
    Button2: TButton;
    Panel2: TPanel;
    Label2: TLabel;
    FDMemTable1Codigo: TIntegerField;
    FDMemTable1Nome: TStringField;
    FDMemTable1Imagem: TBlobField;
    Label3: TLabel;
    RichEdit1: TRichEdit;
    Panel3: TPanel;
    Image1: TImage;
    procedure FDMemTable1AfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Processing:boolean;
    baseURL:string;
    WSClient:TWSClient;
    Procedure Base64toPicture(B64Value:string; toPic:TPicture);

  public

    { Public declarations }
  end;

var
  fMain: TfMain;

implementation

{$R *.dfm}

procedure  TfMain.Base64toPicture(B64Value:string; toPic:TPicture);
var st : TStringStream;
  Img : TMemoryStream;
begin
{declare unit for each corresponding
  image format ex.vcl.imaging.jpeg, vlc.imaging.png}
  try
    st := TStringStream.Create(B64Value);
    st.Position := 0;
    img := TMemoryStream.Create;
    TNetEncoding.Base64.Decode(st, img);
    img.Position := 0;
    toPic.LoadFromStream(img);
  finally
    st.Free;
    img.Free;
  end;

end;

procedure TfMain.Button2Click(Sender: TObject);
begin
  processing:=true;
  wsclient.JsonToDataset(baseURL+'/tpessoa/list',fdmemtable1);
  processing:=false;
end;

procedure TfMain.FDMemTable1AfterScroll(DataSet: TDataSet);
var
s:string;
begin
  if processing then exit;
  s:=fdmemtable1.Fields[2].AsString;
  richedit1.Lines.Text:=s;
  Base64toPicture(s,image1.Picture);

end;

procedure TfMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  wsclient.Free;
end;

procedure TfMain.FormShow(Sender: TObject);
begin
  WSClient:=tWSClient.create;
  baseurl:='http://localhost:8080/datasnap/rest';
end;


end.
