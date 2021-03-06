-- *********************************************************************
-- Create Database Script
-- *********************************************************************
-- Change Log: /opt/liquibase/data/orchestra_4.5.5.0.xml
-- Ran at: 9/18/15 10:02 AM
-- Liquibase version: 2.0.5
-- *********************************************************************

-- Changeset /opt/liquibase/data/orchestra_4.5.5.0.xml::change-4.5.5.0-01::akn::(Checksum: 6:56cd18cd552193675a5e11122072de47)
DROP INDEX IDX_WORK_QUEUE_STAT_TYP_PRIO;

DROP INDEX IDX_WORK_QUEUE_STATE_TYPE_ID;

ALTER TABLE ORC_WORK_QUEUE DROP PRIMARY KEY;

ALTER TABLE ORC_WORK_QUEUE ALTER COLUMN ID SET DATA TYPE VARCHAR(50);

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ORC_WORK_QUEUE');

ALTER TABLE ORC_WORK_QUEUE ADD CONSTRAINT PK_WORK_QUEUE_ID PRIMARY KEY (ID);

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ORC_WORK_QUEUE');

CREATE INDEX IDX_WORK_QUEUE_STAT_TYP_PRIO ON ORC_WORK_QUEUE(STATE, QUEUE_TYPE, PRIORITY, ID);

CREATE INDEX IDX_WORK_QUEUE_STATE_TYPE_ID ON ORC_WORK_QUEUE(STATE, QUEUE_TYPE, ID);

-- Changeset /opt/liquibase/data/orchestra_4.5.5.0.xml::change-4.5.5.0-02::akn::(Checksum: 6:6e5be546e54a805f3030d82231a3e7ce)
DROP INDEX IDX_TOPIC_QUEUE_STATE_TYPE_ID;

DROP INDEX IDX_TOPIC_QUEUE_STAT_TYP_PRIO;

ALTER TABLE ORC_TOPIC_QUEUE DROP PRIMARY KEY;

ALTER TABLE ORC_TOPIC_QUEUE ALTER COLUMN ID SET DATA TYPE VARCHAR(50);

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ORC_TOPIC_QUEUE');

ALTER TABLE ORC_TOPIC_QUEUE ADD CONSTRAINT PK_TOPIC_QUEUE_ID PRIMARY KEY (ID);

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ORC_TOPIC_QUEUE');

CREATE INDEX IDX_TOPIC_QUEUE_STATE_TYPE_ID ON ORC_TOPIC_QUEUE(STATE, QUEUE_TYPE, ID);

CREATE INDEX IDX_TOPIC_QUEUE_STAT_TYP_PRIO ON ORC_TOPIC_QUEUE(STATE, QUEUE_TYPE, PRIORITY, ID);

-- Changeset /opt/liquibase/data/orchestra_4.5.5.0.xml::change-4.5.5.0-03::akn::(Checksum: 6:edba1670f96eb2ca77b99e674075866a)
CREATE INDEX IDX_ORC_MESSAGE_LEASETIME ON ORC_MESSAGE(MES_LEASE_TIME);

CREATE INDEX IDX_ORC_MESSAGE_LIST_LEASETIME ON ORC_MESSAGE_LIST(MLI_LEASE_TIME);

CREATE INDEX IDX_ORC_MESSAGE_REF_DEL_HELP ON ORC_MESSAGE_REFERERS(MRE_REFERRER_ID, MRE_REF_TYPE);

CREATE INDEX IDX_ORC_MSG_REF_OBJECT ON ORC_MESSAGE_REFERERS(MRE_OBJECT_ID, MRE_OBJECT_TYPE);

CREATE INDEX IDX_ORC_MS_REF_UNLOCK_STATE ON ORC_MESSAGE_REFERERS_UNLOCK(MRE_FLAG);

CREATE INDEX IDX_ORC_PROC_FIFO_SCHED_STATE ON ORC_PROCESS_FIFO_SCHEDULE(PFS_STATE);

CREATE INDEX IDS_ORC_PI_STATE_MOD_NODE_P ON ORC_PROCESSINSTANCE_STATE(PRS_PROCESSMODELL, PRS_NODE, PRS_MODE, PRS_ID);

CREATE INDEX IDX_ORC_MESSAGE_TYPE_SCEN ON ORC_MESSAGE_TYPE(MTY_SCENARIO);

CREATE INDEX IDX_ORC_PROC_RU_ST_PROC_NODE ON ORC_PROCESS_RUNTIME_STATE(PRS_PROCESS, PRS_NODE_ID, PRS_STATE);

CREATE INDEX IDX_ORC_EVENT_SYS_DATE_TYPE ON ORC_EVENT_SYSTEM(EVT_DATE, EVT_TYPE);

CREATE INDEX IDX_ORC_PROCESS_STATE_4 ON ORC_PROCESS_STATE(PRS_STATE, PRS_START_TIME, PRS_END_TIME, PRS_SCENARIO_ID, PRS_DELETED);

CREATE INDEX IDX_ORC_ALERT_NODEID ON ORC_ALERT_DATA(NODE_ID);

CREATE INDEX IDX_ORC_SVC_DECL ON ORC_SVC_DECLARATION(SDC_SCENARIO);

CREATE INDEX IDX_ORC_BTRANS_CREATE_TYPE ON ORC_BUSINESS_TRANSACTION(OBT_CREATED, OBT_TYPE);

CREATE INDEX IDX_ORC_PMODELLS_HIST_SCEN_VER ON ORC_PROCESS_MODELLS_HIST(PMO_SCENARIO, PMO_VERSION);

-- Changeset /opt/liquibase/data/orchestra_4.5.5.0.xml::change-4.5.5.0-05::akn::(Checksum: 6:5c88b764e1d5b4e814de1280500e6514)
CREATE INDEX IDS_ORC_LTA_MESSAGE_L_TIME ON ORC_LTA_MESSAGE(MES_LEASE_TIME);

CREATE INDEX IDX_ORC_LTA_PROCESS_OVERVIEW ON ORC_LTA_PROCESS_OVERVIEW(LPO_SCENARIO_ID);

CREATE INDEX IDX_ORC_LTA_PRO_STATE_AD_ST22 ON ORC_LTA_PROCESS_STATE(PRS_ARCHIVE_DATE, PRS_SCENARIO_ID, PRS_STATE, PRS_PROCESS_ID);

-- Changeset /opt/liquibase/data/orchestra_4.5.5.0.xml::change-4.5.5.0-06::akn::(Checksum: 6:a8592e0654e9bdb4a3d2369975d056fb)
ALTER TABLE ORC_MESSAGE ADD MES_TOUCHED INTEGER DEFAULT 0 NOT NULL;

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ORC_MESSAGE');

ALTER TABLE ORC_MESSAGE_LIST ADD MLI_TOUCHED INTEGER DEFAULT 0 NOT NULL;

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ORC_MESSAGE_LIST');

-- Changeset /opt/liquibase/data/orchestra_4.5.5.0.xml::change-4.5.5.0-07::akn::(Checksum: 6:8198d5b63f1e06f50864f0746f8a6b4a)
UPDATE ORC_MONITOR_TABLESETTINGS SET ORC_COLUMN_PATTERN = 'y,y,y,y,n,y,y' WHERE ORC_TABLECLASS = 'AdapterTable';

-- Changeset /opt/liquibase/data/orchestra_4.5.5.0.xml::change-4.5.5.0-10::akn::(Checksum: 6:f1299940e6b99cfb6efa9c87055e9be1)
CREATE TABLE ORC_WORK_QUEUE_DEL_TOPIC (DTO_TOPIC VARCHAR(256) NOT NULL, DTO_DELETETOKEN INTEGER NOT NULL, DTO_GLOBAL INTEGER NOT NULL, DTO_NODEID VARCHAR(32) NOT NULL, DTO_IDENT INTEGER NOT NULL, DTO_QUEUE_TYPE VARCHAR(1) NOT NULL, CONSTRAINT PK_ORC_WQ_DELTOPIC PRIMARY KEY (DTO_IDENT));

CREATE INDEX IDX_ORC_WQ_DELTOPIC_LOOKUP ON ORC_WORK_QUEUE_DEL_TOPIC(DTO_NODEID, DTO_QUEUE_TYPE, DTO_GLOBAL, DTO_TOPIC, DTO_DELETETOKEN);

CREATE TABLE ORC_TOPIC_QUEUE_DEL_TOPIC (DTO_TOPIC VARCHAR(256) NOT NULL, DTO_DELETETOKEN INTEGER NOT NULL, DTO_GLOBAL INTEGER NOT NULL, DTO_NODEID VARCHAR(32) NOT NULL, DTO_IDENT INTEGER NOT NULL, DTO_QUEUE_TYPE VARCHAR(1) NOT NULL, CONSTRAINT PK_ORC_TQ_DELTOPIC PRIMARY KEY (DTO_IDENT));

CREATE INDEX IDX_ORC_TQ_DELTOPIC_LOOKUP ON ORC_TOPIC_QUEUE_DEL_TOPIC(DTO_NODEID, DTO_QUEUE_TYPE, DTO_GLOBAL, DTO_TOPIC, DTO_DELETETOKEN);

ALTER TABLE ORC_WORK_QUEUE ADD DELETETOKEN INTEGER;

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ORC_WORK_QUEUE');

ALTER TABLE ORC_TOPIC_QUEUE ADD DELETETOKEN INTEGER;

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ORC_TOPIC_QUEUE');

-- Changeset /opt/liquibase/data/orchestra_4.5.5.0.xml::change-4.5.5.0-11::akn::(Checksum: 6:515066da9181652afdc0353c4a3f7b82)
INSERT INTO ORC_SEC_ROLE_V2 (OSR_SCENARIO, OSR_IDENTIFIER, OSR_DESC) VALUES ('RUNTIME', 'RUNTIME:Recompute.LTA.Statistic', 'Recompute statistics of lta');

INSERT INTO ORC_SEC_ROLE_V2 (OSR_SCENARIO, OSR_IDENTIFIER, OSR_DESC) VALUES ('RUNTIME', 'RUNTIME:Recompute.Process.Overview', 'Recompute process overview');

INSERT INTO ORC_CLUSTER_LOCK (ORC_LOCK_NAME, ORC_LOCK_SCENARIO) VALUES ('LTA.ARCHIVE.IN.PROGESS', 'GLOBAL');

-- Changeset /opt/liquibase/data/orchestra_4.5.5.0.xml::change-4.5.5.0-12::akn::(Checksum: 6:2a19992527621b2157231f21608ddb21)
CREATE TABLE ORC_REST_SVC_PROVIDER (RSP_SCENARIO VARCHAR(250), RSP_NAME VARCHAR(250), RSP_DATA BLOB, RSP_DEPLOYED_AT TIMESTAMP, RSP_UNIQUE_NAME VARCHAR(250) NOT NULL, CONSTRAINT PK_ORC_RSV_PROV PRIMARY KEY (RSP_UNIQUE_NAME));

CREATE INDEX IDX_ORC_RSVP_SCENARIO ON ORC_REST_SVC_PROVIDER(RSP_SCENARIO);

-- Changeset /opt/liquibase/data/orchestra_4.5.5.0.xml::change-4.5.5.0-13.1::akn::(Checksum: 6:c66b7752a3b5020cebae2e990045b9ae)
ALTER TABLE ORC_ADAPTER_STATE DROP PRIMARY KEY;

-- Changeset /opt/liquibase/data/orchestra_4.5.5.0.xml::change-4.5.5.0-13.2::akn::(Checksum: 6:2429b9bd6722eb7280fba1384fb794ec)
UPDATE ORC_ADAPTER_STATE SET ADS_ADAPTER_ID = 'dummy' WHERE ADS_ADAPTER_ID IS NULL;

ALTER TABLE ORC_ADAPTER_STATE ALTER COLUMN  ADS_ADAPTER_ID SET NOT NULL;

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ORC_ADAPTER_STATE');

ALTER TABLE ORC_ADAPTER_STATE ADD CONSTRAINT PK_ORC_ADAPT_STATE PRIMARY KEY (ADS_ADAPTER_ID);

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ORC_ADAPTER_STATE');

CREATE UNIQUE INDEX IDX_ORC_ADAPTER_STATE_NAME_ID ON ORC_ADAPTER_STATE(ADS_ADAPTER_NAME, ADS_NODE_ID);

