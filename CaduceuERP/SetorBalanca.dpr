program SetorBalanca;

uses
  Vcl.Forms,
  modSetordeBalanca in 'Modulo Setor de balanca\modSetordeBalanca.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Manutenção de Setor de Balanca';
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
