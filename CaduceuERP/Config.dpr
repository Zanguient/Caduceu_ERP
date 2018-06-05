program Config;

{$IF CompilerVersion >= 21.0}
{$WEAKLINKRTTI ON}
{$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}
{$IFEND}

uses
  Vcl.Forms,
  midaslib,
  Windows,
  modConfiguracoes in 'Modulo_Configuracoes\modConfiguracoes.pas' {frmConfiguracoes},
  dataDBEXMaster in 'Data_Modulos\dataDBEXMaster.pas' {dmDBEXMaster: TDataModule},
  dataMProvider in 'Data_Modulos\dataMProvider.pas' {dmMProvider: TDataModule},
  dataMSource in 'Data_Modulos\dataMSource.pas' {dmMSource: TDataModule},
  dataMSProcedure in 'Data_Modulos\dataMSProcedure.pas' {dmMSProcedure: TDataModule},
  uConstantes_Padrao in '..\..\Constantes padrao\uConstantes_Padrao.pas',
  uFuncoes in '..\..\Funcoes Genericas\uFuncoes.pas',
  modConfigECF in 'Modulo_Configuracoes\modConfigECF.pas' {frmConfigECF},
  dataMRelatorios in 'Data_Modulos\dataMRelatorios.pas' {dmRelatorios: TDataModule},
  datamZeus in 'Data_Modulos\datamZeus.pas' {dmMZeus: TDataModule},
  uFuncoes_BD in '..\..\Funcoes Genericas\uFuncoes_BD.pas',
  dataMAtualizacao in 'Data_Modulos\dataMAtualizacao.pas' {dmMAtualizacao: TDataModule},
  dataMDJPdv in 'Data_Modulos\dataMDJPdv.pas' {dmMDJPdv: TDataModule};

{$R *.res}

var
  Hwnd: integer;

begin

  if ParamCount <> 4 then
    Halt; { Finaliza }

  Hwnd := FindWindow('TApplication', 'Configurações');

  if Hwnd = 0 then
  begin

    Application.Initialize;
//    Application.MainFormOnTaskbar := True;
    Application.Title := 'Configurações';
    Application.CreateForm(TdmDBEXMaster, dmDBEXMaster);
  Application.CreateForm(TdmMZeus, dmMZeus);
  Application.CreateForm(TdmMProvider, dmMProvider);
  Application.CreateForm(TdmMSProcedure, dmMSProcedure);
  Application.CreateForm(TdmMSource, dmMSource);
  Application.CreateForm(TdmMDJPdv, dmMDJPdv);
  Application.CreateForm(TfrmConfiguracoes, frmConfiguracoes);
  Application.Run;

  end
  else
    // Esta funcao traz para frente (da o foco) para a janela
    // da aplicacao que ja esta rodando
    ShowWindow(Hwnd, SW_SHOWNORMAL);

end.

