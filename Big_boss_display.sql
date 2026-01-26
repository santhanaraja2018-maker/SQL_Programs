set serveroutput on;
clear screen;

create or replace procedure BB_NOMINATED_CONTESTANTS( p_language varchar2,
                                                      p_season number,
                                                      p_week number ,
                                                      p_result out sys_refcursor)
                                                      
as

begin
     open p_result for
     select contenstant_id,contestant_name Nominated_Contestant  from BIG_BOSS where season = p_season and week = p_week 
                                                                                              and upper(language) = upper(p_language)
                                                                                              and lower(eliminated) = 'n'
                                                                                              and lower(nominated) = 'y';
end BB_NOMINATED_CONTESTANTS;
/

create or replace procedure BB_VOTES_CAPTURE (p_language varchar2,
                                              p_season number,
                                              p_week number ,
                                              p_vinoth varchar2,
                                              p_divya varchar2,
                                              p_vikram varchar2,
                                              p_audience varchar2,
                                              p_result out varchar2)
   as
   
   begin
           insert into big_boss_weekly_votes (language,season,week,contestant,num_of_votes,audience,date_of_votes) values
                                             (p_language, p_season,p_week, REGEXP_SUBSTR(p_vinoth, '[^_]+', 1, 1),
                                                                           TO_NUMBER(REGEXP_SUBSTR(p_vinoth, '[^_]+', 1, 2)),
                                                                           p_audience, sysdate);
                                                                           
           insert into big_boss_weekly_votes (language,season,week,contestant,num_of_votes,audience,date_of_votes) values
                                             (p_language, p_season,p_week,  REGEXP_SUBSTR(p_divya, '[^_]+', 1, 1),
                                                                            TO_NUMBER(REGEXP_SUBSTR(p_divya, '[^_]+', 1, 2)),
                                                                            p_audience, sysdate);
                                                                           
           insert into big_boss_weekly_votes (language,season,week,contestant,num_of_votes,audience,date_of_votes) values
                                             (p_language, p_season,p_week,  REGEXP_SUBSTR(p_vikram, '[^_]+', 1, 1),
                                                                           TO_NUMBER(REGEXP_SUBSTR(p_vikram, '[^_]+', 1, 2)),
                                                                           p_audience, sysdate);
                                                                                
        commit;
        
                 p_result := 'Your votes are svaed successfully. Thank you for voting ';
    EXCEPTION
            WHEN VALUE_ERROR THEN
                ROLLBACK;
                p_result := 'Invalid vote format. Use NAME_VOTES (example: Vinoth_10).';
        
            WHEN OTHERS THEN
                ROLLBACK;
                    IF SQLCODE = -1722 THEN
                      p_result := 'Invalid vote format. Use NAME_NUMBER (example: Vinoth_10).';
                    ELSE
                      p_result := 'Error while saving votes: ' || SQLERRM;
                    end if;                          
   end BB_VOTES_CAPTURE;                                          
/


create or replace procedure BB_TOP3_CONTESTANTS( p_language varchar2,
                                                      p_season number,
                                                      p_week number ,
                                                      p_result out sys_refcursor)
                                                      
as

begin
     open p_result for 
        select contestant,Votes from(
                 select contestant, sum(num_of_votes) Votes from big_boss_weekly_votes 
                                                              where lower(language) = lower(p_language)
                                                              and   season = p_season
                                                              and   week = p_week
                                                              group by contestant order by Votes desc) where rownum <=3;
                    
end BB_TOP3_CONTESTANTS;
/




declare
result sys_refcursor;
l_contastant_id varchar2(100);
l_contastant_name varchar2(100);

begin
        BB_NOMINATED_CONTESTANTS('TAMIL',9,1,result);
        
        loop
            fetch  result into l_contastant_id, l_contastant_name;
            exit when result%notfound;
            dbms_output.put_line('Contestant_id : '|| l_contastant_id || 
                                 '  Contestant_name : '|| l_contastant_name);
        end loop;
        close result;
        
end;

declare
result varchar2(100);

begin
        BB_VOTES_CAPTURE('Tamil',9,1,'Vinoth_8','Dhivya_5','vikram_1','King',result);
         dbms_output.put_line(result);
        
end;


declare
result sys_refcursor;
l_contastant_name varchar2(100);
l_contastant_votes number;
l_found boolean := false;

begin
        BB_TOP3_CONTESTANTS('TAMIL',9,1,result);
        
        loop
            fetch  result into l_contastant_name, l_contastant_votes;
            exit when result%notfound;
            l_found := true;
            dbms_output.put_line('Contestant_name : '|| l_contastant_name || 
                                 '  Votes : '|| l_contastant_votes);
        end loop;
        close result;
    IF NOT l_found THEN
        DBMS_OUTPUT.PUT_LINE('No records found for the given week.');
    END IF;
        
end;


