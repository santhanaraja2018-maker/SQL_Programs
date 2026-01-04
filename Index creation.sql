
set serveroutput on;
clear screen;



create index idx_emp_salary on employee(salary);   -- default Btree index

create bitmap index idx_emp_ph on employee(phone_number);  -- bitmap index  (not supported in my lap)

create index idx_emp_job on employee(job_id) reverse;  --reverse index

create index emp_fun_inx on employee(Upper(first_name)); -- function based index very rarely used



select * from all_indexes where owner='RAJA' and table_name = 'EMPLOYEE';   -- to retrive all indexes for a table

select * from all_ind_columns where table_name = 'EMPLOYEE';  -- to retrive all indexes on what are columns in a table index is created

explain plan for         -- before index creation the cost(time taken for this select query will be high after creation it will be minimized so that we use indexes
select * from employee where salary = 4000;


