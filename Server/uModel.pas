unit uModel;

{*******************************************************************************
    Project link   : https://https://github.com/gilmarcarvalho/DemoRESTBase64
    Created In     : 2019-09-04 13:18:10
    Created By     : Gilmar Alves de Carvalho - (linkedin.com/in/gilmar-carvalho)
*******************************************************************************}

interface

uses system.generics.collections, system.classes,system.json,rest.json,
System.NetEncoding,uMyUtils, system.sysutils;

type
{$METHODINFO ON}
  TPessoa=class(TComponent)
    private
      FCodigo:integer;
      FNome:string;
      FImagem:string;
      Procedure SetCodigo(value:integer);
      procedure SetNome(value:string);
      procedure SetImagem(value:string);
    public
      constructor Create(awoner: tcomponent) ; override;
      destructor Destroy; override;
      property Codigo:integer read FCodigo write SetCodigo;
      property Nome:string read FNome write SetNome;
      property Imagem:string read FImagem write SetImagem;
      Function Validar:string;
      Function list:TJSONValue;
  end;

{$METHODINFO OFF}
implementation



{TPessoa}
constructor TPessoa.create(awoner: tcomponent) ;
begin
  //
end;

destructor TPessoa.Destroy;
begin
  inherited;
end;

procedure TPessoa.SetCodigo(value: integer);
begin
  FCodigo:=value;
end;

procedure TPessoa.SetNome(value: string);
begin
  FNome:=value;
end;

procedure TPessoa.SetImagem(value: string);
begin
  FImagem:=value;
end;

function TPessoa.Validar;
begin
  result:=JPegToBase64('image.jpg');;
end;

function TPessoa.list:TJSONValue;
var  jo:TJSONObject;jArr:TJSONArray;
begin

  jArr:=tJSONArray.Create;


  //1º registro
  jo:=tjsonobject.Create;
  jo.AddPair('Codigo',TJSONNumber.Create(1));
  jo.AddPair('Nome','Hommer');
  jo.AddPair('Imagem',JPegToBase64('image1.jpg'));
  Jarr.AddElement(jo);

  //2º registro
  jo:=tjsonobject.Create;
  jo.AddPair('Codigo',TJSONNumber.Create(2));
  jo.AddPair('Nome','Marge');
  jo.AddPair('Imagem',JPegToBase64('image2.jpg'));
  Jarr.AddElement(jo);
  result:=jArr;


end;




end.
