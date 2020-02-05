unit ORM.Factory.Interf;

interface

uses
  System.Classes,
  ORM.Interf;

type

  IORMFactory<T: class, constructor> = interface
    ['{FE46E51D-7616-4309-B5DF-56F5150B4DD6}']
    function ORM(const Conn: TComponent): IORM<T>;
  end;

implementation

end.
