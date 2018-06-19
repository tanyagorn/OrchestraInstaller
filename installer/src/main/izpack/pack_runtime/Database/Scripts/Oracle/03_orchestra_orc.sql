CREATE TABLE ORC_ADAPTER_STATE
(
  ADS_ADAPTER_NAME   VARCHAR2(255 CHAR)         NOT NULL,
  ADS_ADAPTER_STATE  NUMBER(10),
  ADS_CHANGED_AT     TIMESTAMP(6)
);

CREATE TABLE ORC_ARCHIVE
(
  ARC_SCENARIO     VARCHAR2(250 BYTE),
  ARC_NAME         VARCHAR2(250 BYTE),
  ARC_DATA         BLOB,
  ARC_DEPLOYED_AT  DATE,
  ARC_UNIQUE_NAME  VARCHAR2(250 BYTE)
);

CREATE TABLE ORC_CHANNEL
(
  CHA_SCENARIO     VARCHAR2(250 BYTE),
  CHA_NAME         VARCHAR2(250 BYTE),
  CHA_DATA         BLOB,
  CHA_DEPLOYED_AT  DATE,
  CHA_UNIQUE_NAME  VARCHAR2(250 BYTE)
);

CREATE TABLE ORC_CONTENT_MAPPING
(
  CMA_SCENARIO     VARCHAR2(250 BYTE),
  CMA_NAME         VARCHAR2(250 BYTE),
  CMA_DATA         BLOB,
  CMA_DEPLOYED_AT  DATE,
  CMA_UNIQUE_NAME  VARCHAR2(250 BYTE)
);

CREATE TABLE ORC_CONTENT_TYPE
(
  CTY_SCENARIO     VARCHAR2(250 BYTE),
  CTY_NAME         VARCHAR2(250 BYTE),
  CTY_DATA         BLOB,
  CTY_DEPLOYED_AT  DATE,
  CTY_UNIQUE_NAME  VARCHAR2(250 BYTE)
);
















CREATE TABLE ORC_EVENT
(
  EVENT_ID    NUMBER(19)                        NOT NULL,
  EVT_DATE    TIMESTAMP(6),
  EVT_TYPE    NUMBER(10),
  EVT_SOURCE  NUMBER(10),
  EVT_ACTION  NUMBER(10)
);








CREATE TABLE ORC_EVENT_PROCESS
(
  EVENT_ID           NUMBER(19)                 NOT NULL,
  EVT_ORDER          NUMBER(19),
  EVT_DATE           TIMESTAMP(6),
  EVT_TYPE           NUMBER(10),
  EVT_SOURCE         NUMBER(10),
  EVT_ACTION         NUMBER(10),
  EVT_PROCESSMODELL  VARCHAR2(255 CHAR),
  EVT_PROCESS        VARCHAR2(255 CHAR),
  EVT_INFO           VARCHAR2(255 CHAR)
);

CREATE TABLE ORC_EVENT_PROCESS_TOKEN
(
  EVENT_ID      NUMBER(19)                      NOT NULL,
  EVT_ORDER     NUMBER(19),
  EVT_DATE      TIMESTAMP(6),
  EVT_TYPE      NUMBER(10),
  EVT_SOURCE    NUMBER(10),
  EVT_ACTION    NUMBER(10),
  EVT_PROCESS   VARCHAR2(255 CHAR),
  EVT_TOKEN     VARCHAR2(255 CHAR),
  EVT_ACTIVITY  NUMBER(10),
  EVT_INFO      VARCHAR2(255 CHAR),
  EVT_PROCESSMODELL  VARCHAR2(255 CHAR)
);







CREATE TABLE ORC_EVENT_SYSTEM
(
  EVENT_ID         NUMBER(19)                   NOT NULL,
  EVT_DATE         TIMESTAMP(6),
  EVT_TYPE         NUMBER(10),
  EVT_SOURCE       NUMBER(10),
  EVT_ACTION       NUMBER(10),
  EVT_DESCRIPTION  VARCHAR2(255 CHAR)
);

CREATE TABLE ORC_EVT_LOCAL_VARIABLES
(
  ID              NUMBER(19)                    NOT NULL,
  EVV_NAME        VARCHAR2(255 CHAR),
  EVV_VALUE       VARCHAR2(255 CHAR),
  EVV_IS_MESSAGE  NUMBER(1),
  EVV_PROCESS_ID  VARCHAR2(255 BYTE)
);

CREATE TABLE ORC_EVT_PROCESS_VARIABLES
(
  ID              NUMBER(19)                    NOT NULL,
  EVV_NAME        VARCHAR2(255 CHAR),
  EVV_VALUE       VARCHAR2(255 CHAR),
  EVV_IS_MESSAGE  NUMBER(1),
  EVV_PROCESS_ID  VARCHAR2(255 BYTE)
);








CREATE TABLE ORC_LANDSCAPE
(
  LAN_SCENARIO     VARCHAR2(250 BYTE),
  LAN_NAME         VARCHAR2(250 BYTE),
  LAN_DATA         BLOB,
  LAN_DEPLOYED_AT  DATE,
  LAN_UNIQUE_NAME  VARCHAR2(250 BYTE)
);

CREATE TABLE ORC_MESSAGE
(
  MES_MESSAGE_ID    VARCHAR2(255 CHAR)          NOT NULL,
  MES_MESSAGE_TYPE  VARCHAR2(255 CHAR),
  MES_CREATED_AT    DATE,
  MES_TYPE          VARCHAR2(255 BYTE)
);

CREATE TABLE ORC_MESSAGE_DATA
(
  MSD_MSG_ID    VARCHAR2(100 BYTE)              NOT NULL,
  MSG_MSG_DATA  BLOB
);

CREATE TABLE ORC_MESSAGE_INTERFACE
(
  MIN_SCENARIO     VARCHAR2(250 BYTE),
  MIN_NAME         VARCHAR2(250 BYTE),
  MIN_DATA         BLOB,
  MIN_DEPLOYED_AT  DATE,
  MIN_UNIQUE_NAME  VARCHAR2(250 BYTE)
);

CREATE TABLE ORC_MESSAGE_MAPPING
(
  MMA_SCENARIO     VARCHAR2(250 BYTE),
  MMA_NAME         VARCHAR2(250 BYTE),
  MMA_DATA         BLOB,
  MMA_DEPLOYED_AT  DATE,
  MMA_UNIQUE_NAME  VARCHAR2(250 BYTE)
);

CREATE TABLE ORC_MESSAGE_PROPERTIES
(
  MESSAGEIDENTIFIER  VARCHAR2(255 CHAR)         NOT NULL,
  MPR_VALUE          VARCHAR2(255 CHAR),
  MPR_KEY            VARCHAR2(255 CHAR)         NOT NULL
);

CREATE TABLE ORC_MESSAGE_TYPE
(
  MTY_SCENARIO     VARCHAR2(250 BYTE),
  MTY_NAME         VARCHAR2(250 BYTE),
  MTY_DATA         BLOB,
  MTY_DEPLOYED_AT  DATE,
  MTY_UNIQUE_NAME  VARCHAR2(250 BYTE)
);

CREATE TABLE ORC_PROCESS_MODE
(
  PCO_PROCESS_NAME  VARCHAR2(255 CHAR)          NOT NULL,
  PCO_TRACE_MODE    NUMBER(10),
  PCO_CHANGED_AT    TIMESTAMP(6)
);

CREATE TABLE ORC_PROCESS_MODELLS
(
  PMO_SCENARIO     VARCHAR2(250 BYTE),
  PMO_NAME         VARCHAR2(250 BYTE),
  PMO_DATA         BLOB,
  PMO_DEPLOYED_AT  DATE,
  PMO_UNIQUE_NAME  VARCHAR2(250 BYTE)
);

CREATE TABLE ORC_PROCESS_SCENARIO
(
  PSC_UNIQUE_NAME  VARCHAR2(250 BYTE),
  PSC_NAME         VARCHAR2(250 BYTE),
  PSC_DESCRIPTION  VARCHAR2(500 BYTE),
  PSC_DEPLOYED_AT  DATE
);

CREATE TABLE ORC_PROCESS_STATE
(
  PRS_PROCESS_ID  VARCHAR2(255 CHAR)            NOT NULL,
  PRS_MODELL_ID   VARCHAR2(255 CHAR),
  PRS_START_TIME  TIMESTAMP(6),
  PRS_END_TIME    TIMESTAMP(6),
  PRS_STATE       NUMBER(10)
);

CREATE TABLE ORC_PROCESS_TOKEN_STATE
(
  PRS_PROCESS_ID    VARCHAR2(255 CHAR)          NOT NULL,
  PRS_TOKEN_ID      VARCHAR2(255 CHAR),
  PRS_PARENT_TOKEN  VARCHAR2(255 CHAR),
  PRS_CUR_ACTIVITY  VARCHAR2(255 CHAR),
  PRS_CREATE_TIME   TIMESTAMP(6),
  PRS_END_TIME      TIMESTAMP(6)
);

CREATE TABLE ORC_PROCESS_WAIT_LIST
(
  RECEIVING_NODE   VARCHAR2(256 BYTE)           NOT NULL,
  TOKEN_REFERENCE  BLOB,
  ID               VARCHAR2(256 BYTE)
);

CREATE TABLE ORC_RECOVERY_DATA
(
  RDA_PROCESS_ID  VARCHAR2(50 BYTE),
  RDA_TOKEN_ID    VARCHAR2(50 BYTE),
  RDA_DATE        DATE,
  RDA_ACTIVITY    NUMBER(10),
  RDA_LOCAL_VARS  BLOB
);
























CREATE TABLE ORC_SEC_USER_STATE
(
  UST_USER_ID      VARCHAR2(255 CHAR)           NOT NULL,
  USR_LOGON_TRIES  NUMBER(10),
  USR_LAST_LOGIN   TIMESTAMP(6),
  USR_STATE        NUMBER(10)
);
















CREATE TABLE ORC_WORK_QUEUE
(
  ITEMTYPE       VARCHAR2(256 BYTE)             NOT NULL,
  DISCRIMINATOR  VARCHAR2(256 BYTE)             NOT NULL,
  CREATEDAT      DATE                           DEFAULT sysdate               NOT NULL,
  WORKOBJECT     BLOB,
  ID             VARCHAR2(30 BYTE),
  ACTION         CHAR(1 BYTE)                   DEFAULT 'W',
  NAME           VARCHAR2(256 BYTE),
  STATE          NUMBER(1)
);

CREATE TABLE ORC_SEC_USER_AUTH_METHODS_V2 
(
  OAM_USER_ID     VARCHAR2(255 BYTE) 	NOT NULL,
  OAM_METHOD     VARCHAR2(255 BYTE) 	NOT NULL
);

CREATE TABLE ORC_SEC_CREDENTIAL_V2
(
  OSC_SCENARIO      VARCHAR2(255 BYTE)          NOT NULL,
  OSC_IDENTIFIER    VARCHAR2(255 BYTE)          NOT NULL,
  OSC_TYPE          VARCHAR2(255 CHAR)          NOT NULL,
  OSC_NAME          VARCHAR2(255 CHAR)          NOT NULL,
  OSC_DESC          VARCHAR2(255 CHAR),
  OSC_EXT_PROVIDER  VARCHAR2(255 BYTE),
  OSC_UNIQUE_ID     VARCHAR2(255 BYTE)
);

CREATE TABLE ORC_SEC_GROUP_ROLES_V2
(
  OGR_GROUP_ID  VARCHAR2(255 BYTE)              NOT NULL,
  OGR_ROLE_ID   VARCHAR2(255 BYTE)              NOT NULL
);


CREATE TABLE ORC_SEC_GROUP_V2
(
  OSG_SCENARIO    VARCHAR2(255 BYTE)            NOT NULL,
  OSG_IDENTIFIER  VARCHAR2(255 BYTE)            NOT NULL,
  OSG_DESC        VARCHAR2(255 BYTE)
);


CREATE TABLE ORC_SEC_KEYSTORE_V2
(
  OTS_NAME  VARCHAR2(255 BYTE)                  NOT NULL,
  OTS_DATA  BLOB
);


CREATE TABLE ORC_SEC_ROLE_V2
(
  OSR_SCENARIO    VARCHAR2(255 BYTE)            NOT NULL,
  OSR_IDENTIFIER  VARCHAR2(255 BYTE)            NOT NULL,
  OSR_DESC        VARCHAR2(255 BYTE)
);


CREATE TABLE ORC_SEC_TRUSTSTORE_V2
(
  OTS_SCENARIO  VARCHAR2(255 BYTE)              NOT NULL,
  OTS_DATA      BLOB
);


CREATE TABLE ORC_SEC_USER_GROUP_V2
(
  OUG_USER_ID   VARCHAR2(255 BYTE)              NOT NULL,
  OUG_GROUP_ID  VARCHAR2(255 BYTE)              NOT NULL
);


CREATE TABLE ORC_SEC_USER_ROLES_V2
(
  OUR_USER_ID  VARCHAR2(255 BYTE)               NOT NULL,
  OUR_ROLE_ID  VARCHAR2(255 BYTE)               NOT NULL
);

CREATE TABLE ORC_USER_PWD_TABLE
(
  OUP_USER_ID   VARCHAR2(255 BYTE)              NOT NULL,
  OUP_PASSWORD  VARCHAR2(255 BYTE)              NOT NULL,
  OUP_SCENARIO  VARCHAR2(255 BYTE)
);


CREATE UNIQUE INDEX PK_ORC_CHANNEL ON ORC_CHANNEL
(CHA_UNIQUE_NAME);


CREATE UNIQUE INDEX UIDX_ORC_CHANNEL ON ORC_CHANNEL
(CHA_SCENARIO, CHA_NAME);


CREATE UNIQUE INDEX PK_ORC_CONTENT_MAPPING ON ORC_CONTENT_MAPPING
(CMA_UNIQUE_NAME);


CREATE UNIQUE INDEX UIDX_ORC_CONTENT_MAPPING ON ORC_CONTENT_MAPPING
(CMA_SCENARIO, CMA_NAME);


CREATE UNIQUE INDEX PK_ORC_CONTENT_TYPE ON ORC_CONTENT_TYPE
(CTY_UNIQUE_NAME);


CREATE UNIQUE INDEX UIDX_ORC_CONTENT_TYPE ON ORC_CONTENT_TYPE
(CTY_NAME, CTY_SCENARIO);


CREATE INDEX IDX_EVENT_PROCESS_PROCESS_ID ON ORC_EVENT_PROCESS
(EVT_PROCESS);


CREATE INDEX IDX_ORC_EVENT_PROCESS_TOKEN_1 ON ORC_EVENT_PROCESS_TOKEN
(EVT_PROCESS);


CREATE INDEX IDX_ORC_EVENT_PROCESS_TOKEN_2 ON ORC_EVENT_PROCESS_TOKEN
(EVT_PROCESS, EVT_TOKEN);


CREATE INDEX IDX_ORC_EVT_LOCAL_VARIABLES_1 ON ORC_EVT_LOCAL_VARIABLES
(ID);


CREATE INDEX IDX_ORC_EVT_LOCAL_VARIABLES_2 ON ORC_EVT_LOCAL_VARIABLES
(EVV_PROCESS_ID);


CREATE INDEX IDX_ORC_EVT_PROCESS_VAR_1 ON ORC_EVT_PROCESS_VARIABLES
(ID);


CREATE INDEX IDX_ORC_EVT_PROCESS_VAR_2 ON ORC_EVT_PROCESS_VARIABLES
(EVV_PROCESS_ID);


CREATE UNIQUE INDEX PK_ORC_LANDSCAPE ON ORC_LANDSCAPE
(LAN_UNIQUE_NAME);


CREATE UNIQUE INDEX UIDX_ORC_LANDSCAPE ON ORC_LANDSCAPE
(LAN_NAME, LAN_SCENARIO);


CREATE UNIQUE INDEX PK_ORC_MESSAGE_INTERFACE ON ORC_MESSAGE_INTERFACE
(MIN_UNIQUE_NAME);


CREATE UNIQUE INDEX PK_ORC_MESSAGE_MAPPING ON ORC_MESSAGE_MAPPING
(MMA_UNIQUE_NAME);


CREATE UNIQUE INDEX UIDX_ORC_MESSAGE_MAPPING ON ORC_MESSAGE_MAPPING
(MMA_NAME, MMA_SCENARIO);


CREATE UNIQUE INDEX PK_ORC_MESSAGE_TYPE ON ORC_MESSAGE_TYPE
(MTY_UNIQUE_NAME);


CREATE UNIQUE INDEX UIDX_ORC_MESSAGE_TYPE ON ORC_MESSAGE_TYPE
(MTY_NAME, MTY_SCENARIO);


CREATE UNIQUE INDEX PK_ORC_PROCESS_MODELLS ON ORC_PROCESS_MODELLS
(PMO_UNIQUE_NAME);


CREATE UNIQUE INDEX UIDX_ORC_PROCESS_MODELLS ON ORC_PROCESS_MODELLS
(PMO_NAME, PMO_SCENARIO);


CREATE UNIQUE INDEX TESTID ON ORC_WORK_QUEUE
(ID);








ALTER TABLE ORC_ADAPTER_STATE ADD (
  PRIMARY KEY
 (ADS_ADAPTER_NAME));


ALTER TABLE ORC_CHANNEL ADD (
  CONSTRAINT PK_ORC_CHANNEL
 PRIMARY KEY
 (CHA_UNIQUE_NAME));


ALTER TABLE ORC_CONTENT_MAPPING ADD (
  CONSTRAINT PK_ORC_CONTENT_MAPPING
 PRIMARY KEY
 (CMA_UNIQUE_NAME));


ALTER TABLE ORC_CONTENT_TYPE ADD (
  CONSTRAINT PK_ORC_CONTENT_TYPE
 PRIMARY KEY
 (CTY_UNIQUE_NAME));


ALTER TABLE ORC_EVENT ADD (
  PRIMARY KEY
 (EVENT_ID));


ALTER TABLE ORC_EVENT_PROCESS ADD (
  PRIMARY KEY
 (EVENT_ID));


ALTER TABLE ORC_EVENT_PROCESS_TOKEN ADD (
  PRIMARY KEY
 (EVENT_ID));


ALTER TABLE ORC_EVENT_SYSTEM ADD (
  PRIMARY KEY
 (EVENT_ID));


ALTER TABLE ORC_LANDSCAPE ADD (
  CONSTRAINT PK_ORC_LANDSCAPE
 PRIMARY KEY
 (LAN_UNIQUE_NAME));


ALTER TABLE ORC_MESSAGE ADD (
  PRIMARY KEY
 (MES_MESSAGE_ID));


ALTER TABLE ORC_MESSAGE_INTERFACE ADD (
  CONSTRAINT PK_ORC_MESSAGE_INTERFACE
 PRIMARY KEY
 (MIN_UNIQUE_NAME));


ALTER TABLE ORC_MESSAGE_MAPPING ADD (
  CONSTRAINT PK_ORC_MESSAGE_MAPPING
 PRIMARY KEY
 (MMA_UNIQUE_NAME));


ALTER TABLE ORC_MESSAGE_PROPERTIES ADD (
  PRIMARY KEY
 (MESSAGEIDENTIFIER, MPR_KEY));


ALTER TABLE ORC_MESSAGE_TYPE ADD (
  CONSTRAINT PK_ORC_MESSAGE_TYPE
 PRIMARY KEY
 (MTY_UNIQUE_NAME));


ALTER TABLE ORC_PROCESS_MODELLS ADD (
  CONSTRAINT PK_ORC_PROCESS_MODELLS
 PRIMARY KEY
 (PMO_UNIQUE_NAME));


ALTER TABLE ORC_PROCESS_STATE ADD (
  PRIMARY KEY
 (PRS_PROCESS_ID));


ALTER TABLE ORC_PROCESS_TOKEN_STATE ADD (
  PRIMARY KEY
 (PRS_PROCESS_ID));












ALTER TABLE ORC_SEC_USER_STATE ADD (
  PRIMARY KEY
 (UST_USER_ID));


ALTER TABLE ORC_WORK_QUEUE ADD (
  CONSTRAINT TESTID
 UNIQUE (ID));


ALTER TABLE ORC_EVT_LOCAL_VARIABLES ADD (
  CONSTRAINT FK1F556AE88BB9BA29 
 FOREIGN KEY (ID) 
 REFERENCES ORC_EVENT_PROCESS_TOKEN (EVENT_ID));


ALTER TABLE ORC_EVT_PROCESS_VARIABLES ADD (
  CONSTRAINT FK21B3EBAC8BB9BA29 
 FOREIGN KEY (ID) 
 REFERENCES ORC_EVENT_PROCESS_TOKEN (EVENT_ID));


ALTER TABLE ORC_MESSAGE_PROPERTIES ADD (
  CONSTRAINT FK590F386AABB30919 
 FOREIGN KEY (MESSAGEIDENTIFIER) 
 REFERENCES ORC_MESSAGE (MES_MESSAGE_ID));

commit;

