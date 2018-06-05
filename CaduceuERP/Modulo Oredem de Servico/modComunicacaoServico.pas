unit modComunicacaoServico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.DBCtrls;

type
  TfrmComunicacaoServico = class(TForm)
    imgConfirmar: TImage;
    imgSair: TImage;
    lblCliente: TLabel;
    lblPrazo: TLabel;
    GroupBox1: TGroupBox;
    lblPazoEstimado: TLabel;
    lblExecutante: TLabel;
    edtCliente: TEdit;
    edtPrazo: TEdit;
    edtPrazoEstimado: TEdit;
    edtExecutante: TEdit;
    grpMensagem: TGroupBox;
    lblMsg: TLabel;
    lblOS: TLabel;
    DBText1: TDBText;
    procedure FormCreate(Sender: TObject);
    procedure imgSairClick(Sender: TObject);
    procedure imgConfirmarClick(Sender: TObject);
    procedure edtClienteEnter(Sender: TObject);
    procedure edtClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtClienteKeyPress(Sender: TObject; var Key: Char);
    procedure LimparMSG_ERRO;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmComunicacaoServico: TfrmComunicacaoServico;

implementation

{$R *.dfm}

uses uConstantes_Padrao, uFuncoes, dataMSource, dataDBEXMaster;

procedure TfrmComunicacaoServico.edtClienteEnter(Sender: TObject);
begin

  MudarCorEdit(Sender);

end;

procedure TfrmComunicacaoServico.edtClienteKeyDown(Sender: TObject;
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

procedure TfrmComunicacaoServico.edtClienteKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end

end;

procedure TfrmComunicacaoServico.FormCreate(Sender: TObject);
begin

  DesabilitarBotaoFecharForm(Handle);

  Color  := COR_PADRAO_DIALOGOS;

end;

procedure TfrmComunicacaoServico.imgConfirmarClick(Sender: TObject);
begin

  LimparMSG_ERRO;

  if Length(Trim(edtCliente.Text)) <=0 then
  begin

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CAMPO_OBRIGATORIO;
    edtCliente.SetFocus;

  end
  else if Length(Trim((edtPrazo.Text))) <=0 then
  begin

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CAMPO_OBRIGATORIO;
    edtPrazo.SetFocus;

  end
  else if Length(Trim((edtPrazoEstimado.Text))) <=0 then
  begin

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CAMPO_OBRIGATORIO;
    edtPrazoEstimado.SetFocus;

  end
  else if Length(Trim((edtExecutante.Text))) <=0 then
  begin

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CAMPO_OBRIGATORIO;
    edtExecutante.SetFocus;

  end
  else
    ModalResult := mrOk;


end;

procedure TfrmComunicacaoServico.imgSairClick(Sender: TObject);
begin

  Close;

end;

procedure TfrmComunicacaoServico.LimparMSG_ERRO;
begin

  lblMsg.Caption := '';
  Application.ProcessMessages;

end;

end.
