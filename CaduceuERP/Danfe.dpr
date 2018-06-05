program Danfe;

uses
  Vcl.Forms,
  midaslib,
  Windows,
  modDanfe in 'Modulo Danfe\modDanfe.pas' {frmModDanfe},
  dataDBEXMaster in 'Data_Modulos\dataDBEXMaster.pas' {dmDBEXMaster: TDataModule},
  dataMProvider in 'Data_Modulos\dataMProvider.pas' {dmMProvider: TDataModule},
  dataMRelatorios in 'Data_Modulos\dataMRelatorios.pas' {dmRelatorios: TDataModule},
  dataMSProcedure in 'Data_Modulos\dataMSProcedure.pas' {dmMSProcedure: TDataModule},
  datamZeus in 'Data_Modulos\datamZeus.pas' {dmMZeus: TDataModule},
  uConstantes_Padrao in '..\..\Constantes padrao\uConstantes_Padrao.pas',
  uFuncoes in '..\..\Funcoes Genericas\uFuncoes.pas',
  dataMSource in 'Data_Modulos\dataMSource.pas' {dmMSource: TDataModule},
  uConstantes_RetornoNFE in '..\..\Constantes padrao\uConstantes_RetornoNFE.pas',
  modInutilizaNumeracao in 'Modulo Danfe\modInutilizaNumeracao.pas' {frmInutilizacaoNumeracao},
  modConsultaCadastroContribuinte in 'Modulo Danfe\modConsultaCadastroContribuinte.pas' {frmConsultaCadastroContribuinte},
  modCCe in 'Modulo Danfe\modCCe.pas' {frmCCe},
  modAvisoCCe in 'Modulo Danfe\modAvisoCCe.pas' {frmAvisoUsoCCe},
  modCancelarNota in 'Modulo Danfe\modCancelarNota.pas' {frmCancelamentoNFe},
  modImprimirEventos in 'Modulo Danfe\modImprimirEventos.pas' {frmImprimirEventos},
  uFuncoes_BD in '..\..\Funcoes Genericas\uFuncoes_BD.pas',
  dataMAtualizacao in 'Data_Modulos\dataMAtualizacao.pas' {dmMAtualizacao: TDataModule},
  dataMDJPdv in 'Data_Modulos\dataMDJPdv.pas' {dmMDJPdv: TDataModule};

{$R *.res}

var
  Hwnd: integer;

begin


  if ParamCount < 4 then
    Halt; { Finaliza }

  Hwnd := FindWindow('TApplication', 'Módulo de envio de NFE');

  if Hwnd = 0 then
  begin

    Application.Initialize;
//    Application.MainFormOnTaskbar := True;
    Application.Title := 'Módulo de envio de NFE';
    Application.CreateForm(TdmDBEXMaster, dmDBEXMaster);
  Application.CreateForm(TdmMSProcedure, dmMSProcedure);
  Application.CreateForm(TdmMZeus, dmMZeus);
  Application.CreateForm(TdmMProvider, dmMProvider);
  Application.CreateForm(TdmRelatorios, dmRelatorios);
  Application.CreateForm(TdmMAtualizacao, dmMAtualizacao);
  Application.CreateForm(TdmMDJPdv, dmMDJPdv);
  Application.CreateForm(TdmMSource, dmMSource);
  Application.CreateForm(TfrmModDanfe, frmModDanfe);
  Application.Run;

  end
  else
    // Esta funcao traz para frente (da o foco) para a janela
    // da aplicacao que ja esta rodando
    ShowWindow(Hwnd, SW_SHOWNORMAL);

end.
