unit U_modelo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TF_Modelo = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    Spb_inserir: TSpeedButton;
    Spb_Salvar: TSpeedButton;
    Spb_Cancelar: TSpeedButton;
    Spb_Editar: TSpeedButton;
    Spb_Excluir: TSpeedButton;
    TabControl1: TTabControl;
    procedure Spb_inserirClick(Sender: TObject);
    procedure Spb_SalvarClick(Sender: TObject);
    procedure Spb_CancelarClick(Sender: TObject);
    procedure Spb_EditarClick(Sender: TObject);
    procedure Spb_ExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Modelo: TF_Modelo;

implementation

{$R *.dfm}

procedure TF_Modelo.Spb_CancelarClick(Sender: TObject);
begin
Spb_inserir.Enabled:=True;
Spb_Salvar.Enabled:=False;
Spb_Cancelar.Enabled:=False;
StatusBar1.Panels[0].Text :='Registro cancelado';
end;

procedure TF_Modelo.Spb_EditarClick(Sender: TObject);
begin
StatusBar1.Panels[0].Text :='Editando Registro Atual';
end;

procedure TF_Modelo.Spb_ExcluirClick(Sender: TObject);
begin
StatusBar1.Panels[0].Text :='Excluido com Sucesso';
end;

procedure TF_Modelo.Spb_inserirClick(Sender: TObject);
begin
Spb_Excluir.Enabled:=False;
Spb_Editar.Enabled:=False;
Spb_Salvar.Enabled:= true;
Spb_Cancelar.Enabled:=true;
Spb_inserir.Enabled:=False;

StatusBar1.Panels[0].Text :=' Inserindo Registro';
end;

procedure TF_Modelo.Spb_SalvarClick(Sender: TObject);
begin
 Spb_Excluir.Enabled:=True;
 Spb_Editar.Enabled:=True;
  Spb_Salvar.Enabled:=False;
  Spb_Cancelar.Enabled:=False;
    Spb_inserir.Enabled:=True;
   StatusBar1.Panels[0].Text :='Salvar registro';
end;

end.
