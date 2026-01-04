set serveroutput on;
clear screen;

declare
  type nt_salary_type is table of number (10);   -- to define data type of an user defined variable in bulk collect method (composite variable method)
  nt_salary nt_salary_type := nt_salary_type();  

begin
  select salary bulk collect into nt_salary from employee;  -- to fetch more than one row we can use bulk collect using composite variable method
 
 
   for i in nt_salary.first .. nt_salary.last
   
   loop
       dbms_output.put_line (nt_salary(i));
   end loop;

end;