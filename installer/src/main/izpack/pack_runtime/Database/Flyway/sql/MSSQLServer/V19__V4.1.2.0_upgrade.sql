
ALTER TABLE ORC_WORK_QUEUE ALTER COLUMN WORKOBJECT VARBINARY(MAX);











CREATE INDEX IDX_MSG_REFERRER_MESSAGE_ID ON ORC_MESSAGE_REFERERS(MRE_MESSAGE_ID);






CREATE INDEX IDX_MSG_DATA_MSG_ID ON ORC_MESSAGE_DATA(MSD_MSG_ID);


ALTER TABLE ORC_EVT_LOCAL_VARIABLES
ALTER COLUMN EVV_VALUE VARCHAR(512);

ALTER TABLE ORC_EVT_PROCESS_VARIABLES ALTER COLUMN EVV_VALUE VARCHAR(512);



CREATE TABLE ORC_PROCESS_ARBORT
(
  PRA_PARENT_PROCESS  VARCHAR(255),
  PRA_CHILD_PROCESS   VARCHAR(255),
  PRA_PARENT_TOKEN    VARCHAR(255)
);


CREATE INDEX IDX_ORC_PROC_ABORT_CHILD_PROC ON ORC_PROCESS_ARBORT
(PRA_CHILD_PROCESS);




















GO
