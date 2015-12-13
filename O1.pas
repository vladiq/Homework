program o1;

const
  n = 7;

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
  i, j, k,v: integer;
begin
  for i := n downto 2 do
  begin
    for j := 2 to i do
    begin
      if a[j] < a[j-1] then
      begin
        k := a[j];
        a[j] := a[j - 1];
        a[j - 1] := k;
      end;
    end;
  end;
end;

begin
  read_array(a);
  sorting(a);
  write(a);
end.