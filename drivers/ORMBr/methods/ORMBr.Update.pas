unit ORMBr.Update;

interface

uses
  ORM.Driver.Interf,
  ORMBr.container.objectset.interfaces;

type
  TORMMethodUpdateDriver<T: class, constructor> = class(TInterfacedObject,
    IORMMethodUpdateDriver<T>)
  private
    FParent: IORMDriver<T>;
    FManager: IContainerObjectSet<T>;
    FOldDataId: string;
    FNewData: T;
  public
    constructor Create(const Parent: IORMDriver<T>; const manager: IContainerObjectSet<T>);
    destructor Destroy; override;
    class function New(const Parent: IORMDriver<T>; const manager: IContainerObjectSet<T>): IORMMethodUpdateDriver<T>;
    function oldDataId(const value: string): IORMMethodUpdateDriver<T>;
    function setData(const value: T): IORMMethodUpdateDriver<T>;
    function &EndUpdate: IORMMethodDriver<T>;
  end;

implementation

{ TORMMethodUpdateDriver }

constructor TORMMethodUpdateDriver<T>.Create(const Parent: IORMDriver<T>;
  const manager: IContainerObjectSet<T>);
begin
  FParent := Parent;
  FManager := manager;
end;

destructor TORMMethodUpdateDriver<T>.Destroy;
begin

  inherited;
end;

function TORMMethodUpdateDriver<T>.EndUpdate: IORMMethodDriver<T>;
var
  LOldData: T;
begin
  Result := FParent.method;

  FParent
    .method
      .findById
        .setId(FOldDataId)
        .getData(LOldData)
      .EndFindById
    .EndMethod;

  FManager.Modify(LOldData);
  FManager.Update(FNewData);
end;

class function TORMMethodUpdateDriver<T>.New(const Parent: IORMDriver<T>;
  const manager: IContainerObjectSet<T>): IORMMethodUpdateDriver<T>;
begin
  Result := Self.Create(Parent, manager);
end;

function TORMMethodUpdateDriver<T>.oldDataId(const value: string): IORMMethodUpdateDriver<T>;
begin
  Result := Self;
  FOldDataId := value;
end;

function TORMMethodUpdateDriver<T>.setData(
  const value: T): IORMMethodUpdateDriver<T>;
begin
  Result := Self;
  FNewData := value;
end;

end.
