
ALTER TABLE ORC_MESSAGE_LIST_ENTRY 
        ADD MLE_REFERENCE    VARCHAR(40);

UPDATE ORC_MESSAGE_LIST_ENTRY 
   SET MLE_REFERENCE = MLE_ID || '_' || MLE_INDEX;

ALTER TABLE ORC_MESSAGE_LIST_ENTRY_PROP 
        ADD MLP_REFERENCE    VARCHAR(40);

UPDATE ORC_MESSAGE_LIST_ENTRY_PROP 
   SET MLP_REFERENCE = MLP_ID || '_' || MLP_INDEX;

ALTER TABLE ORC_MESSAGE_LIST_ENTRY_PROP 
       DROP COLUMN MLP_INDEX;

CREATE TABLE ORC_MESSAGE_LIST_INDEX 
(
	MLI_ID           integer,
	MLI_REFERENCE    VARCHAR(40),
	MLI_INDEX        integer
);

INSERT INTO ORC_MESSAGE_LIST_INDEX( MLI_ID, MLI_REFERENCE, MLI_INDEX ) 
SELECT MLE_ID, MLE_REFERENCE, MLE_INDEX 
  FROM ORC_MESSAGE_LIST_ENTRY;

ALTER TABLE ORC_MESSAGE_LIST_ENTRY 
DROP COLUMN MLE_INDEX;

INSERT INTO ORC_SEC_ROLE_V2 (OSR_SCENARIO, OSR_IDENTIFIER, OSR_DESC)
VALUES ('RUNTIME', 'RUNTIME:WEBDAV.SUPERUSER', NULL);

CREATE TABLE ORC_PRS_DESCRIPTION
(
  PRS_SCENARIO     VARCHAR(250),
  PRS_NAME         VARCHAR(250),
  PRS_DATA         LONGBLOB,
  PRS_DEPLOYED_AT  TIMESTAMP NULL,
  PRS_UNIQUE_NAME  VARCHAR(250) NOT NULL
);


CREATE UNIQUE INDEX PK_ORC_PRS_DESCRIPTION ON ORC_PRS_DESCRIPTION
(PRS_UNIQUE_NAME);


CREATE UNIQUE INDEX UIDX_ORC_PRS_DESCRIPTION ON ORC_PRS_DESCRIPTION
(PRS_SCENARIO, PRS_NAME);


ALTER TABLE ORC_PRS_DESCRIPTION ADD (
  CONSTRAINT PK_ORC_PRS_DESCRIPTION
 PRIMARY KEY
 (PRS_UNIQUE_NAME));

