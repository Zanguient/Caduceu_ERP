unit modSelecionaClienteEntrega;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TDBGrid = class(Vcl.DBGrids.TDBGrid)
  protected
    procedure DrawCellBackground(const ARect: TRect; AColor: TColor;
      AState: TGridDrawState; ACol, ARow: Integer); override;
  end;
  TfrmInformacaoEntrega = class(TForm)
    grpInfoEntrega: TGroupBox;
    lblMensagem: TLabel;
    grdClienteEntrega: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInformacaoEntrega: TfrmInformacaoEntrega;

implementation

{$R *.dfm}

uses dataDBEXMaster, dataMProvider, dataMSource, uConstantes_Padrao, uFuncoes;

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

procedure TfrmInformacaoEntrega.FormCreate(Sender: TObject);
var
  i:integer;
begin

  DesabilitarBotaoFecharForm(handle);
  Color := COR_PADRAO_DIALOGOS;

  for i := 0 to grdClienteEntrega.Columns.Count - 1 do
    grdClienteEntrega.Columns[i].Title.Color := COR_TITULO_GRADE;

end;

procedure TfrmInformacaoEntrega.FormKeyPress(Sender: TObject; var Key: Char);
begin

  if key = #13 then
    ModalResult := mrOk
  else if key = #27 then
    ModalResult := mrClose;

end;

end.
