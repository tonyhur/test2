unit error;
interface
	procedure FatalError (s: string);
	procedure LiteError (s: string);
	procedure Warning (s: string);

implementation
	procedure FatalError (s: string);
	begin
		writeln('Fatal error ', s);
		writeln('program stopped !');
		halt;  { that's heavy!! }
	end;

	procedure LiteError (s: string);
	begin
		writeln('a lite error occured in: ', s);
		writeln('type return to resume.');
		readln;
	end;

	procedure Warning (s: string);
	begin
		writeln('Warning: ', s);
	end;

end.
