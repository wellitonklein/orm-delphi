unit ORMBr.Adapter.Interf;

interface

uses
  ormbr.factory.interfaces;

type
  IORMBrAdapter = interface;

  TDriverConn = (dcFirebird);

  IORMBrAdapter = interface
    ['{52BDAD75-AED5-4DE4-8A12-85F5B5BF960D}']
    function connection(const driver: TDriverConn; out value: IDBConnection): IORMBrAdapter;
  end;

implementation

end.
