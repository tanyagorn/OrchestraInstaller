-- execute each statement, copy the result and execute the result itself!!!!
-- so the complete objects (foreign keys, views, tables, ...) are deleted

use ORCHESTRA

select concat(concat(concat('alter table ', TABLE_NAME), concat(' drop FOREIGN KEY ', CONSTRAINT_NAME)), ';') from INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS where CONSTRAINT_SCHEMA = database()
SELECT concat(concat('DROP VIEW ', TABLE_NAME), ';') from INFORMATION_SCHEMA.VIEWS where TABLE_SCHEMA = database()
SELECT concat(concat('DROP TABLE ', TABLE_NAME), ';') from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA = database()
-- SELECT concat(concat('DROP SEQUENCE ', SEQNAME), ';') from syscat.SEQUENCES where owner = CURRENT_SCHEMA    only DB2 and Oracle
-- select 'DROP PROCEDURE ' + name from sys.procedures;   only MS SQL Server

