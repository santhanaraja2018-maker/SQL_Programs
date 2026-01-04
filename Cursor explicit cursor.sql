set serveroutput on;
clear screen;

declare

vemp_salary employee.salary%type;
cursor c1 is select salary from employee;  --cursor declaration

begin

 open c1;                     --open cursor
 
 
 
 fetch c1 into vemp_salary;        --fetch value from cursor pointer
 dbms_output.put_line(vemp_salary);


 fetch c1 into vemp_salary;
 dbms_output.put_line(vemp_salary);
 
 fetch c1 into vemp_salary;
 dbms_output.put_line(vemp_salary); 
 
 
 
  dbms_output.put_line('Total number of records fetched '||c1%rowcount);
 
 close c1;                          -- close cursor
 
end;