/* MySQL - Script 42 (V4.3.4.5) */
	
ALTER TABLE ORC_JAVA_CLASS CHANGE JCL_DEPLAYED_AT JCL_DEPLOYED_AT TIMESTAMP;

/* Add Index */

CREATE INDEX IDX_MSG_REFERRER_MESSAGELIST_ID ON ORC_MESSAGE_REFERERS(MRE_MESSAGELIST_ID);

CREATE INDEX IDX_ORC_MSG_LIST_CREATED_AT ON ORC_MESSAGE_LIST(MLI_CREATED_AT);

COMMIT;
