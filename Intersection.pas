//индекс выходит за пределы массива, но пересечение программа находит 

program two_arrays;

const
  n = 4;

var
  i, j: integer;
  a: array[1..n] of integer;
  b: array[1..n] of integer;

begin
  writeln('First array:');
  for i := 1 to n do
  begin
    read(a[i]); 
  end;
  
  writeln('Second array:');
  for i := 1 to n do
  begin
    read(b[i]); 
  end;
  
  i := 1;
  j := 1;
  while (i <> n+1) or (j <> n+1) do 
  begin
    if a[i] = b[j] then
    begin
      write(a[i]);
      if a[i + 1] > b[j + 1] 
      then j := j + 1
      else i := i + 1;
    end
    else 
    begin
      if a[i] > b[j] 
      then j := j + 1
      else i := i + 1;
    end
  end;
  if a[i]=b[j] then write 
end.