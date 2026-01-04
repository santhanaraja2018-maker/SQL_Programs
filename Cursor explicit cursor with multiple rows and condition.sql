set serveroutput on;
clear screen;

declare

cursor c1 is select first_name,emp_id,salary from employee order by salary desc;  --cursor declaration

  emp_name employee.first_name%type;
  emp_id employee.emp_id%type;
  emp_salary employee.salary%type;

begin

 open c1;                     --open cursor
  
 loop
 fetch c1 into emp_name,emp_id,emp_salary;        --fetch value from cursor pointer
 
 exit when (c1%rowcount > 5)  or (c1%notfound);
 dbms_output.put_line(emp_id ||' - ' || emp_name || ' - ' || emp_salary);


 
 end loop;
 
  dbms_output.put_line('Total number of records fetched '||c1%rowcount);
 
 close c1;                          -- close cursor
 
end;
/