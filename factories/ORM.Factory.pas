unit ORM.Factory;

interface

uses
  ORM.Factory.Interf,
  System.Classes,
  ORM.Interf;

type
  TORMFactory<T: class, constructor> = class(TInterfacedObject, IORMFactory<T>)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IORMFactory<T>;
    function ORM(const Conn: TComponent): IORM<T>;
  end;

implementation

uses
  ORM;

{ TORMFactory<T> }

constructor TORMFactory<T>.Create;
begin

end;

destructor TORMFactory<T>.Destroy;
begin

  inherited;
end;

class function TORMFactory<T>.New: IORMFactory<T>;
begin
  Result := Self.Create;
end;

function TORMFactory<T>.ORM(const Conn: TComponent): IORM<T>;
begin
  Result := TORM<T>.New(Conn);
end;

end.
