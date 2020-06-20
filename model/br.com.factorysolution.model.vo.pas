unit br.com.factorysolution.model.vo;

interface

type
  TVO = class
  private
    FId: Integer;
    procedure SetId(const Value: Integer);
  public
    property Id: Integer read FId write SetId;
  end;

implementation

{ TVO }

procedure TVO.SetId(const Value: Integer);
begin
  FId := Value;
end;

end.
