program a3;

procedure find_max_step();
var
  k, a, b, max: integer;

begin
  writeln('Enter the elements of sequence (the last element is 0):');
  k := 1;
  max := 0;
  read(a);
  while a <> 0 do 
  begin
    read(b);
    if (a < b) then
    begin
      k := k + 1;
    end else
    begin
      if (k > max) then
      begin
        max := k;
      end;
      k := 1;
    end;
    a := b;
  end;
  write('Maximum length of step: ', max);
end;
begin
  find_max_step();
end.