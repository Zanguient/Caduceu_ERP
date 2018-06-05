unit modNFEntrada;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.StdActns, System.Actions, Vcl.ActnList, Vcl.Imaging.jpeg,
  Vcl.Samples.Spin, Vcl.DBCtrls, Vcl.Mask, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids,
  JvExStdCtrls, JvEdit, JvValidateEdit;

type
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
    imgVisualizarNFE: TImage;
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
    edtValorFatura: TEdit;
    grpCalculoDoImposto: TGroupBox;
    grpBaseCalcIcms: TGroupBox;
    grpValorIcms: TGroupBox;
    grpBaseCalcIcmsST: TGroupBox;
    grpValoricmsST: TGroupBox;
    grpValorTotalProdutos: TGroupBox;
    grpValorFrete: TGroupBox;
    grpValorSeguro: TGroupBox;
    grpDespesasAcessorias: TGroupBox;
    grpValorIPI: TGroupBox;
    grpValorTotalNota: TGroupBox;
    grpDescontoGeral: TGroupBox;
    grpAliqCreditoSimples: TGroupBox;
    grpCfop: TGroupBox;
    grpObservacoes: TGroupBox;
    grpInformacaoFisco: TGroupBox;
    rdpTipoFrete: TDBRadioGroup;
    grpSituacaoDocumento: TGroupBox;
    edtSituacaoDocumento: TDBEdit;
    grpStatus: TGroupBox;
    edtStatus: TDBEdit;
    memObservacos: TDBMemo;
    memObservacaoFisco: TDBMemo;
    edtAliqCredSimples: TDBEdit;
    edtBaseCalcICMS: TDBEdit;
    edtValorICMS: TDBEdit;
    edtBaseCalcICMSR: TDBEdit;
    edtValorICMSR: TDBEdit;
    edtValorProdutos: TDBEdit;
    edtDescontoGeral: TDBEdit;
    edtValorFrete: TDBEdit;
    edtValorSeguro: TDBEdit;
    edtValorDespesasAcessorias: TDBEdit;
    edtValorIPI: TDBEdit;
    edtValotTotalNOta: TDBEdit;
    grdCfop: TDBGrid;
    lblCFOP_NFEntrada: TLabel;
    edtCFOP_NFEntrada: TEdit;
    tbsItens: TTabSheet;
    grpItensServico: TGroupBox;
    chkRatearDesconto: TDBCheckBox;
    chkAgregarICMSR: TDBCheckBox;
    chkAgregarIPI: TDBCheckBox;
    chkAgregarFrete: TDBCheckBox;
    chkAgregarDespesas: TDBCheckBox;
    chkReducaoPS_COFINS: TDBCheckBox;
    grpComprador: TGroupBox;
    grpDadosProdutosServicos: TGroupBox;
    grpItens: TGroupBox;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    GroupBox2: TGroupBox;
    Edit2: TEdit;
    GroupBox3: TGroupBox;
    Edit3: TEdit;
    GroupBox4: TGroupBox;
    Edit4: TEdit;
    GroupBox5: TGroupBox;
    Edit5: TEdit;
    GroupBox6: TGroupBox;
    JvValidateEdit1: TJvValidateEdit;
    GroupBox7: TGroupBox;
    JvValidateEdit2: TJvValidateEdit;
    GroupBox8: TGroupBox;
    JvValidateEdit3: TJvValidateEdit;
    GroupBox9: TGroupBox;
    JvValidateEdit4: TJvValidateEdit;
    GroupBox10: TGroupBox;
    JvValidateEdit5: TJvValidateEdit;
    GroupBox11: TGroupBox;
    JvValidateEdit6: TJvValidateEdit;
    GroupBox12: TGroupBox;
    JvValidateEdit7: TJvValidateEdit;
    GroupBox13: TGroupBox;
    JvValidateEdit8: TJvValidateEdit;
    GroupBox14: TGroupBox;
    JvValidateEdit9: TJvValidateEdit;
    GroupBox15: TGroupBox;
    JvValidateEdit10: TJvValidateEdit;
    lblCidadeEmitente: TLabel;
    edtCidadeEmitente: TDBEdit;
    lblUF_Emitente: TLabel;
    edtUF_Emitente: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure WindowClose1Execute(Sender: TObject);
    procedure grdTabelaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure rdpOpcoesPesquisaClick(Sender: TObject);
    procedure edtConteudoPesquisaEnter(Sender: TObject);
    procedure edtConteudoPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtConteudoPesquisaKeyPress(Sender: TObject; var Key: Char);
    function AbrirTabelaNFEnatrada(pOpcao:smallint; pConteudo:string):boolean;
    procedure Tratar_Erro_Conexao(pE: exception);
    procedure edtConteudoPesquisaExit(Sender: TObject);
    procedure OcultarAbas(pOpcao:boolean);
    procedure grdTabelaDblClick(Sender: TObject);
    procedure grdTabelaKeyPress(Sender: TObject; var Key: Char);
    procedure RelacionarParcelas_NFE(pNFEntrada:Integer);
    procedure RelacionarCFOP_NFE(pNFEntrada:Integer);
    procedure tbsTotaisShow(Sender: TObject);
    procedure grdFaturaDuplicatasDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure edtStatusChange(Sender: TObject);
  private
    { Private declarations }
    procedure LimparMSG_ERRO;
  public
    { Public declarations }
  end;

var
  frmModNFEntrada: TfrmModNFEntrada;

implementation

{$R *.dfm}

uses dataDBEXMaster, dataMProvider, dataMSource, dataMSProcedure,
  uConstantes_Padrao, uFuncoes;

function TfrmModNFEntrada.AbrirTabelaNFEnatrada(pOpcao:smallint; pConteudo:string):boolean;
var
  sWhere:string;
begin

  dmMProvider.cdsNFEntrada.Close;
  dmMProvider.cdsNFEntrada.ProviderName := 'dspNFEntrada';;
  dmDBEXMaster.fdqNFEntrada.SQL.Clear;
  dmDBEXMaster.fdqNFEntrada.SQL.Add('SELECT * FROM NFENTRADA');

  sWhere := dmDBEXMaster.Montar_SQL_Pesquisa_NFEntrada(pOpcao,edtConteudoPesquisa.Text);

  dmDBEXMaster.fdqNFEntrada.SQL.Add(sWhere);
  dmDBEXMaster.fdqNFEntrada.SQL.Add('ORDER BY ENTRADA, FORNECEDOR');

  try

    dmMProvider.cdsNFEntrada.Open;
    dmMProvider.cdsNFEntrada.ProviderName := '';

    if (dmMProvider.cdsNFEntrada.IsEmpty) and (pOpcao < 2) then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PESQUISA;
      TocarSomAlerta(ord(SystemHand));

    end
    else
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CRITERIO_NAO_ENCONTRADO;
      TocarSomAlerta(ord(SystemHand));

    end;

    Result := not dmMProvider.cdsNFEntrada.IsEmpty;

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

  if (Length(Trim(edtConteudoPesquisa.Text)) > 0) or (rdpOpcoesPesquisa.ItemIndex > 1) then
  begin

    OcultarAbas(false);

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', aguarde...';
    Application.ProcessMessages;

    if AbrirTabelaNFEnatrada(rdpOpcoesPesquisa.ItemIndex, edtConteudoPesquisa.Text) then
      grdTabela.SetFocus;

    edtConteudoPesquisa.Clear;
    MudarCorEdit(Sender);

    LimparMSG_ERRO;

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

  end

end;

procedure TfrmModNFEntrada.edtStatusChange(Sender: TObject);
begin

  if dmMProvider.cdsNFEntradaCANCELADA.Value = 0 then
  begin

    case dmMProvider.cdsNFEntradaSTATUS.Value of
      0:edtStatus.Color := clGreen;
      1:edtStatus.Color := clRed;
    end;

  end
  else
    edtStatus.Color := clBlack;

end;

procedure TfrmModNFEntrada.FormCreate(Sender: TObject);
var
  i:integer;
begin

  DesabilitarBotaoFecharForm(self.Handle);

  Color                               := COR_PADRAO_TELAS;
  Caption                             := ' ' + Application.Title + ' - ' + RetornarVersao(ParamStr(0),1) + 'xe';

  dmDBEXMaster.sNomeUsuario           := ParamStr(1);
  dmDBEXMaster.sSenha                 := paramstr(2);
  dmDBEXMaster.iIdUsuario             := StrToInt(ParamStr(3));
  dmDBEXMaster.iIdFilial              := StrToInt(ParamStr(4));

  OcultarAbas(False)

end;

procedure TfrmModNFEntrada.grdFaturaDuplicatasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin


  if not dmMProvider.cdsParcelasNFE.IsEmpty then
  begin

    if not odd(dmMProvider.cdsParcelasNFE.RecNo) then
    begin

      grdTabela.Canvas.Font.Color   := clBlack;
      grdTabela.Canvas.Brush.Color  := COR_ZEBRA_GRADE;

    end
    else
    begin

      grdTabela.Canvas.Font.Color   := clBlack;
      grdTabela.Canvas.Brush.Color  := clWhite;

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
    pgcNFEntrada.ActivePageIndex      := 1;

  end;

end;

procedure TfrmModNFEntrada.grdTabelaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if Column.FieldName = 'COM_FRETE' then //Remova esta linha se você quer destacar toda a linha
  begin

    if Column.Field.Dataset.FieldbyName('COM_FRETE').AsString = 'SIM' then
    begin

      grdTabela.canvas.Font.color := clRed;
      grdTabela.canvas.Font.Style := [fsBold];

    end

    else
    begin

      grdTabela.canvas.Font.color := clBlack;
      grdTabela.canvas.Font.Style := [];

    end;

  end;

  if Column.FieldName = 'DESCRICAO_STATUS' then //Remova esta linha se você quer destacar toda a linha
  begin

    if Column.Field.Dataset.FieldbyName('DESCRICAO_STATUS').AsString = 'CONFIRMADA' then
    begin

      grdTabela.canvas.Font.color := clRed;
      grdTabela.canvas.Font.Style := [fsBold];

    end

    else
    begin

      grdTabela.canvas.Font.color := clGreen;
      grdTabela.canvas.Font.Style := [];

    end;

  end;

  if not odd(dmMProvider.cdsNFEntrada.RecNo) then
    grdTabela.Canvas.Brush.Color  := COR_ZEBRA_GRADE

  else
    grdTabela.Canvas.Brush.Color  := clWhite;

  //Agora vamos colorir a célula utilizando o método Defaut:

  grdTabela.DefaultDrawColumnCell(rect, DataCol, Column, State)

end;

procedure TfrmModNFEntrada.grdTabelaKeyPress(Sender: TObject; var Key: Char);
begin

  if key = #13 then
    grdTabelaDblClick(Self);

end;

procedure TfrmModNFEntrada.LimparMSG_ERRO;
begin

  lblMsg.Caption := '';
  Application.ProcessMessages;

end;

procedure TfrmModNFEntrada.OcultarAbas(pOpcao:boolean);
begin

  tbsTotais.TabVisible  := pOpcao;
  tbsItens.TabVisible   := tbsTotais.TabVisible;

end;

procedure TfrmModNFEntrada.rdpOpcoesPesquisaClick(Sender: TObject);
begin

  edtConteudoPesquisa.Clear;
  edtConteudoPesquisa.SetFocus;

  case rdpOpcoesPesquisa.ItemIndex of
    2,3,4:edtConteudoPesquisaExit(self);
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

procedure TfrmModNFEntrada.tbsTotaisShow(Sender: TObject);
begin

  if not dmMProvider.cdsNFEntrada.IsEmpty then
  begin

    RelacionarParcelas_NFE(dmMProvider.cdsNFEntradaNFENTRADA.Value);
    RelacionarCFOP_NFE(dmMProvider.cdsNFEntradaNFENTRADA.Value);

    dmMProvider.cdsModelo_Doc.Close;
    dmMProvider.cdsModelo_Doc.ProviderName := 'dspModelo_Doc';

    dmMProvider.cdsModelo_Doc.Open;
    dmMProvider.cdsModelo_Doc.ProviderName := '';

  end;

end;

procedure TfrmModNFEntrada.Tratar_Erro_Conexao(pE: exception);
var
  sChave_Extrang:string;
begin

  if Pos('Unable',pE.Message) > 0then
    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_ERRO_CONEXAO_BANCO
  else if Pos('FOREIGN',pE.Message) > 0then
  begin

    sChave_Extrang := Trim(Copy(pE.Message,pos('ON TABLE',Uppercase(pE.Message))+ 10,Length(pE.Message)));

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', ' + MSG_ERRO_CHAVE_ESTRANGEIRA
                      + Copy(sChave_Extrang,1,pos('"',sChave_Extrang)-1);

  end
  else
    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', ' + pE.Message;

  TocarSomAlerta(ord(SystemHand));

end;

procedure TfrmModNFEntrada.WindowClose1Execute(Sender: TObject);
begin

  Close;

end;

end.
