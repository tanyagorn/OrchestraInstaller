-- *********************************************************************
-- Create Database Script
-- *********************************************************************
-- Change Log: /opt/liquibase/data/orchestra_4.5.7.0_cluster.xml
-- Ran at: 5/8/16 4:00 PM
-- Liquibase version: 2.0.5
-- *********************************************************************

-- Changeset /opt/liquibase/data/orchestra_4.5.7.0_cluster.xml::change-4.5.7.0-1_cluster::akn::(Checksum: 6:ec0b2f6f7a4f5afef188c912faaaeae4)
DROP INDEX IDX_PROCESS_FIFO_SCHED_REF_ID;

-- Changeset /opt/liquibase/data/orchestra_4.5.7.0_cluster.xml::change-4.5.7.0-2_cluster::akn::(Checksum: 6:bad1e83619aaaf94e4747be80ad3f1ea)
CREATE SEQUENCE ORC_SEQ_ORDER_FIFO_SCHEDULE NOCYCLE ORDER CACHE 20 NOMAXVALUE MINVALUE 1 INCREMENT BY 1 START WITH 1;

ALTER TABLE ORC_PROCESS_FIFO_SCHEDULE ADD PFS_LOGICAL_ORDER NUMBER(38, 0);

CREATE SEQUENCE ORC_SEQ_ORDER_PROC_RT_STATE NOCYCLE ORDER CACHE 20 NOMAXVALUE MINVALUE 1 INCREMENT BY 1 START WITH 1;

ALTER TABLE ORC_PROCESS_RUNTIME_STATE ADD PRS_LOGICAL_ORDER NUMBER(38, 0);

-- Changeset /opt/liquibase/data/orchestra_4.5.7.0_cluster.xml::change-4.5.7.0-3_cluster::akn::(Checksum: 6:acff3d0551aabdd7c17a97972dad6b11)
CREATE INDEX IDX_PROCESS_FIFO_SCHED_REF_ID ON ORC_PROCESS_FIFO_SCHEDULE(PFS_MODELL_REFERENCE, PFS_ID, PFS_STATE, PFS_LOGICAL_ORDER);

-- Changeset /opt/liquibase/data/orchestra_4.5.7.0_cluster.xml::change-4.5.7.0-4_cluster::akn::(Checksum: 6:f5c4b1f9a19bf969a7e800a48f982d7d)
CREATE INDEX IDX_PR_RT_REF_ID_ORDER ON ORC_PROCESS_RUNTIME_STATE(PRS_PROCESSMODELL, PRS_STATE, PRS_NODE_ID, PRS_ID, PRS_LOGICAL_ORDER);

-- Changeset /opt/liquibase/data/orchestra_4.5.7.0_cluster.xml::change-4.5.7.0-5_cluster::akn::(Checksum: 6:1230efe4d337d0e439cee937736d0cef)
CREATE TABLE ORC_TOPIC_QUEUE_CPY AS SELECT * FROM ORC_TOPIC_QUEUE;

-- Changeset /opt/liquibase/data/orchestra_4.5.7.0_cluster.xml::change-4.5.7.0-6_cluster::akn::(Checksum: 6:c7ba0d8af985d67b2e0d217860bf68ed)
TRUNCATE TABLE ORC_TOPIC_QUEUE;

-- Changeset /opt/liquibase/data/orchestra_4.5.7.0_cluster.xml::change-4.5.7.0-7_cluster::akn::(Checksum: 6:7460eaeea36a4c889192a918430e09fe)
DROP INDEX IDX_TOPIC_QUEUE_STAT_TYP_PRIO;

DROP INDEX IDX_TOPIC_QUEUE_STATE_TYPE_ID;

-- Changeset /opt/liquibase/data/orchestra_4.5.7.0_cluster.xml::change-4.5.7.0-8_cluster::akn::(Checksum: 6:b57a408cabff33af9ee8a986d8cf1f37)
CREATE SEQUENCE ORC_SEQ_ORDER_TOPIC_QUEUE NOCYCLE ORDER CACHE 20 NOMAXVALUE MINVALUE 1 INCREMENT BY 1 START WITH 1;

ALTER TABLE ORC_TOPIC_QUEUE ADD LOGICAL_ORDER NUMBER(38, 0);

-- Changeset /opt/liquibase/data/orchestra_4.5.7.0_cluster.xml::change-4.5.7.0-9_cluster::akn::(Checksum: 6:ca9e3a319564e8c7e2dbe2b01b8c00af)
INSERT INTO ORC_TOPIC_QUEUE(ITEMTYPE,DISCRIMINATOR,CREATEDAT,WORKOBJECT,ID,ACTION,NAME,STATE,TARGET_NODE,NODE_TICK,QUEUE_TYPE,PRIORITY,ORC_TOPIC_OWNER,ORC_TOPIC_ID,NEXT_SCHEDULE_TIME,DELETETOKEN,LOGICAL_ORDER) 
             SELECT ITEMTYPE,DISCRIMINATOR,CREATEDAT,WORKOBJECT,ID,ACTION,NAME,STATE,TARGET_NODE,NODE_TICK,QUEUE_TYPE,PRIORITY,ORC_TOPIC_OWNER,ORC_TOPIC_ID,NEXT_SCHEDULE_TIME,DELETETOKEN,ORC_SEQ_ORDER_TOPIC_QUEUE.nextVal
             FROM ( SELECT ITEMTYPE,DISCRIMINATOR,CREATEDAT,WORKOBJECT,ID,ACTION,NAME,STATE,TARGET_NODE,NODE_TICK,QUEUE_TYPE,PRIORITY,ORC_TOPIC_OWNER,ORC_TOPIC_ID,NEXT_SCHEDULE_TIME,DELETETOKEN FROM ORC_TOPIC_QUEUE_CPY ORDER BY ID);

-- Changeset /opt/liquibase/data/orchestra_4.5.7.0_cluster.xml::change-4.5.7.0-10_cluster::akn::(Checksum: 6:449038d5e2185dc4c6258d6ba0b85be3)
CREATE INDEX IDX_TOPIC_QUEUE_STAT_TYP_PRIO ON ORC_TOPIC_QUEUE(STATE, QUEUE_TYPE, PRIORITY, ID, LOGICAL_ORDER);

CREATE INDEX IDX_TOPIC_QUEUE_STATE_TYPE_ID ON ORC_TOPIC_QUEUE(STATE, QUEUE_TYPE, ID, LOGICAL_ORDER);

-- Changeset /opt/liquibase/data/orchestra_4.5.7.0_cluster.xml::change-4.5.7.0-11_cluster::akn::(Checksum: 6:6ecfe58191e3c4fd55fead7941ae122a)
DROP TABLE ORC_TOPIC_QUEUE_CPY;

COMMIT;

