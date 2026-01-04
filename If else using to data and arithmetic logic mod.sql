
set serveroutput on;
clear screen;

declare 
 v_cust_id number:= &customer_id;
 v_dob number (4);
 v_cust_name VARCHAR2 (5);
 
 
 begin
 
   
 
   select to_number(to_char(dob,'yyyy')),cust_name into v_dob,v_cust_name from customer where cust_id = v_cust_id;
   if mod(v_dob,4)=0 then
   
   dbms_output.put_line ( 'The dob of customer '|| v_cust_name || ' is leap year');
   else
   
   dbms_output.put_line ( 'The dob of customer '|| v_cust_name || ' is not leap year');
   end if;
   
   end;
   /
 
 
 