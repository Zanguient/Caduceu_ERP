unit modNFSaida;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.ComCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, Vcl.Mask, JvExStdCtrls, JvEdit, JvValidateEdit,
  Vcl.Imaging.jpeg, System.Actions, Vcl.ActnList, ACBrMail, ACBrBase, ACBrDFe, ACBrNFe, ACBrNFeDANFEClass,
  ACBrNFeDANFeRLClass, ACBrDFeSSL, pcnConversaoNFe, pcnConversao, ACBrSocket, ACBrNCMs, Math, FireDAC.Stan.Intf, FireDAC.Comp.Client,
  Vcl.StdActns, AcbrUtil, blcksock, System.TypInfo, Vcl.Buttons;


type
  TDBGrid = class(Vcl.DBGrids.TDBGrid)
  protected
    procedure DrawCellBackground(const ARect: TRect; AColor: TColor;
      AState: TGridDrawState; ACol, ARow: Integer); override;
  end;
  TfrmModNFSaida = class(TForm)
    grpMensagem: TGroupBox;
    lblMsg: TLabel;
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
    grpPesquisa: TGroupBox;
    rdpOpcoesPesquisa: TRadioGroup;
    grpConteudoPesquisa: TGroupBox;
    impPesquisar: TImage;
    edtConteudoPesquisa: TEdit;
    pgcNotaFiscal: TPageControl;
    tbsTabela: TTabSheet;
    grdTabela: TDBGrid;
    imgConfirmar: TImage;
    imfNfe: TImage;
    tbsDadosNFe: TTabSheet;
    grpNFE: TGroupBox;
    grpModelo: TGroupBox;
    cboModeloNota: TDBLookupComboBox;
    grpSerieNota: TGroupBox;
    edtSerieNota: TDBEdit;
    grpNumeroNota: TGroupBox;
    edtNumeroNota: TDBEdit;
    grpDataHoraEmiss�o: TGroupBox;
    edtDataEmiss�o: TDBEdit;
    grpHoraEmissao: TGroupBox;
    edtHoraEmissao: TDBEdit;
    grpDataSaida: TGroupBox;
    edtDataSaida: TDBEdit;
    grpHoraSaida: TGroupBox;
    edtHoraSaida: TDBEdit;
    rdgTipoOperacao: TDBRadioGroup;
    rdgFinbalidadeNF: TDBRadioGroup;
    rdgConsumidorFinal: TDBRadioGroup;
    rdgDestinoOperacao: TDBRadioGroup;
    rdgTipoAtendimento: TDBRadioGroup;
    grpDestinatarioRemetente: TGroupBox;
    lblCNPJ_CPF: TLabel;
    lblRasaoSocialDestinatario: TLabel;
    lblInscricaoEstadual: TLabel;
    lblInscricaoSUFRAMA: TLabel;
    lblInscricaoMunicipal: TLabel;
    lblEmail: TLabel;
    edtCNPJDestinatario: TDBEdit;
    edtIEDestinatario: TDBEdit;
    edtRSocialDestinatario: TDBEdit;
    edtIMunicialDestinatario: TDBEdit;
    edtISUFRAMADestinatario: TDBEdit;
    edtEmailDestinatario: TDBEdit;
    imgTrocarCliente: TImage;
    grpCFOPNota: TGroupBox;
    lblCFOPNota: TLabel;
    grdCFOPNota: TDBGrid;
    edtCFOPNota: TEdit;
    grpFinanceiro: TGroupBox;
    rdgTipoCobranca: TDBRadioGroup;
    grpFormaPagamento: TGroupBox;
    cboFormaPagamento: TDBLookupComboBox;
    grpChaveAcessoConsultaNFE: TGroupBox;
    edtChaveAcessoConsulta: TDBEdit;
    grpProtocoloAutorizacao: TGroupBox;
    edtprotocoloAutorizacao: TDBEdit;
    grpSituacao: TGroupBox;
    grpVersaoXML: TGroupBox;
    tbsItens: TTabSheet;
    grpItens: TGroupBox;
    lblCodigoItem: TLabel;
    lblDescricaoItem: TLabel;
    lblNCM: TLabel;
    lblEX_TIPI: TLabel;
    lblCfopItem: TLabel;
    lblUnidComercial: TLabel;
    lblQuantidadeItem: TLabel;
    lblValorUnitario: TLabel;
    lblValorSeguro: TLabel;
    edtCodigoItem: TEdit;
    lblQuantTributavel: TLabel;
    lblValorUnitTrib: TLabel;
    lblValorFreteItem: TLabel;
    lblPercDescontoItem: TLabel;
    lblValorDescontoItem: TLabel;
    lblEANTributavel: TLabel;
    lblOutrasDespesas: TLabel;
    lblTotalBruto: TLabel;
    lblCEST: TLabel;
    tbsTotais_Transporte: TTabSheet;
    tbsInformacoesAdicionais: TTabSheet;
    tbsExportacai: TTabSheet;
    tbsNotasConhecimentosRef: TTabSheet;
    tbsNotasRefProdutor: TTabSheet;
    tbsCupomFiscalRef: TTabSheet;
    grpICMS_STItem: TGroupBox;
    lblPercRe4dBCIcmsST: TLabel;
    lblBCIcmsSTItem: TLabel;
    lblAliqICMS_STItem: TLabel;
    lblValorICMS_STItem: TLabel;
    lblPercMargemValorAdicionatST: TLabel;
    lblIsentasNT_ST: TLabel;
    edtpercmargemValorAdicICMS_ST: TDBEdit;
    edtValorICMS_STItem: TDBEdit;
    edtAliqICMS_STItem: TDBEdit;
    edtBCIcmsSTItem: TDBEdit;
    edtPercRedICMS_ST: TDBEdit;
    edtIsentasNT_ST: TDBEdit;
    edtNCM: TDBEdit;
    edtQuantidade: TDBEdit;
    edtQuantidadeTrib: TDBEdit;
    edtvalorSeguroItem: TDBEdit;
    edtPercDescontoItem: TDBEdit;
    edtOutrasDespesasItem: TDBEdit;
    edtDescricaoItem: TDBEdit;
    edtCFOpItem: TDBEdit;
    edtEX_ITPI: TDBEdit;
    edtEANTributavel: TDBEdit;
    edtUndItem: TDBEdit;
    edtCEST: TDBEdit;
    edtvalorUnitario: TDBEdit;
    edtValorUnitarioTrib: TDBEdit;
    edtvalorFreteItem: TDBEdit;
    edtvalorDescontoItem: TDBEdit;
    edtSubTotal: TDBEdit;
    grpPartilhaFCP: TGroupBox;
    lblAliqInterEstadual: TLabel;
    lblDiferencialAliquotas: TLabel;
    lblBCPartilha: TLabel;
    lblPercPartilhaOrigem: TLabel;
    lblValorPartilhaOrigemItem: TLabel;
    lblAliqOpercaoInternaDestino: TLabel;
    edtAliqInterEstadual: TDBEdit;
    edtAliqInternaDestino: TDBEdit;
    edtDiferencialAliquotas: TDBEdit;
    edtPercPartilhaOrigem: TDBEdit;
    edtvalorPartilhaOrigem: TDBEdit;
    edtBCPartilha: TDBEdit;
    pgcOutrosTriubutos: TPageControl;
    tbsPIS: TTabSheet;
    tbsIPI: TTabSheet;
    lblCST_IPI: TLabel;
    lblClasseEnquadramento: TLabel;
    edtCST_IPI: TDBEdit;
    edtClasseEnqIPI: TDBEdit;
    lblCodEnquadramento: TLabel;
    edtCodEnqIPI: TDBEdit;
    lblValorBC_IPI_Item: TLabel;
    edtBC_IPI: TDBEdit;
    lblAliquotaIPI: TLabel;
    edtPercIPIItem: TDBEdit;
    lblValorUnidadeIPI: TLabel;
    edtvalorIPIUnidade: TDBEdit;
    lblValorIPI_Item: TLabel;
    edtValorIPIItem: TDBEdit;
    lblPercPartilhaDestino: TLabel;
    edtPercPartilhaOrigemDestino: TDBEdit;
    lblValorPartilhaDestinoItem: TLabel;
    edtvalorPartilhaDestinoItem: TDBEdit;
    lblFCPUFDestino: TLabel;
    edtPercFCPUFDestinoItem: TDBEdit;
    lblValorFCPUFDestino: TLabel;
    edtValorFCPUFDestinoItem: TDBEdit;
    tbsCOFINS: TTabSheet;
    lblCST_PIS: TLabel;
    lblAliqPIS: TLabel;
    lblValorPisItem: TLabel;
    tbsDFeOlhonoImposto: TTabSheet;
    edtAliquotaPIS: TDBEdit;
    edtValorPIS: TDBEdit;
    cboCST_PIS: TDBLookupComboBox;
    lblCSTCofins: TLabel;
    cboCST_COFINS: TDBLookupComboBox;
    edtAliquotaCOFINS: TDBEdit;
    lblAliquotaCofins: TLabel;
    lblValorCofins: TLabel;
    edtValorCOFINSItem: TDBEdit;
    lblCargaTribFedNacional: TLabel;
    lblcargaTribFedImportados: TLabel;
    lblcargaTribEstadual: TLabel;
    lblcargaTribMunicipal: TLabel;
    lblValorTribFedNacional: TLabel;
    lblValorTribFedImportados: TLabel;
    lblValorTribEstadual: TLabel;
    lblValorTribMunicipal: TLabel;
    edtCargaTribFedNacional: TDBEdit;
    edtCargaTribFedImportados: TDBEdit;
    edtCargaTribEstadual: TDBEdit;
    edtCargaTribMunicipal: TDBEdit;
    edtValorTribFedNacional: TDBEdit;
    edtValorTribFedImportados: TDBEdit;
    edtValorTribEstadual: TDBEdit;
    edtValorTribMunicipal: TDBEdit;
    grpTotaisTransporte: TGroupBox;
    grpTransportador: TGroupBox;
    rdgTipoFrete: TDBRadioGroup;
    grpIdentificacaoTransportador: TGroupBox;
    lblCNPJ_Transportador: TLabel;
    lblRazaoSocialTransportador: TLabel;
    lblInscrEstadualTransportador: TLabel;
    chkIsentoIcms: TDBCheckBox;
    edtCNPJTransportador: TDBEdit;
    edtRSocialTransportador: TDBEdit;
    edtIETransportador: TDBEdit;
    grpEndereco: TGroupBox;
    lblEnderecoTransportador: TLabel;
    lblNumeroEndTransportador: TLabel;
    lblCepEndTransportador: TLabel;
    lblCidadeEndTransportador: TLabel;
    lblBairroEndTransportador: TLabel;
    lblUFEndTransportador: TLabel;
    edtEnderecoTransportador: TDBEdit;
    edtNumEndTransportador: TDBEdit;
    edtCepEndTransportador: TDBEdit;
    edtBairroEndTransportador: TDBEdit;
    edtCidadeEndTransportador: TDBEdit;
    edtUFEndTransportador: TDBEdit;
    grpVeiculo: TGroupBox;
    lblPlaca: TLabel;
    lblUFVeiculo: TLabel;
    lblRNTC: TLabel;
    edtPlaca: TDBEdit;
    edtUFVeiculo: TDBEdit;
    edtRNTC: TDBEdit;
    grpVolumes: TGroupBox;
    lblQuantidadeVolumes: TLabel;
    lblEspecieVolumes: TLabel;
    lblMarcaVolume: TLabel;
    lblNumero: TLabel;
    lblPesoBruto: TLabel;
    lblPesoLiquido: TLabel;
    edtQuantidadeVolumes: TDBEdit;
    edtEspecieVolumes: TDBEdit;
    edtMarcaVolumes: TDBEdit;
    edtPesoLiquido: TDBEdit;
    edtPesoBruto: TDBEdit;
    edtNumeroVolumes: TDBEdit;
    grpTotalizacao: TGroupBox;
    grpBCIcms: TGroupBox;
    edtBCIcms: TDBEdit;
    grpBCICMS_ST: TGroupBox;
    edtBCIcmsST: TDBEdit;
    grpTotalIcms: TGroupBox;
    edtTotalIcms: TDBEdit;
    grpTotalProdutos: TGroupBox;
    edtTotalProdutos: TDBEdit;
    grpValorICMS_ST: TGroupBox;
    edtTotalICMS_ST: TDBEdit;
    grpTotalFrete: TGroupBox;
    edtTotalFrete: TDBEdit;
    grpTotalDesconto: TGroupBox;
    edtTotalDesconto: TDBEdit;
    grpTotalSeguro: TGroupBox;
    edtTotalSeguro: TDBEdit;
    grpOutrasDespesas: TGroupBox;
    edtOutrasDespesas: TDBEdit;
    grpTotalIPI: TGroupBox;
    edtTotalIPI: TDBEdit;
    grpTotalPIS: TGroupBox;
    edtTotalPIS: TDBEdit;
    grpTotalICMSDEsonerado: TGroupBox;
    edtTotalICMSDesonerado: TDBEdit;
    grpTotalCOFINS: TGroupBox;
    edtTotalCOFINS: TDBEdit;
    grpTotalNota: TGroupBox;
    edtTotaldaNota: TDBEdit;
    grpTotaldosTributos: TGroupBox;
    edtTotalTributos: TDBEdit;
    grpInformacoesFisco: TGroupBox;
    memInfoFisco: TDBMemo;
    grpInfoComplementar: TGroupBox;
    memInfoComplementar: TDBMemo;
    grpExportacao: TGroupBox;
    lblUFEmbarque: TLabel;
    lblLocalEmbarque: TLabel;
    lblLocalDespacho: TLabel;
    cboUFEmbarque: TDBLookupComboBox;
    edtLocalEmbarque: TDBEdit;
    edtLocalDespacho: TDBEdit;
    grpNotasConhecimentosRef: TGroupBox;
    grdNotasConhecimentoRef: TDBGrid;
    imgIncluirNFConhecref: TImage;
    grdNotasprodutoReferenciada: TDBGrid;
    imgNFRefProdutor: TImage;
    grdCupomFiscalVinculado: TDBGrid;
    imgIncluriCupomRef: TImage;
    grpEndere�o: TGroupBox;
    grpLocalEntregaRetirada: TGroupBox;
    chkLocalRetirada: TDBCheckBox;
    chkLocalEntrega: TDBCheckBox;
    lblEndereco_Dest: TLabel;
    lblCep_Dest: TLabel;
    lblNumero_Dest: TLabel;
    lblBairro_Dest: TLabel;
    edtEndereco_Dest: TDBEdit;
    edtNumero_Dest: TDBEdit;
    edtCEP_Dest: TDBEdit;
    edtBairro_Dest: TDBEdit;
    lblUF_Dest: TLabel;
    edtUF_Dest: TDBEdit;
    edtCidade_Dest: TDBEdit;
    lblCidade_Dest: TLabel;
    lblComplemento_Dest: TLabel;
    edtComplemento_Dest: TDBEdit;
    imgEnd_Retirada: TImage;
    imgEnd_Entrega: TImage;
    txtVersao_XML_NFe: TDBText;
    imgIncluirTransportadora: TImage;
    tbsIPIDevolvido: TTabSheet;
    lblPercIPIDevolvido_Item: TLabel;
    lblValorIPIDevolvido_Item: TLabel;
    edtPercIPIDevolvidoItem: TDBEdit;
    edtValorIPIDevolvidoItem: TDBEdit;
    grpICMS: TGroupBox;
    lblOrigemMercadoria: TLabel;
    lblCST_CSOSN: TLabel;
    lblBCIcmsItem: TLabel;
    lblPercIcmsItem: TLabel;
    lblValorICMSItem: TLabel;
    lblPercReducaoICMS: TLabel;
    lblpercOIperacaoPropia: TLabel;
    lblIsentasNT: TLabel;
    lblICMS_Operacao: TLabel;
    lblPercICMSDirefiro: TLabel;
    lblValorICMSDiferido: TLabel;
    cboOrigemMercadoria: TDBLookupComboBox;
    edtPercReducaoICMS: TDBEdit;
    edtBCIcmsItem: TDBEdit;
    edtAliqIcms: TDBEdit;
    edtValorIcmsItem: TDBEdit;
    edtPercOperacaoPropria: TDBEdit;
    edtIsentasNtribItem: TDBEdit;
    edtIcmsOperacao: TDBEdit;
    edtPercDiferimento: TDBEdit;
    edtValorICMSDiferido: TDBEdit;
    edtCST_CSOSN: TDBEdit;
    imgErro: TImage;
    edtStatus: TDBEdit;
    ActionList1: TActionList;
    actEstorno: TAction;
    actConfirmar: TAction;
    edtStatusNFRodape: TDBEdit;
    actEditar: TAction;
    actExcluirItemNFS: TAction;
    lblComplementoItem: TLabel;
    edtComplementoItem: TEdit;
    imgSalvarItem: TImage;
    actGravarItem: TAction;
    actIncluir: TAction;
    grpOrdemServico: TGroupBox;
    edtNumOrdemServico: TDBEdit;
    ACBrNFe1: TACBrNFe;
    ACBrMail1: TACBrMail;
    actExcluirCFOP: TAction;
    actIncluirItemCDS: TAction;
    ACBrNCMs1: TACBrNCMs;
    actDesfazer: TAction;
    actSalvar: TAction;
    actExcluir: TAction;
    ACBrNFeDANFeRL1: TACBrNFeDANFeRL;
    actReferenciarCupomFiscal: TAction;
    actExcluirDocRefNFS: TAction;
    grdItens: TDBGrid;
    grpParcelas: TGroupBox;
    grdParcelasNota: TDBGrid;
    grpTotalFCP_UF_Destino: TGroupBox;
    edtValorFCP_UF_Destino: TDBEdit;
    grpValor_ICMS_UF_Destino: TGroupBox;
    edtValorICMS_UF_Destino: TDBEdit;
    grpValorIOCMS_UF_Remetente: TGroupBox;
    edtValorICMS_UF_Remetente: TDBEdit;
    grpValorEntrada: TGroupBox;
    edtValor_Entrada: TDBEdit;
    imgAtualizarCliente: TImage;
    Image1: TImage;
    Image2: TImage;
    btnRecalc: TSpeedButton;
    pgbRecalc: TProgressBar;
    rdgIndicadorIEDestinatario: TDBRadioGroup;
    lblPedidoCompra: TLabel;
    edtPedidoCompra: TDBEdit;
    lblItemPedidoCompra: TLabel;
    edtItemPedidoCompra: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure imgIncluirTransportadoraClick(Sender: TObject);
    procedure edtCodigoItemKeyPress(Sender: TObject; var Key: Char);
    procedure imgIncluirNFConhecrefClick(Sender: TObject);
    procedure imgNFRefProdutorClick(Sender: TObject);
    procedure imgIncluriCupomRefClick(Sender: TObject);
    procedure cboModeloNotaKeyPress(Sender: TObject; var Key: Char);
    procedure edtNCMKeyPress(Sender: TObject; var Key: Char);
    procedure edtConteudoPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure edtConteudoPesquisaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure imgEnd_RetiradaClick(Sender: TObject);
    procedure imgEnd_EntregaClick(Sender: TObject);
    procedure edtConteudoPesquisaEnter(Sender: TObject);
    procedure edtConteudoPesquisaExit(Sender: TObject);
    procedure grdTabelaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdTabelaDblClick(Sender: TObject);
    procedure grdTabelaKeyPress(Sender: TObject; var Key: Char);
    procedure edtNumeroNotaChange(Sender: TObject);
    procedure edtCNPJDestinatarioChange(Sender: TObject);
    procedure imgConfirmarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure actEstornoExecute(Sender: TObject);
    procedure actConfirmarExecute(Sender: TObject);
    procedure edtChaveAcessoConsultaChange(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure grdParcelasNotaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdItensDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdNotasConhecimentoRefDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdNotasprodutoReferenciadaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdCupomFiscalVinculadoDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdItensKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure actExcluirItemNFSExecute(Sender: TObject);
    procedure grdCFOPNotaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure actGravarItemExecute(Sender: TObject);
    procedure grdItensDblClick(Sender: TObject);
    procedure actIncluirExecute(Sender: TObject);
    procedure edtCFOPNotaExit(Sender: TObject);
    procedure grdCFOPNotaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure actExcluirCFOPExecute(Sender: TObject);
    procedure edtCFOPNotaKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoItemExit(Sender: TObject);
    procedure actIncluirItemCDSExecute(Sender: TObject);
    procedure edtComplementoItemExit(Sender: TObject);
    procedure edtNCMExit(Sender: TObject);
    procedure edtCFOpItemExit(Sender: TObject);
    procedure edtQuantidadeExit(Sender: TObject);
    procedure edtvalorUnitarioExit(Sender: TObject);
    procedure edtvalorSeguroItemExit(Sender: TObject);
    procedure edtPercDescontoItemExit(Sender: TObject);
    procedure edtCST_CSOSNExit(Sender: TObject);
    procedure actDesfazerExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure imgSairClick(Sender: TObject);
    procedure imgTrocarClienteClick(Sender: TObject);
    procedure rdpOpcoesPesquisaClick(Sender: TObject);
    procedure cboFormaPagamentoExit(Sender: TObject);
    procedure cboFormaPagamentoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure lblF5Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure actExcluirExecute(Sender: TObject);
    procedure actReferenciarCupomFiscalExecute(Sender: TObject);
    procedure grdNotasConhecimentoRefKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure actExcluirDocRefNFSExecute(Sender: TObject);
    procedure rdgTipoOperacaoClick(Sender: TObject);
    procedure edtPercIPIDevolvidoItemExit(Sender: TObject);
    procedure edtValorIPIDevolvidoItemExit(Sender: TObject);
    procedure edtBC_IPIExit(Sender: TObject);
    procedure edtPercIPIItemExit(Sender: TObject);
    procedure edtValorIPIItemExit(Sender: TObject);
    procedure rdgTipoFreteClick(Sender: TObject);
    procedure edtIsentasNT_STExit(Sender: TObject);
    procedure edtValorICMSDiferidoExit(Sender: TObject);
    procedure edtValorIcmsItemExit(Sender: TObject);
    procedure rdgConsumidorFinalClick(Sender: TObject);
    procedure edtAliqIcmsExit(Sender: TObject);
    procedure edtAliqInternaDestinoExit(Sender: TObject);
    procedure edtPercFCPUFDestinoItemExit(Sender: TObject);
    procedure rdgDestinoOperacaoClick(Sender: TObject);
    procedure edtCESTExit(Sender: TObject);
    procedure imgAtualizarClienteClick(Sender: TObject);
    procedure edtPlacaExit(Sender: TObject);
    procedure rdgTipoAtendimentoClick(Sender: TObject);
    procedure btnRecalcClick(Sender: TObject);
    procedure rdgIndicadorIEDestinatarioClick(Sender: TObject);
    procedure edtDataSaidaExit(Sender: TObject);
    procedure edtItemPedidoCompraExit(Sender: TObject);
  private
    { Private declarations }
    bOk:boolean;
    iImportacaoCupom:smallint;
    function AbrirTabelaNotaFiscal(pOpcao:smallint; pConteudo:string):boolean;
    procedure MostrarOcultarAbas(pOpcao:boolean);
    procedure RelacionarCFOP_NFS;
    procedure RelacionarCliente(pCliente:integer);
    procedure RelacionarTransportador_NFS;
    procedure RelacionarParcelas_NFS;
    procedure RelacionarItens_NFS;
    procedure RelacionarFCP_Estados;
    procedure RelacionarDocumentos_Ref(pOpcao:smallint);
    procedure AbrirTabelas;
    procedure AbrirTabela_Fornecedor;
    procedure AbrirTabela_Cidades;
    procedure FecharTabelas;
    procedure AtualizaDescricaoStatus;
    procedure HabilitaDesabilitaControles(pOpcao:boolean);
    procedure ResetarCampos;
    procedure LerconfiguracoesNFE;
    function Atualizar_Saldo_Produto(pOpcao:smallint):boolean;
    function GerarMovimento(pOpcao:smallint):boolean;
    function GravarEstornarRegistro50(pOpcao:smallint):boolean;
    function ValidarCRE:boolean;
    function ChecarValidadeCertificado:boolean;
    function GravarCRE(pOpcao:smallint):boolean;
    function GravarEstornarRegistro54(pOpcao:smallint):boolean;
    function GravarEstornarRegistroC100(pOpcao, pCancelada: smallint):boolean;
    function GravarEstornarRegistroC101(pOpcao, pCancelada: smallint):boolean;
    function GravarEstornarRegistroC170(pOpcao: smallint):boolean;
    function GravarEstornarRegistroC190(pOpcao: smallint):boolean;
    function GravarEstornarLivroSaida(pOpcao: smallint):boolean;
    function Consistir_Parcelas_NFS(pOpcao:smallint):boolean;
    function Consistir_Finalidade_NFE:boolean;
    function Consistir_Local_Embarque:boolean;
    function Man_Tab_NFS(pOpcao:smallint):boolean;
    function Man_Tab_ItemNFS(pOpcao:smallint):boolean;
    function Man_Tab_TransportadoraNFS(pOpcao:smallint):boolean;
    function ValidarCadastroCliente(pEstado, pDocumento, pIE:string):boolean;
    function ValidarIBGE_UF(pUF:string):boolean;
    function ValidarIBGE_CIDADE(pCidade:integer):boolean;
    function Man_Tab_CFOP_NFS(pOpcao:smallint):boolean;
    function Man_Tab_Documento_Ref(pOpcao:smallint):boolean;
    function Man_Tab_Parcelas_NFS(pOpcao:smallint):boolean;
    function PesquisarCFOP(pOpcao:smallint; pConteudo:string):boolean;
    procedure CalcularValoresItens;
    function ValidarNCM(pNCM:string):boolean;
    function ValidarInformacoes:boolean;
    function ValidarInformacoesItem:boolean;
    procedure CalcularParcelas;
    procedure CalcularTotaisNF;
    function ConsistirCfop_NFS(pNotaFiscal: Integer; pModelo: string): boolean;
    function GerarProximoNumeroNF:integer;
    procedure GravarNumeroNF_Tab_Itens(pNF:integer);
    procedure GravarNumeroNF_Tab_CFOP(pNF:integer);
    procedure GravarNumeroNF_Tab_PARCELAS(pNF:integer);
    procedure GravarNumeroNF_Tab_End_entrega(pNF:integer);
    procedure GravarNumeroNF_Tab_End_retirada(pNF:integer);
    procedure GravarNumeroNF_Tab_Transportador(pNF:integer);
    procedure GravarNumeroNF_Tab_Doc_Referenciados(pNF:integer);
    procedure CalcularDifal;
    procedure CalcularFCP;
    procedure HabilitarDesabilitarGrupoPartilha_FCP;
    function PesquisarCliente(pConteudo:string):boolean;

  public
    { Public declarations }
  end;

var
  frmModNFSaida: TfrmModNFSaida;

implementation

{$R *.dfm}

uses dataDBEXMaster, dataMProvider, dataMRelatorios, dataMSource, dataMSProcedure, datamZeus, uConstantes_Padrao, uFuncoes, modPesquisaFornecedorCNPJRSocial, modPesquisaProduto, modPesqCliente, modDocumentoReferenciadosNFS, modNFProdutorReferenciadaNFS, modCupomFiscalReferenciadoNFS, modEnderecoRetiradaNFS, modEnderecoEntregaNFS, modInformacoesCRE_NFS;

function TfrmModNFSaida.AbrirTabelaNotaFiscal(pOpcao: smallint; pConteudo: string): boolean;
var
  sWhere:string;

begin

  sWhere := '';

  LimparMSG_ERRO(lblMsg, imgErro);

  lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_AGUARDE;
  Application.ProcessMessages;

  dmMProvider.cdsNFSaida.Close;
  dmMProvider.cdsNFSaida.ProviderName := 'dspNFSaida';

  dmDBEXMaster.fdqNFSaida.SQL.Clear;
  dmDBEXMaster.fdqNFSaida.SQL.Add('select * from nfsaida');

  sWhere := dmDBEXMaster.Montar_SQL_Pesquisa_NFSaida(pOpcao,pConteudo);

  dmDBEXMaster.fdqNFSaida.SQL.Add(sWhere);

  if rdpOpcoesPesquisa.ItemIndex = 6 then
    dmDBEXMaster.fdqNFSaida.SQL.Add('WHERE filial = ' + IntToStr(dmDBEXMaster.iIdFilial))
  else
    dmDBEXMaster.fdqNFSaida.SQL.Add('and filial = ' + IntToStr(dmDBEXMaster.iIdFilial));

  dmDBEXMaster.fdqNFSaida.SQL.Add('order by emissao, nfsaida');

  try

    dmMProvider.cdsNFSaida.Open;
    dmMProvider.cdsNFSaida.ProviderName := '';

    if (dmMProvider.cdsNFSaida.IsEmpty) and (pConteudo <> '-1') then
    begin

      lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA + ' - '  + edtConteudoPesquisa.Text;
      imgErro.Visible := true;
      Application.ProcessMessages;
      Result := not dmMProvider.cdsNFSaida.IsEmpty;

    end
    else if (dmMProvider.cdsNFSaida.IsEmpty) and (pConteudo = '-1') then
      Result := dmMProvider.cdsNFSaida.IsEmpty;

  except
    on E: exception do
    begin

      lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + Tratar_Erro_Conexao(E);
      imgErro.Visible := True;
      Application.ProcessMessages;

    end;

  end;

end;

procedure TfrmModNFSaida.AbrirTabelas;
begin

  // MODELO DE DOCUMENTOS
  dmMProvider.cdsModelo_Doc.Close;
  dmMProvider.cdsModelo_Doc.ProviderName := 'dspModelo_Doc';

  dmDBEXMaster.fdqModelo_doc.SQL.Clear;
  dmDBEXMaster.fdqModelo_doc.SQL.Add('select * from modelo');
  dmDBEXMaster.fdqModelo_doc.SQL.Add('order by descricao');

  dmMProvider.cdsModelo_Doc.Open;
  dmMProvider.cdsModelo_Doc.ProviderName := '';

  //FORMAS DE PAGAMENTO
  dmMProvider.cdsFormasPagamento.Close;
  dmMProvider.cdsFormasPagamento.ProviderName := 'dspFormasPagamento';

  dmDBEXMaster.fdqFormasPagamento.SQL.Clear;
  dmDBEXMaster.fdqFormasPagamento.SQL.Add('select * from formapagamento');
  dmDBEXMaster.fdqFormasPagamento.SQL.Add('order by nome');

  dmMProvider.cdsFormasPagamento.Open;
  dmMProvider.cdsFormasPagamento.ProviderName := '';

  //ORIGEM DA MERCADORIA
  dmMProvider.cdsOrigemMercadoria.Close;
  dmMProvider.cdsOrigemMercadoria.ProviderName := 'dspOrigemMercadoria';

  dmDBEXMaster.fdqOrigemMercadoria.SQL.Clear;
  dmDBEXMaster.fdqOrigemMercadoria.SQL.Add('select * from ORIGEM_MERCADORIA');
  dmDBEXMaster.fdqOrigemMercadoria.SQL.Add('order by codigo');

  dmMProvider.cdsOrigemMercadoria.Open;
  dmMProvider.cdsOrigemMercadoria.ProviderName := '';

  //Config ECF
  dmMProvider.cdsConfigECF.Close;
  dmMProvider.cdsConfigECF.ProviderName := 'dspConfigECF';

  dmMProvider.cdsConfigECF.Open;
  dmMProvider.cdsConfigECF.ProviderName := '';

end;

procedure TfrmModNFSaida.AbrirTabela_Cidades;
begin

  dmMProvider.cdsCidades.Close;
  dmMProvider.cdsCidades.ProviderName := 'dspCidades';

  dmDBEXMaster.fdqCidades.SQL.Clear;
  dmDBEXMaster.fdqCidades.SQL.Add('select * from cidades');

  dmMProvider.cdsCidades.Open;
  dmMProvider.cdsCidades.ProviderName := '';

end;

procedure TfrmModNFSaida.AbrirTabela_Fornecedor;
begin

  dmMProvider.cdsFornecedor.Close;
  dmMProvider.cdsFornecedor.ProviderName := 'dspFornecedor';

  dmDBEXMaster.fdqTransportadoraNFS.SQL.Clear;
  dmDBEXMaster.fdqTransportadoraNFS.SQL.Add('select * from fornecedor');
  dmDBEXMaster.fdqTransportadoraNFS.SQL.Add('where fornecedor = ' + IntToStr(dmMProvider.cdsNFSaidaTRANSPORTADOR.Value));

  dmMProvider.cdsFornecedor.Open;
  dmMProvider.cdsFornecedor.ProviderName := '';

end;

procedure TfrmModNFSaida.actConfirmarExecute(Sender: TObject);
begin

  LimparMSG_ERRO(lblMsg, imgErro);

  if GravarEstornarRegistroC100(0, dmMProvider.cdsNFSaidaSTATUS.Value) then
  begin

    if GravarEstornarRegistroC101(0, dmMProvider.cdsNFSaidaSTATUS.Value) then
    begin

      // grava reg 50 sintegra
      if GravarEstornarRegistro50(1) then //incluir pela nf saida
      begin

        // grava reg 54 sintegra
        if GravarEstornarRegistro54(1) then //incluir pela nf saida
        begin

          // 0-lan�amento
          if GerarMovimento(0) then
          begin

            if Atualizar_Saldo_Produto(0) then
            begin

              if GravarEstornarLivroSaida(0) then
              begin

                if ValidarCRE then
                begin

                  if GravarCRE(0) then
                  begin

                    dmMSProcedure.fdspMaster.StoredProcName := 'EXECUTA_SQL';
                    dmMSProcedure.fdspMaster.Prepare;

                    dmMSProcedure.fdspMaster.Params[0].Value := 'UPDATE NFSAIDA SET STATUS = 1' + ' WHERE NFSAIDA = ' + IntToStr(dmMProvider.cdsNFSaidaNFSAIDA.Value) + ' AND MODELO = ' + QuotedStr(dmMProvider.cdsNFSaidaMODELO.Value);
                    dmMSProcedure.fdspMaster.ExecProc;

                    dmMProvider.cdsNFSaida.Edit;
                    dmMProvider.cdsNFSaidaSTATUS.Value := 1;
                    dmMProvider.cdsNFSaida.Post;

                    edtConteudoPesquisa.SetFocus;

                    AtualizaDescricaoStatus;

                    LimparMSG_ERRO(lblMsg, imgErro);

                    if dmDBEXMaster.fdtMaster.Active then
                      dmDBEXMaster.fdtMaster.Commit;

                    dmDBEXMaster.fdcMaster.Close;
                    dmDBEXMaster.fdcMaster.Open;

                  end
                  else
                  begin

                    if dmDBEXMaster.fdtMaster.Active then
                      dmDBEXMaster.fdtMaster.Rollback;

                  end;

                end
                else
                begin

                  dmMSProcedure.fdspMaster.StoredProcName := 'EXECUTA_SQL';
                  dmMSProcedure.fdspMaster.Prepare;

                  dmMSProcedure.fdspMaster.Params[0].Value := 'UPDATE NFSAIDA SET STATUS = 1' + ' WHERE NFSAIDA = ' + IntToStr(dmMProvider.cdsNFSaidaNFSAIDA.Value) + ' AND MODELO = ' + QuotedStr(dmMProvider.cdsNFSaidaMODELO.Value);
                  dmMSProcedure.fdspMaster.ExecProc;

                  dmMProvider.cdsNFSaida.Edit;
                  dmMProvider.cdsNFSaidaSTATUS.Value := 1;
                  dmMProvider.cdsNFSaida.Post;

                  edtConteudoPesquisa.SetFocus;

                  AtualizaDescricaoStatus;

                  LimparMSG_ERRO(lblMsg, imgErro);

                  if dmDBEXMaster.fdtMaster.Active then
                    dmDBEXMaster.fdtMaster.Commit;

                  dmDBEXMaster.fdcMaster.Close;
                  dmDBEXMaster.fdcMaster.Open;

                end;

              end
              else
              begin

                if dmDBEXMaster.fdtMaster.Active then
                  dmDBEXMaster.fdtMaster.Rollback;

              end;

            end
            else
            begin

              if dmDBEXMaster.fdtMaster.Active then
                dmDBEXMaster.fdtMaster.Rollback;

            end;

          end
          else
          begin

            if dmDBEXMaster.fdtMaster.Active then
              dmDBEXMaster.fdtMaster.Rollback;

          end;

        end
        else
        begin

          if dmDBEXMaster.fdtMaster.Active then
            dmDBEXMaster.fdtMaster.Rollback;

        end;

      end
      else
      begin

        if dmDBEXMaster.fdtMaster.Active then
          dmDBEXMaster.fdtMaster.Rollback;

      end;

    end
    else
    begin

      if dmDBEXMaster.fdtMaster.Active then
        dmDBEXMaster.fdtMaster.Rollback;

    end;

  end
  else
  begin

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Rollback;

  end;

end;

procedure TfrmModNFSaida.actDesfazerExecute(Sender: TObject);
begin

  grpValorEntrada.Enabled := False;

  if pgcNotaFiscal.ActivePageIndex = 2 then
  begin

    if InserindoEditando(dmMProvider.cdsItemNFSaida) then
      dmMProvider.cdsItemNFSaida.Cancel
    else if InserindoEditando(dmMProvider.cdsNFSaida) then
      dmMProvider.cdsNFSaida.Cancel;

  end
  else if InserindoEditando(dmMProvider.cdsNFSaida) then
    dmMProvider.cdsNFSaida.Cancel;

  HabilitaDesabilitaControles(False);

  if dmMProvider.cdsNFSaida.IsEmpty then
    FecharTabelas;

  ResetarCampos;

end;

procedure TfrmModNFSaida.actEditarExecute(Sender: TObject);
begin

  LimparMSG_ERRO(lblMsg, imgErro);

  if dmMProvider.cdsNFSaida.Active then
  begin

    if dmMProvider.cdsNFSaidaSTATUS.Value = 0 then
    begin

      if not InserindoEditando(dmMProvider.cdsNFSaida)  then
      begin

        pgcNotaFiscal.Pages[1].TabVisible  := true;
        pgcNotaFiscal.ActivePageIndex      := 1;

        HabilitaDesabilitaControles(True);
        dmMProvider.cdsNFSaida.Edit;
        edtCFOPNota.SetFocus;

        grpValorEntrada.Enabled := (dmMProvider.cdsNFSaidaVALOR_ENTRADA.Value > 0);

      end;

    end
    else
    begin

      lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_STATUS_NAO_PERMITE;
      imgErro.Visible := true;
      Application.ProcessMessages;

    end;

  end;

end;

procedure TfrmModNFSaida.actEstornoExecute(Sender: TObject);
begin

  LimparMSG_ERRO(lblMsg, imgErro);

  if not dmDBEXMaster.fdtMaster.Active then
    dmDBEXMaster.fdtMaster.StartTransaction;

  if GravarEstornarRegistroC100(1, dmMProvider.cdsNFSaidaSTATUS.Value) then
  begin

    if GravarEstornarRegistroC101(1, dmMProvider.cdsNFSaidaSTATUS.Value) then
    begin

      // estorna reg 50 sintegra
      if GravarEstornarRegistro50(2) then
      begin

        // estorna reg 54 sintegra
        if GravarEstornarRegistro54(2) then
        begin

          // 2-lan�amento de estorno
          if GerarMovimento(2) then
          begin

            // estorna saldo de produtos
            lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_ESTORNANDO_SALDO_PRODUTO;
            Application.ProcessMessages;
            if Atualizar_Saldo_Produto(1) then
            begin

              if GravarEstornarLivroSaida(1) then
              begin

                if ValidarCRE then
                begin

                  if GravarCRE(1) then
                  begin

                    dmMSProcedure.fdspMaster.StoredProcName := 'EXECUTA_SQL';
                    dmMSProcedure.fdspMaster.Prepare;

                    dmMSProcedure.fdspMaster.Params[0].Value := 'UPDATE NFSAIDA SET STATUS = 0' + ' WHERE NFSAIDA = ' + IntToStr(dmMProvider.cdsNFSaidaNFSAIDA.Value) + ' AND MODELO = ' + QuotedStr(dmMProvider.cdsNFSaidaMODELO.Value);
                    dmMSProcedure.fdspMaster.ExecProc;

                    dmMProvider.cdsNFSaida.Edit;
                    dmMProvider.cdsNFSaidaSTATUS.Value := 0;
                    dmMProvider.cdsNFSaida.Post;

                    AtualizaDescricaoStatus;
                    pgcNotaFiscal.ActivePageIndex := 1;

                    LimparMSG_ERRO(lblMsg, imgErro);

                    if dmDBEXMaster.fdtMaster.Active then
                      dmDBEXMaster.fdtMaster.Commit;

                  end;

                end
                else
                begin

                  dmMSProcedure.fdspMaster.StoredProcName := 'EXECUTA_SQL';
                  dmMSProcedure.fdspMaster.Prepare;

                  dmMSProcedure.fdspMaster.Params[0].Value := 'UPDATE NFSAIDA SET STATUS = 0' + ' WHERE NFSAIDA = ' + IntToStr(dmMProvider.cdsNFSaidaNFSAIDA.Value) + ' AND MODELO = ' + QuotedStr(dmMProvider.cdsNFSaidaMODELO.Value);
                  dmMSProcedure.fdspMaster.ExecProc;

                  dmMProvider.cdsNFSaida.Edit;
                  dmMProvider.cdsNFSaidaSTATUS.Value := 0;
                  dmMProvider.cdsNFSaida.Post;

                  AtualizaDescricaoStatus;
                  pgcNotaFiscal.ActivePageIndex := 1;

                  LimparMSG_ERRO(lblMsg, imgErro);

                  if dmDBEXMaster.fdtMaster.Active then
                    dmDBEXMaster.fdtMaster.Commit;

                end;

              end
              else
              begin

                if dmDBEXMaster.fdtMaster.Active then
                  dmDBEXMaster.fdtMaster.Rollback;

              end;

            end
            else
            begin

              if dmDBEXMaster.fdtMaster.Active then
                dmDBEXMaster.fdtMaster.Rollback;

            end;

          end
          else
          begin

            if dmDBEXMaster.fdtMaster.Active then
              dmDBEXMaster.fdtMaster.Rollback;

          end;

        end
        else
        begin

          if dmDBEXMaster.fdtMaster.Active then
            dmDBEXMaster.fdtMaster.Rollback;

        end;

      end
      else
      begin

        if dmDBEXMaster.fdtMaster.Active then
          dmDBEXMaster.fdtMaster.Rollback;

      end;

    end
    else
    begin

      if dmDBEXMaster.fdtMaster.Active then
        dmDBEXMaster.fdtMaster.Rollback;

    end;


  end
  else
  begin

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Rollback;

  end;

end;

procedure TfrmModNFSaida.actExcluirCFOPExecute(Sender: TObject);
begin

  LimparMSG_ERRO(lblMsg, imgErro);

  if Man_Tab_CFOP_NFS(1) then
    RelacionarCFOP_NFS;

end;

procedure TfrmModNFSaida.actExcluirDocRefNFSExecute(Sender: TObject);
begin

  LimparMSG_ERRO(lblMsg, imgErro);

  if Man_Tab_Documento_Ref(1) then
    RelacionarDocumentos_Ref(0);

end;

procedure TfrmModNFSaida.actExcluirExecute(Sender: TObject);
begin

  LimparMSG_ERRO(lblMsg, imgErro);

  if not dmMProvider.cdsNFSaida.IsEmpty then
  begin

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_AGUARDE;
    Application.ProcessMessages;

    if Man_Tab_Documento_Ref(2) then
    begin

      if Man_Tab_CFOP_NFS(1) then
      begin

        RelacionarCFOP_NFS;

        if Man_Tab_Parcelas_NFS(1) then
        begin

          RelacionarParcelas_NFS;
          RelacionarTransportador_NFS;

          while not dmMProvider.cdsItemNFSaida.Eof do
          begin

            Man_Tab_ItemNFS(1);
            dmMProvider.cdsItemNFSaida.Delete;

          end;

          RelacionarItens_NFS;

          if Man_Tab_NFS(1) then
          begin

            dmMProvider.cdsNFSaida.Delete;

            if dmDBEXMaster.fdtMaster.Active then
              dmDBEXMaster.fdtMaster.Commit;

            MostrarOcultarAbas(False);

            pgcNotaFiscal.ActivePageIndex := 0;

            edtConteudoPesquisa.SetFocus;

          end
          else
          begin

            if dmDBEXMaster.fdtMaster.Active then
              dmDBEXMaster.fdtMaster.Rollback;

          end;

        end
        else
        begin

          if dmDBEXMaster.fdtMaster.Active then
            dmDBEXMaster.fdtMaster.Rollback;

        end;
      end
      else
      begin

        if dmDBEXMaster.fdtMaster.Active then
          dmDBEXMaster.fdtMaster.Rollback;

      end;

    end
    else
    begin

      if dmDBEXMaster.fdtMaster.Active then
        dmDBEXMaster.fdtMaster.Rollback;

    end;

  end;

  LimparMSG_ERRO(lblMsg, imgErro);

end;

procedure TfrmModNFSaida.actExcluirItemNFSExecute(Sender: TObject);
begin

  LimparMSG_ERRO(lblMsg, imgErro);

  if Man_tab_ItemNFS(1) then
    dmMProvider.cdsItemNFSaida.Delete;

end;

procedure TfrmModNFSaida.actGravarItemExecute(Sender: TObject);
begin

  try

    if InserindoEditando(dmMProvider.cdsItemNFSaida) then
    begin

      if ValidarNCM(Trim(dmMProvider.cdsItemNFSaidaCF_IPI.Value)) then
      begin

        if ValidarInformacoesItem then
        begin

          dmMProvider.cdsItemNFSaida.Post;
          ResetarCampos;

          if Man_Tab_ItemNFS(0) then
            edtCodigoItem.SetFocus;

        end;

      end;

    end;
  except

    on E: exception do
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + Tratar_Erro_Conexao(E);
      imgErro.Visible := True;
      Application.ProcessMessages;

    end;

  end;

end;

procedure TfrmModNFSaida.actIncluirExecute(Sender: TObject);
begin

  LimparMSG_ERRO(lblMsg, imgErro);

  try

    iImportacaoCupom := 0;

    FecharTabelas;

    grpValorEntrada.Enabled := False;

    if not InserindoEditando(dmMProvider.cdsNFSaida) then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_AGUARDE;
      Application.ProcessMessages;

      pgcNotaFiscal.ActivePageIndex := 1;
      ResetarCampos;

      frmPesquisaCliente := TfrmPesquisaCliente.Create(self);

      if frmPesquisaCliente.ShowModal = mrOk then
      begin

        if ChecarValidadeCertificado then
        begin

          if ValidarIBGE_UF(dmMProvider.cdsPesqClientesESTADOENTREGA.Value) then
          begin

            if not ValidarCadastroCliente(dmMProvider.cdsPesqClientesESTADOENTREGA.Value, dmMProvider.cdsPesqClientesCNPJ.Value, Trim(dmMProvider.cdsPesqClientesINSCRICAO.Value)) then
            begin

              if Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + ', ' + MSG_VALIDARcAD_CLI_SEFAZ), 'Aten��o!', mb_IconQuestion + mb_DefButton2 + mb_YesNo)<> idYes then
                exit;

            end;

            if ValidarIBGE_CIDADE(dmMProvider.cdsPesqClientesCIDADEENTREGA.Value) then
            begin

              pgcNotaFiscal.ActivePageIndex := 1;
              HabilitaDesabilitaControles(True);

              if AbrirTabelaNotaFiscal(0,'-1') then
              begin

                dmMProvider.cdsNFSaida.Append;

                dmMProvider.cdsNFSaidaNFSAIDA.Value       := GerarProximoNumeroNF;
                dmMProvider.cdsNFSaidaDESTINATARIO.Value  := dmMProvider.cdsPesqClientesCLIENTE.Value;
                dmMProvider.cdsNFSaidaDESTINATARIO_.Value := dmMProvider.cdsPesqClientesCNPJ.Value;

                if Length(dmMProvider.cdsPesqClientesCNPJ.Value) <= 11 then
                  dmMProvider.cdsNFSaidaCONSUMIDOR_FINAL.Value := 1;

                dmMProvider.cdsNFSaidaINFO_FISCO.Value    := dmMProvider.cdsFilialOBSERVACAO_NFSAIDA.Value;

                if dmMProvider.cdsNFSaidaUF_DEST.Value = 'EX' then
                  dmMProvider.cdsNFSaidaDESTINO_OPERACAO.Value := 3
                else if dmMProvider.cdsNFSaidaUF_DEST.Value <> dmMProvider.cdsFilialESTADO.Value then
                  dmMProvider.cdsNFSaidaDESTINO_OPERACAO.Value := 2
                else if dmMProvider.cdsNFSaidaUF_DEST.Value = dmMProvider.cdsFilialESTADO.Value then
                  dmMProvider.cdsNFSaidaDESTINO_OPERACAO.Value := 1;

                if Man_Tab_NFS(0) then
                begin

                  MostrarOcultarAbas(True);

                  RelacionarItens_NFS;

                  RelacionarDocumentos_Ref(0);

                  RelacionarTransportador_NFS;

                  edtCFOPNota.SetFocus;
                  LimparMSG_ERRO(lblMsg, imgErro);

                end;

              end
              else
              begin

                lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + ', erro ao abrir tabela de notas';
                imgErro.Visible := true;

              end;

            end
            else
            begin

              lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_CODIGO_IBGE_ERRADO + ' ' + dmMProvider.cdsCidadesNOME.Value;
              imgErro.Visible := true;

            end;

          end
          else
          begin

            lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_UF_SEM_CODIGO_IBGE + dmMProvider.cdsPesqClientesESTADOENTREGA.Value;
            imgErro.Visible := true;

          end;

        end
        else
        begin

          lblmsg.Caption  := dmDBEXMaster.sNomeUsuario + ', ' + 'seu certificado venceu em: ' + FormatDateTime('dd/mm/yyyy',ACBrNFe1.SSL.CertDataVenc);
          imgErro.Visible := true;
          Application.ProcessMessages;
          exit;

        end;

      end;

      FreeAndNil(frmPesquisaCliente);
      Application.ProcessMessages;

    end
    else
    begin

      lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_SITUACAO_NAO_PERMIE;
      imgErro.Visible := True;
      Application.ProcessMessages;

    end;
  except
    on E: exception do
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', ' + Tratar_Erro_Conexao(E);
      imgErro.Visible := True;
      Application.ProcessMessages;

    end;

  end;

end;

procedure TfrmModNFSaida.actIncluirItemCDSExecute(Sender: TObject);
begin

{
  if dmMProvider.iContaItem <= 0 then
  begin

    dmDBEXMaster.fdqRetorna_Gnr_ItemNFS.Close;
    dmDBEXMaster.fdqRetorna_Gnr_ItemNFS.Open;
    dmMProvider.iContaItem := dmDBEXMaster.fdqRetorna_Gnr_ItemNFSOP_GNR_ITEM_NFS.Value + 1;

  end
  else
    dmMProvider.iContaItem := dmMProvider.iContaItem + 1;
}

  if not InserindoEditando(dmMProvider.cdsItemNFSaida) then
    dmMProvider.cdsItemNFSaida.Append;

  if dmDBEXMaster.fdqMasterPesquisa.Active then
  begin

    dmMProvider.cdsItemNFSaidaPRODUTO.Value                               := dmDBEXMaster.fdqMasterPesquisa.FieldByName('PRODUTO').Value;
    dmMProvider.cdsItemNFSaidaDESCRICAO_PRODUTO.Value                     := dmDBEXMaster.fdqMasterPesquisa.FieldByName('DESCRICAO').Value;
    dmMProvider.cdsItemNFSaidaUNIDADE.Value                               := dmDBEXMaster.fdqMasterPesquisa.FieldByName('UNIDADE').Value;
    edtCodigoItem.Text                                                    := IntToStr(dmMProvider.cdsItemNFSaidaPRODUTO.Value);

    if dmDBEXMaster.fdqMasterPesquisa.FieldByName('GERADO').Value = 0 then
    begin

      dmMProvider.cdsItemNFSaidaEAN.Value                                 := dmDBEXMaster.fdqMasterPesquisa.FieldByName('BARRAS').Value;
      dmMProvider.cdsItemNFSaidaEAN_TRIBUTAVEL.Value                      := dmMProvider.cdsItemNFSaidaEAN.Value;

      if Length(Trim(dmMProvider.cdsItemNFSaidaEAN.Value)) <=0 then
      begin

        dmMProvider.cdsItemNFSaidaEAN.Value                               := '';
        dmMProvider.cdsItemNFSaidaEAN_TRIBUTAVEL.Value                    := '';

      end;

    end
    else
    begin

      dmMProvider.cdsItemNFSaidaEAN.Value                                 := IntToStr(dmMProvider.cdsItemNFSaidaPRODUTO.Value);
      dmMProvider.cdsItemNFSaidaEAN_TRIBUTAVEL.Value                      := '';

    end;

    dmMProvider.cdsItemNFSaidaCF_IPI.Value                                := dmDBEXMaster.fdqMasterPesquisa.FieldByName('NCM').Value;
    dmMProvider.cdsItemNFSaidaEX_TIPI.Value                               := dmDBEXMaster.fdqMasterPesquisa.FieldByName('CF_IPI').AsInteger;
    dmMProvider.cdsItemNFSaidaCEST.Value                                  := dmDBEXMaster.fdqMasterPesquisa.FieldByName('CEST').AsString;

    { VERIFICA SE A NOTA N�O � DE DEVOLU��O }
    if dmMProvider.cdsNFSaidaFINALIDADE_NF.Value < 3 then
    begin

      if dmDBEXMaster.fdqMasterPesquisa.FieldByName('PROMOCAO').Value = 0 then
        dmMProvider.cdsItemNFSaidaVALORUNITARIO.AsFloat     := dmDBEXMaster.fdqMasterPesquisa.FieldByName('PRECODEVENDA').Value
      else
        dmMProvider.cdsItemNFSaidaVALORUNITARIO.AsFloat     := dmDBEXMaster.fdqMasterPesquisa.FieldByName('PRECOPROMOCAO').Value;

    end
    else
      dmMProvider.cdsItemNFSaidaVALORUNITARIO.AsFloat     := dmDBEXMaster.fdqMasterPesquisa.FieldByName('CUSTOBRUTO').Value;

    dmMProvider.cdsItemNFSaidaCST_PIS.Value                               := dmDBEXMaster.fdqMasterPesquisa.FieldByName('CST_PIS').Value;
    dmMProvider.cdsItemNFSaidaP_ALIQUOTA_PIS.Value                        := dmDBEXMaster.fdqMasterPesquisa.FieldByName('ALIQUOTA_PIS').Value;
    dmMProvider.cdsItemNFSaidaCST_COFINS.Value                            := dmDBEXMaster.fdqMasterPesquisa.FieldByName('CST_COFINS').Value;
    dmMProvider.cdsItemNFSaidaP_ALIQUOTA_COFINS.Value                     := dmDBEXMaster.fdqMasterPesquisa.FieldByName('ALIQUOTA_COFINS').Value;
    dmMProvider.cdsItemNFSaidaCST_IPI.Value                               := dmDBEXMaster.fdqMasterPesquisa.FieldByName('CST_IPI').Value;
    dmMProvider.cdsItemNFSaidaIPI.Value                                   := dmDBEXMaster.fdqMasterPesquisa.FieldByName('IPI').Value;
    dmMProvider.cdsItemNFSaidaCARGA_NAC_FEDERAL.Value                     := dmDBEXMaster.fdqMasterPesquisa.FieldByName('CARGA_NAC_FEDERAL').AsCurrency;
    dmMProvider.cdsItemNFSaidaCARGA_IMP_FEDERAL.Value                     := dmDBEXMaster.fdqMasterPesquisa.FieldByName('CARGA_IMP_FEDERAL').AsCurrency;
    dmMProvider.cdsItemNFSaidaCARGA_ESTADUAL.Value                        := dmDBEXMaster.fdqMasterPesquisa.FieldByName('CARGA_ESTADUAL').AsCurrency;
    dmMProvider.cdsItemNFSaidaCARGA_MUNICIPAL.Value                       := dmDBEXMaster.fdqMasterPesquisa.FieldByName('CARGA_MUNICIPAL').AsCurrency;

    dmMProvider.cdsItemNFSaidaORIGEM_MERCADORIA.Value                     := dmDBEXMaster.fdqMasterPesquisa.FieldByName('ORIGEM_MERCADORIA').Value;
    dmMProvider.cdsItemNFSaidaCST.Value                                   := dmDBEXMaster.fdqMasterPesquisa.FieldByName('CST').Value;

    if dmMProvider.cdsNFSaidaDESTINO_OPERACAO.Value = 2 then
    begin

      dmMProvider.cdsEstados.Close;
      dmMProvider.cdsEstados.ProviderName := 'dspEstados';

      dmDBEXMaster.fdqEstados.SQL.Clear;
      dmDBEXMaster.fdqEstados.SQL.Add('select * from estados');
      dmDBEXMaster.fdqEstados.SQL.Add('where sigla = ' + QuotedStr(dmMProvider.cdsNFSaidaUF_DEST.Value));

      dmMProvider.cdsEstados.Open;
      dmMProvider.cdsEstados.ProviderName := '';

      dmMProvider.cdsItemNFSaidaICMS.Value   := dmMProvider.cdsEstadosICMS_INTERESTADUAL.Value;

    end
    else
      dmMProvider.cdsItemNFSaidaICMS.Value   := dmDBEXMaster.fdqMasterPesquisa.FieldByName('ALIQUOTA').AsCurrency;

  end
  else //incluir pela pesquisa por nome
  begin

    dmMProvider.cdsItemNFSaidaPRODUTO.Value                               := dmDBEXMaster.fdqMasterPesquisa.FieldByName('PRODUTO').Value;
    edtCodigoItem.Text                                                    := IntToStr(dmMProvider.cdsItemNFSaidaPRODUTO.Value);

    if dmDBEXMaster.fdqMasterPesquisa.FieldByName('GERADO').Value = 0 then
    begin

      dmMProvider.cdsItemNFSaidaEAN.Value                                 := dmDBEXMaster.fdqMasterPesquisa.FieldByName('BARRAS').Value;
      dmMProvider.cdsItemNFSaidaEAN_TRIBUTAVEL.Value                      := dmMProvider.cdsItemNFSaidaEAN.Value;

    end;

    dmMProvider.cdsItemNFSaidaCF_IPI.Value                                := dmDBEXMaster.fdqMasterPesquisa.FieldByName('NCM').Value;
    dmMProvider.cdsItemNFSaidaEX_TIPI.Value                               := dmDBEXMaster.fdqMasterPesquisa.FieldByName('CF_IPI').AsInteger;
    dmMProvider.cdsItemNFSaidaCEST.Value                                  := dmDBEXMaster.fdqMasterPesquisa.FieldByName('CEST').AsString;

    { VERIFICA SE A NOTA N�O � DE DEVOLU��O }
    if dmMProvider.cdsNFSaidaFINALIDADE_NF.Value < 3 then
    begin

      if dmDBEXMaster.fdqMasterPesquisa.FieldByName('PROMOCAO').Value = 0 then
        dmMProvider.cdsItemNFSaidaVALORUNITARIO.AsFloat     := dmDBEXMaster.fdqMasterPesquisa.FieldByName('PRECODEVENDA').Value
      else
        dmMProvider.cdsItemNFSaidaVALORUNITARIO.AsFloat     := dmDBEXMaster.fdqMasterPesquisa.FieldByName('PRECOPROMOCAO').Value;

    end
    else
      dmMProvider.cdsItemNFSaidaVALORUNITARIO.AsFloat     := dmDBEXMaster.fdqMasterPesquisa.FieldByName('CUSTOBRUTO').Value;

    dmMProvider.cdsItemNFSaidaCST_PIS.Value                               := dmDBEXMaster.fdqMasterPesquisa.FieldByName('CST_PIS').Value;
    dmMProvider.cdsItemNFSaidaP_ALIQUOTA_PIS.Value                        := dmDBEXMaster.fdqMasterPesquisa.FieldByName('ALIQUOTA_PIS').Value;
    dmMProvider.cdsItemNFSaidaCST_COFINS.Value                            := dmDBEXMaster.fdqMasterPesquisa.FieldByName('CST_COFINS').Value;
    dmMProvider.cdsItemNFSaidaP_ALIQUOTA_COFINS.Value                     := dmDBEXMaster.fdqMasterPesquisa.FieldByName('ALIQUOTA_COFINS').Value;
    dmMProvider.cdsItemNFSaidaCST_IPI.Value                               := dmDBEXMaster.fdqMasterPesquisa.FieldByName('CST_IPI').Value;
    dmMProvider.cdsItemNFSaidaIPI.Value                                   := dmDBEXMaster.fdqMasterPesquisa.FieldByName('IPI').Value;
    dmMProvider.cdsItemNFSaidaCARGA_NAC_FEDERAL.Value                     := dmDBEXMaster.fdqMasterPesquisa.FieldByName('CARGA_NAC_FEDERAL').AsCurrency;
    dmMProvider.cdsItemNFSaidaCARGA_IMP_FEDERAL.Value                     := dmDBEXMaster.fdqMasterPesquisa.FieldByName('CARGA_IMP_FEDERAL').AsCurrency;
    dmMProvider.cdsItemNFSaidaCARGA_ESTADUAL.Value                        := dmDBEXMaster.fdqMasterPesquisa.FieldByName('CARGA_ESTADUAL').AsCurrency;
    dmMProvider.cdsItemNFSaidaCARGA_MUNICIPAL.Value                       := dmDBEXMaster.fdqMasterPesquisa.FieldByName('CARGA_MUNICIPAL').AsCurrency;

    dmMProvider.cdsItemNFSaidaORIGEM_MERCADORIA.Value                     := dmDBEXMaster.fdqMasterPesquisa.FieldByName('ORIGEM_MERCADORIA').Value;

    dmMProvider.cdsItemNFSaidaCST.Value                                   := dmDBEXMaster.fdqMasterPesquisa.FieldByName('CST').Value;

    { VERIFICA O DESTINO 1-ESTADUAL / 2-INTERESTADUAL / 3-EXTERIOR }
    if dmMProvider.cdsNFSaidaDESTINO_OPERACAO.Value = 2 then
    begin

      dmMProvider.cdsEstados.Close;
      dmMProvider.cdsEstados.ProviderName := 'dspEstados';

      dmDBEXMaster.fdqEstados.SQL.Clear;
      dmDBEXMaster.fdqEstados.SQL.Add('select * from estados');
      dmDBEXMaster.fdqEstados.SQL.Add('where sigla = ' + QuotedStr(dmMProvider.cdsNFSaidaUF_DEST.Value));

      dmMProvider.cdsEstados.Open;
      dmMProvider.cdsEstados.ProviderName := '';

      dmMProvider.cdsItemNFSaidaICMS.Value   := dmMProvider.cdsEstadosICMS_INTERESTADUAL.Value;

    end
    else if dmMProvider.cdsNFSaidaDESTINO_OPERACAO.Value = 3 then
      dmMProvider.cdsItemNFSaidaCST.Value    := 41
    else
      dmMProvider.cdsItemNFSaidaICMS.Value   := dmDBEXMaster.fdqMasterPesquisa.FieldByName('ALIQUOTA').AsCurrency;

  end;

  if dmMProvider.cdsDetalhesCupomRefNFS_TEMP.IsEmpty then
  begin

    if Man_Tab_ItemNFS(0) then
      CalcularValoresItens;

  end;

end;

procedure TfrmModNFSaida.actReferenciarCupomFiscalExecute(Sender: TObject);
begin

  frmCupomFiscalReferenciado := TfrmCupomFiscalReferenciado.Create(self);
  if frmCupomFiscalReferenciado.ShowModal = mrOk then
  begin

  end;

  FreeAndNil(frmCupomFiscalReferenciado);

end;

procedure TfrmModNFSaida.actSalvarExecute(Sender: TObject);
begin

  LimparMSG_ERRO(lblMsg, imgErro);

  if InserindoEditando(dmMProvider.cdsNFSaida) then
  begin

    if Length(Trim(edtPlaca.Text)) > 0 then
    begin

      if not Valida��o_Generica(ord(erPlacaVeiculo), edtPlaca.Text) then
      begin

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', placa informada n�o est� no formato adequado: AAA9999 !';
        Application.ProcessMessages;
        edtPlaca.SetFocus;
        exit;

      end;

    end;

  end;

  activecontrol := nil;

  try

    case pgcNotaFiscal.ActivePageIndex of
      2:begin

          if InserindoEditando(dmMProvider.cdsItemNFSaida) then
          begin

            lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_AGUARDE;
            Application.ProcessMessages;

            actGravarItemExecute(Self);
            LimparMSG_ERRO(lblMsg, imgErro);

          end
          else
          begin

            if InserindoEditando(dmMProvider.cdsNFSaida) then
            begin

              lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_AGUARDE;
              Application.ProcessMessages;

              if dmMProvider.cdsNFSaidaNFSAIDA.Value = 0 then
              begin

                if ValidarInformacoes then
                begin

                  GravarNumeroNF_Tab_Itens(dmMProvider.cdsNFSaidaNFSAIDA.Value);
                  GravarNumeroNF_Tab_CFOP(dmMProvider.cdsNFSaidaNFSAIDA.Value);
                  GravarNumeroNF_Tab_End_entrega(dmMProvider.cdsNFSaidaNFSAIDA.Value);
                  GravarNumeroNF_Tab_End_retirada(dmMProvider.cdsNFSaidaNFSAIDA.Value);
                  GravarNumeroNF_Tab_Transportador(dmMProvider.cdsNFSaidaNFSAIDA.Value);
                  GravarNumeroNF_Tab_Doc_Referenciados(dmMProvider.cdsNFSaidaNFSAIDA.Value);

                  if ValidarInformacoes then
                  begin

                    if Man_Tab_NFS(0) then
                    begin

                      if Man_Tab_CFOP_NFS(0) then
                      begin

                        if Man_Tab_ItemNFS(0) then
                        begin

                          if Man_Tab_Documento_Ref(0) then
                          begin

                            if Man_Tab_TransportadoraNFS(0) then
                            begin

                              dmMProvider.cdsNFSaida.Post;

                              if (dmMProvider.cdsNFSaidaVALORDANOTA.Value > 0) and (dmMProvider.cdsNFSaidaFORMAPAGAMENTO.Value > 0) and (dmMProvider.cdsParcelasNFS.IsEmpty) then
                              begin

                                CalcularParcelas;
                                GravarNumeroNF_Tab_PARCELAS(dmMProvider.cdsNFSaidaNFSAIDA.Value);

                              end;

                              if Man_Tab_Parcelas_NFS(0) then
                              begin

                                HabilitaDesabilitaControles(False);
                                edtConteudoPesquisa.SetFocus;
                                pgcNotaFiscal.ActivePageIndex := 1;
                                LimparMSG_ERRO(lblMsg, imgErro);

                              end;

                            end;

                          end;

                        end;

                      end;

                    end;

                  end;

                end;

              end
              else if ValidarInformacoes then
              begin

                if Man_Tab_NFS(0) then
                begin

                  if Man_Tab_CFOP_NFS(0) then
                  begin

                    if Man_Tab_ItemNFS(0) then
                    begin

                      if Man_Tab_Documento_Ref(0) then
                      begin

                        if Man_Tab_TransportadoraNFS(0) then
                        begin

                          dmMProvider.cdsNFSaida.Post;

                          if (dmMProvider.cdsNFSaidaVALORDANOTA.Value > 0) and (dmMProvider.cdsNFSaidaFORMAPAGAMENTO.Value > 0) and (dmMProvider.cdsParcelasNFS.IsEmpty) then
                          begin

                            CalcularParcelas;
                            GravarNumeroNF_Tab_PARCELAS(dmMProvider.cdsNFSaidaNFSAIDA.Value);

                          end;

                          if Man_Tab_Parcelas_NFS(0) then
                          begin

                            HabilitaDesabilitaControles(False);
                            edtConteudoPesquisa.SetFocus;
                            pgcNotaFiscal.ActivePageIndex := 1;
                            LimparMSG_ERRO(lblMsg, imgErro);

                          end;

                        end;

                      end;

                    end;

                  end;

                end;

              end;

            end;

          end;

        end
      else
      begin

        if InserindoEditando(dmMProvider.cdsNFSaida) then
        begin

          lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_AGUARDE;
          Application.ProcessMessages;

          if dmMProvider.cdsNFSaidaNFSAIDA.Value = 0 then
          begin

            if ValidarInformacoes then
            begin

              dmMProvider.cdsNFSaidaNFSAIDA.Value :=  GerarProximoNumeroNF;
              GravarNumeroNF_Tab_Itens(dmMProvider.cdsNFSaidaNFSAIDA.Value);
              GravarNumeroNF_Tab_CFOP(dmMProvider.cdsNFSaidaNFSAIDA.Value);
              GravarNumeroNF_Tab_End_entrega(dmMProvider.cdsNFSaidaNFSAIDA.Value);
              GravarNumeroNF_Tab_End_retirada(dmMProvider.cdsNFSaidaNFSAIDA.Value);
              GravarNumeroNF_Tab_Transportador(dmMProvider.cdsNFSaidaNFSAIDA.Value);
              GravarNumeroNF_Tab_Doc_Referenciados(dmMProvider.cdsNFSaidaNFSAIDA.Value);

              if ValidarInformacoes then
              begin

                if Man_Tab_NFS(0) then
                begin

                  if Man_Tab_CFOP_NFS(0) then
                  begin

                    if Man_Tab_ItemNFS(0) then
                    begin

                      if Man_Tab_Documento_Ref(0) then
                      begin

                        if Man_Tab_TransportadoraNFS(0) then
                        begin

                          dmMProvider.cdsNFSaida.Post;

                          if (dmMProvider.cdsNFSaidaVALORDANOTA.Value > 0) and (dmMProvider.cdsNFSaidaFORMAPAGAMENTO.Value > 0) and (dmMProvider.cdsParcelasNFS.IsEmpty) then
                          begin

                            CalcularParcelas;
                            GravarNumeroNF_Tab_PARCELAS(dmMProvider.cdsNFSaidaNFSAIDA.Value);

                          end;

                          if Man_Tab_Parcelas_NFS(0) then
                          begin

                            HabilitaDesabilitaControles(False);
                            edtConteudoPesquisa.SetFocus;
                            pgcNotaFiscal.ActivePageIndex := 1;
                            LimparMSG_ERRO(lblMsg, imgErro);

                          end;

                        end;

                      end;

                    end;

                  end;

                end;

              end;

            end;

          end
          else if ValidarInformacoes then
          begin

            if Man_Tab_NFS(0) then
            begin

              if Man_Tab_CFOP_NFS(0) then
              begin

                if Man_Tab_ItemNFS(0) then
                begin

                  if Man_Tab_Documento_Ref(0) then
                  begin

                    if Man_Tab_TransportadoraNFS(0) then
                    begin

                      dmMProvider.cdsNFSaida.Post;

                      if (dmMProvider.cdsNFSaidaVALORDANOTA.Value > 0) and (dmMProvider.cdsNFSaidaFORMAPAGAMENTO.Value > 0) and (dmMProvider.cdsParcelasNFS.IsEmpty) then
                      begin

                        CalcularParcelas;
                        GravarNumeroNF_Tab_PARCELAS(dmMProvider.cdsNFSaidaNFSAIDA.Value);

                      end;

                      if Man_Tab_Parcelas_NFS(0) then
                      begin

                        HabilitaDesabilitaControles(False);
                        edtConteudoPesquisa.SetFocus;
                        pgcNotaFiscal.ActivePageIndex := 1;
                        LimparMSG_ERRO(lblMsg, imgErro);

                      end;


                    end;

                  end;

                end;

              end;

            end;

          end;

        end;

      end;

    end;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

    dmDBEXMaster.fdcMaster.Close;
    dmDBEXMaster.fdcMaster.Open;

  except

    on E: exception do
      begin

        if dmDBEXMaster.fdtMaster.Active then
          dmDBEXMaster.fdtMaster.Rollback;

        lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + Tratar_Erro_Conexao(E);
        imgErro.Visible := True;
        Application.ProcessMessages;

      end;

  end;

end;

procedure TfrmModNFSaida.AtualizaDescricaoStatus;
begin

  edtStatus.Font.Color          := clWhite;
  edtStatusNFRodape.Font.Color  := clWhite;

  if dmMProvider.cdsNFSaidaSTATUS.Value = 0 then
  begin

    edtStatus.Color         := clGreen;
    edtStatusNFRodape.Color := edtStatus.Color;
    imgConfirmar.Hint       := 'Confirmar Nota';

  end
  else if dmMProvider.cdsNFSaidaSTATUS.Value = 1 then
  begin

    edtStatus.Color         := clRed;
    edtStatusNFRodape.Color := edtStatus.Color;
    imgConfirmar.Hint       := 'Estonar Nota';

  end
  else if dmMProvider.cdsNFSaidaSTATUS.Value = 2 then
  begin

    edtStatus.Color         := clBlack;
    edtStatusNFRodape.Color := edtStatus.Color;
    imgConfirmar.Hint       := 'NF Cancelada';

  end
  else if dmMProvider.cdsNFSaidaSTATUS.Value = 3 then
  begin

    edtStatus.Color         := clPurple;
    edtStatusNFRodape.Color := edtStatus.Color;
    imgConfirmar.Hint       := 'NF Denegada';

  end;

end;

function TfrmModNFSaida.Atualizar_Saldo_Produto(pOpcao: smallint): boolean;
begin

  try

    dmMSProcedure.fdspAtualizarSaldoProduto.Params[0].Value  := 0;     // 0-nf saida - ip_opcao
    dmMSProcedure.fdspAtualizarSaldoProduto.Params[1].Value  := 0;     //campos = 0-loja 1-deposito 2-almoxarifado - local do movimento
    dmMSProcedure.fdspAtualizarSaldoProduto.Params[2].Value  := pOpcao; // tipo opera��o 0-saida/1-estorno
    dmMSProcedure.fdspAtualizarSaldoProduto.Params[3].Value  := dmMProvider.cdsNFSaidaNFSAIDA.Value; //numero nota
    dmMSProcedure.fdspAtualizarSaldoProduto.Params[4].Value  := null; // barras
    dmMSProcedure.fdspAtualizarSaldoProduto.Params[5].Value  := 0;     // quantidade
    dmMSProcedure.fdspAtualizarSaldoProduto.Params[6].Value  := 0;     // produto
    dmMSProcedure.fdspAtualizarSaldoProduto.Params[7].Value  := dmDBEXMaster.iIdFilial;
    dmMSProcedure.fdspAtualizarSaldoProduto.Params[8].Value  := dmMProvider.cdsNFSaidaMODELO.Value;
    dmMSProcedure.fdspAtualizarSaldoProduto.Params[9].Value  := dmMProvider.cdsNFSaidaEMISSAO.Value;
    dmMSProcedure.fdspAtualizarSaldoProduto.Params[10].Value := 0; //atualiza almoxarifado
    dmMSProcedure.fdspAtualizarSaldoProduto.ExecProc;

    Result := True;

  except
  on E: exception do
    begin

      Result          := False;
      lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + Tratar_Erro_Conexao(E);
      imgErro.Visible := True;
      Application.ProcessMessages;

    end;

  end;

end;

procedure TfrmModNFSaida.btnRecalcClick(Sender: TObject);
begin

  AbrirTabelaNotaFiscal(999,'-1');

  pgbRecalc.Max := dmMProvider.cdsNFSaida.RecordCount;

  MostrarOcultarAbas(True);
  pgcNotaFiscal.ActivePageIndex      := 2;

  HabilitaDesabilitaControles(True);

  while not dmMProvider.cdsNFSaida.Eof do
  begin

    pgbRecalc.Position := dmMProvider.cdsNFSaida.RecNo;
    Application.ProcessMessages;

    if dmMProvider.cdsNFSaidaSTATUS.Value = 1 then
    begin

      RelacionarItens_NFS;

      if GravarEstornarRegistroC100(1, dmMProvider.cdsNFSaidaSTATUS.Value) then
        GravarEstornarRegistroC101(1, dmMProvider.cdsNFSaidaSTATUS.Value);

      while not dmMProvider.cdsItemNFSaida.Eof do
      begin

        dmMProvider.cdsItemNFSaida.Edit;

        dmMProvider.cdsItemNFSaidaVALOR_BC_COFINS.Value                   := dmMProvider.cdsItemNFSaidaSUB_TOTAL.Value;
        dmMProvider.cdsItemNFSaidaBASE_PIS.Value                          := dmMProvider.cdsItemNFSaidaSUB_TOTAL.Value;

        if dmMProvider.cdsItemNFSaidaP_ALIQUOTA_COFINS.Value > 0 then
          dmMProvider.cdsItemNFSaidaVALOR_COFINS.Value := Arredondar(dmMProvider.cdsItemNFSaidaVALOR_BC_COFINS.Value * (dmMProvider.cdsItemNFSaidaP_ALIQUOTA_COFINS.Value / 100),2);

        if dmMProvider.cdsItemNFSaidaP_ALIQUOTA_PIS.Value > 0 then
          dmMProvider.cdsItemNFSaidaVALOR_PIS.Value  := Arredondar(dmMProvider.cdsItemNFSaidaBASE_PIS.Value * (dmMProvider.cdsItemNFSaidaP_ALIQUOTA_PIS.Value / 100),2);

        actGravarItemExecute(self);

        dmMProvider.cdsItemNFSaida.Next;

      end;

      CalcularTotaisNF;

      Man_Tab_NFS(0);

      if GravarEstornarRegistroC100(0, dmMProvider.cdsNFSaidaSTATUS.Value) then
        GravarEstornarRegistroC101(0, dmMProvider.cdsNFSaidaSTATUS.Value);

    end;

    dmMProvider.cdsNFSaida.Next;

  end;

  pgbRecalc.Position := 0;
  Application.ProcessMessages;

end;

procedure TfrmModNFSaida.CalcularDifal;
var
  cDifal:currency;
  wAno, wMes, wDia:word;
begin

  DecodeDate(date,wAno, wMes, wDia);

  cDifal            := 0;

  if (dmMProvider.cdsNFSaidaDESTINO_OPERACAO.Value = 2) and (dmMProvider.cdsItemNFSaidaBASE_ICMS.Value > 0) then
  begin

    if (dmMProvider.cdsNFSaidaCONSUMIDOR_FINAL.Value = 1) then
    begin

      cDifal                                                        := dmMProvider.cdsItemNFSaidaALIQUOTA_ICMS_INTERNA_DESTINO.Value - dmMProvider.cdsItemNFSaidaALIQUOTA_ICMS_INTERESTADUAL.Value;

      dmMProvider.cdsItemNFSaidaBASE_CALC_ICMS_PART.Value           := (dmMProvider.cdsItemNFSaidaBASE_ICMS.Value * (cDifal/100));
      dmMProvider.cdsItemNFSaidaPERC_DIFERENCIAL_ALIQUOTA.Value     := cDifal;

      if wAno <= 2016 then
      begin

        dmMProvider.cdsItemNFSaidaPERC_ICMS_PARTILHA_ORIGEM.Value   := 60;
        dmMProvider.cdsItemNFSaidaPERC_ICMS_PARTILHA_DESTINO.Value  := 40;

      end
      else if wAno = 2017 then
      begin

        dmMProvider.cdsItemNFSaidaPERC_ICMS_PARTILHA_ORIGEM.Value   := 40;
        dmMProvider.cdsItemNFSaidaPERC_ICMS_PARTILHA_DESTINO.Value  := 60;

      end
      else if wAno = 2018 then
      begin

        dmMProvider.cdsItemNFSaidaPERC_ICMS_PARTILHA_ORIGEM.Value   := 20;
        dmMProvider.cdsItemNFSaidaPERC_ICMS_PARTILHA_DESTINO.Value  := 80;

      end
      else if wAno > 2018 then
      begin

        dmMProvider.cdsItemNFSaidaPERC_ICMS_PARTILHA_ORIGEM.Value   := 0;
        dmMProvider.cdsItemNFSaidaPERC_ICMS_PARTILHA_DESTINO.Value  := 100;

      end;

      dmMProvider.cdsItemNFSaidaVALOR_ICMS_PARTILHA_ORIGEM.Value    := SimpleRoundTo(dmMProvider.cdsItemNFSaidaBASE_CALC_ICMS_PART.Value * (dmMProvider.cdsItemNFSaidaPERC_ICMS_PARTILHA_ORIGEM.Value / 100),-2);
      dmMProvider.cdsItemNFSaidaVALOR_ICMS_PARTILHA_DESTINO.Value   := SimpleRoundTo(dmMProvider.cdsItemNFSaidaBASE_CALC_ICMS_PART.Value * (dmMProvider.cdsItemNFSaidaPERC_ICMS_PARTILHA_DESTINO.Value / 100),-2);

    end
    else
    begin

      dmMProvider.cdsItemNFSaidaALIQUOTA_ICMS_INTERESTADUAL.Value   := 0;
      dmMProvider.cdsItemNFSaidaALIQUOTA_ICMS_INTERNA_DESTINO.Value := 0;
      dmMProvider.cdsItemNFSaidaBASE_CALC_ICMS_PART.Value           := 0;
      dmMProvider.cdsItemNFSaidaPERC_ICMS_PARTILHA_ORIGEM.Value     := 0;
      dmMProvider.cdsItemNFSaidaPERC_ICMS_PARTILHA_DESTINO.Value    := 0;
      dmMProvider.cdsItemNFSaidaVALOR_ICMS_PARTILHA_ORIGEM.Value    := 0;
      dmMProvider.cdsItemNFSaidaVALOR_ICMS_PARTILHA_DESTINO.Value   := 0;

    end;

  end;

end;

procedure TfrmModNFSaida.CalcularFCP;
begin

  if (dmMProvider.cdsNFSaidaDESTINO_OPERACAO.Value = 2) and (dmMProvider.cdsItemNFSaidaBASE_ICMS.Value > 0) then
  begin

    if (dmMProvider.cdsNFSaidaCONSUMIDOR_FINAL.Value = 1) then
      dmMProvider.cdsItemNFSaidaVALOR_FCP_DESTINO.Value := (dmMProvider.cdsItemNFSaidaBASE_ICMS.Value * (dmMProvider.cdsItemNFSaidaPERC_FCP.Value / 100));

  end
  else
  begin

    dmMProvider.cdsItemNFSaidaPERC_FCP.Value          := 0;
    dmMProvider.cdsItemNFSaidaVALOR_FCP_DESTINO.Value := 0;

  end;

  if dmMProvider.cdsItemNFSaidaVALOR_FCP_DESTINO.Value < 0 then
    dmMProvider.cdsItemNFSaidaVALOR_FCP_DESTINO.Value := 0;

end;

procedure TfrmModNFSaida.CalcularParcelas;
var
  cResto, cValorCalculado, cValorDescontado: currency;
  dVencimento: TDateTime;
begin

  dmMProvider.cdsDiasFormapagto.Close;
  dmMProvider.cdsDiasFormapagto.ProviderName := 'dspDiasFormapagto';

  dmDBEXMaster.fdqDiasFormaPagto.SQL.Clear;
  dmDBEXMaster.fdqDiasFormaPagto.SQL.Add('select * from diasformapagamento');
  dmDBEXMaster.fdqDiasFormaPagto.SQL.Add('where formapagamento = ' + IntToStr(dmMProvider.cdsNFSaidaFORMAPAGAMENTO.Value));

  dmMProvider.cdsDiasFormapagto.Open;
  dmMProvider.cdsDiasFormapagto.ProviderName := '';

  grpValorEntrada.Enabled := (dmMProvider.cdsFormasPagamentoENTRADA.Value = 1);

  if dmMProvider.cdsNFSaidaVALORDANOTA.Value > 0 then
  begin

    cResto            := 0;
    cValorCalculado   := 0;
    cValorDescontado  := (dmMProvider.cdsNFSaidaVALORDANOTA.Value - dmMProvider.cdsNFSaidaVALOR_ENTRADA.Value);


    if (dmMProvider.cdsNFSaidaVALOR_ENTRADA.Value = 0) and (dmMProvider.cdsParcelasNFS.IsEmpty) and (dmMProvider.cdsFormasPagamentoENTRADA.Value = 1) then
      edtValor_Entrada.SetFocus;

    // posiciona o ponteiro no primeir registro da tabela
    dmMProvider.cdsDiasFormaPagto.First;

    // elimina todas as parcelas que possam existir na tabela parcelas
    if Man_Tab_Parcelas_NFS(1) then
    begin

      dVencimento := Date;

      RelacionarParcelas_NFS;

      while not dmMProvider.cdsDiasFormaPagto.Eof do
      begin

        dmMProvider.cdsParcelasNFS.Append;
        dmMProvider.cdsParcelasNFSDOCUMENTO.Value   := FormatFloat('000000', dmMProvider.cdsNFSaidaNFSAIDA.Value)
                                                        + '-' + IntToStr(dmMProvider.cdsDiasFormaPagto.RecNo)
                                                        + '/' + IntToStr(dmMProvider.cdsDiasFormaPagto.RecordCount);
        dmMProvider.cdsParcelasNFSVENCIMENTO.Value  := dVencimento + dmMProvider.cdsDiasFormapagtoDIAS.Value;
        dmMProvider.cdsParcelasNFSVALOR.Value       := Trunc((cValorDescontado / dmMProvider.cdsDiasFormaPagto.RecordCount) * 100) / 100;

        cValorCalculado                             := cValorCalculado + dmMProvider.cdsParcelasNFSVALOR.Value;
        dVencimento                                 := dmMProvider.cdsParcelasNFSVENCIMENTO.Value;

        dmMProvider.cdsParcelasNFS.Post;

        dmMProvider.cdsDiasFormaPagto.Next;

      end;

      cResto := (cValorCalculado - cValorDescontado);

      if cResto < 0 then
        cResto := cResto * (-1);

      if cValorCalculado > cValorDescontado then
      begin

        dmMProvider.cdsParcelasNFS.Edit;
        dmMProvider.cdsParcelasNFSVALOR.Value := dmMProvider.cdsParcelasNFSVALOR.Value - cResto;

      end
      else if (cValorCalculado < cValorDescontado) and not (dmMProvider.cdsDiasFormaPagto.IsEmpty) then
      begin

        dmMProvider.cdsParcelasNFS.Edit;
        dmMProvider.cdsParcelasNFSVALOR.Value := dmMProvider.cdsParcelasNFSVALOR.Value + cResto;

      end
      else if (cValorCalculado < cValorDescontado) and (dmMProvider.cdsDiasFormaPagto.IsEmpty) then
      begin

        dmMProvider.cdsParcelasNFS.Append;
        dmMProvider.cdsParcelasNFSDOCUMENTO.Value   := 'NFS' + FormatFloat('000000', dmMProvider.cdsNFSaidaNFSAIDA.Value);
        dmMProvider.cdsParcelasNFSVENCIMENTO.Value  := dmMProvider.cdsNFSaidaEMISSAO.Value;
        dmMProvider.cdsParcelasNFSVALOR.Value       := cValorDescontado;

      end
      else if (cValorCalculado <> cValorDescontado) then
      begin

        dmMProvider.cdsParcelasNFS.Edit;
        dmMProvider.cdsParcelasNFSDOCUMENTO.Value   := 'NFS' + FormatFloat('000000', dmMProvider.cdsNFSaidaNFSAIDA.Value);
        dmMProvider.cdsParcelasNFSVENCIMENTO.Value  := dmMProvider.cdsNFSaidaEMISSAO.Value;
        dmMProvider.cdsParcelasNFSVALOR.Value       := cValorDescontado;

      end;

      if InserindoEditando(dmMProvider.cdsParcelasNFS) then
        dmMProvider.cdsParcelasNFS.Post;

    end;

    dmMProvider.cdsParcelasNFS.First;
    Man_Tab_Parcelas_NFS(0);

  end;

end;

procedure TfrmModNFSaida.CalcularTotaisNF;
begin

  if not dmMProvider.cdsItemNFSaida.IsEmpty then
  begin

    dmMSProcedure.fdspSomaItensNFS.Params[0].Value        := dmMProvider.cdsNFSaidaNFSAIDA.Value;
    dmMSProcedure.fdspSomaItensNFS.Params[1].Value        := dmMProvider.cdsNFSaidaMODELO.Value;
    dmMSProcedure.fdspSomaItensNFS.ExecProc;

    dmMProvider.cdsNFSaida.Edit;

    dmMProvider.cdsNFSaidaBASECALCULOICMS.Value           := dmMSProcedure.fdspSomaItensNFS.Params[2].Value;
    dmMProvider.cdsNFSaidaVALORICMS.Value                 := dmMSProcedure.fdspSomaItensNFS.Params[3].Value;
    dmMProvider.cdsNFSaidaBASESUBSTITUICAO.Value          := dmMSProcedure.fdspSomaItensNFS.Params[4].Value;
    dmMProvider.cdsNFSaidaVALORSUBSTITUICAO.Value         := dmMSProcedure.fdspSomaItensNFS.Params[5].Value;
    dmMProvider.cdsNFSaidaVALORDOSPRODUTOS.Value          := dmMSProcedure.fdspSomaItensNFS.Params[6].Value;
    dmMProvider.cdsNFSaidaVALORDOIPI.Value                := dmMSProcedure.fdspSomaItensNFS.Params[7].Value;
    dmMProvider.cdsNFSaidaDESCONTO_ST.Value               := dmMSProcedure.fdspSomaItensNFS.Params[8].Value;
    dmMProvider.cdsNFSaidaVALOR_PIS.Value                 := dmMSProcedure.fdspSomaItensNFS.Params[9].Value;
    dmMProvider.cdsNFSaidaVALOR_COFINS.Value              := dmMSProcedure.fdspSomaItensNFS.Params[10].Value;
  {
     03/03/2016
    dmMProvider.cdsNFSaidaVALOR_ISS.Value                 := dmMSProcedure.fdspSomaItensNFS.Params[11].Value;
    dmMProvider.cdsNFSaidaVALOR_IOF.Value                 := dmMSProcedure.fdspSomaItensNFS.Params[12].Value;
    dmMProvider.cdsNFSaidaVALOR_CIDE.Value                := dmMSProcedure.fdspSomaItensNFS.Params[13].Value;

  }
    dmMProvider.cdsNFSaidaVALOR_TOTAL_IMPOSTOS.Value      := dmMSProcedure.fdspSomaItensNFS.Params[14].Value;
    dmMProvider.cdsNFSaidaVALOR_CARGA_NAC_FEDERAL.Value   := dmMSProcedure.fdspSomaItensNFS.Params[16].Value;
    dmMProvider.cdsNFSaidaVALOR_CARGA_IMP_FEDERAL.Value   := dmMSProcedure.fdspSomaItensNFS.Params[17].Value;
    dmMProvider.cdsNFSaidaVALOR_CARGA_ESTADUAL.Value      := dmMSProcedure.fdspSomaItensNFS.Params[18].Value;
    dmMProvider.cdsNFSaidaVALOR_CARGA_MUNICIPAL.Value     := dmMSProcedure.fdspSomaItensNFS.Params[19].Value;
    dmMProvider.cdsNFSaidaOUTRASDESPESAS.Value            := dmMSProcedure.fdspSomaItensNFS.Params[20].Value;
    dmMProvider.cdsNFSaidaVALOR_FCP_UF_DESTINO.Value      := dmMSProcedure.fdspSomaItensNFS.Params[22].Value;
    dmMProvider.cdsNFSaidaVALOR_ICMS_UF_DESTINO.Value     := dmMSProcedure.fdspSomaItensNFS.Params[23].Value;
    dmMProvider.cdsNFSaidaVALOR_ICMS_UF_REMETENTE.Value   := dmMSProcedure.fdspSomaItensNFS.Params[24].Value;



    dmMProvider.cdsNFSaidaVALORDANOTA.Value               := (dmMProvider.cdsNFSaidaVALORDOSPRODUTOS.Value - dmMProvider.cdsNFSaidaDESCONTO_ST.Value)
                                                              + dmMProvider.cdsNFSaidaVALORSUBSTITUICAO.Value
                                                              + dmMProvider.cdsNFSaidaVALORDOFRETE.Value
                                                              + dmMProvider.cdsNFSaidaVALORDOIPI.Value
                                                              + dmMProvider.cdsNFSaidaVALORDOSEGURO.Value
                                                              + dmMProvider.cdsNFSaidaOUTRASDESPESAS.Value;


  end
  else
    dmMProvider.cdsNFSaidaVALORDANOTA.Value               := (dmMProvider.cdsNFSaidaVALORDOSPRODUTOS.Value - dmMProvider.cdsNFSaidaDESCONTO_ST.Value)
                                                              + dmMProvider.cdsNFSaidaVALORSUBSTITUICAO.Value
                                                              + dmMProvider.cdsNFSaidaVALORDOFRETE.Value
                                                              + dmMProvider.cdsNFSaidaVALORDOIPI.Value
                                                              + dmMProvider.cdsNFSaidaVALORDOSEGURO.Value
                                                              + dmMProvider.cdsNFSaidaOUTRASDESPESAS.Value;

end;

procedure TfrmModNFSaida.CalcularValoresItens;
begin

  if InserindoEditando(dmMProvider.cdsItemNFSaida) then
  begin

    PesquisarCFOP(0,Trim(dmMProvider.cdsItemNFSaidaCFOP.Value));

    if (dmMProvider.cdsDetalhesCupomRefNFS_TEMP.IsEmpty) and (dmMProvider.cdsCupomFiscalRefNFS.IsEmpty) then
//      dmMProvider.cdsItemNFSaidaSUB_TOTAL.Value                         := TruncVal((dmMProvider.cdsItemNFSaidaVALORUNITARIO.Value * dmMProvider.cdsItemNFSaidaQUANTIDADE.Value),2)
//      dmMProvider.cdsItemNFSaidaSUB_TOTAL.Value                         := Arredondar(dmMProvider.cdsItemNFSaidaVALORUNITARIO.AsFloat * dmMProvider.cdsItemNFSaidaQUANTIDADE.Value,2)
      dmMProvider.cdsItemNFSaidaSUB_TOTAL.Value                         := dmMProvider.cdsItemNFSaidaVALORUNITARIO.AsFloat * dmMProvider.cdsItemNFSaidaQUANTIDADE.Value
    else if not dmMProvider.cdsDetalhesCupomRefNFS_TEMP.IsEmpty then
      dmMProvider.cdsItemNFSaidaSUB_TOTAL.Value                         := dmMProvider.cdsDetalhesCupomRefNFS_TEMPSUBTOTAL.Value
    else if not dmMProvider.cdsCupomFiscalRefNFS.IsEmpty then
      dmMProvider.cdsItemNFSaidaSUB_TOTAL.Value                         := dmMProvider.cdsItemNFSaidaSUB_TOTAL.Value;

    dmMProvider.cdsItemNFSaidaVALOR_BC_COFINS.Value                   := dmMProvider.cdsItemNFSaidaSUB_TOTAL.Value - dmMProvider.cdsItemNFSaidaVALOR_DESCONTO.Value;
    dmMProvider.cdsItemNFSaidaVALOR_COFINS.Value                      := Arredondar(dmMProvider.cdsItemNFSaidaVALOR_BC_COFINS.Value * (dmMProvider.cdsItemNFSaidaP_ALIQUOTA_COFINS.Value / 100),2);
    dmMProvider.cdsItemNFSaidaBASE_PIS.Value                          := dmMProvider.cdsItemNFSaidaVALOR_BC_COFINS.Value;
    dmMProvider.cdsItemNFSaidaVALOR_PIS.Value                         := Arredondar(dmMProvider.cdsItemNFSaidaBASE_PIS.Value * (dmMProvider.cdsItemNFSaidaP_ALIQUOTA_PIS.Value / 100),2);

    dmMProvider.cdsItemNFSaidaVALOR_CARGA_NAC_FEDERAL.Value           := (dmMProvider.cdsItemNFSaidaSUB_TOTAL.Value - dmMProvider.cdsItemNFSaidaVALOR_DESCONTO.Value) * (dmMProvider.cdsItemNFSaidaCARGA_NAC_FEDERAL.Value / 100);
    dmMProvider.cdsItemNFSaidaVALOR_CARGA_IMP_FEDERAL.Value           := (dmMProvider.cdsItemNFSaidaSUB_TOTAL.Value - dmMProvider.cdsItemNFSaidaVALOR_DESCONTO.Value) * (dmMProvider.cdsItemNFSaidaCARGA_IMP_FEDERAL.Value / 100);
    dmMProvider.cdsItemNFSaidaVALOR_CARGA_ESTADUAL.Value              := (dmMProvider.cdsItemNFSaidaSUB_TOTAL.Value - dmMProvider.cdsItemNFSaidaVALOR_DESCONTO.Value) * (dmMProvider.cdsItemNFSaidaCARGA_ESTADUAL.Value / 100);
    dmMProvider.cdsItemNFSaidaVALOR_CARGA_MUNICIPAL.Value             := (dmMProvider.cdsItemNFSaidaSUB_TOTAL.Value - dmMProvider.cdsItemNFSaidaVALOR_DESCONTO.Value) * (dmMProvider.cdsItemNFSaidaCARGA_MUNICIPAL.Value / 100);
    dmMProvider.cdsItemNFSaidaISENTAS_NAO_TRIBUTADAS.Value            := 0;

    if (dmMProvider.cdsFilialREGIME_TRIBUTARIO.Value >= 1) then  //regime ordinario
    begin

      if dmMProvider.cdsPesqCFOPGERA_DEBITO_CREDITO_ICMS.Value = 1 then
      begin

        if (Copy(FormatFloat('000',dmMProvider.cdsItemNFSaidaCST.Value),2,2) = '20') or (Copy(FormatFloat('000',dmMProvider.cdsItemNFSaidaCST.Value),2,2) = '90')then
        begin

          if (dmMProvider.cdsItemNFSaidaPERCENTUAL_REDUCAO.Value = 0) and (dmMProvider.cdsItemNFSaidaICMS.Value > 0) then
          begin

            dmMProvider.cdsItemNFSaidaPERCENTUAL_REDUCAO.Value                := (7 / dmMProvider.cdsItemNFSaidaICMS.Value);
            dmMProvider.cdsItemNFSaidaPERCENTUAL_REDUCAO.Value                := dmMProvider.cdsItemNFSaidaPERCENTUAL_REDUCAO.Value * 100;
            dmMProvider.cdsItemNFSaidaPERCENTUAL_REDUCAO.Value                := 100 - dmMProvider.cdsItemNFSaidaPERCENTUAL_REDUCAO.Value;
            dmMProvider.cdsItemNFSaidaBASE_ICMS.Value                         := SimpleRoundTo(((dmMProvider.cdsItemNFSaidaSUB_TOTAL.Value - dmMProvider.cdsItemNFSaidaVALOR_DESCONTO.Value) - (dmMProvider.cdsItemNFSaidaSUB_TOTAL.Value * (dmMProvider.cdsItemNFSaidaPERCENTUAL_REDUCAO.Value / 100))),-2);
            dmMProvider.cdsItemNFSaidaVALOR_ICMS.Value                        := SimpleRoundTo((dmMProvider.cdsItemNFSaidaBASE_ICMS.Value * (dmMProvider.cdsItemNFSaidaICMS.Value / 100)),2);

          end
          else
          begin

            dmMProvider.cdsItemNFSaidaBASE_ICMS.Value                         := (dmMProvider.cdsItemNFSaidaSUB_TOTAL.Value - dmMProvider.cdsItemNFSaidaVALOR_DESCONTO.Value) - SimpleRoundTo(((dmMProvider.cdsItemNFSaidaSUB_TOTAL.Value * (dmMProvider.cdsItemNFSaidaPERCENTUAL_REDUCAO.Value / 100))),-2);
            dmMProvider.cdsItemNFSaidaVALOR_ICMS.Value                        := SimpleRoundTo((dmMProvider.cdsItemNFSaidaBASE_ICMS.Value * (dmMProvider.cdsItemNFSaidaICMS.Value / 100)),-2);

          end;

          dmMProvider.cdsItemNFSaidaISENTAS_NAO_TRIBUTADAS.Value              := dmMProvider.cdsItemNFSaidaSUB_TOTAL.Value - dmMProvider.cdsItemNFSaidaBASE_ICMS.Value;

        end
        else if (Copy(FormatFloat('000',dmMProvider.cdsItemNFSaidaCST.Value),2,2) = '00') then
        begin

          dmMProvider.cdsItemNFSaidaPERCENTUAL_REDUCAO.Value                := 0;
          if dmMProvider.cdsPesqCFOPGERA_DEBITO_CREDITO_IPI.Value = 1 then
            dmMProvider.cdsItemNFSaidaBASE_ICMS.Value                       := (dmMProvider.cdsItemNFSaidaSUB_TOTAL.Value - dmMProvider.cdsItemNFSaidaVALOR_DESCONTO.Value) + dmMProvider.cdsItemNFSaidaVALOR_IPI.Value
          else
            dmMProvider.cdsItemNFSaidaBASE_ICMS.Value                       := (dmMProvider.cdsItemNFSaidaSUB_TOTAL.Value - dmMProvider.cdsItemNFSaidaVALOR_DESCONTO.Value);
          dmMProvider.cdsItemNFSaidaVALOR_ICMS.Value                        := SimpleRoundTo((dmMProvider.cdsItemNFSaidaBASE_ICMS.Value * (dmMProvider.cdsItemNFSaidaICMS.Value / 100)),-2);
          dmMProvider.cdsItemNFSaidaISENTAS_NAO_TRIBUTADAS.Value            := 0;

        end
        else if (Copy(FormatFloat('000',dmMProvider.cdsItemNFSaidaCST.Value),2,2) = '60') then
        begin

          dmMProvider.cdsItemNFSaidaPERCENTUAL_REDUCAO.Value      := 0;
          dmMProvider.cdsItemNFSaidaBASE_ICMS.Value               := 0;
          dmMProvider.cdsItemNFSaidaICMS.Value                    := 0;
          dmMProvider.cdsItemNFSaidaVALOR_ICMS.Value              := 0;
          dmMProvider.cdsItemNFSaidaBASE_SUBSTITUICAO.Value       := 0;
          dmMProvider.cdsItemNFSaidaMVA.Value                     := 0;
          dmMProvider.cdsItemNFSaidaALIQUOTA_ICMS_ST.Value        := 0;
          dmMProvider.cdsItemNFSaidaVALOR_SUBSTITUICAO.Value      := 0;
          dmMProvider.cdsItemNFSaidaISENTAS_NAO_TRIBUTADAS.Value  := 0;

        end
        else if (Copy(FormatFloat('000',dmMProvider.cdsItemNFSaidaCST.Value),2,2) = '10') then
        begin

          dmMProvider.cdsItemNFSaidaPERCENTUAL_REDUCAO.Value                := 0;
          dmMProvider.cdsItemNFSaidaBASE_ICMS.Value                         := (dmMProvider.cdsItemNFSaidaSUB_TOTAL.Value - dmMProvider.cdsItemNFSaidaVALOR_DESCONTO.Value)- SimpleRoundTo(((dmMProvider.cdsItemNFSaidaSUB_TOTAL.Value * (dmMProvider.cdsItemNFSaidaPERCENTUAL_REDUCAO.Value / 100))),-2);
          dmMProvider.cdsItemNFSaidaVALOR_ICMS.Value                        := SimpleRoundTo((dmMProvider.cdsItemNFSaidaBASE_ICMS.Value * (dmMProvider.cdsItemNFSaidaICMS.Value / 100)),-2);

        end
        else if (Copy(FormatFloat('000',dmMProvider.cdsItemNFSaidaCST.Value),2,2) = '40') then
        begin

          dmMProvider.cdsItemNFSaidaPERCENTUAL_REDUCAO.Value      := 0;
          dmMProvider.cdsItemNFSaidaBASE_ICMS.Value               := 0;
          dmMProvider.cdsItemNFSaidaVALOR_ICMS.Value              := 0;
          dmMProvider.cdsItemNFSaidaBASE_SUBSTITUICAO.Value       := 0;
          dmMProvider.cdsItemNFSaidaMVA.Value                     := 0;
          dmMProvider.cdsItemNFSaidaALIQUOTA_ICMS_ST.Value        := 0;
          dmMProvider.cdsItemNFSaidaVALOR_SUBSTITUICAO.Value      := 0;
          dmMProvider.cdsItemNFSaidaISENTAS_NAO_TRIBUTADAS.Value  := dmMProvider.cdsItemNFSaidaSUB_TOTAL.Value;

        end;

        //calcular ST
        if (dmMProvider.cdsPesqCFOPSUBSTITUICAO_TRIBUTARIA.Value = 1) and (dmMProvider.cdsPesqCFOPCFOP.Value[1] = '6') and (Copy(FormatFloat('000',dmMProvider.cdsItemNFSaidaCST.Value),2,2) = '10')  then
        begin

          dmMProvider.cdsItemNFSaidaBASE_ICMS.Value                         := (dmMProvider.cdsItemNFSaidaSUB_TOTAL.Value - dmMProvider.cdsItemNFSaidaVALOR_DESCONTO.Value) ;
          dmMProvider.cdsItemNFSaidaVALOR_ICMS.Value                        := SimpleRoundTo((dmMProvider.cdsItemNFSaidaBASE_ICMS.Value * (dmMProvider.cdsItemNFSaidaICMS.Value / 100)),-2);

          dmMProvider.cdsMVA.Close;
          dmMProvider.cdsMVA.ProviderName := 'dspMVA';

          dmDBEXMaster.fdqMVA.SQL.Clear;
          dmDBEXMaster.fdqMVA.SQL.Add('select * from mva');
          dmDBEXMaster.fdqMVA.SQL.Add('where produto = ' + InttoStr(dmMProvider.cdsItemNFSaidaPRODUTO.Value));
          dmDBEXMaster.fdqMVA.SQL.Add('and estado = ' + QuotedStr(dmMProvider.cdsNFSaidaUF_DEST.Value));

          dmMProvider.cdsMVA.Open;
          dmMProvider.cdsMVA.ProviderName := '';

          //verifica se h� configura��es de MVA no produto
          if dmMProvider.cdsMVA.IsEmpty then
          begin

            dmMProvider.cdsEstados.Close;
            dmMProvider.cdsEstados.ProviderName := 'dspEstados';

            dmDBEXMaster.fdqEstados.SQL.Clear;
            dmDBEXMaster.fdqEstados.SQL.Add('select * from estados');
            dmDBEXMaster.fdqEstados.SQL.Add('where sigla = ' + QuotedStr(dmMProvider.cdsNFSaidaUF_DEST.Value));

            dmMProvider.cdsEstados.Open;
            dmMProvider.cdsEstados.ProviderName := '';

            if dmMProvider.cdsEstadosMVA.Value > 0 then
            begin

              dmMProvider.cdsItemNFSaidaBASE_SUBSTITUICAO.Value   := (dmMProvider.cdsItemNFSaidaSUB_TOTAL.Value - dmMProvider.cdsItemNFSaidaVALOR_DESCONTO.Value) + SimpleRoundTo((((dmMProvider.cdsItemNFSaidaSUB_TOTAL.Value - dmMProvider.cdsItemNFSaidaVALOR_DESCONTO.Value) * (dmMProvider.cdsEstadosMVA.Value / 100))),-2);
              dmMProvider.cdsItemNFSaidaMVA.Value                 := dmMProvider.cdsEstadosMVA.Value;
              dmMProvider.cdsItemNFSaidaALIQUOTA_ICMS_ST.Value    := dmMProvider.cdsEstadosICMS_INTERNO.Value;
              dmMProvider.cdsItemNFSaidaVALOR_SUBSTITUICAO.Value  := SimpleRoundTo(((dmMProvider.cdsItemNFSaidaBASE_SUBSTITUICAO.Value * (dmMProvider.cdsEstadosICMS_INTERNO.Value / 100))),-2) - dmMProvider.cdsItemNFSaidaVALOR_ICMS.Value;

            end;

          end
          else
          begin

            dmMProvider.cdsItemNFSaidaBASE_SUBSTITUICAO.Value   := (dmMProvider.cdsItemNFSaidaSUB_TOTAL.Value - dmMProvider.cdsItemNFSaidaVALOR_DESCONTO.Value) + SimpleRoundTo((((dmMProvider.cdsItemNFSaidaSUB_TOTAL.Value - dmMProvider.cdsItemNFSaidaVALOR_DESCONTO.Value) * (dmMProvider.cdsMVAMARGEM_MVA.Value / 100))),-2);
            dmMProvider.cdsItemNFSaidaMVA.Value                 := dmMProvider.cdsMVAMARGEM_MVA.Value;
            dmMProvider.cdsItemNFSaidaALIQUOTA_ICMS_ST.Value    := dmMProvider.cdsMVAICMS_INTERNO.Value;
            dmMProvider.cdsItemNFSaidaVALOR_SUBSTITUICAO.Value  := SimpleRoundTo((dmMProvider.cdsItemNFSaidaBASE_SUBSTITUICAO.Value * (dmMProvider.cdsMVAICMS_INTERNO.Value / 100)),-2);

          end;

        end
        else if (dmMProvider.cdsNFSaidaDESTINO_OPERACAO.Value = 2) and (dmMProvider.cdsNFSaidaCONSUMIDOR_FINAL.Value = 1) then
        begin

          dmMProvider.cdsMVA.Close;
          dmMProvider.cdsMVA.ProviderName := 'dspMVA';

          dmDBEXMaster.fdqMVA.SQL.Clear;
          dmDBEXMaster.fdqMVA.SQL.Add('select * from mva');
          dmDBEXMaster.fdqMVA.SQL.Add('where produto = ' + InttoStr(dmMProvider.cdsItemNFSaidaPRODUTO.Value));
          dmDBEXMaster.fdqMVA.SQL.Add('and estado = ' + QuotedStr(dmMProvider.cdsNFSaidaUF_DEST.Value));

          dmMProvider.cdsMVA.Open;
          dmMProvider.cdsMVA.ProviderName := '';

          //verifica se h� configura��es de DIFAL no produto
          if dmMProvider.cdsMVA.IsEmpty then
          begin

            dmMProvider.cdsEstados.Close;
            dmMProvider.cdsEstados.ProviderName := 'dspEstados';

            dmDBEXMaster.fdqEstados.SQL.Clear;
            dmDBEXMaster.fdqEstados.SQL.Add('select * from estados');
            dmDBEXMaster.fdqEstados.SQL.Add('where sigla = ' + QuotedStr(dmMProvider.cdsNFSaidaUF_DEST.Value));

            dmMProvider.cdsEstados.Open;
            dmMProvider.cdsEstados.ProviderName := '';

            if dmMProvider.cdsEstadosMVA.Value > 0 then
            begin

              if dmMProvider.cdsItemNFSaidaALIQUOTA_ICMS_INTERNA_DESTINO.Value = 0 then
                dmMProvider.cdsItemNFSaidaALIQUOTA_ICMS_INTERNA_DESTINO.Value := dmMProvider.cdsEstadosICMS_INTERNO.Value;

              if dmMProvider.cdsItemNFSaidaPERC_FCP.Value = 0 then
                dmMProvider.cdsItemNFSaidaPERC_FCP.Value                      := dmMProvider.cdsEstadosFCP.Value;

            end;

          end
          else
          begin

            if dmMProvider.cdsItemNFSaidaALIQUOTA_ICMS_INTERNA_DESTINO.Value = 0 then
              dmMProvider.cdsItemNFSaidaALIQUOTA_ICMS_INTERNA_DESTINO.Value := dmMProvider.cdsMVAICMS_INTERNO.Value;

            if dmMProvider.cdsItemNFSaidaPERC_FCP.Value = 0 then
            begin

              dmMProvider.cdsEstados.Close;
              dmMProvider.cdsEstados.ProviderName := 'dspEstados';

              dmDBEXMaster.fdqEstados.SQL.Clear;
              dmDBEXMaster.fdqEstados.SQL.Add('select * from estados');
              dmDBEXMaster.fdqEstados.SQL.Add('where sigla = ' + QuotedStr(dmMProvider.cdsNFSaidaUF_DEST.Value));

              dmMProvider.cdsEstados.Open;
              dmMProvider.cdsEstados.ProviderName := '';
              dmMProvider.cdsItemNFSaidaPERC_FCP.Value                      := dmMProvider.cdsEstadosFCP.Value;

            end;

          end;

        end;


      end
      else if dmMProvider.cdsNFSaidaFINALIDADE_NF.Value < 3 then //diferente de devolu��o

      begin

        dmMProvider.cdsItemNFSaidaBASE_ICMS.Value           := 0;
        dmMProvider.cdsItemNFSaidaVALOR_ICMS.Value          := 0;
        dmMProvider.cdsItemNFSaidaBASE_SUBSTITUICAO.Value   := 0;
        dmMProvider.cdsItemNFSaidaMVA.Value                 := 0;
        dmMProvider.cdsItemNFSaidaALIQUOTA_ICMS_ST.Value    := 0;
        dmMProvider.cdsItemNFSaidaVALOR_SUBSTITUICAO.Value  := 0;

      end
      else
        dmMProvider.cdsItemNFSaidaVALOR_ICMS.Value          := SimpleRoundTo((dmMProvider.cdsItemNFSaidaBASE_ICMS.Value * (dmMProvider.cdsItemNFSaidaICMS.Value / 100)),-2);

    end
    else if dmMProvider.cdsItemNFSaidaCST.Value = 900 then
    begin

      dmMProvider.cdsItemNFSaidaBASE_ICMS.Value                         := (dmMProvider.cdsItemNFSaidaSUB_TOTAL.Value - dmMProvider.cdsItemNFSaidaVALOR_DESCONTO.Value) - SimpleRoundTo(((dmMProvider.cdsItemNFSaidaSUB_TOTAL.Value * (dmMProvider.cdsItemNFSaidaPERCENTUAL_REDUCAO.Value / 100))),-2);
      dmMProvider.cdsItemNFSaidaVALOR_ICMS.Value                        := SimpleRoundTo((dmMProvider.cdsItemNFSaidaBASE_ICMS.Value * (dmMProvider.cdsItemNFSaidaICMS.Value / 100)),-2);

    end;

    if dmMProvider.cdsItemNFSaidaDESCONTO.Value > 0 then
    begin

      dmMProvider.cdsItemNFSaidaVALOR_DESCONTO.Value  := SimpleRoundTo((dmMProvider.cdsItemNFSaidaSUB_TOTAL.Value * (dmMProvider.cdsItemNFSaidaDESCONTO.Value / 100)),-2);
      dmMProvider.cdsItemNFSaidaDESCONTO.Value        := 0;

    end;

  end;

end;

procedure TfrmModNFSaida.cboFormaPagamentoExit(Sender: TObject);
begin

  if InserindoEditando(dmMProvider.cdsNFSaida) then
    CalcularParcelas;

end;

procedure TfrmModNFSaida.cboFormaPagamentoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin

  if InserindoEditando(dmMProvider.cdsNFSaida) then
  begin

    case Key of

      VK_DELETE:
        begin

          //elimina parcelas
          if Man_Tab_Parcelas_NFS(1) then
          begin

            RelacionarParcelas_NFS;

            LimparMSG_ERRO(lblMsg, imgErro);
            cboFormaPagamento.KeyValue := -1;

          end;

        end;

    end;

  end;

end;

procedure TfrmModNFSaida.cboModeloNotaKeyPress(Sender: TObject; var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end;

end;

function TfrmModNFSaida.ChecarValidadeCertificado: boolean;
begin

  try

    Result := Date <= ACBrNFe1.SSL.CertDataVenc;

  except
    on E:exception do
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario +  Tratar_Erro_Conexao(E);
      Application.ProcessMessages;

    end;

  end;

end;

function TfrmModNFSaida.ConsistirCfop_NFS(pNotaFiscal: Integer; pModelo: string): boolean;
var
  iQtdCfopNota, iQtdCfopItem: Integer;
begin

  Result := False;

  if dmMProvider.cdsNFSaidaNFSAIDA.Value > 0 then
  begin

    if Man_Tab_CFOP_NFS(0) then
    begin

      // verificar divergencias entre cfop da nota e cfop dos itens
      dmMSProcedure.fdspConsisteCFOP_NFS.Params[0].Value := pNotaFiscal;
      dmMSProcedure.fdspConsisteCFOP_NFS.Params[1].Value := pModelo;
      dmMSProcedure.fdspConsisteCFOP_NFS.ExecProc;

      iQtdCfopNota := dmMSProcedure.fdspConsisteCFOP_NFS.Params[2].AsInteger;

      dmMProvider.cdsConsisteCFOP_ITNFS.Close;
      dmMProvider.cdsConsisteCFOP_ITNFS.ProviderName := 'dspConsisteCFOP_ITNFS';

      dmDBEXMaster.fdqConsisteCFOP_ITNFS.Params[0].Value := pNotaFiscal;
      dmDBEXMaster.fdqConsisteCFOP_ITNFS.Params[1].Value := pModelo;

      dmMProvider.cdsConsisteCFOP_ITNFS.Open;
      dmMProvider.cdsConsisteCFOP_ITNFS.ProviderName := '';

      iQtdCfopItem := dmMProvider.cdsConsisteCFOP_ITNFS.RecordCount;

      if dmMProvider.cdsConsisteCFOP_ITNFS.IsEmpty then
        Result := True
      else
        Result := iQtdCfopItem = iQtdCfopNota;

    end;

  end
  else
    Result := True;

end;

function TfrmModNFSaida.Consistir_Finalidade_NFE: boolean;
begin

  case dmMProvider.cdsNFSaidaFINALIDADE_NF.Value of
    1,2,3: Result := (not dmMProvider.cdsDocumentoRef_NFS.IsEmpty);
//      3: Result := (not dmMProvider.cdsCupomFiscalRefNFS.IsEmpty);
  else
    Result := True;
  end;

end;

function TfrmModNFSaida.Consistir_Local_Embarque: boolean;
begin

  if (dmMProvider.cdsNFSaidaDESTINO_OPERACAO.Value = 3) and (dmMProvider.cdsNFSaidaFINALIDADE_NF.Value <= 3) then
    Result := Length(Trim(dmMProvider.cdsNFSaidaLOCAL_EMBARQUE.AsString)) > 0
  else
    Result := True;

end;

function TfrmModNFSaida.Consistir_Parcelas_NFS(pOpcao: smallint): boolean;
var
  cTotal_Parcelas: currency;
begin

  cTotal_Parcelas := 0;

  dmMSProcedure.fdspConsiste_Parc_NFS.Params[0].Value     := pOpcao;
  dmMSProcedure.fdspConsiste_Parc_NFS.Params[1].Value     := dmMProvider.cdsNFSaidaNFSAIDA.Value;
  dmMSProcedure.fdspConsiste_Parc_NFS.Params[2].Value     := dmMProvider.cdsNFSaidaMODELO.Value;
  dmMSProcedure.fdspConsiste_Parc_NFS.ExecProc;

  cTotal_Parcelas := dmMSProcedure.fdspConsiste_Parc_NFS.Params[3].AsCurrency;

  if cTotal_Parcelas > 0 then
    Result := cTotal_Parcelas = (dmMProvider.cdsNFSaidaVALORDANOTA.Value - dmMProvider.cdsNFSaidaVALOR_ENTRADA.Value)
  else
    Result := True;

end;

procedure TfrmModNFSaida.rdgIndicadorIEDestinatarioClick(Sender: TObject);
begin

  if InserindoEditando(dmMProvider.cdsNFSaida) then
    dmMProvider.cdsNFSaidaINDICADOR_IE_DESTINATARIO.Value := StrToInt(rdgIndicadorIEDestinatario.Values[rdgIndicadorIEDestinatario.ItemIndex]);

end;

procedure TfrmModNFSaida.edtAliqIcmsExit(Sender: TObject);
var
  sAliquota:string;
begin

  MudarCorEdit(sender);

  dmMProvider.cdsTributacao.Close;
  dmMProvider.cdsTributacao.ProviderName  := 'dspTributacao';

  // consiste aliquota de icms
  FormatSettings.DecimalSeparator         := '.';

  sAliquota                               := FormatFloat('#0.00', dmMProvider.cdsItemNFSaidaICMS.Value);


  dmDBEXMaster.fdqTributacao.Close;
  dmDBEXMaster.fdqTributacao.SQL.Clear;
  dmDBEXMaster.fdqTributacao.SQL.Add('SELECT * FROM ALIQUOTAS');
  dmDBEXMaster.fdqTributacao.SQL.Add('WHERE ALIQUOTA = ' + sAliquota);
  dmDBEXMaster.fdqTributacao.Open;

  dmMProvider.cdsTributacao.Open;
  dmMProvider.cdsTributacao.ProviderName := '';

  FormatSettings.DecimalSeparator         := ',';

  if dmMProvider.cdsTributacao.IsEmpty then
  begin

    lblMsg.Caption :=  dmDBEXMaster.sNomeUsuario + MSG_CONSISTE_ALIQ_NFS;
    Application.ProcessMessages;
    edtAliqIcms.SetFocus;

  end
  else
  begin

    if dmMProvider.cdsNFSaidaDESTINO_OPERACAO.Value = 2 then
      dmMProvider.cdsItemNFSaidaALIQUOTA_ICMS_INTERESTADUAL.Value := dmMProvider.cdsItemNFSaidaICMS.Value;

    if InserindoEditando(dmMProvider.cdsItemNFSaida) then
      CalcularValoresItens;

  end;

end;

procedure TfrmModNFSaida.edtAliqInternaDestinoExit(Sender: TObject);
begin

  MudarCorEdit(sender);

  if InserindoEditando(dmMProvider.cdsItemNFSaida) then
    CalcularDifal;

end;

procedure TfrmModNFSaida.edtBC_IPIExit(Sender: TObject);
begin

  MudarCorEdit(sender);

  if InserindoEditando(dmMProvider.cdsItemNFSaida) then
    CalcularValoresItens;

end;

procedure TfrmModNFSaida.edtCESTExit(Sender: TObject);
begin

  MudarCorEdit(sender);

  if Length(Trim(dmMProvider.cdsItemNFSaidaCEST.Value)) <= 7 then
    dmMProvider.cdsItemNFSaidaCEST.Value := dmMProvider.cdsNcmNbsTABELA_CEST.Value;

end;

procedure TfrmModNFSaida.edtCFOpItemExit(Sender: TObject);
begin

  MudarCorEdit(Sender);
  LimparMSG_ERRO(lblMsg, imgErro);

  if InserindoEditando(dmMProvider.cdsItemNFSaida) then
  begin

    HabilitarDesabilitarGrupoPartilha_FCP;

    if Length(Trim(edtCfopItem.Text)) > 0 then
    begin

      if not PesquisarCFOP(0,Trim(edtCFOpItem.Text)) then
      begin

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA + ' NCM: ' + edtNCM.Text;
        Application.ProcessMessages;
        edtCFOpItem.SetFocus;

      end
      else
      begin

        if not dmMProvider.cdsCFOP_NFSaida.Locate('CFOP;NFSAIDA',VarArrayOf([Trim(edtCFOpItem.Text), dmMProvider.cdsNFSaidaNFSAIDA.Value]) ,[]) then
        begin

          lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_CFOP_NAO_LACADA;
          imgErro.Visible := True;
          Application.ProcessMessages;
          edtCFOpItem.SetFocus;

        end
        else
        begin

          if dmMProvider.cdsPesqCFOPCST_PIS_SAIDA.Value > 0 then
          begin

            dmMProvider.cdsItemNFSaidaCST_PIS.Value           := dmMProvider.cdsPesqCFOPCST_PIS_SAIDA.Value;
            dmMProvider.cdsItemNFSaidaP_ALIQUOTA_PIS.Value    := dmMProvider.cdsPesqCFOPALIQUOTA_PIS_SAIDA.Value;
            dmMProvider.cdsItemNFSaidaCST_COFINS.Value        := dmMProvider.cdsPesqCFOPCST_COFINS_SAIDA.Value;
            dmMProvider.cdsItemNFSaidaP_ALIQUOTA_COFINS.Value := dmMProvider.cdsPesqCFOPALIQUOTA_COFINS_SAIDA.Value;

          end;

        end;

      end;

    end
    else
    begin

      lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_CAMPO_OBRIGATORIO;
      imgErro.Visible := True;
      Application.ProcessMessages;
      edtCFOpItem.SetFocus;

    end;

  end;

end;

procedure TfrmModNFSaida.edtCFOPNotaExit(Sender: TObject);
begin

  MudarCorEdit(sender);

  LimparMSG_ERRO(lblMsg, imgErro);

  if InserindoEditando(dmMProvider.cdsNFSaida) then
  begin

    try

      if Length(Trim(edtCFOPNota.Text)) > 0 then
      begin

        if not PesquisarCFOP(0,Trim(edtCFOPNota.Text)) then
        begin

          lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA + ' - CFOP: ' + edtCFOPNota.Text;
          imgErro.Visible := True;
          edtCFOPNota.SetFocus;
          dmDBEXMaster.fdqMasterPesquisa.Close;

        end
        else
        begin

          if dmMProvider.cdsPesqCFOPOPERACAO.Value = 0 then
            dmMProvider.cdsNFSaidaENTRADA_SAIDA.Value := 1
          else
            dmMProvider.cdsNFSaidaENTRADA_SAIDA.Value := 0;

          if dmMProvider.cdsPesqCFOPNATUREZA_CFOP.Value = 2 then
          begin

            dmMProvider.cdsNFSaidaCONSUMIDOR_FINAL.Value  := 0;
            dmMProvider.cdsNFSaidaFINALIDADE_NF.Value     := 3;

          end;

          case dmMProvider.cdsNFSaidaENTRADA_SAIDA.Value of
            0:begin //sa�da

                if (edtCFOPNota.Text[1] = '5') and (dmMProvider.cdsNFSaidaDESTINO_OPERACAO.Value = 2) then
                begin

                  lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CFOP_INCOMP_ESTADO;
                  imgErro.Visible := true;
                  edtCFOPNota.SetFocus;

                end
                else if (edtCFOPNota.Text[1] = '6') and (dmMProvider.cdsNFSaidaDESTINO_OPERACAO.Value = 1) then
                begin

                  lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CFOP_INCOMP_INTERNA;
                  imgErro.Visible := true;
                  edtCFOPNota.SetFocus;

                end
                else if (edtCFOPNota.Text[1] <> '7') and (dmMProvider.cdsNFSaidaDESTINO_OPERACAO.Value = 3) then
                begin

                  lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CFOP_INCOMP_EXTERIOR;
                  imgErro.Visible := true;
                  edtCFOPNota.SetFocus;

                end
                else
                begin

                  if dmMProvider.cdsCFOP_NFSaida.IsEmpty then
                    RelacionarCFOP_NFS;

                  if not dmMProvider.cdsCFOP_NFSaida.Locate('CFOP;NFSAIDA',VarArrayOf([Trim(edtCFOPNota.Text), dmMProvider.cdsNFSaidaNFSAIDA.Value]) ,[]) then
                  begin

                    dmMProvider.cdsCFOP_NFSaida.Append;
                    dmMProvider.cdsCFOP_NFSaidaCFOP.Value := dmMProvider.cdsPesqCFOPCFOP.Value;
                    dmMProvider.cdsCFOP_NFSaida.Post;

                    if Length(Trim(dmMProvider.cdsPesqCFOPOBSERVACAO_NFS.AsString)) > 0 then
                    begin

                      if Length(Trim(dmMProvider.cdsNFSaidaINFO_FISCO.Value)) > 0 then
                        dmMProvider.cdsNFSaidaINFO_FISCO.Value := dmMProvider.cdsNFSaidaINFO_FISCO.Value + ', ' + dmMProvider.cdsPesqCFOPOBSERVACAO_NFS.AsString
                      else
                        dmMProvider.cdsNFSaidaINFO_FISCO.Value := dmMProvider.cdsPesqCFOPOBSERVACAO_NFS.AsString;

                    end;

                  end;

                  edtCFOPNota.Clear;
                  edtCFOPNota.SetFocus;

                  Man_Tab_CFOP_NFS(0);

                end;

              end;
            1:begin //entrada

                if (edtCFOPNota.Text[1] = '5') and (dmMProvider.cdsNFSaidaDESTINO_OPERACAO.Value = 2) then
                begin

                  lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CFOP_INCOMP_ESTADO;
                  imgErro.Visible := true;
                  edtCFOPNota.SetFocus;

                end
                else if (edtCFOPNota.Text[1] = '6') and (dmMProvider.cdsNFSaidaDESTINO_OPERACAO.Value = 1) then
                begin

                  lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CFOP_INCOMP_INTERNA;
                  imgErro.Visible := true;
                  edtCFOPNota.SetFocus;

                end
                else if (edtCFOPNota.Text[1] <> '7') and (edtCFOPNota.Text[1] <> '3') and (dmMProvider.cdsNFSaidaDESTINO_OPERACAO.Value = 3) then
                begin

                  lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CFOP_INCOMP_EXTERIOR;
                  imgErro.Visible := true;
                  edtCFOPNota.SetFocus;

                end
                else
                begin

                  if dmMProvider.cdsCFOP_NFSaida.IsEmpty then
                    RelacionarCFOP_NFS;

                  if not dmMProvider.cdsCFOP_NFSaida.Locate('CFOP;NFSAIDA',VarArrayOf([Trim(edtCFOpItem.Text), dmMProvider.cdsNFSaidaNFSAIDA.Value]) ,[]) then
//                  if not dmMProvider.cdsCFOP_NFSaida.Locate('CFOP',Trim(edtCFOPNota.Text),[]) then //n�o permite incluir cfop j� lan�ada
                  begin

                    dmMProvider.cdsCFOP_NFSaida.Append;
                    dmMProvider.cdsCFOP_NFSaidaCFOP.Value := dmMProvider.cdsPesqCFOPCFOP.Value;
                    dmMProvider.cdsCFOP_NFSaida.Post;

                    if Length(Trim(dmMProvider.cdsPesqCFOPOBSERVACAO_NFS.AsString)) > 0 then
                    begin

                      if Length(Trim(dmMProvider.cdsNFSaidaINFO_FISCO.Value)) > 0 then
                        dmMProvider.cdsNFSaidaINFO_FISCO.Value := dmMProvider.cdsNFSaidaINFO_FISCO.Value + ', ' + dmMProvider.cdsPesqCFOPOBSERVACAO_NFS.AsString
                      else
                        dmMProvider.cdsNFSaidaINFO_FISCO.Value := dmMProvider.cdsPesqCFOPOBSERVACAO_NFS.AsString;

                    end;

                  end;

                  edtCFOPNota.Clear;
                  edtCFOPNota.SetFocus;

                  Man_Tab_CFOP_NFS(0);

                end;

              end;

          end;

        end;

      end
      else if (dmMProvider.cdsCFOP_NFSaida.IsEmpty) and (rdgConsumidorFinal.ItemIndex >= 0) then
        edtCFOPNota.SetFocus
      else if rdgConsumidorFinal.ItemIndex < 0 then
      begin

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CAMPO_OBRIGATORIO + ' - CONSUMIDOR FINAL';
        pgcNotaFiscal.ActivePageIndex := 1;

      end;

    except

      on E: exception do
      begin

        lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + Tratar_Erro_Conexao(E);
        imgErro.Visible := True;
        Application.ProcessMessages;

      end;

    end;

  end;

end;

procedure TfrmModNFSaida.edtCFOPNotaKeyPress(Sender: TObject; var Key: Char);
begin

  if InserindoEditando(dmMProvider.cdsNFSaida) then
  begin

    if (Key = #13) and (Length(Trim(edtCFOPNota.Text)) = 0) and not (dmMProvider.cdsCFOP_NFSaida.IsEmpty) and (pgcNotaFiscal.ActivePageIndex = 1) and (rdgConsumidorFinal.ItemIndex >= 0) then
    begin

      Key := #0;
      pgcNotaFiscal.ActivePageIndex := 2

    end
    else if Key = #13 then
    begin

      Key := #0;
      PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

    end;

  end;

end;

procedure TfrmModNFSaida.edtChaveAcessoConsultaChange(Sender: TObject);
begin

  if Copy(dmMProvider.cdsNFSaidaNUMERO_DANFE.Value,1,1) = 'N' then
    edtChaveAcessoConsulta.Text := Trim(Copy(dmMProvider.cdsNFSaidaNUMERO_DANFE.Value,4,Length(dmMProvider.cdsNFSaidaNUMERO_DANFE.Value)))

end;

procedure TfrmModNFSaida.edtCNPJDestinatarioChange(Sender: TObject);
begin

  if length(Trim(dmMProvider.cdsNFSaidaDESTINATARIO_.Value)) = 14 then
    dmMProvider.cdsNFSaida.FieldByName('DESTINATARIO_').EditMask := '99.999.999/9999-99;0;_'
  else if length(Trim(dmMProvider.cdsNFSaidaDESTINATARIO_.Value)) = 11 then
    dmMProvider.cdsNFSaida.FieldByName('DESTINATARIO_').EditMask := '999.999.999-99;0;_';

end;

procedure TfrmModNFSaida.edtCodigoItemExit(Sender: TObject);
var
  cGTIN:string;
  iProduto:integer;
begin

  if rdgConsumidorFinal.ItemIndex < 0 then
  begin

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CAMPO_OBRIGATORIO + ' - CONSUMIDOR FINAL';
    pgcNotaFiscal.ActivePageIndex := 1;
    exit;

  end;

  cGTIN     := '';
  iProduto  := 0;

  MudarCorEdit(sender);
  LimparMSG_ERRO(lblMsg, imgErro);

  try

    if not dmMProvider.cdsNFSaida.IsEmpty then
    begin

      if (length(Trim(edtCodigoItem.Text)) > 0) and (length(Trim(edtCodigoItem.Text)) <= 6) then
      begin

        dmDBEXMaster.fdqMasterPesquisa.Close;
        dmDBEXMaster.fdqMasterPesquisa.SQL.Clear;
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('select pro.descricao, pro.unidade,pro.produto, pro.ncm, pro.cest, pf.promocao, pf.precodevenda, pf.precopromocao,');
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('pro.cf_ipi, pro.cst_pis, pro.aliquota_pis, pro.cst_cofins,  pro.aliquota_cofins,');
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('pro.cst_ipi, pf.ipi, ncm.carga_nac_federal, ncm.carga_imp_federal, ncm.carga_estadual, pf.custobruto,');
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('ncm.carga_municipal, PRO.origem_mercadoria, pro.cst, aliq.aliquota , bar.barras, bar.gerado from produto pro');

        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('join produtofilial pf');
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('on(pf.produto = pro.produto)');

        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('join nbm_ncm ncm');
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('on(ncm.cod_ncm = pro.ncm)');

        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('join aliquotas aliq');
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('on(aliq.tributacao = pro.tributacao)');

        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('join barras bar');
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('on(bar.produto = pro.produto)');

        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('where pro.produto = ' + Trim(edtCodigoItem.Text));
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add(' and pro.ativo = 1 and pro.visibilidade = 1');
        dmDBEXMaster.fdqMasterPesquisa.Open;

        if dmDBEXMaster.fdqMasterPesquisa.IsEmpty then
        begin

          lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA + 'Produto: ' + Trim(edtCodigoItem.Text);
          imgErro.Visible := True;
          Application.ProcessMessages;
          edtCodigoItem.SetFocus;

        end
        else
          actIncluirItemCDSExecute(self);

      end
      else if (length(Trim(edtCodigoItem.Text)) > 6) and (length(Trim(edtCodigoItem.Text)) <= 13 )then
      begin

        cGTIN := FormatFloat('0000000000000',StrToFloat(Trim(edtCodigoItem.Text)));

        dmDBEXMaster.fdqMasterPesquisa.Close;
        dmDBEXMaster.fdqMasterPesquisa.SQL.Clear;
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('select produto from barras');
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('where barras = ' + QuotedStr(cGTIN));
        dmDBEXMaster.fdqMasterPesquisa.Open;

        if dmDBEXMaster.fdqMasterPesquisa.IsEmpty then
        begin

          lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA + 'C�digo de barras: ' + Trim(edtCodigoItem.Text);
          imgErro.Visible := True;
          Application.ProcessMessages;
          edtCodigoItem.SetFocus;

        end
        else
        begin

          iProduto := dmDBEXMaster.fdqMasterPesquisa.FieldByName('PRODUTO').AsInteger;

          dmDBEXMaster.fdqMasterPesquisa.Close;
          dmDBEXMaster.fdqMasterPesquisa.SQL.Clear;
          dmDBEXMaster.fdqMasterPesquisa.SQL.Add('select pro.descricao, pro.unidade,pro.produto, pro.ncm, pro.cest, pf.promocao, pf.precodevenda, pf.precopromocao,');
          dmDBEXMaster.fdqMasterPesquisa.SQL.Add('pro.cf_ipi, pro.cst_pis, pro.aliquota_pis, pro.cst_cofins,  pro.aliquota_cofins,');
          dmDBEXMaster.fdqMasterPesquisa.SQL.Add('pro.cst_ipi, pf.ipi, ncm.carga_nac_federal, ncm.carga_imp_federal, ncm.carga_estadual, pf.custobruto,');
          dmDBEXMaster.fdqMasterPesquisa.SQL.Add('ncm.carga_municipal, PRO.origem_mercadoria, pro.cst, aliq.aliquota , bar.barras, bar.gerado from produto pro');

          dmDBEXMaster.fdqMasterPesquisa.SQL.Add('join produtofilial pf');
          dmDBEXMaster.fdqMasterPesquisa.SQL.Add('on(pf.produto = pro.produto)');

          dmDBEXMaster.fdqMasterPesquisa.SQL.Add('join nbm_ncm ncm');
          dmDBEXMaster.fdqMasterPesquisa.SQL.Add('on(ncm.cod_ncm = pro.ncm)');

          dmDBEXMaster.fdqMasterPesquisa.SQL.Add('join aliquotas aliq');
          dmDBEXMaster.fdqMasterPesquisa.SQL.Add('on(aliq.tributacao = pro.tributacao)');

          dmDBEXMaster.fdqMasterPesquisa.SQL.Add('join barras bar');
          dmDBEXMaster.fdqMasterPesquisa.SQL.Add('on(bar.produto = pro.produto)');

          dmDBEXMaster.fdqMasterPesquisa.SQL.Add('where pro.produto = ' + IntToStr(iProduto));
          dmDBEXMaster.fdqMasterPesquisa.SQL.Add(' and pro.ativo = 1 and pro.visibilidade = 1');
          dmDBEXMaster.fdqMasterPesquisa.Open;

          if dmDBEXMaster.fdqMasterPesquisa.IsEmpty then
          begin

            lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_CONSISTE_BARRAS_PRODUTO + 'Produto: ' + IntToStr(iProduto);
            imgErro.Visible := True;
            Application.ProcessMessages;
            edtCodigoItem.SetFocus;

          end
          else
            actIncluirItemCDSExecute(self);

        end;

      end
      else if (length(Trim(edtCodigoItem.Text)) = 14) then
      begin

        cGTIN := Trim(edtCodigoItem.Text);

        dmDBEXMaster.fdqMasterPesquisa.Close;
        dmDBEXMaster.fdqMasterPesquisa.SQL.Clear;
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('select produto from barras');
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('where barras = ' + QuotedStr(cGTIN));
        dmDBEXMaster.fdqMasterPesquisa.Open;

        if dmDBEXMaster.fdqMasterPesquisa.IsEmpty then
        begin

          lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA + 'C�digo de barras: ' + Trim(edtCodigoItem.Text);
          imgErro.Visible := True;
          Application.ProcessMessages;
          edtCodigoItem.SetFocus;

        end
        else
        begin

          iProduto := dmDBEXMaster.fdqMasterPesquisa.FieldByName('PRODUTO').AsInteger;

          dmDBEXMaster.fdqMasterPesquisa.Close;
          dmDBEXMaster.fdqMasterPesquisa.SQL.Clear;
          dmDBEXMaster.fdqMasterPesquisa.SQL.Add('select pro.descricao, pro.unidade,pro.produto, pro.ncm, pro.cest, pf.promocao, pf.precodevenda, pf.precopromocao,');
          dmDBEXMaster.fdqMasterPesquisa.SQL.Add('pro.cf_ipi, pro.cst_pis, pro.aliquota_pis, pro.cst_cofins,  pro.aliquota_cofins,');
          dmDBEXMaster.fdqMasterPesquisa.SQL.Add('pro.cst_ipi, pf.ipi, ncm.carga_nac_federal, ncm.carga_imp_federal, ncm.carga_estadual, pf.custobruto,');
          dmDBEXMaster.fdqMasterPesquisa.SQL.Add('ncm.carga_municipal, PRO.origem_mercadoria, pro.cst, aliq.aliquota , bar.barras, bar.gerado from produto pro');

          dmDBEXMaster.fdqMasterPesquisa.SQL.Add('join produtofilial pf');
          dmDBEXMaster.fdqMasterPesquisa.SQL.Add('on(pf.produto = pro.produto)');

          dmDBEXMaster.fdqMasterPesquisa.SQL.Add('join nbm_ncm ncm');
          dmDBEXMaster.fdqMasterPesquisa.SQL.Add('on(ncm.cod_ncm = pro.ncm)');

          dmDBEXMaster.fdqMasterPesquisa.SQL.Add('join aliquotas aliq');
          dmDBEXMaster.fdqMasterPesquisa.SQL.Add('on(aliq.tributacao = pro.tributacao)');

          dmDBEXMaster.fdqMasterPesquisa.SQL.Add('join barras bar');
          dmDBEXMaster.fdqMasterPesquisa.SQL.Add('on(bar.produto = pro.produto)');

          dmDBEXMaster.fdqMasterPesquisa.SQL.Add('where pro.produto = ' + IntToStr(iProduto));
          dmDBEXMaster.fdqMasterPesquisa.SQL.Add(' and pro.ativo = 1 and pro.visibilidade = 1');
          dmDBEXMaster.fdqMasterPesquisa.Open;

          if dmDBEXMaster.fdqMasterPesquisa.IsEmpty then
          begin

            lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_CONSISTE_BARRAS_PRODUTO + 'Produto: ' + IntToStr(iProduto);
            imgErro.Visible := True;
            Application.ProcessMessages;
            edtCodigoItem.SetFocus;

          end
          else
            actIncluirItemCDSExecute(self);

        end;

      end;

    end;

  except
    on E: exception do
    begin

      lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + Tratar_Erro_Conexao(E);
      imgErro.Visible := True;
      edtCodigoItem.SetFocus;
      Application.ProcessMessages;

    end;

  end;

end;

procedure TfrmModNFSaida.edtCodigoItemKeyPress(Sender: TObject; var Key: Char);
begin

  if InserindoEditando(dmMProvider.cdsNFSaida) then
  begin

    if UpperCase(key) = 'P' then
    begin

      key := #0;

      dmDBEXMaster.fdqMasterPesquisa.Close;

      frmPesquisaProduto      := TfrmPesquisaProduto.Create(self);
      if frmPesquisaProduto.ShowModal = mrOk then
      begin

        dmDBEXMaster.fdqMasterPesquisa.Close;
        dmDBEXMaster.fdqMasterPesquisa.SQL.Clear;
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('select pro.descricao, pro.unidade,pro.produto, pro.ncm, pro.cest, pf.promocao, pf.precodevenda, pf.precopromocao,');
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('pro.cf_ipi, pro.cst_pis, pro.aliquota_pis, pro.cst_cofins,  pro.aliquota_cofins,');
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('pro.cst_ipi, pf.ipi, ncm.carga_nac_federal, ncm.carga_imp_federal, ncm.carga_estadual, pf.custobruto,');
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('ncm.carga_municipal, PRO.origem_mercadoria, pro.cst, aliq.aliquota , bar.barras, bar.gerado from produto pro');

        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('join produtofilial pf');
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('on(pf.produto = pro.produto)');

        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('join nbm_ncm ncm');
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('on(ncm.cod_ncm = pro.ncm)');

        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('join aliquotas aliq');
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('on(aliq.tributacao = pro.tributacao)');

        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('join barras bar');
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('on(bar.produto = pro.produto)');

        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('where pro.produto = ' + IntToStr(dmMProvider.cdsProdutosPRODUTO.Value));
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add(' and pro.ativo = 1 and pro.visibilidade = 1');
        dmDBEXMaster.fdqMasterPesquisa.Open;

        actIncluirItemCDSExecute(self);

        edtComplementoItem.SetFocus;

      end;

      FreeAndNil(frmPesquisaProduto);

    end
    else if Key = #13 then
    begin

      Key := #0;
      PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

    end
    else if not(Key in ['0' .. '9', Chr(8)]) then
      Key := #0;

  end;

end;

procedure TfrmModNFSaida.edtComplementoItemExit(Sender: TObject);
begin

  MudarCorEdit(sender);
  try

    if not dmMProvider.cdsNFSaida.IsEmpty then
    begin

      if (Length(Trim(edtCodigoItem.Text)) <= 0) and (Length(Trim(edtComplementoItem.Text)) > 0) then
      begin

        dmDBEXMaster.fdqMasterPesquisa.Close;
        dmDBEXMaster.fdqMasterPesquisa.SQL.Clear;
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('select pro.produto, pro.ncm, pro.cest, pf.promocao, pf.precodevenda, pf.precopromocao,');
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('pro.cf_ipi, pro.cst_pis, pro.aliquota_pis, pro.cst_cofins,  pro.aliquota_cofins,');
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('pro.cst_ipi, pf.ipi, ncm.carga_nac_federal, ncm.carga_imp_federal, ncm.carga_estadual,');
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('ncm.carga_municipal, PRO.origem_mercadoria, pro.cst, aliq.aliquota , bar.barras, bar.gerado from produto pro');

        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('join produtofilial pf');
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('on(pf.produto = pro.produto)');

        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('join nbm_ncm ncm');
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('on(ncm.cod_ncm = pro.ncm)');

        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('join aliquotas aliq');
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('on(aliq.tributacao = pro.tributacao)');

        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('join barras bar');
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('on(bar.produto = pro.produto)');

        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('where pro.complemento = ' + QuotedStr(Trim(edtComplementoItem.Text)));
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add(' and pro.ativo = 1 and pro.visibilidade = 1');
        dmDBEXMaster.fdqMasterPesquisa.Open;

        if dmDBEXMaster.fdqMasterPesquisa.IsEmpty then
        begin

          lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA + 'Complemento: ' + Trim(edtComplementoItem.Text);
          imgErro.Visible := True;
          Application.ProcessMessages;
          edtComplementoItem.SetFocus;

        end
        else
          actIncluirItemCDSExecute(self);

      end;

    end;
  except

    on E: exception do
    begin

      lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + Tratar_Erro_Conexao(E);
      imgErro.Visible := True;
      edtComplementoItem.SetFocus;
      Application.ProcessMessages;

    end;

  end;

end;

procedure TfrmModNFSaida.edtConteudoPesquisaEnter(Sender: TObject);
begin

  MudarCorEdit(sender);

end;

procedure TfrmModNFSaida.edtConteudoPesquisaExit(Sender: TObject);
begin

  MudarCorEdit(sender);

  if Length(Trim(edtConteudoPesquisa.Text)) > 0 then
  begin

    if AbrirTabelaNotaFiscal(rdpOpcoesPesquisa.ItemIndex,edtConteudoPesquisa.Text) then
    begin

      edtConteudoPesquisa.Clear;
      edtConteudoPesquisa.SetFocus;

    end
    else
    begin

      LimparMSG_ERRO(lblMsg, imgErro);
      edtConteudoPesquisa.Clear;
      pgcNotaFiscal.ActivePageIndex := 0;
      grdTabela.SetFocus;

    end;

  end;

end;

procedure TfrmModNFSaida.edtConteudoPesquisaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  iDirecao: Integer;
begin

  //habilita movimenta��o dos campos com as setas acima/abaixo

  iDirecao := -1;

  case Key of
    VK_DOWN: iDirecao := 0; {Pr�ximo}
    VK_UP: iDirecao   := 1;   {Anterior}
  end;

  if iDirecao <> -1 then
  begin

    Perform(WM_NEXTDLGCTL, iDirecao, 0);
    Key := 0;

  end;

end;

procedure TfrmModNFSaida.edtConteudoPesquisaKeyPress(Sender: TObject; var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end;

end;

procedure TfrmModNFSaida.edtCST_CSOSNExit(Sender: TObject);
begin

  MudarCorEdit(sender);
  LimparMSG_ERRO(lblMsg, imgErro);

  if InserindoEditando(dmMProvider.cdsNFSaida) then
  begin

    dmMProvider.cdsCst.Close;
    dmMProvider.cdsCst.ProviderName := 'dspCst';

    dmDBEXMaster.fdqCst.SQL.Clear;
    dmDBEXMaster.fdqCst.SQL.Add('select * from cst');
    dmDBEXMaster.fdqCst.SQL.Add('where cst = ' + QuotedStr(FormatFloat('000',dmMProvider.cdsItemNFSaidaCST.Value)));

    dmMProvider.cdsCst.Open;
    dmMProvider.cdsCst.ProviderName := '';

    if dmMProvider.cdsCst.IsEmpty then
    begin

      lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA;
      imgErro.Visible := True;
      edtCST_CSOSN.SetFocus;

    end
    else
    begin

      if dmMProvider.cdsNFSaidaDESTINO_OPERACAO.Value = 2 then
      begin

        dmMProvider.cdsEstados.Close;
        dmMProvider.cdsEstados.ProviderName := 'dspEstados';

        dmDBEXMaster.fdqEstados.SQL.Clear;
        dmDBEXMaster.fdqEstados.SQL.Add('select * from estados');
        dmDBEXMaster.fdqEstados.SQL.Add('where sigla = ' + QuotedStr(dmMProvider.cdsNFSaidaUF_DEST.Value));

        dmMProvider.cdsEstados.Open;
        dmMProvider.cdsEstados.ProviderName := '';

        dmMProvider.cdsItemNFSaidaICMS.Value   := dmMProvider.cdsEstadosICMS_INTERESTADUAL.Value;

      end;

      if length(Trim(dmMProvider.cdsNFSaidaINFO_FISCO.Value)) <= 0 then
        dmMProvider.cdsNFSaidaINFO_FISCO.Value := dmMProvider.cdsCstOBSERVACAO.Value
      else
        dmMProvider.cdsNFSaidaINFO_FISCO.Value := dmMProvider.cdsNFSaidaINFO_FISCO.Value + ', ' + dmMProvider.cdsCstOBSERVACAO.Value;

      RelacionarFCP_Estados;

      CalcularValoresItens;

    end;

  end;

end;

procedure TfrmModNFSaida.edtDataSaidaExit(Sender: TObject);
begin

  LimparMSG_ERRO(lblMsg, imgErro);

  if InserindoEditando(dmMProvider.cdsNFSaida) then
  begin

    try

      if dmMProvider.cdsNFSaidaSAIDA.Value < dmMProvider.cdsNFSaidaEMISSAO.Value then
      begin

        lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_DATA_SAIDA_MENOR_EMISSAO;
        imgErro.Visible := True;
        edtDataSaida.SetFocus;

      end;

    except

    on E: exception do
    begin

      lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_DATA_INVALIDA;
      imgErro.Visible := True;
      Application.ProcessMessages;

      edtDataSaida.SetFocus;

    end;

    end;

  end;

end;

procedure TfrmModNFSaida.edtIsentasNT_STExit(Sender: TObject);
begin

  MudarCorEdit(sender);

end;

procedure TfrmModNFSaida.edtItemPedidoCompraExit(Sender: TObject);
begin

  MudarCorEdit(sender);

  LimparMSG_ERRO(lblMsg, nil);

  if Length(Trim(dmMProvider.cdsItemNFSaidaPEDIDO_DE_COMPRA.Value)) > 0 then
  begin

    if dmMProvider.cdsItemNFSaidaNUMERO_ITEM_EDIDO_COMPRA.Value <= 0 then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_NUM_ITEM_OBRIGATORIO;
      Application.ProcessMessages;
      edtItemPedidoCompra.SetFocus;

    end;

  end;

end;

procedure TfrmModNFSaida.edtNCMExit(Sender: TObject);
begin

  MudarCorEdit(sender);
  LimparMSG_ERRO(lblMsg, imgErro);

  if InserindoEditando(dmMProvider.cdsItemNFSaida) then
  begin

    if Length(Trim(edtNCM.Text)) > 0 then
    begin

      if ValidarNCM(Trim(edtNCM.Text)) then
      begin

        dmMProvider.cdsItemNFSaidaCARGA_NAC_FEDERAL.Value       := dmMProvider.cdsNcmNbsCARGA_NAC_FEDERAL.Value;
        dmMProvider.cdsItemNFSaidaCARGA_IMP_FEDERAL.Value       := dmMProvider.cdsNcmNbsCARGA_IMP_FEDERAL.Value;
        dmMProvider.cdsItemNFSaidaCARGA_ESTADUAL.Value          := dmMProvider.cdsNcmNbsCARGA_ESTADUAL.Value;
        dmMProvider.cdsItemNFSaidaCARGA_MUNICIPAL.Value         := dmMProvider.cdsNcmNbsCARGA_MUNICIPAL.Value;
        dmMProvider.cdsItemNFSaidaASSINATURA_IBPT.Value         := dmMProvider.cdsNcmNbsCHAVE.Value;
        dmMProvider.cdsItemNFSaidaFONTE_CARGA_TRIBUTARIA.Value  := dmMProvider.cdsNcmNbsFONTE.Value;

        if Length(Trim(dmMProvider.cdsItemNFSaidaCEST.Value)) <= 7 then
          dmMProvider.cdsItemNFSaidaCEST.Value := dmMProvider.cdsNcmNbsTABELA_CEST.Value;

        RelacionarFCP_Estados;

      end;

    end
    else
    begin

      lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_CAMPO_OBRIGATORIO;
      imgErro.Visible := true;
      edtNCM.SetFocus;
      Application.ProcessMessages;

    end;

  end;

end;

procedure TfrmModNFSaida.edtNCMKeyPress(Sender: TObject; var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end
  else if not(Key in ['0' .. '9', Chr(8)]) then
    Key := #0;

end;

procedure TfrmModNFSaida.edtNumeroNotaChange(Sender: TObject);
begin

  AtualizaDescricaoStatus;
  grpDataSaida.Enabled  := Length(Trim(dmMProvider.cdsNFSaidaNUMERO_DANFE.Value)) <= 0;
  grpHoraSaida.Enabled  := grpDataSaida.Enabled;

end;

procedure TfrmModNFSaida.edtPercDescontoItemExit(Sender: TObject);
begin

  MudarCorEdit(sender);
  if InserindoEditando(dmMProvider.cdsItemNFSaida) then
    CalcularValoresItens;

end;

procedure TfrmModNFSaida.edtPercFCPUFDestinoItemExit(Sender: TObject);
begin

  MudarCorEdit(sender);

  if InserindoEditando(dmMProvider.cdsItemNFSaida) then
  begin

    CalcularFCP;
    actGravarItemExecute(self);

  end;

end;

procedure TfrmModNFSaida.edtPercIPIDevolvidoItemExit(Sender: TObject);
begin

  MudarCorEdit(sender);

{03/03/2016

  if InserindoEditando(dmMProvider.cdsItemNFSaida) then
  begin

    dmMProvider.cdsItemNFSaidaVALOR_IPI_DEVOLVIDO.Value := dmMProvider.cdsItemNFSaidaBASE_ICMS.Value * (dmMProvider.cdsItemNFSaidaPERCENTUAL_IPI_DEVOLVIDO.Value / 100);

    CalcularValoresItens;

  end;

}

end;

procedure TfrmModNFSaida.edtPercIPIItemExit(Sender: TObject);
begin

  MudarCorEdit(sender);

  if InserindoEditando(dmMProvider.cdsItemNFSaida) then
  begin

    dmMProvider.cdsItemNFSaidaVALOR_IPI.Value := dmMProvider.cdsItemNFSaidaBASE_IPI.Value * (dmMProvider.cdsItemNFSaidaIPI.Value / 100);

    CalcularValoresItens;

  end;

end;

procedure TfrmModNFSaida.edtPlacaExit(Sender: TObject);
begin

  MudarCorEdit(sender);
  LimparMSG_ERRO(lblMsg, nil);

  if InserindoEditando(dmMProvider.cdsNFSaida) then
  begin

    if Length(Trim(edtPlaca.Text)) > 0 then
    begin

      if not Valida��o_Generica(ord(erPlacaVeiculo), edtPlaca.Text) then
      begin

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', placa informada n�o est� no formato adequado: AAA9999 !';
        Application.ProcessMessages;
        edtPlaca.SetFocus;

      end;

    end;

  end;

end;

procedure TfrmModNFSaida.edtQuantidadeExit(Sender: TObject);
begin

  MudarCorEdit(sender);

  if InserindoEditando(dmMProvider.cdsItemNFSaida) then
  begin

    if dmMProvider.cdsItemNFSaidaQUANTIDADE.Value <= 0 then
      dmMProvider.cdsItemNFSaidaQUANTIDADE.Value := 1;

    dmMProvider.cdsItemNFSaidaQUANTIDADE_TRIBUTAVEL.Value := dmMProvider.cdsItemNFSaidaQUANTIDADE.Value;

    CalcularValoresItens;

  end;

end;

procedure TfrmModNFSaida.edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
begin

  if Key = FormatSettings.DecimalSeparator then
    Key := ',';

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end;

end;

procedure TfrmModNFSaida.edtValorICMSDiferidoExit(Sender: TObject);
begin

  MudarCorEdit(sender);

end;

procedure TfrmModNFSaida.edtValorIcmsItemExit(Sender: TObject);
begin

  MudarCorEdit(sender);

  if grpPartilhaFCP.Enabled then
    edtAliqInternaDestino.SetFocus
  else
    actGravarItemExecute(self);

end;

procedure TfrmModNFSaida.edtValorIPIDevolvidoItemExit(Sender: TObject);
begin

  MudarCorEdit(sender);

{
  if InserindoEditando(dmMProvider.cdsItemNFSaida) then

    CalcularValoresItens;
}
end;

procedure TfrmModNFSaida.edtValorIPIItemExit(Sender: TObject);
begin

  MudarCorEdit(sender);

  if InserindoEditando(dmMProvider.cdsItemNFSaida) then
    CalcularValoresItens;

end;

procedure TfrmModNFSaida.edtvalorSeguroItemExit(Sender: TObject);
begin

  MudarCorEdit(sender);

  if dmMProvider.cdsNFSaidaDESTINO_OPERACAO.Value = 2 then
    dmMProvider.cdsItemNFSaidaALIQUOTA_ICMS_INTERESTADUAL.Value := dmMProvider.cdsItemNFSaidaICMS.Value;

  if InserindoEditando(dmMProvider.cdsItemNFSaida) then
    CalcularValoresItens;

end;

procedure TfrmModNFSaida.edtvalorUnitarioExit(Sender: TObject);
begin

  MudarCorEdit(sender);

  if InserindoEditando(dmMProvider.cdsItemNFSaida) then
  begin

{    if dmMProvider.cdsItemNFSaidaVALORUNITARIO.AsFloat <= 0 then
      dmMProvider.cdsItemNFSaidaVALORUNITARIO.AsFloat := 1;
}
    dmMProvider.cdsItemNFSaidaVALOR_UNITARIO_TRIBUTAVEL.AsFloat := dmMProvider.cdsItemNFSaidaVALORUNITARIO.AsFloat;

    CalcularValoresItens;

  end;

end;

procedure TfrmModNFSaida.FecharTabelas;
begin

  dmMProvider.cdsNFSaida.EnableControls;
  dmMProvider.cdsParcelasNFS.EnableControls;
  dmMProvider.cdsItemNFSaida.EnableControls;
  dmMProvider.cdsCFOP_NFSaida.EnableControls;
  dmMProvider.cdsTransportadoraNFS.EnableControls;

  dmMProvider.cdsParcelasNFS.Close;
  dmMProvider.cdsItemNFSaida.Close;
  dmMProvider.cdsCFOP_NFSaida.Close;
  dmMProvider.cdsDocumentoRef_NFS.Close;
  dmMProvider.cdsTransportadoraNFS.Close;

end;

procedure TfrmModNFSaida.FormCreate(Sender: TObject);
var
  i:integer;
begin

  DesabilitarBotaoFecharForm(self.Handle);

  Color                           := COR_PADRAO_TELAS;
  Caption                         := ' ' + Application.Title + ' - ' + PREFIXO_VERSAO + RetornarVersao(ParamStr(0),1);

  dmDBEXMaster.sNomeUsuario       := ParamStr(1);
  dmDBEXMaster.sSenha             := paramstr(2);
  dmDBEXMaster.iIdUsuario         := StrToInt(ParamStr(3));
  dmDBEXMaster.iIdFilial          := StrToInt(ParamStr(4));

  AbrirTabelas;

  for i := 0 to grdTabela.Columns.Count - 1 do
    grdTabela.Columns[i].Title.Color := COR_TITULO_GRADE;

  for i := 0 to grdCFOPNota.Columns.Count - 1 do
    grdCFOPNota.Columns[i].Title.Color := COR_TITULO_GRADE;

  for i := 0 to grdParcelasNota.Columns.Count - 1 do
    grdParcelasNota.Columns[i].Title.Color := COR_TITULO_GRADE;

  for i := 0 to grdItens.Columns.Count - 1 do
    grdItens.Columns[i].Title.Color := COR_TITULO_GRADE;

  for i := 0 to grdNotasConhecimentoRef.Columns.Count - 1 do
    grdNotasConhecimentoRef.Columns[i].Title.Color := COR_TITULO_GRADE;

  for i := 0 to grdNotasprodutoReferenciada.Columns.Count - 1 do
    grdNotasprodutoReferenciada.Columns[i].Title.Color := COR_TITULO_GRADE;

  for i := 0 to grdCupomFiscalVinculado.Columns.Count - 1 do
    grdCupomFiscalVinculado.Columns[i].Title.Color := COR_TITULO_GRADE;

  pgcNotaFiscal.ActivePageIndex       := 0;
  pgcOutrosTriubutos.ActivePageIndex  := 0;

  MostrarOcultarAbas(False);

  LerconfiguracoesNFE;

  tbsCupomFiscalRef.Enabled     := (dmMProvider.cdsFilialUTILIZA_NFCE.Value = 0);

//  btnRecalc.Visible := (dmDBEXMaster.sNomeUsuario = 'SYSDBA');
//  btnRecalc.Enabled := btnRecalc.Visible;

end;

procedure TfrmModNFSaida.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin

  if key = VK_F5 then
    lblF5Click(self);

  if key = VK_F11 then
  begin

    dmMSProcedure.fdspAtualizarSaldoProduto.Params[0].Value := 0;
    dmMSProcedure.fdspAtualizarSaldoProduto.Params[1].Value := 0; //local movimento

    case dmMProvider.cdsNFSaidaENTRADA_SAIDA.Value of
      0:dmMSProcedure.fdspAtualizarSaldoProduto.Params[2].Value := 1; //operacao
      1:dmMSProcedure.fdspAtualizarSaldoProduto.Params[2].Value := 0; //operacao
    end;

    dmMSProcedure.fdspAtualizarSaldoProduto.Params[3].Value   := dmMProvider.cdsNFSaidaNFSAIDA.Value;
    dmMSProcedure.fdspAtualizarSaldoProduto.Params[4].Value   := null; //barras
    dmMSProcedure.fdspAtualizarSaldoProduto.Params[5].Value   := 0; //quantidade
    dmMSProcedure.fdspAtualizarSaldoProduto.Params[6].Value   := 0; //produto
    dmMSProcedure.fdspAtualizarSaldoProduto.Params[7].Value   := dmDBEXMaster.iIdFilial;
    dmMSProcedure.fdspAtualizarSaldoProduto.Params[8].Value   := dmMProvider.cdsNFSaidaMODELO.Value;
    dmMSProcedure.fdspAtualizarSaldoProduto.Params[9].Value   := dmMProvider.cdsNFSaidaEMISSAO.Value;
    dmMSProcedure.fdspAtualizarSaldoProduto.ExecProc;

    dmMSProcedure.fdspMovimento.Params[1].Value     := dmMProvider.cdsNFSaidaNFSAIDA.Value;
    dmMSProcedure.fdspMovimento.Params[2].Value     := 1;                                           //pela nf saida
    dmMSProcedure.fdspMovimento.Params[3].Value     := dmMProvider.cdsNFSaidaEMISSAO.Value;
    dmMSProcedure.fdspMovimento.Params[4].Value     := Time;
    dmMSProcedure.fdspMovimento.Params[5].Value     := dmDBEXMaster.iIdFilial;
    dmMSProcedure.fdspMovimento.Params[6].Value     := 'EST'+FormatFloat('000000', dmMProvider.cdsNFSaidaNFSAIDA.Value);
    dmMSProcedure.fdspMovimento.Params[7].Value     := Ord(tdNFS);
    dmMSProcedure.fdspMovimento.Params[8].Value     := -1;                                          //ecf
    dmMSProcedure.fdspMovimento.Params[9].Value     := -1;                                          //terminal
    dmMSProcedure.fdspMovimento.Params[10].Value    := null;                                        //cliente
    dmMSProcedure.fdspMovimento.Params[11].Value    := null;                                        //forma de pagamento
    dmMSProcedure.fdspMovimento.Params[12].Value    := null;                                        //pedido de venda
    dmMSProcedure.fdspMovimento.Params[13].Value    := 0;                                           //quantidade
    dmMSProcedure.fdspMovimento.Params[14].Value    := 0;                                           //valor unitario
    dmMSProcedure.fdspMovimento.Params[15].Value    := 0;                                           //cod barras
    dmMSProcedure.fdspMovimento.Params[16].Value    := 0;                                           //subtotal
    dmMSProcedure.fdspMovimento.Params[17].Value    := -1;                                          //fornecedor
    dmMSProcedure.fdspMovimento.Params[18].Value    := 0;                                           //desconto item
    dmMSProcedure.fdspMovimento.Params[19].Value    := 0;                                           //acrescimo item
    dmMSProcedure.fdspMovimento.ExecProc;

    GravarEstornarRegistro50(2); //exclui
    GravarEstornarRegistro54(2); //exclui
    GravarEstornarLivroSaida(1); //inclui

    dmMSProcedure.fdspMaster.StoredProcName := 'EXECUTA_SQL';
    dmMSProcedure.fdspMaster.Prepare;
    // marca a nota como cancelada
    dmMSProcedure.fdspMaster.Params[0].Value   := 'UPDATE NFSAIDA SET STATUS  = 2 '
                                                    + ' WHERE NFSAIDA = '     + InttoStr(dmMProvider.cdsNFSaidaNFSAIDA.Value)
                                                    + ' AND MODELO = '        + QuotedStr(dmMProvider.cdsNFSaidaMODELO.Value)
                                                    + ' AND SERIE = '         + QuotedStr(dmMProvider.cdsNFSaidaSERIE.Value)
                                                    + ' AND DESTINATARIO = '  + IntToStr(dmMProvider.cdsNFSaidaDESTINATARIO.Value);

    dmMSProcedure.fdspMaster.ExecProc;

            dmMSProcedure.fdspMaster.ExecProc;

    dmMSProcedure.fdspMaster.ParamByName('I_SQL').Text  := 'UPDATE EFD_PIS_COFINS_RC100 SET CHV_NFE = '
                                                          + QuotedStr(Copy(dmMProvider.cdsNFSaidaNUMERO_DANFE.Value,4,44))
                                                          + ' WHERE NUM_DOCUMENTO = ' + InttoStr(dmMProvider.cdsNFSaidaNFSAIDA.Value)
                                                          + ' AND COD_MODELO = ' + QuotedStr(dmMProvider.cdsNFSaidaMODELO.Value)
                                                          + ' AND SERIE = ' + QuotedStr(Trim(dmMProvider.cdsNFSaidaSERIE.Value))
                                                          + ' AND COD_PARTICIPANTE = ' + QuotedStr(dmMProvider.cdsNFSaidaDESTINATARIO_.Value);

    dmMSProcedure.fdspMaster.ExecProc;

    dmMSProcedure.fdspMaster.Params[0].Value   := 'UPDATE EFD_PIS_COFINS_RC100 SET COD_SITUACAO = 1'  + ' WHERE CHV_NFE = ' + QuotedStr(Copy(dmMProvider.cdsNFSaidaNUMERO_DANFE.Value,4,44));
    dmMSProcedure.fdspMaster.ExecProc;

    GravarEstornarRegistro50(3); //inclui

  end;

{  if key = VK_F12 then
  begin

    SHOWMESSAGE('50');
    GravarEstornarRegistro50(2);
    SHOWMESSAGE('54');
    GravarEstornarRegistro54(2);
    SHOWMESSAGE('50-1');
    GravarEstornarRegistro50(1);
    SHOWMESSAGE('54-1');
    GravarEstornarRegistro54(1);

  end;
}
end;

procedure TfrmModNFSaida.FormKeyPress(Sender: TObject; var Key: Char);
begin

  if (UpperCase(key) = 'S') and (lblMsg.Tag = -1) then
  begin

    Key         := #0;
    lblMsg.Tag  := 0;
    actExcluirExecute(self);

  end
  else if (UpperCase(Key) = 'S') and (lblMsg.Tag = ord(ExcluirTransportadorNFS)) then
  begin

    Man_Tab_TransportadoraNFS(1);
    RelacionarTransportador_NFS;

  end

  else if (UpperCase(Key) = 'S') and (lblMsg.Tag = ord(ExcluirDocRefNFS)) then
  begin

    Key         := #0;
    lblMsg.Tag  := ord(nulo);
    actExcluirDocRefNFSExecute(self);

  end else if (UpperCase(Key) = 'S') and (lblMsg.Tag = ord(pExcluirCFOP_NF)) then
  begin

    Key         := #0;
    lblMsg.Tag  := ord(nulo);
    actExcluirCFOPExecute(self);

  end else if (UpperCase(Key) = 'S') and (lblMsg.Tag = ord(ExcluirItemNFS))
  then
  begin

    Key         := #0;
    lblMsg.Tag  := ord(nulo);
    actExcluirItemNFSExecute(self);

  end else if (UpperCase(key) = 'S') and (lblMsg.Tag = 1) then
  begin

    Key         := #0;
    lblMsg.Tag  := 0;
    actConfirmarExecute(self);

  end
  else if (UpperCase(key) = 'S') and (lblMsg.Tag = 2) then
  begin

    key         := #0;
    lblMsg.Tag  := 0;
    actEstornoExecute(self);

  end
  else if (UpperCase(key) = 'N') and (lblMsg.Tag  <> 0)then
  begin

    key         := #0;
    lblMsg.Tag  := 0;
    LimparMSG_ERRO(lblMsg, imgErro);

  end;

end;

procedure TfrmModNFSaida.FormShow(Sender: TObject);
var
  R : TRect;
begin
  {

    Coloca a aplica��o em tela cheia

  }

{  SystemParametersInfo(SPI_GETWORKAREA, 0, @R,0);
  SetBounds(R.Left, R.Top, R.Right-R.Left, R.Bottom-R.Top);
}
end;

function TfrmModNFSaida.GerarMovimento(pOpcao:smallint):boolean;
begin

  try

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_GERANDO_MOVIMENTO_PROD;
    Application.ProcessMessages;

    dmMSProcedure.fdspMovimento.Params[0].Value   := 1; // incluir
    dmMSProcedure.fdspMovimento.Params[1].Value   := dmMProvider.cdsNFSaidaNFSAIDA.Value;
    dmMSProcedure.fdspMovimento.Params[2].Value   := 1; // pela nf saida

    if pOpcao = 0 then  //lan�amento
    begin

      dmMSProcedure.fdspMovimento.Params[3].Value := dmMProvider.cdsNFSaidaEMISSAO.Value;
      dmMSProcedure.fdspMovimento.Params[6].Value := FormatFloat('000000',dmMProvider.cdsNFSaidaNFSAIDA.Value);

    end
    else                //estorno
    begin

      dmMSProcedure.fdspMovimento.Params[3].Value := Date;
      dmMSProcedure.fdspMovimento.Params[6].Value := 'EST-NF' + IntToStr(dmMProvider.cdsNFSaidaNFSAIDA.Value);

    end;

    dmMSProcedure.fdspMovimento.Params[4].Value   := Time;
    dmMSProcedure.fdspMovimento.Params[5].Value   := dmDBEXMaster.iIdFilial;
    dmMSProcedure.fdspMovimento.Params[7].Value   := Ord(tdNFS);

    dmMSProcedure.fdspMovimento.Params[8].Value   := -1;
    dmMSProcedure.fdspMovimento.Params[9].Value   := -1;
    dmMSProcedure.fdspMovimento.Params[10].Value  := dmMProvider.cdsNFSaidaDESTINATARIO.Value;
    dmMSProcedure.fdspMovimento.Params[11].Value  := dmMProvider.cdsNFSaidaFORMAPAGAMENTO.Value;
    dmMSProcedure.fdspMovimento.Params[12].Value  := null;  //numero do pedido de venda
    dmMSProcedure.fdspMovimento.Params[13].Value  := 0;     //quantidade
    dmMSProcedure.fdspMovimento.Params[14].Value  := 0;     //valor unitario
    dmMSProcedure.fdspMovimento.Params[15].Value  := null;  //barras
    dmMSProcedure.fdspMovimento.Params[16].Value  := dmMProvider.cdsItemNFSaidaSUB_TOTAL.Value;
    dmMSProcedure.fdspMovimento.Params[17].Value  := -1;    //fornecedor
    dmMSProcedure.fdspMovimento.Params[18].Value  := 0;     //valor desconto item
    dmMSProcedure.fdspMovimento.Params[19].Value  := 0;     //valor acr�scimo item
    dmMSProcedure.fdspMovimento.ExecProc;

    Result := True;

  except
  on E: exception do
    begin

      Result          := False;
      lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + Tratar_Erro_Conexao(E);
      imgErro.Visible := True;
      Application.ProcessMessages;

    end;

  end;

end;

function TfrmModNFSaida.GerarProximoNumeroNF: integer;
begin

  try

    dmMProvider.cdsConfiguracoes.Close;
    dmMProvider.cdsConfiguracoes.ProviderName := 'dspConfiguracoes';

    dmMProvider.cdsConfiguracoes.Open;
    dmMProvider.cdsConfiguracoes.ProviderName := '';

    dmMProvider.cdsConfiguracoes.Edit;
    dmMProvider.cdsConfiguracoesULTIMANOTAFISCALIMPRESSA.Value := dmMProvider.cdsConfiguracoesULTIMANOTAFISCALIMPRESSA.Value + 1;
    dmMProvider.cdsConfiguracoes.Post;

    dmMSProcedure.fdspMaster.StoredProcName   := 'EXECUTA_SQL';
    dmMSProcedure.fdspMaster.Prepare;

    dmMSProcedure.fdspMaster.Params[0].Value  := 'UPDATE CONFIGURACOES SET ULTIMANOTAFISCALIMPRESSA = ' + IntToStr(dmMProvider.cdsConfiguracoesULTIMANOTAFISCALIMPRESSA.Value);
    dmMSProcedure.fdspMaster.ExecProc;

    Result := dmMProvider.cdsConfiguracoesULTIMANOTAFISCALIMPRESSA.Value;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

  except
    on E: exception do
    begin

      if dmDBEXMaster.fdtMaster.Active then
        dmDBEXMaster.fdtMaster.Rollback;

      lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + Tratar_Erro_Conexao(E);
      imgErro.Visible := True;
      Application.ProcessMessages;
      Result          := 0;

    end;

  end;

end;

function TfrmModNFSaida.GravarCRE(pOpcao: smallint): boolean;
begin

  try

    if not dmMProvider.cdsParcelasNFS.IsEmpty then
    begin

      frmInformacoesCRE_NFS := TfrmInformacoesCRE_NFS.Create(self);

      if pOpcao = 1 then //estorna cre
      begin

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_ESTORNANDO_CRE;
        Application.ProcessMessages;

        dmMSProcedure.fdspCre.Params[0].Value    := pOpcao;
        dmMSProcedure.fdspCre.Params[1].Value    := -1;
        dmMSProcedure.fdspCre.Params[2].Value    := dmDBEXMaster.iIdFilial;
        dmMSProcedure.fdspCre.Params[3].Value    := dmMProvider.cdsParcelasNFSDOCUMENTO.AsString;
        dmMSProcedure.fdspCre.Params[4].Value    := 0;
        dmMSProcedure.fdspCre.Params[5].Value    := Date;
        dmMSProcedure.fdspCre.Params[6].Value    := dmMProvider.cdsNFSaidaDESTINATARIO.Value;
        dmMSProcedure.fdspCre.Params[7].Value    := 0;
        dmMSProcedure.fdspCre.Params[8].Value    := dmMProvider.cdsNFSaidaEMISSAO.Value;
        dmMSProcedure.fdspCre.Params[9].Value    := dmMProvider.cdsParcelasNFSVENCIMENTO.Value;
        dmMSProcedure.fdspCre.Params[10].Value   := 0;
        dmMSProcedure.fdspCre.Params[11].Value   := dmMProvider.cdsParcelasNFSVALOR.Value;

        case dmMProvider.cdsConfiguracoesTIPOMULTA.Value of
          0:dmMSProcedure.fdspCre.Params[12].Value   := dmMProvider.cdsConfiguracoesMORADIARIA.Value;
          1:dmMSProcedure.fdspCre.Params[12].Value   := dmMProvider.cdsNFSaidaVALORDANOTA.Value;
        end;

        dmMSProcedure.fdspCre.Params[13].Value   := 0;
        dmMSProcedure.fdspCre.Params[14].Value   := null;
        dmMSProcedure.fdspCre.Params[15].Value   := 'LANCAMENTO VIA NOTA FISCAL DE SAIDA N: ' + FormatFloat('000000', dmMProvider.cdsNFSaidaNFSAIDA.Value);
        dmMSProcedure.fdspCre.Params[16].Value   := 0;
        dmMSProcedure.fdspCre.Params[17].Value   := 0;
        dmMSProcedure.fdspCre.Params[18].Value   := 0;
        dmMSProcedure.fdspCre.Params[19].Value   := 0;
        dmMSProcedure.fdspCre.Params[20].Value   := dmMProvider.cdsPlanoContasPLANODECONTAS.Value;
        dmMSProcedure.fdspCre.Params[21].Value   := dmMProvider.cdsItemPlContasITEMPLANODECONTAS.Value;
        dmMSProcedure.fdspCre.Params[22].Value   := dmMProvider.cdsLancamentosLANCAMENTO.Value;
        dmMSProcedure.fdspCre.Params[23].Value   := rdgTipoCobranca.ItemIndex;
        dmMSProcedure.fdspCre.Params[24].Value   := dmMProvider.cdsContaCorrenteCONTA.Value;
        dmMSProcedure.fdspCre.Params[25].Value   := '11';
        dmMSProcedure.fdspCre.Params[26].Value   := 0;
        dmMSProcedure.fdspCre.Params[27].Value   := null;
        dmMSProcedure.fdspCre.Params[28].Value   := Date;
        dmMSProcedure.fdspCre.Params[29].Value   := 0;
        dmMSProcedure.fdspCre.Params[30].Value   := 0;
        dmMSProcedure.fdspCre.Params[31].Value   := 0;
        dmMSProcedure.fdspCre.Params[32].Value   := dmMProvider.cdsNFSaidaNFSAIDA.Value;
        dmMSProcedure.fdspCre.Params[33].Value   := '';
        dmMSProcedure.fdspCre.Params[34].Value   := 0;
        dmMSProcedure.fdspCre.Params[35].Value   := 0;
        dmMSProcedure.fdspCre.Params[36].Value   := 0;
        dmMSProcedure.fdspCre.ExecProc;

      end
      else
      begin

        lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_GERANDO_CRE;

        Application.ProcessMessages;

        if frmInformacoesCRE_NFS.ShowModal = mrOk then
        begin

          dmMProvider.cdsParcelasNFS.First;

          while not dmMProvider.cdsParcelasNFS.Eof do
          begin

            dmMSProcedure.fdspCre.Params[0].Value    := pOpcao;
            dmMSProcedure.fdspCre.Params[1].Value    := -1;
            dmMSProcedure.fdspCre.Params[2].Value    := dmDBEXMaster.iIdFilial;
            dmMSProcedure.fdspCre.Params[3].Value    := dmMProvider.cdsParcelasNFSDOCUMENTO.AsString;
            dmMSProcedure.fdspCre.Params[4].Value    := 0;
            dmMSProcedure.fdspCre.Params[5].Value    := Date;
            dmMSProcedure.fdspCre.Params[6].Value    := dmMProvider.cdsNFSaidaDESTINATARIO.Value;
            dmMSProcedure.fdspCre.Params[7].Value    := 0;
            dmMSProcedure.fdspCre.Params[8].Value    := dmMProvider.cdsNFSaidaEMISSAO.Value;
            dmMSProcedure.fdspCre.Params[9].Value    := dmMProvider.cdsParcelasNFSVENCIMENTO.Value;
            dmMSProcedure.fdspCre.Params[10].Value   := 0;
            dmMSProcedure.fdspCre.Params[11].Value   := dmMProvider.cdsParcelasNFSVALOR.Value;

            case dmMProvider.cdsConfiguracoesTIPOMULTA.Value of
              0:dmMSProcedure.fdspCre.Params[12].Value   := dmMProvider.cdsConfiguracoesMORADIARIA.Value;
              1:dmMSProcedure.fdspCre.Params[12].Value   := dmMProvider.cdsNFSaidaVALORDANOTA.Value;
            end;

            dmMSProcedure.fdspCre.Params[13].Value   := 0;
            dmMSProcedure.fdspCre.Params[14].Value   := null;
            dmMSProcedure.fdspCre.Params[15].Value   := 'LANCAMENTO VIA NOTA FISCAL DE SAIDA N: ' + FormatFloat('000000', dmMProvider.cdsNFSaidaNFSAIDA.Value);
            dmMSProcedure.fdspCre.Params[16].Value   := 0;
            dmMSProcedure.fdspCre.Params[17].Value   := 0;
            dmMSProcedure.fdspCre.Params[18].Value   := 0;
            dmMSProcedure.fdspCre.Params[19].Value   := 0;
            dmMSProcedure.fdspCre.Params[20].Value   := dmMProvider.cdsPlanoContasPLANODECONTAS.Value;
            dmMSProcedure.fdspCre.Params[21].Value   := dmMProvider.cdsItemPlContasITEMPLANODECONTAS.Value;
            dmMSProcedure.fdspCre.Params[22].Value   := dmMProvider.cdsLancamentosLANCAMENTO.Value;
            dmMSProcedure.fdspCre.Params[23].Value   := rdgTipoCobranca.ItemIndex;
            dmMSProcedure.fdspCre.Params[24].Value   := dmMProvider.cdsContaCorrenteCONTA.Value;
            dmMSProcedure.fdspCre.Params[25].Value   := '11';
            dmMSProcedure.fdspCre.Params[26].Value   := 0;
            dmMSProcedure.fdspCre.Params[27].Value   := null;
            dmMSProcedure.fdspCre.Params[28].Value   := Date;
            dmMSProcedure.fdspCre.Params[29].Value   := 0;
            dmMSProcedure.fdspCre.Params[30].Value   := 0;
            dmMSProcedure.fdspCre.Params[31].Value   := 0;
            dmMSProcedure.fdspCre.Params[32].Value   := dmMProvider.cdsNFSaidaNFSAIDA.Value;
            dmMSProcedure.fdspCre.Params[33].Value   := '';
            dmMSProcedure.fdspCre.Params[34].Value   := 0;
            dmMSProcedure.fdspCre.Params[35].Value   := 0;
            dmMSProcedure.fdspCre.Params[36].Value   := 0;
            dmMSProcedure.fdspCre.ExecProc;

            dmMProvider.cdsParcelasNFS.Next;

          end;

      end;

      end;

      FreeAndNil(frmInformacoesCRE_NFS);

    end;

    Result := True;

  except
  on E: exception do
    begin

      Result          := False;
      lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + Tratar_Erro_Conexao(E);
      imgErro.Visible := True;
      Application.ProcessMessages;

    end;

  end;

end;

function TfrmModNFSaida.GravarEstornarLivroSaida(pOpcao: smallint): boolean;
begin

  try
    {

    criar msg de estorno livro de sa�da
    if pOpcao = 1 then //estorna
      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_ESTORNANDO_RC100_SPED
    else
      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_GERANDO_REGC100_SPED;
    Application.ProcessMessages;

    }

    dmMProvider.cdsSelItemNFS_LS.Close;
    dmMProvider.cdsSelItemNFS_LS.ProviderName := 'dspSelItemNFS_LS';

    dmDBEXMaster.fdqSelecionaItensNFSaida_LS.Params[0].Value := dmMProvider.cdsNFSaidaNFSAIDA.Value;

    dmMProvider.cdsSelItemNFS_LS.Open;
    dmMProvider.cdsSelItemNFS_LS.ProviderName := '';

    while not dmMProvider.cdsSelItemNFS_LS.Eof do
    begin

      dmMSProcedure.fdspLivroSaida.Params[0].Value      := pOpcao;
      dmMSProcedure.fdspLivroSaida.Params[1].Value      := -1;      // numero livro
      dmMSProcedure.fdspLivroSaida.Params[2].Value      := dmDBEXMaster.iIdFilial;
      dmMSProcedure.fdspLivroSaida.Params[3].Value      := FormatDateTime('mmyyyy', dmMProvider.cdsNFSaidaEMISSAO.Value);

      if dmMProvider.cdsConfiguracoesMODELO.Value = '01' then
        dmMSProcedure.fdspLivroSaida.Params[4].Value    := 'NF'
      else if dmMProvider.cdsConfiguracoesMODELO.Value = '55' then
        dmMSProcedure.fdspLivroSaida.Params[4].Value    := 'NFE';

      dmMSProcedure.fdspLivroSaida.Params[5].Value      := dmMProvider.cdsNFSaidaSERIE.Value;
      dmMSProcedure.fdspLivroSaida.Params[6].Value      := IntToStr(dmMProvider.cdsNFSaidaNFSAIDA.Value);
      dmMSProcedure.fdspLivroSaida.Params[7].Value      := dmMProvider.cdsNFSaidaEMISSAO.Value;
      dmMSProcedure.fdspLivroSaida.Params[8].Value      := dmMProvider.cdsNFSaidaUF_DEST.Value;
      dmMSProcedure.fdspLivroSaida.Params[9].Value      := dmMProvider.cdsSelItemNFS_LSOP_SUB_TOTAL.Value;
      dmMSProcedure.fdspLivroSaida.Params[10].Value     := 1;
      dmMSProcedure.fdspLivroSaida.Params[11].Value     := dmMProvider.cdsSelItemNFS_LSOP_CFOP.Value;
      dmMSProcedure.fdspLivroSaida.Params[12].Value     := dmMProvider.cdsSelItemNFS_LSOP_BASE_ICMS.Value;
      dmMSProcedure.fdspLivroSaida.Params[13].Value     := dmMProvider.cdsSelItemNFS_LSOP_ALIQUOTA.Value;

      if (dmMProvider.cdsSelItemNFS_LSOP_CFOP.Value = '5202') or (dmMProvider.cdsSelItemNFS_LSOP_CFOP.Value = '6202') then
      begin

        dmMSProcedure.fdspLivroSaida.Params[14].Value   := 0;   // imposto debitado
        dmMSProcedure.fdspLivroSaida.Params[16].Value   := dmMProvider.cdsSelItemNFS_LSOP_SUB_TOTAL.Value;

      end
      else
      begin

        dmMSProcedure.fdspLivroSaida.Params[14].Value   := dmMProvider.cdsSelItemNFS_LSOP_VALOR_ICMS.Value;
        dmMSProcedure.fdspLivroSaida.Params[16].Value   := 0;   // outras

      end;

      dmMSProcedure.fdspLivroSaida.Params[15].Value     := dmMProvider.cdsSelItemNFS_LSOP_ISENTAS_NT.Value;
      dmMSProcedure.fdspLivroSaida.Params[17].Value     := 0;   // totalizador geral ECF
      dmMSProcedure.fdspLivroSaida.Params[18].Value     := 0;   // CRZ
      dmMSProcedure.fdspLivroSaida.Params[19].Value     := 0;   // identifica��o ICMS ou IPI
      dmMSProcedure.fdspLivroSaida.Params[20].Value     := 0;   // observa��o

      dmMSProcedure.fdspLivroSaida.ExecProc;

      dmMProvider.cdsSelItemNFS_LS.Next;

    end;

    Result := True;

  except
  on E: exception do
    begin

      Result          := False;
      lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + Tratar_Erro_Conexao(E);
      imgErro.Visible := True;
      Application.ProcessMessages;

    end;

  end;


end;

function TfrmModNFSaida.GravarEstornarRegistro50(pOpcao: smallint): boolean;
begin

  try

    if pOpcao = 2 then //estorna reg50 sintegra
      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_ESTORNANDO_REG50_SINTEGRA
    else
      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_GERANDO_REG50_SINTEGRA;

    Application.ProcessMessages;

    if pOpcao = 3 then //cancelar nota
      dmMSProcedure.fdspGravarRegistro50_Sintegra.Params[0].Value    := 1
    else
      dmMSProcedure.fdspGravarRegistro50_Sintegra.Params[0].Value    := pOpcao;

    dmMSProcedure.fdspGravarRegistro50_Sintegra.Params[1].Value    := dmMProvider.cdsNFSaidaNFSAIDA.Value;

    if dmMProvider.cdsNFSaidaPAIS_DESTINATARIO.Value <>  dmMProvider.cdsFilialPAIS.Value then
    begin

      dmMSProcedure.fdspGravarRegistro50_Sintegra.Params[2].Value := '00000000000000'; //cnpj
      dmMSProcedure.fdspGravarRegistro50_Sintegra.Params[3].Value := 'ISENTO';         //inscri��o estadual

    end
    else
    begin

      if Length(Trim(dmMProvider.cdsNFSaidaDESTINATARIO_.Value)) <= 11 then
      begin

        dmMSProcedure.fdspGravarRegistro50_Sintegra.Params[2].Value := dmMProvider.cdsNFSaidaDESTINATARIO_.Value;
        dmMSProcedure.fdspGravarRegistro50_Sintegra.Params[3].Value := 'ISENTO';

      end
      else
      begin

        dmMSProcedure.fdspGravarRegistro50_Sintegra.Params[2].Value := dmMProvider.cdsNFSaidaDESTINATARIO_.Value;
        dmMSProcedure.fdspGravarRegistro50_Sintegra.Params[3].Value := dmMProvider.cdsNFSaidaIE_DESTINATARIO.Value;

      end;

    end;

    dmMSProcedure.fdspGravarRegistro50_Sintegra.Params[4].Value    := dmMProvider.cdsNFSaidaEMISSAO.Value;
    dmMSProcedure.fdspGravarRegistro50_Sintegra.Params[5].Value    := dmMProvider.cdsNFSaidaUF_DEST.Value;
    dmMSProcedure.fdspGravarRegistro50_Sintegra.Params[6].Value    := dmMProvider.cdsNFSaidaMODELO.Value;
    dmMSProcedure.fdspGravarRegistro50_Sintegra.Params[7].Value    := dmMProvider.cdsNFSaidaSERIE.Value;
    dmMSProcedure.fdspGravarRegistro50_Sintegra.Params[8].AsString := IntToStr(dmMProvider.cdsNFSaidaNFSAIDA.Value);
    dmMSProcedure.fdspGravarRegistro50_Sintegra.Params[9].AsString := '';    //cfop
    dmMSProcedure.fdspGravarRegistro50_Sintegra.Params[10].Value   := 'P';   //emitente  P-pr�prio
    dmMSProcedure.fdspGravarRegistro50_Sintegra.Params[11].Value   := dmMProvider.cdsNFSaidaVALORDANOTA.Value;
    dmMSProcedure.fdspGravarRegistro50_Sintegra.Params[12].Value   := dmMProvider.cdsNFSaidaBASECALCULOICMS.Value;
    dmMSProcedure.fdspGravarRegistro50_Sintegra.Params[13].Value   := dmMProvider.cdsNFSaidaVALORICMS.Value;
    dmMSProcedure.fdspGravarRegistro50_Sintegra.Params[14].Value   := 0;     //isentas n�o tributadas
    dmMSProcedure.fdspGravarRegistro50_Sintegra.Params[15].Value   := 0;     //outras despesas
    dmMSProcedure.fdspGravarRegistro50_Sintegra.Params[16].Value   := 0;     //aliquota icms
    if pOpcao = 3 then
      dmMSProcedure.fdspGravarRegistro50_Sintegra.Params[17].Value := 'S'   //situacao da nota
    else
      dmMSProcedure.fdspGravarRegistro50_Sintegra.Params[17].Value := 'N';   //situacao da nota
    dmMSProcedure.fdspGravarRegistro50_Sintegra.Params[18].Value   := 0;     //tipo nota
    dmMSProcedure.fdspGravarRegistro50_Sintegra.Params[19].Value   := dmMProvider.cdsNFSaidaEMISSAO.Value;
    dmMSProcedure.fdspGravarRegistro50_Sintegra.Params[20].Value   := 0;     //nf entrada
    dmMSProcedure.fdspGravarRegistro50_Sintegra.Params[21].Value   := 0;     //somar icmsr no total
    dmMSProcedure.fdspGravarRegistro50_Sintegra.Params[22].Value   := -1;    //cst

    if dmMProvider.cdsNFSaidaDESCONTO_ST.Value > 0 then
      dmMSProcedure.fdspGravarRegistro50_Sintegra.Params[23].Value := (dmMProvider.cdsNFSaidaDESCONTO_ST.Value / dmMProvider.cdsNFSaidaVALORDOSPRODUTOS.Value) * 100
    else
      dmMSProcedure.fdspGravarRegistro50_Sintegra.Params[23].Value := 0;

    dmMSProcedure.fdspGravarRegistro50_Sintegra.ExecProc;

    Result := True;

  except
  on E: exception do
    begin

      Result          := False;
      lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + Tratar_Erro_Conexao(E);
      imgErro.Visible := True;
      Application.ProcessMessages;

    end;

  end;

end;

function TfrmModNFSaida.GravarEstornarRegistro54(pOpcao: smallint): boolean;
begin

  try

    dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[0].Value       := pOpcao;
    dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[1].Value       := dmMProvider.cdsNFSaidaNFSAIDA.Value;
    dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[2].Value       := dmMProvider.cdsNFSaidaEMISSAO.Value;

    if dmMProvider.cdsNFSaidaPAIS_DESTINATARIO.Value <>  dmMProvider.cdsFilialPAIS.Value then
      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[3].Value := '00000000000000' //cnpj
    else
      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[3].Value := dmMProvider.cdsNFSaidaDESTINATARIO_.Value;

    dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[4].Value       := dmMProvider.cdsNFSaidaMODELO.Value;
    dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[5].Value       := dmMProvider.cdsNFSaidaSERIE.Value;
    dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[6].Value       := IntToStr(dmMProvider.cdsNFSaidaNFSAIDA.Value);
    dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[7].Value       := 0;  //tipo nota
    dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[8].Value       := dmMProvider.cdsNFSaidaUF_DEST.Value;
    dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[9].Value       := dmMProvider.cdsNFSaidaEMISSAO.Value;
    dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[10].Value      := 0;  //nf entrada
    dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[11].Value      := 0;  //frete
    dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[12].Value      := 0;  //seguro
    dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[13].Value      := 0;  //outras despesas
    dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[14].Value      := 0;  //valor do frete
    dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[15].Value      := 0;  //valor do seguro
    dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[16].Value      := 0;  //valor de outras despesas
    dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[17].Value      := ''; //cfop
    dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[18].Value      := 0;  //somar ipi bc icms
    dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[19].Value      := 0;  //somar icmsr total nf

    if dmMProvider.cdsNFSaidaDESCONTO_ST.Value > 0 then
      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[20].Value := (dmMProvider.cdsNFSaidaDESCONTO_ST.Value / dmMProvider.cdsNFSaidaVALORDOSPRODUTOS.Value) * 100
    else
      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[20].Value := 0;

    dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[21].Value      := 0;  {0   = padrao
                                                                              1   = 991 � identifica o registro do frete;
                                                                              2   = 992 � identifica o registro do seguro;
                                                                              3   = 993 � PIS/COFINS;
                                                                              4   = 994 � Apropriacao de credito de ativo imobilizado;
                                                                              5   = 995 � ressarcimento de substituicao tributaria;
                                                                              6   = 996 � transferencia de credito;
                                                                              7   = 997 � complemento de valor de nota fiscal e ICMS;
                                                                              8   = 998 � servicos nao tributados;
                                                                              9   = 999  - identifica o registro de outras despesas acessOrias;}

    dmMSProcedure.fdspGravarRegistro54_Sintegra.ExecProc;

    if (dmMProvider.cdsNFSaidaVALORDOFRETE.Value > 0) and (dmMProvider.cdsNFSaidaFINALIDADE_NF.Value = 0) then
    begin

      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[0].Value       := pOpcao;
      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[1].Value       := dmMProvider.cdsNFSaidaNFSAIDA.Value;
      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[2].Value       := dmMProvider.cdsNFSaidaEMISSAO.Value;

      if dmMProvider.cdsNFSaidaPAIS_DESTINATARIO.Value <>  dmMProvider.cdsFilialPAIS.Value then
        dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[3].Value := '00000000000000' //cnpj
      else
        dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[3].Value := dmMProvider.cdsNFSaidaDESTINATARIO_.Value;

      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[4].Value       := dmMProvider.cdsNFSaidaMODELO.Value;
      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[5].Value       := dmMProvider.cdsNFSaidaSERIE.Value;
      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[6].Value       := IntToStr(dmMProvider.cdsNFSaidaNFSAIDA.Value);
      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[7].Value       := 0;  //tipo nota
      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[8].Value       := dmMProvider.cdsNFSaidaUF_DEST.Value;
      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[9].Value       := dmMProvider.cdsNFSaidaEMISSAO.Value;
      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[10].Value      := 0;  //nf entrada
      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[11].Value      := 1;  //frete
      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[12].Value      := 0;  //seguro
      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[13].Value      := 0;  //outras despesas
      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[14].Value      := dmMProvider.cdsNFSaidaVALORDOFRETE.Value;
      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[15].Value      := 0;  //valor do seguro
      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[16].Value      := 0;  //valor de outras despesas
      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[17].Value      := ''; //cfop
      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[18].Value      := 0;  //somar ipi bc icms
      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[19].Value      := 0;  //somar icmsr total nf

      if dmMProvider.cdsNFSaidaDESCONTO_ST.Value > 0 then
        dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[20].Value := (dmMProvider.cdsNFSaidaDESCONTO_ST.Value / dmMProvider.cdsNFSaidaVALORDOSPRODUTOS.Value) * 100
      else
        dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[20].Value := 0;

      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[21].Value      := 1;  {0   = padrao
                                                                                1   = 991 � identifica o registro do frete;
                                                                                2   = 992 � identifica o registro do seguro;
                                                                                3   = 993 � PIS/COFINS;
                                                                                4   = 994 � Apropriacao de credito de ativo imobilizado;
                                                                                5   = 995 � ressarcimento de substituicao tributaria;
                                                                                6   = 996 � transferencia de credito;
                                                                                7   = 997 � complemento de valor de nota fiscal e ICMS;
                                                                                8   = 998 � servicos nao tributados;
                                                                                9   = 999  - identifica o registro de outras despesas acessOrias;}

      dmMSProcedure.fdspGravarRegistro54_Sintegra.ExecProc;

    end;

    if (dmMProvider.cdsNFSaidaVALORDOSEGURO.Value > 0) and (dmMProvider.cdsNFSaidaFINALIDADE_NF.Value = 0) then
    begin

      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[0].Value       := pOpcao;
      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[1].Value       := dmMProvider.cdsNFSaidaNFSAIDA.Value;
      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[2].Value       := dmMProvider.cdsNFSaidaEMISSAO.Value;

      if dmMProvider.cdsNFSaidaPAIS_DESTINATARIO.Value <>  dmMProvider.cdsFilialPAIS.Value then
        dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[3].Value := '00000000000000' //cnpj
      else
        dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[3].Value := dmMProvider.cdsNFSaidaDESTINATARIO_.Value;

      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[4].Value       := dmMProvider.cdsNFSaidaMODELO.Value;
      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[5].Value       := dmMProvider.cdsNFSaidaSERIE.Value;
      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[6].Value       := IntToStr(dmMProvider.cdsNFSaidaNFSAIDA.Value);
      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[7].Value       := 0;  //tipo nota
      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[8].Value       := dmMProvider.cdsNFSaidaUF_DEST.Value;
      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[9].Value       := dmMProvider.cdsNFSaidaEMISSAO.Value;
      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[10].Value      := 0;  //nf entrada
      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[11].Value      := 1;  //frete
      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[12].Value      := 0;  //seguro
      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[13].Value      := 0;  //outras despesas
      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[14].Value      := 0;  //valor do frete
      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[15].Value      := dmMProvider.cdsNFSaidaVALORDOSEGURO.Value;
      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[16].Value      := 0;  //valor de outras despesas
      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[17].Value      := ''; //cfop
      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[18].Value      := 0;  //somar ipi bc icms
      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[19].Value      := 0;  //somar icmsr total nf

      if dmMProvider.cdsNFSaidaDESCONTO_ST.Value > 0 then
        dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[20].Value := (dmMProvider.cdsNFSaidaDESCONTO_ST.Value / dmMProvider.cdsNFSaidaVALORDOSPRODUTOS.Value) * 100
      else
        dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[20].Value := 0;

      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[21].Value      := 2;  {0   = padrao
                                                                                1   = 991 � identifica o registro do frete;
                                                                                2   = 992 � identifica o registro do seguro;
                                                                                3   = 993 � PIS/COFINS;
                                                                                4   = 994 � Apropriacao de credito de ativo imobilizado;
                                                                                5   = 995 � ressarcimento de substituicao tributaria;
                                                                                6   = 996 � transferencia de credito;
                                                                                7   = 997 � complemento de valor de nota fiscal e ICMS;
                                                                                8   = 998 � servicos nao tributados;
                                                                                9   = 999  - identifica o registro de outras despesas acessOrias;}

      dmMSProcedure.fdspGravarRegistro54_Sintegra.ExecProc;

    end;

    if (dmMProvider.cdsNFSaidaOUTRASDESPESAS.Value > 0) and (dmMProvider.cdsNFSaidaFINALIDADE_NF.Value = 0) then
    begin

      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[0].Value       := pOpcao;
      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[1].Value       := dmMProvider.cdsNFSaidaNFSAIDA.Value;
      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[2].Value       := dmMProvider.cdsNFSaidaEMISSAO.Value;

      if dmMProvider.cdsNFSaidaPAIS_DESTINATARIO.Value <>  dmMProvider.cdsFilialPAIS.Value then
        dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[3].Value := '00000000000000' //cnpj
      else
        dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[3].Value := dmMProvider.cdsNFSaidaDESTINATARIO_.Value;

      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[4].Value       := dmMProvider.cdsNFSaidaMODELO.Value;
      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[5].Value       := dmMProvider.cdsNFSaidaSERIE.Value;
      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[6].Value       := IntToStr(dmMProvider.cdsNFSaidaNFSAIDA.Value);
      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[7].Value       := 0;  //tipo nota
      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[8].Value       := dmMProvider.cdsNFSaidaUF_DEST.Value;
      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[9].Value       := dmMProvider.cdsNFSaidaEMISSAO.Value;
      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[10].Value      := 0;  //nf entrada
      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[11].Value      := 1;  //frete
      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[12].Value      := 0;  //seguro
      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[13].Value      := 0;  //outras despesas
      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[14].Value      := 0;  //valor do frete
      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[15].Value      := 0;  //OUTRAS DESPESAS
      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[16].Value      := dmMProvider.cdsNFSaidaOUTRASDESPESAS.Value;
      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[17].Value      := ''; //cfop
      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[18].Value      := 0;  //somar ipi bc icms
      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[19].Value      := 0;  //somar icmsr total nf

      if dmMProvider.cdsNFSaidaDESCONTO_ST.Value > 0 then
        dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[20].Value := (dmMProvider.cdsNFSaidaDESCONTO_ST.Value / dmMProvider.cdsNFSaidaVALORDOSPRODUTOS.Value) * 100
      else
        dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[20].Value := 0;

      dmMSProcedure.fdspGravarRegistro54_Sintegra.Params[21].Value      := 9;  {0   = padrao
                                                                                1   = 991 � identifica o registro do frete;
                                                                                2   = 992 � identifica o registro do seguro;
                                                                                3   = 993 � PIS/COFINS;
                                                                                4   = 994 � Apropriacao de credito de ativo imobilizado;
                                                                                5   = 995 � ressarcimento de substituicao tributaria;
                                                                                6   = 996 � transferencia de credito;
                                                                                7   = 997 � complemento de valor de nota fiscal e ICMS;
                                                                                8   = 998 � servicos nao tributados;
                                                                                9   = 999  - identifica o registro de outras despesas acessOrias;}

      dmMSProcedure.fdspGravarRegistro54_Sintegra.ExecProc;

    end;

    Result := True;

  except
  on E: exception do
    begin

      Result          := False;
      lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + Tratar_Erro_Conexao(E);
      imgErro.Visible := True;
      Application.ProcessMessages;

    end;

  end;

end;

function TfrmModNFSaida.GravarEstornarRegistroC100(pOpcao, pCancelada: smallint): boolean;
begin

  try

    if pOpcao = 1 then //estorna rc100 sped
      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_ESTORNANDO_RC100_SPED
    else
      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_GERANDO_REGC100_SPED;

    Application.ProcessMessages;

    dmMSProcedure.fdspGravarRegistroC100SPED.Params[0].Value    := pOpcao;
    dmMSProcedure.fdspGravarRegistroC100SPED.Params[1].Value    := 1;
    dmMSProcedure.fdspGravarRegistroC100SPED.Params[2].Value    := dmMProvider.cdsNFSaidaDESTINATARIO_.Value;
    dmMSProcedure.fdspGravarRegistroC100SPED.Params[3].Value    := IntToStr(dmMProvider.cdsNFSaidaNFSAIDA.Value);
    dmMSProcedure.fdspGravarRegistroC100SPED.Params[4].Value    := dmMProvider.cdsNFSaidaSERIE.Value;
    dmMSProcedure.fdspGravarRegistroC100SPED.Params[5].Value    := dmMProvider.cdsNFSaidaMODELO.Value;
    dmMSProcedure.fdspGravarRegistroC100SPED.Params[6].Value    := dmMProvider.cdsFilialCNPJ.Value;

    if dmMProvider.cdsParcelasNFS.IsEmpty then
      dmMSProcedure.fdspGravarRegistroC100SPED.Params[7].Value  := 0
    else if dmMProvider.cdsParcelasNFSVENCIMENTO.Value > dmMProvider.cdsNFSaidaEMISSAO.Value then
      dmMSProcedure.fdspGravarRegistroC100SPED.Params[7].Value  := 1
    else if dmMProvider.cdsParcelasNFSVENCIMENTO.Value = dmMProvider.cdsNFSaidaEMISSAO.Value then
      dmMSProcedure.fdspGravarRegistroC100SPED.Params[7].Value  := 0
    else
      dmMSProcedure.fdspGravarRegistroC100SPED.Params[7].Value  := 3;

    dmMSProcedure.fdspGravarRegistroC100SPED.Params[8].Value    := dmMProvider.cdsNFSaidaDESTINATARIO.Value;
    dmMSProcedure.fdspGravarRegistroC100SPED.Params[9].Value    := 0;
    dmMSProcedure.fdspGravarRegistroC100SPED.Params[10].Value   := -1;

    if dmMProvider.cdsNFSaidaFINALIDADE_NF.Value > 0 then
      dmMSProcedure.fdspGravarRegistroC100SPED.Params[11].Value := dmMProvider.cdsNFSaidaFINALIDADE_NF.Value
    else
      dmMSProcedure.fdspGravarRegistroC100SPED.Params[11].Value := dmMProvider.cdsNFSaidaSTATUS.Value;

    dmMSProcedure.fdspGravarRegistroC100SPED.Params[12].Value   := Trim(Copy(dmMProvider.cdsNFSaidaNUMERO_DANFE.Value,4,Length(dmMProvider.cdsNFSaidaNUMERO_DANFE.Value)));
    dmMSProcedure.fdspGravarRegistroC100SPED.Params[13].Value   := dmMProvider.cdsNFSaidaEMISSAO.Value;
    dmMSProcedure.fdspGravarRegistroC100SPED.Params[14].Value   := dmMProvider.cdsNFSaidaEMISSAO.Value;
    dmMSProcedure.fdspGravarRegistroC100SPED.Params[15].Value   := dmMProvider.cdsNFSaidaTIPOFRETE.Value;
    dmMSProcedure.fdspGravarRegistroC100SPED.Params[16].Value   := 0;
    dmMSProcedure.fdspGravarRegistroC100SPED.Params[17].Value   := dmMProvider.cdsFilialPERFIL_SPED.Value;

    if dmMProvider.cdsNFSaidaENTRADA_SAIDA.Value = 0 then
      dmMSProcedure.fdspGravarRegistroC100SPED.Params[18].Value  := 1  //sa�da
    else
      dmMSProcedure.fdspGravarRegistroC100SPED.Params[18].Value  := 0; //entrada

    dmMSProcedure.fdspGravarRegistroC100SPED.ExecProc;


    if dmMProvider.cdsNFSaidaSTATUS.Value <= 1 then
    begin

      if not dmMProvider.cdsParcelasNFS.IsEmpty then
      begin

        if dmMProvider.cdsNFSaidaMODELO.Value <> '55' then
        begin

          if pOpcao = 1 then //estorna rc140 sped
            lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_ESTORNANDO_RC140_SPED
          else
            lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_GERANDO_REGC140_SPED;

          Application.ProcessMessages;

          dmMSProcedure.fdspGravarRegistroC140SPED.Params[0].Value  := pOpcao;
          dmMSProcedure.fdspGravarRegistroC140SPED.Params[1].Value  := -1;
          dmMSProcedure.fdspGravarRegistroC140SPED.Params[2].Value  := dmMProvider.cdsNFSaidaNFSAIDA.Value;
          dmMSProcedure.fdspGravarRegistroC140SPED.Params[3].Value  := dmMProvider.cdsParcelasNFS.RecordCount;
          dmMSProcedure.fdspGravarRegistroC140SPED.Params[4].Value  := IntToStr(dmMProvider.cdsNFSaidaNFSAIDA.Value);
          dmMSProcedure.fdspGravarRegistroC140SPED.Params[5].Value  := dmMProvider.cdsNFSaidaDESTINATARIO_.Value;
          dmMSProcedure.fdspGravarRegistroC140SPED.ExecProc;

          if pOpcao = 1 then //estorna rc141 sped
            lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_ESTORNANDO_RC141_SPED
          else
            lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_GERANDO_REGC141_SPED;

          Application.ProcessMessages;

          dmMSProcedure.fdspGravarRegistroC141SPED.Params[0].Value  := pOpcao;
          dmMSProcedure.fdspGravarRegistroC141SPED.Params[1].Value  := -1;
          dmMSProcedure.fdspGravarRegistroC141SPED.Params[2].Value  := dmMProvider.cdsNFSaidaNFSAIDA.Value;
          dmMSProcedure.fdspGravarRegistroC141SPED.Params[3].Value  := dmMProvider.cdsNFSaidaDESTINATARIO_.Value;
          dmMSProcedure.fdspGravarRegistroC141SPED.Params[4].Value  := dmMProvider.cdsNFSaidaMODELO.Value;
          dmMSProcedure.fdspGravarRegistroC141SPED.Params[5].Value  := dmMProvider.cdsNFSaidaSERIE.Value;
          dmMSProcedure.fdspGravarRegistroC141SPED.Params[6].Value  := dmMProvider.cdsParcelasNFSVENCIMENTO.Value;
          dmMSProcedure.fdspGravarRegistroC141SPED.Params[7].Value  := dmMProvider.cdsParcelasNFSVALOR.Value;
          dmMSProcedure.fdspGravarRegistroC141SPED.ExecProc;

        end;

      end;

      if (dmMProvider.cdsCfop_NFSaida.FieldByName('CFOP').Value <> '5929') or (dmMProvider.cdsCfop_NFSaida.FieldByName('CFOP').Value = '6929') then
      begin

        if GravarEstornarRegistroC170(pOpcao) then
          Result :=  GravarEstornarRegistroC190(pOpcao)
        else
          Result := False;

      end
      else
        Result :=  GravarEstornarRegistroC190(pOpcao)

    end;

  except
  on E: exception do
    begin

      Result          := False;
      lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + Tratar_Erro_Conexao(E);
      imgErro.Visible := True;
      Application.ProcessMessages;

    end;


  end;

end;

function TfrmModNFSaida.GravarEstornarRegistroC101(pOpcao, pCancelada: smallint): boolean;
begin

  LimparMSG_ERRO(lblMsg, imgErro);

  try

    if pOpcao = 1 then //estorna rc100 sped
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_ESTORNANDO_RC101_SPED;
      Application.ProcessMessages;

      dmMSProcedure.fdspMan_Tab_RC101.Params[0].Value := pOpcao;
      dmMSProcedure.fdspMan_Tab_RC101.Params[1].Value := dmMProvider.cdsNFSaidaEMISSAO.Value;
      dmMSProcedure.fdspMan_Tab_RC101.Params[2].Value := dmMProvider.cdsNFSaidaNFSAIDA.Value;
      dmMSProcedure.fdspMan_Tab_RC101.Params[3].Value := dmMProvider.cdsNFSaidaMODELO.Value;
      dmMSProcedure.fdspMan_Tab_RC101.Params[4].Value := dmMProvider.cdsNFSaidaSERIE.Value;
      dmMSProcedure.fdspMan_Tab_RC101.Params[5].Value := dmDBEXMaster.iIdFilial;
      dmMSProcedure.fdspMan_Tab_RC101.Params[6].Value := 0;
      dmMSProcedure.fdspMan_Tab_RC101.Params[7].Value := 0;
      dmMSProcedure.fdspMan_Tab_RC101.Params[8].Value := 0;
      dmMSProcedure.fdspMan_Tab_RC101.ExecProc;

    end
    else if Length(Trim(dmMProvider.cdsNFSaidaNUMERO_DANFE.Value)) > 0 then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_GERANDO_REGC100_SPED;
      Application.ProcessMessages;

      dmMSProcedure.fdspGravarRegistroC101SPED.Params[0].Value := dmMProvider.cdsNFSaidaEMISSAO.Value;
      dmMSProcedure.fdspGravarRegistroC101SPED.Params[1].Value := dmMProvider.cdsNFSaidaNFSAIDA.Value;
      dmMSProcedure.fdspGravarRegistroC101SPED.Params[2].Value := dmMProvider.cdsNFSaidaMODELO.Value;
      dmMSProcedure.fdspGravarRegistroC101SPED.Params[3].Value := dmMProvider.cdsNFSaidaSERIE.Value;
      dmMSProcedure.fdspGravarRegistroC101SPED.Params[4].Value := dmDBEXMaster.iIdFilial;
      dmMSProcedure.fdspGravarRegistroC101SPED.ExecProc;

    end;

    Result          := True;

  except
  on E: exception do
    begin

      Result          := False;
      lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + Tratar_Erro_Conexao(E);
      imgErro.Visible := True;
      Application.ProcessMessages;

    end;

  end;

end;

function TfrmModNFSaida.GravarEstornarRegistroC170(pOpcao: smallint): boolean;
begin

  try

    if pOpcao = 1 then //estorna rc170 sped
      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_ESTORNANDO_RC170_SPED
    else
      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_GERANDO_REGC170_SPED;

    Application.ProcessMessages;

    if dmMProvider.cdsNFSaidaFINALIDADE_NF.Value < 1 then
    begin

      dmMSProcedure.fdspGravarRegistroC170SPED.Params[0].Value      := pOpcao;
      dmMSProcedure.fdspGravarRegistroC170SPED.Params[1].Value      := 1;
      dmMSProcedure.fdspGravarRegistroC170SPED.Params[2].Value      := dmMProvider.cdsNFSaidaEMISSAO.Value;
      dmMSProcedure.fdspGravarRegistroC170SPED.Params[3].Value      := dmMProvider.cdsNFSaidaNFSAIDA.Value;
      dmMSProcedure.fdspGravarRegistroC170SPED.Params[4].Value      := IntToStr(dmMProvider.cdsNFSaidaNFSAIDA.Value);
      dmMSProcedure.fdspGravarRegistroC170SPED.Params[5].Value      := dmMProvider.cdsNFSaidaMODELO.Value;
      dmMSProcedure.fdspGravarRegistroC170SPED.Params[6].Value      := dmMProvider.cdsNFSaidaSERIE.Value;
      dmMSProcedure.fdspGravarRegistroC170SPED.Params[7].Value      := dmMProvider.cdsNFSaidaDESTINATARIO_.Value;
      dmMSProcedure.fdspGravarRegistroC170SPED.Params[8].Value      := 0;

      if dmMProvider.cdsNFSaidaDESCONTO_ST.Value > 0 then
        dmMSProcedure.fdspGravarRegistroC170SPED.Params[9].Value := (dmMProvider.cdsNFSaidaDESCONTO_ST.Value / dmMProvider.cdsNFSaidaVALORDOSPRODUTOS.Value) * 100
      else
        dmMSProcedure.fdspGravarRegistroC170SPED.Params[9].Value := 0;

      dmMSProcedure.fdspGravarRegistroC170SPED.Params[10].Value     := dmMProvider.cdsFilialPERCENTUAL_ICMS_SIMPLES_NAC.Value;
      dmMSProcedure.fdspGravarRegistroC170SPED.Params[11].Value     := dmMProvider.cdsNFSaidaENTRADA_SAIDA.Value;

      if (dmMProvider.cdsNFSaidaMODELO.Value = '55') and (dmMProvider.cdsNFSaidaDESTINATARIO_.Value <> dmMProvider.cdsFilialCNPJ.Value) then
        dmMSProcedure.fdspGravarRegistroC170SPED.ExecProc
      else if dmMProvider.cdsNFSaidaMODELO.Value <> '55' then
        dmMSProcedure.fdspGravarRegistroC170SPED.ExecProc

    end
    else
    begin

      dmMSProcedure.fdspRC170SPEDF.Params[0].Value    := pOpcao;
      dmMSProcedure.fdspRC170SPEDF.Params[1].Value    := dmMProvider.cdsNFSaidaEMISSAO.Value;
      dmMSProcedure.fdspRC170SPEDF.Params[2].Value    := IntToStr(dmMProvider.cdsNFSaidaNFSAIDA.Value);
      dmMSProcedure.fdspRC170SPEDF.Params[3].Value    := dmMProvider.cdsNFSaidaMODELO.Value;
      dmMSProcedure.fdspRC170SPEDF.Params[4].Value    := dmMProvider.cdsNFSaidaSERIE.Value;
      dmMSProcedure.fdspRC170SPEDF.Params[5].Value    := 1;     // numero item
      dmMSProcedure.fdspRC170SPEDF.Params[6].Value    := 'CFOP' + dmMProvider.cdsCFOP_NFSaidaCFOP.Value;

      if (dmMProvider.cdsNFSaidaVALORSUBSTITUICAO.Value > 0) and (dmMProvider.cdsNFSaidaVALORDOIPI.Value > 0) then
        dmMSProcedure.fdspRC170SPEDF.Params[7].Value  := 'COMPLEMENTO DE ICMS-ST/IPI'
      else if dmMProvider.cdsNFSaidaVALORSUBSTITUICAO.Value > 0 then
        dmMSProcedure.fdspRC170SPEDF.Params[7].Value  := 'COMPLEMENTO DE ICMS-ST'
      else if dmMProvider.cdsNFSaidaVALORICMS.Value > 0 then
        dmMSProcedure.fdspRC170SPEDF.Params[7].Value  := 'COMPLEMENTO DE ICMS'
      else if dmMProvider.cdsNFSaidaVALORDOIPI.Value > 0 then
        dmMSProcedure.fdspRC170SPEDF.Params[7].Value  := 'COMPLEMENTO DE IPI'
      else if (dmMProvider.cdsFilialCRT.Value = 1) and  (dmMProvider.cdsNFSaidaOUTRASDESPESAS.Value > 0 )then
        dmMSProcedure.fdspRC170SPEDF.Params[7].Value  := 'COMPLEMENTO DE IPI';

      dmMSProcedure.fdspRC170SPEDF.Params[8].Value    := 0;     // quantidade
      dmMSProcedure.fdspRC170SPEDF.Params[9].Value    := 'R$';  // unidade
      dmMSProcedure.fdspRC170SPEDF.Params[10].Value   := 0;     // valor do item
      dmMSProcedure.fdspRC170SPEDF.Params[11].Value   := 0;     // valor do desconto
      dmMSProcedure.fdspRC170SPEDF.Params[12].Value   := 1;     // indicador de movimenta��o
      dmMSProcedure.fdspRC170SPEDF.Params[13].Value   := 0;     // CST ICMS
      dmMSProcedure.fdspRC170SPEDF.Params[14].Value   := dmMProvider.cdsCFOP_NFSaidaCFOP.Value;
      dmMSProcedure.fdspRC170SPEDF.Params[15].Value   := dmMProvider.cdsCFOP_NFSaidaCFOP.Value;

      if dmMProvider.cdsFilialCRT.Value <> 1 then
      begin

        dmMSProcedure.fdspRC170SPEDF.Params[16].Value   := dmMProvider.cdsNFSaidaBASECALCULOICMS.Value;

        if dmMProvider.cdsNFSaidaVALORICMS.AsCurrency > 0 then
          dmMSProcedure.fdspRC170SPEDF.Params[17].Value   := round(dmMProvider.cdsNFSaidaVALORICMS.Value / (dmMProvider.cdsNFSaidaBASECALCULOICMS.Value / 100))
        else
          dmMSProcedure.fdspRC170SPEDF.Params[17].Value   := 0;

        dmMSProcedure.fdspRC170SPEDF.Params[18].Value   := dmMProvider.cdsNFSaidaVALORICMS.Value;
        dmMSProcedure.fdspRC170SPEDF.Params[19].Value   := dmMProvider.cdsNFSaidaBASESUBSTITUICAO.Value;
        dmMSProcedure.fdspRC170SPEDF.Params[20].Value   := 0;       // aliquota icms st
        dmMSProcedure.fdspRC170SPEDF.Params[21].Value   := dmMProvider.cdsNFSaidaVALORSUBSTITUICAO.Value;
        dmMSProcedure.fdspRC170SPEDF.Params[22].Value   := 0;       // indice de apura��o ipi
        dmMSProcedure.fdspRC170SPEDF.Params[23].Value   := '99';    // cst IPI
        dmMSProcedure.fdspRC170SPEDF.Params[24].Value   := '999';   // cod enquadramento
        dmMSProcedure.fdspRC170SPEDF.Params[25].Value   := 0;       // base calculo IPI
        dmMSProcedure.fdspRC170SPEDF.Params[26].Value   := 0;       // aliquota IPI
        dmMSProcedure.fdspRC170SPEDF.Params[27].Value   := dmMProvider.cdsNFSaidaVALORDOIPI.Value;
        dmMSProcedure.fdspRC170SPEDF.Params[28].Value   := '99';    // cst PIS
        dmMSProcedure.fdspRC170SPEDF.Params[29].Value   := 0;       // bc PIS
        dmMSProcedure.fdspRC170SPEDF.Params[30].Value   := 0;       // aliquota PIS
        dmMSProcedure.fdspRC170SPEDF.Params[31].Value   := 0;       // quantidade BC PIS
        dmMSProcedure.fdspRC170SPEDF.Params[32].Value   := 0;       // valor aliquota PIS
        dmMSProcedure.fdspRC170SPEDF.Params[33].Value   := dmMProvider.cdsNFSaidaVALOR_PIS.Value;
        dmMSProcedure.fdspRC170SPEDF.Params[34].Value   := '99';    // cst COFINS
        dmMSProcedure.fdspRC170SPEDF.Params[35].Value   := 0;       // base calculo COFINS
        dmMSProcedure.fdspRC170SPEDF.Params[36].Value   := 0;       // aliquota COFINS
        dmMSProcedure.fdspRC170SPEDF.Params[37].Value   := 0;       // quantidade BC COFINS
        dmMSProcedure.fdspRC170SPEDF.Params[38].Value   := 0;       // calor aliquota COFINS
        dmMSProcedure.fdspRC170SPEDF.Params[39].Value   := dmMProvider.cdsNFSaidaVALOR_COFINS.Value;
        dmMSProcedure.fdspRC170SPEDF.Params[40].Value   := '';      // codigo da conta anal�tica
        dmMSProcedure.fdspRC170SPEDF.Params[41].Value   := dmMProvider.cdsNFSaidaDESTINATARIO_.Value;
        dmMSProcedure.fdspRC170SPEDF.Params[42].Value   := 0;       // tipo sped

      end
      else
      begin

        dmMSProcedure.fdspRC170SPEDF.Params[16].Value   := 0;       // bc icms
        dmMSProcedure.fdspRC170SPEDF.Params[17].Value   := 0;       // aliquota icms
        dmMSProcedure.fdspRC170SPEDF.Params[18].Value   := 0;       // valor icms
        dmMSProcedure.fdspRC170SPEDF.Params[19].Value   := 0;       // bc substitui��o
        dmMSProcedure.fdspRC170SPEDF.Params[20].Value   := 0;       // aliquota icms st
        dmMSProcedure.fdspRC170SPEDF.Params[21].Value   := 0;       // valor substitui��o
        dmMSProcedure.fdspRC170SPEDF.Params[22].Value   := 0;       // indice de apura��o ipi
        dmMSProcedure.fdspRC170SPEDF.Params[23].Value   := '99';    // cst IPI
        dmMSProcedure.fdspRC170SPEDF.Params[24].Value   := '999';   // cod enquadramento
        dmMSProcedure.fdspRC170SPEDF.Params[25].Value   := 0;       // base calculo IPI
        dmMSProcedure.fdspRC170SPEDF.Params[26].Value   := 0;       // aliquota IPI
        dmMSProcedure.fdspRC170SPEDF.Params[27].Value   := 0;       // valor do IPI
        dmMSProcedure.fdspRC170SPEDF.Params[28].Value   := '99';    // cst PIS
        dmMSProcedure.fdspRC170SPEDF.Params[29].Value   := 0;       // bc PIS
        dmMSProcedure.fdspRC170SPEDF.Params[30].Value   := 0;       // aliquota PIS
        dmMSProcedure.fdspRC170SPEDF.Params[31].Value   := 0;       // quantidade BC PIS
        dmMSProcedure.fdspRC170SPEDF.Params[32].Value   := 0;       // valor aliquota PIS
        dmMSProcedure.fdspRC170SPEDF.Params[33].Value   := 0;       // valor do PIS
        dmMSProcedure.fdspRC170SPEDF.Params[34].Value   := '99';    // cst COFINS
        dmMSProcedure.fdspRC170SPEDF.Params[35].Value   := 0;       // base calculo COFINS
        dmMSProcedure.fdspRC170SPEDF.Params[36].Value   := 0;       // aliquota COFINS
        dmMSProcedure.fdspRC170SPEDF.Params[37].Value   := 0;       // quantidade BC COFINS
        dmMSProcedure.fdspRC170SPEDF.Params[38].Value   := 0;       // calor aliquota COFINS
        dmMSProcedure.fdspRC170SPEDF.Params[39].Value   := 0;       // valor da COFINS
        dmMSProcedure.fdspRC170SPEDF.Params[40].Value   := '';      // codigo da conta anal�tica
        dmMSProcedure.fdspRC170SPEDF.Params[41].Value   := dmMProvider.cdsNFSaidaDESTINATARIO_.Value;
        dmMSProcedure.fdspRC170SPEDF.Params[42].Value   := 0;       // tipo sped

      end;

      dmMSProcedure.fdspRC170SPEDF.ExecProc;

    end;

    Result := true;

  except
  on E: exception do
    begin

      Result          := False;
      lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + Tratar_Erro_Conexao(E);
      imgErro.Visible := True;
      Application.ProcessMessages;

    end;

  end;

end;

function TfrmModNFSaida.GravarEstornarRegistroC190(pOpcao: smallint): boolean;
begin

  try

    if pOpcao = 1 then //estorna rc190 sped
      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_ESTORNANDO_RC190_SPED
    else
      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_GERANDO_REGC190_SPED;

    Application.ProcessMessages;

    if dmMProvider.cdsNFSaidaFINALIDADE_NF.Value < 1 then
    begin

      dmMSProcedure.fdspGravarRegistroC190SPED.Params[0].Value      := pOpcao;
      dmMSProcedure.fdspGravarRegistroC190SPED.Params[1].Value      := 1;       // entrada/sa�da
      dmMSProcedure.fdspGravarRegistroC190SPED.Params[2].Value      := dmMProvider.cdsNFSaidaNFSAIDA.Value;
      dmMSProcedure.fdspGravarRegistroC190SPED.Params[3].Value      := dmMProvider.cdsNFSaidaDESTINATARIO_.Value;
      dmMSProcedure.fdspGravarRegistroC190SPED.Params[4].Value      := IntToStr(dmMProvider.cdsNFSaidaNFSAIDA.Value);
      dmMSProcedure.fdspGravarRegistroC190SPED.Params[5].Value      := dmMProvider.cdsNFSaidaMODELO.Value;
      dmMSProcedure.fdspGravarRegistroC190SPED.Params[6].Value      := dmMProvider.cdsNFSaidaSERIE.Value;
      dmMSProcedure.fdspGravarRegistroC190SPED.Params[7].Value      := dmMProvider.cdsNFSaidaEMISSAO.Value;
      dmMSProcedure.fdspGravarRegistroC190SPED.Params[8].Value      := dmMProvider.cdsFilialPERCENTUAL_ICMS_SIMPLES_NAC.Value;

      dmMSProcedure.fdspGravarRegistroC190SPED.ExecProc;

    end
    else if dmMProvider.cdsNFSaidaFINALIDADE_NF.Value = 3 then
    begin

      dmMSProcedure.fdspGravarRegistroC190SPED.Params[0].Value      := pOpcao;
      dmMSProcedure.fdspGravarRegistroC190SPED.Params[1].Value      := 1;       // entrada/sa�da
      dmMSProcedure.fdspGravarRegistroC190SPED.Params[2].Value      := dmMProvider.cdsNFSaidaNFSAIDA.Value;
      dmMSProcedure.fdspGravarRegistroC190SPED.Params[3].Value      := dmMProvider.cdsNFSaidaDESTINATARIO_.Value;
      dmMSProcedure.fdspGravarRegistroC190SPED.Params[4].Value      := IntToStr(dmMProvider.cdsNFSaidaNFSAIDA.Value);
      dmMSProcedure.fdspGravarRegistroC190SPED.Params[5].Value      := dmMProvider.cdsNFSaidaMODELO.Value;
      dmMSProcedure.fdspGravarRegistroC190SPED.Params[6].Value      := dmMProvider.cdsNFSaidaSERIE.Value;
      dmMSProcedure.fdspGravarRegistroC190SPED.Params[7].Value      := dmMProvider.cdsNFSaidaEMISSAO.Value;
      dmMSProcedure.fdspGravarRegistroC190SPED.Params[8].Value      := dmMProvider.cdsFilialPERCENTUAL_ICMS_SIMPLES_NAC.Value;

      dmMSProcedure.fdspGravarRegistroC190SPED.ExecProc;

    end
    else if dmMProvider.cdsNFSaidaFINALIDADE_NF.Value = 1 then
    begin

      dmMSProcedure.fdspRC190SPEDF.Params[0].Value        := pOpcao;
      dmMSProcedure.fdspRC190SPEDF.Params[1].Value        := 0;         // cst icms
      dmMSProcedure.fdspRC190SPEDF.Params[2].Value        := dmMProvider.cdsCFOP_NFSaidaCFOP.Value;

      if dmMProvider.cdsFilialCRT.Value <> 1 then
      begin

        dmMSProcedure.fdspRC190SPEDF.Params[5].Value    := dmMProvider.cdsNFSaidaBASECALCULOICMS.Value;

        if dmMProvider.cdsNFSaidaVALORICMS.Value > 0 then
          dmMSProcedure.fdspRC190SPEDF.Params[3].Value  := dmMProvider.cdsNFSaidaBASECALCULOICMS.Value
        else
          dmMSProcedure.fdspRC190SPEDF.Params[3].Value  := 0;

        dmMSProcedure.fdspRC190SPEDF.Params[4].Value    := 0;     //valor da opera��o
        dmMSProcedure.fdspRC190SPEDF.Params[6].Value    := dmMProvider.cdsNFSaidaVALORICMS.Value;
        dmMSProcedure.fdspRC190SPEDF.Params[7].Value    := dmMProvider.cdsNFSaidaBASESUBSTITUICAO.Value;
        dmMSProcedure.fdspRC190SPEDF.Params[8].Value    := dmMProvider.cdsNFSaidaVALORSUBSTITUICAO.Value;
        dmMSProcedure.fdspRC190SPEDF.Params[9].Value    := 0;     //valor redu��o bc
        dmMSProcedure.fdspRC190SPEDF.Params[10].Value   := dmMProvider.cdsNFSaidaVALORDOIPI.Value;
        dmMSProcedure.fdspRC190SPEDF.Params[11].Value   := '';    // c�digo da observa��o
        dmMSProcedure.fdspRC190SPEDF.Params[12].Value   := dmMProvider.cdsNFSaidaDESTINATARIO_.Value;


      end
      else
      begin

        dmMSProcedure.fdspRC190SPEDF.Params[5].Value    := 0;     // bc icms
        dmMSProcedure.fdspRC190SPEDF.Params[3].Value    := 0;     // aliquota icms
        dmMSProcedure.fdspRC190SPEDF.Params[4].Value    := 0;     // valor da opera��o
        dmMSProcedure.fdspRC190SPEDF.Params[6].Value    := 0;     // valor icms
        dmMSProcedure.fdspRC190SPEDF.Params[7].Value    := 0;     // bc substitui��o
        dmMSProcedure.fdspRC190SPEDF.Params[8].Value    := 0;     // valor icms substitui��o
        dmMSProcedure.fdspRC190SPEDF.Params[9].Value    := 0;     // valor redu��o bc
        dmMSProcedure.fdspRC190SPEDF.Params[10].Value   := 0;     // valor do IPI
        dmMSProcedure.fdspRC190SPEDF.Params[11].Value   := '';    // c�digo da observa��o
        dmMSProcedure.fdspRC190SPEDF.Params[12].Value   := dmMProvider.cdsNFSaidaDESTINATARIO_.Value;

      end;

      dmMSProcedure.fdspRC190SPEDF.Params[13].Value   := IntToStr(dmMProvider.cdsNFSaidaNFSAIDA.Value);
      dmMSProcedure.fdspRC190SPEDF.Params[14].Value   := dmMProvider.cdsNFSaidaMODELO.Value;
      dmMSProcedure.fdspRC190SPEDF.Params[15].Value   := dmMProvider.cdsNFSaidaSERIE.Value;
      dmMSProcedure.fdspRC190SPEDF.Params[16].Value   := dmMProvider.cdsNFSaidaEMISSAO.Value;

      dmMSProcedure.fdspRC190SPEDF.ExecProc;

    end;

    Result := true;

  except
  on E: exception do
    begin

      Result          := False;
      lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + Tratar_Erro_Conexao(E);
      imgErro.Visible := True;
      Application.ProcessMessages;

    end;

  end;

end;

procedure TfrmModNFSaida.GravarNumeroNF_Tab_CFOP(pNF: integer);
begin

  if dmMProvider.cdsCFOP_NFSaida.Active then
  begin

    dmMProvider.cdsCFOP_NFSaida.First;

    while not dmMProvider.cdsCFOP_NFSaida.Eof do
    begin

      dmMProvider.cdsCFOP_NFSaida.Edit;
      dmMProvider.cdsCFOP_NFSaidaNFSAIDA.Value := pNF;
      dmMProvider.cdsCFOP_NFSaida.Post;
      dmMProvider.cdsCFOP_NFSaida.Next;

    end;

    dmMProvider.cdsCFOP_NFSaida.First;

  end;

end;

procedure TfrmModNFSaida.GravarNumeroNF_Tab_Doc_Referenciados(pNF: integer);
begin

  if dmMProvider.cdsDocumentoRef_NFS.Active then
  begin

    dmMProvider.cdsDocumentoRef_NFS.First;
    dmMProvider.cdsDocumentoRef_NFS.DisableControls;

    while not dmMProvider.cdsDocumentoRef_NFS.Eof do
    begin

      dmMProvider.cdsDocumentoRef_NFS.Edit;
      dmMProvider.cdsDocumentoRef_NFSNF_SAIDA.Value := pNF;
      dmMProvider.cdsDocumentoRef_NFS.Post;
      dmMProvider.cdsDocumentoRef_NFS.Next;

    end;

    dmMProvider.cdsDocumentoRef_NFS.EnableControls;
    dmMProvider.cdsDocumentoRef_NFS.First;

  end;

  if dmMProvider.cdsCupomFiscalRefNFS.Active then
  begin

    dmMProvider.cdsCupomFiscalRefNFS.First;
    dmMProvider.cdsCupomFiscalRefNFS.DisableControls;

    while not dmMProvider.cdsCupomFiscalRefNFS.Eof do
    begin

      dmMProvider.cdsCupomFiscalRefNFS.Edit;
      dmMProvider.cdsCupomFiscalRefNFSNF_SAIDA.Value := pNF;
      dmMProvider.cdsCupomFiscalRefNFS.Post;
      dmMProvider.cdsCupomFiscalRefNFS.Next;

    end;

    dmMProvider.cdsCupomFiscalRefNFS.EnableControls;
    dmMProvider.cdsCupomFiscalRefNFS.First;

  end;


end;

procedure TfrmModNFSaida.GravarNumeroNF_Tab_End_entrega(pNF: integer);
begin

  if dmMProvider.cdsEndEntregaNFS.Active then
  begin

    dmMProvider.cdsEndEntregaNFS.First;
    dmMProvider.cdsEndEntregaNFS.DisableControls;

    while not dmMProvider.cdsEndEntregaNFS.Eof do
    begin

      dmMProvider.cdsEndEntregaNFS.Edit;
      dmMProvider.cdsEndEntregaNFSNFSAIDA.Value := pNF;
      dmMProvider.cdsEndEntregaNFS.Post;
      dmMProvider.cdsEndEntregaNFS.Next;

    end;

    dmMProvider.cdsEndEntregaNFS.EnableControls;
    dmMProvider.cdsEndEntregaNFS.First;

  end;

end;

procedure TfrmModNFSaida.GravarNumeroNF_Tab_End_retirada(pNF: integer);
begin

  if dmMProvider.cdsEndRetiradaNFS.Active then
  begin

    dmMProvider.cdsEndRetiradaNFS.First;
    dmMProvider.cdsEndRetiradaNFS.DisableControls;

    while not dmMProvider.cdsEndRetiradaNFS.Eof do
    begin

      dmMProvider.cdsEndRetiradaNFS.Edit;
      dmMProvider.cdsEndRetiradaNFSNFSAIDA.Value := pNF;
      dmMProvider.cdsEndRetiradaNFS.Post;
      dmMProvider.cdsEndRetiradaNFS.Next;

    end;

    dmMProvider.cdsEndRetiradaNFS.EnableControls;
    dmMProvider.cdsEndRetiradaNFS.First;

  end;

end;

procedure TfrmModNFSaida.GravarNumeroNF_Tab_Itens(pNF:integer);
begin

  if dmMProvider.cdsItemNFSaida.Active then
  begin

    dmMProvider.cdsItemNFSaida.First;
    dmMProvider.cdsItemNFSaida.DisableControls;

    while not dmMProvider.cdsItemNFSaida.Eof do
    begin

      dmMProvider.cdsItemNFSaida.Edit;
      dmMProvider.cdsItemNFSaidaNFSAIDA.Value := pNF;
      dmMProvider.cdsItemNFSaida.Post;
      dmMProvider.cdsItemNFSaida.Next;

    end;

    dmMProvider.cdsItemNFSaida.EnableControls;
    dmMProvider.cdsItemNFSaida.First;

  end;

end;

procedure TfrmModNFSaida.GravarNumeroNF_Tab_PARCELAS(pNF: integer);
begin

  dmMProvider.cdsParcelasNFS.First;
  dmMProvider.cdsParcelasNFS.DisableControls;

  while not dmMProvider.cdsParcelasNFS.Eof do
  begin

    dmMProvider.cdsParcelasNFS.Edit;
    dmMProvider.cdsParcelasNFSNFSAIDA.Value := pNF;
    dmMProvider.cdsParcelasNFS.Post;
    dmMProvider.cdsParcelasNFS.Next;

  end;

  dmMProvider.cdsParcelasNFS.EnableControls;
  dmMProvider.cdsParcelasNFS.First;

end;

procedure TfrmModNFSaida.GravarNumeroNF_Tab_Transportador(pNF: integer);
begin

  if dmMProvider.cdsTransportadoraNFS.Active then
  begin

    dmMProvider.cdsTransportadoraNFS.First;
    dmMProvider.cdsTransportadoraNFS.DisableControls;

    while not dmMProvider.cdsTransportadoraNFS.Eof do
    begin

      dmMProvider.cdsTransportadoraNFS.Edit;
      dmMProvider.cdsTransportadoraNFSNF_SAIDA.Value := pNF;
      dmMProvider.cdsTransportadoraNFS.Post;
      dmMProvider.cdsTransportadoraNFS.Next;

    end;

    dmMProvider.cdsTransportadoraNFS.EnableControls;
    dmMProvider.cdsTransportadoraNFS.First;

  end;

end;

procedure TfrmModNFSaida.grdCFOPNotaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if not dmMProvider.cdsCFOP_NFSaida.IsEmpty then
  begin

    if not odd(dmMProvider.cdsCFOP_NFSaida.RecNo) then
    begin

      grdCFOPNota.Canvas.Font.Color   := clBlack;
      grdCFOPNota.Canvas.Brush.Color  := COR_ZEBRA_GRADE;

    end
    else
    begin

      grdCFOPNota.Canvas.Font.Color   := clBlack;
      grdCFOPNota.Canvas.Brush.Color  := clWhite;

    end;

    grdCFOPNota.Canvas.FillRect(Rect);
    grdCFOPNota.DefaultDrawDataCell(Rect, Column.Field, State);

  end;

end;

procedure TfrmModNFSaida.grdCFOPNotaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin

  case Key of

    VK_DELETE:
      begin

        LimparMSG_ERRO(lblMsg, imgErro);

        if dmMProvider.cdsCFOP_NFSaida.Active then
        begin

          lblMsg.Tag      := ord(pExcluirCFOP_NF);
          lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_CONFIRMA_EXCLUSAO;

        end;

      end;

  end;


end;

procedure TfrmModNFSaida.grdCupomFiscalVinculadoDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if not dmMProvider.cdsDocumentoRef_NFS.IsEmpty then
  begin

    if not odd(dmMProvider.cdsDocumentoRef_NFS.RecNo) then
    begin

      grdCupomFiscalVinculado.Canvas.Font.Color   := clBlack;
      grdCupomFiscalVinculado.Canvas.Brush.Color  := COR_ZEBRA_GRADE;

    end
    else
    begin

      grdCupomFiscalVinculado.Canvas.Font.Color   := clBlack;
      grdCupomFiscalVinculado.Canvas.Brush.Color  := clWhite;

    end;

    grdCupomFiscalVinculado.Canvas.FillRect(Rect);
    grdCupomFiscalVinculado.DefaultDrawDataCell(Rect, Column.Field, State);

  end;

end;

procedure TfrmModNFSaida.grdItensDblClick(Sender: TObject);
begin

  if not dmMProvider.cdsItemNFSaida.IsEmpty then
  begin

    if InserindoEditando(dmMProvider.cdsNFSaida) then
    begin

      HabilitarDesabilitarGrupoPartilha_FCP;

      edtCodigoItem.Text := IntToStr(dmMProvider.cdsItemNFSaidaPRODUTO.Value);
      dmMProvider.cdsItemNFSaida.Edit;
      edtNCM.SetFocus;

    end;

  end;

end;

procedure TfrmModNFSaida.grdItensDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if not dmMProvider.cdsItemNFSaida.IsEmpty then
  begin

    if not odd(dmMProvider.cdsItemNFSaida.RecNo) then
    begin

      grdItens.Canvas.Font.Color   := clBlack;
      grdItens.Canvas.Brush.Color  := COR_ZEBRA_GRADE;

    end
    else
    begin

      grdItens.Canvas.Font.Color   := clBlack;
      grdItens.Canvas.Brush.Color  := clWhite;

    end;

    grdItens.Canvas.FillRect(Rect);
    grdItens.DefaultDrawDataCell(Rect, Column.Field, State);

  end;

end;

procedure TfrmModNFSaida.grdItensKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin

  case Key of

    VK_DELETE:
      begin

        LimparMSG_ERRO(lblMsg, imgErro);

        if dmMProvider.cdsItemNFSaida.Active then
        begin

          lblMsg.Tag := ord(ExcluirItemNFS);
          lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CONFIRMA_EXCLUSAO;

        end;

      end;

  end;

end;

procedure TfrmModNFSaida.grdNotasConhecimentoRefDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if not dmMProvider.cdsDocumentoRef_NFS.IsEmpty then
  begin

    if not odd(dmMProvider.cdsDocumentoRef_NFS.RecNo) then
    begin

      grdNotasConhecimentoRef.Canvas.Font.Color   := clBlack;
      grdNotasConhecimentoRef.Canvas.Brush.Color  := COR_ZEBRA_GRADE;

    end
    else
    begin

      grdNotasConhecimentoRef.Canvas.Font.Color   := clBlack;
      grdNotasConhecimentoRef.Canvas.Brush.Color  := clWhite;

    end;

    grdNotasConhecimentoRef.Canvas.FillRect(Rect);
    grdNotasConhecimentoRef.DefaultDrawDataCell(Rect, Column.Field, State);

  end;

end;

procedure TfrmModNFSaida.grdNotasConhecimentoRefKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin

  case Key of

    VK_DELETE:
      begin

        LimparMSG_ERRO(lblMsg, imgErro);

        if dmMProvider.cdsDocumentoRef_NFS.Active then
        begin

          lblMsg.Tag := ord(ExcluirDocRefNFS);
          lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CONFIRMA_EXCLUSAO;

        end;

      end;

  end;


end;

procedure TfrmModNFSaida.grdNotasprodutoReferenciadaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if not dmMProvider.cdsDocumentoRef_NFS.IsEmpty then
  begin

    if not odd(dmMProvider.cdsDocumentoRef_NFS.RecNo) then
    begin

      grdNotasprodutoReferenciada.Canvas.Font.Color   := clBlack;
      grdNotasprodutoReferenciada.Canvas.Brush.Color  := COR_ZEBRA_GRADE;

    end
    else
    begin

      grdNotasprodutoReferenciada.Canvas.Font.Color   := clBlack;
      grdNotasprodutoReferenciada.Canvas.Brush.Color  := clWhite;

    end;

    grdNotasprodutoReferenciada.Canvas.FillRect(Rect);
    grdNotasprodutoReferenciada.DefaultDrawDataCell(Rect, Column.Field, State);

  end;

end;

procedure TfrmModNFSaida.grdParcelasNotaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if not dmMProvider.cdsParcelasNFS.IsEmpty then
  begin

    if not odd(dmMProvider.cdsParcelasNFS.RecNo) then
    begin

      grdParcelasNota.Canvas.Font.Color   := clBlack;
      grdParcelasNota.Canvas.Brush.Color  := COR_ZEBRA_GRADE;

    end
    else
    begin

      grdParcelasNota.Canvas.Font.Color   := clBlack;
      grdParcelasNota.Canvas.Brush.Color  := clWhite;

    end;

    grdParcelasNota.Canvas.FillRect(Rect);
    grdParcelasNota.DefaultDrawDataCell(Rect, Column.Field, State);

  end;

end;

procedure TfrmModNFSaida.grdTabelaDblClick(Sender: TObject);
begin

  try

    if not dmMProvider.cdsNFSaida.IsEmpty then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_AGUARDE;
      Application.ProcessMessages;

      RelacionarCFOP_NFS;
      RelacionarParcelas_NFS;
      RelacionarItens_NFS;
      RelacionarDocumentos_Ref(0);
      RelacionarTransportador_NFS;

      MostrarOcultarAbas(True);
      pgcNotaFiscal.ActivePageIndex      := 1;

      LimparMSG_ERRO(lblMsg, imgErro);

    end;

  except
    on E: exception do
    begin

      lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + Tratar_Erro_Conexao(E);
      imgErro.Visible := True;
      Application.ProcessMessages;

    end;
  end;

end;

procedure TfrmModNFSaida.grdTabelaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if not dmMProvider.cdsNFSaida.IsEmpty then
  begin

    if not odd(dmMProvider.cdsNFSaida.RecNo) then
    begin

      grdTabela.Canvas.Font.Color   := clBlack;
      grdTabela.Canvas.Brush.Color  := COR_ZEBRA_GRADE;

    end
    else
    begin

      grdTabela.Canvas.Font.Color   := clBlack;
      grdTabela.Canvas.Brush.Color  := clWhite;

    end;

    if Column.Index = 4 then
    begin

      grdTabela.Canvas.Font.Color   := clWhite;

      if dmMProvider.cdsNFSaidaSTATUS.Value = 0 then
        grdTabela.Canvas.Brush.Color  := clGreen
      else if dmMProvider.cdsNFSaidaSTATUS.Value = 1 then
        grdTabela.Canvas.Brush.Color  := clRed
      else if dmMProvider.cdsNFSaidaSTATUS.Value = 2 then
        grdTabela.Canvas.Brush.Color  := clBlack
      else if dmMProvider.cdsNFSaidaSTATUS.Value = 3 then
        grdTabela.Canvas.Brush.Color  := clPurple;

      grdTabela.Canvas.Font.Style     := [fsBold];

    end;

    grdTabela.Canvas.FillRect(Rect);
    grdTabela.DefaultDrawDataCell(Rect, Column.Field, State);

  end;


end;

procedure TfrmModNFSaida.grdTabelaKeyPress(Sender: TObject; var Key: Char);
begin

  if key = #13 then
   grdTabelaDblClick(self);

end;

procedure TfrmModNFSaida.HabilitaDesabilitaControles(pOpcao: boolean);
begin

  grpNFE.Enabled                      := pOpcao;
  grpItens.Enabled                    := grpNFE.Enabled;
  grpTotaisTransporte.Enabled         := grpNFE.Enabled;
  grpInfoComplementar.Enabled         := grpNFE.Enabled;
  grpInformacoesFisco.Enabled         := grpNFE.Enabled;
  grpExportacao.Enabled               := grpNFE.Enabled;
  grpNotasConhecimentosRef.Enabled    := grpNFE.Enabled;
  tbsNotasRefProdutor.Enabled         := grpNFE.Enabled;
  tbsCupomFiscalRef.Enabled           := (not dmMProvider.cdsConfigECF.IsEmpty);

end;

procedure TfrmModNFSaida.HabilitarDesabilitarGrupoPartilha_FCP;
begin

  grpPartilhaFCP.Enabled := (dmMProvider.cdsNFSaidaCONSUMIDOR_FINAL.Value = 1) and (dmMProvider.cdsNFSaidaDESTINO_OPERACAO.Value = 2);

end;

procedure TfrmModNFSaida.imgAtualizarClienteClick(Sender: TObject);
var
  i:integer;
begin

  if not dmMProvider.cdsNFSaida.IsEmpty then
  begin

    if dmMProvider.cdsNFSaidaDESTINATARIO.Value > 0 then
    begin

      for i := 0 to 1 do
      begin

        edtCFOPNota.SetFocus;
        LimparMSG_ERRO(lblMsg, imgErro);

        dmMProvider.cdsNFSaida.Edit;
        dmMProvider.cdsNFSaidaDESTINATARIO.Value  := dmMProvider.cdsNFSaidaDESTINATARIO.Value;
        dmMProvider.cdsNFSaidaDESTINATARIO_.Value := dmMProvider.cdsNFSaidaDESTINATARIO_.Value;

        RelacionarCliente(dmMProvider.cdsNFSaidaDESTINATARIO.Value);

      end;

    end;

  end;

end;

procedure TfrmModNFSaida.imgConfirmarClick(Sender: TObject);
begin

  lblMsg.Tag := 0;
  LimparMSG_ERRO(lblMsg, imgErro);

  if not dmMProvider.cdsNFSaida.IsEmpty then
  begin

    if not InserindoEditando(dmMProvider.cdsNFSaida) then
    begin

      case dmMProvider.cdsNFSaidaSTATUS.Value of
        0:begin//a confirmar

            if Consistir_Parcelas_NFS(1) then
            begin

              if Consistir_Finalidade_NFE then
              begin

                if Consistir_Local_Embarque then
                  lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_CONFIRMA_LANCAMENTO
                else
                begin

                  lblMsg.Caption                := dmDBEXMaster.sNomeUsuario + MSG_CONSISTE_LOCAL_EMBARQUE;
                  pgcNotaFiscal.ActivePageIndex := 5;

                end;

              end
              else
              begin

                lblMsg.Caption  := dmDBEXMaster.sNomeUsuario +  MSG_CONSISTE_NFE_COMPL;
                imgErro.Visible := true;
                Application.ProcessMessages;

              end;

            end
            else
            begin

              lblMsg.Caption  := dmDBEXMaster.sNomeUsuario +  MSG_CONSISTE_PARC_NF;
              imgErro.Visible := true;
              Application.ProcessMessages;

            end;

        end;
        1:begin// confirmada

            lblMsg.Tag      := 2;
            lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_CONFIRMA_ESTORNO;

          end
      else
        begin

          lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_SITUACAO_NAO_PERMIE + 'NF ' + dmMProvider.cdsNFSaidaS_STATUS.Value;
          imgErro.Visible := True;

        end;

      end;

      lblMsg.Tag := dmMProvider.cdsNFSaidaSTATUS.Value + 1;
      Application.ProcessMessages

    end;

  end;

end;

procedure TfrmModNFSaida.imgEnd_EntregaClick(Sender: TObject);
begin

{  if InserindoEditando(dmMProvider.cdsNFSaida) then
  begin
}
    frmEnderecoEntregaNFS := TfrmEnderecoEntregaNFS.Create(self);
    if frmEnderecoEntregaNFS.ShowModal = mrOk then
    begin


    end;
    FreeAndNil(frmEnderecoEntregaNFS);

//  end;


end;

procedure TfrmModNFSaida.imgEnd_RetiradaClick(Sender: TObject);
begin

{  if InserindoEditando(dmMProvider.cdsNFSaida) then
  begin
}
    frmEnderecoRetiradaNFS := TfrmEnderecoRetiradaNFS.Create(self);
    if frmEnderecoRetiradaNFS.ShowModal = mrOk then
    begin


    end;
    FreeAndNil(frmEnderecoRetiradaNFS);

//  end;


end;

procedure TfrmModNFSaida.imgIncluirNFConhecrefClick(Sender: TObject);
var
  sTextoComplementar:string;
begin

  sTextoComplementar := '';

  if InserindoEditando(dmMProvider.cdsNFSaida) then
  begin

    frmDocumentosReferenciados := TfrmDocumentosReferenciados.Create(self);
    if frmDocumentosReferenciados.ShowModal = mrOk then
    begin

      dmMProvider.cdsDocumentoRef_NFS.Post;

      Man_Tab_Documento_Ref(0);

      dmMProvider.cdsDocumentoRef_NFS.First;

      case dmMProvider.cdsNFSaidaFINALIDADE_NF.Value of
        1:sTextoComplementar := 'complementar';
        2:sTextoComplementar := 'de ajuste';
      end;


      if length(trim(sTextoComplementar)) > 0 then
      begin

        if Length(Trim(dmMProvider.cdsNFSaidaINFO_FISCO.Value)) > 0 then
        begin

          if dmMProvider.cdsDocumentoRef_NFS.RecordCount > 1 then
            dmMProvider.cdsNFSaidaINFO_FISCO.Value := dmMProvider.cdsNFSaidaINFO_FISCO.Value +  ', NF ' + sTextoComplementar + ' referente as notas fiscais: '
          else
            dmMProvider.cdsNFSaidaINFO_FISCO.Value := dmMProvider.cdsNFSaidaINFO_FISCO.Value +  ', NF ' + sTextoComplementar + ' referente a nota fiscal: ';

        end
        else
        begin

          if dmMProvider.cdsDocumentoRef_NFS.RecordCount > 1 then
            dmMProvider.cdsNFSaidaINFO_FISCO.Value := 'NF ' + sTextoComplementar + ' referente as notas fiscais:'
          else
            dmMProvider.cdsNFSaidaINFO_FISCO.Value := 'NF ' + sTextoComplementar + ' referente a nota fiscal:';

        end;

      end;

      while not dmMProvider.cdsDocumentoRef_NFS.Eof do
      begin

        dmMProvider.cdsNFSaidaINFO_FISCO.Value := Trim(dmMProvider.cdsNFSaidaINFO_FISCO.Value) + ' ' + dmMProvider.cdsDocumentoRef_NFSDOCUMENTO_REF.Value
                                                  + ' emitida em: ' + FormatDateTime('dd/mm/yyyy', dmMProvider.cdsDocumentoRef_NFSEMISSAO_DOCUMENTO_REF.Value);

        dmMProvider.cdsDocumentoRef_NFS.Next;

        if not dmMProvider.cdsDocumentoRef_NFS.Eof then
          dmMProvider.cdsNFSaidaINFO_FISCO.Value := dmMProvider.cdsNFSaidaINFO_FISCO.Value + ', '

      end;

    end

    else
      dmMProvider.cdsDocumentoRef_NFS.Cancel;

    FreeAndNil(frmDocumentosReferenciados);

  end;

end;

procedure TfrmModNFSaida.imgIncluirTransportadoraClick(Sender: TObject);
begin

  if InserindoEditando(dmMProvider.cdsNFSaida) then
  begin

    if not dmMProvider.cdsTransportadoraNFS.IsEmpty then
    begin

      lblMsg.Tag := ord(ExcluirTransportadorNFS);
      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CONFIRMA_EXCLUSAO;
{
      Man_Tab_TransportadoraNFS(1);
      RelacionarTransportador_NFS;
}
    end
    else
    begin

      frmPesquisaFornecedor := TfrmPesquisaFornecedor.Create(self);
      if frmPesquisaFornecedor.ShowModal = mrOk then
      begin

        dmMProvider.cdsTransportadoraNFS.Append;
        dmMProvider.cdsTransportadoraNFSTRANSPORTADOR.Value := dmMProvider.cdsFornecedorFORNECEDOR.Value;

        AbrirTabela_Cidades;
        AbrirTabela_Fornecedor;

        Man_Tab_TransportadoraNFS(0);
        RelacionarTransportador_NFS;

      end;

      FreeAndNil(frmPesquisaFornecedor);

    end;

  end;

end;

procedure TfrmModNFSaida.imgIncluriCupomRefClick(Sender: TObject);
var
  sCfop, sCliente:string;
  iCupom, iEcf:integer;
begin

  try

    iImportacaoCupom := 0;

    frmCupomFiscalReferenciado := TfrmCupomFiscalReferenciado.Create(self);
    if frmCupomFiscalReferenciado.ShowModal = mrOk then
    begin

      RelacionarDocumentos_Ref(0);

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_AGUARDE;
      Application.ProcessMessages;

      if dmMProvider.cdsNFSaida.IsEmpty then
      begin

        if Length(Trim(frmCupomFiscalReferenciado.edtConsumidor.Text)) > 0 then
          sCliente := frmCupomFiscalReferenciado.edtConsumidor.Text
        else
          sCliente := frmCupomFiscalReferenciado.edtConsumidorBD.Text;

        if PesquisarCliente(sCliente) then
        begin

          if not ValidarCadastroCliente(dmMProvider.cdsPesqClientesESTADOENTREGA.Value, dmMProvider.cdsPesqClientesCNPJ.Value, Trim(dmMProvider.cdsPesqClientesINSCRICAO.Value)) then
          begin

            if Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + ', ' + MSG_VALIDARcAD_CLI_SEFAZ), 'Aten��o!', mb_IconQuestion + mb_DefButton2 + mb_YesNo)<> idYes then
              exit;

          end;

          FecharTabelas;

          if ValidarIBGE_UF(dmMProvider.cdsPesqClientesESTADOENTREGA.Value) then
          begin

            if ValidarIBGE_CIDADE(dmMProvider.cdsPesqClientesCIDADEENTREGA.Value) then
            begin

              HabilitaDesabilitaControles(True);

              AbrirTabelaNotaFiscal(0,'-1');

              dmMProvider.cdsNFSaida.LogChanges             := false;
              dmMProvider.cdsNFSaida.Append;
              dmMProvider.cdsNFSaidaNFSAIDA.Value           := GerarProximoNumeroNF;
              dmMProvider.cdsNFSaidaDESTINATARIO.Value      := dmMProvider.cdsPesqClientesCLIENTE.Value;
              dmMProvider.cdsNFSaidaDESTINATARIO_.Value     := dmMProvider.cdsPesqClientesCNPJ.Value;
              dmMProvider.cdsNFSaidaINFO_FISCO.Value        := dmMProvider.cdsFilialOBSERVACAO_NFSAIDA.Value;
              dmMProvider.cdsNFSaidaCONSUMIDOR_FINAL.Value  := 1;

              if dmMProvider.cdsNFSaidaUF_DEST.Value = 'EX' then
                dmMProvider.cdsNFSaidaDESTINO_OPERACAO.Value := 3
              else if dmMProvider.cdsNFSaidaUF_DEST.Value <> dmMProvider.cdsFilialESTADO.Value then
              begin

                sCfop                                         := '6929';
                dmMProvider.cdsNFSaidaDESTINO_OPERACAO.Value  := 2;
                PesquisarCFOP(0,sCfop);

              end
              else if dmMProvider.cdsNFSaidaUF_DEST.Value = dmMProvider.cdsFilialESTADO.Value then
              begin

                sCfop                                         := '5929';
                dmMProvider.cdsNFSaidaDESTINO_OPERACAO.Value  := 1;
                PesquisarCFOP(0,sCfop);

              end;

              Man_Tab_NFS(0);

              MostrarOcultarAbas( True);

              RelacionarItens_NFS;

              dmMProvider.cdsNFSaidaENTRADA_SAIDA.Value := 0;

              if dmMProvider.cdsPesqCFOPNATUREZA_CFOP.Value = 2 then
                dmMProvider.cdsNFSaidaFINALIDADE_NF.Value := 3;

              if dmMProvider.cdsCFOP_NFSaida.IsEmpty then
                RelacionarCFOP_NFS;

              if not dmMProvider.cdsCFOP_NFSaida.Locate('CFOP;NFSAIDA',VarArrayOf([Trim(edtCFOpItem.Text), dmMProvider.cdsNFSaidaNFSAIDA.Value]) ,[]) then
              begin

                dmMProvider.cdsCFOP_NFSaida.Append;
                dmMProvider.cdsCFOP_NFSaidaCFOP.Value := dmMProvider.cdsPesqCFOPCFOP.Value;
                dmMProvider.cdsCFOP_NFSaida.Post;

                Man_Tab_CFOP_NFS(0);

                if Length(Trim(dmMProvider.cdsPesqCFOPOBSERVACAO_NFS.AsString)) > 0 then
                begin

                  if Length(Trim(dmMProvider.cdsNFSaidaINFO_FISCO.Value)) > 0 then
                    dmMProvider.cdsNFSaidaINFO_FISCO.Value := dmMProvider.cdsNFSaidaINFO_FISCO.Value +#13 + dmMProvider.cdsPesqCFOPOBSERVACAO_NFS.AsString
                  else
                    dmMProvider.cdsNFSaidaINFO_FISCO.Value := dmMProvider.cdsPesqCFOPOBSERVACAO_NFS.AsString + #13 + 'NOTA FISCAL EMITIDA EM CONFORMIDADE AO CUPOM FISCAL N: ';

                end
                else
                  dmMProvider.cdsNFSaidaINFO_FISCO.Value := 'NOTA FISCAL EMITIDA EM CONFORMIDADE AO CUPOM FISCAL N: ';

              end;

              LimparMSG_ERRO(lblMsg, imgErro);

            end
            else
            begin

              lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_CODIGO_IBGE_ERRADO + ' ' + dmMProvider.cdsCidadesNOME.Value;
              imgErro.Visible := true;
              exit

            end;

          end
          else
          begin

            lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_UF_SEM_CODIGO_IBGE + dmMProvider.cdsPesqClientesESTADOENTREGA.Value;
            imgErro.Visible := true;
            exit

          end;

        end;

      end;

      dmMProvider.cdsDetalhesCupomRefNFS_TEMP.First;

      iImportacaoCupom := 1;

      while not dmMProvider.cdsDetalhesCupomRefNFS_TEMP.Eof do
      begin

        if iCupom <> dmMProvider.cdsDetalhesCupomRefNFS_TEMPNUMERO_CUPOM.Value then
        begin

          dmMProvider.cdsNFSaidaINFO_FISCO.Value := dmMProvider.cdsNFSaidaINFO_FISCO.Value + IntToStr(dmMProvider.cdsDetalhesCupomRefNFS_TEMPNUMERO_CUPOM.Value) + ', ';

          dmMProvider.cdsCupomFiscalRefNFS.Append;
          dmMProvider.cdsCupomFiscalRefNFSNF_SAIDA.Value                := dmMProvider.cdsNFSaidaNFSAIDA.Value;
          dmMProvider.cdsCupomFiscalRefNFSMODELO_NF_SAIDA.Value         := dmMProvider.cdsNFSaidaMODELO.Value;
          dmMProvider.cdsCupomFiscalRefNFSSERIE_NF_SAIDA.Value          := dmMProvider.cdsNFSaidaSERIE.Value;
          dmMProvider.cdsCupomFiscalRefNFSCNPJ_NF_SAIDA.Value           := dmMProvider.cdsNFSaidaDESTINATARIO_.Value;
          dmMProvider.cdsCupomFiscalRefNFSDOCUMENTO_REF.Value           := IntToStr(dmMProvider.cdsDetalhesCupomRefNFS_TEMPNUMERO_CUPOM.Value);
          dmMProvider.cdsCupomFiscalRefNFSMODELO_DOC_REF.Value          := '2D';
          dmMProvider.cdsCupomFiscalRefNFSCHAVE_DOCUMENTO_REF.Value     := dmMProvider.cdsDetalhesCupomRefNFS_TEMPSERIE_FAB.Value;
          dmMProvider.cdsCupomFiscalRefNFSSERIE_DOC_REF.Value           := dmMProvider.cdsDetalhesCupomRefNFS_TEMPNUMERO_ECF.Value;
          dmMProvider.cdsCupomFiscalRefNFSTIPO_DOCUMENTO.Value          := 4;
          dmMProvider.cdsCupomFiscalRefNFSFILIAL.Value                  := dmDBEXMaster.iIdFilial;
          dmMProvider.cdsCupomFiscalRefNFSEMISSAO_DOCUMENTO_REF.Value   := dmMProvider.cdsDetalhesCupomRefNFS_TEMPEMISSAO.Value;
          dmMProvider.cdsCupomFiscalRefNFS.Post;

          Man_Tab_Documento_Ref(0);

        end;

        iCupom := dmMProvider.cdsDetalhesCupomRefNFS_TEMPNUMERO_CUPOM.Value;

        dmDBEXMaster.fdqMasterPesquisa.Close;
        dmDBEXMaster.fdqMasterPesquisa.SQL.Clear;
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('select pro.descricao, pro.unidade,pro.produto, pro.ncm, pro.cest, pf.promocao, pf.precodevenda, pf.precopromocao,');
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('pro.cf_ipi, pro.cst_pis, pro.aliquota_pis, pro.cst_cofins,  pro.aliquota_cofins,');
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('pro.cst_ipi, pf.ipi, ncm.carga_nac_federal, ncm.carga_imp_federal, ncm.carga_estadual, pf.custobruto,');
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('ncm.carga_municipal, PRO.origem_mercadoria, pro.cst, aliq.aliquota , bar.barras, bar.gerado from produto pro');

        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('join produtofilial pf');
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('on(pf.produto = pro.produto)');

        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('join nbm_ncm ncm');
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('on(ncm.cod_ncm = pro.ncm)');

        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('join aliquotas aliq');
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('on(aliq.tributacao = pro.tributacao)');

        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('join barras bar');
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('on(bar.produto = pro.produto)');

        dmDBEXMaster.fdqMasterPesquisa.SQL.Add('where pro.produto = ' + IntToStr(dmMProvider.cdsDetalhesCupomRefNFS_TEMPCODIGO_PRODUTO.Value));
        dmDBEXMaster.fdqMasterPesquisa.SQL.Add(' and pro.ativo = 1 and pro.visibilidade = 1');
        dmDBEXMaster.fdqMasterPesquisa.Open;

        if not dmDBEXMaster.fdqMasterPesquisa.IsEmpty then
        begin

          actIncluirItemCDSExecute(self);

          if dmMProvider.cdsPesqCFOPCST_PIS_SAIDA.Value > 0 then
          begin

            dmMProvider.cdsItemNFSaidaCST_PIS.Value           := dmMProvider.cdsPesqCFOPCST_PIS_SAIDA.Value;
            dmMProvider.cdsItemNFSaidaP_ALIQUOTA_PIS.Value    := dmMProvider.cdsPesqCFOPALIQUOTA_PIS_SAIDA.Value;
            dmMProvider.cdsItemNFSaidaCST_COFINS.Value        := dmMProvider.cdsPesqCFOPCST_COFINS_SAIDA.Value;
            dmMProvider.cdsItemNFSaidaP_ALIQUOTA_COFINS.Value := dmMProvider.cdsPesqCFOPALIQUOTA_COFINS_SAIDA.Value;

          end;

          dmMProvider.cdsItemNFSaidaQUANTIDADE.Value                  := dmMProvider.cdsDetalhesCupomRefNFS_TEMPQUANTIDADE.Value;
          dmMProvider.cdsItemNFSaidaQUANTIDADE_TRIBUTAVEL.Value       := dmMProvider.cdsItemNFSaidaQUANTIDADE.Value;
          dmMProvider.cdsItemNFSaidaVALORUNITARIO.Value               := dmMProvider.cdsDetalhesCupomRefNFS_TEMPVALOR_UNITARIO.Value;
          dmMProvider.cdsItemNFSaidaVALOR_UNITARIO_TRIBUTAVEL.Value   := dmMProvider.cdsDetalhesCupomRefNFS_TEMPVALOR_UNITARIO.Value;
          dmMProvider.cdsItemNFSaidaVALOR_DESCONTO.Value              := dmMProvider.cdsDetalhesCupomRefNFS_TEMPDESCONTO.Value;
          dmMProvider.cdsItemNFSaidaCFOP.Value                        := sCfop;

          if not InserindoEditando(dmMProvider.cdsItemNFSaida) then
            dmMProvider.cdsItemNFSaida.Edit;

          CalcularValoresItens;

          if InserindoEditando(dmMProvider.cdsItemNFSaida) then
            dmMProvider.cdsItemNFSaida.Post;

          Man_Tab_ItemNFS(0);

          dmMProvider.cdsDetalhesCupomRefNFS_TEMP.Next;

        end
        else
        begin

          lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_VERIFICAR_CADASTRO + 'PRODUTO: '+ IntToStr(dmMProvider.cdsDetalhesCupomRefNFS_TEMPCODIGO_PRODUTO.Value);
          Application.ProcessMessages;
          exit;

        end;


      end;

      FreeAndNil(frmCupomFiscalReferenciado);
      ResetarCampos;

      dmMProvider.cdsDetalhesCupomRefNFS_TEMP.Close;

    end;
  except

    on E: exception do
    begin

      dmDBEXMaster.fdtMaster.Rollback;
      lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + Tratar_Erro_Conexao(E);
      imgErro.Visible := True;
      Application.ProcessMessages;

    end;

  end;

end;

procedure TfrmModNFSaida.imgNFRefProdutorClick(Sender: TObject);
begin

  if InserindoEditando(dmMProvider.cdsNFSaida) then
  begin

    frmNotaReferenciadaProdutor := TfrmNotaReferenciadaProdutor.Create(self);
    if frmNotaReferenciadaProdutor.ShowModal = mrOk then
    begin


    end;
    FreeAndNil(frmNotaReferenciadaProdutor);

  end;

end;

procedure TfrmModNFSaida.imgSairClick(Sender: TObject);
begin

  Close;

end;

procedure TfrmModNFSaida.imgTrocarClienteClick(Sender: TObject);
begin

  if InserindoEditando(dmMProvider.cdsNFSaida) then
  begin

    if Length(Trim(dmMProvider.cdsNFSaidaNUMERO_DANFE.Value)) <= 0 then
    begin

      frmPesquisaCliente := TfrmPesquisaCliente.Create(self);
      if frmPesquisaCliente.ShowModal = mrOk then
      begin

        if not ValidarCadastroCliente(dmMProvider.cdsPesqClientesESTADOENTREGA.Value, dmMProvider.cdsPesqClientesCNPJ.Value, dmMProvider.cdsPesqClientesINSCRICAO.Value) then
        begin

          if Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + ', ' + MSG_VALIDARcAD_CLI_SEFAZ), 'Aten��o!', mb_IconQuestion + mb_DefButton2 + mb_YesNo)<> idYes then
            exit;

        end;

        if ValidarIBGE_UF(dmMProvider.cdsPesqClientesESTADOENTREGA.Value) then
        begin

          if ValidarIBGE_CIDADE(dmMProvider.cdsPesqClientesCIDADEENTREGA.Value) then
          begin

            dmMProvider.cdsNFSaida.Edit;

            RelacionarCliente(dmMProvider.cdsPesqClientesCLIENTE.Value);

            edtCFOPNota.SetFocus;
            LimparMSG_ERRO(lblMsg, imgErro);

            dmMProvider.cdsNFSaidaDESTINATARIO.Value  := dmMProvider.cdsPesqClientesCLIENTE.Value;
            dmMProvider.cdsNFSaidaDESTINATARIO_.Value := dmMProvider.cdsPesqClientesCNPJ.Value;

            if dmMProvider.cdsNFSaidaUF_DEST.Value = 'EX' then
              dmMProvider.cdsNFSaidaDESTINO_OPERACAO.Value := 3
            else if dmMProvider.cdsNFSaidaUF_DEST.Value <> dmMProvider.cdsFilialESTADO.Value then
              dmMProvider.cdsNFSaidaDESTINO_OPERACAO.Value := 2
            else if dmMProvider.cdsNFSaidaUF_DEST.Value = dmMProvider.cdsFilialESTADO.Value then
              dmMProvider.cdsNFSaidaDESTINO_OPERACAO.Value := 1;

          end
          else
          begin

            lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_CODIGO_IBGE_ERRADO + dmMProvider.cdsPesqClientesESTADOENTREGA.Value;
            imgErro.Visible := true;

          end;

        end
        else
        begin

          lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_UF_SEM_CODIGO_IBGE + dmMProvider.cdsPesqClientesESTADOENTREGA.Value;
          imgErro.Visible := true;

        end;

      end;

      FreeAndNil(frmPesquisaCliente);

    end
    else
    begin

      lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_NF_TRANSMITIDA;
      imgErro.Visible := true;
      Application.ProcessMessages;

    end;

  end;

end;

procedure TfrmModNFSaida.lblF5Click(Sender: TObject);
begin

  LimparMSG_ERRO(lblMsg, imgErro);

  if dmMProvider.cdsNFSaida.Active then
  begin

    if not InserindoEditando(dmMProvider.cdsNFSaida) then
    begin

      if (dmMProvider.cdsNFSaidaSTATUS.Value = 0) and (Length(Trim(dmMProvider.cdsNFSaidaNUMERO_DANFE.Value)) <= 0) then
      begin

        LimparMSG_ERRO(lblMsg, imgErro);

        lblMsg.Tag      := -1;
        lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_CONFIRMA_EXCLUSAO;

      end
      else if dmMProvider.cdsNFSaidaSTATUS.Value > 0 then
      begin

        lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_STATUS_NAO_PERMITE_EXCL + ' - ' + dmMProvider.cdsNFSaidaS_STATUS.Value;
        imgErro.Visible := true;
        Application.ProcessMessages

      end
      else if Length(Trim(dmMProvider.cdsNFSaidaNUMERO_DANFE.Value)) > 0 then
      begin

        lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_STATUS_NAO_PERMITE_EXCL + ' - ' + 'NFE ENVIADA/VALIDADA';
        imgErro.Visible := true;
        Application.ProcessMessages

      end

    end;

  end;

end;

procedure TfrmModNFSaida.LerconfiguracoesNFE;
var
  cLogoMarcaDefault, cPathSalvarDefault: string;
  Ok:boolean;
begin

  cLogoMarcaDefault                                   := ExtractFilePath(Application.ExeName) + 'Nfe\Arqs\LogoMarca\Logo_Nfe.JPG';
  cPathSalvarDefault                                  := ExtractFilePath(Application.ExeName) + 'Nfe\Arqs\Nfe';

  ACBrNFe1.Configuracoes.Certificados.ArquivoPFX      := dmMProvider.cdsParametros_NFECAMINHO_CERTIFICADO.Value;
  ACBrNFe1.Configuracoes.Certificados.Senha           := dmMProvider.cdsParametros_NFESENHA_CERTIFICADO.Value;
  ACBrNFe1.Configuracoes.Certificados.NumeroSerie     := dmMProvider.cdsConfig_iniSERIE_CERTIFICADO_DIGITAL.Text;

  ACBrNFe1.SSL.NumeroSerie                            := dmMProvider.cdsConfig_iniSERIE_CERTIFICADO_DIGITAL.Text;
  ACBrNFe1.DANFE.Logo                                 := dmMProvider.cdsParametros_NFELOGO_MARCA.Value;
  ACBrNFe1.DANFE.PathPDF                              := dmMProvider.cdsConfiguracoesPATH_SALVAR_PDF.Value;

  with ACBrNFe1.Configuracoes.Geral do
  begin

    SSLLib                := TSSLLib(dmMProvider.cdsParametros_NFESSL_LIB.Value);
    SSLCryptLib           := TSSLCryptLib(dmMProvider.cdsParametros_NFECRYPT_LIB.Value);
    SSLHttpLib            := TSSLHttpLib(dmMProvider.cdsParametros_NFEHTTP_LIB.Value);
    SSLXmlSignLib         := TSSLXmlSignLib(dmMProvider.cdsParametros_NFEXMLSIGN_LIB.Value);
    ExibirErroSchema      := (dmMProvider.cdsParametros_NFEEXIBIR_ERRO_SCHEMA.Value = 1);
    FormatoAlerta         := dmMProvider.cdsParametros_NFEFORMATO_ALERTA.Value;
//    FormaEmissao     := TpcnTipoEmissao(); //ver possibilidade de criar configuracao
    ModeloDF              := TpcnModeloDF(0);
    VersaoDF              := TpcnVersaoDF(2);
    IdCSC                 := '';
    CSC                   := '';
    Salvar                := (dmMProvider.cdsParametros_NFESALVAR_ARQUIVOS_ENVIO_RESPOSTA.Value = 1);
    AtualizarXMLCancelado := (dmMProvider.cdsParametros_NFEATUALIZAR_XML.Value = 1);
    ExibirErroSchema      := (dmMProvider.cdsParametros_NFEEXIBIR_ERRO_SCHEMA.Value = 1);
    RetirarAcentos        := (dmMProvider.cdsParametros_NFERETIRAR_ACENTOS_XML_ENVIADO.Value = 1);
    RetirarEspacos        := true;

  end;

  with ACBrNFe1.Configuracoes.WebServices do
  begin

    UF                        := dmMProvider.cdsConfiguracoesWS_NFE.Value;
    Ambiente                  := StrToTpAmb(Ok,IntToStr(dmMProvider.cdsConfiguracoesAMBIENTE_NFE.Value));
    Visualizar                := (dmMProvider.cdsConfiguracoesVISUALIZAR_MSG_NFE.Value = 1);
    Salvar                    := (dmMProvider.cdsParametros_NFESALVAR_ENVELOP_SOAP.Value = 1);
    AjustaAguardaConsultaRet  := (dmMProvider.cdsParametros_NFEAJUSTAR_MSG_AGUARDE.Value = 1);

    if NaoEstaVazio(IntToStr(dmMProvider.cdsParametros_NFETEMPO_AGUARDAR_ENVIO.AsInteger)) then
      AguardarConsultaRet := ifThen(dmMProvider.cdsParametros_NFETEMPO_AGUARDAR_ENVIO.AsInteger < 1000, dmMProvider.cdsParametros_NFETEMPO_AGUARDAR_ENVIO.AsInteger * 1000, dmMProvider.cdsParametros_NFETEMPO_AGUARDAR_ENVIO.AsInteger);

    if NaoEstaVazio(IntToStr(dmMProvider.cdsParametros_NFETENTATIVAS_ENVIO.AsInteger)) then
      Tentativas          := dmMProvider.cdsParametros_NFETENTATIVAS_ENVIO.AsInteger;

    if NaoEstaVazio(IntToStr(dmMProvider.cdsParametros_NFEINTERVALO_TENTATIVAS.AsInteger)) then
      IntervaloTentativas := ifThen(dmMProvider.cdsParametros_NFEINTERVALO_TENTATIVAS.AsInteger < 1000,dmMProvider.cdsParametros_NFEINTERVALO_TENTATIVAS.AsInteger * 1000, dmMProvider.cdsParametros_NFEINTERVALO_TENTATIVAS.AsInteger);

    ProxyHost := '';
    ProxyPort := '';
    ProxyUser := '';
    ProxyPass := '';

  end;

  with ACBrNFe1.Configuracoes.Arquivos do
  begin

    Salvar             := (dmMProvider.cdsParametros_NFESALVAR_ARQS_EM_PASTAS_SEPARADAS.Value = 1);
    SepararPorMes      := (dmMProvider.cdsParametros_NFECRIAR_PASTAS_MENSALMENTE.Value = 1);
    AdicionarLiteral   := (dmMProvider.cdsParametros_NFEADICIONAR_LITERAL_NOME_PASTAS.Value = 1);
    EmissaoPathNFe     := (dmMProvider.cdsParametros_NFESALVAR_NFE_PELA_EMISSAO.Value = 1);
    SalvarEvento       := (dmMProvider.cdsParametros_NFESALVAR_ARQUIVOS_EVENTOS.Value = 1);
    SepararPorCNPJ     := (dmMProvider.cdsParametros_NFESEPARAR_ARQ_POR_CNPJ_CERTIF.Value = 1);
    SepararPorModelo   := (dmMProvider.cdsParametros_NFESEPARAR_ARQ_POR_MODELO_DOC.Value = 1);
    PathSalvar         := dmMProvider.cdsParametros_NFEPASTA_LOGS.AsString;
    PathSchemas        := dmMProvider.cdsParametros_NFEPASTA_SCHEMAS.AsString;
    PathNFe            := dmMProvider.cdsParametros_NFEPASTA_ARQS_NFE.AsString;
    PathInu            := dmMProvider.cdsParametros_NFEPASTA_ARQS_INUTILIZACAO.AsString;
    PathEvento         := dmMProvider.cdsParametros_NFEPASTA_ARQS_EVENTO.AsString;

  end;

  with ACBrMail1 do
  begin

    Host                := dmMProvider.cdsConfiguracoesSERVIDOR_SMTP.AsString;
    Port                := dmMProvider.cdsConfiguracoesPORTA_SMTP.AsString;
    Username            := dmMProvider.cdsConfiguracoesUSUARIO_SMTP.AsString;
    Password            := dmMProvider.cdsConfiguracoesSENHA_USUARIO_SMTP.AsString;
    From                := dmMProvider.cdsFilialEMAIL.Value;
    SetSSL              := (dmMProvider.cdsConfiguracoesUSAR_SSL_SMTP.Value = 1);   // SSL - Conexão Segura
    SetTLS              := (dmMProvider.cdsConfiguracoesAUTENTICA_SMTP.Value = 1);  // Auto TLS
    ReadingConfirmation := True;                                                    //Pede confirma��o de leitura do email
    UseThread           := True;                                                    //Aguarda Envio do Email(não usa thread)
    FromName            := dmMProvider.cdsFilialRAZAOSOCIAL.Value;

  end;

  ACBrNFe1.SSL.SSLType := TSSLType(dmMProvider.cdsParametros_NFESSL_TYPE.Value);
  ACBrNFe1.SSL.DescarregarCertificado;

end;

function TfrmModNFSaida.Man_Tab_CFOP_NFS(pOpcao: smallint): boolean;
begin

  LimparMSG_ERRO(lblMsg, imgErro);

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    if dmMProvider.cdsCFOP_NFSaida.Active then
    begin

      if pOpcao = 0 then
      begin

        dmMProvider.cdsCFOP_NFSaida.First;

        while not dmMProvider.cdsCFOP_NFSaida.Eof do
        begin

          dmMSProcedure.fdspCfop_NFSaida.Params[0].Value    := pOpcao;
          dmMSProcedure.fdspCfop_NFSaida.Params[1].Value    := dmMProvider.cdsNFSaidaNFSAIDA.Value;
          dmMSProcedure.fdspCfop_NFSaida.Params[2].Value    := dmMProvider.cdsCFOP_NFSaidaCFOP.Value;
          dmMSProcedure.fdspCfop_NFSaida.Params[3].Value    := dmMProvider.cdsNFSaidaMODELO.Value;
          dmMSProcedure.fdspCfop_NFSaida.Params[4].Value    := dmMProvider.cdsNFSaidaFILIAL.Value;

          dmMSProcedure.fdspCfop_NFSaida.ExecProc;

          dmMProvider.cdsCFOP_NFSaida.Next

        end;

        dmMProvider.cdsCFOP_NFSaida.First;

      end
      else
      begin

        dmMSProcedure.fdspCfop_NFSaida.Params[0].Value    := pOpcao;
        dmMSProcedure.fdspCfop_NFSaida.Params[1].Value    := dmMProvider.cdsNFSaidaNFSAIDA.Value;
        dmMSProcedure.fdspCfop_NFSaida.Params[2].Value    := dmMProvider.cdsCFOP_NFSaidaCFOP.Value;
        dmMSProcedure.fdspCfop_NFSaida.Params[3].Value    := dmMProvider.cdsNFSaidaMODELO.Value;
        dmMSProcedure.fdspCfop_NFSaida.Params[4].Value    := dmMProvider.cdsNFSaidaFILIAL.Value;

        dmMSProcedure.fdspCfop_NFSaida.ExecProc;

      end;

    end;

    Result := True;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

  except
    on E: exception do
    begin

      if dmDBEXMaster.fdtMaster.Active then
        dmDBEXMaster.fdtMaster.Rollback;

      dmMProvider.cdsCFOP_NFSaida.EnableConstraints;
      lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + Tratar_Erro_Conexao(E);
      imgErro.Visible := True;
      Result          := False;
      Application.ProcessMessages;

    end;

  end;

end;

function TfrmModNFSaida.Man_Tab_Documento_Ref(pOpcao: smallint): boolean;
begin

  LimparMSG_ERRO(lblMsg, imgErro);

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    if pOpcao = 0 then
    begin

      if (dmMProvider.cdsDocumentoRef_NFS.Active) and (pgcNotaFiscal.ActivePageIndex = 6) then
      begin

        dmMProvider.cdsDocumentoRef_NFS.First;
        dmMProvider.cdsDocumentoRef_NFS.DisableControls;

        while not dmMProvider.cdsDocumentoRef_NFS.Eof do
        begin

          dmMSProcedure.fdspDocumento_Ref_NFS.Params[0].Value    := pOpcao;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[1].Value    := dmMProvider.cdsDocumentoRef_NFSNF_SAIDA.Value;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[2].Value    := dmMProvider.cdsDocumentoRef_NFSMODELO_NF_SAIDA.Value;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[3].Value    := dmMProvider.cdsDocumentoRef_NFSSERIE_NF_SAIDA.Value;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[4].Value    := dmMProvider.cdsDocumentoRef_NFSCNPJ_NF_SAIDA.Value;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[5].Value    := dmMProvider.cdsDocumentoRef_NFSDOCUMENTO_REF.AsString;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[6].Value    := dmMProvider.cdsDocumentoRef_NFSMODELO_DOC_REF.AsString;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[7].Value    := dmMProvider.cdsDocumentoRef_NFSCNPJ_FORNECEDOR_REF.AsString;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[8].Value    := dmMProvider.cdsDocumentoRef_NFSCHAVE_DOCUMENTO_REF.AsString;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[9].Value    := dmMProvider.cdsDocumentoRef_NFSSERIE_DOC_REF.Value;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[10].Value   := dmMProvider.cdsDocumentoRef_NFSANO_MES_EMISSAO.AsString;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[11].Value   := dmMProvider.cdsDocumentoRef_NFSUF_DOCUMENTO_REF.Value;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[12].Value   := dmMProvider.cdsDocumentoRef_NFSEMISSAO_DOCUMENTO_REF.Value;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[13].Value   := dmMProvider.cdsDocumentoRef_NFSINDICADOR_EMITENTE.Value;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[14].Value   := dmMProvider.cdsDocumentoRef_NFSINDICADOR_OPERACAO.Value;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[15].Value   := dmMProvider.cdsDocumentoRef_NFSFILIAL.Value;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[16].Value   := dmMProvider.cdsDocumentoRef_NFSTIPO_DOCUMENTO.Value;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[17].Value   := dmMProvider.cdsDocumentoRef_NFSINSCRICAO_ESTADUAL_EMITENTE.AsString;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[18].Value   := dmMProvider.cdsDocumentoRef_NFSSIGLA_UF_EMITENTE.Value;

          dmMSProcedure.fdspDocumento_Ref_NFS.ExecProc;

          dmMProvider.cdsDocumentoRef_NFS.Next

        end;

        dmMProvider.cdsDocumentoRef_NFS.EnableControls;
        dmMProvider.cdsDocumentoRef_NFS.First;

      end
      else if (dmMProvider.cdsCupomFiscalRefNFS.Active) and (pgcNotaFiscal.ActivePageIndex = 8) then
      begin

        dmMProvider.cdsCupomFiscalRefNFS.First;
        dmMProvider.cdsCupomFiscalRefNFS.DisableControls;

        while not dmMProvider.cdsCupomFiscalRefNFS.Eof do
        begin

          dmMSProcedure.fdspDocumento_Ref_NFS.Params[0].Value    := pOpcao;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[1].Value    := dmMProvider.cdsCupomFiscalRefNFSNF_SAIDA.Value;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[2].Value    := dmMProvider.cdsCupomFiscalRefNFSMODELO_NF_SAIDA.Value;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[3].Value    := dmMProvider.cdsCupomFiscalRefNFSSERIE_NF_SAIDA.Value;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[4].Value    := dmMProvider.cdsCupomFiscalRefNFSCNPJ_NF_SAIDA.Value;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[5].Value    := dmMProvider.cdsCupomFiscalRefNFSDOCUMENTO_REF.AsString;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[6].Value    := dmMProvider.cdsCupomFiscalRefNFSMODELO_DOC_REF.AsString;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[7].Value    := dmMProvider.cdsCupomFiscalRefNFSCNPJ_FORNECEDOR_REF.AsString;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[8].Value    := dmMProvider.cdsCupomFiscalRefNFSCHAVE_DOCUMENTO_REF.AsString;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[9].Value    := dmMProvider.cdsCupomFiscalRefNFSSERIE_DOC_REF.Value;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[10].Value   := dmMProvider.cdsCupomFiscalRefNFSANO_MES_EMISSAO.AsString;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[11].Value   := dmMProvider.cdsCupomFiscalRefNFSUF_DOCUMENTO_REF.Value;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[12].Value   := dmMProvider.cdsCupomFiscalRefNFSEMISSAO_DOCUMENTO_REF.Value;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[13].Value   := dmMProvider.cdsCupomFiscalRefNFSINDICADOR_EMITENTE.Value;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[14].Value   := dmMProvider.cdsCupomFiscalRefNFSINDICADOR_OPERACAO.Value;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[15].Value   := dmMProvider.cdsCupomFiscalRefNFSFILIAL.Value;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[16].Value   := dmMProvider.cdsCupomFiscalRefNFSTIPO_DOCUMENTO.Value;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[17].Value   := dmMProvider.cdsCupomFiscalRefNFSINSCRICAO_ESTADUAL_EMITENTE.AsString;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[18].Value   := dmMProvider.cdsCupomFiscalRefNFSSIGLA_UF_EMITENTE.Value;

          dmMSProcedure.fdspDocumento_Ref_NFS.ExecProc;

          dmMProvider.cdsCupomFiscalRefNFS.Next

        end;

        dmMProvider.cdsCupomFiscalRefNFS.EnableControls;
        dmMProvider.cdsCupomFiscalRefNFS.First;

      end;

    end
    else if pOpcao = 1 then
    begin

      if (dmMProvider.cdsDocumentoRef_NFS.Active) and (pgcNotaFiscal.ActivePageIndex = 6) then
      begin

        dmMSProcedure.fdspDocumento_Ref_NFS.Params[0].Value    := pOpcao;
        dmMSProcedure.fdspDocumento_Ref_NFS.Params[1].Value    := dmMProvider.cdsDocumentoRef_NFSNF_SAIDA.Value;
        dmMSProcedure.fdspDocumento_Ref_NFS.Params[2].Value    := dmMProvider.cdsDocumentoRef_NFSMODELO_NF_SAIDA.Value;
        dmMSProcedure.fdspDocumento_Ref_NFS.Params[3].Value    := dmMProvider.cdsDocumentoRef_NFSSERIE_NF_SAIDA.Value;
        dmMSProcedure.fdspDocumento_Ref_NFS.Params[4].Value    := dmMProvider.cdsDocumentoRef_NFSCNPJ_NF_SAIDA.Value;
        dmMSProcedure.fdspDocumento_Ref_NFS.Params[5].Value    := dmMProvider.cdsDocumentoRef_NFSDOCUMENTO_REF.AsString;
        dmMSProcedure.fdspDocumento_Ref_NFS.Params[6].Value    := dmMProvider.cdsDocumentoRef_NFSMODELO_DOC_REF.AsString;
        dmMSProcedure.fdspDocumento_Ref_NFS.Params[7].Value    := dmMProvider.cdsDocumentoRef_NFSCNPJ_FORNECEDOR_REF.AsString;
        dmMSProcedure.fdspDocumento_Ref_NFS.Params[8].Value    := dmMProvider.cdsDocumentoRef_NFSCHAVE_DOCUMENTO_REF.AsString;
        dmMSProcedure.fdspDocumento_Ref_NFS.Params[9].Value    := dmMProvider.cdsDocumentoRef_NFSSERIE_DOC_REF.Value;
        dmMSProcedure.fdspDocumento_Ref_NFS.Params[10].Value   := dmMProvider.cdsDocumentoRef_NFSANO_MES_EMISSAO.AsString;
        dmMSProcedure.fdspDocumento_Ref_NFS.Params[11].Value   := dmMProvider.cdsDocumentoRef_NFSUF_DOCUMENTO_REF.Value;
        dmMSProcedure.fdspDocumento_Ref_NFS.Params[12].Value   := dmMProvider.cdsDocumentoRef_NFSEMISSAO_DOCUMENTO_REF.Value;
        dmMSProcedure.fdspDocumento_Ref_NFS.Params[13].Value   := dmMProvider.cdsDocumentoRef_NFSINDICADOR_EMITENTE.Value;
        dmMSProcedure.fdspDocumento_Ref_NFS.Params[14].Value   := dmMProvider.cdsDocumentoRef_NFSINDICADOR_OPERACAO.Value;
        dmMSProcedure.fdspDocumento_Ref_NFS.Params[15].Value   := dmMProvider.cdsDocumentoRef_NFSFILIAL.Value;
        dmMSProcedure.fdspDocumento_Ref_NFS.Params[16].Value   := dmMProvider.cdsDocumentoRef_NFSTIPO_DOCUMENTO.Value;
        dmMSProcedure.fdspDocumento_Ref_NFS.Params[17].Value   := dmMProvider.cdsDocumentoRef_NFSINSCRICAO_ESTADUAL_EMITENTE.AsString;
        dmMSProcedure.fdspDocumento_Ref_NFS.Params[18].Value   := dmMProvider.cdsDocumentoRef_NFSSIGLA_UF_EMITENTE.Value;

        dmMSProcedure.fdspDocumento_Ref_NFS.ExecProc;

        dmMProvider.cdsDocumentoRef_NFS.Delete;

      end
      else if (dmMProvider.cdsCupomFiscalRefNFS.Active) and (pgcNotaFiscal.ActivePageIndex = 8) then
      begin

        dmMSProcedure.fdspDocumento_Ref_NFS.Params[0].Value    := pOpcao;
        dmMSProcedure.fdspDocumento_Ref_NFS.Params[1].Value    := dmMProvider.cdsCupomFiscalRefNFSNF_SAIDA.Value;
        dmMSProcedure.fdspDocumento_Ref_NFS.Params[2].Value    := dmMProvider.cdsCupomFiscalRefNFSMODELO_NF_SAIDA.Value;
        dmMSProcedure.fdspDocumento_Ref_NFS.Params[3].Value    := dmMProvider.cdsCupomFiscalRefNFSSERIE_NF_SAIDA.Value;
        dmMSProcedure.fdspDocumento_Ref_NFS.Params[4].Value    := dmMProvider.cdsCupomFiscalRefNFSCNPJ_NF_SAIDA.Value;
        dmMSProcedure.fdspDocumento_Ref_NFS.Params[5].Value    := dmMProvider.cdsCupomFiscalRefNFSDOCUMENTO_REF.AsString;
        dmMSProcedure.fdspDocumento_Ref_NFS.Params[6].Value    := dmMProvider.cdsCupomFiscalRefNFSMODELO_DOC_REF.AsString;
        dmMSProcedure.fdspDocumento_Ref_NFS.Params[7].Value    := dmMProvider.cdsCupomFiscalRefNFSCNPJ_FORNECEDOR_REF.AsString;
        dmMSProcedure.fdspDocumento_Ref_NFS.Params[8].Value    := dmMProvider.cdsCupomFiscalRefNFSCHAVE_DOCUMENTO_REF.AsString;
        dmMSProcedure.fdspDocumento_Ref_NFS.Params[9].Value    := dmMProvider.cdsCupomFiscalRefNFSSERIE_DOC_REF.Value;
        dmMSProcedure.fdspDocumento_Ref_NFS.Params[10].Value   := dmMProvider.cdsCupomFiscalRefNFSANO_MES_EMISSAO.AsString;
        dmMSProcedure.fdspDocumento_Ref_NFS.Params[11].Value   := dmMProvider.cdsCupomFiscalRefNFSUF_DOCUMENTO_REF.Value;
        dmMSProcedure.fdspDocumento_Ref_NFS.Params[12].Value   := dmMProvider.cdsCupomFiscalRefNFSEMISSAO_DOCUMENTO_REF.Value;
        dmMSProcedure.fdspDocumento_Ref_NFS.Params[13].Value   := dmMProvider.cdsCupomFiscalRefNFSINDICADOR_EMITENTE.Value;
        dmMSProcedure.fdspDocumento_Ref_NFS.Params[14].Value   := dmMProvider.cdsCupomFiscalRefNFSINDICADOR_OPERACAO.Value;
        dmMSProcedure.fdspDocumento_Ref_NFS.Params[15].Value   := dmMProvider.cdsCupomFiscalRefNFSFILIAL.Value;
        dmMSProcedure.fdspDocumento_Ref_NFS.Params[16].Value   := dmMProvider.cdsCupomFiscalRefNFSTIPO_DOCUMENTO.Value;
        dmMSProcedure.fdspDocumento_Ref_NFS.Params[17].Value   := dmMProvider.cdsCupomFiscalRefNFSINSCRICAO_ESTADUAL_EMITENTE.AsString;
        dmMSProcedure.fdspDocumento_Ref_NFS.Params[18].Value   := dmMProvider.cdsCupomFiscalRefNFSSIGLA_UF_EMITENTE.Value;

        dmMSProcedure.fdspDocumento_Ref_NFS.ExecProc;

        dmMProvider.cdsCupomFiscalRefNFS.Delete;

      end;

    end
    else if pOpcao = 2 then

    begin

      if not dmMProvider.cdsDocumentoRef_NFS.IsEmpty then
      begin

        dmMProvider.cdsDocumentoRef_NFS.First;
        dmMProvider.cdsDocumentoRef_NFS.DisableControls;

        while not dmMProvider.cdsDocumentoRef_NFS.Eof do
        begin

          dmMSProcedure.fdspDocumento_Ref_NFS.Params[0].Value    := pOpcao;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[1].Value    := dmMProvider.cdsDocumentoRef_NFSNF_SAIDA.Value;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[2].Value    := dmMProvider.cdsDocumentoRef_NFSMODELO_NF_SAIDA.Value;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[3].Value    := dmMProvider.cdsDocumentoRef_NFSSERIE_NF_SAIDA.Value;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[4].Value    := dmMProvider.cdsDocumentoRef_NFSCNPJ_NF_SAIDA.Value;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[5].Value    := dmMProvider.cdsDocumentoRef_NFSDOCUMENTO_REF.AsString;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[6].Value    := dmMProvider.cdsDocumentoRef_NFSMODELO_DOC_REF.AsString;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[7].Value    := dmMProvider.cdsDocumentoRef_NFSCNPJ_FORNECEDOR_REF.AsString;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[8].Value    := dmMProvider.cdsDocumentoRef_NFSCHAVE_DOCUMENTO_REF.AsString;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[9].Value    := dmMProvider.cdsDocumentoRef_NFSSERIE_DOC_REF.Value;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[10].Value   := dmMProvider.cdsDocumentoRef_NFSANO_MES_EMISSAO.AsString;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[11].Value   := dmMProvider.cdsDocumentoRef_NFSUF_DOCUMENTO_REF.Value;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[12].Value   := dmMProvider.cdsDocumentoRef_NFSEMISSAO_DOCUMENTO_REF.Value;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[13].Value   := dmMProvider.cdsDocumentoRef_NFSINDICADOR_EMITENTE.Value;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[14].Value   := dmMProvider.cdsDocumentoRef_NFSINDICADOR_OPERACAO.Value;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[15].Value   := dmMProvider.cdsDocumentoRef_NFSFILIAL.Value;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[16].Value   := dmMProvider.cdsDocumentoRef_NFSTIPO_DOCUMENTO.Value;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[17].Value   := dmMProvider.cdsDocumentoRef_NFSINSCRICAO_ESTADUAL_EMITENTE.AsString;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[18].Value   := dmMProvider.cdsDocumentoRef_NFSSIGLA_UF_EMITENTE.Value;

          dmMSProcedure.fdspDocumento_Ref_NFS.ExecProc;

          dmMProvider.cdsDocumentoRef_NFS.Delete;

        end;

        dmMProvider.cdsDocumentoRef_NFS.EnableControls;

      end;

      if not dmMProvider.cdsCupomFiscalRefNFS.IsEmpty then
      begin

        dmMProvider.cdsCupomFiscalRefNFS.First;
        dmMProvider.cdsCupomFiscalRefNFS.DisableControls;

        while not dmMProvider.cdsCupomFiscalRefNFS.Eof do
        begin

          dmMSProcedure.fdspDocumento_Ref_NFS.Params[0].Value    := pOpcao;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[1].Value    := dmMProvider.cdsCupomFiscalRefNFSNF_SAIDA.Value;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[2].Value    := dmMProvider.cdsCupomFiscalRefNFSMODELO_NF_SAIDA.Value;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[3].Value    := dmMProvider.cdsCupomFiscalRefNFSSERIE_NF_SAIDA.Value;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[4].Value    := dmMProvider.cdsCupomFiscalRefNFSCNPJ_NF_SAIDA.Value;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[5].Value    := dmMProvider.cdsCupomFiscalRefNFSDOCUMENTO_REF.AsString;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[6].Value    := dmMProvider.cdsCupomFiscalRefNFSMODELO_DOC_REF.AsString;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[7].Value    := dmMProvider.cdsCupomFiscalRefNFSCNPJ_FORNECEDOR_REF.AsString;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[8].Value    := dmMProvider.cdsCupomFiscalRefNFSCHAVE_DOCUMENTO_REF.AsString;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[9].Value    := dmMProvider.cdsCupomFiscalRefNFSSERIE_DOC_REF.Value;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[10].Value   := dmMProvider.cdsCupomFiscalRefNFSANO_MES_EMISSAO.AsString;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[11].Value   := dmMProvider.cdsCupomFiscalRefNFSUF_DOCUMENTO_REF.Value;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[12].Value   := dmMProvider.cdsCupomFiscalRefNFSEMISSAO_DOCUMENTO_REF.Value;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[13].Value   := dmMProvider.cdsCupomFiscalRefNFSINDICADOR_EMITENTE.Value;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[14].Value   := dmMProvider.cdsCupomFiscalRefNFSINDICADOR_OPERACAO.Value;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[15].Value   := dmMProvider.cdsCupomFiscalRefNFSFILIAL.Value;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[16].Value   := dmMProvider.cdsCupomFiscalRefNFSTIPO_DOCUMENTO.Value;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[17].Value   := dmMProvider.cdsCupomFiscalRefNFSINSCRICAO_ESTADUAL_EMITENTE.AsString;
          dmMSProcedure.fdspDocumento_Ref_NFS.Params[18].Value   := dmMProvider.cdsCupomFiscalRefNFSSIGLA_UF_EMITENTE.Value;

          dmMSProcedure.fdspDocumento_Ref_NFS.ExecProc;

          dmMProvider.cdsCupomFiscalRefNFS.Delete;

        end;

        dmMProvider.cdsCupomFiscalRefNFS.EnableControls;

      end;

    end;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

    RelacionarDocumentos_Ref(0);

    Result := True;

  except
    on E: exception do
    begin

      if dmDBEXMaster.fdtMaster.Active then
        dmDBEXMaster.fdtMaster.Rollback;

      dmMProvider.cdsDocumentoRef_NFS.EnableConstraints;
      lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + Tratar_Erro_Conexao(E);
      imgErro.Visible := True;
      Result          := False;
      Application.ProcessMessages;

    end;

  end;

end;

function TfrmModNFSaida.Man_tab_ItemNFS(pOpcao: smallint): boolean;
begin

  LimparMSG_ERRO(lblMsg, imgErro);

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    if dmMProvider.cdsItemNFSaida.Active then
    begin

      if pOpcao = 0 then
      begin

        if Length(Trim(dmMProvider.cdsItemNFSaidaCFOP.AsString)) > 0 then
        begin


//        while not dmMProvider.cdsItemNFSaida.Eof do 07/05/2016
//        begin

          dmMSProcedure.fdspItemNFSaida.Params[0].Value           := pOpcao;
          dmMSProcedure.fdspItemNFSaida.Params[1].Value           := dmMProvider.cdsNFSaidaNFSAIDA.Value;
          dmMSProcedure.fdspItemNFSaida.Params[2].Value           := dmMProvider.cdsItemNFSaidaEAN.Value;
          dmMSProcedure.fdspItemNFSaida.Params[3].Value           := dmMProvider.cdsItemNFSaidaPRODUTO.Value;
          dmMSProcedure.fdspItemNFSaida.Params[4].Value           := dmMProvider.cdsItemNFSaidaCST.Value;
          dmMSProcedure.fdspItemNFSaida.Params[5].Value           := dmMProvider.cdsItemNFSaidaQUANTIDADE.Value;
          dmMSProcedure.fdspItemNFSaida.Params[6].Value           := dmMProvider.cdsItemNFSaidaVALORUNITARIO.AsFloat;
          dmMSProcedure.fdspItemNFSaida.Params[7].Value           := dmMProvider.cdsItemNFSaidaDESCONTO.Value;
          dmMSProcedure.fdspItemNFSaida.Params[8].Value           := dmMProvider.cdsItemNFSaidaICMS.Value;
          dmMSProcedure.fdspItemNFSaida.Params[9].Value           := dmMProvider.cdsItemNFSaidaCFOP.Value;
          dmMSProcedure.fdspItemNFSaida.Params[10].Value          := dmMProvider.cdsItemNFSaidaIPI.Value;
          dmMSProcedure.fdspItemNFSaida.Params[11].Value          := dmMProvider.cdsItemNFSaidaCF_IPI.Value;
          dmMSProcedure.fdspItemNFSaida.Params[12].Value          := dmMProvider.cdsItemNFSaidaBASE_ICMS.Value;
          dmMSProcedure.fdspItemNFSaida.Params[13].Value          := dmMProvider.cdsItemNFSaidaBASE_SUBSTITUICAO.Value;
          dmMSProcedure.fdspItemNFSaida.Params[14].Value          := dmMProvider.cdsItemNFSaidaVALOR_DESCONTO.Value;
          dmMSProcedure.fdspItemNFSaida.Params[15].Value          := dmMProvider.cdsItemNFSaidaVALOR_ICMS.Value;
          dmMSProcedure.fdspItemNFSaida.Params[16].Value          := dmMProvider.cdsItemNFSaidaVALOR_IPI.Value;
          dmMSProcedure.fdspItemNFSaida.Params[17].Value          := dmMProvider.cdsItemNFSaidaVALOR_SUBSTITUICAO.Value;
          dmMSProcedure.fdspItemNFSaida.Params[18].Value          := dmMProvider.cdsItemNFSaidaSUB_TOTAL.Value;
          dmMSProcedure.fdspItemNFSaida.Params[19].Value          := dmMProvider.cdsItemNFSaidaPERCENTUAL_REDUCAO.Value;
          dmMSProcedure.fdspItemNFSaida.Params[20].Value          := dmMProvider.cdsItemNFSaidaISENTAS_NAO_TRIBUTADAS.Value;
          dmMSProcedure.fdspItemNFSaida.Params[21].Value          := iImportacaoCupom;
          dmMSProcedure.fdspItemNFSaida.Params[22].Value          := 0;   //desconto rateado - obsoleto
          dmMSProcedure.fdspItemNFSaida.Params[23].Value          := dmMProvider.cdsItemNFSaidaMODELO.Value;
          dmMSProcedure.fdspItemNFSaida.Params[24].Value          := dmMProvider.cdsItemNFSaidaCST_IPI.Value;
          dmMSProcedure.fdspItemNFSaida.Params[25].Value          := dmMProvider.cdsItemNFSaidaCOD_ENQUADRAMENTO.Value;
          dmMSProcedure.fdspItemNFSaida.Params[26].Value          := dmMProvider.cdsItemNFSaidaBASE_IPI.Value;
          dmMSProcedure.fdspItemNFSaida.Params[27].Value          := dmMProvider.cdsItemNFSaidaALIQUOTA_IPI.Value;
          dmMSProcedure.fdspItemNFSaida.Params[28].Value          := dmMProvider.cdsItemNFSaidaCST_PIS.Value;
          dmMSProcedure.fdspItemNFSaida.Params[29].Value          := dmMProvider.cdsItemNFSaidaBASE_PIS.Value;
          dmMSProcedure.fdspItemNFSaida.Params[30].Value          := dmMProvider.cdsItemNFSaidaP_ALIQUOTA_PIS.Value;
          dmMSProcedure.fdspItemNFSaida.Params[31].Value          := dmMProvider.cdsItemNFSaidaQUANTIDADE_BC_PIS.Value;
          dmMSProcedure.fdspItemNFSaida.Params[32].Value          := dmMProvider.cdsItemNFSaidaV_ALIQUOTA_PIS.Value;
          dmMSProcedure.fdspItemNFSaida.Params[33].Value          := dmMProvider.cdsItemNFSaidaVALOR_PIS.Value;
          dmMSProcedure.fdspItemNFSaida.Params[34].Value          := dmMProvider.cdsItemNFSaidaCST_COFINS.Value;
          dmMSProcedure.fdspItemNFSaida.Params[35].Value          := dmMProvider.cdsItemNFSaidaVALOR_BC_COFINS.Value;
          dmMSProcedure.fdspItemNFSaida.Params[36].Value          := dmMProvider.cdsItemNFSaidaP_ALIQUOTA_COFINS.Value;
          dmMSProcedure.fdspItemNFSaida.Params[37].Value          := dmMProvider.cdsItemNFSaidaQUANTIDADE_BC_COFINS.Value;
          dmMSProcedure.fdspItemNFSaida.Params[38].Value          := dmMProvider.cdsItemNFSaidaV_ALIQUOTA_COFINS.Value;
          dmMSProcedure.fdspItemNFSaida.Params[39].Value          := dmMProvider.cdsItemNFSaidaVALOR_COFINS.Value;
          dmMSProcedure.fdspItemNFSaida.Params[40].Value          := dmMProvider.cdsItemNFSaidaPERCENTUAL_ISS.Value;
          dmMSProcedure.fdspItemNFSaida.Params[41].Value          := dmMProvider.cdsItemNFSaidaVALOR_ISS.Value;
          dmMSProcedure.fdspItemNFSaida.Params[42].Value          := dmMProvider.cdsItemNFSaidaPERCENTUAL_IOF.Value;
          dmMSProcedure.fdspItemNFSaida.Params[43].Value          := dmMProvider.cdsItemNFSaidaVALOR_IOF.Value;
          dmMSProcedure.fdspItemNFSaida.Params[44].Value          := dmMProvider.cdsItemNFSaidaPERCENTUAL_CIDE.Value;
          dmMSProcedure.fdspItemNFSaida.Params[45].Value          := dmMProvider.cdsItemNFSaidaVALOR_CIDE.Value;
          dmMSProcedure.fdspItemNFSaida.Params[46].Value          := 0;     //carga tribut�ria - obsoleto
          dmMSProcedure.fdspItemNFSaida.Params[47].Value          := dmMProvider.cdsItemNFSaidaTOTAL_IMPOSTOS.Value;
          dmMSProcedure.fdspItemNFSaida.Params[48].Value          := dmMProvider.cdsItemNFSaidaVALOR_FRETE.Value;
          dmMSProcedure.fdspItemNFSaida.Params[49].Value          := dmMProvider.cdsItemNFSaidaCARGA_NAC_FEDERAL.Value;
          dmMSProcedure.fdspItemNFSaida.Params[50].Value          := dmMProvider.cdsItemNFSaidaCARGA_IMP_FEDERAL.Value;
          dmMSProcedure.fdspItemNFSaida.Params[51].Value          := dmMProvider.cdsItemNFSaidaCARGA_ESTADUAL.Value;
          dmMSProcedure.fdspItemNFSaida.Params[52].Value          := dmMProvider.cdsItemNFSaidaCARGA_MUNICIPAL.Value;
          dmMSProcedure.fdspItemNFSaida.Params[53].Value          := dmMProvider.cdsItemNFSaidaVALOR_CARGA_NAC_FEDERAL.Value;
          dmMSProcedure.fdspItemNFSaida.Params[54].Value          := dmMProvider.cdsItemNFSaidaVALOR_CARGA_IMP_FEDERAL.Value;
          dmMSProcedure.fdspItemNFSaida.Params[55].Value          := dmMProvider.cdsItemNFSaidaVALOR_CARGA_ESTADUAL.Value;
          dmMSProcedure.fdspItemNFSaida.Params[56].Value          := dmMProvider.cdsItemNFSaidaVALOR_CARGA_MUNICIPAL.Value;
          dmMSProcedure.fdspItemNFSaida.Params[57].Value          := dmMProvider.cdsItemNFSaidaASSINATURA_IBPT.Value;
          dmMSProcedure.fdspItemNFSaida.Params[58].Value          := dmMProvider.cdsItemNFSaidaORIGEM_MERCADORIA.Value;
          dmMSProcedure.fdspItemNFSaida.Params[59].Value          := dmMProvider.cdsItemNFSaidaFONTE_CARGA_TRIBUTARIA.Value;
          dmMSProcedure.fdspItemNFSaida.Params[60].Value          := dmMProvider.cdsItemNFSaidaMERCADORIA_CONSUMO.Value;
          dmMSProcedure.fdspItemNFSaida.Params[61].Value          := dmMProvider.cdsItemNFSaidaOUTROS_VALORES.Value;
          dmMSProcedure.fdspItemNFSaida.Params[62].Value          := dmMProvider.cdsItemNFSaidaCEST.Value;
          dmMSProcedure.fdspItemNFSaida.Params[63].Value          := dmMProvider.cdsItemNFSaidaORIGEM_CST_ICMS_PART.Value;
          dmMSProcedure.fdspItemNFSaida.Params[64].Value          := dmMProvider.cdsItemNFSaidaCST_ICMS_PART.Value;
          dmMSProcedure.fdspItemNFSaida.Params[65].Value          := dmMProvider.cdsItemNFSaidaMOD_BASE_CALC_ICMS_PART.Value;
          dmMSProcedure.fdspItemNFSaida.Params[66].Value          := dmMProvider.cdsItemNFSaidaBASE_CALC_ICMS_PART.Value;
          dmMSProcedure.fdspItemNFSaida.Params[67].Value          := dmMProvider.cdsItemNFSaidaPERCENTUAL_ICMS_PART.Value;
          dmMSProcedure.fdspItemNFSaida.Params[68].Value          := dmMProvider.cdsItemNFSaidaVALOR_ICMS_PART.Value;
          dmMSProcedure.fdspItemNFSaida.Params[69].Value          := dmMProvider.cdsItemNFSaidaMOD_BASE_CALC_ICMS_ST_PART.Value;
          dmMSProcedure.fdspItemNFSaida.Params[70].Value          := dmMProvider.cdsItemNFSaidaBASE_CALC_ICMS_STR_PART.Value;
          dmMSProcedure.fdspItemNFSaida.Params[71].Value          := dmMProvider.cdsItemNFSaidaPERCENTUAL_ICMS_ST_PART.Value;
          dmMSProcedure.fdspItemNFSaida.Params[72].Value          := dmMProvider.cdsItemNFSaidaVALOR_ICMS_ST_PART.Value;
          dmMSProcedure.fdspItemNFSaida.Params[73].Value          := dmMProvider.cdsItemNFSaidaBASE_CALC_OPERACAO_PART.Value;
          dmMSProcedure.fdspItemNFSaida.Params[74].Value          := dmMProvider.cdsItemNFSaidaUF_ST_PART.Value;
          dmMSProcedure.fdspItemNFSaida.Params[75].Value          := dmMProvider.cdsItemNFSaidaEX_TIPI.Value;
          dmMSProcedure.fdspItemNFSaida.Params[76].Value          := dmMProvider.cdsItemNFSaidaUNIDADE_COMERCIAL.Value;
          dmMSProcedure.fdspItemNFSaida.Params[77].Value          := dmMProvider.cdsItemNFSaidaUNIDADE_TRIBUTAVEL.Value;
          dmMSProcedure.fdspItemNFSaida.Params[78].Value          := dmMProvider.cdsItemNFSaidaQUANTIDADE_TRIBUTAVEL.Value;
          dmMSProcedure.fdspItemNFSaida.Params[79].Value          := dmMProvider.cdsItemNFSaidaVALOR_UNITARIO_TRIBUTAVEL.AsFloat;
          dmMSProcedure.fdspItemNFSaida.Params[80].Value          := dmMProvider.cdsItemNFSaidaVALOR_SEGURO.Value;
          dmMSProcedure.fdspItemNFSaida.Params[81].Value          := dmMProvider.cdsItemNFSaidaPEDIDO_DE_COMPRA.Value;
          dmMSProcedure.fdspItemNFSaida.Params[82].Value          := dmMProvider.cdsItemNFSaidaNUMERO_ITEM_EDIDO_COMPRA.Value;
          dmMSProcedure.fdspItemNFSaida.Params[83].Value          := dmMProvider.cdsItemNFSaidaNUMERO_FCI.Value;
          dmMSProcedure.fdspItemNFSaida.Params[84].Value          := dmMProvider.cdsItemNFSaidaALIQUOTA_CRED_SIMPLES.Value;
          dmMSProcedure.fdspItemNFSaida.Params[85].Value          := dmMProvider.cdsItemNFSaidaVALOR_CRED_ICMS_SIMPLES.Value;
          dmMSProcedure.fdspItemNFSaida.Params[86].Value          := dmMProvider.cdsItemNFSaidaCLASSE_EMQUADRAMENTO_IPI.Value;
          dmMSProcedure.fdspItemNFSaida.Params[87].Value          := dmMProvider.cdsItemNFSaidaITEMNFSAIDA.Value;
          dmMSProcedure.fdspItemNFSaida.Params[88].Value          := dmMProvider.cdsItemNFSaidaEAN_TRIBUTAVEL.Value;
          dmMSProcedure.fdspItemNFSaida.Params[89].Value          := dmMProvider.cdsItemNFSaidaPERC_BC_OPER_PROPRIA.Value;
          dmMSProcedure.fdspItemNFSaida.Params[90].Value          := dmMProvider.cdsItemNFSaidaBC_ICMS_OPERACAO_DIFERIMENTO.Value;
          dmMSProcedure.fdspItemNFSaida.Params[91].Value          := dmMProvider.cdsItemNFSaidaPERC_ICMS_DIFERIMENTO.Value;
          dmMSProcedure.fdspItemNFSaida.Params[92].Value          := dmMProvider.cdsItemNFSaidaVALOR_ICMS_DIFERIDO.Value;
          dmMSProcedure.fdspItemNFSaida.Params[93].Value          := dmMProvider.cdsItemNFSaidaPERC_REDUCAO_BC_ICMS_ST.Value;
          dmMSProcedure.fdspItemNFSaida.Params[94].Value          := dmMProvider.cdsItemNFSaidaMVA.Value;
          dmMSProcedure.fdspItemNFSaida.Params[95].Value          := dmMProvider.cdsItemNFSaidaALIQUOTA_ICMS_ST.Value;
          dmMSProcedure.fdspItemNFSaida.Params[96].Value          := dmMProvider.cdsItemNFSaidaALIQUOTA_ICMS_INTERESTADUAL.Value;
          dmMSProcedure.fdspItemNFSaida.Params[97].Value          := dmMProvider.cdsItemNFSaidaPERC_DIFERENCIAL_ALIQUOTA.Value;
          dmMSProcedure.fdspItemNFSaida.Params[98].Value          := dmMProvider.cdsItemNFSaidaALIQUOTA_ICMS_INTERNA_DESTINO.Value;
          dmMSProcedure.fdspItemNFSaida.Params[99].Value          := dmMProvider.cdsItemNFSaidaPERC_ICMS_PARTILHA_ORIGEM.Value;
          dmMSProcedure.fdspItemNFSaida.Params[100].Value         := dmMProvider.cdsItemNFSaidaPERC_ICMS_PARTILHA_DESTINO.Value;
          dmMSProcedure.fdspItemNFSaida.Params[101].Value         := dmMProvider.cdsItemNFSaidaPERC_FCP.Value;
          dmMSProcedure.fdspItemNFSaida.Params[102].Value         := dmMProvider.cdsItemNFSaidaVALOR_ICMS_PARTILHA_ORIGEM.Value;
          dmMSProcedure.fdspItemNFSaida.Params[103].Value         := dmMProvider.cdsItemNFSaidaVALOR_ICMS_PARTILHA_DESTINO.Value;
          dmMSProcedure.fdspItemNFSaida.Params[104].Value         := dmMProvider.cdsItemNFSaidaVALOR_FCP_DESTINO.Value;
          dmMSProcedure.fdspItemNFSaida.Params[105].Value         := dmMProvider.cdsItemNFSaidaISENTAS_NTRIB_ICMS_ST.Value;
          dmMSProcedure.fdspItemNFSaida.Params[106].Value         := dmMProvider.cdsItemNFSaidaPERCENTUAL_IPI_DEVOLVIDO.Value;
          dmMSProcedure.fdspItemNFSaida.Params[107].Value         := dmMProvider.cdsItemNFSaidaVALOR_IPI_DEVOLVIDO.Value;
          dmMSProcedure.fdspItemNFSaida.ExecProc;

          if not InserindoEditando(dmMProvider.cdsItemNFSaida) then
            dmMProvider.cdsItemNFSaida.Edit;

          if dmMSProcedure.fdspItemNFSaida.Params[108].AsInteger > 0 then
            dmMProvider.cdsItemNFSaidaITEMNFSAIDA.Value := dmMSProcedure.fdspItemNFSaida.Params[108].AsInteger;

          dmMProvider.cdsItemNFSaida.Post;

//          dmMProvider.cdsItemNFSaida.Next 07/05/2016

//        end; 07/05/2016

//        dmMProvider.cdsItemNFSaida.First;; 07/05/2016
          if dmDBEXMaster.fdtMaster.Active then
            dmDBEXMaster.fdtMaster.Commit;

        end;

      end
      else
      begin

        dmMSProcedure.fdspItemNFSaida.Params[0].Value           := pOpcao;
        dmMSProcedure.fdspItemNFSaida.Params[1].Value           := dmMProvider.cdsNFSaidaNFSAIDA.Value;
        dmMSProcedure.fdspItemNFSaida.Params[2].Value           := dmMProvider.cdsItemNFSaidaEAN.Value;
        dmMSProcedure.fdspItemNFSaida.Params[3].Value           := dmMProvider.cdsItemNFSaidaPRODUTO.Value;
        dmMSProcedure.fdspItemNFSaida.Params[4].Value           := dmMProvider.cdsItemNFSaidaCST.Value;
        dmMSProcedure.fdspItemNFSaida.Params[5].Value           := dmMProvider.cdsItemNFSaidaQUANTIDADE.Value;
        dmMSProcedure.fdspItemNFSaida.Params[6].Value           := dmMProvider.cdsItemNFSaidaVALORUNITARIO.AsFloat;
        dmMSProcedure.fdspItemNFSaida.Params[7].Value           := dmMProvider.cdsItemNFSaidaDESCONTO.Value;
        dmMSProcedure.fdspItemNFSaida.Params[8].Value           := dmMProvider.cdsItemNFSaidaICMS.Value;
        dmMSProcedure.fdspItemNFSaida.Params[9].Value           := dmMProvider.cdsItemNFSaidaCFOP.Value;
        dmMSProcedure.fdspItemNFSaida.Params[10].Value          := dmMProvider.cdsItemNFSaidaIPI.Value;
        dmMSProcedure.fdspItemNFSaida.Params[11].Value          := dmMProvider.cdsItemNFSaidaCF_IPI.Value;
        dmMSProcedure.fdspItemNFSaida.Params[12].Value          := dmMProvider.cdsItemNFSaidaBASE_ICMS.Value;
        dmMSProcedure.fdspItemNFSaida.Params[13].Value          := dmMProvider.cdsItemNFSaidaBASE_SUBSTITUICAO.Value;
        dmMSProcedure.fdspItemNFSaida.Params[14].Value          := dmMProvider.cdsItemNFSaidaVALOR_DESCONTO.Value;
        dmMSProcedure.fdspItemNFSaida.Params[15].Value          := dmMProvider.cdsItemNFSaidaVALOR_ICMS.Value;
        dmMSProcedure.fdspItemNFSaida.Params[16].Value          := dmMProvider.cdsItemNFSaidaVALOR_IPI.Value;
        dmMSProcedure.fdspItemNFSaida.Params[17].Value          := dmMProvider.cdsItemNFSaidaVALOR_SUBSTITUICAO.Value;
        dmMSProcedure.fdspItemNFSaida.Params[18].Value          := dmMProvider.cdsItemNFSaidaSUB_TOTAL.Value;
        dmMSProcedure.fdspItemNFSaida.Params[19].Value          := dmMProvider.cdsItemNFSaidaPERCENTUAL_REDUCAO.Value;
        dmMSProcedure.fdspItemNFSaida.Params[20].Value          := dmMProvider.cdsItemNFSaidaISENTAS_NAO_TRIBUTADAS.Value;
        dmMSProcedure.fdspItemNFSaida.Params[21].Value          := iImportacaoCupom;
        dmMSProcedure.fdspItemNFSaida.Params[22].Value          := 0;   //desconto rateado - obsoleto
        dmMSProcedure.fdspItemNFSaida.Params[23].Value          := dmMProvider.cdsItemNFSaidaMODELO.Value;
        dmMSProcedure.fdspItemNFSaida.Params[24].Value          := dmMProvider.cdsItemNFSaidaCST_IPI.Value;
        dmMSProcedure.fdspItemNFSaida.Params[25].Value          := dmMProvider.cdsItemNFSaidaCOD_ENQUADRAMENTO.Value;
        dmMSProcedure.fdspItemNFSaida.Params[26].Value          := dmMProvider.cdsItemNFSaidaBASE_IPI.Value;
        dmMSProcedure.fdspItemNFSaida.Params[27].Value          := dmMProvider.cdsItemNFSaidaALIQUOTA_IPI.Value;
        dmMSProcedure.fdspItemNFSaida.Params[28].Value          := dmMProvider.cdsItemNFSaidaCST_PIS.Value;
        dmMSProcedure.fdspItemNFSaida.Params[29].Value          := dmMProvider.cdsItemNFSaidaBASE_PIS.Value;
        dmMSProcedure.fdspItemNFSaida.Params[30].Value          := dmMProvider.cdsItemNFSaidaP_ALIQUOTA_PIS.Value;
        dmMSProcedure.fdspItemNFSaida.Params[31].Value          := dmMProvider.cdsItemNFSaidaQUANTIDADE_BC_PIS.Value;
        dmMSProcedure.fdspItemNFSaida.Params[32].Value          := dmMProvider.cdsItemNFSaidaV_ALIQUOTA_PIS.Value;
        dmMSProcedure.fdspItemNFSaida.Params[33].Value          := dmMProvider.cdsItemNFSaidaVALOR_PIS.Value;
        dmMSProcedure.fdspItemNFSaida.Params[34].Value          := dmMProvider.cdsItemNFSaidaCST_COFINS.Value;
        dmMSProcedure.fdspItemNFSaida.Params[35].Value          := dmMProvider.cdsItemNFSaidaVALOR_BC_COFINS.Value;
        dmMSProcedure.fdspItemNFSaida.Params[36].Value          := dmMProvider.cdsItemNFSaidaP_ALIQUOTA_COFINS.Value;
        dmMSProcedure.fdspItemNFSaida.Params[37].Value          := dmMProvider.cdsItemNFSaidaQUANTIDADE_BC_COFINS.Value;
        dmMSProcedure.fdspItemNFSaida.Params[38].Value          := dmMProvider.cdsItemNFSaidaV_ALIQUOTA_COFINS.Value;
        dmMSProcedure.fdspItemNFSaida.Params[39].Value          := dmMProvider.cdsItemNFSaidaVALOR_COFINS.Value;
        dmMSProcedure.fdspItemNFSaida.Params[40].Value          := dmMProvider.cdsItemNFSaidaPERCENTUAL_ISS.Value;
        dmMSProcedure.fdspItemNFSaida.Params[41].Value          := dmMProvider.cdsItemNFSaidaVALOR_ISS.Value;
        dmMSProcedure.fdspItemNFSaida.Params[42].Value          := dmMProvider.cdsItemNFSaidaPERCENTUAL_IOF.Value;
        dmMSProcedure.fdspItemNFSaida.Params[43].Value          := dmMProvider.cdsItemNFSaidaVALOR_IOF.Value;
        dmMSProcedure.fdspItemNFSaida.Params[44].Value          := dmMProvider.cdsItemNFSaidaPERCENTUAL_CIDE.Value;
        dmMSProcedure.fdspItemNFSaida.Params[45].Value          := dmMProvider.cdsItemNFSaidaVALOR_CIDE.Value;
        dmMSProcedure.fdspItemNFSaida.Params[46].Value          := 0;     //carga tribut�ria - obsoleto
        dmMSProcedure.fdspItemNFSaida.Params[47].Value          := dmMProvider.cdsItemNFSaidaTOTAL_IMPOSTOS.Value;
        dmMSProcedure.fdspItemNFSaida.Params[48].Value          := dmMProvider.cdsItemNFSaidaVALOR_FRETE.Value;
        dmMSProcedure.fdspItemNFSaida.Params[49].Value          := dmMProvider.cdsItemNFSaidaCARGA_NAC_FEDERAL.Value;
        dmMSProcedure.fdspItemNFSaida.Params[50].Value          := dmMProvider.cdsItemNFSaidaCARGA_IMP_FEDERAL.Value;
        dmMSProcedure.fdspItemNFSaida.Params[51].Value          := dmMProvider.cdsItemNFSaidaCARGA_ESTADUAL.Value;
        dmMSProcedure.fdspItemNFSaida.Params[52].Value          := dmMProvider.cdsItemNFSaidaCARGA_MUNICIPAL.Value;
        dmMSProcedure.fdspItemNFSaida.Params[53].Value          := dmMProvider.cdsItemNFSaidaVALOR_CARGA_NAC_FEDERAL.Value;
        dmMSProcedure.fdspItemNFSaida.Params[54].Value          := dmMProvider.cdsItemNFSaidaVALOR_CARGA_IMP_FEDERAL.Value;
        dmMSProcedure.fdspItemNFSaida.Params[55].Value          := dmMProvider.cdsItemNFSaidaVALOR_CARGA_ESTADUAL.Value;
        dmMSProcedure.fdspItemNFSaida.Params[56].Value          := dmMProvider.cdsItemNFSaidaVALOR_CARGA_MUNICIPAL.Value;
        dmMSProcedure.fdspItemNFSaida.Params[57].Value          := dmMProvider.cdsItemNFSaidaASSINATURA_IBPT.Value;
        dmMSProcedure.fdspItemNFSaida.Params[58].Value          := dmMProvider.cdsItemNFSaidaORIGEM_MERCADORIA.Value;
        dmMSProcedure.fdspItemNFSaida.Params[59].Value          := dmMProvider.cdsItemNFSaidaFONTE_CARGA_TRIBUTARIA.Value;
        dmMSProcedure.fdspItemNFSaida.Params[60].Value          := dmMProvider.cdsItemNFSaidaMERCADORIA_CONSUMO.Value;
        dmMSProcedure.fdspItemNFSaida.Params[61].Value          := dmMProvider.cdsItemNFSaidaOUTROS_VALORES.Value;
        dmMSProcedure.fdspItemNFSaida.Params[62].Value          := dmMProvider.cdsItemNFSaidaCEST.Value;
        dmMSProcedure.fdspItemNFSaida.Params[63].Value          := dmMProvider.cdsItemNFSaidaORIGEM_CST_ICMS_PART.Value;
        dmMSProcedure.fdspItemNFSaida.Params[64].Value          := dmMProvider.cdsItemNFSaidaCST_ICMS_PART.Value;
        dmMSProcedure.fdspItemNFSaida.Params[65].Value          := dmMProvider.cdsItemNFSaidaMOD_BASE_CALC_ICMS_PART.Value;
        dmMSProcedure.fdspItemNFSaida.Params[66].Value          := dmMProvider.cdsItemNFSaidaBASE_CALC_ICMS_PART.Value;
        dmMSProcedure.fdspItemNFSaida.Params[67].Value          := dmMProvider.cdsItemNFSaidaPERCENTUAL_ICMS_PART.Value;
        dmMSProcedure.fdspItemNFSaida.Params[68].Value          := dmMProvider.cdsItemNFSaidaVALOR_ICMS_PART.Value;
        dmMSProcedure.fdspItemNFSaida.Params[69].Value          := dmMProvider.cdsItemNFSaidaMOD_BASE_CALC_ICMS_ST_PART.Value;
        dmMSProcedure.fdspItemNFSaida.Params[70].Value          := dmMProvider.cdsItemNFSaidaBASE_CALC_ICMS_STR_PART.Value;
        dmMSProcedure.fdspItemNFSaida.Params[71].Value          := dmMProvider.cdsItemNFSaidaPERCENTUAL_ICMS_ST_PART.Value;
        dmMSProcedure.fdspItemNFSaida.Params[72].Value          := dmMProvider.cdsItemNFSaidaVALOR_ICMS_ST_PART.Value;
        dmMSProcedure.fdspItemNFSaida.Params[73].Value          := dmMProvider.cdsItemNFSaidaBASE_CALC_OPERACAO_PART.Value;
        dmMSProcedure.fdspItemNFSaida.Params[74].Value          := dmMProvider.cdsItemNFSaidaUF_ST_PART.Value;
        dmMSProcedure.fdspItemNFSaida.Params[75].Value          := dmMProvider.cdsItemNFSaidaEX_TIPI.Value;
        dmMSProcedure.fdspItemNFSaida.Params[76].Value          := dmMProvider.cdsItemNFSaidaUNIDADE_COMERCIAL.Value;
        dmMSProcedure.fdspItemNFSaida.Params[77].Value          := dmMProvider.cdsItemNFSaidaUNIDADE_TRIBUTAVEL.Value;
        dmMSProcedure.fdspItemNFSaida.Params[78].Value          := dmMProvider.cdsItemNFSaidaQUANTIDADE_TRIBUTAVEL.Value;
        dmMSProcedure.fdspItemNFSaida.Params[79].Value          := dmMProvider.cdsItemNFSaidaVALOR_UNITARIO_TRIBUTAVEL.AsFloat;
        dmMSProcedure.fdspItemNFSaida.Params[80].Value          := dmMProvider.cdsItemNFSaidaVALOR_SEGURO.Value;
        dmMSProcedure.fdspItemNFSaida.Params[81].Value          := dmMProvider.cdsItemNFSaidaPEDIDO_DE_COMPRA.Value;
        dmMSProcedure.fdspItemNFSaida.Params[82].Value          := dmMProvider.cdsItemNFSaidaNUMERO_ITEM_EDIDO_COMPRA.Value;
        dmMSProcedure.fdspItemNFSaida.Params[83].Value          := dmMProvider.cdsItemNFSaidaNUMERO_FCI.Value;
        dmMSProcedure.fdspItemNFSaida.Params[84].Value          := dmMProvider.cdsItemNFSaidaALIQUOTA_CRED_SIMPLES.Value;
        dmMSProcedure.fdspItemNFSaida.Params[85].Value          := dmMProvider.cdsItemNFSaidaVALOR_CRED_ICMS_SIMPLES.Value;
        dmMSProcedure.fdspItemNFSaida.Params[86].Value          := dmMProvider.cdsItemNFSaidaCLASSE_EMQUADRAMENTO_IPI.Value;
        dmMSProcedure.fdspItemNFSaida.Params[87].Value          := dmMProvider.cdsItemNFSaidaITEMNFSAIDA.Value;
        dmMSProcedure.fdspItemNFSaida.Params[88].Value          := dmMProvider.cdsItemNFSaidaEAN_TRIBUTAVEL.Value;
        dmMSProcedure.fdspItemNFSaida.Params[89].Value          := dmMProvider.cdsItemNFSaidaPERC_BC_OPER_PROPRIA.Value;
        dmMSProcedure.fdspItemNFSaida.Params[90].Value          := dmMProvider.cdsItemNFSaidaBC_ICMS_OPERACAO_DIFERIMENTO.Value;
        dmMSProcedure.fdspItemNFSaida.Params[91].Value          := dmMProvider.cdsItemNFSaidaPERC_ICMS_DIFERIMENTO.Value;
        dmMSProcedure.fdspItemNFSaida.Params[92].Value          := dmMProvider.cdsItemNFSaidaVALOR_ICMS_DIFERIDO.Value;
        dmMSProcedure.fdspItemNFSaida.Params[93].Value          := dmMProvider.cdsItemNFSaidaPERC_REDUCAO_BC_ICMS_ST.Value;
        dmMSProcedure.fdspItemNFSaida.Params[94].Value          := dmMProvider.cdsItemNFSaidaMVA.Value;
        dmMSProcedure.fdspItemNFSaida.Params[95].Value          := dmMProvider.cdsItemNFSaidaALIQUOTA_ICMS_ST.Value;
        dmMSProcedure.fdspItemNFSaida.Params[96].Value          := dmMProvider.cdsItemNFSaidaALIQUOTA_ICMS_INTERESTADUAL.Value;
        dmMSProcedure.fdspItemNFSaida.Params[97].Value          := dmMProvider.cdsItemNFSaidaPERC_DIFERENCIAL_ALIQUOTA.Value;
        dmMSProcedure.fdspItemNFSaida.Params[98].Value          := dmMProvider.cdsItemNFSaidaALIQUOTA_ICMS_INTERNA_DESTINO.Value;
        dmMSProcedure.fdspItemNFSaida.Params[99].Value          := dmMProvider.cdsItemNFSaidaPERC_ICMS_PARTILHA_ORIGEM.Value;
        dmMSProcedure.fdspItemNFSaida.Params[100].Value         := dmMProvider.cdsItemNFSaidaPERC_ICMS_PARTILHA_DESTINO.Value;
        dmMSProcedure.fdspItemNFSaida.Params[101].Value         := dmMProvider.cdsItemNFSaidaPERC_FCP.Value;
        dmMSProcedure.fdspItemNFSaida.Params[102].Value         := dmMProvider.cdsItemNFSaidaVALOR_ICMS_PARTILHA_ORIGEM.Value;
        dmMSProcedure.fdspItemNFSaida.Params[103].Value         := dmMProvider.cdsItemNFSaidaVALOR_ICMS_PARTILHA_DESTINO.Value;
        dmMSProcedure.fdspItemNFSaida.Params[104].Value         := dmMProvider.cdsItemNFSaidaVALOR_FCP_DESTINO.Value;
        dmMSProcedure.fdspItemNFSaida.Params[105].Value         := dmMProvider.cdsItemNFSaidaISENTAS_NTRIB_ICMS_ST.Value;
        dmMSProcedure.fdspItemNFSaida.Params[106].Value         := dmMProvider.cdsItemNFSaidaPERCENTUAL_IPI_DEVOLVIDO.Value;
        dmMSProcedure.fdspItemNFSaida.Params[107].Value         := dmMProvider.cdsItemNFSaidaVALOR_IPI_DEVOLVIDO.Value;

        dmMSProcedure.fdspItemNFSaida.ExecProc;

      end;

    end;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

    CalcularTotaisNF;

    Man_Tab_NFS(0);

    Result := True;

  except
    on E: exception do
    begin

      if dmDBEXMaster.fdtMaster.Active then
        dmDBEXMaster.fdtMaster.Rollback;

      dmMProvider.cdsItemNFSaida.EnableControls;
      lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + Tratar_Erro_Conexao(E);
      imgErro.Visible := True;
      Result          := False;
      Application.ProcessMessages;

    end;

  end;

end;

function TfrmModNFSaida.Man_Tab_NFS(pOpcao: smallint): boolean;
begin

  LimparMSG_ERRO(lblMsg, imgErro);

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    dmMSProcedure.fdspNFSaida.Params[0].Value       := pOpcao;
    dmMSProcedure.fdspNFSaida.Params[1].Value       := dmMProvider.cdsNFSaidaNFSAIDA.Value;
    dmMSProcedure.fdspNFSaida.Params[2].Value       := null;// 03/03/2016 dmMProvider.cdsNFSaidaCUPOMFISCAL.Value;
    dmMSProcedure.fdspNFSaida.Params[3].Value       := null;// 03/03/2016 dmMProvider.cdsNFSaidaECF.Value;
    dmMSProcedure.fdspNFSaida.Params[4].Value       := dmMProvider.cdsNFSaidaDESTINATARIO.Value;
    dmMSProcedure.fdspNFSaida.Params[5].Value       := dmMProvider.cdsNFSaidaEMISSAO.Value;
    dmMSProcedure.fdspNFSaida.Params[6].Value       := dmMProvider.cdsNFSaidaSAIDA.Value;
    dmMSProcedure.fdspNFSaida.Params[7].Value       := dmMProvider.cdsNFSaidaHORASAIDA.Value;
    dmMSProcedure.fdspNFSaida.Params[8].Value       := dmMProvider.cdsNFSaidaBASECALCULOICMS.Value;
    dmMSProcedure.fdspNFSaida.Params[9].Value       := dmMProvider.cdsNFSaidaVALORICMS.Value;
    dmMSProcedure.fdspNFSaida.Params[10].Value      := dmMProvider.cdsNFSaidaBASESUBSTITUICAO.Value;
    dmMSProcedure.fdspNFSaida.Params[11].Value      := dmMProvider.cdsNFSaidaVALORSUBSTITUICAO.Value;
    dmMSProcedure.fdspNFSaida.Params[12].Value      := dmMProvider.cdsNFSaidaVALORDOSPRODUTOS.Value;
    dmMSProcedure.fdspNFSaida.Params[13].Value      := dmMProvider.cdsNFSaidaVALORDOFRETE.Value;
    dmMSProcedure.fdspNFSaida.Params[14].Value      := dmMProvider.cdsNFSaidaVALORDOSEGURO.Value;
    dmMSProcedure.fdspNFSaida.Params[15].Value      := dmMProvider.cdsNFSaidaOUTRASDESPESAS.Value;
    dmMSProcedure.fdspNFSaida.Params[16].Value      := dmMProvider.cdsNFSaidaVALORDOIPI.Value;
    dmMSProcedure.fdspNFSaida.Params[17].Value      := dmMProvider.cdsNFSaidaVALORDANOTA.Value;

    if dmMProvider.cdsNFSaidaTRANSPORTADOR.Value > 0 then
      dmMSProcedure.fdspNFSaida.Params[18].Value    := dmMProvider.cdsNFSaidaTRANSPORTADOR.Value
    else
      dmMSProcedure.fdspNFSaida.Params[18].Value    := null;

    dmMSProcedure.fdspNFSaida.Params[19].Value      := dmMProvider.cdsNFSaidaTIPOFRETE.Value;
    dmMSProcedure.fdspNFSaida.Params[20].Value      := dmMProvider.cdsNFSaidaQUANTIDADEVOLUME.Value;
    dmMSProcedure.fdspNFSaida.Params[21].Value      := dmMProvider.cdsNFSaidaESPECIEVOLUME.Value;
    dmMSProcedure.fdspNFSaida.Params[22].Value      := dmMProvider.cdsNFSaidaMARCAVOLUME.Value;
    dmMSProcedure.fdspNFSaida.Params[23].Value      := dmMProvider.cdsNFSaidaNUMEROVOLUME.Value;
    dmMSProcedure.fdspNFSaida.Params[24].Value      := dmMProvider.cdsNFSaidaPESOBRUTO.Value;
    dmMSProcedure.fdspNFSaida.Params[25].Value      := dmMProvider.cdsNFSaidaPESOLIQUIDO.Value;
    dmMSProcedure.fdspNFSaida.Params[26].Value      := dmMProvider.cdsNFSaidaOBSERVACAO.Value;
    dmMSProcedure.fdspNFSaida.Params[27].Value      := dmMProvider.cdsNFSaidaPLACAVEICULO.Value;
    dmMSProcedure.fdspNFSaida.Params[28].Value      := dmMProvider.cdsNFSaidaUFVEICULO.Value;
    dmMSProcedure.fdspNFSaida.Params[29].Value      := dmMProvider.cdsNFSaidaSTATUS.Value;
    dmMSProcedure.fdspNFSaida.Params[30].Value      := 0;     //dmMProvider.cdsNFSaidaIMPRESSO.Value;
    dmMSProcedure.fdspNFSaida.Params[31].Value      := dmMProvider.cdsNFSaidaMODELO.Value;

    if dmMProvider.cdsNFSaidaFORMAPAGAMENTO.Value > 0 then
      dmMSProcedure.fdspNFSaida.Params[32].Value    := dmMProvider.cdsNFSaidaFORMAPAGAMENTO.Value
    else
      dmMSProcedure.fdspNFSaida.Params[32].Value    := null;

{   03/03/2016
    if dmMProvider.cdsNFSaidaFUNCIONARIO.Value > 0 then
      dmMSProcedure.fdspNFSaida.Params[33].Value    := dmMProvider.cdsNFSaidaFUNCIONARIO.Value
    else

    }
    dmMSProcedure.fdspNFSaida.Params[33].Value    := null;

    dmMSProcedure.fdspNFSaida.Params[34].Value      := dmMProvider.cdsNFSaidaTIPOCOBRANCA.Value;
    dmMSProcedure.fdspNFSaida.Params[35].Value      := 0;     //dmMProvider.cdsNFSaidaVALORCUPOMFISCAL.Value;
    dmMSProcedure.fdspNFSaida.Params[36].Value      := null;  //dmMProvider.cdsNFSaidaDATACUPOMFISCAL.Value;
    dmMSProcedure.fdspNFSaida.Params[37].Value      := dmMProvider.cdsNFSaidaDESCONTO_ST.Value;
    dmMSProcedure.fdspNFSaida.Params[38].Value      := 0;     //dmMProvider.cdsNFSaidaCANCELADA.Value;
    dmMSProcedure.fdspNFSaida.Params[39].Value      := dmMProvider.cdsNFSaidaENTRADA_SAIDA.Value;
    dmMSProcedure.fdspNFSaida.Params[40].Value      := 0;     //dmMProvider.cdsNFSaidaBASE_ISSQN.Value;
    dmMSProcedure.fdspNFSaida.Params[41].Value      := 0;     //dmMProvider.cdsNFSaidaVALOR_ISSQN.Value;
    dmMSProcedure.fdspNFSaida.Params[42].Value      := 0;     //dmMProvider.cdsNFSaidaBASE_ISSQN_R.Value;
    dmMSProcedure.fdspNFSaida.Params[43].Value      := 0;     //dmMProvider.cdsNFSaidaVALOR_ISSQN_R.Value;
    dmMSProcedure.fdspNFSaida.Params[44].Value      := '';    //dmMProvider.cdsNFSaidaC_M_C.Value;
    dmMSProcedure.fdspNFSaida.Params[45].Value      := 0;     //dmMProvider.cdsNFSaidaBASE_ISSQN_R.Value;
    dmMSProcedure.fdspNFSaida.Params[46].Value      := 0;     //dmMProvider.cdsNFSaidaPERCENTUAL_PIS.Value;
    dmMSProcedure.fdspNFSaida.Params[47].Value      := dmMProvider.cdsNFSaidaVALOR_PIS.Value;
    dmMSProcedure.fdspNFSaida.Params[48].Value      := 0;     //dmMProvider.cdsNFSaidaPERCENTUAL_COFINS.Value;
    dmMSProcedure.fdspNFSaida.Params[49].Value      := dmMProvider.cdsNFSaidaVALOR_COFINS.Value;
    dmMSProcedure.fdspNFSaida.Params[50].Value      := 0;     //dmMProvider.cdsNFSaidaPERCENTUAL_CSLL.Value;
    dmMSProcedure.fdspNFSaida.Params[51].Value      := 0;     //dmMProvider.cdsNFSaidaVALOR_CSLL.Value;
    dmMSProcedure.fdspNFSaida.Params[52].Value      := 0;     //dmMProvider.cdsNFSaidaPERCENTUAL_IRRF.Value;
    dmMSProcedure.fdspNFSaida.Params[53].Value      := 0;     //dmMProvider.cdsNFSaidaVALOR_IRRF.Value;
    dmMSProcedure.fdspNFSaida.Params[54].Value      := 0;     //dmMProvider.cdsNFSaidaPERCENTUAL_INSS.Value;
    dmMSProcedure.fdspNFSaida.Params[55].Value      := 0;     //dmMProvider.cdsNFSaidaVALOR_INSS.Value;
    dmMSProcedure.fdspNFSaida.Params[56].Value      := 0;     //dmMProvider.cdsNFSaidaRETER_CSLL.Value;
    dmMSProcedure.fdspNFSaida.Params[57].Value      := 0;     //dmMProvider.cdsNFSaidaRETER_CSLL.Value;
    dmMSProcedure.fdspNFSaida.Params[58].Value      := 0;     //dmMProvider.cdsNFSaidaRETER_PIS.Value;
    dmMSProcedure.fdspNFSaida.Params[59].Value      := 0;     //dmMProvider.cdsNFSaidaRETER_IRRF.Value;
    dmMSProcedure.fdspNFSaida.Params[60].Value      := 0;     //dmMProvider.cdsNFSaidaRETER_COFINS.Value;
    dmMSProcedure.fdspNFSaida.Params[61].Value      := dmMProvider.cdsNFSaidaDESTINATARIO_.Value;
    dmMSProcedure.fdspNFSaida.Params[62].Value      := 0;     //dmMProvider.cdsNFSaidaRETER_ISSQN.Value;
    dmMSProcedure.fdspNFSaida.Params[63].Value      := 0;     //dmMProvider.cdsNFSaidaDANFE_CANCELADA.Value;
    dmMSProcedure.fdspNFSaida.Params[64].Value      := 0;     //dmMProvider.cdsNFSaidaDANFE_INUTILIZADA.Value;
    dmMSProcedure.fdspNFSaida.Params[65].Value      := 0;     //dmMProvider.cdsNFSaidaDANFE_CONTINGENCIA.Value;
    dmMSProcedure.fdspNFSaida.Params[66].Value      := dmMProvider.cdsNFSaidaLOCAL_EMBARQUE.Value;
    dmMSProcedure.fdspNFSaida.Params[67].Value      := 0;     //dmMProvider.cdsNFSaidaVALOR_IOF.Value;
    dmMSProcedure.fdspNFSaida.Params[68].Value      := 0;     //dmMProvider.cdsNFSaidaVALOR_CIDE.Value;
    dmMSProcedure.fdspNFSaida.Params[69].Value      := 0;     //dmMProvider.cdsNFSaidaVALOR_ISS.Value;
    dmMSProcedure.fdspNFSaida.Params[70].Value      := 0;     //dmMProvider.cdsNFSaidaCARGA_TRIBUTARIA.Value;
    dmMSProcedure.fdspNFSaida.Params[71].Value      := dmMProvider.cdsNFSaidaVALOR_TOTAL_IMPOSTOS.Value;
    dmMSProcedure.fdspNFSaida.Params[72].Value      := dmMProvider.cdsNFSaidaFINALIDADE_NF.Value;
    dmMSProcedure.fdspNFSaida.Params[73].Value      := '';    //dmMProvider.cdsNFSaidaPROT_NF_REFERENCIA.Value;
    dmMSProcedure.fdspNFSaida.Params[74].Value      := dmMProvider.cdsNFSaidaINFO_FISCO.Value;
    dmMSProcedure.fdspNFSaida.Params[75].Value      := dmMProvider.cdsNFSaidaCANCELAMENTO_ESTEMPORANEO.Value;
    dmMSProcedure.fdspNFSaida.Params[76].Value      := dmMProvider.cdsNFSaidaCARGA_NAC_FEDERAL.Value;
    dmMSProcedure.fdspNFSaida.Params[77].Value      := dmMProvider.cdsNFSaidaCARGA_IMP_FEDERAL.Value;
    dmMSProcedure.fdspNFSaida.Params[78].Value      := dmMProvider.cdsNFSaidaCARGA_ESTADUAL.Value;
    dmMSProcedure.fdspNFSaida.Params[79].Value      := dmMProvider.cdsNFSaidaCARGA_MUNICIPAL.Value;
    dmMSProcedure.fdspNFSaida.Params[80].Value      := dmMProvider.cdsNFSaidaVALOR_CARGA_NAC_FEDERAL.Value;
    dmMSProcedure.fdspNFSaida.Params[81].Value      := dmMProvider.cdsNFSaidaVALOR_CARGA_IMP_FEDERAL.Value;
    dmMSProcedure.fdspNFSaida.Params[82].Value      := dmMProvider.cdsNFSaidaVALOR_CARGA_ESTADUAL.Value;
    dmMSProcedure.fdspNFSaida.Params[83].Value      := dmMProvider.cdsNFSaidaVALOR_CARGA_MUNICIPAL.Value;
    dmMSProcedure.fdspNFSaida.Params[84].Value      := null; // dmMProvider.cdsNFSaidaUF_REFERENCIA_DEVOL.Value;
    dmMSProcedure.fdspNFSaida.Params[85].Value      := null; // dmMProvider.cdsNFSaidaANO_MES_REFERENCIA_DEVOL.Value;
    dmMSProcedure.fdspNFSaida.Params[86].Value      := null; // dmMProvider.cdsNFSaidaCNPJ_REFERENCIA_DEVOL.Value;
    dmMSProcedure.fdspNFSaida.Params[87].Value      := null; // dmMProvider.cdsNFSaidaMODELO_REFERENCIA_DEVOL.Value;
    dmMSProcedure.fdspNFSaida.Params[88].Value      := null; // dmMProvider.cdsNFSaidaSERIE_REFERENCIA_DEVOL.Value;
    dmMSProcedure.fdspNFSaida.Params[90].Value      := dmMProvider.cdsNFSaidaCONSUMIDOR_FINAL.Value;
    dmMSProcedure.fdspNFSaida.Params[91].Value      := dmMProvider.cdsNFSaidaDESTINO_OPERACAO.Value;
    dmMSProcedure.fdspNFSaida.Params[92].Value      := dmMProvider.cdsNFSaidaLOCAL_RETIRADA.Value;
    dmMSProcedure.fdspNFSaida.Params[93].Value      := dmMProvider.cdsNFSaidaLOCAL_ENTREGA.Value;
    dmMSProcedure.fdspNFSaida.Params[94].Value      := dmMProvider.cdsNFSaidaTOTAL_ICMS_DESONERADO.Value;
    dmMSProcedure.fdspNFSaida.Params[95].Value      := dmMProvider.cdsNFSaidaTRANSPORTADOR_ISENTO_ICMS.Value;
    dmMSProcedure.fdspNFSaida.Params[96].Value      := dmDBEXMaster.iIdFilial;
    dmMSProcedure.fdspNFSaida.Params[97].Value      := dmMProvider.cdsNFSaidaTIPO_ATENDIMENTO.Value;
    dmMSProcedure.fdspNFSaida.Params[98].Value      := dmMProvider.cdsNFSaidaUF_EMBARQUE.Value;
    dmMSProcedure.fdspNFSaida.Params[99].Value      := dmMProvider.cdsNFSaidaLOCAL_DESPACHO.Value;
    dmMSProcedure.fdspNFSaida.Params[100].Value     := dmMProvider.cdsNFSaidaDESTINATARIO.Value;
    dmMSProcedure.fdspNFSaida.Params[101].Value     := dmMProvider.cdsNFSaidaVALOR_FCP_UF_DESTINO.Value;
    dmMSProcedure.fdspNFSaida.Params[102].Value     := dmMProvider.cdsNFSaidaVALOR_ICMS_UF_DESTINO.Value;
    dmMSProcedure.fdspNFSaida.Params[103].Value     := dmMProvider.cdsNFSaidaVALOR_ICMS_UF_REMETENTE.Value;
    dmMSProcedure.fdspNFSaida.Params[104].Value     := dmMProvider.cdsNFSaidaVALOR_ENTRADA.Value;
    dmMSProcedure.fdspNFSaida.Params[105].Value     := dmMProvider.cdsNFSaidaINDICADOR_IE_DESTINATARIO.Value;

    dmMSProcedure.fdspNFSaida.ExecProc;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

    Result := True;

  except
    on E: exception do
    begin

      if dmDBEXMaster.fdtMaster.Active then
        dmDBEXMaster.fdtMaster.Rollback;

      lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + Tratar_Erro_Conexao(E);
      imgErro.Visible := True;
      Result          := False;
      Application.ProcessMessages;

    end;

  end;

end;

procedure TfrmModNFSaida.MostrarOcultarAbas(pOpcao:boolean);
var
  i:integer;
begin

  for i := 1 to pgcNotaFiscal.PageCount - 1 do
    pgcNotaFiscal.Pages[i].TabVisible := pOpcao;

  pgcNotaFiscal.Pages[8].TabVisible := (not dmMProvider.cdsConfigECF.IsEmpty);

end;

function TfrmModNFSaida.PesquisarCFOP(pOpcao: smallint; pConteudo: string): boolean;
begin

  try

    dmMProvider.cdsPesqCFOP.Close;
    dmMProvider.cdsPesqCFOP.ProviderName := 'dspPesqCFOP';

    dmDBEXMaster.fdqPesqCFOP.SQL.Clear;
    dmDBEXMaster.fdqPesqCFOP.SQL.Add('select * from cfop');
    dmDBEXMaster.fdqPesqCFOP.SQL.Add('where cfop = ' + QuotedStr(pConteudo));

    dmMProvider.cdsPesqCFOP.Open;
    dmMProvider.cdsPesqCFOP.ProviderName := '';

    Result := not dmMProvider.cdsPesqCFOP.IsEmpty;

  except
    on E: exception do
    begin

      lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + Tratar_Erro_Conexao(E);
      imgErro.Visible := True;
      Application.ProcessMessages;
      dmMProvider.cdsPesqCFOP.Close;

    end;

  end;

end;

function TfrmModNFSaida.PesquisarCliente(pConteudo: string): boolean;
begin

  try

    LimparMSG_ERRO(lblMsg, imgErro) ;

    dmMProvider.cdsPesqClientes.Close;
    dmMProvider.cdsPesqClientes.ProviderName := 'dspPesqClientes';

    dmDBEXMaster.fdqPesqCliente.Close;
    dmDBEXMaster.fdqPesqCliente.SQL.Clear;
    dmDBEXMaster.fdqPesqCliente.SQL.Add('select * from clientes');
    dmDBEXMaster.fdqPesqCliente.SQL.Add('where cliente =  '+ pConteudo);
    dmMProvider.cdsPesqClientes.Open;
    dmMProvider.cdsPesqClientes.ProviderName := '';;

    result := not dmMProvider.cdsPesqClientes.IsEmpty

  except

    on E: exception do
    begin

      lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + Tratar_Erro_Conexao(E);
      imgErro.Visible := True;
      Application.ProcessMessages;
      dmMProvider.cdsPesqCFOP.Close;
      result := False;

    end;

  end;

end;

procedure TfrmModNFSaida.rdgConsumidorFinalClick(Sender: TObject);
begin

  LimparMSG_ERRO(lblMsg, imgErro);

  if dmMProvider.cdsNFSaidaFINALIDADE_NF.Value = 3 then
    dmMProvider.cdsNFSaidaCONSUMIDOR_FINAL.Value  := 0;

  if Length(Trim(dmMProvider.cdsNFSaidaDESTINATARIO_.Value)) <= 11 then
    dmMProvider.cdsNFSaidaCONSUMIDOR_FINAL.Value  := 1;

  HabilitarDesabilitarGrupoPartilha_FCP;

end;

procedure TfrmModNFSaida.rdgDestinoOperacaoClick(Sender: TObject);
begin

  if InserindoEditando(dmMProvider.cdsNFSaida) then
    dmMProvider.cdsNFSaidaDESTINO_OPERACAO.Value := StrToInt(rdgDestinoOperacao.Values[rdgDestinoOperacao.ItemIndex]);

end;

procedure TfrmModNFSaida.rdgTipoAtendimentoClick(Sender: TObject);
begin

  LimparMSG_ERRO(lblMsg, nil);

  if InserindoEditando(dmMProvider.cdsNFSaida) then
  begin

    if (dmMProvider.cdsParametros_NFEVERSAO_NFE.Value <= 2) and (rdgTipoAtendimento.ItemIndex = 5) then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_OPCAO_INCOMP_VERSAO_NFE + GetEnumName(TypeInfo(TpcnVersaoDF), integer(dmMProvider.cdsParametros_NFEVERSAO_NFE.Value));
      Application.ProcessMessages;
      rdgTipoAtendimento.ItemIndex := 0;

    end;

  end;

end;

procedure TfrmModNFSaida.rdgTipoFreteClick(Sender: TObject);
begin

  LimparMSG_ERRO(lblMsg, nil);

  if InserindoEditando(dmMProvider.cdsNFSaida) then
  begin

    if (dmMProvider.cdsParametros_NFEVERSAO_NFE.Value <= 2) and (rdgTipoFrete.ItemIndex = 3) or (rdgTipoFrete.ItemIndex = 4) then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_OPCAO_INCOMP_VERSAO_NFE + GetEnumName(TypeInfo(TpcnVersaoDF), integer(dmMProvider.cdsParametros_NFEVERSAO_NFE.Value));
      Application.ProcessMessages;
      dmMProvider.cdsNFSaidaTIPOFRETE.Value := 9;

    end;

  end;

end;

procedure TfrmModNFSaida.rdgTipoOperacaoClick(Sender: TObject);
begin

  if InserindoEditando(dmMProvider.cdsNFSaida) then
    dmMProvider.cdsNFSaidaENTRADA_SAIDA.Value := rdgTipoOperacao.ItemIndex;

end;

procedure TfrmModNFSaida.rdpOpcoesPesquisaClick(Sender: TObject);
begin

  if rdpOpcoesPesquisa.ItemIndex > 1 then
  begin

    FecharTabelas;

    if AbrirTabelaNotaFiscal(rdpOpcoesPesquisa.ItemIndex,'') then
    begin

      LimparMSG_ERRO(lblMsg, imgErro);

      pgcNotaFiscal.ActivePageIndex := 0;
      grdTabela.SetFocus;

    end;

  end
  else if rdpOpcoesPesquisa.ItemIndex = 0 then
  begin

    edtConteudoPesquisa.Clear;
    edtConteudoPesquisa.SetFocus;

  end
  else if rdpOpcoesPesquisa.ItemIndex = 1 then
  begin

    FecharTabelas;

    frmPesquisaCliente := TfrmPesquisaCliente.Create(self);
    if frmPesquisaCliente.ShowModal = mrOk then
    begin

      if AbrirTabelaNotaFiscal(rdpOpcoesPesquisa.ItemIndex, IntToStr(dmMProvider.cdsPesqClientesCLIENTE.Value)) then
      begin

        LimparMSG_ERRO(lblMsg, imgErro);

        pgcNotaFiscal.ActivePageIndex := 0;
        grdTabela.SetFocus;

      end;


    end;

    FreeAndNil(frmPesquisaCliente);

  end;

end;

procedure TfrmModNFSaida.RelacionarCFOP_NFS;
begin

  dmMProvider.cdsCFOP_NFSaida.Close;
  dmMProvider.cdsCFOP_NFSaida.ProviderName := 'dspCFOP_NFSaida';

  dmDBEXMaster.fdqCFOP_NFSaida.SQL.Clear;
  dmDBEXMaster.fdqCFOP_NFSaida.SQL.Add('select * from cfop_nfsaida');
  dmDBEXMaster.fdqCFOP_NFSaida.SQL.Add('where nfsaida = ' + IntToStr(dmMProvider.cdsNFSaidaNFSAIDA.Value));
  dmDBEXMaster.fdqCFOP_NFSaida.SQL.Add('and modelo = ' + QuotedStr(dmMProvider.cdsNFSaidaMODELO.Value));
  dmDBEXMaster.fdqCFOP_NFSaida.SQL.Add('and filial = ' + IntToStr(dmDBEXMaster.iIdFilial));

  dmMProvider.cdsCFOP_NFSaida.Open;
  dmMProvider.cdsCFOP_NFSaida.ProviderName := '';

end;

procedure TfrmModNFSaida.RelacionarCliente(pCliente:integer);
begin

  dmMProvider.cdsClientes.Close;
  dmMProvider.cdsClientes.ProviderName      := 'dspClientes';

  dmDBEXMaster.fdqClientes.SQL.Clear;
  dmDBEXMaster.fdqClientes.SQL.Add('SELECT CLIENTES.*, CIDADES.NOME NOMECIDADE, ESTADOS.NOME NOMEESTADO,');
  dmDBEXMaster.fdqClientes.SQL.Add('CIDADES.CODIGO_MUNICIPIO, ESTADOS.CODIGO_ESTADO_IBGE');
  dmDBEXMaster.fdqClientes.SQL.Add('FROM CLIENTES');
  dmDBEXMaster.fdqClientes.SQL.Add('JOIN CIDADES CIDADES');
  dmDBEXMaster.fdqClientes.SQL.Add('ON(CIDADES.CIDADE = CLIENTES.CIDADEENTREGA)');
  dmDBEXMaster.fdqClientes.SQL.Add('JOIN ESTADOS ESTADOS');
  dmDBEXMaster.fdqClientes.SQL.Add('ON(ESTADOS.SIGLA = CLIENTES.ESTADOENTREGA)');

  dmDBEXMaster.fdqClientes.SQL.Add('where clientes.cliente = ' + IntToStr(pCliente));

  dmMProvider.cdsClientes.Open;
  dmMProvider.cdsClientes.ProviderName := '';

end;

procedure TfrmModNFSaida.RelacionarDocumentos_Ref(pOpcao:smallint);
begin

  dmMProvider.cdsDocumentoRef_NFS.Close;
  dmMProvider.cdsDocumentoRef_NFS.ProviderName := 'dspDocumentoRef_NFS';

  dmDBEXMaster.fdqDocumentoRef_NFS.SQL.Clear;
  dmDBEXMaster.fdqDocumentoRef_NFS.SQL.Add('select * from DOCUMENTO_REFER_NFSAIDA');
  dmDBEXMaster.fdqDocumentoRef_NFS.SQL.Add('where nf_saida = '      + IntToStr(dmMProvider.cdsNFSaidaNFSAIDA.Value));
  dmDBEXMaster.fdqDocumentoRef_NFS.SQL.Add('and modelo_nf_saida = ' + QuotedStr(dmMProvider.cdsNFSaidaMODELO.Value));
  dmDBEXMaster.fdqDocumentoRef_NFS.SQL.Add('and serie_nf_saida = '  + QuotedStr(dmMProvider.cdsNFSaidaSERIE.Value));
  dmDBEXMaster.fdqDocumentoRef_NFS.SQL.Add('and tipo_documento < 3');

  dmMProvider.cdsDocumentoRef_NFS.Open;
  dmMProvider.cdsDocumentoRef_NFS.ProviderName := '';

  dmMProvider.cdsCupomFiscalRefNFS.Close;
  dmMProvider.cdsCupomFiscalRefNFS.ProviderName := 'dspCupomFiscalRefNFS';

  dmDBEXMaster.fdqDocumentoRef_NFS.SQL.Clear;
  dmDBEXMaster.fdqDocumentoRef_NFS.SQL.Add('select * from DOCUMENTO_REFER_NFSAIDA');
  dmDBEXMaster.fdqDocumentoRef_NFS.SQL.Add('where nf_saida = '      + IntToStr(dmMProvider.cdsNFSaidaNFSAIDA.Value));
  dmDBEXMaster.fdqDocumentoRef_NFS.SQL.Add('and modelo_nf_saida = ' + QuotedStr(dmMProvider.cdsNFSaidaMODELO.Value));
  dmDBEXMaster.fdqDocumentoRef_NFS.SQL.Add('and serie_nf_saida = '  + QuotedStr(dmMProvider.cdsNFSaidaSERIE.Value));
  dmDBEXMaster.fdqDocumentoRef_NFS.SQL.Add('and tipo_documento = 4');
  dmDBEXMaster.fdqDocumentoRef_NFS.SQL.Add('order by serie_nf_saida');

  dmMProvider.cdsCupomFiscalRefNFS.Open;
  dmMProvider.cdsCupomFiscalRefNFS.ProviderName := '';

end;

procedure TfrmModNFSaida.RelacionarFCP_Estados;
begin

  if dmMProvider.cdsItemNFSaidaPRODUTO.AsInteger > 0 then
  begin

    dmMProvider.cdsFCP_Estados.Close;
    dmMProvider.cdsFCP_Estados.ProviderName := 'dspFCP_Estados';

    dmDBEXMaster.fdqFCP_Estados.SQL.Clear;
    dmDBEXMaster.fdqFCP_Estados.SQL.Add('select * from fcp_estados');
    dmDBEXMaster.fdqFCP_Estados.SQL.Add('where ncm = ' + QuotedStr(Trim(dmMProvider.cdsItemNFSaidaCF_IPI.Value)));
    dmDBEXMaster.fdqFCP_Estados.SQL.Add('and sigla = ' + QuotedStr(Trim(dmMProvider.cdsNFSaidaUF_DEST.Value)));

    dmMProvider.cdsFCP_Estados.Open;
    dmMProvider.cdsFCP_Estados.ProviderName := '';

    if not dmMProvider.cdsFCP_Estados.IsEmpty then
    begin

      if dmMProvider.cdsFCP_EstadosEXCECAO.Value = 1 then
        dmMProvider.cdsItemNFSaidaPERC_FCP.Value := dmMProvider.cdsEstadosFCP.Value
      else
        dmMProvider.cdsItemNFSaidaPERC_FCP.Value := dmMProvider.cdsFCP_EstadosFCP.Value;

      dmMProvider.cdsItemNFSaidaALIQUOTA_ICMS_INTERNA_DESTINO.Value := dmMProvider.cdsFCP_EstadosALIQUOTA_INTERNA_DESTINO.Value;

    end;

  end;

end;


procedure TfrmModNFSaida.RelacionarItens_NFS;
begin

  dmMProvider.cdsItemNFSaida.DisableControls;

  dmMProvider.cdsItemNFSaida.Close;
  dmMProvider.cdsItemNFSaida.ProviderName := 'dspItemNFSaida';

  dmDBEXMaster.fdqItemNFSaida.SQL.Clear;
  dmDBEXMaster.fdqItemNFSaida.SQL.Add('select * from itemnfsaida');
  dmDBEXMaster.fdqItemNFSaida.SQL.Add('where nfsaida = ' + IntToStr(dmMProvider.cdsNFSaidaNFSAIDA.Value));
  dmDBEXMaster.fdqItemNFSaida.SQL.Add('and modelo = ' + QuotedStr(dmMProvider.cdsNFSaidaMODELO.Value));
  dmDBEXMaster.fdqItemNFSaida.SQL.Add('order by itemnfsaida');

  dmMProvider.cdsItemNFSaida.Open;
  dmMProvider.cdsItemNFSaida.ProviderName := '';

  //CST PIS
  dmMProvider.cdsCST_PIS.Close;
  dmMProvider.cdsCST_PIS.ProviderName := 'dspCST_PIS';

  dmDBEXMaster.fdqCST_PIS.SQL.Clear;
  dmDBEXMaster.fdqCST_PIS.SQL.Add('select * from CST_PIS_PASEP');
  dmDBEXMaster.fdqCST_PIS.SQL.Add('order by CST_PIS_PASEP');

  dmMProvider.cdsCST_PIS.Open;
  dmMProvider.cdsCST_PIS.ProviderName := '';

  //CST COFINS
  dmMProvider.cdsCST_COFINS.Close;
  dmMProvider.cdsCST_COFINS.ProviderName := 'dspCST_COFINS';

  dmDBEXMaster.fdqCST_COFINS.SQL.Clear;
  dmDBEXMaster.fdqCST_COFINS.SQL.Add('select * from CST_COFINS');
  dmDBEXMaster.fdqCST_COFINS.SQL.Add('order by CST_COFINS');

  dmMProvider.cdsCST_COFINS.Open;
  dmMProvider.cdsCST_COFINS.ProviderName := '';

  dmMProvider.cdsItemNFSaida.EnableControls;

end;

procedure TfrmModNFSaida.RelacionarParcelas_NFS;
begin

  dmMProvider.cdsParcelasNFS.Close;
  dmMProvider.cdsParcelasNFS.ProviderName := 'dspParcelasNFS';

  dmDBEXMaster.fdqParcelasNFS.SQL.Clear;
  dmDBEXMaster.fdqParcelasNFS.SQL.Add('select * from PARCELASNFSAIDA');
  dmDBEXMaster.fdqParcelasNFS.SQL.Add('where nfsaida = ' + IntToStr(dmMProvider.cdsNFSaidaNFSAIDA.Value));
  dmDBEXMaster.fdqParcelasNFS.SQL.Add('and modelo = ' + QuotedStr(dmMProvider.cdsNFSaidaMODELO.Value));
  dmDBEXMaster.fdqParcelasNFS.SQL.Add('and filial = ' + IntToStr(dmDBEXMaster.iIdFilial));
  dmDBEXMaster.fdqParcelasNFS.SQL.Add('order by PARCELASNFSAIDA');

  dmMProvider.cdsParcelasNFS.Open;
  dmMProvider.cdsParcelasNFS.ProviderName := '';

end;

procedure TfrmModNFSaida.RelacionarTransportador_NFS;
begin

  dmMProvider.cdsTransportadoraNFS.Close;
  dmMProvider.cdsTransportadoraNFS.ProviderName := 'dspTransportadoraNFS';

  dmDBEXMaster.fdqTransportadoraNFS.SQL.Clear;
  dmDBEXMaster.fdqTransportadoraNFS.SQL.Add('select * from TRANSPORTADOR_NFSAIDA');
  dmDBEXMaster.fdqTransportadoraNFS.SQL.Add('where nf_saida = ' + IntToStr(dmMProvider.cdsNFSaidaNFSAIDA.Value));
  dmDBEXMaster.fdqTransportadoraNFS.SQL.Add('and modelo = ' + QuotedStr(dmMProvider.cdsNFSaidaMODELO.Value));
  dmDBEXMaster.fdqTransportadoraNFS.SQL.Add('and filial = ' + IntToStr(dmDBEXMaster.iIdFilial));
  dmDBEXMaster.fdqTransportadoraNFS.SQL.Add('and transportador > 0');

  dmMProvider.cdsTransportadoraNFS.Open;
  dmMProvider.cdsTransportadoraNFS.ProviderName := '';

  dmMProvider.cdsFornecedor.Close;
  dmMProvider.cdsFornecedor.ProviderName := 'dspFornecedor';

  dmDBEXMaster.fdqTransportadoraNFS.SQL.Clear;
  dmDBEXMaster.fdqTransportadoraNFS.SQL.Add('select * from fornecedor');
  dmDBEXMaster.fdqTransportadoraNFS.SQL.Add('where fornecedor = ' + IntToStr(dmMProvider.cdsNFSaidaTRANSPORTADOR.Value));

  dmMProvider.cdsFornecedor.Open;
  dmMProvider.cdsFornecedor.ProviderName := '';

  if not dmMProvider.cdsTransportadoraNFS.IsEmpty then
  begin

    imgIncluirTransportadora.Picture  := image1.Picture;
    imgIncluirTransportadora.Hint     := 'Remover transportador'

  end
  else
  begin

    imgIncluirTransportadora.Picture := image2.Picture;
    imgIncluirTransportadora.Hint     := 'Incluir transportador'

  end;

end;

procedure TfrmModNFSaida.ResetarCampos;
begin

  edtCodigoItem.Clear;
  edtComplementoItem.Clear;

end;

function TfrmModNFSaida.ValidarCadastroCliente(pEstado, pDocumento, pIE: string): boolean;
var
  sResposta:string;
begin

  try

    if UpperCase(pEstado) = 'EX' then
      Result := True
    else
    begin

      if Length(PDocumento) > 11 then // N�O H� NECESSIDADE DE CONSULTAR PESSOA FISICA (PDocumento > 11) = CNPJ
      begin

        if Length(Trim(pEstado)) > 0 then
        begin

          lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CONSULTA_CADASTRO_SEFAZ + UpperCase(pEstado);
          Application.ProcessMessages;

          sResposta := '';

          Result    := False;

          ACBrNFe1.WebServices.ConsultaCadastro.UF    := pEstado;

          ACBrNFe1.WebServices.ConsultaCadastro.CNPJ  := LimparCpnjInscricao(pDocumento);

          ACBrNFe1.WebServices.ConsultaCadastro.Executar;

          sResposta := ACBrNFe1.WebServices.StatusServico.RetornoWS;

          LimparMSG_ERRO(lblMsg, imgErro);

          if ACBrNFe1.WebServices.ConsultaCadastro.cStat = 264 then
          begin

            if LimparCpnjInscricao(pIE) <> 'ISENTO' then
              lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', ' + ACBrNFe1.WebServices.ConsultaCadastro.xMotivo +  '. Verifique a IE do destinat�rio'
            else
              Result := True;

          end
          else if ACBrNFe1.WebServices.ConsultaCadastro.cStat = 111 then
          begin

            if ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[0].cSit = 0 then
            begin

              if pIE <> 'ISENTO' then
                lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', ' + MSG_CONSISTE_IE_SEFAZ + #13 + 'IE SEFAZ: ' + ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[0].IE + ' IE Cadastro: ' + pIE
              else
                Result := True;

            end
            else if ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[0].cSit = 1 then
            begin

              if pIE =  'ISENTO' then
              begin

                if pIE =  FloatToStr(StrToFloat(ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[0].IE)) then
                  Result := True
                else
                  Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + ', ' + MSG_CONSISTE_IE_SEFAZ + #13 + 'IE SEFAZ: ' + ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[0].IE + #13 + 'IE Cadastro: ' + pIE), 'Aten��o!', mb_IconWarning + mb_Ok)

              end
              else
              begin

                if FloatToStr(StrToFloat(pIE)) =  FloatToStr(StrToFloat(ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[0].IE)) then
                  Result := True
                else
                  Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + ', ' + MSG_CONSISTE_IE_SEFAZ + #13 + 'IE SEFAZ: ' + ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[0].IE + #13 + 'IE Cadastro: ' + pIE), 'Aten��o!', mb_IconWarning + mb_Ok)

              end;

            end;

          end;

        end
        else
        begin

          Result          := False;
          lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_CONSISTE_ESTADO_ENTREGA;
          Application.ProcessMessages;

        end;

      end
      else
        Result := True

    end;
  except

    on E: exception do
    begin

      lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + Tratar_Erro_Conexao(E);
      imgErro.Visible := True;
      Application.ProcessMessages;
      dmMProvider.cdsPesqCFOP.Close;
      Result := False;

    end;

  end;

  Application.ProcessMessages;

end;

function TfrmModNFSaida.ValidarCRE: boolean;
begin

  Result := False;

  if (not dmMProvider.cdsParcelasNFS.IsEmpty) then
  begin

    dmMProvider.cdsParcelasNFS.First;

    while not dmMProvider.cdsParcelasNFS.Eof do
    begin

      dmMProvider.cdsCre.Close;
      dmMProvider.cdsCre.ProviderName := 'dspCre';

      dmDBEXMaster.fdqCre.SQL.Clear;
      dmDBEXMaster.fdqCre.SQL.Add('select CRE.*, CLIENTES.RAZAOSOCIAL from CRE');
      dmDBEXMaster.fdqCre.SQL.Add('JOIN CLIENTES CLIENTES');
      dmDBEXMaster.fdqCre.SQL.Add('ON (CLIENTES.CLIENTE = CRE.SACADO)');

      dmDBEXMaster.fdqCre.SQL.Add('where cre.documento = ' + QuotedStr(Trim(dmMProvider.cdsParcelasNFSDOCUMENTO.AsString))
                                   + ' and cre.sacado = ' + IntToStr(dmMProvider.cdsNFSaidaDESTINATARIO.Value)
                                   + ' and cre.emissao = ' + QuotedStr(FormatDateTime('mm/dd/yy',dmMProvider.cdsNFSaidaEMISSAO.Value)));

      dmMProvider.cdsCre.Open;
      dmMProvider.cdsCre.ProviderName := '';

      if not dmMProvider.cdsCre.IsEmpty then
      begin

        if dmMProvider.cdsCreBAIXA.Value <> null then
        begin

          Result := false;
          exit

        end;

      end;

      dmMProvider.cdsParcelasNFS.Next;

    end;

    Result := True;

  end;

end;

function TfrmModNFSaida.ValidarInformacoes: boolean;
begin

  Result := False;

  { validar se cfop foi informada no corpo da nota }
  if dmMProvider.cdsCFOP_NFSaida.IsEmpty then
  begin

    pgcNotaFiscal.ActivePageIndex := 1;
    lblMsg.Caption                := dmDBEXMaster.sNomeUsuario + MSG_CONSISTE_CFOP_NF;
    edtCFOPNota.SetFocus;

  end
  else if not ConsistirCfop_NFS(dmMProvider.cdsNFSaidaNFSAIDA.Value, dmMProvider.cdsNFSaidaMODELO.Value) then
    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CONSISTE_CFOP_NFS
  { validar se o tipo de frete foi selecionado }
  else if rdgTipoFrete.ItemIndex < 0 then
  begin

    pgcNotaFiscal.ActivePageIndex := 3;
    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CAMPO_OBRIGATORIO + ' - MODALIDADE DO FRETE';

  end
  else if rdgConsumidorFinal.ItemIndex < 0 then
  begin

    pgcNotaFiscal.ActivePageIndex := 1;
    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CAMPO_OBRIGATORIO + ' - CONSUMIDOR FINAL';

  end
  else if not Consistir_Local_Embarque then
  begin

    pgcNotaFiscal.ActivePageIndex := 5;
    edtLocalEmbarque.SetFocus;
    lblMsg.Caption                := dmDBEXMaster.sNomeUsuario + MSG_CONSISTE_LOCAL_EMBARQUE;

  end
  else if dmMProvider.cdsNFSaidaFINALIDADE_NF.Value > 0 then
  begin

    if dmMProvider.cdsDocumentoRef_NFS.IsEmpty then
    begin

      pgcNotaFiscal.ActivePageIndex := 6;
      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CONSISTE_NFE_COMPL;
      Application.ProcessMessages;
      imgIncluirNFConhecrefClick(self);

    end
    else
      Result := True;

  end
  else
    Result := True;

  Application.ProcessMessages;

end;

function TfrmModNFSaida.ValidarInformacoesItem: boolean;
begin

  Result := False;
  { validar a cfop do item }
  if Length(Trim(dmMProvider.cdsItemNFSaidaCFOP.Value)) <= 0 then
  begin

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CAMPO_OBRIGATORIO + ' - CFOP DO ITEM';
    Application.ProcessMessages;
    pgcNotaFiscal.ActivePageIndex := 2;
    edtCFOpItem.SetFocus;

  end
  else
    Result := True;

end;

function TfrmModNFSaida.Man_Tab_Parcelas_NFS(pOpcao: smallint): boolean;
begin

  if dmMProvider.cdsParcelasNFS.Active then
  begin

    if dmMProvider.cdsParcelasNFS.RecordCount > 0 then
    begin

      dmMProvider.cdsParcelasNFS.First;
      dmMProvider.cdsParcelasNFS.DisableControls;

      try

        if not dmDBEXMaster.fdtMaster.Active then
          dmDBEXMaster.fdtMaster.StartTransaction;

        if pOpcao = 0 then
        begin

          while not dmMProvider.cdsParcelasNFS.Eof do
          begin

            dmMSProcedure.fdspParcelasNFS.Params[0].Value := pOpcao;
            dmMSProcedure.fdspParcelasNFS.Params[1].Value := dmMProvider.cdsNFSaidaNFSAIDA.Value;
            dmMSProcedure.fdspParcelasNFS.Params[2].Value := dmMProvider.cdsParcelasNFSDOCUMENTO.Value;
            dmMSProcedure.fdspParcelasNFS.Params[3].Value := dmMProvider.cdsParcelasNFSVENCIMENTO.Value;
            dmMSProcedure.fdspParcelasNFS.Params[4].Value := dmMProvider.cdsParcelasNFSVALOR.Value;
            dmMSProcedure.fdspParcelasNFS.Params[5].Value := dmMProvider.cdsNFSaidaMODELO.Value;
            dmMSProcedure.fdspParcelasNFS.Params[6].Value := dmDBEXMaster.iIdFilial;
            dmMSProcedure.fdspParcelasNFS.ExecProc;

            dmMProvider.cdsParcelasNFS.Next

          end;

        end
        else
        begin

          dmMSProcedure.fdspParcelasNFS.Params[0].Value := pOpcao;
          dmMSProcedure.fdspParcelasNFS.Params[1].Value := dmMProvider.cdsNFSaidaNFSAIDA.Value;
          dmMSProcedure.fdspParcelasNFS.Params[2].Value := dmMProvider.cdsParcelasNFSDOCUMENTO.Value;
          dmMSProcedure.fdspParcelasNFS.Params[3].Value := dmMProvider.cdsParcelasNFSVENCIMENTO.Value;
          dmMSProcedure.fdspParcelasNFS.Params[4].Value := dmMProvider.cdsParcelasNFSVALOR.Value;
          dmMSProcedure.fdspParcelasNFS.Params[5].Value := dmMProvider.cdsNFSaidaMODELO.Value;
          dmMSProcedure.fdspParcelasNFS.Params[6].Value := dmDBEXMaster.iIdFilial;
          dmMSProcedure.fdspParcelasNFS.ExecProc;

        end;

        dmMProvider.cdsParcelasNFS.EnableControls;
        dmMProvider.cdsParcelasNFS.First;

        if dmDBEXMaster.fdtMaster.Active then
          dmDBEXMaster.fdtMaster.Commit;

        Result := True;

      except
        on E: exception do
        begin

          if dmDBEXMaster.fdtMaster.Active then
            dmDBEXMaster.fdtMaster.Rollback;

          dmMProvider.cdsParcelasNFE.EnableControls;
          lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + Tratar_Erro_Conexao(E);
          imgErro.Visible := True;
          Result          := False;
          Application.ProcessMessages;

        end;

      end;

    end
    else
      Result := True;

  end
  else
    Result := True;

end;

function TfrmModNFSaida.Man_Tab_TransportadoraNFS(pOpcao: smallint): boolean;
begin

  LimparMSG_ERRO(lblMsg, imgErro);

  try

    dmMSProcedure.fdspTransportadorNFS.Params[0].Value    := pOpcao;
    dmMSProcedure.fdspTransportadorNFS.Params[1].Value    := dmMProvider.cdsNFSaidaNFSAIDA.Value;
    dmMSProcedure.fdspTransportadorNFS.Params[2].Value    := dmMProvider.cdsNFSaidaSERIE.Value;
    dmMSProcedure.fdspTransportadorNFS.Params[3].Value    := dmMProvider.cdsNFSaidaMODELO.Value;
    dmMSProcedure.fdspTransportadorNFS.Params[4].Value    := dmMProvider.cdsTransportadoraNFSCNPJ.Value;

    dmMSProcedure.fdspTransportadorNFS.Params[5].Value    := dmMProvider.cdsTransportadoraNFSISENTO_ICMS.Value;
    dmMSProcedure.fdspTransportadorNFS.Params[6].Value    := dmMProvider.cdsTransportadoraNFSUF.Value;
    dmMSProcedure.fdspTransportadorNFS.Params[7].Value    := dmMProvider.cdsTransportadoraNFSPLACA.Value;
    dmMSProcedure.fdspTransportadorNFS.Params[8].Value    := dmMProvider.cdsTransportadoraNFSRNTC.Value;
    dmMSProcedure.fdspTransportadorNFS.Params[9].Value    := dmMProvider.cdsTransportadoraNFSBC_CALCULO_ICMS_RETENCAO.Value;
    dmMSProcedure.fdspTransportadorNFS.Params[10].Value   := dmMProvider.cdsTransportadoraNFSALIQUOTA_ICMS_RETENCAO.Value;
    dmMSProcedure.fdspTransportadorNFS.Params[11].Value   := dmMProvider.cdsTransportadoraNFSVALOR_DO_SERVICO.Value;
    dmMSProcedure.fdspTransportadorNFS.Params[12].Value   := dmMProvider.cdsTransportadoraNFSUF_RETENCAO.Value;
    dmMSProcedure.fdspTransportadorNFS.Params[13].Value   := dmMProvider.cdsTransportadoraNFSMUNICIPIO_RETENCAO.Value;
    dmMSProcedure.fdspTransportadorNFS.Params[14].Value   := dmMProvider.cdsTransportadoraNFSCFOP_RETENCAO.Value;
    dmMSProcedure.fdspTransportadorNFS.Params[15].Value   := dmMProvider.cdsTransportadoraNFSVALOR_ICMS_RETENCAO.Value;
    dmMSProcedure.fdspTransportadorNFS.Params[16].Value   := dmDBEXMaster.iIdFilial;
    dmMSProcedure.fdspTransportadorNFS.Params[17].Value   := dmMProvider.cdsTransportadoraNFSTRANSPORTADOR.Value;

    dmMSProcedure.fdspTransportadorNFS.ExecProc;

    Result := True;

  except
    on E: exception do
    begin

      lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + Tratar_Erro_Conexao(E);
      imgErro.Visible := True;
      Result          := False;
      Application.ProcessMessages;

    end;

  end;

end;

function TfrmModNFSaida.ValidarIBGE_CIDADE(pCidade: integer): boolean;
begin

  if dmMProvider.cdsPesqClientesPAIS.Value = dmMProvider.cdsFilialPAIS.Value then
  begin

    dmMProvider.cdsCidades.Close;
    dmMProvider.cdsCidades.ProviderName := 'dspCidades';

    dmDBEXMaster.fdqCidades.SQL.Clear;
    dmDBEXMaster.fdqCidades.SQL.Add('SELECT * FROM CIDADES');
    dmDBEXMaster.fdqCidades.SQL.Add('WHERE CIDADE = ' + IntToStr(pCidade));

    dmMProvider.cdsCidades.Open;
    dmMProvider.cdsCidades.ProviderName := '';

    Result := dmMProvider.cdsCidadesCODIGO_MUNICIPIO.Value > 0;

  end
  else
    Result := true;

end;

function TfrmModNFSaida.ValidarIBGE_UF(pUF: string): boolean;
begin

  if dmMProvider.cdsPesqClientesPAIS.Value = dmMProvider.cdsFilialPAIS.Value then
  begin

    dmMProvider.cdsEstados.Close;
    dmMProvider.cdsEstados.ProviderName := 'dspEstados';

    dmDBEXMaster.fdqEstados.SQL.Clear;
    dmDBEXMaster.fdqEstados.SQL.Add('SELECT * FROM ESTADOS');
    dmDBEXMaster.fdqEstados.SQL.Add('WHERE SIGLA = ' + QuotedStr(pUf));

    dmMProvider.cdsEstados.Open;
    dmMProvider.cdsEstados.ProviderName := '';

    Result := dmMProvider.cdsEstadosCODIGO_ESTADO_IBGE.Value > 0;

  end
  else
    Result := true;

end;

function TfrmModNFSaida.ValidarNCM(pNCM: string): boolean;
begin

  dmMProvider.cdsNcmNbs.Close;
  dmMProvider.cdsNcmNbs.ProviderName := 'dspNcmNbs';

  dmDBEXMaster.fdqNcmNbs.SQL.Clear;
  dmDBEXMaster.fdqNcmNbs.SQL.Add('SELECT * FROM NBM_NCM');
  dmDBEXMaster.fdqNcmNbs.SQL.Add('WHERE COD_NCM = ' + QuotedStr(Trim(edtNCM.Text)));

  dmMProvider.cdsNcmNbs.Open;
  dmMProvider.cdsNcmNbs.ProviderName := '';

  if dmMProvider.cdsNcmNbs.IsEmpty then
  begin

    lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA + ' NCM: ' + edtNCM.Text;
    imgErro.Visible := True;
    Application.ProcessMessages;
    edtNCM.SetFocus;

    Result := False;

  end
  else
  begin

    Result := dmMProvider.cdsNcmNbsDATA_TERMINO.Value >= Date;

    if dmMProvider.cdsNcmNbsDATA_TERMINO.Value < Date then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', o NCM ' + pNCM + ' teve sua vig�ncia encerrada em: ' + FormatDateTime('dd/mm/yyyy',dmMProvider.cdsNcmNbsDATA_TERMINO.Value)
                        + ', verifique o cadastro do item';
      Application.ProcessMessages;
      edtNCM.SetFocus;

    end;

  end;

end;

{ TDBGrid }

procedure TDBGrid.DrawCellBackground(const ARect: TRect; AColor: TColor; AState: TGridDrawState; ACol, ARow: Integer);
begin
  inherited;

  if ACol < 0 then
    inherited DrawCellBackground(ARect, AColor, AState, ACol, ARow)
  else
    inherited DrawCellBackground(ARect, Columns[ACol].Title.Color, AState,
      ACol, ARow)

end;

end.
