program Fornecedor;
{$IF CompilerVersion >= 21.0}
{$WEAKLINKRTTI ON}
{$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}
{$IFEND}


uses
  Vcl.Forms,
  Vcl.Dialogs,
  System.SysUtils,
  Windows,
  midaslib,
  modFornecedor in 'Modulo Fornecedor\modFornecedor.pas' {frmFornecedor},
  dataDBEXMaster in 'Data_Modulos\dataDBEXMaster.pas' {dmDBEXMaster: TDataModule},
  dataMProvider in 'Data_Modulos\dataMProvider.pas' {dmMProvider: TDataModule},
  dataMRelatorios in 'Data_Modulos\dataMRelatorios.pas' {dmRelatorios: TDataModule},
  dataMSource in 'Data_Modulos\dataMSource.pas' {dmMSource: TDataModule},
  dataMSProcedure in 'Data_Modulos\dataMSProcedure.pas' {dmMSProcedure: TDataModule},
  uConstantes_Padrao in '..\..\Constantes padrao\uConstantes_Padrao.pas',
  uFuncoes in '..\..\Funcoes Genericas\uFuncoes.pas',
  datamZeus in 'Data_Modulos\datamZeus.pas' {dmMZeus: TDataModule},
  modCaptcha in '..\..\Formularios Genericos\modCaptcha.pas' {frmCaptcha},
  modPesqCnpj in '..\..\Formularios Genericos\modPesqCnpj.pas' {frmPesqCnpj};

{$R *.res}

var
  Hwnd: integer;

begin

  if ParamCount < 4 then
    Halt; { Finaliza }

  Hwnd := FindWindow('TApplication', 'Manutenção de Fornecedores');

  if Hwnd = 0 then
  begin

    Application.Initialize;
  //  Application.MainFormOnTaskbar := True;
    Application.Title := 'Manutenção de Fornecedores';
    Application.CreateForm(TdmDBEXMaster, dmDBEXMaster);
  Application.CreateForm(TdmMZeus, dmMZeus);
  Application.CreateForm(TdmMProvider, dmMProvider);
  Application.CreateForm(TdmMSProcedure, dmMSProcedure);
  Application.CreateForm(TdmRelatorios, dmRelatorios);
  Application.CreateForm(TdmMSource, dmMSource);
  Application.CreateForm(TfrmFornecedor, frmFornecedor);
  Application.Run;

  end
  else
    // Esta funcao traz para frente (da o foco) para a janela
    // da aplicacao que ja esta rodando
    ShowWindow(Hwnd, SW_SHOWNORMAL);
end.
