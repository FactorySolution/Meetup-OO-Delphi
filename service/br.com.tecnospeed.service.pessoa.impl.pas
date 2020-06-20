unit br.com.tecnospeed.service.pessoa.impl;

interface

uses
  br.com.tecnospeed.service.pessoa.interfaces,
  br.com.factorysolution.repository.base,
  br.com.factorysolution.model.pessoa,
  br.com.tecnospeed.service.interfaces,
  System.Generics.Collections;

type
  TPessoaService = class(TAbstractBase<TPessoa>, IServicePessoa)
  public
    function GetByName(const AName: string): TPessoa;
    function Save(clazz: TPessoa): TPessoa;
    function Update(clazz:TPessoa): TPessoa;
    function Get: TObjectList<TPessoa>; overload;
    function Get(AID: Integer): TPessoa; overload;
    procedure Delete(AID: Integer);

    function isDadosValidos(const clazz: TPessoa): Boolean; override;

    class function New: IServicePessoa;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

uses
  System.SysUtils;


{ TPessoaService }

function TPessoaService.Get: TObjectList<TPessoa>;
begin
  Result := _Get;
end;

constructor TPessoaService.Create;
begin
  Initialize;
end;

procedure TPessoaService.Delete(AID: Integer);
begin
  _Delete(AID);
end;

destructor TPessoaService.Destroy;
begin

  inherited;
end;

function TPessoaService.Get(AID: Integer): TPessoa;
begin
  Result := _Get(AID);
end;

function TPessoaService.GetByName(const AName: string): TPessoa;
var
  LPessoaList: TObjectList<TPessoa>;
  Pessoa: TPessoa;
begin
  LPessoaList := _Get;
  try
    for Pessoa in LPessoaList do
    begin
      if SameText(Pessoa.Nome, AName) then
        Exit(Pessoa);
    end;
    Result := nil;
  finally
   FreeAndNil(LPessoaList);
  end;
end;

function TPessoaService.isDadosValidos(const clazz: TPessoa): Boolean;
begin
  Result := clazz.Nome <> EmptyStr;
end;

class function TPessoaService.New: IServicePessoa;
begin
  Result := Self.Create;
end;

function TPessoaService.Save(clazz: TPessoa): TPessoa;
begin
  Result := _Save(clazz);
end;

function TPessoaService.Update(clazz: TPessoa): TPessoa;
begin
  if clazz.Id = 0 then
    raise Exception.Create('Informe o id do cliente');
  Result := _Update(clazz);
end;

end.
