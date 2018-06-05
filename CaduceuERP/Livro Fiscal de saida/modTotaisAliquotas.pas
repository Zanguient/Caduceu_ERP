unit modTotaisAliquotas;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, Vcl.Graphics, Vcl.Forms,
    FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ExtCtrls, System.Classes, Vcl.Controls,
  Vcl.Grids;

type
  TfrmTotaisAliquotas = class(TForm)
    stgTotaisAliquotas: TStringGrid;
    btnSair: TButton;
    fdqTotalizaAliquotas: TFDQuery;
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    sWhere:string;
  public
    { Public declarations }
  end;

var
  frmTotaisAliquotas: TfrmTotaisAliquotas;

implementation

uses modLivroFiscalSaida, dataDBEXMaster, uFuncoes, dataMProvider;

{$R *.dfm}

procedure TfrmTotaisAliquotas.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTotaisAliquotas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmTotaisAliquotas.FormCreate(Sender: TObject);
begin

  DesabilitarBotaoFecharForm(handle);

  stgTotaisAliquotas.Cols[0].Text := 'Alíquota';
  stgTotaisAliquotas.Cols[1].Text := 'Total';

  fdqTotalizaAliquotas.Close;
  fdqTotalizaAliquotas.SQL.Clear;
  fdqTotalizaAliquotas.SQL.Add('SELECT ALIQUOTA, COALESCE(SUM(BASE_CALCULO),0) AS TBC FROM LIVRO_SAIDA');

  if (frmModLivrosFiscais.edtDataInicial.Text <> '  /  /    ') and (frmModLivrosFiscais.edtDataFinal.Text <> '  /  /    ') then
    sWhere := 'WHERE DATA_DOCUMENTO BETWEEN ' + QuotedStr(FormatDateTime('mm/dd/yy',StrtoDate(frmModLivrosFiscais.edtDataInicial.Text))) + ' AND ' + QuotedStr(FormatDateTime('mm/dd/yy',StrtoDate(frmModLivrosFiscais.edtDataFinal.Text)))
  else if frmModLivrosFiscais.cboPeriodoApuracao.Text <> '' then
    sWhere :='WHERE MES_ANO = ' + QuotedStr(dmMProvider.cdsLivroFiscalSaidaMES_ANO.Value)
  else
    sWhere :='WHERE NUMERO_DOCUMENTO = ' + QuotedStr(dmMProvider.cdsLivroFiscalSaidaNUMERO_DOCUMENTO.Value);

  fdqTotalizaAliquotas.SQL.Add(sWhere);

  fdqTotalizaAliquotas.SQL.Add('GROUP BY ALIQUOTA');

  fdqTotalizaAliquotas.Open;

  if not fdqTotalizaAliquotas.IsEmpty then
  begin

    while not fdqTotalizaAliquotas.Eof do
    begin

      stgTotaisAliquotas.Cells[0,stgTotaisAliquotas.RowCount-1] := Format('%8.8s',[FormatFloat('#0.00',fdqTotalizaAliquotas.FieldByName('ALIQUOTA').AsCurrency)])+' %';
      stgTotaisAliquotas.Cells[1,stgTotaisAliquotas.RowCount-1] := Format('%15.15s',[FormatFloat('#0.00',fdqTotalizaAliquotas.FieldByName('TBC').AsCurrency)]);
      if not fdqTotalizaAliquotas.Eof then
        stgTotaisAliquotas.RowCount := stgTotaisAliquotas.RowCount + 1;

      fdqTotalizaAliquotas.Next;

    end;
  end;

  fdqTotalizaAliquotas.Close;

  fdqTotalizaAliquotas.Close;
  fdqTotalizaAliquotas.SQL.Clear;
  fdqTotalizaAliquotas.SQL.Add('SELECT COALESCE(SUM(OUTRAS),0) AS OUTRAS FROM LIVRO_SAIDA');

  if (frmModLivrosFiscais.edtDataInicial.Text <> '  /  /    ') and (frmModLivrosFiscais.edtDataFinal.Text <> '  /  /    ') then
    sWhere := 'WHERE DATA_DOCUMENTO BETWEEN ' + QuotedStr(FormatDateTime('mm/dd/yy',StrtoDate(frmModLivrosFiscais.edtDataInicial.Text))) + ' AND ' + QuotedStr(FormatDateTime('mm/dd/yy',StrtoDate(frmModLivrosFiscais.edtDataFinal.Text)))
  else if frmModLivrosFiscais.cboPeriodoApuracao.Text <> '' then
    sWhere :='WHERE MES_ANO = ' + QuotedStr(dmMProvider.cdsLivroFiscalSaidaMES_ANO.Value)
  else if frmModLivrosFiscais.edtPesquisa.Text <> '' then
    sWhere :='WHERE NUMERO_DOCUMENTO = ' + QuotedStr(dmMProvider.cdsLivroFiscalSaidaNUMERO_DOCUMENTO.Value);

  fdqTotalizaAliquotas.SQL.Add(sWhere);

  fdqTotalizaAliquotas.Open;

  if not fdqTotalizaAliquotas.IsEmpty then
  begin

    while not fdqTotalizaAliquotas.Eof do
    begin

      stgTotaisAliquotas.Cells[0,stgTotaisAliquotas.RowCount-1] := '  F';
      stgTotaisAliquotas.Cells[1,stgTotaisAliquotas.RowCount-1] := Format('%15.15s',[FormatFloat('#,##0.00',fdqTotalizaAliquotas.FieldByName('OUTRAS').AsCurrency)]);
      if not fdqTotalizaAliquotas.Eof then
        stgTotaisAliquotas.RowCount := stgTotaisAliquotas.RowCount + 1;

      fdqTotalizaAliquotas.Next;

    end;
  end;

  fdqTotalizaAliquotas.Close;

  fdqTotalizaAliquotas.Close;
  fdqTotalizaAliquotas.SQL.Clear;
  fdqTotalizaAliquotas.SQL.Add('SELECT SUM(ISENTAS_NAO_TRIBUTADAS) AS ISENTAS FROM LIVRO_SAIDA');

  if (frmModLivrosFiscais.edtDataInicial.Text <> '  /  /    ') and (frmModLivrosFiscais.edtDataFinal.Text <> '  /  /    ') then
    sWhere := 'WHERE DATA_DOCUMENTO BETWEEN ' + QuotedStr(FormatDateTime('mm/dd/yy',StrtoDate(frmModLivrosFiscais.edtDataInicial.Text))) + ' AND ' + QuotedStr(FormatDateTime('mm/dd/yy',StrtoDate(frmModLivrosFiscais.edtDataFinal.Text)))
  else if frmModLivrosFiscais.cboPeriodoApuracao.Text <> '' then
    sWhere :='WHERE MES_ANO = ' + QuotedStr(dmMProvider.cdsLivroFiscalSaidaMES_ANO.Value)
  else if frmModLivrosFiscais.edtPesquisa.Text <> '' then
    sWhere :='WHERE NUMERO_DOCUMENTO = ' + QuotedStr(dmMProvider.cdsLivroFiscalSaidaNUMERO_DOCUMENTO.Value);

  fdqTotalizaAliquotas.SQL.Add(sWhere);

  fdqTotalizaAliquotas.Open;

  if not fdqTotalizaAliquotas.IsEmpty then
  begin

    while not fdqTotalizaAliquotas.Eof do
    begin

      stgTotaisAliquotas.Cells[0,stgTotaisAliquotas.RowCount-1] := '  I';
      stgTotaisAliquotas.Cells[1,stgTotaisAliquotas.RowCount-1] := Format('%15.15s',[FormatFloat('#,##0.00',fdqTotalizaAliquotas.FieldByName('ISENTAS').AsCurrency)]);

      if not fdqTotalizaAliquotas.Eof then
        stgTotaisAliquotas.RowCount := stgTotaisAliquotas.RowCount + 1;

      fdqTotalizaAliquotas.Next;

    end;
  end;

  fdqTotalizaAliquotas.Close;


end;

end.
