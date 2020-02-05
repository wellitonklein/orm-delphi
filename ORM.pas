unit ORM;

interface

uses
  ORM.Interf,
  ORM.Driver.Interf,
  System.Classes;

type
  TORM<T: class, constructor> = class(TInterfacedObject, IORM<T>)
  private
    FDriver: IORMDriver<T>;
  public
    constructor Create(const Conn: TComponent);
    destructor Destroy; override;
    class function New(const Conn: TComponent): IORM<T>;
    function driver: IORMDriver<T>;
  end;

implementation

uses
  ORM.Driver.Factory;

{ TORM }

constructor TORM<T>.Create(const Conn: TComponent);
begin
  FDriver := TORMDriverFactory<T>.New.ORMBr(Conn);
end;

destructor TORM<T>.Destroy;
begin

  inherited;
end;

function TORM<T>.driver: IORMDriver<T>;
begin
  Result := FDriver;
end;

class function TORM<T>.New(const Conn: TComponent): IORM<T>;
begin
  Result := Self.Create(Conn);
end;

end.
