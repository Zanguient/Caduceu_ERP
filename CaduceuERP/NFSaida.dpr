program NFSaida;

uses
  midaslib,
  Vcl.Forms,
  windows,
  modNFSaida in 'Modulo NFSaida\modNFSaida.pas' {frmModNFSaida},
  uConstantes_Padrao in '..\..\Constantes padrao\uConstantes_Padrao.pas',
  uFuncoes in '..\..\Funcoes Genericas\uFuncoes.pas',
  dataDBEXMaster in 'Data_Modulos\dataDBEXMaster.pas' {dmDBEXMaster: TDataModule},
  dataMProvider in 'Data_Modulos\dataMProvider.pas' {dmMProvider: TDataModule},
  dataMRelatorios in 'Data_Modulos\dataMRelatorios.pas' {dmRelatorios: TDataModule},
  dataMSource in 'Data_Modulos\dataMSource.pas' {dmMSource: TDataModule},
  dataMSProcedure in 'Data_Modulos\dataMSProcedure.pas' {dmMSProcedure: TDataModule},
  datamZeus in 'Data_Modulos\datamZeus.pas' {dmMZeus: TDataModule},
  modPesquisaFornecedorCNPJRSocial in '..\..\Formularios Genericos\modPesquisaFornecedorCNPJRSocial.pas' {frmPesquisaFornecedor},
  modPesquisaProduto in '..\..\Formularios Genericos\modPesquisaProduto.pas' {frmPesquisaProduto},
  modPesqCliente in '..\..\Formularios Genericos\modPesqCliente.pas' {frmPesquisaCliente},
  modDocumentoReferenciadosNFS in '..\..\Formularios Genericos\modDocumentoReferenciadosNFS.pas' {frmDocumentosReferenciados},
  modNFProdutorReferenciadaNFS in '..\..\Formularios Genericos\modNFProdutorReferenciadaNFS.pas' {frmNotaReferenciadaProdutor},
  modCupomFiscalReferenciadoNFS in '..\..\Formularios Genericos\modCupomFiscalReferenciadoNFS.pas' {frmCupomFiscalReferenciado},
  modEnderecoRetiradaNFS in '..\..\Formularios Genericos\modEnderecoRetiradaNFS.pas' {frmEnderecoRetiradaNFS},
  modEnderecoEntregaNFS in '..\..\Formularios Genericos\modEnderecoEntregaNFS.pas' {frmEnderecoEntregaNFS},
  modInformacoesCRE_NFS in '..\..\Formularios Genericos\modInformacoesCRE_NFS.pas' {frmInformacoesCRE_NFS},
  dataMDJPdv in 'Data_Modulos\dataMDJPdv.pas' {dmMDJPdv: TDataModule};

{$R *.res}

var
  Hwnd: integer;

begin

  if ParamCount <> 4 then
    Halt; { Finaliza }

  Hwnd := FindWindow('TApplication', 'Manutenção de Nota Fiscal de Saída');

  if Hwnd = 0 then
  begin

    Application.Initialize;
//    Application.MainFormOnTaskbar := True;
    Application.Title := 'Manutenção de Nota Fiscal de Saída';
    Application.CreateForm(TdmDBEXMaster, dmDBEXMaster);
  Application.CreateForm(TdmMZeus, dmMZeus);
  Application.CreateForm(TdmMProvider, dmMProvider);
  Application.CreateForm(TdmRelatorios, dmRelatorios);
  Application.CreateForm(TdmMSProcedure, dmMSProcedure);
  Application.CreateForm(TdmMDJPdv, dmMDJPdv);
  Application.CreateForm(TdmMSource, dmMSource);
  Application.CreateForm(TfrmModNFSaida, frmModNFSaida);
  Application.Run;

  end
  else
    // Esta funcao traz para frente (da o foco) para a janela
    // da aplicacao que ja esta rodando
    ShowWindow(Hwnd, SW_SHOWNORMAL);
end.
