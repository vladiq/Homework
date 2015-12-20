program OF1;

type
  coordinate = record
  x : real;
  y : real;
  end;
  
function is_on_straight(var f1: file of coordinate; name1: string): boolean;
var
  a: coordinate;
  k: real;
begin
  assign(f1,name1);
  reset(f1);
  read(f1,a);
  k:=(a.x/a.y);
  while (not eof(f1)) and (a.x/a.y=k) do begin
    read(f1,a);
  end;
  if (eof(f1)) and (a.x/a.y=k) then begin
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
  write('Enter the file name of the first file: ');
  readln(name1);
  write('All points are on the one straight: ',is_on_straight(f1,name1));
end.