---Reduzierung von IO immer noch oberstes Ziel

--Kompression: Seiten oder Zeile

--Zeile: Datens�tze verkleinern und DS in weniger Seiten zusammenfassen
--Page: zuerst row Kompression + Algorithmus f�r Kompression

--zu erwarten: 40 bis 60%

---txyz--160MB--> da extrem viel leerer Platz

--was passiert mit komp Tabellen...?

--Server neustarten
--Taskmanager: RAM 212--> 382 SQL Server: 

set statistics io, time on
select * from northwind..txyz

--Seiten:   20000             DAUER:  992   CPU:  187

--Nach Kompression: Tabelle 500kb

---RAM nach Neustart: ca .gleich  RAM nach Ausf�hrung:  lediglich  + 500kb
--Seiten: weniger     Dauer:  l�nger   CPU: mehr

--Seiten werden im Verh�ltnis   1 :1    von HDD in RAM geladen

--seiten 33...  CPU: 140   Dauer: 725

--in der Praxis eher: weniger IO, aber evtl etwas mehr CPU
---weniger IO --> weniger RAM  zugunsten der anderen Tabellen
--Vorsicht: bei Tabellen, die sich kaum komprimieren lassen , macht das wenig SInn
--kaum RAM gewonnen, aber mehr CPU verbraucht..

--also mit Gef�hl einsetzen