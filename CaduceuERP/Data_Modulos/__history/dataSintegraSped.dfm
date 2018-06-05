object dmSintegraSPED: TdmSintegraSPED
  OldCreateOrder = False
  Height = 587
  Width = 820
  object fdqRegistro50: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      'SELECT * FROM SELECIONAR_REGISTRO50(:IP_CNPJ,:IP_DATA_INICIAL,'
      ':IP_DATA_FINAL, :IP_ESTADO)'
      '')
    Left = 39
    Top = 12
    ParamData = <
      item
        Name = 'IP_CNPJ'
        DataType = ftString
        ParamType = ptInput
        Size = 20
        Value = Null
      end
      item
        Name = 'IP_DATA_INICIAL'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'IP_DATA_FINAL'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'IP_ESTADO'
        DataType = ftFixedChar
        ParamType = ptInput
        Size = 2
      end>
  end
  object dspRegistro50: TDataSetProvider
    DataSet = fdqRegistro50
    Left = 140
    Top = 12
  end
  object cdsRegistro50: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRegistro50'
    Left = 239
    Top = 12
    object cdsRegistro50OP_CNPJ: TStringField
      FieldName = 'OP_CNPJ'
      Size = 14
    end
    object cdsRegistro50OP_INSCRICAO: TStringField
      FieldName = 'OP_INSCRICAO'
      Size = 14
    end
    object cdsRegistro50OP_EMISSAO: TDateField
      FieldName = 'OP_EMISSAO'
    end
    object cdsRegistro50OP_ESTADO: TStringField
      FieldName = 'OP_ESTADO'
      FixedChar = True
      Size = 2
    end
    object cdsRegistro50OP_MODELO: TStringField
      FieldName = 'OP_MODELO'
      FixedChar = True
      Size = 2
    end
    object cdsRegistro50OP_SERIE: TStringField
      FieldName = 'OP_SERIE'
      Size = 3
    end
    object cdsRegistro50OP_NOTAFISCAL: TIntegerField
      FieldName = 'OP_NOTAFISCAL'
    end
    object cdsRegistro50OP_CFOP: TStringField
      FieldName = 'OP_CFOP'
      Size = 4
    end
    object cdsRegistro50OP_EMITENTE: TStringField
      FieldName = 'OP_EMITENTE'
      FixedChar = True
      Size = 1
    end
    object cdsRegistro50OP_VALOR_TOTAL: TBCDField
      FieldName = 'OP_VALOR_TOTAL'
      Precision = 18
      Size = 2
    end
    object cdsRegistro50OP_BASE_CALCULO_ICMS: TBCDField
      FieldName = 'OP_BASE_CALCULO_ICMS'
      Precision = 18
      Size = 2
    end
    object cdsRegistro50OP_VALOR_ICMS: TBCDField
      FieldName = 'OP_VALOR_ICMS'
      Precision = 18
      Size = 2
    end
    object cdsRegistro50OP_ISENTAS_NTRIBUTADA: TBCDField
      FieldName = 'OP_ISENTAS_NTRIBUTADA'
      Precision = 18
      Size = 2
    end
    object cdsRegistro50OP_OUTRAS: TBCDField
      FieldName = 'OP_OUTRAS'
      Precision = 18
      Size = 2
    end
    object cdsRegistro50OP_ALIQUOTAS: TBCDField
      FieldName = 'OP_ALIQUOTAS'
      Precision = 18
      Size = 2
    end
    object cdsRegistro50OP_SITUACAO: TStringField
      FieldName = 'OP_SITUACAO'
      FixedChar = True
      Size = 1
    end
  end
  object fdqRegistro54: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      
        'SELECT * FROM SELECIONAR_REGISTRO54( :IP_DATA_INICIAL,:IP_DATA_F' +
        'INAL, :IP_ESTADO)')
    Left = 39
    Top = 55
    ParamData = <
      item
        Name = 'IP_DATA_INICIAL'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'IP_DATA_FINAL'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'IP_ESTADO'
        DataType = ftFixedChar
        ParamType = ptInput
        Size = 2
      end>
  end
  object dspRegistro54: TDataSetProvider
    DataSet = fdqRegistro54
    Left = 140
    Top = 55
  end
  object cdsRegistro54: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRegistro54'
    Left = 239
    Top = 55
    object cdsRegistro54OP_CNPJ: TStringField
      FieldName = 'OP_CNPJ'
      Size = 14
    end
    object cdsRegistro54OP_MODELO: TStringField
      FieldName = 'OP_MODELO'
      FixedChar = True
      Size = 2
    end
    object cdsRegistro54OP_SERIE: TStringField
      FieldName = 'OP_SERIE'
      Size = 3
    end
    object cdsRegistro54OP_NOTAFISCAL: TIntegerField
      FieldName = 'OP_NOTAFISCAL'
    end
    object cdsRegistro54OP_CFOP: TStringField
      FieldName = 'OP_CFOP'
      Size = 4
    end
    object cdsRegistro54OP_CST: TSmallintField
      FieldName = 'OP_CST'
    end
    object cdsRegistro54OP_NUMERO_ITEM: TIntegerField
      FieldName = 'OP_NUMERO_ITEM'
    end
    object cdsRegistro54OP_PRODUTO: TIntegerField
      FieldName = 'OP_PRODUTO'
    end
    object cdsRegistro54OP_QUANTIDADE: TBCDField
      FieldName = 'OP_QUANTIDADE'
      Precision = 18
      Size = 3
    end
    object cdsRegistro54OP_VALOR_UNITARIO: TBCDField
      FieldName = 'OP_VALOR_UNITARIO'
      Precision = 18
      Size = 2
    end
    object cdsRegistro54OP_DESCONTO_DESPESAS: TBCDField
      FieldName = 'OP_DESCONTO_DESPESAS'
      Precision = 18
      Size = 2
    end
    object cdsRegistro54OP_BASE_ICMS: TBCDField
      FieldName = 'OP_BASE_ICMS'
      Precision = 18
      Size = 2
    end
    object cdsRegistro54OP_BASE_ICMSR: TBCDField
      FieldName = 'OP_BASE_ICMSR'
      Precision = 18
      Size = 2
    end
    object cdsRegistro54OP_VALOR_IPI: TBCDField
      FieldName = 'OP_VALOR_IPI'
      Precision = 18
      Size = 2
    end
    object cdsRegistro54OP_ALIQUOTA_ICMS: TBCDField
      FieldName = 'OP_ALIQUOTA_ICMS'
      Precision = 18
      Size = 2
    end
    object cdsRegistro54OP_EMISSAO: TDateField
      FieldName = 'OP_EMISSAO'
    end
    object cdsRegistro54OP_ENTRADA: TDateField
      FieldName = 'OP_ENTRADA'
    end
  end
  object fdqRegistro60M: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      
        'SELECT * FROM SELECIONAR_REGISTRO60MESTRE(:IP_DATA_INICIAL,:IP_D' +
        'ATA_FINAL)')
    Left = 39
    Top = 101
    ParamData = <
      item
        Name = 'IP_DATA_INICIAL'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'IP_DATA_FINAL'
        DataType = ftDate
        ParamType = ptInput
      end>
  end
  object dspRegistro60M: TDataSetProvider
    DataSet = fdqRegistro60M
    Left = 140
    Top = 101
  end
  object cdsRegistro60M: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRegistro60M'
    Left = 239
    Top = 101
    object cdsRegistro60MOP_SERIE: TStringField
      FieldName = 'OP_SERIE'
    end
    object cdsRegistro60MOP_EMISSAO: TDateField
      FieldName = 'OP_EMISSAO'
    end
    object cdsRegistro60MOP_NUMEROECF: TSmallintField
      FieldName = 'OP_NUMEROECF'
    end
    object cdsRegistro60MOP_COOINICIAL: TIntegerField
      FieldName = 'OP_COOINICIAL'
    end
    object cdsRegistro60MOP_COOFINAL: TIntegerField
      FieldName = 'OP_COOFINAL'
    end
    object cdsRegistro60MOP_CONTADORREDUCAOZ: TSmallintField
      FieldName = 'OP_CONTADORREDUCAOZ'
    end
    object cdsRegistro60MOP_VENDABRUTA: TBCDField
      FieldName = 'OP_VENDABRUTA'
      Precision = 18
      Size = 2
    end
    object cdsRegistro60MOP_GTFINAL: TBCDField
      FieldName = 'OP_GTFINAL'
      Precision = 18
      Size = 2
    end
    object cdsRegistro60MOP_CRO: TIntegerField
      FieldName = 'OP_CRO'
    end
    object cdsRegistro60MOP_MODELO: TStringField
      FieldName = 'OP_MODELO'
      Size = 2
    end
    object cdsRegistro60MOP_REG60M: TIntegerField
      FieldName = 'OP_REG60M'
    end
  end
  object fdqRegistro60A: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      
        'SELECT * FROM SELECIONAR_REGISTRO60ANALITICO(:IP_REG60M,:IP_DATA' +
        '_INICIAL,:IP_DATA_FINAL, :IP_SERIE_ECF)')
    Left = 39
    Top = 145
    ParamData = <
      item
        Name = 'IP_REG60M'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'IP_DATA_INICIAL'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'IP_DATA_FINAL'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'IP_SERIE_ECF'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end>
  end
  object dspRegistro60A: TDataSetProvider
    DataSet = fdqRegistro60A
    Left = 140
    Top = 145
  end
  object cdsRegistro60A: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRegistro60A'
    Left = 239
    Top = 145
    object cdsRegistro60AOP_EMISSAO: TDateField
      FieldName = 'OP_EMISSAO'
    end
    object cdsRegistro60AOP_SERIE: TStringField
      FieldName = 'OP_SERIE'
    end
    object cdsRegistro60AOP_ALIQUOTA: TStringField
      FieldName = 'OP_ALIQUOTA'
      Size = 4
    end
    object cdsRegistro60AOP_VALORACUMULADO: TSingleField
      FieldName = 'OP_VALORACUMULADO'
    end
  end
  object fdqRegistro60D: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      
        'SELECT * FROM SELECIONAR_REGISTRO60D(:IP_DATA_INICIAL, :IP_DATA_' +
        'FINAL, :IP_SERIE_ECF)')
    Left = 39
    Top = 189
    ParamData = <
      item
        Name = 'IP_DATA_INICIAL'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'IP_DATA_FINAL'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'IP_SERIE_ECF'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end>
  end
  object dspRegistro60D: TDataSetProvider
    DataSet = fdqRegistro60D
    Left = 140
    Top = 189
  end
  object cdsRegistro60D: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRegistro60D'
    Left = 239
    Top = 189
    object cdsRegistro60DOP_EMISSAO: TDateField
      FieldName = 'OP_EMISSAO'
    end
    object cdsRegistro60DOP_SERIE: TStringField
      FieldName = 'OP_SERIE'
    end
    object cdsRegistro60DOP_PRODUTO: TStringField
      FieldName = 'OP_PRODUTO'
      Size = 14
    end
    object cdsRegistro60DOP_QUANTIDADE: TSingleField
      FieldName = 'OP_QUANTIDADE'
    end
    object cdsRegistro60DOP_VALOR_UNITARIO: TSingleField
      FieldName = 'OP_VALOR_UNITARIO'
    end
    object cdsRegistro60DOP_BASE_ICMS: TSingleField
      FieldName = 'OP_BASE_ICMS'
    end
    object cdsRegistro60DOP_ALIQUOTA_ICMS: TStringField
      FieldName = 'OP_ALIQUOTA_ICMS'
      Size = 4
    end
    object cdsRegistro60DOP_VALOR_ICMS: TSingleField
      FieldName = 'OP_VALOR_ICMS'
    end
  end
  object fdqRegistro60I: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      
        'SELECT * FROM SELECIONAR_REGISTRO60I(:IP_DATA_INICIAL,:IP_DATA_F' +
        'INAL, :IP_SERIE_ECF)')
    Left = 39
    Top = 233
    ParamData = <
      item
        Name = 'IP_DATA_INICIAL'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'IP_DATA_FINAL'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'IP_SERIE_ECF'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end>
  end
  object dspRegistro60I: TDataSetProvider
    DataSet = fdqRegistro60I
    Left = 140
    Top = 233
  end
  object cdsRegistro60I: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRegistro60I'
    Left = 239
    Top = 233
    object cdsRegistro60IOP_EMISSAO: TDateField
      FieldName = 'OP_EMISSAO'
    end
    object cdsRegistro60IOP_SERIE: TStringField
      FieldName = 'OP_SERIE'
    end
    object cdsRegistro60IOP_MODELO_DOCUMENTO: TStringField
      FieldName = 'OP_MODELO_DOCUMENTO'
      FixedChar = True
      Size = 2
    end
    object cdsRegistro60IOP_PRODUTO: TStringField
      FieldName = 'OP_PRODUTO'
      Size = 14
    end
    object cdsRegistro60IOP_QUANTIDADE: TSingleField
      FieldName = 'OP_QUANTIDADE'
    end
    object cdsRegistro60IOP_VALOR_UNITARIO: TSingleField
      FieldName = 'OP_VALOR_UNITARIO'
    end
    object cdsRegistro60IOP_BASE_ICMS: TSingleField
      FieldName = 'OP_BASE_ICMS'
    end
    object cdsRegistro60IOP_ALIQUOTA: TStringField
      FieldName = 'OP_ALIQUOTA'
      Size = 4
    end
    object cdsRegistro60IOP_VALOR_ICMS: TSingleField
      FieldName = 'OP_VALOR_ICMS'
    end
    object cdsRegistro60IOP_NUMERO_CUPOM: TIntegerField
      FieldName = 'OP_NUMERO_CUPOM'
    end
    object cdsRegistro60IOP_NUMERO_ITEM: TIntegerField
      FieldName = 'OP_NUMERO_ITEM'
    end
  end
  object fdqRegistro60R: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      
        'SELECT * FROM SELECIONAR_REGISTRO60R(:IP_DATA_INICIAL,:IP_DATA_F' +
        'INAL)')
    Left = 39
    Top = 278
    ParamData = <
      item
        Name = 'IP_DATA_INICIAL'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'IP_DATA_FINAL'
        DataType = ftDate
        ParamType = ptInput
      end>
  end
  object dspRegistro60R: TDataSetProvider
    DataSet = fdqRegistro60R
    Left = 140
    Top = 278
  end
  object cdsRegistro60R: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRegistro60R'
    Left = 239
    Top = 278
    object cdsRegistro60ROP_PRODUTO: TIntegerField
      FieldName = 'OP_PRODUTO'
      Origin = 'OP_PRODUTO'
    end
    object cdsRegistro60ROP_QUANTIDADE: TSingleField
      FieldName = 'OP_QUANTIDADE'
      Origin = 'OP_QUANTIDADE'
    end
    object cdsRegistro60ROP_VALOR_UNITARIO: TSingleField
      FieldName = 'OP_VALOR_UNITARIO'
      Origin = 'OP_VALOR_UNITARIO'
    end
    object cdsRegistro60ROP_BASE_ICMS: TSingleField
      FieldName = 'OP_BASE_ICMS'
      Origin = 'OP_BASE_ICMS'
    end
    object cdsRegistro60ROP_ALIQUOTA_ICMS: TStringField
      FieldName = 'OP_ALIQUOTA_ICMS'
      Origin = 'OP_ALIQUOTA_ICMS'
      Size = 4
    end
  end
  object fdqRegistro70: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      
        'SELECT * FROM SELECIONAR_REGISTRO70(:IP_DATA_INICIAL, :IP_DATA_F' +
        'INAL)')
    Left = 39
    Top = 321
    ParamData = <
      item
        Name = 'IP_DATA_INICIAL'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'IP_DATA_FINAL'
        DataType = ftDate
        ParamType = ptInput
      end>
  end
  object dspRegistro70: TDataSetProvider
    DataSet = fdqRegistro70
    Left = 140
    Top = 321
  end
  object cdsRegistro70: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRegistro70'
    Left = 239
    Top = 321
    object cdsRegistro70OP_CNPJ: TStringField
      FieldName = 'OP_CNPJ'
      Size = 14
    end
    object cdsRegistro70OP_INSCRICAO: TStringField
      FieldName = 'OP_INSCRICAO'
      Size = 14
    end
    object cdsRegistro70OP_EMISSAO_ENTRADA: TDateField
      FieldName = 'OP_EMISSAO_ENTRADA'
    end
    object cdsRegistro70OP_ESTADO: TStringField
      FieldName = 'OP_ESTADO'
      FixedChar = True
      Size = 2
    end
    object cdsRegistro70OP_MODELO: TSmallintField
      FieldName = 'OP_MODELO'
    end
    object cdsRegistro70OP_SERIE: TStringField
      FieldName = 'OP_SERIE'
      FixedChar = True
      Size = 1
    end
    object cdsRegistro70OP_SUBSERIE: TStringField
      FieldName = 'OP_SUBSERIE'
      FixedChar = True
      Size = 2
    end
    object cdsRegistro70OP_NUMERO: TIntegerField
      FieldName = 'OP_NUMERO'
    end
    object cdsRegistro70OP_CFOP: TStringField
      FieldName = 'OP_CFOP'
      Size = 4
    end
    object cdsRegistro70OP_VALOR_TOTAL: TBCDField
      FieldName = 'OP_VALOR_TOTAL'
      Precision = 18
      Size = 2
    end
    object cdsRegistro70OP_BASE_ICMS: TBCDField
      FieldName = 'OP_BASE_ICMS'
      Precision = 18
      Size = 2
    end
    object cdsRegistro70OP_VALOR_ICMS: TBCDField
      FieldName = 'OP_VALOR_ICMS'
      Precision = 18
      Size = 2
    end
    object cdsRegistro70OP_ISENTAS_NAO_TRIBUTADA: TBCDField
      FieldName = 'OP_ISENTAS_NAO_TRIBUTADA'
      Precision = 18
      Size = 2
    end
    object cdsRegistro70OP_OUTRAS: TBCDField
      FieldName = 'OP_OUTRAS'
      Precision = 18
      Size = 2
    end
    object cdsRegistro70OP_CIF_FOB: TSmallintField
      FieldName = 'OP_CIF_FOB'
    end
    object cdsRegistro70OP_SITUACAO: TStringField
      FieldName = 'OP_SITUACAO'
      FixedChar = True
      Size = 1
    end
  end
  object fdqRegistro74: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      'SELECT * FROM SELECIONAR_REGISTRO74(:IP_ANO)')
    Left = 39
    Top = 365
    ParamData = <
      item
        Name = 'IP_ANO'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object dspRegistro74: TDataSetProvider
    DataSet = fdqRegistro74
    Left = 140
    Top = 365
  end
  object cdsRegistro74: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRegistro74'
    Left = 239
    Top = 365
    object cdsRegistro74OP_PRODUTO: TIntegerField
      FieldName = 'OP_PRODUTO'
    end
    object cdsRegistro74OP_QUANTIDADE: TSingleField
      FieldName = 'OP_QUANTIDADE'
    end
    object cdsRegistro74OP_VALOR_BRUTO: TSingleField
      FieldName = 'OP_VALOR_BRUTO'
    end
    object cdsRegistro74OP_ANO: TIntegerField
      FieldName = 'OP_ANO'
    end
  end
  object fdqSelRC100_SPED: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      'SELECT * FROM SELECIONAR_RC100_SPEDF(:IP_DATA_INICIAL ,'
      ':IP_DATA_FINAL,:IP_TIPO_SPED)')
    Left = 39
    Top = 412
    ParamData = <
      item
        Name = 'IP_DATA_INICIAL'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'IP_DATA_FINAL'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'IP_TIPO_SPED'
        DataType = ftSmallint
        ParamType = ptInput
      end>
  end
  object dspSelRC100_SPED: TDataSetProvider
    DataSet = fdqSelRC100_SPED
    Left = 140
    Top = 412
  end
  object cdsSelRC100_SPED: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSelRC100_SPED'
    Left = 239
    Top = 412
    object cdsSelRC100_SPEDOP_IND_OPERACAO: TStringField
      FieldName = 'OP_IND_OPERACAO'
      Size = 1
    end
    object cdsSelRC100_SPEDOP_IND_EMITENTE: TStringField
      FieldName = 'OP_IND_EMITENTE'
      Size = 1
    end
    object cdsSelRC100_SPEDOP_COD_PARTICIPANTE: TStringField
      FieldName = 'OP_COD_PARTICIPANTE'
      Size = 60
    end
    object cdsSelRC100_SPEDOP_MODELO: TStringField
      FieldName = 'OP_MODELO'
      Size = 2
    end
    object cdsSelRC100_SPEDOP_COD_SITUACAO: TSmallintField
      FieldName = 'OP_COD_SITUACAO'
    end
    object cdsSelRC100_SPEDOP_SERIE: TStringField
      FieldName = 'OP_SERIE'
      Size = 3
    end
    object cdsSelRC100_SPEDOP_NUM_DOCUMENTO: TIntegerField
      FieldName = 'OP_NUM_DOCUMENTO'
    end
    object cdsSelRC100_SPEDOP_CHAVE_NFE: TStringField
      FieldName = 'OP_CHAVE_NFE'
      Size = 44
    end
    object cdsSelRC100_SPEDOP_DATA_EMISSAO: TDateField
      FieldName = 'OP_DATA_EMISSAO'
    end
    object cdsSelRC100_SPEDOP_DATA_ENTRADA_SAIDA: TDateField
      FieldName = 'OP_DATA_ENTRADA_SAIDA'
    end
    object cdsSelRC100_SPEDOP_VALOR_DOCUMENTO: TBCDField
      FieldName = 'OP_VALOR_DOCUMENTO'
      Precision = 18
      Size = 2
    end
    object cdsSelRC100_SPEDOP_IND_PAGAMENTO: TStringField
      FieldName = 'OP_IND_PAGAMENTO'
      Size = 1
    end
    object cdsSelRC100_SPEDOP_VALOR_DESCONTO: TBCDField
      FieldName = 'OP_VALOR_DESCONTO'
      Precision = 18
      Size = 2
    end
    object cdsSelRC100_SPEDOP_VALOR_ABATIMENTO_NT: TBCDField
      FieldName = 'OP_VALOR_ABATIMENTO_NT'
      Precision = 18
      Size = 2
    end
    object cdsSelRC100_SPEDOP_IND_FRETE: TStringField
      FieldName = 'OP_IND_FRETE'
      Size = 1
    end
    object cdsSelRC100_SPEDOP_VALOR_FRETE: TBCDField
      FieldName = 'OP_VALOR_FRETE'
      Precision = 18
      Size = 2
    end
    object cdsSelRC100_SPEDOP_VALOR_SEGURO: TBCDField
      FieldName = 'OP_VALOR_SEGURO'
      Precision = 18
      Size = 2
    end
    object cdsSelRC100_SPEDOP_VALOR_OUTRAS_DESP: TBCDField
      FieldName = 'OP_VALOR_OUTRAS_DESP'
      Precision = 18
      Size = 2
    end
    object cdsSelRC100_SPEDOP_VALOR_BASE_CALCULO: TBCDField
      FieldName = 'OP_VALOR_BASE_CALCULO'
      Precision = 18
      Size = 2
    end
    object cdsSelRC100_SPEDOP_VALOR_ICMS: TBCDField
      FieldName = 'OP_VALOR_ICMS'
      Precision = 18
      Size = 2
    end
    object cdsSelRC100_SPEDOP_VALOR_BASE_ICMS_ST: TBCDField
      FieldName = 'OP_VALOR_BASE_ICMS_ST'
      Precision = 18
      Size = 2
    end
    object cdsSelRC100_SPEDOP_VALOR_ICMS_ST: TBCDField
      FieldName = 'OP_VALOR_ICMS_ST'
      Precision = 18
      Size = 2
    end
    object cdsSelRC100_SPEDOP_VALOR_IPI: TBCDField
      FieldName = 'OP_VALOR_IPI'
      Precision = 18
      Size = 2
    end
    object cdsSelRC100_SPEDOP_VALOR_PIS: TBCDField
      FieldName = 'OP_VALOR_PIS'
      Precision = 18
      Size = 2
    end
    object cdsSelRC100_SPEDOP_VALOR_COFINS: TBCDField
      FieldName = 'OP_VALOR_COFINS'
      Precision = 18
      Size = 2
    end
    object cdsSelRC100_SPEDOP_VALOR_PIS_ST: TBCDField
      FieldName = 'OP_VALOR_PIS_ST'
      Precision = 18
      Size = 2
    end
    object cdsSelRC100_SPEDOP_VALOR_COFINS_ST: TBCDField
      FieldName = 'OP_VALOR_COFINS_ST'
      Precision = 18
      Size = 2
    end
    object cdsSelRC100_SPEDOP_VALOR_MERCADORIA: TBCDField
      FieldName = 'OP_VALOR_MERCADORIA'
      Precision = 18
      Size = 2
    end
    object cdsSelRC100_SPEDOP_TIPO_SPED: TSmallintField
      FieldName = 'OP_TIPO_SPED'
    end
  end
  object fdqSelFornecedor: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      
        'select forn.fornecedor, forn.razaosocial, forn.cnpj, forn.tipo, ' +
        'forn.inscricao,'
      
        'forn.inscricao_suframa, forn.endereco, forn.numero, forn.complem' +
        'ento,'
      
        'forn.bairro, forn.pais , cid.codigo_municipio from fornecedor fo' +
        'rn'
      'join cidades cid'
      'on(cid.cidade = forn.cidade)'
      'where forn.cnpj = :ip_cnpj'
      'order by forn.razaosocial')
    Left = 735
    Top = 20
    ParamData = <
      item
        Name = 'IP_CNPJ'
        DataType = ftString
        ParamType = ptInput
        Size = 20
        Value = Null
      end>
    object fdqSelFornecedorFORNECEDOR: TIntegerField
      FieldName = 'FORNECEDOR'
      Origin = 'FORNECEDOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object fdqSelFornecedorRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Origin = 'RAZAOSOCIAL'
      Required = True
      Size = 40
    end
    object fdqSelFornecedorCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Required = True
    end
    object fdqSelFornecedorTIPO: TSmallintField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Required = True
    end
    object fdqSelFornecedorINSCRICAO: TStringField
      FieldName = 'INSCRICAO'
      Origin = 'INSCRICAO'
    end
    object fdqSelFornecedorINSCRICAO_SUFRAMA: TStringField
      FieldName = 'INSCRICAO_SUFRAMA'
      Origin = 'INSCRICAO_SUFRAMA'
      Size = 9
    end
    object fdqSelFornecedorENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Required = True
      Size = 40
    end
    object fdqSelFornecedorNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
    end
    object fdqSelFornecedorCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
      Size = 30
    end
    object fdqSelFornecedorBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 30
    end
    object fdqSelFornecedorPAIS: TIntegerField
      FieldName = 'PAIS'
      Origin = 'PAIS'
      Required = True
    end
    object fdqSelFornecedorCODIGO_MUNICIPIO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODIGO_MUNICIPIO'
      Origin = 'CODIGO_MUNICIPIO'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object fdqSelClientes: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      
        'select cli.cliente, cli.razaosocial, cli.cnpj, cli.tipo, cli.ins' +
        'cricao,'
      'cli.inscricao_suframa, cli.enderecoentrega, cli.numeroentrega,'
      'cli.complemento, cli.bairroentrega, cli.pais ,'
      'cid.codigo_municipio from clientes cli'
      'join cidades cid'
      'on(cid.cidade = cli.cidadeentrega)'
      'where cli.cnpj = :ip_cnpj'
      'order by cli.razaosocial')
    Left = 735
    Top = 76
    ParamData = <
      item
        Name = 'IP_CNPJ'
        DataType = ftString
        ParamType = ptInput
        Size = 20
        Value = Null
      end>
    object fdqSelClientesCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
      Origin = 'CLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object fdqSelClientesRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Origin = 'RAZAOSOCIAL'
      Required = True
      Size = 40
    end
    object fdqSelClientesCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Required = True
    end
    object fdqSelClientesTIPO: TSmallintField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Required = True
    end
    object fdqSelClientesINSCRICAO: TStringField
      FieldName = 'INSCRICAO'
      Origin = 'INSCRICAO'
    end
    object fdqSelClientesINSCRICAO_SUFRAMA: TStringField
      FieldName = 'INSCRICAO_SUFRAMA'
      Origin = 'INSCRICAO_SUFRAMA'
      Size = 9
    end
    object fdqSelClientesENDERECOENTREGA: TStringField
      FieldName = 'ENDERECOENTREGA'
      Origin = 'ENDERECOENTREGA'
      Required = True
      Size = 40
    end
    object fdqSelClientesNUMEROENTREGA: TIntegerField
      FieldName = 'NUMEROENTREGA'
      Origin = 'NUMEROENTREGA'
    end
    object fdqSelClientesCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
      Size = 30
    end
    object fdqSelClientesBAIRROENTREGA: TStringField
      FieldName = 'BAIRROENTREGA'
      Origin = 'BAIRROENTREGA'
      Size = 30
    end
    object fdqSelClientesPAIS: TIntegerField
      FieldName = 'PAIS'
      Origin = 'PAIS'
      Required = True
    end
    object fdqSelClientesCODIGO_MUNICIPIO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODIGO_MUNICIPIO'
      Origin = 'CODIGO_MUNICIPIO'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object fdqSelRC140_SPED: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      'SELECT * FROM SELECIONAR_RC140_SPEDF(:IP_CNPJ,'
      ':IP_NUMERO_TITULO)')
    Left = 39
    Top = 457
    ParamData = <
      item
        Name = 'IP_CNPJ'
        DataType = ftString
        ParamType = ptInput
        Size = 20
        Value = Null
      end
      item
        Name = 'IP_NUMERO_TITULO'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end>
  end
  object dspSelRC140_SPED: TDataSetProvider
    DataSet = fdqSelRC140_SPED
    Left = 140
    Top = 457
  end
  object cdsSelRC140_SPED: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSelRC140_SPED'
    Left = 239
    Top = 457
    object cdsSelRC140_SPEDOP_IND_EMITENTE: TStringField
      FieldName = 'OP_IND_EMITENTE'
      Size = 1
    end
    object cdsSelRC140_SPEDOP_IND_TIPO_TITULO: TStringField
      FieldName = 'OP_IND_TIPO_TITULO'
      Size = 2
    end
    object cdsSelRC140_SPEDOP_DESCRICAO_TITULO: TMemoField
      FieldName = 'OP_DESCRICAO_TITULO'
      BlobType = ftMemo
    end
    object cdsSelRC140_SPEDOP_NUMERO_TITULO: TStringField
      FieldName = 'OP_NUMERO_TITULO'
      Size = 10
    end
    object cdsSelRC140_SPEDOP_QTD_PARCELAS: TSmallintField
      FieldName = 'OP_QTD_PARCELAS'
    end
    object cdsSelRC140_SPEDOP_CNPJ: TStringField
      FieldName = 'OP_CNPJ'
    end
    object cdsSelRC140_SPEDOP_NOTA_FISCAL: TStringField
      FieldName = 'OP_NOTA_FISCAL'
      Size = 10
    end
    object cdsSelRC140_SPEDOP_VALOR_TITULO: TBCDField
      FieldName = 'OP_VALOR_TITULO'
      Precision = 18
      Size = 2
    end
  end
  object fdqSelRC141_SPED: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      'SELECT * FROM SELECIONAR_RC141_SPEDF(:IP_CNPJ, :IP_NOTA_FISCAL,'
      ':IP_MODELO, :IP_SERIE)')
    Left = 39
    Top = 499
    ParamData = <
      item
        Name = 'IP_CNPJ'
        DataType = ftString
        ParamType = ptInput
        Size = 20
        Value = Null
      end
      item
        Name = 'IP_NOTA_FISCAL'
        DataType = ftString
        ParamType = ptInput
        Size = 10
        Value = Null
      end
      item
        Name = 'IP_MODELO'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Name = 'IP_SERIE'
        DataType = ftString
        ParamType = ptInput
        Size = 3
      end>
  end
  object dspSelRC141_SPED: TDataSetProvider
    DataSet = fdqSelRC141_SPED
    Left = 140
    Top = 499
  end
  object cdsSelRC141_SPED: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSelRC141_SPED'
    Left = 239
    Top = 499
    object cdsSelRC141_SPEDOP_NUMERO_PARCELA: TSmallintField
      FieldName = 'OP_NUMERO_PARCELA'
    end
    object cdsSelRC141_SPEDOP_DATA_VENCIMENTO: TDateField
      FieldName = 'OP_DATA_VENCIMENTO'
    end
    object cdsSelRC141_SPEDOP_VALOR_PARCELA: TBCDField
      FieldName = 'OP_VALOR_PARCELA'
      Precision = 18
      Size = 2
    end
    object cdsSelRC141_SPEDOP_CNPJ: TStringField
      FieldName = 'OP_CNPJ'
    end
    object cdsSelRC141_SPEDOP_NOTA_FISCAL: TStringField
      FieldName = 'OP_NOTA_FISCAL'
      Size = 10
    end
    object cdsSelRC141_SPEDOP_MODELO: TStringField
      FieldName = 'OP_MODELO'
      Size = 2
    end
    object cdsSelRC141_SPEDOP_SERIE: TStringField
      FieldName = 'OP_SERIE'
      Size = 3
    end
  end
  object fdqSelRC170_SPED: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      'select * from SELECIONAR_RC170_SPEDF(:IP_EMISSAO_DOCUMENTO,'
      ':IP_NUMERO_DOCUMENTO,:IP_MODELO_DOCUMENTO,'
      ':IP_SERIE_DOCUMENTO, :IP_CNPJ, :IP_TIPO_SPED)')
    Left = 340
    Top = 11
    ParamData = <
      item
        Name = 'IP_EMISSAO_DOCUMENTO'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IP_NUMERO_DOCUMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Name = 'IP_MODELO_DOCUMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Name = 'IP_SERIE_DOCUMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 3
      end
      item
        Name = 'IP_CNPJ'
        DataType = ftString
        ParamType = ptInput
        Size = 20
        Value = Null
      end
      item
        Name = 'IP_TIPO_SPED'
        DataType = ftSmallint
        ParamType = ptInput
      end>
  end
  object dspSelRC170_SPED: TDataSetProvider
    DataSet = fdqSelRC170_SPED
    Left = 450
    Top = 11
  end
  object cdsSelRC170_SPED: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSelRC170_SPED'
    Left = 558
    Top = 11
    object cdsSelRC170_SPEDOP_EMISSAO_DOCUMETO: TDateField
      FieldName = 'OP_EMISSAO_DOCUMETO'
    end
    object cdsSelRC170_SPEDOP_NUMERO_DOCUMENTO: TStringField
      FieldName = 'OP_NUMERO_DOCUMENTO'
      Size = 10
    end
    object cdsSelRC170_SPEDOP_MODELO_DOCUMENTO: TStringField
      FieldName = 'OP_MODELO_DOCUMENTO'
      Size = 2
    end
    object cdsSelRC170_SPEDOP_SERIE_DOCUMENTO: TStringField
      FieldName = 'OP_SERIE_DOCUMENTO'
      Size = 3
    end
    object cdsSelRC170_SPEDOP_NUM_ITEM: TSmallintField
      FieldName = 'OP_NUM_ITEM'
    end
    object cdsSelRC170_SPEDOP_COD_ITEM: TStringField
      FieldName = 'OP_COD_ITEM'
      Size = 60
    end
    object cdsSelRC170_SPEDOP_DESCRICAO_COMPLEMENTAR: TStringField
      FieldName = 'OP_DESCRICAO_COMPLEMENTAR'
      Size = 100
    end
    object cdsSelRC170_SPEDOP_QUANTIDADE: TBCDField
      FieldName = 'OP_QUANTIDADE'
      Precision = 18
      Size = 2
    end
    object cdsSelRC170_SPEDOP_UNIDADE: TStringField
      FieldName = 'OP_UNIDADE'
      Size = 6
    end
    object cdsSelRC170_SPEDOP_VALOR_ITEM: TBCDField
      FieldName = 'OP_VALOR_ITEM'
      Precision = 18
      Size = 2
    end
    object cdsSelRC170_SPEDOP_VALOR_DESCONTO: TBCDField
      FieldName = 'OP_VALOR_DESCONTO'
      Precision = 18
      Size = 2
    end
    object cdsSelRC170_SPEDOP_IND_MOVIMENTACAO: TStringField
      FieldName = 'OP_IND_MOVIMENTACAO'
      Size = 1
    end
    object cdsSelRC170_SPEDOP_CST_ICMS: TIntegerField
      FieldName = 'OP_CST_ICMS'
    end
    object cdsSelRC170_SPEDOP_CFOP: TStringField
      FieldName = 'OP_CFOP'
      Size = 4
    end
    object cdsSelRC170_SPEDOP_COD_NATUREZA: TStringField
      FieldName = 'OP_COD_NATUREZA'
      Size = 10
    end
    object cdsSelRC170_SPEDOP_VALOR_BASE_ICMS: TBCDField
      FieldName = 'OP_VALOR_BASE_ICMS'
      Precision = 18
      Size = 2
    end
    object cdsSelRC170_SPEDOP_ALIQUOTA_ICMS: TCurrencyField
      FieldName = 'OP_ALIQUOTA_ICMS'
    end
    object cdsSelRC170_SPEDOP_VALOR_ICMS: TBCDField
      FieldName = 'OP_VALOR_ICMS'
      Precision = 18
      Size = 2
    end
    object cdsSelRC170_SPEDOP_VALOR_BASE_CALCULO_ST: TBCDField
      FieldName = 'OP_VALOR_BASE_CALCULO_ST'
      Precision = 18
      Size = 2
    end
    object cdsSelRC170_SPEDOP_ALIQUOTA_ST: TBCDField
      FieldName = 'OP_ALIQUOTA_ST'
      Precision = 18
      Size = 2
    end
    object cdsSelRC170_SPEDOP_VALOR_ICMS_ST: TBCDField
      FieldName = 'OP_VALOR_ICMS_ST'
      Precision = 18
      Size = 2
    end
    object cdsSelRC170_SPEDOP_IND_APURACAO: TStringField
      FieldName = 'OP_IND_APURACAO'
      Size = 1
    end
    object cdsSelRC170_SPEDOP_CST_IPI: TStringField
      FieldName = 'OP_CST_IPI'
      Size = 10
    end
    object cdsSelRC170_SPEDOP_COD_ENQUADRAMENTO: TStringField
      FieldName = 'OP_COD_ENQUADRAMENTO'
      Size = 3
    end
    object cdsSelRC170_SPEDOP_VALOR_BASE_CALC_IPI: TBCDField
      FieldName = 'OP_VALOR_BASE_CALC_IPI'
      Precision = 18
      Size = 2
    end
    object cdsSelRC170_SPEDOP_ALIQUOTA_IPI: TCurrencyField
      FieldName = 'OP_ALIQUOTA_IPI'
    end
    object cdsSelRC170_SPEDOP_VALOR_IPI: TBCDField
      FieldName = 'OP_VALOR_IPI'
      Precision = 18
      Size = 2
    end
    object cdsSelRC170_SPEDOP_CST_PIS: TStringField
      FieldName = 'OP_CST_PIS'
      Size = 2
    end
    object cdsSelRC170_SPEDOP_VALOR_BASE_PIS: TBCDField
      FieldName = 'OP_VALOR_BASE_PIS'
      Precision = 18
      Size = 2
    end
    object cdsSelRC170_SPEDOP_P_ALIQUOTA_PIS: TBCDField
      FieldName = 'OP_P_ALIQUOTA_PIS'
      Precision = 18
    end
    object cdsSelRC170_SPEDOP_QUANT_BC_PIS: TBCDField
      FieldName = 'OP_QUANT_BC_PIS'
      Precision = 18
      Size = 3
    end
    object cdsSelRC170_SPEDOP_V_ALIQ_PIS: TBCDField
      FieldName = 'OP_V_ALIQ_PIS'
      Precision = 18
    end
    object cdsSelRC170_SPEDOP_VALOR_PIS: TBCDField
      FieldName = 'OP_VALOR_PIS'
      Precision = 18
      Size = 2
    end
    object cdsSelRC170_SPEDOP_CST_COFINS: TStringField
      FieldName = 'OP_CST_COFINS'
      Size = 2
    end
    object cdsSelRC170_SPEDOP_VALOR_BC_COFINS: TBCDField
      FieldName = 'OP_VALOR_BC_COFINS'
      Precision = 18
      Size = 2
    end
    object cdsSelRC170_SPEDOP_P_ALIQUOTA_COFINS: TBCDField
      FieldName = 'OP_P_ALIQUOTA_COFINS'
      Precision = 18
    end
    object cdsSelRC170_SPEDOP_QUANTIDADE_BC_COFINS: TBCDField
      FieldName = 'OP_QUANTIDADE_BC_COFINS'
      Precision = 18
      Size = 3
    end
    object cdsSelRC170_SPEDOP_V_ALIQUOTA_COFINS: TBCDField
      FieldName = 'OP_V_ALIQUOTA_COFINS'
      Precision = 18
    end
    object cdsSelRC170_SPEDOP_VALOR_COFINS: TBCDField
      FieldName = 'OP_VALOR_COFINS'
      Precision = 18
      Size = 2
    end
    object cdsSelRC170_SPEDOP_COD_CONTA_ANALITICA: TStringField
      FieldName = 'OP_COD_CONTA_ANALITICA'
      Size = 60
    end
    object cdsSelRC170_SPEDOP_CNPJ: TStringField
      FieldName = 'OP_CNPJ'
    end
    object cdsSelRC170_SPEDOP_TIPO_SPED: TSmallintField
      FieldName = 'OP_TIPO_SPED'
    end
    object cdsSelRC170_SPEDOP_TIPO_ITEM: TSmallintField
      FieldName = 'OP_TIPO_ITEM'
    end
    object cdsSelRC170_SPEDOP_NCM: TStringField
      FieldName = 'OP_NCM'
      Size = 10
    end
  end
  object fdqSelRC190_SPED: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      'select * from SELECIONAR_RC190_SPEDF(:IP_EMISSAO_ENTRADA,'
      '    :IP_NUMERO_DOCUMENTO, :IP_MODELO_DOCUMENTO,'
      '    :IP_SERIE_DOCUMENTO,:IP_CNPJ)')
    Left = 340
    Top = 57
    ParamData = <
      item
        Name = 'IP_EMISSAO_ENTRADA'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IP_NUMERO_DOCUMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Name = 'IP_MODELO_DOCUMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Name = 'IP_SERIE_DOCUMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 3
      end
      item
        Name = 'IP_CNPJ'
        DataType = ftString
        ParamType = ptInput
        Size = 20
        Value = Null
      end>
  end
  object dspSelRC190_SPED: TDataSetProvider
    DataSet = fdqSelRC190_SPED
    Left = 450
    Top = 57
  end
  object cdsSelRC190_SPED: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSelRC190_SPED'
    Left = 558
    Top = 57
    object cdsSelRC190_SPEDOP_CST_ICMS: TSmallintField
      FieldName = 'OP_CST_ICMS'
    end
    object cdsSelRC190_SPEDOP_CFOP: TStringField
      FieldName = 'OP_CFOP'
      Size = 4
    end
    object cdsSelRC190_SPEDOP_ALIQUOTA_ICMS: TBCDField
      FieldName = 'OP_ALIQUOTA_ICMS'
      Precision = 18
      Size = 2
    end
    object cdsSelRC190_SPEDOP_VALOR_OPERACAO: TBCDField
      FieldName = 'OP_VALOR_OPERACAO'
      Precision = 18
      Size = 2
    end
    object cdsSelRC190_SPEDOP_VALOR_BC_ICMS: TBCDField
      FieldName = 'OP_VALOR_BC_ICMS'
      Precision = 18
      Size = 2
    end
    object cdsSelRC190_SPEDOP_VALOR_ICMS: TBCDField
      FieldName = 'OP_VALOR_ICMS'
      Precision = 18
      Size = 2
    end
    object cdsSelRC190_SPEDOP_VALOR_BC_ICMS_ST: TBCDField
      FieldName = 'OP_VALOR_BC_ICMS_ST'
      Precision = 18
      Size = 2
    end
    object cdsSelRC190_SPEDOP_VALOR_ICMS_ST: TBCDField
      FieldName = 'OP_VALOR_ICMS_ST'
      Precision = 18
      Size = 2
    end
    object cdsSelRC190_SPEDOP_VALOR_RED_BC: TBCDField
      FieldName = 'OP_VALOR_RED_BC'
      Precision = 18
      Size = 2
    end
    object cdsSelRC190_SPEDOP_VALOR_IPI: TBCDField
      FieldName = 'OP_VALOR_IPI'
      Precision = 18
      Size = 2
    end
    object cdsSelRC190_SPEDOP_CODIGO_OBSERVACAO: TStringField
      FieldName = 'OP_CODIGO_OBSERVACAO'
      Size = 6
    end
  end
  object fdqSelRC405_SPED: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      'select * from SELECIONAR_RC405_SPEDF(:IP_DATA_INICIAL,'
      '    :IP_DATA_FINAL,:IP_SERIE_ECF)')
    Left = 340
    Top = 100
    ParamData = <
      item
        Name = 'IP_DATA_INICIAL'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IP_DATA_FINAL'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'IP_SERIE_ECF'
        ParamType = ptInput
      end>
  end
  object dspSelRC405_SPED: TDataSetProvider
    DataSet = fdqSelRC405_SPED
    Left = 450
    Top = 100
  end
  object cdsSelRC405_SPED: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSelRC405_SPED'
    Left = 558
    Top = 100
    object cdsSelRC405_SPEDOP_DATA_EMISSAO: TDateField
      FieldName = 'OP_DATA_EMISSAO'
    end
    object cdsSelRC405_SPEDOP_CRO: TIntegerField
      FieldName = 'OP_CRO'
    end
    object cdsSelRC405_SPEDOP_CRZ: TIntegerField
      FieldName = 'OP_CRZ'
    end
    object cdsSelRC405_SPEDOP_NUM_COO_FINAL: TIntegerField
      FieldName = 'OP_NUM_COO_FINAL'
    end
    object cdsSelRC405_SPEDOP_GT_FINAL: TBCDField
      FieldName = 'OP_GT_FINAL'
      Precision = 18
      Size = 2
    end
    object cdsSelRC405_SPEDOP_VALOR_VENDA_BRUTA: TBCDField
      FieldName = 'OP_VALOR_VENDA_BRUTA'
      Precision = 18
      Size = 2
    end
    object cdsSelRC405_SPEDOP_SERIE_ECF: TStringField
      FieldName = 'OP_SERIE_ECF'
    end
  end
  object fdqSelRC410_SPED: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      'select * from SELECIONAR_RC410_SPEDF(:IP_DATA_EMISSAO,'
      '    :IP_SERIE_ECF)')
    Left = 340
    Top = 144
    ParamData = <
      item
        Name = 'IP_DATA_EMISSAO'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IP_SERIE_ECF'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end>
  end
  object dspSelRC410_SPED: TDataSetProvider
    DataSet = fdqSelRC410_SPED
    Left = 450
    Top = 144
  end
  object cdsSelRC410_SPED: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSelRC410_SPED'
    Left = 558
    Top = 144
    object cdsSelRC410_SPEDOP_DATA_EMISSAO: TDateField
      FieldName = 'OP_DATA_EMISSAO'
    end
    object cdsSelRC410_SPEDOP_VALOR_PIS: TBCDField
      FieldName = 'OP_VALOR_PIS'
      Precision = 18
      Size = 2
    end
    object cdsSelRC410_SPEDOP_VALOR_COFINS: TBCDField
      FieldName = 'OP_VALOR_COFINS'
      Precision = 18
      Size = 2
    end
    object cdsSelRC410_SPEDOP_SERIE_ECF: TStringField
      FieldName = 'OP_SERIE_ECF'
    end
  end
  object fdqSelRC420_SPED: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      'select * from SELECIONAR_RC420_SPEDF(:IP_DATA_EMISSAO,'
      '                            :IP_SERIE_ECF)')
    Left = 340
    Top = 187
    ParamData = <
      item
        Name = 'IP_DATA_EMISSAO'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IP_SERIE_ECF'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end>
  end
  object dspSelRC420_SPED: TDataSetProvider
    DataSet = fdqSelRC420_SPED
    Left = 450
    Top = 187
  end
  object cdsSelRC420_SPED: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSelRC420_SPED'
    Left = 558
    Top = 187
    object cdsSelRC420_SPEDOP_COD_TOTALIZADOR: TStringField
      FieldName = 'OP_COD_TOTALIZADOR'
      Size = 10
    end
    object cdsSelRC420_SPEDOP_NUMERO_TOTALIZADOR: TSmallintField
      FieldName = 'OP_NUMERO_TOTALIZADOR'
    end
    object cdsSelRC420_SPEDOP_DESCRICAO_TOTALIZADOR: TMemoField
      FieldName = 'OP_DESCRICAO_TOTALIZADOR'
      BlobType = ftMemo
    end
    object cdsSelRC420_SPEDOP_VALOR_ACUMULADO: TBCDField
      FieldName = 'OP_VALOR_ACUMULADO'
      Precision = 18
      Size = 2
    end
  end
  object fdqSelRC425_SPED: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      'select * from SELECIONAR_RC425_SPED(:IP_DATA_EMISSAO,'
      '              :IP_CODIGO_TOT_PARCIAL,'
      '              :IP_SERIE_ECF)')
    Left = 340
    Top = 232
    ParamData = <
      item
        Name = 'IP_DATA_EMISSAO'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IP_CODIGO_TOT_PARCIAL'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Name = 'IP_SERIE_ECF'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end>
  end
  object dspSelRC425_SPED: TDataSetProvider
    DataSet = fdqSelRC425_SPED
    Left = 450
    Top = 232
  end
  object cdsSelRC425_SPED: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSelRC425_SPED'
    Left = 558
    Top = 232
    object cdsSelRC425_SPEDOP_CODIGO_ITEM: TStringField
      FieldName = 'OP_CODIGO_ITEM'
      Size = 60
    end
    object cdsSelRC425_SPEDOP_UNIDADE: TStringField
      FieldName = 'OP_UNIDADE'
      Size = 6
    end
    object cdsSelRC425_SPEDOP_QUANTIDADE: TBCDField
      FieldName = 'OP_QUANTIDADE'
      Precision = 18
      Size = 3
    end
    object cdsSelRC425_SPEDOP_VALOR_ITEM: TBCDField
      FieldName = 'OP_VALOR_ITEM'
      Precision = 18
      Size = 2
    end
    object cdsSelRC425_SPEDOP_VALOR_PIS: TBCDField
      FieldName = 'OP_VALOR_PIS'
      Precision = 18
      Size = 2
    end
    object cdsSelRC425_SPEDOP_VALOR_COFINS: TBCDField
      FieldName = 'OP_VALOR_COFINS'
      Precision = 18
      Size = 2
    end
  end
  object fdqSelRC460_SPED: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      'select * from SELECIONAR_RC460_SPEDF(:IP_DATA_DOCUMENTO,'
      '    :IP_SERIE_ECF)')
    Left = 340
    Top = 278
    ParamData = <
      item
        Name = 'IP_DATA_DOCUMENTO'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IP_SERIE_ECF'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end>
  end
  object dspSelRC460_SPED: TDataSetProvider
    DataSet = fdqSelRC460_SPED
    Left = 450
    Top = 278
  end
  object cdsSelRC460_SPED: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSelRC460_SPED'
    Left = 558
    Top = 278
    object cdsSelRC460_SPEDOP_CODIGO_MODELO: TStringField
      FieldName = 'OP_CODIGO_MODELO'
      Size = 2
    end
    object cdsSelRC460_SPEDOP_SITUACAO_DOCUMENTO: TSmallintField
      FieldName = 'OP_SITUACAO_DOCUMENTO'
    end
    object cdsSelRC460_SPEDOP_NUMERO_DOCUMENTO: TStringField
      FieldName = 'OP_NUMERO_DOCUMENTO'
      Size = 10
    end
    object cdsSelRC460_SPEDOP_DATA_DOCUMENTO: TDateField
      FieldName = 'OP_DATA_DOCUMENTO'
    end
    object cdsSelRC460_SPEDOP_VALOR_DOCUMENTO: TBCDField
      FieldName = 'OP_VALOR_DOCUMENTO'
      Precision = 18
      Size = 2
    end
    object cdsSelRC460_SPEDOP_VALOR_PIS: TBCDField
      FieldName = 'OP_VALOR_PIS'
      Precision = 18
      Size = 2
    end
    object cdsSelRC460_SPEDOP_VALOR_COFINS: TBCDField
      FieldName = 'OP_VALOR_COFINS'
      Precision = 18
      Size = 2
    end
    object cdsSelRC460_SPEDOP_NOME_ADQUIRENTE: TStringField
      FieldName = 'OP_NOME_ADQUIRENTE'
      Size = 60
    end
    object cdsSelRC460_SPEDOP_SERIE_ECF: TStringField
      FieldName = 'OP_SERIE_ECF'
    end
    object cdsSelRC460_SPEDOP_CNPJ: TStringField
      FieldName = 'OP_CNPJ'
      Size = 14
    end
  end
  object fdqSelRC470_SPED: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      'select * from  SELECIONAR_RC470_SPEDF(:IP_DATA_EMISSAO,'
      '      :IP_SERIE_ECF,:IP_NUMERO_CUPOM)')
    Left = 340
    Top = 321
    ParamData = <
      item
        Name = 'IP_DATA_EMISSAO'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IP_SERIE_ECF'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Name = 'IP_NUMERO_CUPOM'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end>
  end
  object dspSelRC470_SPED: TDataSetProvider
    DataSet = fdqSelRC470_SPED
    Left = 450
    Top = 321
  end
  object cdsSelRC470_SPED: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSelRC470_SPED'
    Left = 558
    Top = 321
    object cdsSelRC470_SPEDOP_CODIGO_ITEM: TStringField
      FieldName = 'OP_CODIGO_ITEM'
      Size = 60
    end
    object cdsSelRC470_SPEDOP_QUANTIDADE: TBCDField
      FieldName = 'OP_QUANTIDADE'
      Precision = 18
      Size = 3
    end
    object cdsSelRC470_SPEDOP_QUANTIDADE_CANCELADA: TBCDField
      FieldName = 'OP_QUANTIDADE_CANCELADA'
      Precision = 18
      Size = 3
    end
    object cdsSelRC470_SPEDOP_UNIDADE: TStringField
      FieldName = 'OP_UNIDADE'
      Size = 10
    end
    object cdsSelRC470_SPEDOP_VALOR_ITEM: TBCDField
      FieldName = 'OP_VALOR_ITEM'
      Precision = 18
      Size = 2
    end
    object cdsSelRC470_SPEDOP_CST_ICMS: TSmallintField
      FieldName = 'OP_CST_ICMS'
    end
    object cdsSelRC470_SPEDOP_CFOP: TStringField
      FieldName = 'OP_CFOP'
      Size = 4
    end
    object cdsSelRC470_SPEDOP_ALIQUOTA_ICMS: TBCDField
      FieldName = 'OP_ALIQUOTA_ICMS'
      Precision = 18
      Size = 2
    end
    object cdsSelRC470_SPEDOP_VALOR_PIS: TBCDField
      FieldName = 'OP_VALOR_PIS'
      Precision = 18
      Size = 2
    end
    object cdsSelRC470_SPEDOP_VALOR_COFINS: TBCDField
      FieldName = 'OP_VALOR_COFINS'
      Precision = 18
      Size = 2
    end
    object cdsSelRC470_SPEDOP_DESCRICAO: TStringField
      FieldName = 'OP_DESCRICAO'
      Size = 60
    end
    object cdsSelRC470_SPEDOP_TIPO_ITEM: TSmallintField
      FieldName = 'OP_TIPO_ITEM'
    end
    object cdsSelRC470_SPEDOP_NCM: TStringField
      FieldName = 'OP_NCM'
      Size = 10
    end
  end
  object fdqSelRD100_SPED: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      'select * from   SELECIONAR_RD100_SPEDF(:IP_DATA_INICIAL,'
      '                      :IP_DATA_FINAL)')
    Left = 340
    Top = 365
    ParamData = <
      item
        Name = 'IP_DATA_INICIAL'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IP_DATA_FINAL'
        DataType = ftDate
        ParamType = ptInput
      end>
  end
  object dspSelRD100_SPED: TDataSetProvider
    DataSet = fdqSelRD100_SPED
    Left = 450
    Top = 365
  end
  object cdsSelRD100_SPED: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSelRD100_SPED'
    Left = 558
    Top = 365
    object cdsSelRD100_SPEDOP_IND_OPERACAO: TStringField
      FieldName = 'OP_IND_OPERACAO'
      Size = 1
    end
    object cdsSelRD100_SPEDOP_IND_EMITENTE: TStringField
      FieldName = 'OP_IND_EMITENTE'
      Size = 1
    end
    object cdsSelRD100_SPEDOP_CODIGO_PARTICIPANTE: TStringField
      FieldName = 'OP_CODIGO_PARTICIPANTE'
      Size = 60
    end
    object cdsSelRD100_SPEDOP_CODIGO_MODELO: TStringField
      FieldName = 'OP_CODIGO_MODELO'
      Size = 2
    end
    object cdsSelRD100_SPEDOP_CODIGO_SITUACAO: TSmallintField
      FieldName = 'OP_CODIGO_SITUACAO'
    end
    object cdsSelRD100_SPEDOP_SERIE: TStringField
      FieldName = 'OP_SERIE'
      Size = 4
    end
    object cdsSelRD100_SPEDOP_SUB_SERIE: TStringField
      FieldName = 'OP_SUB_SERIE'
      Size = 3
    end
    object cdsSelRD100_SPEDOP_NUM_DOCUMENTO: TStringField
      FieldName = 'OP_NUM_DOCUMENTO'
      Size = 10
    end
    object cdsSelRD100_SPEDOP_CHAVE_CTE: TStringField
      FieldName = 'OP_CHAVE_CTE'
      Size = 44
    end
    object cdsSelRD100_SPEDOP_DATA_DOCUMENTO: TDateField
      FieldName = 'OP_DATA_DOCUMENTO'
    end
    object cdsSelRD100_SPEDOP_DATA_AQUISICAO: TDateField
      FieldName = 'OP_DATA_AQUISICAO'
    end
    object cdsSelRD100_SPEDOP_TIPO_CTE: TSmallintField
      FieldName = 'OP_TIPO_CTE'
    end
    object cdsSelRD100_SPEDOP_CHAVE_REFERENCIA: TStringField
      FieldName = 'OP_CHAVE_REFERENCIA'
      Size = 44
    end
    object cdsSelRD100_SPEDOP_VALOR_DOCUMENTO: TBCDField
      FieldName = 'OP_VALOR_DOCUMENTO'
      Precision = 18
      Size = 2
    end
    object cdsSelRD100_SPEDOP_VALOR_DESCONTO: TBCDField
      FieldName = 'OP_VALOR_DESCONTO'
      Precision = 18
      Size = 2
    end
    object cdsSelRD100_SPEDOP_INDICE_FRETE: TSmallintField
      FieldName = 'OP_INDICE_FRETE'
    end
    object cdsSelRD100_SPEDOP_VALOR_SERVICO: TBCDField
      FieldName = 'OP_VALOR_SERVICO'
      Precision = 18
      Size = 2
    end
    object cdsSelRD100_SPEDOP_VALOR_BC_ICMS: TBCDField
      FieldName = 'OP_VALOR_BC_ICMS'
      Precision = 18
      Size = 2
    end
    object cdsSelRD100_SPEDOP_VALOR_ICMS: TBCDField
      FieldName = 'OP_VALOR_ICMS'
      Precision = 18
      Size = 2
    end
    object cdsSelRD100_SPEDOP_VALOR_NT: TBCDField
      FieldName = 'OP_VALOR_NT'
      Precision = 18
      Size = 2
    end
    object cdsSelRD100_SPEDOP_CODIGO_INFORMACAO: TStringField
      FieldName = 'OP_CODIGO_INFORMACAO'
      Size = 10
    end
    object cdsSelRD100_SPEDOP_CODIGO_CONTA_ANALITICA: TStringField
      FieldName = 'OP_CODIGO_CONTA_ANALITICA'
      Size = 60
    end
  end
  object fdqSelAdmCartao: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      'select * from administradoras where administradora in'
      
        '(select administradora from controlecartaoticket where emissao b' +
        'etween '
      '   :ip_data_Inicial and :ip_data_final)')
    Left = 735
    Top = 140
    ParamData = <
      item
        Name = 'IP_DATA_INICIAL'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IP_DATA_FINAL'
        DataType = ftDate
        ParamType = ptInput
      end>
    object fdqSelAdmCartaoADMINISTRADORA: TIntegerField
      FieldName = 'ADMINISTRADORA'
      Origin = 'ADMINISTRADORA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object fdqSelAdmCartaoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 40
    end
    object fdqSelAdmCartaoDESCONTO: TBCDField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      Required = True
      Precision = 18
      Size = 2
    end
    object fdqSelAdmCartaoPRAZO: TSmallintField
      FieldName = 'PRAZO'
      Origin = 'PRAZO'
      Required = True
    end
    object fdqSelAdmCartaoBANCO: TIntegerField
      FieldName = 'BANCO'
      Origin = 'BANCO'
    end
    object fdqSelAdmCartaoAGENCIA: TStringField
      FieldName = 'AGENCIA'
      Origin = 'AGENCIA'
      Size = 10
    end
    object fdqSelAdmCartaoCONTA: TStringField
      FieldName = 'CONTA'
      Origin = 'CONTA'
      Size = 15
    end
    object fdqSelAdmCartaoCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Required = True
    end
    object fdqSelAdmCartaoCOD_REDE: TStringField
      FieldName = 'COD_REDE'
      Origin = 'COD_REDE'
      Required = True
      Size = 10
    end
    object fdqSelAdmCartaoCOD_BANDEIRA: TStringField
      FieldName = 'COD_BANDEIRA'
      Origin = 'COD_BANDEIRA'
      Required = True
      Size = 10
    end
  end
  object fdqSelInventario: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      
        'select DATA, INVENTARIO, COALESCE(VALORLIQUIDODOINVENTARIO,0) AS' +
        ' TOTAL_INV, '
      'MOTIVO_INVENTARIO FROM inventario WHERE status = 1'
      'and ANODEREFERENCIA = :IP_ANO')
    Left = 735
    Top = 196
    ParamData = <
      item
        Name = 'IP_ANO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object fdqSelInventarioDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
      Required = True
    end
    object fdqSelInventarioINVENTARIO: TIntegerField
      FieldName = 'INVENTARIO'
      Origin = 'INVENTARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object fdqSelInventarioTOTAL_INV: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TOTAL_INV'
      Origin = 'TOTAL_INV'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object fdqSelInventarioMOTIVO_INVENTARIO: TSmallintField
      FieldName = 'MOTIVO_INVENTARIO'
      Origin = 'MOTIVO_INVENTARIO'
      Required = True
    end
  end
  object fdqSelItemInventario: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      
        'SELECT IV.*, PRO.DESCRICAO,PRO.unidade, PRO.TIPO_ITEM, PRO.TRIBU' +
        'TACAO, '
      'PRO.NCM, ALIQ.ALIQUOTA FROM ITEMINVENTARIO IV'
      'JOIN PRODUTO PRO'
      'ON(PRO.produto = IV.produto)'
      'JOIN ALIQUOTAS ALIQ'
      'ON(ALIQ.TRIBUTACAO = PRO.TRIBUTACAO)'
      ''
      'WHERE IV.INVENTARIO = :IP_INVENTARIO'
      'AND IV.QUANTIDADE > 0 AND IV.PRECODECUSTO > 0'
      'ORDER BY IV.PRODUTO')
    Left = 340
    Top = 412
    ParamData = <
      item
        Name = 'IP_INVENTARIO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object dspSelItemInventario: TDataSetProvider
    DataSet = fdqSelItemInventario
    Left = 450
    Top = 411
  end
  object cdsSelItemInventario: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSelItemInventario'
    Left = 558
    Top = 411
    object cdsSelItemInventarioITEMINVENTARIO: TIntegerField
      FieldName = 'ITEMINVENTARIO'
      Required = True
    end
    object cdsSelItemInventarioINVENTARIO: TIntegerField
      FieldName = 'INVENTARIO'
      Required = True
    end
    object cdsSelItemInventarioEAN: TStringField
      FieldName = 'EAN'
      Required = True
      Size = 14
    end
    object cdsSelItemInventarioPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Required = True
    end
    object cdsSelItemInventarioQUANTIDADE: TBCDField
      FieldName = 'QUANTIDADE'
      Required = True
      Precision = 18
      Size = 3
    end
    object cdsSelItemInventarioPRECODECUSTO: TBCDField
      FieldName = 'PRECODECUSTO'
      Required = True
      Precision = 18
    end
    object cdsSelItemInventarioDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ReadOnly = True
      Size = 40
    end
    object cdsSelItemInventarioUNIDADE: TStringField
      FieldName = 'UNIDADE'
      ReadOnly = True
      FixedChar = True
      Size = 2
    end
    object cdsSelItemInventarioTIPO_ITEM: TSmallintField
      FieldName = 'TIPO_ITEM'
      ReadOnly = True
    end
    object cdsSelItemInventarioTRIBUTACAO: TIntegerField
      FieldName = 'TRIBUTACAO'
      ReadOnly = True
    end
    object cdsSelItemInventarioNCM: TStringField
      FieldName = 'NCM'
      ReadOnly = True
      Size = 15
    end
    object cdsSelItemInventarioALIQUOTA: TBCDField
      FieldName = 'ALIQUOTA'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
  end
  object fdqSelNF_Referencia: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      'select * from notas_referencia'
      'where notafiscal= :ip_notafiscal'
      'and cnpj_fornecedor = :ip_cnpj'
      'and modelo = :ip_modelo')
    Left = 342
    Top = 457
    ParamData = <
      item
        Name = 'IP_NOTAFISCAL'
        ParamType = ptInput
      end
      item
        Name = 'IP_CNPJ'
        ParamType = ptInput
      end
      item
        Name = 'IP_MODELO'
        ParamType = ptInput
      end>
  end
  object dspSelNF_Referencia: TDataSetProvider
    DataSet = fdqSelNF_Referencia
    Left = 453
    Top = 457
  end
  object cdsSelNF_Referencia: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSelNF_Referencia'
    Left = 561
    Top = 457
    object cdsSelNF_ReferenciaNF_SAIDA: TIntegerField
      FieldName = 'NF_SAIDA'
      Required = True
    end
    object cdsSelNF_ReferenciaMODELO_NF_SAIDA: TStringField
      FieldName = 'MODELO_NF_SAIDA'
      Required = True
      Size = 10
    end
    object cdsSelNF_ReferenciaSERIE_NF_SAIDA: TStringField
      FieldName = 'SERIE_NF_SAIDA'
      Required = True
      Size = 10
    end
    object cdsSelNF_ReferenciaCNPJ_NF_SAIDA: TStringField
      FieldName = 'CNPJ_NF_SAIDA'
      Required = True
    end
    object cdsSelNF_ReferenciaNOTAFISCAL: TStringField
      FieldName = 'NOTAFISCAL'
      Required = True
    end
    object cdsSelNF_ReferenciaMODELO: TStringField
      FieldName = 'MODELO'
      Required = True
      Size = 10
    end
    object cdsSelNF_ReferenciaCNPJ_FORNECEDOR: TStringField
      FieldName = 'CNPJ_FORNECEDOR'
      Required = True
    end
    object cdsSelNF_ReferenciaCHAVE_NF_REFERENCIA: TStringField
      FieldName = 'CHAVE_NF_REFERENCIA'
      Required = True
      Size = 200
    end
    object cdsSelNF_ReferenciaSERIE_NF: TIntegerField
      FieldName = 'SERIE_NF'
    end
    object cdsSelNF_ReferenciaANO_MES_EMISSAO: TStringField
      FieldName = 'ANO_MES_EMISSAO'
      Size = 10
    end
    object cdsSelNF_ReferenciaUF_NF_REFERENCIA: TIntegerField
      FieldName = 'UF_NF_REFERENCIA'
    end
    object cdsSelNF_ReferenciaEMISSAO_NF_REFERENCIA: TDateField
      FieldName = 'EMISSAO_NF_REFERENCIA'
    end
    object cdsSelNF_ReferenciaINDICADOR_EMITENTE: TSmallintField
      FieldName = 'INDICADOR_EMITENTE'
      Required = True
    end
    object cdsSelNF_ReferenciaINDICADOR_OPERACAO: TSmallintField
      FieldName = 'INDICADOR_OPERACAO'
      Required = True
    end
  end
end
