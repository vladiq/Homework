program finder;

const
  m = 10;

const
  n = 3;

var
  i, index, k: integer;
  b: array[0..m - 1] of integer;
  s: array[0..n - 1] of integer;

begin
  writeln('big array: ');
  for i := 0 to m - 1 do
  begin
    read(b[i]);
  end; 
  
  writeln('little array: ');
  for i := 0 to n - 1 do
  begin
    read(s[i]);
  end;
  
  index := -1;
  k := 0;
  for i := 0 to m do
  begin
    if s[k] = b[i] then k := k + 1
    else k := 0;
    if k = 3 then
    begin
      index := i - 2;
      break;
    end;
  end;
  write(index);
end.