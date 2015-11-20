program KMP;

var
   i,m,n,k, index: integer;
  smallArr: array of integer;
  bigArr: array of integer;
  prefArr: array of integer;

procedure create_arr(var s: array  of integer; len:integer);
var
  i: integer;
begin
  setlength(s,len);
  for i:=0 to len-1 do
  read(s[i]);
end;

function prefix(var s: array of integer; const m: integer): array of integer;
var
  i, k: integer;
label 1;
begin
  setlength(result,length(s));
  result[0] := 0;
  k := 0;
  for i := 0 to m - 2 do
  begin
    1: if (s[i+1] = s[result[i]]) then
      result[i + 1] := result[i] + 1
    else
    if (k = 0) then 
      result[i + 1] := 0
      else
    begin
      k := result[i];
      goto 1;
    end;
  end;
end;

begin
  write('Length of small array: ');
  read(m);
  create_arr(smallarr,m);
  write('Length of big array: ');
  read(n);
  create_arr(bigarr,n);
  prefArr:=prefix(smallarr,m);
  k:=0;
  index:=-1;
  for i:=0 to length(bigArr) do
  begin
    while (k > 0) and (smallArr[k] <> bigArr[i]) do
    begin
      k := prefArr[k-1];
    end;
    if (smallArr[k] = bigArr[i]) then k := k + 1;
    if (k = length(smallArr)) then
    begin
      index := i - length(smallArr) + 1;
      break;
    end;
  end;
  write(index);
end.