set serveroutput on;
clear screen;


declare

type emp_collect is table of employee.salary%type;
emp_sal emp_collect;

begin 

  select salary bulk collect into emp_sal from employee;
  
  end;
  /