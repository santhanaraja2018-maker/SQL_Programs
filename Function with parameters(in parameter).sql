
set serveroutput on;
clear screen;

create or replace function emp_salary (v_emp_id in number)

return number
as

v_salary number(10);
v_revised_salary number(16);

begin

 select salary into v_salary from employee where emp_id=v_emp_id;
 
 if (v_salary > 30000) then
 
  v_revised_salary := v_salary+(v_salary*0.3);
  
  else 
  v_revised_salary := v_salary+(v_salary*0.5);
  end if;

 return v_revised_salary;
end;

--to execute the function we need to run below code

select EMP_salary (102) from dual;


-- we also can also this user_defined function as follow

select emp_id,first_name,salary, EMP_salary (emp_id) as INC_SALARY from employee;
