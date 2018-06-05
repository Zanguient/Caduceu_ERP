program Prc_gac;

uses
  midaslib,
  Vcl.Forms,
  winapi.windows,
  winapi.messages,
  DateUtils,
  SysUtils,
  modTelaPrincipal in 'Modulo Principal\modTelaPrincipal.pas' {frmTelaPrincipal},
  dataDBEXMaster in 'Data_Modulos\dataDBEXMaster.pas' {dmDBEXMaster: TDataModule},
  dataMProvider in 'Data_Modulos\dataMProvider.pas' {dmMProvider: TDataModule},
  dataMRelatorios in 'Data_Modulos\dataMRelatorios.pas' {dmRelatorios: TDataModule},
  dataMSource in 'Data_Modulos\dataMSource.pas' {dmMSource: TDataModule},
  dataMSProcedure in 'Data_Modulos\dataMSProcedure.pas' {dmMSProcedure: TDataModule},
  dataSintegraSped in 'Data_Modulos\dataSintegraSped.pas' {dmSintegraSPED: TDataModule},
  uConstantes_Padrao in '..\..\Constantes padrao\uConstantes_Padrao.pas',
  uFuncoes in '..\..\Funcoes Genericas\uFuncoes.pas',
  datamZeus in 'Data_Modulos\datamZeus.pas' {dmMZeus: TDataModule},
  modCompromissos in '..\..\Formularios Genericos\modCompromissos.pas' {frmCompromisso},
  Vcl.Themes,
  Vcl.Styles,
  dataMAtualizacao in 'Data_Modulos\dataMAtualizacao.pas' {dmMAtualizacao: TDataModule},
  uFuncoes_BD in '..\..\Funcoes Genericas\uFuncoes_BD.pas',
  dataMDJPdv in 'Data_Modulos\dataMDJPdv.pas' {dmMDJPdv: TDataModule};

{$R *.res}

var
  Hwnd:integer;

begin

  //verifica se aplicação já está em execução
  Hwnd := FindWindow('TApplication', 'GenesisAC - XE');
//  Hwnd := 0; { utilizado para executar em depuração }

  Hwnd := FindWindow('TApplication', 'GenesisAC - XE');

  if Hwnd = 0 then
  begin

    Application.Initialize;
//   Application.MainFormOnTaskbar := True;
    TStyleManager.TrySetStyle('Windows10');
    Application.Title := 'GenesisAC - XE';
    Application.CreateForm(TdmDBEXMaster, dmDBEXMaster);
  Application.CreateForm(TdmMZeus, dmMZeus);
  Application.CreateForm(TdmMProvider, dmMProvider);
  Application.CreateForm(TdmMSource, dmMSource);
  Application.CreateForm(TdmMSProcedure, dmMSProcedure);
  Application.CreateForm(TfrmTelaPrincipal, frmTelaPrincipal);
  Application.Run;

  end
  else
  begin

      // Esta funcao traz para frente (da o foco) para a janela
      // da aplicacao que ja esta rodando
  //  ShowWindow(Hwnd, SW_SHOWNORMAL);
    //força o fechamento/encerramento do processo
    PostMessage(FindWindow(nil, 'GenesisAC - XE'), WM_QUIT, 0, 0);

    Application.Initialize;
//   Application.MainFormOnTaskbar := True;
    TStyleManager.TrySetStyle('Windows10');
    Application.Title := 'GenesisAC - XE';
    Application.CreateForm(TdmDBEXMaster, dmDBEXMaster);
    Application.CreateForm(TdmMZeus, dmMZeus);
    Application.CreateForm(TdmMProvider, dmMProvider);
    Application.CreateForm(TdmMSource, dmMSource);
    Application.CreateForm(TdmMSProcedure, dmMSProcedure);
    Application.CreateForm(TfrmTelaPrincipal, frmTelaPrincipal);
    Application.Run;

  end;

end.
