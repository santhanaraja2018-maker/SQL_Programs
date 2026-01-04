set serveroutput on;

clear screen;

declare
  
  cursor c1 (no number) is select * from employee where emp_id = no;
  tmp employee%rowtype;
  
begin        
  
  for tmp in c1(102) loop
  
    dbms_output.put_line ('Employee_id : ' ||tmp.emp_id);
    dbms_output.put_line ('Employee_name : ' ||tmp.first_name || ' ' || tmp.last_name);
    dbms_output.put_line ('Employee_hire_date : ' ||tmp.emp_hire_date);
    dbms_output.put_line ('Employee_mail_id : ' ||tmp.email);
    dbms_output.put_line ('Employee_mobile_number  : ' ||tmp.phone_number);
    dbms_output.put_line ('Employee_salary: ' ||tmp.salary);
  
  end loop;
  
  
end;