unit modClienteAvulso;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls;

type
  TfrmModClienteAvulso = class(TForm)
    imgConfirmar: TImage;
    imgSair: TImage;
    grpInfoCliente: TGroupBox;
    lblCNPJ_CPF: TLabel;
    lblNome: TLabel;
    Label3: TLabel;
    lblEndereco: TLabel;
    lblNumero: TLabel;
    lblCEP: TLabel;
    lblBairro: TLabel;
    lblCidade: TLabel;
    lblUF: TLabel;
    lblContato: TLabel;
    lblDDD: TLabel;
    lblTelefone: TLabel;
    lblEmail: TLabel;
    edtCNPJ_CPF: TEdit;
    edtIE_RG: TEdit;
    edtNome: TEdit;
    edtEndereco: TEdit;
    edtNumero: TEdit;
    edtCEP: TEdit;
    edtUF: TEdit;
    edtBairro: TEdit;
    edtCidade: TEdit;
    edtContato: TEdit;
    edtDDD: TEdit;
    edtTelefone: TEdit;
    edtEmail: TEdit;
    grpMensagem: TGroupBox;
    lblMsg: TLabel;
    procedure imgSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure imgConfirmarClick(Sender: TObject);
    procedure edtCNPJ_CPFKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCNPJ_CPFKeyPress(Sender: TObject; var Key: Char);
    procedure edtCNPJ_CPFEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmModClienteAvulso: TfrmModClienteAvulso;

implementation

{$R *.dfm}

uses uFuncoes, dataDBEXMaster, uConstantes_Padrao;

procedure TfrmModClienteAvulso.edtCNPJ_CPFEnter(Sender: TObject);
begin

  MudarCorEdit(sender);

end;

procedure TfrmModClienteAvulso.edtCNPJ_CPFKeyDown(Sender: TObject;
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

procedure TfrmModClienteAvulso.edtCNPJ_CPFKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end

end;

procedure TfrmModClienteAvulso.FormCreate(Sender: TObject);
begin

  DesabilitarBotaoFecharForm(Handle);
  Color := COR_PADRAO_DIALOGOS;

end;

procedure TfrmModClienteAvulso.imgConfirmarClick(Sender: TObject);
begin

  LimparMSG_ERRO(lblMsg,nil);

  if Length(Trim(edtNome.Text)) <= 0 then
  begin

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CAMPO_OBRIGATORIO;
    edtNome.SetFocus;

    ModalResult   := mrNone;

  end
  else
    ModalResult := mrOk;

end;

procedure TfrmModClienteAvulso.imgSairClick(Sender: TObject);
begin

  Close;

end;

end.
