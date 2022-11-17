object frmPedidoVenda: TfrmPedidoVenda
  Left = 0
  Top = 0
  Caption = 'Pedido de Venda'
  ClientHeight = 670
  ClientWidth = 860
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    860
    670)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 12
    Top = 18
    Width = 403
    Height = 58
    Caption = 'Pedido de Venda'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -48
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 12
    Top = 91
    Width = 80
    Height = 16
    Caption = 'C'#243'digo cliente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 139
    Top = 91
    Width = 92
    Height = 16
    Caption = 'Nome do cliente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 12
    Top = 169
    Width = 87
    Height = 16
    Caption = 'C'#243'digo produto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 139
    Top = 169
    Width = 65
    Height = 16
    Caption = 'Quantidade'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 293
    Top = 169
    Width = 77
    Height = 16
    Caption = 'Valor unit'#225'rio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object btnConfirmar: TSpeedButton
    Left = 468
    Top = 189
    Width = 143
    Height = 31
    Caption = 'Confirmar'
    OnClick = btnConfirmarClick
  end
  object btnFinalizarPedido: TSpeedButton
    Left = 12
    Top = 626
    Width = 143
    Height = 31
    Caption = 'Finalizar Pedido'
    OnClick = btnFinalizarPedidoClick
  end
  object btnCancelarPedido: TSpeedButton
    Left = 161
    Top = 626
    Width = 143
    Height = 31
    Caption = 'Cancelar Pedido'
    OnClick = btnCancelarPedidoClick
  end
  object Label7: TLabel
    Left = 666
    Top = 19
    Width = 87
    Height = 16
    Caption = 'N'#250'mero Pedido'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object SpeedButton4: TSpeedButton
    Left = 818
    Top = 40
    Width = 32
    Height = 31
    OnClick = SpeedButton4Click
  end
  object edtIdCliente: TEdit
    Left = 12
    Top = 110
    Width = 121
    Height = 33
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnChange = edtIdClienteChange
  end
  object edtNomeCliente: TEdit
    Left = 139
    Top = 110
    Width = 472
    Height = 33
    TabStop = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
  end
  object edtIdProduto: TEdit
    Left = 12
    Top = 188
    Width = 121
    Height = 33
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnChange = edtIdProdutoChange
  end
  object edtQuantidade: TEdit
    Left = 139
    Top = 188
    Width = 148
    Height = 33
    Alignment = taRightJustify
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    NumbersOnly = True
    ParentFont = False
    TabOrder = 3
    Text = '1'
  end
  object edtValorUnitario: TEdit
    Left = 293
    Top = 188
    Width = 148
    Height = 33
    TabStop = False
    Alignment = taRightJustify
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
  end
  object Panel27: TPanel
    Left = 590
    Top = 621
    Width = 265
    Height = 41
    Anchors = [akRight]
    BevelOuter = bvNone
    Padding.Left = 5
    Padding.Top = 5
    Padding.Right = 5
    Padding.Bottom = 5
    TabOrder = 5
    object Shape5: TShape
      Left = 5
      Top = 5
      Width = 255
      Height = 31
      Align = alClient
      Pen.Color = 11710638
      Shape = stRoundRect
      ExplicitLeft = -3
      ExplicitTop = -3
      ExplicitWidth = 143
    end
    object Label8: TLabel
      Left = 14
      Top = 12
      Width = 98
      Height = 16
      Caption = 'Total do Pedido: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblValorTotal: TLabel
      Left = 208
      Top = 12
      Width = 44
      Height = 16
      Alignment = taRightJustify
      Caption = 'R$ 0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object edtNumeroPedido: TEdit
    Left = 666
    Top = 38
    Width = 148
    Height = 33
    TabStop = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object Panel16: TPanel
    Left = 12
    Top = 237
    Width = 838
    Height = 30
    BevelOuter = bvNone
    TabOrder = 7
    object pnlTitleDescricao: TPanel
      AlignWithMargins = True
      Left = 94
      Top = 0
      Width = 270
      Height = 30
      Margins.Left = 2
      Margins.Top = 0
      Margins.Right = 2
      Margins.Bottom = 0
      Align = alLeft
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Color = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      Padding.Left = 5
      Padding.Top = 5
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      object Label9: TLabel
        Left = 5
        Top = 5
        Width = 265
        Height = 25
        Align = alClient
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 4
        ExplicitTop = 7
      end
    end
    object pnlTitleCodigo: TPanel
      Left = 0
      Top = 0
      Width = 92
      Height = 30
      Margins.Left = 2
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Color = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      Padding.Left = 5
      Padding.Top = 5
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      object Label10: TLabel
        Left = 5
        Top = 5
        Width = 87
        Height = 25
        Align = alClient
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 6
      end
    end
    object pnlTitleQuantidade: TPanel
      AlignWithMargins = True
      Left = 366
      Top = 0
      Width = 95
      Height = 30
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 2
      Margins.Bottom = 0
      Align = alLeft
      Alignment = taRightJustify
      BevelOuter = bvNone
      Color = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      Padding.Top = 5
      Padding.Right = 5
      ParentBackground = False
      ParentFont = False
      TabOrder = 2
      object Label11: TLabel
        Left = 0
        Top = 5
        Width = 90
        Height = 25
        Align = alClient
        Alignment = taRightJustify
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 1
      end
    end
    object pnlTitleValorUnitario: TPanel
      AlignWithMargins = True
      Left = 463
      Top = 0
      Width = 100
      Height = 30
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 2
      Margins.Bottom = 0
      Align = alLeft
      Alignment = taRightJustify
      BevelOuter = bvNone
      Color = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      Padding.Top = 5
      Padding.Right = 5
      ParentBackground = False
      ParentFont = False
      TabOrder = 3
      object Label12: TLabel
        Left = 0
        Top = 5
        Width = 95
        Height = 25
        Align = alClient
        Alignment = taRightJustify
        Caption = 'Valor Unit'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = -1
      end
    end
    object pnlTitleValorTotal: TPanel
      AlignWithMargins = True
      Left = 565
      Top = 0
      Width = 273
      Height = 30
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alClient
      Alignment = taRightJustify
      BevelOuter = bvNone
      Color = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      Padding.Top = 5
      Padding.Right = 10
      ParentBackground = False
      ParentFont = False
      TabOrder = 4
      object Label13: TLabel
        Left = 0
        Top = 5
        Width = 263
        Height = 25
        Align = alClient
        Alignment = taRightJustify
        Caption = 'Valor Total'
        Color = clSkyBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        ExplicitWidth = 247
      end
    end
  end
  object dbgrdItens: TDBGrid
    Left = 12
    Top = 266
    Width = 838
    Height = 349
    DataSource = dtsItens
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnKeyDown = dbgrdItensKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'idProduto'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricaoProduto'
        Width = 271
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quantidade'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valorUnitario'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valorTotal'
        Width = 253
        Visible = True
      end>
  end
  object fdmItens: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    AggregatesActive = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 442
    Top = 338
    object fdmItensidProduto: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 10
      FieldName = 'idProduto'
    end
    object fdmItensdescricaoProduto: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 38
      FieldName = 'descricaoProduto'
      Size = 100
    end
    object fdmItensquantidade: TIntegerField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 13
      FieldName = 'quantidade'
    end
    object fdmItensvalorUnitario: TCurrencyField
      DisplayLabel = 'Valor unit'#225'rio'
      DisplayWidth = 14
      FieldName = 'valorUnitario'
    end
    object fdmItensvalorTotal: TCurrencyField
      DisplayLabel = 'Valor total'
      DisplayWidth = 35
      FieldName = 'valorTotal'
    end
    object fdmItenstotalGeral: TAggregateField
      FieldName = 'totalGeral'
      Active = True
      DisplayName = ''
      Expression = 'sum(valorTotal)'
    end
  end
  object dtsItens: TDataSource
    DataSet = fdmItens
    Left = 478
    Top = 338
  end
end
