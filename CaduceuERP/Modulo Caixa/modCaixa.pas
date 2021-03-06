unit modCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Imaging.pngimage;

type
  TfrmCaixa = class(TForm)
    pnlEmpresa: TPanel;
    txtEmpresa: TDBText;
    pnlCentro: TPanel;
    pnlRodape: TPanel;
    lblTelefoneEmpresa: TLabel;
    imgCancelar: TImage;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    txtNomeFuncionario: TDBText;
    txtStatusCaixa: TDBText;
    grpMensagem: TGroupBox;
    lblMsg: TLabel;
    txtDataAbertura: TDBText;
    btnFlashCaixa: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure imgCancelarClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure LimparMsgErro;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure btnFlashCaixaClick(Sender: TObject);
  private
    { Private declarations }
    procedure AbrirItemCaixa(pCaixa:integer);
  public
    { Public declarations }
  end;

var
  frmCaixa: TfrmCaixa;

implementation

{$R *.dfm}

uses dataDBEXMaster, dataMProvider, dataMSource, dataMSProcedure,
  uConstantes_Padrao, uFuncoes, modAbre_Caixa, modMonitorPedido,
  modControleCaixa, modFechaCaixa, dataMRelatorios;

procedure TfrmCaixa.AbrirItemCaixa(pCaixa: integer);
begin

  dmMProvider.cdsItemCaixaLoja.Close;
  dmMProvider.cdsItemCaixaLoja.ProviderName := 'dspItemCaixaLoja';

  dmDBEXMaster.fdqItemCaixaLoja.SQL.Clear;
  dmDBEXMaster.fdqItemCaixaLoja.SQL.Add('select * from item_caixa_loja');
  dmDBEXMaster.fdqItemCaixaLoja.SQL.Add('where caixa_loja = ' + IntToStr(pCaixa));

  dmMProvider.cdsItemCaixaLoja.Open;
  dmMProvider.cdsItemCaixaLoja.ProviderName := '';
  dmMProvider.cdsItemCaixaLoja.Last;

end;

procedure TfrmCaixa.btnFlashCaixaClick(Sender: TObject);
begin

  AbrirItemCaixa(dmMProvider.cdsCaixaLojaCAIXA_LOJA.Value);

  dmRelatorios.rvsGenesisAC.SystemPreview.ZoomFactor  := 126.4;
  dmRelatorios.rvdGenesis.DataSet                     := dmMProvider.cdsItemCaixaLoja;

  if FileExists(ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Diversos.rav') then
  begin

    dmRelatorios.rvpGenesisAC.ProjectFile := ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Diversos.rav';
    dmRelatorios.rvpGenesisAC.SelectReport('rptFechamentoCX',true);
    dmRelatorios.rvpGenesisAC.SetParam('pIDSistema',ID_SISTEMA);
    dmRelatorios.rvpGenesisAC.SetParam('pLOGO_MARCA',ExtractFilePath(Application.ExeName) + 'Logomarca\LogoMarca.bmp');
    dmRelatorios.rvpGenesisAC.SetParam('pID_Sistema',ID_SISTEMA);
    dmRelatorios.rvpGenesisAC.SetParam('pCNPJ',FormatarCNPJCPF(dmMProvider.cdsClientesCNPJ.Value));
    dmRelatorios.rvpGenesisAC.SetParam('pEndereco_Filial',dmMProvider.cdsFilialENDERECO.Value);

    if dmMProvider.cdsFilialNUMERO.Value > 0 then
      dmRelatorios.rvpGenesisAC.SetParam('pNumero_Filial',IntToStr(dmMProvider.cdsFilialNUMERO.Value))
    else
      dmRelatorios.rvpGenesisAC.SetParam('pNumero_Filial','S/N');

    dmRelatorios.rvpGenesisAC.SetParam('pBairro_Filial',dmMProvider.cdsFilialBAIRRO.Value);
    dmRelatorios.rvpGenesisAC.SetParam('pDDD_Filial',dmMProvider.cdsFilialDDD.Value);
    dmRelatorios.rvpGenesisAC.SetParam('pTelefone_Filial',dmMProvider.cdsFilialTELEFONE1.Value);
    dmRelatorios.rvpGenesisAC.SetParam('pCidade_Filial',dmMProvider.cdsFilialNOMECIDADE.Value);
    dmRelatorios.rvpGenesisAC.SetParam('pEmail_Filial',dmMProvider.cdsFilialEMAIL.Value);

    dmRelatorios.rvpGenesisAC.Execute;
    dmRelatorios.rvpGenesisAC.Close;

  end
  else
  begin

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', ' + MSG_ARQ_NEXISTE + ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Diversos.rav';
    Application.ProcessMessages;

  end;

end;

procedure TfrmCaixa.FormCreate(Sender: TObject);
begin

  DesabilitarBotaoFecharForm(handle);

  try

    dmDBEXMaster.iIdFilial := 1;

    dmMProvider.AbrirTabelaFilial;
{    dmMProvider.cdsFilial.Close;
    dmMProvider.cdsFilial.ProviderName := 'dspFilial';

    dmDBEXMaster.fdqFilial.SQL.Clear;
    dmDBEXMaster.fdqFilial.SQL.Add('SELECT fil.*, (select nome as nome_cidade from cidades where cidade = fil.cidade) FROM FILIAL fil');
    dmDBEXMaster.fdqFilial.SQL.Add('where fil.filial = 1');

    dmMProvider.cdsFilial.Open;
    dmMProvider.cdsFilial.ProviderName := '';
}
    dmDBEXMaster.iIdFilial          := dmMProvider.cdsFilialFILIAL.Value;

    lblTelefoneEmpresa.Caption      := FormatarTelefone(Trim(dmMProvider.cdsFilialDDD.Value), Trim(dmMProvider.cdsFilialTELEFONE1.Value));

    dmMProvider.cdsCaixaLoja.Close;
    dmMProvider.cdsCaixaLoja.ProviderName := 'dspCaixa_loja';

    dmDBEXMaster.fdqCaixaLoja.SQL.Clear;
    dmDBEXMaster.fdqCaixaLoja.SQL.Add('select * from caixa_loja');
    dmDBEXMaster.fdqCaixaLoja.SQL.Add('where data_abertura = ' + QuotedStr(FormatDateTime('mm/dd/yy',Date)));

    dmMProvider.cdsCaixaLoja.Open;
    dmMProvider.cdsCaixaLoja.ProviderName := '';

    dmDBEXMaster.sNomeUsuario := dmMProvider.cdsCaixaLojaNOME_FUNCIONARIO.Value;

    if not (dmMProvider.cdsConfiguracoesDDP.IsNull) then
      lblMsg.Caption := 'Licen�a de uso expirada! Entre em contato com o suporte.';


  except
    on E: exception do
      Tratar_Erro_Conexao(E);

  end;


end;

procedure TfrmCaixa.imgCancelarClick(Sender: TObject);
begin

  Close;

end;

procedure TfrmCaixa.LimparMsgErro;
begin

  lblMsg.Caption := '';
  Application.ProcessMessages;

end;

procedure TfrmCaixa.SpeedButton1Click(Sender: TObject);
begin

  LimparMsgErro;

  if dmMProvider.cdsConfiguracoesDDP.IsNull then
  begin

    if dmMProvider.cdsCaixaLojaSTATUS.Value = 0 then
    begin

      lblMsg.Caption := MSG_CAIXA_NAO_ABERTO;
      Application.ProcessMessages;

    end
    else if dmMProvider.cdsCaixaLojaSTATUS.Value = 2 then
    begin

      lblMsg.Caption := MSG_CAIXA_JA_FECHADO;
      Application.ProcessMessages;

    end
    else
    begin

      if (dmMProvider.cdsCaixaLojaSTATUS.Value = 1) and( dmMProvider.cdsCaixaLojaDATA_ABERTURA.Value <> Date) then
      begin

        lblMsg.Caption := MSG_CAIXA_ABERTO_DATA_DIFER + ' Data abertura: ' + FormatDateTime('dd/mm/yyyy', dmMProvider.cdsCaixaLojaDATA_ABERTURA.Value )
                                                      + ' data atual: ' + FormatDateTime('dd/mm/yyyy', Date);
        Application.ProcessMessages;

      end
      else
      begin

        frmMonitorPedido := TfrmMonitorPedido.Create(self);

        frmMonitorPedido.ShowModal;
        FreeAndNil(frmMonitorPedido);

      end;

    end;

  end
  else
    lblMsg.Caption := 'Licen�a de uso expirada! Entre em contato com o suporte.';

  Application.ProcessMessages;



end;

procedure TfrmCaixa.SpeedButton2Click(Sender: TObject);
begin

  LimparMsgErro;

  if dmMProvider.cdsConfiguracoesDDP.IsNull then
  begin

    if dmMProvider.cdsCaixaLojaSTATUS.Value = 1 then
    begin

      lblMsg.Caption := MSG_CAIXA_JA_ABERTO;
      Application.ProcessMessages;

    end
    else if dmMProvider.cdsCaixaLojaSTATUS.Value = 2 then
    begin

      lblMsg.Caption := MSG_CAIXA_JA_FECHADO;
      Application.ProcessMessages;

    end
    else
    begin

      dmMProvider.cdsCaixaLoja.Close;
      dmMProvider.cdsCaixaLoja.ProviderName := 'dspCaixa_loja';

      dmDBEXMaster.fdqCaixaLoja.SQL.Clear;
      dmDBEXMaster.fdqCaixaLoja.SQL.Add('select * from caixa_loja');
      dmDBEXMaster.fdqCaixaLoja.SQL.Add('where status = 1');

      dmMProvider.cdsCaixaLoja.Open;
      dmMProvider.cdsCaixaLoja.ProviderName := '';

      if not dmMProvider.cdsCaixaLoja.IsEmpty then
      begin

        lblMsg.Caption := MSG_EXISTE_CAIXA_ABERTO + FormatDateTime('dd/mm/yyyy',dmMProvider.cdsCaixaLojaDATA_ABERTURA.Value)
                          + ' por: ' + dmMProvider.cdsCaixaLojaNOME_FUNCIONARIO.Value;
        Application.ProcessMessages;

        dmDBEXMaster.sNomeUsuario := dmMProvider.cdsCaixaLojaNOME_FUNCIONARIO.Value;

      end
      else
      begin

        frmAbreCaixa := TfrmAbreCaixa.Create(self);

        if frmAbreCaixa.ShowModal = mrOk then
        begin

          dmMSProcedure.fdspAbre_Caixa.Params[0].Value :=   Date;
          dmMSProcedure.fdspAbre_Caixa.Params[1].Value :=   Time;
          dmMSProcedure.fdspAbre_Caixa.Params[2].Value :=   StrToFloat(RetirarVirgula(frmAbreCaixa.edtValor_Abertura.Text))/100;
          dmMSProcedure.fdspAbre_Caixa.Params[3].Value :=   frmAbreCaixa.cboFuncionario.KeyValue;
          dmMSProcedure.fdspAbre_Caixa.ExecProc;

          dmMProvider.cdsCaixaLoja.Close;
          dmMProvider.cdsCaixaLoja.ProviderName := 'dspCaixa_loja';

          dmDBEXMaster.fdqCaixaLoja.SQL.Clear;
          dmDBEXMaster.fdqCaixaLoja.SQL.Add('select * from caixa_loja');
          dmDBEXMaster.fdqCaixaLoja.SQL.Add('where data_abertura = ' + QuotedStr(FormatDateTime('mm/dd/yy',Date)));
          dmDBEXMaster.fdqCaixaLoja.SQL.Add('and status = 1');

          dmMProvider.cdsCaixaLoja.Open;
          dmMProvider.cdsCaixaLoja.ProviderName := '';

          dmMSProcedure.fdspItem_caixa_loja.Params[0].Value   :=  dmMProvider.cdsCaixaLojaCAIXA_LOJA.Value;
          dmMSProcedure.fdspItem_caixa_loja.Params[1].Value   :=  'ABERTURA DE CAIXA';
          dmMSProcedure.fdspItem_caixa_loja.Params[2].Value   :=  'ABR' + IntToStr(dmMProvider.cdsCaixaLojaCAIXA_LOJA.Value);
          dmMSProcedure.fdspItem_caixa_loja.Params[3].Value   :=  Date;
          dmMSProcedure.fdspItem_caixa_loja.Params[4].Value   :=  99;
          dmMSProcedure.fdspItem_caixa_loja.Params[5].Value   :=  StrToFloat(RetirarVirgula(frmAbreCaixa.edtValor_Abertura.Text))/100;
          dmMSProcedure.fdspItem_caixa_loja.Params[6].Value   :=  'C';
          dmMSProcedure.fdspItem_caixa_loja.Params[7].Value   :=  dmMProvider.cdsItemCaixaLojaSALDO.Value;
          dmMSProcedure.fdspItem_caixa_loja.Params[8].Value   :=  'ABERTURA DE CAIXA';
          dmMSProcedure.fdspItem_caixa_loja.Params[9].Value   :=  '';
          dmMSProcedure.fdspItem_caixa_loja.Params[10].Value  :=  null;
          dmMSProcedure.fdspItem_caixa_loja.Params[11].Value  :=  null;
          dmMSProcedure.fdspItem_caixa_loja.ExecProc;

          dmDBEXMaster.sNomeUsuario := dmMProvider.cdsCaixaLojaNOME_FUNCIONARIO.Value;

        end;

        FreeAndNil(frmAbreCaixa);

      end;

    end;

  end
  else
    lblMsg.Caption := 'Licen�a de uso expirada! Entre em contato com o suporte.';

  Application.ProcessMessages;

end;

procedure TfrmCaixa.SpeedButton3Click(Sender: TObject);
begin

  LimparMsgErro;

  if dmMProvider.cdsConfiguracoesDDP.IsNull then
  begin

    if dmMProvider.cdsCaixaLojaSTATUS.Value = 0 then
    begin

      lblMsg.Caption := MSG_CAIXA_NAO_ABERTO;
      Application.ProcessMessages;

    end
    else if dmMProvider.cdsCaixaLojaSTATUS.Value = 2 then
    begin

      lblMsg.Caption := MSG_CAIXA_JA_FECHADO;
      Application.ProcessMessages;

    end
    else
    begin

      if (dmMProvider.cdsCaixaLojaSTATUS.Value = 1) and( dmMProvider.cdsCaixaLojaDATA_ABERTURA.Value <> Date) then
      begin

        lblMsg.Caption := MSG_CAIXA_ABERTO_DATA_DIFER + ' Data abertura: ' + FormatDateTime('dd/mm/yyyy', dmMProvider.cdsCaixaLojaDATA_ABERTURA.Value )
                                                      + ' data atual: ' + FormatDateTime('dd/mm/yyyy', Date);
        Application.ProcessMessages;

      end
      else
      begin

        frmControleCaixa := TfrmControleCaixa.Create(self);

        frmControleCaixa.ShowModal;
        FreeAndNil(frmControleCaixa);

      end;

    end;

  end
  else
    lblMsg.Caption := 'Licen�a de uso expirada! Entre em contato com o suporte.';

  Application.ProcessMessages;

end;

procedure TfrmCaixa.SpeedButton4Click(Sender: TObject);
begin

  LimparMsgErro;

  if dmMProvider.cdsConfiguracoesDDP.IsNull then
  begin

    if dmMProvider.cdsCaixaLojaSTATUS.Value = 0 then
    begin

      lblMsg.Caption := MSG_CAIXA_NAO_ABERTO;
      Application.ProcessMessages;

    end
    else if dmMProvider.cdsCaixaLojaSTATUS.Value = 2 then
    begin

      lblMsg.Caption := MSG_CAIXA_JA_FECHADO;
      Application.ProcessMessages;

    end
    else
    begin

      frmFecha_Caixa := TfrmFecha_Caixa.Create(self);

      if frmFecha_Caixa.ShowModal = mrOk then
      begin

        dmMSProcedure.fdspFechaCaixa.Params[0].Value :=   dmMProvider.cdsCaixaLojaCAIXA_LOJA.Value;
        dmMSProcedure.fdspFechaCaixa.Params[1].Value :=   dmMProvider.cdsCaixaLojaDATA_ABERTURA.Value;
        dmMSProcedure.fdspFechaCaixa.Params[2].Value :=   Date;
        dmMSProcedure.fdspFechaCaixa.Params[3].Value :=   Time;
        dmMSProcedure.fdspFechaCaixa.ExecProc;

        dmMProvider.cdsCaixaLoja.Close;
        dmMProvider.cdsCaixaLoja.ProviderName := 'dspCaixa_loja';

        dmDBEXMaster.fdqCaixaLoja.SQL.Clear;
        dmDBEXMaster.fdqCaixaLoja.SQL.Add('select * from caixa_loja');
        dmDBEXMaster.fdqCaixaLoja.SQL.Add('where data_abertura = ' + QuotedStr(FormatDateTime('mm/dd/yy',dmMSProcedure.fdspFechaCaixa.Params[1].Value)));
        dmDBEXMaster.fdqCaixaLoja.SQL.Add('and status = 2');

        dmMProvider.cdsCaixaLoja.Open;
        dmMProvider.cdsCaixaLoja.ProviderName := '';

        AbrirItemCaixa(dmMProvider.cdsCaixaLojaCAIXA_LOJA.Value);

        dmRelatorios.rvsGenesisAC.SystemPreview.ZoomFactor  := 126.4;
        dmRelatorios.rvdGenesis.DataSet                     := dmMProvider.cdsItemCaixaLoja;

        if FileExists(ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Diversos.rav') then
        begin

          dmRelatorios.rvpGenesisAC.ProjectFile := ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Diversos.rav';
          dmRelatorios.rvpGenesisAC.SelectReport('rptFechamentoCX',true);
          dmRelatorios.rvpGenesisAC.SetParam('pIDSistema',ID_SISTEMA);
          dmRelatorios.rvpGenesisAC.SetParam('pLOGO_MARCA',ExtractFilePath(Application.ExeName) + 'Logomarca\LogoMarca.bmp');
          dmRelatorios.rvpGenesisAC.SetParam('pID_Sistema',ID_SISTEMA);
          dmRelatorios.rvpGenesisAC.SetParam('pCNPJ',FormatarCNPJCPF(dmMProvider.cdsClientesCNPJ.Value));
          dmRelatorios.rvpGenesisAC.SetParam('pEndereco_Filial',dmMProvider.cdsFilialENDERECO.Value);

          if dmMProvider.cdsFilialNUMERO.Value > 0 then
            dmRelatorios.rvpGenesisAC.SetParam('pNumero_Filial',IntToStr(dmMProvider.cdsFilialNUMERO.Value))
          else
            dmRelatorios.rvpGenesisAC.SetParam('pNumero_Filial','S/N');

          dmRelatorios.rvpGenesisAC.SetParam('pBairro_Filial',dmMProvider.cdsFilialBAIRRO.Value);
          dmRelatorios.rvpGenesisAC.SetParam('pDDD_Filial',dmMProvider.cdsFilialDDD.Value);
          dmRelatorios.rvpGenesisAC.SetParam('pTelefone_Filial',dmMProvider.cdsFilialTELEFONE1.Value);
          dmRelatorios.rvpGenesisAC.SetParam('pCidade_Filial',dmMProvider.cdsFilialNOMECIDADE.Value);
          dmRelatorios.rvpGenesisAC.SetParam('pEmail_Filial',dmMProvider.cdsFilialEMAIL.Value);

          dmRelatorios.rvpGenesisAC.Execute;
          dmRelatorios.rvpGenesisAC.Close;

        end
        else
        begin

          lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', ' + MSG_ARQ_NEXISTE + ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Diversos.rav';
          Application.ProcessMessages;

        end;


        dmDBEXMaster.sNomeUsuario := dmMProvider.cdsCaixaLojaNOME_FUNCIONARIO.Value;

        LimparMsgErro;

      end;

      FreeAndNil(frmFecha_Caixa);

    end;

  end
  else
    lblMsg.Caption := 'Licen�a de uso expirada! Entre em contato com o suporte.';

  Application.ProcessMessages;

end;

end.

