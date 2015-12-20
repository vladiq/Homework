program o3;

function is_include(var big, small: array of real): boolean;
var
  i,j: integer;
begin
  i:=0;
  j:=0;
  while (j<length(small)) and (i<length(big)) do
  begin
    while (i<length(big)) and (j<length(small)) and (big[i]=small[j]) do
    begin
      i:=i+1;
      j:=j+1;
    end;
  i:=i+1;
  end;
  if j=length(small) then result:=true
  else result:=false;
end;

procedure read_array(var a: array of real);
var
  i,l: integer;
begin
  write('Length of array: ');
  read(l);
  setlength(a,l);
  for i:=0 to length(a)-1 do
  begin
    a[i]:=i
  end;
end;

var
  big: array of real;
  small: array of real;

  
begin
  writeln('Big array: ');
  read_array(big);
  writeln('Small array: ');
  read_array(small);
  writeln('A big array includes a small array: ',is_include(big,small));
end.
