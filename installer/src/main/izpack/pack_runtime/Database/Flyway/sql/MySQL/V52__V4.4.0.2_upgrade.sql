--  *********************************************************************
--  Create Database Script
--  *********************************************************************
--  Change Log: data/orchestra_4.4.0.2.xml
--  Ran at: 17.05.13 11:11
--  For: jdbc:mysql://localhost:3306/orchestra5
--  Liquibase version: UNKNOWN
--  *********************************************************************

--  Changeset data/orchestra_4.4.0.2.xml::change-4.4.0.2-01::wli::(Checksum: 6:22cb2e401c7cd21f5c27f62a47d87e9b)
CREATE TABLE ORC_MESSAGE_REFERERS_UNLOCK (MRE_REFERRER_ID VARCHAR(255) NOT NULL, MRE_REF_TYPE INT NOT NULL, MRE_FLAG CHAR(1) NULL, MRE_REQ_LEASE_TIME BIGINT NULL);

--  Changeset data/orchestra_4.4.0.2.xml::change-4.4.0.2-02::wli::(Checksum: 6:ae073803e3d215f04b6d94ab98ca23bd)
ALTER TABLE ORC_MESSAGE_REFERERS_UNLOCK ADD PRIMARY KEY (MRE_REFERRER_ID, MRE_REF_TYPE);

