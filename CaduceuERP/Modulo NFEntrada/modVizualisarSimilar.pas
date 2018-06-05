unit modVizualisarSimilar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TfrmVizualizarSimilares = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVizualizarSimilares: TfrmVizualizarSimilares;

implementation

{$R *.dfm}

uses dataDBEXMaster, dataMProvider, dataMSource, dataMSProcedure,
  uConstantes_Padrao, uFuncoes;

procedure TfrmVizualizarSimilares.FormCreate(Sender: TObject);
begin

  DesabilitarBotaoFecharForm(self.Handle);

  Color := COR_PADRAO_DIALOGOS;

end;

end.
