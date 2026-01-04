
set serveroutput on;
clear screen;


create  or replace procedure greetings (p_name varchar2)
as

begin 

   dbms_output.put_line ('Welcome to PL-SQL session ' || p_name);


end;

exec greetings('Raja');

