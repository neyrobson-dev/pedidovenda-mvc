unit projetopedidovenda.controller;

interface

uses
  projetopedidovenda.controller.interfaces,
  projetopedidovenda.controller.dto.interfaces,
  projetopedidovenda.controller.dto.cliente,
  projetopedidovenda.controller.dto.produto,
  projetopedidovenda.controller.dto.pedido,
  projetopedidovenda.controller.dto.pedidoitens,
  projetopedidovenda.model.resource,
  projetopedidovenda.model.configuracao;

type
  TController = class(TInterfacedObject, iController)
    private
      FCliente: iCliente;
      FProduto: iProduto;
      FPedido: iPedido;
      FPedidoItens: iPedidoItens;
      FConfiguracao: iConfiguracao;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iController;
      function Produto: iProduto;
      function Cliente: iCliente;
      function Pedido: iPedido;
      function PedidoItens: iPedidoItens;
      function Configuracao: iConfiguracao;
  end;

implementation

{ TController }

constructor TController.Create;
begin
  //
end;

destructor TController.Destroy;
begin
  //
  inherited;
end;

class function TController.New: iController;
begin
  Result := Self.Create;
end;

function TController.Configuracao: iConfiguracao;
begin
  FConfiguracao := TConfiguracao.New;
  Result := FConfiguracao;
end;

function TController.Cliente: iCliente;
begin
  FCliente := TClienteDTO.New;
  Result := FCliente;
end;

function TController.Produto: iProduto;
begin
  FProduto := TProdutoDTO.New;
  Result := FProduto;
end;

function TController.Pedido: iPedido;
begin
  FPedido := TPedidoDTO.New;
  Result := FPedido;
end;

function TController.PedidoItens: iPedidoItens;
begin
  FPedidoItens := TPedidoItensDTO.New;
  Result := FPedidoItens;
end;

end.
