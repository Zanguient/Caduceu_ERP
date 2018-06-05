program OrdemServico;

{$IF CompilerVersion >= 21.0}
{$WEAKLINKRTTI ON}
{$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}
{$IFEND}

uses
  Vcl.Forms,
  Windows,
  midaslib,
  modOrdemServico in 'Modulo Oredem de Servico\modOrdemServico.pas' {frmOrdemServico},
  uConstantes_Padrao in '..\..\Constantes padrao\uConstantes_Padrao.pas',
  uFuncoes in '..\..\Funcoes Genericas\uFuncoes.pas',
  dataDBEXMaster in 'Data_Modulos\dataDBEXMaster.pas' {dmDBEXMaster: TDataModule},
  dataMProvider in 'Data_Modulos\dataMProvider.pas' {dmMProvider: TDataModule},
  dataMRelatorios in 'Data_Modulos\dataMRelatorios.pas' {dmRelatorios: TDataModule},
  dataMSProcedure in 'Data_Modulos\dataMSProcedure.pas' {dmMSProcedure: TDataModule},
  dataMSource in 'Data_Modulos\dataMSource.pas' {dmMSource: TDataModule},
  modPesqCliente in '..\..\Formularios Genericos\modPesqCliente.pas' {frmPesquisaCliente},
  modPesqEquipamento in '..\..\Formularios Genericos\modPesqEquipamento.pas' {frmPesquisaEquipamento},
  modItemServicoPadrao in 'Modulo Oredem de Servico\modItemServicoPadrao.pas' {frmItemServicoPadrao},
  modHistorico in 'Modulo Oredem de Servico\modHistorico.pas' {frmHistorico},
  modItemServicoAvulso in 'Modulo Oredem de Servico\modItemServicoAvulso.pas' {frmItemServicoAvulso},
  modItemPecasPadrao in 'Modulo Oredem de Servico\modItemPecasPadrao.pas' {frmItemPecaPadrao},
  modAlterarItenPecaOS in 'Modulo Oredem de Servico\modAlterarItenPecaOS.pas' {frmAlterarItemPeca},
  modItemPecasAvulsas in 'Modulo Oredem de Servico\modItemPecasAvulsas.pas' {frmIncluirPecaAvulsa},
  modFormaPagtoOS in 'Modulo Oredem de Servico\modFormaPagtoOS.pas' {frmFormasPagtoOS},
  modEncerramentoOs in 'Modulo Oredem de Servico\modEncerramentoOs.pas' {frmEncerramentoOS},
  modDescontoEncerramentoOS in 'Modulo Oredem de Servico\modDescontoEncerramentoOS.pas' {frmDescontoEncerramentoOS},
  modFormasPagamentoOS in 'Modulo Oredem de Servico\modFormasPagamentoOS.pas' {frmFormasPagamentoOS},
  modPesquisarKit in 'Modulo Oredem de Servico\modPesquisarKit.pas' {frmPesquisaKit},
  modIncluirKit in 'Modulo Oredem de Servico\modIncluirKit.pas' {frmIncluirKitMontado},
  datamZeus in 'Data_Modulos\datamZeus.pas' {dmMZeus: TDataModule},
  modComunicacaoServico in 'Modulo Oredem de Servico\modComunicacaoServico.pas' {frmComunicacaoServico},
  modClienteAvulso in 'Modulo Oredem de Servico\modClienteAvulso.pas' {frmModClienteAvulso},
  modEquipamentoAvulso in 'Modulo Oredem de Servico\modEquipamentoAvulso.pas' {frmModEquipamentoAvulso},
  modDeslocamentoOS in 'Modulo Oredem de Servico\modDeslocamentoOS.pas' {frmDeslocamentoOS},
  modIncluirEditarDeslocamentoOS in 'Modulo Oredem de Servico\modIncluirEditarDeslocamentoOS.pas' {frmIncluirEditarDeslocamentoOS};

{$R *.res}

var
  Hwnd: integer;

begin

  if ParamCount < 4 then
    Halt; { Finaliza }

  Hwnd := FindWindow('TApplication', 'Manutenção de Ordem de Serviço');

  if Hwnd = 0 then
  begin

    Application.Initialize;
//    Application.MainFormOnTaskbar := True;
    Application.Title := 'Manutenção de Ordem de Serviço';
    Application.CreateForm(TdmDBEXMaster, dmDBEXMaster);
  Application.CreateForm(TdmMZeus, dmMZeus);
  Application.CreateForm(TdmMProvider, dmMProvider);
  Application.CreateForm(TdmRelatorios, dmRelatorios);
  Application.CreateForm(TdmMSProcedure, dmMSProcedure);
  Application.CreateForm(TdmMSource, dmMSource);
  Application.CreateForm(TfrmOrdemServico, frmOrdemServico);
  Application.Run;

  end
  else
    // Esta funcao traz para frente (da o foco) para a janela
    // da aplicacao que ja esta rodando
    ShowWindow(Hwnd, SW_SHOWNORMAL);

end.


