
{ TODO 1 -oLindomar -cchecagem : Verificar configurações na inclusão da NFE }
{ TODO 1 -oLindomar -cchecagem :Fazer inclusão manual de notas}

unit modNFEntrada;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.StdActns, System.Actions, Vcl.ActnList, Vcl.Imaging.jpeg,
  Vcl.Samples.Spin, Vcl.DBCtrls, Vcl.Mask, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids,
  JvExStdCtrls, JvEdit, JvValidateEdit, Db, ACBrCTe, ACBrNfe, pcnConversao,
  MidasLib, Datasnap.DBClient;

type

  TDBGrid = class(Vcl.DBGrids.TDBGrid)
  protected
    procedure DrawCellBackground(const ARect: TRect; AColor: TColor;
      AState: TGridDrawState; ACol, ARow: Integer); override;
  end;

  TfrmModNFEntrada = class(TForm)
    imgSair: TImage;
    imgEditar: TImage;
    imgExcluir: TImage;
    imgSalvar: TImage;
    imgDesfazer: TImage;
    imgNovo: TImage;
    lblF6: TLabel;
    lblF5: TLabel;
    lblF4: TLabel;
    lblF3: TLabel;
    lblF2: TLabel;
    imgImportarXML: TImage;
    grpMensagem: TGroupBox;
    lblMsg: TLabel;
    ActionList1: TActionList;
    actEditar: TAction;
    actDesfazer: TAction;
    WindowClose1: TWindowClose;
    actIncluir: TAction;
    actSalvar: TAction;
    actExcluir: TAction;
    grpPesquisa: TGroupBox;
    rdpOpcoesPesquisa: TRadioGroup;
    grpConteudoPesquisa: TGroupBox;
    impPesquisar: TImage;
    edtConteudoPesquisa: TEdit;
    imgCld: TImage;
    pgcNFEntrada: TPageControl;
    tbsTabela: TTabSheet;
    tbsTotais: TTabSheet;
    grdTabela: TDBGrid;
    grpTotais: TGroupBox;
    grpInformacoesNF: TGroupBox;
    lblNumeroNF: TLabel;
    lblDataEmissao: TLabel;
    lblDataSaida: TLabel;
    lbldataEntrada: TLabel;
    edtNumeroNF: TDBEdit;
    edtDataEmissao: TDBEdit;
    edtDataSaida: TDBEdit;
    edtEntrada: TDBEdit;
    lblProtocoloNFE: TLabel;
    edtProtocoloNFE: TDBEdit;
    lblSerieNF: TLabel;
    edtSerieNF: TDBEdit;
    lblModeloNF: TLabel;
    cboModeloNF: TDBLookupComboBox;
    grpEmitente: TGroupBox;
    lblRSocialEmitente: TLabel;
    edtRSocial_Emitente: TDBEdit;
    edtCNPJ_Emitente: TDBEdit;
    lblCNPJ: TLabel;
    lblEndereco: TLabel;
    edtEndereco: TDBEdit;
    lblNumero_Emitente: TLabel;
    edtNumero_Emitente: TDBEdit;
    lblBairro: TLabel;
    edtBairro: TDBEdit;
    lblCEP: TLabel;
    edtCEP_Emitente: TDBEdit;
    grpFaturaDuplicatas: TGroupBox;
    grdFaturaDuplicatas: TDBGrid;
    lblNumeroDocumento: TLabel;
    edtNumeroDocumento: TEdit;
    lblVencimentoFatura: TLabel;
    edtVencimentoFatura: TMaskEdit;
    lblValorFatura: TLabel;
    grpCalculoDoImposto: TGroupBox;
    grpValorSeguro: TGroupBox;
    grpDespesasAcessorias: TGroupBox;
    grpValorIPI: TGroupBox;
    grpCfop: TGroupBox;
    grpObservacoes: TGroupBox;
    grpInformacaoFisco: TGroupBox;
    rdpTipoFrete: TDBRadioGroup;
    memObservacos: TDBMemo;
    memObservacaoFisco: TDBMemo;
    edtValorSeguro: TDBEdit;
    edtValorDespesasAcessorias: TDBEdit;
    edtValorIPI: TDBEdit;
    grdCfop: TDBGrid;
    tbsItens: TTabSheet;
    grpItensServico: TGroupBox;
    chkRatearDesconto: TDBCheckBox;
    chkAgregarICMSR: TDBCheckBox;
    chkAgregarIPI: TDBCheckBox;
    chkAgregarFrete: TDBCheckBox;
    chkAgregarDespesas: TDBCheckBox;
    chkReducaoPS_COFINS: TDBCheckBox;
    grpDadosProdutosServicos: TGroupBox;
    lblCidadeEmitente: TLabel;
    edtCidadeEmitente: TDBEdit;
    lblUF_Emitente: TLabel;
    edtUF_Emitente: TDBEdit;
    lblSituacaoDoc: TLabel;
    cboSituacaoDoc: TDBLookupComboBox;
    pnlStatus: TPanel;
    edtStatus: TDBEdit;
    grpAliqCreditoSimples: TGroupBox;
    grpBaseCalcIcms: TGroupBox;
    grpValorIcms: TGroupBox;
    grpBaseCalcIcmsST: TGroupBox;
    grpValorTotalProdutos: TGroupBox;
    grpValoricmsST: TGroupBox;
    grpDescontoGeral: TGroupBox;
    grpValorFrete: TGroupBox;
    edtAliqCredSimples: TDBEdit;
    edtDescontoGeral: TDBEdit;
    edtBaseCalcICMSR: TDBEdit;
    edtBaseCalcICMS: TDBEdit;
    edtValorICMSR: TDBEdit;
    edtValorFrete: TDBEdit;
    grpValorTotalNota: TGroupBox;
    edtValotTotalNOta: TDBEdit;
    edtValorProdutos: TDBEdit;
    edtValorICMS: TDBEdit;
    lblCFOP_Entrada: TLabel;
    edtCFOP_Entrada: TEdit;
    lblReferencia: TLabel;
    lblCodigoGTIN: TLabel;
    lblUnidade: TLabel;
    edtReferencia: TEdit;
    edtCodigoGTIN: TEdit;
    lblNCM: TLabel;
    edtDescricaoProduto: TEdit;
    edtUnidade: TEdit;
    edtNCM: TEdit;
    edtCST_CSOSN: TEdit;
    lblCST_CSOSN: TLabel;
    lblCFOP: TLabel;
    edtCFOP: TEdit;
    lblUnEmbalagem: TLabel;
    lblQuantidade: TLabel;
    edtQuantidade: TJvValidateEdit;
    lblValorUnitaio: TLabel;
    edtValorUnitario: TJvValidateEdit;
    lblDesconto: TLabel;
    edtDesconto: TJvValidateEdit;
    lblEncargos: TLabel;
    edtEncargos: TJvValidateEdit;
    lblValorTotal: TLabel;
    edtValorTotalItem: TJvValidateEdit;
    lblBaseCalcICMS_Item: TLabel;
    edtBaseCalcICMS_Item: TJvValidateEdit;
    lblAliqICMS_Item: TLabel;
    edtAliqICMS_Item: TJvValidateEdit;
    lblRedBaseCalc_Item: TLabel;
    edtRedBaseCalc_Item: TJvValidateEdit;
    lblValorICMS_Item: TLabel;
    edtValorICMS_Item: TJvValidateEdit;
    lblCST_IPI: TLabel;
    edtCST_IPI: TEdit;
    lblCodEnqIPI: TLabel;
    edtCodEnqIPI: TEdit;
    lblBaseCalcIPI: TLabel;
    edtBasecalcIPI_Item: TJvValidateEdit;
    lblAliqIpi_Item: TLabel;
    edtAliqIPI_Item: TJvValidateEdit;
    edtValorIPI_Item: TJvValidateEdit;
    lblValorIPI_Item: TLabel;
    lblBaseCalcICMSR_Item: TLabel;
    lblValorICMSR_Item: TLabel;
    edtValorICMSR_Item: TJvValidateEdit;
    edtBaseCalcICMSR_Item: TJvValidateEdit;
    lblAliqICMSR_Item: TLabel;
    edtAliqICMSR_Item: TJvValidateEdit;
    lblBaseCalcPIS: TLabel;
    edtBaseCalcPIS: TJvValidateEdit;
    lblValorIsentasNT_Item: TLabel;
    edtValorIsentasNT: TJvValidateEdit;
    lblCst_PIS: TLabel;
    lblAliqPIS: TLabel;
    edtAliquotaPIS: TJvValidateEdit;
    lblValorPIS: TLabel;
    lblAliqPIS_Valor: TLabel;
    edtAliqValorPIS: TJvValidateEdit;
    edtValorPIS: TJvValidateEdit;
    lblQuantBCPIS: TLabel;
    edtQuantBCPIS: TJvValidateEdit;
    lblBaseCalcCOFINS: TLabel;
    edtBaseCalcCOFINS: TJvValidateEdit;
    lblCSTCOFINS: TLabel;
    lblAliCOFINS: TLabel;
    edtAliquotaCOFINS: TJvValidateEdit;
    lblValorCOFINS: TLabel;
    lblAliqCOFINSValor: TLabel;
    edtAliqCOFINSValor: TJvValidateEdit;
    edtValorCOFINS: TJvValidateEdit;
    lblQuantBCCOFINS: TLabel;
    edtQuantBCCOFINS: TJvValidateEdit;
    edtCSTPIS: TEdit;
    edtCSTCOFINS: TEdit;
    grpItens: TGroupBox;
    grdItemNFEntrada: TDBGrid;
    tbsTransporte: TTabSheet;
    grpTransporte: TGroupBox;
    grpInformacaoTransportador: TGroupBox;
    lblNomeTransportadora: TLabel;
    lblTransportadora: TLabel;
    edtTranportadora: TDBEdit;
    cboTransportadora: TDBLookupComboBox;
    lblCodigoANTT: TLabel;
    edtCodiogoANTT: TDBEdit;
    lblCPFCNPJ_Transportador: TLabel;
    lblInscricaoTransportador: TLabel;
    edtCPF_CNPJ_Transportador: TDBEdit;
    edtInscricaoTrasnportador: TDBEdit;
    lblEnderecoTrasnportador: TLabel;
    edtEnderecoTrasnportador: TDBEdit;
    lblCidadeTransportador: TLabel;
    lblEstadoTransportador: TLabel;
    edtCidadeTrasnportador: TDBEdit;
    edtUFTransportador: TDBEdit;
    grpVolumesTransportados: TGroupBox;
    lblPlacaVeiculo: TLabel;
    edtPlacaVeiculo: TDBEdit;
    lblUFVeiculo: TLabel;
    cboUFVeiculo: TDBLookupComboBox;
    lblQuantidadeVolume: TLabel;
    edtQuantidadeVolume: TDBEdit;
    lblEspecieVolume: TLabel;
    edtEspecieVolume: TDBEdit;
    lblMarcaVolume: TLabel;
    edtMarcaVolume: TDBEdit;
    lblNumeroVolume: TLabel;
    edtNumeroVolume: TDBEdit;
    lblPesoBruto: TLabel;
    edtPesoBruto: TDBEdit;
    lblPesoLiquido: TLabel;
    edtPesoLiquido: TDBEdit;
    grpConhecimentoFrete: TGroupBox;
    imgConfirmar: TImage;
    imgAberto: TImage;
    imgTrancado: TImage;
    grpInformacaoEmissorFrete: TGroupBox;
    lblCNPJ_Frete: TLabel;
    edtCNPJFrete: TDBEdit;
    edtInscricaoFrete: TDBEdit;
    lblInscricaoFrete: TLabel;
    lblEstadoFrete: TLabel;
    cboEstadoFrete: TDBLookupComboBox;
    grpInformacaoDocumento: TGroupBox;
    lblEmissaoFrete: TLabel;
    edtEmissaoFrete: TDBEdit;
    lblNumeroFrete: TLabel;
    edtNumeroFrete: TDBEdit;
    lblModeloFrete: TLabel;
    cboModeloFrete: TDBLookupComboBox;
    lblSerieFrete: TLabel;
    edtSerieFrete: TDBEdit;
    lblSubSerieFrete: TLabel;
    edtSubSerieFrete: TDBEdit;
    lblChaveCTE: TLabel;
    edtChaveCTE: TDBEdit;
    lblCFOPFrete: TLabel;
    edtCFOPFrete: TDBEdit;
    lblEntrada: TLabel;
    edtDataEntrada: TDBEdit;
    lblTipoFrete: TLabel;
    cboSituacaoDocumento: TDBLookupComboBox;
    lblTipo_Cte: TLabel;
    cboTipo_Cte: TDBLookupComboBox;
    lblChaveCTE_REF: TLabel;
    edtChaveCTE_REF: TDBEdit;
    grpCaluculoImpostoFrete: TGroupBox;
    lblCstFrete: TLabel;
    lblBaseICMS_Frete: TLabel;
    lblAliquotaICMS_Frete: TLabel;
    lblValorICMS_Frete: TLabel;
    lblValorDocumentoFrete: TLabel;
    lblDescontoFrete: TLabel;
    lblValorNTFrete: TLabel;
    edtCSTFrete: TDBEdit;
    edtBaseICMS_Frete: TDBEdit;
    edtAliquota_ICMS_Frete: TDBEdit;
    edtValorICMS_Frete: TDBEdit;
    edtValorCFrete: TDBEdit;
    edtDescontoFrete: TDBEdit;
    edtValorNTFrete: TDBEdit;
    actChecarTotais: TAction;
    imgChecarTotais: TImage;
    lblValorFreteItem: TLabel;
    edtValorFreteItem: TJvValidateEdit;
    actExcluirItemNF: TAction;
    actConfirmarNFE: TAction;
    actImportarNFE: TAction;
    OpenDialog1: TOpenDialog;
    tbsInconsitenciaXML: TTabSheet;
    memInconsitencia: TMemo;
    actImportarCTE: TAction;
    actEstornoNFE: TAction;
    edtUnEmbalagem: TJvValidateEdit;
    edtValorFatura: TJvValidateEdit;
    actCalculoCLD: TAction;

    procedure FormCreate(Sender: TObject);
    procedure WindowClose1Execute(Sender: TObject);
    procedure grdTabelaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure rdpOpcoesPesquisaClick(Sender: TObject);
    procedure edtConteudoPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtConteudoPesquisaKeyPress(Sender: TObject; var Key: Char);
    function AbrirTabelaNFEntrada(pOpcao: smallint; pConteudo: string): boolean;
    procedure Tratar_Erro_Conexao(pE: exception);
    procedure edtConteudoPesquisaExit(Sender: TObject);
    procedure OcultarAbas(pOpcao: boolean);
    procedure grdTabelaDblClick(Sender: TObject);
    procedure grdTabelaKeyPress(Sender: TObject; var Key: Char);
    procedure RelacionarParcelas_NFE(pNFEntrada: Integer);
    procedure RelacionarCFOP_NFE(pNFEntrada: Integer);
    procedure tbsTotaisShow(Sender: TObject);
    procedure RelacionarItens_NFE(pNFEntrada: Integer; pAbrir: boolean);
    procedure RelacionarFrete_NFE(pNFEntrada: Integer);
    procedure grdFaturaDuplicatasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edtStatusChange(Sender: TObject);
    procedure grdItemNFEntradaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure tbsTransporteShow(Sender: TObject);
    procedure actIncluirExecute(Sender: TObject);
    procedure HabilitaDesabilitaControles(pOpcao: boolean);
    procedure edtAliqCredSimplesKeyPress(Sender: TObject; var Key: Char);
    procedure edtCFOP_EntradaExit(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure lblF5Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure actDesfazerExecute(Sender: TObject);
    procedure edtDataEmissaoExit(Sender: TObject);
    procedure edtDataSaidaExit(Sender: TObject);
    procedure edtEntradaExit(Sender: TObject);
    procedure edtValorICMSExit(Sender: TObject);
    procedure edtValorICMSRExit(Sender: TObject);
    procedure edtValotTotalNOtaExit(Sender: TObject);
    procedure edtNumeroDocumentoExit(Sender: TObject);
    procedure edtConteudoPesquisaEnter(Sender: TObject);
    procedure edtValorFaturaExit(Sender: TObject);
    procedure edtVencimentoFaturaExit(Sender: TObject);
    procedure edtNumeroNFExit(Sender: TObject);
    procedure edtReferenciaExit(Sender: TObject);
    procedure edtCFOPExit(Sender: TObject);
    procedure edtValorUnitarioExit(Sender: TObject);
    procedure edtAliqICMS_ItemExit(Sender: TObject);
    procedure edtAliqCOFINSValorExit(Sender: TObject);
    procedure edtRedBaseCalc_ItemExit(Sender: TObject);
    procedure edtBaseCalcICMS_ItemExit(Sender: TObject);
    procedure edtCST_CSOSNExit(Sender: TObject);
    procedure edtCSTPISExit(Sender: TObject);
    procedure edtCSTCOFINSExit(Sender: TObject);
    procedure edtAliqIPI_ItemExit(Sender: TObject);
    procedure grdItemNFEntradaCellClick(Column: TColumn);
    procedure grdItemNFEntradaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actChecarTotaisExecute(Sender: TObject);
    procedure actExcluirItemNFExecute(Sender: TObject);
    procedure tbsItensShow(Sender: TObject);
    procedure edtCodigoGTINExit(Sender: TObject);
    procedure actConfirmarNFEExecute(Sender: TObject);
    procedure edtTranportadoraExit(Sender: TObject);
    procedure edtCNPJFreteExit(Sender: TObject);
    procedure edtProtocoloNFEKeyPress(Sender: TObject; var Key: Char);
    procedure edtCNPJFreteEnter(Sender: TObject);
    procedure actImportarNFEExecute(Sender: TObject);
    procedure actImportarCTEExecute(Sender: TObject);
    procedure imgConfirmarClick(Sender: TObject);
    procedure actEstornoNFEExecute(Sender: TObject);
    procedure edtProtocoloNFEExit(Sender: TObject);
    procedure CalcularPrecodeVendaCLD(loja: smallint; pUsarEmbAtacado: boolean);
    procedure AtualizarSaldoProdutoNFE(pLoja, pOpcao: smallint; pUsarRentabilidade: boolean);
    function LancarRentabilidade(pOpcao: smallint): boolean;
    procedure actCalculoCLDExecute(Sender: TObject);
    procedure imgCldClick(Sender: TObject);
  private
    { Private declarations }
    iProx_NFEntrada, iProx_CFOPEntrada, iConsistir_Chave_NFE, iProx_ParcelasNFE,
      iProx_ItemNFEntrada, iProx_Conhecimento_Frete: Integer;
    sSerie_NFE, sLinhaComando, sPath_Destino: string;
    tsInconsistenciasOC, tsInconsistenciasUNDEmb, tsTotalLancamentoQTD_UND : TStringList;
    procedure LimparMSG_ERRO;
    procedure Mensagem(pAlerta: boolean; pMsg: string);
    procedure Man_Tab_NFEntrada(pOpcao: smallint);
    procedure Man_Tab_Conhecimento_Frete(pOpcao: smallint);
    procedure Man_Tab_CFOP_Entrada(pOpcao, pNFEntrada: Integer; pCfop: string);
    procedure Man_Tab_Parcelas_NFE(pOpcao, pNFEntrada: Integer; pDocumento: string; pVencimento: TDateTime; pValor: Currency);
    function ValidarCampos: boolean;
    function ValidarTotalParcelas: boolean;
    procedure PreencherCampos;
    function Validar_CSTCSOSN(pCST_CSOSN: string; pCRT: Integer): boolean;
    function Validar_CST_PIS(pCST_PIS: string): boolean;
    function Validar_CST_COFINS(pCST_COFINS: string): boolean;
    procedure CalcularTotalItem;
    procedure Man_Tab_ItemNFEntrada(pOpcao: smallint;
      pNFEntrada, pOrigem: Integer);
    procedure Man_Tab_CPA(pOpcao: smallint; pNFEntrada: Integer);
    procedure LimparCampos;
    procedure PreencherCampos_ItemNFEntrada;
    function ChecarTotais: boolean;
    function ImportarXML_NFE_CTE(pOpcao: smallint; pArq: string): boolean;
    // function Consistir_OC_NFEntrada(pOrdemCompra:string):boolean;
    procedure AbrirTabelasAuxiliares;
    procedure IncluirCfopCorrelata(pCfop, pUF: string; pNota: Integer);
    function Retornar_CfopCorrelata_Item(pCfop, pUF: string): string;
    function AbrirTabelaCTE(pOpcao: smallint; pConteudo: string): boolean;
    procedure FecharTabelas;
    function ValidarUnidadeEmbalagem: boolean;
    procedure AbrirTabelaCFOP_Item(pCfop: string);
    procedure GravarEstornarRegistro50(sSituacaoNF: string);
    procedure GravarEstornarRegistro54(pEstorno: string);
    function Pesquisar_Complemento(pComplemento: string): boolean;
  public
    { Public declarations }
    function GravarEstornarLivro_Entrada(pOpcao: smallint): boolean;
    function Gravar_Registro_C100(pOpcao: smallint): boolean;
    function Gravar_Registro_C170(pOpcao: smallint): boolean;
    function Gravar_Registro_C190(pOpcao: smallint): boolean;
  end;

var
  frmModNFEntrada: TfrmModNFEntrada;

implementation

{$R *.dfm}

uses dataDBEXMaster, dataMProvider, dataMSource, dataMSProcedure,
  uConstantes_Padrao, uFuncoes, modDadosInclusaoNFE, modChecagemTotais,
  modPesquisaProduto, modResultadoConsisteXML_NFE, modInformacoesNFE_CPA,
  dataMRelatorios, modDesdobramentoRentabilidade, modSintegra,
  modCalculoCLD_NFE;

procedure TfrmModNFEntrada.AbrirTabelaCFOP_Item(pCfop: string);
begin

  dmDBEXMaster.fdqCFOP_CFPS.Close;
  dmDBEXMaster.fdqCFOP_CFPS.SQL.Clear;
  dmDBEXMaster.fdqCFOP_CFPS.SQL.Add('select * from cfop');
  dmDBEXMaster.fdqCFOP_CFPS.SQL.Add('where cfop = ' + QuotedStr(pCfop));
  dmDBEXMaster.fdqCFOP_CFPS.Open;

end;

function TfrmModNFEntrada.AbrirTabelaCTE(pOpcao: smallint;
  pConteudo: string): boolean;
var
  sWhere: string;
begin

  dmMProvider.cdsConhecimentoFrete.Close;
  dmMProvider.cdsConhecimentoFrete.ProviderName := 'dspConhecimentoFrete';
  dmDBEXMaster.fdqConhecimentoFrete.SQL.Clear;
  dmDBEXMaster.fdqConhecimentoFrete.SQL.Add('SELECT * FROM CONHECIMENTO_FRETE');

  sWhere := dmDBEXMaster.Montar_SQL_Pesquisa_ConhecimentoFrete(pOpcao,
    pConteudo);

  dmDBEXMaster.fdqConhecimentoFrete.SQL.Add(sWhere);

  try

    dmMProvider.cdsConhecimentoFrete.Open;
    dmMProvider.cdsConhecimentoFrete.ProviderName := '';

    { if (dmMProvider.cdsConhecimentoFrete.IsEmpty) and (pOpcao < 2) then
      Mensagem(True,dmDBEXMaster.sNomeUsuario + MSG_PESQUISA)
      else if dmMProvider.cdsConhecimentoFrete.IsEmpty then
      Mensagem(True,dmDBEXMaster.sNomeUsuario + MSG_CRITERIO_NAO_ENCONTRADO);
    }
    Result := not dmMProvider.cdsConhecimentoFrete.IsEmpty;

  except
    on E: exception do
    begin

      Tratar_Erro_Conexao(E);
      Result := false;

    end;

  end;

end;

function TfrmModNFEntrada.AbrirTabelaNFEntrada(pOpcao: smallint;
  pConteudo: string): boolean;
var
  sWhere: string;
begin

  dmMProvider.cdsNFEntrada.Close;
  dmMProvider.cdsNFEntrada.ProviderName := 'dspNFEntrada';;
  dmDBEXMaster.fdqNFEntrada.SQL.Clear;
  dmDBEXMaster.fdqNFEntrada.SQL.Add('SELECT * FROM NFENTRADA');

  sWhere := dmDBEXMaster.Montar_SQL_Pesquisa_NFEntrada(pOpcao, pConteudo);

  dmDBEXMaster.fdqNFEntrada.SQL.Add(sWhere);
  dmDBEXMaster.fdqNFEntrada.SQL.Add('ORDER BY ENTRADA, FORNECEDOR');

  try

    dmMProvider.cdsNFEntrada.Open;
    dmMProvider.cdsNFEntrada.ProviderName := '';

    if (dmMProvider.cdsNFEntrada.IsEmpty) and (pOpcao < 2) then
      Mensagem(false, dmDBEXMaster.sNomeUsuario + MSG_PESQUISA)
    else if dmMProvider.cdsNFEntrada.IsEmpty then
      Mensagem(false, dmDBEXMaster.sNomeUsuario + MSG_CRITERIO_NAO_ENCONTRADO);

    Result := not dmMProvider.cdsNFEntrada.IsEmpty;

  except
    on E: exception do
    begin

      Tratar_Erro_Conexao(E);
      Result := false;

    end;

  end;

end;

procedure TfrmModNFEntrada.grdItemNFEntradaCellClick(Column: TColumn);
begin

  PreencherCampos_ItemNFEntrada;

end;

procedure TfrmModNFEntrada.grdItemNFEntradaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if not dmMProvider.cdsItem_NFEntrada.IsEmpty then
  begin

    if not odd(dmMProvider.cdsItem_NFEntrada.RecNo) then
    begin

      grdItemNFEntrada.Canvas.Font.Color := clBlack;
      grdItemNFEntrada.Canvas.Brush.Color := COR_ZEBRA_GRADE;

    end
    else
    begin

      grdItemNFEntrada.Canvas.Font.Color := clBlack;
      grdItemNFEntrada.Canvas.Brush.Color := clWhite;

    end;

    grdItemNFEntrada.Canvas.FillRect(Rect);
    grdItemNFEntrada.DefaultDrawDataCell(Rect, Column.Field, State);

  end;

end;

procedure TfrmModNFEntrada.grdItemNFEntradaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

  case Key of

    VK_DOWN:
      PreencherCampos_ItemNFEntrada;
    VK_UP:
      PreencherCampos_ItemNFEntrada;
    VK_DELETE:
      begin

        lblMsg.Tag := ord(ExcluirItemNFEntrada);

        LimparMSG_ERRO;

        if dmMProvider.cdsItem_NFEntrada.Active then
        begin

          if dmMProvider.cdsNFEntradaSTATUS.Value = 0 then
          begin

            lblMsg.Tag := ord(ExcluirItemNFEntrada);
            Mensagem(false, dmDBEXMaster.sNomeUsuario + MSG_CONFIRMA_EXCLUSAO);

          end
          else
            Mensagem(True, dmDBEXMaster.sNomeUsuario + MSG_STATUS_NAO_PERMITE);

        end;

      end;

  end;

end;

procedure TfrmModNFEntrada.AbrirTabelasAuxiliares;
begin

  dmMProvider.cdsModelo_Doc.Close;
  dmMProvider.cdsModelo_Doc.ProviderName := 'dspModelo_Doc';

  dmMProvider.cdsModelo_Doc.Open;
  dmMProvider.cdsModelo_Doc.ProviderName := '';

  dmMProvider.cdsSituacao_Doc.Close;
  dmMProvider.cdsSituacao_Doc.ProviderName := 'dspSituacao_Doc';

  dmMProvider.cdsSituacao_Doc.Open;
  dmMProvider.cdsSituacao_Doc.ProviderName := '';

  dmMProvider.cdsTipo_CTE.Close;
  dmMProvider.cdsTipo_CTE.ProviderName := 'dspTipo_CTE';

  dmMProvider.cdsTipo_CTE.Open;
  dmMProvider.cdsTipo_CTE.ProviderName := '';

end;

procedure TfrmModNFEntrada.actCalculoCLDExecute(Sender: TObject);
begin

  LimparMSG_ERRO;

  if not dmMProvider.cdsNFEntrada.IsEmpty then
  begin

    if not (dmMProvider.cdsNFEntrada.State in [dsEdit, dsInsert]) then
    begin

      Mensagem(false, dmDBEXMaster.sNomeUsuario + ', aguarde...');

      dmMProvider.cdsCLD_NFE.Close;
      dmMProvider.cdsCLD_NFE.ProviderName := 'dspCLD_NFE';

      dmDBEXMaster.fdqCLD_NFE.Params[0].Value := dmMProvider.cdsNFEntradaNFENTRADA.Value;
      dmDBEXMaster.fdqCLD_NFE.Params[1].Value := dmDBEXMaster.iIdFilial;

      dmMProvider.cdsCLD_NFE. Open;
      dmMProvider.cdsCLD_NFE.ProviderName := '';

      frmCalculoCLD_NFE := TfrmCalculoCLD_NFE.Create(self);
      frmCalculoCLD_NFE.ShowModal;

    end;

  end;

end;

procedure TfrmModNFEntrada.actChecarTotaisExecute(Sender: TObject);
begin

  ChecarTotais;

end;

procedure TfrmModNFEntrada.actConfirmarNFEExecute(Sender: TObject);
begin

  LimparMSG_ERRO;

  if not dmMProvider.cdsParcelasNFE.IsEmpty then
  begin

    dmDBEXMaster.fdqCpa.Close;
    dmDBEXMaster.fdqCpa.SQL.Clear;
    dmDBEXMaster.fdqCpa.SQL.Add('select * from cpa');
    dmDBEXMaster.fdqCpa.SQL.Add('where cedente = ' + IntToStr(dmMProvider.cdsNFEntradaFORNECEDOR.Value));
    dmDBEXMaster.fdqCpa.SQL.Add('and filial = ' + IntToStr(dmDBEXMaster.iIdFilial));
    dmDBEXMaster.fdqCpa.SQL.Add('and documento = ' + QuotedStr(dmMProvider.cdsParcelasNFEDOCUMENTO.Value));
    dmDBEXMaster.fdqCpa.Open;

    if dmDBEXMaster.fdqCpa.IsEmpty then
    begin

      dmDBEXMaster.fdqCpa.Close;
      frmInformacoesCPA_NFE := TfrmInformacoesCPA_NFE.Create(self);

      if frmInformacoesCPA_NFE.ShowModal = mrOk then
        Man_Tab_CPA(0, dmMProvider.cdsNFEntradaNFENTRADA.Value)
      else
      begin

        Mensagem(false, dmDBEXMaster.sNomeUsuario + MSG_INFO_COMPL_CPA);
        FreeAndNil(frmInformacoesCPA_NFE);
        exit;

      end;

      dmRelatorios.rvsGenesisAC.SystemPreview.ZoomFactor  := 126.4;
      dmRelatorios.rvdGenesis.DataSet                     := dmMProvider.cdsParcelasNFE;

      dmMProvider.cdsParcelasNFE.First;

      if FileExists(ExtractFilePath(Application.ExeName) + 'Rav\Relatorios_Financeiros.rav') then
      begin

        dmRelatorios.rvpGenesisAC.ProjectFile := ExtractFilePath(Application.ExeName) + 'Rav\Relatorios_Financeiros.rav';
        dmRelatorios.rvpGenesisAC.SelectReport('rptEspelhoParcelas', True);
        dmRelatorios.rvpGenesisAC.SetParam('pNOME_LOJA', dmMProvider.cdsFilialRAZAOSOCIAL.Value);
        dmRelatorios.rvpGenesisAC.SetParam('pLOGO_MARCA', ExtractFilePath(Application.ExeName) + 'Logomarca\LogoMarca.bmp');
        dmRelatorios.rvpGenesisAC.SetParam('pCODIGO_CEDENTE', IntToStr(dmMProvider.cdsNFEntradaFORNECEDOR.Value));
{        dmRelatorios.rvpGenesisAC.SetParam('pCEP_CEDENTE', FormatarCEP(dmMProvider.cdsNFEntradaCEP_EMITENTE.Value));
        dmRelatorios.rvpGenesisAC.SetParam('pNOME_CEDENTE', dmMProvider.cdsNFEntradaRSOCIAL_FORNECEDOR.Value);
        dmRelatorios.rvpGenesisAC.SetParam('pENDERECO_CEDENTE', Trim(dmMProvider.cdsNFEntradaENDERECO_EMITEMTE.Value));

        if dmMProvider.cdsNFEntradaNUMERO_EMITENTE.Value > 0 then
          dmRelatorios.rvpGenesisAC.SetParam('pNUMERO_END_CEDENTE', IntToStr(dmMProvider.cdsNFEntradaNUMERO_EMITENTE.Value))
        else
          dmRelatorios.rvpGenesisAC.SetParam('pNUMERO_END_CEDENTE', 'S/N');

        dmRelatorios.rvpGenesisAC.SetParam('pBAIRRO_CEDENTE', Trim(dmMProvider.cdsNFEntradaBAIRRO_EMITENTE.Value));
        dmRelatorios.rvpGenesisAC.SetParam('pCIDADE_CEDENTE', Trim(dmMProvider.cdsNFEntradaCIDADE_EIMITENTE.Value));
        dmRelatorios.rvpGenesisAC.SetParam('pESTADO_CEDENTE', Trim(dmMProvider.cdsNFEntradaUF_EMITENTE.Value));
        dmRelatorios.rvpGenesisAC.SetParam('pTELEFONE_CEDENTE', '(' + Trim(dmMProvider.cdsNFEntradaDDD_EMITENTE.Value) + ') ' + Trim(dmMProvider.cdsNFEntradaTELEFONE_EMITENTE.Value));
        dmRelatorios.rvpGenesisAC.SetParam('pNOME_TIPO_LANCAMENTO', Trim(dmMProvider.cdsLancamentosNOME.Value));
 }
        dmRelatorios.rvpGenesisAC.Execute;
        dmRelatorios.rvpGenesisAC.Close;

      end
      else
      begin

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_ARQ_NEXISTE + ExtractFilePath(Application.ExeName) + 'Rav\Relatorios_Financeiros.rav';
        Application.ProcessMessages;

      end;

      FreeAndNil(frmInformacoesCPA_NFE);

    end;

  end;

  AbrirTabelaCFOP_Item(dmMProvider.cdsCFOP_NFEntradaCFOP.Value);
  AtualizarSaldoProdutoNFE(dmDBEXMaster.iIdFilial, dmMProvider.cdsNFEntradaSTATUS.Value, (dmMProvider.cdsConfiguracoesATIVAR_RENTABILIDADE.Value = 1));

  if dmDBEXMaster.fdqCFOP_CFPS.FieldByName('ATUALIZAR_CUSTOS').Value = 1 then
  begin

    lblMsg.Caption                          := dmDBEXMaster.sNomeUsuario + MSG_CALCULANDO_CLD;
    Application.ProcessMessages;
    CalcularPrecodeVendaCLD(dmDBEXMaster.iIdFilial, false);

    dmMProvider.cdsCLD_NFE.Close;
    dmMProvider.cdsCLD_NFE.ProviderName     := 'dspCLD_NFE';

    dmDBEXMaster.fdqCLD_NFE.Params[0].Value := dmMProvider.cdsNFEntradaNFENTRADA.Value;
    dmDBEXMaster.fdqCLD_NFE.Params[1].Value := dmDBEXMaster.iIdFilial;

    dmMProvider.cdsCLD_NFE. Open;
    dmMProvider.cdsCLD_NFE.ProviderName     := '';

    frmCalculoCLD_NFE                       := TfrmCalculoCLD_NFE.Create(self);
    if frmCalculoCLD_NFE.ShowModal <> mrOk then
    begin

      FreeAndNil(frmCalculoCLD_NFE);
      exit;

    end
    else
      FreeAndNil(frmCalculoCLD_NFE);

  end;

  dmDBEXMaster.fdqCFOP_CFPS.Close;


  if dmMProvider.cdsFilialREGIME_TRIBUTARIO.Value = 0 then
  begin

    lblMsg.Caption            := dmDBEXMaster.sNomeUsuario + MSG_GERANDO_REG50_SINTEGRA;
    Application.ProcessMessages;
    GravarEstornarRegistro50('N');

    lblMsg.Caption            := dmDBEXMaster.sNomeUsuario + MSG_GERANDO_REG54_SINTEGRA;
    Application.ProcessMessages;
    GravarEstornarRegistro54('N');

    frmManutencaoRegSintegra  := TfrmManutencaoRegSintegra.Create(self);
    frmManutencaoRegSintegra.ShowModal;

  end
  else
  begin

    if Gravar_Registro_C100(0) then
    begin

      try

        dmDBEXMaster.fdtMaster.StartTransaction;

        dmMSProcedure.fdspMaster.StoredProcName             := 'EXECUTA_SQL';
        dmMSProcedure.fdspMaster.Prepare;
        dmMSProcedure.fdspMaster.ParamByName('I_SQL').Value := 'UPDATE NFENTRADA SET STATUS = 1 WHERE NFENTRADA = ' + IntToStr(dmMProvider.cdsNFEntradaNFENTRADA.Value);
        dmMSProcedure.fdspMaster.ExecProc;

        dmMProvider.cdsNFEntrada.Edit;
        dmMProvider.cdsNFEntradaSTATUS.Value := 1;
        dmMProvider.cdsNFEntrada.Post;

        dmDBEXMaster.fdtMaster.CommitRetaining;
        LimparMSG_ERRO;

      except
        on E: exception do
        begin

          Tratar_Erro_Conexao(E);
          dmDBEXMaster.fdtMaster.RollbackRetaining;

        end;

      end;

    end;

  end;

end;

procedure TfrmModNFEntrada.actDesfazerExecute(Sender: TObject);
begin

  LimparMSG_ERRO;

  if dmMProvider.cdsNFEntrada.Active then
  begin

    if dmMProvider.cdsNFEntrada.State in [dsEdit, dsInsert] then
    begin

      dmMProvider.cdsNFEntrada.Cancel;
      HabilitaDesabilitaControles(false);
      edtConteudoPesquisa.SetFocus;

    end;

  end;

end;

procedure TfrmModNFEntrada.actEditarExecute(Sender: TObject);
begin

  LimparMSG_ERRO;

  if dmMProvider.cdsNFEntrada.Active then
  begin

    if not(dmMProvider.cdsNFEntrada.State in [dsEdit, dsInsert]) then
    begin

      if dmMProvider.cdsNFEntradaSTATUS.Value = 0 then
      begin

        HabilitaDesabilitaControles(True);
        pgcNFEntrada.ActivePageIndex := 1;
        LimparCampos;
        dmMProvider.cdsNFEntrada.Edit;
        edtDataEmissao.SetFocus;

      end
      else
        Mensagem(false, dmDBEXMaster.sNomeUsuario + MSG_STATUS_NAO_PERMITE);

    end;

  end;

end;

procedure TfrmModNFEntrada.actEstornoNFEExecute(Sender: TObject);
var
  cdsCloneItemNFEntrada: TClientDataset;
begin

  LimparMSG_ERRO;

  cdsCloneItemNFEntrada               := TClientDataset.Create(nil);
  cdsCloneItemNFEntrada.ProviderName  := dmMProvider.cdsItem_NFEntrada.ProviderName;

  cdsCloneItemNFEntrada.CloneCursor(dmMProvider.cdsItem_NFEntrada, True);
  cdsCloneItemNFEntrada.First;

  AtualizarSaldoProdutoNFE(dmDBEXMaster.iIdFilial, dmMProvider.cdsNFEntradaSTATUS.Value, (dmMProvider.cdsConfiguracoesATIVAR_RENTABILIDADE.Value = 1));

  if dmMProvider.cdsFilialREGIME_TRIBUTARIO.Value = 0 then
  begin

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_GERANDO_REG50_SINTEGRA;
    Application.ProcessMessages;
    GravarEstornarRegistro50('E');

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_GERANDO_REG54_SINTEGRA;
    Application.ProcessMessages;
    GravarEstornarRegistro54('E');

    frmManutencaoRegSintegra := TfrmManutencaoRegSintegra.Create(self);
    frmManutencaoRegSintegra.ShowModal;

    GravarEstornarLivro_Entrada(1);

  end
  else
  begin

    if Gravar_Registro_C100(1) then
    begin

      try

        dmDBEXMaster.fdtMaster.StartTransaction;

        dmMSProcedure.fdspMaster.StoredProcName             := 'EXECUTA_SQL';
        dmMSProcedure.fdspMaster.Prepare;
        dmMSProcedure.fdspMaster.ParamByName('I_SQL').Value := 'UPDATE NFENTRADA SET STATUS = 0 WHERE NFENTRADA = ' + IntToStr(dmMProvider.cdsNFEntradaNFENTRADA.Value);
        dmMSProcedure.fdspMaster.ExecProc;

        dmDBEXMaster.fdtMaster.CommitRetaining;

        dmMProvider.cdsNFEntrada.Edit;
        dmMProvider.cdsNFEntradaSTATUS.Value := 0;
        dmMProvider.cdsNFEntrada.Post;

      except
        on E: exception do
        begin

          Tratar_Erro_Conexao(E);
          dmDBEXMaster.fdtMaster.RollbackRetaining;

        end;

      end;

    end;

  end;


end;

procedure TfrmModNFEntrada.actExcluirExecute(Sender: TObject);
begin

  LimparMSG_ERRO;

  try

    dmMProvider.cdsCFOP_NFEntrada.First;

    while not dmMProvider.cdsCFOP_NFEntrada.Eof do
    begin

      Man_Tab_CFOP_Entrada(1, dmMProvider.cdsNFEntradaNFENTRADA.Value, '');
      dmMProvider.cdsCFOP_NFEntrada.Delete;

    end;

    dmMProvider.cdsParcelasNFE.First;

    while not dmMProvider.cdsParcelasNFE.Eof do
    begin

      Man_Tab_Parcelas_NFE(1, dmMProvider.cdsNFEntradaNFENTRADA.Value,
        dmMProvider.cdsParcelasNFEDOCUMENTO.Value,
        dmMProvider.cdsParcelasNFEVENCIMENTO.Value,
        dmMProvider.cdsParcelasNFEVALOR.Value);
      dmMProvider.cdsParcelasNFE.Delete;

    end;

    dmMProvider.cdsItem_NFEntrada.First;
    while not dmMProvider.cdsItem_NFEntrada.Eof do
    begin

      Man_Tab_ItemNFEntrada(1, dmMProvider.cdsNFEntradaNFENTRADA.Value, 1);
      dmMProvider.cdsItem_NFEntrada.Delete;

    end;

    Man_Tab_Conhecimento_Frete(1);
    Man_Tab_NFEntrada(1);

    dmMProvider.cdsNFEntrada.Delete;

  except
    on E: exception do
      Tratar_Erro_Conexao(E);

  end;

  HabilitaDesabilitaControles(false);
  edtConteudoPesquisa.Clear;
  edtConteudoPesquisa.SetFocus;

end;

procedure TfrmModNFEntrada.actExcluirItemNFExecute(Sender: TObject);
begin

  LimparMSG_ERRO;
  Man_Tab_ItemNFEntrada(1, dmMProvider.cdsItem_NFEntradaITEMNFENTRADA.Value, 0);
  RelacionarItens_NFE(dmMProvider.cdsNFEntradaNFENTRADA.Value, True);
  LimparCampos;

end;

procedure TfrmModNFEntrada.actImportarCTEExecute(Sender: TObject);
begin

  tbsInconsitenciaXML.TabVisible := false;

  LimparMSG_ERRO;

  OpenDialog1.FileName := '';
  OpenDialog1.InitialDir :=
    dmMProvider.cdsConfiguracoesREPOSITORIO_XML_ENTRADA.Value;

  if OpenDialog1.Execute then
  begin

    if Copy(ExtractFileName(OpenDialog1.FileName), 21, 2) <> '57' then
      Mensagem(True, dmDBEXMaster.sNomeUsuario + MSG_CONSISTE_MODELO_XML +
        ' - MODELO XML = ' + Copy(ExtractFileName(OpenDialog1.FileName), 21, 2))

    else
    begin

      if ExtractFilePath(OpenDialog1.FileName) <>
        dmMProvider.cdsConfiguracoesREPOSITORIO_XML_ENTRADA.Value then
      begin

        if dmMProvider.cdsConfiguracoesCOPIAR_XML_ENTRADA_REPOSITORIO.Value = 1
        then
        begin

          dmDBEXMaster.fdqFornecedor.Close;
          dmDBEXMaster.fdqFornecedor.SQL.Clear;
          dmDBEXMaster.fdqFornecedor.SQL.Add('select * from fornecedor');
          dmDBEXMaster.fdqFornecedor.SQL.Add
            ('where cnpj = ' +
            QuotedStr(Copy(ExtractFileName(OpenDialog1.FileName), 7, 14)));
          dmDBEXMaster.fdqFornecedor.Open;

          if dmDBEXMaster.fdqFornecedor.IsEmpty then
          begin

            dmDBEXMaster.fdqFornecedor.Close;
            Mensagem(false, dmDBEXMaster.sNomeUsuario +
              MSG_CADASTRAR_FORNECEDOR_XML);

          end
          else
          begin

            sPath_Destino :=
              dmMProvider.cdsConfiguracoesREPOSITORIO_XML_ENTRADA.Value + '\' +
              dmDBEXMaster.fdqFornecedor.FieldByName('RAZAOSOCIAL').Value + '\'
              + dmDBEXMaster.fdqFornecedor.FieldByName('CNPJ').Value + '\' +
              '20' + Copy(ExtractFileName(OpenDialog1.FileName), 3, 2) + '\' +
              MesExtenso2(Copy(ExtractFileName(OpenDialog1.FileName), 5,
              2)) + '\';

            CriarPasta(sPath_Destino);

            dmDBEXMaster.fdqFornecedor.Close;

            if not FileExists(sPath_Destino +
              ExtractFileName(OpenDialog1.FileName)) then
              CopiarXMLRepositorio(OpenDialog1.FileName,
                sPath_Destino + ExtractFileName(OpenDialog1.FileName));

            ImportarXML_NFE_CTE(ord(CTe), sPath_Destino + ExtractFileName(OpenDialog1.FileName))

          end;

        end;

      end;

    end;

  end;

end;

procedure TfrmModNFEntrada.actImportarNFEExecute(Sender: TObject);
begin

  tbsInconsitenciaXML.TabVisible := false;

  OcultarAbas(false);
  pgcNFEntrada.ActivePageIndex := 0;
  HabilitaDesabilitaControles(false);

  FecharTabelas;

  LimparMSG_ERRO;

  OpenDialog1.FileName    := '';
  OpenDialog1.InitialDir  :=  dmMProvider.cdsConfiguracoesREPOSITORIO_XML_ENTRADA.Value;

  if OpenDialog1.Execute then
  begin

    if Copy(ExtractFileName(OpenDialog1.FileName), 21, 2) <> '55' then
      Mensagem(True, dmDBEXMaster.sNomeUsuario + MSG_CONSISTE_MODELO_XML + ' - MODELO XML = ' + Copy(ExtractFileName(OpenDialog1.FileName), 21, 2))
    else
    begin

      if ExtractFilePath(OpenDialog1.FileName) <>  dmMProvider.cdsConfiguracoesREPOSITORIO_XML_ENTRADA.Value then
      begin

        if dmMProvider.cdsConfiguracoesCOPIAR_XML_ENTRADA_REPOSITORIO.Value = 1 then
        begin

          dmDBEXMaster.fdqFornecedor.Close;
          dmDBEXMaster.fdqFornecedor.SQL.Clear;
          dmDBEXMaster.fdqFornecedor.SQL.Add('select * from fornecedor');
          dmDBEXMaster.fdqFornecedor.SQL.Add ('where cnpj = ' + QuotedStr(Copy(ExtractFileName(OpenDialog1.FileName), 7, 14)));
          dmDBEXMaster.fdqFornecedor.Open;

          if dmDBEXMaster.fdqFornecedor.IsEmpty then
          begin

            dmDBEXMaster.fdqFornecedor.Close;
            Mensagem(false, dmDBEXMaster.sNomeUsuario + MSG_CADASTRAR_FORNECEDOR_XML);

          end
          else
          begin

            sPath_Destino := dmMProvider.cdsConfiguracoesREPOSITORIO_XML_ENTRADA.Value
                              + dmDBEXMaster.fdqFornecedor.FieldByName('RAZAOSOCIAL').Value + '\'
                              + dmDBEXMaster.fdqFornecedor.FieldByName('CNPJ').Value + '\'
                              + '20' + Copy(ExtractFileName(OpenDialog1.FileName), 3, 2) + '\'
                              + MesExtenso2(Copy(ExtractFileName(OpenDialog1.FileName), 5, 2)) + '\';

            CriarPasta(sPath_Destino);

            dmDBEXMaster.fdqFornecedor.Close;

            if not FileExists(sPath_Destino + ExtractFileName(OpenDialog1.FileName)) then
              CopiarXMLRepositorio(OpenDialog1.FileName, sPath_Destino + ExtractFileName(OpenDialog1.FileName));

            ImportarXML_NFE_CTE(ord(NFe), sPath_Destino + ExtractFileName(OpenDialog1.FileName))

          end;

        end;

      end;

    end;

  end;

end;

procedure TfrmModNFEntrada.actIncluirExecute(Sender: TObject);
begin

  LimparMSG_ERRO;

  iProx_NFEntrada           := -1;
  iProx_CFOPEntrada         := -1;
  iProx_ParcelasNFE         := -1;
  iProx_ItemNFEntrada       := 0;
  iProx_Conhecimento_Frete  := -1;

  dmMSProcedure.fdspMaster.StoredProcName := 'RETORNAR_GNR_NFENTRADA';
  dmMSProcedure.fdspMaster.ExecProc;

  iProx_NFEntrada     := (dmMSProcedure.fdspMaster.Params[0].Value + 1);

  frmDadosInclusaoNFE := TfrmDadosInclusaoNFE.Create(self);

  if frmDadosInclusaoNFE.ShowModal = mrOk then
  begin

    OcultarAbas(True);
    pgcNFEntrada.ActivePageIndex := 1;
    HabilitaDesabilitaControles(True);

    dmMProvider.cdsSituacao_Doc.Open;
    dmMProvider.cdsNFEntrada.Append;

    dmMProvider.cdsNFEntradaNFENTRADA.Value   := iProx_NFEntrada;
    dmMProvider.cdsNFEntradaFORNECEDOR.Value  := dmDBEXMaster.iFornecedor;
    dmMProvider.cdsNFEntradaNOTAFISCAL.Value  := frmDadosInclusaoNFE.edtNumeroNF.Text;
    dmMProvider.cdsNFEntradaSERIENF.Value     := frmDadosInclusaoNFE.edtSerieNF.Text;
    dmMProvider.cdsNFEntradaMODELO.Value      := frmDadosInclusaoNFE.cboModeloDoc.KeyValue;

    grpAliqCreditoSimples.Visible             := dmDBEXMaster.bFornecedorSIMPLES_NAC;

    RelacionarParcelas_NFE(iProx_NFEntrada);
    RelacionarCFOP_NFE(iProx_NFEntrada);
    RelacionarItens_NFE(iProx_NFEntrada, false);
    RelacionarFrete_NFE(iProx_NFEntrada);

    edtDataEmissao.SetFocus;

  end;

end;

procedure TfrmModNFEntrada.actSalvarExecute(Sender: TObject);
begin

  if dmMProvider.cdsNFEntrada.Active then
  begin

    if dmMProvider.cdsNFEntrada.State in [dsEdit, dsInsert] then
    begin

      if Length(Trim(dmMProvider.cdsNFEntradaSERIENF.Value)) <= 0 then
        sSerie_NFE := '000'
      else
        sSerie_NFE := FormatFloat('000',
          StrToInt(Trim(dmMProvider.cdsNFEntradaSERIENF.Value)));

{      iConsistir_Chave_NFE  := ConsistirChave_NFE_NF(dmMProvider.cdsNFEntradaPROTOCOLO_DANFE.Value,
                                                      FormatFloat('00', dmMProvider.cdsNFEntradaIBGE_UF_EMITENTE.Value),
                                                      FormatDateTime('yymm', dmMProvider.cdsNFEntradaEMISSAO.Value),
                                                      LimparCpnjInscricao(dmMProvider.cdsNFEntradaCNPJ_EMITENTE.Value),
                                                      sSerie_NFE, FormatFloat('000000000',StrToInt(dmMProvider.cdsNFEntradaNOTAFISCAL.Value)),
                                                      dmMProvider.cdsNFEntradaMODELO.Value);
}
      if iConsistir_Chave_NFE > 0 then
        TocarSomAlerta(ord(SystemHand));

      case iConsistir_Chave_NFE of
        CONSISTE_IBGE_ESTADO:begin
{
                                Mensagem(false, dmDBEXMaster.sNomeUsuario + MSG_CONSISTE_IBGE_ESTADO
                                          + ' - ' + dmMProvider.cdsNFEntradaUF_EMITENTE.Value);
                                edtProtocoloNFE.SetFocus;
                                exit;
}
                             end;
 CONSISTE_MESANO_EMISSAO_NFE:begin

                                Mensagem(false, dmDBEXMaster.sNomeUsuario
                                          + MSG_CONSISTE_MESANO_EMISSAO + ' - ' + FormatDateTime('dd/mm/yyyy', dmMProvider.cdsNFEntradaEMISSAO.Value));
                                edtDataEmissao.SetFocus;
                                exit;

                             end;
         CONSISTE_CNPJ__NFE:begin

{                                Mensagem(false, dmDBEXMaster.sNomeUsuario + MSG_CONSISTE_CNPJ__NFE
                                          + ' - ' + FormatarCNPJCPF(LimparCpnjInscricao(dmMProvider.cdsNFEntradaCNPJ_EMITENTE.Value)));
                                edtProtocoloNFE.SetFocus;
                                exit;
}
                            end;

         CONSISTE_SERIE_NFE:begin

                                Mensagem(false, dmDBEXMaster.sNomeUsuario + MSG_CONSISTE_SERIE_NFE
                                          + ' - ' + sSerie_NFE);
                                edtSerieNF.SetFocus;
                                exit;

                            end;
   CONSISTE_NUMERO_NOTA_NFE:begin

                              Mensagem(false, dmDBEXMaster.sNomeUsuario + MSG_CONSISTE_NUMERO_NOTA_NFE
                                        + ' - ' + dmMProvider.cdsNFEntradaNOTAFISCAL.Value);
                              edtNumeroNF.SetFocus;
                              exit;

                            end;
    CONSISTE_CHAVE_INVALIDA:begin

                              Mensagem(false, dmDBEXMaster.sNomeUsuario + MSG_CONSISTE_CHAVE_INVALIDA);
                              edtProtocoloNFE.SetFocus;
                              exit;

                            end;
       CONSISTE_CHAVE_VAZIA:begin

                              Mensagem(false, dmDBEXMaster.sNomeUsuario + MSG_CONSISTE_CHAVE_VAZIA);
                              edtProtocoloNFE.SetFocus;
                              exit;

                            end;
      end;

      Man_Tab_NFEntrada(0);

      dmMProvider.cdsNFEntrada.Post;
      RelacionarCFOP_NFE(dmMProvider.cdsNFEntradaNFENTRADA.Value);

    end;

    if dmMProvider.cdsConhecimentoFrete.State in [dsEdit, dsInsert] then
    begin

      if Length(Trim(dmMProvider.cdsConhecimentoFreteSERIE.Value)) <= 0 then
        sSerie_NFE := '000'
      else
        sSerie_NFE := FormatFloat('000', StrToInt(Trim(dmMProvider.cdsConhecimentoFreteSERIE.Value)));

      iConsistir_Chave_NFE := ConsistirChave_NFE_NF(dmMProvider.cdsConhecimentoFreteCHAVE_CTE.Value,
                                                    FormatFloat('00', dmMProvider.cdsConhecimentoFreteIBGE_UF_TRANSPROTADORA.Value),
                                                    FormatDateTime('yymm', dmMProvider.cdsConhecimentoFreteEMISSAO_ENTRADA.Value),
                                                    LimparCpnjInscricao(dmMProvider.cdsConhecimentoFreteCNPJ.Value),
                                                    sSerie_NFE, FormatFloat('000000000', dmMProvider.cdsConhecimentoFreteNUMERO.Value),
                                                    FormatFloat('00', dmMProvider.cdsConhecimentoFreteMODELO.Value));

      if iConsistir_Chave_NFE > 0 then
        TocarSomAlerta(ord(SystemHand));

      case iConsistir_Chave_NFE of
        CONSISTE_IBGE_ESTADO:begin

{                                Mensagem(false, dmDBEXMaster.sNomeUsuario + MSG_CONSISTE_IBGE_ESTADO
                                            + ' - ' + dmMProvider.cdsNFEntradaUF_EMITENTE.Value);
                                edtChaveCTE.SetFocus;
}                                exit;

                             end;
 CONSISTE_MESANO_EMISSAO_NFE:begin

                                Mensagem(false, dmDBEXMaster.sNomeUsuario + MSG_CONSISTE_MESANO_EMISSAO
                                            + ' - ' + FormatDateTime('dd/mm/yyyy', dmMProvider.cdsNFEntradaEMISSAO.Value));
                                edtEmissaoFrete.SetFocus;
                                exit;

                             end;
          CONSISTE_CNPJ__NFE:begin

{                                Mensagem(false, dmDBEXMaster.sNomeUsuario + MSG_CONSISTE_CNPJ__NFE
                                            + ' - ' + FormatarCNPJCPF(LimparCpnjInscricao(dmMProvider.cdsNFEntradaCNPJ_EMITENTE.Value)));
                                edtChaveCTE.SetFocus;
                                exit;
 }
                             end;

          CONSISTE_SERIE_NFE:begin

                                Mensagem(false, dmDBEXMaster.sNomeUsuario + MSG_CONSISTE_SERIE_NFE + ' - ' + sSerie_NFE);
                                edtSerieFrete.SetFocus;
                                exit;

                             end;
    CONSISTE_NUMERO_NOTA_NFE:begin

                                Mensagem(false, dmDBEXMaster.sNomeUsuario + MSG_CONSISTE_NUMERO_NOTA_NFE
                                            + ' - ' + dmMProvider.cdsNFEntradaNOTAFISCAL.Value);
                                edtNumeroFrete.SetFocus;
                                exit;

                             end;
     CONSISTE_CHAVE_INVALIDA:begin

                                Mensagem(false, dmDBEXMaster.sNomeUsuario + MSG_CONSISTE_CHAVE_INVALIDA);
                                edtChaveCTE.SetFocus;
                                exit;

                             end;
        CONSISTE_CHAVE_VAZIA:begin

                                Mensagem(false, dmDBEXMaster.sNomeUsuario + MSG_CONSISTE_CHAVE_VAZIA);
                                edtChaveCTE.SetFocus;
                                exit;
                             end;
      end;

      Man_Tab_Conhecimento_Frete(0);

      dmMProvider.cdsConhecimentoFrete.Post;
      RelacionarFrete_NFE(dmMProvider.cdsNFEntradaNFENTRADA.Value);

    end;

  end;

  HabilitaDesabilitaControles(false);
  edtConteudoPesquisa.SetFocus;

end;

procedure TfrmModNFEntrada.AtualizarSaldoProdutoNFE(pLoja, pOpcao: smallint;
  pUsarrentabilidade: boolean);
var
  sCst: string;
  bPassou: boolean;
begin

  LimparMSG_ERRO;

  try

    dmMProvider.cdsItem_NFEntrada.First;
    dmMProvider.cdsItem_NFEntrada.DisableControls;
    dmDBEXMaster.fdtMaster.StartTransaction;

    bPassou := false;

    case pOpcao of
      1:
        begin // estorno

          while not dmMProvider.cdsItem_NFEntrada.Eof do
          begin

            if pUsarrentabilidade then
            begin

              dmDBEXMaster.fdqSelRentabilidade.Close;
              dmDBEXMaster.fdqSelRentabilidade.SQL.Clear;
              dmDBEXMaster.fdqSelRentabilidade.SQL.Add('select * from rentabilidade');
              dmDBEXMaster.fdqSelRentabilidade.SQL.Add('where produto = ' + IntToStr(dmMProvider.cdsItem_NFEntradaPRODUTO.Value));

              dmDBEXMaster.fdqSelRentabilidade.Open;

              if not dmDBEXMaster.fdqSelRentabilidade.IsEmpty then
              begin

                dmDBEXMaster.fdqSelItemRentabilidade.Close;
                dmDBEXMaster.fdqSelItemRentabilidade.SQL.Clear;
                dmDBEXMaster.fdqSelItemRentabilidade.SQL.Add
                  ('select * from ITEMRENTABILIDADE');
                dmDBEXMaster.fdqSelItemRentabilidade.SQL.Add
                  ('where rentabilidade = ' +
                  IntToStr(dmDBEXMaster.fdqSelRentabilidade.FieldByName
                  ('RENTABILIDADE').Value));
                dmDBEXMaster.fdqSelItemRentabilidade.Open;

                if not dmDBEXMaster.fdqSelItemRentabilidade.IsEmpty then
                begin

                  if not LancarRentabilidade(pOpcao) then
                  begin

                    dmDBEXMaster.fdtMaster.RollbackRetaining;
                    dmMProvider.cdsItem_NFEntrada.First;
                    dmMProvider.cdsItem_NFEntrada.EnableControls;
                    lblMsg.Caption := dmDBEXMaster.sNomeUsuario +
                      MSG_N_ATUALIZA_ESTATISTICAS;
                    Application.ProcessMessages;
                    exit;

                  end;

                end;

                dmMProvider.cdsDesdobRentabil.First;

                while not dmMProvider.cdsDesdobRentabil.Eof do
                begin

                  dmMSProcedure.fdspMaster.StoredProcName := 'EXECUTA_SQL';
                  dmMSProcedure.fdspMaster.Prepare;
                  dmMSProcedure.fdspMaster.ParamByName('I_SQL').Value :=
                    'DELETE FROM MOVIMENTO WHERE PRODUTO = ' +
                    IntToStr(dmMProvider.cdsDesdobRentabilPRODUTO.Value) +
                    ' AND DOCUMENTO = ' +
                    QuotedStr(dmMProvider.cdsNFEntradaNOTAFISCAL.Value) +
                    ' AND FILIAL = ' + IntToStr(dmDBEXMaster.iIdFilial) +
                    ' AND FORNECEDOR = ' +
                    IntToStr(dmMProvider.cdsNFEntradaFORNECEDOR.Value) +
                    ' AND DATA = ' +
                    QuotedStr(FormatDateTime('mm/dd/yy',
                    dmMProvider.cdsNFEntradaEMISSAO.Value));
                  dmMSProcedure.fdspMaster.ExecProc;

                  dmMSProcedure.fdspMaster.StoredProcName := 'EXECUTA_SQL';
                  dmMSProcedure.fdspMaster.Prepare;

                  dmMSProcedure.fdspMaster.ParamByName('FOG').Value := 0;
                  dmMSProcedure.fdspMaster.ParamByName('TIPO_ATUALIZACAO')
                    .Value := 1;
                  dmMSProcedure.fdspMaster.ParamByName('FILIAL').Value :=
                    dmDBEXMaster.iIdFilial;
                  dmMSProcedure.fdspMaster.ParamByName('PRODUTO').Value :=
                    dmMProvider.cdsDesdobRentabilPRODUTO.Value;
                  dmMSProcedure.fdspMaster.ParamByName('QUANTIDADE').Value :=
                    dmMProvider.cdsDesdobRentabilQUANTIDADE.Value;
                  dmMSProcedure.fdspMaster.ParamByName('IP_DATA').Value :=
                    dmMProvider.cdsNFEntradaENTRADA.Value;
                  dmMSProcedure.fdspMaster.ExecProc;

                  dmMProvider.cdsDesdobRentabil.Next;

                end;

              end;

              dmDBEXMaster.fdqSelRentabilidade.Close;

            end
            else if not bPassou then
            begin

              bPassou := True;

              dmMSProcedure.fdspMovimento.StoredProcName := 'MAN_TAB_MOVIMENTO';
              dmMSProcedure.fdspMovimento.Prepare;
              dmMSProcedure.fdspMovimento.ParamByName('IP_TIPO_MOVIMENTO').Value
                := 0; // pela nf entrada
              dmMSProcedure.fdspMovimento.ParamByName('IP_OPCAO').Value := 2;
              // excluir
              dmMSProcedure.fdspMovimento.ParamByName('IP_CONTROLE').Value :=
                dmMProvider.cdsNFEntradaNFENTRADA.Value;
              dmMSProcedure.fdspMovimento.ParamByName('IP_DATA').Value :=
                dmMProvider.cdsNFEntradaENTRADA.Value;
              dmMSProcedure.fdspMovimento.ParamByName('IP_HORA').Value := Time;
              dmMSProcedure.fdspMovimento.ParamByName('IP_FILIAL').Value :=
                dmDBEXMaster.iIdFilial;
              dmMSProcedure.fdspMovimento.ParamByName('IP_DOCUMENTO').Value :=
                dmMProvider.cdsNFEntradaNOTAFISCAL.Value;
              dmMSProcedure.fdspMovimento.ParamByName('IP_TIPO_DOCUMENTO').Value
                := ord(tdNFE);
              dmMSProcedure.fdspMovimento.ParamByName('IP_FORNECEDOR').Value :=
                dmMProvider.cdsNFEntradaFORNECEDOR.Value;
              dmMSProcedure.fdspMovimento.ParamByName('IP_ECF').Value := -1;
              dmMSProcedure.fdspMovimento.ParamByName('IP_TERMINAL')
                .Value := -1;
              dmMSProcedure.fdspMovimento.ParamByName('IP_CLIENTE')
                .Value := null;
              dmMSProcedure.fdspMovimento.ParamByName('IP_FORMA_PAGAMENTO')
                .Value := null;
              dmMSProcedure.fdspMovimento.ParamByName('IP_PEDIDODEVENDA')
                .Value := null;
              dmMSProcedure.fdspMovimento.ParamByName('IP_QUANTIDADE')
                .Value := 0;
              dmMSProcedure.fdspMovimento.ParamByName('IP_VALOR_UNITARIO')
                .Value := 0;
              dmMSProcedure.fdspMovimento.ParamByName('IP_BARRAS')
                .Value := null;
              dmMSProcedure.fdspMovimento.ParamByName('IP_SUBTOTAL').Value := 0;
              dmMSProcedure.fdspMovimento.ParamByName('IP_FORNECEDOR').Value :=
                dmMProvider.cdsNFEntradaFORNECEDOR.Value;
              dmMSProcedure.fdspMovimento.ParamByName('IP_DESCONTO_ITEM')
                .Value := 0;
              dmMSProcedure.fdspMovimento.ParamByName('IP_ACRESCIMO_ITEM')
                .Value := 0;
              dmMSProcedure.fdspMovimento.ExecProc;

              dmMSProcedure.fdspMaster.StoredProcName :=
                'ATUALIZAR_SALDO_PRODUTO';
              dmMSProcedure.fdspMaster.Prepare;
              dmMSProcedure.fdspMaster.ParamByName('IP_OPCAO').Value := 1;
              dmMSProcedure.fdspMaster.ParamByName('IP_OPERACAO').Value := 0;
              dmMSProcedure.fdspMaster.ParamByName('IP_NOTA_FISCAL').Value :=
                dmMProvider.cdsNFEntradaNFENTRADA.Value;
              dmMSProcedure.fdspMaster.ParamByName('IP_BARRAS').Value := null;
              dmMSProcedure.fdspMaster.ParamByName('IP_QUANTIDADE').Value := 0;
              dmMSProcedure.fdspMaster.ParamByName('IP_LOCAL_MOVIMENTO')
                .Value := 0;
              dmMSProcedure.fdspMaster.ParamByName('IP_PRODUTO').Value := 0;
              dmMSProcedure.fdspMaster.ParamByName('IP_FILIAL').Value :=
                dmDBEXMaster.iIdFilial;
              dmMSProcedure.fdspMaster.ParamByName('IP_MODELO').Value :=
                dmMProvider.cdsNFEntradaMODELO.Value;
              dmMSProcedure.fdspMaster.ParamByName('IP_DATA').AsDate :=
                dmMProvider.cdsNFEntradaENTRADA.Value;

              dmMSProcedure.fdspMaster.ExecProc;

            end
            else
            begin

              if not bPassou then
              begin

                bPassou := True;
                dmMSProcedure.fdspMovimento.StoredProcName :=
                  'MAN_TAB_MOVIMENTO';
                dmMSProcedure.fdspMovimento.ParamByName('IP_TIPO_MOVIMENTO')
                  .Value := 0; // pela nf entrada
                dmMSProcedure.fdspMovimento.ParamByName('IP_OPCAO').Value := 2;
                // excluir
                dmMSProcedure.fdspMovimento.ParamByName('IP_CONTROLE').Value :=
                  dmMProvider.cdsNFEntradaNFENTRADA.Value;
                dmMSProcedure.fdspMovimento.ParamByName('IP_DATA').Value :=
                  dmMProvider.cdsNFEntradaENTRADA.Value;
                dmMSProcedure.fdspMovimento.ParamByName('IP_HORA')
                  .Value := Time;
                dmMSProcedure.fdspMovimento.ParamByName('IP_FILIAL').Value :=
                  dmDBEXMaster.iIdFilial;
                dmMSProcedure.fdspMovimento.ParamByName('IP_DOCUMENTO').Value :=
                  dmMProvider.cdsNFEntradaNOTAFISCAL.Value;
                dmMSProcedure.fdspMovimento.ParamByName('IP_TIPO_DOCUMENTO')
                  .Value := ord(tdNFE);
                dmMSProcedure.fdspMovimento.ParamByName('IP_ECF').Value := -1;
                dmMSProcedure.fdspMovimento.ParamByName('IP_TERMINAL')
                  .Value := -1;
                dmMSProcedure.fdspMovimento.ParamByName('IP_CLIENTE')
                  .Value := null;
                dmMSProcedure.fdspMovimento.ParamByName('IP_FORMA_PAGAMENTO')
                  .Value := null;
                dmMSProcedure.fdspMovimento.ParamByName('IP_PEDIDODEVENDA')
                  .Value := null;
                dmMSProcedure.fdspMovimento.ParamByName('IP_QUANTIDADE')
                  .Value := 0;
                dmMSProcedure.fdspMovimento.ParamByName('IP_VALOR_UNITARIO')
                  .Value := 0;
                dmMSProcedure.fdspMovimento.ParamByName('IP_BARRAS')
                  .Value := null;
                dmMSProcedure.fdspMovimento.ParamByName('IP_SUBTOTAL')
                  .Value := 0;
                dmMSProcedure.fdspMovimento.ParamByName('IP_FORNECEDOR').Value
                  := dmMProvider.cdsNFEntradaFORNECEDOR.Value;
                dmMSProcedure.fdspMovimento.ParamByName('IP_DESCONTO_ITEM')
                  .Value := 0;
                dmMSProcedure.fdspMovimento.ParamByName('IP_ACRESCIMO_ITEM')
                  .Value := 0;
                dmMSProcedure.fdspMovimento.ExecProc;

                dmMSProcedure.fdspMaster.StoredProcName :=
                  'ATUALIZAR_SALDO_PRODUTO';
                dmMSProcedure.fdspMaster.Prepare;
                dmMSProcedure.fdspMaster.ParamByName('IP_OPCAO').Value := 1;
                dmMSProcedure.fdspMaster.ParamByName('IP_OPERACAO').Value := 0;
                dmMSProcedure.fdspMaster.ParamByName('IP_NOTA_FISCAL').Value :=
                  dmMProvider.cdsNFEntradaNFENTRADA.Value;
                dmMSProcedure.fdspMaster.ParamByName('IP_BARRAS').Value := null;
                dmMSProcedure.fdspMaster.ParamByName('IP_QUANTIDADE')
                  .Value := 0;
                dmMSProcedure.fdspMaster.ParamByName('IP_LOCAL_MOVIMENTO')
                  .Value := 0;
                dmMSProcedure.fdspMaster.ParamByName('IP_PRODUTO').Value := 0;
                dmMSProcedure.fdspMaster.ParamByName('IP_FILIAL').Value :=
                  dmDBEXMaster.iIdFilial;
                dmMSProcedure.fdspMaster.ParamByName('IP_MODELO').Value :=
                  dmMProvider.cdsNFEntradaMODELO.Value;
                dmMSProcedure.fdspMaster.ParamByName('IP_DATA').AsDate :=
                  dmMProvider.cdsNFEntradaENTRADA.Value;
                dmMSProcedure.fdspMaster.ExecProc;

              end;

            end;

            dmMProvider.cdsItem_NFEntrada.Next;
            Application.ProcessMessages;

          end;
        end;
      2:
        begin // entrada

          while not dmMProvider.cdsItem_NFEntrada.Eof do
          begin

            if pUsarrentabilidade then
            begin

              dmDBEXMaster.fdqSelRentabilidade.Close;
              dmDBEXMaster.fdqSelRentabilidade.SQL.Clear;
              dmDBEXMaster.fdqSelRentabilidade.SQL.Add
                ('select * from rentabilidade');
              dmDBEXMaster.fdqSelRentabilidade.SQL.Add
                ('where produto = ' +
                IntToStr(dmMProvider.cdsItem_NFEntradaPRODUTO.Value));

              dmDBEXMaster.fdqSelRentabilidade.Open;

              if not dmDBEXMaster.fdqSelRentabilidade.IsEmpty then
              begin

                dmMSProcedure.fdspMaster.StoredProcName :=
                  'APLICAR_PRECO_DE_VENDA';
                dmMSProcedure.fdspMaster.Prepare;
                dmMSProcedure.fdspMaster.ParamByName('IP_TIPO_PRECO')
                  .Value := 0;
                // venda
                dmMSProcedure.fdspMaster.ParamByName('IP_PRODUTO').Value :=
                  dmMProvider.cdsItem_NFEntradaPRODUTO.Value;
                dmMSProcedure.fdspMaster.ParamByName('IP_PRECO').Value :=
                  dmMProvider.cdsItem_NFEntradaSUB_TOTAL.Value;
                dmMSProcedure.fdspMaster.ExecProc;

                dmDBEXMaster.fdqSelItemRentabilidade.Close;
                dmDBEXMaster.fdqSelItemRentabilidade.SQL.Clear;
                dmDBEXMaster.fdqSelItemRentabilidade.SQL.Add
                  ('select * from ITEMRENTABILIDADE');
                dmDBEXMaster.fdqSelItemRentabilidade.SQL.Add
                  ('where rentabilidade = ' +
                  IntToStr(dmDBEXMaster.fdqSelRentabilidade.FieldByName
                  ('RENTABILIDADE').Value));
                dmDBEXMaster.fdqSelItemRentabilidade.Open;

                if not dmDBEXMaster.fdqSelItemRentabilidade.IsEmpty then
                begin

                  if not LancarRentabilidade(pOpcao) then
                  begin

                    dmDBEXMaster.fdtMaster.RollbackRetaining;
                    dmMProvider.cdsItem_NFEntrada.First;
                    dmMProvider.cdsItem_NFEntrada.EnableControls;
                    lblMsg.Caption := dmDBEXMaster.sNomeUsuario +
                      MSG_N_ATUALIZA_ESTATISTICAS;
                    Application.ProcessMessages;
                    exit;

                  end;

                end;

                lblMsg.Caption := dmDBEXMaster.sNomeUsuario +
                  MSG_ATUALIZA_ESTATISTICAS;
                Application.ProcessMessages;

                dmMProvider.cdsDesdobRentabil.First;

                while not dmMProvider.cdsDesdobRentabil.Eof do
                begin

{                  if dmMProvider.cdsConfiguracoesATUALIZAR_FOR_PRO_PELA_NFE.
                    Value = 1 then
                  begin

                    dmMSProcedure.fdspAtualizar_ForPro_NFE.ParamByName
                      ('IP_FORNECEDOR').Value :=
                      dmMProvider.cdsNFEntradaFORNECEDOR.Value;
                    dmMSProcedure.fdspAtualizar_ForPro_NFE.ParamByName
                      ('IP_PRODUTO').Value :=
                      dmMProvider.cdsDesdobRentabilPRODUTO.Value;
                    dmMSProcedure.fdspAtualizar_ForPro_NFE.ExecProc;

                  end;

                  dmMSProcedure.fdspMovimento.StoredProcName :=
                    'GRAVAMOVIMENTO';
                  dmMSProcedure.fdspMovimento.Prepare;
                  dmMSProcedure.fdspMovimento.ParamByName('MOVIMENTO')
                    .Value := -1;
                  dmMSProcedure.fdspMovimento.ParamByName('DATA').Value :=
                    dmMProvider.cdsNFEntradaENTRADA.Value;
                  dmMSProcedure.fdspMovimento.ParamByName('HORA').Value := Time;
                  dmMSProcedure.fdspMovimento.ParamByName('FILIAL').Value :=
                    dmDBEXMaster.iIdFilial;
                  dmMSProcedure.fdspMovimento.ParamByName('CFOP').Value :=
                    dmMProvider.cdsCFOP_NFEntradaCFOP.Value;
                  dmMSProcedure.fdspMovimento.ParamByName('DOCUMENTO').Value :=
                    dmMProvider.cdsNFEntradaNOTAFISCAL.Value;
                  dmMSProcedure.fdspMovimento.ParamByName('TIPODOCUMENTO').Value
                    := ord(tdNFE);
                  dmMSProcedure.fdspMovimento.ParamByName('PRODUTO').Value :=
                    dmMProvider.cdsDesdobRentabilPRODUTO.Value;

                  dmMSProcedure.fdspMaster.StoredProcName :=
                    'SELECIONA_SALDO_PRODUTO';
                  dmMSProcedure.fdspMaster.Prepare;
                  dmMSProcedure.fdspMaster.ParamByName('PRODUTO').Value :=
                    dmMProvider.cdsDesdobRentabilPRODUTO.Value;
                  dmMSProcedure.fdspMaster.ParamByName('FILIAL').Value :=
                    dmDBEXMaster.iIdFilial;
                  dmMSProcedure.fdspMaster.ExecProc;

                  dmMSProcedure.fdspMovimento.ParamByName('SALDOANTERIOR').Value
                    := dmMSProcedure.fdspMaster.ParamByName('LOJA').Value;
                  dmMSProcedure.fdspMovimento.ParamByName('QUANTIDADE').Value :=
                    dmMProvider.cdsDesdobRentabilQUANTIDADE.Value;
                  dmMSProcedure.fdspMovimento.ParamByName('SALDOPOSTERIOR')
                    .Value := dmMSProcedure.fdspMaster.ParamByName('LOJA').Value
                    + dmMProvider.cdsDesdobRentabilQUANTIDADE.Value;
                  dmMSProcedure.fdspMovimento.ParamByName('VALORUNITARIO').Value
                    := dmMProvider.cdsProdutoFilialCUSTOBRUTO.Value;
                  dmMSProcedure.fdspMovimento.ParamByName('GERFCE').Value := 0;
                  dmMSProcedure.fdspMovimento.ParamByName('TERMINAL')
                    .Value := 0;
                  dmMSProcedure.fdspMovimento.ParamByName('FLAG').Value := 0;
                  dmMSProcedure.fdspMovimento.ParamByName('CLIENTE')
                    .Value := null;
                  dmMSProcedure.fdspMovimento.ParamByName('FORNECEDOR').Value :=
                    dmMProvider.cdsNFEntradaFORNECEDOR.Value;
                  dmMSProcedure.fdspMovimento.ParamByName('GRUPO').Value :=
                    dmMProvider.cdsProdutosGRUPO.Value;
                  dmMSProcedure.fdspMovimento.ParamByName('SUBGRUPO').Value :=
                    dmMProvider.cdsProdutosSUBGRUPO.Value;
                  dmMSProcedure.fdspMovimento.ParamByName('SECAO').Value :=
                    dmMProvider.cdsProdutosSECAO.Value;
                  dmMSProcedure.fdspMovimento.ParamByName('FORMAPAGAMENTO')
                    .Value := null;
                  dmMSProcedure.fdspMovimento.ParamByName('SUBTOTAL').Value :=
                    (dmMProvider.cdsProdutoFilialCUSTOBRUTO.Value *
                    dmMProvider.cdsDesdobRentabilQUANTIDADE.Value);
                  dmMSProcedure.fdspMovimento.ParamByName('PEDIDODEVENDA')
                    .Value := null;
                  dmMSProcedure.fdspMovimento.ParamByName('QUANTIDADEENTRADA')
                    .Value := dmMProvider.cdsDesdobRentabilQUANTIDADE.Value;
                  dmMSProcedure.fdspMovimento.ParamByName('QUANTIDADESAIDA')
                    .Value := 0;
                  dmMSProcedure.fdspMovimento.ParamByName('SUBTOTALENTRADA')
                    .Value := (dmMProvider.cdsDesdobRentabilQUANTIDADE.Value *
                    dmMProvider.cdsProdutoFilialCUSTOBRUTO.Value);
                  dmMSProcedure.fdspMovimento.ParamByName('SUBTOTALSAIDA')
                    .Value := 0;
                  dmMSProcedure.fdspMovimento.ExecProc;

                  dmMSProcedure.fdspMaster.StoredProcName :=
                    'SELECIONA_SALDO_PRODUTO';

                  dmMSProcedure.fdspMaster.StoredProcName :=
                    'ATUALIZARSALDOPRODUTO';
                  dmMSProcedure.fdspMaster.Prepare;
                  dmMSProcedure.fdspMaster.ParamByName('FOG').Value := 0;
                  dmMSProcedure.fdspMaster.ParamByName('TIPO_ATUALIZACAO')
                    .Value := 0;
                  dmMSProcedure.fdspMaster.ParamByName('FILIAL').Value :=
                    dmDBEXMaster.iIdFilial;
                  dmMSProcedure.fdspMaster.ParamByName('PRODUTO').Value :=
                    dmMProvider.cdsDesdobRentabilPRODUTO.Value;
                  dmMSProcedure.fdspMaster.ParamByName('QUANTIDADE').Value :=
                    dmMProvider.cdsDesdobRentabilQUANTIDADE.Value;
                  dmMSProcedure.fdspMaster.ParamByName('IP_DATA').Value :=
                    dmMProvider.cdsNFEntradaENTRADA.Value;
                  dmMSProcedure.fdspMaster.ExecProc;}

                  dmMProvider.cdsDesdobRentabil.Next;

                end;

              end
              else
              begin

                if not bPassou then
                begin

                  bPassou := True;
                  dmMSProcedure.fdspMovimento.StoredProcName :=
                    'MAN_TAB_MOVIMENTO';
                  dmMSProcedure.fdspMovimento.Prepare;
                  dmMSProcedure.fdspMovimento.ParamByName('IP_TIPO_MOVIMENTO')
                    .Value := 0; // pela nf entrada
                  dmMSProcedure.fdspMovimento.ParamByName('IP_OPCAO').Value :=
                    1; // INCLUIR
                  dmMSProcedure.fdspMovimento.ParamByName('IP_CONTROLE').Value
                    := dmMProvider.cdsNFEntradaNFENTRADA.Value;
                  dmMSProcedure.fdspMovimento.ParamByName('IP_DATA').Value :=
                    dmMProvider.cdsNFEntradaENTRADA.Value;
                  dmMSProcedure.fdspMovimento.ParamByName('IP_HORA')
                    .Value := Time;
                  dmMSProcedure.fdspMovimento.ParamByName('IP_FILIAL').Value :=
                    dmDBEXMaster.iIdFilial;
                  dmMSProcedure.fdspMovimento.ParamByName('IP_DOCUMENTO').Value
                    := dmMProvider.cdsNFEntradaNOTAFISCAL.Value;
                  dmMSProcedure.fdspMovimento.ParamByName('IP_TIPO_DOCUMENTO')
                    .Value := ord(tdNFE);
                  dmMSProcedure.fdspMovimento.ParamByName('IP_ECF').Value := -1;
                  dmMSProcedure.fdspMovimento.ParamByName('IP_TERMINAL')
                    .Value := -1;
                  dmMSProcedure.fdspMovimento.ParamByName('IP_CLIENTE')
                    .Value := null;
                  dmMSProcedure.fdspMovimento.ParamByName('IP_FORMA_PAGAMENTO')
                    .Value := null;
                  dmMSProcedure.fdspMovimento.ParamByName('IP_PEDIDODEVENDA')
                    .Value := null;
                  dmMSProcedure.fdspMovimento.ParamByName('IP_QUANTIDADE')
                    .Value := 0;
                  dmMSProcedure.fdspMovimento.ParamByName('IP_VALOR_UNITARIO')
                    .Value := 0;
                  dmMSProcedure.fdspMovimento.ParamByName('IP_BARRAS')
                    .Value := null;
                  dmMSProcedure.fdspMovimento.ParamByName('IP_SUBTOTAL')
                    .Value := 0;
                  dmMSProcedure.fdspMovimento.ParamByName('IP_FORNECEDOR')
                    .Value := -1;
                  dmMSProcedure.fdspMovimento.ParamByName('IP_DESCONTO_ITEM')
                    .Value := 0;
                  dmMSProcedure.fdspMovimento.ParamByName('IP_ACRESCIMO_ITEM')
                    .Value := 0;
                  dmMSProcedure.fdspMovimento.ExecProc;

                  dmMSProcedure.fdspMaster.StoredProcName :=
                    'ATUALIZAR_SALDO_PRODUTO';
                  dmMSProcedure.fdspMaster.Prepare;
                  dmMSProcedure.fdspMaster.ParamByName('IP_OPCAO').Value := 1;
                  dmMSProcedure.fdspMaster.ParamByName('IP_OPERACAO')
                    .Value := 1;
                  dmMSProcedure.fdspMaster.ParamByName('IP_NOTA_FISCAL').Value
                    := dmMProvider.cdsNFEntradaNFENTRADA.Value;
                  dmMSProcedure.fdspMaster.ParamByName('IP_BARRAS')
                    .Value := null;
                  dmMSProcedure.fdspMaster.ParamByName('IP_QUANTIDADE')
                    .Value := 0;
                  dmMSProcedure.fdspMaster.ParamByName('IP_LOCAL_MOVIMENTO')
                    .Value := 0;
                  dmMSProcedure.fdspMaster.ParamByName('IP_PRODUTO').Value := 0;
                  dmMSProcedure.fdspMaster.ParamByName('IP_FILIAL').Value :=
                    dmDBEXMaster.iIdFilial;
                  dmMSProcedure.fdspMaster.ParamByName('IP_MODELO').Value :=
                    dmMProvider.cdsNFEntradaMODELO.Value;
                  dmMSProcedure.fdspMaster.ParamByName('IP_DATA').AsDate :=
                    dmMProvider.cdsNFEntradaENTRADA.Value;
                  dmMSProcedure.fdspMaster.ExecProc;

                end;

              end;

            end
            else
            begin

              if not bPassou then
              begin

                bPassou := True;
                dmMSProcedure.fdspMovimento.StoredProcName :=
                  'MAN_TAB_MOVIMENTO';
                dmMSProcedure.fdspMovimento.ParamByName('IP_TIPO_MOVIMENTO')
                  .Value := 0; // pela nf entrada
                dmMSProcedure.fdspMovimento.ParamByName('IP_OPCAO').Value := 1;
                // INCLUIR
                dmMSProcedure.fdspMovimento.ParamByName('IP_CONTROLE').Value :=
                  dmMProvider.cdsNFEntradaNFENTRADA.Value;
                dmMSProcedure.fdspMovimento.ParamByName('IP_DATA').Value :=
                  dmMProvider.cdsNFEntradaENTRADA.Value;
                dmMSProcedure.fdspMovimento.ParamByName('IP_HORA')
                  .Value := Time;
                dmMSProcedure.fdspMovimento.ParamByName('IP_FILIAL').Value :=
                  dmDBEXMaster.iIdFilial;
                dmMSProcedure.fdspMovimento.ParamByName('IP_DOCUMENTO').Value :=
                  dmMProvider.cdsNFEntradaNOTAFISCAL.Value;
                dmMSProcedure.fdspMovimento.ParamByName('IP_TIPO_DOCUMENTO')
                  .Value := ord(tdNFE);
                dmMSProcedure.fdspMovimento.ParamByName('IP_ECF').Value := -1;
                dmMSProcedure.fdspMovimento.ParamByName('IP_TERMINAL')
                  .Value := -1;
                dmMSProcedure.fdspMovimento.ParamByName('IP_CLIENTE')
                  .Value := null;
                dmMSProcedure.fdspMovimento.ParamByName('IP_FORMA_PAGAMENTO')
                  .Value := null;
                dmMSProcedure.fdspMovimento.ParamByName('IP_PEDIDODEVENDA')
                  .Value := null;
                dmMSProcedure.fdspMovimento.ParamByName('IP_QUANTIDADE')
                  .Value := 0;
                dmMSProcedure.fdspMovimento.ParamByName('IP_VALOR_UNITARIO')
                  .Value := 0;
                dmMSProcedure.fdspMovimento.ParamByName('IP_BARRAS')
                  .Value := null;
                dmMSProcedure.fdspMovimento.ParamByName('IP_SUBTOTAL')
                  .Value := 0;
                dmMSProcedure.fdspMovimento.ParamByName('IP_FORNECEDOR')
                  .Value := -1;
                dmMSProcedure.fdspMovimento.ParamByName('IP_DESCONTO_ITEM')
                  .Value := 0;
                dmMSProcedure.fdspMovimento.ParamByName('IP_ACRESCIMO_ITEM')
                  .Value := 0;
                dmMSProcedure.fdspMovimento.ExecProc;

                dmMSProcedure.fdspMaster.StoredProcName :=
                  'ATUALIZAR_SALDO_PRODUTO';
                dmMSProcedure.fdspMaster.Prepare;
                dmMSProcedure.fdspMaster.ParamByName('IP_OPCAO').Value := 1;
                dmMSProcedure.fdspMaster.ParamByName('IP_OPERACAO').Value := 1;
                dmMSProcedure.fdspMaster.ParamByName('IP_NOTA_FISCAL').Value :=
                  dmMProvider.cdsNFEntradaNFENTRADA.Value;
                dmMSProcedure.fdspMaster.ParamByName('IP_BARRAS').Value := null;
                dmMSProcedure.fdspMaster.ParamByName('IP_QUANTIDADE')
                  .Value := 0;
                dmMSProcedure.fdspMaster.ParamByName('IP_LOCAL_MOVIMENTO')
                  .Value := 0;
                dmMSProcedure.fdspMaster.ParamByName('IP_PRODUTO').Value := 0;
                dmMSProcedure.fdspMaster.ParamByName('IP_FILIAL').Value :=
                  dmDBEXMaster.iIdFilial;
                dmMSProcedure.fdspMaster.ParamByName('IP_MODELO').Value :=
                  dmMProvider.cdsNFEntradaMODELO.Value;
                dmMSProcedure.fdspMaster.ParamByName('IP_DATA').AsDate :=
                  dmMProvider.cdsNFEntradaENTRADA.Value;
                dmMSProcedure.fdspMaster.ExecProc;

              end;

            end;

            Application.ProcessMessages;
            dmMProvider.cdsItem_NFEntrada.Next;

          end;
        end;

    end;

    dmMProvider.cdsItem_NFEntrada.First;
    dmMProvider.cdsItem_NFEntrada.EnableControls;
    dmDBEXMaster.fdtMaster.CommitRetaining;

  except

  end;

  bPassou := false;

end;

procedure TfrmModNFEntrada.CalcularPrecodeVendaCLD(loja: smallint;
  pUsarEmbAtacado: boolean);
var
  bConsiderarDesconto: boolean;
  cCusto_Bruto, cCusto_Liquido, cValor_Desconto, cPerc_Deconto, cValor_Frete,
    cPerc_Frete, cValor_Ipi, cPerc_Ipi, cValor_Oustras_Desp, cPerc_Outras_Desp,
    cValor_BC_Icms, cValor_Icms, cPerc_Icms, cFatorMarkup,
    cFatorMarkup_SemLucro, cDespesasVariaveis, cPreco_Calculado,
    cPerc_ICMS_PAGAR, cValor_Unitario, cMenor_Preco, cValor_ICMSR: Currency;
begin

  try

    dmMProvider.cdsItem_NFEntrada.First;
    dmMProvider.cdsItem_NFEntrada.DisableControls;
    dmDBEXMaster.fdtMaster.StartTransaction;


    // verificar
    // dmmaster.IBDFornecedores.Locate('fornecedor', dmmaster.IBDNFEntradaFORNECEDOR.Value, []);

    case dmMProvider.cdsConfiguracoesTIPOCLD.Value of
      0:
        begin

          while not dmMProvider.cdsItem_NFEntrada.Eof do
          begin

            // primeiro passo
            // posiciona a tabela de custos
            dmDBEXMaster.ValidarPesquisaProduto(dmMProvider.cdsItem_NFEntradaPRODUTO.Value);

            if dmDBEXMaster.ValidarPesquisaProduto_Filial(dmMProvider.cdsItem_NFEntradaPRODUTO.Value) then
            begin

              // alterar para valor unitario/quant embalagem
              if dmMProvider.cdsItem_NFEntradaSUB_TOTAL.Value > 0 then
                cCusto_Bruto := (dmMProvider.cdsItem_NFEntradaSUB_TOTAL.Value / dmMProvider.cdsItem_NFEntradaQUANTIDADE.Value) / dmMProvider.cdsItem_NFEntradaUNIDADEEMBALAGEM.Value
              else
                cCusto_Bruto := 0;

              if dmMProvider.cdsItem_NFEntradaVALOR_DESCONTO.Value > 0 then
              begin

                cValor_Desconto := dmMProvider.cdsItem_NFEntradaVALOR_DESCONTO.Value;
                cPerc_Deconto   := (dmMProvider.cdsItem_NFEntradaVALOR_DESCONTO.Value / dmMProvider.cdsItem_NFEntradaSUB_TOTAL.Value) * 100;
                cPerc_Deconto   := Arredondar(cPerc_Deconto, 2);

              end
              else
              begin

                cValor_Desconto := 0;
                cPerc_Deconto   := 0;

              end;

              if dmMProvider.cdsItem_NFEntradaFRETE_RATEADO.Value > 0 then
              begin

                cValor_Frete  := dmMProvider.cdsItem_NFEntradaFRETE_RATEADO.Value;
                cPerc_Frete   := (dmMProvider.cdsItem_NFEntradaFRETE_RATEADO.Value / dmMProvider.cdsItem_NFEntradaSUB_TOTAL.Value) * 100;
                cPerc_Frete   := Arredondar(cPerc_Frete, 2);

              end
              else
              begin

                cValor_Frete  := 0;
                cPerc_Frete   := 0;

              end;

              if dmMProvider.cdsItem_NFEntradaVALOR_IPI.Value > 0 then
              begin

                cValor_Ipi  := dmMProvider.cdsItem_NFEntradaVALOR_IPI.Value;
                cPerc_Ipi   := dmMProvider.cdsItem_NFEntradaIPI.Value;

              end
              else
              begin

                cValor_Ipi  := 0;
                cPerc_Ipi   := 0;

              end;

              if dmMProvider.cdsItem_NFEntradaENCARGOS.Value > 0 then
              begin

                cValor_Oustras_Desp := dmMProvider.cdsItem_NFEntradaENCARGOS.Value;
                cPerc_Outras_Desp   := (dmMProvider.cdsItem_NFEntradaENCARGOS.Value / dmMProvider.cdsItem_NFEntradaSUB_TOTAL.Value) * 100;

              end
              else
              begin

                cValor_Oustras_Desp := 0;
                cPerc_Outras_Desp   := 0;

              end;

              cValor_BC_Icms  := dmMProvider.cdsItem_NFEntradaBASE_ICMS.Value;
              cPerc_Icms      := dmMProvider.cdsItem_NFEntradaICMSENTRADA.Value;
              cValor_Icms     := dmMProvider.cdsItem_NFEntradaVALOR_ICMS.Value;

              if dmMProvider.cdsItem_NFEntradaCST.Value = 40 then
              begin

                cValor_BC_Icms  := 0;
                cPerc_Icms      := 0;
                cValor_Icms     := 0;

              end;

              AbrirTabelaCFOP_Item(dmMProvider.cdsItem_NFEntradaCFOP.Value);

              if dmDBEXMaster.fdqCFOP_CFPS.FieldByName('GERA_DEBITO_CREDITO_ICMS').Value = 0 then
              begin

                cValor_BC_Icms  := 0;
                cPerc_Icms      := 0;
                cValor_Icms     := 0;

              end;

              if dmMProvider.cdsItem_NFEntradaVALOR_SUBSTITUICAO.Value > 0 then
                cValor_ICMSR :=  ((dmMProvider.cdsItem_NFEntradaVALOR_SUBSTITUICAO.Value / dmMProvider.cdsItem_NFEntradaQUANTIDADE.Value) / dmMProvider.cdsItem_NFEntradaUNIDADEEMBALAGEM.Value)
              else
                cValor_ICMSR := 0;

              cCusto_Liquido := (((dmMProvider.cdsItem_NFEntradaSUB_TOTAL.Value / dmMProvider.cdsItem_NFEntradaQUANTIDADE.Value) / dmMProvider.cdsItem_NFEntradaUNIDADEEMBALAGEM.Value))
                                + cValor_ICMSR + dmMProvider.cdsItem_NFEntradaVALOR_IPI.Value
                                + dmMProvider.cdsItem_NFEntradaENCARGOS.Value
                                + dmMProvider.cdsItem_NFEntradaFRETE_RATEADO.Value;

              if dmDBEXMaster.fdqProdutoFilial.FieldByName('LUCROLIQUIDO').Value > 0 then
                cPreco_Calculado := cCusto_Liquido + (cCusto_Liquido * (dmDBEXMaster.fdqProdutoFilial.FieldByName ('LUCROLIQUIDO').Value / 100))
              else
                cPreco_Calculado := cCusto_Liquido;

              FormatSettings.DecimalSeparator := '.';

              dmMSProcedure.fdspMaster.StoredProcName := 'EXECUTA_SQL';
              dmMSProcedure.fdspMaster.Prepare;

              // atualiza NCM
              dmMSProcedure.fdspMaster.Params[0].Value := 'UPDATE PRODUTO SET NCM = ' + QuotedStr(dmMProvider.cdsItem_NFEntradaNCM.Value)
                                                          + ' WHERE PRODUTO = ' + IntToStr(dmMProvider.cdsItem_NFEntradaPRODUTO.Value);
              dmMSProcedure.fdspMaster.ExecProc;

              // salva custo liquido/bruto preco de venda anterior
              dmMSProcedure.fdspMaster.Params[0].Value := 'UPDATE PRODUTOFILIAL SET CUSTOBRUTOANTERIOR = '
                                                          + FloatToStr(dmDBEXMaster.fdqProdutoFilial.FieldByName('CUSTOBRUTO').Value)
                                                          + ', CUSTOLIQUIDOANTERIOR = ' + FloatToStr(dmDBEXMaster.fdqProdutoFilial.FieldByName('CUSTOLIQUIDO').Value)
                                                          + ', PRECODEVENDAANTERIOR = ' + FloatToStr(dmDBEXMaster.fdqProdutoFilial.FieldByName('PRECODEVENDA').Value)
                                                          + ' WHERE PRODUTO = ' + IntToStr(dmMProvider.cdsItem_NFEntradaPRODUTO.Value);
              dmMSProcedure.fdspMaster.ExecProc;

              dmMSProcedure.fdspMaster.Params[0].Value :='UPDATE PRODUTOFILIAL SET CUSTOBRUTO = ' + FloatToStr(cCusto_Bruto)
                                                          + ', CUSTOLIQUIDO = ' +FloatToStr(cCusto_Liquido)
                                                          + ', DESCONTONACOMPRA = ' + FloatToStr(cPerc_Deconto)
                                                          + ', VALORDODESCONTONACOMPRA = ' + FloatToStr(((dmMProvider.cdsItem_NFEntradaVALOR_DESCONTO.Value / dmMProvider.cdsItem_NFEntradaQUANTIDADE.Value) / dmMProvider.cdsItem_NFEntradaUNIDADEEMBALAGEM.Value))
                                                          + ', FRETE = ' + FloatToStr(cPerc_Frete) + ', VALORDOFRETE = ' + FloatToStr(dmMProvider.cdsItem_NFEntradaFRETE_RATEADO.Value)
                                                          + ', OUTROSCUSTOS = ' + FloatToStr(cPerc_Outras_Desp)
                                                          + ', VALORDEOUTROSCUSTOS = ' + FloatToStr(dmMProvider.cdsItem_NFEntradaENCARGOS.Value)
                                                          + ', IPI = ' + FloatToStr(cPerc_Ipi) + ', VALORDOIPI = ' + FloatToStr(cValor_Ipi)
                                                          + ', CREDITODEICMS = ' + FloatToStr(cPerc_Icms) + ', VALORDOICMSR = ' + FloatToStr(cValor_ICMSR)
                                                          + ', VALORDOCREDITODEICMSR = ' + FloatToStr(cValor_Icms) + ', MENORPRECO = ' + FloatToStr(cCusto_Liquido)
                                                          + ', PRECOCALCULADO = ' + FloatToStr(cPreco_Calculado)
                                                          + ', PRECOPROVISORIO = ' + FloatToStr(cPreco_Calculado)
                                                          + ', ULTIMA_ENTRADA = ' + QuotedStr(FormatDateTime('mm/dd/yy', dmMProvider.cdsNFEntradaENTRADA.Value))
                                                          + ', ULTIMA_NF_ENTRADA = ' + QuotedStr(dmMProvider.cdsNFEntradaNOTAFISCAL.Value)
                                                          + ' WHERE PRODUTO = ' + IntToStr(dmMProvider.cdsItem_NFEntradaPRODUTO.Value)
                                                          + ' AND FILIAL = ' + IntToStr(dmDBEXMaster.iIdFilial);
              dmMSProcedure.fdspMaster.ExecProc;

              FormatSettings.DecimalSeparator := ',';

            end;

            dmMProvider.cdsItem_NFEntrada.Next;

          end;

        end;
      1:
        begin

          while not dmMProvider.cdsItem_NFEntrada.Eof do
          begin

            // primeiro passo
            // posiciona a tabela de custos
            dmDBEXMaster.ValidarPesquisaProduto(dmMProvider.cdsItem_NFEntradaPRODUTO.Value);

            if dmDBEXMaster.ValidarPesquisaProduto_Filial(dmMProvider.cdsItem_NFEntradaPRODUTO.Value) then
            begin

              // alterar para valor unitario/quant embalagem
              if dmMProvider.cdsItem_NFEntradaSUB_TOTAL.Value > 0 then
                cCusto_Bruto := (dmMProvider.cdsItem_NFEntradaSUB_TOTAL.Value / dmMProvider.cdsItem_NFEntradaQUANTIDADE.Value) / dmMProvider.cdsItem_NFEntradaUNIDADEEMBALAGEM.Value
              else
                cCusto_Bruto := 0;

              if dmMProvider.cdsItem_NFEntradaVALOR_DESCONTO.Value > 0 then
              begin

                cValor_Desconto := dmMProvider.cdsItem_NFEntradaVALOR_DESCONTO.Value;
                cPerc_Deconto   := (dmMProvider.cdsItem_NFEntradaVALOR_DESCONTO. Value / dmMProvider.cdsItem_NFEntradaSUB_TOTAL.Value) * 100;
                cPerc_Deconto   := Arredondar(cPerc_Deconto, 2);

              end
              else
              begin

                cValor_Desconto := 0;
                cPerc_Deconto   := 0;

              end;

              if dmMProvider.cdsItem_NFEntradaFRETE_RATEADO.Value > 0 then
              begin

                cValor_Frete  := dmMProvider.cdsItem_NFEntradaFRETE_RATEADO.Value;
                cPerc_Frete   := (dmMProvider.cdsItem_NFEntradaFRETE_RATEADO.Value / dmMProvider.cdsItem_NFEntradaSUB_TOTAL.Value) * 100;
                cPerc_Frete   := Arredondar(cPerc_Frete, 2);

              end
              else
              begin

                cValor_Frete  := 0;
                cPerc_Frete   := 0;

              end;

              if dmMProvider.cdsItem_NFEntradaVALOR_IPI.Value > 0 then
              begin

                cValor_Ipi  := dmMProvider.cdsItem_NFEntradaVALOR_IPI.Value;
                cPerc_Ipi   := dmMProvider.cdsItem_NFEntradaIPI.Value;

              end
              else
              begin

                cValor_Ipi  := 0;
                cPerc_Ipi   := 0;

              end;

              if dmMProvider.cdsItem_NFEntradaENCARGOS.Value > 0 then
              begin

                cValor_Oustras_Desp := dmMProvider.cdsItem_NFEntradaENCARGOS.Value;
                cPerc_Outras_Desp   := (dmMProvider.cdsItem_NFEntradaENCARGOS.Value / dmMProvider.cdsItem_NFEntradaSUB_TOTAL.Value) * 100;

              end
              else
              begin

                cValor_Oustras_Desp := 0;
                cPerc_Outras_Desp   := 0;

              end;

              case dmMProvider.cdsConfiguracoesTIPOCLD.Value of
                0: cPerc_ICMS_PAGAR := dmMProvider.cdsFilialPERCENTUAL_ICMS_SIMPLES_NAC.Value;
                1: cPerc_ICMS_PAGAR := dmDBEXMaster.fdqProdutoFilial.FieldByName('ICMSAPAGAR').Value;
              end;

              if dmMProvider.cdsItem_NFEntradaUNIDADEEMBALAGEM.Value > 1 then
                cValor_Unitario := dmMProvider.cdsItem_NFEntradaSUB_TOTAL.Value
              else
                cValor_Unitario := dmMProvider.cdsItem_NFEntradaVALORUNITARIO.Value;

              // desp variaveis -> ICMS/PIS/Cofins/Comissao/IR/ContrbSoc/Marketing
              cDespesasVariaveis  := cPerc_ICMS_PAGAR + dmDBEXMaster.fdqProdutoFilial.FieldByName('COMISSAOVENDA').Value
                                        + dmDBEXMaster.fdqProdutoFilial.FieldByName('IMPOSTOSFEDERAIS').Value;

              cValor_BC_Icms      := dmMProvider.cdsItem_NFEntradaBASE_ICMS.Value;
              cPerc_Icms          := dmMProvider.cdsItem_NFEntradaICMSENTRADA.Value;
              cValor_Icms         := dmMProvider.cdsItem_NFEntradaVALOR_ICMS.Value;

              if dmMProvider.cdsItem_NFEntradaCST.Value = 40 then
              begin

                cValor_BC_Icms  := 0;
                cPerc_Icms      := 0;
                cValor_Icms     := 0;

              end;

              AbrirTabelaCFOP_Item(dmMProvider.cdsItem_NFEntradaCFOP.Value);

              if dmDBEXMaster.fdqCFOP_CFPS.FieldByName('GERA_DEBITO_CREDITO_ICMS').Value = 0 then
              begin

                cValor_BC_Icms  := 0;
                cPerc_Icms      := 0;
                cValor_Icms     := 0;

              end;

              if dmMProvider.cdsItem_NFEntradaVALOR_SUBSTITUICAO.Value > 0 then
                cValor_ICMSR := ((dmMProvider.cdsItem_NFEntradaVALOR_SUBSTITUICAO.Value /  dmMProvider.cdsItem_NFEntradaQUANTIDADE.Value) / dmMProvider.cdsItem_NFEntradaUNIDADEEMBALAGEM.Value)
              else
                cValor_ICMSR := 0;

              cCusto_Liquido  := (((dmMProvider.cdsItem_NFEntradaSUB_TOTAL.Value - (cValor_Icms + dmMProvider.cdsItem_NFEntradaVALOR_DESCONTO.Value)) / dmMProvider.cdsItem_NFEntradaQUANTIDADE.Value) / dmMProvider.cdsItem_NFEntradaUNIDADEEMBALAGEM.Value)
                                  + cValor_ICMSR
                                  + dmMProvider.cdsItem_NFEntradaVALOR_IPI. Value + dmMProvider.cdsItem_NFEntradaENCARGOS.Value
                                  + dmMProvider.cdsItem_NFEntradaFRETE_RATEADO.Value;

              // CustoOperacional = despesas Fixas = folha/pro-labore/tarifas/aluguel/seguros/desp gerais
              cFatorMarkup    := (100 - (cDespesasVariaveis + dmDBEXMaster.fdqProdutoFilial.FieldByName('CUSTOOPERACIONAL').Value + cCusto_Liquido {dmDBEXMaster.fdqProdutoFilial.FieldByName('LUCROLIQUIDO').Value})) / 100;

              if cFatorMarkup > 0 then
                cPreco_Calculado := (cCusto_Liquido / cFatorMarkup);

              // arrredonda
              cPreco_Calculado      := Arredondar(cPreco_Calculado, 2);

              cFatorMarkup_SemLucro :=(100 - (cDespesasVariaveis + dmDBEXMaster.fdqProdutoFilial.FieldByName('CUSTOOPERACIONAL').Value)) / 100;
              cMenor_Preco          := (cCusto_Liquido / cFatorMarkup_SemLucro);

              if dmDBEXMaster.fdqProdutoFilial.FieldByName('DESCONTONAVENDA').Value > 0 then
                cPreco_Calculado := (100 * cPreco_Calculado) /(100 - dmDBEXMaster.fdqProdutoFilial.FieldByName('DESCONTONAVENDA').Value);

              FormatSettings.DecimalSeparator := '.';

              dmMSProcedure.fdspMaster.StoredProcName := 'EXECUTA_SQL';
              dmMSProcedure.fdspMaster.Prepare;

              // atualiza NCM
              dmMSProcedure.fdspMaster.Params[0].Value := 'UPDATE PRODUTO SET NCM = ' + QuotedStr(dmMProvider.cdsItem_NFEntradaNCM.Value)
                                                          + ' WHERE PRODUTO = ' + IntToStr(dmMProvider.cdsItem_NFEntradaPRODUTO.Value);
              dmMSProcedure.fdspMaster.ExecProc;

              // salva custo liquido/bruto preco de venda anterior
              dmMSProcedure.fdspMaster.Params[0].Value := 'UPDATE PRODUTOFILIAL SET CUSTOBRUTOANTERIOR = ' + FloatToStr(dmDBEXMaster.fdqProdutoFilial.FieldByName ('CUSTOBRUTO').Value)
                                                          + ', CUSTOLIQUIDOANTERIOR = ' + FloatToStr(dmDBEXMaster.fdqProdutoFilial.FieldByName('CUSTOLIQUIDO').Value)
                                                          + ', PRECODEVENDAANTERIOR = ' + FloatToStr(dmDBEXMaster.fdqProdutoFilial.FieldByName('PRECODEVENDA').Value)
                                                          + ' WHERE PRODUTO = ' + IntToStr(dmMProvider.cdsItem_NFEntradaPRODUTO.Value);
              dmMSProcedure.fdspMaster.ExecProc;

              dmMSProcedure.fdspMaster.Params[0].Value := 'UPDATE PRODUTOFILIAL SET CUSTOBRUTO = ' + FloatToStr(cCusto_Bruto)
                                                          + ', CUSTOLIQUIDO = ' + FloatToStr(cCusto_Liquido)
                                                          + ', DESCONTONACOMPRA = ' + FloatToStr(cPerc_Deconto)
                                                          + ', VALORDODESCONTONACOMPRA = ' + FloatToStr(((dmMProvider.cdsItem_NFEntradaVALOR_DESCONTO.Value / dmMProvider.cdsItem_NFEntradaQUANTIDADE.Value) / dmMProvider.cdsItem_NFEntradaUNIDADEEMBALAGEM.Value))
                                                          + ', FRETE = ' + FloatToStr(cPerc_Frete) + ', VALORDOFRETE = ' + FloatToStr(dmMProvider.cdsItem_NFEntradaFRETE_RATEADO.Value)
                                                          + ', OUTROSCUSTOS = ' + FloatToStr(cPerc_Outras_Desp) + ', VALORDEOUTROSCUSTOS = ' + FloatToStr(dmMProvider.cdsItem_NFEntradaENCARGOS.Value)
                                                          + ', IPI = ' + FloatToStr(cPerc_Ipi) + ', VALORDOIPI = ' + FloatToStr(cValor_Ipi)
                                                          + ', CREDITODEICMS = ' + FloatToStr(cPerc_Icms) + ', VALORDOICMSR = ' + FloatToStr(cValor_ICMSR)
                                                          + ', VALORDOCREDITODEICMSR = ' + FloatToStr(cValor_Icms) + ', MENORPRECO = ' + FloatToStr(cMenor_Preco)
                                                          + ', PRECOCALCULADO = ' + FloatToStr(cPreco_Calculado) + ', PRECOPROVISORIO = ' + FloatToStr(cPreco_Calculado)
                                                          + ', ULTIMA_ENTRADA = ' + QuotedStr(FormatDateTime('mm/dd/yy', dmMProvider.cdsNFEntradaENTRADA.Value))
                                                          + ', ULTIMA_NF_ENTRADA = ' + QuotedStr(dmMProvider.cdsNFEntradaNOTAFISCAL.Value)
                                                          + ' WHERE PRODUTO = ' + IntToStr(dmMProvider.cdsItem_NFEntradaPRODUTO.Value)
                                                          + ' AND FILIAL = ' + IntToStr(dmDBEXMaster.iIdFilial);
              dmMSProcedure.fdspMaster.ExecProc;

              FormatSettings.DecimalSeparator := ',';

            end;

            dmMProvider.cdsItem_NFEntrada.Next;

          end;

        end;

    end;

    dmDBEXMaster.fdtMaster.Commit;
    dmDBEXMaster.fdcMaster.Close;;

  except
    on E: exception do
      Tratar_Erro_Conexao(E);
  end;

end;

procedure TfrmModNFEntrada.CalcularTotalItem;
var
  cValorTotaItem, cPercetualReducao, cValorIPI_Item, cValorBase, cValorICMS,
    cValorICMSR, cValorPIS, cValorCOFINS, cValorIsentas_NT, pDesconto,
    cValor_Oustras_Desp, pPerc_Outras_Desp, cValor_Frete, pPerc_Frete : Currency;
begin

  cValorTotaItem      := 0;
  cPercetualReducao   := 0;
  cValorIPI_Item      := 0;
  cValorBase          := 0;
  cValorICMS          := 0;
  cValorICMSR         := 0;
  cValorPIS           := 0;
  cValorCOFINS        := 0;
  cValorIsentas_NT    := 0;
  pDesconto           := 0;
  cValor_Oustras_Desp := 0;
  pPerc_Outras_Desp   := 0;
  cValor_Frete        := 0;
  pPerc_Frete         := 0;


  if dmMProvider.cdsNFEntrada.State in [dsEdit, dsInsert] then
    if dmMProvider.cdsItem_NFEntrada.Active then
    begin

      if (Length(Trim(dmMProvider.cdsNFEntradaPROTOCOLO_DANFE.Value)) <= 0) then
      begin

        cValorTotaItem          := (edtQuantidade.Value * edtValorUnitario.Value);
        edtValorTotalItem.Value := cValorTotaItem;

{
      backup
      if (dmMProvider.cdsNFEntradaDESCONTOGERAL.Value > 0) and (dmMProvider.cdsNFEntradaRATEAR_DESCONTO.Value = 1) and(edtDesconto.Value = 0) and (Length(Trim(dmMProvider.cdsNFEntradaPROTOCOLO_DANFE.Value)) <= 0) then
      begin

        pDesconto         := (dmMProvider.cdsNFEntradaVALORDOSPRODUTOS.Value) * 100;
        edtDesconto.Value := cValorTotaItem * (pDesconto / 100);

      end;
}

        if (dmMProvider.cdsNFEntradaDESCONTOGERAL.Value > 0)  then
        begin

          pDesconto         := (dmMProvider.cdsItem_NFEntradaSUB_TOTAL.Value /  dmMProvider.cdsNFEntradaVALORDOSPRODUTOS.Value);
          edtDesconto.Value := pDesconto * dmMProvider.cdsNFEntradaDESCONTOGERAL.Value;
          edtDesconto.Value := Arredondar(edtDesconto.Value,2);

        end
        else
        begin

         pDesconto         := 0;
         edtDesconto.Value := 0;

        end;

        if (dmMProvider.cdsNFEntradaOUTRASDESPESAS.Value > 0) then
        begin

          pPerc_Outras_Desp   := (dmMProvider.cdsItem_NFEntradaSUB_TOTAL.Value) / dmMProvider.cdsNFEntradaVALORDOSPRODUTOS.Value;
          cValor_Oustras_Desp := pPerc_Outras_Desp * dmMProvider.cdsNFEntradaOUTRASDESPESAS.Value;
          cValor_Oustras_Desp := Arredondar(cValor_Oustras_Desp,2);

        end
        else
        begin

          cValor_Oustras_Desp := 0;
          pPerc_Outras_Desp   := 0;

        end;

        edtEncargos.Value   := cValor_Oustras_Desp;

        if (dmMProvider.cdsNFEntradaVALORDOFRETE.Value > 0) then
        begin

          pPerc_Frete   := (dmMProvider.cdsItem_NFEntradaSUB_TOTAL.Value) / dmMProvider.cdsNFEntradaVALORDOSPRODUTOS.Value;
          cValor_Frete  := pPerc_Frete * dmMProvider.cdsNFEntradaVALORDOFRETE.Value;
          cValor_Frete  := Arredondar(cValor_Frete, 2);

        end
        else
        begin

          cValor_Frete  := 0;
          pPerc_Frete   := 0;

        end;

        cValorIsentas_NT    := edtDesconto.Value;

        if (Copy(Trim(edtCST_CSOSN.Text), 2, 2) = '20') or (Copy(Trim(edtCST_CSOSN.Text), 2, 2) = '70') and (edtAliqICMS_Item.Value > 0) then
        begin

          cPercetualReducao         := (7 / edtAliqICMS_Item.Value);
          cPercetualReducao         := cPercetualReducao * 100;
          edtRedBaseCalc_Item.Value := 100 - cPercetualReducao;

          if edtRedBaseCalc_Item.Value > 0 then
          begin

            cValorBase                  := edtValorTotalItem.Value - (edtValorTotalItem.Value * (edtRedBaseCalc_Item.Value / 100));
            edtBaseCalcICMS_Item.Value  := cValorBase;

            cValorIsentas_NT := cValorIsentas_NT + (edtValorTotalItem.Value - cValorBase);

          end;

          if (dmMProvider.cdsNFEntradaSOMAR_DESPACESS_BASEICMS.Value = 1) and (edtBaseCalcICMS_Item.Value = 0) then
            edtBaseCalcICMS_Item.Value := (cValorTotaItem + edtEncargos.Value) - edtDesconto.Value
          else if edtBaseCalcICMS_Item.Value = 0 then
            edtBaseCalcICMS_Item.Value := cValorTotaItem - edtDesconto.Value;

          if (edtBaseCalcICMS_Item.Value > 0) and (edtAliqICMS_Item.Value > 0)
          then
          begin

            cValorICMS              := edtBaseCalcICMS_Item.Value *(edtAliqICMS_Item.Value / 100);
            edtValorICMS_Item.Value := cValorICMS;

          end;

        end
        else if (Copy(Trim(edtCST_CSOSN.Text), 2, 2) = '20') then
        begin

          if (dmMProvider.cdsNFEntradaSOMAR_DESPACESS_BASEICMS.Value = 1) and (edtBaseCalcICMS_Item.Value = 0) then
            edtBaseCalcICMS_Item.Value := (cValorTotaItem + edtEncargos.Value) - edtDesconto.Value
          else if edtBaseCalcICMS_Item.Value = 0 then
            edtBaseCalcICMS_Item.Value := cValorTotaItem - edtDesconto.Value;

          cValorIsentas_NT          := cValorIsentas_NT + edtValorTotalItem.Value;
          edtRedBaseCalc_Item.Value := 100

        end
        else if (edtAliqICMS_Item.Value > 0) then
        begin

          if (dmMProvider.cdsNFEntradaSOMAR_DESPACESS_BASEICMS.Value = 1) and(edtBaseCalcICMS_Item.Value = 0) then
            edtBaseCalcICMS_Item.Value := (cValorTotaItem + edtEncargos.Value) - edtDesconto.Value
          else if edtBaseCalcICMS_Item.Value = 0 then
            edtBaseCalcICMS_Item.Value := cValorTotaItem - edtDesconto.Value;

          if (edtBaseCalcICMS_Item.Value > 0) and (edtAliqICMS_Item.Value > 0)
          then
          begin

            cValorICMS              := edtBaseCalcICMS_Item.Value * (edtAliqICMS_Item.Value / 100);
            edtValorICMS_Item.Value := cValorICMS;

          end;

        end;

        if (edtBasecalcIPI_Item.Value > 0) and (edtAliqIPI_Item.Value > 0) then
        begin

          cValorIPI_Item          := edtBasecalcIPI_Item.Value * (edtAliqIPI_Item.Value / 100);
          edtValorIPI_Item.Value  := cValorIPI_Item;

        end;

        if (edtBaseCalcICMSR_Item.Value > 0) and (edtAliqICMSR_Item.Value > 0) and (edtValorICMSR_Item.Value = 0) then
        begin

          cValorICMSR               := edtBaseCalcICMSR_Item.Value - edtBaseCalcICMS_Item.Value;
          cValorICMSR               := cValorICMSR * (edtAliqICMSR_Item.Value / 100);
          edtValorICMSR_Item.Value  := cValorICMSR;

        end;

        if (edtBaseCalcPIS.Value > 0) and (edtAliquotaPIS.Value > 0) then
        begin

          cValorPIS         := edtBaseCalcPIS.Value * (edtAliquotaPIS.Value / 100);
          edtValorPIS.Value := cValorPIS;

        end;

        if (edtBaseCalcCOFINS.Value > 0) and (edtAliquotaCOFINS.Value > 0) then
        begin

          cValorCOFINS          := edtBaseCalcCOFINS.Value * (edtAliquotaCOFINS.Value / 100);
          edtValorCOFINS.Value  := cValorCOFINS;

        end;

        edtValorIsentasNT.Value := cValorIsentas_NT;

        if (Copy(Trim(edtCST_CSOSN.Text), 2, 2) = '10') or (Copy(Trim(edtCST_CSOSN.Text), 2, 2) = '30')
          or (Copy(Trim(edtCST_CSOSN.Text), 2, 2) = '60') or (Copy(Trim(edtCST_CSOSN.Text), 2, 2) = '70')
          and ( dmMProvider.cdsNFEntradaVALORSUBSTITUICAO.Value > 0) and (edtBaseCalcICMSR_Item.Value = 0)then
        begin

          edtBaseCalcICMSR_Item.Value := ((edtBaseCalcICMS_Item.Value) * (1 + (0 / 100)));
          edtValorICMSR_Item.Value := edtBaseCalcICMSR_Item.Value * ((1 +  (edtAliqICMS_Item.Value / 100)) - edtValorICMS_Item.Value);

        end;

      end;

    end;

end;

function TfrmModNFEntrada.ChecarTotais: boolean;
var
  cTotalProduto, cTotalBC_Icms, cTotalValor_ICMS, cTotalBC_IcmsR,
    cTotalValor_ICMSR, cTotalDesconto, cTotalEncargos, cTotalIPI,
    cTotalFrete: Currency;
begin

  Result := True;

  if dmMProvider.cdsItem_NFEntrada.Active then
  begin

    Mensagem(false, dmDBEXMaster.sNomeUsuario + MSG_CHECAGEM_TOTAIS);

    cTotalProduto := 0;
    cTotalBC_Icms := 0;
    cTotalValor_ICMS := 0;
    cTotalBC_IcmsR := 0;
    cTotalValor_ICMSR := 0;
    cTotalDesconto := 0;
    cTotalEncargos := 0;
    cTotalIPI := 0;
    cTotalFrete := 0;

    // total dos produtos
    dmDBEXMaster.fdqMasterPesquisa.Close;
    dmDBEXMaster.fdqMasterPesquisa.SQL.Clear;
    dmDBEXMaster.fdqMasterPesquisa.SQL.Add
      ('select sum(coalesce(itemnfentrada.sub_total,0)) as TOTAL_PROD, sum(coalesce(base_icms,0)) as TOTAL_BC_ICMS,');
    dmDBEXMaster.fdqMasterPesquisa.SQL.Add
      ('sum(coalesce(valor_icms,0)) as TOTAL_ICMS, sum(coalesce(base_substituicao,0)) as TOTAL_ICMSR,');
    dmDBEXMaster.fdqMasterPesquisa.SQL.Add
      ('sum(coalesce(valor_substituicao,0)) as VALOR_ICMSR, sum(coalesce(valor_desconto,0)) as TOTAL_DESCONTO,');
    dmDBEXMaster.fdqMasterPesquisa.SQL.Add
      ('sum(coalesce(encargos,0)) as TOTAL_ENCARGOS, sum(coalesce(valor_ipi,0)) as TOTAL_IPI,');
    dmDBEXMaster.fdqMasterPesquisa.SQL.Add
      ('sum(coalesce(frete_rateado,0)) as TOTAL_FRETE');
    dmDBEXMaster.fdqMasterPesquisa.SQL.Add
      ('from itemnfentrada where nfentrada = ' +
      IntToStr(dmMProvider.cdsNFEntradaNFENTRADA.Value));

    dmDBEXMaster.fdqMasterPesquisa.Open;

    cTotalProduto := dmDBEXMaster.fdqMasterPesquisa.FieldByName
      ('TOTAL_PROD').Value;
    cTotalBC_Icms := dmDBEXMaster.fdqMasterPesquisa.FieldByName
      ('TOTAL_BC_ICMS').Value;
    cTotalValor_ICMS := dmDBEXMaster.fdqMasterPesquisa.FieldByName
      ('TOTAL_ICMS').Value;
    cTotalBC_IcmsR := dmDBEXMaster.fdqMasterPesquisa.FieldByName
      ('TOTAL_ICMSR').Value;
    cTotalValor_ICMSR := dmDBEXMaster.fdqMasterPesquisa.FieldByName
      ('VALOR_ICMSR').Value;
    cTotalDesconto := dmDBEXMaster.fdqMasterPesquisa.FieldByName
      ('TOTAL_DESCONTO').Value;
    cTotalEncargos := dmDBEXMaster.fdqMasterPesquisa.FieldByName
      ('TOTAL_ENCARGOS').Value;
    cTotalIPI := dmDBEXMaster.fdqMasterPesquisa.FieldByName('TOTAL_IPI').Value;
    cTotalFrete := dmDBEXMaster.fdqMasterPesquisa.FieldByName
      ('TOTAL_FRETE').Value;

    frmChecagemTotais := TfrmChecagemTotais.Create(self);

    frmChecagemTotais.memTotais.Clear;

    frmChecagemTotais.memTotais.Lines.Add
      ('DIVERGÊNCIAS ENCONTRADAS NO LANÇAMENTO');
    frmChecagemTotais.memTotais.Lines.Add
      ('--------------------------------------------------------------------------');
    frmChecagemTotais.memTotais.Lines.Add
      ('VALORES DA NOTA FISCAL                      | VALORES CALCULADOS');
    frmChecagemTotais.memTotais.Lines.Add
      ('==========================================================================');

    if cTotalProduto <> dmMProvider.cdsNFEntradaVALORDOSPRODUTOS.Value then
      frmChecagemTotais.memTotais.Lines.Add
        (Format('%-40.40s', ['VALOR DOS PRODUTOS...: ' + Format('%15.15s',
        [FormatFloat('#,##0.00', dmMProvider.cdsNFEntradaVALORDOSPRODUTOS.Value)
        ])]) + '    |   ' + Format('%15.15s',
        [FormatFloat('#,##0.00', cTotalProduto)]));

    if cTotalBC_Icms <> dmMProvider.cdsNFEntradaBASEICMS.Value then
      frmChecagemTotais.memTotais.Lines.Add
        (Format('%-40.40s', ['BASE DE CALCULO ICMS.: ' + Format('%15.15s',
        [FormatFloat('#,##0.00', dmMProvider.cdsNFEntradaBASEICMS.Value)])]) +
        '    |   ' + Format('%15.15s', [FormatFloat('#,##0.00',
        cTotalBC_Icms)]));

    if cTotalValor_ICMS <> dmMProvider.cdsNFEntradaVALORICMS.Value then
      frmChecagemTotais.memTotais.Lines.Add
        (Format('%-40.40s', ['VALOR DO ICMS........: ' + Format('%15.15s',
        [FormatFloat('#,##0.00', dmMProvider.cdsNFEntradaVALORICMS.Value)])]) +
        '    |   ' + Format('%15.15s', [FormatFloat('#,##0.00',
        cTotalValor_ICMS)]));

    if cTotalBC_IcmsR <> dmMProvider.cdsNFEntradaBASESUBSTITUICAO.Value then
      frmChecagemTotais.memTotais.Lines.Add
        (Format('%-40.40s', ['BASE DE CALCULO ICMSR: ' + Format('%15.15s',
        [FormatFloat('#,##0.00', dmMProvider.cdsNFEntradaBASESUBSTITUICAO.Value)
        ])]) + '    |   ' + Format('%15.15s',
        [FormatFloat('#,##0.00', cTotalBC_IcmsR)]));

    if cTotalValor_ICMSR <> dmMProvider.cdsNFEntradaVALORSUBSTITUICAO.Value then
      frmChecagemTotais.memTotais.Lines.Add
        (Format('%-40.40s', ['VALOR DO ICMSR.......: ' + Format('%15.15s',
        [FormatFloat('#,##0.00',
        dmMProvider.cdsNFEntradaVALORSUBSTITUICAO.Value)])]) + '    |   ' +
        Format('%15.15s', [FormatFloat('#,##0.00', cTotalValor_ICMSR)]));

    if cTotalDesconto <> dmMProvider.cdsNFEntradaDESCONTOGERAL.Value then
      frmChecagemTotais.memTotais.Lines.Add
        (Format('%-40.40s', ['VALOR DO DESCONTO....: ' + Format('%15.15s',
        [FormatFloat('#,##0.00', dmMProvider.cdsNFEntradaDESCONTOGERAL.Value)])]
        ) + '    |   ' + Format('%15.15s',
        [FormatFloat('#,##0.00', cTotalDesconto)]));

    if cTotalEncargos <> dmMProvider.cdsNFEntradaOUTRASDESPESAS.Value then
      frmChecagemTotais.memTotais.Lines.Add
        (Format('%-40.40s', ['VALOR DOS ENCARGOS...: ' + Format('%15.15s',
        [FormatFloat('#,##0.00', dmMProvider.cdsNFEntradaOUTRASDESPESAS.Value)])
        ]) + '    |   ' + Format('%15.15s',
        [FormatFloat('#,##0.00', cTotalEncargos)]));

    if cTotalIPI <> dmMProvider.cdsNFEntradaVALORDOIPI.Value then
      frmChecagemTotais.memTotais.Lines.Add
        (Format('%-40.40s', ['VALOR DO IPI.........: ' + Format('%15.15s',
        [FormatFloat('#,##0.00', dmMProvider.cdsNFEntradaVALORDOIPI.Value)])]) +
        '    |   ' + Format('%15.15s', [FormatFloat('#,##0.00', cTotalIPI)]));

    if cTotalFrete <> dmMProvider.cdsNFEntradaVALORDOFRETE.Value then
      frmChecagemTotais.memTotais.Lines.Add
        (Format('%-40.40s', ['VALOR DO FRETE.......: ' + Format('%15.15s',
        [FormatFloat('#,##0.00', dmMProvider.cdsNFEntradaVALORDOFRETE.Value)])])
        + '    |   ' + Format('%15.15s',
        [FormatFloat('#,##0.00', cTotalFrete)]));

    if frmChecagemTotais.memTotais.Lines.Count > 4 then
    begin

      LimparMSG_ERRO;
      frmChecagemTotais.ShowModal;

    end
    else
      Mensagem(false, dmDBEXMaster.sNomeUsuario + MSG_CHECAGEM_TOTAIS_OK);

    Result := frmChecagemTotais.memTotais.Lines.Count <= 4;

    FreeAndNil(frmChecagemTotais);

  end;

end;

{ function TfrmModNFEntrada.Consistir_OC_NFEntrada(pOrdemCompra: string): boolean;
  var
  i:integer;
  tsQuantidade, tsValorUnitario,  tsDesconto, tsItensARQ: TStringList;
  begin

  tsInconsistenciasOC := TStringList.Create;
  tsQuantidade        := TStringList.Create;
  tsValorUnitario     := TStringList.Create;
  tsDesconto          := TStringList.Create;
  tsItensARQ          := TStringList.Create;

  with ACBrNFe1.NotasFiscais.Items[0].NFe do
  begin

  if dmDBEXMaster.sqqPesqOrdemCompra.FieldByName('TOTALDOPEDIDO').Value <> Total.ICMSTot.vNF then
  begin

  tsInconsistenciasOC.Add('===> Valor total da nota difere do valor da ordem de compra');
  tsInconsistenciasOC.Add(' ');
  tsInconsistenciasOC.Add('     Valor Ordem de compra: ' + FormatFloat('##0.00',dmDBEXMaster.sqqPesqOrdemCompra.FieldByName('TOTALDOPEDIDO').Value));
  tsInconsistenciasOC.Add('     Valor da nota........: ' + FormatFloat('##0.00',Total.ICMSTot.vNF));
  tsInconsistenciasOC.Add('----------------------------------------------------------------------------------');

  end;

  Panel4.Visible := True;
  Panel4.Caption := 'Aguarde... consistindo parcelas ordem de compra';
  Application.ProcessMessages;

  dmDBEXMaster.sqqPesqParcelasOC.Close;
  dmDBEXMaster.sqqPesqParcelasOC.SQL.Clear;
  dmDBEXMaster.sqqPesqParcelasOC.SQL.Add('SELECT COUNT(*) AS QTD_PARCELAS FROM PARCELASORDEMCOMPRA');
  dmDBEXMaster.sqqPesqParcelasOC.SQL.Add('WHERE ORDEMCOMPRA = ' + pOrdemCompra);
  dmDBEXMaster.sqqPesqParcelasOC.Open;

  if dmDBEXMaster.sqqPesqParcelasOC.FieldByName('QTD_PARCELAS').Value <> Cobr.Dup.Count then
  begin

  tsInconsistenciasOC.Add('===> Quantidade de parcelas no arquivo difere da ordem de compra');
  tsInconsistenciasOC.Add('     Parcelas Ordem de compra: ' + IntToStr(dmDBEXMaster.sqqPesqParcelasOC.FieldByName('QTD_PARCELAS').Value));
  tsInconsistenciasOC.Add('     Parcelas no arquivo.....: ' + InttoStr(Cobr.Dup.Count));
  tsInconsistenciasOC.Add('----------------------------------------------------------------------------------');

  end
  else
  begin

  Panel4.Visible := True;
  Panel4.Caption := 'Aguarde... consistindo valor das parcelas';
  Application.ProcessMessages;

  dmDBEXMaster.sqqPesqParcelasOC.Close;
  dmDBEXMaster.sqqPesqParcelasOC.SQL.Clear;
  dmDBEXMaster.sqqPesqParcelasOC.SQL.Add('SELECT COALESCE(SUM(VALOR),0) AS VALOR_PARCELAS FROM PARCELASORDEMCOMPRA');
  dmDBEXMaster.sqqPesqParcelasOC.SQL.Add('WHERE ORDEMCOMPRA = ' + pOrdemCompra);
  dmDBEXMaster.sqqPesqParcelasOC.Open;

  if dmDBEXMaster.sqqPesqParcelasOC.FieldByName('VALOR_PARCELAS').Value <> Total.ICMSTot.vNF then
  begin

  tsInconsistenciasOC.Add('===> Valor das parcelas difere com valor total da nota');
  tsInconsistenciasOC.Add('     Valor das parcelas......: ' + FormatFloat('##0.00',dmDBEXMaster.sqqPesqParcelasOC.FieldByName('VALOR_PARCELAS').Value));
  tsInconsistenciasOC.Add('     Valor da nota...........: ' + FormatFloat('##0.00',Total.ICMSTot.vNF));
  tsInconsistenciasOC.Add('----------------------------------------------------------------------------------');

  end;

  end;

  dmDBEXMaster.sqqPesqParcelasOC.Close;

  Panel4.Visible := True;
  Panel4.Caption := 'Aguarde... consistindo itens ordem de compra';
  Application.ProcessMessages;

  dmDBEXMaster.sqqPesqItemOC.Close;
  dmDBEXMaster.sqqPesqItemOC.SQL.Clear;
  dmDBEXMaster.sqqPesqItemOC.SQL.Add('SELECT COUNT(*) AS QTD_ITENS FROM ITEMORDEMDECOMPRA');
  dmDBEXMaster.sqqPesqItemOC.SQL.Add('WHERE ORDEMCOMPRA = ' + pOrdemCompra);
  dmDBEXMaster.sqqPesqItemOC.Open;

  if dmDBEXMaster.sqqPesqItemOC.FieldByName('QTD_ITENS').Value <> Det.Count then
  begin

  tsInconsistenciasOC.Add('===> Quantidade de itens no arquivo difere da ordem de compra');
  tsInconsistenciasOC.Add('     Itens Ordem de compra: ' + IntToStr(dmDBEXMaster.sqqPesqItemOC.FieldByName('QTD_ITENS').Value));
  tsInconsistenciasOC.Add('     Itens no arquivo.....: ' + InttoStr(Det.Count));
  tsInconsistenciasOC.Add('----------------------------------------------------------------------------------');

  end
  else
  begin

  dmDBEXMaster.sqqPesqItemOC.Close;
  dmDBEXMaster.sqqPesqItemOC.SQL.Clear;
  dmDBEXMaster.sqqPesqItemOC.SQL.Add('SELECT * FROM ITEMORDEMDECOMPRA');
  dmDBEXMaster.sqqPesqItemOC.SQL.Add('WHERE ORDEMCOMPRA = ' + pOrdemCompra);
  dmDBEXMaster.sqqPesqItemOC.Open;

  for I := 0 to Det.Count - 1 do
  begin

  with Det.Items[i] do
  begin

  if Prod.cEAN = '' then
  begin

  if ValidarPesquisaReferencia(Prod.cProd, dmMaster.IBDFornecedoresFORNECEDOR.Value) then
  begin

  if dmDBEXMaster.sqqPesqItemOC.Locate('PRODUTO', dmMaster.IBDRefFornecedorPRODUTO.Value,[] ) then
  begin

  if dmDBEXMaster.sqqPesqItemOC.FieldByName('QUANTIDADE').Value <> PROD.qCom then
  tsQuantidade.Add('Item: ' + FormatFloat('000',i + 1) + '-' + Format('%-40.40s',[prod.xProd])
  + 'Qtd OC-> ' + FormatFloat('##0.000',dmDBEXMaster.sqqPesqItemOC.FieldByName('QUANTIDADE').Value)
  + ' * Qtd ARQ-> ' + FormatFloat('##0.000',PROD.qCom));
  if dmDBEXMaster.sqqPesqItemOC.FieldByName('VALORUNITARIO').Value <> PROD.vUnCom then
  tsValorUnitario.Add('Item: ' + FormatFloat('000',i + 1) + '-' + Format('%-40.40s',[prod.xProd])
  + 'Vlr OC->  ' + FormatFloat('##0.00',dmDBEXMaster.sqqPesqItemOC.FieldByName('VALORUNITARIO').Value)
  + ' * Vlr ARQ->  ' + FormatFloat('##0.00',PROD.vUnCom));

  if dmDBEXMaster.sqqPesqItemOC.FieldByName('DESCONTO').Value <> PROD.vDesc then
  tsDesconto.Add('Item: ' + FormatFloat('000',i + 1) + '-' + Format('%-40.40s',[prod.xProd])
  + 'Desc OC-> ' + FormatFloat('##0.00',dmDBEXMaster.sqqPesqItemOC.FieldByName('DESCONTO').Value)
  + ' * Desc ARQ-> ' + FormatFloat('##0.00',PROD.vDesc))

  end
  else
  tsItensARQ.Add('Item: ' + FormatFloat('000',(i + 1)) + '--> ' + Prod.xProd);

  end
  else
  tsItensARQ.Add('Item: ' + FormatFloat('000',(i + 1)) + '--> ' + Prod.xProd);

  end
  else
  begin
  end;

  end;

  end;

  end;

  end;

  dmDBEXMaster.sqqPesqItemOC.Close;
  dmDBEXMaster.sqqPesqOrdemCompra.Close;

  if tsQuantidade.Count > 0 then
  begin

  tsInconsistenciasOC.Add('ITENS COM DIVERGÊNCIAS NAS QUANTIDADES');
  tsInconsistenciasOC.Add(' ');
  tsInconsistenciasOC.AddStrings(tsQuantidade);
  tsInconsistenciasOC.Add('----------------------------------------------------------------------------------');

  end;

  if tsValorUnitario.Count > 0 then
  begin

  tsInconsistenciasOC.Add('ITENS COM DIVERGÊNCIAS NOS VALORES UNITARIOS');
  tsInconsistenciasOC.Add(' ');
  tsInconsistenciasOC.AddStrings(tsValorUnitario);
  tsInconsistenciasOC.Add('----------------------------------------------------------------------------------');

  end;

  if tsDesconto.Count > 0 then
  begin

  tsInconsistenciasOC.Add('ITENS COM DIVERGÊNCIAS NOS DESCONTOS UNITARIOS');
  tsInconsistenciasOC.Add(' ');
  tsInconsistenciasOC.AddStrings(tsDesconto);
  tsInconsistenciasOC.Add('----------------------------------------------------------------------------------');

  end;

  if tsItensARQ.Count > 0 then
  begin

  tsInconsistenciasOC.Add('ITENS QUE NÃO CONSTAM NA ORDEM DE COMPRA');
  tsInconsistenciasOC.Add(' ');
  tsInconsistenciasOC.AddStrings(tsItensARQ);
  tsInconsistenciasOC.Add('----------------------------------------------------------------------------------');

  end;

  tsDesconto.Free;
  tsQuantidade.Free;
  tsValorUnitario.Free;
  tsItensARQ.Free;

  end;
}
procedure TfrmModNFEntrada.edtAliqCOFINSValorExit(Sender: TObject);
begin

  MudarCorEdit(Sender);

  try

    if dmMProvider.cdsNFEntrada.State in [dsEdit, dsInsert] then
      if dmMProvider.cdsItem_NFEntrada.Active then
      begin

        Man_Tab_ItemNFEntrada(0, dmMProvider.cdsNFEntradaNFENTRADA.Value, 0);
        RelacionarItens_NFE(dmMProvider.cdsNFEntradaNFENTRADA.Value, True);
        LimparCampos;

      end;

    edtReferencia.SetFocus;

  except

  end;

end;

procedure TfrmModNFEntrada.edtAliqCredSimplesKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = FormatoUS.DecimalSeparator then
    Key := FormatoBR.DecimalSeparator;

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end;

end;

procedure TfrmModNFEntrada.edtAliqICMS_ItemExit(Sender: TObject);
begin

  MudarCorEdit(Sender);
  CalcularTotalItem;

end;

procedure TfrmModNFEntrada.edtAliqIPI_ItemExit(Sender: TObject);
begin

  MudarCorEdit(Sender);
  CalcularTotalItem;

end;

procedure TfrmModNFEntrada.edtBaseCalcICMS_ItemExit(Sender: TObject);
begin

  MudarCorEdit(Sender);
  CalcularTotalItem;

end;

procedure TfrmModNFEntrada.edtCFOPExit(Sender: TObject);
begin

  MudarCorEdit(Sender);
  LimparMSG_ERRO;

  if dmMProvider.cdsNFEntrada.State in [dsEdit, dsInsert] then
  begin

    if Length(Trim(edtCFOP.Text)) > 0 then
    begin

      if dmMProvider.cdsItem_NFEntrada.Active then
      begin

        dmDBEXMaster.fdqCFOP_NF_Entrada.Close;
        dmDBEXMaster.fdqCFOP_NF_Entrada.SQL.Clear;
        dmDBEXMaster.fdqCFOP_NF_Entrada.SQL.Add('SELECT * FROM CFOP_NFENTRADA');
        dmDBEXMaster.fdqCFOP_NF_Entrada.SQL.Add
          ('WHERE CFOP = ' + QuotedStr(Trim(edtCFOP.Text)));
        dmDBEXMaster.fdqCFOP_NF_Entrada.SQL.Add('ORDER BY CFOP');
        dmDBEXMaster.fdqCFOP_NF_Entrada.Open;

        if dmDBEXMaster.fdqCFOP_NF_Entrada.IsEmpty then
        begin

          Mensagem(false, dmDBEXMaster.sNomeUsuario +
            MSG_CONSISTE_CFOP_ITEM_NF);
          edtCFOP.SetFocus;

        end;

        dmDBEXMaster.fdqCFOP_NF_Entrada.Close;

      end;

    end;

  end;

end;

procedure TfrmModNFEntrada.edtCFOP_EntradaExit(Sender: TObject);
var
  sCfop: string;
begin

  MudarCorEdit(Sender);

  if dmMProvider.cdsNFEntrada.State in [dsEdit, dsInsert] then
  begin

    if Length(Trim(edtCFOP_Entrada.Text)) > 0 then
    begin

      sCfop := '';

      try

        if Trim(edtCFOP_Entrada.Text)[1] = '-' then
        begin

          sCfop := Trim(Copy(edtCFOP_Entrada.Text, 2, Length(edtCFOP_Entrada.Text)));

          Man_Tab_CFOP_Entrada(1, dmMProvider.cdsNFEntradaNFENTRADA.Value, sCfop);

          RelacionarCFOP_NFE(dmMProvider.cdsNFEntradaNFENTRADA.Value);

          edtCFOP_Entrada.Clear;
          edtCFOP_Entrada.SetFocus;

        end
        else
        begin

          dmDBEXMaster.fdqCFOP_CFPS.Close;
          dmDBEXMaster.fdqCFOP_CFPS.SQL.Clear;
          dmDBEXMaster.fdqCFOP_CFPS.SQL.Add('select * from cfop');
          dmDBEXMaster.fdqCFOP_CFPS.SQL.Add('where cfop = ' + QuotedStr(Trim(edtCFOP_Entrada.Text)));
          dmDBEXMaster.fdqCFOP_CFPS.Open;

          if dmDBEXMaster.fdqCFOP_CFPS.IsEmpty then
          begin

            Mensagem(false, dmDBEXMaster.sNomeUsuario + ', ' + MSG_PESQUISA + ' - ' + edtCFOP_Entrada.Text);
            dmDBEXMaster.fdqCFOP_CFPS.Close;
            edtCFOP_Entrada.SetFocus;
            exit;

          end
          else
          begin

{            if Trim(dmMProvider.cdsNFEntradaUF_EMITENTE.Value) = dmMProvider.cdsFilialESTADO.Value then
              sCfop := dmDBEXMaster.fdqCFOP_CFPS.FieldByName('CFOP_ENTRADA_ESTADUAL').Value
            else
            begin

              if Trim(edtCFOP_Entrada.Text[1]) = '5' then
              begin

                Mensagem(false, dmDBEXMaster.sNomeUsuario + ', ' + MSG_CFOP_INCOMP_ESTADO);
                edtCFOP_Entrada.SetFocus;
                exit;

              end
              else
                sCfop := dmDBEXMaster.fdqCFOP_CFPS.FieldByName('CFOP_ENTRADA_INTERESTADUAL').Value;
            end;
}
            Man_Tab_NFEntrada(0);
            Man_Tab_CFOP_Entrada(0,
              dmMProvider.cdsNFEntradaNFENTRADA.Value, sCfop);

            RelacionarCFOP_NFE(dmMProvider.cdsNFEntradaNFENTRADA.Value);

            edtCFOP_Entrada.Clear;
            edtCFOP_Entrada.SetFocus;

          end;

        end;
      except
        on E: exception do
          Tratar_Erro_Conexao(E);

      end;

    end;

  end;

end;

procedure TfrmModNFEntrada.edtCNPJFreteEnter(Sender: TObject);
begin

  MudarCorEdit(Sender);

  if dmMProvider.cdsConhecimentoFrete.IsEmpty then
    dmMProvider.cdsConhecimentoFrete.Append;

end;

procedure TfrmModNFEntrada.edtCNPJFreteExit(Sender: TObject);
begin

  MudarCorEdit(Sender);
  LimparMSG_ERRO;

  if dmMProvider.cdsNFEntrada.State in [dsEdit, dsInsert] then
  begin

    if Length(Trim(edtCNPJFrete.Text)) > 0 then
    begin

      if ValidarCnpjCpf(Trim(dmMProvider.cdsConhecimentoFreteCNPJ.Value)) then
      begin

        dmDBEXMaster.fdqFornecedor.Close;
        dmDBEXMaster.fdqFornecedor.SQL.Clear;
        dmDBEXMaster.fdqFornecedor.SQL.Add('select * from fornecedor');
        dmDBEXMaster.fdqFornecedor.SQL.Add('where cnpj = ' + QuotedStr(dmMProvider.cdsConhecimentoFreteCNPJ.Value));
        dmDBEXMaster.fdqFornecedor.Open;

        if dmDBEXMaster.fdqFornecedor.IsEmpty then
        begin

          Mensagem(false, dmDBEXMaster.sNomeUsuario + MSG_PESQUISA + ' - ' +  edtCNPJFrete.Text);
          edtCNPJFrete.SetFocus;

        end;

        dmDBEXMaster.fdqFornecedor.Close;

      end
      else
      begin

        dmDBEXMaster.fdqFornecedor.Close;
        Mensagem(false, dmDBEXMaster.sNomeUsuario + MSG_CNPJ_INVALIDO + ' - ' + edtCNPJFrete.Text);
        edtCNPJFrete.SetFocus;

      end;

    end;

  end;

end;

procedure TfrmModNFEntrada.edtCodigoGTINExit(Sender: TObject);
begin

  MudarCorEdit(Sender);
  LimparMSG_ERRO;

  try

    if dmMProvider.cdsNFEntrada.State in [dsEdit, dsInsert] then
    begin

      if Length(Trim(edtCodigoGTIN.Text)) = 0 then
      begin

        frmPesquisaProduto := TfrmPesquisaProduto.Create(self);

        if frmPesquisaProduto.ShowModal = mrOk then
        begin

          if not dmMProvider.cdsProdutos.IsEmpty then
          begin

            dmDBEXMaster.fdqProdutos.Open;

            dmDBEXMaster.fdqProdutoFilial.Close;
            dmDBEXMaster.fdqProdutoFilial.SQL.Clear;
            dmDBEXMaster.fdqProdutoFilial.SQL.Add('select * from produtofilial');
            dmDBEXMaster.fdqProdutoFilial.SQL.Add('where produto = ' + IntToStr(dmMProvider.cdsProdutosPRODUTO.Value));
            dmDBEXMaster.fdqProdutoFilial.Open;

            if not dmDBEXMaster.fdqProdutoFilial.IsEmpty then
            begin

              PreencherCampos;
              edtCST_CSOSN.SetFocus;
              dmDBEXMaster.fdqProdutos.Close;
              dmDBEXMaster.fdqProdutoFilial.Close;

            end
            else
            begin

              Mensagem(True, dmDBEXMaster.sNomeUsuario + MSG_CONSISTE_PRODUTO_PRODFIL
                          + ' Produto: ' + IntToStr(dmDBEXMaster.fdqReferenciaFornecedor.FieldByName('PRODUTO').Value));

              dmMProvider.cdsProdutos.Close;
              dmDBEXMaster.fdqProdutoFilial.Close;
              dmDBEXMaster.fdqProdutos.Close;

              edtCodigoGTIN.SetFocus;

            end;

          end;

        end;

      end
      else if Length(Trim(edtCodigoGTIN.Text)) <= 7 then
      begin

        dmDBEXMaster.fdqProdutos.Close;

        dmDBEXMaster.fdqProdutos.SQL.Clear;
        dmDBEXMaster.fdqProdutos.SQL.Add('select * from produto');
        dmDBEXMaster.fdqProdutos.SQL.Add('where produto = ' + Trim(edtCodigoGTIN.Text));
        dmDBEXMaster.fdqProdutos.Open;

        if not dmDBEXMaster.fdqProdutos.IsEmpty then
        begin

          dmDBEXMaster.fdqProdutoFilial.Close;
          dmDBEXMaster.fdqProdutoFilial.SQL.Clear;
          dmDBEXMaster.fdqProdutoFilial.SQL.Add('select * from produtofilial');
          dmDBEXMaster.fdqProdutoFilial.SQL.Add('where produto = ' + IntToStr(dmDBEXMaster.fdqProdutos.FieldByName('PRODUTO').Value));
          dmDBEXMaster.fdqProdutoFilial.Open;

          if not dmDBEXMaster.fdqProdutoFilial.IsEmpty then
          begin

            PreencherCampos;
            edtCST_CSOSN.SetFocus;
            dmDBEXMaster.fdqProdutos.Close;
            dmDBEXMaster.fdqProdutoFilial.Close;

          end
          else
          begin

            Mensagem(True, dmDBEXMaster.sNomeUsuario +  MSG_CONSISTE_PRODUTO_PRODFIL
                        + ' Produto: ' + IntToStr(dmDBEXMaster.fdqReferenciaFornecedor.FieldByName('PRODUTO').Value));

            dmDBEXMaster.fdqProdutos.Close;
            dmDBEXMaster.fdqProdutoFilial.Close;

            edtCodigoGTIN.SetFocus;

          end;

        end
        else
        begin

          Mensagem(True, dmDBEXMaster.sNomeUsuario + MSG_PESQUISA + ' Produto: ' + edtCodigoGTIN.Text);

          dmDBEXMaster.fdqProdutos.Close;
          edtCodigoGTIN.SetFocus;

        end;

      end
      else if Length(Trim(edtCodigoGTIN.Text)) > 7 then
      begin

        dmDBEXMaster.fdqBarras.Close;
        dmDBEXMaster.fdqBarras.SQL.Clear;
        dmDBEXMaster.fdqBarras.SQL.Add('select * from barras');
        dmDBEXMaster.fdqBarras.SQL.Add('where barras = ' + QuotedStr(Trim(edtCodigoGTIN.Text)));
        dmDBEXMaster.fdqBarras.Open;

        if not dmDBEXMaster.fdqBarras.IsEmpty then
        begin

          dmDBEXMaster.fdqProdutos.Close;
          dmDBEXMaster.fdqProdutos.SQL.Clear;
          dmDBEXMaster.fdqProdutos.SQL.Add('select * from produto');
          dmDBEXMaster.fdqProdutos.SQL.Add('where produto = ' + IntToStr(dmDBEXMaster.fdqBarras.FieldByName('PRODUTO').Value));
          dmDBEXMaster.fdqProdutos.Open;

          dmDBEXMaster.fdqBarras.Close;

          if not dmDBEXMaster.fdqProdutos.IsEmpty then
          begin

            dmDBEXMaster.fdqProdutoFilial.Close;
            dmDBEXMaster.fdqProdutoFilial.SQL.Clear;
            dmDBEXMaster.fdqProdutoFilial.SQL.Add('select * from produtofilial');
            dmDBEXMaster.fdqProdutoFilial.SQL.Add('where produto = ' + IntToStr(dmDBEXMaster.fdqProdutos.FieldByName('PRODUTO').Value));
            dmDBEXMaster.fdqProdutoFilial.Open;

            if not dmDBEXMaster.fdqProdutoFilial.IsEmpty then
            begin

              PreencherCampos;
              edtCST_CSOSN.SetFocus;
              dmDBEXMaster.fdqBarras.Close;
              dmDBEXMaster.fdqProdutos.Close;
              dmDBEXMaster.fdqProdutoFilial.Close;

            end
            else
            begin

              Mensagem(True, dmDBEXMaster.sNomeUsuario + MSG_CONSISTE_PRODUTO_PRODFIL
                          + ' Produto: ' + IntToStr(dmDBEXMaster.fdqReferenciaFornecedor.FieldByName('PRODUTO').Value));

              dmDBEXMaster.fdqBarras.Close;
              dmDBEXMaster.fdqProdutos.Close;
              dmDBEXMaster.fdqProdutoFilial.Close;

              edtCodigoGTIN.SetFocus;

            end;

          end
          else
          begin

            Mensagem(True, dmDBEXMaster.sNomeUsuario + MSG_CONSISTE_BARRAS_PRODUTO
                          + ' Produto: ' + IntToStr(dmDBEXMaster.fdqBarras.FieldByName('PRODUTO').Value));

            dmDBEXMaster.fdqBarras.Close;
            dmDBEXMaster.fdqProdutos.Close;
            dmDBEXMaster.fdqProdutoFilial.Close;

            edtCodigoGTIN.SetFocus;

          end;

        end
        else
        begin

          Mensagem(True, dmDBEXMaster.sNomeUsuario + MSG_PESQUISA + ' - ' + edtCodigoGTIN.Text);

          dmDBEXMaster.fdqBarras.Close;
          edtCodigoGTIN.SetFocus;

        end;

      end;

    end;

  except
    on E: exception do
      Tratar_Erro_Conexao(E);

  end;

end;

procedure TfrmModNFEntrada.edtConteudoPesquisaEnter(Sender: TObject);
begin

  MudarCorEdit(Sender);

end;

procedure TfrmModNFEntrada.edtConteudoPesquisaExit(Sender: TObject);
begin

  LimparMSG_ERRO;

  if (Length(Trim(edtConteudoPesquisa.Text)) > 0) or
    (rdpOpcoesPesquisa.ItemIndex > 1) then
  begin

    OcultarAbas(false);

    Mensagem(false, dmDBEXMaster.sNomeUsuario + ', aguarde...');

    if AbrirTabelaNFEntrada(rdpOpcoesPesquisa.ItemIndex,
      edtConteudoPesquisa.Text) then
    begin

      grdTabela.SetFocus;
      RelacionarCFOP_NFE(dmMProvider.cdsNFEntradaNFENTRADA.Value);
      RelacionarParcelas_NFE(dmMProvider.cdsNFEntradaNFENTRADA.Value);
      RelacionarFrete_NFE(dmMProvider.cdsNFEntradaNFENTRADA.Value);
      RelacionarItens_NFE(dmMProvider.cdsNFEntradaNFENTRADA.Value, false);

      LimparMSG_ERRO;

    end
    else
      edtConteudoPesquisa.SetFocus;

    edtConteudoPesquisa.Clear;
    MudarCorEdit(Sender);

  end;

end;

procedure TfrmModNFEntrada.edtConteudoPesquisaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  iDirecao: Integer;
begin

  // habilita movimentação dos campos com as setas acima/abaixo
  iDirecao := -1;

  case Key of

    VK_DOWN:
      iDirecao := 0; { Próximo }
    VK_UP:
      iDirecao := 1; { Anterior }

  end;

  if iDirecao <> -1 then
  begin

    Perform(WM_NEXTDLGCTL, iDirecao, 0);
    Key := 0;

  end;

end;

procedure TfrmModNFEntrada.edtConteudoPesquisaKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end;

end;

procedure TfrmModNFEntrada.edtCSTCOFINSExit(Sender: TObject);
begin

  MudarCorEdit(Sender);
  LimparMSG_ERRO;

  if dmMProvider.cdsItem_NFEntrada.Active then
    if Length(Trim(edtCSTCOFINS.Text)) > 0 then
    begin

      if Validar_CST_COFINS(IntToStr(StrToInt(Trim(edtCSTCOFINS.Text)))) then
        edtCSTCOFINS.Text := FormatFloat('00',
          StrToFloat(Trim(edtCSTCOFINS.Text)))
      else
      begin

        Mensagem(false, dmDBEXMaster.sNomeUsuario + MSG_PESQUISA);
        edtCSTCOFINS.SetFocus;

      end;

    end;

end;

procedure TfrmModNFEntrada.edtCSTPISExit(Sender: TObject);
begin

  MudarCorEdit(Sender);
  LimparMSG_ERRO;

  if dmMProvider.cdsItem_NFEntrada.Active then
    if Length(Trim(edtCSTPIS.Text)) > 0 then
    begin

      if Validar_CST_PIS(IntToStr(StrToInt(Trim(edtCSTPIS.Text)))) then
        edtCSTPIS.Text := FormatFloat('00', StrToFloat(Trim(edtCSTPIS.Text)))
      else
      begin

        Mensagem(false, dmDBEXMaster.sNomeUsuario + MSG_PESQUISA);
        edtCSTPIS.SetFocus;

      end;

    end;

end;

procedure TfrmModNFEntrada.edtCST_CSOSNExit(Sender: TObject);
begin

  MudarCorEdit(Sender);
  LimparMSG_ERRO;

  if dmMProvider.cdsNFEntrada.State in [dsEdit, dsInsert] then
    if dmMProvider.cdsItem_NFEntrada.Active then
      if Length(Trim(edtCST_CSOSN.Text)) > 0 then
      begin

        dmDBEXMaster.fdqCST_CSOSN.Close;

        dmDBEXMaster.fdqCST_CSOSN.SQL.Clear;
        dmDBEXMaster.fdqCST_CSOSN.SQL.Add('select * from cst');
        dmDBEXMaster.fdqCST_CSOSN.SQL.Add
          ('where cst = ' + QuotedStr(FormatFloat('000',
          StrToFloat(Trim(edtCST_CSOSN.Text)))));
        dmDBEXMaster.fdqCST_CSOSN.Open;

        // verifica se a cst/csosn está cadastrada
        if not dmDBEXMaster.fdqCST_CSOSN.IsEmpty then
        begin

          // verifica se a cst/csosn é compatívelcom regime tributário da empresa
          if Validar_CSTCSOSN(FormatFloat('000',
            StrToFloat(Trim(edtCST_CSOSN.Text))), dmMProvider.cdsFilialCRT.Value)
          then
            edtCST_CSOSN.Text :=
              FormatFloat('000', StrToFloat(Trim(edtCST_CSOSN.Text)))
          else
          begin

            Mensagem(false, dmDBEXMaster.sNomeUsuario +
              MSG_CONSISTE_CST_CSOSN_CRT);
            edtCST_CSOSN.SetFocus;

          end;

        end
        else
        begin

          dmDBEXMaster.fdqCST_CSOSN.Close;

          Mensagem(false, dmDBEXMaster.sNomeUsuario + MSG_PESQUISA);
          edtCST_CSOSN.SetFocus;

        end;

      end;

end;

procedure TfrmModNFEntrada.edtDataEmissaoExit(Sender: TObject);
begin

  LimparMSG_ERRO;

  MudarCorEdit(Sender);

  if dmMProvider.cdsNFEntrada.State in [dsEdit, dsInsert] then
  begin

    if Length(Trim(dmDBEXMaster.sMSG_Erro)) > 0 then
    begin

      Mensagem(True, dmDBEXMaster.sNomeUsuario + dmDBEXMaster.sMSG_Erro);
      edtDataEmissao.SetFocus;

    end;

  end;

  dmDBEXMaster.sMSG_Erro := '';

end;

procedure TfrmModNFEntrada.edtDataSaidaExit(Sender: TObject);
begin

  LimparMSG_ERRO;

  MudarCorEdit(Sender);

  if dmMProvider.cdsNFEntrada.State in [dsEdit, dsInsert] then
  begin

    if dmMProvider.cdsNFEntradaSAIDA.Value < dmMProvider.cdsNFEntradaEMISSAO.Value
    then
    begin

      Mensagem(True, dmDBEXMaster.sNomeUsuario + MSG_CONSISTE_SAIDA_EMISSAO);
      edtDataSaida.SetFocus;

    end
    else
    begin

      if Length(Trim(dmDBEXMaster.sMSG_Erro)) > 0 then
      begin

        Mensagem(True, dmDBEXMaster.sNomeUsuario + dmDBEXMaster.sMSG_Erro);
        edtDataSaida.SetFocus;

      end;

    end;

  end;

  dmDBEXMaster.sMSG_Erro := '';

end;

procedure TfrmModNFEntrada.edtEntradaExit(Sender: TObject);
begin

  LimparMSG_ERRO;

  MudarCorEdit(Sender);

  if dmMProvider.cdsNFEntrada.State in [dsEdit, dsInsert] then
  begin

    if dmMProvider.cdsNFEntradaENTRADA.Value < dmMProvider.cdsNFEntradaEMISSAO.Value
    then
    begin

      Mensagem(True, dmDBEXMaster.sNomeUsuario + MSG_CONSISTE_ENTRADA_EMISSAO);
      edtEntrada.SetFocus;

    end
    else if dmMProvider.cdsNFEntradaENTRADA.Value <
      dmMProvider.cdsNFEntradaSAIDA.Value then
    begin

      Mensagem(True, dmDBEXMaster.sNomeUsuario + MSG_CONSISTE_ENTRADA_SAIDA);
      edtEntrada.SetFocus;

    end
    else
    begin

      if Length(Trim(dmDBEXMaster.sMSG_Erro)) > 0 then
      begin

        Mensagem(True, dmDBEXMaster.sNomeUsuario + dmDBEXMaster.sMSG_Erro);
        edtEntrada.SetFocus;

      end;

    end;

  end;

  dmDBEXMaster.sMSG_Erro := '';

end;

procedure TfrmModNFEntrada.edtNumeroDocumentoExit(Sender: TObject);
var
  sDocumento: string;
begin

  MudarCorEdit(Sender);

  if dmMProvider.cdsNFEntrada.State in [dsEdit, dsInsert] then
  begin

    if Length(Trim(edtNumeroDocumento.Text)) > 0 then
    begin

      sDocumento := '';

      try

        if Trim(edtNumeroDocumento.Text)[1] = '-' then
        begin

          sDocumento := Trim(Copy(edtNumeroDocumento.Text, 2,
            Length(edtNumeroDocumento.Text)));

          Man_Tab_Parcelas_NFE(1, dmMProvider.cdsNFEntradaNFENTRADA.Value,
            dmMProvider.cdsParcelasNFEDOCUMENTO.Value,
            dmMProvider.cdsParcelasNFEVENCIMENTO.Value,
            dmMProvider.cdsParcelasNFEVALOR.Value);

          RelacionarParcelas_NFE(dmMProvider.cdsNFEntradaNFENTRADA.Value);

          edtNumeroDocumento.Clear;
          edtNumeroDocumento.SetFocus;

        end;

      except
        on E: exception do
          Tratar_Erro_Conexao(E);

      end;

    end
    else
      memObservacos.SetFocus;

  end;

end;

procedure TfrmModNFEntrada.edtNumeroNFExit(Sender: TObject);
begin

  MudarCorEdit(Sender);

end;

procedure TfrmModNFEntrada.edtProtocoloNFEExit(Sender: TObject);
begin

  LimparMSG_ERRO;
  MudarCorEdit(Sender);

  if dmMProvider.cdsNFEntrada.State in [dsEdit, dsInsert] then
  begin

    if not ValidarCampos then
      edtProtocoloNFE.SetFocus;

  end;

end;

procedure TfrmModNFEntrada.edtProtocoloNFEKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end
  else if not(Key in ['0' .. '9', Chr(8)]) then
    Key := #0;

end;

procedure TfrmModNFEntrada.edtRedBaseCalc_ItemExit(Sender: TObject);
begin

  MudarCorEdit(Sender);
  CalcularTotalItem;

end;

procedure TfrmModNFEntrada.edtReferenciaExit(Sender: TObject);
var
  sReferencia: string;
begin

  MudarCorEdit(Sender);
  LimparMSG_ERRO;

  if dmMProvider.cdsNFEntrada.Active then
  begin

    if not dmMProvider.cdsNFEntrada.IsEmpty then
    begin

      if Length(Trim(edtReferencia.Text)) > 0 then
      begin

        // (*) opção para trocar a referencia de produto
        if edtReferencia.Text[1] = '*' then
        begin

          lblMsg.Tag          := ord(TrocarReferencia);
          Mensagem(True, dmDBEXMaster.sNomeUsuario + MSG_TROCAR_REFERENCIA_PROD);

          edtReferencia.Text  := Trim(Copy(edtReferencia.Text, 2, Length(edtReferencia.Text)));
          Application.ProcessMessages;
          edtReferencia.SetFocus;

        end
        else
        begin

          if (dmMProvider.cdsConfiguracoesUSAR_CAMPO_COMPLE_PESQUISA_NFE.Value = 1) then
          begin

            if not Pesquisar_Complemento(sReferencia) then
            begin

              Mensagem(true, dmDBEXMaster.sNomeUsuario + MSG_PESQUISA);
              dmDBEXMaster.fdqMasterPesquisa.Close;
              edtReferencia.SetFocus;
              edtReferencia.SelectAll;

            end
            else
            begin

              dmDBEXMaster.fdqProdutos.Close;

              dmDBEXMaster.fdqProdutos.SQL.Clear;
              dmDBEXMaster.fdqProdutos.SQL.Add('select * from produto');
              dmDBEXMaster.fdqProdutos.SQL.Add('where produto = ' + IntToStr(dmDBEXMaster.fdqMasterPesquisa.FieldByName('PRODUTO').Value));
              dmDBEXMaster.fdqProdutos.Open;

              sReferencia := IntToStr(dmDBEXMaster.fdqMasterPesquisa.FieldByName('PRODUTO').Value);

              dmDBEXMaster.fdqMasterPesquisa.Close;

            end;
          end
          else
          begin

            dmDBEXMaster.fdqReferenciaFornecedor.Close;

            dmDBEXMaster.fdqReferenciaFornecedor.SQL.Clear;
            dmDBEXMaster.fdqReferenciaFornecedor.SQL.Add('select produto from referenciafornecedor');
            dmDBEXMaster.fdqReferenciaFornecedor.SQL.Add('where referencia = ' + QuotedStr(Trim(edtReferencia.Text)));
            dmDBEXMaster.fdqReferenciaFornecedor.SQL.Add('and fornecedor = ' + IntToStr(dmMProvider.cdsNFEntradaFORNECEDOR.Value));
            dmDBEXMaster.fdqReferenciaFornecedor.Open;

            if dmDBEXMaster.fdqReferenciaFornecedor.IsEmpty then
            begin

              dmDBEXMaster.fdqReferenciaFornecedor.Close;
              dmDBEXMaster.fdqProdutos.Close;

              lblMsg.Tag := ord(RelacionarReferencia);
              Mensagem(True, dmDBEXMaster.sNomeUsuario + MSG_CONSISTE_RE_FOR__PRODUTO);
              edtReferencia.SetFocus;
              exit;

            end
            else
              sReferencia := IntToStr(dmDBEXMaster.fdqReferenciaFornecedor.FieldByName('PRODUTO').Value);

          end;

          dmDBEXMaster.fdqProdutos.Close;
          dmDBEXMaster.fdqProdutos.SQL.Clear;
          dmDBEXMaster.fdqProdutos.SQL.Add('select * from produto');
          dmDBEXMaster.fdqProdutos.SQL.Add('where produto = ' + sReferencia);
          dmDBEXMaster.fdqProdutos.Open;

          dmDBEXMaster.fdqReferenciaFornecedor.Close;

          if not dmDBEXMaster.fdqProdutos.IsEmpty then
          begin

            dmDBEXMaster.fdqProdutoFilial.Close;
            dmDBEXMaster.fdqProdutoFilial.SQL.Clear;
            dmDBEXMaster.fdqProdutoFilial.SQL.Add('select * from produtofilial');
            dmDBEXMaster.fdqProdutoFilial.SQL.Add('where produto = ' + IntToStr(dmDBEXMaster.fdqProdutos.FieldByName('PRODUTO').Value));
            dmDBEXMaster.fdqProdutoFilial.Open;

            if not dmDBEXMaster.fdqProdutoFilial.IsEmpty then
            begin

              PreencherCampos;
              edtCST_CSOSN.SetFocus;
              dmDBEXMaster.fdqProdutos.Close;
              dmDBEXMaster.fdqProdutoFilial.Close;

            end
            else
            begin

              Mensagem(True, dmDBEXMaster.sNomeUsuario +  MSG_CONSISTE_PRODUTO_PRODFIL
                          + ' Produto: ' + IntToStr(dmDBEXMaster.fdqReferenciaFornecedor.FieldByName('PRODUTO').Value));

              dmDBEXMaster.fdqProdutos.Close;
              dmDBEXMaster.fdqProdutoFilial.Close;

              edtReferencia.SetFocus;

            end;

          end
          else
          begin

            Mensagem(True, dmDBEXMaster.sNomeUsuario + MSG_CONSISTE_REFER_PRODUTO
                      + ' Produto: ' + IntToStr(dmDBEXMaster.fdqReferenciaFornecedor.FieldByName('PRODUTO').Value));

            dmDBEXMaster.fdqProdutos.Close;
            dmDBEXMaster.fdqProdutoFilial.Close;

            edtReferencia.SetFocus;

          end;

        end;

      end;

    end;

  end;

end;

procedure TfrmModNFEntrada.edtStatusChange(Sender: TObject);
begin

  if dmMProvider.cdsNFEntradaCANCELADA.Value = 0 then
  begin

    case dmMProvider.cdsNFEntradaSTATUS.Value of
      0:
        edtStatus.Color := clGreen;
      1:
        edtStatus.Color := clRed;
    end;

  end
  else
    edtStatus.Color := clBlack;

end;

procedure TfrmModNFEntrada.edtTranportadoraExit(Sender: TObject);
begin

  MudarCorEdit(Sender);
  LimparMSG_ERRO;

  try

    if dmMProvider.cdsNFEntrada.State in [dsEdit, dsInsert] then
    begin

      if dmMProvider.cdsNFEntradaTRANSPORTADORA.Value > 0 then
      begin

        dmDBEXMaster.fdqFornecedor.Close;
        dmDBEXMaster.fdqFornecedor.SQL.Clear;
        dmDBEXMaster.fdqFornecedor.SQL.Add('select * from fornecedor');
        dmDBEXMaster.fdqFornecedor.SQL.Add('where fornecedor = ' +
          IntToStr(dmMProvider.cdsNFEntradaTRANSPORTADORA.Value));
        dmDBEXMaster.fdqFornecedor.Open;

        if dmDBEXMaster.fdqFornecedor.IsEmpty then
        begin

          dmDBEXMaster.fdqFornecedor.Close;
          Mensagem(false, dmDBEXMaster.sNomeUsuario + MSG_PESQUISA);
          edtTranportadora.SetFocus;

        end
        else
          dmMProvider.cdsFornecedor.Locate('FORNECEDOR',
            dmDBEXMaster.fdqFornecedor.FieldByName('FORNECEDOR').Value, []);

      end;

    end;
  except

    on E: exception do
      Tratar_Erro_Conexao(E);

  end;

end;

procedure TfrmModNFEntrada.edtValorFaturaExit(Sender: TObject);
begin

  LimparMSG_ERRO;

  MudarCorEdit(Sender);

  if dmMProvider.cdsNFEntrada.State in [dsEdit, dsInsert] then
  begin

    try

      if (Length(Trim(edtNumeroDocumento.Text)) > 0) and
        (edtValorFatura.Value > 0) then
      begin

        if ValidarTotalParcelas then
        begin

          Man_Tab_Parcelas_NFE(0, dmMProvider.cdsNFEntradaNFENTRADA.Value,
            edtNumeroDocumento.Text, StrToDate(edtVencimentoFatura.Text),
            edtValorFatura.Value);

          RelacionarParcelas_NFE(dmMProvider.cdsNFEntradaNFENTRADA.Value);

        end
        else
          Mensagem(True, dmDBEXMaster.sNomeUsuario +
            MSG_CONSISTE_TOTAFATURA_VNOTA);

        edtValorFatura.Value := 0;
        edtVencimentoFatura.Clear;

        edtNumeroDocumento.Clear;
        edtNumeroDocumento.SetFocus;

      end
      else if (Length(Trim(edtNumeroDocumento.Text)) > 0) and
        (edtValorFatura.Value = 0) then
      begin

        Mensagem(True, dmDBEXMaster.sNomeUsuario + MSG_CONSISTE_VALOR_FATURA);
        edtValorFatura.SetFocus;

      end
      else
        memObservacos.SetFocus;
    except
      on E: exception do
        Tratar_Erro_Conexao(E);

    end;

  end;

end;

procedure TfrmModNFEntrada.edtValorICMSExit(Sender: TObject);
begin

  MudarCorEdit(Sender);

  LimparMSG_ERRO;

  if dmMProvider.cdsNFEntrada.State in [dsEdit, dsInsert] then
  begin

    if (dmMProvider.cdsNFEntradaBASEICMS.Value > 0) and (dmMProvider.cdsNFEntradaVALORICMS.Value = 0) then
    begin

      Mensagem(True, dmDBEXMaster.sNomeUsuario + MSG_CONSISTE_VLICMS_BCICMS);
      edtValorICMS.SetFocus;

    end;

  end;

end;

procedure TfrmModNFEntrada.edtValorICMSRExit(Sender: TObject);
begin

  MudarCorEdit(Sender);
  LimparMSG_ERRO;

  if dmMProvider.cdsNFEntrada.State in [dsEdit, dsInsert] then
  begin

    if (dmMProvider.cdsNFEntradaBASESUBSTITUICAO.Value > 0) and (dmMProvider.cdsNFEntradaVALORSUBSTITUICAO.Value = 0) then
    begin

      Mensagem(True, dmDBEXMaster.sNomeUsuario + MSG_CONSISTE_VICMS_ST_BICMS_ST);
      edtValorICMSR.SetFocus;

    end;

  end;

end;

procedure TfrmModNFEntrada.edtValorUnitarioExit(Sender: TObject);
begin

  MudarCorEdit(Sender);
  CalcularTotalItem;

end;

procedure TfrmModNFEntrada.edtValotTotalNOtaExit(Sender: TObject);
begin

  LimparMSG_ERRO;
  MudarCorEdit(Sender);

  if dmMProvider.cdsNFEntrada.State in [dsEdit, dsInsert] then
  begin

    if (dmMProvider.cdsNFEntradaVALORDOSPRODUTOS.Value > 0) and (dmMProvider.cdsNFEntradaVALORDANOTA.Value = 0) then
    begin

      Mensagem(True, dmDBEXMaster.sNomeUsuario + MSG_CONSISTE_VLNOTA_VLPROD);
      edtValotTotalNOta.SetFocus;

    end;

  end;

end;

procedure TfrmModNFEntrada.edtVencimentoFaturaExit(Sender: TObject);
begin

  MudarCorEdit(Sender);

  if dmMProvider.cdsNFEntrada.State in [dsEdit, dsInsert] then
  begin

    try

      if Trim(edtVencimentoFatura.Text) <> '' then
        edtVencimentoFatura.Text := FormatDateTime('dd/mm/yyyy',
          StrToDate(edtVencimentoFatura.Text));

    except
      begin

        Mensagem(True, dmDBEXMaster.sNomeUsuario + MSG_DATA_INVALIDA);
        edtVencimentoFatura.SetFocus;

      end;

    end;

  end;

end;

procedure TfrmModNFEntrada.FecharTabelas;
begin

  dmMProvider.cdsConhecimentoFrete.Close;
  dmMProvider.cdsCFOP_NFEntrada.Close;
  dmMProvider.cdsParcelasNFE.Close;
  dmMProvider.cdsItem_NFEntrada.Close;
  dmMProvider.cdsNFEntrada.Close;

end;

procedure TfrmModNFEntrada.FormCreate(Sender: TObject);
var
  i: Integer;
begin

  DesabilitarBotaoFecharForm(self.Handle);

  imgConfirmar.Picture  := imgAberto.Picture;

  Color                 := COR_PADRAO_TELAS;
  Caption               := ' ' + Application.Title + ' - ' + RetornarVersao(ParamStr(0), 1) + 'xe';

  dmDBEXMaster.sNomeUsuario := ParamStr(1);
  dmDBEXMaster.sSenha       := ParamStr(2);
  dmDBEXMaster.iIdUsuario   := StrToInt(ParamStr(3));
  dmDBEXMaster.iIdFilial    := StrToInt(ParamStr(4));

//  OcultarAbas(false);

  for i := 0 to grdTabela.Columns.Count - 1 do
    grdTabela.Columns[i].Title.Color := COR_TITULO_GRADE;

  for i := 0 to grdItemNFEntrada.Columns.Count - 1 do
    grdItemNFEntrada.Columns[i].Title.Color := COR_TITULO_GRADE;

  for i := 0 to grdCfop.Columns.Count - 1 do
    grdCfop.Columns[i].Title.Color := COR_TITULO_GRADE;

  for i := 0 to grdFaturaDuplicatas.Columns.Count - 1 do
    grdFaturaDuplicatas.Columns[i].Title.Color := COR_TITULO_GRADE;

  dmMProvider.cdsConfiguracoes.Open;
  dmMProvider.cdsConfiguracoes.ProviderName := '';

  dmMProvider.cdsFilial.Open;
  dmMProvider.cdsFilial.ProviderName        := '';;

  dmMProvider.cdsCFOP_CFPS.Close;
  dmMProvider.cdsCFOP_CFPS.ProviderName     := 'dspCFOP_CFPS';

  dmDBEXMaster.fdqCFOP_CFPS.SQL.Clear;
  dmDBEXMaster.fdqCFOP_CFPS.SQL.Add('select * from cfop');

  dmMProvider.cdsCFOP_CFPS.Open;
  dmMProvider.cdsCFOP_CFPS.ProviderName     := '';

end;

procedure TfrmModNFEntrada.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if Key = VK_F5 then
    lblF5Click(self);

end;

procedure TfrmModNFEntrada.FormKeyPress(Sender: TObject; var Key: Char);
begin

  try

    if (UpperCase(Key) = 'S') and (lblMsg.Tag = ord(excluir)) then
    begin

      Key         := #0;
      lblMsg.Tag  := ord(nulo);
      actExcluirExecute(self);

    end
    else if (UpperCase(Key) = 'S') and (lblMsg.Tag = ord(ExcluirItemNFEntrada))
    then
    begin

      Key         := #0;
      lblMsg.Tag  := ord(nulo);
      actExcluirItemNFExecute(self);

    end
    else if (UpperCase(Key) = 'S') and (lblMsg.Tag = ord(RelacionarReferencia))
    then
    begin

      Key         := #0;
      lblMsg.Tag  := ord(nulo);
      LimparMSG_ERRO;

      sLinhaComando := ExtractFilePath(Application.ExeName) + 'CodComumForn.exe '
                        + dmDBEXMaster.sNomeUsuario + ' ' + dmDBEXMaster.sSenha
                        + ' ' + IntToStr(dmDBEXMaster.iIdUsuario) + ' '
                        + IntToStr(dmDBEXMaster.iIdFilial) + ' '
                        + edtReferencia.Text + ' ' + IntToStr(dmMProvider.cdsNFEntradaFORNECEDOR.Value);

      CriarProcessoSimples(sLinhaComando);

    end
    else if (UpperCase(Key) = 'S') and (lblMsg.Tag = ord(TrocarReferencia)) then
    begin

      if Length(Trim(edtReferencia.Text)) > 0 then
      begin

        Key         := #0;
        lblMsg.Tag  := ord(nulo);
        LimparMSG_ERRO;

        dmDBEXMaster.fdtMaster.StartTransaction;

        dmMSProcedure.fdspMaster.StoredProcName   := 'EXECUTA_SQL';
        dmMSProcedure.fdspMaster.Prepare;

        dmMSProcedure.fdspMaster.Params[0].Value  :=  'DELETE FROM REFERENCIAFORNECEDOR WHERE REFERENCIA = ' + QuotedStr(Trim(edtReferencia.Text)) + ' AND FORNECEDOR = ' + IntToStr(dmMProvider.cdsNFEntradaFORNECEDOR.Value);
        dmMSProcedure.fdspMaster.ExecProc;

        dmDBEXMaster.fdtMaster.CommitRetaining;

        sLinhaComando := ExtractFilePath(Application.ExeName) + 'CodComumForn.exe '
                          + dmDBEXMaster.sNomeUsuario + ' '
                          + dmDBEXMaster.sSenha + ' ' + IntToStr(dmDBEXMaster.iIdUsuario)
                          + ' ' + IntToStr(dmDBEXMaster.iIdFilial) + ' '
                          + Trim(edtReferencia.Text) + ' ' + IntToStr(dmMProvider.cdsNFEntradaFORNECEDOR.Value);

        CriarProcessoSimples(sLinhaComando);

      end;

    end
    else if (UpperCase(Key) = 'S') and (lblMsg.Tag = ord(ImportarXML_CTE)) then
    begin

      Key         := #0;
      lblMsg.Tag  := ord(nulo);

      LimparMSG_ERRO;

      actImportarCTEExecute(self);

    end
    else if (UpperCase(Key) = 'S') and (lblMsg.Tag = ord(EstornarNFE)) then
    begin

      Key         := #0;
      lblMsg.Tag  := ord(nulo);
      actEstornoNFEExecute(self);

    end
    else if (UpperCase(Key) = 'S') and (lblMsg.Tag = ord(ConfirmarNFE)) then
    begin

      Key         := #0;
      lblMsg.Tag  := ord(nulo);
      actConfirmarNFEExecute(self);

    end
    else if (UpperCase(Key) = 'N') AND (lblMsg.Tag <> ord(nulo)) then
    begin

      Key         := #0;
      lblMsg.Tag  := ord(nulo);
      LimparMSG_ERRO;

    end;
  except
    on E: exception do
    begin

      Tratar_Erro_Conexao(E);
      dmDBEXMaster.fdtMaster.Rollback;

    end;

  end;

end;

function TfrmModNFEntrada.GravarEstornarLivro_Entrada(pOpcao: smallint) : boolean;
var
  cdsCloneReg50: TClientDataset;
begin

  try

    if dmMProvider.cdsRegistro50.Active then
    begin

      dmDBEXMaster.fdtMaster.StartTransaction;

      cdsCloneReg50               := TClientDataset.Create(nil);
      cdsCloneReg50.ProviderName  := dmMProvider.cdsRegistro50.ProviderName;

      cdsCloneReg50.CloneCursor(dmMProvider.cdsRegistro50, True);

      while not cdsCloneReg50.Eof do
      begin

        dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[0].Value    := pOpcao;
        dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[1].Value    := dmDBEXMaster.iIdFilial;
        dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[2].Value    := FormatDateTime('mmyyyy', dmMProvider.cdsNFEntradaENTRADA.Value);
        dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[3].Value    := dmMProvider.cdsNFEntradaENTRADA.Value;
        dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[4].Value    := dmMProvider.cdsNFEntradaNOTAFISCAL.Value;
        dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[18].Value   := ''; // observação
        dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[19].Value   := -1; // LIVRO DE ENTRADA

        if dmMProvider.cdsNFEntradaMODELO.Value = '01' then
          dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[5].Value  := 'NF'
        else if dmMProvider.cdsNFEntradaMODELO.Value = '55' then
          dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[5].Value  := 'NFE'
        else
          dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[5].Value  := 'NF';

        dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[6].Value    := dmMProvider.cdsNFEntradaSERIENF.Value;
        dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[7].Value    := dmMProvider.cdsNFEntradaEMISSAO.Value;
//        dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[8].Value    := dmMProvider.cdsNFEntradaCNPJ_EMITENTE.Value;
//        dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[9].Value    := dmMProvider.cdsNFEntradaUF_EMITENTE.Value;

        if (cdsCloneReg50.FieldByName('VALOR_ICMS').Value > 0) and (cdsCloneReg50.FieldByName('OUTRAS').Value = 0) then
        begin

          dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[10].Value := cdsCloneReg50.FieldByName('VALOR_TOTAL').Value - cdsCloneReg50.FieldByName('ISENTA_NAO_TRIBUTADA').Value;
          dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[11].Value := 0; // CODIGO_CONTÁBIL
          dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[12].Value := cdsCloneReg50.FieldByName('CFOP').Value;
          dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[13].Value := 0; // IDENT_ICMS_IPI
          dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[14].Value := 1; // CODIGO_VALORES_FISCAIS
          dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[15].Value := cdsCloneReg50.FieldByName('BASE_CALCULO_ICMS').Value;
          dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[16].Value := cdsCloneReg50.FieldByName('ALIQUOTA').Value;
          dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[17].Value := cdsCloneReg50.FieldByName('VALOR_ICMS').Value;
          dmMSProcedure.fdspMan_Tab_LivroEntrada.ExecProc;

        end
        else if cdsCloneReg50.FieldByName('OUTRAS').Value = 0 then
        begin

          dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[10].Value := cdsCloneReg50.FieldByName('VALOR_TOTAL').Value - cdsCloneReg50.FieldByName('ISENTA_NAO_TRIBUTADA').Value;
          dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[11].Value := 0; // CODIGO_CONTÁBIL
          dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[12].Value := cdsCloneReg50.FieldByName('CFOP').Value;
          dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[13].Value := 0; // IDENT_ICMS_IPI
          dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[14].Value := 2; // CODIGO_VALORES_FISCAIS
          dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[15].Value := 0; // BASE_CALCULO_ICMS
          dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[16].Value := 0; // ALIQUOTA
          dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[17].Value := 0; // VALOR_ICMS
          dmMSProcedure.fdspMan_Tab_LivroEntrada.ExecProc;

        end;

        if cdsCloneReg50.FieldByName('ISENTA_NAO_TRIBUTADA').Value > 0 then
        begin

          dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[10].Value := cdsCloneReg50.FieldByName('ISENTA_NAO_TRIBUTADA').Value;
          dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[11].Value := 0; // CODIGO_CONTÁBIL
          dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[12].Value := cdsCloneReg50.FieldByName('CFOP').Value;
          dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[13].Value := 0; // IDENT_ICMS_IPI
          dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[14].Value := 2; // CODIGO_VALORES_FISCAIS
          dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[15].Value := cdsCloneReg50.FieldByName('ISENTA_NAO_TRIBUTADA').Value;
          dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[16].Value := 0; // ALIQUOTA
          dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[17].Value := 0; // VALOR_ICMS
          dmMSProcedure.fdspMan_Tab_LivroEntrada.ExecProc;

        end;

        if cdsCloneReg50.FieldByName('OUTRAS').Value > 0 then
        begin

          if (cdsCloneReg50.FieldByName('CFOP').Value = '1403') or (cdsCloneReg50.FieldByName('CFOP').Value = '2403') then
          begin

            dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[10].Value := cdsCloneReg50.FieldByName('VALOR_TOTAL').Value;
            dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[15].Value := cdsCloneReg50.FieldByName('OUTRAS').Value;
            dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[17].Value := 0;

          end
          else
          begin

            dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[10].Value := cdsCloneReg50.FieldByName('VALOR_TOTAL').Value;
            dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[15].Value := cdsCloneReg50.FieldByName('OUTRAS').Value;
            dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[17].Value := 0;

          end;

          dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[11].Value := 0;
          dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[12].Value := cdsCloneReg50.FieldByName('CFOP').Value;
          dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[13].Value := 0;
          dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[14].Value := 3;

          dmMSProcedure.fdspMan_Tab_LivroEntrada.ExecProc;

        end;

        cdsCloneReg50.Next;

      end;
    end
    else if pOpcao = 1 then
    begin

      dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[0].Value  := pOpcao;
      dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[1].Value  := dmDBEXMaster.iIdFilial;
      dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[2].Value  := FormatDateTime('mmyyyy', cdsCloneReg50.FieldByName('ENTRADA').Value);
      dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[3].Value  := cdsCloneReg50.FieldByName('ENTRADA').Value;
      dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[4].Value  := dmMProvider.cdsNFEntradaNOTAFISCAL.Value;
      dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[5].Value  := 'NF';
      dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[6].Value  := dmMProvider.cdsNFEntradaSERIENF.Value;
      dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[7].Value  := dmMProvider.cdsNFEntradaEMISSAO.Value;
//      dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[8].Value  := dmMProvider.cdsNFEntradaCNPJ_EMITENTE.Value;
//      dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[9].Value  := dmMProvider.cdsNFEntradaUF_EMITENTE.Value;
      dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[10].Value := 0;
      dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[11].Value := 0;
      dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[12].Value := '';
      dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[13].Value := 0;
      dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[14].Value := 3;
      dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[15].Value := 0;
      dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[16].Value := 0;
      dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[17].Value := 0;
      dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[18].Value := ''; // observação
      dmMSProcedure.fdspMan_Tab_LivroEntrada.Params[19].Value := -1;

      dmMSProcedure.fdspMan_Tab_LivroEntrada.ExecProc;

    end;

    dmDBEXMaster.fdtMaster.CommitRetaining;

    cdsCloneReg50.Close;
    cdsCloneReg50.ProviderName  := '';
    Result                      := True;

    FreeAndNil(cdsCloneReg50);

  except

    on E: exception do
    begin

      dmDBEXMaster.fdtMaster.RollbackRetaining;
      Tratar_Erro_Conexao(E);

      Result := false;

    end;

  end;

end;

procedure TfrmModNFEntrada.GravarEstornarRegistro50(sSituacaoNF: string);
begin

  dmMSProcedure.fdspMaster.StoredProcName := 'GRAVAR_REGISTRO50';
  dmMSProcedure.fdspMaster.Prepare;

  if sSituacaoNF <> 'E' then
    dmMSProcedure.fdspMaster.ParamByName('IP_OPCAO').Value := 0
  else
    dmMSProcedure.fdspMaster.ParamByName('IP_OPCAO').Value := 2;

  dmMSProcedure.fdspMaster.ParamByName('IP_NFSAIDA').Value            := 0;
  dmMSProcedure.fdspMaster.ParamByName('IP_NFENTRADA').Value          := dmMProvider.cdsNFEntradaNFENTRADA.Value;
//  dmMSProcedure.fdspMaster.ParamByName('IP_CNPJ').Value               := LimparCpnjInscricao(dmMProvider.cdsNFEntradaCNPJ_EMITENTE.Value);
//  dmMSProcedure.fdspMaster.ParamByName('IP_INSCRICAO').Value          := LimparCpnjInscricao(dmMProvider.cdsNFEntradaIE_EMITENTE.Value);
  dmMSProcedure.fdspMaster.ParamByName('IP_EMISSAO').Value            := dmMProvider.cdsNFEntradaEMISSAO.Value;
//  dmMSProcedure.fdspMaster.ParamByName('IP_UF').Value                 := dmMProvider.cdsNFEntradaUF_EMITENTE.Value;
  dmMSProcedure.fdspMaster.ParamByName('IP_MODELO').Value             := Format('%-2.2s', [dmMProvider.cdsNFEntradaMODELO.AsString]);
  dmMSProcedure.fdspMaster.ParamByName('IP_SERIE').Value              := Format('%-3.3s', [dmMProvider.cdsNFEntradaSERIENF.AsString]);
  dmMSProcedure.fdspMaster.ParamByName('IP_NOTAFISCAL').Value         := FloatToStr(StrToFloat(Trim(Copy(dmMProvider.cdsNFEntradaNOTAFISCAL.Value,((Length(dmMProvider.cdsNFEntradaNOTAFISCAL.Value) - 6) + 1), Length(dmMProvider.cdsNFEntradaNOTAFISCAL.Value)))));
  dmMSProcedure.fdspMaster.ParamByName('IP_DESC_PROPORCIONAL').Value  := 0;
  dmMSProcedure.fdspMaster.ParamByName('IP_CFOP').Value := '';

{  if dmMProvider.cdsFilialCNPJ.Value <> dmMProvider.cdsNFEntradaCNPJ_EMITENTE.Value
  then
    dmMSProcedure.fdspMaster.ParamByName('IP_EMITENTE').Value := 'T'
  else
    dmMSProcedure.fdspMaster.ParamByName('IP_EMITENTE').Value := 'P';
}
  dmMSProcedure.fdspMaster.ParamByName('IP_VALOR_TOTAL').Value          := 0;
  dmMSProcedure.fdspMaster.ParamByName('IP_BASE_ICMS').Value            := 0;
  dmMSProcedure.fdspMaster.ParamByName('IP_VALOR_ICMS').Value           := 0;
  dmMSProcedure.fdspMaster.ParamByName('IP_ISENTA_NAO_TRIBUTADA').Value := 0;
  dmMSProcedure.fdspMaster.ParamByName('IP_OUTRAS').Value               := 0;
  dmMSProcedure.fdspMaster.ParamByName('IP_ALIQUOTA').Value             := 0;
  dmMSProcedure.fdspMaster.ParamByName('IP_SITUACAO').Value             := sSituacaoNF;
  dmMSProcedure.fdspMaster.ParamByName('IP_TIPO_NOTA').Value            := 1;
  dmMSProcedure.fdspMaster.ParamByName('IP_ENTRADA').Value              := dmMProvider.cdsNFEntradaENTRADA.Value;
  dmMSProcedure.fdspMaster.ParamByName('IP_SOMAR_ICMSR_TOTAL').Value    := dmMProvider.cdsNFEntradaSOMAR_ICMSR_VALORNOTA.Value;
  dmMSProcedure.fdspMaster.ParamByName('IP_CST').Value                  := dmMProvider.cdsItem_NFEntradaCST.Value;

  dmMSProcedure.fdspMaster.ExecProc;

end;

procedure TfrmModNFEntrada.GravarEstornarRegistro54(pEstorno: string);
begin

  dmMSProcedure.fdspMaster.StoredProcName := 'GRAVAR_REGISTRO54';

  if pEstorno <> 'E' then
    dmMSProcedure.fdspMaster.ParamByName('IP_OPCAO').AsInteger := 0
  else // estornar
    dmMSProcedure.fdspMaster.ParamByName('IP_OPCAO').AsInteger := 2;

  dmMSProcedure.fdspMaster.ParamByName('IP_NFSAIDA').Value := 0;
  dmMSProcedure.fdspMaster.ParamByName('IP_NFENTRADA').Value :=
    dmMProvider.cdsNFEntradaNFENTRADA.Value;
  dmMSProcedure.fdspMaster.ParamByName('IP_EMISSAO').Value :=
    dmMProvider.cdsNFEntradaEMISSAO.Value;
{  dmMSProcedure.fdspMaster.ParamByName('IP_CNPJ').Value :=
    LimparCpnjInscricao(dmMProvider.cdsNFEntradaCNPJ_EMITENTE.Value);}
  dmMSProcedure.fdspMaster.ParamByName('IP_MODELO').Value :=
    Format('%-2.2s', [dmMProvider.cdsNFEntradaMODELO.Value]);
  dmMSProcedure.fdspMaster.ParamByName('IP_SERIE').Value :=
    Format('%-3.3s', [dmMProvider.cdsNFEntradaSERIENF.Value]);
  dmMSProcedure.fdspMaster.ParamByName('IP_NOTAFISCAL').Value :=
    FloatToStr(StrToFloat(Trim(Copy(dmMProvider.cdsNFEntradaNOTAFISCAL.Value,
    ((Length(dmMProvider.cdsNFEntradaNOTAFISCAL.Value) - 6) + 1),
    Length(dmMProvider.cdsNFEntradaNOTAFISCAL.Value)))));
{  dmMSProcedure.fdspMaster.ParamByName('IP_ESTADO').Value :=
    dmMProvider.cdsNFEntradaUF_EMITENTE.Value;}
  dmMSProcedure.fdspMaster.ParamByName('IP_ENTRADA').Value :=
    dmMProvider.cdsNFEntradaENTRADA.Value;
  dmMSProcedure.fdspMaster.ParamByName('IP_FRETE').Value := 0;
  dmMSProcedure.fdspMaster.ParamByName('IP_SEGURO').Value := 0;
  dmMSProcedure.fdspMaster.ParamByName('IP_OUTRAS_DESPESAS').Value := 0;
  dmMSProcedure.fdspMaster.ParamByName('IP_VALOR_FRETE').Value := 0;
  dmMSProcedure.fdspMaster.ParamByName('IP_VALOR_SEGURO').Value := 0;
  dmMSProcedure.fdspMaster.ParamByName('IP_VALOR_OUTRAS_DESPESAS').Value := 0;
  dmMSProcedure.fdspMaster.ParamByName('IP_TIPO_NOTA').Value := 1;
  dmMSProcedure.fdspMaster.ParamByName('IP_CFOP').Value := '';
  dmMSProcedure.fdspMaster.ParamByName('IP_SOMAR_IPI_BCICMS').Value :=
    dmMProvider.cdsNFEntradaSOMAR_IPI_BASEICMS.Value;
  dmMSProcedure.fdspMaster.ParamByName('IP_SOMAR_ICMSR_TOTAL').Value :=
    dmMProvider.cdsNFEntradaSOMAR_ICMSR_VALORNOTA.Value;
  dmMSProcedure.fdspMaster.ParamByName('IP_DESCONTO_PROPORCIONAL').Value := 0;

  dmMSProcedure.fdspMaster.ExecProc;

  if dmMProvider.cdsNFEntradaVALORDOFRETE.Value > 0 then
  begin

    if pEstorno <> 'E' then
      dmMSProcedure.fdspMaster.ParamByName('IP_OPCAO').AsInteger := 0
    else // estornar
      dmMSProcedure.fdspMaster.ParamByName('IP_OPCAO').AsInteger := 2;

    dmMSProcedure.fdspMaster.ParamByName('IP_NFSAIDA').Value := 0;
    dmMSProcedure.fdspMaster.ParamByName('IP_NFENTRADA').Value :=
      dmMProvider.cdsNFEntradaNFENTRADA.Value;
    dmMSProcedure.fdspMaster.ParamByName('IP_EMISSAO').Value :=
      dmMProvider.cdsNFEntradaENTRADA.Value;
{    dmMSProcedure.fdspMaster.ParamByName('IP_CNPJ').Value :=
      LimparCpnjInscricao(dmMProvider.cdsNFEntradaCNPJ_EMITENTE.Value);}
    dmMSProcedure.fdspMaster.ParamByName('IP_MODELO').Value :=
      Format('%-2.2s', [dmMProvider.cdsNFEntradaMODELO.Value]);
    dmMSProcedure.fdspMaster.ParamByName('IP_SERIE').Value :=
      Format('%-3.3s', [dmMProvider.cdsNFEntradaSERIENF.AsString]);
    dmMSProcedure.fdspMaster.ParamByName('IP_NOTAFISCAL').Value :=
      FloatToStr(StrToFloat(Trim(Copy(dmMProvider.cdsNFEntradaNOTAFISCAL.Value,
      ((Length(dmMProvider.cdsNFEntradaNOTAFISCAL.Value) - 6) + 1),
      Length(dmMProvider.cdsNFEntradaNOTAFISCAL.Value)))));
{    dmMSProcedure.fdspMaster.ParamByName('IP_ESTADO').Value :=
      dmMProvider.cdsNFEntradaUF_EMITENTE.Value;}
    dmMSProcedure.fdspMaster.ParamByName('IP_ENTRADA').Value :=
      dmMProvider.cdsNFEntradaENTRADA.Value;
    dmMSProcedure.fdspMaster.ParamByName('IP_FRETE').Value := 1;
    dmMSProcedure.fdspMaster.ParamByName('IP_SEGURO').Value := 0;
    dmMSProcedure.fdspMaster.ParamByName('IP_OUTRAS_DESPESAS').Value := 0;
    dmMSProcedure.fdspMaster.ParamByName('IP_VALOR_FRETE').Value :=
      dmMProvider.cdsNFEntradaVALORDOFRETE.Value;
    dmMSProcedure.fdspMaster.ParamByName('IP_VALOR_SEGURO').Value := 0;
    dmMSProcedure.fdspMaster.ParamByName('IP_VALOR_OUTRAS_DESPESAS').Value := 0;
    dmMSProcedure.fdspMaster.ParamByName('IP_TIPO_NOTA').Value := 1;
    dmMSProcedure.fdspMaster.ParamByName('IP_CFOP').Value :=
      dmMProvider.cdsCFOP_NFEntradaCFOP.Value;
    dmMSProcedure.fdspMaster.ExecProc;

  end;

  if dmMProvider.cdsNFEntradaVALORDOSEGURO.Value > 0 then
  begin

    if pEstorno <> 'E' then
      dmMSProcedure.fdspMaster.ParamByName('IP_OPCAO').AsInteger := 0
    else // estornar
      dmMSProcedure.fdspMaster.ParamByName('IP_OPCAO').AsInteger := 2;

    dmMSProcedure.fdspMaster.ParamByName('IP_NFSAIDA').Value := 0;
    dmMSProcedure.fdspMaster.ParamByName('IP_NFENTRADA').Value :=
      dmMProvider.cdsNFEntradaNFENTRADA.Value;
    dmMSProcedure.fdspMaster.ParamByName('IP_EMISSAO').Value :=
      dmMProvider.cdsNFEntradaENTRADA.Value;
{    dmMSProcedure.fdspMaster.ParamByName('IP_CNPJ').Value :=
      LimparCpnjInscricao(dmMProvider.cdsNFEntradaCNPJ_EMITENTE.Value);}
    dmMSProcedure.fdspMaster.ParamByName('IP_MODELO').Value :=
      Format('%-2.2s', [dmMProvider.cdsNFEntradaMODELO.Value]);
    dmMSProcedure.fdspMaster.ParamByName('IP_SERIE').Value :=
      Format('%-3.3s', [dmMProvider.cdsNFEntradaSERIENF.Value]);
    dmMSProcedure.fdspMaster.ParamByName('IP_NOTAFISCAL').Value :=
      FloatToStr(StrToFloat(Trim(Copy(dmMProvider.cdsNFEntradaNOTAFISCAL.Value,
      ((Length(dmMProvider.cdsNFEntradaNOTAFISCAL.Value) - 6) + 1),
      Length(dmMProvider.cdsNFEntradaNOTAFISCAL.Value)))));
{    dmMSProcedure.fdspMaster.ParamByName('IP_ESTADO').Value :=
      dmMProvider.cdsNFEntradaUF_EMITENTE.Value;}
    dmMSProcedure.fdspMaster.ParamByName('IP_ENTRADA').Value :=
      dmMProvider.cdsNFEntradaENTRADA.Value;
    dmMSProcedure.fdspMaster.ParamByName('IP_FRETE').Value := 0;
    dmMSProcedure.fdspMaster.ParamByName('IP_SEGURO').Value := 1;
    dmMSProcedure.fdspMaster.ParamByName('IP_OUTRAS_DESPESAS').Value := 0;
    dmMSProcedure.fdspMaster.ParamByName('IP_VALOR_FRETE').Value := 0;
    dmMSProcedure.fdspMaster.ParamByName('IP_VALOR_SEGURO').Value :=
      dmMProvider.cdsNFEntradaVALORDOSEGURO.Value;
    dmMSProcedure.fdspMaster.ParamByName('IP_VALOR_OUTRAS_DESPESAS').Value := 0;
    dmMSProcedure.fdspMaster.ParamByName('IP_CFOP').Value :=
      dmMProvider.cdsCFOP_NFEntradaCFOP.Value;
    dmMSProcedure.fdspMaster.ParamByName('IP_TIPO_NOTA').Value := 1;
    dmMSProcedure.fdspMaster.ExecProc;

  end;
  if dmMProvider.cdsNFEntradaOUTRASDESPESAS.Value > 0 then
  begin
    if pEstorno <> 'E' then
      dmMSProcedure.fdspMaster.ParamByName('IP_OPCAO').AsInteger := 0
    else // estornar
      dmMSProcedure.fdspMaster.ParamByName('IP_OPCAO').AsInteger := 2;

    dmMSProcedure.fdspMaster.ParamByName('IP_NFSAIDA').Value := 0;
    dmMSProcedure.fdspMaster.ParamByName('IP_NFENTRADA').Value :=
      dmMProvider.cdsNFEntradaNFENTRADA.Value;
    dmMSProcedure.fdspMaster.ParamByName('IP_EMISSAO').Value :=
      dmMProvider.cdsNFEntradaENTRADA.Value;
{    dmMSProcedure.fdspMaster.ParamByName('IP_CNPJ').Value :=
      LimparCpnjInscricao(dmMProvider.cdsNFEntradaCNPJ_EMITENTE.Value);}
    dmMSProcedure.fdspMaster.ParamByName('IP_MODELO').Value :=
      Format('%-2.2s', [dmMProvider.cdsNFEntradaMODELO.Value]);
    dmMSProcedure.fdspMaster.ParamByName('IP_SERIE').Value :=
      Format('%-3.3s', [dmMProvider.cdsNFEntradaSERIENF.Value]);
    dmMSProcedure.fdspMaster.ParamByName('IP_NOTAFISCAL').Value :=
      FloatToStr(StrToFloat(Trim(Copy(dmMProvider.cdsNFEntradaNOTAFISCAL.Value,
      ((Length(dmMProvider.cdsNFEntradaNOTAFISCAL.Value) - 6) + 1),
      Length(dmMProvider.cdsNFEntradaNOTAFISCAL.Value)))));
{    dmMSProcedure.fdspMaster.ParamByName('IP_ESTADO').Value :=
      dmMProvider.cdsNFEntradaUF_EMITENTE.Value;}
    dmMSProcedure.fdspMaster.ParamByName('IP_ENTRADA').Value :=
      dmMProvider.cdsNFEntradaENTRADA.Value;
    dmMSProcedure.fdspMaster.ParamByName('IP_FRETE').Value := 0;
    dmMSProcedure.fdspMaster.ParamByName('IP_SEGURO').Value := 0;
    dmMSProcedure.fdspMaster.ParamByName('IP_OUTRAS_DESPESAS').Value := 1;
    dmMSProcedure.fdspMaster.ParamByName('IP_VALOR_FRETE').Value := 0;
    dmMSProcedure.fdspMaster.ParamByName('IP_VALOR_SEGURO').Value := 0;
    dmMSProcedure.fdspMaster.ParamByName('IP_VALOR_OUTRAS_DESPESAS').Value :=
      dmMProvider.cdsNFEntradaOUTRASDESPESAS.Value;
    dmMSProcedure.fdspMaster.ParamByName('IP_CFOP').Value :=
      dmMProvider.cdsCFOP_NFEntradaCFOP.Value;
    dmMSProcedure.fdspMaster.ParamByName('IP_TIPO_NOTA').Value := 1;
    dmMSProcedure.fdspMaster.ExecProc;

  end;

end;

function TfrmModNFEntrada.Gravar_Registro_C100(pOpcao: smallint): boolean;
begin

  LimparMSG_ERRO;

  try

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_GERANDO_REGC100_SPED;
    Application.ProcessMessages;

    dmMSProcedure.fdspMaster.StoredProcName := 'GRAVAR_REGISTRO_C100';
    dmMSProcedure.fdspMaster.Prepare;

    dmMSProcedure.fdspMaster.ParamByName('IP_OPCAO').Value                  := pOpcao;
    dmMSProcedure.fdspMaster.ParamByName('IP_ENTRADA_SAIDA').Value          := 0;
    dmMSProcedure.fdspMaster.ParamByName('IP_NFENTRADA').Value              := dmMProvider.cdsNFEntradaNFENTRADA.Value;
//    dmMSProcedure.fdspMaster.ParamByName('IP_PARTICIPANTE').Value           := dmMProvider.cdsNFEntradaCNPJ_EMITENTE.Value;
    dmMSProcedure.fdspMaster.ParamByName('IP_DOCUMENTO').Value              := FloatToStr(StrToFloat(dmMProvider.cdsNFEntradaNOTAFISCAL.Value));
    dmMSProcedure.fdspMaster.ParamByName('IP_SERIE').Value                  := Copy(dmMProvider.cdsNFEntradaSERIENF.Value, 1, 3);
    dmMSProcedure.fdspMaster.ParamByName('IP_MODELO').Value                 := dmMProvider.cdsNFEntradaMODELO.Value;
    dmMSProcedure.fdspMaster.ParamByName('IP_CNPJ_FILIAL').Value            := dmMProvider.cdsFilialCNPJ.Value;
    dmMSProcedure.fdspMaster.ParamByName('IP_ALIQUOTA_CRED_SIMPLES').Value  := dmMProvider.cdsNFEntradaALIQUOTA_CREDITO_SIMPLES.Value;

    if dmMProvider.cdsParcelasNFE.RecordCount = 0 then
      dmMSProcedure.fdspMaster.ParamByName('IP_IND_PAGAMENTO').Value := 0
    else if dmMProvider.cdsParcelasNFEVENCIMENTO.Value > dmMProvider.cdsNFEntradaEMISSAO.Value then
      dmMSProcedure.fdspMaster.ParamByName('IP_IND_PAGAMENTO').Value := 1
    else if dmMProvider.cdsParcelasNFEVENCIMENTO.Value = dmMProvider.cdsNFEntradaEMISSAO.Value then
      dmMSProcedure.fdspMaster.ParamByName('IP_IND_PAGAMENTO').Value := 0
    else
      dmMSProcedure.fdspMaster.ParamByName('IP_IND_PAGAMENTO').Value := 9;

    dmMSProcedure.fdspMaster.ParamByName('IP_FORNECEDOR').Value             := dmMProvider.cdsNFEntradaFORNECEDOR.Value;
    dmMSProcedure.fdspMaster.ParamByName('IP_TIPO_SPED').Value              := 0;
    dmMSProcedure.fdspMaster.ParamByName('IP_SITUACAO_DOCUMENTO').Value     := StrToInt(dmMProvider.cdsNFEntradaSITUACAO_DOCUMENTO.Value);
    dmMSProcedure.fdspMaster.ParamByName('IP_CHAVE_NFE').Value              := Copy(dmMProvider.cdsNFEntradaPROTOCOLO_DANFE.Value, 1, 44);
    dmMSProcedure.fdspMaster.ParamByName('IP_EMISSAO').Value                := dmMProvider.cdsNFEntradaEMISSAO.Value;
    dmMSProcedure.fdspMaster.ParamByName('IP_ENTRADA_EMISSAO').Value        := dmMProvider.cdsNFEntradaENTRADA.Value;
    dmMSProcedure.fdspMaster.ParamByName('IP_IND_FRETE').Value              := dmMProvider.cdsNFEntradaTIPOFRETE.Value;
    dmMSProcedure.fdspMaster.ParamByName('IP_SOMAR_ICMSR_TOTAL').Value      := dmMProvider.cdsNFEntradaSOMAR_ICMSR_VALORNOTA.Value;
//    dmMSProcedure.fdspMaster.ParamByName('IP_OBSERVACAO_FISCAL').Value      := dmMProvider.cdsNFEntradaOBSERVACAO_FISCAL.Value;

    lblMsg.Caption := 'RC100-NF:' + FloatToStr(StrToFloat(dmMProvider.cdsNFEntradaNOTAFISCAL.Value));
    Application.ProcessMessages;

    dmMSProcedure.fdspMaster.ExecProc;

    if dmMProvider.cdsNFEntradaMODELO.Value <> '55' then
    begin

      if dmMProvider.cdsParcelasNFE.RecordCount > 0 then
      begin

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_GERANDO_REGC140_SPED;
        Application.ProcessMessages;

        dmMSProcedure.fdspMaster.StoredProcName := 'GRAVAR_REGISTRO_C140';
        dmMSProcedure.fdspMaster.Prepare;

        dmMSProcedure.fdspMaster.ParamByName('IP_OPCAO').Value                := pOpcao;
        dmMSProcedure.fdspMaster.ParamByName('IP_NFENTRADA').Value            := dmMProvider.cdsNFEntradaNFENTRADA.Value;
        dmMSProcedure.fdspMaster.ParamByName('IP_NFSAIDA').Value              := -1;
        dmMSProcedure.fdspMaster.ParamByName('IP_QUANTIDADE_PARCELAS').Value  := dmMProvider.cdsParcelasNFE.RecordCount;
        dmMSProcedure.fdspMaster.ParamByName('IP_DOCUMENTO').Value            := FloatToStr(StrToFloat(dmMProvider.cdsNFEntradaNOTAFISCAL.Value));
//        dmMSProcedure.fdspMaster.ParamByName('IP_CNPJ').Value                 := dmMProvider.cdsNFEntradaCNPJ_EMITENTE.Value;

        lblMsg.Caption := 'R140' + FloatToStr(StrToFloat(dmMProvider.cdsNFEntradaNOTAFISCAL.Value));
        Application.ProcessMessages;

        dmMSProcedure.fdspMaster.ExecProc;

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_GERANDO_REGC141_SPED;
        Application.ProcessMessages;

        dmMSProcedure.fdspMaster.StoredProcName := 'GRAVAR_REGISTRO_C141';
        dmMSProcedure.fdspMaster.Prepare;

        dmMSProcedure.fdspMaster.ParamByName('IP_OPCAO').Value      := pOpcao;
        dmMSProcedure.fdspMaster.ParamByName('IP_NFENTRADA').Value  := dmMProvider.cdsNFEntradaNFENTRADA.Value;
        dmMSProcedure.fdspMaster.ParamByName('IP_NFSAIDA').Value    := -1;
        dmMSProcedure.fdspMaster.ParamByName('IP_SERIE').Value      := dmMProvider.cdsNFEntradaSERIENF.Value;
        dmMSProcedure.fdspMaster.ParamByName('IP_MODELO').Value     := dmMProvider.cdsNFEntradaMODELO.Value;
//        dmMSProcedure.fdspMaster.ParamByName('IP_CNPJ').Value       := dmMProvider.//cdsNFEntradaCNPJ_EMITENTE.Value;

        lblMsg.Caption := 'R141 - ' + FloatToStr(StrToFloat(dmMProvider.cdsNFEntradaNOTAFISCAL.Value));
        Application.ProcessMessages;

        dmMSProcedure.fdspMaster.ExecProc;

      end;

    end;

    if Gravar_Registro_C170(pOpcao) then
    begin

      if not Gravar_Registro_C190(pOpcao) then
      begin

        dmDBEXMaster.fdtMaster.RollbackRetaining;
        Result := false;

      end
      else
        Result := true;

    end
    else
    begin

      dmDBEXMaster.fdtMaster.RollbackRetaining;
      Result := false;

    end;

  except
    on E: exception do
    begin

      dmDBEXMaster.fdtMaster.RollbackRetaining;
      Tratar_Erro_Conexao(E);
      Result := false;

    end;

  end;

end;

function TfrmModNFEntrada.Gravar_Registro_C170(pOpcao: smallint): boolean;
var
  iPos: Integer;
begin

  LimparMSG_ERRO;

  try

    iPos := 0;

    iPos := (Length(dmMProvider.cdsNFEntradaNOTAFISCAL.Value) - 9);
    iPos := iPos + 1;

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_GERANDO_REGC170_SPED;
    Application.ProcessMessages;

    dmMSProcedure.fdspMaster.StoredProcName := 'GRAVAR_REGISTRO_C170';
    dmMSProcedure.fdspMaster.Prepare;

    dmMSProcedure.fdspMaster.ParamByName('IP_OPCAO').Value                  := pOpcao;
    dmMSProcedure.fdspMaster.ParamByName('IP_ENTRADA_SAIDA').Value          := 0; // nf entrada
    dmMSProcedure.fdspMaster.ParamByName('IP_EMISSAO_ENTRADA').Value        := dmMProvider.cdsNFEntradaENTRADA.Value;
    dmMSProcedure.fdspMaster.ParamByName('IP_NF_ENTRADA_SAIDA').Value       := dmMProvider.cdsNFEntradaNFENTRADA.Value;
    dmMSProcedure.fdspMaster.ParamByName('IP_NOTA_FISCAL').Value            := Copy(dmMProvider.cdsNFEntradaNOTAFISCAL.Value, iPos, Length(dmMProvider.cdsNFEntradaNOTAFISCAL.Value));
    dmMSProcedure.fdspMaster.ParamByName('IP_MODELO').Value                 := dmMProvider.cdsNFEntradaMODELO.Value;
    dmMSProcedure.fdspMaster.ParamByName('IP_SERIE').Value                  := dmMProvider.cdsNFEntradaSERIENF.Value;
//    dmMSProcedure.fdspMaster.ParamByName('IP_CNPJ').Value                   := dmMProvider.cdsNFEntradaCNPJ_EMITENTE.Value;
    dmMSProcedure.fdspMaster.ParamByName('IP_TIPO_SPED').Value              := 0;
    dmMSProcedure.fdspMaster.ParamByName('IP_DESC_PROPORCIONAL').Value      := 0;
    dmMSProcedure.fdspMaster.ParamByName('IP_ALIQUOTA_CRED_SIMPLES').Value  := dmMProvider.cdsNFEntradaALIQUOTA_CREDITO_SIMPLES.Value;

    lblMsg.Caption := 'R170 - ' + FloatToStr(StrToFloat(dmMProvider.cdsNFEntradaNOTAFISCAL.Value));
    Application.ProcessMessages;

    dmMSProcedure.fdspMaster.ExecProc;
    Result := True;

  except
    on E: exception do
    begin

      Tratar_Erro_Conexao(E);
      Result := false;

    end;

  end;

end;

function TfrmModNFEntrada.Gravar_Registro_C190(pOpcao: smallint): boolean;
var
  iPos: Integer;
begin

  LimparMSG_ERRO;

  try

    iPos := 0;

    iPos := (Length(dmMProvider.cdsNFEntradaNOTAFISCAL.Value) - 9);
    iPos := iPos + 1;

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_GERANDO_REGC190_SPED;
    Application.ProcessMessages;

    dmMSProcedure.fdspMaster.StoredProcName := 'GRAVAR_REGISTRO_C190_SPED';
    dmMSProcedure.fdspMaster.Prepare;

    dmMSProcedure.fdspMaster.ParamByName('IP_OPCAO').Value                  := pOpcao;
    dmMSProcedure.fdspMaster.ParamByName('IP_ENTRADA_SAIDA').Value          := 0; // nf entrada
    dmMSProcedure.fdspMaster.ParamByName('IP_EMISSAO_ENTRADA').Value        := dmMProvider.cdsNFEntradaENTRADA.Value;
    dmMSProcedure.fdspMaster.ParamByName('IP_NFENTRADA_SAIDA').Value        := dmMProvider.cdsNFEntradaNFENTRADA.Value;
    dmMSProcedure.fdspMaster.ParamByName('IP_NOTA_FISCAL').Value            := Copy(dmMProvider.cdsNFEntradaNOTAFISCAL.Value, iPos, Length(dmMProvider.cdsNFEntradaNOTAFISCAL.Value));
    dmMSProcedure.fdspMaster.ParamByName('IP_MODELO').Value                 := dmMProvider.cdsNFEntradaMODELO.Value;
    dmMSProcedure.fdspMaster.ParamByName('IP_SERIE').Value                  := dmMProvider.cdsNFEntradaSERIENF.Value;
//    dmMSProcedure.fdspMaster.ParamByName('IP_CNPJ').Value                   := dmMProvider.cdsNFEntradaCNPJ_EMITENTE.Value;
    dmMSProcedure.fdspMaster.ParamByName('IP_ALIQUOTA_CRED_SIMPLES').Value  := dmMProvider.cdsNFEntradaALIQUOTA_CREDITO_SIMPLES.Value;

    lblMsg.Caption := 'R190 - ' + FloatToStr(StrToFloat(dmMProvider.cdsNFEntradaNOTAFISCAL.Value));
    Application.ProcessMessages;

    dmMSProcedure.fdspMaster.ExecProc;
    Result := true;

  except

    on E: exception do
    begin

      Tratar_Erro_Conexao(E);
      Result := false;

    end;

  end;

end;

procedure TfrmModNFEntrada.grdFaturaDuplicatasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if not dmMProvider.cdsParcelasNFE.IsEmpty then
  begin

    if not odd(dmMProvider.cdsParcelasNFE.RecNo) then
    begin

      grdTabela.Canvas.Font.Color := clBlack;
      grdTabela.Canvas.Brush.Color := COR_ZEBRA_GRADE;

    end
    else
    begin

      grdTabela.Canvas.Font.Color := clBlack;
      grdTabela.Canvas.Brush.Color := clWhite;

    end;

    grdTabela.Canvas.FillRect(Rect);
    grdTabela.DefaultDrawDataCell(Rect, Column.Field, State);

  end;

end;

procedure TfrmModNFEntrada.grdTabelaDblClick(Sender: TObject);
begin

  if not dmMProvider.cdsNFEntrada.IsEmpty then
  begin

    OcultarAbas(True);
    pgcNFEntrada.ActivePageIndex := 1;

  end;

end;

procedure TfrmModNFEntrada.grdTabelaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if not odd(dmMProvider.cdsNFEntrada.RecNo) then
  begin

    grdTabela.Canvas.Font.Color := clBlack;
    grdTabela.Canvas.Brush.Color := COR_ZEBRA_GRADE

  end

  else
  begin

    grdTabela.Canvas.Font.Color := clBlack;
    grdTabela.Canvas.Brush.Color := clWhite;

  end;

  if Column.FieldName = 'COM_FRETE' then
  // Remova esta linha se você quer destacar toda a linha
  begin

    if Column.Field.DataSet.FieldByName('COM_FRETE').AsString = 'SIM' then
    begin

      grdTabela.Canvas.Font.Color := clRed;
      grdTabela.Canvas.Font.Style := [fsBold];

    end

    else
    begin

      grdTabela.Canvas.Font.Color := clBlack;
      grdTabela.Canvas.Font.Style := [];

    end;

  end;

  if Column.FieldName = 'DESCRICAO_STATUS' then
  // Remova esta linha se você quer destacar toda a linha
  begin

    if Column.Field.DataSet.FieldByName('DESCRICAO_STATUS').AsString = 'CONFIRMADA'
    then
    begin

      grdTabela.Canvas.Font.Color := clRed;
      grdTabela.Canvas.Font.Style := [fsBold];

    end

    else
    begin

      grdTabela.Canvas.Font.Color := clGreen;
      grdTabela.Canvas.Font.Style := [];

    end;

  end;

  // Agora vamos colorir a célula utilizando o método Defaut:

  grdTabela.DefaultDrawColumnCell(Rect, DataCol, Column, State)

end;

procedure TfrmModNFEntrada.grdTabelaKeyPress(Sender: TObject; var Key: Char);
begin

  if Key = #13 then
    grdTabelaDblClick(self);

end;

procedure TfrmModNFEntrada.HabilitaDesabilitaControles(pOpcao: boolean);
begin

  grpTotais.Enabled := pOpcao;
  grpItensServico.Enabled := grpTotais.Enabled;
  grpTransporte.Enabled := grpTotais.Enabled;

end;

procedure TfrmModNFEntrada.imgCldClick(Sender: TObject);
begin

  actCalculoCLDExecute(self);

end;

procedure TfrmModNFEntrada.imgConfirmarClick(Sender: TObject);
begin

  LimparMSG_ERRO;

  HabilitaDesabilitaControles(True);

  if (dmMProvider.cdsNFEntrada.State in [dsEdit, dsInsert]) or(dmMProvider.cdsParcelasNFE.State in [dsEdit, dsInsert])
      or (dmMProvider.cdsCFOP_CFPS.State in [dsEdit, dsInsert]) or (dmMProvider.cdsItem_NFEntrada.State in [dsEdit, dsInsert])
      or(dmMProvider.cdsConhecimentoFrete.State in [dsEdit, dsInsert]) then
    Mensagem(True, dmDBEXMaster.sNomeUsuario + MSG_SALVAR_ALTERACOES)
  else if dmMProvider.cdsNFEntradaSTATUS.Value = 1 then
  begin

    lblMsg.Tag := ord(EstornarNFE);
    Mensagem(True, dmDBEXMaster.sNomeUsuario + MSG_ESTORNO_DOCUMENTO);

  end
  else if ChecarTotais then
  begin

    if ValidarUnidadeEmbalagem then
    begin

      if ValidarCampos then
      begin

        lblMsg.Tag := ord(ConfirmarNFE);
        Mensagem(True, dmDBEXMaster.sNomeUsuario + MSG_CONFIRMACAO_DOCUMENTO);

      end;

    end
    else
    begin

      memInconsitencia.Clear;

      memInconsitencia.Clear;
      memInconsitencia.Lines.Add('Inconsistências encontradas UNIDADE DE EMBALAGEM');
      memInconsitencia.Lines.Add('');
      memInconsitencia.Lines.Add('[PRODUTO][UND.EMB][ DESCRIÇÃO                                        ]');
      memInconsitencia.Lines.Add('----------------------------------------------------------------------');

      memInconsitencia.Lines.AddStrings(tsInconsistenciasUNDEmb);

      memInconsitencia.Lines.Add('----------------------------------------------------------------------');

      tbsInconsitenciaXML.TabVisible  := True;
      pgcNFEntrada.ActivePageIndex    := 4;

    end;

  end;

  FreeAndNil(tsInconsistenciasUNDEmb);

  HabilitaDesabilitaControles(false);

end;

function TfrmModNFEntrada.ImportarXML_NFE_CTE(pOpcao: smallint;
  pArq: string): boolean;
var
  NFe: TACBrNFe;
  CTe: TACBrCTe;
  sPedido, sLinhaComando, sBarras, sProd, sCST_Frete: string;
  i, iCfop, iDup, iItem: Integer;
  tsItens_EAN, tsItens_REF, tsItem_Nota: TStringList;
  iFornecedor, iTransportador, iFornecedor_Frete: Integer;
begin

  Result := false;

  tsItens_EAN := TStringList.Create;
  tsItens_REF := TStringList.Create;
  tsItem_Nota := TStringList.Create;

  case pOpcao of
    IMPORTAR_XML_NFE: begin

        dmMProvider.cdsOrdemCompra.Close;
        dmMProvider.cdsOrdemCompra.ProviderName := 'dspOrdemCompra';

        dmDBEXMaster.fdqOrdemCompra.SQL.Clear;
        dmDBEXMaster.fdqOrdemCompra.SQL.Add('select * from ordemdecompra');

        dmMProvider.cdsOrdemCompra.Open;
        dmMProvider.cdsOrdemCompra.ProviderName := '';

        if not dmMProvider.cdsOrdemCompra.IsEmpty then
        begin

          sPedido := InputBox('Ordem de compra', 'Número: ', '');

          if sPedido <> '' then
          begin

            dmMProvider.cdsOrdemCompra.Close;
            dmMProvider.cdsOrdemCompra.ProviderName := 'dspOrdemCompra';

            dmDBEXMaster.fdqOrdemCompra.SQL.Clear;
            dmDBEXMaster.fdqOrdemCompra.SQL.Add('select * from ordemdecompra');
            dmDBEXMaster.fdqOrdemCompra.SQL.Add('where ordemdecompra = ' + Trim(sPedido));

            dmMProvider.cdsOrdemCompra.Open;
            dmMProvider.cdsOrdemCompra.ProviderName := '';

            if dmMProvider.cdsOrdemCompra.IsEmpty then
            begin

              Mensagem(True, dmDBEXMaster.sNomeUsuario + MSG_PESQUISA + ' - ORDEM DE COMPRA ' + sPedido);
              exit;

            end;

          end;

        end;

        NFe := TACBrNFe.Create(self);

        NFe.NotasFiscais.Clear;
        NFe.NotasFiscais.LoadFromFile(pArq);

        if NFe.NotasFiscais.Count = 1 then
        begin

          with NFe.NotasFiscais.Items[0].NFe do
          begin

            // posiciona ponteiro na loja em uso
            dmMProvider.cdsFilial.Locate('FILIAL', dmDBEXMaster.iIdFilial, []);

            // verifica cnpj destinatario
            if Dest.CNPJCPF <> dmMProvider.cdsFilialCNPJ.Value then
              Mensagem(false, dmDBEXMaster.sNomeUsuario + MSG_CONSISTE_CNPJ__DEST_NFE)
            else
            begin

              dmDBEXMaster.fdqFornecedor.Close;
              dmDBEXMaster.fdqFornecedor.SQL.Clear;
              dmDBEXMaster.fdqFornecedor.SQL.Add('select FORNECEDOR.*, CIDADES.NOME as NOME_CIDADE from FORNECEDOR');
              dmDBEXMaster.fdqFornecedor.SQL.Add('JOIN CIDADES CIDADES');
              dmDBEXMaster.fdqFornecedor.SQL.Add('ON(CIDADES.CIDADE = FORNECEDOR.CIDADE)');
              dmDBEXMaster.fdqFornecedor.SQL.Add('WHERE CNPJ = ' + QuotedStr(Emit.CNPJCPF));
              dmDBEXMaster.fdqFornecedor.Open;

              // verifica fornecedor cadastro
              if not dmDBEXMaster.fdqFornecedor.IsEmpty then
              begin

                iFornecedor := dmDBEXMaster.fdqFornecedor.FieldByName('FORNECEDOR').Value;

                // verifica codigo ibge cadsatro de cidade
                if not dmDBEXMaster.VerificarCodigoIBGE(dmDBEXMaster.fdqFornecedor.FieldByName('CIDADE').Value, Emit.EnderEmit.cMun) then
                begin

                  sLinhaComando := ExtractFilePath(Application.ExeName) + 'Cidades.exe '
                                    + dmDBEXMaster.sNomeUsuario + ' '
                                    + dmDBEXMaster.sSenha + ' '
                                    + IntToStr(dmDBEXMaster.iIdUsuario) + ' '
                                    + IntToStr(dmDBEXMaster.iIdFilial) + ' '
                                    + IntToStr(dmDBEXMaster.fdqFornecedor.FieldByName('CIDADE').Value)
                                    + ' ' + IntToStr(Emit.EnderEmit.cMun);

                  CriarProcessoSimples(sLinhaComando);

                  Mensagem(false, dmDBEXMaster.sNomeUsuario + MSG_CONFIG_CODIGO_IBGE_CIDADE + ' - ' + dmDBEXMaster.fdqFornecedor.FieldByName('NOME_CIDADE').Value + ' - ' + IntToStr(Emit.EnderEmit.cMun));

                end;

                if Length(Trim(Transp.Transporta.CNPJCPF)) > 0  then
                begin

                  dmDBEXMaster.fdqFornecedor.Close;
                  dmDBEXMaster.fdqFornecedor.SQL.Clear;
                  dmDBEXMaster.fdqFornecedor.SQL.Add('select FORNECEDOR.*, CIDADES.NOME as NOME_CIDADE from FORNECEDOR');
                  dmDBEXMaster.fdqFornecedor.SQL.Add('JOIN CIDADES CIDADES');
                  dmDBEXMaster.fdqFornecedor.SQL.Add('ON(CIDADES.CIDADE = FORNECEDOR.CIDADE)');
                  dmDBEXMaster.fdqFornecedor.SQL.Add('WHERE CNPJ = ' + QuotedStr(Transp.Transporta.CNPJCPF));
                  dmDBEXMaster.fdqFornecedor.Open;

                  // verifica fornecedor/trasnportador cadastrado
                  if not dmDBEXMaster.fdqFornecedor.IsEmpty then
                  begin

                    iTransportador := dmDBEXMaster.fdqFornecedor.FieldByName('FORNECEDOR').Value;

                    // verifica codigo ibge cadsatro de cidade
                    if not dmDBEXMaster.VerificarCodigoIBGE(dmDBEXMaster.fdqFornecedor.FieldByName('CIDADE').Value, Emit.EnderEmit.cMun) then
                    begin

                      sLinhaComando := ExtractFilePath(Application.ExeName) + 'Cidades.exe '
                                        + dmDBEXMaster.sNomeUsuario + ' ' + dmDBEXMaster.sSenha + ' '
                                        + IntToStr(dmDBEXMaster.iIdUsuario) + ' '
                                        + IntToStr(dmDBEXMaster.iIdFilial) + ' '
                                        + IntToStr(dmDBEXMaster.fdqFornecedor.FieldByName('CIDADE').Value) + ' ' + IntToStr(Emit.EnderEmit.cMun);

                      CriarProcessoSimples(sLinhaComando);

                      Mensagem(false, dmDBEXMaster.sNomeUsuario + MSG_CONFIG_CODIGO_IBGE_CIDADE + ' - '
                                + dmDBEXMaster.fdqFornecedor.FieldByName('NOME_CIDADE').Value + ' - ' + IntToStr(Emit.EnderEmit.cMun));

                    end;

                  end
                  else
                  begin

                    Mensagem(false, dmDBEXMaster.sNomeUsuario + MSG_PESQUISA
                              + ' - Trasnportador/CNPJ: ' + Transp.Transporta.CNPJCPF);
                    dmDBEXMaster.fdqFornecedor.Close;
                    exit;

                  end;

                end;

                edtAliqCredSimples.Visible := dmDBEXMaster.fdqFornecedor.FieldByName('OPTANTE_SIMPLES').Value = 1;

                dmMProvider.cdsFornecedor.Close;
                dmMProvider.cdsFornecedor.ProviderName := 'dspFornecedor';

                dmDBEXMaster.fdqFornecedor.Close;
                dmDBEXMaster.fdqFornecedor.SQL.Clear;
                dmDBEXMaster.fdqFornecedor.SQL.Add('select FORNECEDOR.*, CIDADES.NOME as NOME_CIDADE from FORNECEDOR');
                dmDBEXMaster.fdqFornecedor.SQL.Add('JOIN CIDADES CIDADES');
                dmDBEXMaster.fdqFornecedor.SQL.Add('ON(CIDADES.CIDADE = FORNECEDOR.CIDADE)');
                dmMProvider.cdsFornecedor.Open;
                dmMProvider.cdsFornecedor.ProviderName := '';

                if not AbrirTabelaNFEntrada(5, 'NOTAFISCAL = ' + QuotedStr(FloatToStr(Ide.nNF)) + ' AND FORNECEDOR = ' + IntToStr(iFornecedor)
                                            + ' AND SERIENF = ' + QuotedStr(IntToStr(Ide.serie))
                                            + ' AND MODELO = ' + QuotedStr(IntToStr(Ide.modelo))) then
                begin

                  Mensagem(false, dmDBEXMaster.sNomeUsuario + MSG_CONSISTIR_INFO_XML);

                  // verifica se existe codigo de barras do arquivo
                  // e testa o tamanho
                  for i := 0 to (Det.Count - 1) do
                  begin

                    with Det.Items[i] do
                    begin

                      // verifica se existe codigo de barras do arquivo
                      // e testa o tamanho
                      sProd := Prod.cProd;

                      if (Length(Trim(Prod.cEANTrib)) > 0) or (Length(Trim(Prod.cEAN)) > 0) then
                      begin

                        if Prod.cEANTrib <> '' then
                        begin

                          // testa o tamanho do codigo de barras
                          if Length(Prod.cEANTrib) > 13 then
                            sBarras := Prod.cEANTrib
                          else
                            sBarras := FormatFloat('0000000000000', StrToFloat(Prod.cEANTrib))

                        end
                        else if Prod.cEAN <> '' then
                        begin

                          // testa o tamanho do codigo de barras
                          if Length(Prod.cEAN) > 13 then
                            sBarras := Prod.cEAN
                          else
                            sBarras := FormatFloat('0000000000000', StrToFloat(Prod.cEAN));

                        end;

                        // verifica se o codigo de barras existe
                        if dmDBEXMaster.ValidarPesquisaBarras(sBarras) then
                        begin

                          // verifica se exite o produto cadastrado
                          if dmDBEXMaster.ValidarPesquisaProduto(dmDBEXMaster.fdqBarras.FieldByName('PRODUTO').Value) then
                          begin

                            // verifica se existe os detalhes do produto;
                            if dmDBEXMaster.ValidarPesquisaProduto_Filial(dmDBEXMaster.fdqProdutos.FieldByName('PRODUTO').Value) then
                            begin

                              tsItem_Nota.Add(IntToStr(dmDBEXMaster.fdqProdutos.FieldByName('PRODUTO').Value));

                            end
                            else
                            begin

                              Mensagem(false, dmDBEXMaster.sNomeUsuario + MSG_CONSISTE_PRODUTO_PRODFIL);
                              break;

                            end;

                          end
                          else
                          begin

                            Mensagem(false, dmDBEXMaster.sNomeUsuario + MSG_CONSISTE_BARRAS_PRODUTO);
                            break;

                          end;
                        end
                        else
                          tsItens_EAN.Add(Format('%20.20s', [sBarras]) + Format('%8.8s', [' ']) + Format('%-60.60s',[Prod.xProd]));

                      end
                      else
                      begin

                        if not dmDBEXMaster.ValidarPesquisaReferencia(Prod.cProd, iFornecedor) then
                          tsItens_REF.Add(Format('%20.20s', [RetirarPonto(Prod.cProd)])
                                          + Format('%8.8s', [' ']) + Format('%-60.60s',[Prod.xProd]))
                        else
                          tsItem_Nota.Add(IntToStr(dmDBEXMaster.fdqReferenciaFornecedor.FieldByName('PRODUTO').Value));

                      end;

                    end;

                  end;

                  for iCfop := 0 to (Det.Count - 1) do
                  begin

                    with Det.Items[iCfop] do
                    begin

                      if not dmDBEXMaster.ValidarPesquisaCfopCorrelata(Prod.CFOP, Emit.EnderEmit.UF) then
                      begin

                        Mensagem(false, dmDBEXMaster.sNomeUsuario + MSG_CFOP_CORRELATA_N_CONFIG + ' CFOP ' + Prod.CFOP);

                        sLinhaComando := ExtractFilePath(Application.ExeName) + 'CFOP_CFPS.exe '
                                          + dmDBEXMaster.sNomeUsuario + ' '
                                          + dmDBEXMaster.sSenha + ' '
                                          + IntToStr(dmDBEXMaster.iIdUsuario) + ' '
                                          + IntToStr(dmDBEXMaster.iIdFilial) + ' ' + Trim(Prod.CFOP);

                        CriarProcessoSimples(sLinhaComando);

                        break;

                      end;

                    end;

                  end;

                  if (tsItens_EAN.Count > 0) or (tsItens_REF.Count > 0) then
                  begin

                    memInconsitencia.Clear;

                    if tsItens_EAN.Count > 0 then
                    begin

                      memInconsitencia.Clear;
                      memInconsitencia.Lines.Add('Inconsistências encontradas EAN x PRODUTO');
                      memInconsitencia.Lines.Add('');
                      memInconsitencia.Lines.Add('[EAN/GTIN                ][ DESCRIÇÃO                                ]');
                      memInconsitencia.Lines.Add('----------------------------------------------------------------------');

                      memInconsitencia.Lines.AddStrings(tsItens_EAN);

                      memInconsitencia.Lines.Add('----------------------------------------------------------------------');

                      sLinhaComando := ExtractFilePath(Application.ExeName) + 'Produtos.exe '
                                        + dmDBEXMaster.sNomeUsuario + ' ' + dmDBEXMaster.sSenha + ' '
                                        + IntToStr(dmDBEXMaster.iIdUsuario) + ' ' + IntToStr(dmDBEXMaster.iIdFilial);

                      CriarProcessoSimples(sLinhaComando);

                    end
                    else if tsItens_REF.Count > 0 then
                    begin

                      memInconsitencia.Lines.Add('Inconsistências encontradas REFERÊNCIA x PRODUTO');
                      memInconsitencia.Lines.Add('');
                      memInconsitencia.Lines.Add('[REFERÊNCIA              ][ DESCRIÇÃO                                ]');
                      memInconsitencia.Lines.Add('----------------------------------------------------------------------');

                      memInconsitencia.Lines.AddStrings(tsItens_REF);

                      memInconsitencia.Lines.Add('----------------------------------------------------------------------');

                      sLinhaComando := ExtractFilePath(Application.ExeName) + 'CodComumForn.exe '
                                        + dmDBEXMaster.sNomeUsuario + ' ' + dmDBEXMaster.sSenha + ' '
                                        + IntToStr(dmDBEXMaster.iIdUsuario) + ' ' + IntToStr(dmDBEXMaster.iIdFilial);

                      CriarProcessoSimples(sLinhaComando);

                    end;

                    tbsInconsitenciaXML.TabVisible  := True;
                    pgcNFEntrada.ActivePageIndex    := 4;

                    exit;

                  end;

                  {
                    if sPedido <> '' then
                    begin

                    Panel4.Visible := True;
                    Panel4.Caption := 'Aguarde... consistindo ordem de compra';
                    Application.ProcessMessages;

                    Consistir_OC_NFEntrada(sPedido);

                    if tsInconsistenciasOC.Count > 0 then
                    begin

                    Panel4.Visible := false;
                    Application.ProcessMessages;

                    Memo4.Lines := tsInconsistenciasOC;

                    Button1.Caption := 'Salvar';

                    Label42.Caption := 'INCONSISTÊNCIAS';
                    Panel3.Visible  := true;

                    if application.MessageBox(pchar(usuario + ', confirma importação mesmo havendo divergências!'), 'Atenção!', mb_IconQuestion +
                    MB_DEFBUTTON2 +  mb_YesNo) = idNo then
                    begin

                    dmDBEXMaster.sqqPesqOrdemCompra.Close;
                    exit;

                    end;

                    end;

                    end;
                  }

                  iProx_NFEntrada           := -1;
                  iProx_CFOPEntrada         := -1;
                  iProx_ParcelasNFE         := -1;
                  iProx_ItemNFEntrada       := 0;
                  iProx_Conhecimento_Frete  := -1;

                  dmMSProcedure.fdspMaster.StoredProcName :='RETORNAR_GNR_NFENTRADA';
                  dmMSProcedure.fdspMaster.ExecProc;

                  iProx_NFEntrada :=(dmMSProcedure.fdspMaster.Params[0].Value + 1);

                  AbrirTabelasAuxiliares;

                  dmMProvider.cdsNFEntrada.Append;

                  dmMProvider.cdsNFEntradaNFENTRADA.Value   := iProx_NFEntrada;
                  dmMProvider.cdsNFEntradaNOTAFISCAL.Value  := IntToStr(Ide.nNF);

                  if Length(Trim(sPedido)) > 0 then
                    dmMProvider.cdsNFEntradaORDEMDECOMPRA.Value := StrToInt(sPedido);

                  dmMProvider.cdsNFEntradaFORNECEDOR.Value        := iFornecedor;
                  dmMProvider.cdsNFEntradaMODELO.Value            := IntToStr(Ide.modelo);
                  dmMProvider.cdsNFEntradaSERIENF.Value           := IntToStr(Ide.serie);
                  dmMProvider.cdsNFEntradaENTRADA.Value           := Date;
                  dmMProvider.cdsNFEntradaEMISSAO.Value           := Ide.dEmi;
                  dmMProvider.cdsNFEntradaSAIDA.Value             := Ide.dSaiEnt;
                  dmMProvider.cdsNFEntradaPROTOCOLO_DANFE.Value   := procNFe.chNFe;
                  dmMProvider.cdsNFEntradaBASEICMS.Value          := Total.ICMSTot.vBC;
                  dmMProvider.cdsNFEntradaVALORICMS.Value         := Total.ICMSTot.vICMS;
                  dmMProvider.cdsNFEntradaBASESUBSTITUICAO.Value  := Total.ICMSTot.vBCST;
                  dmMProvider.cdsNFEntradaVALORSUBSTITUICAO.Value := Total.ICMSTot.vST;

                  if Total.ICMSTot.vFrete > 0 then
                    dmMProvider.cdsNFEntradaFRETEAGREGADO.Value := 1
                  else
                    dmMProvider.cdsNFEntradaFRETEAGREGADO.Value := 0;

                  dmMProvider.cdsNFEntradaTRANSPORTADORA.Value    := iTransportador;
                  dmMProvider.cdsNFEntradaTIPOFRETE.Value         := StrToInt(modFreteToStr(Transp.modFrete));
                  dmMProvider.cdsNFEntradaVALORDOFRETE.Value      := Total.ICMSTot.vFrete;
                  dmMProvider.cdsNFEntradaPLACAVEICULO.Value      := Transp.veicTransp.placa;
                  dmMProvider.cdsNFEntradaUFVEICULO.Value         := Transp.veicTransp.UF;
                  dmMProvider.cdsNFEntradaQUANTIDADEVOLUME.Value  := Transp.Vol.Items[0].qVol;
                  dmMProvider.cdsNFEntradaPESOBRUTO.Value         := Transp.Vol.Items[0].pesoB;
                  dmMProvider.cdsNFEntradaPESOLIQUIDO.Value       := Transp.Vol.Items[0].pesoL;

                  if Length(Trim(Transp.Vol.Items[0].nVol)) > 0 then
                    dmMProvider.cdsNFEntradaNUMEROVOLUME.Value := StrToInt(Transp.Vol.Items[0].nVol)
                  else
                    dmMProvider.cdsNFEntradaNUMEROVOLUME.Value := 0;

                  dmMProvider.cdsNFEntradaESPECIEVOLUME.Value     := Transp.Vol.Items[0].esp;
                  dmMProvider.cdsNFEntradaMARCAVOLUME.Value       := Transp.Vol.Items[0].marca;
                  dmMProvider.cdsNFEntradaVALORDOSEGURO.Value     := Total.ICMSTot.vSeg;
                  dmMProvider.cdsNFEntradaOUTRASDESPESAS.Value    := Total.ICMSTot.vOutro;
                  dmMProvider.cdsNFEntradaVALORDOIPI.Value        := Total.ICMSTot.vIPI;
                  dmMProvider.cdsNFEntradaDESCONTOGERAL.Value     := Total.ICMSTot.vDesc;
                  dmMProvider.cdsNFEntradaOBSERVACAO.Value        := InfAdic.infCpl;
//                  dmMProvider.cdsNFEntradaOBSERVACAO_FISCAL.Value := InfAdic.infAdFisco;
                  dmMProvider.cdsNFEntradaVALORDOSPRODUTOS.Value  := Total.ICMSTot.vProd;
                  dmMProvider.cdsNFEntradaVALORDANOTA.Value       := Total.ICMSTot.vNF;

                  Man_Tab_NFEntrada(0);

                  if dmMProvider.cdsConfiguracoesIMPORTAR_PARCELAS_NFE.Value = 1 then
                  begin

                    for iDup := 0 to Cobr.Dup.Count - 1 do
                      Man_Tab_Parcelas_NFE(0, dmMProvider.cdsNFEntradaNFENTRADA.Value, Cobr.Dup[iDup].nDup, Cobr.Dup[iDup].dVenc, Cobr.Dup[iDup].vDup);

                  end;

                  RelacionarParcelas_NFE(dmMProvider.cdsNFEntradaNFENTRADA.Value);
                  RelacionarItens_NFE(dmMProvider.cdsNFEntradaNFENTRADA.Value, false);

                  Mensagem(false, dmDBEXMaster.sNomeUsuario + MSG_IMPORTANDO_XML);

                  for iItem := 0 to Det.Count - 1 do
                  begin

                    with Det.Items[iItem] do
                    begin

                      Mensagem(false, dmDBEXMaster.sNomeUsuario +  MSG_IMPORTANDO_XML + 'Item ' + IntToStr(iItem + 1) + ' de ' + IntToStr(Det.Count));

                      for iCfop := 0 to Det.Count - 1 do
//                        IncluirCfopCorrelata(Prod.CFOP, dmMProvider.cdsNFEntradaUF_EMITENTE.Value, dmMProvider.cdsNFEntradaNFENTRADA.Value);

                      if dmDBEXMaster.ValidarPesquisaProduto(StrToInt(tsItem_Nota[iItem])) then
                      begin

                        // verifica se existe os detalhes do produto;
                        if dmDBEXMaster.ValidarPesquisaProduto_Filial(dmDBEXMaster.fdqProdutos.FieldByName('PRODUTO').Value) then
                          dmMProvider.cdsItem_NFEntrada.Append;

                      end;

                      dmMProvider.cdsItem_NFEntradaNFENTRADA.Value      := dmMProvider.cdsNFEntradaNFENTRADA.Value;
                      dmMProvider.cdsItem_NFEntradaITEMNFENTRADA.Value  := -1;
                      dmMProvider.cdsItem_NFEntradaEAN.Value            := FormatFloat('00000', StrToInt(tsItem_Nota[iItem]));
                      dmMProvider.cdsItem_NFEntradaPRODUTO.Value        := StrToInt(tsItem_Nota[iItem]);
                      dmMProvider.cdsItem_NFEntradaCST.Value            := StrToInt(CSTICMSToStr(Imposto.ICMS.CST));
                      dmMProvider.cdsItem_NFEntradaQUANTIDADE.Value     := Prod.qCom;

                      if dmDBEXMaster.fdqBarras.Active then
                        dmMProvider.cdsItem_NFEntradaUNIDADEEMBALAGEM.Value := dmDBEXMaster.fdqBarras.FieldByName('QUANTIDADE').Value
                      else
                        dmMProvider.cdsItem_NFEntradaUNIDADEEMBALAGEM.Value := 1;

                      dmMProvider.cdsItem_NFEntradaVALORUNITARIO.Value      := Prod.vUnCom;
                      dmMProvider.cdsItem_NFEntradaDESCONTO.Value           := 0;
                      dmMProvider.cdsItem_NFEntradaIPI.Value                := Imposto.IPI.pIPI;
                      dmMProvider.cdsItem_NFEntradaICMSENTRADA.Value        := Imposto.ICMS.pICMS;
                      dmMProvider.cdsItem_NFEntradaICMSSAIDA.Value          := dmDBEXMaster.fdqProdutoFilial.FieldByName('ICMSAPAGAR').Value;
//                      dmMProvider.cdsItem_NFEntradaCFOP.Value               := Retornar_CfopCorrelata_Item(Prod.CFOP, dmMProvider.cdsNFEntradaUF_EMITENTE.Value);
                      dmMProvider.cdsItem_NFEntradaBASE_ICMS.Value          := Imposto.ICMS.vBC;
                      dmMProvider.cdsItem_NFEntradaBASE_SUBSTITUICAO.Value  := Imposto.ICMS.vBCST;
                      dmMProvider.cdsItem_NFEntradaVALOR_DESCONTO.Value     := Prod.vDesc;
                      dmMProvider.cdsItem_NFEntradaVALOR_ICMS.Value         := Imposto.ICMS.vICMS;
                      dmMProvider.cdsItem_NFEntradaVALOR_IPI.Value          := Imposto.IPI.vIPI;
                      dmMProvider.cdsItem_NFEntradaVALOR_SUBSTITUICAO.Value := Imposto.ICMS.vICMSST;
                      dmMProvider.cdsItem_NFEntradaTIPO_DESCONTO.Value      := 1;
                      dmMProvider.cdsItem_NFEntradaSUB_TOTAL.Value          := Prod.vProd;

                      if Copy(FormatFloat('000', dmMProvider.cdsItem_NFEntradaCST.Value), 2, 2) = '20'
                      then
                        dmMProvider.cdsItem_NFEntradaISENTO_NAOTRIBUTADO.Value := (dmMProvider.cdsItem_NFEntradaSUB_TOTAL.Value - dmMProvider.cdsItem_NFEntradaBASE_ICMS.Value)
                      else
                        dmMProvider.cdsItem_NFEntradaISENTO_NAOTRIBUTADO.Value := dmMProvider.cdsItem_NFEntradaVALOR_DESCONTO.Value;

                      dmMProvider.cdsItem_NFEntradaENCARGOS.Value               := Prod.vOutro;
                      dmMProvider.cdsItem_NFEntradaNCM.Value                    := Prod.NCM;
                      dmMProvider.cdsItem_NFEntradaREDUCAO_BASE.Value           := Imposto.ICMS.pRedBC;
                      dmMProvider.cdsItem_NFEntradaBASE_ICMS_SIMPLES.Value      := Imposto.ICMS.pCredSN;
                      dmMProvider.cdsItem_NFEntradaVALOR_ICMS_SIMPLES.Value     := Imposto.ICMS.vCredICMSSN;
                      dmMProvider.cdsItem_NFEntradaALIQUOTA_ST.Value            := Imposto.ICMS.pICMSST;
                      dmMProvider.cdsItem_NFEntradaIND_APURACAO_IPI.Value       := 0;
                      dmMProvider.cdsItem_NFEntradaCOD_ENQUADRAMENTO_IPI.Value  := Imposto.IPI.clEnq;
                      dmMProvider.cdsItem_NFEntradaBASE_CALCULO_IPI.Value       := Imposto.IPI.vBC;
                      dmMProvider.cdsItem_NFEntradaALIQUOTA_IPI.Value           := Imposto.IPI.pIPI;
                      dmMProvider.cdsItem_NFEntradaCST_PIS.Value                := dmDBEXMaster.fdqProdutos.FieldByName('CST_PIS_ENTRADA').Value;
                      dmMProvider.cdsItem_NFEntradaP_ALIQUOTA_PIS.Value         := dmDBEXMaster.fdqProdutos.FieldByName('ALIQUOTA_PIS_ENTRADA').Value;
                      dmMProvider.cdsItem_NFEntradaQUANT_BC_PIS.Value           := 0;
                      dmMProvider.cdsItem_NFEntradaV_ALIQUOTA_PIS.Value         := 0;

                      if dmMProvider.cdsItem_NFEntradaP_ALIQUOTA_PIS.Value > 0 then
                      begin

                        dmMProvider.cdsItem_NFEntradaVALOR_BASE_PIS.Value   :=  Prod.vProd;
                        dmMProvider.cdsItem_NFEntradaVALOR_PIS.Value        := Prod.vProd * (dmMProvider.cdsItem_NFEntradaP_ALIQUOTA_PIS.Value / 100)

                      end
                      else
                      begin

                        dmMProvider.cdsItem_NFEntradaVALOR_BASE_PIS.Value   := 0;
                        dmMProvider.cdsItem_NFEntradaVALOR_PIS.Value        := 0;

                      end;

                      dmMProvider.cdsItem_NFEntradaCST_COFINS.Value         := dmDBEXMaster.fdqProdutos.FieldByName('CST_COFINS_ENTRADA').Value;
                      dmMProvider.cdsItem_NFEntradaP_ALIQUOTA_COFINS.Value  := dmDBEXMaster.fdqProdutos.FieldByName('ALIQUOTA_COFINS_ENTRADA').Value;

                      if dmMProvider.cdsItem_NFEntradaP_ALIQUOTA_COFINS.Value > 0 then
                      begin

                        dmMProvider.cdsItem_NFEntradaVALOR_BC_COFINS.Value  := Prod.vProd;
                        dmMProvider.cdsItem_NFEntradaVALOR_COFINS.Value     := Prod.vProd * (dmMProvider.cdsItem_NFEntradaP_ALIQUOTA_COFINS.Value / 100)

                      end
                      else
                      begin

                        dmMProvider.cdsItem_NFEntradaVALOR_BC_COFINS.Value  := 0;
                        dmMProvider.cdsItem_NFEntradaVALOR_COFINS.Value     := 0;

                      end;

                      dmMProvider.cdsItem_NFEntradaQUANTIDADE_BC_COFINS.Value := 0;
                      dmMProvider.cdsItem_NFEntradaV_ALIQUOTA_COFINS.Value    := 0;
                      dmMProvider.cdsItem_NFEntradaCST_IPI.Value              := CSTIPIToStr(Imposto.IPI.CST);
                      dmMProvider.cdsItem_NFEntradaNUMERO_ITEM.Value          := Prod.nItem;
                      dmMProvider.cdsItem_NFEntradaFRETE_RATEADO.Value        := Prod.vFrete;

                      Man_Tab_ItemNFEntrada(0, dmMProvider.cdsNFEntradaNFENTRADA.Value, 1);

                    end;

                  end;

                  RelacionarParcelas_NFE(dmMProvider.cdsNFEntradaNFENTRADA.Value);

                  LimparMSG_ERRO;

                  OcultarAbas(True);
                  pgcNFEntrada.ActivePageIndex := 1;
                  HabilitaDesabilitaControles(True);

                  if dmMProvider.cdsNFEntradaTIPOFRETE.Value = 1 then
                  begin

                    lblMsg.Tag := ord(ImportarXML_CTE);
                    Mensagem(True, dmDBEXMaster.sNomeUsuario + MSG_IMPORTAR_XML_CTE);

                  end;

                end
                else
                begin

                  Mensagem(false, dmDBEXMaster.sNomeUsuario + ', aguarde...');

                  RelacionarCFOP_NFE(dmMProvider.cdsNFEntradaNFENTRADA.Value);
                  RelacionarParcelas_NFE(dmMProvider.cdsNFEntradaNFENTRADA.Value);
                  RelacionarFrete_NFE(dmMProvider.cdsNFEntradaNFENTRADA.Value);
                  RelacionarItens_NFE(dmMProvider.cdsNFEntradaNFENTRADA.Value, True);

                  LimparMSG_ERRO;

                  dmDBEXMaster.fdqFornecedor.Close;

                end;

              end

              else

              begin

                Mensagem(false, dmDBEXMaster.sNomeUsuario + MSG_PESQUISA + ' - Fornecedor/CNPJ: ' + Emit.CNPJCPF);
                dmDBEXMaster.fdqFornecedor.Close;

              end;

            end;

          end;

        end;

        FreeAndNil(NFe);

      end;
    IMPORTAR_XML_CTE:begin

        CTe := TACBrCTe.Create(self);
        CTe.Conhecimentos.Clear;
        CTe.Conhecimentos.LoadFromFile(pArq);

        if CTe.Conhecimentos.Count = 1 then
        begin

          LimparMSG_ERRO;

          with CTe.Conhecimentos.Items[0].CTe do
          begin

            if infCTeNorm.infDoc.infNFe.Items[0].chave <> dmMProvider.cdsNFEntradaPROTOCOLO_DANFE.Value then
            begin

              Mensagem(false, dmDBEXMaster.sNomeUsuario + MSG_CONSISTE_CHAVE_CTE_NFE + ' - '
                        + infCTeNorm.infDoc.infNFe.Items[0].chave);
              FreeAndNil(CTe);
              exit;

            end;

            // posiciona ponteiro na loja em uso
            dmMProvider.cdsFilial.Locate('FILIAL', dmDBEXMaster.iIdFilial, []);

            // verifica cnpj destinatario
            if Dest.CNPJCPF <> dmMProvider.cdsFilialCNPJ.Value then
              Mensagem(false, dmDBEXMaster.sNomeUsuario + MSG_CONSISTE_CNPJ__DEST_NFE)
            else
            begin

              dmDBEXMaster.fdqFornecedor.Close;
              dmDBEXMaster.fdqFornecedor.SQL.Clear;
              dmDBEXMaster.fdqFornecedor.SQL.Add('select FORNECEDOR.*, CIDADES.NOME as NOME_CIDADE from FORNECEDOR');
              dmDBEXMaster.fdqFornecedor.SQL.Add('JOIN CIDADES CIDADES');
              dmDBEXMaster.fdqFornecedor.SQL.Add('ON(CIDADES.CIDADE = FORNECEDOR.CIDADE)');
              dmDBEXMaster.fdqFornecedor.SQL.Add('WHERE CNPJ = ' + QuotedStr(Emit.CNPJ));
              dmDBEXMaster.fdqFornecedor.Open;

              // verifica fornecedor cadastro
              if not dmDBEXMaster.fdqFornecedor.IsEmpty then
              begin

                iFornecedor := dmDBEXMaster.fdqFornecedor.FieldByName('FORNECEDOR').Value;

                // verifica codigo ibge cadsatro de cidade
                if not dmDBEXMaster.VerificarCodigoIBGE(dmDBEXMaster.fdqFornecedor.FieldByName('CIDADE').Value, Emit.EnderEmit.cMun) then
                begin

                  sLinhaComando := ExtractFilePath(Application.ExeName) + 'Cidades.exe '
                                    + dmDBEXMaster.sNomeUsuario + ' '
                                    + dmDBEXMaster.sSenha + ' '
                                    + IntToStr(dmDBEXMaster.iIdUsuario) + ' '
                                    + IntToStr(dmDBEXMaster.iIdFilial) + ' '
                                    + IntToStr(dmDBEXMaster.fdqFornecedor.FieldByName('CIDADE').Value) + ' ' + IntToStr(Emit.EnderEmit.cMun);

                  CriarProcessoSimples(sLinhaComando);

                  Mensagem(false, dmDBEXMaster.sNomeUsuario + MSG_CONFIG_CODIGO_IBGE_CIDADE + ' - '
                            +dmDBEXMaster.fdqFornecedor.FieldByName('NOME_CIDADE').Value + ' - ' + IntToStr(Emit.EnderEmit.cMun));

                end;

                if not AbrirTabelaCTE(0, 'NF_ENTRADA = ' + QuotedStr(IntToStr(dmMProvider.cdsNFEntradaNFENTRADA.Value))) then
                begin

                  if not dmDBEXMaster.ValidarPesquisaCfopCorrelata(IntToStr(Ide.CFOP), Emit.EnderEmit.UF) then
                  begin

                    Mensagem(false, dmDBEXMaster.sNomeUsuario + MSG_CFOP_CORRELATA_N_CONFIG + ' CFOP ' + IntToStr(Ide.CFOP));

                    sLinhaComando := ExtractFilePath(Application.ExeName) + 'CFOP_CFPS.exe '
                                      + dmDBEXMaster.sNomeUsuario + ' ' + dmDBEXMaster.sSenha + ' '
                                      + IntToStr(dmDBEXMaster.iIdUsuario) + ' '
                                      + IntToStr(dmDBEXMaster.iIdFilial) + ' '
                                      + IntToStr(Ide.CFOP);

                    CriarProcessoSimples(sLinhaComando);

                    exit;

                  end;

                  dmMProvider.cdsConhecimentoFrete.Append;
                  dmMProvider.cdsConhecimentoFreteCONHECIMENTO_FRETE.Value  := 0;
                  dmMProvider.cdsConhecimentoFreteNF_ENTRADA.Value          := dmMProvider.cdsNFEntradaNFENTRADA.Value;
                  dmMProvider.cdsConhecimentoFreteFORNECEDOR.Value          := iFornecedor;
                  dmMProvider.cdsConhecimentoFreteCNPJ.Value                := Emit.CNPJ;
                  dmMProvider.cdsConhecimentoFreteINSCRICAO.Value           := Emit.IE;
                  dmMProvider.cdsConhecimentoFreteEMISSAO_ENTRADA.Value     := Ide.dhEmi;
                  dmMProvider.cdsConhecimentoFreteENTRADA.Value             := Date;
                  dmMProvider.cdsConhecimentoFreteESTADO.Value              := Emit.EnderEmit.UF;
                  dmMProvider.cdsConhecimentoFreteMODELO.Value              := StrToInt(Ide.modelo);
                  dmMProvider.cdsConhecimentoFreteSERIE.Value               := IntToStr(Ide.serie);
                  dmMProvider.cdsConhecimentoFreteSUBSERIE.Value            := '';
                  dmMProvider.cdsConhecimentoFreteNUMERO.Value              := Ide.nCT;
                  dmMProvider.cdsConhecimentoFreteCFOP.Value                := Retornar_CfopCorrelata_Item(IntToStr(Ide.CFOP), Emit.EnderEmit.UF);
                  dmMProvider.cdsConhecimentoFreteVALOR_TOTAL.Value         := vPrest.vTPrest;

                  sCST_Frete                                                := CSTICMSToStr(imp.ICMS.SituTrib);

                  dmMProvider.cdsConhecimentoFreteBASE_CALCULO.Value        := 0;
                  dmMProvider.cdsConhecimentoFreteVALOR_ICMS.Value          := 0;
                  dmMProvider.cdsConhecimentoFreteALIQUOTA_ICMS.Value       := 0;

                  if sCST_Frete = '00' then
                  begin

                    dmMProvider.cdsConhecimentoFreteBASE_CALCULO.Value      := imp.ICMS.ICMS00.vBC;
                    dmMProvider.cdsConhecimentoFreteVALOR_ICMS.Value        := imp.ICMS.ICMS00.vICMS;
                    dmMProvider.cdsConhecimentoFreteALIQUOTA_ICMS.Value     := imp.ICMS.ICMS00.pICMS;

                  end
                  else if sCST_Frete = '20' then
                  begin

                    dmMProvider.cdsConhecimentoFreteBASE_CALCULO.Value      := imp.ICMS.ICMS20.vBC;
                    dmMProvider.cdsConhecimentoFreteVALOR_ICMS.Value        := imp.ICMS.ICMS20.vICMS;
                    dmMProvider.cdsConhecimentoFreteALIQUOTA_ICMS.Value     := imp.ICMS.ICMS20.pICMS;

                  end
                  else if sCST_Frete = '90' then
                  begin

                    dmMProvider.cdsConhecimentoFreteBASE_CALCULO.Value      := imp.ICMS.ICMS90.vBC;
                    dmMProvider.cdsConhecimentoFreteVALOR_ICMS.Value        := imp.ICMS.ICMS90.vICMS;
                    dmMProvider.cdsConhecimentoFreteALIQUOTA_ICMS.Value     := imp.ICMS.ICMS90.pICMS;

                  end;

                  dmMProvider.cdsConhecimentoFreteISENTA_NAO_TRIBUTADA. Value := 0;
                  dmMProvider.cdsConhecimentoFreteOUTRAS.Value                := 0;
                  dmMProvider.cdsConhecimentoFreteCIF_FOB.Value               := 0;
                  dmMProvider.cdsConhecimentoFreteCANCELADO.Value             := '';
                  dmMProvider.cdsConhecimentoFreteSTATUS.Value                := 0;
                  dmMProvider.cdsConhecimentoFreteTIPO_CTE.Value              := StrToInt(tpCTToStr(Ide.tpCTe));
                  dmMProvider.cdsConhecimentoFreteVALOR_DESCONTO.Value        := 0;;
                  dmMProvider.cdsConhecimentoFreteCHAVE_CTE.Value             := procCTe.chCTe;
                  dmMProvider.cdsConhecimentoFreteCHAVE_CTE_REF.Value         := infCteComp.chave;
                  dmMProvider.cdsConhecimentoFreteCST_ICMS.Value              := StrToInt(sCST_Frete);
                  dmMProvider.cdsConhecimentoFreteSITUACAO_DOC.Value          := 0;

                  Man_Tab_Conhecimento_Frete(0);
                  RelacionarFrete_NFE(dmMProvider.cdsNFEntradaNFENTRADA.Value);

                end;

              end

              else
              begin

                Mensagem(false, dmDBEXMaster.sNomeUsuario + MSG_PESQUISA + ' - Emitente Frete/CNPJ: ' + Emit.CNPJ);
                dmDBEXMaster.fdqFornecedor.Close;

              end;

            end;

          end;

        end;

        FreeAndNil(CTe);

      end;
  end;

  FreeAndNil(tsItens_EAN);
  FreeAndNil(tsItens_REF);
  FreeAndNil(tsItem_Nota);

end;

procedure TfrmModNFEntrada.IncluirCfopCorrelata(pCfop, pUF: string;
  pNota: Integer);
var
  sCfop: string;
begin

  dmDBEXMaster.fdqCFOP_CFPS.Close;
  dmDBEXMaster.fdqCFOP_CFPS.SQL.Clear;
  dmDBEXMaster.fdqCFOP_CFPS.SQL.Add('SELECT * FROM CFOP');
  dmDBEXMaster.fdqCFOP_CFPS.SQL.Add('WHERE CFOP = ' + pCfop);
  dmDBEXMaster.fdqCFOP_CFPS.Open;

  if dmMProvider.cdsFilialESTADO.Value <> pUF then
    sCfop := dmDBEXMaster.fdqCFOP_CFPS.FieldByName('CFOP_ENTRADA_INTERESTADUAL').AsString
  else
    sCfop := dmDBEXMaster.fdqCFOP_CFPS.FieldByName('CFOP_ENTRADA_ESTADUAL').AsString;

  Man_Tab_CFOP_Entrada(0, dmMProvider.cdsNFEntradaNFENTRADA.Value, sCfop);

  RelacionarCFOP_NFE(dmMProvider.cdsNFEntradaNFENTRADA.Value);

  dmDBEXMaster.fdqCFOP_CFPS.Close;

end;

function TfrmModNFEntrada.LancarRentabilidade(pOpcao: smallint): boolean;
var
  dPerda, dQuantidadeReal: Currency;
begin

  try

    case pOpcao of
      0:
        begin

          dPerda := 0;
          dQuantidadeReal := 0;

          dmMSProcedure.fdspMaster.StoredProcName := 'EXECUTA_SQL';
          dmMSProcedure.fdspMaster.Prepare;

          dmMSProcedure.fdspMaster.Params[0].Value :=  'DELETE FROM ENTRADASRENTABILIDADE WHERE RENTABILIDADE = '
                                                        + IntToStr(dmDBEXMaster.fdqSelRentabilidade.FieldByName('RENTABILIDADE').Value);
          dmMSProcedure.fdspMaster.ExecProc;

          dPerda          := dmMProvider.cdsItem_NFEntradaQUANTIDADE.Value * (dmDBEXMaster.fdqSelRentabilidade.FieldByName('PERCENTUALPERDA').Value / 100);
          dQuantidadeReal := dmMProvider.cdsItem_NFEntradaQUANTIDADE.Value;

          while not dmDBEXMaster.fdqSelItemRentabilidade.Eof do
          begin

            if dmDBEXMaster.ValidarPesquisaProduto(dmDBEXMaster.fdqSelItemRentabilidade.FieldByName('PRODUTO').Value) then
            begin

              dmMSProcedure.fdspLancarRentabilidade.Params[0].Value := Date;
              dmMSProcedure.fdspLancarRentabilidade.Params[1].Value := dmDBEXMaster.fdqProdutos.FieldByName('PRODUTO').Value;
              dmMSProcedure.fdspLancarRentabilidade.Params[2].Value := (dQuantidadeReal * (dmDBEXMaster.fdqSelItemRentabilidade.FieldByName('RENDIMENTO').Value / 100));
              dmMSProcedure.fdspLancarRentabilidade.Params[3].Value := dmDBEXMaster.fdqSelItemRentabilidade.FieldByName('RENDIMENTO').Value;
              dmMSProcedure.fdspLancarRentabilidade.Params[4].Value := dmDBEXMaster.fdqSelItemRentabilidade.FieldByName('RENTABILIDADE').Value;
              dmMSProcedure.fdspLancarRentabilidade.ExecProc;

            end;

            dmDBEXMaster.fdqSelItemRentabilidade.Next;

          end;

          dmMProvider.cdsDesdobRentabil.Close;
          dmMProvider.cdsDesdobRentabil.ProviderName := 'dspDesdobRentabil';

          dmDBEXMaster.fdqDesdob_Rentabil.SQL.Clear;
          dmDBEXMaster.fdqDesdob_Rentabil.SQL.Add('select ent_rent.*, (select pro.descricao from produto pro where pro.produto = ent_rent.produto order by pro.descricao) from entradasrentabilidade ent_rent');
          dmDBEXMaster.fdqDesdob_Rentabil.SQL.Add('where ent.rent.rentabilidade = ' + IntToStr(dmDBEXMaster.fdqSelItemRentabilidade.FieldByName('RENTABILIDADE').Value));

          dmMProvider.cdsDesdobRentabil.Open;
          dmMProvider.cdsDesdobRentabil.ProviderName := '';

          dmDBEXMaster.fdqSelRentabilidade.Close;
          dmDBEXMaster.fdqSelItemRentabilidade.Close;

          frmDesdobramentoRentabilidade := TfrmDesdobramentoRentabilidade.Create(self);
          frmDesdobramentoRentabilidade.memInformacoes.Clear;
          frmDesdobramentoRentabilidade.memInformacoes.Lines.Add('');
          frmDesdobramentoRentabilidade.memInformacoes.Lines.Add('Com base em informações previamente configuradas, após confirmação, os itens acima relacionados terão seus');
          frmDesdobramentoRentabilidade.memInformacoes.Lines.Add('saldos acrescidos de suas respectivas quantidades.');
          frmDesdobramentoRentabilidade.edtQtdNF.Value    := dQuantidadeReal;
          frmDesdobramentoRentabilidade.edtQtdPerda.Value := dPerda;
          frmDesdobramentoRentabilidade.edtQtdReal.Value  := dQuantidadeReal - dPerda;

          Result := frmDesdobramentoRentabilidade.ShowModal = mrOk;
          FreeAndNil(frmDesdobramentoRentabilidade);

        end;

      1:
        begin // estorno

          dPerda          := 0;
          dQuantidadeReal := 0;

          dmMSProcedure.fdspMaster.StoredProcName := 'EXECUTA_SQL';
          dmMSProcedure.fdspMaster.Prepare;

          dmMSProcedure.fdspMaster.Params[0].Value := 'DELETE FROM ENTRADASRENTABILIDADE WHERE RENTABILIDADE = '
                                                        + IntToStr(dmDBEXMaster.fdqSelRentabilidade.FieldByName('RENTABILIDADE').Value);
          dmMSProcedure.fdspMaster.ExecProc;

          dPerda          := dmMProvider.cdsItem_NFEntradaQUANTIDADE.Value *(dmDBEXMaster.fdqSelRentabilidade.FieldByName('PERCENTUALPERDA').Value / 100);
          dQuantidadeReal := dmMProvider.cdsItem_NFEntradaQUANTIDADE.Value;

          while not dmDBEXMaster.fdqSelItemRentabilidade.Eof do
          begin

            if dmDBEXMaster.ValidarPesquisaProduto(dmDBEXMaster.fdqSelItemRentabilidade.FieldByName('PRODUTO').Value) then
            begin

              dmMSProcedure.fdspLancarRentabilidade.Params[0].Value := Date;
              dmMSProcedure.fdspLancarRentabilidade.Params[1].Value := dmDBEXMaster.fdqProdutos.FieldByName('PRODUTO').Value;
              dmMSProcedure.fdspLancarRentabilidade.Params[2].Value := (dQuantidadeReal *(dmDBEXMaster.fdqSelItemRentabilidade.FieldByName('RENDIMENTO').Value / 100));
              dmMSProcedure.fdspLancarRentabilidade.Params[3].Value := dmDBEXMaster.fdqSelItemRentabilidade.FieldByName('RENDIMENTO').Value;
              dmMSProcedure.fdspLancarRentabilidade.Params[4].Value := dmDBEXMaster.fdqSelItemRentabilidade.FieldByName('RENTABILIDADE').Value;
              dmMSProcedure.fdspLancarRentabilidade.ExecProc;

            end;

            dmDBEXMaster.fdqSelItemRentabilidade.Next;

          end;

          dmMProvider.cdsDesdobRentabil.Close;
          dmMProvider.cdsDesdobRentabil.ProviderName := 'dspDesdobRentabil';

          dmDBEXMaster.fdqDesdob_Rentabil.SQL.Clear;
          dmDBEXMaster.fdqDesdob_Rentabil.SQL.Add('select ent_rent.*, (select pro.descricao from produto pro where pro.produto = ent_rent.produto order by pro.descricao) from entradasrentabilidade ent_rent');
          dmDBEXMaster.fdqDesdob_Rentabil.SQL.Add('where ent.rent.rentabilidade = ' + IntToStr(dmDBEXMaster.fdqSelItemRentabilidade.FieldByName('RENTABILIDADE').Value));

          dmMProvider.cdsDesdobRentabil.Open;
          dmMProvider.cdsDesdobRentabil.ProviderName := '';

          dmDBEXMaster.fdqSelRentabilidade.Close;
          dmDBEXMaster.fdqSelItemRentabilidade.Close;

          frmDesdobramentoRentabilidade := TfrmDesdobramentoRentabilidade.Create(self);
          frmDesdobramentoRentabilidade.memInformacoes.Clear;
          frmDesdobramentoRentabilidade.memInformacoes.Lines.Add('');
          frmDesdobramentoRentabilidade.memInformacoes.Lines.Add('Com base em informações previamente configuradas, após confirmação, os itens acima relacionados terão seus');
          frmDesdobramentoRentabilidade.memInformacoes.Lines.Add('saldos acrescidos de suas respectivas quantidades.');
          frmDesdobramentoRentabilidade.edtQtdNF.Value    := dQuantidadeReal;
          frmDesdobramentoRentabilidade.edtQtdPerda.Value := dPerda;
          frmDesdobramentoRentabilidade.edtQtdReal.Value  := dQuantidadeReal - dPerda;

          Result := frmDesdobramentoRentabilidade.ShowModal = mrOk;
          FreeAndNil(frmDesdobramentoRentabilidade);

        end;
    end;
  except
    on E: exception do
    begin

      Tratar_Erro_Conexao(E);
      dmDBEXMaster.fdtMaster.RollbackRetaining;
      Result := false;

    end;

  end;

end;

procedure TfrmModNFEntrada.lblF5Click(Sender: TObject);
begin

  LimparMSG_ERRO;

  if dmMProvider.cdsNFEntrada.Active then
  begin

    if not(dmMProvider.cdsNFEntrada.State in [dsEdit, dsInsert]) then
    begin

      if dmMProvider.cdsNFEntradaSTATUS.Value = 0 then
      begin

        lblMsg.Tag := ord(excluir);
        Mensagem(false, dmDBEXMaster.sNomeUsuario + MSG_CONFIRMA_EXCLUSAO);

      end
      else
        Mensagem(false, dmDBEXMaster.sNomeUsuario + MSG_STATUS_NAO_PERMITE);

    end;

  end;

end;

procedure TfrmModNFEntrada.LimparCampos;
begin

  edtReferencia.Clear;
  edtCodigoGTIN.Clear;
  edtDescricaoProduto.Clear;
  edtUnidade.Clear;
  edtNCM.Clear;
  edtCST_CSOSN.Clear;
  edtCFOP.Clear;
  edtUnEmbalagem.Value := 1;
  edtQuantidade.Value := 1;
  edtValorUnitario.Value := 1;
  edtDesconto.Value := 0;
  edtEncargos.Value := 0;
  edtCST_IPI.Clear;
  edtCodEnqIPI.Clear;
  edtBasecalcIPI_Item.Value := 0;
  edtAliqIPI_Item.Value := 0;
  edtValorIPI_Item.Value := 0;
  edtValorTotalItem.Value := 0;
  edtAliqICMS_Item.Value := 0;
  edtRedBaseCalc_Item.Value := 0;
  edtBaseCalcICMS_Item.Value := 0;
  edtValorICMS_Item.Value := 0;
  edtBaseCalcICMSR_Item.Value := 0;
  edtAliqICMSR_Item.Value := 0;
  edtValorICMSR_Item.Value := 0;
  edtValorIsentasNT.Value := 0;
  edtCSTPIS.Clear;
  edtBaseCalcPIS.Value := 0;
  edtAliquotaPIS.Value := 0;
  edtValorPIS.Value := 0;
  edtQuantBCPIS.Value := 0;
  edtAliqValorPIS.Value := 0;
  edtCSTCOFINS.Clear;
  edtBaseCalcCOFINS.Value := 0;
  edtAliquotaCOFINS.Value := 0;
  edtValorCOFINS.Value := 0;
  edtQuantBCCOFINS.Value := 0;
  edtAliqCOFINSValor.Value := 0;

end;

procedure TfrmModNFEntrada.LimparMSG_ERRO;
begin

  lblMsg.Caption := '';
  Application.ProcessMessages;

end;

procedure TfrmModNFEntrada.Man_Tab_CFOP_Entrada(pOpcao, pNFEntrada: Integer;
  pCfop: string);
begin

  try

    dmDBEXMaster.fdtMaster.StartTransaction;

    dmMSProcedure.fdspCFOP_Entrada.Params[0].Value := pOpcao;
    dmMSProcedure.fdspCFOP_Entrada.Params[1].Value :=
      dmMProvider.cdsCFOP_NFEntradaCFOP_NFENTRADA.Value;
    dmMSProcedure.fdspCFOP_Entrada.Params[2].Value := pNFEntrada;
    dmMSProcedure.fdspCFOP_Entrada.Params[3].Value := pCfop;
    dmMSProcedure.fdspCFOP_Entrada.Params[4].Value := dmDBEXMaster.iIdUsuario;
    dmMSProcedure.fdspCFOP_Entrada.Params[5].Value := pubNomeComputador;
    dmMSProcedure.fdspCFOP_Entrada.Params[6].Value := ''; // RetornarIP;

    dmMSProcedure.fdspCFOP_Entrada.ExecProc;

    if dmMSProcedure.fdspCFOP_Entrada.Params[7].Value > 0 then
      iProx_CFOPEntrada := dmMSProcedure.fdspCFOP_Entrada.Params[7].Value;

    dmDBEXMaster.fdtMaster.Commit;
    dmDBEXMaster.fdcMaster.Close;;

  except
    on E: exception do
    begin

      Tratar_Erro_Conexao(E);
      dmDBEXMaster.fdtMaster.Rollback;

    end;

  end;

end;

procedure TfrmModNFEntrada.Man_Tab_Conhecimento_Frete(pOpcao: smallint);
begin

  try

    dmDBEXMaster.fdtMaster.StartTransaction;

    dmMSProcedure.fdspConhecimento_Frete.Params[0].Value := pOpcao;

    dmMSProcedure.fdspConhecimento_Frete.Params[1].Value :=
      dmMProvider.cdsConhecimentoFreteCONHECIMENTO_FRETE.Value;
    dmMSProcedure.fdspConhecimento_Frete.Params[2].Value :=
      dmMProvider.cdsNFEntradaNFENTRADA.Value;
    dmMSProcedure.fdspConhecimento_Frete.Params[3].Value :=
      dmMProvider.cdsConhecimentoFreteFORNECEDOR.Value;
    dmMSProcedure.fdspConhecimento_Frete.Params[4].Value :=
      dmMProvider.cdsConhecimentoFreteCNPJ.Value;
    dmMSProcedure.fdspConhecimento_Frete.Params[5].Value :=
      dmMProvider.cdsConhecimentoFreteINSCRICAO.Value;
    dmMSProcedure.fdspConhecimento_Frete.Params[6].Value :=
      dmMProvider.cdsConhecimentoFreteEMISSAO_ENTRADA.Value;
    dmMSProcedure.fdspConhecimento_Frete.Params[7].Value :=
      dmMProvider.cdsConhecimentoFreteENTRADA.Value;
    dmMSProcedure.fdspConhecimento_Frete.Params[8].Value :=
      dmMProvider.cdsConhecimentoFreteESTADO.Value;
    dmMSProcedure.fdspConhecimento_Frete.Params[9].Value :=
      dmMProvider.cdsConhecimentoFreteMODELO.Value;
    dmMSProcedure.fdspConhecimento_Frete.Params[10].Value :=
      dmMProvider.cdsConhecimentoFreteSERIE.Value;
    dmMSProcedure.fdspConhecimento_Frete.Params[11].Value :=
      dmMProvider.cdsConhecimentoFreteSUBSERIE.Value;
    dmMSProcedure.fdspConhecimento_Frete.Params[12].Value :=
      dmMProvider.cdsConhecimentoFreteNUMERO.Value;
    dmMSProcedure.fdspConhecimento_Frete.Params[13].Value :=
      dmMProvider.cdsConhecimentoFreteCFOP.Value;
    dmMSProcedure.fdspConhecimento_Frete.Params[14].Value :=
      dmMProvider.cdsConhecimentoFreteVALOR_TOTAL.Value;
    dmMSProcedure.fdspConhecimento_Frete.Params[15].Value :=
      dmMProvider.cdsConhecimentoFreteBASE_CALCULO.Value;
    dmMSProcedure.fdspConhecimento_Frete.Params[16].Value :=
      dmMProvider.cdsConhecimentoFreteVALOR_ICMS.Value;
    dmMSProcedure.fdspConhecimento_Frete.Params[17].Value :=
      dmMProvider.cdsConhecimentoFreteISENTA_NAO_TRIBUTADA.Value;
    dmMSProcedure.fdspConhecimento_Frete.Params[18].Value :=
      dmMProvider.cdsConhecimentoFreteOUTRAS.Value;
    dmMSProcedure.fdspConhecimento_Frete.Params[19].Value :=
      dmMProvider.cdsConhecimentoFreteCIF_FOB.Value;
    dmMSProcedure.fdspConhecimento_Frete.Params[20].Value :=
      dmMProvider.cdsConhecimentoFreteCANCELADO.Value;
    dmMSProcedure.fdspConhecimento_Frete.Params[21].Value :=
      dmMProvider.cdsConhecimentoFreteSTATUS.Value;
    dmMSProcedure.fdspConhecimento_Frete.Params[22].Value :=
      dmMProvider.cdsConhecimentoFreteTIPO_CTE.Value;
    dmMSProcedure.fdspConhecimento_Frete.Params[23].Value :=
      dmMProvider.cdsConhecimentoFreteVALOR_DESCONTO.Value;
    dmMSProcedure.fdspConhecimento_Frete.Params[24].Value :=
      dmMProvider.cdsConhecimentoFreteCHAVE_CTE.Value;
    dmMSProcedure.fdspConhecimento_Frete.Params[25].Value :=
      dmMProvider.cdsConhecimentoFreteCHAVE_CTE_REF.Value;
    dmMSProcedure.fdspConhecimento_Frete.Params[26].Value :=
      dmMProvider.cdsConhecimentoFreteCST_ICMS.Value;
    dmMSProcedure.fdspConhecimento_Frete.Params[27].Value :=
      dmMProvider.cdsConhecimentoFreteALIQUOTA_ICMS.Value;
    dmMSProcedure.fdspConhecimento_Frete.Params[28].Value :=
      dmMProvider.cdsConhecimentoFreteSITUACAO_DOC.Value;

    dmMSProcedure.fdspConhecimento_Frete.ExecProc;

    if dmMSProcedure.fdspConhecimento_Frete.Params[29].Value > 0 then
      iProx_Conhecimento_Frete := dmMSProcedure.fdspConhecimento_Frete.Params
        [29].Value;

    dmDBEXMaster.fdtMaster.Commit;
    dmDBEXMaster.fdcMaster.Close;;

  except

    on E: exception do
    begin

      Tratar_Erro_Conexao(E);
      dmDBEXMaster.fdtMaster.Rollback;

    end;

  end;

end;

procedure TfrmModNFEntrada.Man_Tab_CPA(pOpcao: smallint; pNFEntrada: Integer);
begin

  try

    dmDBEXMaster.fdtMaster.StartTransaction;

    dmMProvider.cdsParcelasNFE.First;
    dmMProvider.cdsParcelasNFE.DisableControls;

    while not dmMProvider.cdsParcelasNFE.Eof do
    begin

      dmMSProcedure.fdspCpa.Params[0].Value := 0;
      dmMSProcedure.fdspCpa.Params[1].Value := -1;
      dmMSProcedure.fdspCpa.Params[2].Value :=
        dmMProvider.cdsNFEntradaFORNECEDOR.Value;
      dmMSProcedure.fdspCpa.Params[3].Value := 0;
      dmMSProcedure.fdspCpa.Params[4].Value :=
        dmMProvider.cdsParcelasNFEDOCUMENTO.Value;
      dmMSProcedure.fdspCpa.Params[5].Value :=
        dmMProvider.cdsNFEntradaEMISSAO.Value;
      dmMSProcedure.fdspCpa.Params[6].Value := dmDBEXMaster.iIdFilial;
      dmMSProcedure.fdspCpa.Params[7].Value :=
        'LANCAMENTO REALIZADO POR ENTRADA DE NF: ' +
        dmMProvider.cdsNFEntradaNOTAFISCAL.Value;
      dmMSProcedure.fdspCpa.Params[8].Value :=
        dmMProvider.cdsPlanoContasPLANODECONTAS.Value;
      dmMSProcedure.fdspCpa.Params[9].Value :=
        dmMProvider.cdsItemPlContasITEMPLANODECONTAS.Value;
      dmMSProcedure.fdspCpa.Params[10].Value := 0;
      dmMSProcedure.fdspCpa.Params[11].Value :=
        dmMProvider.cdsLancamentosLANCAMENTO.Value;
      dmMSProcedure.fdspCpa.Params[12].Value := 0;
      dmMSProcedure.fdspCpa.Params[13].Value := 0;
      dmMSProcedure.fdspCpa.Params[14].Value :=
        'DOCUMENTO DE ORIGEM: NOTA FISCAL NUMERO: ' +
        dmMProvider.cdsNFEntradaNOTAFISCAL.Value;
      dmMSProcedure.fdspCpa.Params[15].Value := 0;
      dmMSProcedure.fdspCpa.Params[16].Value := '';
      dmMSProcedure.fdspCpa.Params[17].Value := 0;
      dmMSProcedure.fdspCpa.Params[18].Value :=
        dmMProvider.cdsParcelasNFEVALOR.Value;
      dmMSProcedure.fdspCpa.Params[19].Value :=
        dmMProvider.cdsParcelasNFEVENCIMENTO.Value;
      dmMSProcedure.fdspCpa.Params[20].Value := pubNomeComputador;
      dmMSProcedure.fdspCpa.Params[21].Value := '';
      dmMSProcedure.fdspCpa.Params[22].Value := dmDBEXMaster.iIdUsuario;

      dmMSProcedure.fdspCpa.ExecProc;

      dmMProvider.cdsParcelasNFE.Next;

    end;

    dmDBEXMaster.fdtMaster.Commit;
    dmDBEXMaster.fdcMaster.Close;;
    dmMProvider.cdsParcelasNFE.First;
    dmMProvider.cdsParcelasNFE.EnableControls;

  except
    on E: exception do
    begin

      dmMProvider.cdsParcelasNFE.First;
      dmMProvider.cdsParcelasNFE.EnableControls;

      Tratar_Erro_Conexao(E);

      dmDBEXMaster.fdtMaster.Rollback;

    end;

  end;

end;

procedure TfrmModNFEntrada.Man_Tab_ItemNFEntrada(pOpcao: smallint; pNFEntrada, pOrigem: Integer);
begin

  try

    dmDBEXMaster.fdtMaster.StartTransaction;

    dmMSProcedure.fdspItemNFEntrada.Params[0].Value := pOpcao;

    if iProx_ItemNFEntrada <> dmMProvider.cdsItem_NFEntradaITEMNFENTRADA.Value
    then
    begin

      dmMSProcedure.fdspMaster.StoredProcName := 'RETORNAR_GNR_ITEMNFENTRADA';
      dmMSProcedure.fdspMaster.ExecProc;

      iProx_ItemNFEntrada := (dmMSProcedure.fdspMaster.Params[0].Value + 1);

    end;

    dmMSProcedure.fdspItemNFEntrada.Params[1].Value := iProx_ItemNFEntrada;
    dmMSProcedure.fdspItemNFEntrada.Params[2].Value := dmMProvider.cdsNFEntradaNFENTRADA.Value;

    case pOrigem of
      0:begin

          dmMSProcedure.fdspItemNFEntrada.Params[3].Value   := edtCodigoGTIN.Text;
          dmMSProcedure.fdspItemNFEntrada.Params[4].Value   := StrToInt(edtCodigoGTIN.Text);
          dmMSProcedure.fdspItemNFEntrada.Params[5].Value   := edtCFOP.Text;
          dmMSProcedure.fdspItemNFEntrada.Params[6].Value   := edtCST_CSOSN.Text;
          dmMSProcedure.fdspItemNFEntrada.Params[7].Value   := edtQuantidade.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[8].Value   := edtUnEmbalagem.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[9].Value   := edtValorUnitario.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[10].Value  := edtDesconto.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[11].Value  := edtValorIPI_Item.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[12].Value  := edtAliqICMS_Item.Value;

          if dmDBEXMaster.fdqProdutoFilial.Active then
            dmMSProcedure.fdspItemNFEntrada.Params[13].Value := dmDBEXMaster.fdqProdutoFilial.FieldByName('ICMSAPAGAR').Value
          else
            dmMSProcedure.fdspItemNFEntrada.Params[13].Value := dmMProvider.cdsItem_NFEntradaICMSSAIDA.Value;

          dmMSProcedure.fdspItemNFEntrada.Params[14].Value  := edtBaseCalcICMS_Item.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[15].Value  := edtBaseCalcICMSR_Item.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[16].Value  := edtAliqICMSR_Item.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[17].Value  := edtValorICMSR_Item.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[18].Value  := edtValorICMS_Item.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[19].Value  := edtValorIPI_Item.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[20].Value  := edtValorTotalItem.Value;

          dmMSProcedure.fdspItemNFEntrada.Params[21].Value  := edtValorIsentasNT.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[22].Value  := edtEncargos.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[23].Value  := edtNCM.Text;
          dmMSProcedure.fdspItemNFEntrada.Params[24].Value  := edtRedBaseCalc_Item.Value;

          if dmMProvider.cdsNFEntradaALIQUOTA_CREDITO_SIMPLES.Value > 0 then
          begin

            dmMSProcedure.fdspItemNFEntrada.Params[25].Value := edtBaseCalcICMS_Item.Value;
            dmMSProcedure.fdspItemNFEntrada.Params[26].Value := edtValorICMS_Item.Value;

          end
          else
          begin

            dmMSProcedure.fdspItemNFEntrada.Params[25].Value := 0;
            dmMSProcedure.fdspItemNFEntrada.Params[26].Value := 0;

          end;

          dmMSProcedure.fdspItemNFEntrada.Params[27].Value := 0;
          dmMSProcedure.fdspItemNFEntrada.Params[28].Value := edtCodEnqIPI.Text;
          dmMSProcedure.fdspItemNFEntrada.Params[29].Value := edtBasecalcIPI_Item.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[30].Value := edtAliqIPI_Item.Value;

          dmMSProcedure.fdspItemNFEntrada.Params[31].Value := edtCSTPIS.Text;
          dmMSProcedure.fdspItemNFEntrada.Params[32].Value := edtBaseCalcPIS.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[33].Value := edtAliquotaPIS.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[34].Value := edtQuantBCPIS.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[35].Value := edtAliqValorPIS.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[36].Value := edtValorPIS.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[37].Value := edtCSTCOFINS.Text;
          dmMSProcedure.fdspItemNFEntrada.Params[38].Value := edtBaseCalcCOFINS.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[39].Value := edtAliquotaCOFINS.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[40].Value := edtQuantBCCOFINS.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[41].Value := edtAliqCOFINSValor.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[42].Value := edtValorCOFINS.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[43].Value := edtCST_IPI.Text;

          if dmMProvider.cdsItem_NFEntrada.IsEmpty then
            dmMSProcedure.fdspItemNFEntrada.Params[44].Value := 1
          else
            dmMSProcedure.fdspItemNFEntrada.Params[44].Value := dmMProvider.cdsItem_NFEntrada.RecordCount + 1;

        end;

      1:
        begin

          dmMSProcedure.fdspItemNFEntrada.Params[3].Value   := dmMProvider.cdsItem_NFEntradaEAN.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[4].Value   := dmMProvider.cdsItem_NFEntradaPRODUTO.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[5].Value   := dmMProvider.cdsItem_NFEntradaCFOP.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[6].Value   := dmMProvider.cdsItem_NFEntradaCST.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[7].Value   := dmMProvider.cdsItem_NFEntradaQUANTIDADE.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[8].Value   := dmMProvider.cdsItem_NFEntradaUNIDADEEMBALAGEM.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[9].Value   := dmMProvider.cdsItem_NFEntradaVALORUNITARIO.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[10].Value  := dmMProvider.cdsItem_NFEntradaVALOR_DESCONTO.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[11].Value  := dmMProvider.cdsItem_NFEntradaIPI.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[12].Value  := dmMProvider.cdsItem_NFEntradaICMSENTRADA.Value;

          if dmDBEXMaster.fdqProdutoFilial.Active then
            dmMSProcedure.fdspItemNFEntrada.Params[13].Value := dmDBEXMaster.fdqProdutoFilial.FieldByName('ICMSAPAGAR').Value
          else
            dmMSProcedure.fdspItemNFEntrada.Params[13].Value := dmMProvider.cdsItem_NFEntradaICMSSAIDA.Value;

          dmMSProcedure.fdspItemNFEntrada.Params[14].Value  := dmMProvider.cdsItem_NFEntradaBASE_ICMS.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[15].Value  := dmMProvider.cdsItem_NFEntradaBASE_SUBSTITUICAO.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[16].Value  := dmMProvider.cdsItem_NFEntradaALIQUOTA_ST.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[17].Value  := dmMProvider.cdsItem_NFEntradaVALOR_SUBSTITUICAO.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[18].Value  := dmMProvider.cdsItem_NFEntradaVALOR_ICMS.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[19].Value  := dmMProvider.cdsItem_NFEntradaVALOR_IPI.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[20].Value  := dmMProvider.cdsItem_NFEntradaSUB_TOTAL.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[21].Value  := dmMProvider.cdsItem_NFEntradaISENTO_NAOTRIBUTADO.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[22].Value  := dmMProvider.cdsItem_NFEntradaENCARGOS.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[23].Value  := dmMProvider.cdsItem_NFEntradaNCM.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[24].Value  := dmMProvider.cdsItem_NFEntradaREDUCAO_BASE.AsCurrency;
          dmMSProcedure.fdspItemNFEntrada.Params[25].Value  := dmMProvider.cdsItem_NFEntradaBASE_ICMS_SIMPLES.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[26].Value  := dmMProvider.cdsItem_NFEntradaVALOR_ICMS_SIMPLES.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[27].Value  := 0;
          dmMSProcedure.fdspItemNFEntrada.Params[28].Value  := dmMProvider.cdsItem_NFEntradaCOD_ENQUADRAMENTO_IPI.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[29].Value  := dmMProvider.cdsItem_NFEntradaBASE_CALCULO_IPI.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[30].Value  := dmMProvider.cdsItem_NFEntradaALIQUOTA_IPI.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[31].Value  := dmMProvider.cdsItem_NFEntradaCST_PIS.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[32].Value  := dmMProvider.cdsItem_NFEntradaVALOR_BASE_PIS.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[33].Value  := dmMProvider.cdsItem_NFEntradaP_ALIQUOTA_PIS.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[34].Value  := dmMProvider.cdsItem_NFEntradaQUANT_BC_PIS.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[35].Value  := dmMProvider.cdsItem_NFEntradaV_ALIQUOTA_PIS.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[36].Value  := dmMProvider.cdsItem_NFEntradaVALOR_PIS.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[37].Value  := dmMProvider.cdsItem_NFEntradaCST_COFINS.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[38].Value  := dmMProvider.cdsItem_NFEntradaVALOR_BC_COFINS.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[39].Value  := dmMProvider.cdsItem_NFEntradaP_ALIQUOTA_COFINS.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[40].Value  := dmMProvider.cdsItem_NFEntradaQUANTIDADE_BC_COFINS.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[41].Value  := dmMProvider.cdsItem_NFEntradaV_ALIQUOTA_COFINS.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[42].Value  := dmMProvider.cdsItem_NFEntradaVALOR_COFINS.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[43].Value  := dmMProvider.cdsItem_NFEntradaCST_IPI.Value;
          dmMSProcedure.fdspItemNFEntrada.Params[44].Value  := dmMProvider.cdsItem_NFEntradaNUMERO_ITEM.Value;

        end;

    end;

    dmMSProcedure.fdspItemNFEntrada.Params[45].Value := dmDBEXMaster.iIdUsuario;
    dmMSProcedure.fdspItemNFEntrada.Params[46].Value := pubNomeComputador;
    dmMSProcedure.fdspItemNFEntrada.Params[47].Value := ''; // RetornarIP;
    dmMSProcedure.fdspItemNFEntrada.Params[48].Value := edtValorFreteItem.Value;

    dmMSProcedure.fdspItemNFEntrada.ExecProc;

    if dmMSProcedure.fdspItemNFEntrada.Params[49].Value > 0 then
      dmMProvider.cdsItem_NFEntradaITEMNFENTRADA.Value := dmMSProcedure.fdspItemNFEntrada.Params[49].Value;

    if dmMProvider.cdsItem_NFEntrada.State in [dsEdit, dsInsert] then
      dmMProvider.cdsItem_NFEntrada.Post;

    dmDBEXMaster.fdtMaster.Commit;
    dmDBEXMaster.fdcMaster.Close;;

    iProx_ItemNFEntrada := 0;

  except
    on E: exception do
    begin

      Tratar_Erro_Conexao(E);
      dmDBEXMaster.fdtMaster.Rollback;

    end;

  end;

end;

procedure TfrmModNFEntrada.Man_Tab_NFEntrada(pOpcao: smallint);
begin

  try

    dmDBEXMaster.fdtMaster.StartTransaction;

    dmMSProcedure.fdspNFEntrada.Params[0].Value := pOpcao;
    dmMSProcedure.fdspNFEntrada.Params[1].Value := dmMProvider.cdsNFEntradaNFENTRADA.Value;
    dmMSProcedure.fdspNFEntrada.Params[2].Value := dmMProvider.cdsNFEntradaNOTAFISCAL.Value;
    dmMSProcedure.fdspNFEntrada.Params[3].Value := dmMProvider.cdsNFEntradaFORNECEDOR.Value;
    dmMSProcedure.fdspNFEntrada.Params[4].Value := dmMProvider.cdsNFEntradaORDEMDECOMPRA.Value;
    dmMSProcedure.fdspNFEntrada.Params[5].Value := dmMProvider.cdsNFEntradaENTRADA.Value;
    dmMSProcedure.fdspNFEntrada.Params[6].Value := dmMProvider.cdsNFEntradaEMISSAO.Value;
    dmMSProcedure.fdspNFEntrada.Params[7].Value := dmMProvider.cdsNFEntradaSAIDA.Value;

    if dmMProvider.cdsNFEntradaTRANSPORTADORA.Value > 0 then
      dmMSProcedure.fdspNFEntrada.Params[8].Value := dmMProvider.cdsNFEntradaTRANSPORTADORA.Value
    else
      dmMSProcedure.fdspNFEntrada.Params[8].Value := null;

    dmMSProcedure.fdspNFEntrada.Params[9].Value   := dmMProvider.cdsNFEntradaTIPOFRETE.Value;
    dmMSProcedure.fdspNFEntrada.Params[10].Value  := dmMProvider.cdsNFEntradaFRETEAGREGADO.Value;
    dmMSProcedure.fdspNFEntrada.Params[11].Value  := dmMProvider.cdsNFEntradaBASEICMS.Value;
    dmMSProcedure.fdspNFEntrada.Params[12].Value  := dmMProvider.cdsNFEntradaVALORICMS.Value;
    dmMSProcedure.fdspNFEntrada.Params[13].Value  := dmMProvider.cdsNFEntradaBASESUBSTITUICAO.Value;
    dmMSProcedure.fdspNFEntrada.Params[14].Value  := dmMProvider.cdsNFEntradaVALORSUBSTITUICAO.Value;
    dmMSProcedure.fdspNFEntrada.Params[15].Value  := dmMProvider.cdsNFEntradaVALORDOFRETE.Value;
    dmMSProcedure.fdspNFEntrada.Params[16].Value  := dmMProvider.cdsNFEntradaVALORDOSEGURO.Value;
    dmMSProcedure.fdspNFEntrada.Params[17].Value  := dmMProvider.cdsNFEntradaOUTRASDESPESAS.Value;
    dmMSProcedure.fdspNFEntrada.Params[18].Value  := dmMProvider.cdsNFEntradaVALORDOIPI.Value;
    dmMSProcedure.fdspNFEntrada.Params[19].Value  := dmMProvider.cdsNFEntradaVALORDOSPRODUTOS.Value;
    dmMSProcedure.fdspNFEntrada.Params[20].Value  := dmMProvider.cdsNFEntradaVALORDANOTA.Value;
    dmMSProcedure.fdspNFEntrada.Params[21].Value  := dmMProvider.cdsNFEntradaDESCONTOGERAL.Value;
    dmMSProcedure.fdspNFEntrada.Params[22].Value  := dmMProvider.cdsNFEntradaPESOBRUTO.Value;
    dmMSProcedure.fdspNFEntrada.Params[23].Value  := dmMProvider.cdsNFEntradaPESOLIQUIDO.Value;
    dmMSProcedure.fdspNFEntrada.Params[24].Value  := dmMProvider.cdsNFEntradaQUANTIDADEVOLUME.Value;
    dmMSProcedure.fdspNFEntrada.Params[25].Value  := dmMProvider.cdsNFEntradaESPECIEVOLUME.Value;
    dmMSProcedure.fdspNFEntrada.Params[26].Value  := dmMProvider.cdsNFEntradaMARCAVOLUME.Value;
    dmMSProcedure.fdspNFEntrada.Params[27].Value  := dmMProvider.cdsNFEntradaNUMEROVOLUME.Value;
    dmMSProcedure.fdspNFEntrada.Params[28].Value  := dmMProvider.cdsNFEntradaPLACAVEICULO.Value;
    dmMSProcedure.fdspNFEntrada.Params[29].Value  := dmMProvider.cdsNFEntradaUFVEICULO.Value;
    dmMSProcedure.fdspNFEntrada.Params[30].Value  := dmMProvider.cdsNFEntradaSTATUS.Value;
    dmMSProcedure.fdspNFEntrada.Params[31].Value  := dmMProvider.cdsNFEntradaOBSERVACAO.Value;
    dmMSProcedure.fdspNFEntrada.Params[32].Value  := dmMProvider.cdsNFEntradaSERIENF.Value;
    dmMSProcedure.fdspNFEntrada.Params[33].Value  := dmMProvider.cdsNFEntradaMODELO.Value;
    dmMSProcedure.fdspNFEntrada.Params[34].Value  := dmMProvider.cdsNFEntradaCANCELADA.Value;
    dmMSProcedure.fdspNFEntrada.Params[35].Value  := dmMProvider.cdsNFEntradaRATEAR_DESCONTO.Value;
    dmMSProcedure.fdspNFEntrada.Params[36].Value  := dmMProvider.cdsNFEntradaTIPO_CONTABIL.Value;
    dmMSProcedure.fdspNFEntrada.Params[37].Value  := dmMProvider.cdsNFEntradaCODIGO_VALOR_FISCAL.Value;
    dmMSProcedure.fdspNFEntrada.Params[38].Value  := dmMProvider.cdsNFEntradaSOMAR_DESPACESS_BASEICMS.Value;
    dmMSProcedure.fdspNFEntrada.Params[39].Value  := dmMProvider.cdsNFEntradaSOMAR_IPI_BASEICMS.Value;
    dmMSProcedure.fdspNFEntrada.Params[40].Value  := dmMProvider.cdsNFEntradaSOMAR_ICMSR_VALORNOTA.Value;
    dmMSProcedure.fdspNFEntrada.Params[41].Value  := dmMProvider.cdsNFEntradaREDUCAO_PIS_COFINS.Value;
    dmMSProcedure.fdspNFEntrada.Params[42].Value  := dmMProvider.cdsNFEntradaALIQUOTA_CREDITO_SIMPLES.Value;

    if dmMProvider.cdsNFEntradaCOMPRADOR.Value > 0 then
      dmMSProcedure.fdspNFEntrada.Params[43].Value := dmMProvider.cdsNFEntradaCOMPRADOR.Value
    else
      dmMSProcedure.fdspNFEntrada.Params[43].Value := null;

    dmMSProcedure.fdspNFEntrada.Params[44].Value  := dmMProvider.cdsNFEntradaPROTOCOLO_DANFE.Value;
    dmMSProcedure.fdspNFEntrada.Params[45].Value  := dmMProvider.cdsNFEntradaVALOR_PIS.Value;
    dmMSProcedure.fdspNFEntrada.Params[46].Value  := dmMProvider.cdsNFEntradaVALOR_COFINS.Value;
    dmMSProcedure.fdspNFEntrada.Params[47].Value  := dmMProvider.cdsNFEntradaVALOR_PIS_ST.Value;
    dmMSProcedure.fdspNFEntrada.Params[48].Value  := dmMProvider.cdsNFEntradaVALOR_COFINS_ST.Value;
    dmMSProcedure.fdspNFEntrada.Params[49].Value  := dmMProvider.cdsNFEntradaSITUACAO_DOCUMENTO.Value;
//    dmMSProcedure.fdspNFEntrada.Params[50].Value  := dmMProvider.cdsNFEntradaOBSERVACAO_FISCAL.Value;
    dmMSProcedure.fdspNFEntrada.Params[51].Value  := pubNomeComputador;
    dmMSProcedure.fdspNFEntrada.Params[52].Value  := ''; // RetornarIP;
    dmMSProcedure.fdspNFEntrada.Params[53].Value  := dmDBEXMaster.iIdUsuario;;

    dmMSProcedure.fdspNFEntrada.ExecProc;

    if dmMSProcedure.fdspNFEntrada.Params[54].Value > 0 then
      dmMProvider.cdsNFEntradaNFENTRADA.Value :=  dmMSProcedure.fdspNFEntrada.Params[54].Value;

    dmDBEXMaster.fdtMaster.CommitRetaining;
    dmDBEXMaster.fdcMaster.Close;;

  except
    on E: exception do
    begin

      Tratar_Erro_Conexao(E);
      dmDBEXMaster.fdtMaster.RollbackRetaining;

    end;

  end;

end;

procedure TfrmModNFEntrada.Man_Tab_Parcelas_NFE(pOpcao, pNFEntrada: Integer;
  pDocumento: string; pVencimento: TDateTime; pValor: Currency);
begin

  try

    dmDBEXMaster.fdtMaster.StartTransaction;

    dmMSProcedure.fdspParcelasNFE.Params[0].Value := pOpcao;
    dmMSProcedure.fdspParcelasNFE.Params[1].Value := dmMProvider.cdsParcelasNFEPARCELASNFE.Value;
    dmMSProcedure.fdspParcelasNFE.Params[2].Value := IntToStr(pNFEntrada);
    dmMSProcedure.fdspParcelasNFE.Params[3].Value := pDocumento;
    dmMSProcedure.fdspParcelasNFE.Params[4].Value := pVencimento;
    dmMSProcedure.fdspParcelasNFE.Params[5].Value := pValor;
    dmMSProcedure.fdspParcelasNFE.Params[6].Value := pubNomeComputador;
    dmMSProcedure.fdspParcelasNFE.Params[7].Value := ''; // RetornarIP;
    dmMSProcedure.fdspParcelasNFE.Params[8].Value := dmDBEXMaster.iIdUsuario;

    dmMSProcedure.fdspParcelasNFE.ExecProc;

    if dmMSProcedure.fdspParcelasNFE.Params[9].Value > 0 then
      iProx_ParcelasNFE := dmMSProcedure.fdspParcelasNFE.Params[9].Value;

    dmDBEXMaster.fdtMaster.CommitRetaining;
    dmDBEXMaster.fdcMaster.Close;;

  except
    on E: exception do
    begin

      Tratar_Erro_Conexao(E);
      dmDBEXMaster.fdtMaster.RollbackRetaining;

    end;

  end;

end;

procedure TfrmModNFEntrada.Mensagem(pAlerta: boolean; pMsg: string);
begin

  lblMsg.Caption := pMsg;
  Application.ProcessMessages;

  if pAlerta then
    TocarSomAlerta(ord(SystemHand));

end;

procedure TfrmModNFEntrada.OcultarAbas(pOpcao: boolean);
begin

  tbsTotais.TabVisible            := pOpcao;
  tbsItens.TabVisible             := tbsTotais.TabVisible;
  tbsTransporte.TabVisible        := tbsTotais.TabVisible;;
  tbsInconsitenciaXML.TabVisible  := false;

end;

function TfrmModNFEntrada.Pesquisar_Complemento(pComplemento: string): boolean;
begin

  dmDBEXMaster.fdqMasterPesquisa.Close;
  dmDBEXMaster.fdqMasterPesquisa.SQL.Clear;
  dmDBEXMaster.fdqMasterPesquisa.SQL.Add('SELECT PRODUTO FROM PRODUTO');
  dmDBEXMaster.fdqMasterPesquisa.SQL.Add('WHERE COMPLEMENTO =' + QuotedStr(pComplemento));
  dmDBEXMaster.fdqMasterPesquisa.Open;

  if dmDBEXMaster.fdqMasterPesquisa.IsEmpty then
    Result := False
  else
    Result := dmDBEXMaster.ValidarPesquisaProduto(dmDBEXMaster.fdqMasterPesquisa.FieldByName('PRODUTO').Value);

end;

procedure TfrmModNFEntrada.PreencherCampos;
begin

  edtCodigoGTIN.Text        := IntToStr(dmDBEXMaster.fdqProdutoFilial.FieldByName('PRODUTO').Value);
  edtDescricaoProduto.Text  := dmDBEXMaster.fdqProdutos.FieldByName('DESCRICAO').Value;
  edtUnidade.Text           := dmDBEXMaster.fdqProdutos.FieldByName('UNIDADE').Value;
  edtNCM.Text               := dmDBEXMaster.fdqProdutos.FieldByName('NCM').Value;

  if dmMProvider.cdsFilialREGIME_TRIBUTARIO.Value = 0 then
    edtCST_CSOSN.Text       := IntToStr(dmDBEXMaster.fdqProdutos.FieldByName('ORIGEM_MERCADORIA').Value) + dmDBEXMaster.fdqProdutos.FieldByName('CST').Value
  else
    edtCST_CSOSN.Text       := IntToStr(dmDBEXMaster.fdqProdutos.FieldByName('ORIGEM_MERCADORIA').Value) + Trim(Copy(dmDBEXMaster.fdqProdutos.FieldByName('CST').Value,2,Length(dmDBEXMaster.fdqProdutos.FieldByName('CST').Value)));

  edtCFOP.Text              := dmMProvider.cdsCFOP_NFEntradaCFOP.Value;
  edtUnEmbalagem.Value      := dmDBEXMaster.fdqProdutos.FieldByName('UNIDADEEMBALAGEM').Value;
  edtValorUnitario.Value    := dmDBEXMaster.fdqProdutoFilial.FieldByName('CUSTOBRUTO').Value;
  edtCST_IPI.Text           := dmDBEXMaster.fdqProdutos.FieldByName('CST_IPI').Value;
  edtAliqICMS_Item.Value    := dmDBEXMaster.fdqProdutoFilial.FieldByName('CREDITODEICMS').Value;
  edtCSTPIS.Text            := dmDBEXMaster.fdqProdutos.FieldByName('CST_PIS_ENTRADA').Value;
  edtAliquotaPIS.Value      := dmDBEXMaster.fdqProdutos.FieldByName('ALIQUOTA_PIS_ENTRADA').Value;
  edtCSTCOFINS.Text         := dmDBEXMaster.fdqProdutos.FieldByName('CST_COFINS_ENTRADA').Value;
  edtAliquotaCOFINS.Value   := dmDBEXMaster.fdqProdutos.FieldByName('ALIQUOTA_COFINS_ENTRADA').Value;

end;

procedure TfrmModNFEntrada.PreencherCampos_ItemNFEntrada;
begin

  iProx_ItemNFEntrada           := dmMProvider.cdsItem_NFEntradaITEMNFENTRADA.Value;
  edtCodigoGTIN.Text            := dmMProvider.cdsItem_NFEntradaEAN.Value;
  edtDescricaoProduto.Text      := dmMProvider.cdsItem_NFEntradaDESCRICAO_PRODUTO.Value;
  edtUnidade.Text               := dmMProvider.cdsItem_NFEntradaUND_PRODUTO.Value;
  edtNCM.Text                   := dmMProvider.cdsItem_NFEntradaNCM.Value;
  edtCST_CSOSN.Text             := FormatFloat('000', dmMProvider.cdsItem_NFEntradaCST.Value);
  edtCFOP.Text                  := dmMProvider.cdsItem_NFEntradaCFOP.Value;
  edtUnEmbalagem.Value          := dmMProvider.cdsItem_NFEntradaUNIDADEEMBALAGEM.Value;
  edtQuantidade.Value           := dmMProvider.cdsItem_NFEntradaQUANTIDADE.Value;
  edtValorUnitario.Value        := dmMProvider.cdsItem_NFEntradaVALORUNITARIO.Value;
  edtDesconto.Value             := dmMProvider.cdsItem_NFEntradaVALOR_DESCONTO.Value;
  edtEncargos.Value             := dmMProvider.cdsItem_NFEntradaENCARGOS.Value;
  edtCST_IPI.Text               := dmMProvider.cdsItem_NFEntradaCST_IPI.Value;
  edtCodEnqIPI.Text             := dmMProvider.cdsItem_NFEntradaCOD_ENQUADRAMENTO_IPI.Value;
  edtBasecalcIPI_Item.Value     := dmMProvider.cdsItem_NFEntradaBASE_CALCULO_IPI.Value;
  edtAliqIPI_Item.Value         := dmMProvider.cdsItem_NFEntradaALIQUOTA_IPI.Value;
  edtValorIPI_Item.Value        := dmMProvider.cdsItem_NFEntradaVALOR_IPI.Value;
  edtValorTotalItem.Value       := dmMProvider.cdsItem_NFEntradaSUB_TOTAL.Value;
  edtAliqICMS_Item.Value        := dmMProvider.cdsItem_NFEntradaICMSENTRADA.Value;
  edtRedBaseCalc_Item.Value     := dmMProvider.cdsItem_NFEntradaREDUCAO_BASE. AsCurrency;
  edtBaseCalcICMS_Item.Value    := dmMProvider.cdsItem_NFEntradaBASE_ICMS.Value;
  edtValorICMS_Item.Value       := dmMProvider.cdsItem_NFEntradaVALOR_ICMS.Value;
  edtBaseCalcICMSR_Item.Value   := dmMProvider.cdsItem_NFEntradaBASE_SUBSTITUICAO.Value;
  edtAliqICMSR_Item.Value       := dmMProvider.cdsItem_NFEntradaALIQUOTA_ST.Value;
  edtValorICMSR_Item.Value      := dmMProvider.cdsItem_NFEntradaVALOR_SUBSTITUICAO.Value;
  edtValorIsentasNT.Value       := dmMProvider.cdsItem_NFEntradaISENTO_NAOTRIBUTADO.Value;
  edtCSTPIS.Text                := dmMProvider.cdsItem_NFEntradaCST_PIS.Value;
  edtBaseCalcPIS.Value          := dmMProvider.cdsItem_NFEntradaVALOR_BASE_PIS.Value;
  edtAliquotaPIS.Value          := dmMProvider.cdsItem_NFEntradaP_ALIQUOTA_PIS.Value;
  edtValorPIS.Value             := dmMProvider.cdsItem_NFEntradaVALOR_PIS.Value;
  edtQuantBCPIS.Value           := dmMProvider.cdsItem_NFEntradaQUANT_BC_PIS.Value;
  edtAliqValorPIS.Value         := dmMProvider.cdsItem_NFEntradaV_ALIQUOTA_PIS.Value;
  edtCSTCOFINS.Text             := dmMProvider.cdsItem_NFEntradaCST_COFINS.Value;
  edtBaseCalcCOFINS.Value       := dmMProvider.cdsItem_NFEntradaVALOR_BC_COFINS.Value;
  edtAliquotaCOFINS.Value       := dmMProvider.cdsItem_NFEntradaP_ALIQUOTA_COFINS.Value;
  edtValorCOFINS.Value          := dmMProvider.cdsItem_NFEntradaVALOR_COFINS.Value;
  edtQuantBCCOFINS.Value        := dmMProvider.cdsItem_NFEntradaQUANTIDADE_BC_COFINS.Value;
  edtAliqCOFINSValor.Value      := dmMProvider.cdsItem_NFEntradaV_ALIQUOTA_COFINS.Value;
  edtValorFreteItem.Value       := dmMProvider.cdsItem_NFEntradaFRETE_RATEADO.Value;

end;

procedure TfrmModNFEntrada.rdpOpcoesPesquisaClick(Sender: TObject);
begin

  pgcNFEntrada.ActivePageIndex := 0;

  edtConteudoPesquisa.Clear;
  edtConteudoPesquisa.SetFocus;

  case rdpOpcoesPesquisa.ItemIndex of
    2, 3, 4:edtConteudoPesquisaExit(self);
  end;

end;

procedure TfrmModNFEntrada.RelacionarCFOP_NFE(pNFEntrada: Integer);
begin

  dmMProvider.cdsCFOP_NFEntrada.Close;
  dmMProvider.cdsCFOP_NFEntrada.ProviderName := 'dspCFOP_NFEntrada';

  dmDBEXMaster.fdqCFOP_NF_Entrada.SQL.Clear;
  dmDBEXMaster.fdqCFOP_NF_Entrada.SQL.Add('SELECT * FROM CFOP_NFENTRADA');
  dmDBEXMaster.fdqCFOP_NF_Entrada.SQL.Add('WHERE NFENTRADA = ' + QuotedStr(IntToStr(pNFEntrada)));
  dmDBEXMaster.fdqCFOP_NF_Entrada.SQL.Add('ORDER BY CFOP');

  dmMProvider.cdsCFOP_NFEntrada.Open;
  dmMProvider.cdsCFOP_NFEntrada.ProviderName := '';

end;

procedure TfrmModNFEntrada.RelacionarFrete_NFE(pNFEntrada: Integer);
begin

  if dmMProvider.cdsNFEntrada.Active then
  begin

    dmMProvider.cdsConhecimentoFrete.Close;
    dmMProvider.cdsConhecimentoFrete.ProviderName := 'dspConhecimentoFrete';

    dmDBEXMaster.fdqConhecimentoFrete.SQL.Clear;
    dmDBEXMaster.fdqConhecimentoFrete.SQL.Add('SELECT * FROM CONHECIMENTO_FRETE');
    dmDBEXMaster.fdqConhecimentoFrete.SQL.Add('WHERE NF_ENTRADA = ' + QuotedStr(IntToStr(pNFEntrada)));

    dmMProvider.cdsConhecimentoFrete.Open;
    dmMProvider.cdsConhecimentoFrete.ProviderName := '';

  end;

end;

procedure TfrmModNFEntrada.RelacionarItens_NFE(pNFEntrada: Integer;
  pAbrir: boolean);
begin

  try

    dmMProvider.cdsItem_NFEntrada.DisableControls;

    if dmMProvider.cdsItem_NFEntrada.Active then
    begin

      if (dmMProvider.cdsItem_NFEntradaNFENTRADA.Value <> pNFEntrada) or (pAbrir)
      then
      begin

        dmMProvider.cdsItem_NFEntrada.Close;
        dmMProvider.cdsItem_NFEntrada.ProviderName := 'dspItem_NFEntrada';

        dmDBEXMaster.fdqItem_NFEntrada.SQL.Clear;
        dmDBEXMaster.fdqItem_NFEntrada.SQL.Add('SELECT * FROM ITEMNFENTRADA');
        dmDBEXMaster.fdqItem_NFEntrada.SQL.Add('WHERE NFENTRADA = ' + QuotedStr(IntToStr(pNFEntrada)));
        dmDBEXMaster.fdqItem_NFEntrada.SQL.Add('ORDER BY ITEMNFENTRADA');

        dmMProvider.cdsItem_NFEntrada.Open;
        dmMProvider.cdsItem_NFEntrada.ProviderName := '';

      end;

    end
    else
    begin

      dmMProvider.cdsItem_NFEntrada.Close;
      dmMProvider.cdsItem_NFEntrada.ProviderName := 'dspItem_NFEntrada';

      dmDBEXMaster.fdqItem_NFEntrada.SQL.Clear;
      dmDBEXMaster.fdqItem_NFEntrada.SQL.Add('SELECT * FROM ITEMNFENTRADA');
      dmDBEXMaster.fdqItem_NFEntrada.SQL.Add('WHERE NFENTRADA = ' + QuotedStr(IntToStr(pNFEntrada)));
      dmDBEXMaster.fdqItem_NFEntrada.SQL.Add('ORDER BY ITEMNFENTRADA');

      dmMProvider.cdsItem_NFEntrada.Open;
      dmMProvider.cdsItem_NFEntrada.ProviderName := '';

    end;
  except
    on E: exception do
    begin

      Tratar_Erro_Conexao(E);
      dmDBEXMaster.fdtMaster.Rollback;

    end;

  end;

  dmMProvider.cdsItem_NFEntrada.EnableControls;

end;

procedure TfrmModNFEntrada.RelacionarParcelas_NFE(pNFEntrada: Integer);
begin

  dmMProvider.cdsParcelasNFE.Close;
  dmMProvider.cdsParcelasNFE.ProviderName := 'dspParcelasNFE';

  dmDBEXMaster.fdqParcelasNFE.SQL.Clear;
  dmDBEXMaster.fdqParcelasNFE.SQL.Add('SELECT * FROM PARCELASNFE');
  dmDBEXMaster.fdqParcelasNFE.SQL.Add('WHERE NOTAFISCAL = ' + QuotedStr(IntToStr(pNFEntrada)));
  dmDBEXMaster.fdqParcelasNFE.SQL.Add('ORDER BY VENCIMENTO');

  dmMProvider.cdsParcelasNFE.Open;
  dmMProvider.cdsParcelasNFE.ProviderName := '';

end;

function TfrmModNFEntrada.Retornar_CfopCorrelata_Item(pCfop,
  pUF: string): string;
var
  sCfop: string;
begin

  Result := '';

  dmDBEXMaster.fdqCFOP_CFPS.Close;
  dmDBEXMaster.fdqCFOP_CFPS.SQL.Clear;
  dmDBEXMaster.fdqCFOP_CFPS.SQL.Add('SELECT * FROM CFOP');
  dmDBEXMaster.fdqCFOP_CFPS.SQL.Add('WHERE CFOP = ' + pCfop);
  dmDBEXMaster.fdqCFOP_CFPS.Open;

  if dmMProvider.cdsFilialESTADO.Value <> pUF then
    Result := dmDBEXMaster.fdqCFOP_CFPS.FieldByName('CFOP_ENTRADA_INTERESTADUAL').AsString
  else
    Result := dmDBEXMaster.fdqCFOP_CFPS.FieldByName('CFOP_ENTRADA_ESTADUAL').AsString;

  dmDBEXMaster.fdqCFOP_CFPS.Close;

end;

procedure TfrmModNFEntrada.tbsItensShow(Sender: TObject);
begin

  RelacionarItens_NFE(dmMProvider.cdsNFEntradaNFENTRADA.Value, false);

end;

procedure TfrmModNFEntrada.tbsTotaisShow(Sender: TObject);
begin

  if not dmMProvider.cdsNFEntrada.IsEmpty then
  begin

    RelacionarParcelas_NFE(dmMProvider.cdsNFEntradaNFENTRADA.Value);
    RelacionarCFOP_NFE(dmMProvider.cdsNFEntradaNFENTRADA.Value);

    AbrirTabelasAuxiliares;

  end;

end;

procedure TfrmModNFEntrada.tbsTransporteShow(Sender: TObject);
begin

  RelacionarFrete_NFE(dmMProvider.cdsNFEntradaNFENTRADA.Value);

end;

procedure TfrmModNFEntrada.Tratar_Erro_Conexao(pE: exception);
var
  sChave_Extrang: string;
begin

  if Pos('Unable', pE.Message) > 0 then
    Mensagem(false, dmDBEXMaster.sNomeUsuario + MSG_ERRO_CONEXAO_BANCO)
  else if Pos('FOREIGN', pE.Message) > 0 then
  begin

    sChave_Extrang := Trim(Copy(pE.Message, Pos('ON TABLE', UpperCase(pE.Message)) + 10, Length(pE.Message)));

    Mensagem(false, dmDBEXMaster.sNomeUsuario + ', ' + MSG_ERRO_CHAVE_ESTRANGEIRA + Copy(sChave_Extrang, 1, Pos('"', sChave_Extrang) - 1));

  end
  else
    Mensagem(false, dmDBEXMaster.sNomeUsuario + ', ' + pE.Message);

  TocarSomAlerta(ord(SystemHand));

end;

function TfrmModNFEntrada.ValidarCampos: boolean;
begin

  Result := false;

  if dmMProvider.cdsNFEntradaENTRADA.Value < dmMProvider.cdsNFEntradaEMISSAO.Value
  then
  begin

    Mensagem(True, dmDBEXMaster.sNomeUsuario + MSG_CONSISTE_ENTRADA_EMISSAO + ' - ' + FormatDateTime('dd/mm/yyyy', dmMProvider.cdsNFEntradaENTRADA.Value));
    edtEntrada.SetFocus;

  end
  else if (dmMProvider.cdsNFEntradaMODELO.Value = '55') and (Length(Trim(dmMProvider.cdsNFEntradaPROTOCOLO_DANFE.Value)) = 0) then
  begin

    Mensagem(True, dmDBEXMaster.sNomeUsuario + MSG_CONSISTE_CHAVE_VAZIA);
    edtProtocoloNFE.SetFocus;

  end
  else if dmMProvider.cdsNFEntradaTIPOFRETE.Value < 0 then

    Mensagem(True, dmDBEXMaster.sNomeUsuario + MSG_INFORMAR_TIPO_FRETE)

  else if dmMProvider.cdsCFOP_NFEntrada.IsEmpty then
  begin

    Mensagem(True, dmDBEXMaster.sNomeUsuario + MSG_CAMPO_OBRIGATORIO +' = CFOP');

    OcultarAbas(True);
    pgcNFEntrada.ActivePageIndex := 1;
    edtCFOP_Entrada.SetFocus;

  end
  else
    Result := True;

end;

function TfrmModNFEntrada.ValidarTotalParcelas: boolean;
begin

  dmDBEXMaster.fdqMasterPesquisa.Close;

  dmDBEXMaster.fdqMasterPesquisa.SQL.Clear;
  dmDBEXMaster.fdqMasterPesquisa.SQL.Add('SELECT SUM(parcelasnfe.valor) as tot_parcelas from parcelasnfe  where parcelasnfe.notafiscal = '
                                           + IntToStr(dmMProvider.cdsNFEntradaNFENTRADA.Value));

  dmDBEXMaster.fdqMasterPesquisa.Open;

  Result := (dmDBEXMaster.fdqMasterPesquisa.FieldByName('tot_parcelas').Value + edtValorFatura.Value) <= dmMProvider.cdsNFEntradaVALORDANOTA.Value;

  dmDBEXMaster.fdqMasterPesquisa.Close;

end;

function TfrmModNFEntrada.ValidarUnidadeEmbalagem: boolean;
begin

  tsInconsistenciasUNDEmb := TStringList.Create;

  if dmMProvider.cdsItem_NFEntrada.Active then
  begin

    dmMProvider.cdsItem_NFEntrada.First;

    while not dmMProvider.cdsItem_NFEntrada.Eof do
    begin

      if dmMProvider.cdsItem_NFEntradaUNIDADEEMBALAGEM.Value <= 0 then
        tsInconsistenciasUNDEmb.Add(Format('%8.8s', [dmMProvider.cdsItem_NFEntradaEAN.Value])
                                    + Format('%8.8s', [FormatFloat('#,##0.00', dmMProvider.cdsItem_NFEntradaUNIDADEEMBALAGEM.Value)])
                                    + Format('%4.4s', [' ']) + Format('%-40.40s', [dmMProvider.cdsItem_NFEntradaDESCRICAO_PRODUTO.Value]));

      dmMProvider.cdsItem_NFEntrada.Next;

    end;

    dmMProvider.cdsItem_NFEntrada.First;

  end;

  Result := tsInconsistenciasUNDEmb.Count <= 0;

end;

function TfrmModNFEntrada.Validar_CSTCSOSN(pCST_CSOSN: string;
  pCRT: Integer): boolean;
begin

  dmDBEXMaster.fdqCST_CSOSN.Close;

  dmDBEXMaster.fdqCST_CSOSN.SQL.Clear;
  dmDBEXMaster.fdqCST_CSOSN.SQL.Add('select * from cst');
  dmDBEXMaster.fdqCST_CSOSN.SQL.Add('where cst = ' + QuotedStr(pCST_CSOSN));
  dmDBEXMaster.fdqCST_CSOSN.SQL.Add('and crt = ' + IntToStr(pCRT));

  dmDBEXMaster.fdqCST_CSOSN.Open;

  Result := not dmDBEXMaster.fdqCST_CSOSN.IsEmpty;

  dmDBEXMaster.fdqCST_CSOSN.Close;

end;

function TfrmModNFEntrada.Validar_CST_COFINS(pCST_COFINS: string): boolean;
begin

  dmDBEXMaster.fdqCST_COFINS.Close;

  dmDBEXMaster.fdqCST_COFINS.SQL.Clear;

  dmDBEXMaster.fdqCST_COFINS.SQL.Add('select * from cst_cofins');
  dmDBEXMaster.fdqCST_COFINS.SQL.Add('where cst_cofins = ' + pCST_COFINS);

  dmDBEXMaster.fdqCST_COFINS.Open;

  Result := not dmDBEXMaster.fdqCST_COFINS.IsEmpty;

  dmDBEXMaster.fdqCST_COFINS.Close;

end;

function TfrmModNFEntrada.Validar_CST_PIS(pCST_PIS: string): boolean;
begin

  dmDBEXMaster.fdqCST_PIS.Close;

  dmDBEXMaster.fdqCST_PIS.SQL.Clear;

  dmDBEXMaster.fdqCST_PIS.SQL.Add('select * from cst_pis_pasep');
  dmDBEXMaster.fdqCST_PIS.SQL.Add('where cst_pis_pasep = ' + pCST_PIS);

  dmDBEXMaster.fdqCST_PIS.Open;

  Result := not dmDBEXMaster.fdqCST_PIS.IsEmpty;

  dmDBEXMaster.fdqCST_PIS.Close;

end;

procedure TfrmModNFEntrada.WindowClose1Execute(Sender: TObject);
begin

  Close;

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
