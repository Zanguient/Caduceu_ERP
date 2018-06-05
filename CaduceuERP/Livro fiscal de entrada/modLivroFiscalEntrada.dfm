object frmModLivrosFiscais: TfrmModLivrosFiscais
  Left = 0
  Top = 0
  ActiveControl = edtDataInicial
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  ClientHeight = 618
  ClientWidth = 787
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object tbrFerramentas: TToolBar
    Left = 0
    Top = 9
    Width = 304
    Height = 63
    Cursor = crHandPoint
    Align = alNone
    ButtonHeight = 59
    ButtonWidth = 43
    Images = dmDBEXMaster.imgHot
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    object btnIncluir: TToolButton
      Left = 0
      Top = 0
      Action = actIncluir
    end
    object btnDesfazer: TToolButton
      Left = 43
      Top = 0
      Action = actCancelar
    end
    object btnSalvar: TToolButton
      Left = 86
      Top = 0
      Action = actSalvar
    end
    object btnExcluir: TToolButton
      Left = 129
      Top = 0
      Action = actExcluir
    end
    object btnEditar: TToolButton
      Left = 172
      Top = 0
      Action = actEditar
    end
    object btnConfirmarNF: TToolButton
      Left = 215
      Top = 0
      Action = actImprimir
    end
    object btnSair: TToolButton
      Left = 258
      Top = 0
      Action = actSair
    end
  end
  object grpPesquisa: TGroupBox
    Left = 607
    Top = 0
    Width = 172
    Height = 73
    Caption = 'Informe o n'#250'mero do documento'
    TabOrder = 1
    object edtPesquisa: TEdit
      Left = 14
      Top = 20
      Width = 155
      Height = 21
      Hint = 'digite aqui, o conte'#250'do para pesquisa'
      CharCase = ecUpperCase
      TabOrder = 0
      OnEnter = edtPesquisaEnter
      OnExit = edtPesquisaExit
      OnKeyDown = edtPesquisaKeyDown
      OnKeyPress = edtPesquisaKeyPress
    end
    object btnCSV: TButton
      Left = 48
      Top = 45
      Width = 75
      Height = 25
      Hint = 'Exportar para CSV (Excel)'
      Caption = 'CSV'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnCSVClick
    end
  end
  object pgcLivroFiscalEntrada: TPageControl
    Left = 0
    Top = 78
    Width = 785
    Height = 405
    ActivePage = tbsCadastro
    TabOrder = 2
    object tbsTabela: TTabSheet
      Caption = 'Tabela'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object grdConsulta: TDBGrid
        Left = 0
        Top = 0
        Width = 777
        Height = 377
        Cursor = crHandPoint
        Align = alClient
        DataSource = dmMSource.dtsLivroFiscalEntrada
        Options = [dgTitles, dgIndicator, dgColLines, dgTabs, dgConfirmDelete]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = grdConsultaDrawColumnCell
        OnDblClick = grdConsultaDblClick
        OnKeyPress = grdConsultaKeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'DATA_ENTRADA'
            Title.Alignment = taCenter
            Title.Caption = 'Entrada'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATA_DOCUMENTO'
            Title.Alignment = taCenter
            Title.Caption = 'Emiss'#227'o'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO_ESPECIE_DOCUMENTO'
            Title.Alignment = taCenter
            Title.Caption = 'Tipo Documento'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CFOP'
            Title.Alignment = taCenter
            Title.Caption = 'Cfop'
            Width = 46
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGO_VALORES_FISCAIS'
            Title.Alignment = taCenter
            Title.Caption = 'Cod'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'NUMERO_DOCUMENTO'
            Title.Alignment = taCenter
            Title.Caption = 'N'#250'mero Doc'
            Width = 77
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_CONTABIL'
            Title.Alignment = taCenter
            Title.Caption = 'Valor Cont'#225'bil'
            Width = 89
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BASE_CALCULO_VALOR_OPERACAO'
            Title.Alignment = taCenter
            Title.Caption = 'B.Calc/Vlr Oper'
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IMPOSTO_CREDITADO'
            Title.Alignment = taCenter
            Title.Caption = 'Cr'#233'dito'
            Width = 74
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ALIQUOTA'
            Title.Alignment = taCenter
            Title.Caption = 'Al'#237'quota'
            Width = 67
            Visible = True
          end>
      end
      object pnlMsgAguarde: TPanel
        Left = 276
        Top = 160
        Width = 185
        Height = 41
        Caption = 'Aguarde.....'
        TabOrder = 1
        Visible = False
      end
    end
    object tbsCadastro: TTabSheet
      Caption = 'Cadastro'
      ImageIndex = 1
      object grpEmpresa: TGroupBox
        Left = 3
        Top = 32
        Width = 452
        Height = 81
        Caption = #39
        Enabled = False
        TabOrder = 0
        object lblRSocial: TLabel
          Left = 16
          Top = 16
          Width = 45
          Height = 13
          Caption = 'Empresa:'
        end
        object lblInscrEstadual: TLabel
          Left = 16
          Top = 37
          Width = 76
          Height = 13
          Caption = 'Inscr. Estadual:'
        end
        object lblCnpj: TLabel
          Left = 261
          Top = 38
          Width = 29
          Height = 13
          Caption = 'CNPJ:'
        end
        object lblMesAnoReferencia: TLabel
          Left = 16
          Top = 59
          Width = 56
          Height = 13
          Caption = 'Refer'#234'ncia:'
        end
        object edtRSocial: TEdit
          Left = 93
          Top = 12
          Width = 354
          Height = 21
          Color = 9164792
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object edtInscrEstadual: TEdit
          Left = 93
          Top = 34
          Width = 154
          Height = 21
          Color = 9164792
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object edtCNPJ: TEdit
          Left = 293
          Top = 34
          Width = 154
          Height = 21
          Color = 9164792
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
        object edtMesAnoReferencia: TEdit
          Left = 93
          Top = 56
          Width = 154
          Height = 21
          Color = 9164792
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
        end
      end
      object grpCodigoValorFiscal: TGroupBox
        Left = 456
        Top = 32
        Width = 315
        Height = 81
        Caption = '(*) C'#243'digo de Valores Fiscais'
        TabOrder = 1
        object lblOperacaoCreditoImposto: TLabel
          Left = 3
          Top = 16
          Width = 185
          Height = 13
          Caption = '1 - Opera'#231#245'es com Cr'#233'dito de Imposto'
        end
        object lblOperacaoSemCreditoImposto: TLabel
          Left = 3
          Top = 38
          Width = 306
          Height = 13
          Caption = '2 - Opera'#231#245'es sem Cr'#233'dito de Imposto / Isentas n'#227'o Tributadas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblOperacaoSemCreditoOutras: TLabel
          Left = 3
          Top = 60
          Width = 228
          Height = 13
          Caption = '3 - Opera'#231#245'es sem Cr'#233'dito de Imposto / Outras'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
      end
      object grpDocumentosFiscais: TGroupBox
        Left = 3
        Top = 115
        Width = 452
        Height = 259
        Caption = 'Documentos Fiscais'
        Enabled = False
        TabOrder = 2
        object lblDataEntrada: TLabel
          Left = 16
          Top = 28
          Width = 68
          Height = 13
          Caption = 'Data entrada:'
        end
        object lblEspecieDocumento: TLabel
          Left = 16
          Top = 94
          Width = 40
          Height = 13
          Caption = 'Esp'#233'cie:'
        end
        object lblSerieSubSerie: TLabel
          Left = 16
          Top = 116
          Width = 74
          Height = 13
          Caption = 'S'#233'rie/SubSerie:'
        end
        object lblNumeroDocumento: TLabel
          Left = 16
          Top = 138
          Width = 65
          Height = 13
          Caption = 'N'#250'mero doc.:'
        end
        object lblEmissao: TLabel
          Left = 16
          Top = 160
          Width = 42
          Height = 13
          Caption = 'Emiss'#227'o:'
        end
        object lblUFOrigem: TLabel
          Left = 16
          Top = 182
          Width = 52
          Height = 13
          Caption = 'UF origem:'
        end
        object lblValorContabil: TLabel
          Left = 16
          Top = 204
          Width = 70
          Height = 13
          Caption = 'Valor Cont'#225'bil:'
        end
        object lblCfop: TLabel
          Left = 16
          Top = 226
          Width = 27
          Height = 13
          Caption = 'Cfop:'
        end
        object Label1: TLabel
          Left = 16
          Top = 72
          Width = 75
          Height = 13
          Caption = 'M'#234's refer'#234'ncia:'
        end
        object Label4: TLabel
          Left = 16
          Top = 50
          Width = 71
          Height = 13
          Caption = 'Cnpj emitente:'
        end
        object edtDataEntrada: TDBEdit
          Left = 93
          Top = 25
          Width = 97
          Height = 21
          DataField = 'DATA_ENTRADA'
          DataSource = dmMSource.dtsLivroFiscalEntrada
          MaxLength = 10
          TabOrder = 0
          OnEnter = edtPesquisaEnter
          OnExit = edtDataEntradaExit
          OnKeyDown = edtPesquisaKeyDown
          OnKeyPress = edtPesquisaKeyPress
        end
        object edtEspecieDocumento: TDBEdit
          Left = 93
          Top = 91
          Width = 49
          Height = 21
          CharCase = ecUpperCase
          DataField = 'TIPO_ESPECIE_DOCUMENTO'
          DataSource = dmMSource.dtsLivroFiscalEntrada
          TabOrder = 3
          OnEnter = edtPesquisaEnter
          OnExit = edtDataEntradaExit
          OnKeyDown = edtPesquisaKeyDown
          OnKeyPress = edtPesquisaKeyPress
        end
        object edtSerieSubSerie: TDBEdit
          Left = 93
          Top = 113
          Width = 97
          Height = 21
          CharCase = ecUpperCase
          DataField = 'SERIE_SUBSERIE'
          DataSource = dmMSource.dtsLivroFiscalEntrada
          TabOrder = 5
          OnEnter = edtPesquisaEnter
          OnExit = edtDataEntradaExit
          OnKeyDown = edtPesquisaKeyDown
          OnKeyPress = edtPesquisaKeyPress
        end
        object edtNumeroDocumento: TDBEdit
          Left = 93
          Top = 135
          Width = 97
          Height = 21
          DataField = 'NUMERO_DOCUMENTO'
          DataSource = dmMSource.dtsLivroFiscalEntrada
          TabOrder = 6
          OnEnter = edtPesquisaEnter
          OnExit = edtDataEntradaExit
          OnKeyDown = edtPesquisaKeyDown
          OnKeyPress = edtPesquisaKeyPress
        end
        object edtDataDocumento: TDBEdit
          Left = 93
          Top = 157
          Width = 97
          Height = 21
          DataField = 'DATA_DOCUMENTO'
          DataSource = dmMSource.dtsLivroFiscalEntrada
          MaxLength = 10
          TabOrder = 7
          OnEnter = edtPesquisaEnter
          OnExit = edtDataEntradaExit
          OnKeyDown = edtPesquisaKeyDown
          OnKeyPress = edtPesquisaKeyPress
        end
        object edtUFOrigem: TDBEdit
          Left = 93
          Top = 179
          Width = 30
          Height = 21
          CharCase = ecUpperCase
          DataField = 'UF_ORIGEM'
          DataSource = dmMSource.dtsLivroFiscalEntrada
          TabOrder = 8
          OnEnter = edtPesquisaEnter
          OnExit = edtUFOrigemExit
          OnKeyDown = edtPesquisaKeyDown
          OnKeyPress = edtPesquisaKeyPress
        end
        object edtValorContabil: TDBEdit
          Left = 93
          Top = 201
          Width = 97
          Height = 21
          DataField = 'VALOR_CONTABIL'
          DataSource = dmMSource.dtsLivroFiscalEntrada
          TabOrder = 9
          OnEnter = edtPesquisaEnter
          OnExit = edtValorContabilExit
          OnKeyDown = edtPesquisaKeyDown
          OnKeyPress = edtValorContabilKeyPress
        end
        object edtCfop: TDBEdit
          Left = 93
          Top = 223
          Width = 47
          Height = 21
          DataField = 'CFOP'
          DataSource = dmMSource.dtsLivroFiscalEntrada
          TabOrder = 10
          OnEnter = edtPesquisaEnter
          OnExit = edtCfopExit
          OnKeyDown = edtPesquisaKeyDown
          OnKeyPress = edtCfopKeyPress
        end
        object edtMesAno: TDBEdit
          Left = 93
          Top = 69
          Width = 97
          Height = 21
          DataField = 'MES_ANO'
          DataSource = dmMSource.dtsLivroFiscalEntrada
          TabOrder = 2
          OnEnter = edtPesquisaEnter
          OnExit = edtPesquisaEnter
          OnKeyDown = edtPesquisaKeyDown
          OnKeyPress = edtMesAnoKeyPress
        end
        object edtCnpjEmitente: TDBEdit
          Left = 93
          Top = 47
          Width = 97
          Height = 21
          DataField = 'CNPJ_EMITENTE'
          DataSource = dmMSource.dtsLivroFiscalEntrada
          MaxLength = 18
          TabOrder = 1
          OnEnter = edtDataFinalEnter
          OnExit = edtCnpjEmitenteExit
          OnKeyDown = edtPesquisaKeyDown
          OnKeyPress = edtMesAnoKeyPress
        end
        object chkFrete: TCheckBox
          Left = 148
          Top = 93
          Width = 42
          Height = 17
          Caption = 'Frete'
          TabOrder = 4
          OnClick = chkFreteClick
          OnKeyDown = edtPesquisaKeyDown
          OnKeyPress = edtCfopKeyPress
        end
      end
      object grpValoresFiscais: TGroupBox
        Left = 456
        Top = 114
        Width = 315
        Height = 234
        Caption = 'Valores fiscais'
        Enabled = False
        TabOrder = 3
        object lblCodigoFiscal: TLabel
          Left = 5
          Top = 74
          Width = 54
          Height = 13
          Caption = 'C'#243'digo (*):'
        end
        object lblBaseCalculo: TLabel
          Left = 5
          Top = 96
          Width = 62
          Height = 13
          Caption = 'Base c'#225'lculo:'
        end
        object lblAliquota: TLabel
          Left = 5
          Top = 118
          Width = 43
          Height = 13
          Caption = 'Al'#237'quota:'
        end
        object lblImpostoCreditado: TLabel
          Left = 5
          Top = 140
          Width = 91
          Height = 13
          Caption = 'Imposto creditado:'
        end
        object lblObservacao: TLabel
          Left = 5
          Top = 165
          Width = 63
          Height = 13
          Caption = 'Observa'#231#245'es'
        end
        object grpIdentICMS_IPI: TDBRadioGroup
          Left = 5
          Top = 19
          Width = 307
          Height = 30
          Caption = 'Identifica'#231#227'o'
          Columns = 2
          DataField = 'IDENTIFICACAO_ICMS_IPI'
          DataSource = dmMSource.dtsLivroFiscalEntrada
          Items.Strings = (
            'Icms'
            'Ipi')
          TabOrder = 5
          Values.Strings = (
            '0'
            '1')
        end
        object edtCodigoFiscal: TDBEdit
          Left = 103
          Top = 71
          Width = 32
          Height = 21
          DataField = 'CODIGO_VALORES_FISCAIS'
          DataSource = dmMSource.dtsLivroFiscalEntrada
          TabOrder = 0
          OnEnter = edtPesquisaEnter
          OnExit = edtDataEntradaExit
          OnKeyDown = edtPesquisaKeyDown
          OnKeyPress = edtPesquisaKeyPress
        end
        object edtBaseCalculo: TDBEdit
          Left = 103
          Top = 93
          Width = 98
          Height = 21
          DataField = 'BASE_CALCULO_VALOR_OPERACAO'
          DataSource = dmMSource.dtsLivroFiscalEntrada
          TabOrder = 1
          OnEnter = edtPesquisaEnter
          OnExit = edtDataEntradaExit
          OnKeyDown = edtPesquisaKeyDown
          OnKeyPress = edtValorContabilKeyPress
        end
        object edtAliquota: TDBEdit
          Left = 103
          Top = 115
          Width = 63
          Height = 21
          DataField = 'ALIQUOTA'
          DataSource = dmMSource.dtsLivroFiscalEntrada
          TabOrder = 2
          OnEnter = edtPesquisaEnter
          OnExit = edtAliquotaExit
          OnKeyDown = edtPesquisaKeyDown
          OnKeyPress = edtValorContabilKeyPress
        end
        object edtImpostoCreditado: TDBEdit
          Left = 103
          Top = 137
          Width = 98
          Height = 21
          DataField = 'IMPOSTO_CREDITADO'
          DataSource = dmMSource.dtsLivroFiscalEntrada
          TabOrder = 3
          OnEnter = edtPesquisaEnter
          OnExit = edtDataEntradaExit
          OnKeyDown = edtPesquisaKeyDown
          OnKeyPress = edtValorContabilKeyPress
        end
        object edtObservacao: TDBEdit
          Left = 5
          Top = 185
          Width = 304
          Height = 21
          DataField = 'OBSERVACAO'
          DataSource = dmMSource.dtsLivroFiscalEntrada
          TabOrder = 4
          OnEnter = edtPesquisaEnter
          OnExit = edtDataEntradaExit
          OnKeyDown = edtPesquisaKeyDown
          OnKeyPress = edtPesquisaKeyPress
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 777
        Height = 29
        Align = alTop
        Caption = 'L I V R O   R E G I S T R O   D E   E N T R A D A S'
        Color = 16638926
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 4
      end
    end
  end
  object stbAtalho: TStatusBar
    Left = 0
    Top = 592
    Width = 787
    Height = 26
    Panels = <
      item
        Alignment = taCenter
        Style = psOwnerDraw
        Width = 155
      end
      item
        Alignment = taCenter
        Style = psOwnerDraw
        Width = 155
      end
      item
        Alignment = taCenter
        Style = psOwnerDraw
        Width = 155
      end
      item
        Alignment = taCenter
        Style = psOwnerDraw
        Width = 155
      end
      item
        Alignment = taCenter
        Style = psOwnerDraw
        Width = 155
      end>
    OnDrawPanel = stbAtalhoDrawPanel
  end
  object pnlTotais: TPanel
    Left = 0
    Top = 505
    Width = 787
    Height = 46
    Align = alBottom
    Enabled = False
    TabOrder = 4
    object grpValorContabil: TGroupBox
      Left = 5
      Top = 1
      Width = 154
      Height = 41
      Caption = 'Valor Cont'#225'bil'
      TabOrder = 0
      object edtTotalValorContabil: TEdit
        Left = 16
        Top = 16
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Color = 9164792
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        Text = '0,00'
      end
    end
    object grpBaseCalculo: TGroupBox
      Left = 161
      Top = 1
      Width = 154
      Height = 41
      Caption = 'Base c'#225'lculo (*1)'
      TabOrder = 1
      object edtTotalBaseCalculo: TEdit
        Left = 16
        Top = 16
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Color = 9164792
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        Text = '0,00'
      end
    end
    object grpImpostoCreditado: TGroupBox
      Left = 317
      Top = 1
      Width = 154
      Height = 41
      Caption = 'Imposto Creditado'
      TabOrder = 2
      object edtTotalImpostoCreditado: TEdit
        Left = 16
        Top = 16
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Color = 9164792
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        Text = '0,00'
      end
    end
    object grpIsentasNTributada: TGroupBox
      Left = 473
      Top = 1
      Width = 154
      Height = 41
      Caption = 'Isentas / N. Tibutadas (*2)'
      TabOrder = 3
      object edtTotalIsentasNtributadas: TEdit
        Left = 16
        Top = 16
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Color = 9164792
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        Text = '0,00'
      end
    end
    object GroupBox1: TGroupBox
      Left = 629
      Top = 1
      Width = 154
      Height = 41
      Caption = 'Outras (*3)'
      TabOrder = 4
      object edtTotalOutras: TEdit
        Left = 16
        Top = 16
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Color = 9164792
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        Text = '0,00'
      end
    end
  end
  object pnlTitulo: TPanel
    Left = 0
    Top = 485
    Width = 787
    Height = 20
    Align = alBottom
    Caption = 'Totaliza'#231#227'o'
    Color = 16638926
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 5
  end
  object pnlBotoesTotais: TPanel
    Left = 0
    Top = 551
    Width = 787
    Height = 41
    Align = alBottom
    TabOrder = 6
    object btnTotalporCFOP: TButton
      Left = 7
      Top = 9
      Width = 168
      Height = 25
      Cursor = crHandPoint
      Caption = 'Totais por CFOP'
      TabOrder = 0
      OnClick = btnTotalporCFOPClick
    end
    object btnTotaisporAliquota: TButton
      Left = 216
      Top = 9
      Width = 207
      Height = 25
      Cursor = crHandPoint
      Caption = 'Totais por Al'#237'quotas'
      TabOrder = 1
      OnClick = btnTotaisporAliquotaClick
    end
    object btnDemonstrativoEntradas: TButton
      Left = 453
      Top = 9
      Width = 328
      Height = 25
      Cursor = crHandPoint
      Caption = 'Demonstrativo das Entradas / Presta'#231#245'es Interestaduais'
      TabOrder = 2
      OnClick = btnDemonstrativoEntradasClick
    end
  end
  object grpPeriodo: TGroupBox
    Left = 303
    Top = 0
    Width = 160
    Height = 73
    Caption = 'Informe o per'#237'odo'
    TabOrder = 7
    object Label2: TLabel
      Left = 8
      Top = 24
      Width = 55
      Height = 13
      Caption = 'Data inicial:'
    end
    object Label3: TLabel
      Left = 13
      Top = 45
      Width = 50
      Height = 13
      Caption = 'Data final:'
    end
    object edtDataInicial: TMaskEdit
      Left = 69
      Top = 20
      Width = 78
      Height = 21
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 0
      Text = '  /  /    '
      OnEnter = edtDataInicialEnter
      OnExit = edtDataInicialExit
      OnKeyDown = edtPesquisaKeyDown
      OnKeyPress = edtPesquisaKeyPress
    end
    object edtDataFinal: TMaskEdit
      Left = 69
      Top = 42
      Width = 78
      Height = 21
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 1
      Text = '  /  /    '
      OnEnter = edtDataFinalEnter
      OnExit = edtDataFinalExit
      OnKeyDown = edtPesquisaKeyDown
      OnKeyPress = edtPesquisaKeyPress
    end
  end
  object grpMesAno: TGroupBox
    Left = 464
    Top = 0
    Width = 142
    Height = 73
    Caption = 'Selecione o M'#234's/Ano'
    TabOrder = 8
    object cboPeriodoApuracao: TComboBox
      Left = 5
      Top = 20
      Width = 134
      Height = 21
      Style = csDropDownList
      PopupMenu = mnuLimparPeriodo
      TabOrder = 0
      OnCloseUp = cboPeriodoApuracaoExit
      OnExit = cboPeriodoApuracaoExit
      OnKeyPress = edtPesquisaKeyPress
    end
    object chkOrdenarPorEmissao: TCheckBox
      Left = 8
      Top = 48
      Width = 129
      Height = 17
      Caption = 'ordernar por emiss'#227'o'
      TabOrder = 1
    end
  end
  object actLivroEntrada: TActionList
    Left = 680
    Top = 176
    object actIncluir: TAction
      Caption = 'Incluir'
      Hint = 'Incluir'
      ImageIndex = 0
      ShortCut = 113
      OnExecute = actIncluirExecute
    end
    object actCancelar: TAction
      Caption = 'Cancelar'
      ImageIndex = 1
      ShortCut = 114
      OnExecute = actCancelarExecute
    end
    object actSalvar: TAction
      Caption = 'Salvar'
      ImageIndex = 2
      ShortCut = 115
      OnExecute = actSalvarExecute
    end
    object actExcluir: TAction
      Caption = 'Excluir'
      ImageIndex = 3
      ShortCut = 116
      OnExecute = actExcluirExecute
    end
    object actEditar: TAction
      Caption = 'Editar'
      ImageIndex = 4
      ShortCut = 117
      OnExecute = actEditarExecute
    end
    object actSair: TAction
      Caption = 'Sair'
      ImageIndex = 7
      OnExecute = actSairExecute
    end
    object actImprimir: TAction
      Caption = 'Imprimir'
      ImageIndex = 9
      OnExecute = actImprimirExecute
    end
  end
  object mnuLimparPeriodo: TPopupMenu
    Left = 584
    Top = 168
    object Limpar1: TMenuItem
      Caption = 'Limpar'
      OnClick = Limpar1Click
    end
  end
  object fdqSelecionaPeriodo: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      
        'SELECT MES_ANO, COALESCE(SUM(VALOR_CONTABIL),0) AS VC FROM LIVRO' +
        '_ENTRADA'
      'GROUP BY MES_ANO'
      'ORDER BY MES_ANO'
      '')
    Left = 364
    Top = 286
  end
  object fdqTotalizaValorContabil: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      
        'SELECT MES_ANO, COALESCE(SUM(VALOR_CONTABIL),0) AS VC FROM LIVRO' +
        '_ENTRADA'
      'GROUP BY MES_ANO'
      'ORDER BY MES_ANO'
      '')
    Left = 364
    Top = 334
  end
  object fdqTotalizaBase: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      
        'SELECT MES_ANO, COALESCE(SUM(VALOR_CONTABIL),0) AS VC FROM LIVRO' +
        '_ENTRADA'
      'GROUP BY MES_ANO'
      'ORDER BY MES_ANO'
      '')
    Left = 260
    Top = 238
  end
  object fdqTotalizaAliquotas: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      
        'SELECT MES_ANO, COALESCE(SUM(VALOR_CONTABIL),0) AS VC FROM LIVRO' +
        '_ENTRADA'
      'GROUP BY MES_ANO'
      'ORDER BY MES_ANO'
      '')
    Left = 260
    Top = 286
  end
  object fdqTotalizaImpCreditado: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      
        'SELECT MES_ANO, COALESCE(SUM(VALOR_CONTABIL),0) AS VC FROM LIVRO' +
        '_ENTRADA'
      'GROUP BY MES_ANO'
      'ORDER BY MES_ANO'
      '')
    Left = 260
    Top = 334
  end
  object fdqTotalizaOutras: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      
        'SELECT MES_ANO, COALESCE(SUM(VALOR_CONTABIL),0) AS VC FROM LIVRO' +
        '_ENTRADA'
      'GROUP BY MES_ANO'
      'ORDER BY MES_ANO'
      '')
    Left = 260
    Top = 380
  end
  object fdqTotalizaIsentasNT: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      
        'SELECT MES_ANO, COALESCE(SUM(VALOR_CONTABIL),0) AS VC FROM LIVRO' +
        '_ENTRADA'
      'GROUP BY MES_ANO'
      'ORDER BY MES_ANO'
      '')
    Left = 364
    Top = 238
  end
end
