unit uAlterarNome;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TFrmAlterarNome = class(TForm)
    pnlFundo: TPanel;
    lblAlterarNome: TLabel;
    lblNomeAntigo: TLabel;
    lblNomenovo: TLabel;
    edtNomeAntigo: TEdit;
    edtNomeNovo: TEdit;
    btnSalvar: TButton;
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAlterarNome: TFrmAlterarNome;

implementation

{$R *.dfm}

uses uCrud;

procedure TFrmAlterarNome.btnSalvarClick(Sender: TObject);
begin
  if edtNomeAntigo.Text = '' then
  begin
     MessageDlg('Campo nome antigo vazio!', mtWarning,
      [mbOk], 0, mbOk);
  end;

  if edtNomeNovo.Text = '' then
  begin
     MessageDlg('Campo novo nome vazio!', mtWarning,
      [mbOk], 0, mbOk);
  end;

  FrmCrud.Query.Close;
  FrmCrud.Query.SQL.Clear;
  FrmCrud.Query.SQL.Add('SELECT');
  FrmCrud.Query.SQL.Add(' nome');
  FrmCrud.Query.SQL.Add('FROM');
  FrmCrud.Query.SQL.Add(' nomes');
  FrmCrud.Query.SQL.Add('WHERE');
  FrmCrud.Query.SQL.Add(' nome = :nome');

  FrmCrud.Query.ParamByName('nome').AsString := edtNomeAntigo.Text;
  FrmCrud.Query.Open();

  if FrmCrud.Query.RecordCount > 0 then
  begin
    FrmCrud.Query.Close;
    FrmCrud.Query.SQL.Clear;
    FrmCrud.Query.SQL.Add('UPDATE nomes');
    FrmCrud.Query.SQL.Add(' SET nome = :nome_novo');
    FrmCrud.Query.SQL.Add('WHERE nome = :nome_antigo');

    FrmCrud.Query.ParamByName('nome_antigo').AsString := edtNomeAntigo.Text;
    FrmCrud.Query.ParamByName('nome_novo').AsString   := edtNomeNovo.Text;
    FrmCrud.Query.ExecSQL;
    MessageDlg('Alterado com sucesso!', mtConfirmation,
      [mbOk], 0, mbOk);
  end else
  begin MessageDlg('Nome não encontrado!', mtError,
      [mbOk], 0, mbOk);
      Abort
  end;
  edtNomeAntigo.Clear;
  edtNomeNovo.Clear;
  Close;
end;

end.
