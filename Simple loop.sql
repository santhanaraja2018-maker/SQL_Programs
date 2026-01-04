

setserveroutputon;
clear screen;

declare

C number :=1;
begin 
loop
  dbms_output.put_line ('Welcome'||C);
 C:=C+1;
 exit when C>5;
 
end loop;

end;
