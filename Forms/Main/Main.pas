unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPMan, Menus, StdCtrls, ComCtrls, IniFiles, StrUtils;

type
  TfmMain = class(TForm)
    XPMan: TXPManifest;
    MainMenu: TMainMenu;
    mnFile: TMenuItem;
    mnNew: TMenuItem;
    mnOpen: TMenuItem;
    mnSave: TMenuItem;
    mnSaveAs: TMenuItem;
    N5: TMenuItem;
    PageSetup: TMenuItem;
    mnPrint: TMenuItem;
    N8: TMenuItem;
    mnExit: TMenuItem;
    mnEdit: TMenuItem;
    mnUndo: TMenuItem;
    N12: TMenuItem;
    mnCut: TMenuItem;
    mnCopy: TMenuItem;
    mnPaste: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    mnGo: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    mnFormat: TMenuItem;
    mnWantReturn: TMenuItem;
    mnFont: TMenuItem;
    mnView: TMenuItem;
    mnStBar: TMenuItem;
    N30: TMenuItem;
    N31: TMenuItem;
    OpenDlg: TOpenDialog;
    SaveDlg: TSaveDialog;
    FontDlg: TFontDialog;
    PrintDlg: TPrintDialog;
    PrinterSetupDlg: TPrinterSetupDialog;
    FindDlg: TFindDialog;
    ReplaceDlg: TReplaceDialog;
    PageSetupDlg: TPageSetupDialog;
    sbPosition: TStatusBar;
    MContainer: TMemo;
    procedure mnOpenClick(Sender: TObject);
    procedure mnNewClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mnSaveClick(Sender: TObject);
    procedure mnSaveAsClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure PageSetupClick(Sender: TObject);
    procedure mnPrintClick(Sender: TObject);
    procedure mnFontClick(Sender: TObject);
    procedure mnWantReturnClick(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure mnCutClick(Sender: TObject);
    procedure mnCopyClick(Sender: TObject);
    procedure mnPasteClick(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure mnUndoClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure MContainerKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mnStBarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MContainerClick(Sender: TObject);
    procedure FindDlgFind(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure ReplaceDlgReplace(Sender: TObject);
    procedure mnGoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;



var
  fmMain: TfmMain;
  ShortName : string;
  FileName : string;
  bClose, bstBar : boolean;

  Setting : TIniFile;
  start, start2, d, x : integer;  

  
implementation

uses About, Go;

{$R *.dfm}

procedure TfmMain.mnOpenClick(Sender: TObject);
label MNew;
var
   ShortFileName : string;
   mrResult : TModalResult;
begin
     if ShortName='' then ShortFileName:='Безымянный' else ShortFileName:=ShortName;
     if (ShortName='') and (MContainer.Text='') then goto MNew;

     //Проверка на изменение содержимого контейнера
     if MContainer.Modified=true then
     begin
          mrResult:=MessageDlg('Текст в файле '+ShortFileName+' был изменен.'+#10#13+'Сохранить изменения?',mtWarning,[mbYes,mbNo,mbCancel],0);
          case mrResult of
              mrYes : begin
                           mnSave.OnClick(mnSave);
                           goto MNew;
                      end;
               mrNo : begin
                           goto MNew;

                      end;
               mrCancel : exit;
          end;
     end
     else
         goto MNew;

     MNew:
     //Диалог открытия файлов
     if OpenDlg.Execute then
     begin
          MContainer.Lines.LoadFromFile(OpenDlg.FileName);

          ShortName:=ExtractFileName(OpenDlg.FileName);
          ShortName:=copy(ShortName,1,length(ShortName)-4);
          fmMain.Caption:=ShortName+' - Блокнот';
          FileName:=OpenDlg.FileName;
     end;

     
end;

procedure TfmMain.mnNewClick(Sender: TObject);
label MNew;
var
   ShortFileName : string;
   mrResult : TModalResult;
begin
     if ShortName='' then ShortFileName:='Безымянный' else ShortFileName:=ShortName;
     if (ShortName='') and (MContainer.Text='') then goto MNew;

     //Проверка на изменение содержимого контейнера
     if MContainer.Modified=true then
     begin
          mrResult:=MessageDlg('Текст в файле '+ShortFileName+' был изменен.'+#10#13+'Сохранить изменения?',mtWarning,[mbYes,mbNo,mbCancel],0);
          case mrResult of
              mrYes : begin
                           mnSave.OnClick(mnSave);
                           goto MNew;
                      end;
               mrNo : begin
                           MNew:
                           MContainer.Clear;
                           ShortName:='';
                           FileName:='';
                           fmMain.Caption:='Безымянный - Блокнот';
                           if (Sender as TMenuItem).Name='mnExit' then
                           begin
                                bClose:=true;
                                close;
                           end;
                      end;
               mrCancel : exit;
          end;
     end
     else
         goto MNew;

end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
     ShortName:='';

     //Файл настроек
     Setting:=TIniFile.Create('notepad.ini');

     fmMain.Left:=Setting.ReadInteger('Form','X',fmMain.Left);
     fmMain.Top:=Setting.ReadInteger('Form','Y',fmMain.Top);
     fmMain.Width:=Setting.ReadInteger('Form','Width',fmMain.Width);
     fmMain.Height:=Setting.ReadInteger('Form','Height',fmMain.Height);

     mnWantReturn.Checked:=Setting.ReadBool('General','Returns',true);
     mnWantReturn.OnClick(mnWantReturn);
     //Setting.Free;

end;

procedure TfmMain.mnSaveClick(Sender: TObject);
begin
     if FileName<>'' then
        MContainer.Lines.SaveToFile(FileName)
     else
         mnSaveAs.OnClick(mnSaveAs);
         
     MContainer.Modified:=false;
end;

procedure TfmMain.mnSaveAsClick(Sender: TObject);
begin
     //Диалог сохранения файлов
     if SaveDlg.Execute then
     begin
          MContainer.Lines.SaveToFile(SaveDlg.FileName);

          ShortName:=ExtractFileName(SaveDlg.FileName);
          ShortName:=copy(ShortName,1,length(ShortName)-4);
          fmMain.Caption:=ShortName+' - Блокнот';
          FileName:=SaveDlg.FileName;
     end;
end;

procedure TfmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
label MNew;
var
   ShortFileName : string;
   mrResult : TModalResult;
begin
     if ShortName='' then ShortFileName:='Безымянный' else ShortFileName:=ShortName;
     if (ShortName='') and (MContainer.Text='') then goto MNew;

     //Проверка на изменение содержимого контейнера
     if MContainer.Modified=true then
     begin
          mrResult:=MessageDlg('Текст в файле '+ShortFileName+' был изменен.'+#10#13+'Сохранить изменения?',mtWarning,[mbYes,mbNo,mbCancel],0);
          case mrResult of
              mrYes : begin
                           mnSave.OnClick(mnSave);
                           goto MNew;
                      end;
               mrNo : begin
                           MNew:
                           bClose:=true;
                      end;
               mrCancel : bClose:=false;
          end;
     end
     else
         goto MNew;

     if bClose=false then CanClose:=false else CanClose:=true;
end;

procedure TfmMain.PageSetupClick(Sender: TObject);
begin
     //Параметры страницы
     PageSetupDlg.Execute;
end;

procedure TfmMain.mnPrintClick(Sender: TObject);
var
   RContainer : TRichEdit;
begin
     //Печать текста
     if PrintDlg.Execute then
     begin
          RContainer:=TRichEdit.Create(Self);
          RContainer.Visible:=false;
          RContainer.Parent:=fmMain;
          RContainer.Text:=MContainer.Text;
          RContainer.Print(FileName);
          RContainer.Free;
     end;

end;

procedure TfmMain.mnFontClick(Sender: TObject);
begin
     //Шрифт
     if FontDlg.Execute then
     begin
          MContainer.Font:=FontDlg.Font;
     end;
end;

procedure TfmMain.mnWantReturnClick(Sender: TObject);
begin
     //Запоминаем значение статусной строки
     bstBar:=mnStBar.Checked;

     case mnWantReturn.Checked of
          true : begin
                      MContainer.ScrollBars:=ssVertical;
                      MContainer.WordWrap:=true;
                      mnStBar.Enabled:=false;
                      sbPosition.Visible:=false;
                      mnGo.Enabled:=false;
                 end;
         false : begin
                      MContainer.ScrollBars:=ssBoth;
                      MContainer.WordWrap:=false;
                      mnStBar.Enabled:=true;
                      mnStBar.Checked:=bstBar;
                      mnStBar.OnClick(mnStBar);
                      mnGo.Enabled:=true;                      
                 end;
     end;
     
     //Файл настроек
     Setting:=TIniFile.Create('notepad.ini');
     Setting.WriteBool('General','Returns',mnWantReturn.Checked);
     Setting.Free;

end;

procedure TfmMain.N31Click(Sender: TObject);
begin
    fmAbout:=TfmAbout.Create(Self);
    fmAbout.ShowModal;
    fmAbout.Free;
end;

procedure TfmMain.N24Click(Sender: TObject);
var
   TimeDate : string;
   TContainer : string;
   Position : integer;
begin
     Position:=MContainer.SelStart;
     TContainer:=MContainer.Text;
     TimeDate:=TimeToStr(now)+' '+DateToStr(now);
     Insert(TimeDate, TContainer, MContainer.SelStart+1);

     MContainer.Text:=TContainer;
     MContainer.SelStart:=Position+Length(TimeDate);

end;

procedure TfmMain.N23Click(Sender: TObject);
begin
     MContainer.SelectAll;
end;

procedure TfmMain.mnCutClick(Sender: TObject);
begin
     MContainer.CutToClipboard;
end;

procedure TfmMain.mnCopyClick(Sender: TObject);
begin
     MContainer.CopyToClipboard;
end;

procedure TfmMain.mnPasteClick(Sender: TObject);
begin
     MContainer.PasteFromClipboard;
end;

procedure TfmMain.N16Click(Sender: TObject);
begin
     if MContainer.SelText='' then
        MContainer.SelLength:=1;

     MContainer.ClearSelection;

end;

procedure TfmMain.mnUndoClick(Sender: TObject);
begin
     MContainer.Undo;
end;

procedure TfmMain.FormResize(Sender: TObject);
begin
     sbPosition.Panels[0].Width:=fmMain.Width-130;     
end;

procedure TfmMain.MContainerKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     sbPosition.Panels[1].Text:='Стр '+IntToStr(MContainer.CaretPos.Y+1)+', стлб '+IntToStr(MContainer.CaretPos.X+1);

end;

procedure TfmMain.mnStBarClick(Sender: TObject);
begin
     case mnStBar.Checked of
          true : begin
                      sbPosition.Visible:=true;
                 end;
         false : begin
                      sbPosition.Visible:=false;
                 end;
     end;

     sbPosition.Panels[1].Text:='Стр '+IntToStr(MContainer.CaretPos.Y+1)+', стлб '+IntToStr(MContainer.CaretPos.X+1);

     //Файл настроек
     Setting:=TIniFile.Create('notepad.ini');
     Setting.WriteBool('General','StatusBar',mnStBar.Checked);
     Setting.Free;
     
end;

procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     //Файл настроек
     Setting:=TIniFile.Create('notepad.ini');
     Setting.WriteInteger('Form','X',fmMain.Left);
     Setting.WriteInteger('Form','Y',fmMain.Top);
     Setting.WriteInteger('Form','Width',fmMain.Width);
     Setting.WriteInteger('Form','Height',fmMain.Height);
     Setting.Free;
end;

procedure TfmMain.MContainerClick(Sender: TObject);
begin
     sbPosition.Panels[1].Text:='Стр '+IntToStr(MContainer.CaretPos.Y+1)+', стлб '+IntToStr(MContainer.CaretPos.X+1);
end;

procedure TfmMain.FindDlgFind(Sender: TObject);
begin
     if FindDlg.FindText='' then FindDlg.FindText:=ReplaceDlg.FindText;
     if PosEx(FindDlg.FindText,MContainer.Text,start)<>0 then
     begin
          d:=length(FindDlg.FindText);
          if MContainer.SelText<>'' then
              start:=MContainer.SelStart+MContainer.SelLength;



          x:=PosEx(FindDlg.FindText,MContainer.Text,start);
          if x<>0 then
          begin
               MContainer.HideSelection:=false;
               MContainer.SelStart:=x-1;
               MContainer.SelLength:=d;
          end;
     end
     else
         MessageDlg('Не удается найти "'+FindDlg.FindText+'"', mtInformation,[mbyes],0);
end;

procedure TfmMain.N18Click(Sender: TObject);
begin
     start:=0;
     FindDlg.Execute;
end;

procedure TfmMain.N19Click(Sender: TObject);
begin
     start:=MContainer.SelStart;
     FindDlg.OnFind(FindDlg);
end;

procedure TfmMain.N20Click(Sender: TObject);
begin
     start2:=MContainer.SelStart;
     start:=1;
     ReplaceDlg.FindText:=FindDlg.FindText;
     ReplaceDlg.Execute;
end;

procedure TfmMain.ReplaceDlgReplace(Sender: TObject);
begin
     if PosEx(ReplaceDlg.FindText,MContainer.Text,start2)<>0 then
     begin
          d:=length(ReplaceDlg.FindText);
          if MContainer.SelText<>'' then
              start2:=MContainer.SelStart+MContainer.SelLength;

          x:=PosEx(ReplaceDlg.FindText,MContainer.Text,start2);
          if x<>0 then
          begin
               MContainer.HideSelection:=false;
               MContainer.SelStart:=x-1;
               MContainer.SelLength:=d;
               MContainer.SelText:=ReplaceDlg.ReplaceText;
               MContainer.SelStart:=MContainer.SelStart-(d);
               MContainer.SelLength:=d;
          end;
     end
     else
         MessageDlg('Не удается найти "'+ReplaceDlg.FindText+'"', mtInformation,[mbyes],0);
end;

procedure TfmMain.mnGoClick(Sender: TObject);
begin
    fmGo := TfmGo.Create(Self);
    fmGo.ShowModal;
    fmGo.Free;
end;

end.
