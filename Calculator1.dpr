program Calculator1;
{$APPTYPE CONSOLE}
uses Eval, Calc1;

 procedure ProcessEventLoop;
 begin
  repeat
   GetAndProcessOneEvent;
   if UserSubmittedAnExpression then begin
     value := Evaluate(expr);
     DisplayResult;
   end;
  until UserWantsToQuit;
 end;

begin
 InitializeAndDisplayCalculator;
 ProcessEventLoop;
 CleanUpAll;
end.


