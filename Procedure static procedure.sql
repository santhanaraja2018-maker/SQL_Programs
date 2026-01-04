--static procedure

setserveroutputon;
clear screen;


create or replace procedure first_procedure
is 
begin 
dbms_output.put_line('WELCOME to PL SQL procedure');
end;
/* it can be called by following ways
  exec first_procedure;
  
  execute first_procedure;
  
  begin
   first_procedure;
end;

*/
  
  
  