program PrimeiroSistemaDelphi;

uses
  Vcl.Forms,
  PrimeiroSistema in 'PrimeiroSistema.pas' {Form7};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm7, Form7);
  Application.Run;
end.
