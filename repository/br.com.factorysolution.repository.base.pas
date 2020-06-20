unit br.com.factorysolution.repository.base;

interface

uses
  System.Generics.Collections,
  br.com.factorysolution.model.vo;

type
  TAbstractBase<T: TVO> = class(TInterfacedObject)
  private
    FList: TObjectDictionary<Integer, T>;
    function GetId: Integer;
  protected
    procedure Initialize;
  public
    constructor Create;
    destructor Destroy; override;

    function _Save(clazz: T): T;
    function _Update(clazz: T): T;
    function _Get: TObjectList<T>; overload;
    function _Get(AID: Integer): T; overload;
    procedure _Delete(AID: Integer);

    function isDadosValidos(const clazz: T): Boolean; virtual; abstract;

  end;

implementation

uses
  System.SysUtils;


{ TAbstractBase<Integer, T> }

constructor TAbstractBase<T>.Create;
begin
  raise EAbstractError.Create('Esta classe não pode ser instanciada');
end;

destructor TAbstractBase<T>.Destroy;
begin
  FList.Clear;
  FList.Destroy;
  inherited;
end;

function TAbstractBase<T>._Get: TObjectList<T>;
var
  LObject: TEnumerator<TPair<Integer,T>>;
begin
  Result := TObjectList<T>.Create(False);
  LObject := FList.GetEnumerator;
  try
    with LObject do
    begin
      while MoveNext do
      begin
        Result.Add(Current.Value);
      end;
    end;
  finally
    FreeAndNil(LObject);
  end;
end;

procedure TAbstractBase<T>._Delete(AID: Integer);
var
  LTemp: T;
begin
  if not FList.TryGetValue(AID, LTemp) then
    raise Exception.Create('Registro não localizado');

  
  FList.Remove(AID);
end;

function TAbstractBase<T>._Get(AID: Integer): T;
begin
  Result := FList.Items[AID];
end;

function TAbstractBase<T>.GetId: Integer;
begin
  Result := FList.Count + 1;
end;

procedure TAbstractBase<T>.Initialize;
begin
  FList := TObjectDictionary<Integer, T>.Create([doOwnsValues]);
end;

function TAbstractBase<T>._Save(clazz: T): T;
var
  LID: Integer;
begin
  if not isDadosValidos(clazz) then
    raise Exception.Create('Os dados informados são inválidos');

  LID := GetId;
  T(clazz).id := LID;
  FList.Add(LID, clazz);
  Result := FList.Items[LID];
end;

function TAbstractBase<T>._Update(clazz: T): T;
var
  LID: Integer;
  LTemp: T;
begin
  LID := clazz.id;

  if FList.TryGetValue(LID, LTemp) then
     FList.AddOrSetValue(LID, clazz)
  else
    raise Exception.Create('Registro não localizado!');

  Result := FList.Items[LID];
end;

initialization


end.
