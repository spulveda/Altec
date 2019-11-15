unit UnitAPICep;

interface

uses
  IdTCPConnection, IdTCPClient, IdHTTP, IdSSLOpenSSL, System.json,
  System.SysUtils, Forms, Dialogs, Classes, Controls, StdCtrls;

type
  TAPICep = class(TObject)
  private
    FResponse: Integer;
    FShow : Integer;
    FLogradouro: String;
    FComplemento: String;
    FBairro: String;
    FLocalidade: String;
    FUF: String;

    procedure AcheCep(sCep: String);
    function GetResponse: Integer;
    function GetLogradouro: String;
    function GetComplemento: String;
    function GetBairro: String;
    function GetLocalidade: String;
    function GetUF: String;

  public
    constructor Create(sCep: String);

    property Response: Integer read GetResponse;
    property Logradouro: String read GetLogradouro;
    property Complemento: String read GetComplemento;
    property Bairro: String read GetBairro;
    property Localidade: String read GetLocalidade;
    property UF: String read GetUF;
  end;

implementation

procedure TAPICep.AcheCep(sCep: String);
var
  IdHTTP: TIdHTTP;
  Handler: TIdSSLIOHandlerSocketOpenSSL;
  Obj: TJsonObject;
  sJson: String;
begin

  IdHTTP := TIdHTTP.Create();
  Handler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    try
      IdHTTP.IOHandler := Handler;
      sJson := IdHTTP.Get('https://viacep.com.br/ws/' + sCep + '/json/');
      FResponse := IdHTTP.ResponseCode;

      Obj := TJsonObject.ParseJSONValue(TEncoding.ASCII.GetBytes(sJson), 0)
        as TJsonObject;
      try
        FLogradouro := Obj.GetValue('logradouro').Value;
        FComplemento := Obj.GetValue('complemento').Value;
        FBairro := Obj.GetValue('bairro').Value;
        FLocalidade := Obj.GetValue('localidade').Value;
        FUF := Obj.GetValue('uf').Value;
      finally
        FreeAndNil(Obj);
      end;
    except
      FResponse := IdHTTP.ResponseCode;
      raise;
    end;
  finally
    FreeAndNil(Handler);
    FreeAndNil(IdHTTP);
  end;

end;

constructor TAPICep.Create(sCep: String);
begin

  AcheCep(sCep);
end;

function TAPICep.GetResponse: Integer;
begin
  Result := FResponse;
end;

function TAPICep.GetLogradouro: String;
begin
  Result := FLogradouro;
end;

function TAPICep.GetComplemento: String;
begin
  Result := FComplemento;
end;

function TAPICep.GetBairro: String;
begin
  Result := FBairro;
end;

function TAPICep.GetLocalidade: String;
begin
  Result := FLocalidade;
end;

function TAPICep.GetUF: String;
begin
  Result := FUF;
end;

end.
