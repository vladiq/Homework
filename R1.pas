program R1;

const n = 4;

type
  rational = record
    numerator: integer;
    denominator: integer;
  end;
  coefficients = array [1..n] of rational;
  
var 
  a: coefficients;
  x,f: rational;

procedure read_coefficients(var a: coefficients);
var
  i: integer;
begin
  for i:=1 to n do begin
    write(i,' Numerator : ');
    read(a[i].numerator);
    write('  Denominator : ');
    read(a[i].denominator);
  end;
end;

function sum_rational(a,b: rational): rational;
var
  i: integer;
begin
  result.denominator:= a.denominator*b.denominator;
  result.numerator:= a.numerator*b.denominator + a.denominator*b.numerator;
  if (abs(result.denominator)>1) then begin
    for i:=2 to result.denominator div 2 do begin
      if (result.denominator mod i = 0) then begin
        if (result.numerator mod i = 0) then begin
          result.numerator:= result.numerator div i;
          result.denominator:= result.denominator div i
        end;
      end;
    end;
    if (result.numerator mod result.denominator = 0) then begin
      result.numerator:= result.numerator div result.denominator;
      result.denominator:= result.denominator div result.denominator;
    end;
  end;
end;

function consider_f(var a: coefficients; var x: rational): rational;
var
  i: integer;
begin
  result.numerator:=a[n].numerator;
  result.denominator:=a[n].denominator;
  for i:=n-1 downto 1 do begin
    result.numerator:= result.numerator*x.numerator;
    result.denominator:= result.denominator*x.denominator;
    result:=sum_rational(result,a[i]);
  end;
end;
  
begin
  read_coefficients(a);
  write('Numerator x: ');
  readln(x.numerator);
  write('Denominator x: ');
  readln(x.denominator);
  f:= consider_f(a,x);
  write('f(',x.numerator,'/',x.denominator,') = ',f.numerator,'/',f.denominator);
end.
   
   
