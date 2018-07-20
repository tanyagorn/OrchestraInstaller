CREATE TABLE ORC_DBS_PAGE
(
  DPA_MESSAGE_ID  VARCHAR2(255 BYTE),
  DPA_ID          NUMBER(10)                    NOT NULL,
  DEL_DATA        BLOB,
  DPA_PAGE_TYPE   NUMBER(10)
);


CREATE INDEX IDX_DBS_PAGE ON ORC_DBS_PAGE (DPA_MESSAGE_ID, DPA_ID);


CREATE TABLE ORC_SEC_USER_CERTIFICATE
(
  OUP_SCENARIO     VARCHAR2(255 BYTE)           NOT NULL,
  OUP_USER_ID      VARCHAR2(255 BYTE)           NOT NULL,
  OUP_CERTIFICATE  BLOB
);


CREATE INDEX IDX_ORC_SEC_USER_CERTIFICATE ON ORC_SEC_USER_CERTIFICATE (OUP_SCENARIO, OUP_USER_ID);

CREATE TABLE ORC_BUSINESS_TRANSACTION
(
  OBT_SCENARIO       VARCHAR2(254 BYTE),
  OBT_OWNER          VARCHAR2(254 BYTE),
  OBT_TA_IDENTIFIER  VARCHAR2(254 BYTE),
  OBT_CREATED        DATE,
  OBT_TYPE           VARCHAR2(1 BYTE)
);


CREATE INDEX IDX_ORC_BUSINESS_TRANSACTION ON ORC_BUSINESS_TRANSACTION (OBT_SCENARIO, OBT_OWNER, OBT_TA_IDENTIFIER);

ALTER TABLE ORC_MESSAGE_PROPERTIES MODIFY(MPR_VALUE VARCHAR2(1023 CHAR));
