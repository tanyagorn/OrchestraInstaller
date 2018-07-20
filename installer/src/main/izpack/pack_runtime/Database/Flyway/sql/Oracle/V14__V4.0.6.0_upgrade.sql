alter table ORC_WORK_QUEUE add 
(
  CLUSTER_NODE   VARCHAR2(255 BYTE),
  TARGET_NODE    VARCHAR2(255 BYTE),
  NODE_TICK      VARCHAR2(64 BYTE)
);

alter table ORC_ADAPTER_STATE add
(
  ADS_NODE_ID        VARCHAR2(255 BYTE),
  ADS_ADAPTER_ID     VARCHAR2(255 BYTE)
);

update ORC_ADAPTER_STATE set ADS_NODE_ID = 'ORC', ADS_ADAPTER_ID = 'ORC/'||ADS_ADAPTER_NAME;

CREATE TABLE ORC_CLUSTER_ENVIRONMENT
(
  CEN_NODE_NAME     VARCHAR2(255 BYTE),
  CEN_IP_ADDRESS    VARCHAR2(64 BYTE),
  CEN_CLUSTER_PORT  NUMBER(10),
  CEN_STATE         VARCHAR2(10 BYTE),
  CEN_TICK          NUMBER(10)                  DEFAULT 0
);

CREATE TABLE ORC_CLUSTER_LOCK
(
  ORC_LOCK_NAME      VARCHAR2(255 BYTE),
  ORC_LOCK_STATE     VARCHAR2(25 BYTE),
  ORC_LOCK_OWNER     VARCHAR2(255 BYTE),
  ORC_LOCK_SCENARIO  VARCHAR2(255 BYTE)
);

Insert into ORC_CLUSTER_LOCK
   (ORC_LOCK_NAME, ORC_LOCK_SCENARIO)
 Values
   ('QUEUE', 'GLOBAL');
Insert into ORC_CLUSTER_LOCK
   (ORC_LOCK_NAME, ORC_LOCK_SCENARIO)
 Values
   ('CLUSTER', 'GLOBAL');
Insert into ORC_CLUSTER_LOCK
   (ORC_LOCK_NAME, ORC_LOCK_SCENARIO)
 Values
   ('EXCLUSIVE', 'GLOBAL');
Insert into ORC_CLUSTER_LOCK
   (ORC_LOCK_NAME, ORC_LOCK_SCENARIO)
 Values
   ('DEPLOYMENT', 'GLOBAL');

CREATE TABLE ORC_CLUSTER_LOCK_STATE
(
  ORC_LOCK_NAME      VARCHAR2(255 BYTE),
  ORC_LOCK_STATE     VARCHAR2(25 BYTE),
  ORC_LOCK_OWNER     VARCHAR2(255 BYTE),
  ORC_LOCK_SCENARIO  VARCHAR2(255 BYTE),
  ORC_LOCK_TICK      VARCHAR2(32 BYTE),
  LOCK_TYPE          VARCHAR2(1 BYTE)
);

CREATE TABLE ORC_GLOBAL_TRANSACTION
(
  OGT_ID           VARCHAR2(255 CHAR)           NOT NULL,
  OGT_TRANS_ID     VARCHAR2(255 CHAR),
  OGT_NODE_ID      VARCHAR2(255 CHAR),
  OGT_STATE        VARCHAR2(255 CHAR),
  OGT_REF_ELEMENT  VARCHAR2(255 CHAR),
  OGT_IS_MASTER    NUMBER(1),
  OTG_COMMAND      BLOB
);

ALTER TABLE ORC_GLOBAL_TRANSACTION ADD (
  PRIMARY KEY
 (OGT_ID));

