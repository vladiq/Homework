program f_1;

var
  name: string;
  f: text;

function str_to_int(var str: string): integer;
var
  i, dig: integer;
begin
  dig := 1;
  for i := length(str) downto 1 do
  begin
    result := result + (integer(str[i]) - integer('0')) * dig;
    dig := dig * 10;
  end;
end;

function get_sum(var f: text; var name: string): integer;
var
  a: integer;
  chr: char;
  str: string;
begin
  result := 0;
  assign(f, name);
  reset(f); 
  while not eof(f) do
  begin
    chr := 'a';
    str := '';
    while (chr <> ' ') and (not eof(f)) do
    begin
      read(f, chr);
      if (chr <> ' ') then  str := str + chr;
    end;
    a := str_to_int(str);
    result := result + a;
  end;
  close(f);
end;

begin
  write('Enter the file name: ');
  readln(name);
  writeln('Sum: ', get_sum(f, name));
end.