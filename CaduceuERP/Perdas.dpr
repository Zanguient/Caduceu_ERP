program Perdas;

uses
  Vcl.Forms,
  Windows,
  midaslib,
  modPerdas in 'Modulo de controle de perdas\modPerdas.pas' {frmPerdas},
  dataDBEXMaster in 'Data_Modulos\dataDBEXMaster.pas' {dmDBEXMaster: TDataModule},
  dataMProvider in 'Data_Modulos\dataMProvider.pas' {dmMProvider: TDataModule},
  dataMRelatorios in 'Data_Modulos\dataMRelatorios.pas' {dmRelatorios: TDataModule},
  dataMSource in 'Data_Modulos\dataMSource.pas' {dmMSource: TDataModule},
  dataMSProcedure in 'Data_Modulos\dataMSProcedure.pas' {dmMSProcedure: TDataModule},
  uConstantes_Padrao in '..\..\Constantes padrao\uConstantes_Padrao.pas',
  uFuncoes in '..\..\Funcoes Genericas\uFuncoes.pas',
  modPesquisaProduto in '..\..\Formularios Genericos\modPesquisaProduto.pas' {frmPesquisaProduto},
  modPesquisaFornecedorCNPJRSocial in '..\..\Formularios Genericos\modPesquisaFornecedorCNPJRSocial.pas' {frmPesquisaFornecedor},
  datamZeus in 'Data_Modulos\datamZeus.pas' {dmMZeus: TDataModule};

{$R *.res}
var
  Hwnd: integer;

begin
  if ParamCount < 4 then
    Halt; { Finaliza }

  Hwnd := FindWindow('TApplication', 'Manutenção de perdas de estoque');

  if Hwnd = 0 then
  begin

    Application.Initialize;
//    Application.MainFormOnTaskbar := True;
    Application.Title := 'Manutenção de perdas de estoque';
    Application.CreateForm(TdmDBEXMaster, dmDBEXMaster);
  Application.CreateForm(TdmMZeus, dmMZeus);
  Application.CreateForm(TdmMProvider, dmMProvider);
  Application.CreateForm(TdmRelatorios, dmRelatorios);
  Application.CreateForm(TdmMSource, dmMSource);
  Application.CreateForm(TdmMSProcedure, dmMSProcedure);
  Application.CreateForm(TfrmPerdas, frmPerdas);
  Application.Run;

  end
  else
    // Esta funcao traz para frente (da o foco) para a janela
    // da aplicacao que ja esta rodando
    ShowWindow(Hwnd, SW_SHOWNORMAL);

end.

