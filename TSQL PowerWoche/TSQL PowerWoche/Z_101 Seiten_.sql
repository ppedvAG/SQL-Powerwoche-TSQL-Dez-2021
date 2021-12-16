Spieltabelle

SELECT      Customers.CustomerID, Customers.CompanyName, Customers.ContactName, Customers.ContactTitle, Customers.City, Customers.Country, Orders.EmployeeID, Orders.OrderDate, Orders.Freight, Orders.ShipCity, Orders.ShipCountry, [Order Details].OrderID, [Order Details].ProductID, 
                   [Order Details].UnitPrice, [Order Details].Quantity, Products.ProductName, Products.UnitsInStock, Employees.LastName, Employees.FirstName, Employees.BirthDate
INTO KU
FROM         Customers INNER JOIN
                   Orders ON Customers.CustomerID = Orders.CustomerID INNER JOIN
                   Employees ON Orders.EmployeeID = Employees.EmployeeID INNER JOIN
                   [Order Details] ON Orders.OrderID = [Order Details].OrderID INNER JOIN
                   Products ON [Order Details].ProductID = Products.ProductID


insert into ku
select * from ku ---551000.. 4 Sek


select * into ku1 from ku --2 Sekunden


--DB DESIGN

/*
Normalisierung
1. NF  2.NF 3.NF 

--> Redundanz vermeiden

--RNGSUMME


--PK

--Physik 



DS kommen in Seiten (8192bytes)


Seite hat max 700 Slots (DS)

1 Seite kann max 8072 bytes haben
--text: 2 GB image 2 GB  varbinary(max) 2 GB
mit fixen Länge max 8060 Zeichen pro DS
1 DS muss in Seite passen



1 MIO DS a 4100 --> 1 MIO Seiten --> 8 GB (HDD) ===> auch im RAM

1 Seite mit 51% Füllgrad auch im RAM 

8 Seiten am Stück heißen Block (64k)



*/

create table t1 (sp int, sp2 char(4100), sp3 varchar(4100))


*/





dbcc showcontig('ku')
--- Gescannte Seiten.............................: 41622
--- Mittlere Seitendichte (voll).....................: 98.09%


-- Fax1 Fax2 Fax3 Hobby1 Hobby2 Hobby3 Frau1 Frau2 Frau3 Frau4 RELIGION

create table txyz(id int identity, sp1 char(4100))

insert into txyz
select 'XY'
GO 20000 --10 Sek... 5 mal so lange wie 1 MIO wegkopieren
--> 1 Min

--Wie groß ist die Tabelle?
--theoretisch: 20000*4kb      praktisch: 160


-----> ZIEL. weniger Seiten!!!!!
				----> weniger RAM Verbrauch
				----> weniger CPU Verbrauch





--Messverfahren:


dbcc showcontig('ku')
set statistics io, time on
set statistics io, time off
--io : Anzahl der Seiten
--CPU: ms 
--Dauer: gesamte Ausführungsdauer in ms

select * from txyz where id = 100

--PLÄNE

select * from customers where customerid ='ALFKI' 
--weniger Seiten als die Tabelle hat

select * from customers where customerid like '%I' 

select * from customers where customerid like 'AL%' 

select * from customers where left(customerid,2)= 'AL'
--von rechts  nach links Datenquellen
--SCAN: alles von A bis Z durchsuchen
--SEEK: gezieltes Herauspicken


select * from txyz where id = 100
select * from txyz where id = 200









