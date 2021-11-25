       IDENTIFICATION DIVISION.
       PROGRAM-ID. INVOICE.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 INVOICE-AMOUNT PIC 9(4) VALUE 0.
       PROCEDURE DIVISION.
       DISPLAY "Enter the invoice amount : "
       ACCEPT INVOICE-AMOUNT
       IF INVOICE-AMOUNT > 0 AND INVOICE-AMOUNT < 5000 THEN
           DISPLAY "No approval is needed"
       ELSE
           DISPLAY "There must be approval"
       END-IF
       GOBACK.
