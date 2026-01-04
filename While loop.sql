

set serveroutput on;
clear screen;

declare
    C number := 1;
begin 
    while (C<5) loop
        dbms_output.put_line('WELCOME' || C);
        C:=C+1;
    end loop;
end;
