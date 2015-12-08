program ekz2;

var
  sq: array of integer;

procedure readSequence(var sq: array of integer);
var
  i, n: integer;
begin
  write('Length of sequence: ');
  read(n);
  setlength(sq, n);
  for i := 0 to n - 1 do 
  begin
    read(sq[i]);
  end;
end;

function isPeriodicity(var sq: array of integer): integer;
var
  i, k: integer;
begin
  i := 1;
  k := 0;
  while i < length(sq) do 
  begin
    if (sq[0] = sq[i]) then
    begin
      k := i;
      while i < length(sq) do 
      begin
        if (sq[i] <> sq[i - k]) then
        begin
          k := 0;
          break;
        end;
        i := i + 1;
      end;
    end;
    i := i + 1;
  end;
  if (k > length(sq) div 2)  then 
  begin
    k := 0; 
  end;
  result := k;
end;

begin
  readSequence(sq);
  write('Length of period: ', isPeriodicity(sq));
end.