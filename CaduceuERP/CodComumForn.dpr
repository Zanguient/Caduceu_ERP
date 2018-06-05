program CodComumForn;

uses
  Forms,
  Windows,
  modCodigoComumFornecedor in 'Codigo Comum Fornecedor\modCodigoComumFornecedor.pas' {frmReferenciaFornecedor},
  uConstantes_Padrao in '..\..\Constantes padrao\uConstantes_Padrao.pas',
  uFuncoes in '..\..\Funcoes Genericas\uFuncoes.pas',
  uFuncoes_BD in '..\..\Funcoes Genericas\uFuncoes_BD.pas',
  dataDBEXMaster in 'Data_Modulos\dataDBEXMaster.pas' {dmDBEXMaster: TDataModule},
  dataMProvider in 'Data_Modulos\dataMProvider.pas' {dmMProvider: TDataModule},
  dataMSource in 'Data_Modulos\dataMSource.pas' {dmMSource: TDataModule},
  dataMSProcedure in 'Data_Modulos\dataMSProcedure.pas' {dmMSProcedure: TDataModule},
  datamZeus in 'Data_Modulos\datamZeus.pas' {dmMZeus: TDataModule},
  dataMRelatorios in 'Data_Modulos\dataMRelatorios.pas' {dmRelatorios: TDataModule},
  dataMAtualizacao in 'Data_Modulos\dataMAtualizacao.pas' {dmMAtualizacao: TDataModule},
  modPesquisaFornecedorCNPJRSocial in '..\..\Formularios Genericos\modPesquisaFornecedorCNPJRSocial.pas' {frmPesquisaFornecedor},
  modPesquisaProduto in '..\..\Formularios Genericos\modPesquisaProduto.pas' {frmPesquisaProduto},
  dataMDJPdv in 'Data_Modulos\dataMDJPdv.pas' {dmMDJPdv: TDataModule};

{$R *.res}

var
  Hwnd: integer;

begin

  if ParamCount < 4 then
    Halt; { Finaliza }

  Hwnd := FindWindow('TApplication', 'Manutenção de Códigos Comuns de Fornecedor');
  if Hwnd = 0 then
  begin

    Application.Initialize;
    Application.Title := 'Manutenção de Códigos Comuns de Fornecedor';
    Application.CreateForm(TdmDBEXMaster, dmDBEXMaster);
  Application.CreateForm(TdmMProvider, dmMProvider);
  Application.CreateForm(TdmMZeus, dmMZeus);
  Application.CreateForm(TdmMSProcedure, dmMSProcedure);
  Application.CreateForm(TdmMDJPdv, dmMDJPdv);
  Application.CreateForm(TdmMSource, dmMSource);
  Application.CreateForm(TfrmReferenciaFornecedor, frmReferenciaFornecedor);
  Application.Run;

  end
  else
    // Esta funcao traz para frente (da o foco) para a janela
    // da aplicacao que ja esta rodando
    ShowWindow(Hwnd, SW_SHOWNORMAL);
end.





