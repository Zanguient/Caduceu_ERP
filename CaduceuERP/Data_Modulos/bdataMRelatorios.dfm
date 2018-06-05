object dmRelatorios: TdmRelatorios
  OldCreateOrder = False
  Height = 619
  Width = 893
  object sqqProdutoPIS_COFINS: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDateTime
        Name = 'IP_DATA_INICIO'
        ParamType = ptInput
        Value = 40695d
      end
      item
        DataType = ftDateTime
        Name = 'IP_DATA_FIM'
        ParamType = ptInput
        Value = 40724d
      end
      item
        DataType = ftInteger
        Name = 'IP_LEI_PIS_COFINS'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'IP_FILIAL'
        ParamType = ptInput
        Value = 1
      end>
    SQL.Strings = (
      
        'SELECT * FROM SELECIONAR_PRODUTO_PIS_COFINS(:IP_DATA_INICIO, :IP' +
        '_DATA_FIM,'
      '    :IP_LEI_PIS_COFINS, :IP_FILIAL)')
    Left = 584
    Top = 264
  end
  object cdsVendaPisCofins: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 386
    Top = 320
    object cdsVendaPisCofinsPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
    end
    object cdsVendaPisCofinsDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object cdsVendaPisCofinsUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 2
    end
    object cdsVendaPisCofinsQUANTIDADE_ENTRADA: TFloatField
      FieldName = 'QUANTIDADE_ENTRADA'
      DisplayFormat = '#,##0.000'
    end
    object cdsVendaPisCofinsVALOR_ENTRADA: TCurrencyField
      FieldName = 'VALOR_ENTRADA'
      DisplayFormat = '#,##0.00'
      currency = False
    end
    object cdsVendaPisCofinsQUANTIDADE_SAIDA: TFloatField
      FieldName = 'QUANTIDADE_SAIDA'
      DisplayFormat = '#,##0.000'
    end
    object cdsVendaPisCofinsVALOR_SAIDA: TCurrencyField
      FieldName = 'VALOR_SAIDA'
      DisplayFormat = '#,##0.00'
      currency = False
    end
    object cdsVendaPisCofinsLEI_PIS_COFINS: TIntegerField
      FieldName = 'LEI_PIS_COFINS'
    end
    object cdsVendaPisCofinsDESCRICAO_LEI_PIS_COFINS: TStringField
      FieldName = 'DESCRICAO_LEI_PIS_COFINS'
      Size = 60
    end
  end
  object dtsVendaPisCofins: TDataSource
    DataSet = cdsVendaPisCofins
    Left = 502
    Top = 352
  end
  object fdqInventario: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      'select * from inventario')
    Left = 56
    Top = 16
  end
  object sqqRegInventario: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    Left = 584
    Top = 360
  end
  object fdqRegInventarioP7: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      
        'SELECT INVENTARIO.anodereferencia, INVENTARIO.tipocustoinventari' +
        'o, INVENTARIO.valorliquidodoinventario,'
      
        'INVENTARIO.numero_ordem, iteminventario.quantidade, iteminventar' +
        'io.precodecusto,'
      
        '(iteminventario.precodecusto * iteminventario.quantidade) subtot' +
        'al,'
      
        'produto.descricao as descricao_produto, produto.unidade, produto' +
        '.tributacao,'
      
        'aliquotas.nome as descricao_tributacao, iteminventario.produto f' +
        'rom inventario'
      'join iteminventario iteminventario'
      'on(iteminventario.inventario = inventario.inventario)'
      'join produto produto'
      'on(produto.produto = iteminventario.produto)'
      'join aliquotas aliquotas'
      'on(aliquotas.tributacao = produto.tributacao)')
    Left = 56
    Top = 64
  end
  object fdqApoioEFDContr: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      
        'SELECT PRODUTO, DESCRICAO, UNIDADE, NCM, cst_pis as cst_pis_s, c' +
        'st_cofins as cst_cofins_s,'
      
        'cst_pis_entrada, cst_cofins_entrada, aliquota_pis as aliq_pis_s,' +
        ' aliquota_cofins as aliq_cofins_s,'
      
        'aliquota_pis_entrada, aliquota_cofins_entrada, natureza_receita,' +
        ' CODIGO_CREDITO_PIS_COFINS FROM PRODUTO')
    Left = 56
    Top = 114
    object fdqApoioEFDContrPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object fdqApoioEFDContrDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 100
    end
    object fdqApoioEFDContrUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      FixedChar = True
      Size = 2
    end
    object fdqApoioEFDContrNCM: TStringField
      FieldName = 'NCM'
      Origin = 'NCM'
      Size = 15
    end
    object fdqApoioEFDContrCST_PIS_S: TIntegerField
      FieldName = 'CST_PIS_S'
      Origin = 'CST_PIS'
    end
    object fdqApoioEFDContrCST_COFINS_S: TIntegerField
      FieldName = 'CST_COFINS_S'
      Origin = 'CST_COFINS'
    end
    object fdqApoioEFDContrCST_PIS_ENTRADA: TIntegerField
      FieldName = 'CST_PIS_ENTRADA'
      Origin = 'CST_PIS_ENTRADA'
    end
    object fdqApoioEFDContrCST_COFINS_ENTRADA: TIntegerField
      FieldName = 'CST_COFINS_ENTRADA'
      Origin = 'CST_COFINS_ENTRADA'
    end
    object fdqApoioEFDContrALIQ_PIS_S: TBCDField
      FieldName = 'ALIQ_PIS_S'
      Origin = 'ALIQUOTA_PIS'
      Required = True
      Precision = 18
    end
    object fdqApoioEFDContrALIQ_COFINS_S: TBCDField
      FieldName = 'ALIQ_COFINS_S'
      Origin = 'ALIQUOTA_COFINS'
      Required = True
      Precision = 18
    end
    object fdqApoioEFDContrALIQUOTA_PIS_ENTRADA: TFMTBCDField
      FieldName = 'ALIQUOTA_PIS_ENTRADA'
      Origin = 'ALIQUOTA_PIS_ENTRADA'
      Required = True
      Precision = 18
      Size = 5
    end
    object fdqApoioEFDContrALIQUOTA_COFINS_ENTRADA: TFMTBCDField
      FieldName = 'ALIQUOTA_COFINS_ENTRADA'
      Origin = 'ALIQUOTA_COFINS_ENTRADA'
      Required = True
      Precision = 18
      Size = 5
    end
    object fdqApoioEFDContrNATUREZA_RECEITA: TIntegerField
      FieldName = 'NATUREZA_RECEITA'
      Origin = 'NATUREZA_RECEITA'
    end
    object fdqApoioEFDContrCODIGO_CREDITO_PIS_COFINS: TIntegerField
      FieldName = 'CODIGO_CREDITO_PIS_COFINS'
      Origin = 'CODIGO_CREDITO_PIS_COFINS'
    end
  end
  object fdqPromocao: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      'select prom.*, pro.descricao from promocao prom'
      'join produto pro'
      'on(pro.produto = prom.produto)'
      'where prom.status = 1'
      'order by pro.descricao')
    Left = 56
    Top = 162
  end
  object fdqApoioInventario: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      
        'SELECT PRO.PRODUTO, PRO.DESCRICAO, PRO.UNIDADE, (select custoliq' +
        'uido from produtofilial where produto = pro.produto and filial =' +
        ' 1),'
      
        '(select deposito from produtofilial where produto = pro.produto ' +
        'and filial = 1),'
      
        '(select loja from produtofilial where produto = pro.produto and ' +
        'filial = 1)'
      ' FROM PRODUTO PRO')
    Left = 56
    Top = 210
  end
  object fdqVendaRankingGrupo: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      
        'SELECT * FROM RVENDA_RANKING_PRO_GRUPO(:IP_DATA_INICIAL, :IP_DAT' +
        'A_FINAL, :IP_GRUPO,:IP_TIPO_RANKING)')
    Left = 160
    Top = 18
    ParamData = <
      item
        Name = 'IP_DATA_INICIAL'
        DataType = ftDate
        FDDataType = dtDate
        ParamType = ptInput
        Value = '01/09/14'
      end
      item
        Name = 'IP_DATA_FINAL'
        DataType = ftDate
        FDDataType = dtDate
        ParamType = ptInput
        Value = '21/10/14'
      end
      item
        Name = 'IP_GRUPO'
        DataType = ftInteger
        FDDataType = dtInt16
        ParamType = ptInput
        Value = '-1'
      end
      item
        Name = 'IP_TIPO_RANKING'
        DataType = ftInteger
        FDDataType = dtInt16
        ParamType = ptInput
        Value = '0'
      end>
  end
  object fdqVendaProdutoCFOP: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      
        'select pro.produto, pro.descricao, pro.unidade, sum(mov.quantida' +
        'desaida) as tot_quantidade, mov.cfop, cfop.descricao nome_cfop,'
      
        'sum(mov.subtotalsaida) as sub_total,(sum(mov.subtotalsaida) / su' +
        'm(mov.quantidadesaida)) as vl_medio from movimento mov'
      '        '
      'join produto pro'
      'on pro.produto = mov.produto'
      ''
      'left join cfop cfop'
      'on cfop.cfop = mov.cfop'
      ''
      'where mov.data between :ip_data_inicial and :ip_data_final'
      'and mov.subtotalsaida > 0'
      ''
      
        'group by mov.cfop, pro.descricao, pro.produto, pro.unidade, cfop' +
        '.descricao'
      ''
      'order by mov.cfop, pro.descricao')
    Left = 56
    Top = 258
    ParamData = <
      item
        Name = 'IP_DATA_INICIAL'
        DataType = ftDate
        FDDataType = dtDate
        ParamType = ptInput
        Value = 41883d
      end
      item
        Name = 'IP_DATA_FINAL'
        DataType = ftDate
        FDDataType = dtDate
        ParamType = ptInput
        Value = '21/10/14'
      end>
  end
  object fdqCompraProdCFOP: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      
        'select pro.produto, pro.descricao, pro.unidade, sum(mov.quantida' +
        'deentrada) as tot_quantidade, mov.cfop, cfop.descricao nome_cfop' +
        ','
      
        'sum(mov.subtotalentrada) as sub_total,(sum(mov.subtotalentrada) ' +
        '/ sum(mov.quantidadeentrada)) as vl_medio from movimento mov'
      '        '
      'join produto pro'
      'on pro.produto = mov.produto'
      ''
      'left join cfop cfop'
      'on cfop.cfop = mov.cfop'
      ''
      'where mov.data between :ip_data_inicial and :ip_data_final'
      'and mov.subtotalentrada > 0'
      ''
      
        'group by mov.cfop, pro.descricao, pro.produto, pro.unidade, cfop' +
        '.descricao'
      ''
      'order by mov.cfop, pro.descricao')
    Left = 56
    Top = 306
    ParamData = <
      item
        Name = 'IP_DATA_INICIAL'
        DataType = ftDate
        FDDataType = dtDate
        ParamType = ptInput
        Value = 41883d
      end
      item
        Name = 'IP_DATA_FINAL'
        DataType = ftDate
        FDDataType = dtDate
        ParamType = ptInput
        Value = '21/10/14'
      end>
  end
  object dspRequisicaoPecaOS: TDataSetProvider
    DataSet = dmDBEXMaster.fdqItens_OS_Pecas
    Left = 56
    Top = 352
  end
  object cdsRequisicaoPecaOS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRequisicaoPecaOS'
    Left = 166
    Top = 352
    object cdsRequisicaoPecaOSCODIGO_PECA: TIntegerField
      FieldName = 'CODIGO_PECA'
    end
    object cdsRequisicaoPecaOSDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 200
    end
    object cdsRequisicaoPecaOSQUANTIDADE: TBCDField
      FieldName = 'QUANTIDADE'
      Required = True
      DisplayFormat = '#,##0.000'
      Precision = 18
      Size = 3
    end
  end
  object fdqMovCompraProd: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      
        'SELECT * FROM RMOVIMENTO_ENTRADA_PRODUTO(:IP_DATA_INICIAL, :IP_D' +
        'ATA_FINAL,:IP_FORNECEDOR)')
    Left = 160
    Top = 210
    ParamData = <
      item
        Name = 'IP_DATA_INICIAL'
        DataType = ftDate
        FDDataType = dtDate
        ParamType = ptInput
        Value = 41883d
      end
      item
        Name = 'IP_DATA_FINAL'
        DataType = ftDate
        FDDataType = dtDate
        ParamType = ptInput
        Value = '21/10/14'
      end
      item
        Name = 'IP_FORNECEDOR'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object fdqMovVendaProd: TFDQuery
    Connection = dmDBEXMaster.fdcMaster
    SQL.Strings = (
      
        'SELECT * FROM RMOVIMENTO_SAIDA_PRODUTO(:IP_DATA_INICIAL, :IP_DAT' +
        'A_FINAL,:IP_FORNECEDOR)')
    Left = 160
    Top = 258
    ParamData = <
      item
        Name = 'IP_DATA_INICIAL'
        DataType = ftDate
        FDDataType = dtDate
        ParamType = ptInput
        Value = 41883d
      end
      item
        Name = 'IP_DATA_FINAL'
        DataType = ftDate
        FDDataType = dtDate
        ParamType = ptInput
        Value = '21/10/14'
      end
      item
        Name = 'IP_FORNECEDOR'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object rvpGenesisAC: TRvProject
    Left = 368
    Top = 80
  end
  object rvdOrdemServico: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    Left = 704
    Top = 88
  end
  object rvdItensServicoOS: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    Left = 704
    Top = 152
  end
  object rvdIrtensPecaOS: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    Left = 704
    Top = 216
  end
  object RvDataSetConnection4: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    Left = 720
    Top = 272
  end
  object rvdPerdas: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    Left = 720
    Top = 336
  end
  object rvdItensPerdas: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    Left = 720
    Top = 400
  end
end
