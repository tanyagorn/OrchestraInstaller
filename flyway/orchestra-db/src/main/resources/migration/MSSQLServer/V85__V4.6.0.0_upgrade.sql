-- *********************************************************************
-- Create Database Script
-- *********************************************************************
-- Change Log: /opt/liquibase/data/orchestra_4.6.0.0.xml
-- Ran at: 2/15/17 12:20 PM
-- Liquibase version: 2.0.5
-- *********************************************************************

-- Changeset /opt/liquibase/data/orchestra_4.6.0.0.xml::change-4.6.0.0-1::akn::(Checksum: 6:9a21f4927f535b7f3a6724a842954c38)
ALTER TABLE [ORC_USER_PWD_TABLE] ALTER COLUMN [OUP_PASSWORD] VARCHAR(512)
GO

-- Changeset /opt/liquibase/data/orchestra_4.6.0.0.xml::change-4.6.0.0-2::akn::(Checksum: 6:473f2b35f59d898bbaeefabd6351f39e)
ALTER TABLE [ORC_PROCESS_EXT_BUSINESS_KEYS] ALTER COLUMN [PEK_BUSINESS_KEY] VARCHAR(2000)
GO

-- Changeset /opt/liquibase/data/orchestra_4.6.0.0.xml::change-4.6.0.0-3-ScenarioGroupingPrerequisite::akn::(Checksum: 6:9789da32511f4b637f68dee908f98e57)
UPDATE [ORC_PROCESS_SCENARIO] SET [PSC_UNIQUE_NAME] = 'dummy' WHERE [PSC_UNIQUE_NAME] IS NULL
GO

ALTER TABLE [ORC_PROCESS_SCENARIO] ALTER COLUMN [PSC_UNIQUE_NAME] VARCHAR(255) NOT NULL
GO

ALTER TABLE [ORC_PROCESS_SCENARIO] ADD CONSTRAINT [PK_PROSCENARIO] PRIMARY KEY ([PSC_UNIQUE_NAME]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

-- Changeset /opt/liquibase/data/orchestra_4.6.0.0.xml::change-4.6.0.0-4-EnvironmentSettings::akn::(Checksum: 6:594259227232252403d1ef0bb2274116)
CREATE TABLE [ORC_ENVIRONMENT_SETTINGS] ([GROUP_NAME] VARCHAR(255) NOT NULL, [PARAMETER_NAME] VARCHAR(255) NOT NULL, [PARAMETER_VALUE] VARCHAR(1024), [LAST_UPDATED_AT] datetime CONSTRAINT DF_ORC_ENVIRONMENT_SETTINGS_LAST_UPDATED_AT DEFAULT GETDATE() NOT NULL, [ADDED_AT] datetime, [IS_RUNTIME_MODIFIABLE] INT, [IS_MODIFIABLE] INT, [NODE_ID] VARCHAR(10) NOT NULL, [VALUE_TYPE] VARCHAR(255) CONSTRAINT DF_ORC_ENVIRONMENT_SETTINGS_VALUE_TYPE DEFAULT 'STRING' NOT NULL)
GO

ALTER TABLE [ORC_ENVIRONMENT_SETTINGS] SET (LOCK_ESCALATION = TABLE)
GO

ALTER TABLE [ORC_ENVIRONMENT_SETTINGS] ADD CONSTRAINT [PK_ENVSETT] PRIMARY KEY ([GROUP_NAME], [PARAMETER_NAME], [NODE_ID]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

INSERT INTO [ORC_SEC_ROLE_V2] ([OSR_SCENARIO], [OSR_IDENTIFIER], [OSR_DESC]) VALUES ('RUNTIME', 'RUNTIME:EnvironmentSettings.Reader', 'Allows reading of environment settings in monitor')
GO

INSERT INTO [ORC_SEC_ROLE_V2] ([OSR_SCENARIO], [OSR_IDENTIFIER], [OSR_DESC]) VALUES ('RUNTIME', 'RUNTIME:EnvironmentSettings.Writer', 'Allows changing of environment settings from the monitor')
GO

INSERT INTO [ORC_SEC_USER_ROLES_V2] ([OUR_USER_ID], [OUR_ROLE_ID]) VALUES ('RUNTIME:admin', 'EnvironmentSettings.Reader')
GO

INSERT INTO [ORC_SEC_USER_ROLES_V2] ([OUR_USER_ID], [OUR_ROLE_ID]) VALUES ('RUNTIME:admin', 'EnvironmentSettings.Writer')
GO

INSERT INTO [ORC_SEC_USER_ROLES_V2] ([OUR_USER_ID], [OUR_ROLE_ID]) VALUES ('RUNTIME:Monitor', 'EnvironmentSettings.Reader')
GO

-- Changeset /opt/liquibase/data/orchestra_4.6.0.0.xml::change-4.6.0.0-5-WorkList::akn::(Checksum: 6:e99c71cf49ae3a606d3928181161c7ce)
CREATE TABLE [ORC_WORKLIST_TYPE] ([WLT_ID] VARCHAR(255) NOT NULL, [WLT_NAME] VARCHAR(255) NOT NULL, [WLT_DESCRIPTION] VARCHAR(512), [WLT_USER_STARTABLE] INT, [WLT_ACTIVATION_TYPE] VARCHAR(255) NOT NULL, [WLT_CAN_COMPLETE] INT, [WLT_CAN_START_PROCESS] INT, [WLT_GROUP_NAME] VARCHAR(255), [WLT_GROUP_ID] VARCHAR(255), [WLT_TYPE_IMAGE] VARBINARY(MAX))
GO

ALTER TABLE [ORC_WORKLIST_TYPE] SET (LOCK_ESCALATION = TABLE)
GO

ALTER TABLE [ORC_WORKLIST_TYPE] ADD CONSTRAINT [PK_WKLTYPE] PRIMARY KEY ([WLT_ID]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

CREATE TABLE [ORC_WORKLIST_ACTIVATION_HTTP] ([WAH_ID] VARCHAR(255) NOT NULL, [WAH_URL] VARCHAR(512) NOT NULL, [WAH_REQUEST_TYPE] INT NOT NULL)
GO

ALTER TABLE [ORC_WORKLIST_ACTIVATION_HTTP] SET (LOCK_ESCALATION = TABLE)
GO

ALTER TABLE [ORC_WORKLIST_ACTIVATION_HTTP] ADD CONSTRAINT [PK_WKLACTHTTP] PRIMARY KEY ([WAH_ID]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

ALTER TABLE [ORC_WORKLIST_ACTIVATION_HTTP] ADD CONSTRAINT [FK_WKLACTHTTP] FOREIGN KEY ([WAH_ID]) REFERENCES [ORC_WORKLIST_TYPE] ([WLT_ID])
GO

CREATE TABLE [ORC_WORKLIST_ACTIVATION_RES] ([WAR_ID] VARCHAR(255) NOT NULL, [WAR_MODEL_TYPE] VARCHAR(255), [WAR_RESOURCE_BUNDLE] VARCHAR(255), [WAR_ROOT_RESOURCE] VARCHAR(255), [WAR_FINISH_RESOURCE] VARCHAR(255))
GO

ALTER TABLE [ORC_WORKLIST_ACTIVATION_RES] SET (LOCK_ESCALATION = TABLE)
GO

ALTER TABLE [ORC_WORKLIST_ACTIVATION_RES] ADD CONSTRAINT [PK_WKLACTRESOURCE] PRIMARY KEY ([WAR_ID]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

ALTER TABLE [ORC_WORKLIST_ACTIVATION_RES] ADD CONSTRAINT [FK_WKLACTRESOURCE] FOREIGN KEY ([WAR_ID]) REFERENCES [ORC_WORKLIST_TYPE] ([WLT_ID])
GO

CREATE TABLE [ORC_WORKLIST_ACTIVATION_SIMPLE] ([WAS_ID] VARCHAR(255) NOT NULL, [WAS_CAPTION] VARCHAR(255), [WAS_INFO_TEXT] VARCHAR(512), [WAS_BUTTON1] VARCHAR(30), [WAS_BUTTON2] VARCHAR(30), [WAS_BUTTON3] VARCHAR(30))
GO

ALTER TABLE [ORC_WORKLIST_ACTIVATION_SIMPLE] SET (LOCK_ESCALATION = TABLE)
GO

ALTER TABLE [ORC_WORKLIST_ACTIVATION_SIMPLE] ADD CONSTRAINT [PK_WKLACTSIMPLE] PRIMARY KEY ([WAS_ID]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

ALTER TABLE [ORC_WORKLIST_ACTIVATION_SIMPLE] ADD CONSTRAINT [FK_WKLACTSIMPLE] FOREIGN KEY ([WAS_ID]) REFERENCES [ORC_WORKLIST_TYPE] ([WLT_ID])
GO

CREATE TABLE [ORC_WORKLIST_ESCALATION] ([WLE_ID] VARCHAR(255) NOT NULL, [WLE_EXPIRATION_TIME] INT NOT NULL, [WLE_TIME_UNIT] VARCHAR(30) NOT NULL, [WLE_DELEGATE] VARCHAR(255), [WLE_RECEIVER] VARCHAR(255), [WLE_TYPE] VARCHAR(30) NOT NULL)
GO

ALTER TABLE [ORC_WORKLIST_ESCALATION] SET (LOCK_ESCALATION = TABLE)
GO

ALTER TABLE [ORC_WORKLIST_ESCALATION] ADD CONSTRAINT [PK_WKLESCALATION] PRIMARY KEY ([WLE_ID]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

CREATE TABLE [ORC_WORKLIST_ITEM] ([WLI_ID] VARCHAR(255) NOT NULL, [WLI_NAME] VARCHAR(255) NOT NULL, [WLI_CREATION_DATE] datetime CONSTRAINT DF_ORC_WORKLIST_ITEM_WLI_CREATION_DATE DEFAULT GETDATE() NOT NULL, [WLI_DESCRIPTION] VARCHAR(512), [WLI_PRIORITY] INT, [WLI_TYPE_ID] VARCHAR(255) NOT NULL, [WLI_CREDENTIAL_NAME] VARCHAR(255) NOT NULL, [WLI_COMPLETION_LISTENER_INFO] VARBINARY(MAX), [WLI_NEXT_ESCALATION] BIGINT, [WLI_STATE] VARCHAR(255) NOT NULL, [WLI_NUM_RETRIES] INT CONSTRAINT DF_ORC_WORKLIST_ITEM_WLI_NUM_RETRIES DEFAULT 0, [WLI_NEXT_RETRY] BIGINT, [WLI_FAILURE_CAUSE] VARBINARY(MAX), [WLI_ERROR_DESCRIPTION] VARCHAR(255), [WLI_RESULTCODE] INT, [WLI_RESULT_LABEL] VARCHAR(255))
GO

ALTER TABLE [ORC_WORKLIST_ITEM] SET (LOCK_ESCALATION = TABLE)
GO

ALTER TABLE [ORC_WORKLIST_ITEM] ADD CONSTRAINT [PK_WKLITEM] PRIMARY KEY ([WLI_ID]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

ALTER TABLE [ORC_WORKLIST_ITEM] ADD CONSTRAINT [FK_WKLITEM] FOREIGN KEY ([WLI_TYPE_ID]) REFERENCES [ORC_WORKLIST_TYPE] ([WLT_ID])
GO

CREATE TABLE [ORC_WORKLIST_PARAMETER_DECL] ([WPD_ID] VARCHAR(255) NOT NULL, [WPD_NAME] VARCHAR(512) NOT NULL, [WPD_DESCRIPTION] VARCHAR(255), [WPD_DIRECTION] INT, [WPD_PARAMETER_TYPE] VARCHAR(255) NOT NULL, [WPD_TYPE_ID] VARCHAR(255) NOT NULL)
GO

ALTER TABLE [ORC_WORKLIST_PARAMETER_DECL] SET (LOCK_ESCALATION = TABLE)
GO

ALTER TABLE [ORC_WORKLIST_PARAMETER_DECL] ADD CONSTRAINT [PK_WKLPARMDECL] PRIMARY KEY ([WPD_ID]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

ALTER TABLE [ORC_WORKLIST_PARAMETER_DECL] ADD CONSTRAINT [FK_WKLPARMDECL] FOREIGN KEY ([WPD_TYPE_ID]) REFERENCES [ORC_WORKLIST_TYPE] ([WLT_ID])
GO

CREATE TABLE [ORC_WORKLIST_PARAMETER_INST] ([WPI_ID] VARCHAR(255) NOT NULL, [WPI_VALUE] VARCHAR(255), [WPI_ITEM_ID] VARCHAR(255) NOT NULL, [WPI_DECLARATION_ID] VARCHAR(255) NOT NULL)
GO

ALTER TABLE [ORC_WORKLIST_PARAMETER_INST] SET (LOCK_ESCALATION = TABLE)
GO

ALTER TABLE [ORC_WORKLIST_PARAMETER_INST] ADD CONSTRAINT [PK_WKLPARMINST] PRIMARY KEY ([WPI_ID]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

ALTER TABLE [ORC_WORKLIST_PARAMETER_INST] ADD CONSTRAINT [FK_WKLPARMINST1] FOREIGN KEY ([WPI_ITEM_ID]) REFERENCES [ORC_WORKLIST_ITEM] ([WLI_ID])
GO

ALTER TABLE [ORC_WORKLIST_PARAMETER_INST] ADD CONSTRAINT [FK_WKLPARMINST2] FOREIGN KEY ([WPI_DECLARATION_ID]) REFERENCES [ORC_WORKLIST_PARAMETER_DECL] ([WPD_ID])
GO

CREATE TABLE [ORC_WORKLIST_PERMISSION] ([WLP_ID] VARCHAR(255) NOT NULL, [WLP_MODE] INT NOT NULL, [WLP_CREDENTIAL_NAME] VARCHAR(255) NOT NULL, [WLP_WORKLIST_TYPE_ID] VARCHAR(255) NOT NULL)
GO

ALTER TABLE [ORC_WORKLIST_PERMISSION] SET (LOCK_ESCALATION = TABLE)
GO

ALTER TABLE [ORC_WORKLIST_PERMISSION] ADD CONSTRAINT [PK_WKLPERM] PRIMARY KEY ([WLP_ID]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

CREATE TABLE [ORC_WORKLIST_RESOURCE_BUNDLE] ([WRB_ID] VARCHAR(255) NOT NULL, [WRB_DESCRIPTION] VARCHAR(255))
GO

ALTER TABLE [ORC_WORKLIST_RESOURCE_BUNDLE] SET (LOCK_ESCALATION = TABLE)
GO

ALTER TABLE [ORC_WORKLIST_RESOURCE_BUNDLE] ADD CONSTRAINT [PK_WKLRESBUND] PRIMARY KEY ([WRB_ID]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

CREATE TABLE [ORC_WORKLIST_RESOURCE] ([WLR_NAME] VARCHAR(255) NOT NULL, [WLR_CONTENT_TYPE] VARCHAR(255), [WLR_CONTENT] VARBINARY(MAX), [WLR_RESOURCE_BUNDLE] VARCHAR(255) NOT NULL)
GO

ALTER TABLE [ORC_WORKLIST_RESOURCE] SET (LOCK_ESCALATION = TABLE)
GO

ALTER TABLE [ORC_WORKLIST_RESOURCE] ADD CONSTRAINT [PK_WKLRES] PRIMARY KEY ([WLR_NAME], [WLR_RESOURCE_BUNDLE]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

ALTER TABLE [ORC_WORKLIST_RESOURCE] ADD CONSTRAINT [FK_WKLRES] FOREIGN KEY ([WLR_RESOURCE_BUNDLE]) REFERENCES [ORC_WORKLIST_RESOURCE_BUNDLE] ([WRB_ID])
GO

CREATE TABLE [ORC_WORKLIST_TYPE_ESCALATION] ([WTE_TYPE_ID] VARCHAR(255) CONSTRAINT DF_ORC_WORKLIST_TYPE_ESCALATION_WTE_TYPE_ID DEFAULT '' NOT NULL, [WTE_ESCALATION_ID] VARCHAR(255) CONSTRAINT DF_ORC_WORKLIST_TYPE_ESCALATION_WTE_ESCALATION_ID DEFAULT '' NOT NULL)
GO

ALTER TABLE [ORC_WORKLIST_TYPE_ESCALATION] SET (LOCK_ESCALATION = TABLE)
GO

ALTER TABLE [ORC_WORKLIST_TYPE_ESCALATION] ADD CONSTRAINT [PK_WKLTYPESC] PRIMARY KEY ([WTE_TYPE_ID], [WTE_ESCALATION_ID]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

ALTER TABLE [ORC_WORKLIST_TYPE_ESCALATION] ADD CONSTRAINT [FK_WKLTYPESC1] FOREIGN KEY ([WTE_ESCALATION_ID]) REFERENCES [ORC_WORKLIST_ESCALATION] ([WLE_ID])
GO

ALTER TABLE [ORC_WORKLIST_TYPE_ESCALATION] ADD CONSTRAINT [FK_WKLTYPESC2] FOREIGN KEY ([WTE_TYPE_ID]) REFERENCES [ORC_WORKLIST_TYPE] ([WLT_ID])
GO

-- Changeset /opt/liquibase/data/orchestra_4.6.0.0.xml::change-4.6.0.0-6-HumanInteraction::akn::(Checksum: 6:ca8eb0b5688dd06aa4b7a815364e6755)
CREATE TABLE [ORC_HUMAN_INTERACTION] ([HIN_SCENARIO] VARCHAR(255), [HIN_NAME] VARCHAR(255), [HIN_DATA] VARBINARY(MAX), [HIN_DEPLOYED_AT] datetime, [HIN_UNIQUE_NAME] VARCHAR(255) NOT NULL)
GO

ALTER TABLE [ORC_HUMAN_INTERACTION] SET (LOCK_ESCALATION = TABLE)
GO

ALTER TABLE [ORC_HUMAN_INTERACTION] ADD CONSTRAINT [PK_HUMANINTERACT] PRIMARY KEY ([HIN_UNIQUE_NAME]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

CREATE UNIQUE INDEX IDX_HUINT_NAM_SCEN ON [ORC_HUMAN_INTERACTION]([HIN_NAME], [HIN_SCENARIO]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

CREATE INDEX IDX_HUINT_SCEN ON [ORC_HUMAN_INTERACTION]([HIN_SCENARIO]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

-- Changeset /opt/liquibase/data/orchestra_4.6.0.0.xml::change-4.6.0.0-7-Filtering::akn::(Checksum: 6:3eaf25a28a69b775b17fd82f032f6bcb)
CREATE TABLE [ORC_FILTERSETTINGS] ([ORC_FILTERID] INT NOT NULL, [ORC_FNAME] VARCHAR(255), [ORC_ISCURRENT] INT, [ORC_PARENT_USERID] VARCHAR(255), [ORC_TABLECLASS] VARCHAR(255))
GO

ALTER TABLE [ORC_FILTERSETTINGS] SET (LOCK_ESCALATION = TABLE)
GO

ALTER TABLE [ORC_FILTERSETTINGS] ADD CONSTRAINT [PK_FILTERSETTING] PRIMARY KEY ([ORC_FILTERID]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

ALTER TABLE [ORC_FILTERSETTINGS] ADD CONSTRAINT [FK_FILTERSETTING] FOREIGN KEY ([ORC_PARENT_USERID], [ORC_TABLECLASS]) REFERENCES [ORC_MONITOR_TABLESETTINGS] ([ORC_PARENT_USERID], [ORC_TABLECLASS])
GO

CREATE TABLE [ORC_FILTEREXPRESSIONS] ([ORC_EXPRESSION_ID] INT NOT NULL, [ORC_FCONDITION] VARCHAR(255), [ORC_FVALUE] VARCHAR(255), [ORC_TABLECOLUMN] VARCHAR(255), [ORC_FILTERID] INT)
GO

ALTER TABLE [ORC_FILTEREXPRESSIONS] SET (LOCK_ESCALATION = TABLE)
GO

ALTER TABLE [ORC_FILTEREXPRESSIONS] ADD CONSTRAINT [PK_FILTEREXPRESS] PRIMARY KEY ([ORC_EXPRESSION_ID]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

ALTER TABLE [ORC_FILTEREXPRESSIONS] ADD CONSTRAINT [FK_FILTEREXPRESS] FOREIGN KEY ([ORC_FILTERID]) REFERENCES [ORC_FILTERSETTINGS] ([ORC_FILTERID])
GO

CREATE TABLE [ORC_USERFILTER] ([ORC_FILTERID] INT NOT NULL, [ORC_PARENT_USERID] VARCHAR(255) NOT NULL, [ORC_TABLECLASS] VARCHAR(255) NOT NULL)
GO

ALTER TABLE [ORC_USERFILTER] SET (LOCK_ESCALATION = TABLE)
GO

ALTER TABLE [ORC_USERFILTER] ADD CONSTRAINT [PK_USERFILTER] PRIMARY KEY ([ORC_FILTERID], [ORC_PARENT_USERID], [ORC_TABLECLASS]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

ALTER TABLE [ORC_USERFILTER] ADD CONSTRAINT [FK_USERFILTER1] FOREIGN KEY ([ORC_FILTERID]) REFERENCES [ORC_FILTERSETTINGS] ([ORC_FILTERID])
GO

ALTER TABLE [ORC_USERFILTER] ADD CONSTRAINT [FK_USERFILTER2] FOREIGN KEY ([ORC_PARENT_USERID], [ORC_TABLECLASS]) REFERENCES [ORC_MONITOR_TABLESETTINGS] ([ORC_PARENT_USERID], [ORC_TABLECLASS])
GO

-- Changeset /opt/liquibase/data/orchestra_4.6.0.0.xml::change-4.6.0.0-8-ScenarioGrouping::akn::(Checksum: 6:6d3eb1a49edf3776d25621d69ce3e3cf)
CREATE TABLE [ORC_SCENARIOGROUPS] ([GROUP_ID] INT NOT NULL, [GROUP_NAME] VARCHAR(255) NOT NULL)
GO

ALTER TABLE [ORC_SCENARIOGROUPS] SET (LOCK_ESCALATION = TABLE)
GO

ALTER TABLE [ORC_SCENARIOGROUPS] ADD CONSTRAINT [PK_SCENARIOGROUPS] PRIMARY KEY ([GROUP_ID]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

CREATE TABLE [ORC_SCENARIO_GROUP_RELATION] ([GROUP_ID] INT NOT NULL, [SCENARIO_ID] VARCHAR(255) NOT NULL)
GO

ALTER TABLE [ORC_SCENARIO_GROUP_RELATION] SET (LOCK_ESCALATION = TABLE)
GO

ALTER TABLE [ORC_SCENARIO_GROUP_RELATION] ADD CONSTRAINT [PK_SCENGROUPREL] PRIMARY KEY ([GROUP_ID], [SCENARIO_ID]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

ALTER TABLE [ORC_SCENARIO_GROUP_RELATION] ADD CONSTRAINT [FK_SCENGROUPREL1] FOREIGN KEY ([GROUP_ID]) REFERENCES [ORC_SCENARIOGROUPS] ([GROUP_ID])
GO

ALTER TABLE [ORC_SCENARIO_GROUP_RELATION] ADD CONSTRAINT [FK_SCENGROUPREL2] FOREIGN KEY ([SCENARIO_ID]) REFERENCES [ORC_PROCESS_SCENARIO] ([PSC_UNIQUE_NAME])
GO

UPDATE [ORC_MONITOR_TABLESETTINGS] SET [ORC_COLUMN_PATTERN] = 'y,n,n,y,y,y,y,y,y,n,y' WHERE ORC_TABLECLASS = 'ScenarioTable'
GO

UPDATE [ORC_MONITOR_TABLESETTINGS] SET [ORC_COLUMN_PATTERN] = 'y,y,n,y,n,y,y,y,y,y,n' WHERE ORC_TABLECLASS = 'ProcessOverviewTable'
GO

-- Changeset /opt/liquibase/data/orchestra_4.6.0.0.xml::change-4.6.0.0-9-ProcessGrouping::akn::(Checksum: 6:ee3d5e5b0741da3b1d8459dbd1888c75)
CREATE TABLE [ORC_PROCESS_FIFO_SCHEDULE_GRP] ([PFS_ID] VARCHAR(100) NOT NULL, [PFS_SCENARIO] VARCHAR(255) NOT NULL, [PFS_MODELL_REFERENCE] VARCHAR(255) NOT NULL, [PFS_PROCESS_REFERENCE] VARCHAR(255) NOT NULL, [PFS_TOKEN_REFERENCE] VARCHAR(255) NOT NULL, [PFS_VARIABLES] VARBINARY(MAX), [PFS_TARGET_NODE] VARCHAR(255), [PFS_STATE] VARCHAR(10), [PFS_OWNER_NODE] VARCHAR(255), [PFS_PROCESS_GROUP] VARCHAR(255) NOT NULL)
GO

ALTER TABLE [ORC_PROCESS_FIFO_SCHEDULE_GRP] SET (LOCK_ESCALATION = TABLE)
GO

ALTER TABLE [ORC_PROCESS_FIFO_SCHEDULE_GRP] ADD CONSTRAINT [PK_PROFIFSCHEDGRP] PRIMARY KEY ([PFS_PROCESS_REFERENCE]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

CREATE INDEX IDS_PROC_FIFO_GRP_DELETE ON [ORC_PROCESS_FIFO_SCHEDULE_GRP]([PFS_STATE]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

CREATE TABLE [ORC_PROCESS_FIFO_SCHED_GRP_CAC] ([PFS_ID] VARCHAR(100) NOT NULL, [PFS_SCENARIO] VARCHAR(255) NOT NULL, [PFS_MODELL_REFERENCE] VARCHAR(255) NOT NULL, [PFS_PROCESS_REFERENCE] VARCHAR(255) NOT NULL, [PFS_TOKEN_REFERENCE] VARCHAR(255) NOT NULL, [PFS_VARIABLES] VARBINARY(MAX), [PFS_TARGET_NODE] VARCHAR(255), [PFS_STATE] VARCHAR(10), [PFS_OWNER_NODE] VARCHAR(255), [PFS_PROCESS_GROUP] VARCHAR(255) NOT NULL)
GO

ALTER TABLE [ORC_PROCESS_FIFO_SCHED_GRP_CAC] SET (LOCK_ESCALATION = TABLE)
GO

ALTER TABLE [ORC_PROCESS_FIFO_SCHED_GRP_CAC] ADD CONSTRAINT [PK_PROFIFSCHEDGRPC] PRIMARY KEY ([PFS_PROCESS_REFERENCE]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

CREATE INDEX IDS_PROC_FIFO_GRP_C_DELETE ON [ORC_PROCESS_FIFO_SCHED_GRP_CAC]([PFS_STATE]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

-- Changeset /opt/liquibase/data/orchestra_4.6.0.0.xml::change-4.6.0.0-9_1-ProcessGrouping::akn::(Checksum: 6:9b7d547235d7475b07dc526918feba0e)
ALTER TABLE ORC_PROCESS_FIFO_SCHEDULE_GRP ADD PFS_LOGICAL_ORDER BIGINT IDENTITY(1, 1) NOT NULL
GO

CREATE UNIQUE INDEX IDX_PROC_FIFO_GRP_KEY_AUTO ON [ORC_PROCESS_FIFO_SCHEDULE_GRP]([PFS_LOGICAL_ORDER]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

ALTER TABLE ORC_PROCESS_FIFO_SCHED_GRP_CAC ADD PFS_LOGICAL_ORDER BIGINT IDENTITY(1, 1) NOT NULL
GO

CREATE UNIQUE INDEX IDX_PROC_FIFO_GRP_C_KEY_AUTO ON [ORC_PROCESS_FIFO_SCHED_GRP_CAC]([PFS_LOGICAL_ORDER]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

-- Changeset /opt/liquibase/data/orchestra_4.6.0.0.xml::change-4.6.0.0-9_2-ProcessGrouping::akn::(Checksum: 6:a618e00bbc04e405760d9ce988d4ded0)
CREATE NONCLUSTERED INDEX [IDX_ORC_PROC_FIFO_GRP_MIN_ID] ON [ORC_PROCESS_FIFO_SCHEDULE_GRP] ( [PFS_MODELL_REFERENCE] ASC, [PFS_PROCESS_GROUP] ASC, [PFS_TARGET_NODE] ASC, [PFS_ID] ASC, [PFS_LOGICAL_ORDER] ASC, [PFS_STATE] ASC )
		     INCLUDE ( [PFS_PROCESS_REFERENCE] ) WITH ( ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF)
GO

CREATE NONCLUSTERED INDEX [IDX_ORC_PROC_FIFO_GRP_C_MIN_ID] ON [ORC_PROCESS_FIFO_SCHED_GRP_CAC] ( [PFS_MODELL_REFERENCE] ASC, [PFS_PROCESS_GROUP] ASC, [PFS_TARGET_NODE] ASC, [PFS_ID] ASC, [PFS_LOGICAL_ORDER] ASC, [PFS_STATE] ASC )
		     INCLUDE ( [PFS_PROCESS_REFERENCE] ) WITH ( ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF)
GO

-- Changeset /opt/liquibase/data/orchestra_4.6.0.0.xml::change-4.6.0.0-9_3-ProcessGrouping::akn::(Checksum: 6:15c2d7fd9e1e05c71ffe80adc9f31200)
ALTER TABLE [ORC_PROCESS_RUNTIME_STATE] ADD [PRS_PROCESS_GROUP] VARCHAR(255)
GO

UPDATE [ORC_PROCESS_RUNTIME_STATE] SET [PRS_PROCESS_GROUP] = '0'
GO

-- Changeset /opt/liquibase/data/orchestra_4.6.0.0.xml::change-4.6.0.0-10-FullSnapShot_Deployment::akn::(Checksum: 6:591eaf50aa69cd740addd040e83abd7a)
CREATE TABLE [ORC_DEPLOYMENT_LIFECYCLE_JOB] ([DLJ_IDENT] VARCHAR(50) NOT NULL, [DLJ_SCENARIO] VARCHAR(255) NOT NULL, [DLJ_TYPE] VARCHAR(255) NOT NULL, [DLJ_PROCESSMODELL] VARCHAR(255), [DLJ_SNAPSHOT] INT, [DLJ_EXT_COL1] VARCHAR(255), [DLJ_EXT_COL2] VARCHAR(255), [DLJ_NODE] VARCHAR(255), [DLJ_IS_POSTPONED] INT)
GO

ALTER TABLE [ORC_DEPLOYMENT_LIFECYCLE_JOB] SET (LOCK_ESCALATION = TABLE)
GO

ALTER TABLE [ORC_DEPLOYMENT_LIFECYCLE_JOB] ADD CONSTRAINT [PK_DEPLOYLIFEJOB] PRIMARY KEY ([DLJ_IDENT]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

CREATE INDEX IDX_ORC_DEPL_LCYC_JOB ON [ORC_DEPLOYMENT_LIFECYCLE_JOB]([DLJ_NODE], [DLJ_IS_POSTPONED], [DLJ_IDENT]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

CREATE TABLE [ORC_SNAPSHOT_DELETION] ([SDE_TABLE_NAME] VARCHAR(255), [SDE_SNAPSHOT_TOKEN] BIGINT, [SDE_SNAPSHOT_KEY] VARCHAR(255), [SDE_NODE_ID] VARCHAR(255))
GO

ALTER TABLE [ORC_SNAPSHOT_DELETION] SET (LOCK_ESCALATION = TABLE)
GO

CREATE INDEX IDX_ORC_SNAP_DELETE ON [ORC_SNAPSHOT_DELETION]([SDE_TABLE_NAME], [SDE_SNAPSHOT_TOKEN], [SDE_SNAPSHOT_KEY], [SDE_NODE_ID]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

ALTER TABLE [ORC_EVENT_PROCESS_TOKEN] ADD [EVT_IS_FULLSNAPSHOT] INT
GO

UPDATE [ORC_EVENT_PROCESS_TOKEN] SET [EVT_IS_FULLSNAPSHOT] = 0
GO

ALTER TABLE [ORC_PROCESS_ARBORT] ADD [PRA_STARTUP_COUNT] INT
GO

ALTER TABLE [ORC_PROCESS_ARBORT] ADD [PRA_DELETE_SNAPSHOT] INT
GO

UPDATE [ORC_PROCESS_ARBORT] SET [PRA_DELETE_SNAPSHOT] = 0, [PRA_STARTUP_COUNT] = 0
GO

ALTER TABLE [ORC_PROCESS_STATE] ADD [PRS_UNLOCK_PENDING] INT
GO

ALTER TABLE [ORC_PROCESS_STATE] ADD [PRS_UPDATE_VERSION] INT
GO

UPDATE [ORC_PROCESS_STATE] SET [PRS_UNLOCK_PENDING] = 1, [PRS_UPDATE_VERSION] = 0
GO

UPDATE [ORC_PROCESS_STATE] SET [PRS_UNLOCK_PENDING] = 0 WHERE PRS_STATE = 3 or PRS_STATE = 9
GO

ALTER TABLE [ORC_PROCESSINSTANCE_STATE] ADD [PRS_SNAPSHOT_TOKEN] INT
GO

ALTER TABLE [ORC_PROCESSINSTANCE_STATE] ADD [PRS_HAS_CALLBACK] INT
GO

UPDATE [ORC_PROCESSINSTANCE_STATE] SET [PRS_HAS_CALLBACK] = 1, [PRS_SNAPSHOT_TOKEN] = 0
GO

-- Changeset /opt/liquibase/data/orchestra_4.6.0.0.xml::change-4.6.0.0-11-HealthCheck::akn::(Checksum: 6:0e3891ea8213f85f45a8203e19d69fbc)
CREATE TABLE [ORC_HEALTHCHECK] ([HC_ID] INT NOT NULL, [NAME] VARCHAR(40), [CONTENT] VARBINARY(MAX), [ENABLED] BIT)
GO

ALTER TABLE [ORC_HEALTHCHECK] SET (LOCK_ESCALATION = TABLE)
GO

ALTER TABLE [ORC_HEALTHCHECK] ADD CONSTRAINT [PK_HEALTHCHECK] PRIMARY KEY ([HC_ID]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

CREATE TABLE [ORC_HC_RESULTLIST] ([HC_ID] INT NOT NULL, [EX_ID] INT NOT NULL, [STARTTIME] datetime, [ENDTIME] datetime, [RESULT] VARBINARY(MAX))
GO

ALTER TABLE [ORC_HC_RESULTLIST] SET (LOCK_ESCALATION = TABLE)
GO

ALTER TABLE [ORC_HC_RESULTLIST] ADD CONSTRAINT [PK_HCRESULTLIST] PRIMARY KEY ([HC_ID], [EX_ID]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

ALTER TABLE [ORC_HC_RESULTLIST] ADD CONSTRAINT [FK_HCRESULTLIST] FOREIGN KEY ([HC_ID]) REFERENCES [ORC_HEALTHCHECK] ([HC_ID])
GO

INSERT INTO [ORC_SEC_ROLE_V2] ([OSR_SCENARIO], [OSR_IDENTIFIER], [OSR_DESC]) VALUES ('RUNTIME', 'RUNTIME:HealthCheckUser', 'Is just allowed to execute the HealthCheck')
GO

INSERT INTO [ORC_SEC_ROLE_V2] ([OSR_SCENARIO], [OSR_IDENTIFIER], [OSR_DESC]) VALUES ('RUNTIME', 'RUNTIME:HealthCheckAdmin', 'Is allowed to edit the HealthCheck')
GO

INSERT INTO [ORC_SEC_USER_ROLES_V2] ([OUR_USER_ID], [OUR_ROLE_ID]) VALUES ('RUNTIME:admin', 'HealthCheckAdmin')
GO

INSERT INTO [ORC_SEC_USER_ROLES_V2] ([OUR_USER_ID], [OUR_ROLE_ID]) VALUES ('RUNTIME:admin', 'HealthCheckUser')
GO

INSERT INTO [ORC_SEC_USER_ROLES_V2] ([OUR_USER_ID], [OUR_ROLE_ID]) VALUES ('RUNTIME:Monitor', 'HealthCheckUser')
GO

INSERT INTO [ORC_MONITOR_TABLESETTINGS] ([ORC_PARENT_USERID], [ORC_TABLECLASS], [ORC_AUTOREFRESH], [ORC_MAXELEMENTS], [ORC_REFRESHINTERVAL], [ORC_DEFAULT_SORT_COLUMN], [ORC_DEFAULT_SORT_ASCENDING], [ORC_COLUMN_PATTERN]) VALUES ('RUNTIME:Admin', 'HealthCheckTable', 0, 30, 20000, 2, 1, 'y,y,y,y,y,y')
GO

INSERT INTO [ORC_MONITOR_TABLESETTINGS] ([ORC_PARENT_USERID], [ORC_TABLECLASS], [ORC_AUTOREFRESH], [ORC_MAXELEMENTS], [ORC_REFRESHINTERVAL], [ORC_DEFAULT_SORT_COLUMN], [ORC_DEFAULT_SORT_ASCENDING], [ORC_COLUMN_PATTERN]) VALUES ('RUNTIME:Admin', 'CheckHistory', 1, 20, 20000, 2, 1, 'y,y,y,y')
GO

INSERT INTO [ORC_MONITOR_TABLESETTINGS] ([ORC_PARENT_USERID], [ORC_TABLECLASS], [ORC_AUTOREFRESH], [ORC_MAXELEMENTS], [ORC_REFRESHINTERVAL], [ORC_DEFAULT_SORT_COLUMN], [ORC_DEFAULT_SORT_ASCENDING], [ORC_COLUMN_PATTERN]) VALUES ('RUNTIME:Admin', 'HcExecutionHistory', 1, 20, 20000, 0, 1, 'y,y,y,y,y')
GO

-- Changeset /opt/liquibase/data/orchestra_4.6.0.0.xml::change-4.6.0.0-12-MonitorWidgets::akn::(Checksum: 6:79ddcbd585ce94fb495d54cb871c39c6)
CREATE TABLE [ORC_MONITOR_WIDGET_SETTINGS] ([ORC_PARENT_USERID] VARCHAR(255) NOT NULL, [ORC_WIDGETCLASS] VARCHAR(255) NOT NULL, [ORC_COORDINATE_X] DECIMAL, [ORC_COORDINATE_Y] DECIMAL)
GO

ALTER TABLE [ORC_MONITOR_WIDGET_SETTINGS] SET (LOCK_ESCALATION = TABLE)
GO

ALTER TABLE [ORC_MONITOR_WIDGET_SETTINGS] ADD CONSTRAINT [PK_MONWIDGETSET] PRIMARY KEY ([ORC_PARENT_USERID], [ORC_WIDGETCLASS]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

-- Changeset /opt/liquibase/data/orchestra_4.6.0.0.xml::change-4.6.0.0-13-TopicQueue::akn::(Checksum: 6:7b2c994e32bcd9aaed107c81b3d01bb6)
DROP INDEX [ORC_TOPIC_QUEUE].IDX_TOPIC_QUEUE_S_T_Q_N
GO

CREATE INDEX IDX_TOPIC_QUEUE_S_T_Q_N ON [ORC_TOPIC_QUEUE]([STATE], [ORC_TOPIC_ID], [TARGET_NODE], [QUEUE_TYPE], [NEXT_SCHEDULE_TIME]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

-- Changeset /opt/liquibase/data/orchestra_4.6.0.0.xml::change-4.6.0.0-14-LDAP::akn::(Checksum: 6:c6e424ad4bcc9697cdd84878f2b5ae35)
ALTER TABLE [ORC_USER_PWD_TABLE] ADD [OUP_USE_LDAP] INT NOT NULL CONSTRAINT DF_ORC_USER_PWD_TABLE_OUP_USE_LDAP DEFAULT 0
GO

ALTER TABLE [ORC_USER_PWD_TABLE] ALTER COLUMN [OUP_PASSWORD] VARCHAR(255) NULL
GO

-- Changeset /opt/liquibase/data/orchestra_4.6.0.0.xml::change-4.6.0.0-15-ProcessRuntime::akn::(Checksum: 6:5b089503f185cf8d16d1b4b0f21f63be)
ALTER TABLE [ORC_PROCESS_RUNTIME_STATE] ADD [PRS_REVISION] BIGINT
GO

-- Changeset /opt/liquibase/data/orchestra_4.6.0.0.xml::change-4.6.0.0-16-WorkList_2::akn::(Checksum: 6:2545d82e5028543c644bd6a95e4b64f8)
CREATE TABLE [ORC_WORKLIST_USER_SETTING] ([WUS_USERID] VARCHAR(64) NOT NULL, [WUS_TABLENAME] VARCHAR(64) NOT NULL, [WUS_SETTING] VARCHAR(255))
GO

ALTER TABLE [ORC_WORKLIST_USER_SETTING] SET (LOCK_ESCALATION = TABLE)
GO

ALTER TABLE [ORC_WORKLIST_USER_SETTING] ADD CONSTRAINT [PK_WKLUSERSETT] PRIMARY KEY ([WUS_USERID], [WUS_TABLENAME]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

-- Changeset /opt/liquibase/data/orchestra_4.6.0.0.xml::change-4.6.0.0-17-VIEW::akn::(Checksum: 6:073c2b2b7d2339b74e4b6b1b4619a51b)
DROP VIEW [ORC_PROCESS_STATE_MONITOR_V]
GO

CREATE VIEW [ORC_PROCESS_STATE_MONITOR_V] AS SELECT PRS_PROCESS_ID, PRS_MODELL_ID, PRS_START_TIME, PRS_END_TIME, PRS_STATE, PRS_BUSINESS_KEY, PRS_SCENARIO_ID, PRS_ROOT_TOKEN, PRS_PROCESS_MODEL, PRS_VERSION_TAG, PRS_CREATE_TIME, PRS_NODE,datediff(ss,PRS_START_TIME,PRS_END_TIME) AS 'PRS_DURATION',PRS_DELETED FROM ORC_PROCESS_STATE
GO

