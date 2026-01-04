

set serveroutput on;
clear screen;

declare
    vemp_name employee.first_name%type;
    vemp_salary employee.salary%type;
    cursor c1 is select first_name,salary from employee;  --cursor declaration

begin
     open c1;                     --open cursor 
         loop
             fetch c1 into vemp_name,vemp_salary;        --fetch value from cursor pointer
             exit when c1%notfound;
             dbms_output.put_line(vemp_name ||' - ' || vemp_salary);
         end loop;
             dbms_output.put_line('Total number of records fetched '||c1%rowcount);
     close c1;                          -- close cursor 
end;