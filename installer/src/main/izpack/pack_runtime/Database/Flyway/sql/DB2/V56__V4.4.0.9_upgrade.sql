-- *********************************************************************
-- Create Database Script
-- *********************************************************************
-- Change Log: /opt/liquibase/data/orchestra_4.4.0.9.xml
-- Ran at: 06.08.13 15:09
-- Liquibase version: UNKNOWN
-- *********************************************************************

-- Changeset /opt/liquibase/data/orchestra_4.4.0.9.xml::change-4.4.0.9-01::akn::(Checksum: 6:92f8adf02583e49fcbd0da5cf538bc1e)
ALTER TABLE ORC_LTA_PROCESS_STATE ADD CONSTRAINT PK_LTA_PRO_STA_ID PRIMARY KEY (PRS_PROCESS_ID);
CALL sysproc.admin_cmd ('REORG TABLE ORC_LTA_PROCESS_STATE');

ALTER TABLE ORC_LTA_PROCESS_EXT_BSNS_KEYS ADD CONSTRAINT PK_LTA_EXT_BK PRIMARY KEY (PEK_PROCESS_ID, PEK_BUSINESS_KEY_NAME);
CALL sysproc.admin_cmd ('REORG TABLE ORC_LTA_PROCESS_EXT_BSNS_KEYS');

CREATE INDEX IDX_LTA_BUSINESS_KEY_PROCID ON ORC_LTA_PROCESS_EXT_BSNS_KEYS(PEK_PROCESS_ID);
CALL sysproc.admin_cmd ('REORG TABLE ORC_LTA_PROCESS_EXT_BSNS_KEYS');

CREATE INDEX IDX_LTA_PROCESS_ARCHIVE_DATE ON ORC_LTA_PROCESS_STATE(PRS_ARCHIVE_DATE);
CALL sysproc.admin_cmd ('REORG TABLE ORC_LTA_PROCESS_STATE');

