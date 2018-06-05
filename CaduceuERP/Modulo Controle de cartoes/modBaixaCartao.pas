unit modBaixaCartao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ComCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.Imaging.pngimage, Vcl.ExtCtrls, System.Actions,
  Vcl.ActnList, Vcl.StdActns, Data.DB;

type
  TfrmBaixaCartao = class(TForm)
    grpInformacoes: TGroupBox;
    lblAdministradora: TLabel;
    cboAdministradora: TDBLookupComboBox;
    lblRecebimento: TLabel;
    dtpRecebimento: TDateTimePicker;
    grdTabela: TDBGrid;
    grpMensagem: TGroupBox;
    lblMsg: TLabel;
    imgSair: TImage;
    ActionList1: TActionList;
    WindowClose1: TWindowClose;
    imgSelecionar: TImage;
    actSelecionar: TAction;
    imgBaixa: TImage;
    actBaixarLancamentos: TAction;
    procedure FormCreate(Sender: TObject);
    procedure WindowClose1Execute(Sender: TObject);
    procedure grdTabelaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure actSelecionarExecute(Sender: TObject);
    procedure imgBaixaClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure actBaixarLancamentosExecute(Sender: TObject);
    procedure Tratar_Erro_Conexao(pE: exception);
  private
    { Private declarations }
    cValor:currency;
    procedure LimparMSG_ERRO;
  public
    { Public declarations }
  end;

var
  frmBaixaCartao: TfrmBaixaCartao;

implementation

{$R *.dfm}

uses dataDBEXMaster, dataMProvider, dataMSource, dataMSProcedure,
  modControleCartoes, uConstantes_Padrao, uFuncoes, modInformacoesCreditos;

procedure TfrmBaixaCartao.grdTabelaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if not dmMProvider.cdsSelBaixaCartao.IsEmpty then
  begin

    if not odd(dmMProvider.cdsSelBaixaCartao.RecNo) then
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

procedure TfrmBaixaCartao.imgBaixaClick(Sender: TObject);
begin

  if dmMProvider.cdsSelBaixaCartao.Active then
  begin

    LimparMSG_ERRO;

    lblMsg.Tag      := -1;
    lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_CONFIRMA_BAIXA;

  end;

end;

procedure TfrmBaixaCartao.LimparMSG_ERRO;
begin

  lblMsg.Caption := '';
  Application.ProcessMessages;

end;

procedure TfrmBaixaCartao.Tratar_Erro_Conexao(pE: exception);
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

procedure TfrmBaixaCartao.actBaixarLancamentosExecute(Sender: TObject);
var
  i:integer;

begin

  try

    dmDBEXMaster.fdcMaster.StartTransaction;

    LimparMSG_ERRO;

    dmMSProcedure.fdspBaixaCartaoTicekt.Params[0].Value := dmMProvider.cdsSelBaixaCartaoADMINISTRADORA.Value;
    dmMSProcedure.fdspBaixaCartaoTicekt.Params[1].Value := dmMProvider.cdsSelBaixaCartaoRECEBIMENTO.Value;
    dmMSProcedure.fdspBaixaCartaoTicekt.Params[2].Value := Date;
    dmMSProcedure.fdspBaixaCartaoTicekt.ExecProc;

    dmMSProcedure.fdspAtualizaSaldoCC.Params[0].Value   := dmMProvider.cdsAdministradorasCONTA.Value;
    dmMSProcedure.fdspAtualizaSaldoCC.Params[1].Value   := cValor;
    dmMSProcedure.fdspAtualizaSaldoCC.Params[2].Value   := 0;
    dmMSProcedure.fdspAtualizaSaldoCC.ExecProc;

    dmDBEXMaster.fdcMaster.Commit;

    dmMProvider.cdsSelBaixaCartao.Close;
    dmMProvider.cdsSelBaixaCartao.ProviderName          := 'dspSelBaixaCartao';

    dmDBEXMaster.fdqSelBaixaCartao.Params[0].Value      := dtpRecebimento.Date;
    dmDBEXMaster.fdqSelBaixaCartao.Params[1].Value      := cboAdministradora.KeyValue;

    dmMProvider.cdsSelBaixaCartao.Open;
    dmMProvider.cdsSelBaixaCartao.ProviderName          := '';


  except
    on E: exception do
    begin

      Tratar_Erro_Conexao(E);
      dmDBEXMaster.fdcMaster.Rollback;

    end;


  end;

end;

procedure TfrmBaixaCartao.actSelecionarExecute(Sender: TObject);
begin

  LimparMSG_ERRO;

  if cboAdministradora.Text <> '' then
  begin

    dmMProvider.cdsSelBaixaCartao.Close;
    dmMProvider.cdsSelBaixaCartao.ProviderName      := 'dspSelBaixaCartao';

    dmDBEXMaster.fdqSelBaixaCartao.Params[0].Value  := dtpRecebimento.Date;
    dmDBEXMaster.fdqSelBaixaCartao.Params[1].Value  := cboAdministradora.KeyValue;

    dmMProvider.cdsSelBaixaCartao.Open;
    dmMProvider.cdsSelBaixaCartao.ProviderName      := '';

    if  dmMProvider.cdsSelBaixaCartao.IsEmpty then
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_PERIODO_NAO_ENCONTRADO;
      TocarSomAlerta(ord(SystemHand));

    end;

  end
  else
  begin

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + ', selecione uma Administradora';
    TocarSomAlerta(ord(SystemHand));

  end;

end;

procedure TfrmBaixaCartao.FormCreate(Sender: TObject);
begin

  DesabilitarBotaoFecharForm(self.Handle);

  Color               := COR_PADRAO_DIALOGOS;
  dtpRecebimento.Date := date;

  dmMProvider.cdsAdministradoras.Open;

end;

procedure TfrmBaixaCartao.FormKeyPress(Sender: TObject; var Key: Char);
begin

  cValor := 0;

  if (UpperCase(key) = 'S') and (lblMsg.Tag = -1) then
  begin

    Key                     := #0;
    lblMsg.Tag              := 0;

    frmInformacoesCreditos  := TfrmInformacoesCreditos.Create(self);

    dmMProvider.cdsSelBaixaCartao.DisableControls;
    dmMProvider.cdsSelBaixaCartao.First;

    while not dmMProvider.cdsSelBaixaCartao.Eof do
    begin

      cValor :=cValor +dmMProvider.cdsSelBaixaCartaoVALORARECEBER.Value;
      dmMProvider.cdsSelBaixaCartao.Next;

    end;

    dmMProvider.cdsSelBaixaCartao.First;
    dmMProvider.cdsSelBaixaCartao.EnableControls;

    dmDBEXMaster.fdqContaCorrente.Close;
    dmDBEXMaster.fdqContaCorrente.SQL.Clear;
    dmDBEXMaster.fdqContaCorrente.SQL.Add('SELECT * FROM CONTACORRENTE');
    dmDBEXMaster.fdqContaCorrente.SQL.Add('WHERE CONTA = ' + QuotedStr(dmMProvider.cdsAdministradorasCONTA.Value));
    dmDBEXMaster.fdqContaCorrente.Open;

    frmInformacoesCreditos.memInforCredito.Clear;
    frmInformacoesCreditos.memInforCredito.Lines.Add('Será creditado o valor de R$: '+ FormatFloat('#,##0.00', cValor));
    frmInformacoesCreditos.memInforCredito.Lines.Add('na conta abaixo: ');
    frmInformacoesCreditos.memInforCredito.Lines.Add(' ');
    frmInformacoesCreditos.memInforCredito.Lines.Add('Conta     = ' + dmDBEXMaster.fdqContaCorrente.FieldByName('CONTA').AsString);
    frmInformacoesCreditos.memInforCredito.Lines.Add('Banco     = ' + IntToStr(dmDBEXMaster.fdqContaCorrente.FieldByName('BANCO').AsInteger));
    frmInformacoesCreditos.memInforCredito.Lines.Add('Agência   = ' + dmDBEXMaster.fdqContaCorrente.FieldByName('AGENCIA').AsString);
    frmInformacoesCreditos.memInforCredito.Lines.Add('Titular   = ' + dmDBEXMaster.fdqContaCorrente.FieldByName('TITULAR').AsString);
    dmDBEXMaster.fdqContaCorrente.Close;

    if frmInformacoesCreditos.ShowModal= mrOk then
    begin

      LimparMSG_ERRO;
      actBaixarLancamentosExecute(self)

    end
    else
    begin

      lblMsg.Tag  := 0;
      LimparMSG_ERRO;

    end;

    FreeAndNil(frmInformacoesCreditos)

  end
  else   if (UpperCase(key) = 'N') and (lblMsg.Tag = -1) then
  begin

    key         := #0;
    lblMsg.Tag  := 0;
    LimparMSG_ERRO;

  end;


end;

procedure TfrmBaixaCartao.WindowClose1Execute(Sender: TObject);
begin

  dmMProvider.cdsSelBaixaCartao.Close;

  Close;

end;

end.
