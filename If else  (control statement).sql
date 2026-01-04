
set SERVEROUTPUT ON;
clear screen;
declare

 a number := 10;
 b number := 20;
 
BEGIN
 if (a > b) then 
 
   dbms_output.put_line(a ||' is greater than '|| b);
   
   else 
   
   dbms_output.put_line(b ||' is greater than '|| a);
   
  end if;
  
  
  
end;
/
