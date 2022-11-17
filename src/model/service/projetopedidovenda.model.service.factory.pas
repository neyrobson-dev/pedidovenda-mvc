unit projetopedidovenda.model.service.factory;

interface

uses
  Data.DB,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.VCLUI.Wait,
  FireDAC.Phys.MySQLDef,
  FireDAC.Phys.MySQL,
  FireDAC.Comp.UI,
  FireDAC.Comp.Client,
  SimpleInterface,
  SimpleDAO,
  SimpleAttributes,
  SimpleQueryFiredac,
  projetopedidovenda.model.service,
  projetopedidovenda.model.resource,
  projetopedidovenda.model.resource.factory;

type
  TService<T: class, constructor> = class(TInterfacedObject, iService<T>)
  private
    FParent: T;
    FConexao: iConexao;
    FConn: iSimpleQuery;
    FDAO: iSimpleDAO<T>;
    FDataSource: TDataSource;
  public
    constructor Create(Parent: T);
    destructor Destroy; override;
    class function New(Parent: T): iService<T>;
    function ListarTodos: iService<T>; overload;
    function ListarPorId(aId: Integer): iService<T>;
    function Inserir: iService<T>;
    function Atualizar: iService<T>;
    function Excluir: iService<T>; overload;
    function Excluir(Field, Value: String): iService<T>; overload;
    function DataSource(var aDataSource: TDataSource): iService<T>;
    function This: T;
  end;

implementation

{ TService<T> }

constructor TService<T>.Create(Parent: T);
begin
  FParent := Parent;
  FDataSource := TDataSource.Create(nil);
  FConexao := TResource.New.Conexao;
  FConn := TSimpleQueryFiredac.New(TFDConnection(FConexao.Connect));
  FDAO := TSimpleDAO<T>.New(FConn).DataSource(FDataSource);
end;

destructor TService<T>.Destroy;
begin
  FDataSource.DisposeOf;
  inherited;
end;

class function TService<T>.New(Parent: T): iService<T>;
begin
  Result := Self.Create(Parent);
end;

function TService<T>.DataSource(var aDataSource: TDataSource): iService<T>;
begin
  Result := Self;
  aDataSource := FDataSource;
end;

function TService<T>.Inserir: iService<T>;
begin
  Result := Self;
  FDAO.Insert(FParent);
end;

function TService<T>.Atualizar: iService<T>;
begin
  Result := Self;
  FDAO.Update(FParent);
end;

function TService<T>.Excluir(Field, Value: String): iService<T>;
begin
  Result := Self;
  FDAO.Delete(Field, Value);
end;

function TService<T>.Excluir: iService<T>;
begin
  Result := Self;
  FDAO.Delete(FParent);
end;

function TService<T>.ListarPorId(aId: Integer): iService<T>;
begin
  Result := Self;
  FParent := FDAO.Find(aId);
end;

function TService<T>.ListarTodos: iService<T>;
begin
  Result := Self;
  FDAO.Find;
end;

function TService<T>.This: T;
begin
  Result := FParent;
end;

end.
