
set SERVEROUTPUT ON;
clear screen;

Alter table employee ADD salary number (20) not null;



alter table customer add (MOBILE_NO VARCHAR2 (15));

update customer set mobile_no = to_char(mobile);

alter table customer drop column mobile;

alter table customer rename column mobile_no to mobile;

commit;