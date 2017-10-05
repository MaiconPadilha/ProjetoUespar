unit U_Estado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_modelo, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TF_Estado = class(TF_Modelo)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edt_IDestado: TEdit;
    Edt_NomeEstado: TEdit;
    Edt_Sigla: TEdit;
    EDT_Pesquisar: TEdit;
    DBGrid1: TDBGrid;
    Label4: TLabel;
    DataSource1: TDataSource;
    Q_Estado: TFDQuery;
    Q_EstadoID_ESTADO: TIntegerField;
    Q_EstadoNOME_ESTADO: TStringField;
    Q_EstadoSIGLA_ESTADO: TStringField;
    procedure Spb_inserirClick(Sender: TObject);
    procedure Spb_SalvarClick(Sender: TObject);
    procedure Spb_CancelarClick(Sender: TObject);
    procedure Spb_EditarClick(Sender: TObject);
    procedure Spb_ExcluirClick(Sender: TObject);
    procedure EDT_PesquisarChange(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    procedure LimpaCampos;
    procedure HabilitaCampos;
    { Private declarations }
  public
    Crud: string
    { Public declarations }
    end;

  var
    F_Estado: TF_Estado;

implementation

{$R *.dfm}

uses U_DM;

procedure TF_Estado.Spb_CancelarClick(Sender: TObject);
begin
  inherited;
  LimpaCampos;
end;

procedure TF_Estado.Spb_EditarClick(Sender: TObject);
var
  SQL: string;
begin
  inherited;
  HabilitaCampos;
  Crud := 'Alterar';
  Edt_NomeEstado.SetFocus;

end;

procedure TF_Estado.Spb_ExcluirClick(Sender: TObject);
var
  SQL: string;
begin
  inherited;
  SQL := 'delete from estado where id_Estado =' + Edt_IDestado.Text;
  DM.FDConnection1.ExecSQL(SQL);
  DM.FDConnection1.CommitRetaining;

end;

procedure TF_Estado.LimpaCampos;
begin
  Edt_IDestado.Text := EmptyStr;
  Edt_NomeEstado.Text := EmptyStr;
  Edt_Sigla.Text := EmptyStr;
  Crud := EmptyStr;
  Edt_IDestado.Enabled := False;
  Edt_NomeEstado.Enabled := False;
  Edt_Sigla.Enabled := False;
end;

procedure TF_Estado.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  Edt_IDestado.Text := Q_EstadoID_ESTADO.AsString;
  Edt_NomeEstado.Text := Q_EstadoNOME_ESTADO.AsString;
  Edt_Sigla.Text := Q_EstadoSIGLA_ESTADO.AsString;
  PC_Principal.TabIndex := 0;

end;

procedure TF_Estado.EDT_PesquisarChange(Sender: TObject);
begin
  inherited;
  Q_Estado.Close;
  Q_Estado.ParamByName('NomeEstado').AsString := EDT_Pesquisar.Text + '%';
  Q_Estado.Open();
end;

procedure TF_Estado.HabilitaCampos;
begin
  Edt_IDestado.Enabled := True;
  Edt_NomeEstado.Enabled := True;
  Edt_Sigla.Enabled := True;
end;

procedure TF_Estado.Spb_inserirClick(Sender: TObject);
var
  max: integer;
begin
  inherited;
  DM.FDQ_Estado.Close;
  DM.FDQ_Estado.Open();
  max := DM.FDQ_Estadomax.AsInteger + 1;
  Edt_IDestado.Text := IntToStr(max);

  PC_Principal.TabIndex := 0;
  HabilitaCampos;
  Edt_IDestado.SetFocus;
  Crud := 'Inserir';
end;

procedure TF_Estado.Spb_SalvarClick(Sender: TObject);
var
  SQL: string;
  max: integer;
begin
  inherited;

  if Crud = 'Inserir' then
  begin
    DM.FDQ_Estado.Close;
    DM.FDQ_Estado.Open();
    max := DM.FDQ_Estadomax.AsInteger + 1;
    SQL := 'insert into Estado values(' + //
      Edt_IDestado.Text + ',' + //
      QuotedStr(Edt_NomeEstado.Text) + ',' + //
      QuotedStr(Edt_Sigla.Text) + ');';
  end
  else
  begin
    SQL := 'update Estado set Nome_Estado =' + QuotedStr(Edt_NomeEstado.Text) +
    //
      ', Sigla_Estado =' + QuotedStr(Edt_Sigla.Text) + //
      ' where id_Estado =' + Edt_IDestado.Text;
  end;
  DM.FDConnection1.ExecSQL(SQL);
  DM.FDConnection1.CommitRetaining;
  LimpaCampos;
end;

end.
