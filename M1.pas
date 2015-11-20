program transpose_matrix;

const
  n = 3;

type
  matrix = array [1..n, 1..n] of integer;

var
  a: matrix;


procedure read_matrix(var a: matrix);
var
  j, i: integer;
begin
  for i := 1 to n do 
  begin
    for j := 1 to n do 
    begin
      read(a[i, j]);
    end;
  end;
end;

function transp_matrix(var a: matrix): matrix;
var
  i, j, m: integer;
begin
  for i := 1 to n  do
  begin
    for j := 1 to n  do
    begin
      if (j > i) then 
      begin
        m := a[i, j];
        a[i, j] := a[j, i];
        a[j, i] := m;
      end;
    end;
  end;
  result := a;
end;

procedure show_matrix(var a: matrix);
var
  i, j: integer;
begin
  for i := 1 to n do 
  begin
    writeln();
    for j := 1 to n do
    begin
      write(a[i, j], ' ');
    end;
  end;
end;

begin
  read_matrix(a);
  transp_matrix(a);
  show_matrix(a);
end.