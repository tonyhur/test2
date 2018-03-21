unit StackAp;
interface
 uses error;
 type TElement = integer;        { replacable element type }

 const  MAXS = 100;  //maximal size
 type
  arr= array[1..MAXS] of TElement;
  pTStack = ^TStack;
  TStack = record
    last,MAXS: integer;
    E: ^arr;
  end;

 procedure InitStack (var S: pTStack; MAXS1:integer);
 procedure CleanUpStack (var S: pTStack);
 procedure push (var S: pTStack; E: TElement);
 function  pop (var S: pTStack): TElement;
 function  top (var S: pTStack): TElement;
 function  IsStackEmpty (var S: pTStack): boolean;

implementation
 procedure InitStack (var S: pTStack; MAXS1:integer);
 begin
   GetMem(S,sizeof(TStack));  {'GetMemory' is system dependent}
   S^.last := 0;
   S^.MAXS := MAXS1;
   GetMem(S^.E,sizeof(TElement)*MAXS1);
 end;

 procedure CleanUpStack (var S:pTStack);
 begin
   FreeMem(S^.E, sizeof(TElement)*S^.MAXS);
   FreeMem(S),sizeof(TStack);
 end;

 procedure push (var S: pTStack; E: TElement);
 begin
  S^.last := S^.last + 1;
  if S^.last > MAXS then  FatalError('stack overflow!');
  S^.E^[S^.last] := E;
 end;

 function pop (var S: pTStack): TElement;
 begin
  if IsStackEmpty(S) then  FatalError('stack underflow!');
  pop := S^.E^[S^.last];
  S^.last := S^.last-1;
 end;

 function top (var S: pTStack): TElement;
 begin
  if IsStackEmpty(S) then  LiteError('Stack is empty, cannot return top.')
  else
   top := S^.E^[S^.last];
 end;

 function IsStackEmpty (var S: pTStack): boolean;
 begin  IsStackEmpty := (S^.last=0);  end;

end.

 