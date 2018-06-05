unit modIngredientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, pngimage, ExtCtrls, Mask, DBCtrls, DB;

type
  TfrmIngredientes = class(TForm)
    grpIngredientes: TGroupBox;
    edtIngredites1: TDBEdit;
    edtIngredites2: TDBEdit;
    edtIngredites3: TDBEdit;
    edtIngredites4: TDBEdit;
    edtIngredites5: TDBEdit;
    edtIngredites6: TDBEdit;
    edtIngredites7: TDBEdit;
    imgIncluir: TImage;
    imgDesfazer: TImage;
    imgSalvar: TImage;
    imgExcluir: TImage;
    imgEditar: TImage;
    imgSair: TImage;
    procedure imgSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure imgEditarClick(Sender: TObject);
    procedure edtIngredites1Enter(Sender: TObject);
    procedure edtIngredites1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtIngredites1KeyPress(Sender: TObject; var Key: Char);
    procedure imgDesfazerClick(Sender: TObject);
    procedure imgIncluirClick(Sender: TObject);
    procedure imgExcluirClick(Sender: TObject);
    procedure imgSalvarClick(Sender: TObject);
  private
    { Private declarations }
    procedure AbrirTabelaReceita;
    function Man_Tab_Rec_produtos(pOpcao:SmallInt):boolean;
  public
    { Public declarations }
  end;

var
  frmIngredientes: TfrmIngredientes;

implementation

{$R *.dfm}

uses dataDBEXMaster, dataMProvider, dataMSource, uConstantes_Padrao, uFuncoes, dataMSProcedure;

procedure TfrmIngredientes.AbrirTabelaReceita;
begin

  dmMProvider.cdsReceitaProdutos.Close;
  dmMProvider.cdsReceitaProdutos.ProviderName := 'dspReceitaProdutos';

  dmDBEXMaster.fdqReceitaProdutos.SQL.Clear;
  dmDBEXMaster.fdqReceitaProdutos.SQL.Add('select * from receita_produtos');
  dmDBEXMaster.fdqReceitaProdutos.SQL.Add('where produto = ' + IntToStr(dmMProvider.cdsProdutosPRODUTO.Value));
  dmDBEXMaster.fdqReceitaProdutos.SQL.Add('and filial = ' + IntToStr(dmDBEXMaster.iIdFilial));

  dmMProvider.cdsReceitaProdutos.Open;
  dmMProvider.cdsReceitaProdutos.ProviderName := '';

end;

procedure TfrmIngredientes.edtIngredites1Enter(Sender: TObject);
begin

  MudarCorEdit(Sender);

end;

procedure TfrmIngredientes.edtIngredites1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  iDirecao: Integer;
begin

  // habilita movimentação dos campos com as setas acima/abaixo
  iDirecao := -1;

  case Key of

    VK_DOWN:
      iDirecao := 0; { Próximo }
    VK_UP:
      iDirecao := 1; { Anterior }

  end;

  if iDirecao <> -1 then
  begin

    Perform(WM_NEXTDLGCTL, iDirecao, 0);
    Key := 0;

  end;

end;

procedure TfrmIngredientes.edtIngredites1KeyPress(Sender: TObject;
  var Key: Char);
begin

  if Key = #13 then
  begin

    Key := #0;
    PostMessage(handle, WM_KEYDOWN, VK_TAB, 1);

  end;

end;

procedure TfrmIngredientes.FormCreate(Sender: TObject);
begin

  DesabilitarBotaoFecharForm(handle);
  AbrirTabelaReceita;

end;

procedure TfrmIngredientes.imgDesfazerClick(Sender: TObject);
begin

  grpIngredientes.Enabled := False;

  if InserindoEditando(dmMProvider.cdsReceitaProdutos) then
    dmMProvider.cdsReceitaProdutos.Cancel;

end;

procedure TfrmIngredientes.imgEditarClick(Sender: TObject);
begin

  grpIngredientes.Enabled := not dmMProvider.cdsReceitaProdutos.IsEmpty;

  if dmMProvider.cdsReceitaProdutos.IsEmpty then
    Application.MessageBox(pchar(dmDBEXMaster.sNomeUsuario +', não existem ingredientes cadastrados para lateração!'), 'Atenção!', MB_ICONINFORMATION + MB_OK)
  else
    edtIngredites1.SetFocus;

end;

procedure TfrmIngredientes.imgExcluirClick(Sender: TObject);
begin

  if not dmMProvider.cdsReceitaProdutos.IsEmpty then
  begin

    if Application.MessageBox(pchar(dmDBEXMaster.sNomeUsuario + ', confirma exclusão deste registro!'), 'Atenção!', mb_IconQuestion + MB_DEFBUTTON2 + mb_YesNo) = idYes then
    begin

      if Man_Tab_Rec_produtos(1) then
      begin

        AbrirTabelaReceita;
        grpIngredientes.Enabled := False;

      end;

    end;

  end;

end;

procedure TfrmIngredientes.imgIncluirClick(Sender: TObject);
begin

  if not dmMProvider.cdsReceitaProdutos.IsEmpty then
    Application.MessageBox(pchar(dmDBEXMaster.sNomeUsuario +', não é possível incluir novos ingredientes para esse item!'), 'Atenção!', MB_ICONWARNING + MB_OK)
  else
  begin

    dmMProvider.cdsReceitaProdutos.Append;
    grpIngredientes.Enabled := true;
    edtIngredites1.SetFocus;

  end;

end;

procedure TfrmIngredientes.imgSairClick(Sender: TObject);
begin

  Close;

end;

procedure TfrmIngredientes.imgSalvarClick(Sender: TObject);
begin

  if InserindoEditando(dmMProvider.cdsReceitaProdutos) then
    if Man_Tab_Rec_produtos(0) then
      AbrirTabelaReceita;

  grpIngredientes.Enabled := False;

end;

function TfrmIngredientes.Man_Tab_Rec_produtos(pOpcao: SmallInt): boolean;
begin

  try

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.StartTransaction;

    dmMSProcedure.fdspReceitaProdutos.Params[0].Value   := pOpcao;
    dmMSProcedure.fdspReceitaProdutos.Params[1].Value   := dmMProvider.cdsReceitaProdutosRECEITA_PRODUTOS.Value;;
    dmMSProcedure.fdspReceitaProdutos.Params[2].Value   := dmDBEXMaster.iIdFilial;
    dmMSProcedure.fdspReceitaProdutos.Params[3].Value   := dmMProvider.cdsReceitaProdutosPRODUTO.Value;;
    dmMSProcedure.fdspReceitaProdutos.Params[4].Value   := dmMProvider.cdsReceitaProdutosINGREDIENTE1.Value;;
    dmMSProcedure.fdspReceitaProdutos.Params[5].Value   := dmMProvider.cdsReceitaProdutosINGREDIENTE2.Value;;
    dmMSProcedure.fdspReceitaProdutos.Params[6].Value   := dmMProvider.cdsReceitaProdutosINGREDIENTE3.Value;;
    dmMSProcedure.fdspReceitaProdutos.Params[7].Value   := dmMProvider.cdsReceitaProdutosINGREDIENTE4.Value;;
    dmMSProcedure.fdspReceitaProdutos.Params[8].Value   := dmMProvider.cdsReceitaProdutosINGREDIENTE5.Value;;
    dmMSProcedure.fdspReceitaProdutos.Params[9].Value   := dmMProvider.cdsReceitaProdutosINGREDIENTE6.Value;;
    dmMSProcedure.fdspReceitaProdutos.Params[11].Value  := dmMProvider.cdsReceitaProdutosINGREDIENTE7.Value;;
    dmMSProcedure.fdspReceitaProdutos.ExecProc;

    if dmDBEXMaster.fdtMaster.Active then
      dmDBEXMaster.fdtMaster.Commit;

    Result := True;

  except

    on E: exception do
    begin

      Application.MessageBox(pchar(dmDBEXMaster.sNomeUsuario + ',' + E.Message), 'Atenção!', MB_ICONASTERISK + MB_OK);

      if dmDBEXMaster.fdtMaster.Active then
        dmDBEXMaster.fdtMaster.Rollback;

      Result := False;

    end;

  end;

end;

end.
