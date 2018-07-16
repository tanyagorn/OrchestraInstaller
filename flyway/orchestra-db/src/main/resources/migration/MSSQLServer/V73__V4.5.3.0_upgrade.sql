-- *********************************************************************
-- Create Database Script
-- *********************************************************************
-- Change Log: /opt/liquibase/data/orchestra_4.5.3.0.xml
-- Ran at: 08.12.14 17:04
-- Liquibase version: 2.0.5
-- *********************************************************************

-- Changeset /opt/liquibase/data/orchestra_4.5.3.0.xml::change-4.5.3.0-01::akn::(Checksum: 6:0090e88c99824bbaff951b4d7602fa81)
UPDATE [ORC_CLUSTER_ENVIRONMENT] SET [CEN_NODE_NAME] = 'ORC' WHERE [CEN_NODE_NAME] IS NULL
GO

ALTER TABLE [ORC_CLUSTER_ENVIRONMENT] ALTER COLUMN [CEN_NODE_NAME] VARCHAR(255) NOT NULL
GO

ALTER TABLE [ORC_CLUSTER_ENVIRONMENT] ADD CONSTRAINT [PK_CLUSTER_ENV] PRIMARY KEY ([CEN_NODE_NAME]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

-- Changeset /opt/liquibase/data/orchestra_4.5.3.0.xml::change-4.5.3.0-02::akn::(Checksum: 6:42e7aad1ff0decb45f9e8885e7728412)
ALTER TABLE [ORC_SEQUENCE_COUNTER] DROP CONSTRAINT [PK_SEQ_COUNTER_CATEGORY]
GO

ALTER TABLE [ORC_SEQUENCE_COUNTER] ALTER COLUMN [SCO_CATEGORY] VARCHAR(64)
GO

UPDATE [ORC_SEQUENCE_COUNTER] SET [SCO_CATEGORY] = 'ORC' WHERE [SCO_CATEGORY] IS NULL
GO

ALTER TABLE [ORC_SEQUENCE_COUNTER] ALTER COLUMN [SCO_CATEGORY] VARCHAR(64) NOT NULL
GO

ALTER TABLE [ORC_SEQUENCE_COUNTER] ADD CONSTRAINT [PK_SEQ_COUNTER_CATEGORY] PRIMARY KEY ([SCO_CATEGORY]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

-- Changeset /opt/liquibase/data/orchestra_4.5.3.0.xml::change-4.5.3.0-03::akn::(Checksum: 6:ab39234df3ed46e61f94f447df73cda7)
DROP INDEX [ORC_WORK_QUEUE].IDX_ORC_WORK_QUEUE_2
GO

DROP INDEX [ORC_PROCESS_FIFO_SCHEDULE].IDX_PROCESS_FIFO_SCHEDULE_ID
GO

-- Changeset /opt/liquibase/data/orchestra_4.5.3.0.xml::change-4.5.3.0-04::akn::(Checksum: 6:817d8fee90c077ad97c6ef3b233cd0f4)
DROP INDEX [ORC_WORK_QUEUE].IDX_ORC_WORK_QUEUE_ID_QUEUE_TYPE
GO

DROP INDEX [ORC_WORK_QUEUE].IDX_ORC_WORK_QUEUE_ID
GO

UPDATE [ORC_WORK_QUEUE] SET [ID] = 'dummy' WHERE [ID] IS NULL
GO

ALTER TABLE [ORC_WORK_QUEUE] ALTER COLUMN [ID] VARCHAR(30) NOT NULL
GO

ALTER TABLE [ORC_WORK_QUEUE] ADD CONSTRAINT [PK_WORK_QUEUE_ID] PRIMARY KEY ([ID]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

DROP INDEX [ORC_WORK_QUEUE].IDX_ORC_WORK_QUEUE_TOPIC_ID
GO

CREATE NONCLUSTERED INDEX [IDX_ORC_WORK_QUEUE_TOPIC_ID] ON [ORC_WORK_QUEUE] ( [ORC_TOPIC_ID] ASC, [QUEUE_TYPE] ASC )
		     INCLUDE ( [STATE], [TARGET_NODE]) WITH (ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF) ON [PRIMARY]
GO

-- Changeset /opt/liquibase/data/orchestra_4.5.3.0.xml::change-4.5.3.0-04_1::akn::(Checksum: 6:916cef7151952cca6fadd4ec1e52877a)
DROP INDEX [ORC_PROCESS_FIFO_SCHEDULE].IDX_PROCESS_FIFO_SCHED_REF_ID
GO

CREATE NONCLUSTERED INDEX [IDX_PROCESS_FIFO_SCHED_REF_ID] ON [ORC_PROCESS_FIFO_SCHEDULE] ( [PFS_MODELL_REFERENCE] ASC ) INCLUDE ( [PFS_PROCESS_REFERENCE], [PFS_STATE], [PFS_TARGET_NODE]) WITH (ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF) ON [PRIMARY]
GO

-- Changeset /opt/liquibase/data/orchestra_4.5.3.0.xml::change-4.5.3.0-05::akn::(Checksum: 6:c882e87463c0e72fd74bd0609ef2af1b)
INSERT INTO [ORC_CLUSTER_LOCK] ([ORC_LOCK_NAME], [ORC_LOCK_SCENARIO]) VALUES ('LTA', 'GLOBAL')
GO

-- Changeset /opt/liquibase/data/orchestra_4.5.3.0.xml::change-4.5.3.0-06::akn::(Checksum: 6:fe9ef52154db13164a7a9124e8499a83)
ALTER TABLE [ORC_PROCESSINSTANCE_STATE] ADD [PRS_CLUSTER_LEASE] VARCHAR(255)
GO

-- Changeset /opt/liquibase/data/orchestra_4.5.3.0.xml::change-4.5.3.0-07::akn::(Checksum: 6:de2338bd975ad9803e0abca0dc3e7c19)
DROP INDEX [ORC_PROCESS_STATE].IDX_ORC_PROCESS_STATE_2
GO

CREATE NONCLUSTERED INDEX [IDX_ORC_PROCESS_STATE_2] ON [ORC_PROCESS_STATE]
             ([PRS_SCENARIO_ID] ASC, [PRS_MODELL_ID] ASC, [PRS_STATE] ASC ) INCLUDE ( [PRS_START_TIME], [PRS_END_TIME]) WITH (ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF) ON [PRIMARY]
GO

-- Changeset /opt/liquibase/data/orchestra_4.5.3.0.xml::change-4.5.3.0-08-1::akn::(Checksum: 6:ad9f5258588678596ec307d24cc690de)
ALTER TABLE [ORC_PROCESS_FIFO_SCHED_CACHE] DROP CONSTRAINT [PK_PROCESS_FIFO_CACHE]
GO

-- Changeset /opt/liquibase/data/orchestra_4.5.3.0.xml::change-4.5.3.0-08-2::akn::(Checksum: 6:f4b13793aec7aefd374ab5c27832d4f5)
ALTER TABLE [ORC_PROCESS_FIFO_SCHED_CACHE] ADD CONSTRAINT [PK_PROC_FIFO_CACHE] PRIMARY KEY ([PFC_ID], [PFC_MODELL_REFERENCE]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

-- Changeset /opt/liquibase/data/orchestra_4.5.3.0.xml::change-4.5.3.0-09::akn::(Checksum: 6:4f23497df1e4e6c51a90917787ec5565)
DROP INDEX [ORC_PROCESS_FIFO_SCHED_CACHE].IDX_PROCESS_FIFO_CACHE
GO

CREATE NONCLUSTERED INDEX [IDX_PROCESS_FIFO_CACHE] ON [ORC_PROCESS_FIFO_SCHED_CACHE] ( [PFC_MODELL_REFERENCE] ASC )
		     INCLUDE ( [PFC_TARGET_NODE]) WITH (ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF) ON [PRIMARY]
GO

-- Changeset /opt/liquibase/data/orchestra_4.5.3.0.xml::change-4.5.3.0-10::akn::(Checksum: 6:2c09d4c12f15a3008d85d5f8a136ee4c)
DROP INDEX [ORC_MESSAGE_LIST].IDX_ORC_MSG_LIST_ID
GO

UPDATE [ORC_MESSAGE_LIST] SET [MLI_ID] = '0' WHERE [MLI_ID] IS NULL
GO

ALTER TABLE [ORC_MESSAGE_LIST] ALTER COLUMN [MLI_ID] BIGINT NOT NULL
GO

ALTER TABLE [ORC_MESSAGE_LIST] ADD CONSTRAINT [PK_ORC_MSG_LIST_ID] PRIMARY KEY ([MLI_ID]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

DROP INDEX [ORC_MESSAGE_LIST_ENTRY].IDX_ORC_MSG_LISTENT_ID_MSGREF
GO

DROP INDEX [ORC_MESSAGE_LIST_ENTRY].IDX_ORC_MSG_LISTENT_ID_REFER
GO

UPDATE [ORC_MESSAGE_LIST_ENTRY] SET [MLE_ID] = '0' WHERE [MLE_ID] IS NULL
GO

ALTER TABLE [ORC_MESSAGE_LIST_ENTRY] ALTER COLUMN [MLE_ID] BIGINT NOT NULL
GO

UPDATE [ORC_MESSAGE_LIST_ENTRY] SET [MLE_REFERENCE] = 'dummy' WHERE [MLE_REFERENCE] IS NULL
GO

ALTER TABLE [ORC_MESSAGE_LIST_ENTRY] ALTER COLUMN [MLE_REFERENCE] VARCHAR(256) NOT NULL
GO

ALTER TABLE [ORC_MESSAGE_LIST_ENTRY] ADD CONSTRAINT [PK_MLE_ID_REFER] PRIMARY KEY ([MLE_ID], [MLE_REFERENCE]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

DROP INDEX [ORC_MESSAGE_LIST_ENTRY_PROP].IDX_ORC_MSG_LISTPRP_ID_KEY_VAL
GO

DROP INDEX [ORC_MESSAGE_LIST_ENTRY_PROP].IDX_ORC_MSG_LISTPRP_ID_REF_KEY
GO

UPDATE [ORC_MESSAGE_LIST_ENTRY_PROP] SET [MLP_ID] = '0' WHERE [MLP_ID] IS NULL
GO

ALTER TABLE [ORC_MESSAGE_LIST_ENTRY_PROP] ALTER COLUMN [MLP_ID] BIGINT NOT NULL
GO

UPDATE [ORC_MESSAGE_LIST_ENTRY_PROP] SET [MLP_KEY] = 'dummy' WHERE [MLP_KEY] IS NULL
GO

ALTER TABLE [ORC_MESSAGE_LIST_ENTRY_PROP] ALTER COLUMN [MLP_KEY] VARCHAR(256) NOT NULL
GO

UPDATE [ORC_MESSAGE_LIST_ENTRY_PROP] SET [MLP_REFERENCE] = 'dummy' WHERE [MLP_REFERENCE] IS NULL
GO

ALTER TABLE [ORC_MESSAGE_LIST_ENTRY_PROP] ALTER COLUMN [MLP_REFERENCE] VARCHAR(256) NOT NULL
GO

ALTER TABLE [ORC_MESSAGE_LIST_ENTRY_PROP] ADD CONSTRAINT [PK_MLP_ID_KEY_REF] PRIMARY KEY ([MLP_ID], [MLP_KEY], [MLP_REFERENCE]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

CREATE INDEX IDX_ORC_MSG_LISTPRP_ID_KEY_VAL ON [ORC_MESSAGE_LIST_ENTRY_PROP]([MLP_ID], [MLP_KEY], [MLP_VALUE]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF)
GO

-- Changeset /opt/liquibase/data/orchestra_4.5.3.0.xml::change-4.5.3.0-11::akn::(Checksum: 6:ee5857d2d2fe76046d476652158f59c4)
DROP INDEX [ORC_PROCESS_FIFO_SCHEDULE].IDX_PROC_FIFO_SCHED_MODEL_REF
GO

