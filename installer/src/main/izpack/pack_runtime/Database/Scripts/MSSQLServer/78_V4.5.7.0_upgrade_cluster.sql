-- *********************************************************************
-- Create Database Script
-- *********************************************************************
-- Change Log: /opt/liquibase/data/orchestra_4.5.7.0_cluster.xml
-- Ran at: 5/8/16 5:01 PM
-- Liquibase version: 2.0.5
-- *********************************************************************

-- Changeset /opt/liquibase/data/orchestra_4.5.7.0_cluster.xml::change-4.5.7.0-1_cluster::akn::(Checksum: 6:ec0b2f6f7a4f5afef188c912faaaeae4)
DROP INDEX [ORC_PROCESS_FIFO_SCHEDULE].IDX_PROCESS_FIFO_SCHED_REF_ID
GO

-- Changeset /opt/liquibase/data/orchestra_4.5.7.0_cluster.xml::change-4.5.7.0-2_cluster::akn::(Checksum: 6:cbb7b8919337bbbe87af937f6c254a9c)
ALTER TABLE ORC_PROCESS_FIFO_SCHEDULE ADD PFS_LOGICAL_ORDER BIGINT IDENTITY(1, 1) NOT NULL
GO

ALTER TABLE ORC_PROCESS_RUNTIME_STATE ADD PRS_LOGICAL_ORDER BIGINT IDENTITY(1, 1) NOT NULL
GO

-- Changeset /opt/liquibase/data/orchestra_4.5.7.0_cluster.xml::change-4.5.7.0-3_cluster::akn::(Checksum: 6:89c61c88dad4fc5778224614c369e8c6)
CREATE NONCLUSTERED INDEX IDX_PROCESS_FIFO_SCHED_REF_ID ON ORC_PROCESS_FIFO_SCHEDULE (PFS_MODELL_REFERENCE , PFS_ID , PFS_LOGICAL_ORDER)
			 INCLUDE (PFS_PROCESS_REFERENCE, PFS_STATE, PFS_TARGET_NODE) WITH (ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF) ON [PRIMARY]
GO

-- Changeset /opt/liquibase/data/orchestra_4.5.7.0_cluster.xml::change-4.5.7.0-4_cluster::akn::(Checksum: 6:f5c4b1f9a19bf969a7e800a48f982d7d)
CREATE INDEX IDX_PR_RT_REF_ID_ORDER ON [ORC_PROCESS_RUNTIME_STATE]([PRS_PROCESSMODELL], [PRS_STATE], [PRS_NODE_ID], [PRS_ID], [PRS_LOGICAL_ORDER]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

-- Changeset /opt/liquibase/data/orchestra_4.5.7.0_cluster.xml::change-4.5.7.0-5_cluster::akn::(Checksum: 6:571254f698c04515de583c451425af21)
SELECT * INTO ORC_TOPIC_QUEUE_CPY FROM ORC_TOPIC_QUEUE
GO

-- Changeset /opt/liquibase/data/orchestra_4.5.7.0_cluster.xml::change-4.5.7.0-6_cluster::akn::(Checksum: 6:c7ba0d8af985d67b2e0d217860bf68ed)
TRUNCATE TABLE ORC_TOPIC_QUEUE
GO

-- Changeset /opt/liquibase/data/orchestra_4.5.7.0_cluster.xml::change-4.5.7.0-7_cluster::akn::(Checksum: 6:d41d8cd98f00b204e9800998ecf8427e)
-- Changeset /opt/liquibase/data/orchestra_4.5.7.0_cluster.xml::change-4.5.7.0-8_cluster::akn::(Checksum: 6:ea6ef852621cbad4e84f8c390fdffd04)
ALTER TABLE ORC_TOPIC_QUEUE ADD LOGICAL_ORDER BIGINT IDENTITY(1, 1) NOT NULL
GO

-- Changeset /opt/liquibase/data/orchestra_4.5.7.0_cluster.xml::change-4.5.7.0-9_cluster::akn::(Checksum: 6:9a4fa413337a48d2eb1e1be4141007a0)
INSERT INTO ORC_TOPIC_QUEUE(ITEMTYPE,DISCRIMINATOR,CREATEDAT,WORKOBJECT,ID,ACTION,NAME,STATE,TARGET_NODE,NODE_TICK,QUEUE_TYPE,PRIORITY,ORC_TOPIC_OWNER,ORC_TOPIC_ID,NEXT_SCHEDULE_TIME,DELETETOKEN) 
             SELECT ITEMTYPE,DISCRIMINATOR,CREATEDAT,WORKOBJECT,ID,ACTION,NAME,STATE,TARGET_NODE,NODE_TICK,QUEUE_TYPE,PRIORITY,ORC_TOPIC_OWNER,ORC_TOPIC_ID,NEXT_SCHEDULE_TIME,DELETETOKEN 
             FROM ORC_TOPIC_QUEUE_CPY ORDER BY ID
GO

-- Changeset /opt/liquibase/data/orchestra_4.5.7.0_cluster.xml::change-4.5.7.0-10_cluster::akn::(Checksum: 6:d41d8cd98f00b204e9800998ecf8427e)
-- Changeset /opt/liquibase/data/orchestra_4.5.7.0_cluster.xml::change-4.5.7.0-11_cluster::akn::(Checksum: 6:6ecfe58191e3c4fd55fead7941ae122a)
DROP TABLE ORC_TOPIC_QUEUE_CPY
GO

