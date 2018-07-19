-- *********************************************************************
-- Create Database Script
-- *********************************************************************
-- Change Log: data/orchestra_4.4.0.1.xml
-- Ran at: 02.05.13 17:59
-- Liquibase version: UNKNOWN
-- *********************************************************************


-- Changeset data/orchestra_4.4.0.1.xml::change-4.4.0.1-01::wli::(Checksum: 6:0c1cc5a5de0dffff4f89a461877b2e8d)
ALTER TABLE [ORC_MESSAGE_REFERERS] ALTER COLUMN [MRE_REQ_LEASE_TIME] BIGINT
GO
