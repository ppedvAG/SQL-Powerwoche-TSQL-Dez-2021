--INDIZES

--CLUSTERED INDEX  gruppierter
gibt nur 1 mal pro Tabelle..
zuerst festlegen!!! 
Bereichsabfragen
PK oft als CL IX eindeutig verschwendet
--kann man inEntwurfsasnsicht ändern


--NON CLUSTERD INDEX nicht grupp.

--bis zu 1000mal pro Tabelle
gut bei Abfragen mit rel. wenig Ergebniszeilen 1%..nicht fix

----------------------------------------------
/*
! zusammengesetzter IX
IX mit eingeschl Spalten
gefilterter IX
! abdeckender IX -- der ideale IX zur ABfrage kein Lookup kein Scan
ind Sicht
part IX
realer hypoth. IX
! eindeutiger IX
----------------------------------------------
Columnstore IX (gr und nicht gr)

*/

--ID einfügen in KU1

alter table ku1 add id int identity

--HEAP oder CL IX-- HEAP

select * from ku1 -- TABLE  SCAN

--CLIX Tabellen sehen immerm sortiert aus
set statistics io, time on
--TABLE SCAN
select id from ku1 where id = 100 
--56385 Seiten

--zuerst den CL IX festlegen: Orderdate

--NCLIX_ID
--IX_SEEK
select id from ku1 where id = 100 
--3 

--IX SEEK + Lookup (Anruf)
select id, freight from ku1 where id = 100

select id, freight from ku1 where id < 10900
--hier schon scan---weniger als 1 % der gesamten Menge

--NIX_ID_FR
select id, freight from ku1 where id < 900000-- Seek
--2913 statt bei Scan 56000
select id, freight from ku1 where id < 100 -- Seek
select id, freight from ku1 where id = 100 --Seek



