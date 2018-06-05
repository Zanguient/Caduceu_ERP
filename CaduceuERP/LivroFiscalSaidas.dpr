program LivroFiscalSaidas;

uses
  midaslib,
  Forms,
  Windows,
  modLivroFiscalSaida in 'Livro Fiscal de saida\modLivroFiscalSaida.pas' {frmModLivrosFiscais},
  modTotaisCfop in 'Livro Fiscal de saida\modTotaisCfop.pas' {frmTotaisCFOP},
  modTotaisAliquotas in 'Livro Fiscal de saida\modTotaisAliquotas.pas' {frmTotaisAliquotas},
  modTotaisInterEstaduais in 'Livro Fiscal de saida\modTotaisInterEstaduais.pas' {frmTotaisInterEstaduais},
  dataDBEXMaster in 'Data_Modulos\dataDBEXMaster.pas' {dmDBEXMaster: TDataModule},
  dataMProvider in 'Data_Modulos\dataMProvider.pas' {dmMProvider: TDataModule},
  dataMRelatorios in 'Data_Modulos\dataMRelatorios.pas' {dmRelatorios: TDataModule},
  dataMSource in 'Data_Modulos\dataMSource.pas' {dmMSource: TDataModule},
  dataMSProcedure in 'Data_Modulos\dataMSProcedure.pas' {dmMSProcedure: TDataModule},
  datamZeus in 'Data_Modulos\datamZeus.pas' {dmMZeus: TDataModule},
  uFuncoes in '..\..\Funcoes Genericas\uFuncoes.pas',
  uConstantes_Padrao in '..\..\Constantes padrao\uConstantes_Padrao.pas';

{$R *.res}

var
  Hwnd: integer;

begin
  if ParamCount <> 4 then
    Halt; { Finaliza }

  Hwnd := FindWindow('TApplication', 'Manutenção do Livro de Saída');
  if Hwnd = 0 then
  begin

    Application.Initialize;
    Application.Title := 'Manutenção do Livro de Saída';
    Application.CreateForm(TdmDBEXMaster, dmDBEXMaster);
  Application.CreateForm(TdmMZeus, dmMZeus);
  Application.CreateForm(TdmMProvider, dmMProvider);
  Application.CreateForm(TdmRelatorios, dmRelatorios);
  Application.CreateForm(TdmMSource, dmMSource);
  Application.CreateForm(TdmMSProcedure, dmMSProcedure);
  Application.CreateForm(TfrmModLivrosFiscais, frmModLivrosFiscais);
  Application.Run;


  end
  else
    // Esta funcao traz para frente (da o foco) para a janela
    // da aplicacao que ja esta rodando
    ShowWindow(Hwnd, SW_SHOWNORMAL);
end.

