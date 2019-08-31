program Notepad;

uses
  Forms,
  Main in 'Forms\Main\Main.pas' {fmMain},
  About in 'Forms\About\About.pas' {fmAbout},
  Go in 'Forms\Go\Go.pas' {fmGo};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Безымянный - Блокнот';
  Application.CreateForm(TfmMain, fmMain);
  Application.Run;
end.
