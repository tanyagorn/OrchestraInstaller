-- execute each statement, copy the result and execute the result itself!!!!
-- so the complete objects (foreign keys, views, tables, ...) are deleted

SET SCHEMA ORCHESTRA

select concat(concat(concat('alter table ', TABNAME), concat(' drop FOREIGN KEY ', CONSTNAME)), ';') from SYSCAT.REFERENCES where owner = CURRENT_SCHEMA
SELECT concat(concat('DROP VIEW ', VIEWNAME), ';') from syscat.views where owner = CURRENT_SCHEMA
SELECT concat(concat('DROP TABLE ', TABNAME), ';') from syscat.tables where TYPE = 'T' AND owner = CURRENT_SCHEMA
SELECT concat(concat('DROP SEQUENCE ', SEQNAME), ';') from syscat.SEQUENCES where owner = CURRENT_SCHEMA
-- select 'DROP PROCEDURE ' + name from sys.procedures;   only MS SQL Server

