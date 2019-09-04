unit WSClient;

{*******************************************************************************
    Project link   : https://https://github.com/gilmarcarvalho/DemoRESTBase64
    Created In     : 2019-09-04 13:18:10
    Created By     : Gilmar Alves de Carvalho - (linkedin.com/in/gilmar-carvalho)
*******************************************************************************}

interface

uses
vcl.controls, Generics.Collections, Rest.Json, System.JSON,Data.DB,REST.Client,
SysUtils,vcl.Graphics,system.classes;

type
TJsonResult = class
  private
    _StatusCode:integer;
    _Content:string;
    _RESTClient: TRESTClient;
    _RESTRequest: TRESTRequest;
    _RESTResponse: TRESTResponse;
  public
    property StatusCode:integer read _StatusCode;
    property Content:String read _Content;
    procedure Execute(aURL:String);
    constructor Create;
    destructor Destroy;override;
end;

type

TWSClient = class
  private
    _JsonResult: TJSONResult;
  public
    Procedure JsonToDataset(URL:string;toDataset:TDataset);
    Constructor Create;
    destructor Destroy; override;
end;

implementation

{TJsonResult}

Constructor TJsonResult.Create;
begin
  _RESTClient:=TRESTClient.Create('');
  _RestRequest:=TRestRequest.Create(nil);
  _RESTResponse:=TRESTResponse.Create(nil);
  _RestRequest.Client:=_RESTClient;
  _RestRequest.Response:=_RESTResponse;
  _RESTClient.Accept:='application/json';
  _RestClient.AcceptCharset:='utf-8, *;q=0.8';
end;

Destructor TJsonResult.destroy;
begin
  _RESTClient.Free;
  _RestRequest.Free;
  _RESTResponse.Free;
end;

Procedure TJsonResult.Execute(aURL:string);
begin
  _RESTClient.BaseURL:=aURL;
  _RESTRequest.Execute;
  _StatusCode:=_RESTResponse.StatusCode;
  _Content:=_RESTResponse.Content;

end;

{TWSClient}

constructor TWSClient.Create;
begin
   _JsonResult:=TJSonResult.Create;
end;

Destructor TWSClient.Destroy;
begin
  _JsonResult.Free;
end;


procedure TWSClient.JsonToDataset(URL:string;toDataset:TDataset);
var JO:TJSONObject;JA:TJSONArray;JP:TJSONPair;
  I: Integer;
  j: Integer;
  aJSON: string;
begin
  _JsonResult.Execute(url);
  if (_JsonResult.StatusCode=200)and(_JSonResult.Content <> '') then
  begin
    toDataset.Active:=false;
    toDataset.Active:=true;
    aJSON:=_JsonResult.Content;
    JA:=(TJSONArray((TJSONObject.ParseJSONValue(ajson) as TJSONObject).Pairs[0].JsonValue ));
    JA:= (TJSONObject.ParseJSONValue(ja.Items[0].ToJSON ) as TJSONArray);
    for I := 0 to JA.Count-1 do
    begin
      JO:=(ja.Items[I] as TJSONObject);
      toDataset.Append;
      for j := 0 to jo.Count-1 do
      begin
        JP:=JO.Pairs[j];
        toDataset.FieldByName(jp.JsonString.Value).Value:=jp.JsonValue.Value;
      end;
      toDataset.Post;
    end;
    toDataset.Open;
    ja.Free;
  end else
  begin
    raise exception.Create('Dados não encontrados em '+url);
  end;

end;





end.
