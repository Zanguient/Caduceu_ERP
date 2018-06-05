program GenesisCX;

uses
  Vcl.Forms,
  modCaixa in 'Modulo Caixa\modCaixa.pas' {frmCaixa},
  dataDBEXMaster in 'Data_Modulos\dataDBEXMaster.pas' {dmDBEXMaster: TDataModule},
  dataMProvider in 'Data_Modulos\dataMProvider.pas' {dmMProvider: TDataModule},
  dataMRelatorios in 'Data_Modulos\dataMRelatorios.pas' {dmRelatorios: TDataModule},
  dataMSource in 'Data_Modulos\dataMSource.pas' {dmMSource: TDataModule},
  dataMSProcedure in 'Data_Modulos\dataMSProcedure.pas' {dmMSProcedure: TDataModule},
  dataSintegraSped in 'Data_Modulos\dataSintegraSped.pas' {dmSintegraSPED: TDataModule},
  uConstantes_Padrao in '..\..\Constantes padrao\uConstantes_Padrao.pas',
  uFuncoes in '..\..\Funcoes Genericas\uFuncoes.pas',
  modAbre_Caixa in 'Modulo Caixa\modAbre_Caixa.pas' {frmAbreCaixa},
  modMonitorPedido in 'Modulo Caixa\modMonitorPedido.pas' {frmMonitorPedido},
  modControleCaixa in 'Modulo Caixa\modControleCaixa.pas' {frmControleCaixa},
  modLancamentoManualCXLoja in 'Modulo Caixa\modLancamentoManualCXLoja.pas' {frmLancamentoManualCXLoja},
  modFechaCaixa in 'Modulo Caixa\modFechaCaixa.pas' {frmFecha_Caixa},
  datamZeus in 'Data_Modulos\datamZeus.pas' {dmMZeus: TDataModule},
  modFormaPagtoCX in 'Modulo Caixa\modFormaPagtoCX.pas' {frmFormaPgamentoCRE},
  modFreteCaixa in '..\..\Formularios Genericos\modFreteCaixa.pas' {frmFreteCaixa},
  uFuncoes_BD in '..\..\Funcoes Genericas\uFuncoes_BD.pas',
  dataMAtualizacao in 'Data_Modulos\dataMAtualizacao.pas' {dmMAtualizacao: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmDBEXMaster, dmDBEXMaster);
  Application.CreateForm(TdmMZeus, dmMZeus);
  Application.CreateForm(TdmMProvider, dmMProvider);
  Application.CreateForm(TdmMSProcedure, dmMSProcedure);
  Application.CreateForm(TdmRelatorios, dmRelatorios);
  Application.CreateForm(TdmMSource, dmMSource);
  Application.CreateForm(TfrmCaixa, frmCaixa);
  Application.Run;
end.
