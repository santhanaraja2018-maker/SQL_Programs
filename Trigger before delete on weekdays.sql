

--create table employee_backup as select * from employee where 1=2;
--
--alter table employee_backup  add date_of_deletion date;
--
--alter table employee_backup  add who_deleted varchar2(20);
--
--select * from employee_backup

--select * from employee

create or replace trigger emp_trigger

before delete on employee

for each row

begin 

 if to_char(sysdate,'D') in ('1','7') then
  
  raise_Application_error ( -20001, 'Deletion not allowed on WEEKEND');
 
 else

  insert into employee_backup  values ( :old.Emp_id , :old.First_Name, :old.Last_Name, :old.EMP_Hire_DATE, :old.EMAIL, :old.PHONE_NUMBER, :old.JOB_ID, 
  :old.MANAGER_ID, :old.SALARY , sysdate, user);

end if;
end;


delete from employee where emp_id = 103;

select * from employee_backup;


