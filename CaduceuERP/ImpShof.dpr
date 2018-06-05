program ImpShof;

uses
  Vcl.Forms,
  dataDBEXMaster in 'Data_Modulos\dataDBEXMaster.pas' {dmDBEXMaster: TDataModule},
  dataMProvider in 'Data_Modulos\dataMProvider.pas' {dmMProvider: TDataModule},
  dataMRelatorios in 'Data_Modulos\dataMRelatorios.pas' {dmRelatorios: TDataModule},
  dataMSource in 'Data_Modulos\dataMSource.pas' {dmMSource: TDataModule},
  dataMSProcedure in 'Data_Modulos\dataMSProcedure.pas' {dmMSProcedure: TDataModule},
  datamZeus in 'Data_Modulos\datamZeus.pas' {dmMZeus: TDataModule},
  dataSintegraSped in 'Data_Modulos\dataSintegraSped.pas' {dmSintegraSPED: TDataModule},
  dataShoficina in 'Data_Modulos\dataShoficina.pas' {dmShoficina: TDataModule},
  frmImportarShof in 'ImportaSHOFICINA\frmImportarShof.pas' {frmImportarShoficina},
  uConstantes_Padrao in '..\..\Constantes padrao\uConstantes_Padrao.pas',
  uFuncoes in '..\..\Funcoes Genericas\uFuncoes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmDBEXMaster, dmDBEXMaster);
  Application.CreateForm(TdmMZeus, dmMZeus);
  Application.CreateForm(TdmMProvider, dmMProvider);
  Application.CreateForm(TdmMSProcedure, dmMSProcedure);
  Application.CreateForm(TdmRelatorios, dmRelatorios);
  Application.CreateForm(TdmMSource, dmMSource);
  Application.CreateForm(TdmShoficina, dmShoficina);
  Application.CreateForm(TfrmImportarShoficina, frmImportarShoficina);
  Application.Run;
end.
