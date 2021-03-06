
CREATE TABLE ORC_MESSAGE_LIST
(
  MLI_IS_SYSTEM   integer,
  MLI_AREA        VARCHAR(256),
  MLI_IDENTIFIER  VARCHAR(256),
  MLI_ID          integer
)ENGINE= innodb;

CREATE TABLE ORC_MESSAGE_LIST_ENTRY
(
  MLE_INDEX        integer,
  MLE_MESSAGE_REF  VARCHAR(256),
  MLE_ID           integer
)ENGINE= innodb;

CREATE TABLE ORC_MESSAGE_LIST_ENTRY_PROP
(
  MLP_INDEX  integer,
  MLP_KEY    VARCHAR(256),
  MLP_VALUE  VARCHAR(512),
  MLP_ID     integer
)ENGINE= innodb;

insert into ORC_SEQUENCE_COUNTER(SCO_CATEGORY, SCO_COUNTER) values ('MESSAGELIST', 9);
COMMIT;

CREATE TABLE ORC_SVC_DECLARATION
(
  SDC_SCENARIO     VARCHAR(250),
  SDC_NAME         VARCHAR(250),
  SDC_DATA         LONGBLOB,
  SDC_DEPLOYED_AT  TIMESTAMP NULL,
  SDC_UNIQUE_NAME  VARCHAR(250)
)ENGINE= innodb;

CREATE TABLE ORC_SVC_PROVIDER
(
  SPR_SCENARIO     VARCHAR(250),
  SPR_NAME         VARCHAR(250),
  SPR_DATA         LONGBLOB,
  SPR_DEPLOYED_AT  TIMESTAMP NULL,
  SPR_UNIQUE_NAME  VARCHAR(250)
)ENGINE= innodb;

















create table ORC_SEC_USER_PKCS12
(
	OUS_USER_ID 		VARCHAR(255) not null, 
	OUS_SCENARIO 		VARCHAR(255), 
	OUS_KEYPASSWORD 	VARCHAR(255), 
	OUS_STOREPASSWORD 	VARCHAR(255), 
	OUS_PKCS12STORE 	LONGBLOB, 
	primary key (OUS_USER_ID)
)ENGINE= innodb;

create table ORC_SEC_USER_SSH
(
	OUS_USER_ID 		VARCHAR(255) not null, 
	OUS_SCENARIO 		VARCHAR(255), 
	OUS_PASSWORD 		VARCHAR(255), 
	OUS_CERTIFICATE 	LONGBLOB, 
	primary key (OUS_USER_ID)
)ENGINE= innodb;

CREATE TABLE ORC_PRT_PARTNERCONFIG
(
	PRT_SCENARIO     	VARCHAR(250),
	PRT_NAME         	VARCHAR(250),
	PRT_DATA         	LONGBLOB,
	PRT_DEPLOYED_AT  	TIMESTAMP NULL,
	PRT_UNIQUE_NAME  	VARCHAR(250)
)ENGINE= innodb;

Insert into ORC_CLUSTER_LOCK (ORC_LOCK_NAME, ORC_LOCK_STATE, ORC_LOCK_OWNER, ORC_LOCK_SCENARIO) Values  ('MESSAGELIST', NULL, NULL, 'GLOBAL');

ALTER TABLE ORC_RECOVERY_DATA MODIFY  RDA_TOKEN_ID varchar(250);




ALTER TABLE ORC_ARCHIVE MODIFY  ARC_DATA longblob;
ALTER TABLE ORC_CHANNEL MODIFY  CHA_DATA longblob;
ALTER TABLE ORC_CONTENT_MAPPING MODIFY  CMA_DATA longblob;
ALTER TABLE ORC_CONTENT_TYPE MODIFY  CTY_DATA longblob;
ALTER TABLE ORC_LANDSCAPE MODIFY  LAN_DATA longblob;
ALTER TABLE ORC_MESSAGE_INTERFACE MODIFY  MIN_DATA longblob;
ALTER TABLE ORC_MESSAGE_MAPPING MODIFY  MMA_DATA longblob;
ALTER TABLE ORC_MESSAGE_TYPE MODIFY  MTY_DATA longblob;
ALTER TABLE ORC_PROCESS_MODELLS MODIFY  PMO_DATA longblob;
ALTER TABLE ORC_PROCESS_WAIT_LIST MODIFY  TOKEN_REFERENCE longblob;
ALTER TABLE ORC_RECOVERY_DATA MODIFY  RDA_LOCAL_VARS longblob;
ALTER TABLE ORC_WORK_QUEUE MODIFY  WORKOBJECT longblob;
ALTER TABLE ORC_SEC_KEYSTORE_V2 MODIFY  OTS_DATA longblob;
ALTER TABLE ORC_SEC_TRUSTSTORE_V2 MODIFY  OTS_DATA longblob;

ALTER TABLE ORC_GLOBAL_TRANSACTION MODIFY  OTG_COMMAND longblob;
ALTER TABLE ORC_DBS_PAGE MODIFY  DEL_DATA longblob;
ALTER TABLE ORC_SEC_USER_CERTIFICATE MODIFY  OUP_CERTIFICATE longblob;
ALTER TABLE ORC_PROCESS_FIFO_SCHEDULE MODIFY  PFS_VARIABLES longblob;

ALTER TABLE QRTZ_CALENDARS MODIFY  CALENDAR longblob not null;
ALTER TABLE QRTZ_JOB_DETAILS MODIFY  JOB_DATA longblob;
ALTER TABLE QRTZ_TRIGGERS MODIFY  JOB_DATA longblob;
ALTER TABLE QRTZ_BLOB_TRIGGERS MODIFY  BLOB_DATA longblob;

ALTER TABLE ORC_XML_SCHEMA MODIFY  XSC_DATA longblob;


COMMIT;
