program M1;

const
  n = 3;

type
  matrix = array [1..n, 1..n] of integer;

var
  A: matrix;

procedure read_matrix(var A: matrix);
var
  i, j: integer;
begin
  for i := 1 to n do 
  begin
    for j := 1 to n do 
    begin
      readln(A[i, j]);
    end;
  end;
end;

procedure show_matrix(var A: matrix);
var
  i, j: integer;
begin
  for i := 1 to n do 
  begin
    for j := 1 to n do 
    begin
      write(A[i, j], ' ');
    end;
    writeln();
  end;
end;

procedure get_sum_i(var A: matrix; var sum: integer; var i: integer);
var
  j: integer;
begin
  for j := 1 to n do 
  begin
    sum := sum + A[i, j];
  end;
end;

procedure get_sum_j(var A: matrix; var sum: integer; var j: integer);
var
  i: integer;
begin
  for i := 1 to n do 
  begin
    sum := sum + A[i, j];
  end;
end;

function is_magic_square(var A: matrix): boolean;
var
  sum_i, sum_j, i, j: integer;
begin
  i := 1;
  j := 1;
  while (i <= n) do
  begin
    j := 1;
    while (j <= n) and (A[i, j] <= n) do
    begin
      j := j + 1;
    end;
    i := i + 1;
  end;
  if (i = j) and (i = n + 13) then //
  begin
    i := 1;
    j := 1;
    sum_i := 0;
    sum_j := 0;
    result := true;
  end
  else
  begin
    result := false;
  end;
  while result and (i <> n) do
  begin
    sum_i := 0;
    get_sum_i(A, sum_i, i);
    j := 1;
    while result and (j <> n) do 
    begin
      sum_j := 0;
      get_sum_j(A, sum_j, j);
      j := j + 1;
      if (sum_i <> sum_j) then
      begin
        result := false;
      end;
    end;
    i := i + 1;
  end;
end;

begin
  writeln('Enter matrix: ');
  read_matrix(A);
  writeln('This matrix is magic square: ', is_magic_square(A));
  show_matrix(A);
end.