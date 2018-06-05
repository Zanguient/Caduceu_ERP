unit modAutomacaoFLEXPDV;

interface

uses SysUtils, Windows, Forms, IniFiles, Classes, StrUtils;

procedure ExportarProdutoFLEXPDVGeral(sArquivo, sPath: string; iFilial: integer);
procedure ExportarClienteFLEXPDV(sArquivo, sPath: string; iFilial: integer);
procedure ExportarGrupoProdutoFLEXPDV(sArquivo, sPath: string; iFilial: integer);
procedure ExportarVendedoresFLEXPDV(sArquivo, sPath: string; iFilial: integer);

implementation

uses modDBEXMaster, modDMMProvider, uFuncoes, modAutomacao, modSSPMaster;

procedure ExportarProdutoFLEXPDVGeral(sArquivo, sPath: string; iFilial: integer);
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

              sLinha   := Format('%20.20s',[IntToStr(dmMProvider.cdsSelProdExpPdv.FieldByName('OP_PRODUTO').AsInteger)])
                          + Format('%20.20s',[dmMProvider.cdsSelProdExpPdv.FieldByName('OP_BARRAS').AsString])
                          + Format('%-40.40s', [RetirarAcento(dmMProvider.cdsSelProdExpPdv.FieldByName('OP_DESCRICAO').AsString)])
                          + Format('%-24.24s', [RetirarAcento(dmMProvider.cdsSelProdExpPdv.FieldByName('OP_DESCRICAO_CUPOM').AsString)])
                          + 'N'
                          + Format('%-2.2s', [RetirarAcento(dmMProvider.cdsSelProdExpPdv.FieldByName('OP_UNIDADE').AsString)])
                          + '0000'//armação localização
                          + FormatFloat('00',dmMProvider.cdsSelProdExpPdv.FieldByName('OP_SETOR_BALANCA').AsInteger)
                          + FormatFloat('000000000',(dmMProvider.cdsSelProdExpPdv.FieldByName('OP_PRECO_VENDA').AsCurrency*1000))
                          + FormatFloat('000000000',(dmMProvider.cdsSelProdExpPdv.FieldByName('OP_PRECO_PROMOCAO').AsCurrency*1000));
              if dmMProvider.cdsSelProdExpPdv.FieldByName('OP_SALDO_ATUAL').AsCurrency < 0 then
                sLinha   := sLinha + FormatFloat('000000000000',0)
              else
                sLinha   := sLinha + FormatFloat('000000000000',(dmMProvider.cdsSelProdExpPdv.FieldByName('OP_SALDO_ATUAL').AsCurrency*1000));

             sLinha := sLinha + 'L';//desconto padrao cliente loja

              //verifica se produto pesado
              case dmMProvider.cdsSelProdExpPdv.FieldByName('OP_PESADO').AsInteger of
                0: sLinha := sLinha + 'N';
                1: sLinha := sLinha + 'S';
              end;

              sLinha    := sLinha + 'N' //não atera preço do PDV
                           + 'N'        //não bloquei multiplicador (quantidade X codigo)
                           + '      '   //não utiliza promoção leve X pague Y
                           + FormatFloat('00',StrToFloatDef(dmMProvider.cdsSelProdExpPdv.FieldByName('OP_CODIGO_ECF').AsString,1))
                           + ' '        //reservado
                           + FormatFloat('0000000',(dmMProvider.cdsSelProdExpPdv.FieldByName('OP_QUANTIDADE').AsCurrency*1000))
                           + 'N'        //vende somente embalagem fechada
                           + '0000'     //desconto por embalagem fechada
                           + 'N'        //não solicita descrição complementar
                           + Format('%-80.80s',[' '])
                           + '000000000';

              //bloqueia venda fracionada se o produto não for peso variável
              case dmMProvider.cdsSelProdExpPdv.FieldByName('OP_PESADO').AsInteger of
                0: sLinha := sLinha + 'S';
                1: sLinha := sLinha + 'N';
              end;

              sLinha := sLinha + Format('%-40.40s',[' '])
                        + dmMProvider.cdsSelProdExpPdv.FieldByName('OP_CST').AsString
                        + 'A'                     //ativo
                        + '0000'                  //controle de vasilhame
                        + Format('%-81.81s',[' '])//reservado
                        + '0000'                  //desconto máximo permitido
                        + '0000000'               //informação para atacado
                        + ' '                     //informação para atacado
                        + '0000'                  //informação para atacado
                        + Format('%-10.10s',[' '])//classficação fiscal
                        + '000000000000'          //quantidade pendente
                        + '    '                  //validade da quantidade pendente
                        + '000000000'             //preco de venda especial
                        + '0000000'               //informações para balcão
                        + ' '                     //informações para balcão
                        + '0000'                  //informações para balcão
                        + '000000000000'          //informações para balcão
                        + '000000000000'          //informações para balcão
                        + FormatFloat('000000',dmMProvider.cdsSelProdExpPdv.FieldByName('OP_GRUPO').AsInteger)
                        + '      '                //departamento
                        + '      '                //marca
                        + '        '              //pontos clube fidelidade
                        + ' '                     //base calculo clube fidelidade
                        + Format('%-20.20s',[' '])//codigo interno produto associado
                        + '   '                   //grupo de finalizarores
                        + '         '             //descotnos finalizadores especificos
                        + Format('%-90.90s',[' '])//finalizadores para desconto
                        + '  '                    //1 micro terminal de impressão
                        + '      '                //quantidade max de item por compra
                        + ' '                     //cupom vinculado
                        + ' '                     //bloqueador de venda
                        + '0'                     //tipo de produto (0-produto / 1-serviço)
                        + '  '                    //2 micro terminal deimpressao
                        + '  '                    //3 micro terminal deimpressao
                        + '  '                    //4 micro terminal deimpressao
                        + '  '                    //5 micro terminal deimpressao
                        + 'N'                     //solicita senha para liberação de venda
                        + '   '                   //grupo de balcão
                        + ' '                     //indicador de produção propria ou de tyerceiro (P/T)
                        + frmAutomacao.clConfiguracoesSistema.PDVArredondarTruncar;

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
procedure ExportarClienteFLEXPDV(sArquivo, sPath: string; iFilial: integer);
var
  txtArq: TextFile;
  sLinha: string;
begin

  //arquivo de clinte
  frmAutomacao.edtPastaDestinoPDV.Text     := sPath;
  frmAutomacao.edtArquivoExportadoPDV.Text := sArquivo;

  dmMProvider.cdsSelCliExportacao.Close;
  dmMProvider.cdsSelCliExportacao.Open;

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



            sLinha  :=  FormatFloat('0000000000000000',dmMProvider.cdsSelCliExportacao.FieldByName('OP_CLIENTE').AsInteger)
                      + Format('%-50.50s',[RetirarAcento(dmMProvider.cdsSelCliExportacao.FieldByName('OP_RAZAO_SOCIAL').AsString)])
                      + Format('%-60.60s',[RetirarAcento(dmMProvider.cdsSelCliExportacao.FieldByName('OP_ENDERECO').AsString)])
                      + Format('%-30.30s',[RetirarAcento(dmMProvider.cdsSelCliExportacao.FieldByName('OP_BAIRRO').AsString)])
                      + Format('%-30.30s',[RetirarAcento(dmMProvider.cdsSelCliExportacao.FieldByName('OP_NOME_CIDADE').AsString)])
                      + Format('%-2.2s',[dmMProvider.cdsSelCliExportacao.FieldByName('OP_ESTADO').AsString])
                      + Format('%-8.8s',[dmMProvider.cdsSelCliExportacao.FieldByName('OP_CEP').AsString])
                      + Format('%-15.15s',[dmMProvider.cdsSelCliExportacao.FieldByName('OP_DDD').AsString + '-' +
                        dmMProvider.cdsSelCliExportacao.FieldByName('OP_TELEFONE1').AsString])
                      + FormatarCNPJCPF(dmMProvider.cdsSelCliExportacao.FieldByName('OP_CNPJ').AsString)
                      + FormatDateTime('yyyymmdd',dmMProvider.cdsSelCliExportacao.FieldByName('OP_NASCIMENTO').AsDateTime)
                      + FormatDateTime('yyyymmdd',dmMProvider.cdsSelCliExportacao.FieldByName('OP_ULTIMA_COMPRA').AsDateTime);

            case dmMProvider.cdsSelCliExportacao.FieldByName('OP_STATUS').AsInteger of
              0:sLinha := sLinha + 'L';
            else
              sLinha := sLinha + 'B';
            end;

            sLinha  :=  sLinha +  FormatFloat('000000000000',(dmMProvider.cdsSelCliExportacao.FieldByName('OP_LIMITE_CREDITO').AsCurrency
                               -  dmMProvider.cdsSelCliExportacao.FieldByName('OP_SALDO_DEVEDOR').AsCurrency*100))
                               +  '000000000000'          //valor das compras em aberto
                               +  '0000'                  //desconto sobre o cupom
                               +  'N'                     //desconto sobre o item em promoção (S/N)
                               +  'N'                     //desconto geral
                               +  'S'                     //permite compra do convenio
                               +  Format('%-80.80s',[' '])
                               +  '000000000000'
                               +  '000000'
                               +  '000000000000'
                               +  '000000'
                               +  Format('%-80.80s',[' '])
                               +  Format('%-40.40s',[' '])
                               +  Format('%-25.25s',[dmMProvider.cdsSelCliExportacao.FieldByName('OP_INSCRICAO').AsString])
                               +  '000000000'             //pontuação acumulada fidelidade
                               +  '  '                    //reservado
                               +  '          '            //reservado
                               +  FormatFloat('000000000000',(dmMProvider.cdsSelCliExportacao.FieldByName('OP_VALOR_ULTIMO_PEDIDO').AsCurrency))
                               +  '      '                //quantidade de documentos em aberto
                               +  Format('%-90.90s',[' '])
                               +  'P'                     //tabela de preço a utilizar (AEP)
                               +  '00'                    //nivel de bloqueio
                               +  Format('%-15.15s',[dmMProvider.cdsSelCliExportacao.FieldByName('OP_FANTASIA').AsString])
                               +  Format('%-20.20s',[' '])
                               +  '00'                    //dia para vencimento do convenio
                               +  '000'                   //dias para calculo do vencimento dso convenio
                               +  'DD'                    //condição para calc do vencimento
                               +  '00'                    //melhor dia para compra
                               +  Format('%-40.40s',[' '])//contato segunda pessoa autorizada
                               +  Format('%-15.15s',[' '])//tipo do endereço
                               +  FormatFloat('000000',dmMProvider.cdsSelCliExportacao.FieldByName('OP_NUMERO').Value)
                               +  Format('%-20.20s',[dmMProvider.cdsSelCliExportacao.FieldByName('OP_PONTO_REFERENCIA').AsString]);

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

  end;
end;
procedure ExportarGrupoProdutoFLEXPDV(sArquivo, sPath: string; iFilial: integer);
var
  txtArq: TextFile;
  sLinha: string;
begin

  //arquivo de clinte
  frmAutomacao.edtPastaDestinoPDV.Text     := sPath;
  frmAutomacao.edtArquivoExportadoPDV.Text := sArquivo;

  dmMProvider.cdsSelGrupoExpPdv.Close;
  dmMProvider.cdsSelGrupoExpPdv.Open;

  if dmMProvider.cdsSelGrupoExpPdv.RecordCount <= 0 then
  begin
    Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
      + MSG_ARQ_EXP_GRP_VAZIO), 'Atenção!', mb_IconWarning + mb_Ok)
  end
  else
  begin

    frmAutomacao.pgbProgressoArquivo.Max := dmMProvider.cdsSelGrupoExpPdv.RecordCount;

    with dmMProvider.cdsSelGrupoExpPdv do
    begin

      First;

      if not EOF then
      begin

        AssignFile(txtArq, sPath + sArquivo);
        ReWrite(txtArq);
        repeat

          frmAutomacao.pgbProgressoArquivo.Position := dmMProvider.cdsSelGrupoExpPdv.Recno;
          Application.ProcessMessages;

          sLinha  :=  FormatFloat('000000',dmMProvider.cdsSelGrupoExpPdv.FieldByName('OP_GRUPO').AsInteger)
                    + Format('%-26.26s',[RetirarAcento(dmMProvider.cdsSelGrupoExpPdv.FieldByName('OP_DESCRICAO').AsString)]);

          WriteLn(txtArq, sLinha);

          Next;
        until EOF;
        CloseFile(txtArq);
      end;
    end;

    Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
      + 'O arquivo de GRUPO DE PRODUTOS foi gerado com sucesso!'), 'Atenção!',
      mb_IconInformation + mb_Ok);

    frmAutomacao.pgbProgressoArquivo.Position := 0;

  end;
end;
procedure ExportarVendedoresFLEXPDV(sArquivo, sPath: string; iFilial: integer);
var
  txtArq: TextFile;
  sLinha: string;
begin

  //arquivo de venddores
  frmAutomacao.edtPastaDestinoPDV.Text     := sPath;
  frmAutomacao.edtArquivoExportadoPDV.Text := sArquivo;

  dmMProvider.cdsSelFunExpPdv.Close;
  dmMProvider.cdsSelFunExpPdv.Open;

  if dmMProvider.cdsSelFunExpPdv.RecordCount <= 0 then
  begin

    Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
      + MSG_ARQ_EXP_FUN_VAZIO), 'Atenção!', mb_IconWarning + mb_Ok)

  end
  else
  begin

    frmAutomacao.pgbProgressoArquivo.Max := dmMProvider.cdsSelFunExpPdv.RecordCount;

    with dmMProvider.cdsSelFunExpPdv do
    begin

      First;

      if not EOF then
      begin

        AssignFile(txtArq, sPath + sArquivo);
        ReWrite(txtArq);
        repeat

          frmAutomacao.pgbProgressoArquivo.Position := dmMProvider.cdsSelFunExpPdv.Recno;
          Application.ProcessMessages;

          sLinha  :=  FormatFloat('000000',dmMProvider.cdsSelFunExpPdv.FieldByName('OP_FUNCIONARIO').AsInteger)
                    + Format('%-15.15s',[' ' ])
                    + Format('%-50.50s',[RetirarAcento(dmMProvider.cdsSelFunExpPdv.FieldByName('OP_NOME').AsString)])
                    + '00000'           //percentual de comissão padrão
                    + '00000'           //primeiro percentual de comissão sobre venda
                    + '00000'           //segundo percentual de comissão sobre venda
                    + '00000'           //terceiro percentual de comissão sobre venda
                    + '00000'           //quarto percentual de comissão sobre venda
                    + '00000';          //percentual de desconto max em produto

          WriteLn(txtArq, sLinha);

          Next;
        until EOF;
        CloseFile(txtArq);
      end;
    end;

    Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
      + 'O arquivo de FUNCIONÁRIOS / VENDEDORES foi gerado com sucesso!'), 'Atenção!',
      mb_IconInformation + mb_Ok);

    frmAutomacao.pgbProgressoArquivo.Position := 0;

  end;
end;
end.
