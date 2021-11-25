       IDENTIFICATION DIVISION.
       PROGRAM-ID. LOGIN.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 USERNAME		PIC X(20).
       01 PASSWORD		PIC X(20).
       PROCEDURE DIVISION.
       DISPLAY "Enter your user name"
       ACCEPT USERNAME
       DISPLAY "Enter your password"
       ACCEPT PASSWORD
       IF USERNAME = "Tom68"
           IF PASSWORD = "12345"
              DISPLAY "Login successful!"
           ELSE
	       DISPLAY "Incorrect password."
       END-IF
       ELSE
           DISPLAY "Incorrect user name."
       END-IF.
       GOBACK.
