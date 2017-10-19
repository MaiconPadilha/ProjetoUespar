unit U_Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Imaging.jpeg;

type
  TF_Principal = class(TForm)
    MENU: TMainMenu;
    Cadastros1: TMenuItem;
    Estado1: TMenuItem;
    Cidades1: TMenuItem;
    Clientes1: TMenuItem;
    Venda1: TMenuItem;
    Produto1: TMenuItem;
    EntradadeProduto1: TMenuItem;
    Relatorios1: TMenuItem;
    Produtos1: TMenuItem;
    Clientes2: TMenuItem;
    Vendas1: TMenuItem;
    Estoque1: TMenuItem;
    Image1: TImage;
    StatusBar1: TStatusBar;
    procedure Estado1Click(Sender: TObject);
    procedure Cidades1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Principal: TF_Principal;

implementation

{$R *.dfm}

uses U_Cidade, U_Estado, U_modelo,U_Cliente;

procedure TF_Principal.Cidades1Click(Sender: TObject);
begin
F_Cidade.ShowModal;
end;

procedure TF_Principal.Clientes1Click(Sender: TObject);
begin
F_Cliente.ShowModal;
end;

procedure TF_Principal.Estado1Click(Sender: TObject);
begin
  F_Estado.ShowModal;
end;

end.
