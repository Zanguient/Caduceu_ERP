unit modFormaPagtoOS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, db;

type
  TfrmFormasPagtoOS = class(TForm)
    memFormasPagtoOS: TDBMemo;
    grpMensagem: TGroupBox;
    lblMsg: TLabel;
    imgSair: TImage;
    imgSalvar: TImage;
    procedure imgSairClick(Sender: TObject);
    procedure imgSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure LimparMSG_ERRO;
  public
    { Public declarations }
  end;

var
  frmFormasPagtoOS: TfrmFormasPagtoOS;

implementation

{$R *.dfm}

uses dataDBEXMaster, dataMProvider, dataMRelatorios, dataMSource,
  dataMSProcedure, uConstantes_Padrao, uFuncoes;

procedure TfrmFormasPagtoOS.FormCreate(Sender: TObject);
begin

  DesabilitarBotaoFecharForm(self.Handle);
  Color   := COR_PADRAO_DIALOGOS;
  Caption := caption + IntToStr(dmMProvider.cdsOrdemServicoORDEM_DE_SERVICO.Value);

end;

procedure TfrmFormasPagtoOS.imgSairClick(Sender: TObject);
begin

  Close

end;

procedure TfrmFormasPagtoOS.imgSalvarClick(Sender: TObject);
begin

  LimparMSG_ERRO;

  try

    if dmMProvider.cdsOrdemServico.State in [dsEdit, dsInsert] then
    begin

      dmDBEXMaster.fdcMaster.StartTransaction;

      dmMSProcedure.fdspMaster.StoredProcName := 'EXECUTA_SQL';
      dmMSProcedure.fdspMaster.Prepare;

      dmMSProcedure.fdspMaster.Params[0].Value := 'UPDATE ORDEM_DE_SERVICO SET ORCA_FORMAS = ' + QuotedStr(memFormasPagtoOS.Text);
      dmMSProcedure.fdspMaster.ExecProc;

      dmDBEXMaster.fdcMaster.CommitRetaining;
      dmMProvider.cdsOrdemServico.Post;

    end;

    Close;

  except
    on E: exception do
    begin

      lblMsg.Caption := dmDBEXMaster.sNomeUsuario +  Tratar_Erro_Conexao(E);
      dmDBEXMaster.fdcMaster.Rollback;

    end;

  end;

end;

procedure TfrmFormasPagtoOS.LimparMSG_ERRO;
begin

  lblMsg.Caption := '';
  Application.ProcessMessages;

end;

end.
