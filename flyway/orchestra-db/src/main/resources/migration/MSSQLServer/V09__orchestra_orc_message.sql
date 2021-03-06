
alter TABLE ORC_MESSAGE add MES_REF_COUNT NUMERIC(10);

CREATE TABLE ORC_MESSAGE_REFERERS
(
  MRE_MESSAGE_ID  VARCHAR(255),
  MRE_PROCESS_ID  VARCHAR(255)
);

CREATE INDEX IDX_MSG_REFERRER_PROCESS_ID ON ORC_MESSAGE_REFERERS(MRE_PROCESS_ID);

delete from ORC_MESSAGE_PROPERTIES;
delete from ORC_MESSAGE_DATA;
delete from ORC_MESSAGE;

GO
