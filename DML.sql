set SERVEROUTPUT ON;
clear screen;
declare

 v_cust_name varchar2(30);
 v_mobile varchar2(30);
 v_address varchar2(30);

begin
 
 insert into customer (cust_id,cust_name,dob,mobile,address) values (100,'Arun',to_date('09/12/2024','mm/dd/yyyy'),9894855850,'chennai');

 insert into customer values (101,'Raja',to_date('11/10/2025','mm/dd/yyyy'),9894856850,'madurai');

 insert into customer (cust_id,cust_name,dob,mobile) values (102,'Jana',to_date('08/22/2002','mm/dd/yyyy'),8894855850);


 commit;

 dbms_output.put_line('Values Inserted');

 update customer set address = 'Trichy' where cust_id=102;

 commit;

 dbms_output.put_line('Values Updated');

 delete from customer where cust_id=101;

 commit;
 dbms_output.put_line('Values Deleted');


 select cust_name,mobile,address into v_cust_name,v_mobile,v_address from customer where cust_id=102;
  dbms_output.put_line('Customer details are listed below');
  dbms_output.put_line('Customer Name : '|| v_cust_name);
  dbms_output.put_line('Customer mobile Number : '|| v_mobile);
  dbms_output.put_line('Customer Address : '|| v_address);

end;
/