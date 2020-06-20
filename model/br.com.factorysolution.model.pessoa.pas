unit br.com.factorysolution.model.pessoa;

interface

uses
  br.com.factorysolution.model.vo;

type
  TPessoa = class(TVO)
  private
    FNome: string;
    procedure SetNome(const Value: string);
  public
    function ToString: string; override;
    property Nome: string read FNome write SetNome;
  end;

implementation

uses
  System.SysUtils;

{ TPessoa }

procedure TPessoa.SetNome(const Value: string);
begin
  FNome := Value;
end;

function TPessoa.ToString: string;
begin
  Result := Format('ID : %d | Nome: %s ',[Id, Nome]);
end;

end.
