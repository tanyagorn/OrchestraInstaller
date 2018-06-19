-- *********************************************************************
-- Create Database Script
-- *********************************************************************
-- Change Log: /opt/liquibase/data/orchestra_4.5.5.0.xml
-- Ran at: 9/18/15 10:02 AM
-- Liquibase version: 2.0.5
-- *********************************************************************

-- Changeset /opt/liquibase/data/orchestra_4.5.5.0.xml::change-4.5.5.0-01::akn::(Checksum: 6:bf83333f917c007c61f1d71b2b50a98f)
ALTER TABLE [ORC_WORK_QUEUE] DROP CONSTRAINT [PK_WORK_QUEUE_ID]
GO

ALTER TABLE [ORC_WORK_QUEUE] ALTER COLUMN [ID] VARCHAR(50)
GO

UPDATE [ORC_WORK_QUEUE] SET [ID] = 'dummy' WHERE [ID] IS NULL
GO

ALTER TABLE [ORC_WORK_QUEUE] ALTER COLUMN [ID] VARCHAR(50) NOT NULL
GO

ALTER TABLE [ORC_WORK_QUEUE] ADD CONSTRAINT [PK_WORK_QUEUE_ID] PRIMARY KEY ([ID]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

-- Changeset /opt/liquibase/data/orchestra_4.5.5.0.xml::change-4.5.5.0-02::akn::(Checksum: 6:0ec36ae6c7ea8828823003cf68ea9f4a)
ALTER TABLE [ORC_TOPIC_QUEUE] DROP CONSTRAINT [PK_TOPIC_QUEUE_ID]
GO

ALTER TABLE [ORC_TOPIC_QUEUE] ALTER COLUMN [ID] VARCHAR(50)
GO

UPDATE [ORC_TOPIC_QUEUE] SET [ID] = 'dummy' WHERE [ID] IS NULL
GO

ALTER TABLE [ORC_TOPIC_QUEUE] ALTER COLUMN [ID] VARCHAR(50) NOT NULL
GO

ALTER TABLE [ORC_TOPIC_QUEUE] ADD CONSTRAINT [PK_TOPIC_QUEUE_ID] PRIMARY KEY ([ID]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

-- Changeset /opt/liquibase/data/orchestra_4.5.5.0.xml::change-4.5.5.0-03::akn::(Checksum: 6:edba1670f96eb2ca77b99e674075866a)
CREATE INDEX IDX_ORC_MESSAGE_LEASETIME ON [ORC_MESSAGE]([MES_LEASE_TIME]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

CREATE INDEX IDX_ORC_MESSAGE_LIST_LEASETIME ON [ORC_MESSAGE_LIST]([MLI_LEASE_TIME]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

CREATE INDEX IDX_ORC_MESSAGE_REF_DEL_HELP ON [ORC_MESSAGE_REFERERS]([MRE_REFERRER_ID], [MRE_REF_TYPE]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

CREATE INDEX IDX_ORC_MSG_REF_OBJECT ON [ORC_MESSAGE_REFERERS]([MRE_OBJECT_ID], [MRE_OBJECT_TYPE]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

CREATE INDEX IDX_ORC_MS_REF_UNLOCK_STATE ON [ORC_MESSAGE_REFERERS_UNLOCK]([MRE_FLAG]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

CREATE INDEX IDX_ORC_PROC_FIFO_SCHED_STATE ON [ORC_PROCESS_FIFO_SCHEDULE]([PFS_STATE]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

CREATE INDEX IDS_ORC_PI_STATE_MOD_NODE_P ON [ORC_PROCESSINSTANCE_STATE]([PRS_PROCESSMODELL], [PRS_NODE], [PRS_MODE], [PRS_ID]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

CREATE INDEX IDX_ORC_MESSAGE_TYPE_SCEN ON [ORC_MESSAGE_TYPE]([MTY_SCENARIO]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

CREATE INDEX IDX_ORC_PROC_RU_ST_PROC_NODE ON [ORC_PROCESS_RUNTIME_STATE]([PRS_PROCESS], [PRS_NODE_ID], [PRS_STATE]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

CREATE INDEX IDX_ORC_EVENT_SYS_DATE_TYPE ON [ORC_EVENT_SYSTEM]([EVT_DATE], [EVT_TYPE]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

CREATE INDEX IDX_ORC_PROCESS_STATE_4 ON [ORC_PROCESS_STATE]([PRS_STATE], [PRS_START_TIME], [PRS_END_TIME], [PRS_SCENARIO_ID], [PRS_DELETED]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

CREATE INDEX IDX_ORC_ALERT_NODEID ON [ORC_ALERT_DATA]([NODE_ID]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

CREATE INDEX IDX_ORC_SVC_DECL ON [ORC_SVC_DECLARATION]([SDC_SCENARIO]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

CREATE INDEX IDX_ORC_BTRANS_CREATE_TYPE ON [ORC_BUSINESS_TRANSACTION]([OBT_CREATED], [OBT_TYPE]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

CREATE INDEX IDX_ORC_PMODELLS_HIST_SCEN_VER ON [ORC_PROCESS_MODELLS_HIST]([PMO_SCENARIO], [PMO_VERSION]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

-- Changeset /opt/liquibase/data/orchestra_4.5.5.0.xml::change-4.5.5.0-05::akn::(Checksum: 6:5c88b764e1d5b4e814de1280500e6514)
CREATE INDEX IDS_ORC_LTA_MESSAGE_L_TIME ON [ORC_LTA_MESSAGE]([MES_LEASE_TIME]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

CREATE INDEX IDX_ORC_LTA_PROCESS_OVERVIEW ON [ORC_LTA_PROCESS_OVERVIEW]([LPO_SCENARIO_ID]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

CREATE INDEX IDX_ORC_LTA_PRO_STATE_AD_ST22 ON [ORC_LTA_PROCESS_STATE]([PRS_ARCHIVE_DATE], [PRS_SCENARIO_ID], [PRS_STATE], [PRS_PROCESS_ID]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

-- Changeset /opt/liquibase/data/orchestra_4.5.5.0.xml::change-4.5.5.0-06::akn::(Checksum: 6:a8592e0654e9bdb4a3d2369975d056fb)
ALTER TABLE [ORC_MESSAGE] ADD [MES_TOUCHED] INT NOT NULL CONSTRAINT DF_ORC_MESSAGE_MES_TOUCHED DEFAULT '0'
GO

ALTER TABLE [ORC_MESSAGE_LIST] ADD [MLI_TOUCHED] INT NOT NULL CONSTRAINT DF_ORC_MESSAGE_LIST_MLI_TOUCHED DEFAULT '0'
GO

-- Changeset /opt/liquibase/data/orchestra_4.5.5.0.xml::change-4.5.5.0-07::akn::(Checksum: 6:8198d5b63f1e06f50864f0746f8a6b4a)
UPDATE [ORC_MONITOR_TABLESETTINGS] SET [ORC_COLUMN_PATTERN] = 'y,y,y,y,n,y,y' WHERE ORC_TABLECLASS = 'AdapterTable'
GO

-- Changeset /opt/liquibase/data/orchestra_4.5.5.0.xml::change-4.5.5.0-09::akn::(Checksum: 6:aa88ed1bafa1971eadcd423309154c31)
UPDATE [ORC_PROCESS_FIFO_SCHEDULE] SET [PFS_ID] = 'dummy' WHERE [PFS_ID] IS NULL
GO

ALTER TABLE [ORC_PROCESS_FIFO_SCHEDULE] ALTER COLUMN [PFS_ID] VARCHAR(100) NOT NULL
GO

-- Changeset /opt/liquibase/data/orchestra_4.5.5.0.xml::change-4.5.5.0-10::akn::(Checksum: 6:f1299940e6b99cfb6efa9c87055e9be1)
CREATE TABLE [ORC_WORK_QUEUE_DEL_TOPIC] ([DTO_TOPIC] VARCHAR(256) NOT NULL, [DTO_DELETETOKEN] INT NOT NULL, [DTO_GLOBAL] INT NOT NULL, [DTO_NODEID] VARCHAR(32) NOT NULL, [DTO_IDENT] INT NOT NULL, [DTO_QUEUE_TYPE] VARCHAR(1) NOT NULL, CONSTRAINT [PK_ORC_WQ_DELTOPIC] PRIMARY KEY ([DTO_IDENT]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF))
GO

ALTER TABLE [ORC_WORK_QUEUE_DEL_TOPIC] SET (LOCK_ESCALATION = TABLE)
GO

CREATE INDEX IDX_ORC_WQ_DELTOPIC_LOOKUP ON [ORC_WORK_QUEUE_DEL_TOPIC]([DTO_NODEID], [DTO_QUEUE_TYPE], [DTO_GLOBAL], [DTO_TOPIC], [DTO_DELETETOKEN]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

CREATE TABLE [ORC_TOPIC_QUEUE_DEL_TOPIC] ([DTO_TOPIC] VARCHAR(256) NOT NULL, [DTO_DELETETOKEN] INT NOT NULL, [DTO_GLOBAL] INT NOT NULL, [DTO_NODEID] VARCHAR(32) NOT NULL, [DTO_IDENT] INT NOT NULL, [DTO_QUEUE_TYPE] VARCHAR(1) NOT NULL, CONSTRAINT [PK_ORC_TQ_DELTOPIC] PRIMARY KEY ([DTO_IDENT]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF))
GO

ALTER TABLE [ORC_TOPIC_QUEUE_DEL_TOPIC] SET (LOCK_ESCALATION = TABLE)
GO

CREATE INDEX IDX_ORC_TQ_DELTOPIC_LOOKUP ON [ORC_TOPIC_QUEUE_DEL_TOPIC]([DTO_NODEID], [DTO_QUEUE_TYPE], [DTO_GLOBAL], [DTO_TOPIC], [DTO_DELETETOKEN]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

ALTER TABLE [ORC_WORK_QUEUE] ADD [DELETETOKEN] INT
GO

ALTER TABLE [ORC_TOPIC_QUEUE] ADD [DELETETOKEN] INT
GO

-- Changeset /opt/liquibase/data/orchestra_4.5.5.0.xml::change-4.5.5.0-11::akn::(Checksum: 6:515066da9181652afdc0353c4a3f7b82)
INSERT INTO [ORC_SEC_ROLE_V2] ([OSR_SCENARIO], [OSR_IDENTIFIER], [OSR_DESC]) VALUES ('RUNTIME', 'RUNTIME:Recompute.LTA.Statistic', 'Recompute statistics of lta')
GO

INSERT INTO [ORC_SEC_ROLE_V2] ([OSR_SCENARIO], [OSR_IDENTIFIER], [OSR_DESC]) VALUES ('RUNTIME', 'RUNTIME:Recompute.Process.Overview', 'Recompute process overview')
GO

INSERT INTO [ORC_CLUSTER_LOCK] ([ORC_LOCK_NAME], [ORC_LOCK_SCENARIO]) VALUES ('LTA.ARCHIVE.IN.PROGESS', 'GLOBAL')
GO

-- Changeset /opt/liquibase/data/orchestra_4.5.5.0.xml::change-4.5.5.0-12::akn::(Checksum: 6:2a19992527621b2157231f21608ddb21)
CREATE TABLE [ORC_REST_SVC_PROVIDER] ([RSP_SCENARIO] VARCHAR(250), [RSP_NAME] VARCHAR(250), [RSP_DATA] VARBINARY(MAX), [RSP_DEPLOYED_AT] datetime, [RSP_UNIQUE_NAME] VARCHAR(250) NOT NULL, CONSTRAINT [PK_ORC_RSV_PROV] PRIMARY KEY ([RSP_UNIQUE_NAME]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF))
GO

ALTER TABLE [ORC_REST_SVC_PROVIDER] SET (LOCK_ESCALATION = TABLE)
GO

CREATE INDEX IDX_ORC_RSVP_SCENARIO ON [ORC_REST_SVC_PROVIDER]([RSP_SCENARIO]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

-- Changeset /opt/liquibase/data/orchestra_4.5.5.0.xml::change-4.5.5.0-13.1::akn::(Checksum: 6:3454e912d266116646eb7c873c743b70)
ALTER TABLE [ORC_ADAPTER_STATE] DROP CONSTRAINT [PK_ORC_ADAPTER_STATE]
GO

-- Changeset /opt/liquibase/data/orchestra_4.5.5.0.xml::change-4.5.5.0-13.2::akn::(Checksum: 6:2429b9bd6722eb7280fba1384fb794ec)
UPDATE [ORC_ADAPTER_STATE] SET [ADS_ADAPTER_ID] = 'dummy' WHERE [ADS_ADAPTER_ID] IS NULL
GO

ALTER TABLE [ORC_ADAPTER_STATE] ALTER COLUMN [ADS_ADAPTER_ID] VARCHAR(255) NOT NULL
GO

ALTER TABLE [ORC_ADAPTER_STATE] ADD CONSTRAINT [PK_ORC_ADAPT_STATE] PRIMARY KEY ([ADS_ADAPTER_ID]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

CREATE UNIQUE INDEX IDX_ORC_ADAPTER_STATE_NAME_ID ON [ORC_ADAPTER_STATE]([ADS_ADAPTER_NAME], [ADS_NODE_ID]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

-- Changeset /opt/liquibase/data/orchestra_4.5.5.0.xml::change-4.5.5.0-14::akn::(Checksum: 6:a92a0d50b9c9cb78547f5c27e28b609d)
DROP INDEX [ORC_PROCESS_FIFO_SCHEDULE].IDX_ORC_PROC_FIFO_SCHED_STATE
GO

DROP INDEX [ORC_PROCESS_FIFO_SCHEDULE].IDX_PROCESS_FIFO_SCHED_REF_ID
GO

CREATE NONCLUSTERED INDEX [IDX_PROCESS_FIFO_SCHED_REF_ID] ON [ORC_PROCESS_FIFO_SCHEDULE] ( [PFS_MODELL_REFERENCE] ASC, [PFS_ID] ASC )
		     INCLUDE ( [PFS_PROCESS_REFERENCE], [PFS_STATE], [PFS_TARGET_NODE]) WITH ( ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF)
GO

CREATE NONCLUSTERED INDEX [IDX_PROC_FIFO_DELETE] ON [ORC_PROCESS_FIFO_SCHEDULE] ( [PFS_ID] ASC ) WHERE ([PFS_STATE]='DELETED')
		     WITH ( ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF)
GO

-- Changeset /opt/liquibase/data/orchestra_4.5.5.0.xml::change-4.5.5.0-15::akn::(Checksum: 6:2d1c5d48f5486cad2e108e07bb6bfba0)
DROP INDEX [ORC_WORK_QUEUE].IDX_ORC_WORK_QUEUE_TOPIC_ID
GO

CREATE NONCLUSTERED INDEX [IDX_ORC_WORK_QUEUE_TOPIC_ID] ON [ORC_WORK_QUEUE] ( [ORC_TOPIC_ID] ASC, [QUEUE_TYPE] ASC )
		     INCLUDE ( [STATE], [TARGET_NODE], [DELETETOKEN]) WITH ( ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF)
GO

DROP INDEX [ORC_TOPIC_QUEUE].IDX_ORC_TOPIC_QUEUE_TOPIC_ID
GO

CREATE NONCLUSTERED INDEX [IDX_ORC_TOPIC_QUEUE_TOPIC_ID] ON [ORC_TOPIC_QUEUE] ( [ORC_TOPIC_ID] ASC, [QUEUE_TYPE] ASC )
		     INCLUDE ( [STATE], [TARGET_NODE], [DELETETOKEN]) WITH ( ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF )
GO

-- Changeset /opt/liquibase/data/orchestra_4.5.5.0.xml::change-4.5.5.0-16::akn::(Checksum: 6:b92c791e8a56cfa1168944ee12e55dbe)
ALTER TABLE [ORC_PROCESS_EXECUTION] ALTER COLUMN [ORC_MAX_DURATION] BIGINT
GO
