program Relatorios;

{$IF CompilerVersion >= 21.0}
{$WEAKLINKRTTI ON}
{$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}
{$IFEND}

uses
  Forms,
  Vcl.Themes,
  Vcl.Styles,
  RPDefine,
  System.SysUtils,
  modRelatorios in 'Modulo Relatorio\modRelatorios.pas' {frmRelatorios},
  dataDBEXMaster in 'Data_Modulos\dataDBEXMaster.pas' {dmDBEXMaster: TDataModule},
  dataMSource in 'Data_Modulos\dataMSource.pas' {dmMSource: TDataModule},
  dataMSProcedure in 'Data_Modulos\dataMSProcedure.pas' {dmMSProcedure: TDataModule},
  uConstantes_Padrao in '..\..\Constantes padrao\uConstantes_Padrao.pas',
  uFuncoes in '..\..\Funcoes Genericas\uFuncoes.pas',
  modPesquisaSecao in '..\..\Formularios Genericos\modPesquisaSecao.pas' {frmPesquisaSecao},
  modPesquisaGrupo in '..\..\Formularios Genericos\modPesquisaGrupo.pas' {frmPesquisaGrupo},
  modPesquisaSubGrupo in '..\..\Formularios Genericos\modPesquisaSubGrupo.pas' {frmPesquisaSubGrupo},
  modPesquisaTributacao in '..\..\Formularios Genericos\modPesquisaTributacao.pas' {frmPesquisaTributacao},
  modPesquisaFornecedorCNPJRSocial in '..\..\Formularios Genericos\modPesquisaFornecedorCNPJRSocial.pas' {frmPesquisaFornecedor},
  modPesquisaProduto in '..\..\Formularios Genericos\modPesquisaProduto.pas' {frmPesquisaProduto},
  modPesquisaSetorBalanca in '..\..\Formularios Genericos\modPesquisaSetorBalanca.pas' {frmPesquisaSetorBalanca},
  dataMRelatorios in 'Data_Modulos\dataMRelatorios.pas' {dmRelatorios: TDataModule},
  dataMProvider in 'Data_Modulos\dataMProvider.pas' {dmMProvider: TDataModule},
  datamZeus in 'Data_Modulos\datamZeus.pas' {dmMZeus: TDataModule},
  uFuncoes_BD in '..\..\Funcoes Genericas\uFuncoes_BD.pas',
  dataMAtualizacao in 'Data_Modulos\dataMAtualizacao.pas' {dmMAtualizacao: TDataModule};

{$R *.res}

begin

  Application.Initialize;
  Application.Title := 'Relatórios';
  Application.CreateForm(TdmDBEXMaster, dmDBEXMaster);
  Application.CreateForm(TdmMZeus, dmMZeus);
  Application.CreateForm(TdmMSProcedure, dmMSProcedure);
  Application.CreateForm(TdmRelatorios, dmRelatorios);
  Application.CreateForm(TdmMProvider, dmMProvider);
  Application.CreateForm(TdmMSource, dmMSource);
  Application.CreateForm(TfrmRelatorios, frmRelatorios);
  Application.Run;

end.
