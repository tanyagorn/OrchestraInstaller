-- *********************************************************************
-- Create Database Script
-- *********************************************************************
-- Change Log: /opt/liquibase/data/orchestra_4.5.2.0.xml
-- Ran at: 01.08.14 11:16
-- Liquibase version: 2.0.5
-- *********************************************************************

-- Changeset /opt/liquibase/data/orchestra_4.5.2.0.xml::change-4.5.2.0-01::akn::(Checksum: 6:e712d8aea82f060aa8a26c09992c3194)
ALTER TABLE [ORC_PROCESS_FIFO_SCHED_CACHE] DROP CONSTRAINT [PK_PROCESS_FIFO_CACHE]
GO

ALTER TABLE [ORC_PROCESS_FIFO_SCHED_CACHE] ADD CONSTRAINT [PK_PROCESS_FIFO_CACHE] PRIMARY KEY ([PFC_PROCESS_REFERENCE]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

-- Changeset /opt/liquibase/data/orchestra_4.5.2.0.xml::change-4.5.2.0-02::akn::(Checksum: 6:16d671fef4601c41d3bdf205be2869b4)
UPDATE [ORC_SCENARIO_DOC] SET [SDO_SCENARIO] = 'ORC' WHERE [SDO_SCENARIO] IS NULL
GO

ALTER TABLE [ORC_SCENARIO_DOC] ALTER COLUMN [SDO_SCENARIO] VARCHAR(250) NOT NULL
GO

UPDATE [ORC_SCENARIO_DOC] SET [SDO_NAME] = 'ORC' WHERE [SDO_NAME] IS NULL
GO

ALTER TABLE [ORC_SCENARIO_DOC] ALTER COLUMN [SDO_NAME] VARCHAR(250) NOT NULL
GO

ALTER TABLE [ORC_SCENARIO_DOC] ADD CONSTRAINT [PK_SCENARIO_DOC] PRIMARY KEY ([SDO_SCENARIO], [SDO_NAME]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

-- Changeset /opt/liquibase/data/orchestra_4.5.2.0.xml::change-4.5.2.0-09::akn::(Checksum: 6:8da24220f9084030be61c658efb6f015)
DROP INDEX [ORC_EVT_LOCAL_VARIABLES].IDX_ORC_EVT_LOCAL_VAR_VALUE
GO

DROP INDEX [ORC_EVT_PROCESS_VARIABLES].IDX_ORC_EVT_PROCESS_VAR_VALUE
GO

-- Changeset /opt/liquibase/data/orchestra_4.5.2.0.xml::change-4.5.2.0-10::akn::(Checksum: 6:16ff7b8691b02e0a394237a58e6bca7e)
ALTER TABLE [ORC_EVT_PROCESS_VARIABLES] ALTER COLUMN [EVV_VALUE] VARCHAR(1024)
GO

ALTER TABLE [ORC_EVT_LOCAL_VARIABLES] ALTER COLUMN [EVV_VALUE] VARCHAR(1024)
GO

