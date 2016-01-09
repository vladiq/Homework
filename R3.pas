program R3;

type
  coordinate = record
    x: real;
    y: real;
  end;

function find_r(a: coordinate): real; 
begin
  result:=a.x*a.x + a.y*a.y;
end;
 
function is_on_round(var f: file of coordinate; name: string): boolean;
var 
  a: coordinate;
  r: real;
begin
  assign(f,name);
  reset(f);
  read(f,a);
  r:= find_r(a);
  read(f,a);
  while not (eof(f)) and (abs(find_r(a)-r)<0.000001) do begin
    read(f,a);
  end;
  if eof(f) and (abs(find_r(a)-r)<0.000001) then begin
    result:=true;
  end else begin
    result:=false;
  end;
end;  

var
  f: file of coordinate;
  name: string;

begin
  write('Enter the file name:');
  read(name);
  writeln('All points are on the round: ',is_on_round(f,name));
end.