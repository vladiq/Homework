program a3;

function maxStep(var a: array of integer): integer;
var
  i, j: integer;   
begin
  j := 1;
  result := 0;
  for i := 0 to length(a) - 2 do begin
    if (a[i] < a[i + 1]) then begin
      j := j + 1;
    end else begin
      if (j > result) then begin
        result := j;
      end;
      j := 1;
    end;
  end;
end;

procedure readArray(var a: array of integer);
var
  i,n: integer;
begin
  write('Enter length of array: ');
  readln(n);
  setlength(a,n);
  for i := 0 to n - 2 do
  begin
    read(a[i]);
  end;
  a[n-1] := 0;
  writeln(a[n-1]);
end;

const
  n = 100;

var
  a: array of integer;

begin
  readArray(a);
  write('Maximum length of step: ',maxStep(a));
end.
