program ProjetoUespar;

uses
  Vcl.Forms,
  U_modelo in 'U_modelo.pas' {F_Modelo},
  U_Estado in 'U_Estado.pas' {F_Estado},
  U_Cidade in 'U_Cidade.pas' {F_Cidade},
  U_Clientes in 'U_Clientes.pas' {F_Clientes},
  U_Principal in 'U_Principal.pas' {F_Principal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TF_Principal, F_Principal);
  Application.CreateForm(TF_Modelo, F_Modelo);
  Application.CreateForm(TF_Estado, F_Estado);
  Application.CreateForm(TF_Cidade, F_Cidade);
  Application.CreateForm(TF_Clientes, F_Clientes);
  Application.Run;
end.
