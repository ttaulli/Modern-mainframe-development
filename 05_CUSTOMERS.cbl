       IDENTIFICATION DIVISION.
       PROGRAM-ID. CUSTOMERS.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CUSTOMER-FILE ASSIGN TO
           "CUSTOMERS.Dat"
           ORGANIZATION IS LINE SEQUENTIAL.
           SELECT CUSTOMER-FILE-INDEXED ASSIGN TO
           "CUSTOMERS-INDEXED.Dat"
           ORGANISATION IS INDEXED
           ACCESS IS SEQUENTIAL
           RECORD KEY IS INDEXED-CUSTOMER-NO.
       DATA DIVISION.
       FILE SECTION.
       FD CUSTOMER-FILE.
       01 CUSTOMER-RECORD.
           05 CUSTOMER-NUMBER PIC 9(3).
           05 FIRST-NAME PIC X(20).
           05 LAST-NAME PIC X(20).
       FD CUSTOMER-FILE-INDEXED.
       01 INDEXED-CUSTOMER-RECORD.
           05 INDEXED-CUSTOMER-NO PIC 9(3).
           05 INDEXED-FIRST-NAME PIC X(20).
           05 INDEXED-LAST-NAME PIC X(20).
       WORKING-STORAGE SECTION.
       01 END-OF-FILE PIC X VALUE 'N'.
       PROCEDURE DIVISION.
       OPEN INPUT CUSTOMER-FILE
       OPEN OUTPUT CUSTOMER-FILE-INDEXED
       PERFORM UNTIL END-OF-FILE = 'Y'
           READ CUSTOMER-FILE
           AT END
           MOVE 'Y' TO END-OF-FILE
           NOT AT END
           MOVE CUSTOMER-RECORD TO INDEXED-CUSTOMER-RECORD
           WRITE INDEXED-CUSTOMER-RECORD
            INVALID KEY DISPLAY 'Invalid record'
           END-WRITE
           END-READ
       END-PERFORM
       CLOSE CUSTOMER-FILE
       CLOSE CUSTOMER-FILE-INDEXED
       GOBACK.
