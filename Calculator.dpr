program Calculator;
{$APPTYPE CONSOLE}
uses Eval;

 procedure DemoExpr (ex: string);
 begin
  writeln('InFix-Notation is  : ', ex);
  writeln('PostFix-Notation is: ', InFix2PostFix(ex), '"');
  writeln('The result is      : ', Evaluate(ex) : 5);
  writeln;
 end;

begin {--- main ---}
 DemoExpr('3*(4+5)');
 DemoExpr('(1+2)*(3+4*5)');
 DemoExpr('2+3*(6+(4*5))+2');
 DemoExpr('2-3*(6+(4*5/2))+2');
 DemoExpr('s(5*8)+1');
 writeln('type return to exit'); readln;
end.


