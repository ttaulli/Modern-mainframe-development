       IDENTIFICATION DIVISION.
       PROGRAM-ID. TEMPERATURE.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 TEMPERATURE PIC 9(3) VALUE 0.
       PROCEDURE DIVISION.
       DISPLAY "Enter the temperature : "
       ACCEPT TEMPERATURE
           IF TEMPERATURE <= 32 THEN
              DISPLAY "It is freezing"
           ELSE
              DISPLAY "It is not freezing"
           END-IF
       GOBACK.
