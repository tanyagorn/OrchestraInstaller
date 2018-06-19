-- execute each statement, copy the result and execute the result itself!!!!
-- so the complete objects (foreign keys, views, tables, ...) are deleted

USE [ORCHESTRA]

select 'alter table ' + OBJECT_NAME(parent_object_id) + ' drop constraint ' + name from sys.foreign_keys
select 'DROP VIEW ' + name from sys.views
select 'DROP TABLE ' + name from sys.tables
select 'DROP PROCEDURE ' + name from sys.procedures;
-- SELECT concat(concat('DROP SEQUENCE ', SEQNAME), ';') from syscat.SEQUENCES where owner = CURRENT_SCHEMA    only DB2 and Oracle

