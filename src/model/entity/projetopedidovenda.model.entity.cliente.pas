unit projetopedidovenda.model.entity.cliente;

interface

uses
  SimpleAttributes;

type
  [Tabela('clientes')]
  TCliente = class
  private
    FId: Integer;
    FNome: String;
    FCidade: String;
    FUF: String;
  public
    [Campo('idCliente'), Pk, AutoInc]
    property Id: Integer read FId write FId;
    [Campo('nome')]
    property Nome: String read FNome write FNome;
    [Campo('cidade')]
    property Cidade: String  read FCidade write FCidade;
    [Campo('uf')]
    property UF: String read FUF write FUF;
  end;

implementation

end.
