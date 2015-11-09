program prime_number3;

const n =1000000;

var i,p,notp: integer; 
num: array[2..n]  of integer;


begin

for i:= 2 to n do    
begin
  num[i]:=i;
end;                 

p:=2;                  //p - переменная, которой будем присваивать простые числа
write(p,' ');          //вывод первого простого числа

while (p<>0) do      
begin
  
  notp:=2*p;     // notp - число, которое точно не является простым, так как делится на p (простое число текущей итерации основного цикла) 
  while (notp<=n) do    //цикл, в котором обнуляем (вычеркиваем) эти точно непростые числа
  begin
    num[notp]:=0;  
    notp:=notp+p;  
  end;
  
  for i:=p+1 to n do   //цикл, в котором ищем первый ненулевой элемент, который больше p (текущего простого числа), и выводим его 
  begin
    if (num[i]<>0) then 
    begin
      p:=num[i];
      write(p,' ');
      break;
    end;
  end;
  
end;
end.