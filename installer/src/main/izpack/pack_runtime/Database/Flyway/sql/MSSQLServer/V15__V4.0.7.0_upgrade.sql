
CREATE TABLE ORC_DBS_PAGE
(
  DPA_MESSAGE_ID  varchar(255),
  DPA_ID          INTEGER                    NOT NULL,
  DEL_DATA        IMAGE,
  DPA_PAGE_TYPE   INTEGER
);


CREATE INDEX IDX_DBS_PAGE ON ORC_DBS_PAGE (DPA_MESSAGE_ID, DPA_ID);


CREATE TABLE ORC_SEC_USER_CERTIFICATE
(
  OUP_SCENARIO     varchar(255)           NOT NULL,
  OUP_USER_ID      varchar(255)           NOT NULL,
  OUP_CERTIFICATE  IMAGE
);


CREATE INDEX IDX_ORC_SEC_USER_CERTIFICATE ON ORC_SEC_USER_CERTIFICATE (OUP_SCENARIO, OUP_USER_ID);

CREATE TABLE ORC_BUSINESS_TRANSACTION
(
  OBT_SCENARIO       VARCHAR(254),
  OBT_OWNER          VARCHAR(254),
  OBT_TA_IDENTIFIER  VARCHAR(254),
  OBT_CREATED        DATETIME,
  OBT_TYPE           VARCHAR(1)
);


CREATE INDEX IDX_ORC_BUSINESS_TRANSACTION ON ORC_BUSINESS_TRANSACTION (OBT_SCENARIO, OBT_OWNER, OBT_TA_IDENTIFIER);

ALTER TABLE ORC_MESSAGE_PROPERTIES alter column MPR_VALUE varchar(1023);