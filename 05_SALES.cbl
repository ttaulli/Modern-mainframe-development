       IDENTIFICATION DIVISION.
       PROGRAM-ID. SALES.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT SALES-FILE ASSIGN TO
           "Sales.dat"
           ORGANIZATION IS LINE SEQUENTIAL.
       DATA DIVISION.
       FILE SECTION.
       FD SALES-FILE.
       01 LOCATION-SALES.
       88 END-OF-FILE VALUE HIGH-VALUES.
           02 LOCATION-NO PIC 99.
           02 RECEIPTS PIC 9(4).
       WORKING-STORAGE SECTION.
       01 SALES-TABLE.
           05 SALES-TOTALS PIC 9(4) OCCURS 5 TIMES.

       01 LOCATION-COUNTER PIC 99.
       01 SALES-FORMAT PIC $$$,$$$.
       PROCEDURE DIVISION.
       MOVE ZEROES TO SALES-TABLE
       OPEN INPUT SALES-FILE
           READ SALES-FILE
           AT END SET END-OF-FILE TO TRUE
       END-READ
       PERFORM UNTIL END-OF-FILE
       MOVE RECEIPTS TO SALES-TOTALS(LOCATION-NO)
           READ SALES-FILE
           AT END SET END-OF-FILE TO TRUE
           END-READ
       END-PERFORM
       DISPLAY " Monthly Sales By Location"
       PERFORM VARYING LOCATION-COUNTER FROM 1 BY 1
           UNTIL LOCATION-COUNTER GREATER THAN 5
           MOVE SALES-TOTALS(LOCATION-COUNTER) TO SALES-FORMAT
           DISPLAY "Sales for location number ", LOCATION-COUNTER
           " " SALES-FORMAT
       END-PERFORM
       CLOSE SALES-FILE
       GOBACK.
