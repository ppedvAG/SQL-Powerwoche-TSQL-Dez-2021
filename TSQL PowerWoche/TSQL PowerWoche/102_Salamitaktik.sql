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

insert into umsatz (jahr, spx)
values
							(2019, 100)

--auf allen Tabellen  muss ein PK her						











