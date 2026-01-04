


set serveroutput on;
clear screen;

begin
  update customer set mobile = '+91-'||mobile where cust_id=&cust_id;
  
  if sql%notfound then    --sql% is name of implicit cursor
  
    dbms_output.put_line ('No rows are executed');
    
  else                           --%notfound & %rowcount  are cursor attributes (implicit cursors)
    dbms_output.put_line (SQL%rowcount||' rows are executed');   --sql% is name of implicit cursor
   end if;

end;