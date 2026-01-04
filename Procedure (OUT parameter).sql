
set serveroutput on;
clear screen;


create  or replace procedure addition (n1 in number, n2 in number, total out number)
as

begin 

total := n1+n2;

end;

-- The below code must be runned to execute the above procedure...

declare
x number;
begin

addition(23,56,x) ;
dbms_output.put_line('Total : ' || x);

end;

