
set serveroutput on;
clear screen;

create or replace function is_leap_year (n_year in number)

return varchar2
as

v_day varchar2 (100);
v_year number (10) := n_year;

begin

 select to_char(last_day(to_date('01-FEB-'||to_char(n_year),'dd-mm-yyyy')),'dd') into v_day from dual;
 
 if (v_day = 29) then
 
  return to_char(v_year)||' is Leap Year';
  
  else 
  return to_char(v_year)||' is not Leap Year';
  end if;

end;

--to execute the function we need to run below code

select is_leap_year(2020) from dual;


