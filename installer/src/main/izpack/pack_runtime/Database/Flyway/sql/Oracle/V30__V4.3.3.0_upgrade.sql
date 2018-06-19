
ALTER TABLE ORC_PROCESS_STATE ADD PRS_PROCESS_MODEL VARCHAR2(256);

create table ORC_PROCESS_RUNTIME_STATE (
	PRS_ID varchar2(255 char) not null, 
	PRS_START_EVENT number(10), 
	PRS_STATE number(10), 
	PRS_VARIABLES BLOB, 
	PRS_PROCESS varchar2(255 char), 
	PRS_PROCESSMODELL varchar2(255 char), 
	PRS_NODE_ID varchar2(255 char), 
	primary key (PRS_ID)
);

ALTER TABLE ORC_MONITOR_SETTINGS ADD (
  ORC_STAGE_LABEL_SIZE INTEGER,
  ORC_STAGE_LABEL_X INTEGER,
  ORC_STAGE_LABEL_Y INTEGER
);

update ORC_MONITOR_SETTINGS set ORC_STAGE_LABEL_SIZE = 30, ORC_STAGE_LABEL_X = -1, ORC_STAGE_LABEL_Y = -1; 

insert into ORC_SEC_ROLE_V2 (OSR_SCENARIO,OSR_IDENTIFIER,OSR_DESC) values ('RUNTIME','RUNTIME:Scenario.Activate',null);
insert into ORC_SEC_ROLE_V2 (OSR_SCENARIO,OSR_IDENTIFIER,OSR_DESC) values ('RUNTIME','RUNTIME:Scenario.Deactivate',null);
insert into ORC_SEC_ROLE_V2 (OSR_SCENARIO,OSR_IDENTIFIER,OSR_DESC) values ('RUNTIME','RUNTIME:Adapter.Activate',null);
insert into ORC_SEC_ROLE_V2 (OSR_SCENARIO,OSR_IDENTIFIER,OSR_DESC) values ('RUNTIME','RUNTIME:Adapter.Deactivate',null);


insert into ORC_SEC_GROUP_ROLES_V2 (OGR_GROUP_ID,OGR_ROLE_ID) values ('RUNTIME:Adapter','Adapter.Deactivate');
insert into ORC_SEC_GROUP_ROLES_V2 (OGR_GROUP_ID,OGR_ROLE_ID) values ('RUNTIME:Adapter','Adapter.Activate');
insert into ORC_SEC_GROUP_ROLES_V2 (OGR_GROUP_ID,OGR_ROLE_ID) values ('RUNTIME:Deployment','Scenario.Deactivate');
insert into ORC_SEC_GROUP_ROLES_V2 (OGR_GROUP_ID,OGR_ROLE_ID) values ('RUNTIME:Deployment','Scenario.Activate');

insert into ORC_SEC_USER_ROLES_V2 (OUR_USER_ID,OUR_ROLE_ID) values ('RUNTIME:admin','Adapter.Deactivate');
insert into ORC_SEC_USER_ROLES_V2 (OUR_USER_ID,OUR_ROLE_ID) values ('RUNTIME:admin','Adapter.Activate');
insert into ORC_SEC_USER_ROLES_V2 (OUR_USER_ID,OUR_ROLE_ID) values ('RUNTIME:admin','Scenario.Deactivate');
insert into ORC_SEC_USER_ROLES_V2 (OUR_USER_ID,OUR_ROLE_ID) values ('RUNTIME:admin','Scenario.Activate');

commit;

CREATE TABLE ORC_PROCESS_EXT_BUSINESS_KEYS (
  PEK_PROCESS_ID varchar2(255) NOT NULL,
  PEK_BUSINESS_KEY_NAME varchar2(256) NOT NULL,
  PEK_BUSINESS_KEY varchar2(256),
  PRIMARY KEY (PEK_PROCESS_ID, PEK_BUSINESS_KEY_NAME)
);


insert into orc_process_ext_business_keys(PEK_PROCESS_ID,PEK_BUSINESS_KEY,PEK_BUSINESS_KEY_NAME)
  select PRS_PROCESS_ID, PRS_BUSINESS_KEY, PRS_BUSINESS_KEY_NAME 
    from ORC_PROCESS_STATE where PRS_BUSINESS_KEY_NAME is not null;

update orc_process_state 
   set PRS_BUSINESS_KEY = PRS_BUSINESS_KEY_NAME || ': ' || PRS_BUSINESS_KEY 
 where PRS_BUSINESS_KEY_NAME is not null;

commit;

ALTER TABLE ORC_PROCESS_STATE 
 DROP column PRS_BUSINESS_KEY_NAME;
 
ALTER TABLE ORC_PROCESS_STATE MODIFY (
  PRS_BUSINESS_KEY VARCHAR2(1024)
);

ALTER TABLE ORC_WORK_QUEUE
 DROP column CLUSTER_NODE;

alter table ORC_QUEUE_TOPIC_STATE add (
  QTS_NODE_ID VARCHAR2(255) DEFAULT 'ORC'
);

ALTER TABLE ORC_TOPIC_QUEUE
 DROP column CLUSTER_NODE;

ALTER TABLE ORC_ESB_TOPIC_STATE ADD (
 ETS_NODE_ID VARCHAR2(255)
);

insert into ORC_CLUSTER_LOCK(ORC_LOCK_NAME,ORC_LOCK_SCENARIO) values('KPIDATA','GLOBAL');

commit;

DROP INDEX UIDX_ORC_XML_SCHEMA;

CREATE INDEX IDX_ORC_XML_SCHEMA ON ORC_XML_SCHEMA(XSC_NAME, XSC_SCENARIO);

DROP INDEX UIDX_ORC_MESSAGE_TYPE;

CREATE INDEX IDX_ORC_WORK_QUEUE_2 ON ORC_WORK_QUEUE(ID,NODE_TICK,TARGET_NODE);

CREATE INDEX IDX_ORC_PR_RT_STATE ON ORC_PROCESS_RUNTIME_STATE(PRS_PROCESS,PRS_STATE);

CREATE INDEX IDX_ORC_PR_FP_MODEL ON ORC_PROCESS_RUNTIME_STATE(PRS_PROCESSMODELL);

-- ---------------------------------------------------------------------------------------------------
-- Adjust the values for identifier and owner 
-- ---------------------------------------------------------------------------------------------------

update orc_esb_topic_state 
   set ETS_IDENTIFIER = substr( ETS_IDENTIFIER, 39 );
   
update orc_esb_topic_state
   set ETS_OWNER = substr(ETS_IDENTIFIER,2, instr( ETS_IDENTIFIER, '}' ) -2 );
   
update ORC_QUEUE_TOPIC_STATE
   set QTS_IDENTIFIER = substr( QTS_IDENTIFIER, 11, instr( QTS_IDENTIFIER, '[' ) - 12 )
 where QTS_GROUP = 'topic';
   
update ORC_QUEUE_TOPIC_STATE
   set QTS_OWNER = substr(QTS_IDENTIFIER,2, instr( QTS_IDENTIFIER, '}') - 2 )
 where QTS_GROUP = 'topic';
 
update ORC_TOPIC_QUEUE 
   set ORC_TOPIC_ID = substr( ORC_TOPIC_ID, 11, instr( ORC_TOPIC_ID, '[' ) - 12 );
    
update ORC_TOPIC_QUEUE 
   set ORC_TOPIC_OWNER = substr(ORC_TOPIC_ID,2, instr( ORC_TOPIC_ID, '}') - 2 );

commit;
