       IDENTIFICATION DIVISION.
       PROGRAM-ID. BALANCE.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 YEAR PIC 9(2) VALUE 0.
       01 BALANCE PIC 9(4) VALUE 1000.
       PROCEDURE DIVISION.
       PERFORM VARYING YEAR FROM 1 BY 1
           UNTIL YEAR > 10
           COMPUTE BALANCE = BALANCE * 1.05
           DISPLAY "Balance is $" BALANCE
       END-PERFORM.
       GOBACK.
