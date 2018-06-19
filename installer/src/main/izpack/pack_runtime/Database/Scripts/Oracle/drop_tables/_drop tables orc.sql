-- execute each statement, copy the result and execute the result itself!!!!
-- so the complete objects (foreign keys, views, tables, ...) are deleted

alter session set current_schema = ORCHESTRA

select concat(concat(concat('alter table ', TABLE_NAME), concat(' drop CONSTRAINT ', CONSTRAINT_NAME)), ';') from ALL_CONSTRAINTS where constraint_type = 'R' and owner = sys_context('USERENV', 'CURRENT_USER') 
SELECT concat(concat('DROP VIEW ', VIEW_NAME), ';') from SYS.ALL_VIEWS where owner = sys_context('USERENV', 'CURRENT_USER') 
SELECT concat(concat('DROP TABLE ', TABLE_NAME), ' PURGE;') from SYS.ALL_TABLES where owner = sys_context('USERENV', 'CURRENT_USER') 
SELECT concat(concat('DROP SEQUENCE ', SEQUENCE_NAME), ';') from USER_SEQUENCES
-- select 'DROP PROCEDURE ' + name from sys.procedures;   only MS SQL Server

-- to remove SYS_LOBs
purge recyclebin;
