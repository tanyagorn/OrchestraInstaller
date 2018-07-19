-- *********************************************************************
-- Create Database Script
-- *********************************************************************
-- Change Log: /opt/liquibase/data/orchestra_4.6.0.0_cluster.xml
-- Ran at: 2/15/17 12:20 PM
-- Liquibase version: 2.0.5
-- *********************************************************************

-- Changeset /opt/liquibase/data/orchestra_4.6.0.0_cluster.xml::change-4.6.0.0-1_cluster::akn::(Checksum: 6:937c83ff2dd343d39e6b1643d2ccb60d)
DROP INDEX IDX_PROCESS_FIFO_SCHED_REF_ID;

DROP INDEX IDX_TOPIC_QUEUE_TOPIC_ID;

DROP INDEX IDX_TOPIC_QUEUE_S_T_Q_N;

-- Changeset /opt/liquibase/data/orchestra_4.6.0.0_cluster.xml::change-4.6.0.0-2_cluster::akn::(Checksum: 6:92bc62f7cdaaea76a305997096a2c6c8)
CREATE INDEX IDX_PROCESS_FIFO_SCHED_REF_ID ON ORC_PROCESS_FIFO_SCHEDULE(PFS_MODELL_REFERENCE, PFS_ID, PFS_LOGICAL_ORDER, PFS_STATE);

-- Changeset /opt/liquibase/data/orchestra_4.6.0.0_cluster.xml::change-4.6.0.0-3_cluster_IN-0004118::akn::(Checksum: 6:cd098a9af32366d02a6dec1dad176b92)
CREATE INDEX IDX_TOPIC_QUEUE_TOPIC_ID ON ORC_TOPIC_QUEUE(ORC_TOPIC_ID, QUEUE_TYPE, STATE, LOGICAL_ORDER);

-- Changeset /opt/liquibase/data/orchestra_4.6.0.0_cluster.xml::change-4.6.0.0-4_cluster_IN-0004241::akn::(Checksum: 6:90d98acf92a1764d9eb3222f66fdcc74)
CREATE INDEX IDX_TOPIC_QUEUE_S_T_Q_N ON ORC_TOPIC_QUEUE(STATE, ORC_TOPIC_ID, TARGET_NODE, QUEUE_TYPE, NEXT_SCHEDULE_TIME);

COMMIT;

