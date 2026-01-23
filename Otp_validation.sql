set serveroutput on;
clear screen;




create or replace procedure OTP_Generation(
p_phone in number, 
p_otp out number)
as

begin
    select trunc(DBMS_RANDOM.value(100000,1000000))into p_otp from dual;
    
    insert into otp_details (
    mobile_number,
    otp,
    otp_generated_time,
    otp_expired_time) VALUES (
    p_phone,
    p_otp,
    sysdate,
    SYSDATE + INTERVAL '1' MINUTE);
    
    commit;

end;
/

create or replace procedure OTP_Validation(
p_phone  in number,
p_otp in number,
p_message out varchar2)
as

 L_count number;
begin
    select count(1) into L_count from otp_details where mobile_number = p_phone
    and otp = p_otp
    and sysdate between otp_generated_time and otp_expired_time;
    
    if L_count = 1 then
    p_message := 'OTP Aplied successfully';
    else
    p_message := 'OTP is invalid/expired';
    end if;

end;
/




declare
 otp number;
 begin 
 otp_generation(6382661912,otp);
 DBMS_OUTPUT.PUT_LINE(otp);
end;
/
 
declare
 message varchar2(100);
begin
 otp_validation(6382661912,878083,message);
 DBMS_OUTPUT.put_line(message);

end;
/

select * from otp_details;

