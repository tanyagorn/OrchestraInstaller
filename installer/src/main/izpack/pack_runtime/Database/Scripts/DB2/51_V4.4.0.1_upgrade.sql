-- *********************************************************************
-- Create Database Script
-- *********************************************************************
-- Change Log: data/orchestra_4.4.0.1.xml
-- Ran at: 02.05.13 15:59
-- Liquibase version: UNKNOWN
-- *********************************************************************

-- Changeset data/orchestra_4.4.0.1.xml::change-4.4.0.1-01::wli::(Checksum: 6:0c1cc5a5de0dffff4f89a461877b2e8d)
-- ALTER TABLE ORC_MESSAGE_REFERERS MODIFY MRE_REQ_LEASE_TIME NUMBER(38, 0);
ALTER TABLE ORC_MESSAGE_REFERERS ALTER MRE_REQ_LEASE_TIME SET DATA TYPE DECIMAL(31,0);
CALL sysproc.admin_cmd ('REORG TABLE ORC_MESSAGE_REFERERS');
