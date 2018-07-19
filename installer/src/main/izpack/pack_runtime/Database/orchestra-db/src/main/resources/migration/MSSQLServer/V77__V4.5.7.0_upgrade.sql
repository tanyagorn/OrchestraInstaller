-- *********************************************************************
-- Create Database Script
-- *********************************************************************
-- Change Log: /opt/liquibase/data/orchestra_4.5.7.0.xml
-- Ran at: 5/8/16 4:01 PM
-- Liquibase version: 2.0.5
-- *********************************************************************

-- Changeset /opt/liquibase/data/orchestra_4.5.7.0.xml::change-4.5.7.0-1::akn::(Checksum: 6:f45077ccfa4aa8f1acc5e1ce2bf38f23)
DROP INDEX [ORC_PROCESS_ARBORT].IDX_ORC_PROC_ABORT_CHILD_PROC
GO

ALTER TABLE [ORC_PROCESS_ARBORT] ALTER COLUMN [PRA_PROCESSINSTANCE] VARCHAR(255)
GO

UPDATE [ORC_PROCESS_ARBORT] SET [PRA_PROCESSINSTANCE] = 'dummy' WHERE [PRA_PROCESSINSTANCE] IS NULL
GO

ALTER TABLE [ORC_PROCESS_ARBORT] ALTER COLUMN [PRA_PROCESSINSTANCE] VARCHAR(255) NOT NULL
GO

ALTER TABLE [ORC_PROCESS_ARBORT] ADD CONSTRAINT [PK_ORC_PROCESS_ABORT] PRIMARY KEY ([PRA_PROCESSINSTANCE]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

-- Changeset /opt/liquibase/data/orchestra_4.5.7.0.xml::change-4.5.7.0-2::akn::(Checksum: 6:251e1aa6a6e28498993b09caecfb800c)
ALTER TABLE [ORC_ESB_TCP_CELL] ADD [ETC_ENV_CONF] INT
GO

ALTER TABLE [ORC_ESB_TCP_CELL] ADD [ETC_NODE_NAME] VARCHAR(50)
GO

ALTER TABLE [ORC_ESB_TCP_CELL] ALTER COLUMN [ETC_PASSWORD] VARCHAR(1000)
GO

ALTER TABLE [ORC_ESB_ROUTER] ADD [ERO_ENV_CONF] INT
GO

-- Changeset /opt/liquibase/data/orchestra_4.5.7.0.xml::change-4.5.7.0-3::akn::(Checksum: 6:2c0332b6ba11fe457b3fb5beca99fc34)
ALTER TABLE [ORC_PROCESS_FIFO_SCHED_CACHE] ADD [PFC_STATE] VARCHAR(10)
GO

