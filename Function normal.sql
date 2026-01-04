
set serveroutput on;
CLEAR screen;

create or REPLACE function f_count
 return number
 
 AS
 v_count number;

begin

select count(*) into v_count from  employee;

return v_count;
end;


--to execute the function we need to run below code

select f_count() as Count_of_employees from dual;

