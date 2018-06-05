unit modTipoUilidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmTipoUtilidade = class(TForm)
    grpCadastro: TGroupBox;
    imgConfirmar: TImage;
    imgSair: TImage;
    grpMensagem: TGroupBox;
    lblMsg: TLabel;
    edtDescricao: TDBEdit;
    lblDescricao: TLabel;
    procedure imgSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure imgConfirmarClick(Sender: TObject);
    procedure edtDescricaoEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTipoUtilidade: TfrmTipoUtilidade;

implementation

{$R *.dfm}

uses dataDBEXMaster, dataMProvider, dataMSource, uConstantes_Padrao, uFuncoes,
  uFuncoes_BD, dataMSProcedure;

procedure TfrmTipoUtilidade.edtDescricaoEnter(Sender: TObject);
begin

  LimparMSG_ERRO(lblMsg, nil);

end;

procedure TfrmTipoUtilidade.FormCreate(Sender: TObject);
begin

  DesabilitarBotaoFecharForm(self.Handle);

end;

procedure TfrmTipoUtilidade.FormShow(Sender: TObject);
begin

  dmMProvider.cdsTipoUtilCtrlNotas.Append;

end;

procedure TfrmTipoUtilidade.imgConfirmarClick(Sender: TObject);
begin

  ActiveControl := nil;

  if Length(Trim(edtDescricao.Text)) < 0 then
  begin

    lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CAMPO_OBRIGATORIO;
    Application.ProcessMessages;
    edtDescricao.SetFocus;

  end
  else
  begin

    Man_Tab_Tipo_Util_Ctrl_Notas(0);
    ModalResult := mrOk;

  end;

end;

procedure TfrmTipoUtilidade.imgSairClick(Sender: TObject);
begin

  dmMProvider.cdsTipoUtilCtrlNotas.Cancel;
  Close;

end;

end.
