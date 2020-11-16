object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Principal'
  ClientHeight = 325
  ClientWidth = 657
  Color = 4105706
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 657
    Height = 73
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = -91
    ExplicitWidth = 748
    object Pedido: TButton
      Left = 0
      Top = 9
      Width = 105
      Height = 57
      Caption = 'Pedido'
      TabOrder = 0
      OnClick = PedidoClick
    end
  end
end
