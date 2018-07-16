-- *********************************************************************
-- Create Database Script
-- *********************************************************************
-- Change Log: /opt/liquibase/data/orchestra_4.6.0.0.xml
-- Ran at: 2/15/17 12:20 PM
-- Liquibase version: 2.0.5
-- *********************************************************************

-- Changeset /opt/liquibase/data/orchestra_4.6.0.0.xml::change-4.6.0.0-1::akn::(Checksum: 6:9a21f4927f535b7f3a6724a842954c38)
ALTER TABLE ORC_USER_PWD_TABLE MODIFY OUP_PASSWORD VARCHAR2(512);

-- Changeset /opt/liquibase/data/orchestra_4.6.0.0.xml::change-4.6.0.0-2::akn::(Checksum: 6:473f2b35f59d898bbaeefabd6351f39e)
ALTER TABLE ORC_PROCESS_EXT_BUSINESS_KEYS MODIFY PEK_BUSINESS_KEY VARCHAR2(2000);

-- Changeset /opt/liquibase/data/orchestra_4.6.0.0.xml::change-4.6.0.0-3-ScenarioGroupingPrerequisite::akn::(Checksum: 6:9789da32511f4b637f68dee908f98e57)
UPDATE ORC_PROCESS_SCENARIO SET PSC_UNIQUE_NAME = 'dummy' WHERE PSC_UNIQUE_NAME IS NULL;

ALTER TABLE ORC_PROCESS_SCENARIO MODIFY PSC_UNIQUE_NAME NOT NULL;

ALTER TABLE ORC_PROCESS_SCENARIO ADD CONSTRAINT PK_PROSCENARIO PRIMARY KEY (PSC_UNIQUE_NAME);

-- Changeset /opt/liquibase/data/orchestra_4.6.0.0.xml::change-4.6.0.0-4-EnvironmentSettings::akn::(Checksum: 6:c56e55f9066cbfff7b73d3248182b634)
CREATE TABLE ORC_ENVIRONMENT_SETTINGS (GROUP_NAME VARCHAR2(255) NOT NULL, PARAMETER_NAME VARCHAR2(255) NOT NULL, PARAMETER_VALUE VARCHAR2(1024), LAST_UPDATED_AT TIMESTAMP DEFAULT SYSDATE NOT NULL, ADDED_AT TIMESTAMP, IS_RUNTIME_MODIFIABLE INTEGER, IS_MODIFIABLE INTEGER, NODE_ID VARCHAR2(10) NOT NULL, VALUE_TYPE VARCHAR2(255) DEFAULT 'STRING' NOT NULL);

ALTER TABLE ORC_ENVIRONMENT_SETTINGS ADD CONSTRAINT PK_ENVSETT PRIMARY KEY (GROUP_NAME, PARAMETER_NAME, NODE_ID);

INSERT INTO ORC_SEC_ROLE_V2 (OSR_SCENARIO, OSR_IDENTIFIER, OSR_DESC) VALUES ('RUNTIME', 'RUNTIME:EnvironmentSettings.Reader', 'Allows reading of environment settings in monitor');

INSERT INTO ORC_SEC_ROLE_V2 (OSR_SCENARIO, OSR_IDENTIFIER, OSR_DESC) VALUES ('RUNTIME', 'RUNTIME:EnvironmentSettings.Writer', 'Allows changing of environment settings from the monitor');

INSERT INTO ORC_SEC_USER_ROLES_V2 (OUR_USER_ID, OUR_ROLE_ID) VALUES ('RUNTIME:admin', 'EnvironmentSettings.Reader');

INSERT INTO ORC_SEC_USER_ROLES_V2 (OUR_USER_ID, OUR_ROLE_ID) VALUES ('RUNTIME:admin', 'EnvironmentSettings.Writer');

INSERT INTO ORC_SEC_USER_ROLES_V2 (OUR_USER_ID, OUR_ROLE_ID) VALUES ('RUNTIME:Monitor', 'EnvironmentSettings.Reader');

-- Changeset /opt/liquibase/data/orchestra_4.6.0.0.xml::change-4.6.0.0-5-WorkList::akn::(Checksum: 6:d8066ede226599109d0cea449469b109)
CREATE TABLE ORC_WORKLIST_TYPE (WLT_ID VARCHAR2(255) NOT NULL, WLT_NAME VARCHAR2(255) NOT NULL, WLT_DESCRIPTION VARCHAR2(512), WLT_USER_STARTABLE INTEGER, WLT_ACTIVATION_TYPE VARCHAR2(255) NOT NULL, WLT_CAN_COMPLETE INTEGER, WLT_CAN_START_PROCESS INTEGER, WLT_GROUP_NAME VARCHAR2(255), WLT_GROUP_ID VARCHAR2(255), WLT_TYPE_IMAGE BLOB);

ALTER TABLE ORC_WORKLIST_TYPE ADD CONSTRAINT PK_WKLTYPE PRIMARY KEY (WLT_ID);

CREATE TABLE ORC_WORKLIST_ACTIVATION_HTTP (WAH_ID VARCHAR2(255) NOT NULL, WAH_URL VARCHAR2(512) NOT NULL, WAH_REQUEST_TYPE INTEGER NOT NULL);

ALTER TABLE ORC_WORKLIST_ACTIVATION_HTTP ADD CONSTRAINT PK_WKLACTHTTP PRIMARY KEY (WAH_ID);

ALTER TABLE ORC_WORKLIST_ACTIVATION_HTTP ADD CONSTRAINT FK_WKLACTHTTP FOREIGN KEY (WAH_ID) REFERENCES ORC_WORKLIST_TYPE (WLT_ID);

CREATE TABLE ORC_WORKLIST_ACTIVATION_RES (WAR_ID VARCHAR2(255) NOT NULL, WAR_MODEL_TYPE VARCHAR2(255), WAR_RESOURCE_BUNDLE VARCHAR2(255), WAR_ROOT_RESOURCE VARCHAR2(255), WAR_FINISH_RESOURCE VARCHAR2(255));

ALTER TABLE ORC_WORKLIST_ACTIVATION_RES ADD CONSTRAINT PK_WKLACTRESOURCE PRIMARY KEY (WAR_ID);

ALTER TABLE ORC_WORKLIST_ACTIVATION_RES ADD CONSTRAINT FK_WKLACTRESOURCE FOREIGN KEY (WAR_ID) REFERENCES ORC_WORKLIST_TYPE (WLT_ID);

CREATE TABLE ORC_WORKLIST_ACTIVATION_SIMPLE (WAS_ID VARCHAR2(255) NOT NULL, WAS_CAPTION VARCHAR2(255), WAS_INFO_TEXT VARCHAR2(512), WAS_BUTTON1 VARCHAR2(30), WAS_BUTTON2 VARCHAR2(30), WAS_BUTTON3 VARCHAR2(30));

ALTER TABLE ORC_WORKLIST_ACTIVATION_SIMPLE ADD CONSTRAINT PK_WKLACTSIMPLE PRIMARY KEY (WAS_ID);

ALTER TABLE ORC_WORKLIST_ACTIVATION_SIMPLE ADD CONSTRAINT FK_WKLACTSIMPLE FOREIGN KEY (WAS_ID) REFERENCES ORC_WORKLIST_TYPE (WLT_ID);

CREATE TABLE ORC_WORKLIST_ESCALATION (WLE_ID VARCHAR2(255) NOT NULL, WLE_EXPIRATION_TIME INTEGER NOT NULL, WLE_TIME_UNIT VARCHAR2(30) NOT NULL, WLE_DELEGATE VARCHAR2(255), WLE_RECEIVER VARCHAR2(255), WLE_TYPE VARCHAR2(30) NOT NULL);

ALTER TABLE ORC_WORKLIST_ESCALATION ADD CONSTRAINT PK_WKLESCALATION PRIMARY KEY (WLE_ID);

CREATE TABLE ORC_WORKLIST_ITEM (WLI_ID VARCHAR2(255) NOT NULL, WLI_NAME VARCHAR2(255) NOT NULL, WLI_CREATION_DATE TIMESTAMP DEFAULT SYSDATE NOT NULL, WLI_DESCRIPTION VARCHAR2(512), WLI_PRIORITY INTEGER, WLI_TYPE_ID VARCHAR2(255) NOT NULL, WLI_CREDENTIAL_NAME VARCHAR2(255) NOT NULL, WLI_COMPLETION_LISTENER_INFO BLOB, WLI_NEXT_ESCALATION NUMBER(38, 0), WLI_STATE VARCHAR2(255) NOT NULL, WLI_NUM_RETRIES INTEGER DEFAULT 0, WLI_NEXT_RETRY NUMBER(38, 0), WLI_FAILURE_CAUSE BLOB, WLI_ERROR_DESCRIPTION VARCHAR2(255), WLI_RESULTCODE INTEGER, WLI_RESULT_LABEL VARCHAR2(255));

ALTER TABLE ORC_WORKLIST_ITEM ADD CONSTRAINT PK_WKLITEM PRIMARY KEY (WLI_ID);

ALTER TABLE ORC_WORKLIST_ITEM ADD CONSTRAINT FK_WKLITEM FOREIGN KEY (WLI_TYPE_ID) REFERENCES ORC_WORKLIST_TYPE (WLT_ID);

CREATE TABLE ORC_WORKLIST_PARAMETER_DECL (WPD_ID VARCHAR2(255) NOT NULL, WPD_NAME VARCHAR2(512) NOT NULL, WPD_DESCRIPTION VARCHAR2(255), WPD_DIRECTION INTEGER, WPD_PARAMETER_TYPE VARCHAR2(255) NOT NULL, WPD_TYPE_ID VARCHAR2(255) NOT NULL);

ALTER TABLE ORC_WORKLIST_PARAMETER_DECL ADD CONSTRAINT PK_WKLPARMDECL PRIMARY KEY (WPD_ID);

ALTER TABLE ORC_WORKLIST_PARAMETER_DECL ADD CONSTRAINT FK_WKLPARMDECL FOREIGN KEY (WPD_TYPE_ID) REFERENCES ORC_WORKLIST_TYPE (WLT_ID);

CREATE TABLE ORC_WORKLIST_PARAMETER_INST (WPI_ID VARCHAR2(255) NOT NULL, WPI_VALUE VARCHAR2(255), WPI_ITEM_ID VARCHAR2(255) NOT NULL, WPI_DECLARATION_ID VARCHAR2(255) NOT NULL);

ALTER TABLE ORC_WORKLIST_PARAMETER_INST ADD CONSTRAINT PK_WKLPARMINST PRIMARY KEY (WPI_ID);

ALTER TABLE ORC_WORKLIST_PARAMETER_INST ADD CONSTRAINT FK_WKLPARMINST1 FOREIGN KEY (WPI_ITEM_ID) REFERENCES ORC_WORKLIST_ITEM (WLI_ID);

ALTER TABLE ORC_WORKLIST_PARAMETER_INST ADD CONSTRAINT FK_WKLPARMINST2 FOREIGN KEY (WPI_DECLARATION_ID) REFERENCES ORC_WORKLIST_PARAMETER_DECL (WPD_ID);

CREATE TABLE ORC_WORKLIST_PERMISSION (WLP_ID VARCHAR2(255) NOT NULL, WLP_MODE INTEGER NOT NULL, WLP_CREDENTIAL_NAME VARCHAR2(255) NOT NULL, WLP_WORKLIST_TYPE_ID VARCHAR2(255) NOT NULL);

ALTER TABLE ORC_WORKLIST_PERMISSION ADD CONSTRAINT PK_WKLPERM PRIMARY KEY (WLP_ID);

CREATE TABLE ORC_WORKLIST_RESOURCE_BUNDLE (WRB_ID VARCHAR2(255) NOT NULL, WRB_DESCRIPTION VARCHAR2(255));

ALTER TABLE ORC_WORKLIST_RESOURCE_BUNDLE ADD CONSTRAINT PK_WKLRESBUND PRIMARY KEY (WRB_ID);

CREATE TABLE ORC_WORKLIST_RESOURCE (WLR_NAME VARCHAR2(255) NOT NULL, WLR_CONTENT_TYPE VARCHAR2(255), WLR_CONTENT BLOB, WLR_RESOURCE_BUNDLE VARCHAR2(255) NOT NULL);

ALTER TABLE ORC_WORKLIST_RESOURCE ADD CONSTRAINT PK_WKLRES PRIMARY KEY (WLR_NAME, WLR_RESOURCE_BUNDLE);

ALTER TABLE ORC_WORKLIST_RESOURCE ADD CONSTRAINT FK_WKLRES FOREIGN KEY (WLR_RESOURCE_BUNDLE) REFERENCES ORC_WORKLIST_RESOURCE_BUNDLE (WRB_ID);

CREATE TABLE ORC_WORKLIST_TYPE_ESCALATION (WTE_TYPE_ID VARCHAR2(255) DEFAULT '' NOT NULL, WTE_ESCALATION_ID VARCHAR2(255) DEFAULT '' NOT NULL);

ALTER TABLE ORC_WORKLIST_TYPE_ESCALATION ADD CONSTRAINT PK_WKLTYPESC PRIMARY KEY (WTE_TYPE_ID, WTE_ESCALATION_ID);

ALTER TABLE ORC_WORKLIST_TYPE_ESCALATION ADD CONSTRAINT FK_WKLTYPESC1 FOREIGN KEY (WTE_ESCALATION_ID) REFERENCES ORC_WORKLIST_ESCALATION (WLE_ID);

ALTER TABLE ORC_WORKLIST_TYPE_ESCALATION ADD CONSTRAINT FK_WKLTYPESC2 FOREIGN KEY (WTE_TYPE_ID) REFERENCES ORC_WORKLIST_TYPE (WLT_ID);

-- Changeset /opt/liquibase/data/orchestra_4.6.0.0.xml::change-4.6.0.0-6-HumanInteraction::akn::(Checksum: 6:ca8eb0b5688dd06aa4b7a815364e6755)
CREATE TABLE ORC_HUMAN_INTERACTION (HIN_SCENARIO VARCHAR2(255), HIN_NAME VARCHAR2(255), HIN_DATA BLOB, HIN_DEPLOYED_AT TIMESTAMP, HIN_UNIQUE_NAME VARCHAR2(255) NOT NULL);

ALTER TABLE ORC_HUMAN_INTERACTION ADD CONSTRAINT PK_HUMANINTERACT PRIMARY KEY (HIN_UNIQUE_NAME);

CREATE UNIQUE INDEX IDX_HUINT_NAM_SCEN ON ORC_HUMAN_INTERACTION(HIN_NAME, HIN_SCENARIO);

CREATE INDEX IDX_HUINT_SCEN ON ORC_HUMAN_INTERACTION(HIN_SCENARIO);

-- Changeset /opt/liquibase/data/orchestra_4.6.0.0.xml::change-4.6.0.0-7-Filtering::akn::(Checksum: 6:3eaf25a28a69b775b17fd82f032f6bcb)
CREATE TABLE ORC_FILTERSETTINGS (ORC_FILTERID INTEGER NOT NULL, ORC_FNAME VARCHAR2(255), ORC_ISCURRENT INTEGER, ORC_PARENT_USERID VARCHAR2(255), ORC_TABLECLASS VARCHAR2(255));

ALTER TABLE ORC_FILTERSETTINGS ADD CONSTRAINT PK_FILTERSETTING PRIMARY KEY (ORC_FILTERID);

ALTER TABLE ORC_FILTERSETTINGS ADD CONSTRAINT FK_FILTERSETTING FOREIGN KEY (ORC_PARENT_USERID, ORC_TABLECLASS) REFERENCES ORC_MONITOR_TABLESETTINGS (ORC_PARENT_USERID, ORC_TABLECLASS);

CREATE TABLE ORC_FILTEREXPRESSIONS (ORC_EXPRESSION_ID INTEGER NOT NULL, ORC_FCONDITION VARCHAR2(255), ORC_FVALUE VARCHAR2(255), ORC_TABLECOLUMN VARCHAR2(255), ORC_FILTERID INTEGER);

ALTER TABLE ORC_FILTEREXPRESSIONS ADD CONSTRAINT PK_FILTEREXPRESS PRIMARY KEY (ORC_EXPRESSION_ID);

ALTER TABLE ORC_FILTEREXPRESSIONS ADD CONSTRAINT FK_FILTEREXPRESS FOREIGN KEY (ORC_FILTERID) REFERENCES ORC_FILTERSETTINGS (ORC_FILTERID);

CREATE TABLE ORC_USERFILTER (ORC_FILTERID INTEGER NOT NULL, ORC_PARENT_USERID VARCHAR2(255) NOT NULL, ORC_TABLECLASS VARCHAR2(255) NOT NULL);

ALTER TABLE ORC_USERFILTER ADD CONSTRAINT PK_USERFILTER PRIMARY KEY (ORC_FILTERID, ORC_PARENT_USERID, ORC_TABLECLASS);

ALTER TABLE ORC_USERFILTER ADD CONSTRAINT FK_USERFILTER1 FOREIGN KEY (ORC_FILTERID) REFERENCES ORC_FILTERSETTINGS (ORC_FILTERID);

ALTER TABLE ORC_USERFILTER ADD CONSTRAINT FK_USERFILTER2 FOREIGN KEY (ORC_PARENT_USERID, ORC_TABLECLASS) REFERENCES ORC_MONITOR_TABLESETTINGS (ORC_PARENT_USERID, ORC_TABLECLASS);

-- Changeset /opt/liquibase/data/orchestra_4.6.0.0.xml::change-4.6.0.0-8-ScenarioGrouping::akn::(Checksum: 6:6d3eb1a49edf3776d25621d69ce3e3cf)
CREATE TABLE ORC_SCENARIOGROUPS (GROUP_ID INTEGER NOT NULL, GROUP_NAME VARCHAR2(255) NOT NULL);

ALTER TABLE ORC_SCENARIOGROUPS ADD CONSTRAINT PK_SCENARIOGROUPS PRIMARY KEY (GROUP_ID);

CREATE TABLE ORC_SCENARIO_GROUP_RELATION (GROUP_ID INTEGER NOT NULL, SCENARIO_ID VARCHAR2(255) NOT NULL);

ALTER TABLE ORC_SCENARIO_GROUP_RELATION ADD CONSTRAINT PK_SCENGROUPREL PRIMARY KEY (GROUP_ID, SCENARIO_ID);

ALTER TABLE ORC_SCENARIO_GROUP_RELATION ADD CONSTRAINT FK_SCENGROUPREL1 FOREIGN KEY (GROUP_ID) REFERENCES ORC_SCENARIOGROUPS (GROUP_ID);

ALTER TABLE ORC_SCENARIO_GROUP_RELATION ADD CONSTRAINT FK_SCENGROUPREL2 FOREIGN KEY (SCENARIO_ID) REFERENCES ORC_PROCESS_SCENARIO (PSC_UNIQUE_NAME);

UPDATE ORC_MONITOR_TABLESETTINGS SET ORC_COLUMN_PATTERN = 'y,n,n,y,y,y,y,y,y,n,y' WHERE ORC_TABLECLASS = 'ScenarioTable';

UPDATE ORC_MONITOR_TABLESETTINGS SET ORC_COLUMN_PATTERN = 'y,y,n,y,n,y,y,y,y,y,n' WHERE ORC_TABLECLASS = 'ProcessOverviewTable';

-- Changeset /opt/liquibase/data/orchestra_4.6.0.0.xml::change-4.6.0.0-9-ProcessGrouping::akn::(Checksum: 6:ee3d5e5b0741da3b1d8459dbd1888c75)
CREATE TABLE ORC_PROCESS_FIFO_SCHEDULE_GRP (PFS_ID VARCHAR2(100) NOT NULL, PFS_SCENARIO VARCHAR2(255) NOT NULL, PFS_MODELL_REFERENCE VARCHAR2(255) NOT NULL, PFS_PROCESS_REFERENCE VARCHAR2(255) NOT NULL, PFS_TOKEN_REFERENCE VARCHAR2(255) NOT NULL, PFS_VARIABLES BLOB, PFS_TARGET_NODE VARCHAR2(255), PFS_STATE VARCHAR2(10), PFS_OWNER_NODE VARCHAR2(255), PFS_PROCESS_GROUP VARCHAR2(255) NOT NULL);

ALTER TABLE ORC_PROCESS_FIFO_SCHEDULE_GRP ADD CONSTRAINT PK_PROFIFSCHEDGRP PRIMARY KEY (PFS_PROCESS_REFERENCE);

CREATE INDEX IDS_PROC_FIFO_GRP_DELETE ON ORC_PROCESS_FIFO_SCHEDULE_GRP(PFS_STATE);

CREATE TABLE ORC_PROCESS_FIFO_SCHED_GRP_CAC (PFS_ID VARCHAR2(100) NOT NULL, PFS_SCENARIO VARCHAR2(255) NOT NULL, PFS_MODELL_REFERENCE VARCHAR2(255) NOT NULL, PFS_PROCESS_REFERENCE VARCHAR2(255) NOT NULL, PFS_TOKEN_REFERENCE VARCHAR2(255) NOT NULL, PFS_VARIABLES BLOB, PFS_TARGET_NODE VARCHAR2(255), PFS_STATE VARCHAR2(10), PFS_OWNER_NODE VARCHAR2(255), PFS_PROCESS_GROUP VARCHAR2(255) NOT NULL);

ALTER TABLE ORC_PROCESS_FIFO_SCHED_GRP_CAC ADD CONSTRAINT PK_PROFIFSCHEDGRPC PRIMARY KEY (PFS_PROCESS_REFERENCE);

CREATE INDEX IDS_PROC_FIFO_GRP_C_DELETE ON ORC_PROCESS_FIFO_SCHED_GRP_CAC(PFS_STATE);

-- Changeset /opt/liquibase/data/orchestra_4.6.0.0.xml::change-4.6.0.0-9_1-ProcessGrouping::akn::(Checksum: 6:2dab7732fea5db71e241781ac9636885)
CREATE SEQUENCE ORC_SEQ_ORD_FIFO_SCHED_GRP NOCYCLE ORDER CACHE 20 NOMAXVALUE MINVALUE 1 INCREMENT BY 1 START WITH 1;

ALTER TABLE ORC_PROCESS_FIFO_SCHEDULE_GRP ADD PFS_LOGICAL_ORDER NUMBER(38, 0);

CREATE UNIQUE INDEX IDX_PROC_FIFO_GRP_KEY_AUTO ON ORC_PROCESS_FIFO_SCHEDULE_GRP(PFS_LOGICAL_ORDER);

CREATE SEQUENCE ORC_SEQ_ORD_FIFO_SCHED_GRP_C NOCYCLE ORDER CACHE 20 NOMAXVALUE MINVALUE 1 INCREMENT BY 1 START WITH 1;

ALTER TABLE ORC_PROCESS_FIFO_SCHED_GRP_CAC ADD PFS_LOGICAL_ORDER NUMBER(38, 0);

CREATE UNIQUE INDEX IDX_PROC_FIFO_GRP_C_KEY_AUTO ON ORC_PROCESS_FIFO_SCHED_GRP_CAC(PFS_LOGICAL_ORDER);

-- Changeset /opt/liquibase/data/orchestra_4.6.0.0.xml::change-4.6.0.0-9_2-ProcessGrouping::akn::(Checksum: 6:05112cfedd4318a41cf63746119bf359)
CREATE INDEX IDX_ORC_PROC_FIFO_GRP_MIN_ID ON ORC_PROCESS_FIFO_SCHEDULE_GRP(PFS_MODELL_REFERENCE, PFS_PROCESS_GROUP, PFS_TARGET_NODE, PFS_ID, PFS_LOGICAL_ORDER, PFS_STATE);

CREATE INDEX IDX_ORC_PROC_FIFO_GRP_C_MIN_ID ON ORC_PROCESS_FIFO_SCHED_GRP_CAC(PFS_MODELL_REFERENCE, PFS_PROCESS_GROUP, PFS_TARGET_NODE, PFS_ID, PFS_LOGICAL_ORDER, PFS_STATE);

-- Changeset /opt/liquibase/data/orchestra_4.6.0.0.xml::change-4.6.0.0-9_3-ProcessGrouping::akn::(Checksum: 6:15c2d7fd9e1e05c71ffe80adc9f31200)
ALTER TABLE ORC_PROCESS_RUNTIME_STATE ADD PRS_PROCESS_GROUP VARCHAR2(255);

UPDATE ORC_PROCESS_RUNTIME_STATE SET PRS_PROCESS_GROUP = '0';

-- Changeset /opt/liquibase/data/orchestra_4.6.0.0.xml::change-4.6.0.0-10-FullSnapShot_Deployment::akn::(Checksum: 6:591eaf50aa69cd740addd040e83abd7a)
CREATE TABLE ORC_DEPLOYMENT_LIFECYCLE_JOB (DLJ_IDENT VARCHAR2(50) NOT NULL, DLJ_SCENARIO VARCHAR2(255) NOT NULL, DLJ_TYPE VARCHAR2(255) NOT NULL, DLJ_PROCESSMODELL VARCHAR2(255), DLJ_SNAPSHOT INTEGER, DLJ_EXT_COL1 VARCHAR2(255), DLJ_EXT_COL2 VARCHAR2(255), DLJ_NODE VARCHAR2(255), DLJ_IS_POSTPONED INTEGER);

ALTER TABLE ORC_DEPLOYMENT_LIFECYCLE_JOB ADD CONSTRAINT PK_DEPLOYLIFEJOB PRIMARY KEY (DLJ_IDENT);

CREATE INDEX IDX_ORC_DEPL_LCYC_JOB ON ORC_DEPLOYMENT_LIFECYCLE_JOB(DLJ_NODE, DLJ_IS_POSTPONED, DLJ_IDENT);

CREATE TABLE ORC_SNAPSHOT_DELETION (SDE_TABLE_NAME VARCHAR2(255), SDE_SNAPSHOT_TOKEN NUMBER(38, 0), SDE_SNAPSHOT_KEY VARCHAR2(255), SDE_NODE_ID VARCHAR2(255));

CREATE INDEX IDX_ORC_SNAP_DELETE ON ORC_SNAPSHOT_DELETION(SDE_TABLE_NAME, SDE_SNAPSHOT_TOKEN, SDE_SNAPSHOT_KEY, SDE_NODE_ID);

ALTER TABLE ORC_EVENT_PROCESS_TOKEN ADD EVT_IS_FULLSNAPSHOT INTEGER;

UPDATE ORC_EVENT_PROCESS_TOKEN SET EVT_IS_FULLSNAPSHOT = 0;

ALTER TABLE ORC_PROCESS_ARBORT ADD PRA_STARTUP_COUNT INTEGER;

ALTER TABLE ORC_PROCESS_ARBORT ADD PRA_DELETE_SNAPSHOT INTEGER;

UPDATE ORC_PROCESS_ARBORT SET PRA_DELETE_SNAPSHOT = 0, PRA_STARTUP_COUNT = 0;

ALTER TABLE ORC_PROCESS_STATE ADD PRS_UNLOCK_PENDING INTEGER;

ALTER TABLE ORC_PROCESS_STATE ADD PRS_UPDATE_VERSION INTEGER;

UPDATE ORC_PROCESS_STATE SET PRS_UNLOCK_PENDING = 1, PRS_UPDATE_VERSION = 0;

UPDATE ORC_PROCESS_STATE SET PRS_UNLOCK_PENDING = 0 WHERE PRS_STATE = 3 or PRS_STATE = 9;

ALTER TABLE ORC_PROCESSINSTANCE_STATE ADD PRS_SNAPSHOT_TOKEN INTEGER;

ALTER TABLE ORC_PROCESSINSTANCE_STATE ADD PRS_HAS_CALLBACK INTEGER;

UPDATE ORC_PROCESSINSTANCE_STATE SET PRS_HAS_CALLBACK = 1, PRS_SNAPSHOT_TOKEN = 0;

-- Changeset /opt/liquibase/data/orchestra_4.6.0.0.xml::change-4.6.0.0-11-HealthCheck::akn::(Checksum: 6:0e3891ea8213f85f45a8203e19d69fbc)
CREATE TABLE ORC_HEALTHCHECK (HC_ID INTEGER NOT NULL, NAME VARCHAR2(40), CONTENT BLOB, ENABLED NUMBER(1));

ALTER TABLE ORC_HEALTHCHECK ADD CONSTRAINT PK_HEALTHCHECK PRIMARY KEY (HC_ID);

CREATE TABLE ORC_HC_RESULTLIST (HC_ID INTEGER NOT NULL, EX_ID INTEGER NOT NULL, STARTTIME TIMESTAMP, ENDTIME TIMESTAMP, RESULT BLOB);

ALTER TABLE ORC_HC_RESULTLIST ADD CONSTRAINT PK_HCRESULTLIST PRIMARY KEY (HC_ID, EX_ID);

ALTER TABLE ORC_HC_RESULTLIST ADD CONSTRAINT FK_HCRESULTLIST FOREIGN KEY (HC_ID) REFERENCES ORC_HEALTHCHECK (HC_ID);

INSERT INTO ORC_SEC_ROLE_V2 (OSR_SCENARIO, OSR_IDENTIFIER, OSR_DESC) VALUES ('RUNTIME', 'RUNTIME:HealthCheckUser', 'Is just allowed to execute the HealthCheck');

INSERT INTO ORC_SEC_ROLE_V2 (OSR_SCENARIO, OSR_IDENTIFIER, OSR_DESC) VALUES ('RUNTIME', 'RUNTIME:HealthCheckAdmin', 'Is allowed to edit the HealthCheck');

INSERT INTO ORC_SEC_USER_ROLES_V2 (OUR_USER_ID, OUR_ROLE_ID) VALUES ('RUNTIME:admin', 'HealthCheckAdmin');

INSERT INTO ORC_SEC_USER_ROLES_V2 (OUR_USER_ID, OUR_ROLE_ID) VALUES ('RUNTIME:admin', 'HealthCheckUser');

INSERT INTO ORC_SEC_USER_ROLES_V2 (OUR_USER_ID, OUR_ROLE_ID) VALUES ('RUNTIME:Monitor', 'HealthCheckUser');

INSERT INTO ORC_MONITOR_TABLESETTINGS (ORC_PARENT_USERID, ORC_TABLECLASS, ORC_AUTOREFRESH, ORC_MAXELEMENTS, ORC_REFRESHINTERVAL, ORC_DEFAULT_SORT_COLUMN, ORC_DEFAULT_SORT_ASCENDING, ORC_COLUMN_PATTERN) VALUES ('RUNTIME:Admin', 'HealthCheckTable', 0, 30, 20000, 2, 1, 'y,y,y,y,y,y');

INSERT INTO ORC_MONITOR_TABLESETTINGS (ORC_PARENT_USERID, ORC_TABLECLASS, ORC_AUTOREFRESH, ORC_MAXELEMENTS, ORC_REFRESHINTERVAL, ORC_DEFAULT_SORT_COLUMN, ORC_DEFAULT_SORT_ASCENDING, ORC_COLUMN_PATTERN) VALUES ('RUNTIME:Admin', 'CheckHistory', 1, 20, 20000, 2, 1, 'y,y,y,y');

INSERT INTO ORC_MONITOR_TABLESETTINGS (ORC_PARENT_USERID, ORC_TABLECLASS, ORC_AUTOREFRESH, ORC_MAXELEMENTS, ORC_REFRESHINTERVAL, ORC_DEFAULT_SORT_COLUMN, ORC_DEFAULT_SORT_ASCENDING, ORC_COLUMN_PATTERN) VALUES ('RUNTIME:Admin', 'HcExecutionHistory', 1, 20, 20000, 0, 1, 'y,y,y,y,y');

-- Changeset /opt/liquibase/data/orchestra_4.6.0.0.xml::change-4.6.0.0-12-MonitorWidgets::akn::(Checksum: 6:79ddcbd585ce94fb495d54cb871c39c6)
CREATE TABLE ORC_MONITOR_WIDGET_SETTINGS (ORC_PARENT_USERID VARCHAR2(255) NOT NULL, ORC_WIDGETCLASS VARCHAR2(255) NOT NULL, ORC_COORDINATE_X DECIMAL, ORC_COORDINATE_Y DECIMAL);

ALTER TABLE ORC_MONITOR_WIDGET_SETTINGS ADD CONSTRAINT PK_MONWIDGETSET PRIMARY KEY (ORC_PARENT_USERID, ORC_WIDGETCLASS);

-- Changeset /opt/liquibase/data/orchestra_4.6.0.0.xml::change-4.6.0.0-13-TopicQueue::akn::(Checksum: 6:7b2c994e32bcd9aaed107c81b3d01bb6)
DROP INDEX IDX_TOPIC_QUEUE_S_T_Q_N;

CREATE INDEX IDX_TOPIC_QUEUE_S_T_Q_N ON ORC_TOPIC_QUEUE(STATE, ORC_TOPIC_ID, TARGET_NODE, QUEUE_TYPE, NEXT_SCHEDULE_TIME);

-- Changeset /opt/liquibase/data/orchestra_4.6.0.0.xml::change-4.6.0.0-14-LDAP::akn::(Checksum: 6:c6e424ad4bcc9697cdd84878f2b5ae35)
ALTER TABLE ORC_USER_PWD_TABLE ADD OUP_USE_LDAP INTEGER DEFAULT 0 NOT NULL;

ALTER TABLE ORC_USER_PWD_TABLE MODIFY OUP_PASSWORD NULL;

-- Changeset /opt/liquibase/data/orchestra_4.6.0.0.xml::change-4.6.0.0-15-ProcessRuntime::akn::(Checksum: 6:5b089503f185cf8d16d1b4b0f21f63be)
ALTER TABLE ORC_PROCESS_RUNTIME_STATE ADD PRS_REVISION NUMBER(38, 0);

-- Changeset /opt/liquibase/data/orchestra_4.6.0.0.xml::change-4.6.0.0-16-WorkList_2::akn::(Checksum: 6:2545d82e5028543c644bd6a95e4b64f8)
CREATE TABLE ORC_WORKLIST_USER_SETTING (WUS_USERID VARCHAR2(64) NOT NULL, WUS_TABLENAME VARCHAR2(64) NOT NULL, WUS_SETTING VARCHAR2(255));

ALTER TABLE ORC_WORKLIST_USER_SETTING ADD CONSTRAINT PK_WKLUSERSETT PRIMARY KEY (WUS_USERID, WUS_TABLENAME);

-- Changeset /opt/liquibase/data/orchestra_4.6.0.0.xml::change-4.6.0.0-17-VIEW::akn::(Checksum: 6:f1437b8de28cf489c080d51ac953c18d)
DROP VIEW ORC_PROCESS_STATE_MONITOR_V;

CREATE VIEW ORC_PROCESS_STATE_MONITOR_V AS SELECT PRS_PROCESS_ID, PRS_MODELL_ID, PRS_START_TIME, PRS_END_TIME, PRS_STATE, PRS_BUSINESS_KEY, PRS_SCENARIO_ID, PRS_ROOT_TOKEN, PRS_PROCESS_MODEL, PRS_VERSION_TAG, PRS_CREATE_TIME, PRS_NODE,round((cast(PRS_END_TIME as date) - cast(PRS_START_TIME as date)) * 86400) AS "PRS_DURATION",PRS_DELETED FROM ORC_PROCESS_STATE;

COMMIT;

