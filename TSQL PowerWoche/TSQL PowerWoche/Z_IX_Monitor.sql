--Table SEEK
--IX SCAN            CL IX SCAN
--IX SEEK   CL IX SEEK

--Was ist besser
--TABLE SCAN vs CL IX SCAN
--    x                          x

--CL IX SCAN vs   IX SCAN
--                                x

--IX SCAN   vs    IX SEEK
--                             x


--IX SEEK Lookup auf HEAP                vs    IX SEEK Lookup auf CL IX
--                     x                                                      Suche geht immer ber den Wurzelknoten


--über diese Systesicht läßt ich die Verwendung der Indizes sehr gut auslesen
--allerdings vorerst nur IDs.....etwas unterhalb ein SQL Statement zum Auslesen inkl Namen der Tabellen und Indizes
select * from sys.dm_db_index_usage_stats

--Vorsicht: nach Neustart des Sql Servers sind die Werte wieder bei 0!!!

select object_name(i.object_id) as TableName
      ,i.type_desc,i.name
      ,us.user_seeks, us.user_scans
      ,us.user_lookups,us.user_updates
      ,us.last_user_scan, us.last_user_update
  from sys.indexes as i
       left outer join sys.dm_db_index_usage_stats as us
                    on i.index_id=us.index_id
                   and i.object_id=us.object_id
 where objectproperty(i.object_id, 'IsUserTable') = 1
go



 A B C  (999)

 A
 AB
 ABC
 ABC
 ABC


 ACBABCCACB
 ABCACBBACBCACABCBA