program zadachaA1;

procedure readArr(var a: array of integer);
var
  i, n: integer;
begin
  write('Count of arrays: ');
  read(n);
  setlength(a, n);
  for i := 0 to n - 1 do
  begin
    read(a[i]);
  end;
end;

function findDivider(num: integer): array of integer; //находит все делители 
var                                             //числа, кроме 1 и самого числа
  i, j: integer;
  n: real;
begin
  setlength(result, num div 2);
  n := num div 2;
  i := 2;
  j := 0;
  while i <= n do
  begin
    if num mod i = 0 then 
    begin
      result[j] := i;
      j := j + 1;
    end;
    i := i + 1;
  end;
  setlength(result, j);
end;

function isPeriodicity(var sq: array of integer): boolean;
var
  i, j, k: integer;
  divider: array of integer;
  period: boolean;
begin
  divider := findDivider(length(sq));
  period := true;
  if (length(divider) >= 1) then
  begin
    for i := 0 to length(divider) - 1 do
    begin
      period := true;
      j := 0;
      while period and (j <> divider[i]) do 
      begin
        k := 1;
        while period and (k <= (length(sq) / divider[i] - 1)) do
        begin
          if (sq[j] <> sq[j + (divider[i] * k)]) then 
          begin
            period := false;
          end;
          k := k + 1;
        end;
        j := j + 1;
      end;
      if (period = true) then 
      begin
        break;
      end;
    end;
  end
  else
  begin
    period := true;
    i := 1;
    while period and (i <= length(sq)-1) do
    begin
      if (sq[0] <> sq[i]) then
      begin
        period := false;
      end;
      i := i + 1;
    end;
  end;    
  result := period;
end;

var
  sq: array of integer;

begin
  readArr(sq);
  write(sq);
  write(findDivider(length(sq)));
  write(isPeriodicity(sq));
end.