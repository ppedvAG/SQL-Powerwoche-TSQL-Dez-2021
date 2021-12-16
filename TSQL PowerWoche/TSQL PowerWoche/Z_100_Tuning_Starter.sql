select * from customers
where customerid    A%


a)Sicht   b)AdHoc   c)F()   d)Proz

--Langsam----------------------------schnell--->
c   d   a    b
c d b a

 d                                                               d

 create proc gpname @par int
 as
 CODE  where sp = @par

 --Suche Kunden die mit ? beginnen
 --je mehr angegeben wird, desto exakter das Ergebnis
 --bei Angabe von Nichts sollten alle kommen

 exec gpSucheKunden 'ALFKI' --ALFKI  1

 exec gpSucheKunden 'A' --alle A...  4
 
 exec gpSucheKunden  --alle 91

 --schlechter, weil jede Zeile untersucht werden muss..
 select * from employees 
		 where datediff(yy,Birthdate,Getdate()) < 65

 --besser: gezieltes Suchen möglich
 select * from employees 
 where birthdate > dateadd(yy,-65,getdate())







