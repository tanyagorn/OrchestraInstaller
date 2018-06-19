--WHENEVER SQLERROR EXIT SQL.SQLCODE

CREATE TEMPORARY TABLESPACE "ORCTEMP" 
    TEMPFILE 'D:\oracle\oradata\EPITEST\ORCTEMP01.DBF' SIZE 64M REUSE 
    AUTOEXTEND 
    ON NEXT  64M MAXSIZE  250M EXTENT MANAGEMENT LOCAL 
    UNIFORM SIZE 1024K;

CREATE TABLESPACE "ORCUSRDAT" 
    LOGGING 
    DATAFILE 'D:\oracle\oradata\EPITEST\ORCUSRDAT01.DBF' SIZE 256M REUSE 
    AUTOEXTEND 
    ON NEXT  256M MAXSIZE  16383M EXTENT MANAGEMENT LOCAL 
    SEGMENT SPACE MANAGEMENT  AUTO;

CREATE TABLESPACE "ORCUSRIDX" 
    LOGGING 
    DATAFILE 'D:\oracle\oradata\EPITEST\ORCUSRIDX01.DBF' SIZE 128M REUSE 
    AUTOEXTEND 
    ON NEXT  128M MAXSIZE  1024M EXTENT MANAGEMENT LOCAL 
    SEGMENT SPACE MANAGEMENT  AUTO;

COMMIT;
