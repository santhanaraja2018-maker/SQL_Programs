
set SERVEROUTPUT ON;
clear screen;
declare

 a BOOLEAN:= TRUE;
 b BOOLEAN := FALSE;
 
BEGIN
 if (a and b) then 
 
   dbms_output.put_line('line1');
  end if;
  
  if (a or b) then 
 
   dbms_output.put_line('line2');
  end if;
  
  
  if (not a) then 
 
   dbms_output.put_line('line3');
   
   else 
   dbms_output.put_line('line4');
  end if;
  
  if (not b) then 
 
   dbms_output.put_line('line5');
   
   else 
   dbms_output.put_line('line6');
  end if;

  
end;
/
