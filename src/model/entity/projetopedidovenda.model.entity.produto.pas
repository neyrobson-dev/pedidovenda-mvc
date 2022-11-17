unit projetopedidovenda.model.entity.produto;

interface

type
  [Tabela('produtos')]
  TProduto = class
  private
    FId: Integer;
    FDescricao: String;
    FPrecoVenda: Currency;
  public
    [Campo('id'), Pk, AutoInc]
    property Id: Integer read FId write FId;
    [Campo('descricao')]
    property Descricao: String read FDescricao write FDescricao;
    [Campo('precovenda')]
    property PrecoVenda: Currency read FPrecoVenda write FPrecoVenda;
  end;

implementation

end.
