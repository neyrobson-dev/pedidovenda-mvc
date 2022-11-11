unit projetopedidovenda.view.pedidovenda;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Data.DB,
  projetopedidovenda.controller.interfaces,
  projetopedidovenda.controller, Vcl.StdCtrls;

type
  TfrmPedidoVenda = class(TForm)
    edtIdCliente: TEdit;
    edtNomeCliente: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure edtIdClienteChange(Sender: TObject);
  private
    { Private declarations }
    FController: iController;
    FDataSource : TDataSource;
  public
    { Public declarations }
  end;

var
  frmPedidoVenda: TfrmPedidoVenda;

implementation

{$R *.dfm}

procedure TfrmPedidoVenda.edtIdClienteChange(Sender: TObject);
var
  iId: Integer;
begin
  TryStrToInt(edtIdCliente.Text, iId);
  if not (iId = 0) then
    edtNomeCliente.Text := FController.Cliente.Build.ListarPorId(iId).This.Nome;
end;

procedure TfrmPedidoVenda.FormCreate(Sender: TObject);
begin
  FDataSource := TDataSource.Create(nil);
  FController := TController.New;
end;

end.
