unit projetopedidovenda.model.entity.pedido;

interface

uses
  SimpleAttributes;

type
  [Tabela('pedidos')]
  TPedido = class
  private
    FId: Integer;
    FDataEmissao: TDateTime;
    FIdCliente: Integer;
    FValorTotal: Double;
  public
    [Campo('id'), Pk, AutoInc]
    property Id: Integer read FId write FId;
    [Campo('dataEmissao')]
    property DataEmissao: TDateTime read FDataEmissao write FDataEmissao;
    [Campo('idCliente'), Fk]
    property IdCliente: Integer read FIdCliente write FIdCliente;
    [Campo('valorTotal')]
    property ValorTotal: Double read FValorTotal write FValorTotal;
  end;

implementation

end.
