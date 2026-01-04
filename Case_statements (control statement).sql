

set serveroutput on;
clear screen;

declare

 v_salary number(10);
 v_employee_id number := &v_employee_id;

begin
  select salary into v_salary from employee where emp_id = v_employee_id;
  case
     when v_salary < 5000 then
     dbms_output.put_line ('The salary '|| v_salary || ' of employee id ' || v_employee_id || ' is low salary');
  
     when (v_salary > 5000 and v_salary < 10000) then
     dbms_output.put_line ('The salary '|| v_salary || ' of employee id ' || v_employee_id || ' is average salary');
     else
     dbms_output.put_line ('The salary '|| v_salary || ' of employee id ' || v_employee_id || ' is high salary');

  end case;
end;




