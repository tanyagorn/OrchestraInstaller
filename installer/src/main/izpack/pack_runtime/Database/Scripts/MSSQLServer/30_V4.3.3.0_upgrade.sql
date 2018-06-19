
alter table ORC_PROCESS_STATE add PRS_PROCESS_MODEL VARCHAR(255);

create table ORC_PROCESS_RUNTIME_STATE (
	PRS_ID VARCHAR(255) not null, 
	PRS_START_EVENT INT, 
	PRS_STATE INT, 
	PRS_VARIABLES VARBINARY(MAX), 
	PRS_PROCESS VARCHAR(255), 
	PRS_PROCESSMODELL VARCHAR(255), 
	PRS_NODE_ID VARCHAR(255),
    CONSTRAINT PK_ORC_PR_RT_STATE PRIMARY KEY (PRS_ID)
);

alter table ORC_MONITOR_SETTINGS add ORC_STAGE_LABEL_SIZE INT;
alter table ORC_MONITOR_SETTINGS add ORC_STAGE_LABEL_X INT;
alter table ORC_MONITOR_SETTINGS add ORC_STAGE_LABEL_Y INT;

GO

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

GO

CREATE TABLE ORC_PROCESS_EXT_BUSINESS_KEYS (
  PEK_PROCESS_ID VARCHAR(255) NOT NULL,
  PEK_BUSINESS_KEY_NAME VARCHAR(255) NOT NULL,
  PEK_BUSINESS_KEY VARCHAR(255),
  CONSTRAINT PK_ORC_PR_EXT_BK PRIMARY KEY (PEK_PROCESS_ID, PEK_BUSINESS_KEY_NAME)
);



insert into orc_process_ext_business_keys(PEK_PROCESS_ID,PEK_BUSINESS_KEY,PEK_BUSINESS_KEY_NAME)
  select PRS_PROCESS_ID, PRS_BUSINESS_KEY, PRS_BUSINESS_KEY_NAME 
    from ORC_PROCESS_STATE where PRS_BUSINESS_KEY_NAME is not null;

update orc_process_state 
   set PRS_BUSINESS_KEY = PRS_BUSINESS_KEY_NAME + ': ' + PRS_BUSINESS_KEY 
 where PRS_BUSINESS_KEY_NAME is not null;

GO

ALTER TABLE ORC_PROCESS_STATE 
 DROP column PRS_BUSINESS_KEY_NAME;

GO

ALTER TABLE ORC_PROCESS_STATE ALTER COLUMN PRS_BUSINESS_KEY VARCHAR(1024);

GO

ALTER TABLE ORC_WORK_QUEUE
 DROP column CLUSTER_NODE;

GO

alter table ORC_QUEUE_TOPIC_STATE add QTS_NODE_ID VARCHAR(255) DEFAULT 'ORC';


ALTER TABLE ORC_TOPIC_QUEUE
 DROP column CLUSTER_NODE;

GO

ALTER TABLE ORC_ESB_TOPIC_STATE ADD ETS_NODE_ID VARCHAR(255);

GO

insert into ORC_CLUSTER_LOCK(ORC_LOCK_NAME,ORC_LOCK_SCENARIO) values('KPIDATA','GLOBAL');

GO

DROP INDEX UIDX_ORC_XML_SCHEMA ON ORC_XML_SCHEMA;

CREATE INDEX IDX_ORC_XML_SCHEMA ON ORC_XML_SCHEMA(XSC_NAME, XSC_SCENARIO);

DROP INDEX UIDX_ORC_MESSAGE_TYPE ON ORC_MESSAGE_TYPE;

CREATE INDEX IDX_ORC_WORK_QUEUE_2 ON ORC_WORK_QUEUE(ID,NODE_TICK,TARGET_NODE);

CREATE INDEX IDX_ORC_PR_RT_STATE ON ORC_PROCESS_RUNTIME_STATE(PRS_PROCESS,PRS_STATE);

CREATE INDEX IDX_ORC_PR_FP_MODEL ON ORC_PROCESS_RUNTIME_STATE(PRS_PROCESSMODELL);

GO

-- ---------------------------------------------------------------------------------------------------
-- Adjust the values for identifier and owner 
-- ---------------------------------------------------------------------------------------------------

update orc_esb_topic_state 
   set ETS_IDENTIFIER = substring( ETS_IDENTIFIER, 39, LEN(ETS_IDENTIFIER)-38);
   
update orc_esb_topic_state
   set ETS_OWNER = substring(ETS_IDENTIFIER,2, CHARINDEX(  '}', ETS_IDENTIFIER) -2 );
   
update ORC_QUEUE_TOPIC_STATE
   set QTS_IDENTIFIER = substring( QTS_IDENTIFIER, 11, CHARINDEX( '[', QTS_IDENTIFIER ) - 12 )
 where QTS_GROUP = 'topic';
   
update ORC_QUEUE_TOPIC_STATE
   set QTS_OWNER = substring(QTS_IDENTIFIER,2, CHARINDEX( '}', QTS_IDENTIFIER ) - 2 )
 where QTS_GROUP = 'topic';
 
update ORC_TOPIC_QUEUE 
   set ORC_TOPIC_ID = substring( ORC_TOPIC_ID, 11, CHARINDEX( '[', ORC_TOPIC_ID ) - 12 );
    
update ORC_TOPIC_QUEUE 
   set ORC_TOPIC_OWNER = substring(ORC_TOPIC_ID,2, CHARINDEX( '}', ORC_TOPIC_ID ) - 2 );   

GO
