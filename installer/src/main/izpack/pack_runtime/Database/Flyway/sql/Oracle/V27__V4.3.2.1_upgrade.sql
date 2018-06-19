




alter table ORC_WORK_QUEUE drop constraint TESTID;

alter table ORC_WORK_QUEUE add constraint PK_WORK_QUEUE_ID PRIMARY KEY (ID);


alter table ORC_QUEUE_TOPIC_STATE add QTS_GROUP VARCHAR2(255);


-- Indexe auf ORC_WORK_QUEUE

-- index IDX_WORK_QUEUE_TOPIC_ID was on ORC_WORK_QUEUE(ITEMTYPE)
drop INDEX IDX_WORK_QUEUE_TOPIC_ID;

create index IDX_WORK_QUEUE_TOPIC_ID on ORC_WORK_QUEUE(ORC_TOPIC_ID, QUEUE_TYPE, STATE);

-- index IDX_WORK_QUEUE_TOPIC_OWNER was on ORC_WORK_QUEUE(ORC_TOPIC_OWNER);
drop INDEX IDX_WORK_QUEUE_TOPIC_OWNER; 

create index IDX_WORK_QUEUE_TOPIC_OWNER on ORC_WORK_QUEUE(ORC_TOPIC_OWNER, QUEUE_TYPE, STATE);


create index IDX_WORK_QUEUE_STATE_TYPE_ID on ORC_WORK_QUEUE(STATE, QUEUE_TYPE, ID);

create index IDX_WORK_QUEUE_STAT_TYP_PRIO on ORC_WORK_QUEUE(STATE, QUEUE_TYPE, PRIORITY desc, ID);

CREATE TABLE ORC_TOPIC_QUEUE (
  ITEMTYPE 		VARCHAR2(256) NOT NULL,
  DISCRIMINATOR VARCHAR2(256) NOT NULL,
  CREATEDAT 	DATE DEFAULT SYSDATE NOT NULL,
  WORKOBJECT 	BLOB,
  ID 			VARCHAR2(30) NOT NULL,
  ACTION 		char(1) DEFAULT 'W',
  NAME 			VARCHAR2(256),
  STATE 		INTEGER,
  cluster_node 	VARCHAR2(255),
  target_node 	VARCHAR2(255),
  node_tick 	VARCHAR2(255),
  QUEUE_TYPE 	VARCHAR2(1),
  PRIORITY 		INTEGER,
  ORC_TOPIC_OWNER VARCHAR2(256),
  ORC_TOPIC_ID	 VARCHAR2(256),
  constraint PK_TOPIC_QUEUE PRIMARY KEY (ID)
);

create index IDX_TOPIC_QUEUE_TOPIC_ID on ORC_TOPIC_QUEUE(ORC_TOPIC_ID, QUEUE_TYPE, STATE);

create index IDX_TOPIC_QUEUE_TOPIC_OWNER on ORC_TOPIC_QUEUE(ORC_TOPIC_OWNER, QUEUE_TYPE, STATE);

create index IDX_TOPIC_QUEUE_STATE_TYPE_ID on ORC_TOPIC_QUEUE(STATE, QUEUE_TYPE, ID);

create index IDX_TOPIC_QUEUE_STAT_TYP_PRIO on ORC_TOPIC_QUEUE(STATE, QUEUE_TYPE, PRIORITY, ID);



CREATE TABLE ORC_EXT_ARCHIVE (
  EXA_ID INTEGER NOT NULL,
  EXA_REQ_MSG_ID VARCHAR2(256),
  EXA_REQ_TIMESTAMP DATE DEFAULT SYSDATE NOT NULL,
  EXA_REQ_PROPERTY_1 VARCHAR2(255),
  EXA_REQ_PROPERTY_2 VARCHAR2(255),
  EXA_REQ_PROPERTY_3 VARCHAR2(255),
  EXA_REQ_CONTENT BLOB,
  EXA_RESP_TIMESTAMP DATE,
  EXA_RESP_PROPERTY_1 VARCHAR2(255),
  EXA_RESP_PROPERTY_2 VARCHAR2(255),
  EXA_RESP_PROPERTY_3 VARCHAR2(255),
  EXA_RESP_CONTENT BLOB,
  EXA_TECHNICAL_SOURCE VARCHAR2(255),
  EXA_TECHNICAL_NAME VARCHAR2(255),
  EXA_RESP_MSG_ID VARCHAR2(255),
  constraint PK_EXT_ARCHIVE PRIMARY KEY (EXA_ID)
);


CREATE TABLE ORC_EXT_ARCHIVE_ERROR (
  EAE_ARC_ID INTEGER NOT NULL,
  ERC_EXC_TYPE VARCHAR2(255),
  ERC_ACTION VARCHAR2(255),
  ERC_MESSAGE VARCHAR2(255),
  ERC_CLASSNAME VARCHAR2(255),
  ERC_METHOD VARCHAR2(255),
  ERC_FILE VARCHAR2(255),
  ERC_LINE INTEGER,
  ERC_STACK BLOB,
  ERC_ROLE VARCHAR2(255),
  constraint PK_EXT_ARCHIVE_ERROR PRIMARY KEY (EAE_ARC_ID)
);

insert into ORC_SEQUENCE_COUNTER( sco_category, sco_counter ) 
  values ( 'EXT.ARCHIVE', 1 );

update ORC_MONITOR_TABLESETTINGS 
   set ORC_COLUMN_PATTERN = CONCAT(ORC_COLUMN_PATTERN, ',y') 
 where ORC_TABLECLASS = 'ProcessOverviewTable'
   and replace(ORC_COLUMN_PATTERN, 'n', 'y') = 'y,y,y,y,y,y,y';

commit;