unit fmAPropos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls;

type
  TFmAbout = class(TForm)
    Image1: TImage;
    Memo1: TMemo;
  private
    { D�clarations priv�es }
  public
    { D�clarations publiques }
  end;

var
  FmAbout: TFmAbout;

implementation

{$R *.dfm}

end.
