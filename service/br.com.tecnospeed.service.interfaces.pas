unit br.com.tecnospeed.service.interfaces;

interface

uses
  br.com.factorysolution.model.vo,
  System.Generics.Collections;

type
  IService<T: TVO> = interface
    ['{77F06F76-44F7-4056-8101-941877DA86CD}']
    function Save(clazz: T): T;
    function Update(clazz: T): T;
    function Get: TObjectList<T>; overload;
    function Get(AID: Integer): T; overload;
    procedure Delete(AID: Integer);
  end;

implementation

end.
