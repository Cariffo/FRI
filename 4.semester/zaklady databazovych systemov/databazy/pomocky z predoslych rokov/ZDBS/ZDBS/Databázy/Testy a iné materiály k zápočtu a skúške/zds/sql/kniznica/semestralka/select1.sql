--preh.ad kn�h, .asopisov, zborn�kov a ich .l�nkov, .l�nkov
--mimo zborn�kov�ch, diplomov�ch pr�c, CD pr�loh, CD zborn�kov, ... (.alej
--bud� naz�van� - predmet) 

SET PAGESIZE 50
SET LINESIZE 67

TTITLE CENTER 'Prehlad predmetov'
COLUMN typ HEADING 'Typ' FORMAT A3
COLUMN nazov HEADING 'Nazov' FORMAT A20
COLUMN vydavatelstvo HEADING 'Vydavatelstvo' FORMAT A20
COLUMN info HEADING 'Info' FORMAT A20

BREAK ON typ SKIP 1

SELECT typ, nazov, vydavatelstvo, info FROM sem_predmet
GROUP BY typ,nazov,vydavatelstvo,info;
