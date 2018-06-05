unit modIncluirEditarDeslocamentoOS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.Mask, JvExMask, JvToolEdit, JvMaskEdit, JvCheckedMaskEdit,
  JvDatePickerEdit, JvDBDatePickerEdit, Vcl.ComCtrls, JvExComCtrls,
  JvDateTimePicker, JvDBDateTimePicker, Vcl.DBCtrls;

type
  TfrmIncluirEditarDeslocamentoOS = class(TForm)
    imgSair: TImage;
    imgSalvar: TImage;
    lblF4: TLabel;
    lblF3: TLabel;
    imgDesfazer: TImage;
    grpOrigemsaida: TGroupBox;
    lblHorarioSaidaOrigem: TLabel;
    tmrHoraSaidaOrigem: TJvDBDateTimePicker;
    lblKMSaidaOrigem: TLabel;
    edtKMSaidaOrigem: TDBEdit;
    grpChegadaDestino: TGroupBox;
    lblHorarioChegadaDestino: TLabel;
    lblKMChegadaDestino: TLabel;
    tmrHoraChegadaDestino: TJvDBDateTimePicker;
    edtKMChegadaDestino: TDBEdit;
    grpSaidaDestino: TGroupBox;
    lblHorarioSaidaDestino: TLabel;
    lblKMSaidaDestino: TLabel;
    tmrHorarioSaidaDestino: TJvDBDateTimePicker;
    edtKMSaidaDestino: TDBEdit;
    grpRegressoOrigem: TGroupBox;
    lblHorarioRegressoOrigem: TLabel;
    lblKMRegressoOrigem: TLabel;
    tmrHorarioRegressoOrigem: TJvDBDateTimePicker;
    edtRegressoOrigem: TDBEdit;
    grpDespesas: TGroupBox;
    lblAlimentacao: TLabel;
    lblHospedagem: TLabel;
    edtHospedagem: TDBEdit;
    edtAlimentacao: TDBEdit;
    grpData: TGroupBox;
    dtpDataSaidaOrigem: TJvDBDatePickerEdit;
    procedure FormCreate(Sender: TObject);
    procedure dtpDataSaidaOrigemEnter(Sender: TObject);
    procedure edtAlimentacaoKeyPress(Sender: TObject; var Key: Char);
    procedure dtpDataSaidaOrigemKeyPress(Sender: TObject; var Key: Char);
    procedure lblF3Click(Sender: TObject);
    procedure lblF4Click(Sender: TObject);
    procedure imgSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dtpDataSaidaOrigemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIncluirEditarDeslocamentoOS: TfrmIncluirEditarDeslocamentoOS;

implementation

{$R *.dfm}

uses dataDBEXMaster, dataMProvider, dataMSource, uConstantes_Padrao, uFuncoes;

procedure TfrmIncluirEditarDeslocamentoOS.dtpDataSaidaOrigemEnter(
  Sender: TObject);
begin

   MudarCorEdit(Sender);

end;

procedure TfrmIncluirEditarDeslocamentoOS.dtpDataSaidaOrigemKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure TfrmIncluirEditarDeslocamentoOS.dtpDataSaidaOrigemKeyPress(
  Sender: TObject; var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end;

end;

procedure TfrmIncluirEditarDeslocamentoOS.edtAlimentacaoKeyPress(
  Sender: TObject; var Key: Char);
begin

  if Key = FormatSettings.DecimalSeparator then
    Key := ',';

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end;

end;

procedure TfrmIncluirEditarDeslocamentoOS.FormCreate(Sender: TObject);
begin

  DesabilitarBotaoFecharForm(Handle);

end;

procedure TfrmIncluirEditarDeslocamentoOS.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

  case key of
    VK_F3:lblF3Click(self);
    VK_F4:lblF4Click(self);
  end;

end;

procedure TfrmIncluirEditarDeslocamentoOS.imgSairClick(Sender: TObject);
begin

  if InserindoEditando(dmMProvider.cdsDeslocamentoOS)  then
    lblF3Click(self);

  Close;

end;

procedure TfrmIncluirEditarDeslocamentoOS.lblF3Click(Sender: TObject);
begin

  if InserindoEditando(dmMProvider.cdsDeslocamentoOS) then
  begin

    dmMProvider.cdsDeslocamentoOS.Cancel;
    ModalResult := mrClose;

  end;

end;

procedure TfrmIncluirEditarDeslocamentoOS.lblF4Click(Sender: TObject);
begin

  if InserindoEditando(dmMProvider.cdsDeslocamentoOS) then
  begin

    dmMProvider.cdsDeslocamentoOS.Post;
    ModalResult := mrOk;

  end
  else
    ModalResult := mrClose;

end;

end.
