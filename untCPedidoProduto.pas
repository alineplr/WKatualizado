unit untCPedidoProduto;

interface

uses System.SysUtils, untDataModule, FireDAC.Comp.Client, untCProduto, Dialogs, Data.DB;

 type TpedidoProduto = class

    private

    FGetidpedidoproduto: Integer;
    FGetidpedido: Integer;
    FGetidproduto: Integer;
    FGetquantidade: Double;
    FGetvalorunit: Double;
    FGetvalortotalproduto: Double;

    procedure Setidpedidoproduto(const Value: Integer);
    procedure Setidpedido(const Value: Integer);
    procedure Setidproduto(const Value: Integer);
    procedure Setquantidade(const Value: Double);
    procedure Setvalorunit(const Value: Double);
    procedure Setvalortotalproduto(const Value: Double);

    protected


    Public

    property Getidpedidoproduto : Integer read FGetidpedidoproduto write Setidpedidoproduto;
    property Getidpedido : Integer read FGetidpedido write Setidpedido;
    property Getidproduto   : Integer read FGetidproduto write Setidproduto;
    property Getquantidade  :Double read FGetquantidade write Setquantidade;
    property Getvalorunit  : Double read FGetvalorunit write Setvalorunit;
    property Getvalortotalproduto  : Double read FGetvalortotalproduto write Setvalortotalproduto;

    function ConsultarPedidoProduto : Boolean;
    function ApagarPedidoProduto : Boolean;
    function ApagarItenPedido : Boolean;

    Constructor Create;    // declaração do metodo construtor

    Destructor  Destroy; Override;

    function SalvarPedidoProduto : Boolean;
    end;

implementation


{ TpedidoProduto }



function TpedidoProduto.ApagarItenPedido: Boolean;
var
    ibQueryGenerica : TFDQuery;
begin
  try
  ibQueryGenerica := TFDQuery.Create(nil);

  ibQueryGenerica.Connection := DataModuleWK.FDConnectionWK;
  ibQueryGenerica.SQL.Add('delete from cadpedidoproduto where idpedido = ' + IntToStr(FGetidpedido));
  ibQueryGenerica.ExecSQL;

  if ibQueryGenerica.IsEmpty then
    Result := True
  else
    Result := False;

  FreeAndNil(ibQueryGenerica);
  Except
    begin
      ShowMessage('TpedidoProduto.ApagarItenPedido erro gerado, com mensagem: Erro ao excluir produtos do pedido.');
      if ibQueryGenerica <> nil then
        begin
          FreeAndNil(ibQueryGenerica);
        end;
      Result := False;
    end;
  end;

end;

function TpedidoProduto.ApagarPedidoProduto: Boolean;
var
    ibQueryGenerica : TFDQuery;
begin
  try
  ibQueryGenerica := TFDQuery.Create(nil);

  ibQueryGenerica.Connection := DataModuleWK.FDConnectionWK;
  ibQueryGenerica.SQL.Add('delete from cadpedidoproduto where idpedidoproduto = ' + IntToStr(FGetidpedidoproduto));
  ibQueryGenerica.ExecSQL;

  if ibQueryGenerica.IsEmpty then
    Result := True
  else
    Result := False;

  FreeAndNil(ibQueryGenerica);
  Except
    begin
      ShowMessage('TpedidoProduto.ApagarPedidoProduto erro gerado, com mensagem: Erro ao excluir produto do pedido.');
      if ibQueryGenerica <> nil then
        begin
          FreeAndNil(ibQueryGenerica);
        end;
      Result := False;
    end;

  end;

end;

function TpedidoProduto.ConsultarPedidoProduto: Boolean;
var
    ibQueryGenerica : TFDQuery;
begin
  try
  ibQueryGenerica := TFDQuery.Create(nil);

  ibQueryGenerica.Connection := DataModuleWK.FDConnectionWK;
  ibQueryGenerica.SQL.Add('SELECT idpedidoproduto FROM cadpedidoproduto where idpedidoproduto = ' + IntToStr(FGetidpedidoproduto));
  ibQueryGenerica.Open;

  if ibQueryGenerica.IsEmpty then
    Result := True
  else
    Result := False;

  FreeAndNil(ibQueryGenerica);
  Except
    begin
      ShowMessage('TpedidoProduto.ConsultarPedidoProduto erro gerado, com mensagem: Erro ao consultar item do pedido.');
      if ibQueryGenerica <> nil then
        begin
          FreeAndNil(ibQueryGenerica);
        end;
      Result := False;
    end;
  end;
end;

constructor TpedidoProduto.Create;
begin

  FGetidpedido := 0;
  FGetidpedidoproduto := 0;
  FGetidproduto := 0;
  FGetquantidade := 0;
  FGetvalorunit := 0;
  FGetvalortotalproduto := 0;
end;

destructor TpedidoProduto.Destroy;
begin
  //destroi
  inherited;
end;

function TpedidoProduto.SalvarPedidoProduto: Boolean;
var
    ibQueryGenerica : TFDQuery;
begin
  try
  ibQueryGenerica := TFDQuery.Create(nil);
  ibQueryGenerica.Connection := DataModuleWK.FDConnectionWK;;

  if ConsultarPedidoProduto then
    begin

      ibQueryGenerica.SQL.Add('INSERT INTO cadpedidoproduto');
      ibQueryGenerica.SQL.Add('(');
      ibQueryGenerica.SQL.Add('idpedido,');
      ibQueryGenerica.SQL.Add('idproduto,');
      ibQueryGenerica.SQL.Add('quantidade,');
      ibQueryGenerica.SQL.Add('valorunit,');
      ibQueryGenerica.SQL.Add('valortotalproduto)');
      ibQueryGenerica.SQL.Add('VALUES (');
      ibQueryGenerica.SQL.Add(IntToStr(FGetidpedido) + ',');
      ibQueryGenerica.SQL.Add(IntToStr(FGetidproduto) + ',');
      ibQueryGenerica.SQL.Add(StringReplace(formatFloat('0.00',FGetquantidade), ',', '.', [rfReplaceAll])+ ',');
      ibQueryGenerica.SQL.Add(StringReplace(formatFloat('0.00',FGetvalorunit), ',', '.', [rfReplaceAll]) + ',');
      ibQueryGenerica.SQL.Add( StringReplace(formatFloat('0.00',FGetvalortotalproduto), ',', '.', [rfReplaceAll])+ ')');
    end
  else
    begin
      ibQueryGenerica.SQL.Add('UPDATE cadpedidoproduto SET');
      ibQueryGenerica.SQL.Add('idpedido = ' + IntToStr(FGetidpedido) + ',');
      ibQueryGenerica.SQL.Add('idproduto = ' + IntToStr(FGetidproduto) + ',');
      ibQueryGenerica.SQL.Add('quantidade = ' + StringReplace(formatFloat('0.00',FGetquantidade), ',', '.', [rfReplaceAll])  + ',');
      ibQueryGenerica.SQL.Add('valorunit = ' + StringReplace(formatFloat('0.00',FGetvalorunit), ',', '.', [rfReplaceAll]) + ',');
      ibQueryGenerica.SQL.Add('valortotalproduto = ' + StringReplace(formatFloat('0.00',FGetvalortotalproduto), ',', '.', [rfReplaceAll]));
      ibQueryGenerica.SQL.Add('WHERE idpedidoproduto = ' + IntToStr(FGetidpedidoproduto));
    end;

  ibQueryGenerica.ExecSQL;

  FreeAndNil(ibQueryGenerica);

  Result := True;
  Except
    begin
      ShowMessage('TpedidoProduto.SalvarPedidoProduto erro gerado, com mensagem: Erro ao salvar item do pedido.');
      if ibQueryGenerica <> nil then
        begin
          FreeAndNil(ibQueryGenerica);
        end;
      Result := False;
    end;

  end;

end;

procedure TpedidoProduto.Setidpedidoproduto(const Value: Integer);
begin
  FGetidpedidoproduto := Value;
end;

procedure TpedidoProduto.Setidpedido(const Value: Integer);
begin
  FGetidpedido := Value;
end;

procedure TpedidoProduto.Setidproduto(const Value: Integer);
begin
  FGetidproduto := Value;
end;

procedure TpedidoProduto.Setquantidade(const Value: Double);
begin
  FGetquantidade := Value;
end;

procedure TpedidoProduto.Setvalortotalproduto(const Value: Double);
begin
  FGetvalortotalproduto := Value;
end;

procedure TpedidoProduto.Setvalorunit(const Value: Double);
begin
  FGetvalorunit := Value;
end;

end.
