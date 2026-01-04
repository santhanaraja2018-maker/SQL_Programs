
set serveroutput on;
clear screen;

declare    --to dynamically use ref cursor we are going for ref cursor

  type ref_cursor is ref cursor;
  
   rc_employee_list ref_cursor;
   v_first_name employee.first_name%type;
   v_email employee.email%type;
  
  begin
  
  dbms_output.put_line('This is first name of employees');
  
  open rc_employee_list for select first_name from employee;
  
  loop
  
  fetch rc_employee_list into v_first_name;

   exit when rc_employee_list%notfound;
   
   dbms_output.put_line(v_first_name);
  
  end loop;
  
  close rc_employee_list;
  
     dbms_output.put_line('This is mail id of employees');
  
  open rc_employee_list for select email from employee;
  
  loop
  
  fetch rc_employee_list into v_email;

   exit when rc_employee_list%notfound;
   
   dbms_output.put_line(v_email);
  
  end loop;
  
  close rc_employee_list;
  
  end;