set serveroutput on;
clear screen;

CREATE or replace procedure gold_rates_daily_capture( p_city varchar2,
                                                      p_gold_22c_rate number,
                                                      p_gold_24c_rate number,
                                                      p_gold_captured_date date,
                                                      p_msg out varchar2)
                                                      
as

l_count number;

begin
  
 select count(*) into l_count
 from gold_rates where trunc(gold_captured_date) = trunc(p_gold_captured_date)
 and city = p_city;
   
       if l_count=0 then
         insert  into gold_rates (city,gold_22c_rate,gold_24c_rate,gold_captured_date) values
                                 (p_city,p_gold_22c_rate,p_gold_24c_rate,p_gold_captured_date);
                                 
        p_msg := 'Gold rate captured successfully for  : '|| p_gold_captured_date;
        
        commit;
       else
       p_msg := 'Gold rate already captured  for  : '|| p_gold_captured_date;
       
      end if;
   
end gold_rates_daily_capture;
/

CREATE or replace procedure display_gold_rates( p_city varchar2,
                                                      p_gold out varchar2,
                                                      p_gold_date out varchar2,
                                                      p_22c_gold_rate out varchar2)                                                      
as

begin


select to_char(gold_captured_date,'mon,dd,yyyy'),
       trim(to_char(gold_22c_rate,'9,99,999')) into p_gold_date,p_22c_gold_rate from gold_rates
           where trunc(gold_captured_date) = trunc(sysdate) and lower(city) = lower(p_city);
           
           p_22c_gold_rate :='RS: '|| p_22c_gold_rate ||'/Gram(22ct)';
           p_gold := 'Gold';

           

end display_gold_rates;
/



declare 
result varchar2(100);
begin
 gold_rates_daily_capture( 'madurai', 12500, 13800,sysdate,result);
 dbms_output.put_line(result);
end;

declare 
city varchar2(100);
gold varchar2(100);
gold_date varchar2(100);
gold_rate varchar2(100);
begin
city := '&Enter_city';
 display_gold_rates( city, gold,gold_date,gold_rate);
 dbms_output.put_line(gold || ' ' ||gold_date || ' ' || city || ' ' || gold_rate);
 exception when no_data_found then
 dbms_output.put_line('No data found');
end;


