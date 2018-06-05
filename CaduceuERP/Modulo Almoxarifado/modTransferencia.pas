unit modTransferencia;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Imaging.pngimage, Vcl.StdCtrls, Vcl.ActnList, Vcl.Mask,
  Vcl.DBCtrls, db, Vcl.Imaging.jpeg, IniFiles;

type
  TfrmTransferencia = class(TForm)
    pgcTransferencia: TPageControl;
    tbsTabela: TTabSheet;
    tbsCadastro: TTabSheet;
    grdTabela: TDBGrid;
    grpMensagem: TGroupBox;
    lblMsg: TLabel;
    imgUltimo_Reg: TImage;
    imgProximo_Reg: TImage;
    imgRegisto_Ant: TImage;
    imgPrimeiro_Reg: TImage;
    imgSair: TImage;
    actTransferencia: TActionList;
    actIncluir: TAction;
    actCancelar: TAction;
    actSalvar: TAction;
    actExcluir: TAction;
    actEditar: TAction;
    actSair: TAction;
    actPrimeiro: TAction;
    actAnterior: TAction;
    actProximo: TAction;
    actUltimo: TAction;
    grpDadosTransferencia: TGroupBox;
    grpItensTransferencia: TGroupBox;
    grdItensTransferencia: TDBGrid;
    lblControle: TLabel;
    lblEmissao: TLabel;
    lblHora: TLabel;
    edtControle: TDBEdit;
    edtEmissao: TDBEdit;
    edtHora: TDBEdit;
    lblAtendente: TLabel;
    lblRequerente: TLabel;
    edtAtendente: TDBEdit;
    edtrequerente: TDBEdit;
    edtNomeAtendente: TDBEdit;
    edtNomeRequerente: TDBEdit;
    lblCodigo: TLabel;
    lblQuantidade: TLabel;
    lblDescricoa: TLabel;
    grpSaldoAtual: TGroupBox;
    lblLojaAtual: TLabel;
    lblDepositoAtual: TLabel;
    edtLojaAtual: TEdit;
    edtdepositoAtual: TEdit;
    edtCodigoGTIN: TEdit;
    edtQuantidade: TEdit;
    edtDescricao: TEdit;
    rdgOpcoesPesquisa: TRadioGroup;
    grpConteudoPesquisa: TGroupBox;
    edtConteudoPesquisa: TEdit;
    imgNovo: TImage;
    lblF2: TLabel;
    imgDesfazer: TImage;
    lblF3: TLabel;
    imgSalvar: TImage;
    lblF4: TLabel;
    imgEditar: TImage;
    lblF6: TLabel;
    imgImprimir: TImage;
    imgConfirmar: TImage;
    rdgDestino: TDBRadioGroup;
    edtMotivo: TDBEdit;
    lblMotivo: TLabel;
    edtDescricaoMotivo: TDBMemo;
    imgStatus: TImage;
    actImprimir: TAction;
    actConfirmarTransf: TAction;
    procedure FormCreate(Sender: TObject);
    procedure grdTabelaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdTabelaDblClick(Sender: TObject);
    procedure actSairExecute(Sender: TObject);
    procedure imgSairClick(Sender: TObject);
    procedure edtAtendenteEnter(Sender: TObject);
    procedure edtAtendenteExit(Sender: TObject);
    procedure edtrequerenteExit(Sender: TObject);
    procedure edtControleKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodigoGTINExit(Sender: TObject);
    procedure edtQuantidadeExit(Sender: TObject);
    procedure edtConteudoPesquisaEnter(Sender: TObject);
    procedure rdgOpcoesPesquisaClick(Sender: TObject);
    procedure edtConteudoPesquisaExit(Sender: TObject);
    procedure actIncluirExecute(Sender: TObject);
    procedure edtEmissaoChange(Sender: TObject);
    procedure rdgDestinoClick(Sender: TObject);
    procedure edtConteudoPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure edtMotivoExit(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure actCancelarExecute(Sender: TObject);
    procedure imgDesfazerClick(Sender: TObject);
    procedure imgNovoClick(Sender: TObject);
    procedure imgSalvarClick(Sender: TObject);
    procedure grdTabelaKeyPress(Sender: TObject; var Key: Char);
    procedure actEditarExecute(Sender: TObject);
    procedure imgEditarClick(Sender: TObject);
    procedure edtCodigoGTINEnter(Sender: TObject);
    procedure actImprimirExecute(Sender: TObject);
    procedure imgImprimirClick(Sender: TObject);
    procedure actPrimeiroExecute(Sender: TObject);
    procedure actAnteriorExecute(Sender: TObject);
    procedure actProximoExecute(Sender: TObject);
    procedure actUltimoExecute(Sender: TObject);
    procedure imgPrimeiro_RegClick(Sender: TObject);
    procedure imgRegisto_AntClick(Sender: TObject);
    procedure imgProximo_RegClick(Sender: TObject);
    procedure imgUltimo_RegClick(Sender: TObject);
    procedure actConfirmarTransfExecute(Sender: TObject);
    procedure imgConfirmarClick(Sender: TObject);
    procedure edtCodigoGTINKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    ifArqIni :TIniFile;
    procedure HabilitarControles;
    procedure DesabilitarControles;
    procedure LimparMsgErro;
  public
    { Public declarations }
  end;

var
  frmTransferencia: TfrmTransferencia;

implementation

{$R *.dfm}

uses uFuncoes, modDBEXMaster, modDMCDSMaster, modDMMProvider, modDMSource,
  modSSPMaster, modPesquisaFuncionario, constMSgPadrao, modPesquisaMotivos,
  dataRelatorios;

procedure TfrmTransferencia.actAnteriorExecute(Sender: TObject);
begin

  if dmCDSMaster.cdsTransferencia_Saldo.Active then
    dmCDSMaster.cdsTransferencia_Saldo.Prior;

end;

procedure TfrmTransferencia.actCancelarExecute(Sender: TObject);
begin

  if dmCDSMaster.cdsTransferencia_Saldo.State in[dsEdit] then
  begin

    if dmCDSMaster.cdsItens_Transf_Saldo.State in [dsEdit, dsInsert] then
      dmCDSMaster.cdsItens_Transf_Saldo.Cancel;

    dmCDSMaster.cdsTransferencia_Saldo.Cancel;

  end
  else if dmCDSMaster.cdsTransferencia_Saldo.State in[dsInsert] then
  begin

    dmCDSMaster.cdsItens_Transf_Saldo.Close;
    dmCDSMaster.cdsTransferencia_Saldo.Close;

  end;

  DesabilitarControles;

end;

procedure TfrmTransferencia.actConfirmarTransfExecute(Sender: TObject);
begin

  LimparMsgErro;

  if dmCDSMaster.cdsTransferencia_SaldoSTATUS.Value = 0 then
  begin

    if not (dmCDSMaster.cdsTransferencia_Saldo.State in [dsEdit, dsInsert])  then
    begin

      if Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario
        +', deseja confirmar transação?'  ), 'Atenção!', mb_IconQuestion
        + mb_DefButton2 + mb_YesNo) = idYes then
      begin

        dmSSPMaster.sspAtualizar_Saldo_Produto.ParamByName('IP_OPCAO').Value            := 5;
        dmSSPMaster.sspAtualizar_Saldo_Produto.ParamByName('IP_LOCAL_MOVIMENTO').Value  := -1;
        dmSSPMaster.sspAtualizar_Saldo_Produto.ParamByName('IP_OPERACAO').Value         := -1;
        dmSSPMaster.sspAtualizar_Saldo_Produto.ParamByName('IP_NOTA_FISCAL').Value      := dmCDSMaster.cdsTransferencia_SaldoTRANSFERENCIA.Value;
        dmSSPMaster.sspAtualizar_Saldo_Produto.ParamByName('IP_BARRAS').Value           := '';
        dmSSPMaster.sspAtualizar_Saldo_Produto.ParamByName('IP_QUANTIDADE').Value       := 0;
        dmSSPMaster.sspAtualizar_Saldo_Produto.ParamByName('IP_PRODUTO').Value          := 0;
        dmSSPMaster.sspAtualizar_Saldo_Produto.ParamByName('IP_FILIAL').Value           := dmDBEXMaster.iIdFilial;
        dmSSPMaster.sspAtualizar_Saldo_Produto.ParamByName('IP_MODELO').Value           := '';
        dmSSPMaster.sspAtualizar_Saldo_Produto.ParamByName('IP_DATA').Value             := Date;
        dmSSPMaster.sspAtualizar_Saldo_Produto.ExecProc;

        dmCDSMaster.cdsTransferencia_Saldo.Edit;
        dmCDSMaster.cdsTransferencia_SaldoSTATUS.Value := 1;
        dmCDSMaster.cdsTransferencia_Saldo.Post;

        imgStatus.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'esfera_vermelha.png');
        dmSSPMaster.sspMaster.StoredProcName := 'EXECUTA_SQL';
        dmSSPMaster.sspMaster.ParamByName('I_SQL').Value := 'UPDATE TRANSFERENCIA_SALDO SET STATUS = 1 WHERE TRANSFERENCIA = ' + (IntToStr(dmCDSMaster.cdsTransferencia_SaldoTRANSFERENCIA.Value));
        dmSSPMaster.sspMaster.ExecProc;

        dmSSPMaster.sspMan_Tab_Log.ParamByName('IP_DATA').Value             := Date;
        dmSSPMaster.sspMan_Tab_Log.ParamByName('IP_USUARIO').Value          := dmDBEXMaster.iIdUsuario;
        dmSSPMaster.sspMan_Tab_Log.ParamByName('IP_HISTORICO').Value        := 'CONFIRMOU A TRANFERENCIA N. ' + IntToStr(dmCDSMaster.cdsTransferencia_SaldoTRANSFERENCIA.Value);
        dmSSPMaster.sspMan_Tab_Log.ParamByName('IP_OPERACAO').Value         := 5;
        dmSSPMaster.sspMan_Tab_Log.ParamByName('IP_HORA').Value             := Time;
        dmSSPMaster.sspMan_Tab_Log.ParamByName('IP_NOME_COMPUTADOR').Value  := pubNomeComputador;
        dmSSPMaster.sspMan_Tab_Log.ParamByName('IP_ENDERECO_IP').Value      := RetornarIP;
        dmSSPMaster.sspMan_Tab_Log.ParamByName('IP_NOME_TABELA').Value      := 'TRANSFERECIA_SALDO';
        dmSSPMaster.sspMan_Tab_Log.ExecProc;

        DesabilitarControles;
        edtConteudoPesquisa.SetFocus;

      end;

    end;

  end
  else
  begin

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', transferência já efetuada!';
    Application.ProcessMessages;

  end;

end;

procedure TfrmTransferencia.actEditarExecute(Sender: TObject);
begin

  LimparMsgErro;

  if dmCDSMaster.cdsTransferencia_Saldo.Active then
  begin

    if dmCDSMaster.cdsTransferencia_SaldoSTATUS.Value = 0 then
    begin

      HabilitarControles;
      pgcTransferencia.ActivePageIndex := 1;
      dmCDSMaster.cdsTransferencia_Saldo.Edit;
      edtAtendente.SetFocus;

    end
    else
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_STATUS_NAO_PERMITE;
      Application.ProcessMessages;

    end;

  end;

end;

procedure TfrmTransferencia.actImprimirExecute(Sender: TObject);
begin

  if pgcTransferencia.ActivePageIndex = 0 then
    grdTabelaDblClick(Self);

  if dmCDSMaster.cdsTransferencia_Saldo.Active then
  begin

    if dmCDSMaster.cdsTransferencia_SaldoSTATUS.Value = 1 then
    begin


      dmRelatorios.rvsGenesisAC.SystemPreview.ZoomFactor  := 126.4;
      dmRelatorios.rvdGenesis.DataSet                     := dmCDSMaster.cdsItens_Transf_Saldo;

      LimparMsgErro;

      if FileExists(ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Diversos.rav') then
      begin

        dmRelatorios.rvpGenesisAC.ProjectFile := ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Diversos.rav';
        dmRelatorios.rvpGenesisAC.SelectReport('rptComprovanteTransfSaldo',true);
        dmRelatorios.rvpGenesisAC.SetParam('pNOME_LOJA',dmDBEXMaster.sNomeFilial);
        dmRelatorios.rvpGenesisAC.SetParam('pLOGO_MARCA',ExtractFilePath(Application.ExeName) + 'Logomarca\LogoMarca.bmp');
        dmRelatorios.rvpGenesisAC.Execute;
        dmRelatorios.rvpGenesisAC.Close;

      end
      else
        Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + ', ' + MSG_ARQ_NEXISTE + #13
          + ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Diversos.rav'), 'Atenção!',mb_IconWarning + mb_Ok);


    end
    else
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', status atual não permite impressão de comprovante!';
      Application.ProcessMessages;

    end;

  end;

end;

procedure TfrmTransferencia.actIncluirExecute(Sender: TObject);
begin

  LimparMsgErro;

  if not (dmCDSMaster.cdsServico.State in [dsEdit, dsInsert]) then
  begin

    pgcTransferencia.ActivePageIndex := 1;

    HabilitarControles;

    dmSSPMaster.sspMaster.StoredProcName := 'RETORNAR_GNR_TRANSF';
    dmSSPMaster.sspMaster.ExecProc;

    dmCDSMaster.cdsTransferencia_Saldo.Close;
    dmCDSMaster.cdsTransferencia_Saldo.CreateDataSet;
    dmCDSMaster.cdsTransferencia_Saldo.Append;
    dmCDSMaster.cdsTransferencia_SaldoTRANSFERENCIA.Value := dmSSPMaster.sspMaster.ParamByName('OP_TRANSFERENCIA').Value + 1;

    dmCDSMaster.cdsItens_Transf_Saldo.Close;
    dmCDSMaster.cdsItens_Transf_Saldo.Filter    := 'TRANSFERENCIA = ' + IntToStr(dmCDSMaster.cdsTransferencia_SaldoTRANSFERENCIA.Value);
    dmCDSMaster.cdsItens_Transf_Saldo.Filtered  := True;
    dmCDSMaster.cdsItens_Transf_Saldo.CreateDataSet;

    edtAtendente.SetFocus;

  end;


end;

procedure TfrmTransferencia.actPrimeiroExecute(Sender: TObject);
begin

  if dmCDSMaster.cdsTransferencia_Saldo.Active then
    dmCDSMaster.cdsTransferencia_Saldo.First;

end;

procedure TfrmTransferencia.actProximoExecute(Sender: TObject);
begin

  if dmCDSMaster.cdsTransferencia_Saldo.Active then
    dmCDSMaster.cdsTransferencia_Saldo.Next;

end;

procedure TfrmTransferencia.actSairExecute(Sender: TObject);
begin

  Close;

end;

procedure TfrmTransferencia.actSalvarExecute(Sender: TObject);
var
  iItem:integer;
begin

  iItem := 1;

  if dmCDSMaster.cdsTransferencia_Saldo.State in [dsEdit, dsInsert] then
  begin

    if (dmCDSMaster.cdsTransferencia_SaldoLOCAL_DESTINO.Value = 1) and (dmCDSMaster.cdsTransferencia_SaldoMOTIVO.Value <= 0) then
    begin

      lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + ', ' + MSG_CAMPO_OBRIGATORIO;
      Application.ProcessMessages;
      edtMotivo.SetFocus;

    end
    else
    begin

      dmCDSMaster.cdsTransferencia_Saldo.Post;
      dmSSPMaster.sspMan_Tab_Transf_Saldo.ParamByName('IP_OPCAO').Value           := 0;
      dmSSPMaster.sspMan_Tab_Transf_Saldo.ParamByName('IP_TRANSFERENCIA').Value   := dmCDSMaster.cdsTransferencia_SaldoTRANSFERENCIA.AsInteger;
      dmSSPMaster.sspMan_Tab_Transf_Saldo.ParamByName('IP_EMISSAO').Value         := dmCDSMaster.cdsTransferencia_SaldoEMISSAO.Value;
      dmSSPMaster.sspMan_Tab_Transf_Saldo.ParamByName('IP_HORA').Value            := dmCDSMaster.cdsTransferencia_SaldoHORA.Value;
      dmSSPMaster.sspMan_Tab_Transf_Saldo.ParamByName('IP_FUNCIONARIO').Value     := dmCDSMaster.cdsTransferencia_SaldoFUNCIONARIO.Value;
      dmSSPMaster.sspMan_Tab_Transf_Saldo.ParamByName('IP_REQUERENTE').Value      := dmCDSMaster.cdsTransferencia_SaldoREQUERENTE.Value;
      dmSSPMaster.sspMan_Tab_Transf_Saldo.ParamByName('IP_LOCAL_DESTINO').Value   := dmCDSMaster.cdsTransferencia_SaldoLOCAL_DESTINO.Value;
      dmSSPMaster.sspMan_Tab_Transf_Saldo.ParamByName('IP_DATA').Value            := Date;
      dmSSPMaster.sspMan_Tab_Transf_Saldo.ParamByName('IP_HORA').Value            := Time;
      dmSSPMaster.sspMan_Tab_Transf_Saldo.ParamByName('IP_USUARIO').Value         := dmDBEXMaster.iIdUsuario;
      dmSSPMaster.sspMan_Tab_Transf_Saldo.ParamByName('IP_NOME_COMPUTADOR').Value := pubNomeComputador;
      dmSSPMaster.sspMan_Tab_Transf_Saldo.ParamByName('IP_ENDERECO_IP').Value     := RetornarIP;
      dmSSPMaster.sspMan_Tab_Transf_Saldo.ParamByName('IP_MOTIVO').AsInteger      := dmCDSMaster.cdsTransferencia_SaldoMOTIVO.AsInteger;
      dmSSPMaster.sspMan_Tab_Transf_Saldo.ExecProc;

    end;

  end;

  dmCDSMaster.cdsItens_Transf_Saldo.First;

  while not dmCDSMaster.cdsItens_Transf_Saldo.Eof do
  begin

    dmCDSMaster.cdsItens_Transf_Saldo.Edit;
    dmCDSMaster.cdsItens_Transf_SaldoITEM.Value                                 := iItem;
    dmCDSMaster.cdsItens_Transf_Saldo.Post;

    dmSSPMaster.ssp_Man_Tab_Iten_Transf.ParamByName('IP_OPCAO').Value           := 0;
    dmSSPMaster.ssp_Man_Tab_Iten_Transf.ParamByName('IP_TRANSFERENCIA').Value   := dmCDSMaster.cdsItens_Transf_SaldoTRANSFERENCIA.Value;
    dmSSPMaster.ssp_Man_Tab_Iten_Transf.ParamByName('IP_ITEM').Value            := dmCDSMaster.cdsItens_Transf_SaldoITEM.Value;
    dmSSPMaster.ssp_Man_Tab_Iten_Transf.ParamByName('IP_PRODUTO').Value         := dmCDSMaster.cdsItens_Transf_SaldoPRODUTO.Value;
    dmSSPMaster.ssp_Man_Tab_Iten_Transf.ParamByName('IP_QUANTIDADE').AsCurrency := dmCDSMaster.cdsItens_Transf_SaldoQUANTIDADE.AsCurrency;
    dmSSPMaster.ssp_Man_Tab_Iten_Transf.ParamByName('IP_DATA').Value            := Date;
    dmSSPMaster.ssp_Man_Tab_Iten_Transf.ParamByName('IP_HORA').Value            := Time;
    dmSSPMaster.ssp_Man_Tab_Iten_Transf.ParamByName('IP_USUARIO').Value         := dmDBEXMaster.iIdUsuario;
    dmSSPMaster.ssp_Man_Tab_Iten_Transf.ParamByName('IP_NOME_COMPUTADOR').Value := pubNomeComputador;
    dmSSPMaster.ssp_Man_Tab_Iten_Transf.ParamByName('IP_ENDERECO_IP').Value     := RetornarIP;
    dmSSPMaster.ssp_Man_Tab_Iten_Transf.ExecProc;

    Inc(iItem);

    dmCDSMaster.cdsItens_Transf_Saldo.Next;

  end;

  dmCDSMaster.cdsItens_Transf_Saldo.First;

  DesabilitarControles;

  edtConteudoPesquisa.SetFocus;

end;

procedure TfrmTransferencia.actUltimoExecute(Sender: TObject);
begin

  if dmCDSMaster.cdsTransferencia_Saldo.Active then
    dmCDSMaster.cdsTransferencia_Saldo.Last;

end;

procedure TfrmTransferencia.DesabilitarControles;
begin

  grpDadosTransferencia.Enabled := false;
  grpItensTransferencia.Enabled := false;

end;

procedure TfrmTransferencia.edtAtendenteEnter(Sender: TObject);
begin

  MudarCorEdit(sender);

end;

procedure TfrmTransferencia.edtAtendenteExit(Sender: TObject);
var
  sSenha:string;
begin

  MudarCorEdit(sender);

  if dmCDSMaster.cdsTransferencia_Saldo.State in [dsEdit, dsInsert] then
  begin

    if dmCDSMaster.cdsTransferencia_SaldoFUNCIONARIO.Value > 0 then
    begin

      dmCDSMaster.cdsTransferencia_SaldoNOME_FUNCIONARIO.AsString := dmDBEXMaster.RetornarNomeFuncionario(dmCDSMaster.cdsTransferencia_SaldoFUNCIONARIO.Value,0,'');

      if dmCDSMaster.cdsTransferencia_SaldoNOME_FUNCIONARIO.AsString = '' then
      begin

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', ' + MSG_PESQUISA;
        Application.ProcessMessages;
        edtAtendente.SetFocus;

      end
      else
      begin

        LimparMsgErro;

        InputQuery('Informe a senha',#9#9,sSenha);

        if EnDecryptString(sSenha,236) <> dmDBEXMaster.RetornarSenhaFuncionario(dmCDSMaster.cdsTransferencia_SaldoFUNCIONARIO.Value) then
        begin

          lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', ' + MSG_SENHA_NCONFERE;
          Application.ProcessMessages;
          edtAtendente.SetFocus;

        end
        else
          LimparMsgErro;

      end;

    end
    else
    begin

      frmPesquisaFuncionario := TfrmPesquisaFuncionario.Create(Self);
      if frmPesquisaFuncionario.ShowModal = mrOk then
      begin

        InputQuery('Informe a senha',#9#9,sSenha);

        if EnDecryptString(sSenha,236) <> dmDBEXMaster.RetornarSenhaFuncionario(dmCDSMaster.cdsFuncionarioFUNCIONARIO.Value) then
        begin

          lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', ' + MSG_SENHA_NCONFERE;
          Application.ProcessMessages;
          edtAtendente.SetFocus;

        end
        else
        begin

          LimparMsgErro;
          dmCDSMaster.cdsTransferencia_SaldoFUNCIONARIO.Value         := dmCDSMaster.cdsFuncionarioFUNCIONARIO.Value;
          dmCDSMaster.cdsTransferencia_SaldoNOME_FUNCIONARIO.AsString := dmDBEXMaster.RetornarNomeFuncionario(dmCDSMaster.cdsTransferencia_SaldoFUNCIONARIO.Value,0,'');

        end;

      end;

    end;

  end;

end;

procedure TfrmTransferencia.edtCodigoGTINEnter(Sender: TObject);
begin

  MudarCorEdit(sender);

end;

procedure TfrmTransferencia.edtCodigoGTINExit(Sender: TObject);
begin

  MudarCorEdit(sender);

  if dmCDSMaster.cdsTransferencia_Saldo.State in [dsEdit, dsInsert] then
  begin

    if Length(Trim(edtCodigoGTIN.Text)) > 0 then
    begin

      if edtCodigoGTIN.Text[1]  = '-' then
      begin

        edtCodigoGTIN.Text := Trim(Copy(edtCodigoGTIN.Text,2,length(edtCodigoGTIN.Text)));

        if dmCDSMaster.cdsItens_Transf_Saldo.Active then
        begin

          if dmCDSMaster.cdsItens_Transf_Saldo.Locate('PRODUTO',edtCodigoGTIN.Text,[]) then
          begin

            dmCDSMaster.cdsItens_Transf_Saldo.Delete;
            edtCodigoGTIN.Clear;
            edtCodigoGTIN.SetFocus;

          end
          else
          begin

            lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA;
            Application.ProcessMessages;
            edtCodigoGTIN.SetFocus;

          end;

        end;

      end;

    end;

    if (Length(Trim(edtCodigoGTIN.Text)) <= 6) and (Length(Trim(edtCodigoGTIN.Text)) > 0) then
    begin

      dmDBEXMaster.sqqProdutos.Close;
      dmDBEXMaster.sqqProdutos.SQL.Clear;
      dmDBEXMaster.sqqProdutos.SQL.Add('SELECT PRO.*, PF.* FROM PRODUTO PRO');
      dmDBEXMaster.sqqProdutos.SQL.Add('JOIN PRODUTOFILIAL PF');
      dmDBEXMaster.sqqProdutos.SQL.Add('ON(PF.PRODUTO = PRO.PRODUTO)');
      dmDBEXMaster.sqqProdutos.SQL.Add('WHERE PRO.PRODUTO = ' + Trim(edtCodigoGTIN.Text));
      dmDBEXMaster.sqqProdutos.SQL.Add(' AND PF.FILIAL = ' + IntToStr(dmDBEXMaster.iIdFilial));
      dmDBEXMaster.sqqProdutos.SQL.Add('ORDER BY PRO.DESCRICAO');
      dmDBEXMaster.sqqProdutos.Open;

      if dmDBEXMaster.sqqProdutos.IsEmpty then
      begin

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', ' + MSG_PESQUISA;
        Application.ProcessMessages;
        edtCodigoGTIN.SetFocus;

      end
      else
      begin

        LimparMsgErro;

        dmCDSMaster.PovoarDataSetProdutos;

        if dmCDSMaster.cdsItens_Transf_Saldo.Locate('produto;transferencia',VarArrayOf([edtCodigoGTIN.Text,dmCDSMaster.cdsTransferencia_SaldoTRANSFERENCIA.Value]),[]) then
        begin

          dmCDSMaster.cdsItens_Transf_Saldo.Edit;

          edtQuantidade.Text    := FormatFloat('#,##0.000',(dmCDSMaster.cdsItens_Transf_SaldoQUANTIDADE.Value));
          edtDescricao.Text     := dmCDSMaster.cdsItens_Transf_SaldoDESCRICAO_PRODUTO.Value;
          edtLojaAtual.Text     := FormatFloat('#,##0.000',(dmCDSMaster.cdsProdutosSALDO_LOJA.Value));
          edtdepositoAtual.Text := FormatFloat('#,##0.000',(dmCDSMaster.cdsProdutosSALDO_DEPOSITO.Value));

        end
        else
        begin

          edtLojaAtual.Text     := FormatFloat('#,##0.000',(dmCDSMaster.cdsProdutosSALDO_LOJA.Value));
          edtdepositoAtual.Text := FormatFloat('#,##0.000',(dmCDSMaster.cdsProdutosSALDO_DEPOSITO.Value));

          case rdgDestino.ItemIndex of
            0:begin

                if dmCDSMaster.cdsProdutosSALDO_DEPOSITO.Value <= 0 then
                begin

                  lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', saldo insuficiente para efetivar esta operação!';
                  Application.ProcessMessages;
                  edtCodigoGTIN.SetFocus;
                  exit;

                end;

              end;
            1:begin

                if dmCDSMaster.cdsProdutosSALDO_LOJA.Value <= 0 then
                begin

                  lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', saldo insuficiente para efetivar esta operação!';
                  Application.ProcessMessages;
                  edtCodigoGTIN.SetFocus;
                  exit;

                end;

              end;
          end;

          dmCDSMaster.cdsItens_Transf_Saldo.Last;
          edtQuantidade.Text    := '1,000';
          edtDescricao.Text     := dmCDSMaster.cdsProdutosDESCRICAO.Value;
          edtLojaAtual.Text     := FormatFloat('#,##0.000',(dmCDSMaster.cdsProdutosSALDO_LOJA.Value));
          edtdepositoAtual.Text := FormatFloat('#,##0.000',(dmCDSMaster.cdsProdutosSALDO_DEPOSITO.Value));

        end;

      end;

    end
    else if (Length(Trim(edtCodigoGTIN.Text)) > 6) and (Length(Trim(edtCodigoGTIN.Text)) > 0) then
    begin

      LimparMsgErro;

      dmDBEXMaster.sqqBarras.Close;
      dmDBEXMaster.sqqBarras.SQL.Clear;
      dmDBEXMaster.sqqBarras.sql.Add('SELECT * FROM BARRAS');
      dmDBEXMaster.sqqBarras.sql.Add('WHERE BARRAS = ' + edtCodigoGTIN.Text);
      dmDBEXMaster.sqqBarras.Open;

      if dmDBEXMaster.sqqBarras.IsEmpty then
      begin

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA;
        Application.ProcessMessages;
        edtCodigoGTIN.SetFocus;
        dmDBEXMaster.sqqBarras.Close;
        exit;

      end
      else
      begin

        dmDBEXMaster.sqqProdutos.Close;
        dmDBEXMaster.sqqProdutos.SQL.Clear;
        dmDBEXMaster.sqqProdutos.SQL.Add('SELECT PRO.*, PF.* FROM PRODUTO PRO');
        dmDBEXMaster.sqqProdutos.SQL.Add('JOIN PRODUTOFILIAL PF');
        dmDBEXMaster.sqqProdutos.SQL.Add('ON(PF.PRODUTO = PRO.PRODUTO)');
        dmDBEXMaster.sqqProdutos.SQL.Add('WHERE PRO.PRODUTO = ' + Trim(IntToStr(dmDBEXMaster.sqqBarras.FieldByName('PRODUTO').Value)));
        dmDBEXMaster.sqqProdutos.SQL.Add(' AND PF.FILIAL = ' + IntToStr(dmDBEXMaster.iIdFilial));
        dmDBEXMaster.sqqProdutos.SQL.Add('ORDER BY PRO.DESCRICAO');
        dmDBEXMaster.sqqProdutos.Open;

        if dmDBEXMaster.sqqProdutos.IsEmpty then
        begin

          lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', inconsistência do código de barras. Contacte suporte!';
          Application.ProcessMessages;
          edtCodigoGTIN.SetFocus;
          dmDBEXMaster.sqqProdutos.Close;
          exit;

        end
        else
        begin

          LimparMsgErro;

          dmCDSMaster.PovoarDataSetProdutos;

          edtCodigoGTIN.Text    := IntToStr(dmCDSMaster.cdsProdutosPRODUTO.Value);

          if dmCDSMaster.cdsItens_Transf_Saldo.Locate('produto;transferencia',VarArrayOf([dmCDSMaster.cdsProdutosPRODUTO.Value,dmCDSMaster.cdsTransferencia_SaldoTRANSFERENCIA.Value]),[]) then
          begin

            dmCDSMaster.cdsItens_Transf_Saldo.Edit;

            edtQuantidade.Text    := FormatFloat('#,##0.000',(dmCDSMaster.cdsItens_Transf_SaldoQUANTIDADE.Value));
            edtDescricao.Text     := dmCDSMaster.cdsItens_Transf_SaldoDESCRICAO_PRODUTO.Value;
            edtLojaAtual.Text     := FormatFloat('#,##0.000',(dmCDSMaster.cdsProdutosSALDO_LOJA.Value));
            edtdepositoAtual.Text := FormatFloat('#,##0.000',(dmCDSMaster.cdsProdutosSALDO_DEPOSITO.Value));

          end
          else
          begin

            edtLojaAtual.Text     := FormatFloat('#,##0.000',(dmCDSMaster.cdsProdutosSALDO_LOJA.Value));
            edtdepositoAtual.Text := FormatFloat('#,##0.000',(dmCDSMaster.cdsProdutosSALDO_DEPOSITO.Value));

            case rdgDestino.ItemIndex of
              0:begin

                  if dmCDSMaster.cdsProdutosSALDO_DEPOSITO.Value <= 0 then
                  begin

                    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', saldo insuficiente para efetivar esta operação!';
                    Application.ProcessMessages;
                    edtCodigoGTIN.SetFocus;
                    exit;

                  end;

                end;
              1:begin

                  if dmCDSMaster.cdsProdutosSALDO_LOJA.Value <= 0 then
                  begin

                    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', saldo insuficiente para efetivar esta operação!';
                    Application.ProcessMessages;
                    edtCodigoGTIN.SetFocus;
                    exit;

                  end;

                end;
            end;

            dmCDSMaster.cdsItens_Transf_Saldo.Last;
            edtQuantidade.Text    := '1,000';
            edtDescricao.Text     := dmCDSMaster.cdsProdutosDESCRICAO.Value;
            edtLojaAtual.Text     := FormatFloat('#,##0.000',(dmCDSMaster.cdsProdutosSALDO_LOJA.Value));
            edtdepositoAtual.Text := FormatFloat('#,##0.000',(dmCDSMaster.cdsProdutosSALDO_DEPOSITO.Value));

          end;

        end;

      end;

    end;

  end;

end;

procedure TfrmTransferencia.edtCodigoGTINKeyPress(Sender: TObject;
  var Key: Char);
begin

  if key = #13 then
  begin

    key := #0;
    PostMessage(handle, WM_KEYDOWN, VK_TAB, 1);

  end
  else
  begin

    if (key <> #8) and (key <> '-') then
      if not (Key in ['0'..'9']) then
        abort;

  end;

end;

procedure TfrmTransferencia.edtConteudoPesquisaEnter(Sender: TObject);
begin

  MudarCorEdit(sender);

end;

procedure TfrmTransferencia.edtConteudoPesquisaExit(Sender: TObject);
var
  iProduto:integer;
begin

  MudarCorEdit(sender);

  if Length(Trim(edtConteudoPesquisa.Text)) > 0 then
  begin

    LimparMsgErro;

    dmCDSMaster.cdsTransferencia_Saldo.Close;
    dmCDSMaster.cdsItens_Transf_Saldo.Close;

    pgcTransferencia.ActivePageIndex := 0;

    case rdgOpcoesPesquisa.ItemIndex of
      0:begin

          lblMsg.Caption := 'Aguarde.....';
          Application.ProcessMessages;

          //verifica se ofoi digitado codigo de barras
          if Length(Trim(edtConteudoPesquisa.Text)) > 6 then
          begin

            dmDBEXMaster.sqqBarras.Close;
            dmDBEXMaster.sqqBarras.SQL.Clear;
            dmDBEXMaster.sqqBarras.SQL.Add('SELECT PRODUTO FROM BARRAS');
            dmDBEXMaster.sqqBarras.SQL.Add('WHERE BARRAS = ' + QuotedStr(edtConteudoPesquisa.Text));
            dmDBEXMaster.sqqBarras.Open;

            if dmDBEXMaster.sqqBarras.IsEmpty then
            begin

              lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA;
              Application.ProcessMessages;
              dmDBEXMaster.sqqBarras.Close;
              edtConteudoPesquisa.SetFocus;
              exit;

            end
            else
            begin

              dmDBEXMaster.sqqProdutos.Close;
              dmDBEXMaster.sqqProdutos.SQL.Clear;
              dmDBEXMaster.sqqProdutos.SQL.Add('SELECT * FROM PRODUTO');
              dmDBEXMaster.sqqProdutos.SQL.Add('WHERE PRODUTO = ' + IntToStr(dmDBEXMaster.sqqBarras.FieldByName('PRODUTO').Value));
              dmDBEXMaster.sqqProdutos.Open;

              if dmDBEXMaster.sqqProdutos.IsEmpty then
              begin

                lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', código de barras órfão. Entre em contato com o suporte!';
                Application.ProcessMessages;
                dmDBEXMaster.sqqProdutos.Close;
                edtConteudoPesquisa.SetFocus;
                exit;

              end
              else
                iProduto := dmDBEXMaster.sqqBarras.FieldByName('PRODUTO').Value;

            end;

          end
          else
          begin

            dmDBEXMaster.sqqProdutos.Close;
            dmDBEXMaster.sqqProdutos.SQL.Clear;
            dmDBEXMaster.sqqProdutos.SQL.Add('SELECT * FROM PRODUTO');
            dmDBEXMaster.sqqProdutos.SQL.Add('WHERE PRODUTO = ' + Trim(edtConteudoPesquisa.Text));
            dmDBEXMaster.sqqProdutos.Open;

            if dmDBEXMaster.sqqProdutos.IsEmpty then
            begin

              lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA;
              Application.ProcessMessages;
              dmDBEXMaster.sqqProdutos.Close;
              edtConteudoPesquisa.SetFocus;
              exit;

            end
            else
              iProduto := dmDBEXMaster.sqqProdutos.FieldByName('PRODUTO').Value;

          end;

          edtConteudoPesquisa.Clear;

          dmDBEXMaster.sqqItensTransf_saldo.Close;
          dmDBEXMaster.sqqItensTransf_saldo.SQL.Clear;
          dmDBEXMaster.sqqItensTransf_saldo.SQL.Add('SELECT * FROM ITENS_TRASNFERENCIA_SALDO');
          dmDBEXMaster.sqqItensTransf_saldo.SQL.Add('WHERE PRODUTO = ' + IntToStr(iProduto));
          dmDBEXMaster.sqqItensTransf_saldo.Open;

          if dmDBEXMaster.sqqItensTransf_saldo.IsEmpty then
          begin

              lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', não existe(m) transferencia(s) com este produto!';
              Application.ProcessMessages;
              edtConteudoPesquisa.SetFocus;
              exit;

          end
          else
          begin

            dmCDSMaster.cdsTransferencia_Saldo.Close;
            dmCDSMaster.cdsTransferencia_Saldo.CreateDataSet;

            while not dmDBEXMaster.sqqItensTransf_saldo.Eof do
            begin

              dmDBEXMaster.sqqTransferencia_Saldo.Close;
              dmDBEXMaster.sqqTransferencia_Saldo.SQL.Clear;
              dmDBEXMaster.sqqTransferencia_Saldo.SQL.Add('SELECT * FROM TRANSFERENCIA_SALDO');
              dmDBEXMaster.sqqTransferencia_Saldo.SQL.Add('WHERE TRANSFERENCIA = ' + IntToStr(dmDBEXMaster.sqqItensTransf_saldo.FieldByName('TRANSFERENCIA').Value));
              dmDBEXMaster.sqqTransferencia_Saldo.Open;

              if not dmDBEXMaster.sqqTransferencia_Saldo.IsEmpty then
              begin

                dmCDSMaster.cdsTransferencia_Saldo.Append;
                dmCDSMaster.cdsTransferencia_SaldoTRANSFERENCIA.Value           := dmDBEXMaster.sqqTransferencia_Saldo.FieldByName('TRANSFERENCIA').Value;
                dmCDSMaster.cdsTransferencia_SaldoEMISSAO.Value                 := dmDBEXMaster.sqqTransferencia_Saldo.FieldByName('EMISSAO').Value;
                dmCDSMaster.cdsTransferencia_SaldoHORA.Value                    := dmDBEXMaster.sqqTransferencia_Saldo.FieldByName('HORA').Value;
                dmCDSMaster.cdsTransferencia_SaldoFUNCIONARIO.Value             := dmDBEXMaster.sqqTransferencia_Saldo.FieldByName('FUNCIONARIO').Value;
                dmCDSMaster.cdsTransferencia_SaldoREQUERENTE.Value              := dmDBEXMaster.sqqTransferencia_Saldo.FieldByName('REQUERENTE').Value;
                dmCDSMaster.cdsTransferencia_SaldoSTATUS.Value                  := dmDBEXMaster.sqqTransferencia_Saldo.FieldByName('STATUS').Value;
                dmCDSMaster.cdsTransferencia_SaldoLOCAL_DESTINO.Value           := dmDBEXMaster.sqqTransferencia_Saldo.FieldByName('LOCAL_DESTINO').Value;

                dmDBEXMaster.sqqMotivo.Close;

                if dmDBEXMaster.sqqTransferencia_Saldo.FieldByName('MOTIVO').AsInteger > 0 then
                begin

                  dmCDSMaster.cdsTransferencia_SaldoMOTIVO.AsInteger            := dmDBEXMaster.sqqTransferencia_Saldo.FieldByName('MOTIVO').AsInteger;

                  dmDBEXMaster.sqqMotivo.SQL.Clear;
                  dmDBEXMaster.sqqMotivo.SQL.Add('SELECT * FROM MOTIVOS');
                  dmDBEXMaster.sqqMotivo.SQL.Add('WHERE MOTIVO = ' + IntToStr(dmCDSMaster.cdsTransferencia_SaldoMOTIVO.Value));
                  dmDBEXMaster.sqqMotivo.Open;

                  dmCDSMaster.cdsTransferencia_SaldoDESCRICAO_MOTIVO.AsString   := dmDBEXMaster.sqqMotivo.FieldByName('TEXTO').AsString;

                end;

                dmDBEXMaster.sqqFuncionario.Close;
                dmDBEXMaster.sqqFuncionario.SQL.Clear;
                dmDBEXMaster.sqqFuncionario.SQL.Add('SELECT * FROM FUNCIONARIO');
                dmDBEXMaster.sqqFuncionario.SQL.Add('WHERE FUNCIONARIO = ' + IntToStr(dmCDSMaster.cdsTransferencia_SaldoFUNCIONARIO.Value)) ;
                dmDBEXMaster.sqqFuncionario.Open;

                dmCDSMaster.cdsTransferencia_SaldoNOME_FUNCIONARIO.Value        := dmDBEXMaster.sqqFuncionario.FieldByName('NOME').Value;

                dmDBEXMaster.sqqFuncionario.Close;
                dmDBEXMaster.sqqFuncionario.SQL.Clear;
                dmDBEXMaster.sqqFuncionario.SQL.Add('SELECT * FROM FUNCIONARIO');
                dmDBEXMaster.sqqFuncionario.SQL.Add('WHERE FUNCIONARIO = ' + IntToStr(dmCDSMaster.cdsTransferencia_SaldoREQUERENTE.Value)) ;
                dmDBEXMaster.sqqFuncionario.Open;

                dmCDSMaster.cdsTransferencia_SaldoNOME_REQUERENTE.Value         := dmDBEXMaster.sqqFuncionario.FieldByName('NOME').Value;
                dmCDSMaster.cdsTransferencia_Saldo.Post;

              end;

              dmDBEXMaster.sqqItensTransf_saldo.Next;

            end;

          end;

          LimparMsgErro;
          grdTabela.SetFocus;
          dmCDSMaster.cdsTransferencia_Saldo.First;

        end;

      1:begin

          lblMsg.Caption := 'Aguarde.....';
          Application.ProcessMessages;

          dmDBEXMaster.sqqTransferencia_Saldo.Close;
          dmDBEXMaster.sqqTransferencia_Saldo.SQL.Clear;
          dmDBEXMaster.sqqTransferencia_Saldo.SQL.Add('SELECT * FROM TRANSFERENCIA_SALDO');
          dmDBEXMaster.sqqTransferencia_Saldo.SQL.Add('WHERE TRANSFERENCIA = ' + edtConteudoPesquisa.Text);
          dmDBEXMaster.sqqTransferencia_Saldo.Open;

          if dmDBEXMaster.sqqTransferencia_Saldo.IsEmpty then
          begin

            lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA;
            Application.ProcessMessages;
            edtConteudoPesquisa.SetFocus;

          end
          else
          begin

            dmCDSMaster.PovoarDataSetTransferencia_Saldo;
            grdTabela.SetFocus;

            edtConteudoPesquisa.Clear;

            LimparMsgErro;

          end;
        end;
    end;

    case dmCDSMaster.cdsTransferencia_SaldoSTATUS.Value of
      0:imgStatus.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)
                                        +'esfera_verde.png');
      1:imgStatus.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)
                                        +'esfera_vermelha.png');
    end;

    imgStatus.Visible := not (dmCDSMaster.cdsTransferencia_Saldo.IsEmpty);

  end;
end;

procedure TfrmTransferencia.edtConteudoPesquisaKeyPress(Sender: TObject;
  var Key: Char);
begin

  if key = #13 then
  begin

    key := #0;
    PostMessage(handle, WM_KEYDOWN, VK_TAB, 1);

  end;

end;

procedure TfrmTransferencia.edtControleKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  iDirecao: Integer;
begin
  //habilita movimentação dos campos com as setas acima/abaixo
  iDirecao := -1;
  case Key of
    VK_DOWN: iDirecao := 0; {Próximo}
    VK_UP: iDirecao := 1;   {Anterior}
  end;
  if iDirecao <> -1 then
  begin
    Perform(WM_NEXTDLGCTL, iDirecao, 0);
    Key := 0;
  end;

end;

procedure TfrmTransferencia.edtEmissaoChange(Sender: TObject);
begin

  case dmCDSMaster.cdsTransferencia_SaldoSTATUS.Value of
    0:imgStatus.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)
                                      +'esfera_verde.png');
    1:imgStatus.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)
                                      +'esfera_vermelha.png');
  end;

  imgStatus.Visible := (dmCDSMaster.cdsTransferencia_Saldo.IsEmpty) or (dmCDSMaster.cdsTransferencia_Saldo.State in [dsInsert]);

end;

procedure TfrmTransferencia.edtMotivoExit(Sender: TObject);
begin

  MudarCorEdit(sender);

  if dmCDSMaster.cdsTransferencia_Saldo.State in [dsEdit, dsInsert] then
  begin

    if dmCDSMaster.cdsTransferencia_SaldoMOTIVO.Value > 0 then
    begin

      dmCDSMaster.cdsTransferencia_SaldoDESCRICAO_MOTIVO.AsString := dmDBEXMaster.RetornarDescricaoMotivo(dmCDSMaster.cdsTransferencia_SaldoMOTIVO.Value,0,'');

      if dmCDSMaster.cdsTransferencia_SaldoDESCRICAO_MOTIVO.AsString = '' then
      begin

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', ' + MSG_PESQUISA;
        Application.ProcessMessages;
        edtMotivo.SetFocus;

      end
      else
      begin

        LimparMsgErro;
        edtCodigoGTIN.SetFocus;

      end;

    end
    else
    begin

      LimparMsgErro;

      frmPesquisaMotivos := TfrmPesquisaMotivos.Create(Self);
      if frmPesquisaMotivos.ShowModal = mrOk then
      begin

        dmCDSMaster.cdsTransferencia_SaldoMOTIVO.Value              := dmCDSMaster.cdsMotivosMOTIVO.Value;
        dmCDSMaster.cdsTransferencia_SaldoDESCRICAO_MOTIVO.AsString := dmDBEXMaster.RetornarDescricaoMotivo(dmCDSMaster.cdsMotivosMOTIVO.Value,0,'');
        edtCodigoGTIN.SetFocus;

      end;

    end;

  end;

end;

procedure TfrmTransferencia.edtQuantidadeExit(Sender: TObject);
var
  iItem:integer;
begin

  MudarCorEdit(sender);

  if dmCDSMaster.cdsTransferencia_Saldo.State in [dsEdit, dsInsert] then
  begin

    case rdgDestino.ItemIndex of
      0:begin

          if StrToFloat(RetirarPonto(edtQuantidade.Text)) > dmCDSMaster.cdsProdutosSALDO_DEPOSITO.Value then
          begin

            lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', saldo insuficiente para efetivar esta operação!';
            Application.ProcessMessages;
            edtQuantidade.SetFocus;
            exit;

          end;

        end;
      1:begin

          if StrToFloat(RetirarPonto(edtQuantidade.Text)) > dmCDSMaster.cdsProdutosSALDO_LOJA.Value then
          begin

            lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', saldo insuficiente para efetivar esta operação!';
            Application.ProcessMessages;
            edtCodigoGTIN.SetFocus;
            exit;

          end;

        end;

    end;


    if Length(Trim(edtCodigoGTIN.Text)) > 0  then
    begin


      iItem := dmCDSMaster.cdsItens_Transf_SaldoITEM.Value;

      if dmCDSMaster.cdsItens_Transf_Saldo.State in [dsBrowse] then
      begin

        inc(iItem);
        dmCDSMaster.cdsItens_Transf_Saldo.Append;

      end;

      dmCDSMaster.cdsItens_Transf_SaldoTRANSFERENCIA.Value      := dmCDSMaster.cdsTransferencia_SaldoTRANSFERENCIA.Value;
      dmCDSMaster.cdsItens_Transf_SaldoITEM.Value               := iItem;
      dmCDSMaster.cdsItens_Transf_SaldoPRODUTO.Value            := StrToInt(edtCodigoGTIN.Text);
      dmCDSMaster.cdsItens_Transf_SaldoQUANTIDADE.Value         := StrToFloat(RetirarPonto(edtQuantidade.Text));
      dmCDSMaster.cdsItens_Transf_SaldoDESCRICAO_PRODUTO.Value  := edtDescricao.Text;
      dmCDSMaster.cdsItens_Transf_Saldo.Post;

    end;

  end;

  edtCodigoGTIN.Clear;
  edtCodigoGTIN.SetFocus;
  edtQuantidade.Text  := '1,000';
  edtDescricao.Clear;

end;

procedure TfrmTransferencia.edtQuantidadeKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = DecimalSeparator then
    Key := ',';

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end;

end;

procedure TfrmTransferencia.edtrequerenteExit(Sender: TObject);
begin

  MudarCorEdit(sender);

  if dmCDSMaster.cdsTransferencia_Saldo.State in [dsEdit, dsInsert] then
  begin

    if dmCDSMaster.cdsTransferencia_SaldoREQUERENTE.Value > 0 then
    begin

      dmCDSMaster.cdsTransferencia_SaldoNOME_REQUERENTE.AsString := dmDBEXMaster.RetornarNomeFuncionario(dmCDSMaster.cdsTransferencia_SaldoREQUERENTE.Value,0,'');

      if dmCDSMaster.cdsTransferencia_SaldoNOME_REQUERENTE.AsString = '' then
      begin

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', ' + MSG_PESQUISA;
        Application.ProcessMessages;
        edtAtendente.SetFocus;

      end
      else
      begin

        LimparMsgErro;
        edtCodigoGTIN.SetFocus;

      end;

    end
    else
    begin

      LimparMsgErro;

      frmPesquisaFuncionario := TfrmPesquisaFuncionario.Create(Self);
      if frmPesquisaFuncionario.ShowModal = mrOk then
      begin

        dmCDSMaster.cdsTransferencia_SaldoREQUERENTE.Value          := dmCDSMaster.cdsFuncionarioFUNCIONARIO.Value;
        dmCDSMaster.cdsTransferencia_SaldoNOME_REQUERENTE.AsString  := dmDBEXMaster.RetornarNomeFuncionario(dmCDSMaster.cdsFuncionarioFUNCIONARIO.Value,0,'');
        edtCodigoGTIN.SetFocus;

      end;

    end;

  end
  else
    edtCodigoGTIN.SetFocus;


end;

procedure TfrmTransferencia.FormCreate(Sender: TObject);
begin

  PostMessage(FindWindow(nil, 'GenesisAC'), WM_CLOSE, 0, 0);

  Caption := Application.Title + ' - versão ' + VersaoExe(Application.ExeName);

  DesabilitarBotaoFecharForm(frmTransferencia.Caption);

  ifArqIni  := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Config.ini');

  Caption         := Application.Title + ' - ' + RetornarVersao(Application.ExeName, 1);

  DesabilitarBotaoFecharForm(Caption);

  dmDBEXMaster.sNomeUsuario := ParamStr(1);
  dmDBEXMaster.sSenha       := paramstr(2);
  dmDBEXMaster.iIdUsuario   := StrToInt(ParamStr(3));
  dmDBEXMaster.iIdFilial    := StrToInt(ParamStr(4));

  dmDBEXMaster.sqcMaster.Params.Clear;

  //Carrega congurações
  dmDBEXMaster.sqcMaster.Params.Values['DRIVERNAME']  := 'Firebird';
  dmDBEXMaster.sqcMaster.Params.Values['DATABASE']    := ifArqIni.ReadString('Servidor', 'TCPIP', '')
                                                        + ':' +  ifArqIni.ReadString('Servidor', 'Path', 'C:\');
  dmDBEXMaster.sqcMaster.LoginPrompt                  := False;
  dmDBEXMaster.sqcMaster.Params.Values['USER_NAME']   := dmDBEXMaster.sNomeUsuario;
  dmDBEXMaster.sqcMaster.Params.Values['PASSWORD']    := dmDBEXMaster.sSenha;
  dmDBEXMaster.sqcMaster.Params.Values['SQLDIALECT']  := '3';

  pgcTransferencia.ActivePageIndex := 0;

  dmDBEXMaster.sqqFilial.Close;
  dmDBEXMaster.sqqFilial.SQL.Clear;
  dmDBEXMaster.sqqFilial.SQL.Add('SELECT RAZAOSOCIAL FROM FILIAL');
  dmDBEXMaster.sqqFilial.SQL.Add('WHERE FILIAL = ' + IntToStr(dmDBEXMaster.iIdFilial));
  dmDBEXMaster.sqqFilial.Open;

  dmDBEXMaster.sNomeFilial := dmDBEXMaster.sqqFilial.FieldByName('RAZAOSOCIAL').Value;

  dmDBEXMaster.sqqFilial.Close;


end;

procedure TfrmTransferencia.grdTabelaDblClick(Sender: TObject);
begin

  if dmCDSMaster.cdsTransferencia_Saldo.Active then
    if not dmCDSMaster.cdsTransferencia_Saldo.IsEmpty then
    begin

      dmDBEXMaster.sqqItensTransf_saldo.Close;
      dmDBEXMaster.sqqItensTransf_saldo.SQL.Clear;
      dmDBEXMaster.sqqItensTransf_saldo.SQL.Add('SELECT * FROM ITENS_TRASNFERENCIA_SALDO');
      dmDBEXMaster.sqqItensTransf_saldo.SQL.Add('WHERE TRANSFERENCIA = ' + InttoStr(dmCDSMaster.cdsTransferencia_SaldoTRANSFERENCIA.Value));
      dmDBEXMaster.sqqItensTransf_saldo.Open;

      dmCDSMaster.PovoarDataSetItemTransf_Saldo;
      pgcTransferencia.ActivePageIndex := 1;

    end;

end;

procedure TfrmTransferencia.grdTabelaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  R : TRect;
begin

  if not odd(dmCDSMaster.cdsTransferencia_Saldo.RecNo) then
  begin

    grdTabela.Canvas.Font.Color:= clBlack;
    grdTabela.Canvas.Brush.Color:= COR_ZEBRA_GRADE;

  end
  else
  begin

    grdTabela.Canvas.Font.Color:= clBlack;
    grdTabela.Canvas.Brush.Color:= clWhite;

  end;

  grdTabela.Canvas.FillRect(Rect);
  grdTabela.DefaultDrawDataCell(Rect,Column.Field,State);

  R:=Rect;
  Dec(R.Bottom,2);

  if Column.Field = dmCDSMaster.cdsTransferencia_Saldo.FieldByName('DESCRICAO_STATUS') then
  begin

    if not (gdSelected in State) then
      grdTabela.Canvas.FillRect(Rect);

    grdTabela.Canvas.TextRect(R,R.Left,R.Top, dmCDSMaster.cdsTransferencia_Saldo.FieldByName('DESCRICAO_STATUS').AsString);

  end;

end;

procedure TfrmTransferencia.grdTabelaKeyPress(Sender: TObject; var Key: Char);
begin

  if key = #13 then
    grdTabelaDblClick(Self);

end;

procedure TfrmTransferencia.HabilitarControles;
begin

  grpDadosTransferencia.Enabled := true;
  grpItensTransferencia.Enabled := true;

end;

procedure TfrmTransferencia.imgConfirmarClick(Sender: TObject);
begin

  actConfirmarTransfExecute(self);

end;

procedure TfrmTransferencia.imgDesfazerClick(Sender: TObject);
begin

  actCancelarExecute(self);

end;

procedure TfrmTransferencia.imgEditarClick(Sender: TObject);
begin

  actEditarExecute(self);

end;

procedure TfrmTransferencia.imgImprimirClick(Sender: TObject);
begin

  actImprimirExecute(Self);

end;

procedure TfrmTransferencia.imgNovoClick(Sender: TObject);
begin

  actIncluirExecute(self);;

end;

procedure TfrmTransferencia.imgPrimeiro_RegClick(Sender: TObject);
begin

  actPrimeiroExecute(self);

end;

procedure TfrmTransferencia.imgProximo_RegClick(Sender: TObject);
begin

  actProximoExecute(self);

end;

procedure TfrmTransferencia.imgRegisto_AntClick(Sender: TObject);
begin

  actAnteriorExecute(self);

end;

procedure TfrmTransferencia.imgSairClick(Sender: TObject);
begin

  actSairExecute(self);;

end;

procedure TfrmTransferencia.imgSalvarClick(Sender: TObject);
begin

  actSalvarExecute(self);;

end;

procedure TfrmTransferencia.imgUltimo_RegClick(Sender: TObject);
begin

  actUltimoExecute(self);

end;

procedure TfrmTransferencia.LimparMsgErro;
begin

  lblMsg.Caption := '';
  Application.ProcessMessages;

end;

procedure TfrmTransferencia.rdgDestinoClick(Sender: TObject);
begin

  edtMotivo.Enabled := rdgDestino.ItemIndex = 1;

  if edtMotivo.Enabled then
    edtMotivo.SetFocus
  else
  begin

    dmCDSMaster.cdsTransferencia_SaldoMOTIVO.Clear;
    dmCDSMaster.cdsTransferencia_SaldoDESCRICAO_MOTIVO.Clear;

  end;



end;

procedure TfrmTransferencia.rdgOpcoesPesquisaClick(Sender: TObject);
begin

  edtConteudoPesquisa.Clear;
  edtConteudoPesquisa.SetFocus;

end;

end.
