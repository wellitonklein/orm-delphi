unit ORMBr.Adapter.Factory.Interf;

interface

uses
  System.Classes,
  ORMBr.Adapter.Interf;

type

  IORMBrAdapterFactory = interface
    ['{87F537FB-A456-49BE-8E8D-2D86ACD56123}']
    function Firedac(const Conn: TComponent): IORMBrAdapter;
  end;

implementation

end.
