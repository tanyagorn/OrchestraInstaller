--  *********************************************************************
--  Create Database Script
--  *********************************************************************
--  Change Log: /opt/liquibase/data/orchestra_4.5.7.0_cluster.xml
--  Ran at: 5/8/16 5:00 PM
--  Liquibase version: 2.0.5
--  *********************************************************************

--  Changeset /opt/liquibase/data/orchestra_4.5.7.0_cluster.xml::change-4.5.7.0-1_cluster::akn::(Checksum: 6:ec0b2f6f7a4f5afef188c912faaaeae4)
DROP INDEX IDX_PROCESS_FIFO_SCHED_REF_ID ON ORC_PROCESS_FIFO_SCHEDULE;

--  Changeset /opt/liquibase/data/orchestra_4.5.7.0_cluster.xml::change-4.5.7.0-2_cluster::akn::(Checksum: 6:f6122839079657d46ce7f2aaad230fd5)
ALTER TABLE ORC_PROCESS_FIFO_SCHEDULE ADD PFS_LOGICAL_ORDER BIGINT(20);

CREATE UNIQUE INDEX IDX_PROCESS_FIFO_KEY_AUTO ON ORC_PROCESS_FIFO_SCHEDULE(PFS_LOGICAL_ORDER);

ALTER TABLE ORC_PROCESS_FIFO_SCHEDULE MODIFY PFS_LOGICAL_ORDER bigint(20) AUTO_INCREMENT;

ALTER TABLE ORC_PROCESS_RUNTIME_STATE ADD PRS_LOGICAL_ORDER BIGINT(20);

CREATE UNIQUE INDEX IDX_PROCESS_RT_STATE_KEY_AUTO ON ORC_PROCESS_RUNTIME_STATE(PRS_LOGICAL_ORDER);

ALTER TABLE ORC_PROCESS_RUNTIME_STATE MODIFY PRS_LOGICAL_ORDER bigint(20) AUTO_INCREMENT;

--  Changeset /opt/liquibase/data/orchestra_4.5.7.0_cluster.xml::change-4.5.7.0-3_cluster::akn::(Checksum: 6:acff3d0551aabdd7c17a97972dad6b11)
CREATE INDEX IDX_PROCESS_FIFO_SCHED_REF_ID ON ORC_PROCESS_FIFO_SCHEDULE(PFS_MODELL_REFERENCE, PFS_ID, PFS_STATE, PFS_LOGICAL_ORDER);

--  Changeset /opt/liquibase/data/orchestra_4.5.7.0_cluster.xml::change-4.5.7.0-4_cluster::akn::(Checksum: 6:f5c4b1f9a19bf969a7e800a48f982d7d)
CREATE INDEX IDX_PR_RT_REF_ID_ORDER ON ORC_PROCESS_RUNTIME_STATE(PRS_PROCESSMODELL, PRS_STATE, PRS_NODE_ID, PRS_ID, PRS_LOGICAL_ORDER);

--  Changeset /opt/liquibase/data/orchestra_4.5.7.0_cluster.xml::change-4.5.7.0-5_cluster::akn::(Checksum: 6:71aac33111147886da38880d30df89f0)
create table ORC_TOPIC_QUEUE_CPY as select * from ORC_TOPIC_QUEUE;

--  Changeset /opt/liquibase/data/orchestra_4.5.7.0_cluster.xml::change-4.5.7.0-6_cluster::akn::(Checksum: 6:c7ba0d8af985d67b2e0d217860bf68ed)
TRUNCATE TABLE ORC_TOPIC_QUEUE;

--  Changeset /opt/liquibase/data/orchestra_4.5.7.0_cluster.xml::change-4.5.7.0-7_cluster::akn::(Checksum: 6:7460eaeea36a4c889192a918430e09fe)
DROP INDEX IDX_TOPIC_QUEUE_STAT_TYP_PRIO ON ORC_TOPIC_QUEUE;

DROP INDEX IDX_TOPIC_QUEUE_STATE_TYPE_ID ON ORC_TOPIC_QUEUE;

--  Changeset /opt/liquibase/data/orchestra_4.5.7.0_cluster.xml::change-4.5.7.0-8_cluster::akn::(Checksum: 6:b68e2334f1f6bcd541ed343246da95f0)
ALTER TABLE ORC_TOPIC_QUEUE ADD LOGICAL_ORDER BIGINT(20);

CREATE UNIQUE INDEX IDX_TOPIC_QUEUE_LOG_ORDER ON ORC_TOPIC_QUEUE(LOGICAL_ORDER);

ALTER TABLE ORC_TOPIC_QUEUE MODIFY LOGICAL_ORDER bigint(20) AUTO_INCREMENT;

--  Changeset /opt/liquibase/data/orchestra_4.5.7.0_cluster.xml::change-4.5.7.0-9_cluster::akn::(Checksum: 6:9a4fa413337a48d2eb1e1be4141007a0)
INSERT INTO ORC_TOPIC_QUEUE(ITEMTYPE,DISCRIMINATOR,CREATEDAT,WORKOBJECT,ID,ACTION,NAME,STATE,TARGET_NODE,NODE_TICK,QUEUE_TYPE,PRIORITY,ORC_TOPIC_OWNER,ORC_TOPIC_ID,NEXT_SCHEDULE_TIME,DELETETOKEN) 
             SELECT ITEMTYPE,DISCRIMINATOR,CREATEDAT,WORKOBJECT,ID,ACTION,NAME,STATE,TARGET_NODE,NODE_TICK,QUEUE_TYPE,PRIORITY,ORC_TOPIC_OWNER,ORC_TOPIC_ID,NEXT_SCHEDULE_TIME,DELETETOKEN 
             FROM ORC_TOPIC_QUEUE_CPY ORDER BY ID;

--  Changeset /opt/liquibase/data/orchestra_4.5.7.0_cluster.xml::change-4.5.7.0-10_cluster::akn::(Checksum: 6:449038d5e2185dc4c6258d6ba0b85be3)
CREATE INDEX IDX_TOPIC_QUEUE_STAT_TYP_PRIO ON ORC_TOPIC_QUEUE(STATE, QUEUE_TYPE, PRIORITY, ID, LOGICAL_ORDER);

CREATE INDEX IDX_TOPIC_QUEUE_STATE_TYPE_ID ON ORC_TOPIC_QUEUE(STATE, QUEUE_TYPE, ID, LOGICAL_ORDER);

--  Changeset /opt/liquibase/data/orchestra_4.5.7.0_cluster.xml::change-4.5.7.0-11_cluster::akn::(Checksum: 6:6ecfe58191e3c4fd55fead7941ae122a)
DROP TABLE ORC_TOPIC_QUEUE_CPY;

