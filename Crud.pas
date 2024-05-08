unit Crud;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  FireDAC.Phys.PGDef, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, frxClass, frxDBSet, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmCrud = class(TForm)
    pnlFundo: TPanel;
    lblNomes: TLabel;
    lblCadatro: TLabel;
    edtNome: TEdit;
    btnCadastrar: TButton;
    btnExcluir: TButton;
    btnAlterar: TButton;
    btnListar: TButton;
    DriverLink: TFDPhysPgDriverLink;
    Connection: TFDConnection;
    Query: TFDQuery;
    dbNomes: TfrxDBDataset;
    relNomes: TfrxReport;
    qrNomes: TFDQuery;
    procedure btnCadastrarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnListarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCrud: TFrmCrud;

implementation

{$R *.dfm}

procedure TFrmCrud.btnAlterarClick(Sender: TObject);
begin
  if edtNome.Text = '' then
  begin
     MessageDlg('Campo Nome Vazio!', mtWarning,
      [mbOk], 0, mbOk);
  end;
end;

procedure TFrmCrud.btnCadastrarClick(Sender: TObject);
begin
  if edtNome.Text = '' then
  begin
     MessageDlg('Campo Nome Vazio!', mtWarning,
      [mbOk], 0, mbOk);
     Abort
  end;

  Query.Close;
  Query.SQL.Clear;
  Query.SQL.Add('INSERT INTO nomes(');
  Query.SQL.Add(' nome)');
  Query.SQL.Add('VALUES(');
  Query.SQL.Add(' :nome)');
  Query.ParamByName('nome').AsString := edtNome.Text;
  Query.ExecSQL;
  MessageDlg('Cadastrado com Sucesso!', mtInformation,
      [mbOk], 0, mbOk);
end;

procedure TFrmCrud.btnExcluirClick(Sender: TObject);
begin
  if edtNome.Text = '' then
  begin
     MessageDlg('Campo Nome Vazio!', mtWarning,
      [mbOk], 0, mbOk);
  end;

  Query.Close;
  Query.SQL.Clear;
  Query.SQL.Add('SELECT');
  Query.SQL.Add(' nome');
  Query.SQL.Add('FROM');
  Query.SQL.Add(' nomes');
  Query.SQL.Add('WHERE');
  Query.SQL.Add(' nome = :nome');
  Query.ParamByName('nome').AsString := edtNome.Text;
  Query.Open();

  if Query.RecordCount > 0 then
  begin
    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('DELETE FROM nomes');
    Query.SQL.Add('WHERE nome = :nome');
    Query.ParamByName('nome').AsString := edtNome.Text;
    Query.ExecSQL;
    MessageDlg('Excluido com sucesso!', mtConfirmation,
      [mbOk], 0, mbOk);
  end else
  begin
    MessageDlg('Nome não encontrado!', mtError,
      [mbOk], 0, mbOk);
  end;
end;

procedure TFrmCrud.btnListarClick(Sender: TObject);
begin
  relNomes.PrepareReport();
  relNomes.ShowReport();
end;

end.
