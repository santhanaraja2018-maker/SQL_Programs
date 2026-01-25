SET SERVEROUTPUT ON;
CLEAR SCREEN;

CREATE OR REPLACE PROCEDURE AADHAR_UPDATION ( 
                                    P_AADHAR_NUMBER NUMBER,
                                    P_NAME VARCHAR2,
                                    P_ADDRESS VARCHAR2,
                                    P_MOBILE_NUMBER NUMBER,
                                    P_MAIL VARCHAR2,
                                    P_STATUS OUT VARCHAR2)

        AS
        
        BEGIN 
        
            UPDATE  aadhar_details SET 
            NAME = NVL(P_NAME,NAME),
            ADDRESS =  NVL(P_ADDRESS,ADDRESS),
            MOBILE_NUMBER =  NVL(P_MOBILE_NUMBER,MOBILE_NUMBER),
            EMAIL =  NVL(P_MAIL,EMAIL)
            WHERE AADHAR_NUMBER = P_AADHAR_NUMBER;
            
            IF SQL%FOUND THEN
                COMMIT;
                P_STATUS := 'AADHAR DETAILS UPDATED SUCCESSFULLY';
                
            ELSE
                ROLLBACK;
                P_STATUS := 'DETAILS NOT FOUND';
            END IF;
            
            EXCEPTION
            WHEN OTHERS THEN
            ROLLBACK;
            P_STATUS := 'ERROR OCCURED'||SQLERRM;
            


END AADHAR_UPDATION;
/

DECLARE
RESULT VARCHAR2(100);
BEGIN
AADHAR_UPDATION (327003159602,'NULL','NULL',6382661912,'NULL', RESULT);
dbms_output.put_line(RESULT);
END;



