
-- ------------------------------------------------------------------
-- Create helper functions for dropping all indices of a table
-- ------------------------------------------------------------------

CREATE PROCEDURE OrcDropIndexesForTable
@TableName VarChar(100)
AS
BEGIN

	Declare @IndexName varchar(256)
	Declare	@Typ bit

	DECLARE index_cursor CURSOR FOR
	SELECT name,is_primary_key  FROM sys.indexes where OBJECT_NAME(object_id) = @TableName and  left( name,1 ) <> '_'
	
	OPEN index_cursor
	
	-- Perform the first fetch.
	FETCH NEXT FROM index_cursor into @IndexName, @Typ
	
	WHILE @@FETCH_STATUS = 0
		BEGIN
		
		if @Typ = 1
			BEGIN
			print 'drop constraint ' + @IndexName + ' on ' + @TableName
			Exec( 'ALTER TABLE ' + @TableName +' DROP CONSTRAINT ' + @IndexName )
			END
		ELSE
			BEGIN
			-- This is executed as long as the previous fetch succeeds.
			print 'drop index ' + @IndexName + ' on ' + @TableName
			Exec('drop index ' + @IndexName + ' on ' + @TableName)
		END
		
		
		FETCH NEXT FROM index_cursor into @IndexName, @Typ
	END
	
	CLOSE index_cursor
	DEALLOCATE index_cursor
END

GO


-- ------------------------------------------------------------------
-- A utility function that switches all indexes of a table to row lock only
-- ------------------------------------------------------------------

CREATE PROCEDURE Orc_ChangeIndexes_To_RowLock
@TableName VarChar(100)
AS
BEGIN
Declare @IndexName varchar(256)


	DECLARE index_cursor CURSOR FOR
	SELECT 'ALTER INDEX ' + name + ' ON ' + OBJECT_NAME(id) + '  SET ( ALLOW_PAGE_LOCKS  = OFF, ALLOW_ROW_LOCKS = ON)'  FROM sysindexes where OBJECT_NAME(id) = @TableName and  left( name,1 ) <> '_'
	
	OPEN index_cursor
	
	-- Perform the first fetch.
	FETCH NEXT FROM index_cursor into @IndexName
		
		WHILE @@FETCH_STATUS = 0
		BEGIN
		
		print @IndexName
	
		Exec( @IndexName )
		FETCH NEXT FROM index_cursor into @IndexName
	END
	
	CLOSE index_cursor
	DEALLOCATE index_cursor
END

GO

-- ------------------------------------------------------------------
-- Add a special delete flag for the orc_message_referers table
-- This flag is only used for ms-sql-server
-- ------------------------------------------------------------------

ALTER TABLE ORC_MESSAGE_REFERERS ADD MRE_DELETE_FLAG VARCHAR(1)
GO

-- ------------------------------------------------------------------
-- ReCreate Indices for table ORC_WORK_QUEUE
-- ------------------------------------------------------------------

Execute OrcDropIndexesForTable 'ORC_WORK_QUEUE'
GO

CREATE INDEX IDX_ORC_WORK_QUEUE_ID 				ON ORC_WORK_QUEUE ( ID )
GO

CREATE INDEX IDX_ORC_WORK_QUEUE_ID_QUEUE_TYPE 	ON ORC_WORK_QUEUE ( ID, QUEUE_TYPE )
GO

CREATE INDEX IDX_ORC_WORK_QUEUE_TOPIC_ID 		ON ORC_WORK_QUEUE ( ORC_TOPIC_OWNER, QUEUE_TYPE )
GO

CREATE INDEX IDX_ORC_WORK_QUEUE_TOPIC_OWNER 	ON ORC_WORK_QUEUE ( ORC_TOPIC_OWNER, QUEUE_TYPE  )
GO

-- ------------------------------------------------------------------
-- ReCreate Indices for table ORC_TOPIC_QUEUE
-- ------------------------------------------------------------------

Execute OrcDropIndexesForTable 'ORC_TOPIC_QUEUE'
GO

CREATE INDEX IDX_ORC_TOPIC_QUEUE_ID 				ON ORC_TOPIC_QUEUE ( ID )
GO

CREATE INDEX IDX_ORC_TOPIC_QUEUE_ID_QUEUE_TYPE 	ON ORC_TOPIC_QUEUE ( ID, QUEUE_TYPE )
GO

CREATE INDEX IDX_ORC_TOPIC_QUEUE_TOPIC_ID 		ON ORC_TOPIC_QUEUE ( ORC_TOPIC_OWNER, QUEUE_TYPE )
GO

CREATE INDEX IDX_ORC_TOPIC_QUEUE_TOPIC_OWNER 	ON ORC_TOPIC_QUEUE ( ORC_TOPIC_OWNER, QUEUE_TYPE  )
GO

-- ------------------------------------------------------------------
-- Additional index for ORC_PROCESS_FIFO_SCHEDULE
-- ------------------------------------------------------------------

CREATE INDEX IDX_PROC_FIFO_SCHED ON ORC_PROCESS_FIFO_SCHEDULE ( PFS_MODELL_REFERENCE, PFS_STATE ) INCLUDE ( [PFS_ID])
GO

-- ------------------------------------------------------------------
-- Disable lock-escalation for all orchestra tables
-- ------------------------------------------------------------------

ALTER TABLE ORC_ADAPTER_STATE SET (LOCK_ESCALATION = DISABLE)
GO


ALTER TABLE ORC_ARCHIVE SET (LOCK_ESCALATION = DISABLE)
GO


ALTER TABLE ORC_BUSINESS_TRANSACTION SET (LOCK_ESCALATION = DISABLE)
GO


ALTER TABLE ORC_CHANNEL SET (LOCK_ESCALATION = DISABLE)
GO


ALTER TABLE ORC_CLUSTER_ENVIRONMENT SET (LOCK_ESCALATION = DISABLE)
GO


ALTER TABLE ORC_CLUSTER_LOCK SET (LOCK_ESCALATION = DISABLE)
GO


ALTER TABLE ORC_CLUSTER_LOCK_STATE SET (LOCK_ESCALATION = DISABLE)
GO


ALTER TABLE ORC_CONTENT_MAPPING SET (LOCK_ESCALATION = DISABLE)
GO


ALTER TABLE ORC_CONTENT_TYPE SET (LOCK_ESCALATION = DISABLE)
GO

ALTER TABLE ORC_DBS_PAGE SET (LOCK_ESCALATION = DISABLE)
GO










ALTER TABLE ORC_ESB_TOPIC_STATE SET (LOCK_ESCALATION = DISABLE)
GO


ALTER TABLE ORC_EVENT SET (LOCK_ESCALATION = DISABLE)
GO






ALTER TABLE ORC_EVENT_ERROR_CONTEXT SET (LOCK_ESCALATION = DISABLE)
GO


ALTER TABLE ORC_EVENT_PROCESS SET (LOCK_ESCALATION = DISABLE)
GO


ALTER TABLE ORC_EVENT_PROCESS_TOKEN SET (LOCK_ESCALATION = DISABLE)
GO


ALTER TABLE ORC_EVENT_SCENARIO_CONTEXT SET (LOCK_ESCALATION = DISABLE)
GO






ALTER TABLE ORC_EVENT_SYSTEM SET (LOCK_ESCALATION = DISABLE)
GO


ALTER TABLE ORC_EVT_LOCAL_VARIABLES SET (LOCK_ESCALATION = DISABLE)
GO


ALTER TABLE ORC_EVT_PROCESS_VARIABLES SET (LOCK_ESCALATION = DISABLE)
GO






ALTER TABLE ORC_EXT_ARCHIVE SET (LOCK_ESCALATION = DISABLE)
GO


ALTER TABLE ORC_EXT_ARCHIVE_ERROR SET (LOCK_ESCALATION = DISABLE)
GO


ALTER TABLE ORC_GLOBAL_TRANSACTION SET (LOCK_ESCALATION = DISABLE)
GO






ALTER TABLE ORC_LANDSCAPE SET (LOCK_ESCALATION = DISABLE)
GO


ALTER TABLE ORC_MESSAGE SET (LOCK_ESCALATION = DISABLE)
GO


ALTER TABLE ORC_MESSAGE_DATA SET (LOCK_ESCALATION = DISABLE)
GO


ALTER TABLE ORC_MESSAGE_INTERFACE SET (LOCK_ESCALATION = DISABLE)
GO


ALTER TABLE ORC_MESSAGE_LIST SET (LOCK_ESCALATION = DISABLE)
GO


ALTER TABLE ORC_MESSAGE_LIST_ENTRY SET (LOCK_ESCALATION = DISABLE)
GO


ALTER TABLE ORC_MESSAGE_LIST_ENTRY_PROP SET (LOCK_ESCALATION = DISABLE)
GO


ALTER TABLE ORC_MESSAGE_LIST_INDEX SET (LOCK_ESCALATION = DISABLE)
GO


ALTER TABLE ORC_MESSAGE_MAPPING SET (LOCK_ESCALATION = DISABLE)
GO


ALTER TABLE ORC_MESSAGE_PROPERTIES SET (LOCK_ESCALATION = DISABLE)
GO


ALTER TABLE ORC_MESSAGE_REFERERS SET (LOCK_ESCALATION = DISABLE)
GO


ALTER TABLE ORC_MESSAGE_TYPE SET (LOCK_ESCALATION = DISABLE)
GO


ALTER TABLE ORC_MONITOR_SETTINGS SET (LOCK_ESCALATION = DISABLE)
GO


ALTER TABLE ORC_MONITOR_TABLESETTINGS SET (LOCK_ESCALATION = DISABLE)
GO


ALTER TABLE ORC_PROCESS_ARBORT SET (LOCK_ESCALATION = DISABLE)
GO


ALTER TABLE ORC_PROCESS_EXECUTION SET (LOCK_ESCALATION = DISABLE)
GO


ALTER TABLE ORC_PROCESS_EXT_BUSINESS_KEYS SET (LOCK_ESCALATION = DISABLE)
GO


ALTER TABLE ORC_PROCESS_FIFO_SCHEDULE SET (LOCK_ESCALATION = DISABLE)
GO


ALTER TABLE ORC_PROCESS_MODE SET (LOCK_ESCALATION = DISABLE)
GO


ALTER TABLE ORC_PROCESS_MODELLS SET (LOCK_ESCALATION = DISABLE)
GO


ALTER TABLE ORC_PROCESS_RUNTIME_STATE SET (LOCK_ESCALATION = DISABLE)
GO


ALTER TABLE ORC_PROCESS_SCENARIO SET (LOCK_ESCALATION = DISABLE)
GO


ALTER TABLE ORC_PROCESS_STATE SET (LOCK_ESCALATION = DISABLE)
GO


ALTER TABLE ORC_PROCESS_TOKEN_STATE SET (LOCK_ESCALATION = DISABLE)
GO


ALTER TABLE ORC_PROCESS_WAIT_LIST SET (LOCK_ESCALATION = DISABLE)
GO


ALTER TABLE ORC_PRS_DESCRIPTION SET (LOCK_ESCALATION = DISABLE)
GO


ALTER TABLE ORC_PRT_PARTNERCONFIG SET (LOCK_ESCALATION = DISABLE)
GO


ALTER TABLE ORC_QUEUE_TOPIC_STATE SET (LOCK_ESCALATION = DISABLE)
GO


ALTER TABLE ORC_RECOVERY_DATA SET (LOCK_ESCALATION = DISABLE)
GO


ALTER TABLE ORC_SEC_CREDENTIAL_V2 SET (LOCK_ESCALATION = DISABLE)
GO






ALTER TABLE ORC_SEC_GROUP_ROLES_V2 SET (LOCK_ESCALATION = DISABLE)
GO


ALTER TABLE ORC_SEC_GROUP_V2 SET (LOCK_ESCALATION = DISABLE)
GO


ALTER TABLE ORC_SEC_KEYSTORE_V2 SET (LOCK_ESCALATION = DISABLE)
GO






ALTER TABLE ORC_SEC_ROLE_V2 SET (LOCK_ESCALATION = DISABLE)
GO


ALTER TABLE ORC_SEC_TRUSTSTORE_V2 SET (LOCK_ESCALATION = DISABLE)
GO






ALTER TABLE ORC_SEC_USER_AUTH_METHODS_V2 SET (LOCK_ESCALATION = DISABLE)
GO


ALTER TABLE ORC_SEC_USER_CERTIFICATE SET (LOCK_ESCALATION = DISABLE)
GO


ALTER TABLE ORC_SEC_USER_GROUP_V2 SET (LOCK_ESCALATION = DISABLE)
GO


ALTER TABLE ORC_SEC_USER_PKCS12 SET (LOCK_ESCALATION = DISABLE)
GO






ALTER TABLE ORC_SEC_USER_ROLES_V2 SET (LOCK_ESCALATION = DISABLE)
GO


ALTER TABLE ORC_SEC_USER_SSH SET (LOCK_ESCALATION = DISABLE)
GO


ALTER TABLE ORC_SEC_USER_STATE SET (LOCK_ESCALATION = DISABLE)
GO


ALTER TABLE ORC_SEQUENCE_COUNTER SET (LOCK_ESCALATION = DISABLE)
GO


ALTER TABLE ORC_SERVER_SETTINGS SET (LOCK_ESCALATION = DISABLE)
GO






ALTER TABLE ORC_SVC_DECLARATION SET (LOCK_ESCALATION = DISABLE)
GO


ALTER TABLE ORC_SVC_PROVIDER SET (LOCK_ESCALATION = DISABLE)
GO


ALTER TABLE ORC_TIMING_DATA SET (LOCK_ESCALATION = DISABLE)
GO


ALTER TABLE ORC_TOPIC_QUEUE SET (LOCK_ESCALATION = DISABLE)
GO


ALTER TABLE ORC_USER_PWD_TABLE SET (LOCK_ESCALATION = DISABLE)
GO


ALTER TABLE ORC_WORK_QUEUE SET (LOCK_ESCALATION = DISABLE)
GO

ALTER TABLE ORC_XML_SCHEMA SET (LOCK_ESCALATION = DISABLE)
GO

-- ------------------------------------------------------------------
-- Disable page-locks for all orchestra indices
-- ------------------------------------------------------------------

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_ADAPTER_STATE'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_ARCHIVE'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_BUSINESS_TRANSACTION'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_CHANNEL'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_CLUSTER_ENVIRONMENT'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_CLUSTER_LOCK'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_CLUSTER_LOCK_STATE'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_CONTENT_MAPPING'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_CONTENT_TYPE'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_DBS_PAGE'
GO







EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_ESB_TOPIC_STATE'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_EVENT'
GO




EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_EVENT_ERROR_CONTEXT'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_EVENT_PROCESS'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_EVENT_PROCESS_TOKEN'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_EVENT_SCENARIO_CONTEXT'
GO




EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_EVENT_SYSTEM'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_EVT_LOCAL_VARIABLES'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_EVT_PROCESS_VARIABLES'
GO




EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_EXT_ARCHIVE'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_EXT_ARCHIVE_ERROR'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_GLOBAL_TRANSACTION'
GO




EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_LANDSCAPE'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_MESSAGE'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_MESSAGE_DATA'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_MESSAGE_INTERFACE'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_MESSAGE_LIST'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_MESSAGE_LIST_ENTRY'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_MESSAGE_LIST_ENTRY_PROP'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_MESSAGE_LIST_INDEX'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_MESSAGE_MAPPING'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_MESSAGE_PROPERTIES'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_MESSAGE_REFERERS'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_MESSAGE_TYPE'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_MONITOR_SETTINGS'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_MONITOR_TABLESETTINGS'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_PROCESS_ARBORT'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_PROCESS_EXECUTION'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_PROCESS_EXT_BUSINESS_KEYS'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_PROCESS_FIFO_SCHEDULE'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_PROCESS_MODE'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_PROCESS_MODELLS'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_PROCESS_RUNTIME_STATE'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_PROCESS_SCENARIO'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_PROCESS_STATE'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_PROCESS_TOKEN_STATE'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_PROCESS_WAIT_LIST'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_PRS_DESCRIPTION'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_PRT_PARTNERCONFIG'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_QUEUE_TOPIC_STATE'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_RECOVERY_DATA'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_SEC_CREDENTIAL_V2'
GO




EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_SEC_GROUP_ROLES_V2'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_SEC_GROUP_V2'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_SEC_KEYSTORE_V2'
GO




EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_SEC_ROLE_V2'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_SEC_TRUSTSTORE_V2'
GO




EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_SEC_USER_AUTH_METHODS_V2'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_SEC_USER_CERTIFICATE'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_SEC_USER_GROUP_V2'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_SEC_USER_PKCS12'
GO




EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_SEC_USER_ROLES_V2'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_SEC_USER_SSH'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_SEC_USER_STATE'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_SEQUENCE_COUNTER'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_SERVER_SETTINGS'
GO




EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_SVC_DECLARATION'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_SVC_PROVIDER'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_TIMING_DATA'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_TOPIC_QUEUE'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_USER_PWD_TABLE'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_WORK_QUEUE'
GO

EXECUTE Orc_ChangeIndexes_To_RowLock  'ORC_XML_SCHEMA'
GO