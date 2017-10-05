unit U_Cidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_Modelo, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TF_Cidade = class(TF_Modelo)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edt_IDCidade: TEdit;
    Edt_NomeCidade: TEdit;
    Edt_CEP: TEdit;
    Label4: TLabel;
    CB_IDEstado: TComboBox;
    Edt_Consulta: TEdit;
    DBG_Consulta: TDBGrid;
    DS: TDataSource;
    Q_Cidade: TFDQuery;
    Q_CidadeID_CIDADE: TIntegerField;
    Q_CidadeNOME_CIDADE: TStringField;
    Q_CidadeCEP_CIDADE: TStringField;
    Q_CidadeID_ESTADO: TIntegerField;
    Q_Estado: TFDQuery;
    Q_EstadoNOME_ESTADO: TStringField;
    Q_EstadoID_ESTADO: TIntegerField;
    procedure Edt_ConsultaChange(Sender: TObject);
    procedure Spb_SalvarClick(Sender: TObject);
    procedure Spb_EditarClick(Sender: TObject);
    procedure DBG_ConsultaDblClick(Sender: TObject);
    procedure Spb_CancelarClick(Sender: TObject);
    procedure Spb_ExcluirClick(Sender: TObject);
    procedure Spb_inserirClick(Sender: TObject);
  private
    procedure LiberaCampos;
    procedure LimpaCampos;
    procedure DesativaCampos;
    { Private declarations }
  public
    { Public declarations }
    Crud: string;
  end;

var
  F_Cidade: TF_Cidade;

implementation

{$R *.dfm}

uses U_DM;

procedure TF_Cidade.Spb_CancelarClick(Sender: TObject);
begin
  inherited;
  DesativaCampos;
  LimpaCampos;
end;

procedure TF_Cidade.Spb_EditarClick(Sender: TObject);
begin
  inherited;
  Crud := 'Alterar';
  Edt_NomeCidade.Enabled := True;
  Edt_CEP.Enabled := True;
  CB_IDEstado.Enabled := True;
end;

procedure TF_Cidade.Spb_ExcluirClick(Sender: TObject);
var
  SQL: string;
begin
  inherited;
  SQL := 'delete from Cidade where id_Cidade =' + Edt_IDCidade.Text;
  DM.FDConnection1.ExecSQL(SQL);
  DM.FDConnection1.CommitRetaining;
end;

procedure TF_Cidade.Spb_inserirClick(Sender: TObject);

var
  X, Y: integer;
begin
  inherited;
  Crud := 'Inserir';
  LiberaCampos;
  PC_Principal.TabIndex := 0;
  Edt_IDCidade.SetFocus;

  X := 0;
  DM.FDQ_Estado.Close;
  DM.FDQ_Estado.Open();
  Y := DM.FDQ_EstadoMAX.AsInteger;
  Q_Estado.Close;
  Q_Estado.Open();
  Q_Estado.First;
  CB_IDEstado.Text := IntToStr((Q_EstadoID_ESTADO.AsInteger)) + '   ' +
    (Q_EstadoNOME_ESTADO.AsString);
  while X < Y do
  begin
    CB_IDEstado.Items.Add(IntToStr((Q_EstadoID_ESTADO.AsInteger)) + '   ' +
      Q_EstadoNOME_ESTADO.AsString);
    Q_Estado.Next;
    X := X + 1;
  end;
end;

procedure TF_Cidade.Spb_SalvarClick(Sender: TObject);
var
  SQL: string;
  Copia: string;
  Convert: real;
begin
  inherited;

  if Crud = 'Inserir' then
  begin
    Copia := Copy(CB_IDEstado.Text, 1, 3);
    Convert := StrToFloat(Copia);
    SQL := 'insert into Cidade values(' + Edt_IDCidade.Text + ',' + //
      QuotedStr(Edt_NomeCidade.Text) + ',' + QuotedStr(Edt_CEP.Text) + ',' +
      FloatToStr(Convert) + ');';
  end
  else
  begin
    SQL := 'update Cidade set Nome_Cidade =' + QuotedStr(Edt_NomeCidade.Text) +
    //
      ', Cep_Cidade =' + QuotedStr(Edt_CEP.Text) + //
      ', ID_Estado =' + CB_IDEstado.Text + //
      'where ID_Cidade =' + Edt_IDCidade.Text;
  end;
  DM.FDConnection1.ExecSQL(SQL);
  DM.FDConnection1.CommitRetaining;
  LimpaCampos;
  DesativaCampos;
end;

procedure TF_Cidade.DBG_ConsultaDblClick(Sender: TObject);
begin
  inherited;
  Edt_IDCidade.Text := Q_CidadeID_CIDADE.AsString;
  Edt_NomeCidade.Text := Q_CidadeNOME_CIDADE.AsString;
  Edt_CEP.Text := Q_CidadeCEP_CIDADE.AsString;
  CB_IDEstado.Text := Q_CidadeID_ESTADO.AsString;
  PC_Principal.TabIndex := 0;
  Spb_Editar.Enabled := True;
end;

procedure TF_Cidade.Edt_ConsultaChange(Sender: TObject);
begin
  inherited;
  Q_Cidade.Close;
  Q_Cidade.ParamByName('NomeCidade').AsString := Edt_Consulta.Text + '%';
  Q_Cidade.Open();
end;

procedure TF_Cidade.LiberaCampos;
begin
  Edt_IDCidade.Enabled := True;
  Edt_NomeCidade.Enabled := True;
  Edt_CEP.Enabled := True;
  CB_IDEstado.Enabled := True;
end;

procedure TF_Cidade.LimpaCampos;
begin
  Edt_IDCidade.Text := EmptyStr;
  Edt_NomeCidade.Text := EmptyStr;
  Edt_CEP.Text := EmptyStr;
  CB_IDEstado.Clear;
end;

procedure TF_Cidade.DesativaCampos;
begin
  Edt_IDCidade.Enabled := False;
  Edt_NomeCidade.Enabled := False;
  Edt_CEP.Enabled := False;
  CB_IDEstado.Enabled := False;
end;

end.
