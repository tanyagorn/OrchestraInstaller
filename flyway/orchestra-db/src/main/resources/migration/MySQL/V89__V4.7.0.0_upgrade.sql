--  *********************************************************************
--  Create Database Script
--  *********************************************************************
--  Change Log: /opt/liquibase/data/orchestra_4.7.0.0.xml
--  Ran at: 7/5/17 12:31 PM
--  Liquibase version: 2.0.5
--  *********************************************************************

--  Changeset /opt/liquibase/data/orchestra_4.7.0.0.xml::change-4.7.0.0-1::akn::(Checksum: 6:0b3d233300c07781ba3aa99d28bc503f)
ALTER TABLE ORC_EVENT_PROCESS_TOKEN MODIFY EVT_ORCHESTRA_LINK VARCHAR(300);

ALTER TABLE ORC_WORKLIST_TYPE ADD WLT_LABEL VARCHAR(20);

ALTER TABLE ORC_EVENT_PROCESS_TOKEN ADD EVT_VARLOG LONGBLOB;

ALTER TABLE ORC_EVENT_PROCESS_TOKEN ADD EVT_USE_VARLOG INT;

--  Changeset /opt/liquibase/data/orchestra_4.7.0.0.xml::change-4.7.0.0-2_Syslog::akn::(Checksum: 6:350546e6886604c7a888b109c2bead3a)
CREATE TABLE ORC_SYSLOG_QUEUE (ITEMTYPE VARCHAR(256) NOT NULL, DISCRIMINATOR VARCHAR(256) NOT NULL, CREATEDAT TIMESTAMP DEFAULT NOW() NOT NULL, WORKOBJECT LONGBLOB NULL, ID VARCHAR(50) NOT NULL, ACTION CHAR(1) DEFAULT 'W' NULL, NAME VARCHAR(256) NULL, STATE INT NULL, TARGET_NODE VARCHAR(255) NULL, NODE_TICK VARCHAR(255) NULL, QUEUE_TYPE VARCHAR(1) NULL, PRIORITY INT NULL, ORC_TOPIC_OWNER VARCHAR(256) NULL, ORC_TOPIC_ID VARCHAR(256) NULL, NEXT_SCHEDULE_TIME DATETIME NULL, DELETETOKEN INT NULL) ENGINE= innodb;

ALTER TABLE ORC_SYSLOG_QUEUE ADD PRIMARY KEY (ID);

CREATE UNIQUE INDEX IDX_SYSLOG_QUEUE_TOPIC_ID ON ORC_SYSLOG_QUEUE(ORC_TOPIC_ID, QUEUE_TYPE, STATE);

CREATE UNIQUE INDEX IDX_SYSLOG_QUEUE_TOPIC_OWNER ON ORC_SYSLOG_QUEUE(ORC_TOPIC_OWNER, QUEUE_TYPE, STATE);

CREATE UNIQUE INDEX IDX_SYSLOG_QUEUE_STATE_TYPE_ID ON ORC_SYSLOG_QUEUE(STATE, QUEUE_TYPE, ID);

CREATE UNIQUE INDEX IDX_SYSLOG_QUEUE_S_T_Q_N ON ORC_SYSLOG_QUEUE(STATE, ORC_TOPIC_ID, TARGET_NODE, QUEUE_TYPE, NEXT_SCHEDULE_TIME);

CREATE UNIQUE INDEX IDX_SYSLOG_QUEUE_STAT_TYP_PRIO ON ORC_SYSLOG_QUEUE(STATE, QUEUE_TYPE, PRIORITY, ID);

CREATE TABLE ORC_SYSLOG_QUEUE_DEL_TOPIC (DTO_TOPIC VARCHAR(256) NOT NULL, DTO_DELETETOKEN INT NOT NULL, DTO_GLOBAL INT NOT NULL, DTO_NODEID VARCHAR(32) NOT NULL, DTO_IDENT INT NOT NULL, DTO_QUEUE_TYPE VARCHAR(1) NOT NULL) ENGINE= innodb;

ALTER TABLE ORC_SYSLOG_QUEUE_DEL_TOPIC ADD PRIMARY KEY (DTO_IDENT);

CREATE UNIQUE INDEX IDX_ORC_SQ_DELTOPIC_LOOKUP ON ORC_SYSLOG_QUEUE_DEL_TOPIC(DTO_NODEID, DTO_QUEUE_TYPE, DTO_GLOBAL, DTO_TOPIC, DTO_DELETETOKEN);

--  Changeset /opt/liquibase/data/orchestra_4.7.0.0.xml::change-4.7.0.0-3_LTA::akn::(Checksum: 6:d6f9ac2f7f060a7db618c17812715c73)
CREATE TABLE ORC_LTA_MESSAGE_DATA (MES_MESSAGE_ID VARCHAR(255) NOT NULL, MES_ARCHIVE_TIME DATETIME NOT NULL, MES_PROPS LONGBLOB NOT NULL, MES_CONTENT LONGBLOB NULL) ENGINE= innodb;

ALTER TABLE ORC_LTA_MESSAGE_DATA ADD PRIMARY KEY (MES_MESSAGE_ID);

CREATE TABLE ORC_LTA_MESSAGE_PAGE (MPA_MESSAGE_ID VARCHAR(255) NOT NULL, MPA_ID INT NOT NULL, MPA_PAGE_TYPE INT NOT NULL, MPA_ARCHIVE_TIME DATETIME NOT NULL, MPA_DATA LONGBLOB NOT NULL) ENGINE= innodb;

ALTER TABLE ORC_LTA_MESSAGE_PAGE ADD PRIMARY KEY (MPA_MESSAGE_ID, MPA_ID, MPA_PAGE_TYPE);

CREATE TABLE ORC_LTA_PROCESS_DATA (PRS_PROCESS_ID VARCHAR(255) NOT NULL, PRS_ARCHIVE_DATE DATETIME NOT NULL, PRS_PROCESS_DATA LONGBLOB NOT NULL) ENGINE= innodb;

ALTER TABLE ORC_LTA_PROCESS_DATA ADD PRIMARY KEY (PRS_PROCESS_ID);

CREATE TABLE ORC_LTA_MESSAGE_LIST_DATA (MLI_IDENTIFIER VARCHAR(255) NOT NULL, MLI_ARCHIVE_TIME DATETIME NOT NULL, MLI_DATA LONGBLOB NOT NULL) ENGINE= innodb;

ALTER TABLE ORC_LTA_MESSAGE_LIST_DATA ADD PRIMARY KEY (MLI_IDENTIFIER);

ALTER TABLE ORC_LTA_MESSAGE_DATA MODIFY MES_ARCHIVE_TIME DATETIME(3) null;
ALTER TABLE ORC_LTA_MESSAGE_PAGE MODIFY MPA_ARCHIVE_TIME DATETIME(3) null;
ALTER TABLE ORC_LTA_PROCESS_DATA MODIFY PRS_ARCHIVE_DATE DATETIME(3) null;
ALTER TABLE ORC_LTA_MESSAGE_LIST_DATA MODIFY MLI_ARCHIVE_TIME DATETIME(3) null;

--  Changeset /opt/liquibase/data/orchestra_4.7.0.0.xml::change-4.7.0.0-4::akn::(Checksum: 6:c937da6d93e31c0fac92324797ed92ac)
ALTER TABLE ORC_EVENT MODIFY EVT_DATE TIMESTAMP(3) null;

ALTER TABLE ORC_EVENT_PROCESS MODIFY EVT_DATE TIMESTAMP(3) null;

ALTER TABLE ORC_EVENT_PROCESS_TOKEN MODIFY EVT_DATE TIMESTAMP(3) null;

ALTER TABLE ORC_EVENT_SYSTEM MODIFY EVT_DATE TIMESTAMP(3) null;

ALTER TABLE ORC_KPI_INSTANCE MODIFY KIN_LASTACCESS DATETIME(3) null;

ALTER TABLE ORC_LTA_MESSAGE MODIFY MES_CREATED_AT DATETIME(3) null;

ALTER TABLE ORC_LTA_MESSAGE MODIFY MES_LEASE_TIME DATETIME(3) null;

ALTER TABLE ORC_LTA_MESSAGE_LIST MODIFY MLI_ARCHIVE_TIME DATETIME(3) null;

ALTER TABLE ORC_LTA_PROCESS_STATE MODIFY PRS_START_TIME DATETIME(3) null;

ALTER TABLE ORC_LTA_PROCESS_STATE MODIFY PRS_END_TIME DATETIME(3) null;

ALTER TABLE ORC_LTA_PROCESS_STATE MODIFY PRS_CREATE_TIME DATETIME(3) null;

ALTER TABLE ORC_LTA_PROCESS_STATE MODIFY PRS_ARCHIVE_DATE DATETIME(3)null;

ALTER TABLE ORC_MESSAGE MODIFY MES_CREATED_AT TIMESTAMP(3) null;

ALTER TABLE ORC_MESSAGE MODIFY MES_LEASE_TIME TIMESTAMP(3) null;

ALTER TABLE ORC_MESSAGE_LIST MODIFY MLI_CREATED_AT TIMESTAMP(3) null;

ALTER TABLE ORC_MESSAGE_LIST MODIFY MLI_LEASE_TIME TIMESTAMP(3) null;

ALTER TABLE ORC_PROCESS_STATE MODIFY PRS_START_TIME TIMESTAMP(3) null;

ALTER TABLE ORC_PROCESS_STATE MODIFY PRS_END_TIME TIMESTAMP(3) null;

ALTER TABLE ORC_PROCESS_STATE MODIFY PRS_CREATE_TIME TIMESTAMP(3) default CURRENT_TIMESTAMP(3);

ALTER TABLE ORC_PROCESS_TOKEN_STATE MODIFY PRS_CREATE_TIME TIMESTAMP(3) null;

ALTER TABLE ORC_PROCESS_TOKEN_STATE MODIFY PRS_END_TIME TIMESTAMP(3) null;

ALTER TABLE ORC_WORKLIST_ITEM MODIFY WLI_CREATION_DATE TIMESTAMP(3) default CURRENT_TIMESTAMP(3);

--  Changeset /opt/liquibase/data/orchestra_4.7.0.0.xml::change-4.7.0.0-5_Index::akn::(Checksum: 6:ab1249e973e27a3b18511690c8f7c494)
ALTER TABLE ORC_MESSAGE_LIST_ENTRY_PROP DROP PRIMARY KEY;

ALTER TABLE ORC_MESSAGE_LIST_ENTRY_PROP ADD PRIMARY KEY (MLP_ID, MLP_REFERENCE, MLP_KEY);

CREATE INDEX IDX_CLUST_LOCK_STAT ON ORC_CLUSTER_LOCK_STATE(ORC_LOCK_SCENARIO, ORC_LOCK_NAME, ORC_LOCK_OWNER);

CREATE INDEX IDX_ORC_EVENT_SOURCE ON ORC_EVENT_SYSTEM(EVT_SOURCE, EVT_DESCRIPTION);

DROP INDEX IDX_ORC_MESSAGE_CREATED_AT ON ORC_MESSAGE;

CREATE INDEX IDX_ORC_MESSAGE_CREATED_AT ON ORC_MESSAGE(MES_TOUCHED, MES_CREATED_AT);

CREATE INDEX IDX_TRANSACTION_STATE ON ORC_TRANSACTION(TRA_STATE);

DROP INDEX IDX_ORC_MESSAGE_LIST_LEASETIME ON ORC_MESSAGE_LIST;

CREATE INDEX IDX_ORC_MESSAGE_LIST_LEASETIME ON ORC_MESSAGE_LIST(MLI_TYPE, MLI_TOUCHED, MLI_LEASE_TIME);

--  Changeset /opt/liquibase/data/orchestra_4.7.0.0.xml::change-4.7.0.0-6::akn::(Checksum: 6:383b34e18fb458d629da1d867fe782e0)
DROP INDEX IDX_TOPIC_QUEUE_TOPIC_ID ON ORC_TOPIC_QUEUE;

CREATE INDEX IDX_TOPIC_QUEUE_TOPIC_ID ON ORC_TOPIC_QUEUE(ORC_TOPIC_ID, QUEUE_TYPE, STATE, TARGET_NODE, ID);

--  Changeset /opt/liquibase/data/orchestra_4.7.0.0.xml::change-4.7.0.0-7_Index::akn::(Checksum: 6:ce7f525b9cabff9bc0d94b1ebbb4982e)
UPDATE ORC_ESB_SIGNAL_STATE SET EST_IDENTIFIER = 'dummy' WHERE EST_IDENTIFIER IS NULL;

ALTER TABLE ORC_ESB_SIGNAL_STATE MODIFY EST_IDENTIFIER VARCHAR(64) NOT NULL;

ALTER TABLE ORC_ESB_SIGNAL_STATE ADD PRIMARY KEY (EST_IDENTIFIER);
