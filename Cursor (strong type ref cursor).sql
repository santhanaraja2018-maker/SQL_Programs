
set serveroutput on;
clear screen;

declare    --to dynamically use ref cursor we are going for ref cursor

  type ref_cursor is ref cursor return employee%rowtype;
  
   rc_employee_list ref_cursor;
   v_emp_row employee%rowtype;
   
  begin
  
  open rc_employee_list for select * from employee;
  
  loop
  
  fetch rc_employee_list into v_emp_row;

   exit when rc_employee_list%notfound;
   
   dbms_output.put_line('Employee_name : ' ||v_emp_row.first_name || ' ' || v_emp_row.last_name);
   dbms_output.put_line('Employee_salary : ' ||v_emp_row.salary);
  
  end loop;
  
  close rc_employee_list;
  
  end;