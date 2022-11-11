object frmPedidoVenda: TfrmPedidoVenda
  Left = 0
  Top = 0
  Caption = 'Pedido de Venda'
  ClientHeight = 442
  ClientWidth = 655
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object edtIdCliente: TEdit
    Left = 44
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 0
    OnChange = edtIdClienteChange
  end
  object edtNomeCliente: TEdit
    Left = 171
    Top = 40
    Width = 322
    Height = 21
    TabOrder = 1
  end
end
