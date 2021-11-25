       IDENTIFICATION DIVISION.
       PROGRAM-ID. BUSINESS-TYPE.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 COMMISSIONS PIC 99 VALUE ZERO.
           88 UNDER-QUOTA VALUE 0 THRU 10.
           88 QUOTA VALUE 11 THRU 30.
           88 OVER-QUOTA VALUE 31 THRU 99.
       PROCEDURE DIVISION.
       DISPLAY "Enter the number of units sold"
       ACCEPT COMMISSIONS
       EVALUATE TRUE
           WHEN UNDER-QUOTA
              DISPLAY "Commission is 10% and this is under the quota."
           WHEN QUOTA
              DISPLAY "Commission is 15% and this meets the quota."
           WHEN OVER-QUOTA
              DISPLAY "Commission is 20% and this is over the quota."
           WHEN OTHER
              DISPLAY "This is the default"
       END-EVALUATE.
       GOBACK.
