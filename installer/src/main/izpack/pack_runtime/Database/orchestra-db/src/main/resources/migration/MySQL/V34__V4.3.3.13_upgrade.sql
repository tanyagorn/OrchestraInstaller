
ALTER TABLE ORC_EVENT_ERROR_CONTEXT MODIFY ERC_EXC_TYPE VARCHAR(512);

ALTER TABLE ORC_EVENT_ERROR_CONTEXT MODIFY ERC_ACTION VARCHAR(512);

ALTER TABLE ORC_EVENT_ERROR_CONTEXT MODIFY ERC_MESSAGE VARCHAR(512);

ALTER TABLE ORC_EVENT_ERROR_CONTEXT MODIFY ERC_CLASSNAME VARCHAR(512);

ALTER TABLE ORC_EVENT_ERROR_CONTEXT MODIFY ERC_METHOD VARCHAR(512);

ALTER TABLE ORC_EVENT_ERROR_CONTEXT MODIFY ERC_FILE VARCHAR(512);

COMMIT;
