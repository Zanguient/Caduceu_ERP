unit modInformacoesCreditos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls;

type
  TfrmInformacoesCreditos = class(TForm)
    memInforCredito: TMemo;
    imgSair: TImage;
    imgConfirma: TImage;
    procedure FormCreate(Sender: TObject);
    procedure imgSairClick(Sender: TObject);
    procedure imgConfirmaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInformacoesCreditos: TfrmInformacoesCreditos;

implementation

{$R *.dfm}

uses dataDBEXMaster, dataMProvider, dataMSource, dataMSProcedure,
  modBaixaCartao, modControleCartoes, uConstantes_Padrao, uFuncoes;

procedure TfrmInformacoesCreditos.FormCreate(Sender: TObject);
begin

  DesabilitarBotaoFecharForm(self.Handle);

  Color  := COR_TITULO_GRADE;

end;

procedure TfrmInformacoesCreditos.imgConfirmaClick(Sender: TObject);
begin

  ModalResult := mrOk;

end;

procedure TfrmInformacoesCreditos.imgSairClick(Sender: TObject);
begin

  Close;

end;

end.
