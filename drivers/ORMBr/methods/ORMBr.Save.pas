unit ORMBr.Save;

interface

uses
  ORM.Driver.Interf,
  ORMBr.container.objectset.interfaces;

type
  TORMMethodSaveDriver<T: class, constructor> = class(TInterfacedObject,
    IORMMethodSaveDriver<T>)
  private
    FParent: IORMDriver<T>;
    FManager: IContainerObjectSet<T>;
    FData: T;
  public
    constructor Create(const Parent: IORMDriver<T>; const manager: IContainerObjectSet<T>);
    destructor Destroy; override;
    class function New(const Parent: IORMDriver<T>; const manager: IContainerObjectSet<T>): IORMMethodSaveDriver<T>;
    function setData(const value: T): IORMMethodSaveDriver<T>;
    function &EndSave: IORMMethodDriver<T>;
  end;

implementation

{ TORMMethodSaveDriver }

constructor TORMMethodSaveDriver<T>.Create(const Parent: IORMDriver<T>;
  const manager: IContainerObjectSet<T>);
begin
  FParent := Parent;
  FManager := manager;
end;

destructor TORMMethodSaveDriver<T>.Destroy;
begin

  inherited;
end;

function TORMMethodSaveDriver<T>.EndSave: IORMMethodDriver<T>;
begin
  Result := FParent.method;
  FManager.Insert(FData);
end;

class function TORMMethodSaveDriver<T>.New(const Parent: IORMDriver<T>;
  const manager: IContainerObjectSet<T>): IORMMethodSaveDriver<T>;
begin
  Result := Self.Create(Parent, manager);
end;

function TORMMethodSaveDriver<T>.setData(const value: T)
  : IORMMethodSaveDriver<T>;
begin
  Result := Self;
  FData := value;
end;

end.
