--WHENEVER SQLERROR EXIT SQL.SQLCODE

--PROMPT connect to ORC as user system
--CONNECT system/system@ORC

PROMPT create role ORCUSER
CREATE ROLE ORCUSER;

PROMPT grant CREATE SESSION
grant CREATE SESSION to ORCUSER;

PROMPT grant ALTER SESSION
grant ALTER SESSION to ORCUSER;

PROMPT grant CREATE TABLE
grant CREATE TABLE to ORCUSER;

PROMPT grant CREATE VIEW
grant CREATE VIEW to ORCUSER;

PROMPT grant CREATE SEQUENCE
grant CREATE SEQUENCE to ORCUSER;

PROMPT grant CREATE SYNONYM
grant CREATE SYNONYM to ORCUSER;

PROMPT grant CREATE PROCEDURE
grant CREATE PROCEDURE to ORCUSER;

PROMPT grant CREATE TRIGGER
grant CREATE TRIGGER to ORCUSER;

PROMPT grant CREATE DATABASE LINK
grant CREATE DATABASE LINK to ORCUSER;


PROMPT create schema ORC

CREATE USER ORCHESTRA
    IDENTIFIED BY ORCHESTRA
DEFAULT TABLESPACE ORCUSRDAT
TEMPORARY TABLESPACE ORCTEMP
;

grant ORCUSER to ORCHESTRA;

grant UNLIMITED TABLESPACE to ORCHESTRA;

COMMIT;