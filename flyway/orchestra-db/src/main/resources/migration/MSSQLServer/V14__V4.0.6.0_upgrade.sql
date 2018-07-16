
ALTER TABLE ORC_WORK_QUEUE add CLUSTER_NODE varchar(255);
GO
ALTER TABLE ORC_WORK_QUEUE add TARGET_NODE varchar(255);
GO
ALTER TABLE ORC_WORK_QUEUE add NODE_TICK varchar(64);
GO
ALTER TABLE ORC_ADAPTER_STATE add ADS_NODE_ID varchar(255);
GO
ALTER TABLE ORC_ADAPTER_STATE add ADS_ADAPTER_ID varchar(255);
GO
UPDATE ORC_ADAPTER_STATE set ADS_NODE_ID = 'ORC', ADS_ADAPTER_ID = 'ORC/' + ADS_ADAPTER_NAME;
GO
CREATE TABLE ORC_CLUSTER_ENVIRONMENT
(
  CEN_NODE_NAME     VARCHAR(255 ),
  CEN_IP_ADDRESS    VARCHAR(64 ),
  CEN_CLUSTER_PORT  INTEGER,
  CEN_STATE         VARCHAR(10 ),
  CEN_TICK         INTEGER                  DEFAULT 0
);

CREATE TABLE ORC_CLUSTER_LOCK
(
  ORC_LOCK_NAME      VARCHAR(255 ),
  ORC_LOCK_STATE     VARCHAR(25 ),
  ORC_LOCK_OWNER     VARCHAR(255 ),
  ORC_LOCK_SCENARIO  VARCHAR(255 )
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
  ORC_LOCK_NAME      VARCHAR(255 ),
  ORC_LOCK_STATE     VARCHAR(25 ),
  ORC_LOCK_OWNER     VARCHAR(255 ),
  ORC_LOCK_SCENARIO  VARCHAR(255 ),
  ORC_LOCK_TICK      VARCHAR(32 ),
  LOCK_TYPE          VARCHAR(1 )
);

CREATE TABLE ORC_GLOBAL_TRANSACTION
(
  OGT_ID           VARCHAR(255)           NOT NULL,
  OGT_TRANS_ID     VARCHAR(255),
  OGT_NODE_ID      VARCHAR(255),
  OGT_STATE        VARCHAR(255),
  OGT_REF_ELEMENT  VARCHAR(255),
  OGT_IS_MASTER    INTEGER,
  OTG_COMMAND      IMAGE
);


CREATE UNIQUE INDEX PK_ORC_GLOBAL_TRANSACTION ON ORC_GLOBAL_TRANSACTION
(OGT_ID);
