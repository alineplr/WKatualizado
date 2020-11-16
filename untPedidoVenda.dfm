object frmPedidoVenda: TfrmPedidoVenda
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Pedidos'
  ClientHeight = 752
  ClientWidth = 1059
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1059
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 1187
    object Label7: TLabel
      Left = 11
      Top = 11
      Width = 78
      Height = 23
      Caption = 'PEDIDOS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object btFechar: TButton
      Left = 1010
      Top = 10
      Width = 35
      Height = 25
      Caption = 'X'
      TabOrder = 0
      OnClick = btFecharClick
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 41
    Width = 1059
    Height = 711
    ActivePage = TabSheet1
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 1
    OnChange = PageControl1Change
    ExplicitWidth = 1187
    ExplicitHeight = 441
    object TabSheet1: TTabSheet
      Caption = 'Consulta'
      ExplicitWidth = 1418
      object Label6: TLabel
        Left = 0
        Top = 0
        Width = 1051
        Height = 19
        Align = alTop
        Alignment = taCenter
        Caption = 'Pedidos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 64
      end
      object DBGrid2: TDBGrid
        Left = 0
        Top = 19
        Width = 1051
        Height = 661
        Align = alClient
        DataSource = dtPedidoVenda
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'idpedido'
            Title.Caption = 'C'#243'd. Pedido'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dataemissao'
            Title.Caption = 'Data Emiss'#227'o'
            Width = 84
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'idcliente'
            Title.Caption = 'C'#243'd Cliente'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Title.Caption = 'Cliente'
            Width = 435
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valortotal'
            Title.Caption = 'Valor Total'
            Width = 181
            Visible = True
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Cadastro'
      ImageIndex = 1
      ExplicitWidth = 1179
      ExplicitHeight = 410
      object Panel8: TPanel
        Left = 0
        Top = 0
        Width = 1051
        Height = 680
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitWidth = 1179
        ExplicitHeight = 410
        object Panel6: TPanel
          Left = 0
          Top = 0
          Width = 1051
          Height = 81
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          ExplicitWidth = 1179
          object Label1: TLabel
            Left = 8
            Top = 16
            Width = 58
            Height = 13
            Caption = 'C'#243'd. Pedido'
          end
          object Label2: TLabel
            Left = 135
            Top = 16
            Width = 64
            Height = 13
            Caption = 'Data Emiss'#227'o'
          end
          object Label3: TLabel
            Left = 225
            Top = 16
            Width = 33
            Height = 13
            Caption = 'Cliente'
          end
          object edCliente: TDBLookupComboBox
            Left = 224
            Top = 32
            Width = 481
            Height = 21
            KeyField = 'idcliente'
            ListField = 'nome'
            ListSource = dtCliente
            TabOrder = 2
          end
          object edCodigo: TEdit
            Left = 8
            Top = 32
            Width = 121
            Height = 21
            TabStop = False
            ReadOnly = True
            TabOrder = 0
            Text = 'edCodigo'
          end
          object edDataEmissao: TDateTimePicker
            Left = 135
            Top = 32
            Width = 82
            Height = 21
            Date = 44139.331340717600000000
            Time = 44139.331340717600000000
            TabOrder = 1
          end
        end
        object Panel9: TPanel
          Left = 0
          Top = 639
          Width = 1051
          Height = 41
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
          ExplicitTop = 369
          ExplicitWidth = 1179
          object Label5: TLabel
            Left = 849
            Top = 18
            Width = 73
            Height = 13
            Caption = 'Total Pedido:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btIncluir: TButton
            Left = 8
            Top = 10
            Width = 75
            Height = 25
            Caption = 'Incluir'
            TabOrder = 0
            OnClick = btIncluirClick
          end
          object btSalvar: TButton
            Left = 85
            Top = 10
            Width = 75
            Height = 25
            Caption = 'Salvar'
            TabOrder = 1
            OnClick = btSalvarClick
          end
          object edValorTotal: TEdit
            Left = 928
            Top = 14
            Width = 121
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
          end
          object btCarregarPedido: TButton
            Left = 192
            Top = 9
            Width = 105
            Height = 25
            Caption = 'Carregar Pedido'
            TabOrder = 2
            OnClick = btCarregarPedidoClick
          end
          object btCancelarPedido: TButton
            Left = 296
            Top = 9
            Width = 105
            Height = 25
            Caption = 'Cancelar Pedido'
            TabOrder = 3
            OnClick = btCancelarPedidoClick
          end
        end
        object Panel13: TPanel
          Left = 0
          Top = 81
          Width = 1051
          Height = 558
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 2
          ExplicitWidth = 1179
          ExplicitHeight = 288
          object Label4: TLabel
            Left = 0
            Top = 0
            Width = 1051
            Height = 19
            Align = alTop
            Alignment = taCenter
            Caption = 'Itens do Pedido'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitWidth = 128
          end
          object DBGridPedidoProduto: TDBGrid
            Left = 0
            Top = 19
            Width = 1002
            Height = 539
            Align = alClient
            DataSource = dtPedidoItem
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnKeyDown = DBGridPedidoProdutoKeyDown
            OnKeyPress = DBGridPedidoProdutoKeyPress
            Columns = <
              item
                Expanded = False
                FieldName = 'idpedidoproduto'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'idpedido'
                ReadOnly = True
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'idproduto'
                Title.Caption = 'C'#243'd. Produto'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'produto'
                Title.Caption = 'Produto'
                Width = 275
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'quantidade'
                Title.Caption = 'Quantidade'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'valorunit'
                Title.Caption = 'Valor Unit.'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'valortotalproduto'
                Title.Caption = 'Valor Total'
                Visible = True
              end>
          end
          object Panel3: TPanel
            Left = 1002
            Top = 19
            Width = 49
            Height = 539
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
            ExplicitLeft = 1130
            ExplicitHeight = 269
            object btIncluirProduto: TButton
              Left = 6
              Top = 6
              Width = 33
              Height = 25
              Caption = '+'
              TabOrder = 0
              OnClick = btIncluirProdutoClick
            end
          end
        end
      end
    end
  end
  object restID: TFDQuery
    Connection = DataModuleWK.FDConnectionWK
    SQL.Strings = (
      'select last_insert_id() as codigo')
    Left = 188
    Top = 140
    object restIDcodigo: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'codigo'
      Origin = 'codigo'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object restPedidoVenda: TFDQuery
    AfterScroll = restPedidoVendaAfterScroll
    Connection = DataModuleWK.FDConnectionWK
    SQL.Strings = (
      'SELECT p.idpedido,'
      '    p.dataemissao,'
      '    p.idcliente,'
      '    p.valortotal,'
      '    c.nome'
      'FROM cadpedido p'
      'left join cadcliente c on p.idcliente = c.idcliente'
      'order by  p.idpedido')
    Left = 244
    Top = 140
    object restPedidoVendaidpedido: TFDAutoIncField
      AutoGenerateValue = arNone
      FieldName = 'idpedido'
      Origin = 'idpedido'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      IdentityInsert = True
    end
    object restPedidoVendadataemissao: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'dataemissao'
      Origin = 'dataemissao'
    end
    object restPedidoVendaidcliente: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'idcliente'
      Origin = 'idcliente'
    end
    object restPedidoVendavalortotal: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'valortotal'
      Origin = 'valortotal'
      Precision = 18
      Size = 2
    end
    object restPedidoVendanome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome'
      Origin = 'nome'
      ProviderFlags = []
      Size = 200
    end
  end
  object restPedidoItem: TFDQuery
    Connection = DataModuleWK.FDConnectionWK
    SQL.Strings = (
      'SELECT pp.idpedidoproduto, '
      'pp.idpedido,'
      'pp.idproduto,'
      'pp.quantidade,'
      'pp.valorunit,'
      'pp.valortotalproduto,'
      'p.descricao as produto'
      'FROM cadpedidoproduto pp'
      'left join cadproduto p on pp.idproduto = p.idproduto'
      'where pp.idpedido = :vidpedido '
      'order by pp.idpedido, pp.idpedidoproduto')
    Left = 316
    Top = 140
    ParamData = <
      item
        Name = 'VIDPEDIDO'
        DataType = ftWideString
        ParamType = ptInput
      end>
    object restPedidoItemidpedidoproduto: TFDAutoIncField
      FieldName = 'idpedidoproduto'
      Origin = 'idpedidoproduto'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object restPedidoItemidpedido: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'idpedido'
      Origin = 'idpedido'
    end
    object restPedidoItemidproduto: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'idproduto'
      Origin = 'idproduto'
    end
    object restPedidoItemquantidade: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'quantidade'
      Origin = 'quantidade'
      Precision = 18
      Size = 2
    end
    object restPedidoItemvalorunit: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'valorunit'
      Origin = 'valorunit'
      Precision = 18
      Size = 2
    end
    object restPedidoItemvalortotalproduto: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'valortotalproduto'
      Origin = 'valortotalproduto'
      Precision = 18
      Size = 2
    end
    object restPedidoItemproduto: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'produto'
      Origin = 'descricao'
      ProviderFlags = []
      Size = 150
    end
  end
  object restCliente: TFDQuery
    Connection = DataModuleWK.FDConnectionWK
    SQL.Strings = (
      'SELECT C.idcliente,'
      '    C.nome,'
      '    C.cidade,'
      '    C.uf'
      'FROM cadcliente C'
      'order by C.nome')
    Left = 388
    Top = 140
    object restClienteidcliente: TFDAutoIncField
      FieldName = 'idcliente'
      Origin = 'idcliente'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object restClientenome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome'
      Origin = 'nome'
      Size = 200
    end
    object restClientecidade: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cidade'
      Origin = 'cidade'
      Size = 100
    end
    object restClienteuf: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'uf'
      Origin = 'uf'
      Size = 2
    end
  end
  object dtPedidoVenda: TDataSource
    DataSet = restPedidoVenda
    Left = 240
    Top = 192
  end
  object dtPedidoItem: TDataSource
    DataSet = restPedidoItem
    Left = 312
    Top = 192
  end
  object dtCliente: TDataSource
    DataSet = restCliente
    Left = 384
    Top = 192
  end
end
