unit ORMBr.Remove;

interface

uses
  ORM.Driver.Interf,
  ORMBr.container.objectset.interfaces;

type
  TORMMethodRemoveDriver<T: class, constructor> = class(TInterfacedObject,
    IORMMethodRemoveDriver<T>)
  private
    FParent: IORMDriver<T>;
    FManager: IContainerObjectSet<T>;
    FOldData: T;
  public
    constructor Create(const Parent: IORMDriver<T>; const manager: IContainerObjectSet<T>);
    destructor Destroy; override;
    class function New(const Parent: IORMDriver<T>; const manager: IContainerObjectSet<T>): IORMMethodRemoveDriver<T>;
    function oldData(const value: T): IORMMethodRemoveDriver<T>;
    function &EndRemove: IORMMethodDriver<T>;
  end;

implementation

{ TORMMethodRemoveDriver }

constructor TORMMethodRemoveDriver<T>.Create(const Parent: IORMDriver<T>;
  const manager: IContainerObjectSet<T>);
begin
  FParent := Parent;
  FManager := manager;
end;

destructor TORMMethodRemoveDriver<T>.Destroy;
begin

  inherited;
end;

function TORMMethodRemoveDriver<T>.EndRemove: IORMMethodDriver<T>;
begin
  Result := FParent.method;
  FManager.Delete(FOldData);
end;

class function TORMMethodRemoveDriver<T>.New(const Parent: IORMDriver<T>;
  const manager: IContainerObjectSet<T>): IORMMethodRemoveDriver<T>;
begin
  Result := Self.Create(Parent, manager);
end;

function TORMMethodRemoveDriver<T>.oldData(const value: T)
  : IORMMethodRemoveDriver<T>;
begin
  Result := Self;
  FOldData := value;
end;

end.
