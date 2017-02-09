--opreh.ad vypo.i.an�ch a zatia. nevr�ten�ch predmetov pod.a r�znych
--krit�ri� + kto ich m� po.i.an� 

SET PAGESIZE 50
SET LINESIZE 66

TTITLE CENTER 'Prehlad nevratenych predmetov'
COLUMN typ HEADING 'Typ' FORMAT A3
COLUMN nazov HEADING 'Nazov' FORMAT A20
COLUMN meno HEADING 'Meno' FORMAT A20
COLUMN priezvisko HEADING 'Priezvisko' FORMAT A20

BREAK ON typ SKIP 1

SELECT typ, nazov,meno, priezvisko FROM sem_predmet, sem_pozicka,
sem_citatel
WHERE sem_predmet.id_predmetu=sem_pozicka.id_predmetu
AND sem_citatel.id_citatela=sem_pozicka.id_citatela
AND datum_vratenia IS NULL
GROUP BY nazov, typ, priezvisko, meno;
