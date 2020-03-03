unit ORMBr.FindById;

interface

uses
  ORM.Driver.Interf,
  ORMBr.container.objectset.interfaces,
  System.Generics.Collections;

type
  TORMMethodFindByIdDriver<T: class, constructor> = class(TInterfacedObject,
    IORMMethodFindByIdDriver<T>)
  private
    FParent: IORMDriver<T>;
    FManager: IContainerObjectSet<T>;
    FIdInt: SmallInt;
    FIdStr: string;
  public
    constructor Create(const Parent: IORMDriver<T>; const manager: IContainerObjectSet<T>);
    destructor Destroy; override;
    class function New(const Parent: IORMDriver<T>; const manager: IContainerObjectSet<T>): IORMMethodFindByIdDriver<T>;
    function setId(const value: SmallInt): IORMMethodFindByIdDriver<T>; overload;
    function setId(const value: string): IORMMethodFindByIdDriver<T>; overload;
    function getData(out value: T): IORMMethodFindByIdDriver<T>;
    function &EndFindById: IORMMethodDriver<T>;
  end;

implementation

uses
  System.SysUtils;

{ TORMMethodFindByIdDriver }

constructor TORMMethodFindByIdDriver<T>.Create(const Parent: IORMDriver<T>;
  const manager: IContainerObjectSet<T>);
begin
  FParent := Parent;
  FManager := manager;
end;

destructor TORMMethodFindByIdDriver<T>.Destroy;
begin

  inherited;
end;

function TORMMethodFindByIdDriver<T>.EndFindById: IORMMethodDriver<T>;
begin
  Result := FParent.method;
end;

function TORMMethodFindByIdDriver<T>.getData(
  out value: T): IORMMethodFindByIdDriver<T>;
begin
  Result := Self;

  if (not FIdStr.IsEmpty) then
  begin
    value := FManager.FindWhere(Format('ID = %s', [QuotedStr(FIdStr)])).First;
  end else begin
    value := FManager.FindWhere(Format('ID = %d', [FIdInt])).First;
  end;
end;

class function TORMMethodFindByIdDriver<T>.New(const Parent: IORMDriver<T>;
  const manager: IContainerObjectSet<T>): IORMMethodFindByIdDriver<T>;
begin
  Result := Self.Create(Parent, manager);
end;

function TORMMethodFindByIdDriver<T>.setId(
  const value: SmallInt): IORMMethodFindByIdDriver<T>;
begin
  Result := Self;
  FIdInt := value;
end;

function TORMMethodFindByIdDriver<T>.setId(
  const value: string): IORMMethodFindByIdDriver<T>;
begin
  Result := Self;
  FIdStr := value;
end;

end.
