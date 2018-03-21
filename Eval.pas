unit Eval;
interface
 uses  StackA;  {stack of integer}

 function InFix2PostFix (L: string): string;
 function EvaluatePostFix (L: string): integer;
 function Evaluate (expr: string): integer;

implementation
 function IsDigit (c: char): boolean;   {returns TRUE if c is a digit}
 begin  IsDigit := (c>='0') and (c<='9');  end;

 function OpPr (Op1, Op2: CHAR): boolean;
     {returns TRUE if Op1 has higher precedence than Op2 }
  const  OP = 's%/*-+)(;';  { precedence list }
 begin
  if pos(Op1,OP)<=pos(Op2,OP) then  OpPr:=true
  else  OpPr:=false;
 end;

 function InFix2PostFix (L: string): string;
    {--  infix to postfix translator --}
  var  i, j, unused: integer;  O: string;  S: TSTACK;
 begin
  InitStack(S,30);
  push(S, ord(';'));  { precedes all operators }
  i := 0;  {-- counter within L, the input string }
  j := 1;  {-- counter within Out, the output string }
  O := '                      ';

  repeat
   inc(i);
   if IsDigit(L[i]) then begin
     O[j] := ' ';
     j := j+1;
     while IsDigit(L[i]) do begin
       O[j] := L[i];
       i := i+1;
       j := j+1;
     end;
     i := i-1;
    end else if L[i] = ')' then begin
     while chr(top(S)) <> '(' do begin {unstack}
       O[j] := chr(pop(S));
       j := j+1;
     end;
     unused := pop(S); {-- pop the '(' }
    end else begin
     while OpPr(chr(top(S)), L[i]) and (L[i] <> '(') do begin
       O[j] := chr(pop(S));
       j := j + 1;
     end;
     push(S, ord(L[i]));
    end;
  until i >= length(L);

  while not IsStackEmpty(S) do begin
    O[j] := chr(pop(S));
    j := j + 1;
  end;
  SetLength(O,j-2);

  CleanUpStack(S);
  InFix2PostFix := O;
 end;

 function EvaluatePostFix (L: string): integer;
{--- a postfix expression is evaluated ---}
 var  i: integer;  op1, op2: integer;  S: TSTACK;
 begin
  InitStack(S,30);
  push(S,0);
  i := 0;
  repeat
   inc(i);
   if IsDigit(L[i]) then begin
     op1 := 0;
     while IsDigit(L[i]) do begin
       op1 := 10 * op1 + (ord(L[i]) - ord('0'));
       inc(i);
     end;
     dec(i);
     push(S, op1);
   end  else if L[i] = ' ' then begin  end
   else begin
     op2 := pop(S);
     op1 := pop(S);
     case L[i] of
      ' ':   ;  { do nothing }
      '+':   push(S, op1 + op2);
      '*':   push(S, op1 * op2);
      '-':   push(S, op1 - op2);
      '/':   push(S, op1 div op2);
      's':   begin push(S,op1); push(S,trunc(sin(op2))); end;
     end;
   end;
  until i >= length(L);
  op1 := pop(S);
  CleanUpStack(S);
  EvaluatePostFix := op1;
 end;

 function Evaluate (expr:string):integer;
 begin
   Evaluate := EvaluatePostFix(InFix2PostFix(expr));
 end;

end.

