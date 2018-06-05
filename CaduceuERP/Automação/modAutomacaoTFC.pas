unit modAutomacaoTFC;

interface

uses SysUtils, Windows, Forms, IniFiles, Classes, StrUtils, Variants;

procedure ExportarProdutoTfcGeral(sArquivo, sPath: string; iFilial: integer);
procedure ExportarProdutoTfcAlterados(sArquivo, sPath: string; iFilial: integer);
procedure ExportarClienteTfc(sArquivo, sPath: string; iFilial: integer);
procedure ImportarVendaTFC(sArquivo, sPath: string; iFilial,pNumCx: integer);

var
  ifArqIni : TIniFile;
  iContatorAliq,
  iChaveInicial,
  iQuantFPgto,
  iQuantItens,
  iContaItens,
  iNumCx,
  iNumeroItem,
  iCooInicial,
  iCooFinal,
  iContRDZ,
  ICRO: integer;

  cVDescontoST,
  cVAcrescimoST,
  cValorTotalCupom,
  cValorTroco,
  cPDesconto,
  cPAcrescimo,
  cSubTotal,
  cVDescontoItem,
  cVAcrescimoItem,
  cAliquota,
  cValorUnitario,
  cQuantidadeItem,
  cValorVendaBruta,
  cValorGT,
  cTotalVendaDiaria,
  cCancelamentos,
  cDescontos: currency;

  tHoraAberturaCupom:TDateTime;

  sChaveCupom,
  sSerialECF,
  sCoo,
  sCooCancel,
  sVDescontoST,
  sVAcrescimoST,
  sValorTotalCupom,
  sValorTroco,
  sBarras,
  sValorUnitario,
  sQuantidadeItem,
  sSubTotal,
  sAliquota,
  sVDescontoItem,
  sVAcrescimoItem,
  sLinha,
  sDataRDZ,
  sChaveAliq,
  sDataMovimento,
  sDataEmissao,
  sAliqTemp,
  sChaveCCF: string;

  sDecimalSeparatorTemp:Char;

  tsSecoesINI, tsAliquotas:TStringList;

implementation

uses modDBEXMaster, modDMMProvider, uFuncoes, modAutomacao, modSSPMaster;
procedure ExportarProdutoTfcGeral(sArquivo, sPath: string; iFilial: integer);
var
  txtArq    : TextFile;
  sLinha    : string;
begin

  //arquivo de produto
  frmAutomacao.edtPastaDestinoPDV.Text     := sPath;
  frmAutomacao.edtArquivoExportadoPDV.Text := sArquivo;

  dmMProvider.cdsSelProdExpPdv.Close;
  dmDBEXMaster.sqqSelProdExpPdv.ParamByName('IP_FILIAL').AsInteger := dmDBEXMaster.iIdFilial;
  dmDBEXMaster.sqqSelProdExpPdv.ParamByName('IP_OPCAO').AsInteger  := frmAutomacao.rdgTipoExpPdv.ItemIndex;
  dmMProvider.cdsSelProdExpPdv.Open;

  if dmMProvider.cdsSelProdExpPdv.Eof then
    Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
      + MSG_ARQ_EXP_PRO_VAZIO), 'Atenção!', mb_IconWarning + mb_Ok)

  else
  begin

    frmAutomacao.pgbProgressoArquivo.Max         := dmMProvider.cdsSelProdExpPdv.RecordCount;

    with dmMProvider.cdsSelProdExpPdv do
    begin

      First;

      if not eof then
      begin

        AssignFile(txtArq, sPath + sArquivo);
        ReWrite(txtArq);

        repeat
          frmAutomacao.pgbProgressoArquivo.Position  :=dmMProvider.cdsSelProdExpPdv.RecNo;
          Application.ProcessMessages;

          if ValidarBarras(dmMprovider.cdsSelProdExpPdv.FieldByName('OP_BARRAS').Value) then
          begin

            if frmAutomacao.clConfiguracoesSistema.ExportarDigVerif = 1 then
              sLinha := Copy(dmMProvider.cdsSelProdExpPdv.FieldByName('OP_BARRAS').AsString, 1, 12) + ','
            else
            begin

              if dmMProvider.cdsSelProdExpPdv.FieldByName('OP_GERADO').AsInteger = 1 then
                sLinha := '0' + Copy(dmMProvider.cdsSelProdExpPdv.FieldByName('OP_BARRAS').AsString, 1, 12) + ','
              else
                sLinha := dmMProvider.cdsSelProdExpPdv.FieldByName('OP_BARRAS').AsString + ',';

            end;

            sLinha := sLinha + Format('%-40.40s', [RetirarAcento(dmMProvider.cdsSelProdExpPdv.FieldByName('OP_DESCRICAO').AsString)])
              + ',' + Format('%-20.20s', [RetirarAcento(dmMProvider.cdsSelProdExpPdv.FieldByName('OP_DESCRICAO_CUPOM').AsString)])
              + ',' + Format('%-2.2s', [dmMProvider.cdsSelProdExpPdv.FieldByName('OP_CODIGO_ECF').AsString])
              + ',' + FormatFloat('00', 1) + ',';

            //verifica produto em promoção
            case dmMProvider.cdsSelProdExpPdv.FieldByName('OP_PROMOCAO').AsInteger of
              0:sLinha := sLinha + FormatFloat('00000000',(dmMProvider.cdsSelProdExpPdv.FieldByName('OP_PRECO_VENDA').AsCurrency
                * dmMProvider.cdsSelProdExpPdv.FieldByName('OP_QUANTIDADE').AsCurrency) * 100) + ',';
              1:sLinha := sLinha + FormatFloat('00000000',(dmMProvider.cdsSelProdExpPdv.FieldByName('OP_PRECO_PROMOCAO').AsCurrency
                * dmMProvider.cdsSelProdExpPdv.FieldByName('OP_QUANTIDADE').AsCurrency) * 100) + ',';
            else
              sLinha := sLinha + FormatFloat('00000000', dmMProvider.cdsSelProdExpPdv.FieldByName('OP_PRECO_VENDA').AsCurrency * 100) + ',';
            end;

            //verifica se produto pesado
            case dmMProvider.cdsSelProdExpPdv.FieldByName('OP_PESADO').AsInteger of
              0: sLinha := sLinha + 'N' + ',';
              1: sLinha := sLinha + 'S' + ',';
            end;

            //verifica se produto similar
            if dmMProvider.cdsSelProdExpPdv.FieldByName('OP_SIMILAR').AsInteger > 0 then
              sLinha := sLinha + 'S'
            else if dmMProvider.cdsSelProdExpPdv.FieldByName('OP_SIMILAR').AsInteger <= 0 then
              sLinha := sLinha + 'N';

            WriteLn(txtArq, sLinha);

            end;
            Next;

          until eof;
          CloseFile(txtArq);
        end;
      end;
      Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
        + 'O arquivo de PRODUTOS foi gerado com sucesso!'), 'Atenção!',
        mb_IconInformation + mb_Ok);
      frmAutomacao.pgbProgressoArquivo.Position := 0;
  end;
end;
procedure ExportarProdutoTfcAlterados(sArquivo, sPath: string; iFilial: integer);
var
  txtArq    : TextFile;
  sLinha    : string;
begin

  //arquivo de produto
  frmAutomacao.edtPastaDestinoPDV.Text     := sPath;
  frmAutomacao.edtArquivoExportadoPDV.Text := sArquivo;

  dmMProvider.cdsSelProdExpPdv.Close;
  dmDBEXMaster.sqqSelProdExpPdv.ParamByName('IP_FILIAL').AsInteger := dmDBEXMaster.iIdFilial;
  dmDBEXMaster.sqqSelProdExpPdv.ParamByName('IP_OPCAO').AsInteger := frmAutomacao.rdgTipoExpPdv.ItemIndex;
  dmMProvider.cdsSelProdExpPdv.Open;

  if dmMProvider.cdsSelProdExpPdv.Eof then
    Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
      + MSG_ARQ_EXP_PRO_VAZIO), 'Atenção!', mb_IconWarning + mb_Ok)

  else
  begin

    frmAutomacao.pgbProgressoArquivo.Max         := dmMProvider.cdsSelProdExpPdv.RecordCount;

    with dmMProvider.cdsSelProdExpPdv do
    begin

      First;

      if not eof then
      begin

        AssignFile(txtArq, sPath + sArquivo);
        ReWrite(txtArq);

        repeat
          frmAutomacao.pgbProgressoArquivo.Position  := dmMProvider.cdsSelProdExpPdv.RecNo;
          Application.ProcessMessages;

          if ValidarBarras(dmMprovider.cdsSelProdExpPdv.FieldByName('OP_BARRAS').Value) then
          begin

            sLinha := FormatDateTime('yymmdd', dmMProvider.cdsSelProdExpPdv.FieldByName('OP_DATA_REMARCACAO').AsDateTime) + ',2,';

            if frmAutomacao.clConfiguracoesSistema.ExportarDigVerif = 1 then
              sLinha := sLinha + Copy(dmMProvider.cdsSelProdExpPdv.FieldByName('OP_BARRAS').AsString, 1, 12) + ','
            else

            begin

              if dmMProvider.cdsSelProdExpPdv.FieldByName('OP_GERADO').AsInteger = 1 then
                sLinha := sLinha + '0' + Copy(dmMProvider.cdsSelProdExpPdv.FieldByName('OP_BARRAS').AsString, 1, 12) + ','
              else
                sLinha := sLinha + dmMProvider.cdsSelProdExpPdv.FieldByName('OP_BARRAS').AsString + ',';

            end;
            sLinha := sLinha + Format('%-40.40s', [RetirarAcento(dmMProvider.cdsSelProdExpPdv.FieldByName('OP_DESCRICAO').AsString)])
              + ',' + Format('%-20.20s', [RetirarAcento(dmMProvider.cdsSelProdExpPdv.FieldByName('OP_DESCRICAO_CUPOM').AsString)])
              + ',' + Format('%-2.2s', [dmMProvider.cdsSelProdExpPdv.FieldByName('OP_CODIGO_ECF').AsString])
              + ',' + FormatFloat('00', 1) + ',';

            //verifica produto em promoção
            case dmMProvider.cdsSelProdExpPdv.FieldByName('OP_PROMOCAO').AsInteger of
              0:sLinha := sLinha + FormatFloat('00000000',(dmMProvider.cdsSelProdExpPdv.FieldByName('OP_PRECO_VENDA').AsCurrency
                * dmMProvider.cdsSelProdExpPdv.FieldByName('OP_QUANTIDADE').AsCurrency) * 100) + ',';
              1:sLinha := sLinha + FormatFloat('00000000',(dmMProvider.cdsSelProdExpPdv.FieldByName('OP_PRECO_PROMOCAO').AsCurrency
                * dmMProvider.cdsSelProdExpPdv.FieldByName('OP_QUANTIDADE').AsCurrency) * 100) + ',';
            else
              sLinha := sLinha + FormatFloat('00000000', dmMProvider.cdsSelProdExpPdv.FieldByName('OP_PRECO_VENDA').AsCurrency * 100) + ',';
            end;

            //verifica se produto pesado
            case dmMProvider.cdsSelProdExpPdv.FieldByName('OP_PESADO').AsInteger of
              0: sLinha := sLinha + 'N' + ',';
              1: sLinha := sLinha + 'S' + ',';
            end;

            //verifica se produto similar
            if dmMProvider.cdsSelProdExpPdv.FieldByName('OP_SIMILAR').AsInteger > 0 then
              sLinha := sLinha + 'S'
            else if dmMProvider.cdsSelProdExpPdv.FieldByName('OP_SIMILAR').AsInteger <= 0 then
              sLinha := sLinha + 'N';

            WriteLn(txtArq, sLinha);

          end;
          Next;

        until eof;
        CloseFile(txtArq);
      end;

      Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
        + 'O arquivo de PRODUTOS foi gerado com sucesso!'), 'Atenção!',
        mb_IconInformation + mb_Ok);

      frmAutomacao.pgbProgressoArquivo.Position := 0;

      if Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario
        +', deseja liberar produtos com status de alterado?'+#13
        +'Após essa confirmação não será possível gerar outro'+#13
        +'arquivo de produtos alterados antes que se faça outras'+#13
        +'alterações em algum produto'), 'Atenção!', mb_IconWarning
        + mb_DefButton2 + mb_YesNo) = idYes then
      begin

        dmSSPMaster.sspMaster.StoredProcName := 'EXECUTA_SQL';
        dmSSPMaster.sspMaster.ParamByName('I_SQL').AsString := 'UPDATE PRODUTO SET STATUS = 0';
        dmSSPMaster.sspMaster.ExecProc;
        Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
          + 'Produtos liberados com sucesso!'), 'Atenção!', mb_IconInformation + mb_Ok);
      end;

    end;

  end;

end;
procedure ExportarClienteTfc(sArquivo, sPath: string; iFilial: integer);
var
  txtArq: TextFile;
  sLinha: string;
begin

  //arquivo de clinte
  frmAutomacao.edtPastaDestinoPDV.Text     := sPath;
  frmAutomacao.edtArquivoExportadoPDV.Text := sArquivo;

  dmMProvider.cdsSelCliExportacao.Close;
  dmMProvider.cdsSelCliExportacao.Open;
  DecimalSeparator := '.';

  if dmMProvider.cdsSelCliExportacao.RecordCount <= 0 then
  begin
    Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
      + MSG_ARQ_EXP_CLI_VAZIO), 'Atenção!', mb_IconWarning + mb_Ok)
  end
  else
  begin

    frmAutomacao.pgbProgressoArquivo.Max := dmMProvider.cdsSelCliExportacao.RecordCount;

    with dmMProvider.cdsSelCliExportacao do
    begin

      First;

      if not EOF then
      begin

        AssignFile(txtArq, sPath + sArquivo);
        ReWrite(txtArq);
        repeat

          frmAutomacao.pgbProgressoArquivo.Position := dmMProvider.cdsSelCliExportacao.Recno;
          Application.ProcessMessages;

          if ValidarCnpjCpf(LimparCpnjInscricao(dmMProvider.cdsSelCliExportacao.FieldByName('OP_CNPJ').AsString)) then
          begin

            sLinha := LimparCpnjInscricao(dmMProvider.cdsSelCliExportacao.FieldByName('OP_CNPJ').AsString) +
              ',' + IntToStr(dmMProvider.cdsSelCliExportacao.FieldByName('OP_STATUS').AsInteger) + ',' +
              FormatFloat('#######0.00', dmMProvider.cdsSelCliExportacao.FieldByName('OP_LIMITE_CREDITO').AsCurrency) + ',' +
              RetirarAcento(dmMProvider.cdsSelCliExportacao.FieldByName('OP_RAZAO_SOCIAL').AsString) + ',' +
              IntToStr(dmMProvider.cdsSelCliExportacao.FieldByName('OP_CLIENTE').AsInteger) + ',' +
              RetirarAcento(dmMProvider.cdsSelCliExportacao.FieldByName('OP_ENDERECO').AsString) + '-' +
              InttoStr(dmMProvider.cdsSelCliExportacao.FieldByName('OP_NUMERO').AsInteger) + ',' +
              RetirarAcento(dmMProvider.cdsSelCliExportacao.FieldByName('OP_BAIRRO').AsString) + ',' +
              RetirarAcento(dmMProvider.cdsSelCliExportacao.FieldByName('OP_PONTO_REFERENCIA').AsString) + ',' +
              RetirarAcento(dmMProvider.cdsSelCliExportacao.FieldByName('OP_NOME_CIDADE').AsString + ',' +
              dmMProvider.cdsSelCliExportacao.FieldByName('OP_ESTADO').AsString + ',' +
              dmMProvider.cdsSelCliExportacao.FieldByName('OP_DDD').AsString + ' ' +
              dmMProvider.cdsSelCliExportacao.FieldByName('OP_TELEFONE1').AsString + ',' +
              FormatFloat('#######0.00',dmMProvider.cdsSelCliExportacao.FieldByName('OP_SALDO_DEVEDOR').AsCurrency)) + ',';
            WriteLn(txtArq, sLinha);

          end;
          Next;
        until EOF;
        CloseFile(txtArq);
      end;
    end;

    Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
      + 'O arquivo de CLIENTES foi gerado com sucesso!'), 'Atenção!',
      mb_IconInformation + mb_Ok);

    frmAutomacao.pgbProgressoArquivo.Position := 0;
    DecimalSeparator := ',';

  end;
end;
procedure ImportarVendaTFC(sArquivo, sPath: string; iFilial,pNumCx: integer);
var
  sStringAux, sCpf_Cliente, sEmissao:string;
  dEmissao:TDateTime;
begin

  iChaveInicial     := 1;
  iQuantFPgto       := 1;
  iQuantItens       := 1;
  iContaItens       := 0;
  iNumCx            := 1;
  cVDescontoST      := 0;
  cVAcrescimoST     := 0;
  cValorTotalCupom  := 0;
  cValorTroco       := 0;
  cPDesconto        := 0;
  cPAcrescimo       := 0;
  cValorUnitario    := 0;
  cQuantidadeItem   := 0;
  cSubTotal         := 0;
  cVDescontoItem    := 0;
  cVAcrescimoItem   := 0;
  iNumeroItem       := 0;
  cAliquota         := 0;
  iCooInicial       := 0;
  iCooFinal         := 0;
  iContRDZ          := 0;
  ICRO              := 0;
  cValorVendaBruta  := 0;
  cValorGT          := 0;
  iContatorAliq     := 0;
  cTotalVendaDiaria := 0;
  cCancelamentos    := 0;
  cDescontos        := 0;

  ifArqIni          := TIniFile.Create(sPath+sArquivo);
  tsSecoesINI       := TStringList.Create;
  tsAliquotas       := TStringList.Create;


  ifArqIni.ReadSections(tsSecoesINI);

  frmAutomacao.pgbProgressoImportacao.Max := tsSecoesINI.Count;

  for iChaveInicial := 0 to tsSecoesINI.Count - 1 do
  begin

    sChaveCupom   := tsSecoesINI[iChaveInicial];
    if iChaveInicial < (tsSecoesINI.Count - 1) then
      sChaveCCF     := tsSecoesINI[iChaveInicial+1];

    frmAutomacao.pgbProgressoImportacao.Position := iChaveInicial;
    Application.ProcessMessages;

    if Pos('RDZ',sChaveCupom) > 0 then
    begin

      sSerialECF        := ifArqIni.ReadString(sChaveCupom,'01','-1');
      sDataEmissao      := ifArqIni.ReadString(sChaveCupom,'02','00/00/00');
      iNumCx            := ifArqIni.ReadInteger(sChaveCupom,'03',1);
      iCooInicial       := ifArqIni.ReadInteger(sChaveCupom,'04',1);
      if iCooInicial = 0 then
        iCooInicial         := ifArqIni.ReadInteger(tsSecoesINI[0],'X02',1);

      iCooFinal         := ifArqIni.ReadInteger(sChaveCupom,'05',1);
      iCRO              := ifArqIni.ReadInteger(sChaveCupom,'06',1);
      iContRDZ          := ifArqIni.ReadInteger(sChaveCupom,'07',1);
      cValorGT          := ifArqIni.ReadFloat(sChaveCupom,'08',0);
      cValorVendaBruta  := ifArqIni.ReadFloat(sChaveCupom,'10',0);
      cCancelamentos    := ifArqIni.ReadFloat(sChaveCupom,'12',0);
      cDescontos        := ifArqIni.ReadFloat(sChaveCupom,'11',0);

      dmMProvider.cdsImpReg60M.Append;
      dmMProvider.cdsImpReg60MDATA_EMISSAO.Value  := StrToDate(sDataEmissao);
      dmMProvider.cdsImpReg60MSERIE_ECF.Value     := sSerialECF;
      dmMProvider.cdsImpReg60MNUMERO_CAIXA.Value  := iNumCx;
      dmMProvider.cdsImpReg60MCOO_INICIAL.Value   := iCooInicial;
      dmMProvider.cdsImpReg60MCOO_FINAL.Value     := iCooFinal;
      dmMProvider.cdsImpReg60MCRZ.Value           := iContRDZ;
      dmMProvider.cdsImpReg60MCRO.Value           := ICRO;
      dmMProvider.cdsImpReg60MVENDA_BRUTA.Value   := cValorVendaBruta;
      dmMProvider.cdsImpReg60MVALOR_GT.Value      := cValorGT;

      dmMProvider.cdsImpReg60M.Post;

      sDecimalSeparatorTemp := DecimalSeparator;
      DecimalSeparator      := '.';

      for iContatorAliq := 1 to 99 do
      begin

        sChaveAliq := 'T'+FormatFloat('00',iContatorAliq);

        if ifArqIni.ReadString(sChaveCupom,sChaveAliq,'-1') <> '-1' then
        begin

          if Pos('T',ifArqIni.ReadString(sChaveCupom,sChaveAliq,'0000')) > 0 then
            sAliqTemp := Copy(ifArqIni.ReadString(sChaveCupom,sChaveAliq,'0000'),Pos('T',ifArqIni.ReadString(sChaveCupom,sChaveAliq,'0000'))+1,Pos('=',ifArqIni.ReadString(sChaveCupom,sChaveAliq,'0000'))-2)
          else
            sAliqTemp := Copy(ifArqIni.ReadString(sChaveCupom,sChaveAliq,'0000'),1,1);


          dmMProvider.cdsImpReg60A.Append;
          dmMProvider.cdsImpReg60ADATA_EMISSAO.Value    := StrToDate(sDataEmissao);
          dmMProvider.cdsImpReg60ASERIE_ECF.Value       := sSerialECF;
          dmMProvider.cdsImpReg60AALIQUOTA.Value        := sAliqTemp;

          sAliqTemp := Copy(ifArqIni.ReadString(sChaveCupom,sChaveAliq,'0000'),Pos('=',ifArqIni.ReadString(sChaveCupom,sChaveAliq,'0000'))+1,Length(ifArqIni.ReadString(sChaveCupom,sChaveAliq,'0000')));

          sAliqtemp := StringReplace(sAliqtemp,',','.',[rfReplaceAll]);
          cAliquota := StrToFloatDef(sAliqTemp,0);
          dmMProvider.cdsImpReg60AVALOR_ALIQUOTA.Value  := cAliquota;


          dmMProvider.cdsImpReg60A.Post;

        end;


      end;
      if cCancelamentos > 0 then
      begin

        dmMProvider.cdsImpReg60A.Append;
        dmMProvider.cdsImpReg60ADATA_EMISSAO.Value    := StrToDate(sDataEmissao);
        dmMProvider.cdsImpReg60ASERIE_ECF.Value       := sSerialECF;
        dmMProvider.cdsImpReg60AALIQUOTA.Value        := 'CANC';

        dmMProvider.cdsImpReg60AVALOR_ALIQUOTA.Value  := cCancelamentos;

        dmMProvider.cdsImpReg60A.Post;

      end;

      if cDescontos > 0 then
      begin

        dmMProvider.cdsImpReg60A.Append;
        dmMProvider.cdsImpReg60ADATA_EMISSAO.Value    := StrToDate(sDataEmissao);
        dmMProvider.cdsImpReg60ASERIE_ECF.Value       := sSerialECF;
        dmMProvider.cdsImpReg60AALIQUOTA.Value        := 'DESC';

        dmMProvider.cdsImpReg60AVALOR_ALIQUOTA.Value  := cDescontos;

        dmMProvider.cdsImpReg60A.Post;

      end;

      DecimalSeparator      := sDecimalSeparatorTemp;

    end
    else if ifArqIni.ReadString(sChaveCupom,'X01','-1') <> '-1' then
    begin

      sValorTotalCupom    := ifArqIni.ReadString(sChaveCupom,'TTL','0');

      if sValorTotalCupom <> '0' then
        cValorTotalCupom  := StrToFloatDef(Copy(sValorTotalCupom,2,12),0)/100
      else
        cValorTotalCupom  := 0;

      if (ifArqIni.ReadString(sChaveCCF,'CCF','-1') = '-1') and  (cValorTotalCupom > 0) then
      begin


        sSerialECF          := ifArqIni.ReadString(sChaveCupom,'X01','-1');
        sCoo                := ifArqIni.ReadString(sChaveCupom,'X02','-1');
        tHoraAberturaCupom  := StrToTime(ifArqIni.ReadString(sChaveCupom,'X03','00:00:00'));
        iQuantFPgto         := ifArqIni.ReadInteger(sChaveCupom,'X04',1);
        iQuantItens         := ifArqIni.ReadInteger(sChaveCupom,'X05',1);
        iNumCx              := ifArqIni.ReadInteger(sChaveCupom,'X09',1);

        sVDescontoST        := ifArqIni.ReadString(sChaveCupom,'DES','0');
        sVAcrescimoST       := ifArqIni.ReadString(sChaveCupom,'ACR','0');

        cVDescontoST        := 0;
        cPDesconto          := 0;

        cVAcrescimoST       := 0;
        cPAcrescimo         := 0;

        if sVDescontoST <> '0' then
          cVDescontoST      := StrToFloatDef(Copy(sVDescontoST,4,9),0)/100;

        if sVAcrescimoST <> '0' then
          cVAcrescimoST     := StrToFloatDef(Copy(sVAcrescimoST,4,9),0)/100;

        sValorTotalCupom    := ifArqIni.ReadString(sChaveCupom,'TTL','0');
        sValorTroco         := ifArqIni.ReadString(sChaveCupom,'TRC','0');

        if sValorTotalCupom <> '0' then
          cValorTotalCupom  := StrToFloatDef(Copy(sValorTotalCupom,2,12),0)/100
        else
          cValorTotalCupom  := 0;

        if sValorTroco <> '0' then
          cValorTroco       := StrToFloatDef(Copy(sValorTroco,2,12),0)/100;

        if cVDescontoST > 0 then
          cPDesconto        := (cVDescontoST / (cValorTotalCupom+cVDescontoST))*100;

        if cVAcrescimoST > 0 then
          cPAcrescimo       := (cVAcrescimoST / cValorTotalCupom)*100;

        for iContaItens := 0 to iQuantItens - 1 do
        begin

          sLinha := ifArqIni.ReadString(sChaveCupom,FormatFloat('000',iContaItens+1),FormatFloat('000',iContaItens+1));

          if Copy(sLinha, 2,1) = '+'  then
          begin

            iNumeroItem       := StrToInt(Copy(sLinha, 4,3));
            sBarras           := Copy(sLinha, 8,13);

            if frmAutomacao.clConfiguracoesSistema.ExportarDigVerif = 0 then
            begin
              sBarras         :=  FloatToStr(StrToFloatDef(sBarras,0));
              if Length(sBarras) < 8 then
                sBarras         :=  GerarCodigodeBarras(Copy(FormatFloat('0000000000000',StrToFloatDef(sBarras,0)), 2,12))
            end;

            cValorUnitario    := StrToFloatDef(Copy(sLinha, 22,12),0)/100;
            cQuantidadeItem   := StrToFloatDef(Copy(sLinha, 35,12),0)/1000;
            cSubTotal         := StrToFloatDef(Copy(sLinha, 48,12),0)/100;
            sAliquota         := Copy(sLinha, 61,4);

            //verifica se houve desconto/acrescimo no item
            if Copy(sLinha, 66,1) = '-'  then

              cVDescontoItem  := StrToFloatDef(Copy(sLinha, 67,8),0)/100

            else if Copy(sLinha, 66,1) = '+'  then

              cVAcrescimoItem := StrToFloatDef(Copy(sLinha, 67,8),0)/100

            else if Copy(sLinha, 66,1) = 'N'  then

            begin

              cVDescontoItem  := 0;
              cVAcrescimoItem := 0;

            end;

            if cPDesconto > 0 then
              cValorUnitario  := cValorUnitario - (cValorUnitario * (cPDesconto/100));

            if cPAcrescimo > 0 then
              cValorUnitario  := cValorUnitario + (cValorUnitario * (cPAcrescimo/100));


            dmMProvider.cdsImpCupom.Append;
            dmMProvider.cdsImpCupomSERIE_ECF.Value        := sSerialECF;
            dmMProvider.cdsImpCupomNUMERO_CUPOM.Value     := StrToInt(sCoo);
            dmMProvider.cdsImpCupomHORA_ABERTURA.Value    := tHoraAberturaCupom;
            dmMProvider.cdsImpCupomBARRAS.Value           := sBarras;
            dmMProvider.cdsImpCupomVALOR_UNITARIO.Value   := cValorUnitario;
            dmMProvider.cdsImpCupomQUANTIDADE.Value       := cQuantidadeItem;
            dmMProvider.cdsImpCupomSUB_TOTAL.Value        := cSubTotal;
            dmMProvider.cdsImpCupomVALOR_DESCONTO.Value   := cVDescontoItem;
            dmMProvider.cdsImpCupomVALOR_ACRESCIMO.Value  := cVAcrescimoItem;
            dmMProvider.cdsImpCupomNUMERO_CAIXA.Value     := pNumCx;
            dmMProvider.cdsImpCupomALIQUOTA_ICMS.Value    := Copy(sLinha, 61,4);
            dmMProvider.cdsImpCupomNUMERO_ITEM.Value      := iNumeroItem;

            frmAutomacao.cTotalVendaDiaria := frmAutomacao.cTotalVendaDiaria + cSubTotal;

          end;


        end;

        sStringAux := Copy(ifArqIni.ReadString(sChaveCupom,'F01','-1'),2,length(ifArqIni.ReadString(sChaveCupom,'F01','-1')));

        if Pos('CONVENIO',UpperCase(sStringAux)) > 0 then
        begin

          sCpf_Cliente := Copy(sStringAux,35,14);

          sValorTotalCupom    := ifArqIni.ReadString(sChaveCupom,'TTL','0');
          sEmissao            := Copy(ifArqIni.ReadString(sChaveCupom,'TTL','0'),15,6);
          dEmissao            := StrToDate(Copy(sEmissao,1,2)+'/'+Copy(sEmissao,3,2)+'/'+Copy(sEmissao,5,2));

          if sValorTotalCupom <> '0' then
            cValorTotalCupom  := StrToFloatDef(Copy(sValorTotalCupom,2,12),0)/100
          else
            cValorTotalCupom  := 0;

          dmDBEXMaster.sqqCliente.Close;
          dmDBEXMaster.sqqCliente.SQL.Clear;
          dmDBEXMaster.sqqCliente.SQL.Add('SELECT * FROM CLIENTES');
          dmDBEXMaster.sqqCliente.SQL.Add('WHERE CNPJ = ' + QuotedStr(Trim(sCpf_Cliente)));
          dmDBEXMaster.sqqCliente.Open;

          if not  dmDBEXMaster.sqqCliente.IsEmpty then
          begin

            dmMProvider.cdsImpFinanceiro.Append;
            dmMProvider.cdsImpFinanceiroIP_CRE.AsInteger                    := -1;
            dmMProvider.cdsImpFinanceiroIP_FILIAL.AsInteger                 := dmDBEXMaster.iIdFilial;
            dmMProvider.cdsImpFinanceiroIP_DOCUMENTO.AsString               := ifArqIni.ReadString(sChaveCupom,'X02',sChaveCupom);
            dmMProvider.cdsImpFinanceiroIP_SITUACAO.AsInteger               := 0;
            dmMProvider.cdsImpFinanceiroIP_DATA_ENTRADA.AsDateTime          := Date;
            dmMProvider.cdsImpFinanceiroIP_SACADO.AsInteger                 :=  dmDBEXMaster.sqqCliente.FieldByName('CLIENTE').Value;
            dmMProvider.cdsImpFinanceiroIP_TIPO.AsInteger                   := 0;
            dmMProvider.cdsImpFinanceiroIP_DATA_EMISSAO.AsDateTime          := dEmissao;
            dmMProvider.cdsImpFinanceiroIP_DATA_VENCIMENTO.AsDateTime       := dEmissao + 30;
            dmMProvider.cdsImpFinanceiroIP_MOEDA.AsInteger                  := 0;
            dmMProvider.cdsImpFinanceiroIP_VALOR.AsCurrency                 := cValorTotalCupom;

            case frmAutomacao.clConfiguracoesSistema.TipoMulta of
              0:dmMProvider.cdsImpFinanceiroIP_MORA_DIARIA.AsCurrency       := frmAutomacao.clConfiguracoesSistema.MoraDiaria;
              1:dmMProvider.cdsImpFinanceiroIP_MORA_DIARIA.AsCurrency       := cValorTotalCupom * (frmAutomacao.clConfiguracoesSistema.MoraDiaria/100);
            end;

            dmMProvider.cdsImpFinanceiroIP_DESCONTO.AsCurrency              := 0;

            dmMProvider.cdsImpFinanceiroIP_DATA_DESCONTO.AsVariant          := null;
            dmMProvider.cdsImpFinanceiroIP_HISTORICO.AsString               := 'LANCAMENTO POR IMPORTACAO DE VENDA';
            dmMProvider.cdsImpFinanceiroIP_NOSSO_NUMERO.AsString            := '0';
            dmMProvider.cdsImpFinanceiroIP_VENCIMENTO_PRORROGADO.AsVariant  := null;
            dmMProvider.cdsImpFinanceiroIP_POSICAO.AsInteger                := 0;
            dmMProvider.cdsImpFinanceiroIP_DATA_ENTRADA_NO_BANCO.AsVariant  := null;
            dmMProvider.cdsImpFinanceiroIP_DATA_BAIXA.AsVariant             := null;
            dmMProvider.cdsImpFinanceiroIP_DESCONTO_CONCEDIDO.Value         := 0;
            dmMProvider.cdsImpFinanceiroIP_ABATIMENTOS.Value                := 0;
            dmMProvider.cdsImpFinanceiroIP_OUTRAS_DESPESAS.Value            := 0;
            dmMProvider.cdsImpFinanceiroIP_VALOR_PAGO.Value                 := 0;
            dmMProvider.cdsImpFinanceiroIP_TARIFAS_BANCARIAS.Value          := 0;
            dmMProvider.cdsImpFinanceiroIP_JUROS_RECEBIDOS.Value            := 0;
            dmMProvider.cdsImpFinanceiroIP_OUTROS_CREDITOS.Value            := 0;
            dmMProvider.cdsImpFinanceiroIP_PLANO_CONTAS.AsVariant           := null;
            dmMProvider.cdsImpFinanceiroIP_SUB_CONTA.AsVariant              := null;
            dmMProvider.cdsImpFinanceiroIP_TIPO_OCORRENCIA.Value            := 0;
            dmMProvider.cdsImpFinanceiroIP_TIPO_AVISO.Value                 := 0;
            dmMProvider.cdsImpFinanceiroIP_OCORRENCIA.Value                 := ' ';
            dmMProvider.cdsImpFinanceiroIP_AVISO_COBRANCA.Value             := ' ';
            dmMProvider.cdsImpFinanceiroIP_LANCAMENTO.AsVariant             := null;
            dmMProvider.cdsImpFinanceiroIP_TIPO_COBRANCA.Value              := 0;
            dmMProvider.cdsImpFinanceiroIP_CONTA_CORRENTE.AsVariant         := null;
            dmMProvider.cdsImpFinanceiroIP_CARTEIRA.Value                   := ' ';
            dmMProvider.cdsImpFinanceiroIP_TIPO_PARCELA.Value               := 0;
            dmMProvider.cdsImpFinanceiroIP_PEDIDO_DE_VENDA.AsVariant        := null;
            dmMProvider.cdsImpFinanceiroIP_PEDIDO_EXTERNO.AsVariant         := null;
            dmMProvider.cdsImpFinanceiroIP_DATA.Value                       := Date;
            dmMProvider.cdsImpFinanceiroIP_PERCENTUAL.Value                 := 0;
            dmMProvider.cdsImpFinanceiroIP_REDUCAO.Value                    := 0;
            dmMProvider.cdsImpFinanceiroIP_VALOR_COMISSAO.Value             := 0;
            dmMProvider.cdsImpFinanceiroIP_NF_SAIDA.AsVariant               := null;
            dmMProvider.cdsImpFinanceiroIP_OBSERVACOES.Value                := ' ';
            dmMProvider.cdsImpFinanceiroIP_VALOR_CHQ_DEVOLVIDO.Value        := 0;
            dmMProvider.cdsImpFinanceiroIP_SEQUENCIAL.Value                 := 0;
            dmMProvider.cdsImpFinanceiroIP_OUTROS_DEBITOS.Value             := 0;
            dmMProvider.cdsImpFinanceiroIP_MODELO_DOCUMENTO.Value           := '2D';
            dmMProvider.cdsImpFinanceiro.Post;
          end;

        end;
      end
      else if (cValorTotalCupom > 0) and (Copy(ifArqIni.ReadString(sChaveCCF,'CCF','-1'),2,6) <> sChaveCupom) then
      begin

        sSerialECF          := ifArqIni.ReadString(sChaveCupom,'X01','-1');
        sCoo                := ifArqIni.ReadString(sChaveCupom,'X02','-1');
        tHoraAberturaCupom  := StrToTime(ifArqIni.ReadString(sChaveCupom,'X03','00:00:00'));
        iQuantFPgto         := ifArqIni.ReadInteger(sChaveCupom,'X04',1);
        iQuantItens         := ifArqIni.ReadInteger(sChaveCupom,'X05',1);
        iNumCx              := ifArqIni.ReadInteger(sChaveCupom,'X09',1);

        sVDescontoST        := ifArqIni.ReadString(sChaveCupom,'DES','0');
        sVAcrescimoST       := ifArqIni.ReadString(sChaveCupom,'ACR','0');

        cVDescontoST        := 0;
        cPDesconto          := 0;

        cVAcrescimoST       := 0;
        cPAcrescimo         := 0;

        if sVDescontoST <> '0' then
          cVDescontoST      := StrToFloatDef(Copy(sVDescontoST,4,9),0)/100;

        if sVAcrescimoST <> '0' then
          cVAcrescimoST     := StrToFloatDef(Copy(sVAcrescimoST,4,9),0)/100;

        sValorTotalCupom    := ifArqIni.ReadString(sChaveCupom,'TTL','0');
        sValorTroco         := ifArqIni.ReadString(sChaveCupom,'TRC','0');

        if sValorTotalCupom <> '0' then
          cValorTotalCupom  := StrToFloatDef(Copy(sValorTotalCupom,2,12),0)/100;

        if sValorTroco <> '0' then
          cValorTroco       := StrToFloatDef(Copy(sValorTroco,2,12),0)/100;

        if cVDescontoST > 0 then
          cPDesconto        := (cVDescontoST / (cValorTotalCupom+cVDescontoST))*100;

        if cVAcrescimoST > 0 then
          cPAcrescimo       := (cVAcrescimoST / cValorTotalCupom)*100;

        for iContaItens := 0 to iQuantItens - 1 do
        begin

          sLinha := ifArqIni.ReadString(sChaveCupom,FormatFloat('000',iContaItens+1),FormatFloat('000',iContaItens+1));

          if Copy(sLinha, 2,1) = '+'  then
          begin

            iNumeroItem       := StrToInt(Copy(sLinha, 4,3));
            sBarras           := Copy(sLinha, 8,13);

            if frmAutomacao.clConfiguracoesSistema.ExportarDigVerif = 0 then
            begin
              sBarras         :=  FloatToStr(StrToFloatDef(sBarras,0));
              if Length(sBarras) < 8 then
                sBarras         :=  GerarCodigodeBarras(Copy(FormatFloat('0000000000000',StrToFloatDef(sBarras,0)), 2,12))
            end;

            cValorUnitario    := StrToFloatDef(Copy(sLinha, 22,12),0)/100;
            cQuantidadeItem   := StrToFloatDef(Copy(sLinha, 35,12),0)/1000;
            cSubTotal         := StrToFloatDef(Copy(sLinha, 48,12),0)/100;
            sAliquota         := Copy(sLinha, 61,4);

            //verifica se houve desconto/acrescimo no item
            if Copy(sLinha, 66,1) = '-'  then

              cVDescontoItem  := StrToFloatDef(Copy(sLinha, 67,8),0)/100

            else if Copy(sLinha, 66,1) = '+'  then

              cVAcrescimoItem := StrToFloatDef(Copy(sLinha, 67,8),0)/100

            else if Copy(sLinha, 66,1) = 'N'  then

            begin

              cVDescontoItem  := 0;
              cVAcrescimoItem := 0;

            end;

            if cPDesconto > 0 then
              cValorUnitario  := cValorUnitario - (cValorUnitario * (cPDesconto/100));

            if cPAcrescimo > 0 then
              cValorUnitario  := cValorUnitario + (cValorUnitario * (cPAcrescimo/100));


            dmMProvider.cdsImpCupom.Append;
            dmMProvider.cdsImpCupomSERIE_ECF.Value        := sSerialECF;
            dmMProvider.cdsImpCupomNUMERO_CUPOM.Value     := StrToInt(sCoo);
            dmMProvider.cdsImpCupomHORA_ABERTURA.Value    := tHoraAberturaCupom;
            dmMProvider.cdsImpCupomBARRAS.Value           := sBarras;
            dmMProvider.cdsImpCupomVALOR_UNITARIO.Value   := cValorUnitario;
            dmMProvider.cdsImpCupomQUANTIDADE.Value       := cQuantidadeItem;
            dmMProvider.cdsImpCupomSUB_TOTAL.Value        := cSubTotal;
            dmMProvider.cdsImpCupomVALOR_DESCONTO.Value   := cVDescontoItem;
            dmMProvider.cdsImpCupomVALOR_ACRESCIMO.Value  := cVAcrescimoItem;
            dmMProvider.cdsImpCupomNUMERO_CAIXA.Value     := pNumCx;
            dmMProvider.cdsImpCupomALIQUOTA_ICMS.Value    := Copy(sLinha, 61,4);
            dmMProvider.cdsImpCupomNUMERO_ITEM.Value      := iNumeroItem;

            frmAutomacao.cTotalVendaDiaria := frmAutomacao.cTotalVendaDiaria + cSubTotal;

          end;


        end;

      end;

    end;
  end;
  frmAutomacao.pgbProgressoImportacao.Position := 0;

end;
end.
