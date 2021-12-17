Salamitaktik


--TAB A 10000 DS
--TAB B  100000 DS

select * from A where sp=100 --10 Zeilen 
select * from B where sp = 100 ---10 Zeilen


--Variante 1:

--UMSATZ ( zig MIO)

--U2021 U2020 U2019 U2018

select * from umsatz where jahr = 2021


create table  U2021 (id int identity, jahr int, spx int)
create table  U2020 (id int identity, jahr int, spx int)
create table  U2019 (id int identity, jahr int, spx int)
create table  U2018 (id int identity, jahr int, spx int)



create view UMSATZ
as
select * from u2021
UNION  ALL
select * from u2020
UNION ALL
select * from U2019
UNION ALL --kein Suche nach doppelten
select * from u2018

--kein Effekt.. muss alles durchsuchen
select * from umsatz where jahr = 2019 --Pläne
select * from umsatz 


--CHECK Contraints... ;-) Garantiesiegel, dass nur best Werte
--vorkommen dürfen... 
ALTER TABLE dbo.U2018 
	ADD CONSTRAINT	CK_U2018 CHECK (jahr=2018)




select * from umsatz where ID = 2019 ---alles

--LESEN ist super..
--INS UP DEL
--jetzt wirs echt blöd

insert into umsatz (id,jahr, spx)
values
							(1,2019, 100)

	--eigtl unbrauchbar
	--wenn dann hur für lesende Daten



	-----PARTITIONIERUNG

	--DATEIGRUPPE


	--Last auf HDD reduzieren-- weniger IO

	--> HOT  (Dateigruppenname..)

	-->STAMM

	--jede DB hat 2 Dateien: mdf (Daten)--> Dateigruppen (PRIMARY)  ldf (logfile)

	create table txxx(id int) ON [PRIMARY]

	
	create table txxx(id int) ON HOT 

	BWIN -- 1 Tabelle auf 1000 HDDs


	--bis zu 15000 Bereiche
	F(117)-2
	---------------!100]---------------------200]-------------------5000-------------------
	--     1                                 2                                                       3

	--date datetime

	
	--PartSchema (DR1 DGR2 DG3 # F())
	--                    1        2        3


	--4 Dgruppen: bis100 bis200 bis5000 rest

	--1. Partfunktion

	-----100---------200----------- int

	create partition function fZahl(int)
	as
	RANGE LEFT FOR VALUES (100,200)

	select $partition.fzahl(117) --2

--Part Schema.. Verantworloch fü+r das physiklaische Verteilen 
--und holen der Daten
	create partition scheme schZahl
	as
	partition fzahl to (bis100,bis200,rest)
	------------------    1          2          3

--Tabelle auf Schema legen und Spalte für Verteilung angeben
create table ptab(
					id int identity, nummer int, spx char(4100)
							) on schZahl(nummer)


declare @i as int = 1
begin tran
while @i <=20000
	begin
			insert into ptab (nummer, spx) values (@i, 'XY')
			set @i+=1
	end
commit


set statistics io , time on


select * from ptab where id = 100
select * from ptab where nummer = 100


	create table ptab(id..) on (DGR1, DGR2, DGR3+F())




select * from ptab where id = 100
select * from ptab where nummer = 100
--Suche mit HEAP "SEEK".. von einem Haufen raussuchen (wir haben 3)

--1117
select * from ptab where nummer = 1117 --19800


--Muss schneller werden
-----------------100----------200--------------------------
-----------------100-----------200----------------------5000---------------------------

--ptab   fZahl  schZahl    Dgruppen

--ptab  nieeeeeee!!

--f() mmmhh ja!

--schZahl   bis100, bis200, rest ... jaaaahh muss man ändern!

--neue Grenze 5000
--zuerst schema
alter partition scheme schZahl next used bis5000  --passiert bisher nix!

select $partition.fzahl(nummer), min(nummer), max(nummer), count(*) 
from ptab
group by  $partition.fzahl(nummer)

alter partition function fzahl() split range (5000) --jetzt gehts los

------------100----200------- S P L I T             -----------

select $partition.fzahl(nummer), min(nummer), max(nummer), count(*) 
from ptab
group by  $partition.fzahl(nummer)


select * from ptab where nummer = 1117

--- Grenze muss weg
--100 muss raus

----------!100!----------200------------5000-------

-------------------------200---------5000--------------

--Ptab   fZahl  schZahl
--Ptab: nieeeee!!!!!
--F().. logo  nur noch 1 2 3 statt 1 2 3 4
--schZahl: nö

alter partition function fzahl()  merge range (100)

--Was wäre wenn.... 
--archivieren von Daten 5001 bis 20000 


--Wo ist das Zeug überhaupt?

USE [Northwind]
GO


CREATE PARTITION FUNCTION [fZahl](int) AS 
RANGE LEFT FOR VALUES (200, 5000)

CREATE PARTITION SCHEME [schZahl] AS 
PARTITION [fZahl] TO ([bis200], [bis5000], [rest])
GO


create table archiv (id int not null, nummer int, spx char(4100))
on rest

alter table ptab switch partition 3 to archiv
--Daten sind inArchiv und in patb weg..

select * from ptab
select * from archiv

--100MB/Sek 
--100000000MB--> 0


----------------------------------
A1111111111111

----------------------------------

select * from ptab where id = 100




--TRICK:: Partition wird in Tabelle konvertiert













--auf allen Tabellen  muss ein PK her						









	
	--Jahresweise: 2021 2020
	create partition function fZahl(datetime)
	as
	RANGE LEFT FOR VALUES ('31.12.2019','1.1.2021',,,,,,,)

	-- A bis M     N bis R   S bis Z
create partition function fZahl(varchar(50))
	as
	RANGE LEFT FOR VALUES ('N','')

	---2020------1.1.2021]-----------------GR]-----

	select $partition.fzahl(117) --2

--Part Schema.. Verantworloch fü+r das physiklaische Verteilen 
--und holen der Daten
	create partition scheme schZahl
	as
	partition fzahl to ([PRIMARY],[PRIMARY],[PRIMARY])
	A
	-----------------------------------------------------
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
aaabbbbccccccddddddddddddeeeeeeeeeeeeeee
	-----------------------------------------------------



