unit ORM.ORMBr;

interface

uses
  ormbr.factory.interfaces,
  ormbr.container.objectset.interfaces,
  ormbr.dml.generator.firebird,
  ORM.Driver.Interf,
  System.Classes;

type
  TORMORMBr<T: class, constructor> = class(TInterfacedObject, IORMDriver<T>, IORMMethodDriver<T>)
  private
    FConn: IDBConnection;
    FManager: IContainerObjectSet<T>;
  public
    constructor Create(const connection: TComponent);
    destructor Destroy; override;
    class function New(const connection: TComponent): IORMDriver<T>;

    // IORMDriver
    function method: IORMMethodDriver<T>;

    // IORMMethodDriver
    function find: IORMMethodFindDriver<T>;
    function save: IORMMethodSaveDriver<T>;
    function remove: IORMMethodRemoveDriver<T>;
    function update: IORMMethodUpdateDriver<T>;
    function findWhere: IORMMethodFindWhereDriver<T>;
    function findById: IORMMethodFindByIdDriver<T>;
    function &EndMethod: IORMDriver<T>;
  end;

implementation

uses
  ormbr.container.objectset,
  ORMBr.Adapter.Factory,
  ORMBr.Adapter.Interf,
  ORMBr.Method.Factory;

{ TORMORMBr }

constructor TORMORMBr<T>.Create(const connection: TComponent);
begin
  TORMBrAdapterFactory.New.Firedac(connection).connection(dcFirebird, FConn);
  FManager := TContainerObjectSet<T>.Create(FConn, 15);
end;

destructor TORMORMBr<T>.Destroy;
begin

  inherited;
end;

function TORMORMBr<T>.EndMethod: IORMDriver<T>;
begin
  Result := Self;
end;

function TORMORMBr<T>.find: IORMMethodFindDriver<T>;
begin
  Result := TORMBrMethodFactory<T>.New.find(Self, FManager);
end;

function TORMORMBr<T>.findById: IORMMethodFindByIdDriver<T>;
begin
  Result := TORMBrMethodFactory<T>.New.findById(Self, FManager);
end;

function TORMORMBr<T>.findWhere: IORMMethodFindWhereDriver<T>;
begin
  Result := TORMBrMethodFactory<T>.New.findWhere(Self, FManager);
end;

function TORMORMBr<T>.method: IORMMethodDriver<T>;
begin
  Result := Self;
end;

class function TORMORMBr<T>.New(const connection: TComponent): IORMDriver<T>;
begin
  Result := Self.Create(connection);
end;

function TORMORMBr<T>.remove: IORMMethodRemoveDriver<T>;
begin
  Result := TORMBrMethodFactory<T>.New.remove(Self, FManager);
end;

function TORMORMBr<T>.save: IORMMethodSaveDriver<T>;
begin
  Result := TORMBrMethodFactory<T>.New.save(Self, FManager);
end;

function TORMORMBr<T>.update: IORMMethodUpdateDriver<T>;
begin
  Result := TORMBrMethodFactory<T>.New.update(Self, FManager);
end;

end.
