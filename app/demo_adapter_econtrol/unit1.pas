unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls,
  ATSynEdit,
  ATStringProc,
  ATSynEdit_Adapter_EControl,
  ecSyntAnal;

type
  { TfmMain }

  TfmMain = class(TForm)
    chkWrap: TCheckBox;
    edLexer: TComboBox;
    edFiles: TComboBox;
    Panel1: TPanel;
    procedure chkWrapChange(Sender: TObject);
    procedure edLexerChange(Sender: TObject);
    procedure edFilesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
    ed: TATSynEdit;
    filedir: string;
    procedure DoLexer(const aname: string);
    procedure DoOpen(const fname: string);
    procedure UpdateLexList;
  public
    { public declarations }
  end;

var
  fmMain: TfmMain;

implementation

{$R *.lfm}

var
  manager: TSyntaxManager;
  adapter: TATAdapterEControl;

{ TfmMain }

procedure TfmMain.UpdateLexList;
var
  i: integer;
  sl: tstringlist;
begin
  sl:= tstringlist.create;
  try
    for i:= 0 to manager.AnalyzerCount-1 do
      sl.Add(manager.Analyzers[i].LexerName);
    sl.sort;
    edLexer.Items.AddStrings(sl);
  finally
    sl.free;
  end;
end;

procedure TfmMain.DoOpen(const fname: string);
begin
  ed.LoadFromFile(fname);
end;

procedure TfmMain.FormCreate(Sender: TObject);
var
  fname_lxl: string;
begin
  filedir:= ExtractFileDir(ExtractFileDir(ExtractFileDir(Application.ExeName)))+'\test_files\syntax\';
  fname_lxl:= ExtractFilePath(Application.ExeName)+'lexlib.lxl';

  manager:= TSyntaxManager.Create(Self);
  manager.LoadFromFile(fname_lxl);
  UpdateLexList;

  ed:= TATSynEdit.Create(Self);
  ed.Font.Name:= 'Consolas';
  ed.Parent:= Self;
  ed.Align:= alClient;
  ed.OptUnprintedVisible:= false;
  ed.OptRulerVisible:= false;
  ed.Colors.TextBG:= $e0f0f0;

  adapter:= TATAdapterEControl.Create;
  ed.AdapterOfHilite:= adapter;
end;

procedure TfmMain.FormShow(Sender: TObject);
begin
  edFiles.ItemIndex:= 0;
  edFiles.OnChange(nil);
  Application.ProcessMessages;

  edLexer.ItemIndex:= edLexer.Items.IndexOf('Pascal');
  edLexer.OnChange(nil);
end;

procedure TfmMain.chkWrapChange(Sender: TObject);
begin
  if chkWrap.checked then
    ed.OptWrapMode:= cWrapOn
  else
    ed.OptWrapMode:= cWrapOff;
end;

procedure TfmMain.DoLexer(const aname: string);
begin
  adapter.SetLexer(manager.FindAnalyzer(aname));
  ed.Update;
end;

procedure TfmMain.edLexerChange(Sender: TObject);
begin
  DoLexer(edLexer.Text);
end;

procedure TfmMain.edFilesChange(Sender: TObject);
begin
  DoOpen(filedir+edFiles.Text);
end;

end.

