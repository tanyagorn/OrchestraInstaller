-- *********************************************************************
-- Create Database Script
-- *********************************************************************
-- Change Log: /opt/liquibase/data/orchestra_4.7.0.0_cluster.xml
-- Ran at: 7/24/17 12:59 PM
-- Liquibase version: 2.0.5
-- *********************************************************************

-- Changeset /opt/liquibase/data/orchestra_4.7.0.0_cluster.xml::change-4.7.0.0-1_cluster::akn::(Checksum: 6:09c6f8d86abaf0884244567ddc86b3cb)
DROP INDEX [ORC_TOPIC_QUEUE].IDX_TOPIC_QUEUE_TOPIC_ID
GO

CREATE NONCLUSTERED INDEX [IDX_TOPIC_QUEUE_TOPIC_ID] ON [ORC_TOPIC_QUEUE] ([ORC_TOPIC_ID], [QUEUE_TYPE], [LOGICAL_ORDER], [STATE], [TARGET_NODE])
			 INCLUDE ([DELETETOKEN], [WORKOBJECT], [ID], [DISCRIMINATOR], [ORC_TOPIC_OWNER]) WITH (ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF)
GO

