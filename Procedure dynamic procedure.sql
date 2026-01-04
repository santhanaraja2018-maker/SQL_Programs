--dynamic procedure

set serveroutput on;
clear screen;


create or replace procedure addition_procedure (num1 in number, num2 in number)
as 


 total1 number(10);
begin 
 
 total1:=num1+num2;
dbms_output.put_line('The addition of two numbers '||total1);
end;


 /*it can be called by following ways
  exec addition_procedure (23,45);
  
  execute addition_procedure (6,5);
  
  begin
   addition_procedure (60,57);
end;

*/
  
  
  