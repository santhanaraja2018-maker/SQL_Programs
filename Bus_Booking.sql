set serveroutput on;
clear screen;

CREATE OR REPLACE PROCEDURE BUS_DETAILS_DISPLAY(P_DOJ IN DATE,
    P_SOURCE IN VARCHAR2,
    P_DESTINATION IN VARCHAR2,
    P_PRICE_SORT IN VARCHAR2,
    P_SEAT_SORT IN VARCHAR2,
    P_RATING_SORT IN VARCHAR2,
    P_SORT IN VARCHAR2,
    P_RESULT OUT SYS_REFCURSOR)
    AS
    
    BEGIN
        OPEN P_RESULT FOR
            SELECT *
        FROM BUS_DETAILS
        WHERE BUS_AVAILABILITY = 'Y'
          AND TRUNC(JOURNEY_DATE) = TRUNC(P_DOJ)
          AND UPPER(TRIM(SOURCE)) = UPPER(TRIM(P_SOURCE))
          AND UPPER(TRIM(DESTINATION)) = UPPER(TRIM(P_DESTINATION))
          ORDER BY 
          CASE WHEN P_PRICE_SORT = 'PRICE' AND P_SORT = 'ASC'
                     THEN PRICE
               WHEN P_RATING_SORT = 'RATING' AND P_SORT = 'ASC'
                     THEN BUS_RATING
               WHEN P_SEAT_SORT= 'SEATS' AND P_SORT = 'ASC'
                    THEN SEATS_AVAILABLE
          END ASC,
          CASE WHEN P_PRICE_SORT = 'PRICE' AND P_SORT = 'DESC'
                     THEN PRICE
               WHEN P_RATING_SORT = 'RATING' AND P_SORT = 'DESC'
                     THEN BUS_RATING
               WHEN P_SEAT_SORT= 'SEATS' AND P_SORT = 'DESC'
                    THEN SEATS_AVAILABLE
          END DESC;
         
                    
                    
    END BUS_DETAILS_DISPLAY;   
/


DECLARE
        RESULT SYS_REFCURSOR;
        BUS_DTLS_RECORD BUS_DETAILS%ROWTYPE;
BEGIN
         BUS_DETAILS_DISPLAY(DATE '2026-02-01',
                             'CHENNAI',
                             'COIMBATORE',
                             'NONE',
                             'NONE',
                             'RATING',
                             'ASC',
                              RESULT);    
                              
                              
        LOOP
            FETCH RESULT INTO BUS_DTLS_RECORD;
            EXIT WHEN RESULT%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE('BUS_OPERATOR : '||BUS_DTLS_RECORD.BUS_OPERATOR ||'  SEATS : '||BUS_DTLS_RECORD.SEATS_AVAILABLE||
            '  RATING : '||BUS_DTLS_RECORD.BUS_RATING ||'  DEPARTURE_TIME : '||BUS_DTLS_RECORD.DEPARTURE_TIME);
        END LOOP;
        CLOSE RESULT;
END;



