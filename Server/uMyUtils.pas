unit uMyUtils;

{*******************************************************************************
    Project link   : https://https://github.com/gilmarcarvalho/DemoRESTBase64
    Created In     : 2019-09-04 13:18:10
    Created By     : Gilmar Alves de Carvalho - (linkedin.com/in/gilmar-carvalho)
*******************************************************************************}

interface

uses System.SysUtils, System.Classes, vcl.graphics,System.NetEncoding,Vcl.Imaging.jpeg;

function JPegToBase64(jpgFile:string):String;
function Base64ToJpeg(value:string):TJpegimage;

implementation

uses ufmain;

{MyUtils}

function JPegToBase64(jpgFile:string):String;
var
  Input: TBytesStream;
  Output: TStringStream;
  JpegImg:TJPEGImage;
  B:Tbase64Encoding;
begin
  Input := TBytesStream.Create;
  try
    JpegImg:=TJPEGImage.Create;
    JpegImg.LoadFromFile(jpgFile);
    JpegImg.SaveToStream(Input);
    Input.Position := 0;
    Output := TStringStream.Create('',TEncoding.ASCII);
    try
      B:=tbase64encoding.Create(10,'');
      B.Encode(Input,output);
      output.Position:=0;
      Result := output.DataString;
    finally
      Output.Free;
      b.Free;
    end;
  finally
    Input.Free;
    JpegImg.Free;
  end;end;

function Base64toJpeg(value:string):TJPegimage;
var
  Input: TStringStream;
  Output: TBytesStream;
  B:Tbase64Encoding;
begin
  Input := TStringStream.Create('', TEncoding.ASCII);
  Output := TBytesStream.Create;
    try
      B:= tbase64encoding.Create(10,'');
      B.Decode(Input,output);
      Output.Position := 0;
      Result := TJPegimage.Create;
      Result.LoadFromStream(Output);
    finally
      Output.Free;
      b.Free;
      input.Free;
    end;
end;

end.
