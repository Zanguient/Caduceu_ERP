object frmCLD_PV: TfrmCLD_PV
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'CLD'
  ClientHeight = 553
  ClientWidth = 668
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object imgCancelar: TImage
    Left = 612
    Top = 351
    Width = 48
    Height = 48
    Cursor = crHandPoint
    Picture.Data = {
      0954506E67496D61676589504E470D0A1A0A0000000D49484452000000300000
      003008060000005702F987000000097048597300000EC400000EC401952B0E1B
      000003504944415478DAED594D4C1341147ED31F502F852218201B84A4128F5A
      12BDD51BA870152F5E4C80C49F048C241EA418F00068E4A2085EBC78F0A2174D
      40BCF973B2F5E0A94204ACD61A14A89828D09FF1CDDA42BBCC6EB795FDA9E94B
      A6F33AB3B33BDF9B6FDF37BB4B28A550C8468A008A008A00FE7300FEB6A67AAC
      AE60398EA5968D491F8F85FEA32F6D4B60096199C432E47EE29BCF1B80AFD5DD
      8CD5434248191E47B166C76F0E48FF9FAF9FA53F82EEE9A6A7FE6739036091C7
      BEB7E83A7817D30900F37FA07B586E2594008C63D505E6B07B08803B1725009F
      B0AF562E5A3AAE00F3430840C815409C9DDF24002802B0E60AC054F91501105E
      BB2200A568E9BC020C80453300F6F20A884556D04FA89D34D81C4E128D2C690B
      40CDD296560BE0BA3E06ABBED7109C1841194A280FC0C9081D97A1ECA80766AE
      9E83F52F41E328B4AB4620AEC1315A52552D1EF67DF2114D82E047D2622542C7
      255AD9DA2EB6AF2F86E96CDF79B216FAA8FF0AD89D7BA1F1C67D28FD3B79D1D8
      B9100404EF0EC3D6EE60CB84AE5EA83C794A9C50CA36BE7D8540EF59882E2DEA
      BB02C46A85FD3D03C4E969DE163104417025288DC7C576FCA18C36556DEDDB22
      BCF2EA3999BFD987C7C6F4BF892D363BA9EBEEA74E4F0B48FAB6E844218336E9
      E75C7E314D1746BD24118D1A771313AB0DEABAAF41C5B1968C76914E538F8145
      564A1B66CB2FA761E19617682CA6E632DAEA80129D783ED206903604C1994307
      94E824431B1679ED854CD5DAAAA053BEB449375DB61262B6E9C46CD3DACE8D24
      DE1324383EBC999D4CB395107D8948F126021CB1330D857822C5B354760A8E0D
      014FECE44C330A6511294CA309BED825E924BBEDD085420AB449651B2664B262
      3785741A1FC1741A37864272B491669B6C62A7864E3B4EA192CA7D7070F401B1
      39CA65452A63AC8CD8C5562324D07386E2CE547F0AED696824AE81DB14417045
      4A3A11A9D84523CB74B6FF22F9F521605C16DA5D7F005C8377E0E7BB37AA442A
      4527C7A12330E3BD00BFE7DEABB98CB642C69ECA3616C3DB6823E7333AE17304
      590B7F36919015F243BD5901C4B1E20E32C012F9BCD82AF8578B1358751A1DFA
      A4E5F572B701FBFC608ED7EB6E04309713006605FD81236D25529F984E60A901
      ED6FEC9DFBC45408560460B41501186D050FE00F1A0E0EFB81E63A6500000000
      49454E44AE426082}
    Stretch = True
    OnClick = imgCancelarClick
  end
  object grpCLD_PV: TGroupBox
    Left = 8
    Top = 8
    Width = 598
    Height = 505
    Enabled = False
    TabOrder = 0
    object grpProduto: TGroupBox
      Left = 2
      Top = 15
      Width = 594
      Height = 58
      Align = alTop
      Caption = 'Produto / Descri'#231#227'o / Unidade'
      TabOrder = 0
      ExplicitLeft = 1
      ExplicitWidth = 446
      object edtProduto: TDBEdit
        Left = 3
        Top = 24
        Width = 65
        Height = 21
        DataSource = dmMSource.dtsPesqProdutos
        TabOrder = 0
      end
      object edtDescricao: TDBEdit
        Left = 71
        Top = 24
        Width = 356
        Height = 21
        DataSource = dmMSource.dtsPesqProdutos
        TabOrder = 1
      end
      object edtUnidade: TDBEdit
        Left = 433
        Top = 24
        Width = 30
        Height = 21
        DataField = 'UNIDADE'
        DataSource = dmMSource.dtsPesqProdutos
        TabOrder = 2
      end
    end
    object grpFormacaoPreco: TGroupBox
      Left = 2
      Top = 73
      Width = 594
      Height = 429
      Align = alTop
      Caption = 'Forma'#231#227'o do pre'#231'o'
      TabOrder = 1
      ExplicitLeft = 1
      object lblCustoBruto: TLabel
        Left = 8
        Top = 19
        Width = 57
        Height = 13
        Caption = 'Custo bruto'
      end
      object lblDescontonaCompra: TLabel
        Left = 8
        Top = 41
        Width = 98
        Height = 13
        Caption = 'Desconto na compra'
      end
      object lblCreditodeICMS: TLabel
        Left = 8
        Top = 85
        Width = 78
        Height = 13
        Caption = 'Cr'#233'dito de ICMS'
      end
      object Label4: TLabel
        Left = 8
        Top = 63
        Width = 14
        Height = 13
        Caption = 'IPI'
      end
      object lblOutrosCustos: TLabel
        Left = 8
        Top = 107
        Width = 67
        Height = 13
        Caption = 'Outros custos'
      end
      object lblFrete: TLabel
        Left = 8
        Top = 129
        Width = 26
        Height = 13
        Caption = 'Frete'
      end
      object lblValorICMSR: TLabel
        Left = 8
        Top = 151
        Width = 59
        Height = 13
        Caption = 'Valor ICMSR'
      end
      object lblCustoLiquido: TLabel
        Left = 8
        Top = 173
        Width = 61
        Height = 13
        Caption = 'Custo l'#237'quido'
      end
      object lblICMS_Pagar: TLabel
        Left = 8
        Top = 195
        Width = 65
        Height = 13
        Caption = 'ICMS a pagar'
      end
      object lblPIS_Cofins: TLabel
        Left = 8
        Top = 217
        Width = 58
        Height = 13
        Caption = 'PIS/COFINS'
      end
      object lblCustoOperacional: TLabel
        Left = 8
        Top = 239
        Width = 86
        Height = 13
        Caption = 'Custo operacional'
      end
      object lblComissao: TLabel
        Left = 8
        Top = 261
        Width = 45
        Height = 13
        Caption = 'Comiss'#227'o'
      end
      object lblLucroLiquido: TLabel
        Left = 8
        Top = 283
        Width = 59
        Height = 13
        Caption = 'Lucro l'#237'quido'
      end
      object lblDescontonaVenda: TLabel
        Left = 8
        Top = 305
        Width = 93
        Height = 13
        Caption = 'Desconto na venda'
      end
      object lblMenorPreco: TLabel
        Left = 393
        Top = 76
        Width = 62
        Height = 13
        Caption = 'Menor pre'#231'oi'
      end
      object lblPrecoCalculado: TLabel
        Left = 393
        Top = 38
        Width = 74
        Height = 13
        Caption = 'Preco calculado'
      end
      object lblPrecodeVenda: TLabel
        Left = 393
        Top = 57
        Width = 75
        Height = 13
        Caption = 'Preco de venda'
      end
      object DBEdit1: TDBEdit
        Left = 112
        Top = 16
        Width = 121
        Height = 21
        DataSource = dmMSource.dtsPesqProdutos
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 112
        Top = 38
        Width = 121
        Height = 21
        DataSource = dmMSource.dtsPesqProdutos
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 112
        Top = 60
        Width = 121
        Height = 21
        DataSource = dmMSource.dtsPesqProdutos
        TabOrder = 2
      end
      object DBEdit4: TDBEdit
        Left = 112
        Top = 82
        Width = 121
        Height = 21
        DataSource = dmMSource.dtsPesqProdutos
        TabOrder = 3
      end
      object DBEdit5: TDBEdit
        Left = 112
        Top = 104
        Width = 121
        Height = 21
        DataSource = dmMSource.dtsPesqProdutos
        TabOrder = 4
      end
      object DBEdit6: TDBEdit
        Left = 112
        Top = 126
        Width = 121
        Height = 21
        DataSource = dmMSource.dtsPesqProdutos
        TabOrder = 5
      end
      object DBEdit7: TDBEdit
        Left = 112
        Top = 148
        Width = 121
        Height = 21
        DataSource = dmMSource.dtsPesqProdutos
        TabOrder = 6
      end
      object DBEdit8: TDBEdit
        Left = 112
        Top = 170
        Width = 121
        Height = 21
        DataSource = dmMSource.dtsPesqProdutos
        TabOrder = 7
      end
      object DBEdit9: TDBEdit
        Left = 112
        Top = 192
        Width = 121
        Height = 21
        DataSource = dmMSource.dtsPesqProdutos
        TabOrder = 8
      end
      object DBEdit10: TDBEdit
        Left = 112
        Top = 214
        Width = 121
        Height = 21
        DataSource = dmMSource.dtsPesqProdutos
        TabOrder = 9
      end
      object DBEdit11: TDBEdit
        Left = 112
        Top = 236
        Width = 121
        Height = 21
        DataSource = dmMSource.dtsPesqProdutos
        TabOrder = 10
      end
      object DBEdit12: TDBEdit
        Left = 112
        Top = 258
        Width = 121
        Height = 21
        DataSource = dmMSource.dtsPesqProdutos
        TabOrder = 11
      end
      object DBEdit13: TDBEdit
        Left = 112
        Top = 280
        Width = 121
        Height = 21
        DataSource = dmMSource.dtsPesqProdutos
        TabOrder = 12
      end
      object DBEdit14: TDBEdit
        Left = 112
        Top = 302
        Width = 121
        Height = 21
        DataSource = dmMSource.dtsPesqProdutos
        TabOrder = 13
      end
      object DBEdit15: TDBEdit
        Left = 473
        Top = 38
        Width = 121
        Height = 21
        DataSource = dmMSource.dtsPesqProdutos
        TabOrder = 14
      end
      object DBEdit16: TDBEdit
        Left = 473
        Top = 54
        Width = 121
        Height = 21
        DataSource = dmMSource.dtsPesqProdutos
        TabOrder = 15
      end
      object DBEdit17: TDBEdit
        Left = 473
        Top = 70
        Width = 121
        Height = 21
        DataSource = dmMSource.dtsPesqProdutos
        TabOrder = 16
      end
      object DBEdit18: TDBEdit
        Left = 248
        Top = 38
        Width = 121
        Height = 21
        DataSource = dmMSource.dtsPesqProdutos
        TabOrder = 17
      end
      object DBEdit19: TDBEdit
        Left = 248
        Top = 60
        Width = 121
        Height = 21
        DataSource = dmMSource.dtsPesqProdutos
        TabOrder = 18
      end
      object DBEdit20: TDBEdit
        Left = 248
        Top = 82
        Width = 121
        Height = 21
        DataSource = dmMSource.dtsPesqProdutos
        TabOrder = 19
      end
      object DBEdit21: TDBEdit
        Left = 248
        Top = 104
        Width = 121
        Height = 21
        DataSource = dmMSource.dtsPesqProdutos
        TabOrder = 20
      end
      object DBEdit22: TDBEdit
        Left = 248
        Top = 126
        Width = 121
        Height = 21
        DataSource = dmMSource.dtsPesqProdutos
        TabOrder = 21
      end
      object DBEdit23: TDBEdit
        Left = 248
        Top = 148
        Width = 121
        Height = 21
        DataSource = dmMSource.dtsPesqProdutos
        TabOrder = 22
      end
      object DBEdit24: TDBEdit
        Left = 248
        Top = 170
        Width = 121
        Height = 21
        DataSource = dmMSource.dtsPesqProdutos
        TabOrder = 23
      end
      object DBEdit25: TDBEdit
        Left = 248
        Top = 192
        Width = 121
        Height = 21
        DataSource = dmMSource.dtsPesqProdutos
        TabOrder = 24
      end
      object DBEdit26: TDBEdit
        Left = 248
        Top = 214
        Width = 121
        Height = 21
        DataSource = dmMSource.dtsPesqProdutos
        TabOrder = 25
      end
      object DBEdit27: TDBEdit
        Left = 248
        Top = 236
        Width = 121
        Height = 21
        DataSource = dmMSource.dtsPesqProdutos
        TabOrder = 26
      end
      object DBEdit28: TDBEdit
        Left = 248
        Top = 258
        Width = 121
        Height = 21
        DataSource = dmMSource.dtsPesqProdutos
        TabOrder = 27
      end
    end
  end
end
