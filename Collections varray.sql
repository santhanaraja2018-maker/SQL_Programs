

set serveroutput on;
clear screen;

declare
    type v_array_type is varray(7) of varchar2(40);
    address v_array_type :=  v_array_type (null,null,null,null,null,null,null);
begin
     address (1) := 'G2';
     address (2) := 'ABC';
     address (3) := 'RAJA';
     address (4) := 'KING';
     address (5) := 'Nive';
     address (6) := 'JANA';
     address (7) := 'SUMATHI';
     
     dbms_output.put_line ('The of customer is : '|| address(1));

end;

