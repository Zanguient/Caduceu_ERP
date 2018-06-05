program LivroFiscalEntradas;

uses
  midaslib,
  Forms,
  Windows,
  modLivroFiscalEntrada in 'livro fiscal de entrada\modLivroFiscalEntrada.pas' {frmModLivrosFiscais},
  modTotaisCfop in 'Livro fiscal de entrada\modTotaisCfop.pas' {frmTotaisCfop},
  modTotaisAliquotas in 'Livro fiscal de entrada\modTotaisAliquotas.pas' {frmTotaisAliquotas},
  modTotaisInterEstaduais in 'Livro fiscal de entrada\modTotaisInterEstaduais.pas' {frmTotaisInterEstaduais},
  dataDBEXMaster in 'Data_Modulos\dataDBEXMaster.pas' {dmDBEXMaster: TDataModule},
  dataMProvider in 'Data_Modulos\dataMProvider.pas' {dmMProvider: TDataModule},
  uConstantes_Padrao in '..\..\Constantes padrao\uConstantes_Padrao.pas',
  uFuncoes in '..\..\Funcoes Genericas\uFuncoes.pas',
  datamZeus in 'Data_Modulos\datamZeus.pas' {dmMZeus: TDataModule},
  dataMSProcedure in 'Data_Modulos\dataMSProcedure.pas' {dmMSProcedure: TDataModule},
  dataMRelatorios in 'Data_Modulos\dataMRelatorios.pas' {dmRelatorios: TDataModule},
  dataMSource in 'Data_Modulos\dataMSource.pas' {dmMSource: TDataModule},
  uFuncoes_BD in '..\..\Funcoes Genericas\uFuncoes_BD.pas',
  dataMAtualizacao in 'Data_Modulos\dataMAtualizacao.pas' {dmMAtualizacao: TDataModule},
  dataMDJPdv in 'Data_Modulos\dataMDJPdv.pas' {dmMDJPdv: TDataModule};

{$R *.res}

var
  Hwnd: integer;

begin

  if ParamCount <> 4 then
    Halt; { Finaliza }

  Hwnd := FindWindow('TApplication', 'Manutenção do Livro de Entrada');
  if Hwnd = 0 then
  begin

    Application.Initialize;
    Application.Title := 'Manutenção do Livro de Entrada';
    Application.CreateForm(TdmDBEXMaster, dmDBEXMaster);
  Application.CreateForm(TdmMZeus, dmMZeus);
  Application.CreateForm(TdmMProvider, dmMProvider);
  Application.CreateForm(TdmMSProcedure, dmMSProcedure);
  Application.CreateForm(TdmRelatorios, dmRelatorios);
  Application.CreateForm(TdmMDJPdv, dmMDJPdv);
  Application.CreateForm(TdmMSource, dmMSource);
  Application.CreateForm(TfrmModLivrosFiscais, frmModLivrosFiscais);
  Application.Run;

  end
  else
    // Esta funcao traz para frente (da o foco) para a janela
    // da aplicacao que ja esta rodando
    ShowWindow(Hwnd, SW_SHOWNORMAL);
end.
