-- *********************************************************************
-- Create Database Script
-- *********************************************************************
-- Change Log: /opt/liquibase/data/orchestra_4.4.3.0.xml
-- Ran at: 19.02.14 13:48
-- Liquibase version: UNKNOWN
-- *********************************************************************

-- Changeset /opt/liquibase/data/orchestra_4.4.3.0.xml::change-4.4.3.0-01::akn::(Checksum: 6:14097b82d84d4ae47fcc780c28385eeb)
ALTER TABLE [ORC_PROCESSINSTANCE_STATE] ADD [PRS_NODE] VARCHAR(255)
GO

-- Changeset /opt/liquibase/data/orchestra_4.4.3.0.xml::change-4.4.3.0-02::akn::(Checksum: 6:b2e0d402c9d2864f88eda792983dc3fe)
DECLARE @pkname nvarchar(255)
DECLARE @sql nvarchar(2048)
select @pkname=i.name from sysindexes i join sysobjects o ON i.id = o.id join sysobjects pk ON i.name = pk.name AND pk.parent_obj = i.id AND pk.xtype = 'PK' join sysindexkeys ik on i.id = ik.id AND i.indid = ik.indid join syscolumns c ON ik.id = c.id AND ik.colid = c.colid where o.name = 'ORC_MESSAGE_REFERERS_UNLOCK'
set @sql='alter table [ORC_MESSAGE_REFERERS_UNLOCK] drop constraint ' + @pkname
exec(@sql)
GO

CREATE INDEX IDX_ORC_MREFERERS_UNLOCK_1 ON [ORC_MESSAGE_REFERERS_UNLOCK]([MRE_REFERRER_ID], [MRE_REF_TYPE]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS = OFF)
GO

-- Changeset /opt/liquibase/data/orchestra_4.4.3.0.xml::change-4.4.3.0-03::akn::(Checksum: 6:818f8aaebec41d8a8afcf32b716acb69)
ALTER TABLE [ORC_PROCESS_OVERVIEW] DROP CONSTRAINT [PK_ORC_PROCESS_OVERVIEW]
GO

UPDATE [ORC_PROCESS_OVERVIEW] SET [POV_NODE] = '''ORC''' WHERE [POV_NODE] IS NULL
GO

ALTER TABLE [ORC_PROCESS_OVERVIEW] ALTER COLUMN [POV_NODE] VARCHAR(255) NOT NULL
GO

ALTER TABLE [ORC_PROCESS_OVERVIEW] ADD CONSTRAINT [PK_ORC_PROCESS_OVERVIEW] PRIMARY KEY ([POV_SCENARIO], [POV_NODE]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS = OFF)
GO

-- Changeset /opt/liquibase/data/orchestra_4.4.3.0.xml::change-4.4.3.0-04::akn::(Checksum: 6:e51e75536ab5654507026e2af0ee5b13)
ALTER TABLE [ORC_PROCESS_ARBORT] ADD [PRA_NODE] VARCHAR(255)
GO

CREATE INDEX IDX_ORC_PROC_ABORT_NODE ON [ORC_PROCESS_ARBORT]([PRA_NODE]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS = OFF)
GO

-- Changeset /opt/liquibase/data/orchestra_4.4.3.0.xml::change-4.4.3.0-05::akn::(Checksum: 6:8589fa6d94b40063219c3abbb5e54226)
CREATE INDEX IDX_ORC_PROCESS_STATE_3 ON [ORC_PROCESS_STATE]([PRS_NODE], [PRS_DELETED], [PRS_SCENARIO_ID], [PRS_STATE]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS = OFF)
GO

