-- *********************************************************************
-- Create Database Script
-- *********************************************************************
-- Change Log: /opt/liquibase/data/orchestra_4.7.0.0_cluster.xml
-- Ran at: 7/24/17 11:59 AM
-- Liquibase version: 2.0.5
-- *********************************************************************

-- Changeset /opt/liquibase/data/orchestra_4.7.0.0_cluster.xml::change-4.7.0.0-1_cluster::akn::(Checksum: 6:b0d1409b820f5da69937cb4dd95b8fca)
DROP INDEX IDX_TOPIC_QUEUE_TOPIC_ID;

CREATE INDEX IDX_TOPIC_QUEUE_TOPIC_ID ON ORC_TOPIC_QUEUE(ORC_TOPIC_ID, QUEUE_TYPE, LOGICAL_ORDER, STATE, TARGET_NODE);

COMMIT;

