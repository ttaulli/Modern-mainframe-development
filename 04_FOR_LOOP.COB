       IDENTIFICATION DIVISION.
       PROGRAM-ID. FOR_LOOP.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 COUNTER PIC 9(1) VALUE 0.
       PROCEDURE DIVISION.
       PERFORM 5 TIMES
       ADD 1 TO COUNTER
           DISPLAY "Loop number " COUNTER
       END-PERFORM
       GOBACK.
