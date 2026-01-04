

set serveroutput on;
clear screen;

declare 

  a number (30) := 0;
  b number (30) := 1;
  c number (30);
   

begin
  
  dbms_output.put_line ('Fibonacci Series : ');
  
  for i in  1 .. 5  loop
  
  
   c := a+b;
   dbms_output.put_line ( c );
   a := b ;
   b := c ;
   end loop;
   
   


end;
/