unit modCLD_PV;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmCLD_PV = class(TForm)
    imgCancelar: TImage;
    grpCLD_PV: TGroupBox;
    grpProduto: TGroupBox;
    edtProduto: TDBEdit;
    edtDescricao: TDBEdit;
    edtUnidade: TDBEdit;
    grpFormacaoPreco: TGroupBox;
    lblCustoBruto: TLabel;
    lblDescontonaCompra: TLabel;
    lblCreditodeICMS: TLabel;
    Label4: TLabel;
    lblOutrosCustos: TLabel;
    lblFrete: TLabel;
    lblValorICMSR: TLabel;
    lblCustoLiquido: TLabel;
    lblICMS_Pagar: TLabel;
    lblPIS_Cofins: TLabel;
    lblCustoOperacional: TLabel;
    lblComissao: TLabel;
    lblLucroLiquido: TLabel;
    lblDescontonaVenda: TLabel;
    lblMenorPreco: TLabel;
    lblPrecoCalculado: TLabel;
    lblPrecodeVenda: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    procedure imgCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCLD_PV: TfrmCLD_PV;

implementation

{$R *.dfm}

uses dataMSource;

procedure TfrmCLD_PV.imgCancelarClick(Sender: TObject);
begin

  Close;

end;

end.
