-- *********************************************************************
-- Create Database Script
-- *********************************************************************
-- Change Log: /opt/liquibase/data/orchestra_4.4.2.0.xml
-- Ran at: 30.01.14 10:21
-- Liquibase version: UNKNOWN
-- *********************************************************************

-- Changeset /opt/liquibase/data/orchestra_4.4.2.0.xml::change-4.4.2.0-01::akn::(Checksum: 6:e4fd1f318b2681efd8205a63b23fb30b)
ALTER TABLE [ORC_PROCESS_OVERVIEW] ADD [POV_NODE] VARCHAR(255)
GO

ALTER TABLE [ORC_PROCESS_OVERVIEW] ADD [POV_STATE] INT
GO

-- Changeset /opt/liquibase/data/orchestra_4.4.2.0.xml::change-4.4.2.0-02::akn::(Checksum: 6:6db29ff5a13ebae3db9bade8c320927d)
CREATE INDEX IDX_ORC_PROCESS_STATE_1 ON [ORC_PROCESS_STATE]([PRS_SCENARIO_ID], [PRS_STATE])  WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

-- Changeset /opt/liquibase/data/orchestra_4.4.2.0.xml::change-4.4.2.0-03::akn::(Checksum: 6:9053c818098ff9b7cf3a3ad7bfe18f48)
CREATE INDEX IDX_LTA_PROC_BUS_ARCDATE ON [ORC_LTA_PROCESS_BUS_EVENT]([LPB_ARCHIVE_DATE])  WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

CREATE INDEX IDX_LTA_PROC_EXT_BSNS_ARCDATE ON [ORC_LTA_PROCESS_EXT_BSNS_KEYS]([PEK_ARCHIVE_DATE])  WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

