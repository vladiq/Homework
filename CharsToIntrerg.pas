program CharsToNumber;

function isDigital(b: char): boolean;
begin
  result:= (b >= '0') and (b <= '9');
end;

function convertChar(b: char): integer;
begin
  result:= -1;
  if (isDigital(b)=true) 
  then result:= integer(b) - integer('0');
end;

function convertChars(var chr: array of char): integer;
var i, digit: integer;
begin
  
  digit:= 1;
  for i:= length(chr)-1 downto 0 do
  begin
    if (convertChar(chr[i])=-1) then 
    begin
      result:=-1;
      break;
    end;
    result:= result + (convertChar(chr[i]) * digit);
    digit:=digit*10;
  end;
end;

function test(var chr: array of char): integer;
begin
result:=length(chr);
end;
    
procedure readArr(var chr: array of char);
var i,n: integer;
begin
  write('Length of array: ');
  readln(n);
  setlength(chr, n);
  for i:= 0 to n-1 do
  begin
    readln(chr[i]);
  end;
end;


var chr: array of char;

begin
  readArr(chr);  
  write(convertChars(chr)); 
end.