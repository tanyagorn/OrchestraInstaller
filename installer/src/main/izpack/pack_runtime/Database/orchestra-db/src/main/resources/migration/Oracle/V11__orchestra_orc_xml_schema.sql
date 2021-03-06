CREATE TABLE ORC_XML_SCHEMA
(
  XSC_SCENARIO     VARCHAR2(250 BYTE),
  XSC_NAME         VARCHAR2(250 BYTE),
  XSC_DATA         BLOB,
  XSC_DEPLOYED_AT  DATE,
  XSC_UNIQUE_NAME  VARCHAR2(250 BYTE)
);


CREATE UNIQUE INDEX PK_ORC_XML_SCHEMA ON ORC_XML_SCHEMA
(XSC_UNIQUE_NAME);


CREATE UNIQUE INDEX UIDX_ORC_XML_SCHEMA ON ORC_XML_SCHEMA
(XSC_NAME, XSC_SCENARIO);


ALTER TABLE ORC_XML_SCHEMA ADD (
  CONSTRAINT PK_ORC_XML_SCHEMA
 PRIMARY KEY
 (XSC_UNIQUE_NAME));

commit;
