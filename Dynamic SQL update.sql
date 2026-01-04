clear screen;

set serveroutput on;

create or replace procedure update_customer(
    table_name IN VARCHAR2,
    column_name IN VARCHAR2,
    updated_value IN VARCHAR2,
    customer_id IN NUMBER
) AS

    v_sql VARCHAR2(1000);  -- To store the dynamic SQL query
BEGIN
    -- Construct the dynamic SQL query
    v_sql := 'UPDATE ' || table_name || 
             ' SET ' || column_name || ' = :updated_value ' || 
             ' WHERE cust_id = :cust_id';

    -- Execute the dynamic SQL using bind variables
    EXECUTE IMMEDIATE v_sql USING updated_value, customer_id;

    -- Output success message
    DBMS_OUTPUT.PUT_LINE('Customer updated successfully');
END;
/

exec update_customer('customer','address','Madurai',102);

commit;