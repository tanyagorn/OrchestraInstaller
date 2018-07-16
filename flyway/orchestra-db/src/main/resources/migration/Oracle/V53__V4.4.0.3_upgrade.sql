-- *********************************************************************
-- Create Database Script
-- *********************************************************************
-- Change Log: data/orchestra_4.4.0.3.xml
-- Ran at: 03.06.13 09:55
-- For: jdbc:oracle:thin:@DIONE:1521:EPI
-- Liquibase version: UNKNOWN
-- *********************************************************************

-- Changeset data/orchestra_4.4.0.3.xml::change-4.4.0.3-01::wli::(Checksum: 6:91587b8a67c8c14feb1e2868ec34fc5b)
CREATE INDEX IDX_LTA_PROCESS_BUS_EVENT ON ORC_LTA_PROCESS_BUS_EVENT(LPB_PROCESSID);

-- Changeset data/orchestra_4.4.0.3.xml::change-4.4.0.3-02::wli::(Checksum: 6:9f6bd3ee1c7875a513731ba2734cc1a9)
CREATE TABLE ORC_LTA_MESSAGE_LIST (MLI_IDENTIFIER VARCHAR2(256) NOT NULL, MLI_ARCHIVE_TIME TIMESTAMP, MES_ARCHIVE_INFO VARCHAR2(255));

-- Changeset data/orchestra_4.4.0.3.xml::change-4.4.0.3-03::wli::(Checksum: 6:eff89bca51084f899db725e4f0670c6d)
ALTER TABLE ORC_LTA_MESSAGE_LIST ADD CONSTRAINT PK_LTA_MESSAGE_LIST PRIMARY KEY (MLI_IDENTIFIER);

-- Changeset data/orchestra_4.4.0.3.xml::change-4.4.0.3-04::wli::(Checksum: 6:8f03119efb46a836daf6f82995a22ef5)
CREATE INDEX IDX_LTA_MSG_LIST_DATE ON ORC_LTA_MESSAGE_LIST(MLI_ARCHIVE_TIME);

COMMIT;

