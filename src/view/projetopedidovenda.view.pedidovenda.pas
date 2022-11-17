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
  projetopedidovenda.controller, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmPedidoVenda = class(TForm)
    edtIdCliente: TEdit;
    edtNomeCliente: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtIdProduto: TEdit;
    edtQuantidade: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    edtValorUnitario: TEdit;
    Label6: TLabel;
    Panel27: TPanel;
    Shape5: TShape;
    Label8: TLabel;
    lblValorTotal: TLabel;
    btnConfirmar: TSpeedButton;
    btnFinalizarPedido: TSpeedButton;
    btnCancelarPedido: TSpeedButton;
    Label7: TLabel;
    edtNumeroPedido: TEdit;
    SpeedButton4: TSpeedButton;
    Panel16: TPanel;
    pnlTitleDescricao: TPanel;
    Label9: TLabel;
    pnlTitleCodigo: TPanel;
    Label10: TLabel;
    pnlTitleQuantidade: TPanel;
    Label11: TLabel;
    pnlTitleValorUnitario: TPanel;
    Label12: TLabel;
    pnlTitleValorTotal: TPanel;
    Label13: TLabel;
    fdmItens: TFDMemTable;
    dtsItens: TDataSource;
    dbgrdItens: TDBGrid;
    fdmItensidProduto: TIntegerField;
    fdmItensdescricaoProduto: TStringField;
    fdmItensquantidade: TIntegerField;
    fdmItensvalorUnitario: TCurrencyField;
    fdmItensvalorTotal: TCurrencyField;
    fdmItenstotalGeral: TAggregateField;
    procedure FormCreate(Sender: TObject);
    procedure edtIdClienteChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarPedidoClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure edtIdProdutoChange(Sender: TObject);
    procedure btnFinalizarPedidoClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure dbgrdItensKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    FController: iController;
    FDataSource : TDataSource;

    procedure PreencheList;
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

procedure TfrmPedidoVenda.edtIdProdutoChange(Sender: TObject);
var
  iId: Integer;
begin
  TryStrToInt(edtIdProduto.Text, iId);
  if iId <> 0 then
  begin
    FController.Produto.Build.ListarPorId(iId).DataSource(FDataSource);
    if not FDataSource.DataSet.IsEmpty then
    begin
      edtValorUnitario.Text := FormatFloat('#,##0.00', FDataSource.DataSet.FieldByName('precovenda').AsFloat);
      Exit;
    end;
    Application.MessageBox('N�o foi poss�vel encontrar nenhum produto com o c�digo informado!','Aten��o', MB_OK+MB_ICONWARNING);
    edtIdProduto.Text := '';
    edtValorUnitario.Text := '';
  end;
end;

procedure TfrmPedidoVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FDataSource.DisposeOf;
  fdmItens.Close;
end;

procedure TfrmPedidoVenda.FormCreate(Sender: TObject);
begin
  FDataSource := TDataSource.Create(nil);
  FController := TController.New;

  fdmItens.Open;
end;

procedure TfrmPedidoVenda.PreencheList;
var
  ListItem: TListItem;
begin
  fdmItens.Append;
  fdmItens.FieldByName('idProduto').AsString := edtIdProduto.Text;
  fdmItens.FieldByName('descricaoProduto').AsString := FDataSource.DataSet.FieldByName('descricao').AsString;
  fdmItens.FieldByName('quantidade').AsString := edtQuantidade.Text;
  fdmItens.FieldByName('valorUnitario').AsString := edtValorUnitario.Text;
  fdmItens.FieldByName('valorTotal').AsString := FormatFloat('#,##0.00',(FDataSource.DataSet.FieldByName('precoVenda').AsCurrency *
    (StrToInt(edtQuantidade.Text))));
  fdmItens.Post;

  lblValorTotal.Caption := 'R$ ' + fdmItens.FieldByName('totalGeral').AsString;

  edtIdProduto.Clear;
  edtValorUnitario.Clear;
  edtQuantidade.Text := '1';
end;

procedure TfrmPedidoVenda.SpeedButton4Click(Sender: TObject);
var
  iId: Integer;
  dataItens: TDataSource;
begin
  if edtNumeroPedido.Text = EmptyStr then
  begin
    Application.MessageBox('Informe o n�mero do pedido!', 'Aten��o', MB_OK+MB_ICONEXCLAMATION);
    edtNumeroPedido.SetFocus;
    Abort;
  end;

  TryStrToInt(edtNumeroPedido.Text, iId);
  if iId <> 0 then
  begin
    FController.Pedido.Build.ListarPorId(iId).DataSource(FDataSource);
    if not FDataSource.DataSet.IsEmpty then
    begin
      edtIdCliente.Text := FDataSource.DataSet.FieldByName('idCliente').AsString;
      dataItens := TDataSource.Create(nil);
      try
        FController.PedidoItens.Build.ListarPor('idPedido', iId).DataSource(dataItens);
        while not dataItens.DataSet.Eof do
        begin
          fdmItens.Append;
          fdmItens.FieldByName('idProduto').AsString := dataItens.DataSet.FieldByName('idProduto').AsString;
          fdmItens.FieldByName('descricaoProduto').AsString := FController.Produto.Build.ListarPorId(dataItens.DataSet.FieldByName('idProduto').AsInteger).This.Descricao;
          fdmItens.FieldByName('quantidade').AsString := dataItens.DataSet.FieldByName('quantidade').AsString;
          fdmItens.FieldByName('valorUnitario').AsString := FormatFloat('#,##0.00', dataItens.DataSet.FieldByName('valorUnitario').AsFloat);
          fdmItens.FieldByName('valorTotal').AsString := FormatFloat('#,##0.00', dataItens.DataSet.FieldByName('valorTotal').AsFloat);
          fdmItens.Post;
          dataItens.DataSet.Next;
        end;

        lblValorTotal.Caption := 'R$ ' + fdmItens.FieldByName('totalGeral').AsString;

      finally
        FreeAndNil(dataItens);
      end;

      Exit;
    end;
    Application.MessageBox('N�o foi poss�vel encontrar pedido pelo n�mero informado!','Aten��o', MB_OK+MB_ICONWARNING);
    edtNumeroPedido.Text := '';
  end;
end;

procedure TfrmPedidoVenda.btnConfirmarClick(Sender: TObject);
begin
  if (edtIdCliente.Text = EmptyStr) or (edtNomeCliente.Text = EmptyStr) then
  begin
    Application.MessageBox('Informe o cliente', 'Aten��o', MB_OK+MB_ICONWARNING);
    edtIdCliente.SetFocus;
    Exit;
  end;

  if (edtIdProduto.Text = EmptyStr) then
  begin
    Application.MessageBox('Informe o produto', 'Aten��o', MB_OK+MB_ICONWARNING);
    edtIdProduto.SetFocus;
    Exit;
  end;


  PreencheList;
end;

procedure TfrmPedidoVenda.btnFinalizarPedidoClick(Sender: TObject);
var
  iIdPedido: Integer;
  I: Integer;
begin
  try
    iIdPedido := FController.Pedido
      .IdCliente(StrToInt(edtIdCliente.Text))
      .Build
      .Inserir
      .LastID.This.Id;

    fdmItens.First;
    while not fdmItens.Eof do
    begin
      FController.PedidoItens
        .IdPedido(iIdPedido)
        .IdProduto(fdmItens.FieldByName('idProduto').AsInteger)
        .Quantidade(fdmItens.FieldByName('quantidade').AsInteger)
        .ValorUnitario(fdmItens.FieldByName('valorUnitario').AsFloat)
        .ValorTotal(fdmItens.FieldByName('valorTotal').AsFloat)
        .Build.Inserir;

      fdmItens.Next;
    end;

//    FController.Pedido.Id(iIdPedido).Build.Atualizar

    Application.MessageBox('Pedido realizado com sucesso!','Sucesso',MB_OK+MB_ICONEXCLAMATION);

    edtIdCliente.Clear;
    edtNomeCliente.Clear;
    fdmItens.Close;
  except
    raise Exception.Create('N�o foi possivel realizar o pedido');
  end;
end;

procedure TfrmPedidoVenda.dbgrdItensKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
    begin
      ShowMessage('oi');
    end;
    VK_DELETE:
    begin
      if Application.MessageBox('Deseja remover o produto?','Confirma��o',MB_YESNO + MB_ICONQUESTION) = mrYes then
        dbgrdItens.DataSource.DataSet.Delete;

      lblValorTotal.Caption := 'R$ ' + fdmItens.FieldByName('totalGeral').AsString;
    end;
  end;
end;

procedure TfrmPedidoVenda.btnCancelarPedidoClick(Sender: TObject);
begin
  fdmItens.Close;
end;

end.
