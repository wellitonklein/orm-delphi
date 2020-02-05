unit ORM.Driver.Factory.Interf;

interface

uses
  System.Classes, ORM.Driver.Interf;

type

  IORMDriverFactory<T: class, constructor> = interface
    ['{C0059327-CA8D-4DF9-8E42-E788750969FF}']
    function ORMBr(const connection: TComponent): IORMDriver<T>;
  end;

implementation

end.
