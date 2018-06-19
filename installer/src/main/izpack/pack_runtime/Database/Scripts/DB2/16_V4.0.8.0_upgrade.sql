
create table ORC_SEQUENCE_COUNTER
(
	SCO_CATEGORY	varchar(32),
	SCO_COUNTER		INTEGER
);

CREATE TABLE ORC_PROCESS_FIFO_SCHEDULE
(
  PFS_ID                 varchar(30)      NOT NULL,
  PFS_SCENARIO           varchar(256)     NOT NULL,
  PFS_MODELL_REFERENCE   varchar(256)     NOT NULL,
  PFS_PROCESS_REFERENCE  varchar(256)     NOT NULL,
  PFS_TOKEN_REFERENCE    varchar(256)     NOT NULL,
  PFS_VARIABLES          BLOB,
  PFS_TARGET_NODE        varchar(256),
  PFS_STATE              varchar(10)      NOT NULL
);

insert into ORC_SEQUENCE_COUNTER( SCO_CATEGORY, SCO_COUNTER) values ( 'FIFO.QUEUE', 0 );
commit;

alter table ORC_WORK_QUEUE add QUEUE_TYPE varchar(1);

alter table ORC_BUSINESS_TRANSACTION add OBT_APPLICATION_STATE varchar(30);