-- before creating trigger we need to create backup table

/* create table customer_backup as select * from customer where 1=2;

alter table customer_backup  add date_of_deletion date;

alter table customer_backup  add who_deleted varchar2(20);

select * from customer_backup; 

insert into customer values (104,'RAJA', to_date('11-01-2001','dd-mm-yyyy'),'Madurai','+91-6382661912');  
select * from customer; */


create or replace trigger customer_trigger
 before delete on customer
 for each row
 
 begin
 
 insert into customer_backup values 
 
 (:old.cust_id, :old.cust_name, :old.dob, :old.address, :old.mobile, sysdate, user);
 
 end;
 
 
 -- after creating above trigger and compile it if we delete a row it be added in customer_backup table
 
 
 delete from customer where cust_id=104;
 
 select * from customer_backup;
 