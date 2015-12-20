program two_arrays;

procedure read_array(var a: array of integer);
var
  i, l: integer;
begin
  write('Enter the length of array: ');
  readln(l);
  setlength(a, l);
  for i := 0 to l - 1 do
  begin
    readln(a[i]); 
  end;
end;

function int_to_str(a: integer): string;
var
  dig, i: integer;
  num: string;
begin
  if a=0 then result:='0';
  while a <> 0 do 
  begin
    dig := a mod 10;
    num := num + char(dig + integer('0'));
    a := a div 10;
  end;
  for i := length(num) downto 1  do
  begin
    result := result + num[i];
  end;
end;

procedure array_to_file(var a: array of integer; var f: text; var name: string);
var
  i: integer;
  num: string;
begin
  assign(f, name);
  rewrite(f);
  for i := 0 to length(a) - 1 do
  begin
    write(f, int_to_str(a[i]), ' ');
  end;
  close(f);
end;

var
  i: integer;
  a: array of integer;
  name: string;
  f: text;

begin
  read_array(a);
  write('Enter the file name: ');
  readln(name);
  array_to_file(a, f, name);
  write('File created');
end.