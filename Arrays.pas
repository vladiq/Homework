program arrays;

const
  endb = 5;

const
  ends = 3;

var
  i, j, pos: integer;
  big: array[1..endb] of integer;
  small: array[1..ends] of integer;

begin
  writeln('Big array:');
  for i := 1 to endb do
  begin
    read(big[i]);
  end;
  
  writeln('Small array:');
  for i := 1 to ends do
  begin
    read(small[i]);
  end; 
  
  pos := -1;
  for i := 1 to (endb - ends) do 
  begin
    if (small[1] = big[i]) then 
    begin
      j := 0;
      while (j <> ends - 1) do
      begin
        j := j + 1;
        if (small[1 + j] <> big[i + j]) then break;
      end;
      if (j = ends - 1) then
      begin
        pos := i;
        break;
      end;
    end
  end;
  writeln(pos);
end.