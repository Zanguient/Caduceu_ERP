unit dataMSProcedureContabil;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmMSPContabil = class(TDataModule)
    fdspAtividadeEstadual: TFDStoredProc;
    fdspAtividadeFederal: TFDStoredProc;
    fdspEstados: TFDStoredProc;
    fdspPais: TFDStoredProc;
    fdspMunicipios: TFDStoredProc;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmMSPContabil: TdmMSPContabil;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses dataDBEXMaster;

{$R *.dfm}

end.
