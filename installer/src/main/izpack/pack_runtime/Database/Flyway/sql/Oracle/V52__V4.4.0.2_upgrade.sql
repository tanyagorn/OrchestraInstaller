-- *********************************************************************
-- Create Database Script
-- *********************************************************************
-- Change Log: data/orchestra_4.4.0.2.xml
-- Ran at: 17.05.13 09:11
-- Liquibase version: UNKNOWN
-- *********************************************************************

-- Changeset data/orchestra_4.4.0.2.xml::change-4.4.0.2-01::wli::(Checksum: 6:22cb2e401c7cd21f5c27f62a47d87e9b)
CREATE TABLE ORC_MESSAGE_REFERERS_UNLOCK (MRE_REFERRER_ID VARCHAR2(255) NOT NULL, MRE_REF_TYPE INTEGER NOT NULL, MRE_FLAG CHAR(1), MRE_REQ_LEASE_TIME NUMBER(38, 0));

-- Changeset data/orchestra_4.4.0.2.xml::change-4.4.0.2-02::wli::(Checksum: 6:ae073803e3d215f04b6d94ab98ca23bd)
ALTER TABLE ORC_MESSAGE_REFERERS_UNLOCK ADD CONSTRAINT PK_ORC_MSG_REFERERS_UNLOCK PRIMARY KEY (MRE_REFERRER_ID, MRE_REF_TYPE);

COMMIT;

