
ALTER TABLE ORC_MESSAGE_LIST_ENTRY  
	ALTER COLUMN MLE_REFERENCE VARCHAR(256);
     
ALTER TABLE ORC_MESSAGE_LIST_ENTRY_PROP  
	ALTER COLUMN MLP_REFERENCE VARCHAR(256);
     
ALTER TABLE ORC_MESSAGE_LIST_INDEX  
	ALTER COLUMN MLI_REFERENCE VARCHAR(256);

GO
