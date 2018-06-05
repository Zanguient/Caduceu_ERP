program Project1;

uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.UseMetropolisUI;
  TStyleManager.TrySetStyle('Metropolis UI Dark');
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Metropolis UI Application';
  Application.Run;
end.
