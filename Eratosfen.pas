program prime_number3;

const n =1000000;

var i,p,notp: integer; 
num: array[2..n]  of integer;


begin

for i:= 2 to n do    
begin
  num[i]:=i;
end;                 

p:=2;                  //p - ����������, ������� ����� ����������� ������� �����
write(p,' ');          //����� ������� �������� �����

while (p<>0) do      
begin
  
  notp:=2*p;     // notp - �����, ������� ����� �� �������� �������, ��� ��� ������� �� p (������� ����� ������� �������� ��������� �����) 
  while (notp<=n) do    //����, � ������� �������� (�����������) ��� ����� ��������� �����
  begin
    num[notp]:=0;  
    notp:=notp+p;  
  end;
  
  for i:=p+1 to n do   //����, � ������� ���� ������ ��������� �������, ������� ������ p (�������� �������� �����), � ������� ��� 
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