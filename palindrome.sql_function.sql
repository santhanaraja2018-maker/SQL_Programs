set serveroutput on;
clear screen;


create or replace function palindrome  (a varchar2)
return varchar2
as

  b varchar2 (30) := '';

begin 

 For i in REVERSE 1 .. length(a) loop
 
  b:= b || substr (a,i,1);
 
 end loop;
 
 if a=b then
 
 return 'The entered string "' || a || '" is Palindrome';
 
 else
 
 return 'The entered string "' || a || '" is not Palindrome';
 
 end if;
 
end;
/


-- to run the function
select palindrome('MADAM') from dual;

-- or
begin
  dbms_output.put_line (palindrome ('RAM'));
end;
/