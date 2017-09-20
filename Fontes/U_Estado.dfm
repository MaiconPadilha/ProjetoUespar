inherited F_Estado: TF_Estado
  Caption = 
    '                                                                ' +
    '                          Cadastro de Estado'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited Spb_Salvar: TSpeedButton
      Top = 13
      ExplicitTop = 13
    end
    inherited Spb_Editar: TSpeedButton
      Top = 13
      ExplicitTop = 13
    end
  end
  inherited PageControl1: TPageControl
    ActivePage = TabSheet2
    inherited TabSheet1: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 684
      ExplicitHeight = 350
      object Label1: TLabel
        Left = 41
        Top = 48
        Width = 47
        Height = 13
        Caption = 'ID Estado'
      end
      object Label2: TLabel
        Left = 61
        Top = 80
        Width = 27
        Height = 13
        Caption = 'Nome'
      end
      object Label3: TLabel
        Left = 66
        Top = 107
        Width = 22
        Height = 13
        Caption = 'Sigla'
      end
      object Edt_IDestado: TEdit
        Left = 94
        Top = 45
        Width = 121
        Height = 21
        Enabled = False
        TabOrder = 0
      end
      object Edt_NomeEstado: TEdit
        Left = 94
        Top = 77
        Width = 355
        Height = 21
        Enabled = False
        TabOrder = 1
      end
      object Edt_Sigla: TEdit
        Left = 94
        Top = 104
        Width = 121
        Height = 21
        Enabled = False
        TabOrder = 2
      end
    end
    inherited TabSheet2: TTabSheet
      ExplicitWidth = 684
      ExplicitHeight = 350
      inherited GroupBox1: TGroupBox
        object Label4: TLabel
          Left = 30
          Top = 21
          Width = 50
          Height = 13
          Caption = 'Pesquisar:'
        end
        object EDT_Pesquisar: TEdit
          Left = 30
          Top = 40
          Width = 459
          Height = 21
          TabOrder = 0
          OnChange = EDT_PesquisarChange
        end
      end
      inherited GroupBox2: TGroupBox
        object DBGrid1: TDBGrid
          Left = 3
          Top = 16
          Width = 606
          Height = 150
          DataSource = DataSource1
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDblClick = DBGrid1DblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_ESTADO'
              Title.Caption = 'ID'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_ESTADO'
              Title.Caption = 'ESTADO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SIGLA_ESTADO'
              Title.Caption = 'SIGLA'
              Visible = True
            end>
        end
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = Q_Estado
    Left = 612
    Top = 249
  end
  object Q_Estado: TFDQuery
    Connection = DM.FDConnection1
    SQL.Strings = (
      'select * from Estado where Nome_Estado like :NomeEstado ')
    Left = 557
    Top = 249
    ParamData = <
      item
        Name = 'NOMEESTADO'
        DataType = ftString
        ParamType = ptInput
        Size = 50
        Value = Null
      end>
    object Q_EstadoID_ESTADO: TIntegerField
      FieldName = 'ID_ESTADO'
      Origin = 'ID_ESTADO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Q_EstadoNOME_ESTADO: TStringField
      FieldName = 'NOME_ESTADO'
      Origin = 'NOME_ESTADO'
      Required = True
      Size = 50
    end
    object Q_EstadoSIGLA_ESTADO: TStringField
      FieldName = 'SIGLA_ESTADO'
      Origin = 'SIGLA_ESTADO'
      Required = True
      FixedChar = True
      Size = 2
    end
  end
end
