unit modEquipamentoAvulso;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls;

type
  TfrmModEquipamentoAvulso = class(TForm)
    imgConfirmar: TImage;
    imgSair: TImage;
    grpMensagem: TGroupBox;
    lblMsg: TLabel;
    grpInformacaoEquipamento: TGroupBox;
    lblEquipamento: TLabel;
    edtAparelho: TEdit;
    lblModelo: TLabel;
    edtModelo: TEdit;
    edtNumero: TEdit;
    lblNumero: TLabel;
    lblIOutrosItens: TLabel;
    edtOutrosItens: TEdit;
    lblKM: TLabel;
    edtKM: TEdit;
    procedure edtAparelhoEnter(Sender: TObject);
    procedure imgSairClick(Sender: TObject);
    procedure imgConfirmarClick(Sender: TObject);
    procedure edtAparelhoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtAparelhoKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmModEquipamentoAvulso: TfrmModEquipamentoAvulso;

implementation

{$R *.dfm}

uses dataDBEXMaster, uFuncoes, uConstantes_Padrao;

procedure TfrmModEquipamentoAvulso.edtAparelhoEnter(Sender: TObject);
begin

  MudarCorEdit(sender);

end;

procedure TfrmModEquipamentoAvulso.edtAparelhoKeyDown(Sender: TObject;
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

procedure TfrmModEquipamentoAvulso.edtAparelhoKeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(Handle, WM_KEYDOWN, VK_TAB, 1);

  end

end;

procedure TfrmModEquipamentoAvulso.FormCreate(Sender: TObject);
begin

  DesabilitarBotaoFecharForm(Handle);

end;

procedure TfrmModEquipamentoAvulso.imgConfirmarClick(Sender: TObject);
begin

  LimparMSG_ERRO(lblMsg, nil);

  if Length(Trim(edtAparelho.Text)) <= 0 then
  begin

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CAMPO_OBRIGATORIO;
    edtAparelho.SetFocus;

  end
  else
    ModalResult := mrOk;

end;

procedure TfrmModEquipamentoAvulso.imgSairClick(Sender: TObject);
begin

  Close;

end;

end.
