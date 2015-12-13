program two_arrays;

const
  n = 6;

type
  arr = array[1..n] of integer;

var
  a: arr;
  b: integer;

label 1;  //just for usability

procedure read_array(var a: arr);
var
  i: integer;
begin
  for i := 1 to n do
  begin
    read(a[i]); 
  end;
end;

function find_i(var a: arr; var b: integer): integer;
var
  i, part: integer;
  found: boolean;
begin
  found := false;
  i := n div 2;
  part := n div 2;
  while not found do
  begin
    if (part <> 0) then
    begin
      part := part div 2;
    end 
    else
    begin
      part := 1;
    end;
    if (a[i] > b) then 
    begin
      i := i - part;
    end 
    else
    begin
      if a[i] <> b then
      begin
        i := i + part;
      end 
      else
      begin
        found := true;
      end;
    end;
    result := i;
  end;
end;

begin
  writeln('Array: ');
  read_array(a);
  1: write('That you are looking for: ');
  readln(b);
  writeln('i: ',find_i(a, b));
  if (b <> -1) then
  begin
    goto 1;
  end;
end.