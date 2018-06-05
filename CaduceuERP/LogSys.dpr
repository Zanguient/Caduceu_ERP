program LogSys;

uses
  Vcl.Forms,
  midaslib,
  Windows,
  modLogSys in 'Modulo Log_Sys\modLogSys.pas' {frmLogSys},
  dataDBEXMaster in 'Data_Modulos\dataDBEXMaster.pas' {dmDBEXMaster: TDataModule},
  dataMAtualizacao in 'Data_Modulos\dataMAtualizacao.pas' {dmMAtualizacao: TDataModule},
  dataMDJPdv in 'Data_Modulos\dataMDJPdv.pas' {dmMDJPdv: TDataModule},
  dataMProvider in 'Data_Modulos\dataMProvider.pas' {dmMProvider: TDataModule},
  dataMRelatorios in 'Data_Modulos\dataMRelatorios.pas' {dmRelatorios: TDataModule},
  dataMSource in 'Data_Modulos\dataMSource.pas' {dmMSource: TDataModule},
  dataMSProcedure in 'Data_Modulos\dataMSProcedure.pas' {dmMSProcedure: TDataModule},
  datamZeus in 'Data_Modulos\datamZeus.pas' {dmMZeus: TDataModule},
  uConstantes_Padrao in '..\..\Constantes padrao\uConstantes_Padrao.pas',
  uFuncoes in '..\..\Funcoes Genericas\uFuncoes.pas',
  uFuncoes_BD in '..\..\Funcoes Genericas\uFuncoes_BD.pas';

{$R *.res}
var
  Hwnd: integer;

begin

  if ParamCount < 4 then
    Halt; { Finaliza }

  Hwnd := FindWindow('TApplication', 'Visualização - LOG');

  if Hwnd = 0 then
  begin

    Application.Initialize;
    Application.Title := 'Visualização - LOG';
    Application.CreateForm(TdmDBEXMaster, dmDBEXMaster);
    Application.CreateForm(TdmMProvider, dmMProvider);
    Application.CreateForm(TdmMAtualizacao, dmMAtualizacao);
    Application.CreateForm(TdmRelatorios, dmRelatorios);
    Application.CreateForm(TdmMDJPdv, dmMDJPdv);
    Application.CreateForm(TdmMSProcedure, dmMSProcedure);
    Application.CreateForm(TdmMZeus, dmMZeus);
    Application.CreateForm(TdmMSource, dmMSource);
    Application.CreateForm(TfrmLogSys, frmLogSys);
    Application.Run;

  end
  else
    // Esta funcao traz para frente (da o foco) para a janela
    // da aplicacao que ja esta rodando
    ShowWindow(Hwnd, SW_SHOWNORMAL);
end.
