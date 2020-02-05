unit ORMBr.Adapter.Factory;

interface

uses
  ORMBr.Adapter.Factory.Interf,
  System.Classes,
  ORMBr.Adapter.Interf;

type
  TORMBrAdapterFactory = class(TInterfacedObject, IORMBrAdapterFactory)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IORMBrAdapterFactory;
    function Firedac(const Conn: TComponent): IORMBrAdapter;
  end;

implementation

uses
  ORMBr.Firedac;

{ TORMBrAdapterFactory }

constructor TORMBrAdapterFactory.Create;
begin

end;

destructor TORMBrAdapterFactory.Destroy;
begin

  inherited;
end;

function TORMBrAdapterFactory.Firedac(const Conn: TComponent): IORMBrAdapter;
begin
  Result := TORMBrFiredac.New(Conn);
end;

class function TORMBrAdapterFactory.New: IORMBrAdapterFactory;
begin
  Result := Self.Create;
end;

end.
