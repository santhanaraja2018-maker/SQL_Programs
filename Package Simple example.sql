

--Package declaration

create or replace package first_package
as

procedure greetings(p_name in varchar2);
function hello_function (p_name in varchar2) return varchar2;
end;


--Package body

create or replace package body first_package as
procedure greetings(p_name in varchar2)
as
begin
    dbms_output.put_line('Hello'||p_name);
end greetings;

function hello_function(p_name in varchar2) return varchar2

as
v_result varchar2(100);

begin

v_result := 'Hello ' ||p_name;
return v_result;

end hello_function;

end;


-- to execute above package run below code

exec first_package.greetings('PL_SQL');

select first_package.hello_function('RAJA') from dual;

