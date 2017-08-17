unit U_Clientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_modelo, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.ExtCtrls;

type
  TF_Clientes = class(TF_Modelo)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Clientes: TF_Clientes;

implementation

{$R *.dfm}

end.
