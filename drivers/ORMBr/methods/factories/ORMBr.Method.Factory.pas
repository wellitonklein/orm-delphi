unit ORMBr.Method.Factory;

interface

uses
  ORMBr.Method.Factory.Interf,
  ORM.Driver.Interf,
  ormbr.container.objectset.interfaces;

type
  TORMBrMethodFactory<T: class, constructor> = class(TInterfacedObject,
    IORMBrMethodFactory<T>)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IORMBrMethodFactory<T>;
    function save(const Parent: IORMDriver<T>; const manager: IContainerObjectSet<T>): IORMMethodSaveDriver<T>;
    function remove(const Parent: IORMDriver<T>; const manager: IContainerObjectSet<T>): IORMMethodRemoveDriver<T>;
    function update(const Parent: IORMDriver<T>; const manager: IContainerObjectSet<T>): IORMMethodUpdateDriver<T>;
    function find(const Parent: IORMDriver<T>; const manager: IContainerObjectSet<T>): IORMMethodFindDriver<T>;
    function findWhere(const Parent: IORMDriver<T>; const manager: IContainerObjectSet<T>): IORMMethodFindWhereDriver<T>;
    function findById(const Parent: IORMDriver<T>; const manager: IContainerObjectSet<T>): IORMMethodFindByIdDriver<T>;
  end;

implementation

uses
  ORMBr.Save,
  ORMBr.Remove,
  ORMBr.Update,
  ORMBr.Find,
  ORMBr.FindWhere,
  ORMBr.FindById;

{ TORMBrMethodFactory<T> }

constructor TORMBrMethodFactory<T>.Create;
begin

end;

destructor TORMBrMethodFactory<T>.Destroy;
begin

  inherited;
end;

function TORMBrMethodFactory<T>.find(const Parent: IORMDriver<T>;
  const manager: IContainerObjectSet<T>): IORMMethodFindDriver<T>;
begin
  Result := TORMMethodFindDriver<T>.New(Parent, manager);
end;

function TORMBrMethodFactory<T>.findById(const Parent: IORMDriver<T>;
  const manager: IContainerObjectSet<T>): IORMMethodFindByIdDriver<T>;
begin
  Result := TORMMethodFindByIdDriver<T>.New(Parent, manager);
end;

function TORMBrMethodFactory<T>.findWhere(const Parent: IORMDriver<T>;
  const manager: IContainerObjectSet<T>): IORMMethodFindWhereDriver<T>;
begin
  Result := TORMMethodFindWhereDriver<T>.New(Parent, manager);
end;

class function TORMBrMethodFactory<T>.New: IORMBrMethodFactory<T>;
begin
  Result := Self.Create;
end;

function TORMBrMethodFactory<T>.remove(const Parent: IORMDriver<T>;
  const manager: IContainerObjectSet<T>): IORMMethodRemoveDriver<T>;
begin
  Result := TORMMethodRemoveDriver<T>.New(Parent, manager);
end;

function TORMBrMethodFactory<T>.save(const Parent: IORMDriver<T>;
  const manager: IContainerObjectSet<T>): IORMMethodSaveDriver<T>;
begin
  Result := TORMMethodSaveDriver<T>.New(Parent, manager);
end;

function TORMBrMethodFactory<T>.update(const Parent: IORMDriver<T>;
  const manager: IContainerObjectSet<T>): IORMMethodUpdateDriver<T>;
begin
  Result := TORMMethodUpdateDriver<T>.New(Parent, manager);
end;

end.
