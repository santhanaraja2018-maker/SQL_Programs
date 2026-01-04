
set serveroutput on;
clear screen;


create  or replace procedure multiply (x in out number)
as

begin 

x:= x*5;

end;


-- The below code must be runned to execute the above procedure...

declare
x number;
begin

x:=8;
multiply (x) ;
dbms_output.put_line('Multiplication : ' || x);

end;

