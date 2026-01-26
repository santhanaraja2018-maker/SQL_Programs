set serveroutput on;
clear screen;

CREATE or replace procedure eb_bill_details ( p_usn_number number,
                                              p_customer_name out varchar2,
                                              p_amount out number,
                                              p_due_date out date,
                                              p_msg out varchar2)
as
 l_count number;
 
     begin
          select count(*)  into l_count from electricity_bill where usn_number = p_usn_number;
          
          if l_count =0 then
           p_msg := 'Invalid Number';
           
          elsif l_count =1 then  
           select customer_name,amount, due_date into p_customer_name,p_amount,p_due_date 
                                                               from electricity_bill
                                                               where usn_number = p_usn_number and 
                                                               payment_status ='U';
                                                               
           p_msg := 'Pending due details';
           dbms_output.put_line ('Customer : '||p_customer_name || ' | ' ||'Amount : '|| p_amount || ' | ' ||'Due date : '|| p_due_date);
          
          end if;
             
         exception
         when no_data_found then
         p_msg := 'No pending dues are there';
          
     end eb_bill_details;
/


declare 
    name varchar2(100);
    amount  number;
    due_date date;
    msg varchar2(100);

begin
eb_bill_details ( 105,name,amount, due_date,msg);    
dbms_output.put_line (msg);
end;





