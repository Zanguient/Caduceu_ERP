unit modAutomacaoSYSPDV;

interface

uses SysUtils, Windows, Forms, IniFiles, Classes, StrUtils, CheckLst,Db,
  variants, Dialogs;

procedure ExportarClientesSYSPDV(sArquivo, sPath: string; iFilial: integer);
procedure ExportarFornecedorSYSPDV(sArquivo, sPath: string; iFilial: integer);
procedure ExportarGrupoProdutoSYSPDV(sArquivo, sPath: string; iFilial: integer);
procedure ExportarProdutosSYSPDV(sArquivo, sPath: string; iFilial, pGeralAlterados: integer);
procedure ExportarBarrasSYSPDV(sArquivo, sPath: string);
procedure ExportarEstoqueSYSPDV(sArquivo, sPath: string);
procedure ImportarVendaSYSPDV(sArquivo, sPath: string; iFilial,pNumCx: integer; bCfgCxs:TCheckListBox);
function ValidarNumeroCaixa(pNumeroCx:string):boolean;

implementation

function ValidarNumeroCaixa(pNumeroCx:string):boolean;
begin

  dmDBEXMaster.sqqConfNumCx.Close;
  dmMProvider.cdsCfgNumCX.Close;

  dmDBEXMaster.sqqConfNumCx.SQL.Clear;
  dmDBEXMaster.sqqConfNumCx.SQL.Add('SELECT * FROM CONFIG_CAIXAS');
  dmDBEXMaster.sqqConfNumCx.SQL.Add('WHERE NUMERO_CAIXA = ' + pNumeroCx);

  dmMProvider.cdsCfgNumCX.Open;

  Result := not dmMProvider.cdsCfgNumCX.IsEmpty;

end;

procedure ExportarEstoqueSYSPDV(sArquivo, sPath: string);
var
  txtArq    : TextFile;
  sLinha, sSaldo: string;
begin

  //arquivo de barras
  frmAutomacao.edtPastaDestinoPDV.Text     := sPath;
  frmAutomacao.edtArquivoExportadoPDV.Text := sArquivo;

  frmAutomacao.pgbProgressoArquivo.Max := dmMProvider.cdsSelProdExpPdv.RecordCount;

  with dmMProvider.cdsSelProdExpPdv do
  begin

    First;

    if not EOF then
    begin

      AssignFile(txtArq, ExtractFilepath(Application.ExeName) + 'Temp\' + sArquivo);
      ReWrite(txtArq);
      repeat

        frmAutomacao.pgbProgressoArquivo.Position := dmMProvider.cdsSelProdExpPdv.Recno;
        Application.ProcessMessages;

        if dmMProvider.cdsSelProdExpPdv.FieldByName('OP_SALDO_ATUAL').AsFloat < 0 then
          sSaldo := FormatFloat('00000000000.00',dmMProvider.cdsSelProdExpPdv.FieldByName('OP_SALDO_ATUAL').AsFloat)
        else
          sSaldo := FormatFloat('000000000000.00',dmMProvider.cdsSelProdExpPdv.FieldByName('OP_SALDO_ATUAL').AsFloat);

        sLinha :=   FormatFloat('00000000000000',StrToFloat(dmMProvider.cdsSelProdExpPdv.FieldByName('OP_BARRAS').AsString))
                  + sSaldo
                  + Format('%8.8s',[' '])
                  + Format('%8.8s',[' ']);


        WriteLn(txtArq, sLinha);
        Next;

      until EOF;

      CloseFile(txtArq);

    end;

    if DirectoryExists(sPath) then
      CopyFile(Pchar(ExtractFilepath(Application.ExeName) + 'Temp\' + sArquivo), Pchar(sPath + sArquivo), False)
    else
    begin
      Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
        + 'Caminho ' + sPath + ', n�o encontrado. Favor verificar!'), 'Aten��o!',
        mb_IconWarning + mb_Ok);
      exit;
    end;

    Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
      + 'O arquivo de ESTOQUE foi gerado com sucesso!'), 'Aten��o!',
      mb_IconInformation + mb_Ok);

    frmAutomacao.pgbProgressoArquivo.Position := 0;

  end;
end;
procedure ExportarBarrasSYSPDV(sArquivo, sPath: string);
var
  txtArq    : TextFile;
  sLinha, sBarras, sStatusProduto: string;
begin

  //arquivo de barras
  frmAutomacao.edtPastaDestinoPDV.Text     := sPath;
  frmAutomacao.edtArquivoExportadoPDV.Text := sArquivo;

  frmAutomacao.pgbProgressoArquivo.Max := dmMProvider.cdsSelProdExpPdv.RecordCount;

  with dmMProvider.cdsSelProdExpPdv do
  begin

    First;

    if not EOF then
    begin

      AssignFile(txtArq, ExtractFilepath(Application.ExeName) + 'Temp\' + sArquivo);
      ReWrite(txtArq);
      repeat

        frmAutomacao.pgbProgressoArquivo.Position := dmMProvider.cdsSelProdExpPdv.Recno;
        Application.ProcessMessages;

        sLinha :=   FormatFloat('00000000000000',StrToFloat(dmMProvider.cdsSelProdExpPdv.FieldByName('OP_BARRAS').AsString))
                  + Format('%20.20s',[dmMProvider.cdsSelProdExpPdv.FieldByName('OP_BARRAS').AsString]);



        WriteLn(txtArq, sLinha);
        Next;

      until EOF;

      CloseFile(txtArq);

    end;

    if DirectoryExists(sPath) then
      CopyFile(Pchar(ExtractFilepath(Application.ExeName) + 'Temp\' + sArquivo), Pchar(sPath + sArquivo), False)
    else
    begin
      Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
        + 'Caminho ' + sPath + ', n�o encontrado. Favor verificar!'), 'Aten��o!',
        mb_IconWarning + mb_Ok);
      exit;
    end;

    Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
      + 'O arquivo de BARRAS foi gerado com sucesso!'), 'Aten��o!',
      mb_IconInformation + mb_Ok);

    frmAutomacao.pgbProgressoArquivo.Position := 0;

  end;

end;

procedure ExportarProdutosSYSPDV(sArquivo, sPath: string; iFilial, pGeralAlterados: integer);
var
  txtArq, txtArqTermConsulta: TextFile;
  sLinha, sLinhaTC, sGrupo, sPesoVariavel, sFornecedor, sAlterado, sDescricao,
  sBarras_Temp, sBarras: string;
  nCusto_Liquido:currency;
begin

  //arquivo de produtos
  frmAutomacao.edtPastaDestinoPDV.Text     := sPath;
  frmAutomacao.edtArquivoExportadoPDV.Text := sArquivo;

  dmMProvider.cdsSelProdExpPdv.Close;
  dmDBEXMaster.sqqSelProdExpPdv.ParamByName('IP_FILIAL').AsInteger := dmDBEXMaster.iIdFilial;
  dmDBEXMaster.sqqSelProdExpPdv.ParamByName('IP_OPCAO').AsInteger  := pGeralAlterados;
  dmMProvider.cdsSelProdExpPdv.Open;

  DecimalSeparator := '.';

  if dmMProvider.cdsSelProdExpPdv.RecordCount <= 0 then
  begin
    Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
      + MSG_ARQ_EXP_PRO_VAZIO), 'Aten��o!', mb_IconWarning + mb_Ok)
  end
  else
  begin

    frmAutomacao.pgbProgressoArquivo.Max := dmMProvider.cdsSelProdExpPdv.RecordCount;

    with dmMProvider.cdsSelProdExpPdv do
    begin

      ExportarBarrasSYSPDV('SYSPAUX.TXT', sPath);
      ExportarEstoqueSYSPDV('SYSPEST.TXT', sPath);

      //arquivo de produtos
      frmAutomacao.edtPastaDestinoPDV.Text     := sPath;
      frmAutomacao.edtArquivoExportadoPDV.Text := sArquivo;

      First;

      if not EOF then
      begin

        AssignFile(txtArq, ExtractFilepath(Application.ExeName) + 'Temp\' + sArquivo);

        if (dmCDSMaster.cdsConfiguracoesMODELO_TERMINAL_CONSULTA.Value > -1) then
          AssignFile(txtArqTermConsulta, ExtractFilepath(Application.ExeName) + 'Temp\' + sArquivo + '_TC');

        ReWrite(txtArq);

        if (dmCDSMaster.cdsConfiguracoesMODELO_TERMINAL_CONSULTA.Value > -1) then
          ReWrite(txtArqTermConsulta);

        repeat

          frmAutomacao.pgbProgressoArquivo.Position := dmMProvider.cdsSelProdExpPdv.Recno;
          Application.ProcessMessages;

          sDescricao    := RetirarAcento(dmMProvider.cdsSelProdExpPdv.FieldByName('OP_DESCRICAO').AsString);

          if dmMProvider.cdsSelProdExpPdv.FieldByName('OP_GRUPO').AsInteger < 0 then
            sGrupo := ''
          else
            sGrupo := IntToStr(dmMProvider.cdsSelProdExpPdv.FieldByName('OP_GRUPO').AsInteger);

          case dmMProvider.cdsSelProdExpPdv.FieldByName('OP_PESADO').AsInteger of
            0:sPesoVariavel := 'N';
            1:sPesoVariavel := 'S';
          end;

          case dmMProvider.cdsSelProdExpPdv.FieldByName('OP_STATUS').AsInteger of
            0:sAlterado := 'N';
            1:sAlterado := 'A';
          end;

          if dmMProvider.cdsSelProdExpPdv.FieldByName('OP_CUSTO_LIQUIDO').AsFloat < 0 then
            nCusto_Liquido := 0
          else
            nCusto_Liquido := dmMProvider.cdsSelProdExpPdv.FieldByName('OP_CUSTO_LIQUIDO').AsFloat;

          if (dmDBEXMaster.clConfiguracoesSistema.UsarPrecoAtacado = 1)  then
          begin

            if dmMProvider.cdsSelProdExpPdv.FieldByName('OP_QUANTIDADE').Value > 1 then
            begin

              sBarras_Temp  := dmMProvider.cdsSelProdExpPdv.FieldByName('OP_BARRAS').Value;

              sDescricao    := RetirarAcento(dmMProvider.cdsSelProdExpPdv.FieldByName('OP_DESCRICAO_ATACADO').AsString);

            end
            else
              sBarras_Temp  := dmMProvider.cdsSelProdExpPdv.FieldByName('OP_BARRAS').Value;

          end
          else
            sBarras_Temp  := dmMProvider.cdsSelProdExpPdv.FieldByName('OP_BARRAS').Value;

          case dmDBEXMaster.clConfiguracoesSistema.UsarDigitoVerExportacao of
            0:begin

                if dmMProvider.cdsSelProdExpPdv.FieldByName('OP_GERADO').Value = 1 then

                  sBarras := FormatFloat('00000000000000',StrToFloat(Copy(sBarras_Temp, 1, 12)))

                else

                  sBarras := FormatFloat('00000000000000', StrToFloat(sBarras_Temp))

              end;
          else

            sBarras := FormatFloat('00000000000000', StrToFloat(sBarras_Temp))

          end;


          sLinhaTC := dmMProvider.cdsSelProdExpPdv.FieldByName('OP_BARRAS').AsString + Format('%-44.44s',[sDescricao]);

          sLinha :=   FormatFloat('00000000000000', StrToFloat(dmMProvider.cdsSelProdExpPdv.FieldByName('OP_BARRAS').AsString))
                    + Format('%-45.45s',[sDescricao])
                    + Format('%-20.20s',[dmMProvider.cdsSelProdExpPdv.FieldByName('OP_DESCRICAO_CUPOM').AsString])
                    + Format('%2.2s',[sGrupo])
                    + 'N'                       //produto paga comiss�o?
                    + Format('%3.3s',[dmMProvider.cdsSelProdExpPdv.FieldByName('OP_CODIGO_ECF').AsString])
                    + sPesoVariavel
                    + '00'                      //codigo do local para impress�o remota
                    + '00.00'                   //comiss�o 1
                    + '00.00'                   //comiss�o 2
                    + '00.00'                   //comiss�o 3
                    + '00.00';                   //desconto m�ximo


          case dmMProvider.cdsSelProdExpPdv.FieldByName('OP_PROMOCAO').AsInteger of
            0:begin

                if (dmDBEXMaster.clConfiguracoesSistema.UsarPrecoAtacado = 1)  then
                begin

                  if(dmMProvider.cdsSelProdExpPdv.FieldByName('OP_QUANTIDADE').AsInteger > 1)  then
                  begin

                    sLinha := sLinha + FormatFloat('0000000000.00',dmMProvider.cdsSelProdExpPdv.FieldByName('OP_PRECO_ATACADO').AsCurrency);
                    sLinhaTC := sLinhaTC + Format('%12.12s',[FormatFloat('#,###,##0.00',dmMProvider.cdsSelProdExpPdv.FieldByName('OP_PRECO_ATACADO').AsCurrency)])

                  end
                  else
                  begin

                    sLinha := sLinha + FormatFloat('0000000000.00',((dmMProvider.cdsSelProdExpPdv.FieldByName('OP_PRECO_VENDA').AsCurrency)));
                    sLinhaTC := sLinhaTC + Format('%12.12s',[FormatFloat('#,###,##0.00',dmMProvider.cdsSelProdExpPdv.FieldByName('OP_PRECO_VENDA').AsCurrency)]);

                  end;

                end
                else
                begin

                  sLinha := sLinha + FormatFloat('0000000000.00', ((dmMProvider.cdsSelProdExpPdv.FieldByName('OP_PRECO_VENDA').AsCurrency
                                    * dmMProvider.cdsSelProdExpPdv.FieldByName('OP_QUANTIDADE').AsInteger)));
                  sLinhaTC := sLinhaTC + Format('%12.12s',[FormatFloat('#,###,##0.00',((dmMProvider.cdsSelProdExpPdv.FieldByName('OP_PRECO_VENDA').AsCurrency
                                    * dmMProvider.cdsSelProdExpPdv.FieldByName('OP_QUANTIDADE').AsInteger)))]);

                end;

              end;
            1:begin

                if (dmDBEXMaster.clConfiguracoesSistema.UsarPrecoAtacado = 1) and (dmMProvider.cdsSelProdExpPdv.FieldByName('OP_QUANTIDADE').AsInteger > 1) then
                begin

                  sLinha := sLinha + FormatFloat('0000000000.00',dmMProvider.cdsSelProdExpPdv.FieldByName('OP_PRECO_ATACADO').AsCurrency);
                  sLinhaTC := sLinhaTC + Format('%12.12s',[FormatFloat('#,###,##0.00',dmMProvider.cdsSelProdExpPdv.FieldByName('OP_PRECO_ATACADO').AsCurrency)]);

                end
                else if dmDBEXMaster.clConfiguracoesSistema.UsarPrecoAtacado = 1 then
                begin

                  sLinha := sLinha + FormatFloat('0000000000.00',((dmMProvider.cdsSelProdExpPdv.FieldByName('OP_PRECO_PROMOCAO').AsCurrency)));
                  sLinhaTC := sLinhaTC + Format('%12.12s',[FormatFloat('#,###,##0.00',dmMProvider.cdsSelProdExpPdv.FieldByName('OP_PRECO_PROMOCAO').AsCurrency)]);

                end
                else
                begin

                  sLinha := sLinha + FormatFloat('0000000000.00',((dmMProvider.cdsSelProdExpPdv.FieldByName('OP_PRECO_PROMOCAO').AsCurrency
                                    * dmMProvider.cdsSelProdExpPdv.FieldByName('OP_QUANTIDADE').AsInteger)));
                  sLinhaTC := sLinhaTC + Format('%12.12s',[FormatFloat('#,###,##0.00',((dmMProvider.cdsSelProdExpPdv.FieldByName('OP_PRECO_PROMOCAO').AsCurrency
                                    * dmMProvider.cdsSelProdExpPdv.FieldByName('OP_QUANTIDADE').AsInteger)))]);

                end;
              end;

          end;

          //                     + FormatFloat('0000000000.00',dmMProvider.cdsSelProdExpPdv.FieldByName('OP_PRECO_VENDA').AsFloat)
          if dmMProvider.cdsSelProdExpPdv.FieldByName('OP_PROMOCAO').AsInteger = 1 then
            sLinha := sLinha + FormatFloat('0000000000.00',dmMProvider.cdsSelProdExpPdv.FieldByName('OP_PRECO_PROMOCAO').AsFloat)
          else
            sLinha := sLinha + FormatFloat('0000000000.00',dmMProvider.cdsSelProdExpPdv.FieldByName('OP_PRECO_PROMOCAO').AsFloat);

            sLinha  := sLinha + '000'                     //dias de validade
                    + 'N'            //pre�o vari�vel
                    + 'N'                       //lista pra frente de loja
                    + '0000000000.00'           //estoque m�nimo
                    + '0000000000.00'           //estoque m�ximo
                    + '0000' //FormatFloat('0000',dmMProvider.cdsSelProdExpPdv.FieldByName('OP_FORNECEDOR').AsInteger)
                    + '0000000000.00'           //pre�o de venda 2
                    + '0000000000.00'           //pre�o de oferta 2
                    + '0000000000.00'           //pre�o de venda 3
                    + '0000000000.00'           //pre�o de oferta 3
                    + '0'                       //tabela A origem do produto
                    + Format('%1.1s',[' '])     //tipo de bonifica��o
                    + '0000000000.00'           //fator de bonifina��o
                    + FormatDateTime('yyyymmdd',dmMProvider.cdsSelProdExpPdv.FieldByName('OP_DATA_REMARCACAO').AsDateTime)
                    + '0'                       //quantidade de etiquetas pra impress�o
                    + Format('%3.3s',[dmMProvider.cdsSelProdExpPdv.FieldByName('OP_UNIDADE').AsString])
                    + sAlterado
                    + FormatFloat('0000000000.00',nCusto_Liquido)
                    + 'N'                       //controla n�mero de serie?
                    + 'S'                       //controla estoque?
                    + 'S'                       //permite desconto
                    + Format('%1.1s',[' '])     //especializacao do produto
                    + 'N'                       //composi��o
                    + sPesoVariavel             //enviar para balan�a
                    + 'N'                       //controla validade
                    + '0000.00'                 //margem venda 1
                    + '0000.00'                 //margem venda 2
                    + '0000.00'                 //margem venda 3
                    + Format('%1.1s',[' '])     //mix produto
                    + Format('%8.8s',[' '])     //data de inclus�o
                    + Format('%8.8s',[' '])     //data de sa�da de linha
                    + FormatDateTime('yyyymmdd',dmMProvider.cdsSelProdExpPdv.FieldByName('OP_DATA_REMARCACAO').AsDateTime)
                    + Format('%8.8s',[' '])     //data reajuste pre�o 2
                    + Format('%8.8s',[' '])     //data reajuste pre�o 3
                    + 'N'                       //permite alterar descri��o na pre-venda?
                    + Format('%20.20s',[' '])   //endere�o de estoque ou loja onde est� localizado o produto
                    + '000000.00'               //quantidade minima para vender com pre�o 2
                    + '000000.00'               //quantidade minima para vender com pre�o 3
                    + '000'                     //codigo subgrupo
                    + '000'                     //codigo secao
                    + FormatFloat('0000000000.00',dmMProvider.cdsSelProdExpPdv.FieldByName('OP_QUANTIDADE').AsFloat)
                    + '000000.00'               //quantidade minima oferta
                    + '00000.000'               //peso bruto
                    + '00000.000'               //peso liquido
                    + Format('%3.3s',[' '])     //unidade de referencia
                    + '0000000000.00'           //medida de referencia
                    + FormatFloat('000',dmMProvider.cdsSelProdExpPdv.FieldByName('OP_TIPO_ITEM').AsInteger)
                    + Format('%35.35s',[' '])   //descri��o complementra do produto
                    + Format('%20.20s',[' '])   //reservado
                    + Format('%3.3s',[' '])     //unidade de compra
                    + Format('%3.3s',[' '])     //reservado
                    + FormatFloat('000',dmMProvider.cdsSelProdExpPdv.FieldByName('OP_NAT_REC').AsInteger)
                    + Format('%8.8s',[dmMProvider.cdsSelProdExpPdv.FieldByName('OP_NCM').AsString])
                    + FormatFloat('00',dmMProvider.cdsSelProdExpPdv.FieldByName('OP_EX_TIPI').AsInteger);


          WriteLn(txtArq, sLinha);

          if (dmCDSMaster.cdsConfiguracoesMODELO_TERMINAL_CONSULTA.Value > -1) then
            WriteLn(txtArqTermConsulta, sLinhaTC);

          Next;

        until EOF;

        CloseFile(txtArq);

      end;
    end;

    if DirectoryExists(sPath) then
      CopyFile(Pchar(ExtractFilepath(Application.ExeName) + 'Temp\' + sArquivo), Pchar(sPath + sArquivo), False)
    else
    begin
      Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
        + 'Caminho ' + sPath + ', n�o encontrado. Favor verificar!'), 'Aten��o!',
        mb_IconWarning + mb_Ok);
      exit;
    end;

    Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
      + 'O arquivo de PRODUTOS foi gerado com sucesso!'), 'Aten��o!',
      mb_IconInformation + mb_Ok);

    frmAutomacao.pgbProgressoArquivo.Position := 0;
    DecimalSeparator := ',';

  end;

end;
procedure ExportarFornecedorSYSPDV(sArquivo, sPath: string; iFilial: integer);
var
  txtArq: TextFile;
  sLinha,sDDD, sTelefone, sCep, sCepCobr, sInscricao: string;
begin

  //arquivo de clinte
  frmAutomacao.edtPastaDestinoPDV.Text     := sPath;
  frmAutomacao.edtArquivoExportadoPDV.Text := sArquivo;

  dmMProvider.cdsSelForEXPPDV.Close;
  dmMProvider.cdsSelForEXPPDV.Open;
  DecimalSeparator := '.';

  if dmMProvider.cdsSelForEXPPDV.RecordCount <= 0 then
  begin
    Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
      + MSG_ARQ_EXP_FOR_VAZIO), 'Aten��o!', mb_IconWarning + mb_Ok)
  end
  else
  begin

    frmAutomacao.pgbProgressoArquivo.Max := dmMProvider.cdsSelForEXPPDV.RecordCount;

    with dmMProvider.cdsSelForEXPPDV do
    begin

      First;

      if not EOF then
      begin

        AssignFile(txtArq, ExtractFilepath(Application.ExeName) + 'Temp\' + sArquivo);
        ReWrite(txtArq);
        repeat

          frmAutomacao.pgbProgressoArquivo.Position := dmMProvider.cdsSelForEXPPDV.Recno;
          Application.ProcessMessages;

          sLinha :=   FormatFloat('0000', dmMProvider.cdsSelForEXPPDV.FieldByName('OP_FORNECEDOR').AsInteger)
                    + Format('%-40.40s',[dmMProvider.cdsSelForEXPPDV.FieldByName('OP_RAZAO_SOCIAL').AsString])
                    + Format('%-40.40s',[dmMProvider.cdsSelForEXPPDV.FieldByName('OP_ENDERECO').AsString])
                    + Format('%-20.20s',[dmMProvider.cdsSelForEXPPDV.FieldByName('OP_BAIRRO').AsString])
                    + Format('%-15.15s',[dmMProvider.cdsSelForEXPPDV.FieldByName('OP_NOME_CIDADE').AsString])
                    + Format('%-2.2s',[dmMProvider.cdsSelForEXPPDV.FieldByName('OP_ESTADO').AsString])
                    + FormatFloat('000000000000000',StrToFloatDef(Trim(LimparCpnjInscricao(dmMProvider.cdsSelForEXPPDV.FieldByName('OP_DDD').AsString))
                                                             + Trim(LimparCpnjInscricao(dmMProvider.cdsSelForEXPPDV.FieldByName('OP_TELEFONE').AsString)),0))
                    + FormatFloat('000000000000000',StrToFloatDef(Trim(LimparCpnjInscricao(dmMProvider.cdsSelForEXPPDV.FieldByName('OP_DDD').AsString))
                                                             + Trim(LimparCpnjInscricao(dmMProvider.cdsSelForEXPPDV.FieldByName('OP_FAX').AsString)),0))
                    + FormatFloat('0000000000',StrToFloatDef(Trim(LimparCpnjInscricao(dmMProvider.cdsSelForEXPPDV.FieldByName('OP_CEP').AsString)),0))
                    + Format('%-15.15s',[dmMProvider.cdsSelForEXPPDV.FieldByName('OP_CONTATO').AsString])
                    + Format('%-70.70s',[dmMProvider.cdsSelForEXPPDV.FieldByName('OP_OBSERVACAO').AsString])
                    + Format('%-15.15s',[dmMProvider.cdsSelForEXPPDV.FieldByName('OP_FANTASIA').AsString])
                    + FormatFloat('000000', dmMProvider.cdsSelForEXPPDV.FieldByName('OP_FORNECEDOR').AsInteger)
                    + Format('%-15.15s',[dmMProvider.cdsSelForEXPPDV.FieldByName('OP_COMPLEMENTO').AsString])
                    + Format('%-14.14s',[dmMProvider.cdsSelForEXPPDV.FieldByName('OP_CNPJ').AsString]);

          WriteLn(txtArq, sLinha);
          Next;

        until EOF;

        CloseFile(txtArq);

      end;
    end;

    if DirectoryExists(sPath) then
      CopyFile(Pchar(ExtractFilepath(Application.ExeName) + 'Temp\' + sArquivo), Pchar(sPath + sArquivo), False)
    else
    begin
      Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
        + 'Caminho ' + sPath + ', n�o encontrado. Favor verificar!'), 'Aten��o!',
        mb_IconWarning + mb_Ok);
      exit;
    end;

    Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
      + 'O arquivo de FORNECEDOR foi gerado com sucesso!'), 'Aten��o!',
      mb_IconInformation + mb_Ok);

    frmAutomacao.pgbProgressoArquivo.Position := 0;
    DecimalSeparator := ',';

  end;

end;

procedure ExportarGrupoProdutoSYSPDV(sArquivo, sPath: string; iFilial: integer);
var
  txtArq: TextFile;
  sLinha:string;
begin

  //arquivo de grupos
  frmAutomacao.edtPastaDestinoPDV.Text     := sPath;
  frmAutomacao.edtArquivoExportadoPDV.Text := sArquivo;

  dmMProvider.cdsSelGrupoExpPdv.Close;
  dmMProvider.cdsSelGrupoExpPdv.Open;
  DecimalSeparator := '.';

  if dmMProvider.cdsSelGrupoExpPdv.RecordCount <= 0 then
  begin
    Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
      + MSG_ARQ_EXP_GRP_VAZIO), 'Aten��o!', mb_IconWarning + mb_Ok)
  end
  else
  begin

    frmAutomacao.pgbProgressoArquivo.Max := dmMProvider.cdsSelGrupoExpPdv.RecordCount;

    with dmMProvider.cdsSelGrupoExpPdv do
    begin

      First;

      if not EOF then
      begin

        AssignFile(txtArq, ExtractFilepath(Application.ExeName) + 'Temp\' + sArquivo);
        ReWrite(txtArq);
        repeat

          frmAutomacao.pgbProgressoArquivo.Position := dmMProvider.cdsSelGrupoExpPdv.Recno;
          Application.ProcessMessages;

          sLinha :=   FormatFloat('00', dmMProvider.cdsSelGrupoExpPdv.FieldByName('OP_GRUPO').AsInteger)
                    + Format('%-30.30s',[dmMProvider.cdsSelGrupoExpPdv.FieldByName('OP_DESCRICAO').AsString]);


          WriteLn(txtArq, sLinha);
          Next;

        until EOF;

        CloseFile(txtArq);

      end;
    end;

    if DirectoryExists(sPath) then
      CopyFile(Pchar(ExtractFilepath(Application.ExeName) + 'Temp\' + sArquivo), Pchar(sPath + sArquivo), False)
    else
    begin
      Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
        + 'Caminho ' + sPath + ', n�o encontrado. Favor verificar!'), 'Aten��o!',
        mb_IconWarning + mb_Ok);
      exit;
    end;

    Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
      + 'O arquivo de GRUPOS foi gerado com sucesso!'), 'Aten��o!',
      mb_IconInformation + mb_Ok);

    frmAutomacao.pgbProgressoArquivo.Position := 0;
    DecimalSeparator := ',';

  end;

end;

procedure ExportarClientesSYSPDV(sArquivo, sPath: string; iFilial: integer);
var
  txtArq: TextFile;
  sLinha,sDDD, sTelefone, sCep, sCepCobr, sInscricao: string;
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
      + MSG_ARQ_EXP_CLI_VAZIO), 'Aten��o!', mb_IconWarning + mb_Ok)
  end
  else
  begin

    frmAutomacao.pgbProgressoArquivo.Max := dmMProvider.cdsSelCliExportacao.RecordCount;

    with dmMProvider.cdsSelCliExportacao do
    begin

      First;

      if not EOF then
      begin

        AssignFile(txtArq, ExtractFilepath(Application.ExeName) + 'Temp\' + sArquivo);
        ReWrite(txtArq);
        repeat

          frmAutomacao.pgbProgressoArquivo.Position := dmMProvider.cdsSelCliExportacao.Recno;
          Application.ProcessMessages;

          if ValidarCnpjCpf(LimparCpnjInscricao(dmMProvider.cdsSelCliExportacao.FieldByName('OP_CNPJ').AsString)) then
          begin

            sDDD      := LimparCpnjInscricao(Trim(dmMProvider.cdsSelCliExportacao.FieldByName('OP_DDD').AsString));
            sTelefone := LimparCpnjInscricao(Trim(dmMProvider.cdsSelCliExportacao.FieldByName('OP_TELEFONE1').AsString));
            sCep      := LimparCpnjInscricao(Trim(dmMProvider.cdsSelCliExportacao.FieldByName('OP_CEP').AsString));
            sCepCobr  := LimparCpnjInscricao(Trim(dmMProvider.cdsSelCliExportacao.FieldByName('OP_CEP_COBRANCA').AsString));
            sInscricao:= LimparCpnjInscricao(Trim(dmMProvider.cdsSelCliExportacao.FieldByName('OP_INSCRICAO').AsString));

            sLinha :=  FormatFloat('000000000000000', dmMProvider.cdsSelCliExportacao.FieldByName('OP_CLIENTE').AsInteger)
                     + Format('%-40.40s',[dmMProvider.cdsSelCliExportacao.FieldByName('OP_RAZAO_SOCIAL').AsString])
                     + FormatFloat('00000000000000',StrToFloatDef(dmMProvider.cdsSelCliExportacao.FieldByName('OP_CNPJ').AsString,0))
                     + Format('%-45.45s',[dmMProvider.cdsSelCliExportacao.FieldByName('OP_ENDERECO').AsString
                     + ', ' + IntToStr(dmMProvider.cdsSelCliExportacao.FieldByName('OP_NUMERO').AsInteger)])
                     + Format('%-15.15s',[dmMProvider.cdsSelCliExportacao.FieldByName('OP_BAIRRO').AsString])
                     + Format('%-20.20s',[dmMProvider.cdsSelCliExportacao.FieldByName('OP_NOME_CIDADE').AsString])
                     + Format('%-2.2s',[dmMProvider.cdsSelCliExportacao.FieldByName('OP_ESTADO').AsString])
                     + FormatFloat('00000000',StrToFloatDef(sCep,0))
                     + FormatFloat('000000000000',StrToFloatDef(sDDD + sTelefone,0))
                     + FormatFloat('0000000000.00', dmMProvider.cdsSelCliExportacao.FieldByName('OP_LIMITE_CREDITO').AsFloat)
                     + FormatFloat('0000000000.00', dmMProvider.cdsSelCliExportacao.FieldByName('OP_SALDO_DEVEDOR').AsFloat)
{verificar codigos}  + FormatFloat('00', dmMProvider.cdsSelCliExportacao.FieldByName('OP_STATUS').AsInteger)
{verificar codigos}  + '000' //tabela de prazos
{verificar codigos}  + '000' //prazos
                     + Format('%-25.25s',[dmMProvider.cdsSelCliExportacao.FieldByName('OP_FANTASIA').AsString])
                     + FormatFloat('00000000000000000000',StrToFloatDef(sInscricao,0))
                     + FormatDateTime('yyyymmdd',dmMProvider.cdsSelCliExportacao.FieldByName('OP_CADASTRO').AsDateTime)
                     + FormatDateTime('yyyymmdd',dmMProvider.cdsSelCliExportacao.FieldByName('OP_NASCIMENTO').AsDateTime)
{verificar }         + Format('%-8.8s',[' '])       //data bloqueio
{verificar }         + Format('%-30.30s',[' '])     //nome do pai
{verificar }         + Format('%-30.30s',[' ']);    //nome da m�e

            case dmMProvider.cdsSelCliExportacao.FieldByName('OP_TIPO').AsInteger of
              0:sLinha := sLinha + 'F';
              1:sLinha := sLinha + 'J';
            else
              sLinha := sLinha + 'F';
            end;

            sLinha := sLinha + FormatFloat('000000000000',StrToFloatDef(sDDD + sTelefone,0))
                      + Format('%-12.12s',[' ']) // fax
                      + Format('%-15.15s',[dmMProvider.cdsSelCliExportacao.FieldByName('OP_CONTATO').AsString])
                      + Format('%-45.45s',[dmMProvider.cdsSelCliExportacao.FieldByName('OP_ENDERECO_COBRANCA').AsString])
                      + Format('%-15.15s',[dmMProvider.cdsSelCliExportacao.FieldByName('OP_BAIRRO_COBRANCA').AsString])
                      + FormatFloat('0000000000',StrToFloatDef(sCepCobr,0))
                      + Format('%-20.20s',[dmMProvider.cdsSelCliExportacao.FieldByName('OP_CIDADE_COBRANCA').AsString])
                      + Format('%-2.2s',[dmMProvider.cdsSelCliExportacao.FieldByName('OP_ESTADO_COBRANCA').AsString])
                      + Format('%-13.13s',[' '])    //desconto
                      + Format('%-255.255s',[' '])  //observacao
                      + Format('%-255.255s',[' '])  //restri��es
                      + Format('%-10.10s',[' '])    //administrador do cartao
                      + Format('%-20.20s',[' '])    //numero do cartao
                      + Format('%-5.5s',[' '])      //validade do cartao
                      + Format('%-70.70s',[dmMProvider.cdsSelCliExportacao.FieldByName('OP_EMAIL').AsString])
                      + Format('%-8.8s',[' '])      //data ultima alteracao
                      + Format('%-7.7s',[' ']);     //codigo atividade economica


            case dmMProvider.cdsSelCliExportacao.FieldByName('OP_SEXO').AsInteger of
              0:sLinha := sLinha + 'M';
              1:sLinha := sLinha + 'F';
            else
              sLinha := sLinha + 'M';
            end;

            sLinha := sLinha + Format('%1.1s',[' ']) //tipo de residencias
                      + Format('%-10.10s',[' '])      // tempo de residencia
                      + Format('%-50.50s',[' '])      // veiculo
                      + Format('%-50.50s',[dmMProvider.cdsSelCliExportacao.FieldByName('OP_PONTO_REFERENCIA').AsString])
                      + Format('%-1.1s',[' '])        //comprovante de endereco
                      + Format('%-1.1s',[' '])        //comprovante de renda
                      + Format('%-1.1s',[' '])        //comprovante de renda conjuge
                      + Format('%-40.40s',[' '])      //empresa onde trabalha
                      + Format('%-12.12s',[' '])      //telefone do trabalho
                      + Format('%-20.20s',[' '])      //cargo na empresa onde trabalha
                      + Format('%-10.10s',[' '])      //tempo de empresa
                      + Format('%-50.50s',[' '])      //endere�o empresa onde trabalha
                      + Format('%-20.20s',[' '])      //nome do chefe
                      + FormatFloat('0000000000.00', (dmMProvider.cdsSelCliExportacao.FieldByName('OP_RENDA').AsFloat))
                      + Format('%-40.40s',[' ']);      //outras rendas

            case dmMProvider.cdsSelCliExportacao.FieldByName('OP_ESTADO_CIVIL').AsInteger of
              0:sLinha := sLinha + 'S';
              1:sLinha := sLinha + 'C';
              3:sLinha := sLinha + 'D';
              4:sLinha := sLinha + 'V';
            else
              sLinha := sLinha + 'O';
            end;

            sLinha := sLinha + Format('%-40.40s',[' ']) //nome do conjuge
                      + Format('%-8.8s',[' '])          //data nascimento conjuge
                      + Format('%-40.40s',[' '])        //nome emprsa conjuge
                      + Format('%-12.12s',[' '])        //telefone emprsa conjuge
                      + Format('%-20.20s',[' '])        //cargo do conjuge
                      + Format('%-20.20s',[' '])        //nome do chefe do conjuge
                      + '0000000000.00'                 //sal�rio do conjuge
                      + Format('%-40.40s',[' '])        //referencia 1 do conjuge
                      + Format('%-12.12s',[' '])        //telefone referencia 1 do conjuge
                      + Format('%-50.50s',[' '])        //endere�o referencia 1 do conjuge
                      + Format('%-40.40s',[' '])        //referencia 2 do conjuge
                      + Format('%-12.12s',[' '])        //telefone referencia 2 do conjuge
                      + Format('%-50.50s',[' '])        //endere�o referencia 2 do conjuge
                      + Format('%-40.40s',[' '])        //nome da referencia comercial1 do conjuge
                      + Format('%-12.12s',[' '])        //telefone comercial referencia 1 do conjuge
                      + Format('%-40.40s',[' '])        //nome da referencia comercial 2 do conjuge
                      + Format('%-12.12s',[' '])        //telefone comercial referencia 2 do conjuge
                      + Format('%-15.15s',[' '])        //referencia bancaria
                      + Format('%-15.15s',[' '])        //referencia bancaria agencia
                      + Format('%-15.15s',[' '])        //referencia bancaria conta
                      + Format('%-1.1s',[' '])          //tipo de conta
                      + Format('%-15.15s',[' '])        //referencia bancaria 2
                      + Format('%-15.15s',[' '])        //referencia bancaria agencia 2
                      + Format('%-15.15s',[' '])        //referencia bancaria conta 2
                      + Format('%-1.1s',[' '])          //tipo de conta 2
                      + Format('%-20.20s',[' '])        //ticket
                      + Format('%-40.40s',[' '])        //nome do dependente 1
                      + Format('%-10.10s',[' '])        //parentesco do dependente 1
                      + Format('%-12.12s',[' '])        //telefone dependente 1
                      + Format('%-40.40s',[' '])        //nome do dependente 2
                      + Format('%-10.10s',[' '])        //parentesco do dependente 2
                      + Format('%-12.12s',[' '])        //telefone dependente 2
                      + Format('%-20.20s',[' '])        //situacao SPC
                      + Format('%-20.20s',[' '])        //nome contato SPC
                      + Format('%-20.20s',[' '])        //situa��o do tele cheque
                      + Format('%-20.20s',[' '])        //nome contato tele cheque
                      + Format('%-40.40s',[' '])        //observa��o da situa��o
                      + Format('%-1.1s',[' '])          //situa�o da aprova��o do cadastro
                      + Format('%-20.20s',[' '])        //pessoa que autorizou o cadastro
                      + Format('%-2.2s',[' '])          //dia de fechamento da fatura
                      + Format('%-20.20s',[' '])        //naturalidade
                      + Format('%-6.6s',[' '])          //org�o expedidor da RG
                      + Format('%-1.1s',[' '])          //tipo de pre�o
                      + Format('%-3.3s',[' '])          //ramo de atividade
                      + Format('%-5.5s',[' '])          //complemento bairro
                      + Format('%-5.5s',[' '])          //complemento bairro cobran�a
                      + FormatFloat('000000', (dmMProvider.cdsSelCliExportacao.FieldByName('OP_NUMERO').AsInteger))
                      + FormatFloat('000000', (dmMProvider.cdsSelCliExportacao.FieldByName('OP_NUMERO_COBR').AsInteger))
                      + Format('%-12.12s',[dmMProvider.cdsSelCliExportacao.FieldByName('OP_COMPLEMENTO').AsString])
                      + Format('%-12.12s',[' '])        //complemento endere�o cobran�a
                      + Format('%-4.4s',[' '])          //vendedor
                      + Format('%-13.13s',[' '])        //limite de credito 2
                      + Format('%-13.13s',[' '])        //limite de credito utilizado
                      + FormatFloat('000000', (dmMProvider.cdsSelCliExportacao.FieldByName('OP_CLIENTE').AsInteger))
                      + Format('%-6.6s',[' ']);         //vendedor


            WriteLn(txtArq, sLinha);

          end;
          Next;
        until EOF;
        CloseFile(txtArq);
      end;
    end;

    if DirectoryExists(sPath) then
      CopyFile(Pchar(ExtractFilepath(Application.ExeName) + 'Temp\' + sArquivo), Pchar(sPath + sArquivo), False)
    else
    begin
      Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
        + 'Caminho ' + sPath + ', n�o encontrado. Favor verificar!'), 'Aten��o!',
        mb_IconWarning + mb_Ok);
      exit;
    end;

    Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario +#13 + #13
      + 'O arquivo de CLIENTES foi gerado com sucesso!'), 'Aten��o!',
      mb_IconInformation + mb_Ok);

    frmAutomacao.pgbProgressoArquivo.Position := 0;
    DecimalSeparator := ',';

  end;
end;
procedure ImportarVendaSYSPDV(sArquivo, sPath: string; iFilial,pNumCx: integer; bCfgCxs:TCheckListBox);
var
  tsArquivo: TStringList;
  i, iTipoRegistro, iHora, iContador_item:integer;
  sLinha, sBarras, sFinalizadora, sCliente, sCupom_anterior, sCaixa:string;

begin

  iTipoRegistro     := 0;
  iHora             := 0;
  tsArquivo         := TStringList.Create;
  sCupom_anterior   := '-1';
  sCaixa            := '-1';
  iContador_item    := 0;

  tsArquivo.LoadFromFile(sPath + sArquivo);

  frmAutomacao.pgbProgressoImportacao.Max := tsArquivo.Count;

  iContador_item := 0;

  //validar redu��o Z.

  dmCDSMaster.cdsValidarCX_Sys.Close;
  dmCDSMaster.cdsValidarCX_Sys.CreateDataSet;

  for i := tsArquivo.Count - 1 downto 0 do
  begin

    sLinha        := tsArquivo[i];

    iTipoRegistro := StrToInt(Copy(sLinha,1,2));

    if iTipoRegistro = 3 then
    begin

      if ValidarNumeroCaixa(IntToStr(StrToIntDef(Copy(sLinha, 7, 3), 1))) then
      begin

        dmCDSMaster.cdsValidarCX_Sys.Append;
        dmCDSMaster.cdsValidarCX_SysECF.Value               := StrToIntDef(Copy(sLinha,7,3),1);
        dmCDSMaster.cdsValidarCX_SysNUMERO_SERIE_ECF.Value  := Trim(Copy(sLinha,387,20));
        dmCDSMaster.cdsValidarCX_Sys.Post;

      end;

    end;

  end;

  for i := 0 to tsArquivo.Count - 1 do
  begin

    slinha        := tsArquivo[i];

    iTipoRegistro := StrToInt(Copy(sLinha,1,2));

    frmAutomacao.pgbProgressoImportacao.Position := i;

    frmAutomacao.lblMsgProgresso.Visible := True;
    frmAutomacao.lblMsgProgresso.Caption := ' Efetuando leitura do arquivo. Linha: ' + IntToStr(i)
                                              + '/' + IntToStr(frmAutomacao.pgbProgressoImportacao.Max);
    Application.ProcessMessages;

    case iTipoRegistro of
      1:begin

          if ValidarNumeroCaixa(IntToStr(StrToIntDef(Copy(sLinha, 7, 3), 1))) then
          begin

            if Length(FloatToStr(StrToFloat(Copy(sLinha, 44, 14)))) <= 13 then
            begin

              if dmDBEXMaster.clConfiguracoesSistema.UsarDigitoVerExportacao = 0 then
              begin

                sBarras := FloatToStr(StrToFloat(Copy(sLinha, 44, 14)));

                if Length(sBarras) < 8 then

                  sBarras := GerarCodigodeBarras(Copy(sLinha, 44, 14))

                else

                  sBarras := Copy(sLinha, 44, 14);

              end
              else
                sBarras := Copy(sLinha, 44, 14);

            end
            else
              sBarras := FloatToStr(StrToFloat(Copy(sLinha, 44, 14)));

            if  (sCupom_anterior <> Copy(sLinha, 143, 6)) or (sCaixa <> Copy(sLinha, 7, 3)) then
            begin

              iContador_item := 1;

              sCupom_anterior := Copy(sLinha, 143, 6);
              sCaixa          := Copy(sLinha, 7, 3);

            end
            else
              inc(iContador_item);

            dmMProvider.cdsImpCupom.Append;
            dmMProvider.cdsImpCupomNUMERO_CAIXA.Value := StrToIntDef(Copy(sLinha, 7, 3), 1);
            dmMProvider.cdsImpCupomNUMERO_CUPOM.Value := StrToIntDef(Copy(sLinha, 143, 6), 1);
            dmMProvider.cdsImpCupomSERIE_ECF.Value    := dmMProvider.cdsCfgNumCX.FieldByName('NUMERO_SERIE_ECF').Value;
            dmMProvider.cdsImpCupomCFOP.Value         := '5102';

            dmDBEXMaster.sqqAliquotas.Close;
            dmDBEXMaster.sqqAliquotas.SQL.Clear;
            dmDBEXMaster.sqqAliquotas.SQL.Add('SELECT * FROM ALIQUOTAS');
            dmDBEXMaster.sqqAliquotas.SQL.Add('WHERE CODIGOECF = ' + QuoTedStr(Copy(sLinha, 22, 3)));
            dmDBEXMaster.sqqAliquotas.Open;

            dmMProvider.cdsImpCupomTRIBUTACAO.Value   := dmDBEXMaster.sqqAliquotas.FieldByName('TRIBUTACAO').Value;
            dmDBEXMaster.sqqAliquotas.Close;

            if Copy(sLinha, 22, 3) = 'F00' then
            begin

              dmMProvider.cdsImpCupomALIQUOTA_ICMS.Value  := 'F';
              dmMProvider.cdsImpCupomCFOP.Value           := '5403';

            end
            else if Copy(sLinha, 22, 3) = 'I00' then
              dmMProvider.cdsImpCupomALIQUOTA_ICMS.Value := 'I'
            else if Copy(sLinha, 22, 3) = 'N00' then
              dmMProvider.cdsImpCupomALIQUOTA_ICMS.Value := 'N'
            else
              dmMProvider.cdsImpCupomALIQUOTA_ICMS.Value := RetirarPonto(Copy(sLinha, 25, 5));

            dmMProvider.cdsImpCupomEMISSAO.Value := StrToDate(Copy(sLinha, 36, 2) + '/' + Copy(sLinha, 38, 2) + '/' + Copy(sLinha, 40, 4));

            if Length(FloatToStr(StrToFloat(sBarras))) <= 13 then
              sBarras := Copy(sBarras,2,13)
            else
              sBarras := sBarras;

            dmMProvider.cdsImpCupomBARRAS.Value         := sBarras;
            dmMProvider.cdsImpCupomQUANTIDADE.Value     := StrToFloatDef(RetirarPonto(Copy(sLinha, 58, 9)), 1)  / 1000;
            dmMProvider.cdsImpCupomSUB_TOTAL.Value      := StrToFloatDef(RetirarPonto(Copy(sLinha, 131, 12)), 1) / 100;
            dmMProvider.cdsImpCupomVALOR_UNITARIO.Value :=(dmMProvider.cdsImpCupomSUB_TOTAL.Value / dmMProvider.cdsImpCupomQUANTIDADE.Value);
            dmMProvider.cdsImpCupomVALOR_DESCONTO.Value := StrToFloatDef(RetirarPonto(Copy(sLinha, 79, 12)), 0) / 100;
            //ver se subtotal j�tem desconto
            dmMProvider.cdsImpCupomSUB_TOTAL.Value      := dmMProvider.cdsImpCupomSUB_TOTAL.Value - dmMProvider.cdsImpCupomVALOR_DESCONTO.Value;

{              if StrToInt(Copy(sLinha, 152, 2)) > 24 then
              begin

                if StrToInt(Copy(sLinha, 124, 2)) = 92 then
                  iHora := (StrToInt(Copy(sLinha, 124, 2)) - 68) div 2
                  // meio dia
                else
                  iHora := (StrToInt(Copy(sLinha, 124, 2)) - 68);

                dmMProvider.cdsImpCupomHORA_ABERTURA.Value := StrToTime(IntToStr(iHora) + ':' + Copy(sLinha, 126, 2))

              end
              else}

            dmMProvider.cdsImpCupomHORA_ABERTURA.Value  := StrToTime(Copy(sLinha, 152, 2) + ':' + Copy(sLinha, 154, 2));

            dmMProvider.cdsImpCupomNUMERO_ITEM.Value    := iContador_item;
            dmMProvider.cdsImpCupomSITUACAO.Value := 0;

          end;

        end;
      2:begin

          sFinalizadora := Copy(sLinha, 28, 3);

          case dmDBEXMaster.clConfiguracoesSistema.ImportarInformacaoFinanceira of

            1:begin

                dmMProvider.cdsFormaPagto.Close;
                dmDBEXMaster.sqqFormaPagto.Close;
                dmDBEXMaster.sqqFormaPagto.SQL.Clear;
                dmDBEXMaster.sqqFormaPagto.SQL.Add('SELECT * FROM FORMAPAGAMENTO');
                dmDBEXMaster.sqqFormaPagto.SQL.Add('WHERE CODIGOECF = ' + sFinalizadora);
                dmMProvider.cdsFormaPagto.Open;

                if not dmMProvider.cdsFormaPagto.IsEmpty then
                begin

                  case dmMProvider.cdsFormaPagto.FieldByName('TIPO').Value of
                    6:begin

                        sCliente := FloatToStr(StrToFloat(Copy(sLinha,44,15)));

                        if Length(FloatToStr(StrToFloat(sCliente))) <= 6  then
                        begin

                          if sCliente <> '0' then
                          begin

                            dmDBEXMaster.sqqCliente.Close;
                            dmDBEXMaster.sqqCliente.SQL.Clear;
                            dmDBEXMaster.sqqCliente.SQL.Add('SELECT CLIENTE FROM CLIENTES');
                            dmDBEXMaster.sqqCliente.SQL.Add('WHERE CLIENTE = ' + sCliente);
                            dmDBEXMaster.sqqCliente.Open;

                          end;

                        end
                        else if Length(FloatToStr(StrToFloat(sCliente))) > 6  then
                        begin

                          if sCliente <> '0' then
                          begin

                            dmDBEXMaster.sqqCliente.Close;
                            dmDBEXMaster.sqqCliente.SQL.Clear;
                            dmDBEXMaster.sqqCliente.SQL.Add('SELECT CLIENTE FROM CLIENTES');
                            dmDBEXMaster.sqqCliente.SQL.Add('WHERE CNPJ LIKE ' + QuotedStr('%' + sCliente + '%'));
                            dmDBEXMaster.sqqCliente.Open;

                          end;

                        end;

                        if not dmDBEXMaster.sqqCliente.IsEmpty then
                        begin

                          dmMProvider.cdsImpFinanceiro.Append;
                          dmMProvider.cdsImpFinanceiroIP_CRE.AsInteger                    := -1;
                          dmMProvider.cdsImpFinanceiroIP_FILIAL.AsInteger                 := dmDBEXMaster.iIdFilial;
                          dmMProvider.cdsImpFinanceiroIP_DOCUMENTO.AsString               := Copy(sLinha,60,6);
                          dmMProvider.cdsImpFinanceiroIP_SITUACAO.AsInteger               := 0;
                          dmMProvider.cdsImpFinanceiroIP_DATA_ENTRADA.AsDateTime          := Date;
                          dmMProvider.cdsImpFinanceiroIP_SACADO.AsInteger                 := dmDBEXMaster.sqqCliente.FieldByName('CLIENTE').Value;
                          dmMProvider.cdsImpFinanceiroIP_TIPO.AsInteger                   := 0;
                          dmMProvider.cdsImpFinanceiroIP_DATA_EMISSAO.AsDateTime          := StrToDate(Copy(sLinha,20,2)
                                                                                              + '/'
                                                                                              + Copy(sLinha,22,2)
                                                                                              + '/'
                                                                                              + Copy(sLinha,24,4));

                          dmMProvider.cdsImpFinanceiroIP_DATA_VENCIMENTO.AsDateTime       := dmMProvider.cdsImpFinanceiroIP_DATA_EMISSAO.AsDateTime + 30;
                          dmMProvider.cdsImpFinanceiroIP_MOEDA.AsInteger                  := 0;

                          dmMProvider.cdsImpFinanceiroIP_VALOR.Value                      := StrToFloatDef(RetirarPonto(Copy(sLinha, 32,12)),0) / 100;

                          case dmDBEXMaster.clConfiguracoesSistema.TipoMulta of
                            0:dmMProvider.cdsImpFinanceiroIP_MORA_DIARIA.AsCurrency       := dmDBEXMaster.clConfiguracoesSistema.MoraDiaria;
                            1:dmMProvider.cdsImpFinanceiroIP_MORA_DIARIA.AsCurrency       := dmMProvider.cdsImpFinanceiroIP_VALOR.AsCurrency * (dmDBEXMaster.clConfiguracoesSistema.MoraDiaria/100);
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
                2,3,4:begin//cheques

                      end;

                  end;

                end;

              end;

          end;

        end;


      22:begin //finalizacao

          if (Copy(sLinha,194,1) = '1') then
          begin

            inc(iContador_item);

            if ValidarNumeroCaixa(IntToStr(StrToIntDef(Copy(sLinha, 7, 3), 1))) then
            begin

              if StrToIntDef(Copy(sLinha,143,6),1) <> dmMProvider.cdsImpCupomNUMERO_CUPOM.Value then
                iContador_item := 1;

              dmMProvider.cdsImpCupom.Append;

              dmMProvider.cdsImpCupomNUMERO_CAIXA.Value   := StrToIntDef(Copy(sLinha,7,3),1);
              dmMProvider.cdsImpCupomNUMERO_CUPOM.Value   := StrToIntDef(Copy(sLinha,143,6),1);
              dmMProvider.cdsImpCupomSERIE_ECF.Value      := dmMProvider.cdsCfgNumCX.FieldByName('NUMERO_SERIE_ECF').Value;

              if Copy(sLinha,22,1) = 'F' then
                dmMProvider.cdsImpCupomALIQUOTA_ICMS.Value := 'F'
              else if Copy(sLinha,22,1) = 'I' then
                dmMProvider.cdsImpCupomALIQUOTA_ICMS.Value := 'I'
              else if Copy(sLinha,22,1) = 'N' then
                dmMProvider.cdsImpCupomALIQUOTA_ICMS.Value := 'N'
              else
                dmMProvider.cdsImpCupomALIQUOTA_ICMS.Value := RetirarPonto(Copy(sLinha,25,5));


              dmMProvider.cdsImpCupomEMISSAO.Value        := StrToDate(Copy(sLinha,36,2)
                                                            + '/'
                                                            + Copy(sLinha,38,2)
                                                            + '/'
                                                            + Copy(sLinha,40,4));

{              if frmAutomacao.clConfiguracoesSistema.UsarDigitoVerExportacao = 0 then
              begin

                sBarras := FloatToStr(StrToFloat(Copy(sLinha,37,13)));

                if Length(sBarras) < 8 then

                  sBarras := GerarCodigodeBarras(Copy(sLinha,38,12))

                else

                  sBarras := Copy(sLinha,37,13);

              end
              else
                sBarras := Copy(sLinha,37,13);

}

              sBarras := Copy(sLinha,44,14);

              dmDBEXMaster.sqqMasterPesq.Close;
              dmDBEXMaster.sqqMasterPesq.SQL.Clear;
              dmDBEXMaster.sqqMasterPesq.SQL.Add('select barras from barras');
              dmDBEXMaster.sqqMasterPesq.SQL.Add('where produto = ' + sBarras);
              dmDBEXMaster.sqqMasterPesq.Open;

              sBarras := dmDBEXMaster.sqqMasterPesq.FieldByName('BARRAS').AsString;

              dmMProvider.cdsImpCupomBARRAS.Value         := sBarras;
              dmMProvider.cdsImpCupomQUANTIDADE.Value     := StrToFloat(RetirarPonto(Copy(sLinha,58,9)))    / 1000;
              dmMProvider.cdsImpCupomSUB_TOTAL.Value      := StrToFloat(RetirarPonto(Copy(sLinha,131,12)))  / 100;
              dmMProvider.cdsImpCupomVALOR_UNITARIO.Value := StrToFloat(RetirarPonto(Copy(sLinha,67,12)))   / 100;
              dmMProvider.cdsImpCupomVALOR_DESCONTO.Value := StrToFloat(RetirarPonto(Copy(sLinha,79,12)))   / 100;
              dmMProvider.cdsImpCupomHORA_ABERTURA.Value  := StrToTime(Copy(sLinha,152,2) + ':' + Copy(sLinha,154,2));
              dmMProvider.cdsImpCupomNUMERO_ITEM.Value    := iContador_item;

            end;

          end;

          if dmMProvider.cdsImpCupom.State in [dsEdit, dsInsert] then
            dmMProvider.cdsImpCupom.Post;

         end;
      03:begin//redu��o z

          if ValidarNumeroCaixa(IntToStr(StrToIntDef(Copy(sLinha, 7, 3), 1))) then
          begin

            dmMProvider.cdsImpReg60M.Append;
            dmMProvider.cdsImpReg60MDATA_EMISSAO.Value  := dmMProvider.cdsImpCupomEMISSAO.Value;
            dmMProvider.cdsImpReg60MSERIE_ECF.Value     := dmMProvider.cdsCfgNumCX.FieldByName('NUMERO_SERIE_ECF').Value;
            dmMProvider.cdsImpReg60MNUMERO_CAIXA.Value  := dmMProvider.cdsCfgNumCX.FieldByName('NUMERO_CAIXA').Value;
            dmMProvider.cdsImpReg60MCOO_INICIAL.Value   := StrToInt(Copy(sLinha,331,6));
            dmMProvider.cdsImpReg60MCOO_FINAL.Value     := StrToInt(Copy(sLinha,337,6));
            dmMProvider.cdsImpReg60MCRZ.Value           := StrToInt(Copy(sLinha,25,6));
            dmMProvider.cdsImpReg60MCRO.Value           := StrToInt(Copy(sLinha,509,6));
            dmMProvider.cdsImpReg60MVENDA_BRUTA.Value   := StrToFloat(RetirarPonto(Copy(sLinha,39,12))) / 100;
            dmMProvider.cdsImpReg60MVALOR_GT.Value      := StrToFloat(RetirarPonto(Copy(sLinha,313,18))) / 100;
            dmMProvider.cdsImpReg60M.Post;

            //cancelamentos
            if StrToFloat(RetirarPonto(copy(sLinha,51,12))) > 0 then
            begin

              dmMProvider.cdsImpReg60A.Append;
              dmMProvider.cdsImpReg60ADATA_EMISSAO.Value    := dmMProvider.cdsImpReg60MDATA_EMISSAO.Value;
              dmMProvider.cdsImpReg60AALIQUOTA.Value        := 'CANC';
              dmMProvider.cdsImpReg60AVALOR_ALIQUOTA.Value  := StrToFloat(RetirarPonto(copy(sLinha,51,12)))/100;
              dmMProvider.cdsImpReg60ASERIE_ECF.Value       := dmMProvider.cdsImpReg60MSERIE_ECF.Value;
              dmMProvider.cdsImpReg60ACRZ.Value             := dmMProvider.cdsImpReg60MCRZ.Value;
              dmMProvider.cdsImpReg60ANUMERO_CAIXA.Value    := dmMProvider.cdsImpReg60MNUMERO_CAIXA.Value;
              dmMProvider.cdsImpReg60AGT.Value              := dmMProvider.cdsImpReg60MVALOR_GT.Value;
              dmMProvider.cdsImpReg60A.Post;

            end;

            //descontos
            if StrToFloat(RetirarPonto(copy(sLinha,63,12))) > 0 then
            begin

              dmMProvider.cdsImpReg60A.Append;
              dmMProvider.cdsImpReg60ADATA_EMISSAO.Value    := dmMProvider.cdsImpReg60MDATA_EMISSAO.Value;
              dmMProvider.cdsImpReg60AALIQUOTA.Value        := 'DESC';
              dmMProvider.cdsImpReg60AVALOR_ALIQUOTA.Value  := StrToFloat(RetirarPonto(copy(sLinha,63,12)))/100;
              dmMProvider.cdsImpReg60ASERIE_ECF.Value       := dmMProvider.cdsImpReg60MSERIE_ECF.Value;
              dmMProvider.cdsImpReg60ACRZ.Value             := dmMProvider.cdsImpReg60MCRZ.Value;
              dmMProvider.cdsImpReg60ANUMERO_CAIXA.Value    := dmMProvider.cdsImpReg60MNUMERO_CAIXA.Value;
              dmMProvider.cdsImpReg60AGT.Value              := dmMProvider.cdsImpReg60MVALOR_GT.Value;
              dmMProvider.cdsImpReg60A.Post;

            end;

            //substitui��o
            if StrToFloat(RetirarPonto(copy(sLinha,87,12))) > 0 then
            begin

              dmMProvider.cdsImpReg60A.Append;
              dmMProvider.cdsImpReg60ADATA_EMISSAO.Value    := dmMProvider.cdsImpReg60MDATA_EMISSAO.Value;
              dmMProvider.cdsImpReg60AALIQUOTA.Value        := 'F';
              dmMProvider.cdsImpReg60AVALOR_ALIQUOTA.Value  := StrToFloat(RetirarPonto(copy(sLinha,87,12)))/100;
              dmMProvider.cdsImpReg60ASERIE_ECF.Value       := dmMProvider.cdsImpReg60MSERIE_ECF.Value;
              dmMProvider.cdsImpReg60ACRZ.Value             := dmMProvider.cdsImpReg60MCRZ.Value;
              dmMProvider.cdsImpReg60ANUMERO_CAIXA.Value    := dmMProvider.cdsImpReg60MNUMERO_CAIXA.Value;
              dmMProvider.cdsImpReg60AGT.Value              := dmMProvider.cdsImpReg60MVALOR_GT.Value;
              dmMProvider.cdsImpReg60A.Post;

            end;

            //isentas
            if StrToFloat(RetirarPonto(copy(sLinha,343,12))) > 0 then
            begin

              dmMProvider.cdsImpReg60A.Append;
              dmMProvider.cdsImpReg60ADATA_EMISSAO.Value    := dmMProvider.cdsImpReg60MDATA_EMISSAO.Value;
              dmMProvider.cdsImpReg60AALIQUOTA.Value        := 'I';
              dmMProvider.cdsImpReg60AVALOR_ALIQUOTA.Value  := StrToFloat(RetirarPonto(copy(sLinha,343,12)))/100;
              dmMProvider.cdsImpReg60ASERIE_ECF.Value       := dmMProvider.cdsImpReg60MSERIE_ECF.Value;
              dmMProvider.cdsImpReg60ACRZ.Value             := dmMProvider.cdsImpReg60MCRZ.Value;
              dmMProvider.cdsImpReg60ANUMERO_CAIXA.Value    := dmMProvider.cdsImpReg60MNUMERO_CAIXA.Value;
              dmMProvider.cdsImpReg60AGT.Value              := dmMProvider.cdsImpReg60MVALOR_GT.Value;
              dmMProvider.cdsImpReg60A.Post;

            end;

            //n�o tributadas
            if StrToFloat(RetirarPonto(copy(sLinha,99,12))) > 0 then
            begin

              dmMProvider.cdsImpReg60A.Append;
              dmMProvider.cdsImpReg60ADATA_EMISSAO.Value    := dmMProvider.cdsImpReg60MDATA_EMISSAO.Value;
              dmMProvider.cdsImpReg60AALIQUOTA.Value        := 'N';
              dmMProvider.cdsImpReg60AVALOR_ALIQUOTA.Value  := StrToFloat(RetirarPonto(copy(sLinha,99,12)))/100;
              dmMProvider.cdsImpReg60ASERIE_ECF.Value       := dmMProvider.cdsImpReg60MSERIE_ECF.Value;
              dmMProvider.cdsImpReg60ACRZ.Value             := dmMProvider.cdsImpReg60MCRZ.Value;
              dmMProvider.cdsImpReg60ANUMERO_CAIXA.Value    := dmMProvider.cdsImpReg60MNUMERO_CAIXA.Value;
              dmMProvider.cdsImpReg60AGT.Value              := dmMProvider.cdsImpReg60MVALOR_GT.Value;
              dmMProvider.cdsImpReg60A.Post;

            end;
            //primeira aliq
            if StrToFloat(RetirarPonto(Copy(sLinha,111,5))) > 0 then
            begin

              dmMProvider.cdsImpReg60A.Append;
              dmMProvider.cdsImpReg60ADATA_EMISSAO.Value    := dmMProvider.cdsImpReg60MDATA_EMISSAO.Value;
              dmMProvider.cdsImpReg60AALIQUOTA.Value        := RetirarPonto(Copy(sLinha,111,5));
              dmMProvider.cdsImpReg60AVALOR_ALIQUOTA.Value  := StrToFloat(RetirarPonto(Copy(sLinha,116,12)))/100;
              dmMProvider.cdsImpReg60ASERIE_ECF.Value       := dmMProvider.cdsImpReg60MSERIE_ECF.Value;
              dmMProvider.cdsImpReg60ACRZ.Value             := dmMProvider.cdsImpReg60MCRZ.Value;
              dmMProvider.cdsImpReg60ANUMERO_CAIXA.Value    := dmMProvider.cdsImpReg60MNUMERO_CAIXA.Value;
              dmMProvider.cdsImpReg60AGT.Value              := dmMProvider.cdsImpReg60MVALOR_GT.Value;
              dmMProvider.cdsImpReg60APOSICAO_ALIQUOTA.Value:= '01';

              dmMProvider.cdsImpReg60A.Post;

            end;

            //segunda aliq
            if StrToFloat(RetirarPonto(Copy(sLinha,140,5))) > 0 then
            begin

              dmMProvider.cdsImpReg60A.Append;
              dmMProvider.cdsImpReg60ADATA_EMISSAO.Value    := dmMProvider.cdsImpReg60MDATA_EMISSAO.Value;
              dmMProvider.cdsImpReg60AALIQUOTA.Value        := RetirarPonto(Copy(sLinha,140,5));
              dmMProvider.cdsImpReg60AVALOR_ALIQUOTA.Value  := StrToFloat(RetirarPonto(Copy(sLinha,145,12)))/100;
              dmMProvider.cdsImpReg60ASERIE_ECF.Value       := dmMProvider.cdsImpReg60MSERIE_ECF.Value;
              dmMProvider.cdsImpReg60ACRZ.Value             := dmMProvider.cdsImpReg60MCRZ.Value;
              dmMProvider.cdsImpReg60ANUMERO_CAIXA.Value    := dmMProvider.cdsImpReg60MNUMERO_CAIXA.Value;
              dmMProvider.cdsImpReg60AGT.Value              := dmMProvider.cdsImpReg60MVALOR_GT.Value;
              dmMProvider.cdsImpReg60APOSICAO_ALIQUOTA.Value:= '02';
              dmMProvider.cdsImpReg60A.Post;

            end;

            //terceira aliq
            if StrToFloat(RetirarPonto(Copy(sLinha,169,5))) > 0 then
            begin

              dmMProvider.cdsImpReg60A.Append;
              dmMProvider.cdsImpReg60ADATA_EMISSAO.Value    := dmMProvider.cdsImpReg60MDATA_EMISSAO.Value;
              dmMProvider.cdsImpReg60AALIQUOTA.Value        := RetirarPonto(Copy(sLinha,169,5));
              dmMProvider.cdsImpReg60AVALOR_ALIQUOTA.Value  := StrToFloat(RetirarPonto(Copy(sLinha,174,12)))/100;
              dmMProvider.cdsImpReg60ASERIE_ECF.Value       := dmMProvider.cdsImpReg60MSERIE_ECF.Value;
              dmMProvider.cdsImpReg60ACRZ.Value             := dmMProvider.cdsImpReg60MCRZ.Value;
              dmMProvider.cdsImpReg60ANUMERO_CAIXA.Value    := dmMProvider.cdsImpReg60MNUMERO_CAIXA.Value;
              dmMProvider.cdsImpReg60AGT.Value              := dmMProvider.cdsImpReg60MVALOR_GT.Value;
              dmMProvider.cdsImpReg60APOSICAO_ALIQUOTA.Value:= '03';
              dmMProvider.cdsImpReg60A.Post;

            end;

            //quarta aliq
            if StrToFloat(RetirarPonto(Copy(sLinha,198,4))) > 0 then
            begin

              dmMProvider.cdsImpReg60A.Append;
              dmMProvider.cdsImpReg60ADATA_EMISSAO.Value    := dmMProvider.cdsImpReg60MDATA_EMISSAO.Value;
              dmMProvider.cdsImpReg60AALIQUOTA.Value        := RetirarPonto(Copy(sLinha,198,5));
              dmMProvider.cdsImpReg60AVALOR_ALIQUOTA.Value  := StrToFloat(RetirarPonto(Copy(sLinha,203,12)))/100;
              dmMProvider.cdsImpReg60ASERIE_ECF.Value       := dmMProvider.cdsImpReg60MSERIE_ECF.Value;
              dmMProvider.cdsImpReg60ACRZ.Value             := dmMProvider.cdsImpReg60MCRZ.Value;
              dmMProvider.cdsImpReg60ANUMERO_CAIXA.Value    := dmMProvider.cdsImpReg60MNUMERO_CAIXA.Value;
              dmMProvider.cdsImpReg60AGT.Value              := dmMProvider.cdsImpReg60MVALOR_GT.Value;
              dmMProvider.cdsImpReg60APOSICAO_ALIQUOTA.Value:= '04';
              dmMProvider.cdsImpReg60A.Post;

            end;

            //quinta aliq
            if StrToFloat(RetirarPonto(Copy(sLinha,227,5))) > 0 then
            begin

              dmMProvider.cdsImpReg60A.Append;
              dmMProvider.cdsImpReg60ADATA_EMISSAO.Value    := dmMProvider.cdsImpReg60MDATA_EMISSAO.Value;
              dmMProvider.cdsImpReg60AALIQUOTA.Value        := RetirarPonto(Copy(sLinha,227,5));
              dmMProvider.cdsImpReg60AVALOR_ALIQUOTA.Value  := StrToFloat(RetirarPonto(Copy(sLinha,232,12)))/100;
              dmMProvider.cdsImpReg60ASERIE_ECF.Value       := dmMProvider.cdsImpReg60MSERIE_ECF.Value;
              dmMProvider.cdsImpReg60ACRZ.Value             := dmMProvider.cdsImpReg60MCRZ.Value;
              dmMProvider.cdsImpReg60ANUMERO_CAIXA.Value    := dmMProvider.cdsImpReg60MNUMERO_CAIXA.Value;
              dmMProvider.cdsImpReg60AGT.Value              := dmMProvider.cdsImpReg60MVALOR_GT.Value;
              dmMProvider.cdsImpReg60APOSICAO_ALIQUOTA.Value:= '05';
              dmMProvider.cdsImpReg60A.Post;

            end;

            //sexta aliq
            if StrToFloat(RetirarPonto(Copy(sLinha,256,5))) > 0 then
            begin

              dmMProvider.cdsImpReg60A.Append;
              dmMProvider.cdsImpReg60ADATA_EMISSAO.Value    := dmMProvider.cdsImpReg60MDATA_EMISSAO.Value;
              dmMProvider.cdsImpReg60AALIQUOTA.Value        := RetirarPonto(Copy(sLinha,256,5));
              dmMProvider.cdsImpReg60AVALOR_ALIQUOTA.Value  := StrToFloat(RetirarPonto(Copy(sLinha,261,12)))/100;
              dmMProvider.cdsImpReg60ASERIE_ECF.Value       := dmMProvider.cdsImpReg60MSERIE_ECF.Value;
              dmMProvider.cdsImpReg60ACRZ.Value             := dmMProvider.cdsImpReg60MCRZ.Value;
              dmMProvider.cdsImpReg60ANUMERO_CAIXA.Value    := dmMProvider.cdsImpReg60MNUMERO_CAIXA.Value;
              dmMProvider.cdsImpReg60AGT.Value              := dmMProvider.cdsImpReg60MVALOR_GT.Value;
              dmMProvider.cdsImpReg60APOSICAO_ALIQUOTA.Value:= '06';
              dmMProvider.cdsImpReg60A.Post;

            end;

            //setima aliq
            if StrToFloat(RetirarPonto(Copy(sLinha,387,5))) > 0 then
            begin

              dmMProvider.cdsImpReg60A.Append;
              dmMProvider.cdsImpReg60ADATA_EMISSAO.Value    := dmMProvider.cdsImpReg60MDATA_EMISSAO.Value;
              dmMProvider.cdsImpReg60AALIQUOTA.Value        := RetirarPonto(Copy(sLinha,387,5));
              dmMProvider.cdsImpReg60AVALOR_ALIQUOTA.Value  := StrToFloat(RetirarPonto(Copy(sLinha,392,12)))/100;
              dmMProvider.cdsImpReg60ASERIE_ECF.Value       := dmMProvider.cdsImpReg60MSERIE_ECF.Value;
              dmMProvider.cdsImpReg60ACRZ.Value             := dmMProvider.cdsImpReg60MCRZ.Value;
              dmMProvider.cdsImpReg60ANUMERO_CAIXA.Value    := dmMProvider.cdsImpReg60MNUMERO_CAIXA.Value;
              dmMProvider.cdsImpReg60AGT.Value              := dmMProvider.cdsImpReg60MVALOR_GT.Value;
              dmMProvider.cdsImpReg60APOSICAO_ALIQUOTA.Value:= '07';
              dmMProvider.cdsImpReg60A.Post;

            end;

            //oitava aliq
            if StrToFloat(RetirarPonto(Copy(sLinha,416,5))) > 0 then
            begin

              dmMProvider.cdsImpReg60A.Append;
              dmMProvider.cdsImpReg60ADATA_EMISSAO.Value    := dmMProvider.cdsImpReg60MDATA_EMISSAO.Value;
              dmMProvider.cdsImpReg60AALIQUOTA.Value        := RetirarPonto(Copy(sLinha,416,5));
              dmMProvider.cdsImpReg60AVALOR_ALIQUOTA.Value  := StrToFloat(RetirarPonto(Copy(sLinha,421,12)))/100;
              dmMProvider.cdsImpReg60ASERIE_ECF.Value       := dmMProvider.cdsImpReg60MSERIE_ECF.Value;
              dmMProvider.cdsImpReg60ACRZ.Value             := dmMProvider.cdsImpReg60MCRZ.Value;
              dmMProvider.cdsImpReg60ANUMERO_CAIXA.Value    := dmMProvider.cdsImpReg60MNUMERO_CAIXA.Value;
              dmMProvider.cdsImpReg60AGT.Value              := dmMProvider.cdsImpReg60MVALOR_GT.Value;
              dmMProvider.cdsImpReg60APOSICAO_ALIQUOTA.Value:= '08';
              dmMProvider.cdsImpReg60A.Post;

            end;

            //nona aliq
            if StrToFloat(RetirarPonto(Copy(sLinha,445,5))) > 0 then
            begin

              dmMProvider.cdsImpReg60A.Append;
              dmMProvider.cdsImpReg60ADATA_EMISSAO.Value    := dmMProvider.cdsImpReg60MDATA_EMISSAO.Value;
              dmMProvider.cdsImpReg60AALIQUOTA.Value        := RetirarPonto(Copy(sLinha,445,5));
              dmMProvider.cdsImpReg60AVALOR_ALIQUOTA.Value  := StrToFloat(RetirarPonto(Copy(sLinha,450,12)))/100;
              dmMProvider.cdsImpReg60ASERIE_ECF.Value       := dmMProvider.cdsImpReg60MSERIE_ECF.Value;
              dmMProvider.cdsImpReg60ACRZ.Value             := dmMProvider.cdsImpReg60MCRZ.Value;
              dmMProvider.cdsImpReg60ANUMERO_CAIXA.Value    := dmMProvider.cdsImpReg60MNUMERO_CAIXA.Value;
              dmMProvider.cdsImpReg60AGT.Value              := dmMProvider.cdsImpReg60MVALOR_GT.Value;
              dmMProvider.cdsImpReg60APOSICAO_ALIQUOTA.Value:= '09';
              dmMProvider.cdsImpReg60A.Post;

            end;

            //decima aliq
            if StrToFloat(RetirarPonto(Copy(sLinha,474,5))) > 0 then
            begin

              dmMProvider.cdsImpReg60A.Append;
              dmMProvider.cdsImpReg60ADATA_EMISSAO.Value    := dmMProvider.cdsImpReg60MDATA_EMISSAO.Value;
              dmMProvider.cdsImpReg60AALIQUOTA.Value        := RetirarPonto(Copy(sLinha,474,5));
              dmMProvider.cdsImpReg60AVALOR_ALIQUOTA.Value  := StrToFloat(RetirarPonto(Copy(sLinha,479,12)))/100;
              dmMProvider.cdsImpReg60ASERIE_ECF.Value       := dmMProvider.cdsImpReg60MSERIE_ECF.Value;
              dmMProvider.cdsImpReg60ACRZ.Value             := dmMProvider.cdsImpReg60MCRZ.Value;
              dmMProvider.cdsImpReg60ANUMERO_CAIXA.Value    := dmMProvider.cdsImpReg60MNUMERO_CAIXA.Value;
              dmMProvider.cdsImpReg60AGT.Value              := dmMProvider.cdsImpReg60MVALOR_GT.Value;
              dmMProvider.cdsImpReg60APOSICAO_ALIQUOTA.Value:= '10';
              dmMProvider.cdsImpReg60A.Post;

            end;

          end;

         end;
    end;

    Application.ProcessMessages;

  end;

end;

end.
