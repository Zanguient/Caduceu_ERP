unit modChecagemTotais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls;

type
  TfrmChecagemTotais = class(TForm)
    memTotais: TMemo;
    imgSair: TImage;
    procedure FormCreate(Sender: TObject);
    procedure imgSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmChecagemTotais: TfrmChecagemTotais;

implementation

{$R *.dfm}

uses dataDBEXMaster, dataMProvider, dataMSource, dataMSProcedure, uConstantes_Padrao, uFuncoes;

procedure TfrmChecagemTotais.FormCreate(Sender: TObject);
begin

  DesabilitarBotaoFecharForm(handle);
  color := COR_PADRAO_DIALOGOS;

end;

procedure TfrmChecagemTotais.imgSairClick(Sender: TObject);
begin

  Close;

end;

end.
