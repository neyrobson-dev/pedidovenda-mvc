unit projetopedidovenda.controller.dto.cliente;

interface

uses
  projetopedidovenda.controller.dto.interfaces,
  projetopedidovenda.model.service,
  projetopedidovenda.model.service.factory,
  projetopedidovenda.model.entity.cliente;

type
  TClienteDTO = class(TInterfacedObject, iCliente)
  private
    FEntity: TCliente;
    FService: iService<TCLiente>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iCliente;
    function Id(Value: Integer): iCliente; overload;
    function Id: Integer; overload;
    function Nome(Value: String): iCliente; overload;
    function Nome: String; overload;
    function Cidade(Value: String): iCliente; overload;
    function Cidade: String; overload;
    function UF(Value: String): iCliente; overload;
    function UF: String; overload;
    function Build: iService<TCliente>;
  end;

implementation

{ TClienteDTO }

constructor TClienteDTO.Create;
begin
  FEntity := TCliente.Create;
  FService := TService<TCliente>.New(FEntity);
end;

destructor TClienteDTO.Destroy;
begin
  FEntity.DisposeOf;
  inherited;
end;

class function TClienteDTO.New: iCliente;
begin
  Result := Self.Create;
end;

function TClienteDTO.Build: iService<TCliente>;
begin
  Result := FService;
end;

function TClienteDTO.Cidade: String;
begin
  Result := FEntity.Cidade;
end;

function TClienteDTO.Cidade(Value: String): iCliente;
begin
  Result := Self;
  FEntity.Cidade := Value;
end;

function TClienteDTO.Id(Value: Integer): iCliente;
begin
  Result := Self;
  FEntity.Id := Value;
end;

function TClienteDTO.Id: Integer;
begin
  Result := FEntity.Id;
end;

function TClienteDTO.Nome(Value: String): iCliente;
begin
  Result := Self;
  FEntity.Nome := Value;
end;

function TClienteDTO.Nome: String;
begin
  Result := FEntity.Nome;
end;

function TClienteDTO.UF: String;
begin
  Result := FEntity.UF;
end;

function TClienteDTO.UF(Value: String): iCliente;
begin
  Result := Self;
  FEntity.UF := Value;
end;

end.
