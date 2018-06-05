object frmHistorico: TfrmHistorico
  Left = 0
  Top = 0
  ActiveControl = edtHistorico
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Historico de coment'#225'rios / ocorr'#234'ncias '
  ClientHeight = 412
  ClientWidth = 791
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
  object imgIncluir: TImage
    Left = 732
    Top = 15
    Width = 51
    Height = 44
    Cursor = crHandPoint
    Hint = 'Salvar'
    ParentShowHint = False
    Picture.Data = {
      0954506E67496D61676589504E470D0A1A0A0000000D49484452000000280000
      002808060000008CFEB86D000000097048597300000EC400000EC401952B0E1B
      000001174944415478DAEDD7310E82301406E0164D0CF114EEEA8057F00446CF
      E2A6D10378119D5CBC0521BA7A0737E302B58D90D4CA0BA1A5E115DB89405BBE
      FECD238532C608E6469D01EEA7A756A59BEB925602A14E6DB61F20B6244B8198
      9204815892EC0E703C1F91C5616605735E2724B9DCCD80FC9ED5C4F8FB3CD003
      6B01E33836024551F4E709A207FA2DEE3CD06FB107360DDC4D8ED9F6B60A9C3D
      6E414D8CA7B4F93F04102827098E0EA46B318DE9D93BAB0154132C122AFA717C
      E369F1503E6B9576A2122892CC077DED9F8D62290A24B7B03C88A00AC8D45595
      01D5EAD3590430875E9178A0B340A9B3071A0165286A208444052C43DAFC506B
      0155643FEC917038901F8B67DAA78534CDC8F3F13203B6D9D003DF528975CF50
      660C020000000049454E44AE426082}
    ShowHint = True
    Stretch = True
    OnClick = actSalvarExecute
  end
  object imgSair: TImage
    Left = 732
    Top = 363
    Width = 51
    Height = 44
    Cursor = crHandPoint
    Hint = 'Sair'
    ParentShowHint = False
    Picture.Data = {
      0954506E67496D61676589504E470D0A1A0A0000000D49484452000000280000
      002808060000008CFEB86D000000097048597300000EC400000EC401952B0E1B
      0000025C4944415478DA63FCFFFF3FC360068CA30E1C75E06075E02D15467620
      5508C40940AC02C44C600D4C8C0CFFFF51C553FF80F80E102F00E27EB53BFF7F
      12ED40A8E33603B12B86068803A91DEC7B80D8179B237139B01C487560F5116D
      1C08029540077612EBC09B404A8DCE0EBC0D74A03AB10EFC03A498E9ECC07F40
      07B210EB409C0EA0A10319800E641A190E0482FFB269A50CEF8FEC65F87CE52C
      5E4B79B50D18046DDD191ECFEA22583C51CD81F279F5FFD972EAC1FCE741260C
      9F2F617724C871921BCF83D9BFA635333C9C508FD7915471A05C66050347713B
      8AFCF300138C9044761C0CFC9C50C3F0704A2B6D1DC86F6AC320BEFC30863C72
      4862731C08BC8CB167F878E2106D1D088A623E139BFFE2CB302D7A0174E4FFBF
      7FB13AEE75AC23C3FBE30718F001AAE662684832100308851C4D1C0862F39BD9
      32600B4994908B0186DC09FC21473307127224298EA399037165081000A5C94F
      97F097933475203EC7211C690A74E419FA3B9018C7C100BEC29C260EE4D1D4FF
      8FB52801A6B97FFFFE32602F82088724551C080D390C79E40C812BE3100A49AA
      3850A9B8858125B31A451E5B3987AD9CFC33AB83E15E57256D1D088A6295BA89
      FF196372212187A7864009C9A553186E37E651A7B1705B8D89607B4FA9BC83E1
      CDFEAD0C9F4EE1AF4DF88CAD19445C7C19EE75561032F2BFEAAD7FD4712095BA
      9D18C6522D0407830371769A68E8C0BF44779A800EC4D9EDA4A1036F11DDED04
      3A1094A2DBE9EC4050C71D63B0009703710E7DD0C881BB194819FA40722468F0
      281188951990D224951CF81788EF02F17C0652078F06131875E0A803071A0000
      506AF3C058DC002D0000000049454E44AE426082}
    ShowHint = True
    Stretch = True
    OnClick = WindowClose1Execute
  end
  object grdHistorico: TDBGrid
    Left = 8
    Top = 77
    Width = 713
    Height = 297
    DataSource = dmMSource.dtsHistorico_OS
    DrawingStyle = gdsClassic
    Options = [dgTitles, dgIndicator, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = grdHistoricoDrawColumnCell
    OnDblClick = grdHistoricoDblClick
    OnKeyDown = grdHistoricoKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'HISTORICO'
        Title.Alignment = taCenter
        Title.Caption = 'HIST'#211'RICO'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTATO'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_CADASTRO'
        Title.Alignment = taCenter
        Title.Caption = 'DATA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HORA_CADASTRO'
        Title.Alignment = taCenter
        Title.Caption = 'HORA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUARIO'
        Title.Alignment = taCenter
        Title.Caption = 'USU'#193'RIO'
        Width = 125
        Visible = True
      end>
  end
  object grpHistorico: TGroupBox
    Left = 8
    Top = 8
    Width = 481
    Height = 63
    Caption = 'Hist'#243'rico'
    TabOrder = 1
    object edtHistorico: TEdit
      Left = 9
      Top = 24
      Width = 466
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 500
      TabOrder = 0
      OnEnter = edtHistoricoEnter
      OnExit = edtHistoricoEnter
      OnKeyDown = edtHistoricoKeyDown
      OnKeyPress = edtHistoricoKeyPress
    end
  end
  object GroupBox1: TGroupBox
    Left = 491
    Top = 8
    Width = 230
    Height = 63
    Caption = 'Contato'
    TabOrder = 2
    object edtContato: TEdit
      Left = 7
      Top = 24
      Width = 215
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 20
      TabOrder = 0
      OnEnter = edtHistoricoEnter
      OnExit = edtHistoricoEnter
      OnKeyDown = edtHistoricoKeyDown
      OnKeyPress = edtHistoricoKeyPress
    end
  end
  object grpMensagem: TGroupBox
    Left = 8
    Top = 374
    Width = 713
    Height = 33
    Caption = 'Mensagem'
    TabOrder = 3
    object lblMsg: TLabel
      Left = 72
      Top = 13
      Width = 600
      Height = 16
      ParentCustomHint = False
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsItalic]
      ParentFont = False
    end
  end
  object ActionList1: TActionList
    Left = 328
    Top = 192
    object actExcluir: TAction
      Caption = 'actExcluir'
      OnExecute = actExcluirExecute
    end
    object actSalvar: TAction
      Caption = 'actSalvar'
      OnExecute = actSalvarExecute
    end
    object WindowClose1: TWindowClose
      Category = 'Window'
      Caption = 'C&lose'
      Enabled = False
      Hint = 'Close'
      OnExecute = WindowClose1Execute
    end
  end
end
