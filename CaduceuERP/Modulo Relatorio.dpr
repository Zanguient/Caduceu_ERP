program Relatorios;

uses
  Forms,
  modRelatorios in 'Relatorio\modRelatorios.pas' {frmRelatorios},
  dataRelatorios in '..\..\..\Delphi_2010\GenesisAC\Aplicacao\Data\dataRelatorios.pas' {dmRelatorios: TDataModule},
  modDBEXMaster in '..\..\..\Delphi_2010\GenesisAC\Aplicacao\Data\modDBEXMaster.pas' {dmDBEXMaster: TDataModule},
  modDMCDSMaster in '..\..\..\Delphi_2010\GenesisAC\Aplicacao\Data\modDMCDSMaster.pas' {dmCDSMaster: TDataModule},
  modDMMProvider in '..\..\..\Delphi_2010\GenesisAC\Aplicacao\Data\modDMMProvider.pas' {dmMProvider: TDataModule},
  modDMSource in '..\..\..\Delphi_2010\GenesisAC\Aplicacao\Data\modDMSource.pas' {dmMSource: TDataModule},
  modSSPMaster in '..\..\..\Delphi_2010\GenesisAC\Aplicacao\Data\modSSPMaster.pas' {dmSSPMaster: TDataModule},
  constMSgPadrao in '..\..\..\Delphi_2010\Mensagens padroes\constMSgPadrao.pas',
  modPesqProduto in '..\..\..\Delphi_2010\Formulario Genericos\modPesqProduto.pas' {frmPesquisaProduto},
  modPesquisaFornecedorCNPJRSocial in '..\..\..\Delphi_2010\Formulario Genericos\modPesquisaFornecedorCNPJRSocial.pas' {frmPesquisaFornecedor},
  modPesquisaGrupo in '..\..\..\Delphi_2010\Formulario Genericos\modPesquisaGrupo.pas' {frmPesquisaGrupo},
  modPesquisaSecao in '..\..\..\Delphi_2010\Formulario Genericos\modPesquisaSecao.pas' {frmPesquisaSecao},
  modPesquisaSetorBalanca in '..\..\..\Delphi_2010\Formulario Genericos\modPesquisaSetorBalanca.pas' {frmPesquisaSetorBalanca},
  modPesquisaSubGrupo in '..\..\..\Delphi_2010\Formulario Genericos\modPesquisaSubGrupo.pas' {frmPesquisaSubGrupo},
  modPesquisaTributacao in '..\..\..\Delphi_2010\Formulario Genericos\modPesquisaTributacao.pas' {frmPesquisaTributacao},
  classCliente in '..\..\..\Delphi_2010\Classes\classCliente.pas',
  classConfiguracoesNotaFiscal in '..\..\..\Delphi_2010\Classes\classConfiguracoesNotaFiscal.pas',
  classConfiguracoesSistema in '..\..\..\Delphi_2010\Classes\classConfiguracoesSistema.pas',
  classFormaPagamento in '..\..\..\Delphi_2010\Classes\classFormaPagamento.pas',
  classNotaFiscalSaida in '..\..\..\Delphi_2010\Classes\classNotaFiscalSaida.pas',
  classTransportadora in '..\..\..\Delphi_2010\Classes\classTransportadora.pas',
  Vcl.Themes,
  Vcl.Styles,
  uFuncoes in '..\..\..\Funcoes Genericas\uFuncoes.pas',
  uConstantes_Padrao in '..\..\..\Constantes padrao\uConstantes_Padrao.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Relatórios';
  Application.CreateForm(TdmDBEXMaster, dmDBEXMaster);
  Application.CreateForm(TdmMProvider, dmMProvider);
  Application.CreateForm(TdmSSPMaster, dmSSPMaster);
  Application.CreateForm(TdmCDSMaster, dmCDSMaster);
  Application.CreateForm(TdmMSource, dmMSource);
  Application.CreateForm(TdmRelatorios, dmRelatorios);
  Application.CreateForm(TfrmRelatorios, frmRelatorios);
  Application.Run;
end.
