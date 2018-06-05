unit dataMRelatorios;

interface

uses
  SysUtils, Classes, RpDefine, RpBase, RpSystem, RpCon, RpConDS, RpRave, DB,
  DBClient, RpRenderText, RpRenderRTF, RpRenderHTML, RpRender, RpRenderPDF,
  FMTBcd, SqlExpr, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Datasnap.Provider;


type
  TdmRelatorios = class(TDataModule)
    rvdGenesis: TRvDataSetConnection;
    RvRenderPDF1: TRvRenderPDF;
    RvRenderHTML1: TRvRenderHTML;
    RvRenderRTF1: TRvRenderRTF;
    RvRenderText1: TRvRenderText;
    sqqProdutoPIS_COFINS: TSQLQuery;
    cdsVendaPisCofins: TClientDataSet;
    cdsVendaPisCofinsPRODUTO: TIntegerField;
    cdsVendaPisCofinsDESCRICAO: TStringField;
    cdsVendaPisCofinsUNIDADE: TStringField;
    cdsVendaPisCofinsQUANTIDADE_ENTRADA: TFloatField;
    cdsVendaPisCofinsVALOR_ENTRADA: TCurrencyField;
    cdsVendaPisCofinsQUANTIDADE_SAIDA: TFloatField;
    cdsVendaPisCofinsVALOR_SAIDA: TCurrencyField;
    cdsVendaPisCofinsLEI_PIS_COFINS: TIntegerField;
    cdsVendaPisCofinsDESCRICAO_LEI_PIS_COFINS: TStringField;
    dtsVendaPisCofins: TDataSource;
    rvdTransferencia: TRvDataSetConnection;
    fdqInventario: TFDQuery;
    sqqRegInventario: TSQLQuery;
    rvsGenesisAC: TRvSystem;
    fdqRegInventarioP7: TFDQuery;
    fdqApoioEFDContr: TFDQuery;
    fdqPromocao: TFDQuery;
    fdqApoioInventario: TFDQuery;
    fdqVendaRankingGrupo: TFDQuery;
    fdqApoioEFDContrPRODUTO: TIntegerField;
    fdqApoioEFDContrDESCRICAO: TStringField;
    fdqApoioEFDContrUNIDADE: TStringField;
    fdqApoioEFDContrNCM: TStringField;
    fdqApoioEFDContrCST_PIS_S: TIntegerField;
    fdqApoioEFDContrCST_COFINS_S: TIntegerField;
    fdqApoioEFDContrCST_PIS_ENTRADA: TIntegerField;
    fdqApoioEFDContrCST_COFINS_ENTRADA: TIntegerField;
    fdqApoioEFDContrALIQ_PIS_S: TBCDField;
    fdqApoioEFDContrALIQ_COFINS_S: TBCDField;
    fdqApoioEFDContrALIQUOTA_PIS_ENTRADA: TFMTBCDField;
    fdqApoioEFDContrALIQUOTA_COFINS_ENTRADA: TFMTBCDField;
    fdqApoioEFDContrNATUREZA_RECEITA: TIntegerField;
    fdqApoioEFDContrCODIGO_CREDITO_PIS_COFINS: TIntegerField;
    fdqVendaProdutoCFOP: TFDQuery;
    fdqCompraProdCFOP: TFDQuery;
    dspRequisicaoPecaOS: TDataSetProvider;
    cdsRequisicaoPecaOS: TClientDataSet;
    cdsRequisicaoPecaOSCODIGO_PECA: TIntegerField;
    cdsRequisicaoPecaOSDESCRICAO: TStringField;
    cdsRequisicaoPecaOSQUANTIDADE: TBCDField;
    rvdOrdemServico: TRvDataSetConnection;
    rvdItensServicoOS: TRvDataSetConnection;
    rvdIrtensPecaOS: TRvDataSetConnection;
    rvdFilial: TRvDataSetConnection;
    rvpGenesisAC: TRvProject;
    rvdPerdas: TRvDataSetConnection;
    rvdItensPerdas: TRvDataSetConnection;
    fdqMovCompraProd: TFDQuery;
    fdqMovVendaProd: TFDQuery;
    rvdRControlePerda: TRvDataSetConnection;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure PovoarDataSetMovPIS_COFINS;
  end;

var
  dmRelatorios: TdmRelatorios;

implementation

{$R *.dfm}

uses dataMProvider, dataDBEXMaster;

{ TdmRelatorios }

procedure TdmRelatorios.PovoarDataSetMovPIS_COFINS;
begin

  cdsVendaPisCofins.Close;
  cdsVendaPisCofins.CreateDataSet;

  while not sqqProdutoPIS_COFINS.Eof do
  begin

    cdsVendaPisCofins.Append;
    cdsVendaPisCofinsPRODUTO.Value                      := sqqProdutoPIS_COFINS.FieldByName('OP_PRODUTO').AsInteger;
    cdsVendaPisCofinsDESCRICAO.Value                    := sqqProdutoPIS_COFINS.FieldByName('OP_DESCRICAO').AsString;
    cdsVendaPisCofinsUNIDADE.Value                      := sqqProdutoPIS_COFINS.FieldByName('OP_UNIDADE').AsString;
    cdsVendaPisCofinsQUANTIDADE_ENTRADA.AsFloat         := sqqProdutoPIS_COFINS.FieldByName('OP_QUANT_ENTRADA').AsFloat;
    cdsVendaPisCofinsVALOR_ENTRADA.AsFloat              := sqqProdutoPIS_COFINS.FieldByName('OP_VALOR_ENTRADA').AsFloat;
    cdsVendaPisCofinsQUANTIDADE_SAIDA.AsFloat           := sqqProdutoPIS_COFINS.FieldByName('OP_QUANT_SAIDA').AsFloat;
    cdsVendaPisCofinsVALOR_SAIDA.AsFloat                := sqqProdutoPIS_COFINS.FieldByName('OP_VALOR_SAIDA').AsFloat;
    cdsVendaPisCofinsLEI_PIS_COFINS.AsInteger           := sqqProdutoPIS_COFINS.FieldByName('OP_LEI_PIS_COFINS').AsInteger;
    cdsVendaPisCofinsDESCRICAO_LEI_PIS_COFINS.AsString  := sqqProdutoPIS_COFINS.FieldByName('OP_DESCRICAO_LEI_PIS_COFINS').AsString;
    cdsVendaPisCofins.Post;
    sqqProdutoPIS_COFINS.Next;

  end;

  sqqProdutoPIS_COFINS.Close;
  cdsVendaPisCofins.First;

end;

end.
