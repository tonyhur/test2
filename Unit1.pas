unit Unit1;
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Eval, ExtCtrls;

type
  TForm1 = class(TForm)
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Panel1: TPanel;
    Edit1: TEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Add(Sender: TObject);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Add(Sender: TObject);
begin
  Form1.Edit1.Text:=Form1.Edit1.Text+TButton(Sender).Caption;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Edit1.Text:='1';
end;

procedure TForm1.Button16Click(Sender: TObject);
begin
  Edit1.Text:='';
end;

procedure TForm1.Button17Click(Sender: TObject);
begin
  Edit1.Text:=IntToStr(Evaluate(Edit1.Text));
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Add(Sender);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
Add(Sender);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
Add(Sender);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
Add(Sender);
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
Add(Sender);
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
Add(Sender);
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
Add(Sender);
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
Add(Sender);
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
Add(Sender);
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
Add(Sender);
end;

procedure TForm1.Button12Click(Sender: TObject);
begin
Add(Sender);
end;

procedure TForm1.Button13Click(Sender: TObject);
begin
Add(Sender);
end;

procedure TForm1.Button14Click(Sender: TObject);
begin
Add(Sender);
end;

end.
