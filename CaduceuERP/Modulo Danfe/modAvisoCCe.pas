unit modAvisoCCe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TfrmAvisoUsoCCe = class(TForm)
    memAvisoUsoCCe: TMemo;
    chkLiAvisoUsoCCe: TCheckBox;
    imgConfirmar: TImage;
    procedure imgConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAvisoUsoCCe: TfrmAvisoUsoCCe;

implementation

{$R *.dfm}

procedure TfrmAvisoUsoCCe.imgConfirmarClick(Sender: TObject);
begin

  if chkLiAvisoUsoCCe.Checked then
    ModalResult := mrOk
  else
    ModalResult := mrClose;

end;

end.
