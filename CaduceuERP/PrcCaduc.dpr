program PrcCaduc;

uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  dataDBEXMaster in 'Data_Modulos\dataDBEXMaster.pas' {dmDBEXMaster: TDataModule},
  dataMProvider in 'Data_Modulos\dataMProvider.pas' {dmMProvider: TDataModule},
  dataMRelatorios in 'Data_Modulos\dataMRelatorios.pas' {dmRelatorios: TDataModule},
  dataMSource in 'Data_Modulos\dataMSource.pas' {dmMSource: TDataModule},
  dataMSProcedure in 'Data_Modulos\dataMSProcedure.pas' {dmMSProcedure: TDataModule},
  dataSintegraSped in 'Data_Modulos\dataSintegraSped.pas' {dmSintegraSPED: TDataModule},
  uConstantes_Padrao in '..\..\Constantes padrao\uConstantes_Padrao.pas',
  uFuncoes in '..\..\Funcoes Genericas\uFuncoes.pas',
  modTelaPrincipal in 'Modulo Principal\modTelaPrincipal.pas' {frmTelaPrincipal},
  uFuncoes_BD in '..\Funcoes db\uFuncoes_BD.pas';

{$R *.res}

begin

  Application.Initialize;
  Application.UseMetropolisUI;
  Application.MainFormOnTaskbar := True;
//  TStyleManager.TrySetStyle('Luna');
//  Application.Title := 'Metropolis UI Application';
  Application.Title := 'Caduceu - ERP';
  Application.CreateForm(TdmDBEXMaster, dmDBEXMaster);
  Application.CreateForm(TdmMProvider, dmMProvider);
  Application.CreateForm(TdmMSource, dmMSource);
  Application.CreateForm(TfrmTelaPrincipal, frmTelaPrincipal);
  Application.Run;

end.
