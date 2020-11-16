unit untCProduto;

interface

uses System.SysUtils, untDataModule, Dialogs, FireDAC.Comp.Client, Data.DB;

 type TProduto = class

    private

    FGetidproduto: Integer;
    FGetdescricao: string;
    FGetprecovenda: Double;


    procedure Setidproduto(const Value: Integer);
    procedure Setdescricao(const Value: string);
    procedure Setprecovenda(const Value: Double);


    protected


    Public

    property Getidproduto : Integer read FGetidproduto write Setidproduto;
    property Getdescricao : string read FGetdescricao write Setdescricao;
    property Getprecovenda   : Double read FGetprecovenda write Setprecovenda;

    function ConsultarProduto : Boolean;

    Constructor Create;    // declaração do metodo construtor

    Destructor  Destroy; Override;

    end;

implementation


{ TpedidoProduto }

{ TProduto }

function TProduto.ConsultarProduto: Boolean;
var
    ibQueryGenerica : TFDQuery;
begin
  try
  ibQueryGenerica := TFDQuery.Create(nil);

  ibQueryGenerica.Connection := DataModuleWK.FDConnectionWK;
  ibQueryGenerica.SQL.Add('SELECT idproduto, descricao, precovenda FROM cadproduto where idproduto = ' + IntToStr(FGetidproduto));
  ibQueryGenerica.Open;

  if not ibQueryGenerica.IsEmpty then
    begin
      FGetidproduto := ibQueryGenerica.fieldbyname('idproduto').AsInteger;
      FGetdescricao := ibQueryGenerica.fieldbyname('descricao').AsString;
      FGetprecovenda := ibQueryGenerica.fieldbyname('precovenda').AsFloat;

      Result := True;
    end
  else
    begin
      FGetidproduto := 0;
      FGetdescricao := '';
      FGetprecovenda := 0;

      Result := False;
    end;

  FreeAndNil(ibQueryGenerica);
  Except
    begin
      ShowMessage('TProduto.ConsultarProduto erro gerado, com mensagem: Erro ao consultar produto.');
      if ibQueryGenerica <> nil then
        begin
          FreeAndNil(ibQueryGenerica);
        end;
      Result := False;
    end;
  end;
end;

constructor TProduto.Create;
begin
  FGetidproduto := 0;
  FGetdescricao := '';
  FGetprecovenda := 0;
end;

destructor TProduto.Destroy;
begin

  inherited;
end;

procedure TProduto.Setdescricao(const Value: string);
begin
  FGetdescricao := Value;
end;

procedure TProduto.Setidproduto(const Value: Integer);
begin
  FGetidproduto := Value;
end;

procedure TProduto.Setprecovenda(const Value: Double);
begin
  FGetprecovenda := Value;
end;

end.
