unit br.com.factorysolution.controller.pessoa.impl;

interface

uses
  br.com.factorysolution.controller.pessoa.interfaces,
  br.com.factorysolution.model.pessoa,
  System.Generics.Collections,
  br.com.tecnospeed.service.interfaces,
  br.com.tecnospeed.service.pessoa.interfaces;

type
  TControllerPessoa = class(TInterfacedObject, IControllerPessoa)
  private
    FService: IServicePessoa;
    FServiceB: IServicePessoa;
  public
    function GetByName(const AName: string): TPessoa;
    function Save(clazz: TPessoa): TPessoa;
    function Update(clazz: TPessoa): TPessoa;
    function Get: TObjectList<TPessoa>; overload;
    function Get(AID: Integer): TPessoa; overload;
    procedure Delete(AID: Integer);

    class function New(const AService: IServicePessoa): IControllerPessoa;

    constructor Create(const AService: IServicePessoa);
    destructor Destroy; override;

  end;

implementation

{ TControllerPessoa }

constructor TControllerPessoa.Create(const AService: IServicePessoa);
begin
  FService := AService;
end;

procedure TControllerPessoa.Delete(AID: Integer);
begin
  FService.Delete(AID);
end;

destructor TControllerPessoa.Destroy;
begin

  inherited;
end;

function TControllerPessoa.Get: TObjectList<TPessoa>;
begin
  Result := FService.Get;
end;

function TControllerPessoa.Get(AID: Integer): TPessoa;
begin
  Result := FService.Get(AID);
end;

function TControllerPessoa.GetByName(const AName: string): TPessoa;
begin
  Result := FService.GetByName(AName);
end;

class function TControllerPessoa.New(const AService: IServicePessoa): IControllerPessoa;
begin
  Result := Self.Create(AService);
end;

function TControllerPessoa.Save(clazz: TPessoa): TPessoa;
begin
  Result := FService.Save(clazz);
end;

function TControllerPessoa.Update(clazz: TPessoa): TPessoa;
begin
  Result := FService.Update(clazz);
end;

end.
