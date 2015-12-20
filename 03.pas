program O3;

const
  n = 6;

type
  arr = array[1..n] of integer;

procedure read_array(var a: arr);
var
  i: integer;
begin
  for i := 1 to n do
  begin
    read(a[i]); 
  end;
end;

procedure show_array(var a: arr);
var
  i: integer;
begin
  for i := 1 to n do
  begin
    write(a[i], ' '); 
  end;
end;

procedure sort_array(var a: arr);
var
  i, k, b: integer;
begin
  i := 1;
  while (i < n) do
  begin
    while (i < n) and (a[i + 1] > a[i]) do
    begin
      i := i + 1;
    end;
    b := a[i + 1];
    k := i + 1;
    while (i >= 1) and (b < a[i]) do
    begin
      a[i + 1] := a[i];
      i := i - 1;
    end;
    a[i + 1] := b;
    i := k;
  end;
end;

var
  a: arr;

begin
  read_array(a);
  sort_array(a);
  show_array(a);
end.