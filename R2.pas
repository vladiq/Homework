program OF1;

type
  coordinate = record
    r: real;
    f: real;  
  end;
  
function find_k(var a1,a2: coordinate);
begin
  result:=(a2.r*sin(a2.f) - a1.r*sin(a1.f))/(a2.r*cos(a2.f) - a1.r*cos(a1.f));
end;

function is_on_straight(var f1: file of coordinate; name1: string): boolean;
var
  a1,a2: coordinate;
  k: real;
begin
  assign(f1,name1);
  reset(f1);
  read(f1,a1);
  read(f1,a2);
  k:=find_k(a1,a2);
  read(f1,a1);
  read(f1,a2);
  while (not eof(f1)) and (abs(k - find_k(a1,a2))<0.000001) do begin
    read(f1,a1);
    read(f1,a2);
  end;
  if (eof(f1)) and (abs(k - find_k(a1,a2))<0.000001) then begin
    result:=true
  end else begin
    result:=false;
  end;
  close(f1);
end;

var 
  f1: file of coordinate;
  name1: string;

begin
  write('Enter the file name of the file: ');
  readln(name1);
  write('All points are on the one straight: ',is_on_straight(f1,name1));
end.