
set serveroutput on;
clear screen;

create  materialized view employee_view
build immediate
refresh complete
start with trunc( sysdate)+ 2/24
next trunc( sysdate+1)+ 2/24
as

select * from employees;

select * from employee_view;


commit;