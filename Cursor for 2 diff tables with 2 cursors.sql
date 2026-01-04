set serveroutput on;

clear screen;

declare

cursor c1_emp is select salary from employee ;
CURSOR c2_cus is select cust_name from customer;
v_salary employee.salary%type;
v_cust_name varchar2(30);


begin        
  
  open c1_emp;
  
  dbms_output.put_line ('This is data of Employye ' );
  
  loop
  fetch c1_emp into v_salary;
  exit when c1_emp%notfound;
  
    dbms_output.put_line (v_salary);
  
  end loop;
  close c1_emp;
  
  open c2_cus;
    dbms_output.put_line ('This is data of Customer' );
  loop
  fetch c2_cus into v_cust_name;
  exit when c2_cus%notfound;
  
    dbms_output.put_line (v_cust_name);
  
  end loop;
  close c2_cus;
  
end;