unit modFechaCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.DBCtrls;

type
  TfrmFecha_Caixa = class(TForm)
    imgConfirmar: TImage;
    imgCancelar: TImage;
    grpInfoCaixa: TGroupBox;
    txtDataAbertura: TDBText;
    txtHoraAbertura: TDBText;
    txtFuncionario: TDBText;
    txtValorAbertura: TDBText;
    txtValorMovimento: TDBText;
    lblDataAbertura: TLabel;
    lblHoraAbertura: TLabel;
    lblValorAbertura: TLabel;
    lblValorMovimento: TLabel;
    grpTotais: TGroupBox;
    lblEspecie: TLabel;
    lblCheques: TLabel;
    lblCartoes: TLabel;
    lblOutros: TLabel;
    txtEmEspecie: TDBText;
    txtEmCheques: TDBText;
    txtEmCartoes: TDBText;
    txtOutros: TDBText;
    grpMensagem: TGroupBox;
    lblMsg: TLabel;
    DBText1: TDBText;
    Label1: TLabel;
    procedure imgCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure imgConfirmarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFecha_Caixa: TfrmFecha_Caixa;

implementation

{$R *.dfm}

uses dataDBEXMaster, dataMProvider, dataMSource, uConstantes_Padrao, uFuncoes;

procedure TfrmFecha_Caixa.FormCreate(Sender: TObject);
begin

  DesabilitarBotaoFecharForm(handle);

end;

procedure TfrmFecha_Caixa.FormKeyPress(Sender: TObject; var Key: Char);
begin

  if (UpperCase(Key) = 'S') and (lblMsg.Tag = ord(ConfirmaFechaCX)) then
  begin

    Key         := #0;
    lblMsg.Tag  := ord(nulo);
    ModalResult := mrOk;

  end
  else if (UpperCase(Key) = 'N') AND (lblMsg.Tag <> ord(nulo)) then
  begin

    Key         := #0;
    lblMsg.Tag  := ord(nulo);
    ModalResult := mrClose;

  end;

end;

procedure TfrmFecha_Caixa.imgCancelarClick(Sender: TObject);
begin

  Close;

end;

procedure TfrmFecha_Caixa.imgConfirmarClick(Sender: TObject);
begin

  lblMsg.Tag      := ord(ConfirmaFechaCX);
  lblMsg.Caption  := dmDBEXMaster.sNomeUsuario + MSG_CONFIRMA_FECHA_CX;

end;

end.
