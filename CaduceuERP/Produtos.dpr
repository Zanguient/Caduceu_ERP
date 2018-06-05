program Produtos;

uses
  midaslib,
  Vcl.Forms,
  Windows,
  dataDBEXMaster in 'Data_Modulos\dataDBEXMaster.pas' {dmDBEXMaster: TDataModule},
  dataMProvider in 'Data_Modulos\dataMProvider.pas' {dmMProvider: TDataModule},
  dataMRelatorios in 'Data_Modulos\dataMRelatorios.pas' {dmRelatorios: TDataModule},
  dataMSource in 'Data_Modulos\dataMSource.pas' {dmMSource: TDataModule},
  datamZeus in 'Data_Modulos\datamZeus.pas' {dmMZeus: TDataModule},
  modPesquisaFornecedorCNPJRSocial in '..\..\Formularios Genericos\modPesquisaFornecedorCNPJRSocial.pas' {frmPesquisaFornecedor},
  uFuncoes in '..\..\Funcoes Genericas\uFuncoes.pas',
  uConstantes_Padrao in '..\..\Constantes padrao\uConstantes_Padrao.pas',
  modPesquisaGrupo in '..\..\Formularios Genericos\modPesquisaGrupo.pas' {frmPesquisaGrupo},
  modPesquisaInfoNutricional in '..\..\Formularios Genericos\modPesquisaInfoNutricional.pas' {frmPesquisaInfoNutricional},
  modPesquisaProduto in '..\..\Formularios Genericos\modPesquisaProduto.pas' {frmPesquisaProduto},
  modPesquisaSecao in '..\..\Formularios Genericos\modPesquisaSecao.pas' {frmPesquisaSecao},
  modPesquisaSetorBalanca in '..\..\Formularios Genericos\modPesquisaSetorBalanca.pas' {frmPesquisaSetorBalanca},
  modPesquisaSubGrupo in '..\..\Formularios Genericos\modPesquisaSubGrupo.pas' {frmPesquisaSubGrupo},
  modPesqTipoItem in '..\..\Formularios Genericos\modPesqTipoItem.pas' {frmPesquisaTipoItem},
  modPesquisaTributacao in '..\..\Formularios Genericos\modPesquisaTributacao.pas' {frmPesquisaTributacao},
  modTeclado_Balanca in '..\..\Formularios Genericos\modTeclado_Balanca.pas' {frmTeclado_Balanca},
  modMostrarSimilares in '..\..\Formularios Genericos\modMostrarSimilares.pas' {frmMostrarSimilar},
  dataMSProcedure in 'Data_Modulos\dataMSProcedure.pas' {dmMSProcedure: TDataModule},
  modIngredientes in 'Modulo Produtos\modIngredientes.pas' {frmIngredientes},
  modMVA in 'Modulo Produtos\modMVA.pas' {frmMva},
  modPesquisaBarras in '..\..\Formularios Genericos\modPesquisaBarras.pas' {frmPesquisaBarras},
  uFuncoes_BD in '..\..\Funcoes Genericas\uFuncoes_BD.pas',
  Vcl.Themes,
  Vcl.Styles,
  dataMAtualizacao in 'Data_Modulos\dataMAtualizacao.pas' {dmMAtualizacao: TDataModule},
  modProduto in 'Modulo Produtos\modProduto.pas' {frmProdutos},
  modProduto_DJPDV in 'Modulo Produtos\modProduto_DJPDV.pas',
  modSelecionarSimilar in '..\..\Formularios Genericos\modSelecionarSimilar.pas' {frmSelecionarSimilar},
  dataMDJPdv in 'Data_Modulos\dataMDJPdv.pas' {dmMDJPdv: TDataModule};

{$R *.res}
var
  Hwnd: integer;

begin

  if ParamCount < 4 then
    Halt; { Finaliza }

  Hwnd := FindWindow('TApplication', 'Manutenção de produtos');

  if Hwnd = 0 then
  begin

    Application.Initialize;
    Application.Title := 'Manutenção de produtos';
    Application.CreateForm(TdmDBEXMaster, dmDBEXMaster);
  Application.CreateForm(TdmMZeus, dmMZeus);
  Application.CreateForm(TdmMProvider, dmMProvider);
  Application.CreateForm(TdmRelatorios, dmRelatorios);
  Application.CreateForm(TdmMSource, dmMSource);
  Application.CreateForm(TdmMSProcedure, dmMSProcedure);
  Application.CreateForm(TfrmProdutos, frmProdutos);
  Application.Run;

  end
  else
    // Esta funcao traz para frente (da o foco) para a janela
    // da aplicacao que ja esta rodando
    ShowWindow(Hwnd, SW_SHOWNORMAL);
end.

