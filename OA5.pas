program two_arrays;

const
  n = 4;

type
  arr = array[1..n] of real;

var
  i, j: integer;
  a, b: arr;

procedure read_array(var a: arr);
var
  i: integer;
begin
  for i := 1 to n do
  
  begin
    readln(a[i]); 
  end;
end;

procedure intersection(var a: arr; var b: arr);
var
  i, j: integer;
begin
  i := 1;
  j := 1;
  while (i <> n + 1) and (j <> n + 1) do 
  begin
    if a[i] > b[j] then
    begin
      j := j + 1;
    end 
    else
    begin
      if a[i] < b[j] then
      begin
        i := i + 1;
      end 
      else
      begin
        write(a[i],' ');
        i := i + 1;
        j := j + 1;
      end;
    end;
  end;
end;

begin
  writeln('First array:');
  read_array(a);
  writeln('Second array:');
  read_array(b);
  writeln(a);
  writeln(b);
  write('Intersection: ');
  intersection(a, b);
end.