

create table T_customer_scd_flag(
Customer_key number(10) primary key,
Customer_id number(10),
First_name varchar2(30),
Mobile varchar2(30),
Address1 varchar2(30),
Zipcode number(6),
Country varchar2 (30),
flag_number number(1));

create table T_customer_scd_date(
Customer_key number(10) primary key,
Customer_id number(10),
First_name varchar2(30),
Mobile varchar2(30),
Address1 varchar2(30),
Zipcode number(6),
Country varchar2 (30),
eff_date date,
end_date date);


















