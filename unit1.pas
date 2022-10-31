unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    CheckGroup1: TCheckGroup;
    procedure CheckGroup1Click(Sender: TObject);
    procedure CheckGroup1ItemClick(Sender: TObject; Index: integer);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.CheckGroup1Click(Sender: TObject);
begin

end;

procedure TForm1.CheckGroup1ItemClick(Sender: TObject; Index: integer);
begin
  if CheckGroup1.Checked[Index]
  then
    case Index of
      0: Self.BorderIcons:= Self.BorderIcons + [biHelp];
      1: Self.BorderIcons:= Self.BorderIcons + [biSystemMenu];
      2: Self.BorderIcons:= Self.BorderIcons + [biMinimize];
      else
        Self.BorderIcons:= Self.BorderIcons + [biMaximize];
    end
  else
    case Index of
      0: Self.BorderIcons:= Self.BorderIcons - [biHelp];
      1: Self.BorderIcons:= Self.BorderIcons - [biSystemMenu];
      2: Self.BorderIcons:= Self.BorderIcons - [biMinimize];
      else
        Self.BorderIcons:= Self.BorderIcons - [biMaximize];
    end;

  if TObject(Sender).InheritsFrom(TCheckGroup) then
    Self.Caption:= format('chahged item: %s', [CheckGroup1.Items.Strings[Index]]);
end;

procedure TForm1.FormShow(Sender: TObject);
var
  i: PtrInt = 0;
begin
  for i:= 0 to Pred(CheckGroup1.Items.Count) do
    CheckGroup1ItemClick(Sender,i);

end;

end.

