unit modAtualizaTabelas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Midaslib, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, System.Actions, Vcl.ActnList, Vcl.StdActns;

type
  TfrmAtualizaTabelasSPED = class(TForm)
    grpNomeTabela: TGroupBox;
    cboTablasSPED: TDBLookupListBox;
    grpTabelasSPED: TGroupBox;
    grpInformacoesArquivo: TGroupBox;
    lblTupoSped: TLabel;
    lblNomTabela: TLabel;
    lblPathLocalizacaoTabela: TLabel;
    lblArquivoExiste: TLabel;
    lblTotalRegistroArquivo: TLabel;
    edtTipoSped: TEdit;
    edtNomeTabela: TEdit;
    edtPath_TabelasSPED_F: TEdit;
    edtArquivoExiste: TEdit;
    edtTotaRegistros: TEdit;
    imgSair: TImage;
    grpMensagem: TGroupBox;
    lblMsg: TLabel;
    ActionList1: TActionList;
    WindowClose1: TWindowClose;
    imgAtualizaTabelas: TImage;
    actAtualizaTabelas: TAction;
    lblLinhaProcessada: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Preencher_Controles;
    procedure WindowClose1Execute(Sender: TObject);
    procedure cboTablasSPEDClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure actAtualizaTabelasExecute(Sender: TObject);
  private
    { Private declarations }
    tsTabelaSPED:TStringList;
  public
    { Public declarations }
  end;

var
  frmAtualizaTabelasSPED: TfrmAtualizaTabelasSPED;

implementation

{$R *.dfm}

uses dataDBEXMaster, dataMProvider, dataMSource, dataMSProcedure,
  uConstantes_Padrao, uFuncoes;


procedure TfrmAtualizaTabelasSPED.actAtualizaTabelasExecute(Sender: TObject);
var
  i, iTotalLinhas:integer;
  sLinha, sTabela, sDelimitador,  sCampos:string;
  dData:TDate;
  Texto:TEdit;

begin

  Texto         := TEdit.Create(self);
  sDelimitador  := '|';
  tsTabelaSPED  := TStringList.Create;

  while not dmDBEXMaster.fdqTabelas_SPED.Eof do
  begin

    if FileExists(edtPath_TabelasSPED_F.Text + dmDBEXMaster.fdqTabelas_SPED.FieldByName('OP_NOME_TABELA').Value) then
    begin

      tsTabelaSPED.LoadFromFile(edtPath_TabelasSPED_F.Text + dmDBEXMaster.fdqTabelas_SPED.FieldByName('OP_NOME_TABELA').Value);

      lblMsg.Caption := 'Aguarde..atualizando tabela: ' + dmDBEXMaster.fdqTabelas_SPED.FieldByName('OP_NOME_TABELA').Value;
      Application.ProcessMessages;

      if dmDBEXMaster.fdqTabelas_SPED.FieldByName('OP_NOME_TABELA').Value = 'TB494.TXT' then
      begin

        for i := 1 to tsTabelaSPED.Count do
        begin

          lblLinhaProcessada.Caption := tsTabelaSPED[i];
          Application.ProcessMessages;

          sLinha := tsTabelaSPED[i];

          sCampos     := Copy(sLinha,1,pos(sDelimitador, sLinha)-1);
          sLinha      := Copy(sLinha,pos(sDelimitador,sLinha) + 1, Length(sLinha));

          //codigo de ajuste
          dmMSProcedure.fdspTab_Tab_5_3_SPEDF.Params[0].Value := sCampos;

          sCampos     := Copy(sLinha,1,pos(sDelimitador, sLinha)-1);

          //descrição do ajuste
          Texto.Text := sCampos;
          dmMSProcedure.fdspTab_Tab_5_3_SPEDF.Params[1].Value := RetirarAcentuacao(Texto);

          sLinha      := Copy(sLinha,pos(sDelimitador,sLinha) + 1, Length(sLinha));
          sCampos     := Copy(sLinha,1,pos(sDelimitador, sLinha)-1);

          dData       := StrTodate(Copy(sCampos,1,2) + '/' + Copy(sCampos,3,2) + '/' +Copy(sCampos,5,4));

          //data inicio
          dmMSProcedure.fdspTab_Tab_5_3_SPEDF.Params[2].Value := dData;

          sLinha      := Copy(sLinha,pos(sDelimitador,sLinha) + 1, Length(sLinha));
          if pos(sDelimitador, sLinha) > 0 then
            sCampos     := Copy(sLinha,1,pos(sDelimitador, sLinha)-1)
          else
            sCampos     := sLinha;

          if sCampos <> '' then
          begin

            dData       := StrTodate(Copy(sCampos,1,2) + '/' + Copy(sCampos,3,2) + '/' +Copy(sCampos,5,4));

            //data fim
            dmMSProcedure.fdspTab_Tab_5_3_SPEDF.Params[3].Value := dData;

          end
          else

            dmMSProcedure.fdspTab_Tab_5_3_SPEDF.Params[3].Value := null;

          dmMSProcedure.fdspTab_Tab_5_3_SPEDF.ExecProc;

        end;

      end;

    end;

    dmDBEXMaster.fdqTabelas_SPED.Next;

  end;

  FreeAndNil(tsTabelaSPED);
  FreeAndNil(Texto);

  lblMsg.Caption              := 'Atualização concluída!';
  lblLinhaProcessada.Caption  := '';
  Application.ProcessMessages;

end;

procedure TfrmAtualizaTabelasSPED.cboTablasSPEDClick(Sender: TObject);
begin

  Preencher_Controles;

end;

procedure TfrmAtualizaTabelasSPED.FormCreate(Sender: TObject);
begin

  DesabilitarBotaoFecharForm(self.Handle);

  Color                           := COR_PADRAO_TELAS;
  Caption                         := ' ' + Application.Title + ' - ' + RetornarVersao(ParamStr(0),1) + 'xe';

  dmDBEXMaster.sNomeUsuario       := ParamStr(1);
  dmDBEXMaster.sSenha             := paramstr(2);
  dmDBEXMaster.iIdUsuario         := StrToInt(ParamStr(3));
  dmDBEXMaster.iIdFilial          := StrToInt(ParamStr(4));

  dmDBEXMaster.fdqTabelas_SPED.Open;

  Preencher_Controles;

end;

procedure TfrmAtualizaTabelasSPED.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  case Key of

    VK_DOWN: cboTablasSPEDClick(self);
      VK_UP: cboTablasSPEDClick(self);

  end;

end;

procedure TfrmAtualizaTabelasSPED.Preencher_Controles;
begin

  case dmDBEXMaster.fdqTabelas_SPED.FieldByName('OP_TIPO_SPED').Value of
    0:begin

        edtPath_TabelasSPED_F.Text  := dmMProvider.cdsConfig_iniPATH_TABELAS_AUX_SPED_F.Value;
        edtTipoSped.Text            := 'FISCAL';

      end;
    1:begin

        edtPath_TabelasSPED_F.Text  := dmMProvider.cdsConfig_iniPATH_TABELAS_AUX_SPED_F.Value;
        edtTipoSped.Text            := 'CONTRIBUICOES';

      end;
  end;

  edtNomeTabela.Text  := dmDBEXMaster.fdqTabelas_SPED.FieldByName('OP_NOME_TABELA').Value;

  if FileExists(edtPath_TabelasSPED_F.Text + edtNomeTabela.Text) then
  begin

    tsTabelaSPED                := TStringList.Create;
    tsTabelaSPED.LoadFromFile(edtPath_TabelasSPED_F.Text + edtNomeTabela.Text);

    edtArquivoExiste.Font.Color := clGreen;
    edtArquivoExiste.Text       := 'encontrado';
    edtTotaRegistros.Text       := IntToStr(tsTabelaSPED.Count-1);

    FreeAndNil(tsTabelaSPED);

  end
  else
  begin

    edtArquivoExiste.Font.Color := clRed;
    edtArquivoExiste.Text       := 'não encontrado';
    edtTotaRegistros.Text       := '0';

  end;




end;

procedure TfrmAtualizaTabelasSPED.WindowClose1Execute(Sender: TObject);
begin

  Close;

end;

end.
