--Order by

/*
ohne order by w�re die Ausgabe mehr oder weniger willk�rlich
besonders im Fall von TOP 10..


ohne Angabe der Sortierrichtung ist die Reihenfolge immer aufsteigend

order by sp asc

nat�rlich auch absteigend

order by sp desc

Man kann auch nach mehreren Spalten sortieren

order by sp1, asc, sp2 desc, sp3 asc, sp4 desc

im order by lassen sich auch die Aliasnamen verwenden.. ;-)

f�r die Faulen.. auch eine Sortierung nach der Position der Spalte ist m�glich
, ist aber nicht empfehlenswert. Sofern eine Spalte vorne dazukommt, 
stimmt die  Position nicht mehr

*/


select * from orders
order by Shipcountry, Shipcity, freight desc

select orderid as BestNr, freight as Fracht , shipcountry  as Land from orders
order by Land,Bestnr, Fracht desc

--identisch 
select orderid as BestNr, freight as Fracht , shipcountry  as Land from orders
order by 3, 2 desc


--aber hier nicht mehr..wg Shipcity
select Shipcity, orderid as BestNr, freight as Fracht , shipcountry  as Land from orders
order by 3, 2 desc


