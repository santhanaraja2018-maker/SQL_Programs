set serveroutput on;
clear screen;

create or replace procedure wifi_complaints_reg_proc (
                                             p_user_name varchar2,
                                             p_complaint_type VARCHAR2,
                                             p_sub_complaint_type varchar2,
                                             p_desc varchar2,
                                             p_msg out varchar2)
                                             
as

l_cnt NUMBER;
BEGIN
    -- Check if an OPEN complaint already exists
    SELECT COUNT(*)
    INTO l_cnt
    FROM wifi_complaints
    WHERE user_name = p_user_name
      AND main_complaint_type = p_complaint_type
      AND sub_complaint_type = p_sub_complaint_type
      AND description = p_desc
      AND status = 'open';

    IF l_cnt = 0 THEN
              insert into wifi_complaints(user_name, main_complaint_type,sub_complaint_type,description)
                values (p_user_name,p_complaint_type,p_sub_complaint_type,p_desc);
                
        commit;
        p_msg:= 'Complaint Registered Sucessfully';
    else
      rollback;
      p_msg:= 'Complaint alredy Registered. we are working on it';
    end if;   
    
    EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        p_msg := 'Error: ' || SQLERRM;

end wifi_complaints_reg_proc;
/
       

create or replace procedure wifi_complaints_list(
                      p_user_name in varchar2,
                      p_msg out varchar2,
                      p_result    OUT SYS_REFCURSOR)
                      
as

begin

        OPEN p_result FOR
        SELECT user_name,complaint_no,
               main_complaint_type || '-' || sub_complaint_type AS complaint,
               status,
               TO_CHAR(added_date,'DD-MM-YYYY') AS added_date
        FROM wifi_complaints
        WHERE LOWER(user_name) = LOWER(p_user_name)
          AND LOWER(status) = 'open'
        ORDER BY added_date DESC;
        
        p_msg :=' wifi_complaints_list end ';  
            
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
        p_msg := 'No open complaint found for this user';

    WHEN TOO_MANY_ROWS THEN
        p_msg := 'Multiple open complaints exist';

    WHEN OTHERS THEN
        p_msg := 'Error: ' || SQLERRM;
                                             
        
end wifi_complaints_list;



       
declare
msg varchar2(100);
begin
wifi_complaints_reg_proc('Jana','SlOW_NETWORK','Too_Slow','very_slow_network',msg);
dbms_output.put_line(msg);
end;


declare

      l_user_name varchar2(100);
      l_complaint_no NUMBER;
      l_complaint    VARCHAR2(200);
        l_status       VARCHAR2(20);
        l_added_date   VARCHAR2(20);
        l_result sys_refcursor;
        l_msg varchar2(100);
      
    
begin
    wifi_complaints_list('raja',l_msg,l_result);
    loop
    fetch l_result into l_user_name,l_complaint_no,l_complaint,l_status ,l_added_date; 
    exit when l_result%notfound;
    DBMS_OUTPUT.PUT_LINE(
        l_user_name || ' | ' ||
        l_complaint_no || ' | ' ||
        l_complaint || ' | ' ||
        l_status || ' | ' ||
        l_added_date);
    end loop;
    
    close l_result;
    
    
    dbms_output.put_line(l_msg);
end;
                                            