set serveroutput on;

clear screen;

declare

  vemp_name employee.first_name%type;
  vemp_salary employee.salary%type;

 Cursor c1 is select first_name, salary  from employee where emp_id = 101;
  Cursor c2 is select first_name, salary  from employee where emp_id = 102;



begin        
  
  open c1;
  
  loop
   
   fetch c1 into vemp_name,vemp_salary;
   exit when c1%notfound;
   
   dbms_output.put_line (vemp_name || ' - ' || vemp_salary);
  
  end loop;
   close c1;
   
   open c2;
   loop
   fetch c2 into vemp_name, vemp_salary;
   exit when c2%notfound;
   
   dbms_output.put_line (vemp_name || ' - ' || vemp_salary);
   
   end loop;
   close c2;

end;