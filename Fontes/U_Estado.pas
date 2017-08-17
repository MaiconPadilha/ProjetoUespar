unit U_Estado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_modelo, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.ExtCtrls;

type
  TF_Estado = class(TF_Modelo)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Estado: TF_Estado;

implementation

{$R *.dfm}

end.
