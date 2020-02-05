unit ORMBr.FindWhere;

interface

uses
  ORM.Driver.Interf,
  ORMBr.container.objectset.interfaces,
  System.Generics.Collections;

type
  TORMMethodFindWhereDriver<T: class, constructor> = class(TInterfacedObject,
    IORMMethodFindWhereDriver<T>)
  private
    FParent: IORMDriver<T>;
    FManager: IContainerObjectSet<T>;
    FConditional: string;
    FOrderBy: string;
  public
    constructor Create(const Parent: IORMDriver<T>; const manager: IContainerObjectSet<T>);
    destructor Destroy; override;
    class function New(const Parent: IORMDriver<T>; const manager: IContainerObjectSet<T>): IORMMethodFindWhereDriver<T>;
    function setConditional(const value: string): IORMMethodFindWhereDriver<T>;
    function setOrderBy(const value: string): IORMMethodFindWhereDriver<T>;
    function getList(out value: TObjectList<T>): IORMMethodFindWhereDriver<T>;
    function &EndFindWhere: IORMMethodDriver<T>;
  end;

implementation

{ TORMMethodFindWhereDriver }

constructor TORMMethodFindWhereDriver<T>.Create(const Parent: IORMDriver<T>;
  const manager: IContainerObjectSet<T>);
begin
  FParent := Parent;
  FManager := manager;
end;

destructor TORMMethodFindWhereDriver<T>.Destroy;
begin

  inherited;
end;

function TORMMethodFindWhereDriver<T>.EndFindWhere: IORMMethodDriver<T>;
begin
  Result := FParent.method;
end;

function TORMMethodFindWhereDriver<T>.getList(
  out value: TObjectList<T>): IORMMethodFindWhereDriver<T>;
begin
  Result := Self;
  value := FManager.FindWhere(FConditional, FOrderBy);
end;

class function TORMMethodFindWhereDriver<T>.New(const Parent: IORMDriver<T>;
  const manager: IContainerObjectSet<T>): IORMMethodFindWhereDriver<T>;
begin
  Result := Self.Create(Parent, manager);
end;

function TORMMethodFindWhereDriver<T>.setConditional(
  const value: string): IORMMethodFindWhereDriver<T>;
begin
  Result := Self;
  FConditional := value;
end;

function TORMMethodFindWhereDriver<T>.setOrderBy(
  const value: string): IORMMethodFindWhereDriver<T>;
begin
  Result := Self;
  FOrderBy := value;
end;

end.
