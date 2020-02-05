unit ORM.Interf;

interface

uses
  ORM.Driver.Interf;

type

  IORM<T: class, constructor> = interface
    ['{243A95D8-2A73-49F6-BEE4-83DDF70314B5}']
    function driver: IORMDriver<T>;
  end;

implementation

end.
