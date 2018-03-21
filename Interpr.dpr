.... this programm not finished

(* Math formula interpreter *)
{ this is a complete formula interpreter which recognizes}
{ +, - , * , / , % , ^ , the function NORMAL , INTERVALL , WENN }
{ example :  2^8 - 6%5 + abs(-7*3) + intervall(1,4) }

program Interpreter;
{$APPTYPE CONSOLE}
	const  {token symbols}
		NULL = 0;
		DELIMITER = 1;
		VARIABLE = 2;
		NUMBER = 3;
		WSYM = 4;
		ASYM = 5;
		ISYM = 6;
		NSYM = 7;

	type
		str80 = string;
		str20 = string;

	var
		i: integer;
		line: str80;
		token: str20;
		posi, tok_type: integer;
		answer: real;

	function UpCase (c: char): char;
	begin
		if (c >= 'a') and (c <= 'z') then
			UpCase := chr(ord(c) - 32)
		else
			UpCase := c;
	end;

	function Norm (m, s: real): real;
		var
			n: real;
			i: integer;
	begin
		n := 0;
		for i := 1 to 12 do
			n := n + abs(Random / MAXINT);
		Norm := s * (n - 6) + m;
	end;



	procedure get_exp (var result: real);
	forward;
	procedure level1 (var result: real);
	forward;
	procedure level2 (var result: real);
	forward;
	procedure level3 (var result: real);
	forward;
	procedure level4 (var result: real);
	forward;
	procedure level5 (var result: real);
	forward;
	procedure level6 (var result: real);
	forward;
	procedure primitive (var result: real);
	forward;
	procedure arith (o: char; var r, h: real);
	forward;
	procedure unary (o: char; var r: real);
	forward;
	procedure putback;
	forward;
	function find_var (s: str20): real;
	forward;
	procedure serror (error: integer);
	forward;
	procedure get_token;
	forward;

	procedure get_exp;
	begin
		posi := 1;
		get_token;
		if tok_type = NULL then begin
				serror(3);
				exit;
			end;
		level1(result);
	end;

	procedure level1;
		var
			hold: real;
			slot, ttok_type: integer;
			temp_token: str20;
	begin
		if tok_type = VARIABLE then begin
				temp_token := token;
				ttok_type := tok_type;

    {slot:=0; assign the variable pos}
				get_token;
				if token <> '=' then begin
						putback;
						token := temp_token;
						tok_type := ttok_type;
					end
				else begin
						get_token;
						level2(result);
      {vars[slot]:=result;}
						exit;
					end;
			end;
		level2(result);
	end;

	procedure level2;
		var
			op: char;
			hold: real;
	begin
		level3(result);
		while (token = '+') or (token = '-') do begin
				op := token[1];
				get_token;
				level3(hold);
				arith(op, result, hold);
			end;
	end;

	procedure level3;
		var
			op: char;
			hold: real;
	begin
		level4(result);
		while (token = '*') or (token = '/') or (token = '%') do begin
				op := token[1];
				get_token;
				level4(hold);
				arith(op, result, hold);
			end;
	end;

	procedure level4;
		var
			hold: real;
	begin
		level5(result);
		if token = '^' then begin
				get_token;
				level4(hold);
				arith('^', result, hold);
			end;
	end;

	procedure level5;
		var
			op: char;
	begin
		op := ' ';
		if (tok_type = DELIMITER) and ((token = '+') or (token = '-')) then begin
				op := token[1];
				get_token;
			end;
		level6(result);
		if op <> ' ' then
			unary(op, result);
	end;

	procedure level6;
		var
			hold: real;
	begin
		hold := 0;
		if (token = '(') and (tok_type = DELIMITER) then begin
				get_token;
				level1(result);
				if token <> ')' then
					serror(2);
				get_token;
			end
		else if tok_type = NSYM then begin
				get_token;
				get_token;
				level2(result);
				get_token;
				level2(hold);
				arith('n', result, hold);
				get_token;
			end
		else if tok_type = ISYM then begin
				get_token;
				get_token;
				level2(result);
				get_token;
				level2(hold);
				arith('i', result, hold);
				get_token;
			end
		else if tok_type = ASYM then begin
				get_token;
				get_token;
				level2(result);
				arith('a', result, hold);
				get_token;
			end
		else if tok_type = WSYM then begin
				get_token;
				get_token;
				level2(result);
				arith('a', result, hold);
				get_token;
			end
		else
			primitive(result);
	end;

	procedure primitive;
		var
			code: integer;
	begin
		case tok_type of
			VARIABLE:  begin
					result := find_var(token);
					get_token;
				end;
			NUMBER:  begin
					//ReadString(token, result);
					get_token;
				end;
			else
				serror(1);
		end;
	end;

	procedure arith;
{var t,ex:integer;}
	begin
		case o of
			'-': 
				r := r - h;
			'+': 
				r := r + h;
			'*': 
				r := r * h;
			'/': 
				r := r / h;
			'%': 
				r := trunc(r) mod trunc(h);
			'^': 
				r := exp(h * ln(r));
			'n': 
				r := Norm(r, h);
			'i': 
				r := r + (h - r) * abs(Random / MAXINT);
			'a': 
				r := abs(r);
			'w': 
		end;
	end;

	procedure unary;
	begin
		if o = '-' then
			r := -r;
	end;

	procedure putback;
	begin
		posi := posi - length(token);
	end;

	function find_var;
	begin
  {for i:=1 to dim if s=v[i] then found}
		find_var := 0;
	end;

	procedure serror;
		var
			e: array[1..4] of str20;
	begin
		e[1] := 'Syntaxfehler';
		e[2] := 'Klammerfehler';
		e[3] := 'Kein Ausdruck';
		e[4] := 'Variable unbekannt';
		writeln(e[error]);
	end;

	procedure get_token;
	begin
		tok_type := NULL;
		token := '';
		while line[posi] = ' ' do
			posi := posi + 1;
		if line[posi] in ['+', '-', '*', '/', '%', '^', '=', '(', ')', ','] then begin
				token := line[posi];
				tok_type := DELIMITER;
				posi := posi + 1;
			end
		else if line[posi] in ['A'..'Z', 'a'..'z', '_'] then begin
				while line[posi] in ['A'..'Z', 'a'..'z', '_'] do begin
						token := concat(token, UpCase(line[posi]));
						posi := posi + 1;
					end;
				if token = 'NORMAL' then
					tok_type := NSYM
				else if token = 'INTERVALL' then
					tok_type := ISYM
				else if token = 'ABS' then
					tok_type := ASYM
				else if token = 'WENN' then
					tok_type := WSYM
				else
					tok_type := VARIABLE;
			end
		else if line[posi] in ['0'..'9', '.'] then begin
				while line[posi] in ['0'..'9', '.'] do begin
						token := concat(token, line[posi]);
						posi := posi + 1;
					end;
				tok_type := NUMBER;
			end;
	end;


begin {main}

{Randomize;}
	repeat
		writeln('Enter your expression (RETURN for exit): ');
		readln(line);
		line := concat(line, ';');
		for i := 1 to 1 do begin
				answer := 0;
				get_exp(answer);
				writeln('Answer: ', answer : 10 : 4);
			end;
	until line = ';';
end.