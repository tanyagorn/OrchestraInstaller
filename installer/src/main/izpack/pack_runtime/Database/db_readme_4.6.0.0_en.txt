MySQL
- deprecated tables removed (JBPM-Tabllen, ORC_SEC_USER, ORC_EVENT_ACTIONS, ...)
- tables and columns now created in upper case name (-> parameter 'lower_case_table_names' should not be necessary anymore)
- Views are created with prefix "SQL SECURITY INVOKER"
- to be compatible with MySQL 5.7 TIMESTAMP was changed to TIMESTAMP NULL
  - in script 50_V4.4.0.0_upgrade.sql CURRENT_TIMESTAMP was used:
    ALTER TABLE `ORC_PROCESS_STATE` MODIFY `PRS_CREATE_TIME` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;
  - in script 40_V4.3.4.0_upgrade.sql this line was changed from NOT NULL to NULL:
    CREATE TABLE ORC_TRANSACTION (
       TRA_CREATE_DATE TIMESTAMP NULL,
    -> the source code is setting a current timestamp
- to be compatible with MySQL 5.5, the type TIMESTAMP must be used to set a default value. The type datetime is not allowed!
- script '_drop tables orc.sql' created

MSSQLServer
- deprecated tables removed (JBPM-Tabllen, ORC_SEC_USER, ORC_EVENT_ACTIONS, ...)
- script '_drop tables orc.sql' changed

Oracle
- deprecated tables removed (JBPM-Tabllen, ORC_SEC_USER, ORC_EVENT_ACTIONS, ...)
- the type LongRAW is deprecated, so changed in scripts to Blob (IN-0001121)
- script '_drop tables orc.sql' created

DB2
- deprecated tables removed (JBPM-Tabllen, ORC_SEC_USER, ORC_EVENT_ACTIONS, ...)
- script '_drop tables orc.sql' created
- Readme_db2.txt adapted for Linux
