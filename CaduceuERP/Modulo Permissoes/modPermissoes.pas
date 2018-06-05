unit modPermissoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.CheckLst, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  System.Actions, Vcl.ActnList;

type
  TDBGrid = class(Vcl.DBGrids.TDBGrid)
  protected
    procedure DrawCellBackground(const ARect: TRect; AColor: TColor;
      AState: TGridDrawState; ACol, ARow: Integer); override;
  end;
  TfrmPermissoes = class(TForm)
    grpUsuarios: TGroupBox;
    grdusuarios: TDBGrid;
    grpPermi9ssoes: TGroupBox;
    lstPermissoes: TListView;
    imgSair: TImage;
    imgCarregarMenu: TImage;
    ActionList1: TActionList;
    actCarregarMenu: TAction;
    procedure FormCreate(Sender: TObject);
    procedure imgSairClick(Sender: TObject);
    procedure actCarregarMenuExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPermissoes: TfrmPermissoes;

implementation

{$R *.dfm}

uses dataDBEXMaster, dataMProvider, dataMSource, dataMSProcedure,
  uConstantes_Padrao, uFuncoes, uFuncoes_BD;

procedure TfrmPermissoes.actCarregarMenuExecute(Sender: TObject);
begin

  AbrirTabelaCtrl_Modulos;
  lstPermissoes.Items.Clear;
  lstPermissoes.Items.BeginUpdate;

  while not dmMProvider.cdsCtrlModulos.Eof do
  begin

    lstPermissoes.Groups.Add.Header :=dmMProvider.cdsCtrlModulosNOME_MODULO.Value;
    lstPermissoes.Items.Add.Caption := 'INCLUIR';
    lstPermissoes.Items.Add.Caption := 'INCLUIR';



    dmMProvider.cdsCtrlModulos.Next;

  end;

end;

procedure TfrmPermissoes.FormCreate(Sender: TObject);
var
  i:integer;
begin

  Caption := Application.Title + ' - ' + PREFIXO_VERSAO + RetornarVersao(Application.ExeName, 1);

  DesabilitarBotaoFecharForm(handle);

  dmDBEXMaster.sNomeUsuario := ParamStr(1);
  dmDBEXMaster.sSenha       := ParamStr(2);
  dmDBEXMaster.iIdUsuario   := StrToInt(ParamStr(3));
  dmDBEXMaster.iIdFilial    := StrToInt(ParamStr(4));

  for i := 0 to grdusuarios.Columns.Count - 1 do
    grdusuarios.Columns[i].Title.Color := COR_TITULO_GRADE;

  AbrirTabelaUsuarios(0);

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

procedure TfrmPermissoes.imgSairClick(Sender: TObject);
begin

  Close;

end;

end.
