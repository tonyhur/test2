unit Calc2;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Eval;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var Form1: TForm1;

implementation
{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Edit1.Text:=Edit1.Text+TButton(Sender).Caption;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Edit1.Text:=Edit1.Text+TButton(Sender).Caption;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  Edit1.Text:=Edit1.Text+TButton(Sender).Caption;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  Edit1.Text:=Edit1.Text+TButton(Sender).Caption;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  Edit1.Text:=Edit1.Text+TButton(Sender).Caption;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Edit1.Text:=Edit1.Text+TButton(Sender).Caption;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  Edit1.Text:=Edit1.Text+TButton(Sender).Caption;
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  Edit1.Text:=Edit1.Text+TButton(Sender).Caption;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Edit1.Text:=Edit1.Text+TButton(Sender).Caption;
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
  Edit1.Text:=Edit1.Text+TButton(Sender).Caption;
end;

procedure TForm1.Button12Click(Sender: TObject);
begin
  Edit1.Text:=Edit1.Text+TButton(Sender).Caption;
end;

procedure TForm1.Button13Click(Sender: TObject);
begin
  Edit1.Text:=Edit1.Text+TButton(Sender).Caption;
end;

procedure TForm1.Button14Click(Sender: TObject);
begin
  Edit1.Text:=Edit1.Text+TButton(Sender).Caption;
end;

procedure TForm1.Button15Click(Sender: TObject);
begin
  Edit1.Text:=Edit1.Text+TButton(Sender).Caption;
end;

procedure TForm1.Button16Click(Sender: TObject);
begin
  Edit1.Text:='';
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
  Edit1.Text:=IntToStr(Evaluate(Edit1.Text));
end;

procedure TForm1.Button17Click(Sender: TObject);
begin
  Edit1.Text:=Edit1.Text+TButton(Sender).Caption;
end;

end.
