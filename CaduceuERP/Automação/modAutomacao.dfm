object frmAutomacao: TfrmAutomacao
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsSingle
  ClientHeight = 451
  ClientWidth = 579
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ctgAutomacao: TCategoryPanelGroup
    Left = 0
    Top = 0
    Width = 112
    Height = 451
    VertScrollBar.Tracking = True
    HeaderFont.Charset = DEFAULT_CHARSET
    HeaderFont.Color = clWindowText
    HeaderFont.Height = -11
    HeaderFont.Name = 'Tahoma'
    HeaderFont.Style = []
    TabOrder = 0
    object ctpSintegra: TCategoryPanel
      Top = 137
      Caption = 'SINTEGRA'
      TabOrder = 0
      object btgSintegra: TButtonGroup
        Left = 0
        Top = 0
        Width = 108
        Height = 174
        Cursor = crHandPoint
        Align = alClient
        ButtonOptions = [gboFullSize, gboShowCaptions]
        Items = <
          item
            Caption = 'Importar Sintegra'
            OnClick = btgSintegraItems0Click
          end>
        TabOrder = 0
      end
    end
    object ctpImportacao: TCategoryPanel
      Top = 83
      Height = 54
      Cursor = crHandPoint
      Caption = 'Importa'#231#227'o'
      TabOrder = 1
      object btgImporacao: TButtonGroup
        Left = 0
        Top = 0
        Width = 108
        Height = 28
        Cursor = crHandPoint
        Align = alClient
        ButtonOptions = [gboFullSize, gboShowCaptions]
        Items = <
          item
            Caption = 'PDV'
            OnClick = btgImporacaoItems0Click
          end>
        TabOrder = 0
      end
    end
    object ctpExportacao: TCategoryPanel
      Top = 0
      Height = 83
      Cursor = crHandPoint
      Caption = 'Exporta'#231#227'o'
      TabOrder = 2
      object btnExportacao: TButtonGroup
        Left = 0
        Top = 0
        Width = 108
        Height = 57
        Cursor = crHandPoint
        Align = alClient
        ButtonOptions = [gboFullSize, gboShowCaptions]
        Items = <
          item
            Caption = 'PDV'
            OnClick = btnExportacaoItems0Click
          end
          item
            Caption = 'Balan'#231'a'
            OnClick = btnExportacaoItems1Click
          end>
        TabOrder = 0
      end
    end
  end
  object pgcAutomacao: TPageControl
    Left = 112
    Top = 0
    Width = 467
    Height = 402
    ActivePage = tbsImportacao
    TabOrder = 1
    object tbsPdv: TTabSheet
      Caption = 'Pdv'
      object rdgTipoExpPdv: TRadioGroup
        Left = 0
        Top = 54
        Width = 202
        Height = 68
        Caption = 'Tipo exporta'#231#227'o'
        Items.Strings = (
          'Geral'
          'Alterados')
        TabOrder = 0
      end
      object grpTabelaExportacao: TGroupBox
        Left = 206
        Top = 54
        Width = 251
        Height = 68
        Caption = 'Tabelas as serem exportadas'
        TabOrder = 1
        object chkArquivosExportacao: TCheckListBox
          Left = 2
          Top = 15
          Width = 247
          Height = 51
          Align = alClient
          BorderStyle = bsNone
          ItemHeight = 13
          TabOrder = 0
        end
      end
      object grpPastaDestinoPDV: TGroupBox
        Left = 0
        Top = 124
        Width = 282
        Height = 50
        Caption = 'Pasta de destino'
        Enabled = False
        TabOrder = 2
        object edtPastaDestinoPDV: TEdit
          Left = 3
          Top = 19
          Width = 276
          Height = 21
          TabOrder = 0
        end
      end
      object grpArquivoExportadoPDV: TGroupBox
        Left = 283
        Top = 124
        Width = 174
        Height = 50
        Caption = 'Arquivo exportado'
        Enabled = False
        TabOrder = 3
        object edtArquivoExportadoPDV: TEdit
          Left = 3
          Top = 19
          Width = 169
          Height = 21
          TabOrder = 0
        end
      end
      object grpProgressoGeralPDV: TGroupBox
        Left = 0
        Top = 217
        Width = 457
        Height = 41
        Caption = 'Progresso Geral'
        TabOrder = 4
        object pgbprogressoGeral: TProgressBar
          Left = 3
          Top = 16
          Width = 448
          Height = 17
          TabOrder = 0
        end
      end
      object grpProgresoArquivoPDV: TGroupBox
        Left = 0
        Top = 264
        Width = 457
        Height = 41
        Caption = 'Progresso'
        TabOrder = 5
        object pgbProgressoArquivo: TProgressBar
          Left = 3
          Top = 16
          Width = 448
          Height = 17
          TabOrder = 0
        end
      end
      object btnExportar: TButton
        Left = 3
        Top = 321
        Width = 75
        Height = 41
        Cursor = crHandPoint
        Action = acAutomacaoPDV
        Caption = 'Exportar'
        TabOrder = 6
      end
      object grpSoftwareFrentedeLoja: TGroupBox
        Left = 0
        Top = 1
        Width = 333
        Height = 48
        Caption = 'Software frente de loja'
        TabOrder = 7
        object pnlSoftwareFrentedeLoja: TPanel
          Left = 2
          Top = 15
          Width = 329
          Height = 31
          Align = alClient
          BevelOuter = bvNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
      end
      object grpConteudo: TGroupBox
        Left = 0
        Top = 166
        Width = 456
        Height = 48
        Caption = 'Conte'#250'do'
        TabOrder = 8
        object pnlConteudo: TPanel
          Left = 2
          Top = 15
          Width = 452
          Height = 31
          Align = alClient
          BevelOuter = bvNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
      object chkLimparCadastro: TCheckBox
        Left = 342
        Top = 20
        Width = 109
        Height = 17
        Caption = 'Limpar CADASTRO'
        TabOrder = 9
      end
    end
    object tbsBalanca: TTabSheet
      Caption = 'Balan'#231'a'
      ImageIndex = 1
      object grpSoftwareBalanca: TGroupBox
        Left = 1
        Top = 1
        Width = 456
        Height = 48
        Caption = 'Software gerenciador de balan'#231'a'
        TabOrder = 0
        object pnlSoftwareBalanca: TPanel
          Left = 2
          Top = 15
          Width = 452
          Height = 31
          Align = alClient
          BevelOuter = bvNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
      end
      object grpTabExpbalanca: TGroupBox
        Left = 206
        Top = 54
        Width = 251
        Height = 68
        Caption = 'Tabelas as serem exportadas'
        TabOrder = 1
        object chkArquivosExpBalanca: TCheckListBox
          Left = 2
          Top = 15
          Width = 247
          Height = 51
          Align = alClient
          BorderStyle = bsNone
          ItemHeight = 13
          TabOrder = 0
        end
      end
      object grpPastaExportacaoBalanca: TGroupBox
        Left = 0
        Top = 124
        Width = 282
        Height = 50
        Caption = 'Pasta de destino'
        Enabled = False
        TabOrder = 2
        object edtPastaExpBalanca: TEdit
          Left = 3
          Top = 19
          Width = 276
          Height = 21
          TabOrder = 0
        end
      end
      object grpArqExpBalanca: TGroupBox
        Left = 283
        Top = 124
        Width = 174
        Height = 50
        Caption = 'Arquivo exportado'
        Enabled = False
        TabOrder = 3
        object edtArqExpBalanca: TEdit
          Left = 2
          Top = 19
          Width = 169
          Height = 21
          TabOrder = 0
        end
      end
      object grpProgressoGeralBalanca: TGroupBox
        Left = 0
        Top = 176
        Width = 457
        Height = 41
        Caption = 'Progresso Geral'
        TabOrder = 4
        object pgbProgressoGeralBalanca: TProgressBar
          Left = 3
          Top = 16
          Width = 448
          Height = 17
          TabOrder = 0
        end
      end
      object grpProgressoArqBalanca: TGroupBox
        Left = 0
        Top = 217
        Width = 457
        Height = 41
        Caption = 'Progresso'
        TabOrder = 5
        object pgbProgressoArqBalanca: TProgressBar
          Left = 3
          Top = 16
          Width = 448
          Height = 17
          TabOrder = 0
        end
      end
      object btnExportaBalanca: TButton
        Left = 0
        Top = 271
        Width = 75
        Height = 41
        Cursor = crHandPoint
        Action = acAutomacaoBalanca
        Caption = 'Exportar'
        TabOrder = 6
      end
      object rdpTipoExpBalanca: TRadioGroup
        Left = 0
        Top = 54
        Width = 202
        Height = 68
        Caption = 'Tipo exporta'#231#227'o'
        ItemIndex = 0
        Items.Strings = (
          'Geral')
        TabOrder = 7
      end
    end
    object tbsImportacao: TTabSheet
      Caption = 'Importa'#231#227'o'
      ImageIndex = 2
      object lblMsgProgresso: TLabel
        Left = 81
        Top = 330
        Width = 296
        Height = 41
        Alignment = taCenter
        AutoSize = False
        Color = 8454143
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
        Visible = False
      end
      object btnOk: TButton
        Left = 0
        Top = 330
        Width = 75
        Height = 41
        Cursor = crHandPoint
        Action = acImportarMovimento
        Caption = 'Importar'
        TabOrder = 0
      end
      object grpSoftwareFrentedeLojaImp: TGroupBox
        Left = 0
        Top = 1
        Width = 457
        Height = 45
        Caption = 'Software frente de loja'
        TabOrder = 1
        object pnlImportaPDV: TPanel
          Left = 2
          Top = 15
          Width = 453
          Height = 28
          Align = alClient
          BevelOuter = bvNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
      end
      object grpDataMovimentoImportacao: TGroupBox
        Left = 2
        Top = 47
        Width = 455
        Height = 46
        Caption = 'Data do movimento'
        TabOrder = 2
        object dtpMovimentoImportacao: TDateTimePicker
          Left = 44
          Top = 19
          Width = 366
          Height = 21
          Date = 40036.483794305560000000
          Time = 40036.483794305560000000
          DateFormat = dfLong
          TabOrder = 0
          OnChange = dtpMovimentoImportacaoChange
        end
      end
      object grpProgressoImportacao: TGroupBox
        Left = 228
        Top = 283
        Width = 229
        Height = 41
        Caption = 'Progresso'
        TabOrder = 3
        object pgbProgressoImportacao: TProgressBar
          Left = 3
          Top = 16
          Width = 223
          Height = 17
          TabOrder = 0
        end
      end
      object grpProgressoGeralImp: TGroupBox
        Left = 0
        Top = 283
        Width = 226
        Height = 41
        Caption = 'Progresso Geral'
        TabOrder = 4
        object pgbProgressoGeralImp: TProgressBar
          Left = 3
          Top = 16
          Width = 219
          Height = 17
          TabOrder = 0
        end
      end
      object grpCaixas: TGroupBox
        Left = 2
        Top = 93
        Width = 455
        Height = 126
        Caption = 'Importar'
        TabOrder = 5
        object chkCaixas: TCheckListBox
          Left = 2
          Top = 15
          Width = 451
          Height = 109
          Align = alClient
          BorderStyle = bsNone
          Columns = 7
          ItemHeight = 13
          TabOrder = 0
        end
      end
      object btnEstornar: TButton
        Left = 383
        Top = 330
        Width = 75
        Height = 41
        Cursor = crHandPoint
        Action = acEstornarMovimento
        Caption = 'Estornar'
        TabOrder = 6
      end
      object grpImpNumCX: TGroupBox
        Left = 2
        Top = 225
        Width = 77
        Height = 46
        Caption = 'N'#186' Caixa'
        TabOrder = 7
        object lblNumCx: TLabel
          Left = 24
          Top = 21
          Width = 44
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
        end
      end
      object grpDataCupom: TGroupBox
        Left = 80
        Top = 225
        Width = 96
        Height = 46
        Caption = 'Data'
        TabOrder = 8
        object lblDataCupom: TLabel
          Left = 11
          Top = 21
          Width = 80
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
        end
      end
      object grpNumCupom: TGroupBox
        Left = 177
        Top = 225
        Width = 88
        Height = 46
        Caption = 'N'#186' Cupom'
        TabOrder = 9
        object lblNumeroCupom: TLabel
          Left = 11
          Top = 21
          Width = 67
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
        end
      end
      object grpCodigodeBarras: TGroupBox
        Left = 266
        Top = 225
        Width = 191
        Height = 46
        Caption = 'C'#243'digo de barras'
        TabOrder = 10
        object lblCodigoBarras: TLabel
          Left = 32
          Top = 21
          Width = 130
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
        end
      end
    end
    object tbsLogImportacao: TTabSheet
      Caption = 'Log'
      ImageIndex = 3
      object grpLogCheques: TGroupBox
        Left = 3
        Top = 3
        Width = 453
        Height = 150
        Caption = 'importa'#231#227'o de cheques'
        TabOrder = 0
        object memLogCheques: TMemo
          Left = 5
          Top = 25
          Width = 445
          Height = 122
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
      end
      object grpLogProdutos: TGroupBox
        Left = 2
        Top = 156
        Width = 453
        Height = 150
        Caption = 'importa'#231#227'o de produtos'
        TabOrder = 1
        object memLogProdutos: TMemo
          Left = 5
          Top = 25
          Width = 445
          Height = 122
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
    end
    object tbsSintegra: TTabSheet
      Caption = 'Sintegra'
      ImageIndex = 4
      object lblMSGImportacaoSintegra: TLabel
        Left = 117
        Top = 330
        Width = 338
        Height = 41
        Alignment = taCenter
        AutoSize = False
        Color = 8454143
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
        Visible = False
      end
      object grpSelecionaArquivoSintegra: TGroupBox
        Left = 11
        Top = 15
        Width = 433
        Height = 61
        Caption = 'Selecione um arquivo para importar'
        TabOrder = 0
        object edtArquivoSintegra: TJvFilenameEdit
          Left = 11
          Top = 24
          Width = 414
          Height = 21
          DefaultExt = '*.txt'
          Filter = 'Arquivos texto (*.txt)|*.txt'
          TabOrder = 0
          Text = ''
        end
      end
      object Button1: TButton
        Left = 11
        Top = 330
        Width = 103
        Height = 41
        Cursor = crHandPoint
        Action = acImportarSintegra
        TabOrder = 1
      end
      object GroupBox1: TGroupBox
        Left = 10
        Top = 219
        Width = 77
        Height = 46
        Caption = 'N'#186' Caixa'
        TabOrder = 2
        object lblNumCXSintegra: TLabel
          Left = 24
          Top = 21
          Width = 44
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
        end
      end
      object GroupBox2: TGroupBox
        Left = 88
        Top = 219
        Width = 96
        Height = 46
        Caption = 'Data'
        TabOrder = 3
        object lblDataCupomSintegra: TLabel
          Left = 11
          Top = 21
          Width = 80
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
        end
      end
      object GroupBox3: TGroupBox
        Left = 185
        Top = 219
        Width = 88
        Height = 46
        Caption = 'N'#186' Cupom'
        TabOrder = 4
        object lblNumeroCupomSintegra: TLabel
          Left = 11
          Top = 21
          Width = 67
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
        end
      end
      object GroupBox4: TGroupBox
        Left = 268
        Top = 219
        Width = 191
        Height = 46
        Caption = 'C'#243'digo de barras'
        TabOrder = 5
        object lblCodigoBarrasSintegra: TLabel
          Left = 32
          Top = 21
          Width = 130
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
        end
      end
      object GroupBox5: TGroupBox
        Left = 8
        Top = 277
        Width = 226
        Height = 41
        Caption = 'Progresso Geral'
        TabOrder = 6
        object pgbSintegraGeral: TProgressBar
          Left = 3
          Top = 16
          Width = 219
          Height = 17
          TabOrder = 0
        end
      end
      object GroupBox6: TGroupBox
        Left = 230
        Top = 277
        Width = 229
        Height = 41
        Caption = 'Progresso'
        TabOrder = 7
        object pgbSintegraItem: TProgressBar
          Left = 3
          Top = 16
          Width = 223
          Height = 17
          TabOrder = 0
        end
      end
    end
  end
  object btnSair: TButton
    Left = 503
    Top = 404
    Width = 75
    Height = 41
    Cursor = crHandPoint
    Caption = 'Sair'
    TabOrder = 2
    OnClick = btnSairClick
  end
  object grpMensagem: TGroupBox
    Left = 115
    Top = 404
    Width = 385
    Height = 42
    Caption = 'Mensagem'
    TabOrder = 3
    object lblMsg: TLabel
      Left = 61
      Top = 14
      Width = 310
      Height = 24
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object actAutomacao: TActionManager
    Left = 56
    Top = 280
    StyleName = 'Platform Default'
    object acAutomacaoPDV: TAction
      Caption = 'acAutomacaoPDV'
      OnExecute = acAutomacaoPDVExecute
    end
    object acAutomacaoBalanca: TAction
      OnExecute = acAutomacaoBalancaExecute
    end
    object acExportaLoja: TAction
      Caption = 'Exportar'
    end
    object acImportar: TAction
      Caption = 'Importar'
    end
    object acImportarMovimento: TAction
      Caption = 'acImportarMovimento'
      OnExecute = acImportarMovimentoExecute
    end
    object acEstornarMovimento: TAction
      Caption = 'acEstornarMovimento'
      OnExecute = acEstornarMovimentoExecute
    end
    object acImportarSintegra: TAction
      Caption = 'Importar Sintegra'
      OnExecute = acImportarSintegraExecute
    end
  end
end
