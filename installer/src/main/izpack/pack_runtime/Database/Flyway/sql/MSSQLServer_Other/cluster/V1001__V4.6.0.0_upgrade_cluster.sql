-- *********************************************************************
-- Create Database Script
-- *********************************************************************
-- Change Log: /opt/liquibase/data/orchestra_4.6.0.0_cluster.xml
-- Ran at: 2/15/17 3:14 PM
-- Liquibase version: 2.0.5
-- *********************************************************************

-- Changeset /opt/liquibase/data/orchestra_4.6.0.0_cluster.xml::change-4.6.0.0-1_cluster::akn::(Checksum: 6:7926ae891339971d775e41a5bd3ac414)
DROP INDEX [ORC_PROCESS_FIFO_SCHEDULE].IDX_PROCESS_FIFO_SCHED_REF_ID
GO

DROP INDEX [ORC_TOPIC_QUEUE].IDX_ORC_TOPIC_QUEUE_TOPIC_ID
GO

DROP INDEX [ORC_TOPIC_QUEUE].IDX_TOPIC_QUEUE_S_T_Q_N
GO

-- Changeset /opt/liquibase/data/orchestra_4.6.0.0_cluster.xml::change-4.6.0.0-2_cluster::akn::(Checksum: 6:89c61c88dad4fc5778224614c369e8c6)
CREATE NONCLUSTERED INDEX IDX_PROCESS_FIFO_SCHED_REF_ID ON ORC_PROCESS_FIFO_SCHEDULE (PFS_MODELL_REFERENCE , PFS_ID , PFS_LOGICAL_ORDER)
			 INCLUDE (PFS_PROCESS_REFERENCE, PFS_STATE, PFS_TARGET_NODE) WITH (ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF) ON [PRIMARY]
GO

-- Changeset /opt/liquibase/data/orchestra_4.6.0.0_cluster.xml::change-4.6.0.0-3_cluster_IN-0004118::akn::(Checksum: 6:07ebdd4c5f8a80ef61e005e56994b356)
CREATE NONCLUSTERED INDEX [IDX_TOPIC_QUEUE_TOPIC_ID] ON [ORC_TOPIC_QUEUE] ([ORC_TOPIC_ID], [QUEUE_TYPE], [STATE], [LOGICAL_ORDER])
			 INCLUDE ([TARGET_NODE], [DELETETOKEN], [WORKOBJECT], [ID], [DISCRIMINATOR], [ORC_TOPIC_OWNER]) WITH (ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF) ON [PRIMARY]
GO

-- Changeset /opt/liquibase/data/orchestra_4.6.0.0_cluster.xml::change-4.6.0.0-4_cluster_IN-0004241::akn::(Checksum: 6:e41dff84923798ba62b79de871938538)
CREATE NONCLUSTERED INDEX [IDX_TOPIC_QUEUE_S_T_Q_N] ON [ORC_TOPIC_QUEUE] ([STATE], [ORC_TOPIC_ID], [TARGET_NODE], [QUEUE_TYPE], [NEXT_SCHEDULE_TIME])
			 WITH (ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF) ON [PRIMARY]
GO

