-- *********************************************************************
-- Create Database Script
-- *********************************************************************
-- Change Log: /opt/liquibase/data/orchestra_4.4.3.1.xml
-- Ran at: 27.02.14 10:31
-- Liquibase version: UNKNOWN
-- *********************************************************************

-- Changeset /opt/liquibase/data/orchestra_4.4.3.1.xml::change-4.4.3.0-02::akn::(Checksum: 6:154bd5328b7a9e1c5a521d554037bcb8)
CREATE INDEX IDX_ORC_TOPIC_QUEUE_UPDATE_1 ON [ORC_TOPIC_QUEUE]([STATE], [TARGET_NODE], [QUEUE_TYPE], [ORC_TOPIC_ID]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

