program o3;

const n = 4;

type 
  arr = array [1..n] of real;
  
procedure difference_of_arrays(var a: arr; var b: arr; var ab: array of real);
var
  i,j,k: integer;
begin
  setlength(ab,n*2);
  i:=1;
  j:=1;
  k:=0;
  while (i<=n) and (j<=n) do
  begin 
    if (a[i]=b[j]) then
    begin
      i:=i+1;
      j:=j+1;
    end 
    else
    begin
      if (a[i]>b[j]) then
      begin
        ab[k]:=b[j];
        k:=k+1;
        j:=j+1;
      end
      else
      begin
        ab[k]:=a[i];
        k:=k+1;
        i:=i+1;
      end;
    end;
  end;
  if a[n]>b[n] then ab[k]:=a[n];
  if a[n]<b[n] then ab[k]:=b[n];
  setlength(ab,k+1);
end;

procedure read_array(var a: arr);
var
  i: integer;
begin
  for i:=1 to n do
  begin
    read(a[i]);
  end;
end;

var
  a,b: arr;
  ab: array of real;
  
begin
  writeln('First array: ');
  read_array(a);
  writeln('Second array: ');
  read_array(b);
  writeln('Difference of arrays: ');
  difference_of_arrays(a,b,ab);
  write(ab);
end.
