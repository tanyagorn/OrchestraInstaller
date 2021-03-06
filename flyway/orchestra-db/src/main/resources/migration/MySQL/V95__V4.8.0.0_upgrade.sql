--  *********************************************************************
--  Create Database Script
--  *********************************************************************
--  Change Log: /opt/liquibase/data/orchestra_4.8.0.0.xml
--  Ran at: 6/27/18 10:43 AM
--  Liquibase version: 2.0.5
--  *********************************************************************

--  Changeset /opt/liquibase/data/orchestra_4.8.0.0.xml::change-4.8.0.0-1::akn::(Checksum: 6:e7f31347d6112115fc3de8e63e475bfd)
INSERT INTO ORC_SEC_ROLE_V2 (OSR_SCENARIO, OSR_IDENTIFIER, OSR_DESC) VALUES ('RUNTIME', 'RUNTIME:Cell.Admin', 'Allows acces to the CellCommunicationServiceMonitor');

INSERT INTO ORC_SEC_USER_ROLES_V2 (OUR_USER_ID, OUR_ROLE_ID) VALUES ('RUNTIME:admin', 'Cell.Admin');

--  Changeset /opt/liquibase/data/orchestra_4.8.0.0.xml::change-4.8.0.0-2::akn::(Checksum: 6:2fc5cffea57783c0730ce97019eda7dd)
DROP INDEX IDX_TOPIC_QUEUE_TOPIC_ID ON ORC_TOPIC_QUEUE;

CREATE INDEX IDX_ESB_SIG_STATE_DATE ON ORC_ESB_SIGNAL_STATE(EST_DATE);

--  Changeset /opt/liquibase/data/orchestra_4.8.0.0.xml::change-4.8.0.0-3_JUNO::akn::(Checksum: 6:7b7ca4d9cd8bea6ac60960cc210ee337)
CREATE TABLE ORC_COMM_PWD (ORC_COMMNAME VARCHAR(40) NULL, ORC_PWD VARCHAR(255) NULL, ORC_IS_ACTIVE INT NULL) ENGINE= innodb;

CREATE TABLE ORC_SCENARIO_ELEMENT_SETTINGS (SES_SCENARIO VARCHAR(255) NULL, SES_UNIQUE_NAME VARCHAR(255) NOT NULL, SES_NAME VARCHAR(255) NULL, SES_CHANGEDAT DATETIME NULL, SES_DATA LONGBLOB NULL) ENGINE= innodb;

ALTER TABLE ORC_SCENARIO_ELEMENT_SETTINGS ADD PRIMARY KEY (SES_UNIQUE_NAME);

--  Changeset /opt/liquibase/data/orchestra_4.8.0.0.xml::change-4.8.0.0-4::akn::(Checksum: 6:114df9d2b5fbc25dda52be2fb15455dc)
CREATE TABLE ORC_LANDSCAPE_HIST (LAN_UNIQUE_NAME VARCHAR(255) NOT NULL, LAN_SCENARIO VARCHAR(255) NOT NULL, LAN_VERSION VARCHAR(255) NOT NULL, LAN_NAME VARCHAR(255) NULL, LAN_USERNAME VARCHAR(255) NULL, LAN_DATA LONGBLOB NULL, LAN_DEPLOYED_AT DATETIME NOT NULL) ENGINE= innodb;

ALTER TABLE ORC_LANDSCAPE_HIST ADD PRIMARY KEY (LAN_UNIQUE_NAME, LAN_VERSION);

--  Changeset /opt/liquibase/data/orchestra_4.8.0.0.xml::change-4.8.0.0-4_1::akn::(Checksum: 6:c1eeb714dea6adc761d49e5ae3fa6c59)
INSERT INTO ORC_LANDSCAPE_HIST(LAN_SCENARIO, LAN_VERSION, LAN_NAME, LAN_DATA, LAN_DEPLOYED_AT, LAN_UNIQUE_NAME) select LAN_SCENARIO, 'Initial', LAN_NAME, LAN_DATA, LAN_DEPLOYED_AT, LAN_UNIQUE_NAME from ORC_LANDSCAPE;

ALTER TABLE ORC_PROCESS_MODELLS_HIST ADD COLUMN PMO_USERNAME VARCHAR(255) NULL AFTER PMO_NAME;

-- ORC-1045: Process Tree
ALTER TABLE ORC_PROCESS_STATE ADD PRS_PARENT_PROCESS_ID VARCHAR(255) DEFAULT NULL;
DROP VIEW ORC_PROCESS_STATE_MONITOR_V;
CREATE SQL SECURITY INVOKER VIEW ORC_PROCESS_STATE_MONITOR_V AS SELECT PRS_PROCESS_ID, PRS_MODELL_ID, PRS_START_TIME, PRS_END_TIME, PRS_STATE, PRS_BUSINESS_KEY, PRS_SCENARIO_ID, PRS_ROOT_TOKEN,	PRS_PROCESS_MODEL, PRS_VERSION_TAG, PRS_CREATE_TIME, PRS_NODE,TIMESTAMPDIFF( SECOND,PRS_START_TIME,PRS_END_TIME) AS 'PRS_DURATION',PRS_PARENT_PROCESS_ID,PRS_DELETED FROM ORC_PROCESS_STATE;

-- Workaround: Missing column in ORC_PROCESS_STATE
ALTER TABLE ORC_PROCESS_STATE ADD COLUMN PRS_MOVE_ON_RECOVERY INTEGER;

-- ORC-806
INSERT INTO ORC_MONITOR_TABLESETTINGS (ORC_PARENT_USERID, ORC_TABLECLASS, ORC_AUTOREFRESH, ORC_MAXELEMENTS, ORC_REFRESHINTERVAL, ORC_DEFAULT_SORT_COLUMN, ORC_DEFAULT_SORT_ASCENDING, ORC_COLUMN_PATTERN) VALUES ('RUNTIME:Admin', 'LandscapeHistoryTable', 0, 10, 20000, 2, 1, 'n,n,n');

