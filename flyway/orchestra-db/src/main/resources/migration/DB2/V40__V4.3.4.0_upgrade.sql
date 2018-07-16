/* Updatescript V4.3.4.0 for DB2 */
-- Renaming a Column in DB2 ---
	-- Create a temporay copy of orginal table
CREATE TABLE TMP_ORC_MESSAGE_LIST  
(
  MLI_IS_SYSTEM INT,
  MLI_AREA  VARCHAR(256),
  MLI_IDENTIFIER VARCHAR(256),
  MLI_ID BIGINT
);
	-- Export Data to Temp_Table
INSERT INTO TMP_ORC_MESSAGE_LIST 
	SELECT * FROM ORC_MESSAGE_LIST;
	-- Drop the orginal Table 
DROP TABLE ORC_MESSAGE_LIST;  
	-- Recreate the Table
CREATE TABLE ORC_MESSAGE_LIST  
(
  MLI_TYPE INT,
  MLI_AREA  VARCHAR(256),
  MLI_IDENTIFIER VARCHAR(256),
  MLI_ID BIGINT  
);
	-- Import Data from Temp_Table
INSERT INTO ORC_MESSAGE_LIST 
	SELECT * FROM TMP_ORC_MESSAGE_LIST;
	-- Recreate Indexes
CREATE INDEX IDX_ORC_MSG_LIST_ID ON ORC_MESSAGE_LIST(MLI_ID);
ALTER TABLE ORC_MESSAGE_LIST ADD MLI_CREATED_AT TIMESTAMP;
DROP TABLE TMP_ORC_MESSAGE_LIST;
--
ALTER TABLE ORC_MESSAGE_LIST_ENTRY ALTER COLUMN MLE_ID SET DATA TYPE BIGINT;
 
ALTER TABLE ORC_MESSAGE_LIST_ENTRY_PROP ALTER COLUMN MLP_ID SET DATA TYPE BIGINT;
 
ALTER TABLE ORC_MESSAGE_LIST_INDEX ALTER COLUMN MLI_ID SET DATA TYPE BIGINT;

ALTER TABLE ORC_MESSAGE_LIST_INDEX ALTER COLUMN MLI_REFERENCE SET DATA TYPE VARCHAR(256);
ALTER TABLE ORC_MESSAGE_LIST_ENTRY ALTER COLUMN MLE_REFERENCE SET DATA TYPE VARCHAR(256);
ALTER TABLE ORC_MESSAGE_LIST_ENTRY_PROP ALTER COLUMN MLP_REFERENCE SET DATA TYPE VARCHAR(256);
      
-- Alter Table --- 
DROP TABLE ORC_MESSAGE_REFERERS;

CREATE TABLE ORC_MESSAGE_REFERERS  
(
  MRE_OBJECT_ID  VARCHAR(255),
  MRE_REFERRER_ID VARCHAR(255),
  MRE_REF_TYPE INT,
  MRE_OBJECT_TYPE INT,
  MRE_MESSAGELIST_ID BIGINT
);

CREATE INDEX IDX_ORC_MSG_REFERRER_MESSAGE_ID ON ORC_MESSAGE_REFERERS(MRE_OBJECT_ID);

CREATE INDEX IDX_ORC_MSG_REFERRER_PROCESS_ID ON ORC_MESSAGE_REFERERS(MRE_REFERRER_ID);
--

CREATE TABLE ORC_PROCESSINSTANCE_STATE 
(
  		PRS_ID            VARCHAR(255) NOT NULL,
  		PRS_DATA          blob,
  		PRS_PROCESSMODELL VARCHAR(255) DEFAULT NULL
 );

CREATE INDEX IDX_ORC_PROCESINST_STATE_ID ON ORC_PROCESSINSTANCE_STATE(PRS_ID);

ALTER TABLE ORC_EVENT_PROCESS_TOKEN ADD EVT_ORCHESTRA_LINK VARCHAR(254);

CREATE TABLE ORC_USERSCENARIOMAP
(
  USER_ID      VARCHAR(254)               NOT NULL,
  SCENARIO_ID  VARCHAR(254)               NOT NULL
);

ALTER TABLE ORC_USERSCENARIOMAP 
	ADD CONSTRAINT P_USER_SCENARIO PRIMARY KEY (USER_ID, SCENARIO_ID);
 
INSERT INTO ORC_SEC_ROLE_V2 (OSR_SCENARIO,OSR_IDENTIFIER,OSR_DESC) 
     VALUES ('RUNTIME','RUNTIME:Scenario.SuperUser',null);

INSERT INTO ORC_SEC_USER_ROLES_V2 
    SELECT
        OSC_UNIQUE_ID,'Scenario.SuperUser'
    FROM
        ORC_SEC_CREDENTIAL_V2
    WHERE OSC_SCENARIO = 'RUNTIME'; 

ALTER TABLE ORC_PROCESS_RUNTIME_STATE ADD PRS_GLOBAL_TID VARCHAR(64);

ALTER TABLE ORC_PROCESS_RUNTIME_STATE ADD PRS_IS_STANDALONE INT DEFAULT NULL;

CREATE TABLE ORC_TRANSACTION 
(
  TRA_TAID        VARCHAR(64) NOT NULL,
  TRA_CREATE_DATE TIMESTAMP   NOT NULL,
  TRA_STATE       INT         NOT NULL,
  PRIMARY KEY (TRA_TAID) 
);


CREATE TABLE ORC_TRANSACTION_LOG_ENTRY 
(
  TLE_TAID    VARCHAR(64) DEFAULT NULL,
  TLE_ACTION  VARCHAR(64) DEFAULT NULL,
  TLE_INFO    VARCHAR(64) DEFAULT NULL,
  TLE_MODE    INT    	  DEFAULT NULL,
  TLE_ORDER   bigint	  DEFAULT NULL 
);
CREATE INDEX IDX_ORC_TRANSACTION_LOG_ENTRY ON ORC_TRANSACTION_LOG_ENTRY(TLE_TAID);

CREATE TABLE ORC_TRANSACTION_BRANCH 
(
  TBR_TAID 	   VARCHAR(64) DEFAULT NULL,
  TBR_TYP      VARCHAR(64) DEFAULT NULL,
  TBR_BRANCH   VARCHAR(64) DEFAULT NULL,
  TBR_DATA     blob
);
CREATE INDEX IDX_ORC_TRANSACTION_BRANCH ON ORC_TRANSACTION_BRANCH(TBR_TAID);

CREATE TABLE ORC_ESB_SIGNAL_STATE 
(
	EST_IDENTIFIER	VARCHAR(64),
	EST_DATE		TIMESTAMP,
	EST_NODE		VARCHAR(64)
);

CREATE TABLE ORC_JAVA_CLASS 
(
  JCL_SCENARIO     VARCHAR(250),
  JCL_NAME         VARCHAR(250),
  JCL_DATA         BLOB,
  JCL_DEPLOYED_AT  TIMESTAMP, 
  JCL_UNIQUE_NAME  VARCHAR(250) NOT NULL
);

CREATE UNIQUE INDEX UIDX_ORC_JAVA_CLASS ON ORC_JAVA_CLASS (JCL_SCENARIO, JCL_NAME);


ALTER TABLE ORC_JAVA_CLASS 
	ADD CONSTRAINT PK_ORC_JAVA_CLASS PRIMARY KEY(JCL_UNIQUE_NAME);

COMMIT;
