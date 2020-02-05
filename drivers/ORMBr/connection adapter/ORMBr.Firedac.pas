unit ORMBr.Firedac;

interface

uses
  ormbr.factory.interfaces,
  ORMBr.Adapter.Interf,
  System.Classes;

type
  TORMBrFiredac = class(TInterfacedObject, IORMBrAdapter)
  private
    FConn: TComponent;
  public
    constructor Create(const Conn: TComponent);
    destructor Destroy; override;
    class function New(const Conn: TComponent): IORMBrAdapter;
    function connection(const driver: TDriverConn; out value: IDBConnection): IORMBrAdapter;
  end;

implementation

uses
  ormbr.factory.firedac;

{ TORMBrFiredac }

function TORMBrFiredac.connection(const driver: TDriverConn;
  out value: IDBConnection): IORMBrAdapter;
var
  LDriver: TDriverName;
begin
  Result := Self;

  LDriver := dnFirebird;
  case driver of
    dcFirebird: LDriver := dnFirebird;
  end;

  value := TFactoryFireDAC.Create(FConn, LDriver);
end;

constructor TORMBrFiredac.Create(const Conn: TComponent);
begin
  FConn := Conn;
end;

destructor TORMBrFiredac.Destroy;
begin

  inherited;
end;

class function TORMBrFiredac.New(const Conn: TComponent): IORMBrAdapter;
begin
  Result := Self.Create(Conn);
end;

end.
