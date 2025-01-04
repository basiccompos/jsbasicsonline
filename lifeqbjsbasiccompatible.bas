'John Conway's Game of Life
'Programmed by Ben Wagner

SCREEN 9, 0, 0, 1

RANDOMIZE TIMER

WINDOW (0, 0)-(80, 80)

'The first matrix is the current, matrixa is the next iteration
DIM matrix(-1 TO 81, -1 TO 81)
DIM matrixa(-1 TO 81, -1 TO 81)

'Randomise the cells
y = 0
DO
    x = 0
   
    DO
        x = x + 1
        matrix(x, y) = INT(RND + .5)
    LOOP UNTIL x > 80
        
    y = y + 1

LOOP UNTIL y > 80


'Set MatrixA to 0
y = 0
DO
    x = 0
  
    DO
        x = x + 1
        matrixa(x, y) = 0
    LOOP UNTIL x > 80
        
    y = y + 1

LOOP UNTIL y > 80


'Main Loop
DO
CLS

'Draws the matrix
y = 0
DO
    x = 0
             
    DO
        IF matrix(x, y) = 1 THEN LINE (x, y)-(x + 1, y + 1), 1, BF
        x = x + 1
    LOOP UNTIL x > 80
       
    y = y + 1

LOOP UNTIL y > 80


'Counts the surrounding cell tally
'Then applies the operation to the cell
y = 0
DO
    x = 0
    DO
        'Counts surrounding cells
        tally = 0
        
        IF matrix(x - 1, y + 1) = 1 THEN tally = tally + 1
        IF matrix(x, y + 1) = 1 THEN tally = tally + 1
        IF matrix(x + 1, y + 1) = 1 THEN tally = tally + 1
        IF matrix(x - 1, y) = 1 THEN tally = tally + 1
        IF matrix(x + 1, y) = 1 THEN tally = tally + 1
        IF matrix(x - 1, y - 1) = 1 THEN tally = tally + 1
        IF matrix(x, y - 1) = 1 THEN tally = tally + 1
        IF matrix(x + 1, y - 1) = 1 THEN tally = tally + 1


        'Applies operations
        'Death
        IF matrix(x, y) = 1 THEN
            IF tally = 2 OR tally = 3 THEN matrixa(x, y) = 1 ELSE matrixa(x, y) = 0
        END IF

        'Birth
        IF matrix(x, y) = 0 THEN
            IF tally = 3 THEN matrixa(x, y) = 1 ELSE matrixa(x, y) = 0
        END IF

        x = x + 1
       
    LOOP UNTIL x > 80
      
    y = y + 1

LOOP UNTIL y > 80

'Updates the matrix with the new matrix we have calculated
y = 0
DO
    x = 0
 
    DO
        x = x + 1
        matrix(x, y) = matrixa(x, y)
    LOOP UNTIL x > 80
        
    y = y + 1

LOOP UNTIL y > 80

PCOPY 0, 1

LOOP WHILE INKEY$ = ""
