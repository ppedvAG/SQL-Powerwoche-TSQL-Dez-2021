select * from customers
where customerid    A%


a)Sicht   b)AdHoc   c)F()   d)Proz

--Langsam----------------------------schnell--->
c   d   a    b
c d b a

 d                                                               d

 create proc gpname @par int
 as
 CODE  where sp like @par

 --Suche Kunden die mit x beginnen
 --je mehr angegeben wird, desto exakter das Ergebnis
 --bei Angabe von Nichts sollten alle kommen

 exec gpSucheKunden 'ALFKI' --ALFKI  1

 exec gpSucheKunden 'D' --alle D...  4
 
 exec gpSucheKunden  --alle 91


 --Vorgeschlagene Lösungen
 --VARIANTE 1:
 create proc gpSucheKunden @CustID varchar(10)
 as
 select * from customers where customerid like concat(@CustID, '%')

 --VARIANTE 2:
 create proc gpSucheKunden @CustID nvarchar(5)
 as
 select * from customers where customerid like @custid + '%'


 --VARIANTE 3:
 create proc gpSucheKunden @CustID nchar(5)
 as
 select * from customers where customerid like rtrim(@custid) + '%'

 -->TIPP:
 /*
 bei Variablen und Parametern muss der Datentyp nicht unbedingt exakt eingestellt sein: 
 zB SPX varchar(50)

 @Var varchar(50)

 Problem: SQL Server schätzt variable Datentypen im Speicher nur zur Hälfte ein
 D.H. Die Vorabschätzung wieviel RAM für die Abfrage verwendet werden muss
 wird oft zu gering eingeschätzt. Vor allem, wenn ein order by dazu kommt.

 Was kann man tun: Variabe größer einschätzen:
 SPX varchar(50)

 @VAR varchar(150) 

  */

 select * from Employees where datediff(yy, birthdate, getdate() ) >= 65

  select * from Employees where birthdate <= dateadd(yy,-65, getdate())

  declare @DATUM as datetime
  select @DAtum = dateadd(yy,-65, getdate())
    select * from Employees where birthdate <= @Datum


 
 
 
 exec gpSucheKunden 'ALFKI' --ALFKI  1
  exec gpSucheKunden 'A' --keiner 'A    %%%%%'
  exec gpSucheKunden  --keiner



  --suche alle Ang, die heute in Rente sind (65)
  select birthdate from Employees










