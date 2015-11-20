program prime_numbers;

const
  n = 1000000;

var
  i, p, notp: integer; 
  num: array[2..n]  of integer;


begin
  
  for i := 2 to n do    
  begin
    num[i] := i;
  end;                 
  
  p := 2;            //p - переменная, которой будем присваивать простые числа
  write(p, ' ');    //вывод первого простого числа
  
  while (p <> 0) do      
  begin
    notp := 2 * p;         // notp - число, которое делится на p 
    while (notp <= n) do //цикл, в котором обнуляем эти точно непростые числа
    begin
      num[notp] := 0;  
      notp := notp + p;  
    end;
    for i := p + 1 to n do //цикл, в котором ищем первый ненулевой элемент, 
    begin          //который больше p (текущего простого числа), и выводим его 
      if (num[i] <> 0) then 
      begin
        p := num[i];
        write(p, ' ');
        break;
      end;
    end; 
  end;
end.