unit untPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmPrincipal = class(TForm)
    Panel1: TPanel;
    Pedido: TButton;
    procedure PedidoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses untPedidoVenda;

{$R *.dfm}

procedure TfrmPrincipal.PedidoClick(Sender: TObject);
begin
if frmPedidoVenda = nil then
  begin

    Application.CreateForm(TfrmPedidoVenda,frmPedidoVenda);
    frmPedidoVenda.ShowModal;
    FreeAndNil(frmPedidoVenda);
  end;
end;

end.
