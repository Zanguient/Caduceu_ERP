unit modFormaPagtoCX;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids,  db;

type
  TDBGrid = class(Vcl.DBGrids.TDBGrid)
  protected
    procedure DrawCellBackground(const ARect: TRect; AColor: TColor;
      AState: TGridDrawState; ACol, ARow: Integer); override;
  end;
  TfrmFormaPgamentoCRE = class(TForm)
    imgConfirmar: TImage;
    imgCancelar: TImage;
    grpMensagem: TGroupBox;
    lblMsg: TLabel;
    grpValoraPrazo: TGroupBox;
    DBText1: TDBText;
    grpParcelasCX: TGroupBox;
    cboParcelamentoCX: TDBLookupComboBox;
    grpVencimentos: TGroupBox;
    imgConfirmaParcelas: TImage;
    grpDetalheslancamento: TGroupBox;
    grdVencimentos: TDBGrid;
    grpLancamento: TGroupBox;
    cboLancamento: TDBLookupComboBox;
    GroupBox1: TGroupBox;
    cboPlanoContas: TDBLookupComboBox;
    cboItemPlContas: TDBLookupComboBox;
    procedure imgCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure imgConfirmaParcelasClick(Sender: TObject);
    procedure cboParcelamentoCXClick(Sender: TObject);
    procedure imgConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFormaPgamentoCRE: TfrmFormaPgamentoCRE;

implementation

{$R *.dfm}

uses dataMSource, dataDBEXMaster, dataMProvider, uConstantes_Padrao, uFuncoes;

procedure TfrmFormaPgamentoCRE.cboParcelamentoCXClick(Sender: TObject);
begin

  cboPlanoContas.KeyValue   := -1;
  cboItemPlContas.KeyValue  := -1;
  cboLancamento.KeyValue    := -1;

end;

procedure TfrmFormaPgamentoCRE.FormCreate(Sender: TObject);
var
  i:integer;
begin

  for i := 0 to grdVencimentos.Columns.Count - 1 do
    grdVencimentos.Columns[i].Title.Color := COR_TITULO_GRADE;

  dmDBEXMaster.fdqValorPrazoPedido.Close;
  dmDBEXMaster.fdqValorPrazoPedido.SQL.Clear;

  dmDBEXMaster.fdqValorPrazoPedido.SQL.Add('select coalesce(sum(valor_finalizado),0) as total_prazo from finalizadora_pedido_zeus');
  dmDBEXMaster.fdqValorPrazoPedido.SQL.Add('where pedido = ' + intToStr(dmMProvider.cdsPedidoZeusPEDIDO.Value));
  dmDBEXMaster.fdqValorPrazoPedido.SQL.Add('and tipo = 10');
  dmDBEXMaster.fdqValorPrazoPedido.Open;

  dmMProvider.cdsParcelamentoCX.Close;
  dmMProvider.cdsParcelamentoCX.ProviderName := 'dspParcelamentoCX';

  dmDBEXMaster.fdqParcelamentoCX.SQL.Clear;
  dmDBEXMaster.fdqParcelamentoCX.SQL.Add('select * from formapagamento where tipo = 10 and codigoecf <> '+ quotedstr('00'));
  dmDBEXMaster.fdqParcelamentoCX.SQL.Add(' and tipooperacao = 1 and ativo = 1');

  dmMProvider.cdsParcelamentoCX.Open;
  dmMProvider.cdsParcelamentoCX.ProviderName := '';


  dmMProvider.cdsLancamentos.Close;
  dmMProvider.cdsLancamentos.ProviderName := 'dspLancamentos';

  dmDBEXMaster.fdqLancamentos.SQL.Clear;
  dmDBEXMaster.fdqLancamentos.SQL.Add('select * from lancamento');
  dmDBEXMaster.fdqLancamentos.SQL.Add('where tipo = 1');

  dmMProvider.cdsLancamentos.Open;
  dmMProvider.cdsLancamentos.ProviderName := '';

  cboPlanoContas.KeyValue   := -1;
  cboItemPlContas.KeyValue  := -1;
  cboLancamento.KeyValue    := -1;

  dmMProvider.cdsParcelasCRE_TEMP_CX.Close;

end;

procedure TfrmFormaPgamentoCRE.imgCancelarClick(Sender: TObject);
begin

    Close;

end;

procedure TfrmFormaPgamentoCRE.imgConfirmaParcelasClick(Sender: TObject);
var
  dVencimento:TDateTime;
  cValor, cTotal_parcelado, cResto : currency;

begin

  cValor            := 0;
  cResto            := cValor;
  cTotal_parcelado  := 0;

  cboPlanoContas.KeyValue   := dmMProvider.cdsParcelamentoCXPLANODECONTAS.Value;
  cboItemPlContas.KeyValue  := dmMProvider.cdsParcelamentoCXITEMPLANODECONTAS.Value;
  cboLancamento.KeyValue    := dmMProvider.cdsParcelamentoCXLANCAMENTO.Value;

  if cboParcelamentoCX.KeyValue > 0 then
  begin

    dmMProvider.cdsDiasFormapagto.Close;
    dmMProvider.cdsDiasFormapagto.ProviderName := 'dspDiasFormapagto';

    dmDBEXMaster.fdqDiasFormaPagto.SQL.Clear;
    dmDBEXMaster.fdqDiasFormaPagto.SQL.Add('select * from diasformapagamento');
    dmDBEXMaster.fdqDiasFormaPagto.SQL.Add('where FORMAPAGAMENTO = ' +  IntToStr(cboParcelamentoCX.KeyValue));

    dmMProvider.cdsDiasFormapagto.Open;
    dmMProvider.cdsDiasFormapagto.ProviderName := '';

    dmMProvider.cdsParcelasCRE_TEMP_CX.Close;
    dmMProvider.cdsParcelasCRE_TEMP_CX.CreateDataSet;

    dVencimento := Date;
    cValor      := Trunc((dmDBEXMaster.fdqValorPrazoPedidoTOTAL_PRAZO.Value / dmMProvider.cdsParcelamentoCXPARCELAS.Value) * 100) / 100;

    while not dmMProvider.cdsDiasFormapagto.Eof do
    begin

      dmMProvider.cdsParcelasCRE_TEMP_CX.Append;

      dmMProvider.cdsParcelasCRE_TEMP_CXPEDIDO.Value            := dmMProvider.cdsPedidoZeusPEDIDO.Value;
      dmMProvider.cdsParcelasCRE_TEMP_CXNUM_PARCELA.Value       := (dmMProvider.cdsParcelasCRE_TEMP_CX.RecordCount +1);
      dmMProvider.cdsParcelasCRE_TEMP_CXDOCUMENTO.Value         := 'PV' + IntToStr(dmMProvider.cdsPedidoZeusPEDIDO.Value) + '-' + InttoStr(dmMProvider.cdsParcelasCRE_TEMP_CXNUM_PARCELA.Value) + '/' + IntToStr(dmMProvider.cdsParcelamentoCXPARCELAS.Value);
      dmMProvider.cdsParcelasCRE_TEMP_CXVENCIMENTO.Value        := dVencimento + dmMProvider.cdsDiasFormapagtoDIAS.Value;
      dmMProvider.cdsParcelasCRE_TEMP_CXVALOR.Value             := cValor;
      dmMProvider.cdsParcelasCRE_TEMP_CXPLANO_CONTA.Value       := dmMProvider.cdsParcelamentoCXPLANODECONTAS.Value;
      dmMProvider.cdsParcelasCRE_TEMP_CXITEM_PLANO_CONTA.Value  := dmMProvider.cdsParcelamentoCXITEMPLANODECONTAS.Value;
      dmMProvider.cdsParcelasCRE_TEMP_CXLANCAMENTO.Value        := dmMProvider.cdsParcelamentoCXLANCAMENTO.Value;
      dmMProvider.cdsParcelasCRE_TEMP_CXDATA.Value              := dmMProvider.cdsPedidoZeusEMISSAO.Value;
      dmMProvider.cdsParcelasCRE_TEMP_CXNOME_CLIENTE.Value      := dmMProvider.cdsPedidoZeusRAZAOSOCIAL.Value;
      dmMProvider.cdsParcelasCRE_TEMP_CXCNPJ_CLIENTE.Value      := dmMProvider.cdsPedidoZeusCNPJ.Value;
      dmMProvider.cdsParcelasCRE_TEMP_CXMORA_RIARIA.Value       := ((dmMProvider.cdsParcelasCRE_TEMP_CXVALOR.Value * dmMProvider.cdsConfiguracoesMORADIARIA.AsCurrency) /100) ;

      cTotal_parcelado := cTotal_parcelado + cValor;

      dmMProvider.cdsParcelasCRE_TEMP_CX.Post;

      dVencimento := dmMProvider.cdsParcelasCRE_TEMP_CXVENCIMENTO.Value;

      dmMProvider.cdsDiasFormapagto.Next;

    end;

    cResto := (cTotal_parcelado - dmDBEXMaster.fdqValorPrazoPedidoTOTAL_PRAZO.Value);


    if cResto < 0 then
      cResto := cResto * (-1);

    if (cTotal_parcelado > dmDBEXMaster.fdqValorPrazoPedidoTOTAL_PRAZO.Value) then
    begin

      dmMProvider.cdsParcelasCRE_TEMP_CX.Edit;
      dmMProvider.cdsParcelasCRE_TEMP_CXVALOR.Value := dmMProvider.cdsParcelasCRE_TEMP_CXVALOR.Value - cResto;

    end
    else if (cTotal_parcelado < dmDBEXMaster.fdqValorPrazoPedidoTOTAL_PRAZO.Value) and not (dmMProvider.cdsDiasFormapagto.IsEmpty) then
    begin

      dmMProvider.cdsParcelasCRE_TEMP_CX.Edit;
      dmMProvider.cdsParcelasCRE_TEMP_CXVALOR.Value := dmMProvider.cdsParcelasCRE_TEMP_CXVALOR.Value + cResto;

    end
    else if (cTotal_parcelado < dmDBEXMaster.fdqValorPrazoPedidoTOTAL_PRAZO.Value) and (dmMProvider.cdsDiasFormapagto.IsEmpty) then
    begin

      dmMProvider.cdsParcelasCRE_TEMP_CX.Append;

      dmMProvider.cdsParcelasCRE_TEMP_CXPEDIDO.Value      := dmMProvider.cdsPedidoZeusPEDIDO.Value;
      dmMProvider.cdsParcelasCRE_TEMP_CXNUM_PARCELA.Value := (dmMProvider.cdsParcelasCRE_TEMP_CX.RecordCount + 1);
      dmMProvider.cdsParcelasCRE_TEMP_CXVENCIMENTO.Value  := dmMProvider.cdsPedidoZeusEMISSAO.Value;
      dmMProvider.cdsParcelasCRE_TEMP_CXVALOR.Value       := dmDBEXMaster.fdqValorPrazoPedidoTOTAL_PRAZO.Value;

    end
    else if (cTotal_parcelado <> dmDBEXMaster.fdqValorPrazoPedidoTOTAL_PRAZO.Value) then
    begin

      dmMProvider.cdsParcelasCRE_TEMP_CX.Append;

      dmMProvider.cdsParcelasCRE_TEMP_CXPEDIDO.Value      := dmMProvider.cdsPedidoZeusPEDIDO.Value;
      dmMProvider.cdsParcelasCRE_TEMP_CXNUM_PARCELA.Value := (dmMProvider.cdsParcelasCRE_TEMP_CX.RecordCount + 1);
      dmMProvider.cdsParcelasCRE_TEMP_CXVENCIMENTO.Value  := dmMProvider.cdsPedidoZeusEMISSAO.Value;
      dmMProvider.cdsParcelasCRE_TEMP_CXVALOR.Value       := dmDBEXMaster.fdqValorPrazoPedidoTOTAL_PRAZO.Value;

    end;

    if dmMProvider.cdsParcelasCRE_TEMP_CX.State in [dsEdit, dsInsert] then
      dmMProvider.cdsParcelasCRE_TEMP_CX.Post;

    dmMProvider.cdsParcelasCRE_TEMP_CX.First;

  end;

end;

procedure TfrmFormaPgamentoCRE.imgConfirmarClick(Sender: TObject);
begin

  if cboParcelamentoCX.KeyValue <= 0 then
  begin

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CAMPO_OBRIGATORIO;
    Application.ProcessMessages;

    cboParcelamentoCX.SetFocus;

  end
  else if (cboPlanoContas.KeyValue <= 0) or (cboItemPlContas.KeyValue <= 0) or (cboLancamento.KeyValue <= 0) then
  begin

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CONFIG_F_PAGAMENTO;
    Application.ProcessMessages;

  end
  else
    ModalResult := mrOk;

end;

{ TDBGrid }

procedure TDBGrid.DrawCellBackground(const ARect: TRect; AColor: TColor;
  AState: TGridDrawState; ACol, ARow: Integer);
begin
  inherited;

  if ACol < 0 then
    inherited DrawCellBackground(ARect, AColor, AState, ACol, ARow)
  else
    inherited DrawCellBackground(ARect, Columns[ACol].Title.Color, AState,
      ACol, ARow)

end;

end.
