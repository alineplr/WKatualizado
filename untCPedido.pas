unit untCPedido;

interface

uses System.SysUtils, FireDAC.Comp.Client, untDataModule, Dialogs, Data.DB;

 type Tpedido = class

    private

    FGetidpedido: Integer;
    FGetdataemissao: TDate;
    FGetidcliente: Integer;
    FGetvalortotal: Double;

    procedure Setidpedido(const Value: Integer);
    procedure Setdataemissao(const Value: TDate);
    procedure Setidcliente(const Value: Integer);
    procedure Setvalortotal(const Value: Double);

    protected


    Public

    property Getidpedido : Integer read FGetidpedido write Setidpedido;
    property Getdataemissao   : TDate read FGetdataemissao write Setdataemissao;
    property Getidcliente  :Integer read FGetidcliente write Setidcliente;
    property Getvalortotal  : Double read FGetvalortotal write Setvalortotal;
    function ConsultarPedido : Boolean;
    function CarregarrPedido : Boolean;
    function ApagarPedido : Boolean;


    Constructor Create;    // declaração do metodo construtor

    Destructor  Destroy; Override;

    function SalvarPedido : Boolean;
    end;

implementation

{ Tpedido }



constructor Tpedido.Create;
begin
  // metodo contrutor
  try
  FGetidpedido := 0;
  FGetdataemissao := Date;
  FGetidcliente := 0;
  FGetvalortotal := 0;
  Except
    on E : Exception do ShowMessage(E.ClassName + 'erro gerado, com mensagem: ' + E.Message);

  end;

end;

destructor Tpedido.Destroy;
begin
  // metodo destrutor
  inherited;
end;

procedure Tpedido.Setidpedido(const Value: Integer);
begin
  FGetidpedido := Value;
end;

procedure Tpedido.Setidcliente(const Value: Integer);
begin
  FGetidcliente := Value;
end;

procedure Tpedido.Setdataemissao(const Value: TDate);
begin
  FGetdataemissao := Value;
end;

procedure Tpedido.Setvalortotal(const Value: Double);
begin
  FGetvalortotal := Value;
end;

function Tpedido.SalvarPedido: Boolean;
  var
    ibQueryGenerica : TFDQuery;
begin

  try
  ibQueryGenerica := TFDQuery.Create(nil);
  ibQueryGenerica.Connection := DataModuleWK.FDConnectionWK;

  if ConsultarPedido then
    begin

      ibQueryGenerica.SQL.Add('INSERT INTO cadpedido');
      ibQueryGenerica.SQL.Add('(');
      ibQueryGenerica.SQL.Add('dataemissao,');
      ibQueryGenerica.SQL.Add('idcliente,');
      ibQueryGenerica.SQL.Add('valortotal)');
      ibQueryGenerica.SQL.Add('VALUES (');
      ibQueryGenerica.SQL.Add(QuotedStr(FormatDateTime('yyyy/mm/dd',FGetdataemissao)) + ',');
      if FGetidcliente = 0 then
        ibQueryGenerica.SQL.Add('null,')
      else
        ibQueryGenerica.SQL.Add(IntToStr(FGetidcliente) + ',');
      ibQueryGenerica.SQL.Add(StringReplace(formatFloat('0.00',FGetvalortotal), ',', '.', [rfReplaceAll]) + ')');
    end
  else
    begin
      ibQueryGenerica.SQL.Add('UPDATE cadpedido SET');
      ibQueryGenerica.SQL.Add('dataemissao = ' + QuotedStr(FormatDateTime('yyyy/mm/dd',FGetdataemissao)) + ',');
      if FGetidcliente = 0 then
        ibQueryGenerica.SQL.Add('idcliente = null,')
      else
        ibQueryGenerica.SQL.Add('idcliente = ' + IntToStr(FGetidcliente) + ',');

      ibQueryGenerica.SQL.Add('valortotal = ' +  StringReplace(formatFloat('0.00',FGetvalortotal), ',', '.', [rfReplaceAll]));
      ibQueryGenerica.SQL.Add('WHERE idpedido = ' + IntToStr(FGetidpedido));
    end;

  ibQueryGenerica.ExecSQL;

  FreeAndNil(ibQueryGenerica);

  Result := True;
  Except
    begin
      ShowMessage( 'Tpedido.SalvarPedido erro gerado, com mensagem: Erro ao Salvar pedido' );
      if ibQueryGenerica <> nil then
        begin
          FreeAndNil(ibQueryGenerica);
        end;
      Result := False;
    end;
  end;
end;

function Tpedido.ApagarPedido: Boolean;
var
    ibQueryGenerica : TFDQuery;
begin
  try
  ibQueryGenerica := TFDQuery.Create(nil);

  ibQueryGenerica.Connection := DataModuleWK.FDConnectionWK;
  ibQueryGenerica.SQL.Add('delete from cadpedido where idpedido = ' + IntToStr(FGetidpedido));
  ibQueryGenerica.ExecSQL;

  if ibQueryGenerica.IsEmpty then
    Result := True
  else
    Result := False;

  FreeAndNil(ibQueryGenerica);
  Except
    begin
    ShowMessage('Tpedido.ApagarPedido erro gerado, com mensagem: Erro ao excluir pedido.');
    if ibQueryGenerica <> nil then
      begin
        FreeAndNil(ibQueryGenerica);
      end;
    Result := False;
    end;
  end;

end;

function Tpedido.CarregarrPedido: Boolean;
var
    ibQueryGenerica : TFDQuery;
begin
  try
  ibQueryGenerica := TFDQuery.Create(nil);

  ibQueryGenerica.Connection := DataModuleWK.FDConnectionWK;
  ibQueryGenerica.SQL.Add('SELECT idpedido, dataemissao, idcliente, valortotal from cadpedido where idpedido = ' + IntToStr(FGetidpedido));
  ibQueryGenerica.Open;

  if not ibQueryGenerica.IsEmpty then
    begin
      Getidpedido := ibQueryGenerica.FieldByName('idpedido').AsInteger;
      FGetdataemissao := ibQueryGenerica.FieldByName('dataemissao').AsDateTime;
      FGetidcliente := ibQueryGenerica.FieldByName('idcliente').AsInteger;
      FGetvalortotal := ibQueryGenerica.FieldByName('valortotal').AsFloat;

      Result := True;
    end
  else
    begin
      Getidpedido :=0;
      FGetdataemissao := 0;
      FGetidcliente := 0;
      FGetvalortotal := 0;

      Result := False;
    end;
  Except
    begin
      ShowMessage('Tpedido.CarregarrPedido erro gerado, com mensagem: Erro ao Carregar Pedido');
      if ibQueryGenerica <> nil then
        begin
          FreeAndNil(ibQueryGenerica);
        end;
      Result := False;
    end;
  end;


end;

function Tpedido.ConsultarPedido: Boolean;
var
    ibQueryGenerica : TFDQuery;
begin
  try
  ibQueryGenerica := TFDQuery.Create(nil);

  ibQueryGenerica.Connection := DataModuleWK.FDConnectionWK;
  ibQueryGenerica.SQL.Add('SELECT idpedido from cadpedido where idpedido = ' + IntToStr(FGetidpedido));
  ibQueryGenerica.Open;

  if ibQueryGenerica.IsEmpty then
    Result := True
  else
    Result := False;
  Except
    begin
      ShowMessage('Tpedido.ConsultarPedido erro gerado, com mensagem: Erro ao consultar pedido' );
      if ibQueryGenerica <> nil then
        begin
          FreeAndNil(ibQueryGenerica);
        end;
      Result := False;
    end;

  end;

end;

end.
