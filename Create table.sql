clear screen;
create table employee(

 EMP_ID number (10) primary key,
 FIRST_NAME varchar2(20) not null,
 LAST_NAME varchar2(20),
 EMP_HIRE_DATE date,
 EMAIL varchar2 (30) constraint chk_email_format check( regexp_like (email,'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$')),
 PHONE_NUMBER number(10) not null,
 JOB_ID varchar2(10),
 MANAGER_ID number (10) 
 
 );