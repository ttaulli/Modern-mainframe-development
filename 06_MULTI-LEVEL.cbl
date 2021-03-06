       IDENTIFICATION DIVISION.
       PROGRAM-ID. MULTI-LEVEL.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT SALES-FILE ASSIGN TO
           "Sales3.dat"
       ORGANIZATION IS LINE SEQUENTIAL.
       DATA DIVISION.
       FILE SECTION.
       FD SALES-FILE.
       01 SALES-RECORD.
           88 END-OF-FILE VALUE HIGH-VALUES.
           05 REGION-NO PIC 99.
           05 QUARTERLY-SALES PIC 9(3) OCCURS 4 TIMES.
       WORKING-STORAGE SECTION.
       01 SALES-TABLE.
           05 REGION OCCURS 5 TIMES.
               10 ST-QUARTERLY-SALES PIC 9(3) OCCURS 4 TIMES.
       01 REPORT-HEADING.
           05 FILLER PIC X(10) VALUE SPACES.
           05 FILLER PIC X(40) VALUE "Quarterly Sales Based On Region".
       01 REPORT-LINE.
           05 FILLER PIC X(50) VALUE ALL "-".
       01 TOTALS.
           05 SALES-TOTALS PIC 9(9).
           05 FORMAT-SALES PIC $$$,$$$.
           05 FORMAT-AVERAGE-SALES PIC $$$,$$$.
       01 REGION-INDEX PIC 99.
       01 QUARTER-INDEX PIC 99.
       01 AVERAGE-SALES PIC 9(3).
       PROCEDURE DIVISION.
       100-START-PROGRAM.
           MOVE ZEROS TO SALES-TABLE
           OPEN INPUT SALES-FILE
           READ SALES-FILE
              AT END SET END-OF-FILE TO TRUE                  
           END-READ
                     
           PERFORM UNTIL END-OF-FILE
           PERFORM VARYING QUARTER-INDEX FROM 1 BY 1
              UNTIL QUARTER-INDEX > 4
           ADD QUARTERLY-SALES(QUARTER-INDEX) TO
           ST-QUARTERLY-SALES(REGION-NO, QUARTER-INDEX)
       END-PERFORM
       READ SALES-FILE
           AT END SET END-OF-FILE TO TRUE
       END-READ
       END-PERFORM
       DISPLAY REPORT-HEADING
       DISPLAY REPORT-LINE
       PERFORM VARYING REGION-INDEX FROM 1 BY 1
            UNTIL REGION-INDEX > 4
       DISPLAY "Region Number: " REGION-INDEX
       PERFORM VARYING QUARTER-INDEX FROM 1 BY 1
           UNTIL QUARTER-INDEX > 4
       MOVE ST-QUARTERLY-SALES(REGION-INDEX, QUARTER-INDEX)
           TO FORMAT-SALES
       DISPLAY "Quarter " QUARTER-INDEX " sales: "
          FORMAT-SALES
       ADD ST-QUARTERLY-SALES(REGION-INDEX, QUARTER-INDEX)
       TO SALES-TOTALS
       END-PERFORM
       MOVE SALES-TOTALS TO FORMAT-SALES
       DISPLAY "Total sales: " FORMAT-SALES
       COMPUTE AVERAGE-SALES = SALES-TOTALS / 4
       MOVE AVERAGE-SALES TO FORMAT-SALES
       DISPLAY "Average sales: " FORMAT-SALES
       DISPLAY REPORT-LINE
       END-PERFORM
       CLOSE SALES-FILE
       GOBACK.
