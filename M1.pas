program M1;

const
  n = 3;

const
  m = 3;

type
  matrix = array [1..n, 1..m] of real;
  narray = array [1..n] of real;
  marray = array [1..m] of real;

var
  A: matrix;

procedure read_matrix(var A: matrix);
var
  i, j: integer;
begin
  for i := 1 to n do 
  begin
    for j := 1 to m do 
    begin
      read(A[i, j]);
    end;
  end;
end;

procedure write_matrix(var A: matrix);
var
  i, j: integer;
begin
  for i := 1 to n do 
  begin
    for j := 1 to m do 
    begin
      write(A[i, j], ' ');
    end;
    writeln();
  end;
end;

function find_imax(var A: matrix; var i: integer): real;
var
  j: integer;
begin
  result := A[i, 1];
  for j := 2 to m do
  begin
    if A[i, j] > result then
    begin
      result := A[i, j];
    end;
  end;
end;

function find_imin(var A: matrix; var i: integer): real;
var
  j: integer;
begin
  result := A[i, 1];
  for j := 2 to m do
  begin
    if A[i, j] < result then
    begin
      result := A[i, j];
    end;
  end;
end;

function find_jmax(var A: matrix; var j: integer): real;
var
  i: integer;
begin
  result := A[1, j];
  for i := 2 to n do
  begin
    if A[i, j] > result then
    begin
      result := A[i, j];
    end;
  end;
end;

function find_jmin(var A: matrix; var j: integer): real;
var
  i: integer;
begin
  result := A[1, j];
  for i := 2 to n do
  begin
    if A[i, j] < result then
    begin
      result := A[i, j];
    end;
  end;
end;

procedure find_saddle_points(A: matrix);
var
  i, j: integer;
  imax, imin: narray;
  jmax, jmin: marray;
begin
  for i := 1 to n do
  begin
    imax[i] := find_imax(A, i);
  end;
  for i := 1 to n do
  begin
    imin[i] := find_imin(A, i);
  end;
  for j := 1 to m do
  begin
    jmax[j] := find_jmax(A, j);
  end;
  for j := 1 to m do
  begin
    jmin[j] := find_jmin(A, j);
  end;
  for i := 1 to n do
  begin
    for j := 1 to m do
    begin
      if ((A[i, j] = imax[i]) and (A[i, j] = jmin[j])) then
      begin
        write(A[i, j], '(', i, ',', j, ') ')
      end else
      begin
        if ((A[i, j] = imin[i]) and (A[i, j] = jmax[j])) then
        begin
          write(A[i, j], '(', i, ',', j, ') ')
        end
      end;
    end;
  end;
end;


begin
  read_matrix(A);
  write_matrix(A);
  find_saddle_points(A);
end.