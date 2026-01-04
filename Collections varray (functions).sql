

set serveroutput on;
clear screen;

declare
type v_array_type is varray(10) of varchar2(40);
address v_array_type :=  v_array_type (null,null,null,null,null,null,null);

begin

 address (1) := 'G2';
 address (2) := 'ABC';
 address (3) := 'RAJA';
 address (4) := 'KING';
 address (5) := 'Nive';
 address (6) := 'JANA';
 address (7) := 'SUMATHI';
 
 dbms_output.put_line ('The of customer  at 4 is : '|| address(4));
 dbms_output.put_line ('Limit of array is : '|| address.limit);
 dbms_output.put_line ('Count of array is : '|| address.count);
 dbms_output.put_line ('First element is : '|| address.first);
 dbms_output.put_line ('Last element is : '|| address.last);
 dbms_output.put_line ('Prior of 3rd element is : '|| address.prior(3));
 dbms_output.put_line ('Next to 3rd element is : '|| address.next(3));
 
 address.extend();
 dbms_output.put_line ('Count after extend : '|| address.count);
 
 address.trim();
 dbms_output.put_line ('Count after trim : '|| address.count);
 
 address.delete();
 dbms_output.put_line ('Count after delete : '|| address.count);
 

end;

