alter table ORC_QUEUE_TOPIC_STATE drop PRIMARY KEY;

ALTER TABLE ORC_QUEUE_TOPIC_STATE ADD 
  CONSTRAINT PK_ORC_QUEUE_TOPIC_STATE
 PRIMARY KEY
 (QTS_IDENTIFIER,QTS_NODE_ID);

alter table ORC_ADAPTER_STATE drop PRIMARY KEY;

ALTER TABLE ORC_ADAPTER_STATE ADD 
  CONSTRAINT PK_ORC_ADAPTER_STATE
 PRIMARY KEY
 (ADS_ADAPTER_NAME, ADS_NODE_ID);
