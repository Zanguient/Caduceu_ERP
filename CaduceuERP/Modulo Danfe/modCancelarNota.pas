unit modCancelarNota;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmCancelamentoNFe = class(TForm)
    grpCancelamento: TGroupBox;
    lblInfoNF: TLabel;
    grpJustificativa: TGroupBox;
    memJustificativa: TMemo;
    imgConfirmar: TImage;
    imgSair: TImage;
    grpMensagem: TGroupBox;
    lblMsg: TLabel;
    procedure imgSairClick(Sender: TObject);
    procedure memJustificativaKeyPress(Sender: TObject; var Key: Char);
    procedure memJustificativaEnter(Sender: TObject);
    procedure imgConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCancelamentoNFe: TfrmCancelamentoNFe;

implementation

{$R *.dfm}

uses uConstantes_Padrao, uFuncoes, dataDBEXMaster;

procedure TfrmCancelamentoNFe.imgConfirmarClick(Sender: TObject);
begin

  if Length(Trim(memJustificativa.Text)) < 15 then
  begin

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_TAMANHO_MINIMO + ' Mínimo 15 CATACTERES';
    Application.ProcessMessages;

  end
  else
    ModalResult := mrOk;

end;

procedure TfrmCancelamentoNFe.imgSairClick(Sender: TObject);
begin

  Close;

end;

procedure TfrmCancelamentoNFe.memJustificativaEnter(Sender: TObject);
begin

  MudarCorEdit(sender);

end;

procedure TfrmCancelamentoNFe.memJustificativaKeyPress(Sender: TObject; var Key: Char);
begin

  Key := UpCase(Key);

end;

end.
