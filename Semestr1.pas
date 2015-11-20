program i_k;

var
  a1, a2, a3, h, b, x, y: real;
  n, j: integer;

function f(a, x: real): real;
begin
  result := 0.8 + (2 * sin(x)) + (5.5 * sin(a) * sin(a));
end;

begin
  write('h=');read(h);
  write('b=');read(b);
  write('n=');read(n);
  write('a1=');read(a1);
  write('a2=');read(a2);
  write('a3=');read(a3);
  x := b + h;
  for j := 2 to n do
  begin
    x := b + j * h;
    write(f(a1, x), ' ');
  end;
  writeln();writeln();
  for j := 2 to n do
  begin
    x := b + j * h;
    write(f(a2, x), ' ');
  end;
  writeln();writeln();
  for j := 2 to n do
  begin
    x := b + j * h;
    write(f(2, x), ' ');
  end;
  write(f(1, 1));
end.