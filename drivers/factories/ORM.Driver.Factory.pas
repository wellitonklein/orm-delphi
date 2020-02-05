unit ORM.Driver.Factory;

interface

uses
  ORM.Driver.Factory.Interf,
  ORM.Driver.Interf,
  System.Classes;

type
  TORMDriverFactory<T: class, constructor> = class(TInterfacedObject, IORMDriverFactory<T>)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IORMDriverFactory<T>;
    function ORMBr(const connection: TComponent): IORMDriver<T>;
  end;

implementation

uses
  ORM.ORMBr;

{ TORMDriverFactory<T> }

constructor TORMDriverFactory<T>.Create;
begin

end;

destructor TORMDriverFactory<T>.Destroy;
begin

  inherited;
end;

class function TORMDriverFactory<T>.New: IORMDriverFactory<T>;
begin
  Result := Self.Create;
end;

function TORMDriverFactory<T>.ORMBr(
  const connection: TComponent): IORMDriver<T>;
begin
  Result := TORMORMBr<T>.New(connection);
end;

end.
