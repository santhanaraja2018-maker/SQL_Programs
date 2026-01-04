set serveroutput on;

clear screen;

declare

cursor c1 (prm_dept_no number) is select salary from employee where emp_id=prm_dept_no;
v_salary number(15);


begin        
  
  open c1(102);
  
  dbms_output.put_line ('This is data of Employye id : 102' );
  
  loop
  fetch c1 into v_salary;
  exit when c1%notfound;
  
    dbms_output.put_line (v_salary);
  
  end loop;
  close c1;
  
  open c1(101);
    dbms_output.put_line ('This is data of Employye id : 101' );
  loop
  fetch c1 into v_salary;
  exit when c1%notfound;
  
    dbms_output.put_line (v_salary);
  
  end loop;
  close c1;
  
end;