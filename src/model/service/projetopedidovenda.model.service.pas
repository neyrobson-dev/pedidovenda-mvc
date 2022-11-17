unit projetopedidovenda.model.service;

interface

uses
  Data.DB;

type
  iService<T: class> = interface
    function ListarTodos: iService<T>; overload;
    function ListarPorId(aId: Integer): iService<T>;
    function ListarPor(aKey: String; aValue: Variant): iService<T>;
    function Inserir: iService<T>;
    function Atualizar: iService<T>;
    function Excluir: iService<T>; overload;
    function Excluir(Field, Value: String): iService<T>; overload;
    function LastID: iService<T>;
    function DataSource(var aDataSource: TDataSource): iService<T>;
    function This: T;
  end;

implementation

end.
