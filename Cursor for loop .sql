set serveroutput on;

clear screen;

declare

 Cursor c1 is select phone_number, salary  from employee;



begin        -- for using for loop in cursor no need to open close and fetch cusor also no need to define datatype
  
  for rec in c1  -- rec is composite data type
  
  loop
  
   dbms_output.put_line ( rec.phone_number || ' - ' || rec.salary);
  
  end loop;
   

end;