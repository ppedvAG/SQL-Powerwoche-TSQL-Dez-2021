select top 3 * from ku

--Abfrage, die Agg pro Sp, where gefiltert

set statistics io, time on
select top 3 productname, sum(unitprice*quantity) as Umsatz from ku
where country = 'Brazil'
group by productname
order by Umsatz desc option(maxdop 8)
--, CPU-Zeit = 374 ms, verstrichene Zeit = 80 ms.

--auffällig: mehr CPU als Dauer
--kann nur einen Grund geben...  mehr Kerne arbeiten hier...
--Doppelpfeile = mehr Kerne 

--mehr Kerne besser für Abfragen!
--SQL nimmt einen Kern oder alle!!
--Kostenlimit: default ab 5 SQL Dollar


--SUSPEND---RUNNABLE---->RUNNING

--Auf dem Server MAXDOP : 4  max8
--AUF DB:								   4 (alle), ausser
--Query:                                  8

----8






