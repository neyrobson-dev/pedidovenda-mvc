unit projetopedidovenda.model.entity.factory;

interface

uses
  projetopedidovenda.model.entity.interfaces,
  projetopedidovenda.model.entity.cliente,
  projetopedidovenda.model.entity.pedido,
  projetopedidovenda.model.entity.pedidoitens,
  projetopedidovenda.model.entity.produto;

type
  TEntity = class(TInterfacedObject, iEntity)
    private
      FCliente: TCliente;
      FProduto: TProduto;
      FPedido: TPedido;
      FPedidoItens: TPedidoItens;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iEntity;
      function cliente: TCliente;
      function produto: TProduto;
      function pedido: TPedido;
      function pedidoitens: TPedidoItens;
  end;

implementation

{ TEntity }

constructor TEntity.Create;
begin
  //
end;

destructor TEntity.Destroy;
begin
  //
  inherited;
end;

class function TEntity.New: iEntity;
begin
  Result := Self.Create;
end;

function TEntity.cliente: TCliente;
begin
  if not Assigned(FCliente) then
    FCliente := TCliente.Create;
  Result := FCliente;
end;

function TEntity.produto: TProduto;
begin
  if not Assigned(FProduto) then
    FProduto := TProduto.Create;
  Result := FProduto;
end;

function TEntity.pedido: TPedido;
begin
  if not Assigned(FPedido) then
    FPedido := TPedido.Create;
  Result := FPedido;
end;

function TEntity.pedidoitens: TPedidoItens;
begin
  if not Assigned(FPedidoItens) then
    FPedidoItens := TPedidoItens.Create;
  Result := FPedidoItens;
end;

end.
