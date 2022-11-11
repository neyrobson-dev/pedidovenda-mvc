unit projetopedidovenda.model.entity.cliente;

interface

type
  TCliente = class
  private
    FId: Integer;
    FNome: String;
    FCidade: String;
    FUF: String;
  public
    property Id: Integer read FId write FId;
    property Nome: String read FNome write FNome;
    property Cidade: String  read FCidade write FCidade;
    property UF: String read FUF write FUF;
  end;

implementation

end.
