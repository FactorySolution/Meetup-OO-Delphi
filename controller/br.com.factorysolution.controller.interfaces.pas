unit br.com.factorysolution.controller.interfaces;

interface

uses
  System.Generics.Collections,
  br.com.factorysolution.model.vo;

type
  IController<T: TVO> = interface
    ['{46EE95C7-ACAC-44B1-8230-A3A81589B6A9}']
    function Save(clazz: T): T;
    function Update(clazz: T): T;
    function Get: TObjectList<T>; overload;
    function Get(AID: Integer): T; overload;
    procedure Delete(AID: Integer);
  end;

implementation

end.
