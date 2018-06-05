object frmInformacaoEntrega: TfrmInformacaoEntrega
  Left = 0
  Top = 0
  ActiveControl = grdClienteEntrega
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Informa'#231#245'es para entrega'
  ClientHeight = 353
  ClientWidth = 1075
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object lblMensagem: TLabel
    Left = 0
    Top = 334
    Width = 1075
    Height = 19
    Align = alBottom
    Alignment = taCenter
    Caption = 
      '<ENTER> Confirma / <ESC> Retorna - utilize as setas para mudar d' +
      'e registro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ExplicitTop = 330
    ExplicitWidth = 556
  end
  object grpInfoEntrega: TGroupBox
    Left = 0
    Top = 0
    Width = 1075
    Height = 334
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = 8
    ExplicitWidth = 649
    ExplicitHeight = 310
    object grdClienteEntrega: TDBGrid
      Left = 2
      Top = 15
      Width = 1071
      Height = 317
      Align = alClient
      DataSource = dmMSource.dtsCliente_Entrega
      DrawingStyle = gdsClassic
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'NOME_CLIENTE'
          Title.Alignment = taCenter
          Title.Caption = 'NOME'
          Width = 236
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ENDERECO'
          Title.Alignment = taCenter
          Title.Caption = 'ENDERE'#199'O'
          Width = 277
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NUMERO'
          Title.Alignment = taCenter
          Width = 61
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BAIRRO'
          Title.Alignment = taCenter
          Width = 175
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CIDADE'
          Title.Alignment = taCenter
          Width = 168
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TELEFONE'
          Title.Alignment = taCenter
          Visible = True
        end>
    end
  end
end
