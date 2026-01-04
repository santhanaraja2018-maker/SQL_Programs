set SERVEROUTPUT on;
clear screen;

declare

   v_salary employee.salary%type;

begin
  
  select salary into v_salary from employee where emp_id=205;
  
  dbms_output.put_line ( 'The salary of the employee is ' ||v_salary);

  EXCEPTION
  
  when no_data_found then --inbuilt exception
  
   dbms_output.put_line ( 'No data found ');
  
  when too_many_rows then  --inbuilt exception
  
  dbms_output.put_line ( 'Many rows returened from base table ');
  

end;