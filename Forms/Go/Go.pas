unit Go;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfmGo = class(TForm)
    Label1: TLabel;
    e_Y: TEdit;
    btn_cancel: TBitBtn;
    BitBtn1: TBitBtn;
    procedure btn_cancelClick(Sender: TObject);
    procedure e_YKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmGo: TfmGo;

implementation

uses Main;

{$R *.dfm}

procedure TfmGo.btn_cancelClick(Sender: TObject);
begin
     close;
end;

procedure TfmGo.e_YKeyPress(Sender: TObject; var Key: Char);
begin
     if (not(key in ['0'..'9'])) xor (ord(key)=8) then key:=#0;
end;

procedure TfmGo.BitBtn1Click(Sender: TObject);
var
   p : TPoint;
begin
     P.Y:=StrToInt(e_Y.Text);
     P.X:=1;

     if P.Y>fmMain.MContainer.Lines.Count+1 then
     begin
          ShowMessage('Число строк слишком велико');
          exit;
     end;

     fmMain.MContainer.CaretPos:=p;


     close;
end;

end.
