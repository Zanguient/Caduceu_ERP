unit dataMAtualizacao;

interface

uses
  System.SysUtils, System.Classes, IniFiles, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, Data.DB, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, Vcl.Forms, Datasnap.Provider, Datasnap.DBClient,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.IBBase;

type
  TdmMAtualizacao = class(TDataModule)
    fdqAtualizacao: TFDQuery;
    fdcAtualizacao: TFDConnection;
    cdsAtualizacao: TClientDataSet;
    dtsAtualizacao: TDataSource;
    dspAtualizacao: TDataSetProvider;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    fdspArquivoAtualizacao: TFDStoredProc;
    cdsAtualizacaoNOME_ARQUIVO_ORIGINAL: TStringField;
    cdsAtualizacaoNOME_ARQUIVO_COMPACTADO: TStringField;
    cdsAtualizacaoDATA_ARQUIVO: TDateField;
    cdsAtualizacaoVERSAO_ARQUIVO: TStringField;
    cdsAtualizacaoTAMANHO_ARQUIVO: TStringField;
    cdsAtualizacaoMD5_ARQQUIVO: TStringField;
    cdsAtualizacaoCONTEUDO_ARQUIVO: TBlobField;
    cdsAtualizacaoOBSERVACAO_ARQUIVO: TMemoField;
    fdqWSAtualizacao: TFDQuery;
    cdsWSAtualizacao: TClientDataSet;
    dtsWSAtualizacao: TDataSource;
    dspWSAtualizacao: TDataSetProvider;
    fdspWSAtualizacao: TFDStoredProc;
    fdcWS: TFDConnection;
    cdsWSAtualizacaoDATA_ATUALIZACAO: TDateField;
    cdsWSAtualizacaoARQUIVO_SCRIPT: TStringField;
    cdsWSAtualizacaoBANCO_ATUALIZACAO: TStringField;
    cdsWSAtualizacaoMD5_SCRIPT: TStringField;
    cdsWSAtualizacaoMD5_BANCO: TStringField;
    cdsWSAtualizacaoSTATUS: TSmallintField;
    fdtAtualizacao: TFDTransaction;
    procedure DataModuleDestroy(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsWSAtualizacaoNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    ifArqConfig: TIniFile;

  end;

var
  dmMAtualizacao: TdmMAtualizacao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uFuncoes, dataMProvider;

{$R *.dfm}

procedure TdmMAtualizacao.cdsWSAtualizacaoNewRecord(DataSet: TDataSet);
begin

  dmMAtualizacao.cdsWSAtualizacaoDATA_ATUALIZACAO.Value := Date;
  dmMAtualizacao.cdsWSAtualizacaoSTATUS.Value           := 0;

end;

procedure TdmMAtualizacao.DataModuleCreate(Sender: TObject);
begin

  CriarPasta(ExtractFilePath(Application.ExeName)+'Log\');
{
  try

    fdcAtualizacao.Close;
    fdcWS.Close;

    ifArqConfig := TIniFile.Create((ExtractFilePath(Application.ExeName)+'Config.ini'));

    fdcAtualizacao.Params.Clear;
    fdcAtualizacao.Params.Values['SERVER'      ]   := ifArqConfig.ReadString('SERVIDOR','TCPIP','LOCALHOST');
    fdcAtualizacao.Params.Values['DATABASE'    ]   := dmMProvider.cdsConfiguracoesPATH_ATUALIZACAO.Value + 'ATUALIZACAO.FDB';
    fdcAtualizacao.Params.Values['USER_NAME'   ]   := 'SYSDBA';
    fdcAtualizacao.Params.Values['PASSWORD'    ]   := 'masterkey';
    fdcAtualizacao.Params.Values['CHARACTERSET']   := 'ISO8859_1';

    if  UpperCase(ifArqConfig.ReadString('SERVIDOR','TCPIP','LOCALHOST')) <> 'LOCALHOST'then
      fdcAtualizacao.Params.Values['PROTOCOL'  ]   := 'TCPIP'
    else
      fdcAtualizacao.Params.Values['PROTOCOL'  ]   := 'LOCAL';

    fdcAtualizacao.Params.Values['PAGESIZE'    ]   := '16384';
    fdcAtualizacao.Params.Values['DRIVERID'    ]   := 'FB';

    fdcWS.Params.Clear;
    fdcWS.Params.Values['SERVER'      ]   := ifArqConfig.ReadString('SERVIDOR','TCPIP','LOCALHOST');
    fdcWS.Params.Values['DATABASE'    ]   := ifArqConfig.ReadString('SERVIDOR','PATH_WS',ExtractFilePath(Application.ExeName)+'\GENESISSAT_WS.FDB');
    fdcWS.Params.Values['USER_NAME'   ]   := 'SYSDBA';
    fdcWS.Params.Values['PASSWORD'    ]   := 'masterkey';
    fdcWS.Params.Values['CHARACTERSET']   := 'ISO8859_1';

    if  UpperCase(ifArqConfig.ReadString('SERVIDOR','TCPIP','LOCALHOST')) <> 'LOCALHOST'then
      fdcWS.Params.Values['PROTOCOL'  ]   := 'TCPIP'
    else
      fdcWS.Params.Values['PROTOCOL'  ]   := 'LOCAL';

    fdcWS.Params.Values['PAGESIZE'    ]   := '16384';
    fdcWS.Params.Values['DRIVERID'    ]   := 'FB';

  except

    on E: exception do
      Gravar_log_processo(e.Message,  ExtractFilePath(Application.ExeName)+'Log\' + 'Log_erro_conexao.log');

  end;

}
end;

procedure TdmMAtualizacao.DataModuleDestroy(Sender: TObject);
begin

  FreeAndNil(ifArqConfig);

end;

end.
