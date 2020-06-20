unit br.com.tecnospeed.service.pessoa.interfaces;

interface

uses
  br.com.tecnospeed.service.interfaces,
  br.com.factorysolution.model.pessoa;

type
  IServicePessoa = interface(Iservice<TPessoa>)
  ['{45823488-10F5-450B-919C-BBC8E50FCE6A}']
    function GetByName(const AName: string): TPessoa;
  end;

implementation

end.
