set SERVEROUTPUT on;
clear screen;

create or replace procedure get_employee
as

v_first_name employee.first_name%type;
v_salary employee.salary%type;

cursor c1 is select first_name , salary from employee where ROWNUM<=5   order by salary desc;

begin

 open c1;
 
 loop
 
 fetch c1 into v_first_name, v_salary;
 exit when c1%notfound;
 
   dbms_output.put_line ( v_first_name || ' - ' || v_salary );
 
 end loop;
 
 close c1;

end;

--to run the above procedure use belo code

exec get_employee;

