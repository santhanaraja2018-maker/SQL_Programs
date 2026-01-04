

setserveroutputon;
clear screen;

declare 

  num1 constant number (10,2) :=10;
  num2 number(10);
  num3 number(10) not null :=0;
  result number (10);
  
  begin
  
  num2:=null;
  num3:=&num3;
  result:= NVL (num1,0)+NVL (num2,0)+NVL (num3,0); --(NVL is used to remove null, without nvl the result will be null)
  
  dbms_output.put_line('The addition of numbers are : ' || result);

end;