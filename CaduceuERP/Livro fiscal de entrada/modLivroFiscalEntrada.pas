unit modLivroFiscalEntrada;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, Vcl.Graphics, Vcl.Forms,
  Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ExtCtrls, System.Classes, Vcl.Controls,
  Vcl.Grids, System.IniFiles, Vcl.Menus, System.Actions, Vcl.ActnList,
  Vcl.Mask, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.DBGrids, Vcl.ToolWin, System.DateUtils;
type
  TfrmModLivrosFiscais = class(TForm)
    tbrFerramentas: TToolBar;
    btnIncluir: TToolButton;
    btnDesfazer: TToolButton;
    btnSalvar: TToolButton;
    btnExcluir: TToolButton;
    btnEditar: TToolButton;
    btnConfirmarNF: TToolButton;
    btnSair: TToolButton;
    grpPesquisa: TGroupBox;
    edtPesquisa: TEdit;
    pgcLivroFiscalEntrada: TPageControl;
    tbsTabela: TTabSheet;
    grdConsulta: TDBGrid;
    pnlMsgAguarde: TPanel;
    tbsCadastro: TTabSheet;
    stbAtalho: TStatusBar;
    pnlTotais: TPanel;
    pnlTitulo: TPanel;
    grpEmpresa: TGroupBox;
    grpCodigoValorFiscal: TGroupBox;
    lblRSocial: TLabel;
    lblInscrEstadual: TLabel;
    lblCnpj: TLabel;
    lblMesAnoReferencia: TLabel;
    edtRSocial: TEdit;
    edtInscrEstadual: TEdit;
    edtCNPJ: TEdit;
    edtMesAnoReferencia: TEdit;
    lblOperacaoCreditoImposto: TLabel;
    lblOperacaoSemCreditoImposto: TLabel;
    lblOperacaoSemCreditoOutras: TLabel;
    grpDocumentosFiscais: TGroupBox;
    lblDataEntrada: TLabel;
    edtDataEntrada: TDBEdit;
    lblEspecieDocumento: TLabel;
    edtEspecieDocumento: TDBEdit;
    edtSerieSubSerie: TDBEdit;
    lblSerieSubSerie: TLabel;
    lblNumeroDocumento: TLabel;
    edtNumeroDocumento: TDBEdit;
    edtDataDocumento: TDBEdit;
    lblEmissao: TLabel;
    lblUFOrigem: TLabel;
    edtUFOrigem: TDBEdit;
    edtValorContabil: TDBEdit;
    lblValorContabil: TLabel;
    lblCfop: TLabel;
    edtCfop: TDBEdit;
    grpValoresFiscais: TGroupBox;
    grpIdentICMS_IPI: TDBRadioGroup;
    lblCodigoFiscal: TLabel;
    edtCodigoFiscal: TDBEdit;
    edtBaseCalculo: TDBEdit;
    lblBaseCalculo: TLabel;
    lblAliquota: TLabel;
    edtAliquota: TDBEdit;
    edtImpostoCreditado: TDBEdit;
    lblImpostoCreditado: TLabel;
    lblObservacao: TLabel;
    edtObservacao: TDBEdit;
    grpValorContabil: TGroupBox;
    grpBaseCalculo: TGroupBox;
    grpImpostoCreditado: TGroupBox;
    grpIsentasNTributada: TGroupBox;
    GroupBox1: TGroupBox;
    edtTotalValorContabil: TEdit;
    edtTotalBaseCalculo: TEdit;
    edtTotalImpostoCreditado: TEdit;
    edtTotalIsentasNtributadas: TEdit;
    edtTotalOutras: TEdit;
    pnlBotoesTotais: TPanel;
    btnTotalporCFOP: TButton;
    btnTotaisporAliquota: TButton;
    btnDemonstrativoEntradas: TButton;
    Panel1: TPanel;
    actLivroEntrada: TActionList;
    actIncluir: TAction;
    actCancelar: TAction;
    actSalvar: TAction;
    actExcluir: TAction;
    actEditar: TAction;
    actSair: TAction;
    actImprimir: TAction;
    Label1: TLabel;
    edtMesAno: TDBEdit;
    grpPeriodo: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    grpMesAno: TGroupBox;
    edtDataInicial: TMaskEdit;
    edtDataFinal: TMaskEdit;
    cboPeriodoApuracao: TComboBox;
    mnuLimparPeriodo: TPopupMenu;
    Limpar1: TMenuItem;
    Label4: TLabel;
    edtCnpjEmitente: TDBEdit;
    chkFrete: TCheckBox;
    chkOrdenarPorEmissao: TCheckBox;
    fdqSelecionaPeriodo: TFDQuery;
    fdqTotalizaValorContabil: TFDQuery;
    fdqTotalizaBase: TFDQuery;
    fdqTotalizaAliquotas: TFDQuery;
    fdqTotalizaImpCreditado: TFDQuery;
    fdqTotalizaOutras: TFDQuery;
    fdqTotalizaIsentasNT: TFDQuery;
    btnCSV: TButton;
    procedure FormCreate(Sender: TObject);
    procedure rdpPesquisaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure edtPesquisaEnter(Sender: TObject);
    procedure edtPesquisaExit(Sender: TObject);
    procedure edtPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure edtPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure stbAtalhoDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
      const Rect: TRect);
    procedure actSairExecute(Sender: TObject);
    procedure edtDataEntradaExit(Sender: TObject);
    procedure grdConsultaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdConsultaDblClick(Sender: TObject);
    procedure grdConsultaKeyPress(Sender: TObject; var Key: Char);
    procedure actIncluirExecute(Sender: TObject);
    procedure edtValorContabilKeyPress(Sender: TObject; var Key: Char);
    procedure actSalvarExecute(Sender: TObject);
    procedure edtAliquotaExit(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure edtMesAnoKeyPress(Sender: TObject; var Key: Char);
    procedure actCancelarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure edtValorContabilExit(Sender: TObject);
    procedure edtUFOrigemExit(Sender: TObject);
    procedure edtCfopExit(Sender: TObject);
    procedure edtCfopKeyPress(Sender: TObject; var Key: Char);
    procedure btnTotalporCFOPClick(Sender: TObject);
    procedure btnTotaisporAliquotaClick(Sender: TObject);
    procedure btnDemonstrativoEntradasClick(Sender: TObject);
    procedure edtDataInicialExit(Sender: TObject);
    procedure edtDataFinalExit(Sender: TObject);
    procedure Limpar1Click(Sender: TObject);
    procedure edtDataInicialEnter(Sender: TObject);
    procedure edtDataFinalEnter(Sender: TObject);
    procedure cboPeriodoApuracaoExit(Sender: TObject);
    procedure actImprimirExecute(Sender: TObject);
    procedure edtCnpjEmitenteExit(Sender: TObject);
    procedure chkFreteClick(Sender: TObject);
    procedure btnCSVClick(Sender: TObject);
  private
    { Private declarations }
    ifArqIni: TIniFile;
    sWhere: string;
    procedure HabilitarDesabilitarControles;
    procedure Totalizar_Valor_Contabil;
    procedure Totalizar_Base_Calculo;
    procedure Totalizar_Imposto_Creditado;
    procedure Totalizar_Isentas_NT;
    procedure Totalizar_Outras;
    function ValidarEstado(pEstado: string): boolean;
    function ValidarCfop(pCfop: string): boolean;
    procedure GravarRegistro70;
    function Man_Tab_LivroFiscalEntrada(pOpcao:integer):boolean;
    procedure AbrirLivro;
    procedure TotalizarOperInterEstduais;
    procedure TotalizarValoresOutras;
    procedure TotalizarAliquotas;
    procedure TotalizarLivro;
  public
    { Public declarations }
    iLinha: Integer;
  end;

var
  frmModLivrosFiscais: TfrmModLivrosFiscais;

implementation

uses modTotaisAliquotas, dataDBEXMaster, uFuncoes, dataMProvider, dataMSource,
  dataMSProcedure, uConstantes_Padrao, modTotaisInterEstaduais, modTotaisCfop,
  dataMRelatorios, uFuncoes_BD;
{$R *.dfm}

procedure TfrmModLivrosFiscais.actCancelarExecute(Sender: TObject);
begin

  if dmMProvider.cdsLivroFiscalEntrada.State in [dsInsert] then
  begin

    HabilitarDesabilitarControles;
    dmMProvider.cdsLivroFiscalEntrada.Cancel;
    pgcLivroFiscalEntrada.ActivePageIndex := 0;
    edtPesquisa.Clear;
    edtPesquisa.SetFocus;

  end
  else if InserindoEditando(dmMProvider.cdsLivroFiscalEntrada) then
  begin

    HabilitarDesabilitarControles;
    dmMProvider.cdsLivroFiscalEntrada.Cancel;
    Totalizar_Valor_Contabil;
    Totalizar_Base_Calculo;
    Totalizar_Imposto_Creditado;
    Totalizar_Isentas_NT;
    Totalizar_Outras;

    edtPesquisa.Clear;
    edtPesquisa.SetFocus;

  end;

end;

procedure TfrmModLivrosFiscais.actEditarExecute(Sender: TObject);
begin

  if dmMProvider.cdsLivroFiscalEntrada.Active then
  begin

    if not dmMProvider.cdsLivroFiscalEntrada.IsEmpty then
    begin

      HabilitarDesabilitarControles;
      edtDataEntrada.SetFocus;
      edtDataEntrada.SelectAll;

    end;

  end;

end;

procedure TfrmModLivrosFiscais.actExcluirExecute(Sender: TObject);
begin

  if Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + ', ' + MSG_CONFIRMA_EXCLUSAO), 'Aten��o!', mb_IconQuestion + mb_DefButton2 + mb_YesNo) = idYes then
  begin

    if dmMProvider.cdsLivroFiscalEntrada.Active then
    begin

      if not dmMProvider.cdsLivroFiscalEntrada.IsEmpty then
      begin

        if not InserindoEditando(dmMProvider.cdsLivroFiscalEntrada) then
        begin

          if Man_Tab_LivroFiscalEntrada(-1) then
          begin

            Totalizar_Valor_Contabil;
            Totalizar_Base_Calculo;
            Totalizar_Imposto_Creditado;
            Totalizar_Isentas_NT;
            Totalizar_Outras;

          end;

        end;

      end;

    end;

  end;

end;

procedure TfrmModLivrosFiscais.actImprimirExecute(Sender: TObject);
begin

  if not dmMProvider.cdsLivroFiscalEntrada.IsEmpty then
  begin

    AbrirLivro;

    TotalizarOperInterEstduais;

    TotalizarValoresOutras;

    TotalizarAliquotas;

    TotalizarLivro;

    if FileExists(ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Diversos.rav') then
    begin

      dmRelatorios.rvpGenesisAC.ProjectFile := ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Diversos.rav';
      dmRelatorios.rvpGenesisAC.SelectReport('rptLivroEntrada_P1',true);
      dmRelatorios.rvpGenesisAC.SetParam('pReferenciaLivro',RetornaPeriodoReferencia(dmMProvider.cdsLivroFiscalEntradaDATA_ENTRADA.Value));
      dmRelatorios.rvpGenesisAC.Execute;
      dmRelatorios.rvpGenesisAC.Close;

    end
    else
      Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + ', ' + MSG_ARQ_NEXISTE + #13
      + ExtractFilePath(Application.ExeName)+'Rav\Relatorios_Diversos.rav'), 'Aten��o!',mb_IconWarning + mb_Ok);

  end;

end;

procedure TfrmModLivrosFiscais.actIncluirExecute(Sender: TObject);
begin

  pgcLivroFiscalEntrada.ActivePageIndex := 1;
  HabilitarDesabilitarControles;

  dmMProvider.cdsLivroFiscalEntrada.Close;
  dmMProvider.cdsLivroFiscalEntrada.ProviderName := 'dspLivroFiscalEntrada';

  dmDBEXMaster.fdqLivroFiscalEntrada.SQL.Clear;
  dmDBEXMaster.fdqLivroFiscalEntrada.SQL.Add('SELECT * FROM LIVRO_ENTRADA');
  dmDBEXMaster.fdqLivroFiscalEntrada.SQL.Add('WHERE LIVRO_ENTRADA = -1');

  dmMProvider.cdsLivroFiscalEntrada.Open;
  dmMProvider.cdsLivroFiscalEntrada.ProviderName := '';

  edtDataEntrada.SetFocus;
  edtDataEntrada.SelectAll;

end;

procedure TfrmModLivrosFiscais.actSairExecute(Sender: TObject);
begin

  Close;

end;

procedure TfrmModLivrosFiscais.actSalvarExecute(Sender: TObject);
begin

  if dmMProvider.cdsLivroFiscalEntrada.Active then
  begin

    if not dmMProvider.cdsLivroFiscalEntrada.IsEmpty then
    begin

      if InserindoEditando(dmMProvider.cdsLivroFiscalEntrada) then
      begin

        if Man_Tab_LivroFiscalEntrada(0) then
        begin

          Totalizar_Valor_Contabil;
          Totalizar_Base_Calculo;
          Totalizar_Imposto_Creditado;
          Totalizar_Isentas_NT;
          Totalizar_Outras;

          if dmMProvider.cdsLivroFiscalEntradaTIPO_ESPECIE_DOCUMENTO.Value = 'CTR' then
            GravarRegistro70;

          HabilitarDesabilitarControles;

        end;

      end;

    end;

  end;

end;

procedure TfrmModLivrosFiscais.btnCSVClick(Sender: TObject);
begin

  try

    ForceDirectories(ExtractFilePath(paramstr(0) + 'CVS\'));

    if ExportarExcel(dmMProvider.cdsLivroFiscalEntrada,'Livro_Fiscal_Entrada.CSV',False,0) then
      Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + ', arquivo: ' + ExtractFilePath(ParamStr(0)) + 'Livro_Fiscal_Entrada.CSV' + ' gerado com sucesso'), 'Informa��o!', MB_ICONINFORMATION + mb_Ok);

  except

  end;


end;

procedure TfrmModLivrosFiscais.btnDemonstrativoEntradasClick(Sender: TObject);
begin

  frmTotaisInterEstaduais := tfrmTotaisInterEstaduais.Create(self);
  frmTotaisInterEstaduais.ShowModal;
  FreeAndNil(frmTotaisInterEstaduais);

end;

procedure TfrmModLivrosFiscais.btnTotaisporAliquotaClick(Sender: TObject);
begin

  frmTotaisAliquotas := TfrmTotaisAliquotas.Create(self);
  frmTotaisAliquotas.ShowModal;
  FreeAndNil(frmTotaisAliquotas);

end;

procedure TfrmModLivrosFiscais.btnTotalporCFOPClick(Sender: TObject);
begin

  frmTotaisCfop := tfrmTotaisCfop.Create(SELF);
  frmTotaisCfop.ShowModal;
  FreeAndNil(frmTotaisCfop);

end;

procedure TfrmModLivrosFiscais.cboPeriodoApuracaoExit(Sender: TObject);
begin

  if cboPeriodoApuracao.Text <> '' then
  begin

    dmMProvider.cdsLivroFiscalEntrada.Close;
    dmMProvider.cdsLivroFiscalEntrada.ProviderName := 'dspLivroFiscalEntrada';

    dmDBEXMaster.fdqLivroFiscalEntrada.SQL.Clear;
    dmDBEXMaster.fdqLivroFiscalEntrada.SQL.Add('SELECT * FROM LIVRO_ENTRADA');

    sWhere := 'WHERE MES_ANO = ' + QuotedStr(cboPeriodoApuracao.Text);

    dmDBEXMaster.fdqLivroFiscalEntrada.SQL.Add(sWhere);

    if chkOrdenarPorEmissao.Checked then
      dmDBEXMaster.fdqLivroFiscalEntrada.SQL.Add('ORDER BY DATA_DOCUMENTO')
    else
      dmDBEXMaster.fdqLivroFiscalEntrada.SQL.Add('ORDER BY DATA_ENTRADA');

    dmMProvider.cdsLivroFiscalEntrada.Open;
    dmMProvider.cdsLivroFiscalEntrada.ProviderName := '';

    if not dmMProvider.cdsLivroFiscalEntrada.IsEmpty then
    begin

      Totalizar_Valor_Contabil;
      Totalizar_Base_Calculo;
      Totalizar_Imposto_Creditado;
      Totalizar_Isentas_NT;
      Totalizar_Outras;

      edtPesquisa.Clear;
      grdConsulta.SetFocus;

    end;

  end;

end;

procedure TfrmModLivrosFiscais.chkFreteClick(Sender: TObject);
begin

  if dmMProvider.cdsLivroFiscalEntrada.Active then
  begin

    if not dmMProvider.cdsLivroFiscalEntrada.IsEmpty then
    begin

      if not InserindoEditando(dmMProvider.cdsLivroFiscalEntrada) then
        dmMProvider.cdsLivroFiscalEntrada.Edit;

      dmMProvider.cdsLivroFiscalEntradaTIPO_ESPECIE_DOCUMENTO.Value := 'CTR';

    end;

  end;

end;

procedure TfrmModLivrosFiscais.edtAliquotaExit(Sender: TObject);
begin

  MudarCorEdit(edtPesquisa);

  if InserindoEditando(dmMProvider.cdsLivroFiscalEntrada) then
    dmMProvider.cdsLivroFiscalEntradaIMPOSTO_CREDITADO.Value := dmMProvider.cdsLivroFiscalEntradaBASE_CALCULO_VALOR_OPERACAO.Value *(dmMProvider.cdsLivroFiscalEntradaALIQUOTA.Value / 100);

end;

procedure TfrmModLivrosFiscais.edtCfopExit(Sender: TObject);
begin

  MudarCorEdit(edtPesquisa);

  if InserindoEditando(dmMProvider.cdsLivroFiscalEntrada) then
    if not ValidarCfop(edtCfop.Text) then
    begin

      Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + ', ' + MSG_PESQUISA), 'Aten��o!', mb_IconWarning + mb_Ok);
      edtCfop.SetFocus;
      edtCfop.SelectAll;

    end;

end;

procedure TfrmModLivrosFiscais.edtCfopKeyPress(Sender: TObject; var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(handle, WM_KEYDOWN, VK_TAB, 1);

  end
  else
  begin

    if Key <> #8 then
      if not(Key in ['0' .. '9']) then
        abort;

  end;

end;

procedure TfrmModLivrosFiscais.edtCnpjEmitenteExit(Sender: TObject);
begin

  MudarCorEdit(edtPesquisa);

end;

procedure TfrmModLivrosFiscais.edtDataEntradaExit(Sender: TObject);
begin

  MudarCorEdit(edtPesquisa);

  if InserindoEditando(dmMProvider.cdsLivroFiscalEntrada) then
  begin

    dmMProvider.cdsLivroFiscalEntradaMES_ANO.Value        := FormatDateTime('mmyyyy',dmMProvider.cdsLivroFiscalEntradaDATA_ENTRADA.Value);
    dmMProvider.cdsLivroFiscalEntradaDATA_DOCUMENTO.Value := dmMProvider.cdsLivroFiscalEntradaDATA_ENTRADA.Value;

  end;

end;

procedure TfrmModLivrosFiscais.edtDataFinalEnter(Sender: TObject);
begin

  MudarCorEdit(Sender);

end;

procedure TfrmModLivrosFiscais.edtDataFinalExit(Sender: TObject);
begin

  MudarCorEdit(Sender);

  try

    if edtDataFinal.Text <> '  /  /    ' then
    begin

      edtDataFinal.Text                     := FormatDateTime('dd/mm/yyyy', StrToDate(edtDataFinal.Text));

      pgcLivroFiscalEntrada.ActivePageIndex := 0;

      dmMProvider.cdsLivroFiscalEntrada.Close;
      dmMProvider.cdsLivroFiscalEntrada.ProviderName := 'dspLivroFiscalEntrada';

      dmDBEXMaster.fdqLivroFiscalEntrada.Close;
      dmDBEXMaster.fdqLivroFiscalEntrada.SQL.Clear;
      dmDBEXMaster.fdqLivroFiscalEntrada.SQL.Add('SELECT * FROM LIVRO_ENTRADA');

      sWhere := 'WHERE DATA_ENTRADA BETWEEN ' + QuotedStr(FormatDateTime('mm/dd/yy', StrToDate(edtDataInicial.Text))) + ' AND ' + QuotedStr(FormatDateTime('mm/dd/yy', StrToDate(edtDataFinal.Text)));

      if sWhere <> '' then
        dmDBEXMaster.fdqLivroFiscalEntrada.SQL.Add(sWhere);

      if chkOrdenarPorEmissao.Checked then
        dmDBEXMaster.fdqLivroFiscalEntrada.SQL.Add('ORDER BY DATA_DOCUMENTO')
      else
//      dmDBEXMaster.fdqLivroFiscalEntrada.SQL.Add('ORDER BY DATA_ENTRADA');
        dmDBEXMaster.fdqLivroFiscalEntrada.SQL.Add('ORDER BY DATA_ENTRADA');

      dmMProvider.cdsLivroFiscalEntrada.Open;
      dmMProvider.cdsLivroFiscalEntrada.ProviderName := '';


      if not dmMProvider.cdsLivroFiscalEntrada.IsEmpty then
      begin

        Totalizar_Valor_Contabil;
        Totalizar_Base_Calculo;
        Totalizar_Imposto_Creditado;
        Totalizar_Isentas_NT;
        Totalizar_Outras;

        edtPesquisa.Clear;
        grdConsulta.SetFocus;

      end

      else
      begin

        Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + ', ' + MSG_PESQUISA), 'Aten��o!', mb_IconWarning + mb_Ok);
        edtDataInicial.SetFocus;
        edtDataInicial.SelectAll;

      end;

    end;
  except

    Application.MessageBox('Data inv�lida', 'Aten��o', mb_IconInformation + mb_Ok);
    edtDataFinal.SetFocus;

  end;

end;

procedure TfrmModLivrosFiscais.edtDataInicialEnter(Sender: TObject);
begin

  MudarCorEdit(Sender);

  // MudarCorEdit(edtDataInicial);

end;

procedure TfrmModLivrosFiscais.edtDataInicialExit(Sender: TObject);
begin

  MudarCorEdit(Sender);

  try
    if edtDataInicial.Text <> '  /  /    ' then
      edtDataInicial.Text := FormatDateTime('dd/mm/yyyy', StrToDate(edtDataInicial.Text));
  except
    Application.MessageBox('Data inv�lida', 'Aten��o', mb_IconInformation + mb_Ok);
    edtDataInicial.SetFocus;
  end;

end;

procedure TfrmModLivrosFiscais.edtMesAnoKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(handle, WM_KEYDOWN, VK_TAB, 1);

  end
  else
  begin

    if (Key <> #8) then
      if not(Key in ['0' .. '9']) then
        abort;

  end;

end;

procedure TfrmModLivrosFiscais.edtPesquisaEnter(Sender: TObject);
begin

  MudarCorEdit(edtPesquisa);

end;

procedure TfrmModLivrosFiscais.edtPesquisaExit(Sender: TObject);
begin

  MudarCorEdit(edtPesquisa);

  if Length(Trim(edtPesquisa.Text)) > 0 then
  begin

    pgcLivroFiscalEntrada.ActivePageIndex := 0;

    dmMProvider.cdsLivroFiscalEntrada.Close;
    dmMProvider.cdsLivroFiscalEntrada.ProviderName := 'dspLivroFiscalEntrada';

    dmDBEXMaster.fdqLivroFiscalEntrada.SQL.Clear;
    dmDBEXMaster.fdqLivroFiscalEntrada.SQL.Add('SELECT * FROM LIVRO_ENTRADA');

    sWhere := 'WHERE NUMERO_DOCUMENTO = ' + QuotedStr(Trim(edtPesquisa.Text));

    if sWhere <> '' then
      dmDBEXMaster.fdqLivroFiscalEntrada.SQL.Add(sWhere);

    dmDBEXMaster.fdqLivroFiscalEntrada.SQL.Add('ORDER BY LIVRO_ENTRADA');

    dmMProvider.cdsLivroFiscalEntrada.Open;
    dmMProvider.cdsLivroFiscalEntrada.ProviderName := '';

    if not dmMProvider.cdsLivroFiscalEntrada.IsEmpty then
    begin

      Totalizar_Valor_Contabil;
      Totalizar_Base_Calculo;
      Totalizar_Imposto_Creditado;
      Totalizar_Isentas_NT;
      Totalizar_Outras;

      edtPesquisa.Clear;
      grdConsulta.SetFocus;

    end
    else
    begin

      Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + ', ' + MSG_PESQUISA), 'Aten��o!', mb_IconWarning + mb_Ok);
      edtPesquisa.SetFocus;
      edtPesquisa.SelectAll;

    end;

  end;

end;

procedure TfrmModLivrosFiscais.edtPesquisaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  iDirecao: Integer;
begin
  // habilita movimenta��o dos campos com as setas acima/abaixo
  iDirecao := -1;
  case Key of
    VK_DOWN:
      iDirecao := 0; { Pr�ximo }
    VK_UP:
      iDirecao := 1; { Anterior }
  end;
  if iDirecao <> -1 then
  begin
    Perform(WM_NEXTDLGCTL, iDirecao, 0);
    Key := 0;
  end;
end;

procedure TfrmModLivrosFiscais.edtPesquisaKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #13 then
  begin
    Key := #0;
    PostMessage(handle, WM_KEYDOWN, VK_TAB, 1);
  end;

end;

procedure TfrmModLivrosFiscais.edtUFOrigemExit(Sender: TObject);
begin

  MudarCorEdit(edtPesquisa);

  if InserindoEditando(dmMProvider.cdsLivroFiscalEntrada) then
    if not ValidarEstado(edtUFOrigem.Text) then
    begin

      Application.MessageBox(PChar(dmDBEXMaster.sNomeUsuario + ', ' + MSG_PESQUISA), 'Aten��o!', mb_IconWarning + mb_Ok);
      edtUFOrigem.SetFocus;
      edtUFOrigem.SelectAll;

    end;

end;

procedure TfrmModLivrosFiscais.edtValorContabilExit(Sender: TObject);
begin

  MudarCorEdit(edtPesquisa);

  if InserindoEditando(dmMProvider.cdsLivroFiscalEntrada) then
    dmMProvider.cdsLivroFiscalEntradaBASE_CALCULO_VALOR_OPERACAO.Value := dmMProvider.cdsLivroFiscalEntradaVALOR_CONTABIL.Value;

end;

procedure TfrmModLivrosFiscais.edtValorContabilKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = FormatSettings.DecimalSeparator then
    Key := ',';

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(handle, WM_KEYDOWN, VK_TAB, 1);

  end;

end;

procedure TfrmModLivrosFiscais.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  Action := caFree;

end;

procedure TfrmModLivrosFiscais.FormCreate(Sender: TObject);
begin

  // inicializa variaveis

  FormatSettings.ShortDateFormat        := 'dd/mm/yyyy';

  pgcLivroFiscalEntrada.ActivePageIndex := 0;

  Caption                               := Application.Title + ' - ' + PREFIXO_VERSAO + RetornarVersao(Application.ExeName, 1);

  DesabilitarBotaoFecharForm(Handle);

  dmDBEXMaster.sNomeUsuario             := ParamStr(1);
  dmDBEXMaster.sSenha                   := ParamStr(2);
  dmDBEXMaster.iIdUsuario               := StrToInt(ParamStr(3));
  dmDBEXMaster.iIdFilial                := StrToInt(ParamStr(4));

  edtRSocial.Text                       := dmMProvider.cdsFilialRAZAOSOCIAL.Value;
  edtInscrEstadual.Text                 := dmMProvider.cdsFilialINSCRICAO.Value;
  edtCNPJ.Text                          := FormatarCNPJCPF(dmMProvider.cdsFilialCNPJ.Value);

  fdqSelecionaPeriodo.Open;

  while not fdqSelecionaPeriodo.Eof do
  begin

    cboPeriodoApuracao.Items.Add(fdqSelecionaPeriodo.FieldByName('MES_ANO').AsString);
    fdqSelecionaPeriodo.Next;

  end;

end;

procedure TfrmModLivrosFiscais.FormDestroy(Sender: TObject);
begin

  ifArqIni.Free;

end;

procedure TfrmModLivrosFiscais.GravarRegistro70;
begin

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    dmMSProcedure.fdspMan_Tab_R70_Sint.Params[0].Value    := -1; //IP_NFENTRADA
    dmMSProcedure.fdspMan_Tab_R70_Sint.Params[1].Value    := dmMProvider.cdsLivroFiscalEntradaNUMERO_DOCUMENTO.Value;;
    dmMSProcedure.fdspMan_Tab_R70_Sint.Params[2].Value    := dmMProvider.cdsLivroFiscalEntradaCNPJ_EMITENTE.Value;

    dmDBEXMaster.fdqMasterPesquisa.Close;
    dmDBEXMaster.fdqMasterPesquisa.SQL.Clear;
    dmDBEXMaster.fdqMasterPesquisa.Sql.Add('SELECT INSCRICAO FROM FORNECEDOR');
    dmDBEXMaster.fdqMasterPesquisa.Sql.Add('WHERE CNPJ = ' + QuotedStr(dmMProvider.cdsLivroFiscalEntradaCNPJ_EMITENTE.Value));
    dmDBEXMaster.fdqMasterPesquisa.Open;

    dmMSProcedure.fdspMan_Tab_R70_Sint.Params[3].Value    := dmDBEXMaster.fdqMasterPesquisa.FieldByName('INSCRICAO').Value;
    dmMSProcedure.fdspMan_Tab_R70_Sint.Params[4].Value    := dmMProvider.cdsLivroFiscalEntradaDATA_ENTRADA.Value;
    dmMSProcedure.fdspMan_Tab_R70_Sint.Params[5].Value    := dmMProvider.cdsLivroFiscalEntradaUF_ORIGEM.Value;
    dmMSProcedure.fdspMan_Tab_R70_Sint.Params[6].Value    := 8;
    dmMSProcedure.fdspMan_Tab_R70_Sint.Params[7].Value    := dmMProvider.cdsLivroFiscalEntradaSERIE_SUBSERIE.Value;
    dmMSProcedure.fdspMan_Tab_R70_Sint.Params[8].Value    := '';
    dmMSProcedure.fdspMan_Tab_R70_Sint.Params[9].Value    := dmMProvider.cdsLivroFiscalEntradaNUMERO_DOCUMENTO.Value;
    dmMSProcedure.fdspMan_Tab_R70_Sint.Params[10].Value   := dmMProvider.cdsLivroFiscalEntradaCFOP.Value;
    dmMSProcedure.fdspMan_Tab_R70_Sint.Params[11].Value   := dmMProvider.cdsLivroFiscalEntradaVALOR_CONTABIL.Value;
    dmMSProcedure.fdspMan_Tab_R70_Sint.Params[12].Value   := dmMProvider.cdsLivroFiscalEntradaBASE_CALCULO_VALOR_OPERACAO.Value;
    dmMSProcedure.fdspMan_Tab_R70_Sint.Params[13].Value   := 0; //valor icms
    dmMSProcedure.fdspMan_Tab_R70_Sint.Params[14].Value   := 0; //isentas nt
    dmMSProcedure.fdspMan_Tab_R70_Sint.Params[15].Value   := dmMProvider.cdsLivroFiscalEntradaBASE_CALCULO_VALOR_OPERACAO.Value;
    dmMSProcedure.fdspMan_Tab_R70_Sint.Params[16].Value   := 0; //cif-fob
    dmMSProcedure.fdspMan_Tab_R70_Sint.Params[17].Value   := 'N'; //situa��o

    dmMSProcedure.fdspMan_Tab_R70_Sint.ExecProc;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

  except

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Rollback;

  end;


end;

procedure TfrmModLivrosFiscais.grdConsultaDblClick(Sender: TObject);
begin

  if dmMProvider.cdsLivroFiscalEntrada.Active then
    if not dmMProvider.cdsLivroFiscalEntrada.IsEmpty then
      pgcLivroFiscalEntrada.ActivePageIndex := 1;

end;

procedure TfrmModLivrosFiscais.grdConsultaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin

  if not odd(dmMProvider.cdsLivroFiscalEntrada.RecNo) then
  begin

    grdConsulta.Canvas.Font.Color   := clBlack;
    grdConsulta.Canvas.Brush.Color  := COR_ZEBRA_GRADE;

  end
  else
  begin

    grdConsulta.Canvas.Font.Color   := clBlack;
    grdConsulta.Canvas.Brush.Color  := clWhite;
  end;

  grdConsulta.Canvas.FillRect(Rect);
  grdConsulta.DefaultDrawDataCell(Rect, Column.Field, State);

end;

procedure TfrmModLivrosFiscais.grdConsultaKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #13 then

    grdConsultaDblClick(Self)

end;

procedure TfrmModLivrosFiscais.HabilitarDesabilitarControles;
begin

  grpDocumentosFiscais.Enabled  := not grpDocumentosFiscais.Enabled;
  grpValoresFiscais.Enabled     := not grpValoresFiscais.Enabled;

end;

procedure TfrmModLivrosFiscais.Limpar1Click(Sender: TObject);
begin

  cboPeriodoApuracao.ItemIndex := -1;

end;

function TfrmModLivrosFiscais.Man_Tab_LivroFiscalEntrada(pOpcao: integer): boolean;
begin

  try

    if not dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    dmMSProcedure.fdspLivroEntrada.Params[0].Value  := -1;
    dmMSProcedure.fdspLivroEntrada.Params[1].Value  := dmDBEXMaster.iIdFilial;
    dmMSProcedure.fdspLivroEntrada.Params[2].Value  := dmMProvider.cdsLivroFiscalEntradaMES_ANO.Value;
    dmMSProcedure.fdspLivroEntrada.Params[3].Value  := dmMProvider.cdsLivroFiscalEntradaDATA_ENTRADA.Value;
    dmMSProcedure.fdspLivroEntrada.Params[5].Value  := dmMProvider.cdsLivroFiscalEntradaTIPO_ESPECIE_DOCUMENTO.Value;
    dmMSProcedure.fdspLivroEntrada.Params[6].Value  := dmMProvider.cdsLivroFiscalEntradaSERIE_SUBSERIE.Value;
    dmMSProcedure.fdspLivroEntrada.Params[7].Value  := dmMProvider.cdsLivroFiscalEntradaDATA_DOCUMENTO.Value;
    dmMSProcedure.fdspLivroEntrada.Params[8].Value  := dmMProvider.cdsLivroFiscalEntradaCNPJ_EMITENTE.Value;
    dmMSProcedure.fdspLivroEntrada.Params[9].Value  := dmMProvider.cdsLivroFiscalEntradaUF_ORIGEM.Value;
    dmMSProcedure.fdspLivroEntrada.Params[10].Value := dmMProvider.cdsLivroFiscalEntradaVALOR_CONTABIL.Value;
    dmMSProcedure.fdspLivroEntrada.Params[11].Value := dmMProvider.cdsLivroFiscalEntradaCODIGO_CONTABIL.Value;
    dmMSProcedure.fdspLivroEntrada.Params[12].Value := dmMProvider.cdsLivroFiscalEntradaCFOP.Value;
    dmMSProcedure.fdspLivroEntrada.Params[13].Value := dmMProvider.cdsLivroFiscalEntradaIDENTIFICACAO_ICMS_IPI.Value;
    dmMSProcedure.fdspLivroEntrada.Params[14].Value := dmMProvider.cdsLivroFiscalEntradaCODIGO_VALORES_FISCAIS.Value;
    dmMSProcedure.fdspLivroEntrada.Params[15].Value := dmMProvider.cdsLivroFiscalEntradaBASE_CALCULO_VALOR_OPERACAO.Value;
    dmMSProcedure.fdspLivroEntrada.Params[16].Value := dmMProvider.cdsLivroFiscalEntradaALIQUOTA.Value;
    dmMSProcedure.fdspLivroEntrada.Params[17].Value := dmMProvider.cdsLivroFiscalEntradaIMPOSTO_CREDITADO.Value;
    dmMSProcedure.fdspLivroEntrada.Params[18].Value := dmMProvider.cdsLivroFiscalEntradaOBSERVACAO.Value;
    dmMSProcedure.fdspLivroEntrada.Params[19].Value := dmMProvider.cdsLivroFiscalEntradaLIVRO_ENTRADA.Value;
    dmMSProcedure.fdspLivroEntrada.ExecProc;

    if not InserindoEditando(dmMProvider.cdsLivroFiscalEntrada) then
      dmMProvider.cdsLivroFiscalEntrada.Edit;

    if dmMSProcedure.fdspLivroEntrada.Params[20].AsInteger > 0 then
    begin

      dmMProvider.cdsLivroFiscalEntradaLIVRO_ENTRADA.Value := dmMSProcedure.fdspLivroEntrada.Params[20].AsInteger;
      dmMProvider.cdsLivroFiscalEntrada.Post;

    end;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

    Result := true;

  except
    begin

      if dmDBEXMaster.fdtMaster.Active then
        dmDBEXMaster.fdtMaster.Rollback;

      Result := False;;

    end;

  end;

end;

procedure TfrmModLivrosFiscais.AbrirLivro;
var
  sData: string;
  dData_Ini: TDate;
  dData_Final: TDate;
begin

  dmRelatorios.cdsRelLivroEntrada.Close;
  dmRelatorios.cdsRelLivroEntrada.ProviderName := 'dspRelLivroEntrada';

  if (edtDataInicial.Text <> '  /  /    ') and (edtDataFinal.Text <> '  /  /    ') then
  begin

    dmRelatorios.fdqRelLivroEntrada.Params[0].Value := StrToDate(edtDataInicial.Text);
    dmRelatorios.fdqRelLivroEntrada.Params[1].Value := StrToDate(edtDataFinal.Text);

  end
  else if Length(Trim(cboPeriodoApuracao.Text)) > 0 then
  begin

    sData                                           := '01/' + Copy(cboPeriodoApuracao.Text, 1, 2) + '/' + Copy(cboPeriodoApuracao.Text, 5, 2);
    dData_Ini                                       := StrToDate(sData);
    dData_Final                                     := EndOfTheMonth(dData_Ini);
    dmRelatorios.fdqRelLivroEntrada.Params[0].Value := dData_Ini;
    dmRelatorios.fdqRelLivroEntrada.Params[1].Value := dData_Final;

  end;

  if chkOrdenarPorEmissao.Checked then
    dmRelatorios.fdqRelLivroEntrada.Params[2].Value := 1
  else
    dmRelatorios.fdqRelLivroEntrada.Params[2].Value := 0;

  dmRelatorios.cdsRelLivroEntrada.Open;
  dmRelatorios.cdsRelLivroEntrada.ProviderName := '';

  dmRelatorios.fdmTotalOperInterLivroEntrada.Close;
  dmRelatorios.fdmTotalOperInterLivroEntrada.Open;

end;

procedure TfrmModLivrosFiscais.TotalizarOperInterEstduais;
begin
  dmRelatorios.cdsRelTotalizaLivroEntradaEST.Close;
  dmRelatorios.cdsRelTotalizaLivroEntradaEST.ProviderName := 'dspRelTotalizaLivroEntradaEST';
  dmRelatorios.fdqRelTotalizaLivroEntradaEST.Params[0].Value := dmMProvider.cdsFilialESTADO.Value;
  dmRelatorios.fdqRelTotalizaLivroEntradaEST.Params[1].Value := dmMProvider.cdsLivroFiscalEntradaMES_ANO.Value;
  dmRelatorios.fdqRelTotalizaLivroEntradaEST.Params[2].Value := 0;
  //estadual
  dmRelatorios.fdqRelTotalizaLivroEntradaEST.Params[3].Value := 3;
  //interestadual
  dmRelatorios.cdsRelTotalizaLivroEntradaEST.Open;
  dmRelatorios.cdsRelTotalizaLivroEntradaEST.ProviderName := '';
  while not dmRelatorios.cdsRelTotalizaLivroEntradaEST.Eof do
  begin
    dmRelatorios.fdmTotalOperInterLivroEntrada.Append;
    dmRelatorios.fdmTotalOperInterLivroEntradaUF.Value := dmRelatorios.cdsRelTotalizaLivroEntradaESTOP_UF.Value;
    dmRelatorios.fdmTotalOperInterLivroEntradaVALOR_CONTABIL.Value := dmRelatorios.cdsRelTotalizaLivroEntradaESTOP_VALOR_CONTABIL.Value;
    dmRelatorios.fdmTotalOperInterLivroEntradaBASE_CALCULO.Value := dmRelatorios.cdsRelTotalizaLivroEntradaESTOP_BASE_CALCULO_CFOP.Value;
    dmRelatorios.fdmTotalOperInterLivroEntradaISENTAS.Value := dmRelatorios.cdsRelTotalizaLivroEntradaESTOP_ISENTAS.Value;
    dmRelatorios.fdmTotalOperInterLivroEntradaOUTRAS.Value := dmRelatorios.cdsRelTotalizaLivroEntradaESTOP_OUTRAS.Value;
    dmRelatorios.fdmTotalOperInterLivroEntrada.Post;
    dmRelatorios.cdsRelTotalizaLivroEntradaEST.Next;
  end;
end;

procedure TfrmModLivrosFiscais.TotalizarValoresOutras;
begin
  dmRelatorios.fdmTotalAliqLivroEntrada.Close;
  dmRelatorios.fdmTotalAliqLivroEntrada.Open;
  dmRelatorios.cdsRelTotalizaLivroEntradaEST.Close;
  dmRelatorios.cdsRelTotalizaLivroEntradaEST.ProviderName := 'dspRelTotalizaLivroEntradaEST';
  dmRelatorios.fdqRelTotalizaLivroEntradaEST.Params[0].Value := dmMProvider.cdsFilialESTADO.Value;
  dmRelatorios.fdqRelTotalizaLivroEntradaEST.Params[1].Value := dmMProvider.cdsLivroFiscalEntradaMES_ANO.Value;
  dmRelatorios.fdqRelTotalizaLivroEntradaEST.Params[2].Value := 0;
  //estadual
  dmRelatorios.fdqRelTotalizaLivroEntradaEST.Params[3].Value := 2;
  //outras
  dmRelatorios.cdsRelTotalizaLivroEntradaEST.Open;
  dmRelatorios.cdsRelTotalizaLivroEntradaEST.ProviderName := '';
  while not dmRelatorios.cdsRelTotalizaLivroEntradaEST.Eof do
  begin
    dmRelatorios.fdmTotalAliqLivroEntrada.Append;
    dmRelatorios.fdmTotalAliqLivroEntradaALIQUOTA.Value := 'F ';
    dmRelatorios.fdmTotalAliqLivroEntradaVALOR.Value := dmRelatorios.cdsRelTotalizaLivroEntradaESTOP_OUTRAS.Value;
    dmRelatorios.fdmTotalAliqLivroEntrada.Post;
    dmRelatorios.cdsRelTotalizaLivroEntradaEST.Next;
  end;
end;

procedure TfrmModLivrosFiscais.TotalizarAliquotas;
begin
  dmRelatorios.cdsRelTotalizaLivroEntradaEST.Close;
  dmRelatorios.cdsRelTotalizaLivroEntradaEST.ProviderName := 'dspRelTotalizaLivroEntradaEST';
  dmRelatorios.fdqRelTotalizaLivroEntradaEST.Params[0].Value := dmMProvider.cdsFilialESTADO.Value;
  dmRelatorios.fdqRelTotalizaLivroEntradaEST.Params[1].Value := dmMProvider.cdsLivroFiscalEntradaMES_ANO.Value;
  dmRelatorios.fdqRelTotalizaLivroEntradaEST.Params[2].Value := 0;
  //estadual
  dmRelatorios.fdqRelTotalizaLivroEntradaEST.Params[3].Value := 1;
  //aliquotas
  dmRelatorios.cdsRelTotalizaLivroEntradaEST.Open;
  dmRelatorios.cdsRelTotalizaLivroEntradaEST.ProviderName := '';
  while not dmRelatorios.cdsRelTotalizaLivroEntradaEST.Eof do
  begin
    dmRelatorios.fdmTotalAliqLivroEntrada.Append;
    if dmRelatorios.cdsRelTotalizaLivroEntradaESTOP_ALIQUOTA.Value > 0 then
      dmRelatorios.fdmTotalAliqLivroEntradaALIQUOTA.Value := 'Al�quota ' + Format('%6.6s', [FormatFloat('#0.00', dmRelatorios.cdsRelTotalizaLivroEntradaESTOP_ALIQUOTA.Value)]) + '%'
    else
      dmRelatorios.fdmTotalAliqLivroEntradaALIQUOTA.Value := 'I';
    dmRelatorios.fdmTotalAliqLivroEntradaVALOR.Value := dmRelatorios.cdsRelTotalizaLivroEntradaESTOP_BASE_CALCULO_CFOP.Value;
    dmRelatorios.fdmTotalAliqLivroEntrada.Post;
    dmRelatorios.cdsRelTotalizaLivroEntradaEST.Next;
  end;
end;

procedure TfrmModLivrosFiscais.TotalizarLivro;
begin
  dmRelatorios.cdsRelTotalizaLivroEntradaEST.Close;
  dmRelatorios.cdsRelTotalizaLivroEntradaEST.ProviderName := 'dspRelTotalizaLivroEntradaEST';
  dmRelatorios.fdqRelTotalizaLivroEntradaEST.Params[0].Value := dmMProvider.cdsFilialESTADO.Value;
  dmRelatorios.fdqRelTotalizaLivroEntradaEST.Params[1].Value := dmMProvider.cdsLivroFiscalEntradaMES_ANO.Value;
  dmRelatorios.fdqRelTotalizaLivroEntradaEST.Params[2].Value := 0;
  //estadual
  dmRelatorios.fdqRelTotalizaLivroEntradaEST.Params[3].Value := 0;
  //tipo totaliza��o
  dmRelatorios.cdsRelTotalizaLivroEntradaEST.Open;
  dmRelatorios.cdsRelTotalizaLivroEntradaEST.ProviderName := '';
  dmRelatorios.cdsRelTotalizaLivroEntradaINTER.Close;
  dmRelatorios.cdsRelTotalizaLivroEntradaINTER.ProviderName := 'dspRelTotalizaLivroEntradaINTER';
  dmRelatorios.fdqRelTotalizaLivroEntradaINTER.Params[0].Value := dmMProvider.cdsFilialESTADO.Value;
  dmRelatorios.fdqRelTotalizaLivroEntradaINTER.Params[1].Value := dmMProvider.cdsLivroFiscalEntradaMES_ANO.Value;
  dmRelatorios.fdqRelTotalizaLivroEntradaINTER.Params[2].Value := 1;
  //inter estadual
  dmRelatorios.fdqRelTotalizaLivroEntradaINTER.Params[3].Value := 0;
  //tipo totaliza��o
  dmRelatorios.cdsRelTotalizaLivroEntradaINTER.Open;
  dmRelatorios.cdsRelTotalizaLivroEntradaINTER.ProviderName := '';
end;


procedure TfrmModLivrosFiscais.rdpPesquisaClick(Sender: TObject);
begin

  edtPesquisa.Clear;
  edtPesquisa.SetFocus;

end;

procedure TfrmModLivrosFiscais.stbAtalhoDrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin

  with stbAtalho.Canvas do
  begin
    FillRect(Rect);

    {

      define estilo da fonte

      }

    Font.Name   := 'Arial';
    Font.Size   := 8;
    Font.Style  := [fsBold];

    // Desenha as imagens de acordo com o indice de cada panel
    if Panel.Index < 5 then
      dmDBEXMaster.imgHot.Draw(stbAtalho.Canvas, Rect.Left + 5, Rect.Top + 1, Panel.Index);

    // Escreve o texto em cada panel
    if Panel.Index = 0 then
      TextOut(Rect.Left + 25, Rect.Top + 1, 'F2-Incluir');

    if Panel.Index = 1 then
      TextOut(Rect.Left + 25, Rect.Top + 1, 'F3-Desfazer');

    if Panel.Index = 2 then
      TextOut(Rect.Left + 25, Rect.Top + 1, 'F4-Salvar');

    if Panel.Index = 3 then
      TextOut(Rect.Left + 25, Rect.Top + 1, 'F5-Excluir');

    if Panel.Index = 4 then
      TextOut(Rect.Left + 25, Rect.Top + 1, 'F6-Editar');

  end;

end;

procedure TfrmModLivrosFiscais.Totalizar_Base_Calculo;
begin

  dmDBEXMaster.fdqSomar_BCalculoLFE.Close;
  dmDBEXMaster.fdqSomar_BCalculoLFE.SQL.Clear;
  dmDBEXMaster.fdqSomar_BCalculoLFE.SQL.Add('SELECT COALESCE(SUM(BASE_CALCULO_VALOR_OPERACAO),0) AS TOTAL_BASE_CALCULO FROM livro_entrada WHERE aliquota > 0 and CODIGO_VALORES_FISCAIS =1');

  if (edtDataInicial.Text <> '  /  /    ') and(edtDataFinal.Text <> '  /  /    ') then
    sWhere := ' AND DATA_ENTRADA BETWEEN ' + QuotedStr(FormatDateTime('mm/dd/yy', StrToDate(edtDataInicial.Text))) + ' AND ' + QuotedStr(FormatDateTime('mm/dd/yy', StrToDate(edtDataFinal.Text)))
  else if cboPeriodoApuracao.Text <> '' then
    sWhere := ' AND MES_ANO = ' + QuotedStr(dmMProvider.cdsLivroFiscalEntradaMES_ANO.Value)
  else if edtPesquisa.Text <> '' then
    sWhere := ' AND LIVRO_ENTRADA.NUMERO_DOCUMENTO = ' + QuotedStr(dmMProvider.cdsLivroFiscalEntradaNUMERO_DOCUMENTO.Value)
  else
    sWhere := 'AND LIVRO_ENTRADA.NUMERO_DOCUMENTO = ' + QuotedStr(dmMProvider.cdsLivroFiscalEntradaNUMERO_DOCUMENTO.Value);

  dmDBEXMaster.fdqSomar_BCalculoLFE.SQL.Add(sWhere);

  dmDBEXMaster.fdqSomar_BCalculoLFE.Open;

  edtTotalBaseCalculo.Text := FormatFloat('#,##0.00', dmDBEXMaster.fdqSomar_BCalculoLFE.FieldByName('TOTAL_BASE_CALCULO').AsCurrency);

  dmDBEXMaster.fdqSomar_BCalculoLFE.Close;

end;

procedure TfrmModLivrosFiscais.Totalizar_Imposto_Creditado;
begin

  dmDBEXMaster.fdqSomar_ImpostoCredLFE.Close;
  dmDBEXMaster.fdqSomar_ImpostoCredLFE.SQL.Clear;
  dmDBEXMaster.fdqSomar_ImpostoCredLFE.SQL.Add('SELECT COALESCE(SUM(IMPOSTO_CREDITADO),0) AS TOTAL_IMPOSTO_CREDITADO FROM livro_entrada');

  if (edtDataInicial.Text <> '  /  /    ') and (edtDataFinal.Text <> '  /  /    ') then
    sWhere := 'WHERE DATA_ENTRADA BETWEEN ' + QuotedStr(FormatDateTime('mm/dd/yy', StrToDate(edtDataInicial.Text))) + ' AND ' + QuotedStr(FormatDateTime('mm/dd/yy', StrToDate(edtDataFinal.Text)))
  else if cboPeriodoApuracao.Text <> '' then
    sWhere := 'WHERE MES_ANO = ' + QuotedStr(dmMProvider.cdsLivroFiscalEntradaMES_ANO.Value)
  else if edtPesquisa.Text <> '' then
    sWhere := 'WHERE LIVRO_ENTRADA.NUMERO_DOCUMENTO = ' + QuotedStr(dmMProvider.cdsLivroFiscalEntradaNUMERO_DOCUMENTO.Value)
  else
    sWhere := 'WHERE LIVRO_ENTRADA.NUMERO_DOCUMENTO = ' + QuotedStr(dmMProvider.cdsLivroFiscalEntradaNUMERO_DOCUMENTO.Value);

  dmDBEXMaster.fdqSomar_ImpostoCredLFE.SQL.Add(sWhere);
  dmDBEXMaster.fdqSomar_ImpostoCredLFE.Open;

  edtTotalImpostoCreditado.Text := FormatFloat('#,##0.00', dmDBEXMaster.fdqSomar_ImpostoCredLFE.FieldByName('TOTAL_IMPOSTO_CREDITADO').AsCurrency);

  dmDBEXMaster.fdqSomar_ImpostoCredLFE.Close;

end;

procedure TfrmModLivrosFiscais.Totalizar_Isentas_NT;
begin

  dmDBEXMaster.fdqSomar_IsentasNT_LFE.Close;
  dmDBEXMaster.fdqSomar_IsentasNT_LFE.SQL.Clear;
  dmDBEXMaster.fdqSomar_IsentasNT_LFE.SQL.Add('SELECT SUM(BASE_CALCULO_VALOR_OPERACAO) AS TOTAL_ISENTAS_NT FROM livro_entrada WHERE codigo_valores_fiscais = 2');

  if (edtDataInicial.Text <> '  /  /    ') and(edtDataFinal.Text <> '  /  /    ') then
    sWhere := ' AND DATA_ENTRADA BETWEEN ' + QuotedStr(FormatDateTime('mm/dd/yy', StrToDate(edtDataInicial.Text))) + ' AND ' + QuotedStr(FormatDateTime('mm/dd/yy', StrToDate(edtDataFinal.Text)))
  else if cboPeriodoApuracao.Text <> '' then
    sWhere := ' AND MES_ANO = ' + QuotedStr(dmMProvider.cdsLivroFiscalEntradaMES_ANO.Value)
  else if edtPesquisa.Text <> '' then
    sWhere := ' AND LIVRO_ENTRADA.NUMERO_DOCUMENTO = ' + QuotedStr(dmMProvider.cdsLivroFiscalEntradaNUMERO_DOCUMENTO.Value)
  else
    sWhere := 'AND LIVRO_ENTRADA.NUMERO_DOCUMENTO = ' + QuotedStr(dmMProvider.cdsLivroFiscalEntradaNUMERO_DOCUMENTO.Value);

  dmDBEXMaster.fdqSomar_IsentasNT_LFE.SQL.Add(sWhere);
  dmDBEXMaster.fdqSomar_IsentasNT_LFE.Open;

  edtTotalIsentasNtributadas.Text := FormatFloat('#,##0.00', dmDBEXMaster.fdqSomar_IsentasNT_LFE.FieldByName('TOTAL_ISENTAS_NT').AsCurrency);

  dmDBEXMaster.fdqSomar_IsentasNT_LFE.Close;

end;

procedure TfrmModLivrosFiscais.Totalizar_Outras;
begin

  dmDBEXMaster.fdqSomar_OutrasLFE.Close;
  dmDBEXMaster.fdqSomar_OutrasLFE.SQL.Clear;
  dmDBEXMaster.fdqSomar_OutrasLFE.SQL.Add('SELECT SUM(BASE_CALCULO_VALOR_OPERACAO) AS TOTAL_OUTRAS FROM livro_entrada WHERE codigo_valores_fiscais = 3');

  if (edtDataInicial.Text <> '  /  /    ') and(edtDataFinal.Text <> '  /  /    ') then
    sWhere := ' AND DATA_ENTRADA BETWEEN ' + QuotedStr(FormatDateTime('mm/dd/yy', StrToDate(edtDataInicial.Text))) + ' AND ' + QuotedStr(FormatDateTime('mm/dd/yy', StrToDate(edtDataFinal.Text)))
  else if cboPeriodoApuracao.Text <> '' then
    sWhere := ' AND MES_ANO = ' + QuotedStr(dmMProvider.cdsLivroFiscalEntradaMES_ANO.Value)
  else if edtPesquisa.Text <> '' then
    sWhere := ' AND LIVRO_ENTRADA.NUMERO_DOCUMENTO = ' + QuotedStr(dmMProvider.cdsLivroFiscalEntradaNUMERO_DOCUMENTO.Value)
  else
    sWhere := 'AND LIVRO_ENTRADA.NUMERO_DOCUMENTO = ' + QuotedStr(dmMProvider.cdsLivroFiscalEntradaNUMERO_DOCUMENTO.Value);

  dmDBEXMaster.fdqSomar_OutrasLFE.SQL.Add(sWhere);

  dmDBEXMaster.fdqSomar_OutrasLFE.Open;

  edtTotalOutras.Text := FormatFloat('#,##0.00', dmDBEXMaster.fdqSomar_OutrasLFE.FieldByName('TOTAL_OUTRAS').AsCurrency);

  dmDBEXMaster.fdqSomar_OutrasLFE.Close;

end;

procedure TfrmModLivrosFiscais.Totalizar_Valor_Contabil;
begin

  dmDBEXMaster.fdqSomar_VContabLFE.Close;
  dmDBEXMaster.fdqSomar_VContabLFE.SQL.Clear;
  dmDBEXMaster.fdqSomar_VContabLFE.SQL.Add('SELECT COALESCE(SUM(VALOR_CONTABIL),0) AS TOTAL_VALOR_CONTABIL FROM livro_entrada');

  if (edtDataInicial.Text <> '  /  /    ') and(edtDataFinal.Text <> '  /  /    ') then
    sWhere := 'WHERE DATA_ENTRADA BETWEEN ' + QuotedStr(FormatDateTime('mm/dd/yy', StrToDate(edtDataInicial.Text))) + ' AND ' + QuotedStr(FormatDateTime('mm/dd/yy', StrToDate(edtDataFinal.Text)))
  else if cboPeriodoApuracao.Text <> '' then
    sWhere := 'WHERE MES_ANO = ' + QuotedStr(dmMProvider.cdsLivroFiscalEntradaMES_ANO.Value)
  else if edtPesquisa.Text <> '' then
    sWhere := 'WHERE LIVRO_ENTRADA.NUMERO_DOCUMENTO = ' + QuotedStr(dmMProvider.cdsLivroFiscalEntradaNUMERO_DOCUMENTO.Value)
  else
    sWhere := 'WHERE LIVRO_ENTRADA.NUMERO_DOCUMENTO = ' + QuotedStr(dmMProvider.cdsLivroFiscalEntradaNUMERO_DOCUMENTO.Value);

  dmDBEXMaster.fdqSomar_VContabLFE.SQL.Add(sWhere);

  dmDBEXMaster.fdqSomar_VContabLFE.Open;

  edtTotalValorContabil.Text := FormatFloat('#,##0.00', dmDBEXMaster.fdqSomar_VContabLFE.FieldByName('TOTAL_VALOR_CONTABIL').AsCurrency);

  dmDBEXMaster.fdqSomar_VContabLFE.Close;

end;

function TfrmModLivrosFiscais.ValidarCfop(pCfop: string): boolean;
begin

  dmMProvider.cdsCFOP_CFPS.Close;
  dmMProvider.cdsCFOP_CFPS.ProviderName := 'dspCFOP_CFPS';

  dmDBEXMaster.fdqCFOP_CFPS.SQL.Clear;
  dmDBEXMaster.fdqCFOP_CFPS.SQL.Add('SELECT * FROM CFOP');
  dmDBEXMaster.fdqCFOP_CFPS.SQL.Add('WHERE CFOP = ' + QuotedStr(pCfop));

  dmMProvider.cdsCFOP_CFPS.Open;
  dmMProvider.cdsCFOP_CFPS.ProviderName := '';

  Result := not dmMProvider.cdsCFOP_CFPS.IsEmpty;

end;

function TfrmModLivrosFiscais.ValidarEstado(pEstado: string): boolean;
begin

  dmMProvider.cdsEstados.Close;
  dmMProvider.cdsEstados.ProviderName := 'dspEstados';

  dmDBEXMaster.fdqEstados.SQL.Clear;
  dmDBEXMaster.fdqEstados.SQL.Add('SELECT * FROM ESTADOS');
  dmDBEXMaster.fdqEstados.SQL.Add('WHERE SIGLA = ' + QuotedStr(pEstado));

  dmMProvider.cdsEstados.Open;
  dmMProvider.cdsEstados.ProviderName := '';

  Result := not dmMProvider.cdsEstados.IsEmpty;

end;

end.
