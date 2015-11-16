//ВАЖНО!!! number - число, numeral - цифра
program megaSumator; 

type num = record
    number: string; //само число
    numeral: array of integer;  //массив из цифр числа
end;

var a,b,c,sum1,sum2: num;
i: integer;

procedure getNumeral(var v: num);
var i: integer;
begin
  setlength(v.numeral, length(v.number));
  for i:= 1 to length(v.number) do
  begin 
    v.numeral[i-1]:= ord(v.number[i])-48;
  end;
end;

procedure invertNumber(var a: num);
var i: integer;
m: char;
begin
  for i:= 1 to (length(a.number) div 2) do
    begin 
      m:= a.number[i];
      a.number[i]:= a.number[length(a.number)-i+1];
      a.number[length(a.number)-i+1]:= m;
    end;
end;

function getSum(a: num; b: num): num;
var i,n,ab: integer;
begin
  if (length(a.number) >= length(b.number))
  then 
  begin
    n:= length(b.number);
    result.number:= a.number;
  end
  else 
  begin
    n:= length(a.number);
    result.number:= b.number;
  end;
  ab:=0;
  for i:= 1 to n do
  begin
    if (ab < 10)
    then ab:= a.numeral[i-1] + b.numeral[i-1]
    else ab:= a.numeral[i-1] + b.numeral[i-1] + 1;
    result.number[i]:= chr((ab mod 10)+48);
  end;
  if (length(a.number)) <> (length(b.number))
  then result.number[n+1]:= chr(ord(result.number[n+1]) + (ab div 10))
  else result.number:= result.number + ord(ab div 10);
end;

begin
  write('a = ');
  readln(a.number);
  invertNumber(a);
  getNumeral(a); 

  write('b = ');
  readln(b.number);
  invertNumber(b);
  getNumeral(b); 

  write('c = ');
  readln(c.number);
  invertNumber(c);
  getNumeral(c); 

  sum1:=getSum(a,b);
  getNumeral(sum1);
  sum2:=getSum(sum1,c);
  invertNumber(sum1);
  invertNumber(sum2);
  writeln('a + b = ',sum1.number);
  writeln('a + b + c = ',sum2.number);
end.
  
  
    
  
  
  