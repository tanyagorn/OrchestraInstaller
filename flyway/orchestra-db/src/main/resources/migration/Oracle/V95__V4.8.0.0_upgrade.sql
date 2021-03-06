-- *********************************************************************
-- Create Database Script
-- *********************************************************************
-- Change Log: /opt/liquibase/data/orchestra_4.8.0.0.xml
-- Ran at: 6/27/18 9:43 AM
-- Liquibase version: 2.0.5
-- *********************************************************************

-- Changeset /opt/liquibase/data/orchestra_4.8.0.0.xml::change-4.8.0.0-1::akn::(Checksum: 6:e7f31347d6112115fc3de8e63e475bfd)
INSERT INTO ORC_SEC_ROLE_V2 (OSR_SCENARIO, OSR_IDENTIFIER, OSR_DESC) VALUES ('RUNTIME', 'RUNTIME:Cell.Admin', 'Allows acces to the CellCommunicationServiceMonitor');

INSERT INTO ORC_SEC_USER_ROLES_V2 (OUR_USER_ID, OUR_ROLE_ID) VALUES ('RUNTIME:admin', 'Cell.Admin');

-- Changeset /opt/liquibase/data/orchestra_4.8.0.0.xml::change-4.8.0.0-2::akn::(Checksum: 6:2fc5cffea57783c0730ce97019eda7dd)
DROP INDEX IDX_TOPIC_QUEUE_TOPIC_ID;

CREATE INDEX IDX_ESB_SIG_STATE_DATE ON ORC_ESB_SIGNAL_STATE(EST_DATE);

-- Changeset /opt/liquibase/data/orchestra_4.8.0.0.xml::change-4.8.0.0-3_JUNO::akn::(Checksum: 6:7b7ca4d9cd8bea6ac60960cc210ee337)
CREATE TABLE ORC_COMM_PWD (ORC_COMMNAME VARCHAR2(40), ORC_PWD VARCHAR2(255), ORC_IS_ACTIVE INTEGER);

CREATE TABLE ORC_SCENARIO_ELEMENT_SETTINGS (SES_SCENARIO VARCHAR2(255), SES_UNIQUE_NAME VARCHAR2(255) NOT NULL, SES_NAME VARCHAR2(255), SES_CHANGEDAT TIMESTAMP, SES_DATA BLOB);

ALTER TABLE ORC_SCENARIO_ELEMENT_SETTINGS ADD CONSTRAINT PK_SCENELESETTING PRIMARY KEY (SES_UNIQUE_NAME);

-- Changeset /opt/liquibase/data/orchestra_4.8.0.0.xml::change-4.8.0.0-4::akn::(Checksum: 6:114df9d2b5fbc25dda52be2fb15455dc)
CREATE TABLE ORC_LANDSCAPE_HIST (LAN_UNIQUE_NAME VARCHAR2(255) NOT NULL, LAN_SCENARIO VARCHAR2(255) NOT NULL, LAN_VERSION VARCHAR2(255) NOT NULL, LAN_NAME VARCHAR2(255), LAN_USERNAME VARCHAR2(255), LAN_DATA BLOB, LAN_DEPLOYED_AT TIMESTAMP NOT NULL);

ALTER TABLE ORC_LANDSCAPE_HIST ADD CONSTRAINT PK_ORC_LANDHIST PRIMARY KEY (LAN_UNIQUE_NAME, LAN_VERSION);

-- Changeset /opt/liquibase/data/orchestra_4.8.0.0.xml::change-4.8.0.0-4_1::akn::(Checksum: 6:c1eeb714dea6adc761d49e5ae3fa6c59)
INSERT INTO ORC_LANDSCAPE_HIST(LAN_SCENARIO, LAN_VERSION, LAN_NAME, LAN_DATA, LAN_DEPLOYED_AT, LAN_UNIQUE_NAME) select LAN_SCENARIO, 'Initial', LAN_NAME, LAN_DATA, LAN_DEPLOYED_AT, LAN_UNIQUE_NAME from ORC_LANDSCAPE;

ALTER TABLE ORC_PROCESS_MODELLS_HIST ADD PMO_USERNAME varchar(255);

-- ORC-1045: Process Tree
ALTER TABLE ORC_PROCESS_STATE ADD PRS_PARENT_PROCESS_ID VARCHAR(255);

DROP VIEW ORC_PROCESS_STATE_MONITOR_V;
CREATE VIEW ORC_PROCESS_STATE_MONITOR_V AS SELECT PRS_PROCESS_ID, PRS_MODELL_ID, PRS_START_TIME, PRS_END_TIME, PRS_STATE, PRS_BUSINESS_KEY, PRS_SCENARIO_ID, PRS_ROOT_TOKEN, PRS_PROCESS_MODEL, PRS_VERSION_TAG, PRS_CREATE_TIME, PRS_NODE,round((cast(PRS_END_TIME as date) - cast(PRS_START_TIME as date)) * 86400) AS "PRS_DURATION",PRS_PARENT_PROCESS_ID,PRS_DELETED FROM ORC_PROCESS_STATE;

COMMIT;

