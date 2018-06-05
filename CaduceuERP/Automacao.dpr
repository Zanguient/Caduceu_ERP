program Automacao;

uses
  midaslib,
  Forms,
  Windows,
  Dialogs,
  modAutomacao in 'Automação\modAutomacao.pas' {frmAutomacao},
  modAutomacaoTOLEDO in 'Automação\modAutomacaoTOLEDO.pas',
  modAutomacaoZEUSFREE in 'Automação\modAutomacaoZEUSFREE.pas',
  dataDBEXMaster in 'Data_Modulos\dataDBEXMaster.pas' {dmDBEXMaster: TDataModule},
  dataMProvider in 'Data_Modulos\dataMProvider.pas' {dmMProvider: TDataModule},
  dataMRelatorios in 'Data_Modulos\dataMRelatorios.pas' {dmRelatorios: TDataModule},
  dataMSource in 'Data_Modulos\dataMSource.pas' {dmMSource: TDataModule},
  dataMSProcedure in 'Data_Modulos\dataMSProcedure.pas' {dmMSProcedure: TDataModule},
  datamZeus in 'Data_Modulos\datamZeus.pas' {dmMZeus: TDataModule},
  uFuncoes in '..\..\Funcoes Genericas\uFuncoes.pas',
  uConstantes_Padrao in '..\..\Constantes padrao\uConstantes_Padrao.pas',
  modAutomacaoFILIZOLA in 'Automação\modAutomacaoFILIZOLA.pas',
  modAutomacaoDJPDV in 'Automação\modAutomacaoDJPDV.pas',
  uFuncoes_BD in '..\..\Funcoes Genericas\uFuncoes_BD.pas',
  dataMAtualizacao in 'Data_Modulos\dataMAtualizacao.pas' {dmMAtualizacao: TDataModule},
  dataMDJPdv in 'Data_Modulos\dataMDJPdv.pas' {dmMDJPdv: TDataModule},
  modAutomacaoImportarSintegra in 'Automação\modAutomacaoImportarSintegra.pas';

{$R *.res}
var
  Hwnd: integer;

begin

  if ParamCount <> 4 then
    Halt; { Finaliza }
  Hwnd := FindWindow('TApplication', 'Integração entre aplicações');
  if Hwnd = 0 then
  begin

    Application.Initialize;
    Application.Title := 'Integração entre aplicações';
    Application.CreateForm(TdmDBEXMaster, dmDBEXMaster);
  Application.CreateForm(TdmMZeus, dmMZeus);
  Application.CreateForm(TdmMProvider, dmMProvider);
  Application.CreateForm(TdmMSProcedure, dmMSProcedure);
  Application.CreateForm(TdmMSource, dmMSource);
  Application.CreateForm(TdmMDJPdv, dmMDJPdv);
  Application.CreateForm(TfrmAutomacao, frmAutomacao);
  Application.Run;

  end
  else
    // Esta funcao traz para frente (da o foco) para a janela
    // da aplicacao que ja esta rodando
    ShowWindow(Hwnd, SW_SHOWNORMAL);
end.
