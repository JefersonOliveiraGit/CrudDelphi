program ProjetoCrud;

uses
  Vcl.Forms,
  uCrud in 'uCrud.pas' {FrmCrud},
  uAlterarNome in 'uAlterarNome.pas' {FrmAlterarNome};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmCrud, FrmCrud);
  Application.CreateForm(TFrmAlterarNome, FrmAlterarNome);
  Application.Run;
end.
