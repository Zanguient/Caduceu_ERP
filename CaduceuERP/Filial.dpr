program Filial;

uses
  Vcl.Forms,
  Windows,
  modFilial in 'Modulo Filial\modFilial.pas' {frmFilial},
  dataDBEXMaster in 'Data_Modulos\dataDBEXMaster.pas' {dmDBEXMaster: TDataModule},
  dataMProvider in 'Data_Modulos\dataMProvider.pas' {dmMProvider: TDataModule},
  dataMSource in 'Data_Modulos\dataMSource.pas' {dmMSource: TDataModule},
  dataMSProcedure in 'Data_Modulos\dataMSProcedure.pas' {dmMSProcedure: TDataModule},
  uConstantes_Padrao in '..\..\Constantes padrao\uConstantes_Padrao.pas',
  uFuncoes in '..\..\Funcoes Genericas\uFuncoes.pas',
  modPesqCnpj in '..\..\Formularios Genericos\modPesqCnpj.pas' {frmPesqCnpj};

{$R *.res}

var
  Hwnd: integer;

begin

  if ParamCount <> 4 then
    Halt; { Finaliza }

  Hwnd := FindWindow('TApplication', 'Manutenção de Filiais');

  if Hwnd = 0 then
  begin

    Application.Initialize;
    Application.MainFormOnTaskbar := True;
    Application.Title := 'Manutenção de Filiais';
    Application.CreateForm(TdmDBEXMaster, dmDBEXMaster);
  Application.CreateForm(TdmMProvider, dmMProvider);
  Application.CreateForm(TdmMSource, dmMSource);
  Application.CreateForm(TdmMSProcedure, dmMSProcedure);
  Application.CreateForm(TfrmFilial, frmFilial);
  Application.Run;

  end
  else
    // Esta funcao traz para frente (da o foco) para a janela
    // da aplicacao que ja esta rodando
    ShowWindow(Hwnd, SW_SHOWNORMAL);

end.


