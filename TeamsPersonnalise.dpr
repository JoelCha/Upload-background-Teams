program TeamsPersonnalise;

uses
  Vcl.Forms,
  FmMain in 'FmMain.pas' {TfmMain},
  fmAPropos in 'fmAPropos.pas' {FmAbout};

{$R *.res}


begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TTfmMain, TfmMain);
  Application.CreateForm(TFmAbout, FmAbout);
  Application.Run;
end.
