--ovyh.ad�vanie predmetov pod.a autorov, n�zvov,
--vydavate.stva, konferencie z ktorej je zborn�k, k.�.ov�ch slov s mo.nos.ou
--zada. viacer� podmienky 

SET PAGESIZE 50
SET LINESIZE 120

TTITLE CENTER 'Prehlad vypoziciek citatela'
COLUMN meno HEADING 'Priezvisko a meno' FORMAT A40
COLUMN datum_pozicky HEADING 'Datum|Pozicky' FORMAT A20
COLUMN datum_vratenia HEADING 'Datum|vratenia' FORMAT A20

BREAK ON meno

SELECT priezvisko || ' ' || meno meno, nazov, datum_pozicky, datum_vratenia
FROM sem_citatel, sem_pozicka, sem_predmet
WHERE sem_citatel.id_citatela=sem_pozicka.id_citatela(+)
AND sem_pozicka.id_predmetu=sem_predmet.id_predmetu(+)
AND sem_citatel.id_citatela LIKE NVL('&id_citatela','%')
GROUP BY priezvisko, meno, nazov, datum_pozicky, datum_vratenia;