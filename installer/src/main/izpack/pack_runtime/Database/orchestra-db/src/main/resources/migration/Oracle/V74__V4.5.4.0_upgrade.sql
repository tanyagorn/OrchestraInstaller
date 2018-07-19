-- *********************************************************************
-- Create Database Script
-- *********************************************************************
-- Change Log: /opt/liquibase/data/orchestra_4.5.4.0.xml
-- Ran at: 09.02.15 10:05
-- Liquibase version: 2.0.5
-- *********************************************************************

-- Changeset /opt/liquibase/data/orchestra_4.5.4.0.xml::change-4.5.4.0-01::akn::(Checksum: 6:d63ea4f81cd83f85efd1d4420127e182)
DROP INDEX IDX_WORK_QUEUE_STAT_TYP_PRIO;

DROP INDEX IDX_WORK_QUEUE_STATE_TYPE_ID;

ALTER TABLE ORC_WORK_QUEUE DROP PRIMARY KEY DROP INDEX;

ALTER TABLE ORC_WORK_QUEUE MODIFY ID VARCHAR2(40);

ALTER TABLE ORC_WORK_QUEUE ADD CONSTRAINT PK_WORK_QUEUE_ID PRIMARY KEY (ID);

CREATE INDEX IDX_WORK_QUEUE_STAT_TYP_PRIO ON ORC_WORK_QUEUE(STATE, QUEUE_TYPE, PRIORITY, ID);

CREATE INDEX IDX_WORK_QUEUE_STATE_TYPE_ID ON ORC_WORK_QUEUE(STATE, QUEUE_TYPE, ID);

-- Changeset /opt/liquibase/data/orchestra_4.5.4.0.xml::change-4.5.4.0-02::akn::(Checksum: 6:c6e213eb6657b8b02537af84d8bb32b2)
DROP INDEX IDX_TOPIC_QUEUE_STATE_TYPE_ID;

DROP INDEX IDX_TOPIC_QUEUE_STAT_TYP_PRIO;

ALTER TABLE ORC_TOPIC_QUEUE DROP PRIMARY KEY DROP INDEX;

ALTER TABLE ORC_TOPIC_QUEUE MODIFY ID VARCHAR2(40);

ALTER TABLE ORC_TOPIC_QUEUE ADD CONSTRAINT PK_TOPIC_QUEUE_ID PRIMARY KEY (ID);

CREATE INDEX IDX_TOPIC_QUEUE_STATE_TYPE_ID ON ORC_TOPIC_QUEUE(STATE, QUEUE_TYPE, ID);

CREATE INDEX IDX_TOPIC_QUEUE_STAT_TYP_PRIO ON ORC_TOPIC_QUEUE(STATE, QUEUE_TYPE, PRIORITY, ID);

-- Changeset /opt/liquibase/data/orchestra_4.5.4.0.xml::change-4.5.4.0-03::akn::(Checksum: 6:be201c22866cfac5d5cf232695e956f5)
CREATE INDEX IDX_PROC_FIFO_CACHE_PREF ON ORC_PROCESS_FIFO_SCHED_CACHE(PFC_PROCESS_REFERENCE, PFC_TARGET_NODE);

-- Changeset /opt/liquibase/data/orchestra_4.5.4.0.xml::change-4.5.4.0-04::akn::(Checksum: 6:c3d481b5bd942bbd6be474aa0abad468)
ALTER TABLE ORC_SERVER_SETTINGS ADD MASS_OPERATION_BLOCK_SIZE INTEGER DEFAULT '500';

UPDATE ORC_SERVER_SETTINGS SET MASS_OPERATION_BLOCK_SIZE = 500;

COMMIT;
