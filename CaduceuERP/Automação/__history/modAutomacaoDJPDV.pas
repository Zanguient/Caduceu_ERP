unit modAutomacaoDJPDV;

interface

uses SysUtils, Windows, Forms, IniFiles, Classes, StrUtils, CheckLst, Db,
  variants, Dialogs;

procedure ExportarProdutosDJPDV(sArquivo, sPath: string; iFilial, pGeralAlterados: integer);
procedure ExportarCodigoBarrasDJPDV(sArquivo, sPath: string; iFilial, pGeralAlterados: integer);

implementation

uses dataDBEXMaster, dataMProvider, dataMSource, dataMSProcedure, modAutomacao,
  uConstantes_Padrao, uFuncoes, uFuncoes_BD;

procedure ExportarProdutosDJPDV(sArquivo, sPath: string; iFilial, pGeralAlterados: integer);
var
  txtArq, txtArqTermConsulta: TextFile;
  sLinha, sLinhaTC, sBarras, sStatusProduto, sBarras_Temp, sDescricao, sArqLogBarras: string;
  sLog_Barras:TStringList;
begin

  sLog_Barras             := TStringList.Create;

  // arquivo de produto
  frmAutomacao.edtPastaDestinoPDV.Text          := sPath;
  frmAutomacao.edtArquivoExportadoPDV.Text      := sArquivo;

  dmMProvider.cdsSelProdExpPdv.Close;
  dmMProvider.cdsSelProdExpPdv.ProviderName := 'dspSelProdExpPdv';

  dmDBEXMaster.fdqSelProdExpPdv.Params[0].Value := dmDBEXMaster.iIdFilial;
  dmDBEXMaster.fdqSelProdExpPdv.Params[1].Value := pGeralAlterados;

  dmMProvider.cdsSelProdExpPdv.Open;
  dmMProvider.cdsSelProdExpPdv.ProviderName     := '';

  if dmMProvider.cdsSelProdExpPdv.IsEmpty then
  begin

    Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + #13 + #13 + MSG_ARQ_EXP_PRO_VAZIO), 'Atenção!', mb_IconWarning + mb_Ok);
    exit;

  end

  else
  begin

    FormatSettings.DecimalSeparator       := ',';

    frmAutomacao.pgbProgressoArquivo.Max  := dmMProvider.cdsSelProdExpPdv.RecordCount;

    with dmMProvider.cdsSelProdExpPdv do
    begin

      First;

      if not eof then
      begin

        AssignFile(txtArq, ExtractFilepath(Application.ExeName) + 'Temp\' + sArquivo);

        if (dmMProvider.cdsConfiguracoesMODELO_TERMINAL_CONSULTA.Value > -1) then
          AssignFile(txtArqTermConsulta, ExtractFilepath(Application.ExeName) + 'Temp\' + sArquivo + '_TC');

        ReWrite(txtArq);

        if (dmMProvider.cdsConfiguracoesMODELO_TERMINAL_CONSULTA.Value > -1) then
          ReWrite(txtArqTermConsulta);

        repeat

          frmAutomacao.pgbProgressoArquivo.Position := dmMProvider.cdsSelProdExpPdv.RecNo;
          frmAutomacao.pnlConteudo.Caption          := dmMProvider.cdsSelProdExpPdvOP_DESCRICAO.Value;
          Application.ProcessMessages;

          sDescricao                                := RetirarAcentuacaoString(dmMProvider.cdsSelProdExpPdvOP_DESCRICAO.Value);

          if (dmMProvider.cdsConfiguracoesUTILIZAR_PRECO_ATACADO.Value = 1)  then
          begin

            if dmMProvider.cdsSelProdExpPdvOP_QUANTIDADE.Value > 1 then
            begin

              sBarras_Temp  := dmMProvider.cdsSelProdExpPdvOP_BARRAS.Value;
              sDescricao    := RetirarAcentuacaoString(dmMProvider.cdsSelProdExpPdvOP_DESCRICAO.Value)

            end
            else
              sBarras_Temp  := dmMProvider.cdsSelProdExpPdvOP_BARRAS.Value;

          end
          else
            sBarras_Temp  := dmMProvider.cdsSelProdExpPdvOP_BARRAS.Value;


          if ValidaEAN(Trim(sBarras_Temp)) then
          begin

            case dmMProvider.cdsSelProdExpPdvOP_STATUS.Value of
              0:sStatusProduto := '000';
              1:sStatusProduto := '008';
            end;

            case dmMProvider.cdsConfiguracoesUTILIZAR_DV_EXPORTACAO_PDV.Value of
              0:begin

                  if dmMProvider.cdsSelProdExpPdvOP_GERADO.Value = 1 then
                    sBarras := FormatFloat('00000000000000000000',StrToFloat(Copy(sBarras_Temp, 1, 12)))
                  else
                    sBarras := FormatFloat('00000000000000000000', StrToFloat(sBarras_Temp))

                end;
            else
              sBarras := FormatFloat('00000000000000000000', StrToFloat(sBarras_Temp))

            end;

            sLinhaTC := sBarras + Format('%-44.44s',[sDescricao]);

            sLinha := FormatFloat('00000000000000000000', dmMProvider.cdsSelProdExpPdvOP_PRODUTO.Value)
                        + sBarras
                        + Format('%-40.40s',[sDescricao])
                        + Format('%-20.20s',[dmMProvider.cdsSelProdExpPdvOP_COMPLEMENTO.Value])
                        + Format('%-4.4s',[dmMProvider.cdsSelProdExpPdvOP_UNIDADE.Value]);

            case dmMProvider.cdsSelProdExpPdvOP_PROMOCAO.Value of
              0:begin

                  if (dmMProvider.cdsConfiguracoesUTILIZAR_PRECO_ATACADO.Value = 1)  then
                  begin

                    if(dmMProvider.cdsSelProdExpPdvOP_QUANTIDADE.Value > 1)  then
                    begin

                      sLinha    := sLinha + FormatFloat('000000000000',dmMProvider.cdsSelProdExpPdvOP_PRECO_ATACADO.Value * 100);
                      sLinhaTC  := sLinhaTC + Format('%12.12s',[FormatFloat('#,###,##0.00',dmMProvider.cdsSelProdExpPdvOP_PRECO_ATACADO.Value)])

                    end
                    else
                    begin

                      sLinha    := sLinha + FormatFloat('000000000000',((dmMProvider.cdsSelProdExpPdvOP_PRECO_VENDA.Value * 100)));
                      sLinhaTC  := sLinhaTC + Format('%12.12s',[FormatFloat('#,###,##0.00',dmMProvider.cdsSelProdExpPdvOP_PRECO_VENDA.Value)]);

                    end;

                  end
                  else
                  begin

                    sLinha    := sLinha + FormatFloat('000000000000', ((dmMProvider.cdsSelProdExpPdvOP_PRECO_VENDA.Value  * dmMProvider.cdsSelProdExpPdvOP_QUANTIDADE.Value) * 100));
                    sLinhaTC  := sLinhaTC + Format('%12.12s',[FormatFloat('#,###,##0.00',((dmMProvider.cdsSelProdExpPdvOP_PRECO_VENDA.Value * dmMProvider.cdsSelProdExpPdvOP_QUANTIDADE.Value)))]);

                  end;


                end;
              1:begin

                  if (dmMProvider.cdsConfiguracoesUTILIZAR_PRECO_ATACADO.Value = 1) and (dmMProvider.cdsSelProdExpPdvOP_QUANTIDADE.Value > 1) then
                  begin

                    sLinha    := sLinha + FormatFloat('000000000000',dmMProvider.cdsSelProdExpPdvOP_PRECO_ATACADO.Value * 100);
                    sLinhaTC  := sLinhaTC + Format('%12.12s',[FormatFloat('#,###,##0.00',dmMProvider.cdsSelProdExpPdvOP_PRECO_ATACADO.Value)]);

                  end
                  else if dmMProvider.cdsConfiguracoesUTILIZAR_PRECO_ATACADO.Value = 1 then
                  begin

                    sLinha    := sLinha + FormatFloat('000000000000', ((dmMProvider.cdsSelProdExpPdvOP_PRECO_PROMOCAO.Value * 100)));
                    sLinhaTC  := sLinhaTC + Format('%12.12s',[FormatFloat('#,###,##0.00',dmMProvider.cdsSelProdExpPdvOP_PRECO_PROMOCAO.Value)]);

                  end
                  else
                  begin

                    sLinha    := sLinha + FormatFloat('000000000000', ((dmMProvider.cdsSelProdExpPdvOP_PRECO_PROMOCAO.Value * dmMProvider.cdsSelProdExpPdvOP_QUANTIDADE.Value) * 100));
                    sLinhaTC  := sLinhaTC + Format('%12.12s',[FormatFloat('#,###,##0.00', ((dmMProvider.cdsSelProdExpPdvOP_PRECO_PROMOCAO.Value * dmMProvider.cdsSelProdExpPdvOP_QUANTIDADE.Value)))]);

                  end;

                end;

            end;

            sLinha := sLinha + '000000'                                           //desconto promocional
                        + Format('%-1.1s',[dmMProvider.cdsSelProdExpPdvOP_CODIGO_ECF.Value])
                        + Format('%-4.4s',[FormatFloat('0000',dmMProvider.cdsSelProdExpPdvOP_ALIQUOTA_ICMS.Value * 100)])
                        + Format('%-65.65s',[' ']);                               //observação referente ao produto

            if dmMProvider.cdsSelProdExpPdvOP_PESADO.Value = 1 then
              sLinha := sLinha + 'S'                                              //calcula quantidade produto pesavel
            else
              sLinha := sLinha + 'N';

            if dmMProvider.cdsSelProdExpPdvOP_PERMITE_VENDA_FRAC.Value = 1 then
              sLinha := sLinha + 'S'                                              //permite venda fracionada
            else
              sLinha := sLinha + 'N';

            sLinha := sLinha
                        + 'N'                                                     //permite digitar quantidade
                        + 'N'                                                     //usa configuração do ECF para arredondamento ou truncamento
                        + 'N';                                                    //produção própria


            if dmMProvider.cdsSelProdExpPdvOP_GRUPO.Value > 0 then
            begin

              sLinha := sLinha + FormatFloat('000', dmMProvider.cdsSelProdExpPdvOP_GRUPO.Value)
                               + Format('%-30.30s',[dmMProvider.cdsSelProdExpPdvOP_DESCRICAO_GRUPO.Value])
            end
            else
            begin

              sLinha := sLinha + '000'
                               + Format('%-30.30s',[' ']);

            end;

            sLinha := sLinha + '000'                                              //codigo departamento
                             + Format('%-30.30s',[' '])                           //descrição departamento
                             + '000000'                                           //chave estrangeira tabela marca
                             + Format('%-30.30s',[' '])                           //descrição tabel marca
                             + '000000'                                           //código vasilhame
                             + Format('%-30.30s',[' '])                           //descrição vasilhame
                             + '000000';                                          //código da animação

            if dmMProvider.cdsSelProdExpPdvOP_ATIVO.Value = 1 then
              sLinha := sLinha + '000000'                                         //permite venda
            else
              sLinha := sLinha + FormatFloat('000000',dmMProvider.cdsSelProdExpPdvOP_ATIVO.Value);

            sLinha := sLinha + Format('%-20.20s',[dmMProvider.cdsSelProdExpPdvOP_NCM.Value]);

            sLinha := sLinha + '000000';

            if dmMProvider.cdsSelProdExpPdvOP_GERADO.Value = 0 then
            begin

              sLinha := sLinha + sBarras                                          //gtin contabil
                        + Format('%20.20s',[' '])                                 //ext IPI
                        + sBarras;                                                //gtin tributavel

            end

            else
            begin

              sLinha := sLinha + Format('%20.20s',[' '])                          //gtin contabil
                        + Format('%20.20s',[' '])                                 //ext IPI
                        + Format('%20.20s',[' ']);                                //gtin tributavel

            end;

            sLinha := sLinha + '000000'                                           //chave estrangeira tabela de icms para nfe
                        + '000000'                                                //chave estrangeira tabela de ipi para nfe
                        + '000000'                                                //chave estrangeira tabela de issqn para nfe
                        + '000000'                                                //chave estrangeira tabela de imposto de importacaopara nfe
                        + '000000'                                                //chave estrangeira tabela de pis para nfe
                        + '000000'                                                //chave estrangeira tabela de pis st para nfe
                        + '000000'                                                //chave estrangeira tabela de cofins para nfe
                        + '000000'                                                //chave estrangeira tabela de cofins st para nfe
                        + 'N';                                                    //S = produto é KIT / N = produto não é KIT

            if dmMProvider.cdsSelProdExpPdvOP_SALDO_ATUAL.Value < 0 then
              sLinha := sLinha + FormatFloat('00000000000', dmMProvider.cdsSelProdExpPdvOP_SALDO_ATUAL.Value * 1000)
            else
              sLinha := sLinha + FormatFloat('000000000000', dmMProvider.cdsSelProdExpPdvOP_SALDO_ATUAL.Value * 1000);

            sLinha := sLinha + '000'                                              //prazo para devolução do item
                        + Format('%-7.7s',[dmMProvider.cdsSelProdExpPdvOP_CEST.Value])
                        + 'N'                                                     //S = controla estoque / N = não controla estoque
                        + FormatFloat('000000000', StrToIntDef(dmMProvider.cdsSelProdExpPdvOP_CODIGO_ANP.Value,0));

            WriteLn(txtArq, sLinha);
            if (dmMProvider.cdsConfiguracoesMODELO_TERMINAL_CONSULTA.Value > -1) then
              WriteLn(txtArqTermConsulta, sLinhaTC);

          end
          else
            sLog_Barras.Add('GTIN inválido: '  + sBarras_Temp + ' / ' + sDescricao);
          Next;

        until eof;
        CloseFile(txtArq);

        if (dmMProvider.cdsConfiguracoesMODELO_TERMINAL_CONSULTA.Value > -1) then
          CloseFile(txtArqTermConsulta);

      end;

    end;

    if sLog_Barras.Count > 0 then
    begin

      sLog_Barras.Add('===>>>> esses itens não irão para o caixa');

      sArqLogBarras := ExtractFilepath(Application.ExeName)
                        + 'Temp\Log_GTIN_' + FormatDateTime('ddmmyyyy',Date) + '_' + FormatDateTime('hhmmss',Time) + '.txt';

      sLog_Barras.SaveToFile(sArqLogBarras);

      Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + #13 + #13 + 'Foi gerado um log com erros. Verifique: '
          + sArqLogBarras ), 'Atenção!', mb_IconWarning + mb_Ok);

    end;


    if DirectoryExists(sPath) then
    begin

      CopyFile(PChar(ExtractFilepath(Application.ExeName) + 'Temp\' + sArquivo), PChar(sPath + sArquivo), False);

      if (dmMProvider.cdsConfiguracoesMODELO_TERMINAL_CONSULTA.Value > -1) then
        CopyFile(PChar(ExtractFilepath(Application.ExeName) + 'Temp\' + sArquivo + '_TC'), PChar(sPath + sArquivo + '_TC'), False)

    end
    else
    begin

      Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + #13 + #13 + 'Caminho ' + sPath
                              + ', não encontrado. Favor verificar!'), 'Atenção!', mb_IconWarning + mb_Ok);
      frmAutomacao.pgbProgressoArquivo.Position := 0;

      exit;

    end;

    Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + #13 + #13
                            + 'O arquivo de PRODUTOS foi gerado com sucesso!'), 'Atenção!', mb_IconInformation + mb_Ok);

    frmAutomacao.pgbProgressoArquivo.Position := 0;

  end;

  FormatSettings.DecimalSeparator := '.';

end;
procedure ExportarCodigoBarrasDJPDV(sArquivo, sPath: string; iFilial, pGeralAlterados: integer);
var
  txtArq, txtArqTermConsulta: TextFile;
  sLinha, sLinhaTC, sBarras, sStatusProduto, sBarras_Temp, sDescricao, sArqLogBarras: string;
  sLog_Barras:TStringList;
begin

  sLog_Barras             := TStringList.Create;

  // arquivo de produto
  frmAutomacao.edtPastaDestinoPDV.Text          := sPath;
  frmAutomacao.edtArquivoExportadoPDV.Text      := sArquivo;

  dmMProvider.cdsSelProdExpPdv.Close;
  dmMProvider.cdsSelProdExpPdv.ProviderName := 'dspSelProdExpPdv';

  dmDBEXMaster.fdqSelProdExpPdv.Params[0].Value := dmDBEXMaster.iIdFilial;
  dmDBEXMaster.fdqSelProdExpPdv.Params[1].Value := pGeralAlterados;

  dmMProvider.cdsSelProdExpPdv.Open;
  dmMProvider.cdsSelProdExpPdv.ProviderName     := '';

  if dmMProvider.cdsSelProdExpPdv.IsEmpty then
  begin

    Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + #13 + #13 + MSG_ARQ_EXP_PRO_VAZIO), 'Atenção!', mb_IconWarning + mb_Ok);
    exit;

  end

  else
  begin

    FormatSettings.DecimalSeparator       := ',';

    frmAutomacao.pgbProgressoArquivo.Max  := dmMProvider.cdsSelProdExpPdv.RecordCount;

    with dmMProvider.cdsSelProdExpPdv do
    begin

      First;

      if not eof then
      begin

        AssignFile(txtArq, ExtractFilepath(Application.ExeName) + 'Temp\' + sArquivo);

        if (dmMProvider.cdsConfiguracoesMODELO_TERMINAL_CONSULTA.Value > -1) then
          AssignFile(txtArqTermConsulta, ExtractFilepath(Application.ExeName) + 'Temp\' + sArquivo + '_TC');

        ReWrite(txtArq);

        if (dmMProvider.cdsConfiguracoesMODELO_TERMINAL_CONSULTA.Value > -1) then
          ReWrite(txtArqTermConsulta);

        repeat

          frmAutomacao.pgbProgressoArquivo.Position := dmMProvider.cdsSelProdExpPdv.RecNo;
          frmAutomacao.pnlConteudo.Caption          := dmMProvider.cdsSelProdExpPdvOP_DESCRICAO.Value;
          Application.ProcessMessages;

          sDescricao                                := RetirarAcentuacaoString(dmMProvider.cdsSelProdExpPdvOP_DESCRICAO.Value);

          if (dmMProvider.cdsConfiguracoesUTILIZAR_PRECO_ATACADO.Value = 1)  then
          begin

            if dmMProvider.cdsSelProdExpPdvOP_QUANTIDADE.Value > 1 then
            begin

              sBarras_Temp  := dmMProvider.cdsSelProdExpPdvOP_BARRAS.Value;
              sDescricao    := RetirarAcentuacaoString(dmMProvider.cdsSelProdExpPdvOP_DESCRICAO.Value)

            end
            else
              sBarras_Temp  := dmMProvider.cdsSelProdExpPdvOP_BARRAS.Value;

          end
          else
            sBarras_Temp  := dmMProvider.cdsSelProdExpPdvOP_BARRAS.Value;


          if ValidaEAN(Trim(sBarras_Temp)) then
          begin

            case dmMProvider.cdsSelProdExpPdvOP_STATUS.Value of
              0:sStatusProduto := '000';
              1:sStatusProduto := '008';
            end;

            case dmMProvider.cdsConfiguracoesUTILIZAR_DV_EXPORTACAO_PDV.Value of
              0:begin

                  if dmMProvider.cdsSelProdExpPdvOP_GERADO.Value = 1 then
                    sBarras := FormatFloat('00000000000000000000',StrToFloat(Copy(sBarras_Temp, 1, 12)))
                  else
                    sBarras := FormatFloat('00000000000000000000', StrToFloat(sBarras_Temp))

                end;
            else
              sBarras := FormatFloat('00000000000000000000', StrToFloat(sBarras_Temp))

            end;

            sLinhaTC := sBarras + Format('%-44.44s',[sDescricao]);

            sLinha := FormatFloat('00000000000000000000', dmMProvider.cdsSelProdExpPdvOP_PRODUTO.Value)
                        + sBarras
                        + Format('%-40.40s',[sDescricao])
                        + Format('%-20.20s',[dmMProvider.cdsSelProdExpPdvOP_COMPLEMENTO.Value])
                        + Format('%-4.4s',[dmMProvider.cdsSelProdExpPdvOP_UNIDADE.Value]);

            case dmMProvider.cdsSelProdExpPdvOP_PROMOCAO.Value of
              0:begin

                  if (dmMProvider.cdsConfiguracoesUTILIZAR_PRECO_ATACADO.Value = 1)  then
                  begin

                    if(dmMProvider.cdsSelProdExpPdvOP_QUANTIDADE.Value > 1)  then
                    begin

                      sLinha    := sLinha + FormatFloat('000000000000',dmMProvider.cdsSelProdExpPdvOP_PRECO_ATACADO.Value * 100);
                      sLinhaTC  := sLinhaTC + Format('%12.12s',[FormatFloat('#,###,##0.00',dmMProvider.cdsSelProdExpPdvOP_PRECO_ATACADO.Value)])

                    end
                    else
                    begin

                      sLinha    := sLinha + FormatFloat('000000000000',((dmMProvider.cdsSelProdExpPdvOP_PRECO_VENDA.Value * 100)));
                      sLinhaTC  := sLinhaTC + Format('%12.12s',[FormatFloat('#,###,##0.00',dmMProvider.cdsSelProdExpPdvOP_PRECO_VENDA.Value)]);

                    end;

                  end
                  else
                  begin

                    sLinha    := sLinha + FormatFloat('000000000000', ((dmMProvider.cdsSelProdExpPdvOP_PRECO_VENDA.Value  * dmMProvider.cdsSelProdExpPdvOP_QUANTIDADE.Value) * 100));
                    sLinhaTC  := sLinhaTC + Format('%12.12s',[FormatFloat('#,###,##0.00',((dmMProvider.cdsSelProdExpPdvOP_PRECO_VENDA.Value * dmMProvider.cdsSelProdExpPdvOP_QUANTIDADE.Value)))]);

                  end;


                end;
              1:begin

                  if (dmMProvider.cdsConfiguracoesUTILIZAR_PRECO_ATACADO.Value = 1) and (dmMProvider.cdsSelProdExpPdvOP_QUANTIDADE.Value > 1) then
                  begin

                    sLinha    := sLinha + FormatFloat('000000000000',dmMProvider.cdsSelProdExpPdvOP_PRECO_ATACADO.Value * 100);
                    sLinhaTC  := sLinhaTC + Format('%12.12s',[FormatFloat('#,###,##0.00',dmMProvider.cdsSelProdExpPdvOP_PRECO_ATACADO.Value)]);

                  end
                  else if dmMProvider.cdsConfiguracoesUTILIZAR_PRECO_ATACADO.Value = 1 then
                  begin

                    sLinha    := sLinha + FormatFloat('000000000000', ((dmMProvider.cdsSelProdExpPdvOP_PRECO_PROMOCAO.Value * 100)));
                    sLinhaTC  := sLinhaTC + Format('%12.12s',[FormatFloat('#,###,##0.00',dmMProvider.cdsSelProdExpPdvOP_PRECO_PROMOCAO.Value)]);

                  end
                  else
                  begin

                    sLinha    := sLinha + FormatFloat('000000000000', ((dmMProvider.cdsSelProdExpPdvOP_PRECO_PROMOCAO.Value * dmMProvider.cdsSelProdExpPdvOP_QUANTIDADE.Value) * 100));
                    sLinhaTC  := sLinhaTC + Format('%12.12s',[FormatFloat('#,###,##0.00', ((dmMProvider.cdsSelProdExpPdvOP_PRECO_PROMOCAO.Value * dmMProvider.cdsSelProdExpPdvOP_QUANTIDADE.Value)))]);

                  end;

                end;

            end;

            sLinha := sLinha + '000000'                                           //desconto promocional
                        + Format('%-1.1s',[dmMProvider.cdsSelProdExpPdvOP_CODIGO_ECF.Value])
                        + Format('%-4.4s',[FormatFloat('0000',dmMProvider.cdsSelProdExpPdvOP_ALIQUOTA_ICMS.Value * 100)])
                        + Format('%-65.65s',[' ']);                               //observação referente ao produto

            if dmMProvider.cdsSelProdExpPdvOP_PESADO.Value = 1 then
              sLinha := sLinha + 'S'                                              //calcula quantidade produto pesavel
            else
              sLinha := sLinha + 'N';

            if dmMProvider.cdsSelProdExpPdvOP_PERMITE_VENDA_FRAC.Value = 1 then
              sLinha := sLinha + 'S'                                              //permite venda fracionada
            else
              sLinha := sLinha + 'N';

            sLinha := sLinha
                        + 'N'                                                     //permite digitar quantidade
                        + 'N'                                                     //usa configuração do ECF para arredondamento ou truncamento
                        + 'N';                                                    //produção própria


            if dmMProvider.cdsSelProdExpPdvOP_GRUPO.Value > 0 then
            begin

              sLinha := sLinha + FormatFloat('000', dmMProvider.cdsSelProdExpPdvOP_GRUPO.Value)
                               + Format('%-30.30s',[dmMProvider.cdsSelProdExpPdvOP_DESCRICAO_GRUPO.Value])
            end
            else
            begin

              sLinha := sLinha + '000'
                               + Format('%-30.30s',[' ']);

            end;

            sLinha := sLinha + '000'                                              //codigo departamento
                             + Format('%-30.30s',[' '])                           //descrição departamento
                             + '000000'                                           //chave estrangeira tabela marca
                             + Format('%-30.30s',[' '])                           //descrição tabel marca
                             + '000000'                                           //código vasilhame
                             + Format('%-30.30s',[' '])                           //descrição vasilhame
                             + '000000';                                          //código da animação

            if dmMProvider.cdsSelProdExpPdvOP_ATIVO.Value = 1 then
              sLinha := sLinha + '000000'                                         //permite venda
            else
              sLinha := sLinha + FormatFloat('000000',dmMProvider.cdsSelProdExpPdvOP_ATIVO.Value);

            sLinha := sLinha + Format('%-20.20s',[dmMProvider.cdsSelProdExpPdvOP_NCM.Value]);

            sLinha := sLinha + '000000';

            if dmMProvider.cdsSelProdExpPdvOP_GERADO.Value = 0 then
            begin

              sLinha := sLinha + sBarras                                          //gtin contabil
                        + Format('%20.20s',[' '])                                 //ext IPI
                        + sBarras;                                                //gtin tributavel

            end

            else
            begin

              sLinha := sLinha + Format('%20.20s',[' '])                          //gtin contabil
                        + Format('%20.20s',[' '])                                 //ext IPI
                        + Format('%20.20s',[' ']);                                //gtin tributavel

            end;

            sLinha := sLinha + '000000'                                           //chave estrangeira tabela de icms para nfe
                        + '000000'                                                //chave estrangeira tabela de ipi para nfe
                        + '000000'                                                //chave estrangeira tabela de issqn para nfe
                        + '000000'                                                //chave estrangeira tabela de imposto de importacaopara nfe
                        + '000000'                                                //chave estrangeira tabela de pis para nfe
                        + '000000'                                                //chave estrangeira tabela de pis st para nfe
                        + '000000'                                                //chave estrangeira tabela de cofins para nfe
                        + '000000'                                                //chave estrangeira tabela de cofins st para nfe
                        + 'N'                                                     //S = produto é KIT / N = produto não é KIT
                        + FormatFloat('000000000000', dmMProvider.cdsSelProdExpPdvOP_SALDO_ATUAL.Value * 1000)
                        + '000'                                                   //prazo para devolução do item
                        + Format('7.7s',[dmMProvider.cdsSelProdExpPdvOP_CEST.Value])
                        + 'N'                                                     //S = controla estoque / N = não controla estoque
                        + FormatFloat('000000000', StrToIntDef(dmMProvider.cdsSelProdExpPdvOP_CODIGO_ANP.Value,0));

            WriteLn(txtArq, sLinha);
            if (dmMProvider.cdsConfiguracoesMODELO_TERMINAL_CONSULTA.Value > -1) then
              WriteLn(txtArqTermConsulta, sLinhaTC);

          end
          else
            sLog_Barras.Add('GTIN inválido: '  + sBarras_Temp + ' / ' + sDescricao);
          Next;

        until eof;
        CloseFile(txtArq);

        if (dmMProvider.cdsConfiguracoesMODELO_TERMINAL_CONSULTA.Value > -1) then
          CloseFile(txtArqTermConsulta);

      end;

    end;

    if sLog_Barras.Count > 0 then
    begin

      sLog_Barras.Add('===>>>> esses itens não irão para o caixa');

      sArqLogBarras := ExtractFilepath(Application.ExeName)
                        + 'Temp\Log_GTIN_' + FormatDateTime('ddmmyyyy',Date) + '_' + FormatDateTime('hhmmss',Time) + '.txt';

      sLog_Barras.SaveToFile(sArqLogBarras);

      Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + #13 + #13 + 'Foi gerado um log com erros. Verifique: '
          + sArqLogBarras ), 'Atenção!', mb_IconWarning + mb_Ok);

    end;


    if DirectoryExists(sPath) then
    begin

      CopyFile(PChar(ExtractFilepath(Application.ExeName) + 'Temp\' + sArquivo), PChar(sPath + sArquivo), False);

      if (dmMProvider.cdsConfiguracoesMODELO_TERMINAL_CONSULTA.Value > -1) then
        CopyFile(PChar(ExtractFilepath(Application.ExeName) + 'Temp\' + sArquivo + '_TC'), PChar(sPath + sArquivo + '_TC'), False)

    end
    else
    begin

      Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + #13 + #13 + 'Caminho ' + sPath
                              + ', não encontrado. Favor verificar!'), 'Atenção!', mb_IconWarning + mb_Ok);
      frmAutomacao.pgbProgressoArquivo.Position := 0;

      exit;

    end;

    Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + #13 + #13
                            + 'O arquivo de PRODUTOS foi gerado com sucesso!'), 'Atenção!', mb_IconInformation + mb_Ok);

    frmAutomacao.pgbProgressoArquivo.Position := 0;

  end;

  FormatSettings.DecimalSeparator := '.';

end;

end.
