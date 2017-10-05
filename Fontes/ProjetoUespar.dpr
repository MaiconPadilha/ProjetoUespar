program ProjetoUespar;

uses
  Vcl.Forms,
  U_modelo in 'U_modelo.pas' {F_Modelo},
  U_Estado in 'U_Estado.pas' {F_Estado},
  U_Cidade in 'U_Cidade.pas' {F_Cidade},
  U_Principal in 'U_Principal.pas' {F_Principal},
  Vcl.Themes,
  Vcl.Styles,
  U_DM in 'U_DM.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Ruby Graphite');
  Application.CreateForm(TF_Principal, F_Principal);
  Application.CreateForm(TF_Modelo, F_Modelo);
  Application.CreateForm(TF_Estado, F_Estado);
  Application.CreateForm(TF_Cidade, F_Cidade);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
