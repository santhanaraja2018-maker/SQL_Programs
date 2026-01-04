
set serveroutput on;
clear screen;

declare 
 type nested_table_type is table of varchar2(50);
 v_color nested_table_type := nested_table_type(null,null,null,null,null,null,null);
 
 begin
 
 v_color (1) := 'Red';
 v_color (2) := 'Blue';
 v_color (3) := 'Green';
 v_color (4) := 'Yellow';
 
 dbms_output.put_line ('The color is : ' || v_color(4));
 
 end;