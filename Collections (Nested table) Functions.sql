
set serveroutput on;
clear screen;

declare 
 type nested_table_type is table of varchar2(50);
 v_color nested_table_type := nested_table_type(null,null,null);
 
 begin
 
 v_color (1) := 'Red';
 v_color (2) := 'Blue';
 v_color (3) := 'Green';
 
 dbms_output.put_line ('Count before extend : ' || v_color.count);
 v_color.extend(4);
 v_color (4) := 'Yellow';
 
 dbms_output.put_line ('The color is : ' || v_color(4));
 dbms_output.put_line ('Limit : ' || v_color.limit); -- will return null value since it doesnot have upper limit or maximum size
 dbms_output.put_line ('Count : ' || v_color.count);
 dbms_output.put_line ('First index (index of first element) : ' || v_color.first); --index of first element
 dbms_output.put_line ('Last index (index of last element): ' || v_color.last); --index of last element (varry as we add elements)
 dbms_output.put_line ('Prior element : ' || v_color.prior(3));
 dbms_output.put_line ('Next element : ' || v_color.next(3));
 
 v_color.delete (1);  -- after deleting any index we cant print directly need to go for if class
 
 -- if we did not mention any index in delete (v_color.delete) it will delete all elements
 dbms_output.put_line ('Count after delete 1st element : ' || v_color.count);
 
 if v_color.exists(1) then                    -- use of exist function
 dbms_output.put_line ('Color of element : ' || v_color(1));
 
 /*elsif v_color.exists(2) then
 dbms_output.put_line ('Color of element : ' || v_color(2));*/
 
 else 
 dbms_output.put_line ('Color of element not present');
 
 end if;
 
 
 v_color.trim(1);
 
 dbms_output.put_line ('Count after trim : ' || v_color.count);
 
 dbms_output.put_line ('upper bound after trim : ' || v_color.last);
 end;