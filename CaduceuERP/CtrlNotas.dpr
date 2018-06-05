program CtrlNotas;

uses
  Vcl.Forms,
  System.SysUtils,
  RPDefine,
  manCtrlNotas in 'Controle Notas\manCtrlNotas.pas' {frmCtrlNotas},
  dataDBEXMaster in 'Data_Modulos\dataDBEXMaster.pas' {dmDBEXMaster: TDataModule},
  dataMProvider in 'Data_Modulos\dataMProvider.pas' {dmMProvider: TDataModule},
  dataMRelatorios in 'Data_Modulos\dataMRelatorios.pas' {dmRelatorios: TDataModule},
  dataMSource in 'Data_Modulos\dataMSource.pas' {dmMSource: TDataModule},
  dataMSProcedure in 'Data_Modulos\dataMSProcedure.pas' {dmMSProcedure: TDataModule},
  datamZeus in 'Data_Modulos\datamZeus.pas' {dmMZeus: TDataModule},
  uFuncoes in '..\..\Funcoes Genericas\uFuncoes.pas',
  uConstantes_Padrao in '..\..\Constantes padrao\uConstantes_Padrao.pas',
  modPesquisaFornecedorCNPJRSocial in '..\..\Formularios Genericos\modPesquisaFornecedorCNPJRSocial.pas' {frmPesquisaFornecedor},
  modPesquisaFornecedorNota in '..\..\Formularios Genericos\modPesquisaFornecedorNota.pas' {frmPesquisaFornecedorNota},
  uFuncoes_BD in '..\..\Funcoes Genericas\uFuncoes_BD.pas',
  modTipoUilidade in 'Controle Notas\modTipoUilidade.pas' {frmTipoUtilidade},
  modSetor in 'Controle Notas\modSetor.pas' {frmSetores},
  dataMAtualizacao in 'Data_Modulos\dataMAtualizacao.pas' {dmMAtualizacao: TDataModule};

{$R *.res}

begin

  RPDefine.DataID := IntToStr(Application.Handle);

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Controle de Notas';
  Application.CreateForm(TdmDBEXMaster, dmDBEXMaster);
  Application.CreateForm(TdmMZeus, dmMZeus);
  Application.CreateForm(TdmMProvider, dmMProvider);
  Application.CreateForm(TdmRelatorios, dmRelatorios);
  Application.CreateForm(TdmMSProcedure, dmMSProcedure);
  Application.CreateForm(TdmMAtualizacao, dmMAtualizacao);
  Application.CreateForm(TdmMSource, dmMSource);
  Application.CreateForm(TfrmCtrlNotas, frmCtrlNotas);
  Application.Run;
end.
