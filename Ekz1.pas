program sumator;

function getArray(var num: string): array of integer;
var
  i: integer;
begin
  setlength(result, length(num));
  for i := 0 to length(num) - 1 do
  begin
    result[length(num) - 1 - i] := integer(num[i + 1]) - integer('0');
  end;
end;

function sum(var a, b: array of integer): array of integer;
var
  i, r: integer;
begin
  if (length(a) > length(b)) then
  begin
    setlength(result, length(a));
    setlength(b, length(a));
  end else 
  begin
    setlength(result, length(b));
    setlength(a, length(b));
  end;
  r := 0;
  for i := 0 to length(result) - 1 do
  begin
    result[i] := (a[i] + b[i] + r) mod 10;
    r := result[i] div 10;
  end;
  if (r = 1) then 
  begin
    setlength(result,length(result)+1);
    result[length(result) - 1] := 1;
  end;
end;

function getString(var a: array of integer): string;
var
  i: integer;
begin
  for i := length(a) - 1 downto 0 do
  begin
    result := result + char(a[i] + integer('0'));
  end;
end;

var
  a, b, c, ab, abc: array of integer;
  num1, num2, num3, sum1, sum2: string;

begin
  write('a = ');
  readln(num1);
  a := getArray(num1);
  write('b = ');
  readln(num2);
  b := getArray(num2);
  write('c = ');
  readln(num3);
  c := getArray(num3);
  ab := sum(a, b);
  sum1 := getString(ab);
  writeln('a + b = ', sum1);
  abc := sum(ab, c);
  sum2 := getString(abc);
  write('a + b + c = ', sum2);
end.