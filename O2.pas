program two_arrays;

const
  n = 6;

type
  arr = array[1..n] of integer;

var
  a: arr;

procedure read_array(var a: arr);
var
  i: integer;
begin
  for i := 1 to n do
  begin
    read(a[i]); 
  end;
end;

procedure sorting(var a: arr);
var
  i, j, k, max, jmax: integer;
begin
  for i := n downto 2 do
  begin
    max := a[1];
    jmax := 1;
    for j := 2 to i do
    begin
      if a[j] > max then
      begin
        max := a[j];
        jmax := j;
      end;
    end;
    k := a[i];
    a[i] := max;
    a[jmax] := k;
  end;
end;

begin
  read_array(a);
  sorting(a);
  writeln(a);
end.