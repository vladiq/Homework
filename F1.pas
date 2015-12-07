program f_1;

var
  name,wmax: string;
  lmax: integer;
  f1: text;


procedure find_lmax_wmax(var f1: text; var name: string; var lmax: integer; var wmax: string);
var
  w: string;
  i: integer;
  chr: char;
begin
  assign(f1, name);
  reset(f1);
  wmax := '';
  lmax := 0;
  w := '';
  i := 0;
  while not eof(f1) do
  begin
    read(f1, chr);
    if (chr <> ' ') then
    begin
      w := w + chr;
      i := i + 1;
    end else
    begin
      if (i > lmax) then 
      begin
        wmax := w;
        lmax := i;
      end;  
      w := '';
      i := 0;
    end;
  end;
  if (i > lmax) then 
  begin
    wmax := w;
    lmax := i;
  end; 
  close(f1);
end;

begin
  write('Enter the file name: ');
  readln(name);
  find_lmax_wmax(f1, name, lmax, wmax);
  writeln('The longest word: ',wmax );
  writeln('Length of the longest word: ',lmax);
end.