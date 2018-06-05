unit modTotaisCfop;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, Vcl.Graphics, Vcl.Forms,
  Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ExtCtrls, System.Classes, Vcl.Controls,
  Vcl.Grids;

type
  TfrmTotaisCfop = class(TForm)
    stgTotaisCfopEstadual: TStringGrid;
    Panel1: TPanel;
    edtTVContalbilEST: TEdit;
    edtTBCalculoEst: TEdit;
    edtCreditoEst: TEdit;
    edtIsentasNTEst: TEdit;
    edtOutrasEst: TEdit;
    stgTotaisCfopInter: TStringGrid;
    Panel2: TPanel;
    edtTVContalbilinter: TEdit;
    edtTBCalculoInter: TEdit;
    edtCreditoInter: TEdit;
    edtIsentasNTInter: TEdit;
    edtOutrasInter: TEdit;
    btnSair: TButton;
    fdqTotalizaValorContabil: TFDQuery;
    fdqTotalizaImpCreditado: TFDQuery;
    fdqTotalizaOutras: TFDQuery;
    fdqTotalizaBase: TFDQuery;
    fdqTotalizaIsentasNT: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure ValoresEstaduais;
    procedure ValoresInterEstaduais;
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
    sWhere:string;

  public
    { Public declarations }
  end;

var
  frmTotaisCfop: TfrmTotaisCfop;

implementation

uses modLivroFiscalEntrada, uFuncoes, dataMProvider, dataDBEXMaster;

{$R *.dfm}

procedure TfrmTotaisCfop.btnSairClick(Sender: TObject);
begin

  Close;

end;

procedure TfrmTotaisCfop.FormCreate(Sender: TObject);
begin

  DesabilitarBotaoFecharForm(Handle);

  ValoresEstaduais;

  ValoresInterEstaduais;

end;

procedure TfrmTotaisCfop.ValoresEstaduais;
var
  sWhere:string;

begin

  stgTotaisCfopEstadual.Cols[0].Text := 'Cfop';
  stgTotaisCfopEstadual.Cols[1].Text := 'Descrição CFOP';
  stgTotaisCfopEstadual.Cols[2].Text := 'Valor Contábil';
  stgTotaisCfopEstadual.Cols[3].Text := 'Base Cálculo';
  stgTotaisCfopEstadual.Cols[4].Text := 'Crédito';
  stgTotaisCfopEstadual.Cols[5].Text := 'Isentas/N.Trib.';
  stgTotaisCfopEstadual.Cols[6].Text := 'Outras';

  if not dmMProvider.cdsLivroFiscalEntrada.IsEmpty then
  begin

    fdqTotalizaValorContabil.Close;
    fdqTotalizaValorContabil.SQL.Clear;
    fdqTotalizaValorContabil.SQL.Add('SELECT LIVRO_ENTRADA.CFOP, CFOP.DESCRICAO, COALESCE(SUM(LIVRO_ENTRADA.VALOR_CONTABIL),0) AS VC FROM LIVRO_ENTRADA LIVRO_ENTRADA');
    fdqTotalizaValorContabil.SQL.Add('JOIN CFOP CFOP');
    fdqTotalizaValorContabil.SQL.Add('ON CFOP.CFOP = LIVRO_ENTRADA.CFOP');
    fdqTotalizaValorContabil.SQL.Add('WHERE LIVRO_ENTRADA.UF_ORIGEM = ' + QuotedStr(dmMProvider.cdsFilialESTADO.AsString));

    if (frmModLivrosFiscais.edtDataInicial.Text <> '  /  /    ') and (frmModLivrosFiscais.edtDataFinal.Text <> '  /  /    ') then
      sWhere := ' AND LIVRO_ENTRADA.DATA_ENTRADA BETWEEN ' + QuotedStr(FormatDateTime('mm/dd/yy',StrtoDate(frmModLivrosFiscais.edtDataInicial.Text))) + ' AND ' + QuotedStr(FormatDateTime('mm/dd/yy',StrtoDate(frmModLivrosFiscais.edtDataFinal.Text)))
    else if frmModLivrosFiscais.cboPeriodoApuracao.Text <> '' then
      sWhere :=' AND LIVRO_ENTRADA.MES_ANO = ' + QuotedStr(dmMProvider.cdsLivroFiscalEntradaMES_ANO.Value)
    else
      sWhere :=' AND LIVRO_ENTRADA.NUMERO_DOCUMENTO = ' + QuotedStr(dmMProvider.cdsLivroFiscalEntradaNUMERO_DOCUMENTO.Value);

    fdqTotalizaValorContabil.SQL.Add(sWhere);

    fdqTotalizaValorContabil.SQL.Add('GROUP BY LIVRO_ENTRADA.CFOP, CFOP.DESCRICAO');
    fdqTotalizaValorContabil.Open;

    while not fdqTotalizaValorContabil.Eof do
    begin

      stgTotaisCfopEstadual.Cells[0,stgTotaisCfopEstadual.RowCount-1] := Format('%5.5s',[fdqTotalizaValorContabil.FieldByName('CFOP').AsString]);
      stgTotaisCfopEstadual.Cells[1,stgTotaisCfopEstadual.RowCount-1] := Format('%-30.30s',[fdqTotalizaValorContabil.FieldByName('DESCRICAO').AsString]);
      stgTotaisCfopEstadual.Cells[2,stgTotaisCfopEstadual.RowCount-1] := Format('%13.13s',[FormatFloat('#,##0.00',fdqTotalizaValorContabil.FieldByName('VC').AsCurrency)]);

      fdqTotalizaBase.Close;
      fdqTotalizaBase.SQL.Clear;
      fdqTotalizaBase.SQL.Add('SELECT CFOP, COALESCE(SUM(BASE_CALCULO_VALOR_OPERACAO),0) AS TBC FROM LIVRO_ENTRADA WHERE ALIQUOTA > 0 ');
      fdqTotalizaBase.SQL.Add(' AND UF_ORIGEM = ' + QuotedStr(dmMProvider.cdsFilialESTADO.AsString));
      fdqTotalizaBase.SQL.Add(' AND CFOP = ' + QuotedStr(fdqTotalizaValorContabil.FieldByName('CFOP').AsString));

      if (frmModLivrosFiscais.edtDataInicial.Text <> '  /  /    ') and (frmModLivrosFiscais.edtDataFinal.Text <> '  /  /    ') then
        sWhere := ' AND DATA_ENTRADA BETWEEN ' + QuotedStr(FormatDateTime('mm/dd/yy',StrtoDate(frmModLivrosFiscais.edtDataInicial.Text))) + ' AND ' + QuotedStr(FormatDateTime('mm/dd/yy',StrtoDate(frmModLivrosFiscais.edtDataFinal.Text)))
      else if frmModLivrosFiscais.cboPeriodoApuracao.Text <> '' then
        sWhere :=' AND MES_ANO = ' + QuotedStr(dmMProvider.cdsLivroFiscalEntradaMES_ANO.Value)
      else if frmModLivrosFiscais.edtPesquisa.Text <> '' then
        sWhere :=' AND NUMERO_DOCUMENTO = ' + QuotedStr(dmMProvider.cdsLivroFiscalEntradaNUMERO_DOCUMENTO.Value);

      fdqTotalizaBase.SQL.Add(sWhere);

      fdqTotalizaBase.SQL.Add('GROUP BY CFOP');
      fdqTotalizaBase.Open;

      stgTotaisCfopEstadual.Cells[3,stgTotaisCfopEstadual.RowCount-1] := Format('%11.11s',[FormatFloat('#,##0.00',fdqTotalizaBase.FieldByName('TBC').AsCurrency)]);

      fdqTotalizaImpCreditado.Close;
      fdqTotalizaImpCreditado.SQL.Clear;
      fdqTotalizaImpCreditado.SQL.Add('SELECT CFOP, COALESCE(SUM(IMPOSTO_CREDITADO),0) AS CREDITO FROM LIVRO_ENTRADA WHERE ALIQUOTA > 0 ');
      fdqTotalizaImpCreditado.SQL.Add(' AND UF_ORIGEM = ' + QuotedStr(dmMProvider.cdsFilialESTADO.AsString));
      fdqTotalizaImpCreditado.SQL.Add(' AND CFOP = ' + QuotedStr(fdqTotalizaValorContabil.FieldByName('CFOP').AsString));

      fdqTotalizaImpCreditado.SQL.Add(sWhere);

      fdqTotalizaImpCreditado.SQL.Add('GROUP BY CFOP');
      fdqTotalizaImpCreditado.Open;

      stgTotaisCfopEstadual.Cells[4,stgTotaisCfopEstadual.RowCount-1] := Format('%11.11s',[FormatFloat('#,##0.00',fdqTotalizaImpCreditado.FieldByName('CREDITO').AsCurrency)]);

      fdqTotalizaIsentasNT.Close;
      fdqTotalizaIsentasNT.SQL.Clear;
      fdqTotalizaIsentasNT.SQL.Add('SELECT CFOP, COALESCE(SUM(BASE_CALCULO_VALOR_OPERACAO),0) AS TBC FROM LIVRO_ENTRADA WHERE CODIGO_VALORES_FISCAIS = 2');
      fdqTotalizaIsentasNT.SQL.Add(' AND UF_ORIGEM = ' + QuotedStr(dmMProvider.cdsFilialESTADO.AsString));
      fdqTotalizaIsentasNT.SQL.Add(' AND CFOP = ' + QuotedStr(fdqTotalizaValorContabil.FieldByName('CFOP').AsString));
      fdqTotalizaIsentasNT.SQL.Add(sWhere);
      fdqTotalizaIsentasNT.SQL.Add('GROUP BY CFOP');
      fdqTotalizaIsentasNT.Open;

      stgTotaisCfopEstadual.Cells[5,stgTotaisCfopEstadual.RowCount-1] := Format('%13.13s',[FormatFloat('#,##0.00',fdqTotalizaIsentasNT.FieldByName('TBC').AsCurrency)]);

      fdqTotalizaOutras.Close;
      fdqTotalizaOutras.SQL.Clear;
      fdqTotalizaOutras.SQL.Add('SELECT CFOP, COALESCE(SUM(BASE_CALCULO_VALOR_OPERACAO),0) AS TBC FROM LIVRO_ENTRADA WHERE CODIGO_VALORES_FISCAIS = 3');
      fdqTotalizaOutras.SQL.Add(' AND UF_ORIGEM = ' + QuotedStr(dmMProvider.cdsFilialESTADO.AsString));
      fdqTotalizaOutras.SQL.Add(' AND CFOP = ' + QuotedStr(fdqTotalizaValorContabil.FieldByName('CFOP').AsString));
      fdqTotalizaOutras.SQL.Add(sWhere);
      fdqTotalizaOutras.SQL.Add('GROUP BY CFOP');
      fdqTotalizaOutras.Open;

      stgTotaisCfopEstadual.Cells[6,stgTotaisCfopEstadual.RowCount-1] := Format('%11.11s',[FormatFloat('#,##0.00',fdqTotalizaOutras.FieldByName('TBC').AsCurrency)]);

      if not fdqTotalizaValorContabil.Eof then
        stgTotaisCfopEstadual.RowCount := stgTotaisCfopEstadual.RowCount + 1;

      fdqTotalizaBase.Close;
      fdqTotalizaIsentasNT.Close;
      fdqTotalizaImpCreditado.Close;
      fdqTotalizaValorContabil.Next;

    end;


    fdqTotalizaValorContabil.Close;

    fdqTotalizaValorContabil.Close;
    fdqTotalizaValorContabil.SQL.Clear;
    fdqTotalizaValorContabil.SQL.Add('SELECT COALESCE(SUM(VALOR_CONTABIL),0) AS VC FROM LIVRO_ENTRADA');
    fdqTotalizaValorContabil.SQL.Add('WHERE LIVRO_ENTRADA.UF_ORIGEM = ' + QuotedStr(dmMProvider.cdsFilialESTADO.AsString));

    if (frmModLivrosFiscais.edtDataInicial.Text <> '  /  /    ') and (frmModLivrosFiscais.edtDataFinal.Text <> '  /  /    ') then
      sWhere := ' AND LIVRO_ENTRADA.DATA_ENTRADA BETWEEN ' + QuotedStr(FormatDateTime('mm/dd/yy',StrtoDate(frmModLivrosFiscais.edtDataInicial.Text))) + ' AND ' + QuotedStr(FormatDateTime('mm/dd/yy',StrtoDate(frmModLivrosFiscais.edtDataFinal.Text)))
    else if frmModLivrosFiscais.cboPeriodoApuracao.Text <> '' then
      sWhere :=' AND LIVRO_ENTRADA.MES_ANO = ' + QuotedStr(dmMProvider.cdsLivroFiscalEntradaMES_ANO.Value)
    else if frmModLivrosFiscais.edtPesquisa.Text <> '' then
      sWhere :=' AND LIVRO_ENTRADA.NUMERO_DOCUMENTO = ' + QuotedStr(dmMProvider.cdsLivroFiscalEntradaNUMERO_DOCUMENTO.Value);

    fdqTotalizaValorContabil.SQL.Add(sWhere);

    fdqTotalizaValorContabil.Open;

    edtTVContalbilEST.Text := FormatFloat('#,##0.00',fdqTotalizaValorContabil.FieldByName('VC').AsCurrency);
    fdqTotalizaValorContabil.Close;


    fdqTotalizaBase.Close;
    fdqTotalizaBase.SQL.Clear;
    fdqTotalizaBase.SQL.Add('SELECT COALESCE(SUM(BASE_CALCULO_VALOR_OPERACAO),0) AS TBC FROM LIVRO_ENTRADA');
    fdqTotalizaBase.SQL.Add('WHERE LIVRO_ENTRADA.UF_ORIGEM = ' + QuotedStr(dmMProvider.cdsFilialESTADO.AsString));
    fdqTotalizaBase.SQL.Add('AND ALIQUOTA > 0');
    fdqTotalizaBase.SQL.Add(sWhere);

    fdqTotalizaBase.Open;

    edtTBCalculoEst.Text := FormatFloat('#,##0.00',fdqTotalizaBase.FieldByName('TBC').AsCurrency);
    fdqTotalizaBase.Close;

    fdqTotalizaImpCreditado.Close;
    fdqTotalizaImpCreditado.SQL.Clear;
    fdqTotalizaImpCreditado.SQL.Add('SELECT COALESCE(SUM(IMPOSTO_CREDITADO),0) AS CREDITO FROM LIVRO_ENTRADA');
    fdqTotalizaImpCreditado.SQL.Add('WHERE LIVRO_ENTRADA.UF_ORIGEM = ' + QuotedStr(dmMProvider.cdsFilialESTADO.AsString));
    fdqTotalizaImpCreditado.SQL.Add('AND ALIQUOTA > 0');
    fdqTotalizaImpCreditado.SQL.Add(sWhere);
    fdqTotalizaImpCreditado.Open;

    edtCreditoEst.Text := FormatFloat('#,##0.00',fdqTotalizaImpCreditado.FieldByName('CREDITO').AsCurrency);
    fdqTotalizaImpCreditado.Close;

    fdqTotalizaIsentasNT.Close;
    fdqTotalizaIsentasNT.SQL.Clear;
    fdqTotalizaIsentasNT.SQL.Add('SELECT COALESCE(SUM(BASE_CALCULO_VALOR_OPERACAO),0) AS CREDITO FROM LIVRO_ENTRADA');
    fdqTotalizaIsentasNT.SQL.Add('WHERE LIVRO_ENTRADA.UF_ORIGEM = ' + QuotedStr(dmMProvider.cdsFilialESTADO.AsString));
    fdqTotalizaIsentasNT.SQL.Add('AND CODIGO_VALORES_FISCAIS = 2');
    fdqTotalizaIsentasNT.SQL.Add(sWhere);
    fdqTotalizaIsentasNT.Open;

    edtIsentasNTEst.Text := FormatFloat('#,##0.00',fdqTotalizaIsentasNT.FieldByName('CREDITO').AsCurrency);
    fdqTotalizaIsentasNT.Close;

    fdqTotalizaOutras.Close;
    fdqTotalizaOutras.SQL.Clear;
    fdqTotalizaOutras.SQL.Add('SELECT COALESCE(SUM(BASE_CALCULO_VALOR_OPERACAO),0) AS CREDITO FROM LIVRO_ENTRADA');
    fdqTotalizaOutras.SQL.Add('WHERE LIVRO_ENTRADA.UF_ORIGEM = ' + QuotedStr(dmMProvider.cdsFilialESTADO.AsString));
    fdqTotalizaOutras.SQL.Add('AND CODIGO_VALORES_FISCAIS = 3');
    fdqTotalizaOutras.SQL.Add(sWhere);
    fdqTotalizaOutras.Open;

    edtOutrasEst.Text := FormatFloat('#,##0.00',fdqTotalizaOutras.FieldByName('CREDITO').AsCurrency);
    fdqTotalizaOutras.Close;
  end;

end;

procedure TfrmTotaisCfop.ValoresInterEstaduais;
begin

  stgTotaisCfopInter.Cols[0].Text := 'Cfop';
  stgTotaisCfopInter.Cols[1].Text := 'Descrição CFOP';
  stgTotaisCfopInter.Cols[2].Text := 'Valor Contábil';
  stgTotaisCfopInter.Cols[3].Text := 'Base Cálculo';
  stgTotaisCfopInter.Cols[4].Text := 'Crédito';
  stgTotaisCfopInter.Cols[5].Text := 'Isentas/N.Trib.';
  stgTotaisCfopInter.Cols[6].Text := 'Outras';

  fdqTotalizaValorContabil.Close;
  fdqTotalizaValorContabil.SQL.Clear;
  fdqTotalizaValorContabil.SQL.Add('SELECT LIVRO_ENTRADA.CFOP, CFOP.DESCRICAO, COALESCE(SUM(LIVRO_ENTRADA.VALOR_CONTABIL),0) AS VC FROM LIVRO_ENTRADA LIVRO_ENTRADA');
  fdqTotalizaValorContabil.SQL.Add('JOIN CFOP CFOP');
  fdqTotalizaValorContabil.SQL.Add('ON CFOP.CFOP = LIVRO_ENTRADA.CFOP');
  fdqTotalizaValorContabil.SQL.Add('WHERE LIVRO_ENTRADA.UF_ORIGEM <>' + QuotedStr(dmMProvider.cdsFilialESTADO.AsString));

  if (frmModLivrosFiscais.edtDataInicial.Text <> '  /  /    ') and (frmModLivrosFiscais.edtDataFinal.Text <> '  /  /    ') then
    sWhere := ' AND LIVRO_ENTRADA.DATA_ENTRADA BETWEEN ' + QuotedStr(FormatDateTime('mm/dd/yy',StrtoDate(frmModLivrosFiscais.edtDataInicial.Text)))  + ' AND ' + QuotedStr(FormatDateTime('mm/dd/yy',StrtoDate(frmModLivrosFiscais.edtDataFinal.Text)))
  else if frmModLivrosFiscais.cboPeriodoApuracao.Text <> '' then
    sWhere :=' AND LIVRO_ENTRADA.MES_ANO = ' + QuotedStr(dmMProvider.cdsLivroFiscalEntradaMES_ANO.Value)
  else if frmModLivrosFiscais.edtPesquisa.Text <> '' then
    sWhere :=' AND LIVRO_ENTRADA.NUMERO_DOCUMENTO = ' + QuotedStr(dmMProvider.cdsLivroFiscalEntradaNUMERO_DOCUMENTO.Value);

  fdqTotalizaValorContabil.SQL.Add(sWhere);

  fdqTotalizaValorContabil.SQL.Add('GROUP BY LIVRO_ENTRADA.CFOP, CFOP.DESCRICAO');
  fdqTotalizaValorContabil.Open;

  while not fdqTotalizaValorContabil.Eof do
  begin

    stgTotaisCfopInter.Cells[0,stgTotaisCfopInter.RowCount-1] := Format('%5.5s',[fdqTotalizaValorContabil.FieldByName('CFOP').AsString]);
    stgTotaisCfopInter.Cells[1,stgTotaisCfopInter.RowCount-1] := Format('%-30.30s',[fdqTotalizaValorContabil.FieldByName('DESCRICAO').AsString]);
    stgTotaisCfopInter.Cells[2,stgTotaisCfopInter.RowCount-1] := Format('%13.13s',[FormatFloat('#,##0.00',fdqTotalizaValorContabil.FieldByName('VC').AsCurrency)]);

    fdqTotalizaBase.Close;
    fdqTotalizaBase.SQL.Clear;
    fdqTotalizaBase.SQL.Add('SELECT CFOP, COALESCE(SUM(BASE_CALCULO_VALOR_OPERACAO),0) AS TBC FROM LIVRO_ENTRADA WHERE ALIQUOTA > 0 ');
    fdqTotalizaBase.SQL.Add(' AND UF_ORIGEM <> ' + QuotedStr(dmMProvider.cdsFilialESTADO.AsString));
    fdqTotalizaBase.SQL.Add(' AND CFOP = ' + QuotedStr(fdqTotalizaValorContabil.FieldByName('CFOP').AsString));
    fdqTotalizaBase.SQL.Add(sWhere);
    fdqTotalizaBase.SQL.Add('GROUP BY CFOP');
    fdqTotalizaBase.Open;

    stgTotaisCfopInter.Cells[3,stgTotaisCfopInter.RowCount-1] := Format('%11.11s',[FormatFloat('#,##0.00',fdqTotalizaBase.FieldByName('TBC').AsCurrency)]);

    fdqTotalizaImpCreditado.Close;
    fdqTotalizaImpCreditado.SQL.Clear;
    fdqTotalizaImpCreditado.SQL.Add('SELECT CFOP, COALESCE(SUM(IMPOSTO_CREDITADO),0) AS CREDITO FROM LIVRO_ENTRADA WHERE ALIQUOTA > 0 ');
    fdqTotalizaImpCreditado.SQL.Add(' AND UF_ORIGEM <> ' + QuotedStr(dmMProvider.cdsFilialESTADO.AsString));
    fdqTotalizaImpCreditado.SQL.Add(' AND CFOP = ' + QuotedStr(fdqTotalizaValorContabil.FieldByName('CFOP').AsString));
    fdqTotalizaImpCreditado.SQL.Add(sWhere);
    fdqTotalizaImpCreditado.SQL.Add('GROUP BY CFOP');
    fdqTotalizaImpCreditado.Open;

    stgTotaisCfopInter.Cells[4,stgTotaisCfopInter.RowCount-1] := Format('%11.11s',[FormatFloat('#,##0.00',fdqTotalizaImpCreditado.FieldByName('CREDITO').AsCurrency)]);

    fdqTotalizaIsentasNT.Close;
    fdqTotalizaIsentasNT.SQL.Clear;
    fdqTotalizaIsentasNT.SQL.Add('SELECT CFOP, COALESCE(SUM(BASE_CALCULO_VALOR_OPERACAO),0) AS TBC FROM LIVRO_ENTRADA WHERE CODIGO_VALORES_FISCAIS = 2');
    fdqTotalizaIsentasNT.SQL.Add(' AND UF_ORIGEM <> ' + QuotedStr(dmMProvider.cdsFilialESTADO.AsString));
    fdqTotalizaIsentasNT.SQL.Add(' AND CFOP = ' + QuotedStr(fdqTotalizaValorContabil.FieldByName('CFOP').AsString));
    fdqTotalizaIsentasNT.SQL.Add(sWhere);
    fdqTotalizaIsentasNT.SQL.Add('GROUP BY CFOP');
    fdqTotalizaIsentasNT.Open;

    stgTotaisCfopInter.Cells[5,stgTotaisCfopInter.RowCount-1] := Format('%13.13s',[FormatFloat('#,##0.00',fdqTotalizaIsentasNT.FieldByName('TBC').AsCurrency)]);

    fdqTotalizaOutras.Close;
    fdqTotalizaOutras.SQL.Clear;
    fdqTotalizaOutras.SQL.Add('SELECT CFOP, COALESCE(SUM(BASE_CALCULO_VALOR_OPERACAO),0) AS TBC FROM LIVRO_ENTRADA WHERE CODIGO_VALORES_FISCAIS = 3');
    fdqTotalizaOutras.SQL.Add(' AND UF_ORIGEM <> ' + QuotedStr(dmMProvider.cdsFilialESTADO.AsString));
    fdqTotalizaOutras.SQL.Add(' AND CFOP = ' + QuotedStr(fdqTotalizaValorContabil.FieldByName('CFOP').AsString));
    fdqTotalizaOutras.SQL.Add(sWhere);
    fdqTotalizaOutras.SQL.Add('GROUP BY CFOP');
    fdqTotalizaOutras.Open;

    stgTotaisCfopInter.Cells[6,stgTotaisCfopInter.RowCount-1] := Format('%11.11s',[FormatFloat('#,##0.00',fdqTotalizaOutras.FieldByName('TBC').AsCurrency)]);

    if not fdqTotalizaValorContabil.Eof then
      stgTotaisCfopInter.RowCount := stgTotaisCfopInter.RowCount + 1;

    fdqTotalizaBase.Close;
    fdqTotalizaIsentasNT.Close;
    fdqTotalizaImpCreditado.Close;
    fdqTotalizaValorContabil.Next;

  end;


  fdqTotalizaValorContabil.Close;

  fdqTotalizaValorContabil.Close;
  fdqTotalizaValorContabil.SQL.Clear;
  fdqTotalizaValorContabil.SQL.Add('SELECT COALESCE(SUM(VALOR_CONTABIL),0) AS VC FROM LIVRO_ENTRADA');
  fdqTotalizaValorContabil.SQL.Add('WHERE LIVRO_ENTRADA.UF_ORIGEM <> ' + QuotedStr(dmMProvider.cdsFilialESTADO.AsString));
  fdqTotalizaValorContabil.SQL.Add(sWhere);
  fdqTotalizaValorContabil.Open;

  edtTVContalbilinter.Text := FormatFloat('#,##0.00',fdqTotalizaValorContabil.FieldByName('VC').AsCurrency);
  fdqTotalizaValorContabil.Close;


  fdqTotalizaBase.Close;
  fdqTotalizaBase.SQL.Clear;
  fdqTotalizaBase.SQL.Add('SELECT COALESCE(SUM(BASE_CALCULO_VALOR_OPERACAO),0) AS TBC FROM LIVRO_ENTRADA');
  fdqTotalizaBase.SQL.Add('WHERE LIVRO_ENTRADA.UF_ORIGEM <> ' + QuotedStr(dmMProvider.cdsFilialESTADO.AsString));
  fdqTotalizaBase.SQL.Add(sWhere);
  fdqTotalizaBase.SQL.Add('AND ALIQUOTA > 0');
  fdqTotalizaBase.Open;

  edtTBCalculoInter.Text := FormatFloat('#,##0.00',fdqTotalizaBase.FieldByName('TBC').AsCurrency);
  fdqTotalizaBase.Close;

  fdqTotalizaImpCreditado.Close;
  fdqTotalizaImpCreditado.SQL.Clear;
  fdqTotalizaImpCreditado.SQL.Add('SELECT COALESCE(SUM(IMPOSTO_CREDITADO),0) AS CREDITO FROM LIVRO_ENTRADA');
  fdqTotalizaImpCreditado.SQL.Add('WHERE LIVRO_ENTRADA.UF_ORIGEM <> ' + QuotedStr(dmMProvider.cdsFilialESTADO.AsString));
  fdqTotalizaImpCreditado.SQL.Add('AND ALIQUOTA > 0');
  fdqTotalizaImpCreditado.SQL.Add(sWhere);
  fdqTotalizaImpCreditado.Open;

  edtCreditoInter.Text := FormatFloat('#,##0.00',fdqTotalizaImpCreditado.FieldByName('CREDITO').AsCurrency);
  fdqTotalizaImpCreditado.Close;

  FDQTotalizaIsentasNT.Close;
  FDQTotalizaIsentasNT.SQL.Clear;
  FDQTotalizaIsentasNT.SQL.Add('SELECT COALESCE(SUM(BASE_CALCULO_VALOR_OPERACAO),0) AS CREDITO FROM LIVRO_ENTRADA');
  FDQTotalizaIsentasNT.SQL.Add('WHERE LIVRO_ENTRADA.UF_ORIGEM <> ' + QuotedStr(dmMProvider.cdsFilialESTADO.AsString));
  FDQTotalizaIsentasNT.SQL.Add('AND CODIGO_VALORES_FISCAIS = 2');
  FDQTotalizaIsentasNT.SQL.Add(sWhere);
  FDQTotalizaIsentasNT.Open;

  edtIsentasNTInter.Text := FormatFloat('#,##0.00',FDQTotalizaIsentasNT.FieldByName('CREDITO').AsCurrency);
  FDQTotalizaIsentasNT.Close;

  fdqTotalizaOutras.Close;
  fdqTotalizaOutras.SQL.Clear;
  fdqTotalizaOutras.SQL.Add('SELECT COALESCE(SUM(BASE_CALCULO_VALOR_OPERACAO),0) AS CREDITO FROM LIVRO_ENTRADA');
  fdqTotalizaOutras.SQL.Add('WHERE LIVRO_ENTRADA.UF_ORIGEM <> ' + QuotedStr(dmMProvider.cdsFilialESTADO.AsString));
  fdqTotalizaOutras.SQL.Add('AND CODIGO_VALORES_FISCAIS = 3');
  fdqTotalizaOutras.SQL.Add(sWhere);
  fdqTotalizaOutras.Open;

  edtOutrasInter.Text := FormatFloat('#,##0.00',fdqTotalizaOutras.FieldByName('CREDITO').AsCurrency);
  fdqTotalizaOutras.Close;

end;

end.
