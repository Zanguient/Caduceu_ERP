unit modInformacoesNFE_CPA;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.DBCtrls;

type
  TfrmInformacoesCPA_NFE = class(TForm)
    imgOk: TImage;
    imgSair: TImage;
    grpPlanoContas: TGroupBox;
    lblConta: TLabel;
    lblSubConta: TLabel;
    cboConta: TDBLookupComboBox;
    cboSubConta: TDBLookupComboBox;
    grpLancamento: TGroupBox;
    cboLancamento: TDBLookupComboBox;
    imgLimparSelecao: TImage;
    procedure FormCreate(Sender: TObject);
    procedure imgSairClick(Sender: TObject);
    procedure imgLimparSelecaoClick(Sender: TObject);
    procedure imgOkClick(Sender: TObject);
    procedure cboContaCloseUp(Sender: TObject);
    procedure cboContaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInformacoesCPA_NFE: TfrmInformacoesCPA_NFE;

implementation

{$R *.dfm}

uses dataDBEXMaster, dataMProvider, dataMSource, dataMSProcedure,
  uConstantes_Padrao, uFuncoes;

procedure TfrmInformacoesCPA_NFE.cboContaCloseUp(Sender: TObject);
begin

  if cboConta.KeyValue >= 0 then
  begin

    dmMProvider.cdsItemPlContas.Close;
    dmMProvider.cdsItemPlContas.ProviderName := 'dspItemPlContas';

    dmDBEXMaster.fdqItemPlanoContas.SQL.Clear;
    dmDBEXMaster.fdqItemPlanoContas.SQL.Add('select * from itemplanodecontas');
    dmDBEXMaster.fdqItemPlanoContas.SQL.Add('where tipo = 0');
    dmDBEXMaster.fdqItemPlanoContas.SQL.Add('and planodecontas = ' + IntToStr(dmMProvider.cdsPlanoContasPLANODECONTAS.Value));
    dmDBEXMaster.fdqItemPlanoContas.SQL.Add('order by descricao');

    dmMProvider.cdsItemPlContas.Open;
    dmMProvider.cdsItemPlContas.ProviderName := '';

  end;

end;

procedure TfrmInformacoesCPA_NFE.cboContaKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end;

end;

procedure TfrmInformacoesCPA_NFE.FormCreate(Sender: TObject);
begin

  DesabilitarBotaoFecharForm(handle);
  Color := COR_PADRAO_DIALOGOS;

  dmMProvider.cdsPlanoContas.Close;
  dmMProvider.cdsPlanoContas.ProviderName := 'dspPlanoContas';

  dmDBEXMaster.fdqPlanoContas.SQL.Clear;
  dmDBEXMaster.fdqPlanoContas.SQL.Add('select * from planodecontas');
  dmDBEXMaster.fdqPlanoContas.SQL.Add('where tipo = 0');
  dmDBEXMaster.fdqPlanoContas.SQL.Add('order by descricao');

  dmMProvider.cdsPlanoContas.Open;
  dmMProvider.cdsPlanoContas.ProviderName := '';

  dmMProvider.cdsLancamentos.Close;
  dmMProvider.cdsLancamentos.ProviderName := 'dspLancamentos';

  dmDBEXMaster.fdqLancamentos.SQL.Clear;
  dmDBEXMaster.fdqLancamentos.SQL.Add('select * from lancamento');
  dmDBEXMaster.fdqLancamentos.SQL.Add('where tipo = 0');
  dmDBEXMaster.fdqLancamentos.SQL.Add('order by nome');

  dmMProvider.cdsLancamentos.Open;
  dmMProvider.cdsLancamentos.ProviderName := '';


end;

procedure TfrmInformacoesCPA_NFE.imgLimparSelecaoClick(Sender: TObject);
begin

  cboConta.KeyValue       := -1;
  cboSubConta.KeyValue    := cboConta.KeyValue;
  cboLancamento.KeyValue  := cboConta.KeyValue;

end;

procedure TfrmInformacoesCPA_NFE.imgOkClick(Sender: TObject);
begin

  if (cboConta.KeyValue >= 0) or (cboSubConta.KeyValue >= 0) or (cboLancamento.KeyValue >= 0) then
    ModalResult := mrOk
  else
    Close;

end;

procedure TfrmInformacoesCPA_NFE.imgSairClick(Sender: TObject);
begin

  Close;

end;

end.
