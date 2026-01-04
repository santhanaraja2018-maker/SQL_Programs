
-- to use ddl statements inside the blocks we use dynamic sql

set serveroutput on;

clear screen;

create table test1 as select * from customer;
select * from test1;

create or replace procedure drop_table (table_name varchar2)
as
begin

 execute immediate 'drop table ' || table_name;
 
 end;
 
 

 exec drop_table('test1');