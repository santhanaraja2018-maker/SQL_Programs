set SERVEROUTPUT ON;
clear screen;
declare

 n1 NUMBER (6) :=&n1;
 n2 NUMBER (6):=&n2;
 r NUMBER (6);


begin
 
 r := n1+n2;
 dbms_output.put_line ('The addition of two numbers : '|| (r)) ;


end;