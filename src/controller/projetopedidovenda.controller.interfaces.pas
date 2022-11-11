unit projetopedidovenda.controller.interfaces;

interface

uses
  projetopedidovenda.controller.dto.interfaces;

type
  iController = interface
    function Cliente: iCliente;
    function Produto: iProduto;
    function Pedido: iPedido;
    function PedidoItens: iPedidoItens;
  end;

implementation

end.
