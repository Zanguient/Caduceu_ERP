program CtrlCT;

{$IF CompilerVersion >= 21.0}
{$WEAKLINKRTTI ON}
{$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}
{$IFEND}

uses
  Vcl.Forms,
  Windows,
  modControleCartoes in 'Modulo Controle de cartoes\modControleCartoes.pas' {frmModControleCartoes},
  dataDBEXMaster in 'Data_Modulos\dataDBEXMaster.pas' {dmDBEXMaster: TDataModule},
  dataMProvider in 'Data_Modulos\dataMProvider.pas' {dmMProvider: TDataModule},
  dataMSource in 'Data_Modulos\dataMSource.pas' {dmMSource: TDataModule},
  dataMSProcedure in 'Data_Modulos\dataMSProcedure.pas' {dmMSProcedure: TDataModule},
  uConstantes_Padrao in '..\..\Constantes padrao\uConstantes_Padrao.pas',
  uFuncoes in '..\..\Funcoes Genericas\uFuncoes.pas',
  modBaixaCartao in 'Modulo Controle de cartoes\modBaixaCartao.pas' {frmBaixaCartao},
  modInformacoesCreditos in 'Modulo Controle de cartoes\modInformacoesCreditos.pas' {frmInformacoesCreditos},
  dataMRelatorios in 'Data_Modulos\dataMRelatorios.pas' {dmRelatorios: TDataModule},
  datamZeus in 'Data_Modulos\datamZeus.pas' {dmMZeus: TDataModule};

{$R *.res}

var
  Hwnd: integer;

begin

  if ParamCount <> 4 then
    Halt; { Finaliza }

  Hwnd := FindWindow('TApplication', 'Controle de Cartões e Ticket');

  if Hwnd = 0 then
  begin

    Application.Initialize;
  //  Application.MainFormOnTaskbar := True;
    Application.Title := 'Controle de Cartões e Ticket';
    Application.CreateForm(TdmDBEXMaster, dmDBEXMaster);
  Application.CreateForm(TdmMZeus, dmMZeus);
  Application.CreateForm(TdmMProvider, dmMProvider);
  Application.CreateForm(TdmRelatorios, dmRelatorios);
  Application.CreateForm(TdmMSProcedure, dmMSProcedure);
  Application.CreateForm(TdmMSource, dmMSource);
  Application.CreateForm(TfrmModControleCartoes, frmModControleCartoes);
  Application.Run;
  end
  else
    // Esta funcao traz para frente (da o foco) para a janela
    // da aplicacao que ja esta rodando
    ShowWindow(Hwnd, SW_SHOWNORMAL);

end.
