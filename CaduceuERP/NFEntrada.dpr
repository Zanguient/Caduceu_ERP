program NFEntrada;

uses
  Vcl.Forms,
  modNFEntrada in 'Modulo NFEntrada\modNFEntrada.pas' {frmModNFEntrada},
  dataDBEXMaster in 'Data_Modulos\dataDBEXMaster.pas' {dmDBEXMaster: TDataModule},
  dataMProvider in 'Data_Modulos\dataMProvider.pas' {dmMProvider: TDataModule},
  dataMSource in 'Data_Modulos\dataMSource.pas' {dmMSource: TDataModule},
  dataMSProcedure in 'Data_Modulos\dataMSProcedure.pas' {dmMSProcedure: TDataModule},
  modDadosInclusaoNFE in 'Modulo NFEntrada\modDadosInclusaoNFE.pas' {frmDadosInclusaoNFE},
  modChecagemTotais in 'Modulo NFEntrada\modChecagemTotais.pas' {frmChecagemTotais},
  modPesquisaProduto in '..\..\Formularios Genericos\modPesquisaProduto.pas' {frmPesquisaProduto},
  modResultadoConsisteXML_NFE in '..\..\Formularios Genericos\modResultadoConsisteXML_NFE.pas' {frmResultadoConsisteXMLNFE},
  modInformacoesNFE_CPA in 'Modulo NFEntrada\modInformacoesNFE_CPA.pas' {frmInformacoesCPA_NFE},
  dataMRelatorios in 'Data_Modulos\dataMRelatorios.pas' {dmRelatorios: TDataModule},
  uFuncoes in '..\..\Funcoes Genericas\uFuncoes.pas',
  uConstantes_Padrao in '..\..\Constantes padrao\uConstantes_Padrao.pas',
  modDesdobramentoRentabilidade in 'Modulo NFEntrada\modDesdobramentoRentabilidade.pas' {frmDesdobramentoRentabilidade},
  modSintegra in 'Modulo NFEntrada\modSintegra.pas' {frmManutencaoRegSintegra},
  modVizualisarSimilar in 'Modulo NFEntrada\modVizualisarSimilar.pas' {frmVizualizarSimilares},
  modCalculoCLD_NFE in 'Modulo NFEntrada\modCalculoCLD_NFE.pas' {frmCalculoCLD_NFE};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Manutenção de Notas Fiscais de Entrada';
  Application.CreateForm(TdmDBEXMaster, dmDBEXMaster);
  Application.CreateForm(TdmMProvider, dmMProvider);
  Application.CreateForm(TdmRelatorios, dmRelatorios);
  Application.CreateForm(TdmMSProcedure, dmMSProcedure);
  Application.CreateForm(TdmMSource, dmMSource);
  Application.CreateForm(TfrmModNFEntrada, frmModNFEntrada);
  Application.Run;
end.
