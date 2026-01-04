

set serveroutput on;
clear screen;

DECLARE

  v_customer customer%rowtype; -- ( instead of giving datatype using existing tables all the rows datatype)
  
  v_cust_id customer.cust_id%TYPE :=&v_cust_id;
  
  begin
  
    select * into v_customer from customer where cust_id=v_cust_id;
    dbms_output.put_line ('The mobile number is '||v_customer.mobile);
    dbms_output.put_line ('The name is '||v_customer.cust_name);
    dbms_output.put_line ('The address is '||v_customer.address);
  
  end;