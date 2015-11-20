program i_k;

var
  a, h, b, x, max, min: real;
  n, i, j: integer;
  y: array [,] of real;

function f(a, x: real): real;
begin
  result := 0.8 + (2 * sin(x)) + (5.5 * sin(a) * sin(a));
end;

function fi(var y: array [,] of real; i: integer): real;
var
  j: integer;
begin
  min := y[0, i];
  for j := 1 to (n - 1) do
  begin
    if (y[j, i] < min) then
    begin
      min := y[j, i];
    end;
  end;
  result := min;
end;

function psi(var y: array [,] of real; i: integer): real;
var
  j: integer;
begin
  max := y[0, i];
  for j := 1 to (n - 1) do
  begin
    if (y[j, i] > max) then
    begin
      max := y[j, i];
    end;
  end;
  result := max;
end;

begin
  write('h=');read(h);
  write('b=');read(b);
  write('n=');read(n);
  setlength(y, n, 3);
  for i := 0 to 2 do
  begin
    write('a', i + 1, '=');
    read(a);                 //Вводим а1, а2, а3
    for j := 0 to (n - 1) do
    begin
      x := b + (j - 1) * h;  //Находим хj
      y[j, i] := f(a, x);
    end;
    writeln('fi=', fi(y, i), ', psi=', psi(y, i));
  end;
  write(y);
end.