
INSERT INTO ORC_EVENT_ACTIONS (EAC_SOURCE, EAC_ACTION, EAC_DESCRIPTION) values (2, 18, 'Start execution');

commit;


alter table ORC_WORK_QUEUE drop key TESTID;

alter table ORC_WORK_QUEUE add constraint PK_WORK_QUEUE_ID PRIMARY KEY (ID);


alter table ORC_QUEUE_TOPIC_STATE add QTS_GROUP varchar(255);


alter table ORC_WORK_QUEUE drop INDEX IDX_WORK_QUEUE_TOPIC_ID;

create index IDX_WORK_QUEUE_TOPIC_ID on ORC_WORK_QUEUE(ORC_TOPIC_ID, QUEUE_TYPE, STATE);

alter table ORC_WORK_QUEUE drop INDEX IDX_WORK_QUEUE_TOPIC_OWNER; 

create index IDX_WORK_QUEUE_TOPIC_OWNER on ORC_WORK_QUEUE(ORC_TOPIC_OWNER, QUEUE_TYPE, STATE);


create index IDX_WORK_QUEUE_STATE_TYPE_ID on ORC_WORK_QUEUE(STATE, QUEUE_TYPE, ID);

create index IDX_WORK_QUEUE_STAT_TYP_PRIO on ORC_WORK_QUEUE(STATE, QUEUE_TYPE, PRIORITY desc, ID);

CREATE TABLE ORC_TOPIC_QUEUE (
  ITEMTYPE 		varchar(256) NOT NULL,
  DISCRIMINATOR varchar(256) NOT NULL,
  CREATEDAT 	timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
  WORKOBJECT 	blob,
  ID 			varchar(30) NOT NULL,
  ACTION 		char(1) DEFAULT 'W',
  NAME 			varchar(256),
  STATE 		int,
  CLUSTER_NODE 	varchar(255),
  TARGET_NODE 	varchar(255),
  NODE_TICK 	varchar(255),
  QUEUE_TYPE 	varchar(1),
  PRIORITY 		int,
  ORC_TOPIC_OWNER varchar(256),
  ORC_TOPIC_ID 	varchar(256),
  PRIMARY KEY PK_TOPIC_QUEUE_ID (ID),
  KEY IDX_TOPIC_QUEUE_TOPIC_ID (ORC_TOPIC_ID, QUEUE_TYPE, STATE),
  KEY IDX_TOPIC_QUEUE_TOPIC_OWNER (ORC_TOPIC_OWNER, QUEUE_TYPE, STATE),
  KEY IDX_TOPIC_QUEUE_STATE_TYPE_ID (STATE, QUEUE_TYPE, ID),
  KEY IDX_TOPIC_QUEUE_STATE_TYPE_PRIO (STATE, QUEUE_TYPE, PRIORITY, ID)
);


CREATE TABLE ORC_EXT_ARCHIVE (
  EXA_ID bigint NOT NULL,
  EXA_REQ_MSG_ID varchar(256),
  EXA_REQ_TIMESTAMP timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
  EXA_REQ_PROPERTY_1 varchar(255),
  EXA_REQ_PROPERTY_2 varchar(255),
  EXA_REQ_PROPERTY_3 varchar(255),
  EXA_REQ_CONTENT blob,
  EXA_RESP_TIMESTAMP timestamp,
  EXA_RESP_PROPERTY_1 varchar(255),
  EXA_RESP_PROPERTY_2 varchar(255),
  EXA_RESP_PROPERTY_3 varchar(255),
  EXA_RESP_CONTENT longblob,
  EXA_TECHNICAL_SOURCE varchar(255),
  EXA_TECHNICAL_NAME varchar(255),
  EXA_RESP_MSG_ID varchar(255),
  PRIMARY KEY PK_EXT_ARCHIVE (EXA_ID)
);


CREATE TABLE ORC_EXT_ARCHIVE_ERROR (
  EAE_ARC_ID bigint NOT NULL,
  ERC_EXC_TYPE varchar(255),
  ERC_ACTION varchar(255),
  ERC_MESSAGE varchar(255),
  ERC_CLASSNAME varchar(255),
  ERC_METHOD varchar(255),
  ERC_FILE varchar(255),
  ERC_LINE int,
  ERC_STACK longblob,
  ERC_ROLE varchar(255),
  PRIMARY KEY PK_EXT_ARCHIVE_ERROR (EAE_ARC_ID)
);



insert into ORC_SEQUENCE_COUNTER( sco_category, sco_counter ) 
  values ( 'EXT.ARCHIVE', 1 );

update ORC_MONITOR_TABLESETTINGS 
   set ORC_COLUMN_PATTERN = CONCAT(ORC_COLUMN_PATTERN, ',y') 
 where ORC_TABLECLASS = 'ProcessOverviewTable'
   and replace(ORC_COLUMN_PATTERN, 'n', 'y') = 'y,y,y,y,y,y,y';

commit;
