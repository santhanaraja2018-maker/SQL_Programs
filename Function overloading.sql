
set serveroutput on;
clear screen;


create or replace function ADD_NUM (a number, b number) return number
as

c number;

begin

  c := a+b;
  return c;
 
 end;
 
 
create or replace function ADD_NUM(a number, b number, c number) return number
as

d number;
begin

 d := a+b+c;
 return d;
 
 end;



--to execute the function we need to run below code

select is_leap_year(2020) from dual;


