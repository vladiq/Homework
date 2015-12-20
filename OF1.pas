program OF1;

function is_include(var f1,f2: file of real;var name1,name2: string): boolean;
var
  a1,a2: real;
begin
  assign(f1,name1);
  assign(f2,name2);
  reset(f1);
  reset(f2);
  while (not (eof(f1))) and (not (eof(f2))) do
  begin
    read(f1,a1);
    read(f2,a2);
    if (a1<>a2) then reset(f2);
  end;
  if eof(f2) then result:= true
  else result:=false;
  close(f1);
  close(f2);
end;

var 
  f1,f2: file of real;
  name1, name2: string;

begin
  write('Enter the file name of a big file: ');
  readln(name1);
  write('Enter the file name of a small file: ');
  readln(name2);
  write('A big file includes a small file: ',is_include(f1,f2,name1,name2));
end.