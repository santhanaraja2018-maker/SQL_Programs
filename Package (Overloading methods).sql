
set serveroutput on;

create or replace package over_load_add     --package declaration  ( The same package can be written using function as well )
as
  procedure ADD_NUM (A number, B number);
  procedure ADD_NUM (A number, B number, C number);
end;


create or replace package body over_load_add      --package body
as

procedure ADD_NUM (A number, B number)
as
begin
    dbms_output.put_line('Sum of numbers : '||to_char(A+B));
end ADD_NUM;

procedure ADD_NUM (A number, B number, C number)
as
begin
    dbms_output.put_line('Sum of numbers : '||to_char(A+B+C));
end ADD_NUM;

end;


-- to execute above package run below code

exec over_load_add.add_num(10,45,67);


exec over_load_add.add_num(10,45);
