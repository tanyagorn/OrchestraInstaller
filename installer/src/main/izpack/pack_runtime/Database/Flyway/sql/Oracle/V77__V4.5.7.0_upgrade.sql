-- *********************************************************************
-- Create Database Script
-- *********************************************************************
-- Change Log: /opt/liquibase/data/orchestra_4.5.7.0.xml
-- Ran at: 5/8/16 3:00 PM
-- Liquibase version: 2.0.5
-- *********************************************************************

-- Changeset /opt/liquibase/data/orchestra_4.5.7.0.xml::change-4.5.7.0-1::akn::(Checksum: 6:f45077ccfa4aa8f1acc5e1ce2bf38f23)
DROP INDEX IDX_ORC_PROC_ABORT_CHILD_PROC;

ALTER TABLE ORC_PROCESS_ARBORT MODIFY PRA_PROCESSINSTANCE VARCHAR2(255);

UPDATE ORC_PROCESS_ARBORT SET PRA_PROCESSINSTANCE = 'dummy' WHERE PRA_PROCESSINSTANCE IS NULL;

ALTER TABLE ORC_PROCESS_ARBORT MODIFY PRA_PROCESSINSTANCE NOT NULL;

ALTER TABLE ORC_PROCESS_ARBORT ADD CONSTRAINT PK_ORC_PROCESS_ABORT PRIMARY KEY (PRA_PROCESSINSTANCE);

-- Changeset /opt/liquibase/data/orchestra_4.5.7.0.xml::change-4.5.7.0-2::akn::(Checksum: 6:251e1aa6a6e28498993b09caecfb800c)
ALTER TABLE ORC_ESB_TCP_CELL ADD ETC_ENV_CONF INTEGER;

ALTER TABLE ORC_ESB_TCP_CELL ADD ETC_NODE_NAME VARCHAR2(50);

ALTER TABLE ORC_ESB_TCP_CELL MODIFY ETC_PASSWORD VARCHAR2(1000);

ALTER TABLE ORC_ESB_ROUTER ADD ERO_ENV_CONF INTEGER;

-- Changeset /opt/liquibase/data/orchestra_4.5.7.0.xml::change-4.5.7.0-3::akn::(Checksum: 6:2c0332b6ba11fe457b3fb5beca99fc34)
ALTER TABLE ORC_PROCESS_FIFO_SCHED_CACHE ADD PFC_STATE VARCHAR2(10);

COMMIT;

