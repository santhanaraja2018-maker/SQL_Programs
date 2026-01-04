

setserveroutputon;
clear screen;

declare

i number(10);
begin 
for i in 1..5
loop
dbms_output.put_line('WELCOME' || i);

end loop;
end;
