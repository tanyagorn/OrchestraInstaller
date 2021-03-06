ALTER TABLE ORC_MESSAGE_LIST
  RENAME COLUMN MLI_IS_SYSTEM TO MLI_TYPE;

ALTER TABLE ORC_MESSAGE_LIST
    ADD (MLI_CREATED_AT  DATE);

ALTER TABLE ORC_MESSAGE_LIST
	MODIFY( MLI_TYPE INTEGER);
ALTER TABLE ORC_MESSAGE_LIST
     MODIFY( MLI_ID NUMBER(38));
 
 ALTER TABLE ORC_MESSAGE_LIST_ENTRY
      MODIFY( MLE_ID NUMBER(38));
 
 ALTER TABLE ORC_MESSAGE_LIST_ENTRY  
  MODIFY( MLE_REFERENCE VARCHAR(256));

ALTER TABLE ORC_MESSAGE_LIST_ENTRY_PROP
      MODIFY( MLP_ID NUMBER(38));
	  
ALTER TABLE ORC_MESSAGE_LIST_ENTRY_PROP 
	MODIFY( MLP_REFERENCE VARCHAR(256));
 
 ALTER TABLE ORC_MESSAGE_LIST_INDEX
      MODIFY( MLI_ID NUMBER(38));

ALTER TABLE ORC_MESSAGE_LIST_INDEX
      MODIFY( MLI_REFERENCE VARCHAR(256));

TRUNCATE TABLE ORC_MESSAGE_REFERERS;

ALTER TABLE ORC_MESSAGE_REFERERS
    RENAME COLUMN MRE_MESSAGE_ID TO MRE_OBJECT_ID;

ALTER TABLE ORC_MESSAGE_REFERERS
    RENAME COLUMN MRE_PROCESS_ID TO MRE_REFERRER_ID;
                    
ALTER TABLE ORC_MESSAGE_REFERERS         
      ADD (  MRE_REF_TYPE INTEGER,
             MRE_OBJECT_TYPE INTEGER,
             MRE_MESSAGELIST_ID NUMBER(38)
          ); 


CREATE TABLE ORC_PROCESSINSTANCE_STATE (
          PRS_ID            VARCHAR2(255 BYTE) NOT NULL,
          PRS_DATA          BLOB,
          PRS_PROCESSMODELL VARCHAR2(255 BYTE) DEFAULT NULL
);

create index IDX_ORC_PROCESINST_STATE_ID on ORC_PROCESSINSTANCE_STATE(PRS_ID);



alter table ORC_EVENT_PROCESS_TOKEN
  add EVT_ORCHESTRA_LINK VARCHAR2(254 BYTE);


CREATE TABLE ORC_USERSCENARIOMAP
(
  USER_ID      VARCHAR2(254 BYTE)               NOT NULL,
  SCENARIO_ID  VARCHAR2(254 BYTE)               NOT NULL
);

ALTER TABLE ORC_USERSCENARIOMAP ADD CONSTRAINT P_USER_SCENARIO
 PRIMARY KEY(USER_ID, SCENARIO_ID);
 
insert into ORC_SEC_ROLE_V2 (OSR_SCENARIO,OSR_IDENTIFIER,OSR_DESC) 
     values ('RUNTIME','RUNTIME:Scenario.SuperUser',null);

INSERT INTO ORC_SEC_USER_ROLES_V2 
    SELECT
        OSC_UNIQUE_ID,'Scenario.SuperUser'
    FROM
        ORC_SEC_CREDENTIAL_V2
    WHERE OSC_SCENARIO = 'RUNTIME';

alter table ORC_PROCESS_RUNTIME_STATE 
        add PRS_GLOBAL_TID VARCHAR2(64 BYTE);
		
ALTER TABLE ORC_PROCESS_RUNTIME_STATE 
  ADD PRS_IS_STANDALONE INTEGER DEFAULT NULL;

CREATE TABLE ORC_TRANSACTION (
  TRA_TAID        VARCHAR2(64 BYTE) NOT NULL,
  TRA_CREATE_DATE DATE   NOT NULL,
  TRA_STATE       INTEGER      NOT NULL,
  constraint PK_TRANSACTION PRIMARY KEY (TRA_TAID)
);


CREATE TABLE ORC_TRANSACTION_LOG_ENTRY (
  TLE_TAID    VARCHAR2(64 BYTE) DEFAULT NULL,
  TLE_ACTION  VARCHAR2(64 BYTE) DEFAULT NULL,
  TLE_INFO    VARCHAR2(64 BYTE) DEFAULT NULL,
  TLE_MODE    INTEGER     DEFAULT NULL,
  TLE_ORDER   NUMBER(38)  DEFAULT NULL
);

create index IDX_ORC_TRANSACTION_LOG_ENTRY on ORC_TRANSACTION_LOG_ENTRY(TLE_TAID);


CREATE TABLE ORC_TRANSACTION_BRANCH (
  TBR_TAID        VARCHAR2(64 BYTE) DEFAULT NULL,
  TBR_TYP      VARCHAR2(64 BYTE) DEFAULT NULL,
  TBR_BRANCH   VARCHAR2(64 BYTE) DEFAULT NULL,
  TBR_DATA     blob
);
create index IDX_ORC_TRANSACTION_BRANCH on ORC_TRANSACTION_BRANCH(TBR_TAID);


CREATE TABLE ORC_ESB_SIGNAL_STATE (
    EST_IDENTIFIER    VARCHAR2(64 BYTE),
    EST_DATE        DATE,
    EST_NODE        VARCHAR2(64 BYTE)
);


CREATE TABLE ORC_JAVA_CLASS (
  JCL_SCENARIO varchar2(250 BYTE) DEFAULT NULL,
  JCL_NAME varchar2(250 BYTE) DEFAULT NULL,
  JCL_DATA BLOB,
  JCL_DEPLOYED_AT DATE  DEFAULT SYSDATE  NOT NULL,
  JCL_UNIQUE_NAME varchar2(250 BYTE) NOT NULL,
  constraint PK_ORC_JAVA_CLASS PRIMARY KEY (JCL_UNIQUE_NAME)
);

create index IDX_ORC_JAVA_CLASS on ORC_JAVA_CLASS(JCL_SCENARIO, JCL_NAME);
Commit;
