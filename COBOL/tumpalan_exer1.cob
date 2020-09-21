       IDENTIFICATION DIVISION.
       PROGRAM-ID. tumpalan_exer1.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
           77 EXITED PIC 9 VALUE 0. 
           77 CHOICE PIC 9.
           77 METER_DIVISOR PIC 9V9999 VALUE 0.0254.
           77 INCH_VAR PIC 9(3).
           77 METER_RESULT PIC 99V99.
           01 INTEGER_ARRAY.
               02 NUM PIC 9 OCCURS 5 TIMES INDEXED BY IDX.
               02 ODD_COUNT PIC 9 VALUE 0.
               02 EVEN_COUNT PIC 9 VALUE 0.
               02 INT_SUM PIC 99 VALUE 0.
               02 AVERAGE PIC 9V99 VALUE 0.
           77 IDX2 PIC 9 VALUE 1.
           77 TEMP PIC 9.
           77 ARRAY_MIN PIC 9.
       PROCEDURE DIVISION.
           PERFORM PMENU UNTIL EXITED = 1.
           STOP RUN.

           PMENU.
           DISPLAY " MENU ".
           DISPLAY "[1] Inch to Meter Converter ".
           DISPLAY "[2] Fill Array ".
           DISPLAY "[3] Odd-Even Counter ".
           DISPLAY "[4] Compute Average ".
           DISPLAY "[5] Sort Array ".                                   
           DISPLAY "[6] Print Array ".
           DISPLAY "[7] Exit ".
           DISPLAY "CHOICE: " WITH NO ADVANCING.
           ACCEPT CHOICE.

           EVALUATE CHOICE
           WHEN 1
               DISPLAY "INCH TO METER CONVERTER"
               PERFORM INCH_TO_METER_CONV
           WHEN 2
               DISPLAY " FILLING ARRAY.. "
               PERFORM FILL_ARRAY VARYING IDX FROM 1 BY 1 UNTIL IDX > 5
           WHEN 3
               DISPLAY "ODD-EVEN COUNTER"
               MOVE 0 TO EVEN_COUNT
               MOVE 0 TO ODD_COUNT       
               PERFORM ODD_EVEN_COUNTER VARYING IDX FROM 1 BY 1 UNTIL
               IDX > 5
               DISPLAY "ODD COUNT: " ODD_COUNT
               DISPLAY "EVEN COUNT: " EVEN_COUNT
           WHEN 4
               DISPLAY "COMPUTE ARRAY AVERAGE"
               MOVE 0 TO INT_SUM
               PERFORM COMPUTE_AVERAGE VARYING IDX FROM 1 BY 1 UNTIL IDX 
               > 5
               COMPUTE AVERAGE = INT_SUM / 5
               DISPLAY "AVERAGE: " AVERAGE
           WHEN 5
               DISPLAY "SORT ARRAY"
               DISPLAY "ARRAY BEFORE SORTING: "
               PERFORM PRINT_ARRAY VARYING IDX FROM 1 BY 1 UNTIL IDX > 5
               DISPLAY " "
               PERFORM SORT_ARRAY VARYING IDX FROM 1 BY 1 UNTIL IDX > 5
               DISPLAY "ARRAY AFTER SORTING: "
               PERFORM PRINT_ARRAY VARYING IDX FROM 1 BY 1 UNTIL IDX > 5
               DISPLAY " "
           WHEN 6
               DISPLAY "PRINT ARRAY"
               PERFORM PRINT_ARRAY VARYING IDX FROM 1 BY 1 UNTIL IDX > 5
               DISPLAY " "
           WHEN 7
               MOVE 1 TO EXITED
           WHEN OTHER
               DISPLAY " INVALID INPUT! "
           END-EVALUATE.

           INCH_TO_METER_CONV.
               DISPLAY "ENTER VALUE IN INCH: " WITH NO ADVANCING.
               ACCEPT INCH_VAR.
               COMPUTE METER_RESULT = INCH_VAR * METER_DIVISOR.
               DISPLAY INCH_VAR " INCHES TO METER IS " METER_RESULT.

           FILL_ARRAY.
               DISPLAY " ENTER A NUMBER: " WITH NO ADVANCING.
               ACCEPT NUM(IDX).

           PRINT_ARRAY.
               DISPLAY NUM(IDX) " " WITH NO ADVANCING.    

           ODD_EVEN_COUNTER.
               IF FUNCTION MOD (NUM(IDX), 2) = 0
                   ADD 1 TO EVEN_COUNT GIVING EVEN_COUNT
               ELSE
                   ADD 1 TO ODD_COUNT GIVING ODD_COUNT
               END-IF.

           COMPUTE_AVERAGE.
               ADD NUM(IDX) TO INT_SUM GIVING INT_SUM.

           SORT_ARRAY.
               MOVE IDX TO ARRAY_MIN.
               COMPUTE IDX2 = IDX + 1.
               PERFORM VARYING IDX2 FROM IDX2 BY 1 UNTIL IDX2 > 5
                   IF NUM(IDX2) < NUM(ARRAY_MIN)
                       MOVE IDX2 TO ARRAY_MIN
                   END-IF
               END-PERFORM.
               MOVE NUM(IDX) TO TEMP.
               MOVE NUM(ARRAY_MIN) TO NUM(IDX).
               MOVE TEMP TO NUM(ARRAY_MIN).
               

