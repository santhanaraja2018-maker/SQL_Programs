-- before creating trigger we need to create backup table

/* create table ddl_trigger_table
 (
 
 oracle_obj_name varchar2(20),
 oracle_user varchar2(30),
 ddl_execution_date date,
 ora_sys_event varchar2(50),
 oracle_obj_type varchar2(30),
 oracle_obj_owner varchar2(30)

);

select * from customer_backup; 

 
select * from ddl_trigger_table; 

create table customer1 as select * from customer ;
commit; */

create or replace trigger ddl_trigger
 after ddl on schema
     -- with out giving this 'for each row' the code will act as statement level trigger by default
 
 begin
 
 insert into ddl_trigger_table values 
 
 (ora_dict_obj_name,ora_login_user,sysdate,ora_sysevent,ora_dict_obj_type,ora_dict_obj_owner);
 
 end;
 
 
 -- after creating above trigger and compile it if we delete a row it be added in customer_backup table
 
 
 drop table customer1;
 
 select * from ddl_trigger_table;
 