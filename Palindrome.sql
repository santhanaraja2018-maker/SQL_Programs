

set serveroutput on;
clear screen;

declare 

  a varchar2 (50) := '&a';
  b varchar2 (50) ;
   

begin
  
  
  for i in reverse 1 .. length(a)  loop
   b := b || substr (a,i,1);
   end loop;
   
   if (a=b) then
   
  
   dbms_output.put_line ('The given string ' || a ||' is palindrome');
   
   else
   dbms_output.put_line ('The given string  ' || a ||' is not palindrome');
   
   end if;
  


end;
/