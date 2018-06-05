unit modTabelaPrecos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, modDMSource, jpeg;

type
  TfrmTabelaPrecos = class(TForm)
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLLabel1: TRLLabel;
    RLDBText1: TRLDBText;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLImage1: TRLImage;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLBand4: TRLBand;
    RLLabel8: TRLLabel;
    RLSystemInfo3: TRLSystemInfo;
    RLLabel9: TRLLabel;
    RLSystemInfo4: TRLSystemInfo;
    procedure RLBand3BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTabelaPrecos: TfrmTabelaPrecos;

implementation

{$R *.dfm}

procedure TfrmTabelaPrecos.RLBand3BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin

  if RLBand3.Color = clWhite then
    RLBand3.Color := clSilver
  else
    RLBand3.Color := clWhite;
end;

end.
