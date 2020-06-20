unit br.com.factorysolution.controller.pessoa.interfaces;

interface

uses
  br.com.factorysolution.controller.interfaces,
  br.com.factorysolution.model.pessoa;

type
  IControllerPessoa = interface(IController<TPessoa>)
    ['{E970D969-12D2-4D01-93A9-A8A49468AFF0}']
    function GetByName(const AName: string): TPessoa;
  end;

implementation

end.
