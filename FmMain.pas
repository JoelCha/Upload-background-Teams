unit FmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.BaseImageCollection,
  Vcl.ImageCollection, Vcl.Buttons, System.ImageList, Vcl.ImgList,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, System.IOUtils, fmAPropos;

type
  TTfmMain = class(TForm)
    OpenDialog1: TOpenDialog;
    Button1: TButton;
    ListBox1: TListBox;
    ImageCollection1: TImageCollection;
    ImageList1: TImageList;
    logo: TImageList;
    ImageList2: TImageList;
    Image2: TImage;
    Image3: TImage;
    StaticText1: TStaticText;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
  private

    { Déclarations privées }
      pathFile : string;
      destination : string;

      procedure loadList();
      procedure showAbout();

  public
    { Déclarations publiques }
  end;

var
  TfmMain: TTfmMain;



implementation

{$R *.dfm}

procedure TTfmMain.Button1Click(Sender: TObject);
var
  CopyFileDest : string;
begin

  openDialog1 := TOpenDialog.Create(self);


  openDialog1.Options := [ofFileMustExist];
  openDialog1.Filter :=
    'image jpg|*.jpg|image png|*.png';

  CopyFileDest := destination + extractfilename(OpenDialog1.FileName);

  if openDialog1.Execute then
  begin

      pathFile := OpenDialog1.FileName;
    destination := GetEnvironmentVariable('APPDATA') + '\Microsoft\Teams\Backgrounds\Uploads\' + extractfilename(OpenDialog1.FileName);


     TFile.Copy(pathFile, destination);


  end;

  loadlist;

  // Free up the dialog
  openDialog1.Free;
end;

procedure TTfmMain.FormCreate(Sender: TObject);

begin
  loadList;
end;

procedure TTfmMain.Image2Click(Sender: TObject);

var

  FileName : string;
begin


  FileName := ListBox1.Items.Strings[ListBox1.ItemIndex];

  FileName := destination + FileName;
  DeleteFile(FileName);

  loadList;


end;


procedure TTfmMain.Image3Click(Sender: TObject);
begin
//  fmAPropos
  FmAbout.Show;
end;

//Charge le contenu des images dans le dossier upload

procedure TTfmMain.loadList;
const
  FileMask = '*';
var
  Directory, Mask: String;
  sr: TSearchRec;
  list: TStringList;
begin

  destination := GetEnvironmentVariable('APPDATA') + '\Microsoft\Teams\Backgrounds\Uploads\' ;
  list := TStringList.Create;
  ListBox1.Clear;


  if FindFirst(destination + FileMask, faAnyFile - faDirectory, sr) = 0 then
    try
      repeat
         ListBox1.Items.Add(sr.Name);
      until FindNext(sr) <> 0;
    finally
      FindClose(sr);
    end;

end;

procedure TTfmMain.showAbout;



begin
//  fmAPropos :=Tform.create(application);
//  fmAPropos.show();
end;

end.
