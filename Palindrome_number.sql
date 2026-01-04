
set serveroutput on;
clear screen;

declare
   
   n Number := &n;
   temp Number := n;
   rev Number := 0;
   digit Number;
 
 begin
 
   while temp>0 loop
  digit := mod(temp,10);
  rev := (rev*10)+ digit;
  temp := floor (temp/10);
 end loop;
 
 if (n = rev) then
  dbms_output.put_line ('The number is Palindrome');
  
  else 
  dbms_output.put_line ('The number is not Palindrome');
 
 end if;
 end;
 /
 
 
 
 