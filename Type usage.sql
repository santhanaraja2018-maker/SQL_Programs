

set serveroutput on;
clear screen;

DECLARE

  v_mobile_no customer.mobile%type; -- ( instead of giving datatype using existing tables colums's datatype)
  v_cust_id customer.cust_id%type :=&v_cust_no;
  
  
  begin
  
    select mobile into v_mobile_no from customer where cust_id=v_cust_id;
    dbms_output.put_line ('The mobile number is '||v_mobile_no);
  
  end;