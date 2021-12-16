select * from kundeneu
select * from customers
--Idee: unterschied zwischen den beiden Tabellen
--und die Gemeinsamkeiten  
--Welche Datens�tze sind identisch in beiden Tabellen

---Idee:  JOIN Customerid

update Customers set city = 'Leipzig' where customerid = 'ALFKI'
GO

delete from kundenEU where customerid= 'AROUT'
GO


--kompletter Vergleich des gesamten Datensatzes
select customerid, companyname, country, city from customers
intersect
select * from kundenEu


select customerid, companyname, country, city from customers
except
select * from kundenEu

--die Reihenfolge machts
select customerid, companyname, country, city from kundenEu
except
select customerid, companyname, country, city  from customers

--Welche L�nder gibts in Customers aber nicht in Employees


select country from customers
except
select country from employees --19

select country  from employees
except 
select country from customers --0

