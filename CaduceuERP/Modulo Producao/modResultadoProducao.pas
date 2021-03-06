unit modResultadoProducao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TfrmResultadoProcucao = class(TForm)
    grpProdutoFinal: TGroupBox;
    edtDescricaoProdutoFinal: TDBEdit;
    imgSair: TImage;
    GroupBox1: TGroupBox;
    memResultado: TMemo;
    edtUnidadeProdutoFinal: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure imgSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmResultadoProcucao: TfrmResultadoProcucao;

implementation

{$R *.dfm}

uses dataMProvider, dataMSource;

procedure TfrmResultadoProcucao.FormCreate(Sender: TObject);
begin

  memResultado.Clear;
  memResultado.Lines.Add('Itens que sofrer�o movimenta��o de seus saldos');
  memResultado.Lines.Add('--------------------------------------------------------------------------');
  memResultado.Lines.Add('[ OPERA��O ] [ QUANTIDADE ] [PRODUTO/DESCRI��O]');
  memResultado.Lines.Add('  ENTRADA   ' + format('%14.14s', [formatfloat('#,##0.000', (dmMProvider.cdsOrdemProducaoQUANTIDADE.Value * dmMProvider.cdsOrdemProducaoRENDIMENTO.Value))]) + '   ' + dmMProvider.cdsOrdemProducaoDESCRICAO_PRODUTO.Value);
  memResultado.Lines.Add(' ');
  memResultado.Lines.Add('--------------------------------------------------------------------------');

  dmMProvider.cdsItemOrdemProducao.First;
  dmMProvider.cdsItemOrdemProducao.DisableControls;

  while not dmMProvider.cdsItemOrdemProducao.Eof do
  begin

    memResultado.Lines.Add('  SA�DA     ' + format('%14.14s', [formatfloat('#,##0.000', dmMProvider.cdsItemOrdemProducaoQUANTIDADE_PREVISTA.Value)]) + '   ' + format('%7.7s',[FormatFloat('#######',dmMProvider.cdsItemOrdemProducaoPRODUTO_INSUMO.Value)]) + ' ' + dmMProvider.cdsItemOrdemProducaoDESCRICAO_PRODUTO.Value);
    dmMProvider.cdsItemOrdemProducao.Next;

  end;

  dmMProvider.cdsItemOrdemProducao.First;
  dmMProvider.cdsItemOrdemProducao.EnableControls;

end;

procedure TfrmResultadoProcucao.imgSairClick(Sender: TObject);
begin

  Close;

end;

end.
