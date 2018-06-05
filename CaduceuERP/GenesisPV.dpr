program GenesisPV;

uses
  Vcl.Forms,
  midaslib,
  windows,
  Controls,
  SysUtils,
  RPDefine,
  modPedido in 'Modulo Pedidos\modPedido.pas' {frmPedido},
  dataDBEXMaster in 'Data_Modulos\dataDBEXMaster.pas' {dmDBEXMaster: TDataModule},
  dataMProvider in 'Data_Modulos\dataMProvider.pas' {dmMProvider: TDataModule},
  dataMRelatorios in 'Data_Modulos\dataMRelatorios.pas' {dmRelatorios: TDataModule},
  dataMSource in 'Data_Modulos\dataMSource.pas' {dmMSource: TDataModule},
  dataMSProcedure in 'Data_Modulos\dataMSProcedure.pas' {dmMSProcedure: TDataModule},
  dataSintegraSped in 'Data_Modulos\dataSintegraSped.pas' {dmSintegraSPED: TDataModule},
  uConstantes_Padrao in '..\..\Constantes padrao\uConstantes_Padrao.pas',
  uFuncoes in '..\..\Funcoes Genericas\uFuncoes.pas',
  modPesquisaFuncionario in '..\..\Formularios Genericos\modPesquisaFuncionario.pas' {frmPesquisaFuncionario},
  modPesqCliente in '..\..\Formularios Genericos\modPesqCliente.pas' {frmPesquisaCliente},
  modPesquisaProduto in '..\..\Formularios Genericos\modPesquisaProduto.pas' {frmPesquisaProduto},
  modParcelasPedido in 'Modulo Pedidos\modParcelasPedido.pas' {frmParcelasPedido},
  modSelecionaClienteEntrega in 'Modulo Pedidos\modSelecionaClienteEntrega.pas' {frmInformacaoEntrega},
  modLogin in 'Modulo Pedidos\modLogin.pas' {frmLoginPV},
  datamZeus in 'Data_Modulos\datamZeus.pas' {dmMZeus: TDataModule},
  modFreteBalcao in '..\..\Formularios Genericos\modFreteBalcao.pas' {frmFreteBalcao},
  dataMDJPdv in 'Data_Modulos\dataMDJPdv.pas' {dmMDJPdv: TDataModule},
  modPreVenda_DJPDV in 'Modulo Pedidos\modPreVenda_DJPDV.pas';

{$R *.res}

begin

  Application.Initialize;
//  Application.MainFormOnTaskbar := True;
  RPDefine.DataID   := IntToStr(Application.Handle);
  Application.Title := 'GenesisAC XE -  Controle de Pedidos';
  Application.CreateForm(TdmDBEXMaster, dmDBEXMaster);
  Application.CreateForm(TdmMZeus, dmMZeus);
  Application.CreateForm(TdmMProvider, dmMProvider);
  Application.CreateForm(TdmMSProcedure, dmMSProcedure);
  Application.CreateForm(TdmRelatorios, dmRelatorios);
  Application.CreateForm(TdmMSource, dmMSource);
  Application.CreateForm(TdmMDJPdv, dmMDJPdv);
  Application.CreateForm(TfrmLoginPV, frmLoginPV);
  if frmLoginPV.ShowModal = mrOk then //Caso o retorno da tela seja Ok
   begin

      Application.CreateForm(TdmMSource, dmMSource);
      Application.CreateForm(TdmMSProcedure, dmMSProcedure);
      Application.CreateForm(TdmRelatorios, dmRelatorios);

      FreeAndNil(frmLoginPV); //Libera o form de Login da memória

      Application.CreateForm(TfrmPedido, frmPedido); //Cria a janela main

      Application.Run; //Roda a aplicação

   end
   else //Caso o retorno da tela de Login seja mrCancel então
   begin

      FreeAndNil(dmMSource);
      FreeAndNil(dmRelatorios);
      FreeAndNil(dmMSProcedure);
      FreeAndNil(dmMProvider);
      FreeAndNil(dmMZeus);
      FreeAndNil(dmDBEXMaster);
      FreeAndNil(frmLoginPV);
      Application.Terminate;

   end;

end.
