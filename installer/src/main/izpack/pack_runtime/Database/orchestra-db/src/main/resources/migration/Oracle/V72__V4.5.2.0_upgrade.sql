-- *********************************************************************
-- Create Database Script
-- *********************************************************************
-- Change Log: /opt/liquibase/data/orchestra_4.5.2.0.xml
-- Ran at: 01.08.14 10:16
-- Liquibase version: 2.0.5
-- *********************************************************************

-- Changeset /opt/liquibase/data/orchestra_4.5.2.0.xml::change-4.5.2.0-01::akn::(Checksum: 6:e712d8aea82f060aa8a26c09992c3194)
ALTER TABLE ORC_PROCESS_FIFO_SCHED_CACHE DROP PRIMARY KEY DROP INDEX;

ALTER TABLE ORC_PROCESS_FIFO_SCHED_CACHE ADD CONSTRAINT PK_PROCESS_FIFO_CACHE PRIMARY KEY (PFC_PROCESS_REFERENCE);

-- Changeset /opt/liquibase/data/orchestra_4.5.2.0.xml::change-4.5.2.0-02::akn::(Checksum: 6:16d671fef4601c41d3bdf205be2869b4)
UPDATE ORC_SCENARIO_DOC SET SDO_SCENARIO = 'ORC' WHERE SDO_SCENARIO IS NULL;

ALTER TABLE ORC_SCENARIO_DOC MODIFY SDO_SCENARIO NOT NULL;

UPDATE ORC_SCENARIO_DOC SET SDO_NAME = 'ORC' WHERE SDO_NAME IS NULL;

ALTER TABLE ORC_SCENARIO_DOC MODIFY SDO_NAME NOT NULL;

ALTER TABLE ORC_SCENARIO_DOC ADD CONSTRAINT PK_SCENARIO_DOC PRIMARY KEY (SDO_SCENARIO, SDO_NAME);

-- Changeset /opt/liquibase/data/orchestra_4.5.2.0.xml::change-4.5.2.0-09::akn::(Checksum: 6:8da24220f9084030be61c658efb6f015)
DROP INDEX IDX_ORC_EVT_LOCAL_VAR_VALUE;

DROP INDEX IDX_ORC_EVT_PROCESS_VAR_VALUE;

-- Changeset /opt/liquibase/data/orchestra_4.5.2.0.xml::change-4.5.2.0-10::akn::(Checksum: 6:16ff7b8691b02e0a394237a58e6bca7e)
ALTER TABLE ORC_EVT_PROCESS_VARIABLES MODIFY EVV_VALUE VARCHAR2(1024);

ALTER TABLE ORC_EVT_LOCAL_VARIABLES MODIFY EVV_VALUE VARCHAR2(1024);

COMMIT;

