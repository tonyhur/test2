(* ein triviales Interface für den Calculator1 *)

(* ein Kommentar *)

unit Calc1;
interface

 var
  value: integer;
  expr: string;

 procedure InitializeAndDisplayCalculator;
 procedure GetAndProcessOneEvent;
 function  UserSubmittedAnExpression: boolean;
 procedure DisplayResult;
 function  UserWantsToQuit: boolean;
 procedure CleanUpAll;

implementation

 procedure InitializeAndDisplayCalculator;
 begin
   writeln;
   writeln('Integer Calulator built by T.H., @2015');
   writeln('--------------------------------------');
   writeln('Allowed operators are: + - * / s (for integer sinus) and parentheses ( )');
 end;

 procedure GetAndProcessOneEvent;
 begin
   writeln;
   writeln('Enter an expression (''q'' for quit)');
   readln(expr);
 end;

 function UserSubmittedAnExpression: boolean;
 begin
   result := (expr <> 'q');
 end;

 procedure DisplayResult;
 begin  writeln('Result is: ', value);  end;

 function UserWantsToQuit: boolean;
 begin
   UserWantsToQuit := (expr = 'q');
 end;

 procedure CleanUpAll;
 begin  end;

end.

