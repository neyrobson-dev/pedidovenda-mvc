unit projetopedidovenda.model.entity.pedidoitens;

interface

type
  [Tabela('pedidoitens')]
  TPedidoItens = class
  private
    FId: Integer;
    FIdPedido: Integer;
    FIdProduto: Integer;
    FQuantidade: Integer;
    FValorUnitario: Double;
    FValorTotal: Double;
  public
    [Campo('id'), Pk, AutoInc]
    property Id: Integer read FId write FId;
    [Campo('idpedido'), Fk]
    property IdPedido: Integer read FIdPedido write FIdPedido;
    [Campo('idproduto'), Fk]
    property IdProduto: Integer read FIdProduto write FIdProduto;
    [Campo('quantidade')]
    property Quantidade: Integer read FQuantidade write FQuantidade;
    [Campo('valorunitario')]
    property ValorUnitario: Double read FValorUnitario write FValorUnitario;
    [Campo('valortotal')]
    property ValorTotal: Double read FValorTotal write FValorTotal;
  end;

implementation

end.
