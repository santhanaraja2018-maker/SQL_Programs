set serveroutput on;
clear screen;

CREATE or replace  procedure coupon_validation ( p_coupon in varchar2,
                                                p_message out varchar2)
as

l_count number;
begin
     select count(1) into l_count
     from coupon_codes where upper(coupon_name) = upper(p_coupon) 
     and lower(status) = 'active';
     
     if l_count=1 then
        p_message := 'Valid Coupon';
     else
         p_message := 'Not a Valid Coupon';
    end if;
    
end coupon_validation;
/


CREATE or replace  procedure same_coupon_validation ( p_userid in varchar2,
                                                p_coupon in varchar2,
                                                p_message out varchar2)
as
l_count number;
begin
     select count(1) into l_count
     from order_details where user_id = p_userid and 
     upper(coupon_name) = upper(p_coupon) 
     and ORDERED_TIME >= sysdate-2/24;
     
     if l_count=1 then
        p_message := 'Coupon already applied. Try again after 2 hrs';
     else
         p_message := 'Valid Coupon';
    end if;
    
end same_coupon_validation;
/

declare
message varchar2(30);
begin
  coupon_validation ('NEWYEAR2026',message);
  dbms_output.put_line(message);
end;



declare
message varchar2(30);
begin
  same_coupon_validation (100,'NEWYEAR2026',message);
  dbms_output.put_line(message);
end;


