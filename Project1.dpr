program Project1;

uses
  Vcl.Forms,
  Unit2 in 'Unit2.pas' {FormMain},
  UnitAPICep in 'UnitAPICep.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
