unit untDataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, Data.DB,
  FireDAC.Comp.Client, Dialogs;

type
  TDataModuleWK = class(TDataModule)
    FDConnectionWK: TFDConnection;
    FDPhysMySQLDriverLinkWK: TFDPhysMySQLDriverLink;
    FDGUIxWaitCursorWK: TFDGUIxWaitCursor;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModuleWK: TDataModuleWK;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDataModuleWK.DataModuleCreate(Sender: TObject);
begin
try
FDPhysMySQLDriverLinkWK.VendorLib := ExtractFilePath(ParamStr(0)) + 'libmysql.dll';
FDConnectionWK.Connected := True;
Except
    on E : Exception do ShowMessage(E.ClassName + 'erro gerado, com mensagem: ' + E.Message);

end;
end;

end.
