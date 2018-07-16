--  *********************************************************************
--  Create Database Script
--  *********************************************************************
--  Change Log: /opt/liquibase/data/orchestra_4.7.3.0.xml
--  Ran at: 1/22/18 10:17 AM
--  Liquibase version: 2.0.5
--  *********************************************************************

--  Changeset /opt/liquibase/data/orchestra_4.7.3.0.xml::change-4.7.3.0-1::akn::(Checksum: 6:5510f309d15f09574a7dcaecbf75a9d7)
CREATE INDEX IDX_LTA_MSGLISTDATA_TIME ON ORC_LTA_MESSAGE_LIST_DATA(MLI_ARCHIVE_TIME);

CREATE INDEX IDX_LTA_MSGDATA_TIME ON ORC_LTA_MESSAGE_DATA(MES_ARCHIVE_TIME);

CREATE INDEX IDX_LTA_PDATA_TIME ON ORC_LTA_PROCESS_DATA(PRS_ARCHIVE_DATE);

