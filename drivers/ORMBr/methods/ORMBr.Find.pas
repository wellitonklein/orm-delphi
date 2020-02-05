unit ORMBr.Find;

interface

uses
  ORM.Driver.Interf,
  ORMBr.container.objectset.interfaces, System.Generics.Collections;

type
  TORMMethodFindDriver<T: class, constructor> = class(TInterfacedObject,
    IORMMethodFindDriver<T>)
  private
    FParent: IORMDriver<T>;
    FManager: IContainerObjectSet<T>;
  public
    constructor Create(const Parent: IORMDriver<T>; const manager: IContainerObjectSet<T>);
    destructor Destroy; override;
    class function New(const Parent: IORMDriver<T>; const manager: IContainerObjectSet<T>): IORMMethodFindDriver<T>;
    function getList(out value: TObjectList<T>): IORMMethodFindDriver<T>;
    function &EndFind: IORMMethodDriver<T>;
  end;

implementation

{ TORMMethodFindDriver }

constructor TORMMethodFindDriver<T>.Create(const Parent: IORMDriver<T>;
  const manager: IContainerObjectSet<T>);
begin
  FParent := Parent;
  FManager := manager;
end;

destructor TORMMethodFindDriver<T>.Destroy;
begin

  inherited;
end;

function TORMMethodFindDriver<T>.EndFind: IORMMethodDriver<T>;
begin
  Result := FParent.method;
end;

function TORMMethodFindDriver<T>.getList(
  out value: TObjectList<T>): IORMMethodFindDriver<T>;
begin
  Result := Self;
  value := FManager.Find;
end;

class function TORMMethodFindDriver<T>.New(const Parent: IORMDriver<T>;
  const manager: IContainerObjectSet<T>): IORMMethodFindDriver<T>;
begin
  Result := Self.Create(Parent, manager);
end;

end.
