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
! zusammengesetzter IX (max 16 Spalten, max 900bytes)
! IX mit eingeschl Spalten (ca 1000 Spalten)
! gefilterter IX
! abdeckender IX -- der ideale IX zur ABfrage kein Lookup kein Scan
ind Sicht --Das Ergebnis der Sicht wird indiziert 
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





--NCLIX_ID_i_FR
select id, freight from ku1 where id = 100 --IX 


--
select id, freight, country from ku1 where id < 100  and City = 'london'





select productname, sum(unitprice*quantity) as Umsatz from ku1
where shipcountry = 'Brazil' and freight < 5
group by productname
order by Umsatz desc 


select productname, sum(unitprice*quantity) as Umsatz
from ku1
where shipcountry = 'Brazil' or freight < 5
group by productname
order by Umsatz desc 


select productname, sum(unitprice*quantity) as Umsatz
from ku1
where shipcountry = 'Brazil' and shipcity = 'Rio'
group by productname
order by Umsatz desc 


set statistics io, time on

select country, count(*) as ANZ from ku1
group by country


create view v1 
as
select country, count(*) as ANZ from ku1
group by country


select * from v1


select country, count(*) as ANZ from ku1
group by country


alter   view v1 with schemabinding
as
select country, count_big(*) as ANZ from dbo.ku1
group by country


2000000 Trd DS Sicht ind

--LAND UMSATZ--> 2 Seiten



select freight, shipcountry from ku1
where id<1000 and Shipcountry = 'USA'


NCLIX_filterUSA

select freight, shipcountry from ku1
where id<1000 and Shipcountry = 'Germany'

select freight, shipcountry from ku1
where id<1000 and Shipcountry = 'USA'

--ist der gefilterte als der ungefilterte


select * into ku2 from ku1

select top 3 * from ku2

--Berechnung pro .. where 

--idealer IX
--Anzahl der Bestellungen pro Land und Kunde , die wo "Outback Lager" bestellt haben
select shipcountry ,companyname, count(*) as anz 
from ku1
where freight < 10 --ProductName = 'Outback Lager'
group by shipcountry, companyname
--NCLIX_PName_i_scy_cn
--, CPU-Zeit = 16 ms, verstrichene Zeit = 14 ms. ...241


select shipcountry ,companyname, count(*) as anz 
from ku2
where freight <10 --ProductName = 'Outback Lager'
group by shipcountry ,companyname


--a) stimmt  b) stimmt nicht
--a--> aus 300MB ---> 4 MB---> 3,2MB --> RAM

