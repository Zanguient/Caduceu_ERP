unit modComfiguracoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, midaslib, Vcl.ComCtrls, Vcl.CheckLst, Vcl.DBCtrls,
  Vcl.Samples.Spin, Vcl.Mask, Vcl.DBLookup, System.Actions, Vcl.ActnList,
  db, FileCtrl;

type
  TfrmConfiguracoes = class(TForm)
    grpMensagem: TGroupBox;
    lblMsg: TLabel;
    imgSair: TImage;
    imgEditar: TImage;
    lblF6: TLabel;
    imgSalvar: TImage;
    lblF4: TLabel;
    imgDesfazer: TImage;
    pgcConfig: TPageControl;
    lblF3: TLabel;
    tbsGeral: TTabSheet;
    tbsFrenteDeLoja: TTabSheet;
    tbsBalanca: TTabSheet;
    tbFinanceiro: TTabSheet;
    tbsEquipamentos: TTabSheet;
    grpGeral: TGroupBox;
    grpOpcosSistema: TGroupBox;
    chkUtilizarPrecoAtacado: TDBCheckBox;
    chkCalculoPrecoCLD: TDBCheckBox;
    chkUnificarPrecoVenda: TDBCheckBox;
    chkUtilizarSimilarPreco: TDBCheckBox;
    chkAtualizarCustosSimilar: TDBCheckBox;
    chkVisualizarSimilarAtualizacao: TDBCheckBox;
    chkTotalizaCFOPNFE: TDBCheckBox;
    grpOpcoesBackup: TGroupBox;
    grpIntervaloBackup: TGroupBox;
    lblMinutos: TLabel;
    grpLocais: TGroupBox;
    lblLocal1: TLabel;
    lblLocal2: TLabel;
    edtBackup_Pasta1: TDBEdit;
    edtBackup_Past2: TDBEdit;
    imgPastaBackup: TImage;
    grpNFe: TGroupBox;
    lblSerieNFE: TLabel;
    edtSerieNFE: TDBEdit;
    edtUltimaNFE: TDBEdit;
    imgUltimaNFE: TImage;
    lblUltimaNFEImpressa: TLabel;
    lblModeloNF: TLabel;
    cboModeloNF: TDBLookupCombo;
    grpFrenteDeLoja: TGroupBox;
    rdgSistemFrenteLoja: TDBRadioGroup;
    rdgTratamentoDeValores: TDBRadioGroup;
    rdgUsarDVExportacaoPDV: TDBRadioGroup;
    grpExportacaoPDV: TGroupBox;
    grpPastaExportaPDV: TGroupBox;
    edtPath_Exporta_PDV: TDBEdit;
    imgPathExportacao: TImage;
    grpArquivosExportacaoPDV: TGroupBox;
    lblArqProdutoGeral: TLabel;
    lblArqProdutoAlterado: TLabel;
    lblArqProdutoImediato: TLabel;
    lblArqVendedores: TLabel;
    lblArquivoCliente: TLabel;
    lblArqFormaPagamento: TLabel;
    lblArqDepartamento: TLabel;
    lblArqFornecedor: TLabel;
    lblArqAliquotas: TLabel;
    lblArqBancos: TLabel;
    lblArqMensagens: TLabel;
    lblArqCestaBasica: TLabel;
    lblArqListanegra: TLabel;
    edtArqProdutoGeral: TDBEdit;
    edtArqProdutoAlterado: TDBEdit;
    edtArqProdutoImediato: TDBEdit;
    edtArqVendedores: TDBEdit;
    edtArqClientes: TDBEdit;
    edtArqFormapagto: TDBEdit;
    edtArqDepartamento: TDBEdit;
    edtArqFornecedor: TDBEdit;
    edtArqAliquotas: TDBEdit;
    edtArqBancos: TDBEdit;
    edtArqMensagens: TDBEdit;
    edtArqCestaBasica: TDBEdit;
    edtArqListaNegra: TDBEdit;
    grpImportacao: TGroupBox;
    grpPathImportacao: TGroupBox;
    imgPathImportacaoPDV: TImage;
    edtPath_Importa_PDV: TDBEdit;
    grpArquivoImportacaoPDV: TGroupBox;
    lblArqMovimentoVnda: TLabel;
    lblArqRecebimentos: TLabel;
    lblArqVendaCliente: TLabel;
    lblArqDeCheques: TLabel;
    lblArqNotaFiscal: TLabel;
    lblArqCupomDiario: TLabel;
    lblArqItensCupom: TLabel;
    lblArqEstoqueInventario: TLabel;
    lblArqTef: TLabel;
    lblArqPedido: TLabel;
    edtArqMovimentoVenda: TDBEdit;
    edtArqRecebimentos: TDBEdit;
    edtArqVendaCliente: TDBEdit;
    edtArqCheques: TDBEdit;
    edtArqNotaFiscal: TDBEdit;
    edtArqCupomDiario: TDBEdit;
    edtArqItensCupom: TDBEdit;
    edtArqEstoqueInventario: TDBEdit;
    edtArqTEF: TDBEdit;
    edtArqPedido: TDBEdit;
    edtIntervalobackup: TDBEdit;
    lblQtdPDV: TLabel;
    edtQtdPDV: TDBEdit;
    imgConfigCaixas: TImage;
    ActionList1: TActionList;
    actAbrirPasta: TAction;
    FileOpenDialog1: TFileOpenDialog;
    grpBalanca: TGroupBox;
    rdgSistemaBalanca: TDBRadioGroup;
    rdgQuantideTeclasBalanca: TDBRadioGroup;
    grpExportacaoBalanca: TGroupBox;
    grpPathExportacaoBalanca: TGroupBox;
    imgPathExportacaoBalanca: TImage;
    edtPathExportacaoBalanaca: TDBEdit;
    grpArquivosExportacaoBalanca: TGroupBox;
    lblArquivoDEProdutos: TLabel;
    lblArquivoDeSetor: TLabel;
    lblArquivoDeReceitas: TLabel;
    lblArquivoDeTeclado: TLabel;
    lblArquivoDeMensagens: TLabel;
    lblArquivoDeTextoGen: TLabel;
    lblArquivoInfoNutricional: TLabel;
    edtArquivoDeProdutos: TDBEdit;
    edtArquivoDeSetor: TDBEdit;
    edtArquivoDeReceitas: TDBEdit;
    edtArquivoDeTeclado: TDBEdit;
    edtArquivoDeMensagens: TDBEdit;
    edtArquivoDeTextoGen: TDBEdit;
    edtArquivoInfoNutricional: TDBEdit;
    grpFinanceiro: TGroupBox;
    grpInstrucaoCobranca: TGroupBox;
    grpMulta: TGroupBox;
    lblIndiceMulta: TLabel;
    edtMulta: TDBEdit;
    rdgTipoMulta: TDBRadioGroup;
    grpMoradiaria: TGroupBox;
    lblMoradiaria: TLabel;
    edtMoradiaria: TDBEdit;
    rdgTipoIndiceMuoraDiaria: TDBRadioGroup;
    chkUsarCobrRegistrada: TDBCheckBox;
    chkCobrImpBanco: TDBCheckBox;
    chkUtilizaCobrNagnetica: TDBCheckBox;
    rdgTipoImpressaoCobranca: TDBRadioGroup;
    GroupBox1: TGroupBox;
    lblEnderecoServidor: TLabel;
    cboTipoServidor: TComboBox;
    lblTipoServidor: TLabel;
    edtEnderecoServidor: TEdit;
    lblProtocoloServidor: TLabel;
    cboProtocoServidor: TComboBox;
    lblVersaoServidor: TLabel;
    cboVersaoServidor: TComboBox;
    actSalvar: TAction;
    lblBancoDeDados: TLabel;
    DBEdit1: TDBEdit;
    imgPathBancoDeDados: TImage;
    procedure FormCreate(Sender: TObject);
    procedure imgSairClick(Sender: TObject);
    procedure edtBackup_Pasta1Enter(Sender: TObject);
    procedure edtBackup_Past2Enter(Sender: TObject);
    procedure actAbrirPastaExecute(Sender: TObject);
    procedure imgPastaBackupClick(Sender: TObject);
    procedure imgPathExportacaoClick(Sender: TObject);
    procedure imgPathExportacaoBalancaClick(Sender: TObject);
    procedure imgPathImportacaoPDVClick(Sender: TObject);
    procedure cboTipoServidorChange(Sender: TObject);
    procedure edtEnderecoServidorEnter(Sender: TObject);
    procedure edtEnderecoServidorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtEnderecoServidorKeyPress(Sender: TObject; var Key: Char);
    procedure edtEnderecoServidorExit(Sender: TObject);
    procedure imgPathBancoDeDadosClick(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
  private
    { Private declarations }
    procedure LimparMSG_ERRO;
  public
    { Public declarations }
  end;

var
  frmConfiguracoes: TfrmConfiguracoes;

implementation

{$R *.dfm}

uses dataDBEXMaster, dataMProvider, dataMSource, dataMSProcedure,
  uConstantes_Padrao, uFuncoes;

procedure TfrmConfiguracoes.actAbrirPastaExecute(Sender: TObject);
var
  sPath: string;
begin

  with FileOpenDialog1 do
  begin

    Title         := 'Selecione uma pasta';
    Options       := [fdoPickFolders, fdoPathMustExist, fdoForceFileSystem];
    OkButtonLabel := 'Selecionar';
    DefaultFolder := ExtractFilePath(paramstr(0));
    FileName      := sPath;

    if Execute then
    begin

      if not (dmMProvider.cdsConfiguracoes.State in [dsEdit, dsInsert]) then
        dmMProvider.cdsConfiguracoes.Edit;

      case frmConfiguracoes.Tag of
        0:dmMProvider.cdsConfiguracoesPATH_BACKUP_1.AsString            := FileName;
        1:dmMProvider.cdsConfiguracoesPATH_BACKUP_2.AsString            := FileName;
        2:dmMProvider.cdsConfiguracoesPATH_EXPORTACAO_PDV.AsString      := FileName;
        3:dmMProvider.cdsConfiguracoesPATH_IMPORTACAO_PDV.AsString      := FileName;
        4:dmMProvider.cdsConfiguracoesPATH_EXPORTACAO_BALANCA.AsString  := FileName;
        5:dmMProvider.cdsConfiguracoesPATH_BANCO_DE_DADOS.AsString      := FileName;
      end;

    end;

  end;

  frmConfiguracoes.Tag:= 0;

end;

procedure TfrmConfiguracoes.actSalvarExecute(Sender: TObject);
begin

  if dmMProvider.cdsConfiguracoes.State in [dsEdit, dsInsert] then
  begin


    dmMProvider.cdsConfiguracoes.Post;


  end;
end;

procedure TfrmConfiguracoes.cboTipoServidorChange(Sender: TObject);
begin

  if cboTipoServidor.ItemIndex = 0 then

    edtEnderecoServidor.Text := '127.0.0.1'

  else
  begin

    edtEnderecoServidor.Clear;
    edtEnderecoServidor.SetFocus;

  end;

end;

procedure TfrmConfiguracoes.edtBackup_Past2Enter(Sender: TObject);
begin

  frmConfiguracoes.Tag := ord(Backup2);

end;

procedure TfrmConfiguracoes.edtBackup_Pasta1Enter(Sender: TObject);
begin

  frmConfiguracoes.Tag := ord(Backup1);

end;

procedure TfrmConfiguracoes.edtEnderecoServidorEnter(Sender: TObject);
begin

  MudarCorEdit(Sender);

end;

procedure TfrmConfiguracoes.edtEnderecoServidorExit(Sender: TObject);
begin

  LimparMSG_ERRO;

  if Length(Trim(edtEnderecoServidor.Text)) > 0 then
  begin

    if not ValidarIP(Trim(edtEnderecoServidor.Text)) then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_NUMERO_IP_INVALIDO;
      edtEnderecoServidor.SetFocus;

    end;

  end;

  MudarCorEdit(sender);

end;

procedure TfrmConfiguracoes.edtEnderecoServidorKeyDown(Sender: TObject;
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

procedure TfrmConfiguracoes.edtEnderecoServidorKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end

end;

procedure TfrmConfiguracoes.FormCreate(Sender: TObject);
begin

  DesabilitarBotaoFecharForm(self.Handle);

  Color                     := COR_PADRAO_TELAS;

  Caption                   := ' ' + Application.Title + ' - ' + RetornarVersao(ParamStr(0),1) + 'xe';

  dmDBEXMaster.sNomeUsuario := ParamStr(1);
  dmDBEXMaster.sSenha       := paramstr(2);
  dmDBEXMaster.iIdUsuario   := StrToInt(ParamStr(3));
  dmDBEXMaster.iIdFilial    := StrToInt(ParamStr(4));

  pgcConfig.ActivePageIndex := 0;

  dmMProvider.cdsConfiguracoes.Open;
  dmMProvider.cdsConfiguracoes.ProviderName := '';

end;

procedure TfrmConfiguracoes.imgPathBancoDeDadosClick(Sender: TObject);
begin

  Tag := ord(path_banco_dados);

  actAbrirPastaExecute(self);

end;

procedure TfrmConfiguracoes.imgPathImportacaoPDVClick(Sender: TObject);
begin

  Tag := ord(Importacao_pdv);

  actAbrirPastaExecute(self);

end;

procedure TfrmConfiguracoes.imgPastaBackupClick(Sender: TObject);
begin

  actAbrirPastaExecute(self);

end;

procedure TfrmConfiguracoes.imgPathExportacaoBalancaClick(Sender: TObject);
begin

  frmConfiguracoes.Tag := ord(Exportacao_balanca);

  actAbrirPastaExecute(self);

end;

procedure TfrmConfiguracoes.imgPathExportacaoClick(Sender: TObject);
begin

  frmConfiguracoes.Tag := ord(Exportacao_pdv);

  actAbrirPastaExecute(self);

end;

procedure TfrmConfiguracoes.imgSairClick(Sender: TObject);
begin

  close;

end;

procedure TfrmConfiguracoes.LimparMSG_ERRO;
begin

  lblMsg.Caption := '';
  Application.ProcessMessages;

end;

end.
