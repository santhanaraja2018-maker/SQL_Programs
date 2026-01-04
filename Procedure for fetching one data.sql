
set serveroutput on;
clear screen;


create  or replace procedure total_salary (in_emp_id in number)
as

 v_salary number(10);
begin 

  select salary + 10000 into v_salary from employee where emp_id = in_emp_id;
  
  dbms_output.put_line('Total salary : ' || v_salary);

end;


-- The below code must be runned to execute the above procedure...

exec total_salary (102);

