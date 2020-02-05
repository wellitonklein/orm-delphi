unit ORMBr.Method.Factory.Interf;

interface

uses
  ORM.Driver.Interf,
  ormbr.container.objectset.interfaces;

type

  IORMBrMethodFactory<T: class, constructor> = interface
    ['{9F8407A8-6F79-4702-9A40-7F4CFD9C6F3F}']
    function save(const Parent: IORMDriver<T>; const manager: IContainerObjectSet<T>): IORMMethodSaveDriver<T>;
    function remove(const Parent: IORMDriver<T>; const manager: IContainerObjectSet<T>): IORMMethodRemoveDriver<T>;
    function update(const Parent: IORMDriver<T>; const manager: IContainerObjectSet<T>): IORMMethodUpdateDriver<T>;
    function find(const Parent: IORMDriver<T>; const manager: IContainerObjectSet<T>): IORMMethodFindDriver<T>;
    function findWhere(const Parent: IORMDriver<T>; const manager: IContainerObjectSet<T>): IORMMethodFindWhereDriver<T>;
    function findById(const Parent: IORMDriver<T>; const manager: IContainerObjectSet<T>): IORMMethodFindByIdDriver<T>;
  end;

implementation

end.
