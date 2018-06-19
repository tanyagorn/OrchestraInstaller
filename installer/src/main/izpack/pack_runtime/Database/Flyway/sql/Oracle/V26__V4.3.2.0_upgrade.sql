

CREATE TABLE ORC_ESB_TOPIC_STATE (
  ETS_IDENTIFIER VARCHAR2(255) NOT NULL,
  ETS_OWNER VARCHAR2(255),
  ETS_STATE NUMBER(10),
  ETS_DESCRIPTION VARCHAR2(255),
  ETS_SIGNAL VARCHAR2(255),
  ETS_TARGET_QUEUE VARCHAR2(255),
  CONSTRAINT PK_ORC_ESB_TOPIC_STATE PRIMARY KEY (ETS_IDENTIFIER)
);

CREATE TABLE ORC_QUEUE_TOPIC_STATE (
  QTS_IDENTIFIER VARCHAR2(255) NOT NULL,
  QTS_OWNER VARCHAR2(255),
  QTS_STATE NUMBER(10),
  CONSTRAINT PK_ORC_QUEUE_TOPIC_STATE PRIMARY KEY (QTS_IDENTIFIER)
);

ALTER TABLE ORC_WORK_QUEUE ADD (
  ORC_TOPIC_OWNER VARCHAR2(256),
  ORC_TOPIC_ID VARCHAR2(256)
);

CREATE INDEX IDX_WORK_QUEUE_TOPIC_ID ON ORC_WORK_QUEUE(ITEMTYPE);

CREATE INDEX IDX_WORK_QUEUE_TOPIC_OWNER ON ORC_WORK_QUEUE (ORC_TOPIC_OWNER);

update ORC_MONITOR_TABLESETTINGS 
   set ORC_COLUMN_PATTERN = 'y,n,y,y,y,y,y,y' 
 where ORC_TABLECLASS = 'ProcessOverviewTable';

commit;
