unit modLogSys;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.DBCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TDBGrid = class(Vcl.DBGrids.TDBGrid)
  protected
    procedure DrawCellBackground(const ARect: TRect; AColor: TColor;
      AState: TGridDrawState; ACol, ARow: Integer); override;
  end;
  TfrmLogSys = class(TForm)
    pgcLog: TPageControl;
    tbsLog: TTabSheet;
    tbsFotoZoom: TTabSheet;
    grdLogSys: TDBGrid;
    memLog: TDBMemo;
    memLogErroExtendido: TDBMemo;
    grpFiltroPeriodo: TGroupBox;
    lblDataInicial: TLabel;
    lblDataFinal: TLabel;
    dtpDataInicial: TDateTimePicker;
    dtpDataFinal: TDateTimePicker;
    grpFiltroUsuario: TGroupBox;
    imfLimparCBOUsuario: TImage;
    cboUsuario: TDBLookupComboBox;
    GroupBox1: TGroupBox;
    imgLimparCBOTabelaModulo: TImage;
    cboSelecionaTabelaLOG: TDBLookupComboBox;
    imgFiltrar: TImage;
    imgSair: TImage;
    grpMensagem: TGroupBox;
    lblMsg: TLabel;
    lblLog: TLabel;
    lblLogErro: TLabel;
    memFoto: TDBImage;
    lblFoto: TLabel;
    memFotoZoom: TDBImage;
    procedure FormCreate(Sender: TObject);
    procedure imgSairClick(Sender: TObject);
    procedure imgFiltrarClick(Sender: TObject);
    procedure imgLimparCBOTabelaModuloClick(Sender: TObject);
    procedure imfLimparCBOUsuarioClick(Sender: TObject);
    procedure grdLogSysDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure memFotoDblClick(Sender: TObject);
    procedure tbsLogShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogSys: TfrmLogSys;

implementation

{$R *.dfm}

uses dataDBEXMaster, dataMProvider, uFuncoes, uConstantes_Padrao, dataMSource;

procedure TfrmLogSys.FormCreate(Sender: TObject);
var
  i:integer;
begin

  DesabilitarBotaoFecharForm(self.Handle);

  Caption                   := ' ' + Application.Title + ' - ' + PREFIXO_VERSAO + RetornarVersao(ParamStr(0),1);

  dmDBEXMaster.sNomeUsuario := ParamStr(1);
  dmDBEXMaster.sSenha       := paramstr(2);
  dmDBEXMaster.iIdUsuario   := StrToInt(ParamStr(3));
  dmDBEXMaster.iIdFilial    := StrToInt(ParamStr(4));

  dmMProvider.cdsFilial.Close;
  dmMProvider.cdsFilial.ProviderName := 'dspFilial';

  dmMProvider.cdsFilial.Open;
  dmMProvider.cdsFilial.ProviderName := '';

  dmMProvider.cdsUsuarios.Close;
  dmMProvider.cdsUsuarios.ProviderName := 'dspUsuarios';

  dmMProvider.cdsUsuarios.Open;
  dmMProvider.cdsUsuarios.ProviderName := '';

  if Length(Trim(ParamStr(5))) > 0 then
    cboUsuario.KeyValue := ParamStr(5);

  if Length(Trim(ParamStr(6))) > 0 then
    cboSelecionaTabelaLOG.KeyValue := ParamStr(6);

  dmMProvider.cdsSelecionaTabelaLOG.Close;
  dmMProvider.cdsSelecionaTabelaLOG.ProviderName := 'dspSelecionaTabelaLOG';

  dmMProvider.cdsSelecionaTabelaLOG.Open;
  dmMProvider.cdsSelecionaTabelaLOG.ProviderName := '';

  LimparMSG_ERRO(lblMsg, nil);

  for i := 0 to grdLogSys.Columns.Count - 1 do
    grdLogSys.Columns[i].Title.Color := COR_TITULO_GRADE;

  pgcLog.Pages[1].TabVisible := False;

  dtpDataInicial.Date := date;
  dtpDataFinal.Date   := dtpDataInicial.Date;

end;

procedure TfrmLogSys.grdLogSysDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if not dmMProvider.cdsLogSys.IsEmpty then
  begin

    if not odd(dmMProvider.cdsLogSys.RecNo) then
    begin

      grdLogSys.Canvas.Font.Color   := clBlack;
      grdLogSys.Canvas.Brush.Color  := COR_ZEBRA_GRADE;

    end
    else
    begin

      grdLogSys.Canvas.Font.Color   := clBlack;
      grdLogSys.Canvas.Brush.Color  := clWhite;

    end;

    grdLogSys.Canvas.FillRect(Rect);
    grdLogSys.DefaultDrawDataCell(Rect, Column.Field, State);

  end;

end;

procedure TfrmLogSys.imfLimparCBOUsuarioClick(Sender: TObject);
begin

  cboUsuario.KeyValue := '';

end;

procedure TfrmLogSys.imgFiltrarClick(Sender: TObject);
begin

  try

    LimparMSG_ERRO(lblMsg, nil);

    dmMProvider.cdsLogSys.Close;
    dmMProvider.cdsLogSys.ProviderName := 'dspLogSys';

    dmDBEXMaster.fdqLogSys.Params[0].Value := dtpDataInicial.Date;
    dmDBEXMaster.fdqLogSys.Params[1].Value := dtpDataFinal.Date;
    dmDBEXMaster.fdqLogSys.Params[2].Value := cboUsuario.KeyValue;
    dmDBEXMaster.fdqLogSys.Params[3].Value := cboSelecionaTabelaLOG.KeyValue;

    dmMProvider.cdsLogSys.Open;
    dmMProvider.cdsLogSys.ProviderName := '';

    if dmMProvider.cdsLogSys.IsEmpty then
      lblMsg.Caption := dmDBEXMaster.sNomeUsuario + MSG_CONSULTA_VAZIA;

  except

  end;


end;

procedure TfrmLogSys.imgLimparCBOTabelaModuloClick(Sender: TObject);
begin

  cboSelecionaTabelaLOG.KeyValue := '';

end;

procedure TfrmLogSys.imgSairClick(Sender: TObject);
begin


  Close;

end;

procedure TfrmLogSys.memFotoDblClick(Sender: TObject);
begin

  if not dmMProvider.cdsLogSys.IsEmpty then
  begin

    pgcLog.Pages[1].TabVisible := True;
    pgcLog.ActivePageIndex := 1;

  end;

end;

procedure TfrmLogSys.tbsLogShow(Sender: TObject);
begin

//  pgcLog.Pages[1].TabVisible := False;

end;

{ TDBGrid }

procedure TDBGrid.DrawCellBackground(const ARect: TRect; AColor: TColor;
  AState: TGridDrawState; ACol, ARow: Integer);
begin
  inherited;

  if ACol < 0 then
    inherited DrawCellBackground(ARect, AColor, AState, ACol, ARow)
  else
    inherited DrawCellBackground(ARect, Columns[ACol].Title.Color, AState,
      ACol, ARow)

end;

end.
