program vlad_is_cool;

const n = 1000;

type 
  mass = array [1..n] of boolean;
  
var
  i: integer;
  a: mass;
  
procedure delete_all(var a: mass);
var
  i: integer;
begin
  for i:=1 to n do
  begin
    a[i]:=false;
  end;
end;
  
procedure add(var a: mass; i: integer);
begin
  if (i>0) and (i<n+1) then
  begin
    a[i]:= true;
  end;
end;

procedure delete(var a: mass; i: integer);
begin 
  if (i>0) and (i<n+1) then
  begin
    a[i]:= false;
  end;
end;

function is_belong(var a: mass; i: integer): boolean;
begin
  result:= a[i];
end;

begin;
delete_all(a);
readln(i);
add(a,i);
writeln('Is belong: ',is_belong(a,i));
readln(i);
delete(a,i);
writeln('Is belong: ',is_belong(a,i));
end.
