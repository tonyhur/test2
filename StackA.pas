unit StackA;
interface
 uses error;

 type TElement = longint;    { replacable element type }
 const  MAXS = 30;
 type
  TStack = record
    last: integer;
    E: array[1..MAXS] of TElement;
  end;

 procedure InitStack (var S: TStack; size:integer);
 procedure CleanUpStack (var S: TStack);
 procedure push (var S: TStack; E:TElement);
 function pop (var S: TStack):TElement;
 function top (var S: TStack):TElement;
 function IsStackEmpty (var S:TStack):boolean;

implementation

 procedure InitStack (var S: TStack; size:integer);
 begin
   if size>MAXS then FatalError('stack too large');
   S.last := 0;
 end;

 procedure CleanUpStack (var S:TStack);
 begin  S.last := 0;  end;

 procedure push (var S:TStack; E:TElement);
 begin
   S.last := S.last+1;
   if S.last > MAXS then  FatalError('stack overflow!');
   S.E[S.last] := E;
 end;

 function pop (var S:TStack):TElement;
 begin
   if IsStackEmpty(S) then  FatalError('stack underflow!');
   pop := S.E[S.last];
   S.last := S.last-1;
 end;

 function top (var S:TStack):TElement;
 begin
   if IsStackEmpty(S) then  LiteError('Stack is empty, cannot return top.')
   else top := S.E[S.last];
 end;

 function IsStackEmpty (var S:TStack):boolean;
 begin  IsStackEmpty := (S.last=0);  end;

end.
