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
    btnBuscaPedido: TSpeedButton;
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
    fdmItensitem: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure edtIdClienteChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarPedidoClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure edtIdProdutoChange(Sender: TObject);
    procedure btnFinalizarPedidoClick(Sender: TObject);
    procedure btnBuscaPedidoClick(Sender: TObject);
    procedure dbgrdItensKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    FController: iController;
    FDataSource: TDataSource;
    FValorTotal: Double;
    FIdPedido: Integer;
    FItem: Integer;

    procedure PreencheList;
    procedure TotalizarPedido;
    procedure EditarItem(aItem: Integer);
    procedure LimparDadosProduto;
    procedure HabilitaCampos(aValue: Boolean);
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
  if not fdmItens.Active then
    fdmItens.Open;

  TryStrToInt(edtIdCliente.Text, iId);
  if not (iId = 0) then
  begin
    edtNomeCliente.Text := FController.Cliente.Build.ListarPorId(iId).This.Nome;
    HabilitaCampos(True);
  end;
end;

procedure TfrmPedidoVenda.edtIdProdutoChange(Sender: TObject);
var
  iId: Integer;
begin
  if FItem > 0 then
    Exit;

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
    LimparDadosProduto;
  end;
end;

procedure TfrmPedidoVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FDataSource.DisposeOf;
end;

procedure TfrmPedidoVenda.FormCreate(Sender: TObject);
begin
  FDataSource := TDataSource.Create(nil);
  FController := TController.New;
end;

procedure TfrmPedidoVenda.HabilitaCampos(aValue: Boolean);
begin
  edtIdCliente.Enabled := aValue;
  edtIdProduto.Enabled := aValue;
  edtNumeroPedido.Enabled := aValue and (not (edtIdCliente.Text <> EmptyStr));
end;

procedure TfrmPedidoVenda.PreencheList;
var
  ListItem: TListItem;
begin
  fdmItens.Append;
  fdmItens.FieldByName('item').AsInteger := fdmItens.RecordCount + 1;
  fdmItens.FieldByName('idProduto').AsString := edtIdProduto.Text;
  fdmItens.FieldByName('descricaoProduto').AsString := FDataSource.DataSet.FieldByName('descricao').AsString;
  fdmItens.FieldByName('quantidade').AsString := edtQuantidade.Text;
  fdmItens.FieldByName('valorUnitario').AsString := edtValorUnitario.Text;
  fdmItens.FieldByName('valorTotal').AsString := FormatFloat('#,##0.00',(fdmItens.FieldByName('valorUnitario').AsCurrency *
    (StrToInt(edtQuantidade.Text))));
  fdmItens.Post;

  TotalizarPedido;

  LimparDadosProduto;
end;

procedure TfrmPedidoVenda.TotalizarPedido;
begin
  if (fdmItens.RecordCount <= 0) or (fdmItens.FieldByName('totalGeral').Value = 0) then
  begin
    lblValorTotal.Caption := 'R$ 0,00';
    FValorTotal := 0;
    Exit;
  end;

  lblValorTotal.Caption := 'R$ ' + fdmItens.FieldByName('totalGeral').AsString;
  FValorTotal := fdmItens.FieldByName('totalGeral').Value;
end;

procedure TfrmPedidoVenda.btnBuscaPedidoClick(Sender: TObject);
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
      FIdPedido := FDataSource.DataSet.FieldByName('id').AsInteger;
      dataItens := TDataSource.Create(nil);
      try
        FController.PedidoItens.Build.ListarPor('idPedido', iId).DataSource(dataItens);
        while not dataItens.DataSet.Eof do
        begin
          fdmItens.Append;
          fdmItens.FieldByName('item').AsInteger := fdmItens.RecordCount + 1;
          fdmItens.FieldByName('idProduto').AsString := dataItens.DataSet.FieldByName('idProduto').AsString;
          fdmItens.FieldByName('descricaoProduto').AsString := FController.Produto.Build.ListarPorId(dataItens.DataSet.FieldByName('idProduto').AsInteger).This.Descricao;
          fdmItens.FieldByName('quantidade').AsString := dataItens.DataSet.FieldByName('quantidade').AsString;
          fdmItens.FieldByName('valorUnitario').AsString := FormatFloat('#,##0.00', dataItens.DataSet.FieldByName('valorUnitario').AsFloat);
          fdmItens.FieldByName('valorTotal').AsString := FormatFloat('#,##0.00', dataItens.DataSet.FieldByName('valorTotal').AsFloat);
          fdmItens.Post;
          dataItens.DataSet.Next;
        end;

        TotalizarPedido;
        HabilitaCampos(False);

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

  if FItem > 0 then
    EditarItem(FItem)
  else
    PreencheList;
end;

procedure TfrmPedidoVenda.btnFinalizarPedidoClick(Sender: TObject);
var
  iIdPedido: Integer;
begin
  try
    iIdPedido := FController.Pedido
      .IdCliente(StrToInt(edtIdCliente.Text))
      .ValorTotal(FValorTotal)
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

    Application.MessageBox('Pedido realizado com sucesso!','Sucesso',MB_OK+MB_ICONINFORMATION);

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
      FItem := fdmItens.FieldByName('item').AsInteger;
      edtIdProduto.Text := fdmItens.FieldByName('idProduto').AsString;
      edtQuantidade.Text := fdmItens.FieldByName('quantidade').AsString;
      edtValorUnitario.Text := fdmItens.FieldByName('valorUnitario').AsString;

      HabilitaCampos(False);
    end;
    VK_DELETE:
    begin
      if Application.MessageBox('Deseja remover o produto?','Confirma��o',MB_YESNO + MB_ICONQUESTION) = mrYes then
        dbgrdItens.DataSource.DataSet.Delete;

      TotalizarPedido;
    end;
  end;
end;

procedure TfrmPedidoVenda.EditarItem(aItem: Integer);
begin
  fdmItens.Locate('item', aItem);
  fdmItens.Edit;
  fdmItens.FieldByName('idProduto').AsString := edtIdProduto.Text;
  fdmItens.FieldByName('quantidade').AsString := edtQuantidade.Text;
  fdmItens.FieldByName('valorUnitario').AsString := edtValorUnitario.Text;
  fdmItens.FieldByName('valorTotal').AsString := FormatFloat('#,##0.00',(fdmItens.FieldByName('valorUnitario').AsCurrency *
    (StrToInt(edtQuantidade.Text))));
  fdmItens.Post;

  FItem := 0;

  LimparDadosProduto;
  HabilitaCampos(True);
end;

procedure TfrmPedidoVenda.LimparDadosProduto;
begin
  edtIdProduto.Clear;
  edtValorUnitario.Clear;
  edtQuantidade.Text := '1';
end;

procedure TfrmPedidoVenda.btnCancelarPedidoClick(Sender: TObject);
begin
  if FIdPedido > 0 then
  begin
    FController.PedidoItens.Build.Excluir('idPedido', IntToStr(FIdPedido));
    FController.Pedido.Build.Excluir('id', IntToStr(FIdPedido));
  end;

  edtIdCliente.Clear;
  edtNomeCliente.Clear;
  fdmItens.Close;
  HabilitaCampos(True);
end;

end.
