
CREATE TABLE ORC_EVENT_ERROR_CONTEXT
(
  ERC_ID         bigint                 generated by default as identity,
  ERC_EXC_TYPE   VARCHAR(512),
  ERC_ACTION     VARCHAR(512),
  ERC_MESSAGE    VARCHAR(512),
  ERC_CLASSNAME  VARCHAR(512),
  ERC_METHOD     VARCHAR(512),
  ERC_FILE       VARCHAR(512),
  ERC_LINE       integer,
  ERC_STACK      VARCHAR(1536)
);


CREATE TABLE ORC_EVENT_SCENARIO_CONTEXT
(
  ECO_ID            bigint                 generated by default as identity,
  ECO_DERIVED_TYPE  VARCHAR(512)          NOT NULL,
  ECO_REFERENCE     VARCHAR(512),
  ECO_NAME          VARCHAR(512),
  ECO_TYPE          VARCHAR(512),
  ECO_SUBTYPE       VARCHAR(512),
  ECO_ACT_NAME      VARCHAR(512),
  ECO_ACT_ID        VARCHAR(512),
  ECO_ACT_TYPE      VARCHAR(512),
  ECO_RETRY         integer,
  ECO_MAX_RETRIES   integer
);


ALTER TABLE ORC_EVENT_ERROR_CONTEXT ADD CONSTRAINT PK_ORC_EVT_ERR_CON PRIMARY KEY (ERC_ID);


ALTER TABLE ORC_EVENT_SCENARIO_CONTEXT ADD CONSTRAINT PK_ORC_EVT_SCE_CON PRIMARY KEY (ECO_ID);


ALTER TABLE ORC_EVENT_SYSTEM 
ADD COLUMN EVT_SCEN_REF        VARCHAR(255)
ADD COLUMN EVT_SCEN_NAME       VARCHAR(255)
ADD COLUMN EVT_SCEN_DESC       VARCHAR(255)
ADD COLUMN EVT_SCEN_PROCESSOR  integer
ADD COLUMN EVT_SCEN_INITIATOR  integer
ADD COLUMN EVT_ERROR_CONTEXT   integer;

ALTER TABLE ORC_EVENT_SYSTEM ALTER COLUMN EVT_DESCRIPTION SET DATA TYPE VARCHAR(512);

ALTER TABLE ORC_PROCESS_STATE 
ADD COLUMN PRS_BUSINESS_KEY  VARCHAR(256)
ADD COLUMN PRS_BUSINESS_KEY_NAME  VARCHAR(256)
ADD COLUMN PRS_SCENARIO_ID   VARCHAR(256)
ADD COLUMN PRS_ROOT_TOKEN    VARCHAR(256);

ALTER TABLE ORC_PROCESS_STATE DROP PRIMARY KEY;

ALTER TABLE ORC_PROCESS_STATE ADD CONSTRAINT PK_ORC_PROCS_STATE PRIMARY KEY (PRS_PROCESS_ID);

create table ORC_TIMING_DATA (
	OTD_IDENTIFIER VARCHAR(255) not null, 
	OTD_OWNER_TYPE VARCHAR(255), 
	OTD_OWNER_NAME VARCHAR(255), 
	OTD_DETAIL_TYPE VARCHAR(255), 
	OTD_DETAIL_NAME VARCHAR(255), 
	OTD_TIMING_TEXT VARCHAR(255), 
	OTD_PAUSED integer, 
	OTD_TIMING BLOB
);

ALTER TABLE ORC_TIMING_DATA ADD CONSTRAINT PK_ORC_TIMING_DATA PRIMARY KEY (OTD_IDENTIFIER);

CREATE TABLE ORC_MONITOR_SETTINGS
(
  ORC_USERID            VARCHAR(255)      NOT NULL,
  ORC_STAGE_LABEL_TEXT  VARCHAR(255),
  ORC_STAGE_LABEL_COLOR VARCHAR(255),
  ORC_LANGUAGE          VARCHAR(255),
  ORC_LOGOFF_PERIODE    integer
);

CREATE TABLE ORC_MONITOR_TABLESETTINGS
(
	ORC_PARENT_USERID VARCHAR(255) NOT NULL,
	ORC_TABLECLASS VARCHAR(255) NOT NULL,
	ORC_AUTOREFRESH integer,
	ORC_MAXELEMENTS integer,
	ORC_REFRESHINTERVAL integer,
	ORC_DEFAULT_SORT_COLUMN integer,
	ORC_DEFAULT_SORT_ASCENDING integer,
	ORC_COLUMN_PATTERN VARCHAR(255)
);

insert into ORC_SEC_GROUP_V2 (OSG_SCENARIO, OSG_IDENTIFIER, OSG_DESC) values ('RUNTIME', 'RUNTIME:Timer', NULL);

insert into ORC_SEC_ROLE_V2 (OSR_SCENARIO, OSR_IDENTIFIER, OSR_DESC) values ('RUNTIME', 'RUNTIME:TimerView', NULL);
insert into ORC_SEC_ROLE_V2 (OSR_SCENARIO, OSR_IDENTIFIER, OSR_DESC) values ('RUNTIME', 'RUNTIME:TimerUpdate', NULL);
insert into ORC_SEC_ROLE_V2 (OSR_SCENARIO, OSR_IDENTIFIER, OSR_DESC) values ('RUNTIME', 'RUNTIME:TimerPause', NULL);

insert into ORC_SEC_GROUP_ROLES_V2 (OGR_GROUP_ID, OGR_ROLE_ID) values ('RUNTIME:Timer', 'TimerView');
insert into ORC_SEC_GROUP_ROLES_V2 (OGR_GROUP_ID, OGR_ROLE_ID) values ('RUNTIME:Timer', 'TimerUpdate');
insert into ORC_SEC_GROUP_ROLES_V2 (OGR_GROUP_ID, OGR_ROLE_ID) values('RUNTIME:Timer', 'TimerPause');







insert into ORC_CLUSTER_LOCK(ORC_LOCK_NAME, ORC_LOCK_STATE, ORC_LOCK_OWNER, ORC_LOCK_SCENARIO) Values ('TIMER', NULL, NULL, 'GLOBAL');




insert into ORC_SEC_USER_ROLES_V2(OUR_USER_ID, OUR_ROLE_ID) values ('RUNTIME:admin', 'TimerView');
insert into ORC_SEC_USER_ROLES_V2(OUR_USER_ID, OUR_ROLE_ID) values ('RUNTIME:admin', 'TimerUpdate');
insert into ORC_SEC_USER_ROLES_V2(OUR_USER_ID, OUR_ROLE_ID) values ('RUNTIME:admin', 'TimerPause');

commit;
