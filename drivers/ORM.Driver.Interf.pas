unit ORM.Driver.Interf;

interface

uses
  System.Generics.Collections;

type
  IORMDriver<T: class, constructor> = interface;
  IORMMethodDriver<T: class, constructor> = interface;
  IORMMethodSaveDriver<T: class, constructor> = interface;
  IORMMethodUpdateDriver<T: class, constructor> = interface;
  IORMMethodRemoveDriver<T: class, constructor> = interface;
  IORMMethodFindDriver<T: class, constructor> = interface;
  IORMMethodFindWhereDriver<T: class, constructor> = interface;
  IORMMethodFindByIdDriver<T: class, constructor> = interface;

  IORMDriver<T: class, constructor> = interface
    ['{C5C71AF5-161D-4485-896E-E95AFC94E121}']
    function method: IORMMethodDriver<T>;
  end;

  IORMMethodDriver<T: class, constructor> = interface
    ['{18948281-7C40-4D44-B003-A51DC2AFA029}']
    function find: IORMMethodFindDriver<T>;
    function save: IORMMethodSaveDriver<T>;
    function remove: IORMMethodRemoveDriver<T>;
    function update: IORMMethodUpdateDriver<T>;
    function findWhere: IORMMethodFindWhereDriver<T>;
    function findById: IORMMethodFindByIdDriver<T>;
    function &EndMethod: IORMDriver<T>;
  end;

  IORMMethodSaveDriver<T: class, constructor> = interface
    ['{C216D60B-D95F-4C6D-9C10-0CDFCA46402C}']
    function setData(const value: T): IORMMethodSaveDriver<T>;
    function &EndSave: IORMMethodDriver<T>;
  end;

  IORMMethodUpdateDriver<T: class, constructor> = interface
    ['{935DEF33-D0BB-4815-9301-9ACE44EFE367}']
    function oldDataId(const value: string): IORMMethodUpdateDriver<T>;
    function setData(const value: T): IORMMethodUpdateDriver<T>;
    function &EndUpdate: IORMMethodDriver<T>;
  end;

  IORMMethodRemoveDriver<T: class, constructor> = interface
    ['{935DEF33-D0BB-4815-9301-9ACE44EFE367}']
    function oldData(const value: T): IORMMethodRemoveDriver<T>;
    function &EndRemove: IORMMethodDriver<T>;
  end;

  IORMMethodFindDriver<T: class, constructor> = interface
    ['{935DEF33-D0BB-4815-9301-9ACE44EFE367}']
    function getList(out value: TObjectList<T>): IORMMethodFindDriver<T>;
    function &EndFind: IORMMethodDriver<T>;
  end;

  IORMMethodFindWhereDriver<T: class, constructor> = interface
    ['{935DEF33-D0BB-4815-9301-9ACE44EFE367}']
    function setConditional(const value: string): IORMMethodFindWhereDriver<T>;
    function setOrderBy(const value: string): IORMMethodFindWhereDriver<T>;
    function getList(out value: TObjectList<T>): IORMMethodFindWhereDriver<T>;
    function &EndFindWhere: IORMMethodDriver<T>;
  end;

  IORMMethodFindByIdDriver<T: class, constructor> = interface
    ['{935DEF33-D0BB-4815-9301-9ACE44EFE367}']
    function setId(const value: SmallInt): IORMMethodFindByIdDriver<T>; overload;
    function setId(const value: string): IORMMethodFindByIdDriver<T>; overload;
    function getData(out value: T): IORMMethodFindByIdDriver<T>;
    function &EndFindById: IORMMethodDriver<T>;
  end;

implementation

end.
