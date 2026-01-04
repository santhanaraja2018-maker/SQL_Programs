
set serveroutput on;
clear screen;

declare 
 type associative_array is table of varchar2(50) index by varchar2(20);
 v_color associative_array;
 
 begin
 
 v_color ('color1') := 'Red';
 v_color ('color2') := 'Blue';
 v_color ('color3') := 'Green';
 v_color ('color4') := 'Yellow';
 
 dbms_output.put_line ('The color 2 is : ' || v_color('color2'));
 dbms_output.put_line ('First index is : ' || v_color.first);
 dbms_output.put_line ('Last index is : ' || v_color.last);
 dbms_output.put_line ('Count of array is : ' || v_color.count);
 
 v_color.delete('color4');
 
 dbms_output.put_line ('Count of array is after delete : ' || v_color.count);
 
 -- we can add again here by following
 
 v_color('color5') := 'Grey';
  dbms_output.put_line ('Count of array is after add : ' || v_color.count);
   dbms_output.put_line ('Added element : ' || v_color('color5'));
 
 end;