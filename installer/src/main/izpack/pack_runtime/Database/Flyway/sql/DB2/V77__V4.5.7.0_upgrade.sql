-- *********************************************************************
-- Create Database Script
-- *********************************************************************
-- Change Log: /opt/liquibase/data/orchestra_4.5.7.0.xml
-- Ran at: 5/8/16 4:00 PM
-- Liquibase version: 2.0.5
-- *********************************************************************

-- Changeset /opt/liquibase/data/orchestra_4.5.7.0.xml::change-4.5.7.0-1::akn::(Checksum: 6:f45077ccfa4aa8f1acc5e1ce2bf38f23)
DROP INDEX IDX_ORC_PROC_ABORT_CHILD_PROC;

ALTER TABLE ORC_PROCESS_ARBORT ALTER COLUMN PRA_PROCESSINSTANCE SET DATA TYPE VARCHAR(255);

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ORC_PROCESS_ARBORT');

UPDATE ORC_PROCESS_ARBORT SET PRA_PROCESSINSTANCE = 'dummy' WHERE PRA_PROCESSINSTANCE IS NULL;

ALTER TABLE ORC_PROCESS_ARBORT ALTER COLUMN  PRA_PROCESSINSTANCE SET NOT NULL;

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ORC_PROCESS_ARBORT');

ALTER TABLE ORC_PROCESS_ARBORT ADD CONSTRAINT PK_ORC_PROCESS_AB PRIMARY KEY (PRA_PROCESSINSTANCE);

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ORC_PROCESS_ARBORT');

-- Changeset /opt/liquibase/data/orchestra_4.5.7.0.xml::change-4.5.7.0-2::akn::(Checksum: 6:251e1aa6a6e28498993b09caecfb800c)
ALTER TABLE ORC_ESB_TCP_CELL ADD ETC_ENV_CONF INTEGER;

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ORC_ESB_TCP_CELL');

ALTER TABLE ORC_ESB_TCP_CELL ADD ETC_NODE_NAME VARCHAR(50);

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ORC_ESB_TCP_CELL');

ALTER TABLE ORC_ESB_TCP_CELL ALTER COLUMN ETC_PASSWORD SET DATA TYPE VARCHAR(1000);

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ORC_ESB_TCP_CELL');

ALTER TABLE ORC_ESB_ROUTER ADD ERO_ENV_CONF INTEGER;

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ORC_ESB_ROUTER');

-- Changeset /opt/liquibase/data/orchestra_4.5.7.0.xml::change-4.5.7.0-3::akn::(Checksum: 6:2c0332b6ba11fe457b3fb5beca99fc34)
ALTER TABLE ORC_PROCESS_FIFO_SCHED_CACHE ADD PFC_STATE VARCHAR(10);

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ORC_PROCESS_FIFO_SCHED_CACHE');

