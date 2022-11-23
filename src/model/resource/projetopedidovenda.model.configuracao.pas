unit projetopedidovenda.model.configuracao;

interface

uses
  SysUtils,
  System.IniFiles,
  projetopedidovenda.model.resource;

type
  TConfiguracao = class(TInterfacedObject, iConfiguracao)
  private
    FDriverID: String;
    FDatabase: String;
    FUserName: String;
    FPassword: String;
    FPort: String;
    FServer: String;
    FSchema: String;
    FLocking: String;
    FLib: string;

    ArquivoINI: TIniFile;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iConfiguracao;
    function DriverID(Value: String): iConfiguracao; overload;
    function DriverID: String; overload;
    function Database(Value: String): iConfiguracao; overload;
    function Database: String; overload;
    function UserName(Value: String): iConfiguracao; overload;
    function UserName: String; overload;
    function Password(Value: String): iConfiguracao; overload;
    function Password: String; overload;
    function Port(Value: String): iConfiguracao; overload;
    function Port: String; overload;
    function Server(Value: String): iConfiguracao; overload;
    function Server: String; overload;
    function Schema(Value: String): iConfiguracao; overload;
    function Schema: String; overload;
    function Locking(Value: String): iCOnfiguracao; overload;
    function Locking: String; overload;
    function Lib(Value: String): iConfiguracao; overload;
    function Lib: String; overload;
  end;

implementation

uses
  Vcl.Forms;

{ TConfiguracao }

constructor TConfiguracao.Create;
begin
  ArquivoINI := TIniFile.Create(ExtractFilePath(Application.ExeName) + '\config.ini');
end;

destructor TConfiguracao.Destroy;
begin
  FreeAndNil(ArquivoINI);
  inherited;
end;

class function TConfiguracao.New: iConfiguracao;
begin
  Result := Self.Create;
end;

function TConfiguracao.DriverID(Value: String): iConfiguracao;
begin
  Result := Self;
  ArquivoINI.WriteString('CONEXAO','DriverID',Value);
end;

function TConfiguracao.DriverID: String;
begin
  Result := ArquivoINI.ReadString('CONEXAO','DriverID','');
end;

function TConfiguracao.Database(Value: String): iConfiguracao;
begin
  Result := Self;
  ArquivoINI.WriteString('CONEXAO','Database',Value);
end;

function TConfiguracao.Database: String;
begin
  Result := ArquivoINI.ReadString('CONEXAO','Database','');
end;

function TConfiguracao.Locking(Value: String): iCOnfiguracao;
begin
  Result := Self;
  ArquivoINI.WriteString('CONEXAO','Locking',Value);
end;

function TConfiguracao.Lib: String;
begin
  Result := ArquivoINI.ReadString('CONEXAO','Lib','');
end;

function TConfiguracao.Lib(Value: String): iConfiguracao;
begin
  Result := Self;
  ArquivoINI.WriteString('CONEXAO','Lib',Value);
end;

function TConfiguracao.Locking: String;
begin
  Result := ArquivoINI.ReadString('CONEXAO','Locking','');
end;

function TConfiguracao.Password(Value: String): iConfiguracao;
begin
  Result := Self;
  ArquivoINI.WriteString('CONEXAO','Password',Value);
end;

function TConfiguracao.Password: String;
begin
  Result := ArquivoINI.ReadString('CONEXAO','Password','');
end;

function TConfiguracao.Port(Value: String): iConfiguracao;
begin
  Result := Self;
  ArquivoINI.WriteString('CONEXAO','Port',Value);
end;

function TConfiguracao.Port: String;
begin
  Result := ArquivoINI.ReadString('CONEXAO','Port','');
end;

function TConfiguracao.Schema(Value: String): iConfiguracao;
begin
  Result := Self;
  ArquivoINI.WriteString('CONEXAO','Schema',Value);
end;

function TConfiguracao.Schema: String;
begin
  Result := ArquivoINI.ReadString('CONEXAO','Schema','');
end;

function TConfiguracao.Server(Value: String): iConfiguracao;
begin
  Result := Self;
  ArquivoINI.WriteString('CONEXAO','Server',Value);
end;

function TConfiguracao.Server: String;
begin
  Result := ArquivoINI.ReadString('CONEXAO','Server','');
end;

function TConfiguracao.UserName(Value: String): iConfiguracao;
begin
  Result := Self;
  ArquivoINI.WriteString('CONEXAO','UserName',Value);
end;

function TConfiguracao.UserName: String;
begin
  Result := ArquivoINI.ReadString('CONEXAO','UserName','');
end;

end.
