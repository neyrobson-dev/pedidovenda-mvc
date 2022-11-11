unit projetopedidovenda.model.entity.interfaces;

interface

uses
  projetopedidovenda.model.entity.cliente,
  projetopedidovenda.model.entity.pedido,
  projetopedidovenda.model.entity.pedidoitens,
  projetopedidovenda.model.entity.produto;

type
  iEntity = interface
    function cliente: TCliente;
    function produto: TProduto;
    function pedido: TPedido;
    function pedidoitens: TPedidoItens;
  end;

implementation

end.
