unit untPedidoVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untDataModule, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, System.UITypes, untCPedido, untCPedidoProduto, untPedidoItem;

type
  TfrmPedidoVenda = class(TForm)
    Panel1: TPanel;
    Label7: TLabel;
    btFechar: TButton;
    restID: TFDQuery;
    restIDcodigo: TLargeintField;
    restPedidoVenda: TFDQuery;
    restPedidoVendaidpedido: TFDAutoIncField;
    restPedidoVendadataemissao: TDateField;
    restPedidoVendaidcliente: TIntegerField;
    restPedidoVendavalortotal: TBCDField;
    restPedidoVendanome: TStringField;
    restPedidoItem: TFDQuery;
    restPedidoItemidpedidoproduto: TFDAutoIncField;
    restPedidoItemidpedido: TIntegerField;
    restPedidoItemidproduto: TIntegerField;
    restPedidoItemquantidade: TBCDField;
    restPedidoItemvalorunit: TBCDField;
    restPedidoItemvalortotalproduto: TBCDField;
    restPedidoItemproduto: TStringField;
    restCliente: TFDQuery;
    restClienteidcliente: TFDAutoIncField;
    restClientenome: TStringField;
    restClientecidade: TStringField;
    restClienteuf: TStringField;
    dtPedidoVenda: TDataSource;
    dtPedidoItem: TDataSource;
    dtCliente: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label6: TLabel;
    DBGrid2: TDBGrid;
    TabSheet2: TTabSheet;
    Panel8: TPanel;
    Panel6: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edCliente: TDBLookupComboBox;
    edCodigo: TEdit;
    edDataEmissao: TDateTimePicker;
    Panel9: TPanel;
    Label5: TLabel;
    btIncluir: TButton;
    btSalvar: TButton;
    edValorTotal: TEdit;
    btCarregarPedido: TButton;
    btCancelarPedido: TButton;
    Panel13: TPanel;
    Label4: TLabel;
    DBGridPedidoProduto: TDBGrid;
    Panel3: TPanel;
    btIncluirProduto: TButton;
    procedure btSalvarClick(Sender: TObject);
    procedure btIncluirProdutoClick(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure btCarregarPedidoClick(Sender: TObject);
    procedure btCancelarPedidoClick(Sender: TObject);
    procedure btIncluirClick(Sender: TObject);
    procedure DBGridPedidoProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridPedidoProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure PageControl1Change(Sender: TObject);
    procedure restPedidoVendaAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
    procedure calcularValorTotal;
  public
    { Public declarations }
    vAcao : Integer;
  end;

var
  frmPedidoVenda: TfrmPedidoVenda;

implementation

{$R *.dfm}

procedure TfrmPedidoVenda.btCancelarPedidoClick(Sender: TObject);
var
  vidPedido : string;
  Pedido : Tpedido;
  PedidoProduto : TpedidoProduto;
begin
  try
  vidPedido := InputBox('Pedido', 'Digite o número do pedido', '');

  if vidPedido <> '' then
    begin
      Pedido := Tpedido.Create;
      PedidoProduto := TpedidoProduto.Create;
      PedidoProduto.Getidpedido := StrToInt(vidPedido);

      PedidoProduto.ApagarItenPedido;

      Pedido.Getidpedido := StrToInt(vidPedido);
      Pedido.ApagarPedido;

      restPedidoVenda.Close;
      restPedidoVenda.Open;

      edCodigo.Text := restPedidoVenda.FieldByName('idpedido').AsString;
      edDataEmissao.Date := restPedidoVenda.FieldByName('dataemissao').AsDateTime;
      edCliente.KeyValue := restPedidoVenda.FieldByName('idcliente').AsInteger;
      edValorTotal.Text :=  FormatFloat('#,##0.00;(#,##0.00)',restPedidoVenda.FieldByName('valortotal').AsFloat);

      restPedidoItem.Close;
      restPedidoItem.ParamByName('vidpedido').Value := restPedidoVenda.FieldByName('idpedido').AsInteger;
      restPedidoItem.Open;

      FreeAndNil(Pedido);
      FreeAndNil(PedidoProduto);
     // btSalvarClick(Sender);
    end;
  Except
    begin
      ShowMessage('TfrmPedidoVenda.btCancelarPedidoClick erro gerado, com mensagem: Erro ao cancelar pedido');
      if Pedido <> nil then
        begin
          FreeAndNil(Pedido);
        end;

      if PedidoProduto <> nil then
        begin
          FreeAndNil(PedidoProduto);
        end;
    end;

  end;

end;

procedure TfrmPedidoVenda.btCarregarPedidoClick(Sender: TObject);
var
  vidPedido : string;
  Pedido : Tpedido;
  PedidoProduto : TpedidoProduto;
  ibQueryGenerica : TFDQuery;
begin
  try
  vidPedido := InputBox('Pedido', 'Digite o número do pedido', '');

  if vidPedido <> '' then
    begin
      Pedido := Tpedido.Create;
      PedidoProduto := TpedidoProduto.Create;
      PedidoProduto.Getidpedido := restPedidoVenda.FieldByName('idpedido').AsInteger;

      PedidoProduto.ApagarItenPedido;
      restPedidoItem.Close;
      restPedidoItem.ParamByName('vidpedido').Value := restPedidoVenda.FieldByName('idpedido').AsInteger;
      restPedidoItem.Open;


      Pedido.Getidpedido := StrToInt(vidPedido);
      Pedido.CarregarrPedido;

      PedidoProduto.Getidpedido :=  Pedido.Getidpedido;

      edCliente.KeyValue := Pedido.Getidcliente;
      edValorTotal.Text := FormatFloat('#,##0.00;(#,##0.00)',Pedido.Getvalortotal);


      ibQueryGenerica := TFDQuery.Create(nil);
      ibQueryGenerica.Connection := DataModuleWK.FDConnectionWK;
      ibQueryGenerica.SQL.Add('select * from cadpedidoproduto where idpedido = ' + IntToStr(Pedido.Getidpedido));
      ibQueryGenerica.Open;

      ibQueryGenerica.First;
      while not ibQueryGenerica.Eof do
        begin
          restPedidoItem.Insert;
          restPedidoItem.FieldByName('idpedido').AsInteger := restPedidoVenda.FieldByName('idpedido').AsInteger;
          restPedidoItem.FieldByName('idproduto').AsInteger := ibQueryGenerica.FieldByName('idproduto').AsInteger;
          restPedidoItem.FieldByName('quantidade').AsFloat := ibQueryGenerica.FieldByName('quantidade').AsFloat;
          restPedidoItem.FieldByName('valorunit').AsFloat := ibQueryGenerica.FieldByName('valorunit').AsFloat;
          restPedidoItem.FieldByName('valortotalproduto').AsFloat := ibQueryGenerica.FieldByName('valortotalproduto').AsFloat;

          restPedidoItem.Post;
          ibQueryGenerica.Next
        end;


      FreeAndNil(Pedido);
      FreeAndNil(PedidoProduto);
      FreeAndNil(ibQueryGenerica);
      btSalvarClick(Sender);
    end;
  Except
    begin
      ShowMessage('TfrmPedidoVenda.btCarregarPedidoClick erro gerado, com mensagem: Erro ao carregar pedido');
      if Pedido <> nil then
        begin
          FreeAndNil(Pedido);
        end;

      if PedidoProduto <> nil then
        begin
          FreeAndNil(PedidoProduto);
        end;

      if ibQueryGenerica <> nil then
        begin
          FreeAndNil(ibQueryGenerica);
        end;
    end;

  end;

end;

procedure TfrmPedidoVenda.btFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPedidoVenda.btIncluirClick(Sender: TObject);
begin
  try
  if not (restPedidoVenda.State = dsBrowse)
    then restPedidoVenda.Cancel;

  //restPedidoVenda.Insert;
  vAcao := 0;
  edCodigo.Clear;
  edDataEmissao.Date := Date;
  edCliente.KeyValue := 0;
  edValorTotal.Clear;

  restPedidoItem.Close;
  restPedidoItem.ParamByName('vidpedido').Value := 0;
  restPedidoItem.Open;

  edDataEmissao.SetFocus;
  Except
    on E : Exception do ShowMessage(E.ClassName + 'erro gerado, com mensagem: ' + E.Message);
  end;
end;

procedure TfrmPedidoVenda.btIncluirProdutoClick(Sender: TObject);
begin
if frmPedidoItem = nil then
    begin
      try
      Application.CreateForm(TfrmPedidoItem,frmPedidoItem);
      frmPedidoItem.vAcaoItem := 0;
      frmPedidoItem.ShowModal;
      FreeAndNil(frmPedidoItem);

      calcularValorTotal;
      Except
        on E : Exception do ShowMessage(E.ClassName + 'erro gerado, com mensagem: ' + E.Message);
      end;
    end;
end;

procedure TfrmPedidoVenda.btSalvarClick(Sender: TObject);
var
  Pedido : Tpedido;
  PedidoItem : TpedidoProduto;
begin
  try
  if restPedidoItem.IsEmpty then
    begin
      ShowMessage('É necessários incluir o produto no pedido.');
      edCodigo.SetFocus;
      Exit;
    end;

  Pedido := Tpedido.Create;
  if vAcao = 1 then
    Pedido.Getidpedido := StrToInt(edCodigo.Text);
  Pedido.Getdataemissao := edDataEmissao.Date;
  Pedido.Getidcliente := edCliente.KeyValue;
  if edValorTotal.Text = '' then
    Pedido.Getvalortotal := 0
  else
    Pedido.Getvalortotal := StrToFloat(edValorTotal.Text);


  restID.Close;
  Pedido.SalvarPedido;
  restID.Open;

  if vAcao = 0 then
    begin
    Pedido.Getidpedido := restID.FieldByName('codigo').AsInteger;
    edCodigo.Text := IntToStr(Pedido.Getidpedido);
    end;

  PedidoItem := TpedidoProduto.Create;

  restPedidoItem.First;
  while not restPedidoItem.Eof do
    begin
      PedidoItem.Getidpedidoproduto := restPedidoItem.FieldByName('idpedidoproduto').AsInteger;
      if vAcao = 0 then
          PedidoItem.Getidpedido := restID.FieldByName('codigo').AsInteger

      else
          PedidoItem.Getidpedido := restPedidoVenda.FieldByName('idpedido').AsInteger;


      PedidoItem.Getidproduto := restPedidoItem.FieldByName('idproduto').AsInteger;
      PedidoItem.Getquantidade := restPedidoItem.FieldByName('quantidade').AsFloat;
      PedidoItem.Getvalorunit := restPedidoItem.FieldByName('valorunit').AsFloat;
      PedidoItem.Getvalortotalproduto := restPedidoItem.FieldByName('valortotalproduto').AsFloat;

      PedidoItem.SalvarPedidoProduto;

      restPedidoItem.Next;
    end;

  restPedidoItem.Close;
  restPedidoItem.ParamByName('vidpedido').Value := Pedido.Getidpedido;
  restPedidoItem.Open;

  restPedidoVenda.Refresh;
  restPedidoVenda.Locate('idpedido', Pedido.Getidpedido,[loCaseInsensitive, loPartialKey]);
  restPedidoVendaAfterScroll(restPedidoVenda);

  FreeAndNil(Pedido);
  FreeAndNil(PedidoItem);
  Except
    begin
      ShowMessage('TfrmPedidoVenda.btSalvarClick erro gerado, com mensagem: Erro ao salvar pedido');
      if Pedido <> nil then
        begin
          FreeAndNil(Pedido);
        end;

      if PedidoItem <> nil then
        begin
          FreeAndNil(PedidoItem);
        end;
    end;
  end;

end;

procedure TfrmPedidoVenda.calcularValorTotal;
var
  vValorTotal : Double;
begin
  try
  restPedidoItem.First;
  vValorTotal := 0;
  while not restPedidoItem.Eof do
    begin
      vValorTotal := vValorTotal + restPedidoItem.FieldByName('valortotalproduto').AsFloat;
      restPedidoItem.Next;
    end;

    edValorTotal.Text := FormatFloat('#,##0.00;(#,##0.00)',vValorTotal);
    Except
      on E : Exception do ShowMessage(E.ClassName + 'erro gerado, com mensagem: ' + E.Message);
  end;

end;

procedure TfrmPedidoVenda.DBGridPedidoProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  PedidoItem : TpedidoProduto;
begin
if Key = VK_DELETE then
    begin
       if MessageDlg('Deseja Excluir esse item ?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
       begin
          try
          if restPedidoItem.FieldByName('idpedidoproduto').IsNull then
            begin
              restPedidoItem.Delete;
            end
          else
            begin
              PedidoItem := TpedidoProduto.Create;
              PedidoItem.Getidpedidoproduto := restPedidoItem.FieldByName('idpedidoproduto').AsInteger;
              PedidoItem.Getidpedido := restPedidoItem.FieldByName('idpedido').AsInteger;
              if PedidoItem.ApagarPedidoProduto then
                begin
                  restPedidoItem.Close;
                  restPedidoItem.ParamByName('vidpedido').Value := PedidoItem.Getidpedido;
                  restPedidoItem.Open;
                end;
            end;

            calcularValorTotal;
          Except
            begin
              ShowMessage('TfrmPedidoVenda.DBGridPedidoProdutoKeyDown erro gerado, com mensagem: Erro ao excluir item pedido');
              if PedidoItem <> nil then
                begin
                  FreeAndNil(PedidoItem);
                 end;
            end;

          end;
       end;
    end;

end;

procedure TfrmPedidoVenda.DBGridPedidoProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 Then
    begin
      if frmPedidoItem = nil then
        begin
          try
          Application.CreateForm(TfrmPedidoItem,frmPedidoItem);
          frmPedidoItem.vAcaoItem := 1;
          frmPedidoItem.ShowModal;
          FreeAndNil(frmPedidoItem);

          calcularValorTotal;
          Except
              on E : Exception do ShowMessage(E.ClassName + 'erro gerado, com mensagem: ' + E.Message);

          end;
        end;
    end;

end;

procedure TfrmPedidoVenda.FormCreate(Sender: TObject);
begin
Screen.Cursor := crHourGlass;
  try
  restPedidoVenda.Open;
  restCliente.Open;
  Except
    on E : Exception do ShowMessage(E.ClassName + 'erro gerado, com mensagem: ' + E.Message);

  end;
  Screen.Cursor := crDefault;
end;

procedure TfrmPedidoVenda.FormKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
     Perform(WM_nextdlgctl,0,0)
 else if Key =  #27 then
     Perform(WM_nextdlgctl,1,0)
end;

procedure TfrmPedidoVenda.PageControl1Change(Sender: TObject);
begin
  if PageControl1.ActivePageIndex = 1 then
    begin
      try

      if restPedidoVenda.IsEmpty then
        begin
        vAcao := 0;
        btIncluirClick(Sender);
        end
      else
        begin
          vAcao := 1;
          edCodigo.Text := restPedidoVenda.FieldByName('idpedido').AsString;
          edDataEmissao.Date := restPedidoVenda.FieldByName('dataemissao').AsDateTime;
          edCliente.KeyValue := restPedidoVenda.FieldByName('idcliente').AsInteger;
          edValorTotal.Text := FormatFloat('#,##0.00;(#,##0.00)',restPedidoVenda.FieldByName('valortotal').AsFloat);
        end;

      restPedidoItem.Close;
      restPedidoItem.ParamByName('vidpedido').Value := restPedidoVenda.FieldByName('idpedido').AsInteger;
      restPedidoItem.Open;

      edDataEmissao.SetFocus;
      Except
        on E : Exception do ShowMessage(E.ClassName + 'erro gerado, com mensagem: ' + E.Message);

      end;
    end
  else
    begin
      try
      restPedidoVenda.Close;
      restPedidoVenda.Open;
      Except
          on E : Exception do ShowMessage(E.ClassName + 'erro gerado, com mensagem: ' + E.Message);

      end;
    end;
end;

procedure TfrmPedidoVenda.restPedidoVendaAfterScroll(DataSet: TDataSet);
begin
try
    if restPedidoVenda.State = dsBrowse then
    begin
      if (restPedidoVenda.FieldByName('idcliente').IsNull) and (not restPedidoVenda.FieldByName('idpedido').IsNull)  then
        begin
          btCarregarPedido.Visible := True;
          btCancelarPedido.Visible := True;
        end
      else
        begin
          btCarregarPedido.Visible := False;
          btCancelarPedido.Visible := False;
        end;
    end;
  Except
    on E : Exception do ShowMessage(E.ClassName + 'erro gerado, com mensagem: ' + E.Message);
  end;
end;

end.
