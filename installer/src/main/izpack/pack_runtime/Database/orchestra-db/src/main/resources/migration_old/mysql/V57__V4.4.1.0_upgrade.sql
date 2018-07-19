--  *********************************************************************
--  Create Database Script
--  *********************************************************************
--  Change Log: /opt/liquibase/data/orchestra_4.4.1.0.xml
--  Ran at: 14.01.14 14:23
--  Liquibase version: UNKNOWN
--  *********************************************************************

--  Changeset /opt/liquibase/data/orchestra_4.4.1.0.xml::change-4.4.1.0-01::akn::(Checksum: 6:7b5dd3faf4795607533d83afa3b94e56)
UPDATE ORC_CLUSTER_LOCK SET ORC_LOCK_NAME = '''xxxxxx''' WHERE ORC_LOCK_NAME IS NULL;

ALTER TABLE ORC_CLUSTER_LOCK MODIFY ORC_LOCK_NAME VARCHAR(255) NOT NULL;

UPDATE ORC_CLUSTER_LOCK SET ORC_LOCK_SCENARIO = '''xxxxxx''' WHERE ORC_LOCK_SCENARIO IS NULL;

ALTER TABLE ORC_CLUSTER_LOCK MODIFY ORC_LOCK_SCENARIO VARCHAR(255) NOT NULL;

ALTER TABLE ORC_CLUSTER_LOCK ADD PRIMARY KEY (ORC_LOCK_NAME, ORC_LOCK_SCENARIO);

ALTER TABLE ORC_EVENT_SYSTEM ADD EVT_NODE VARCHAR(255);

ALTER TABLE ORC_PROCESS_STATE ADD PRS_NODE VARCHAR(255) DEFAULT null;

ALTER TABLE ORC_PROCESS_STATE ADD PRS_DELETED INT NOT NULL DEFAULT 0;

UPDATE ORC_EVENT_SYSTEM SET EVT_NODE = 'ORC';

UPDATE ORC_PROCESS_STATE SET PRS_NODE = 'ORC';

UPDATE ORC_PROCESS_FIFO_SCHEDULE SET PFS_TARGET_NODE = 'ORC';

UPDATE ORC_MONITOR_TABLESETTINGS SET ORC_COLUMN_PATTERN = 'y,y,y,y,y,y,y,y,y,y' WHERE ORC_TABLECLASS = 'ProcessOverviewTable';

UPDATE ORC_MONITOR_TABLESETTINGS SET ORC_COLUMN_PATTERN = 'y,y,y,y,y,y,y,y,y' WHERE ORC_TABLECLASS = 'ProcessDetailTable';

UPDATE ORC_MONITOR_TABLESETTINGS SET ORC_COLUMN_PATTERN = 'y,y,y,y,y,y,y' WHERE ORC_TABLECLASS = 'SystemEventTable';

--  Changeset /opt/liquibase/data/orchestra_4.4.1.0.xml::change-4.4.1.0-02::akn::(Checksum: 6:5fc5e007360b28399c5a886c780b3e18)
DROP INDEX IDX_LTA_MSG_MESSAGE_ID ON ORC_LTA_MESSAGE;

ALTER TABLE ORC_LTA_MESSAGE ADD PRIMARY KEY (MES_MESSAGE_ID);

--  Changeset /opt/liquibase/data/orchestra_4.4.1.0.xml::change-4.4.1.0-03::akn::(Checksum: 6:72cd25cbc14c4f400fd4c91d54b187a6)
DROP VIEW ORC_PROCESS_STATE_BUSINESS_KEY;

CREATE VIEW ORC_PROCESS_STATE_BUSINESS_KEY AS SELECT PRS_PROCESS_ID, PRS_MODELL_ID, PRS_START_TIME, PRS_END_TIME,
				  PRS_STATE, PRS_BUSINESS_KEY, PRS_SCENARIO_ID,
				  PRS_ROOT_TOKEN, PRS_PROCESS_MODEL, PRS_VERSION_TAG, PRS_CREATE_TIME, PEK_PROCESS_ID,
				  PEK_BUSINESS_KEY_NAME, PEK_BUSINESS_KEY, PRS_DELETED, PRS_NODE
			 FROM orc_process_state, orc_process_ext_business_keys
			WHERE pek_process_id = prs_process_id;

DROP VIEW ORC_PROCESS_STATE_V;

CREATE VIEW ORC_PROCESS_STATE_V AS SELECT * FROM ORC_PROCESS_STATE;

--  Changeset /opt/liquibase/data/orchestra_4.4.1.0.xml::change-4.4.1.0-04::akn::(Checksum: 6:fc5ed904bf6421d3611231c57a978938)
CREATE INDEX IDX_LTA_PROC_STATE_SID_PID ON ORC_LTA_PROCESS_STATE(PRS_SCENARIO_ID, PRS_PROCESS_ID);

--  Changeset /opt/liquibase/data/orchestra_4.4.1.0.xml::change-4.4.1.0-06::akn::(Checksum: 6:568596ea9a39987da68be866f1515e91)
ALTER TABLE ORC_PROCESS_FIFO_SCHEDULE ADD PFS_OWNER_NODE VARCHAR(256);
