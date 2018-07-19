-- *********************************************************************
-- Create Database Script
-- *********************************************************************
-- Change Log: /opt/liquibase/data/orchestra_4.4.3.1.xml
-- Ran at: 12.03.14 14:54
-- Liquibase version: 2.0.5
-- *********************************************************************

-- Changeset /opt/liquibase/data/orchestra_4.4.3.1.xml::change-4.4.3.0-02::akn::(Checksum: 6:154bd5328b7a9e1c5a521d554037bcb8)
CREATE INDEX IDX_ORC_TOPIC_QUEUE_UPDATE_1 ON ORC_TOPIC_QUEUE(STATE, TARGET_NODE, QUEUE_TYPE, ORC_TOPIC_ID);
CALL sysproc.admin_cmd ('REORG TABLE ORC_TOPIC_QUEUE');
