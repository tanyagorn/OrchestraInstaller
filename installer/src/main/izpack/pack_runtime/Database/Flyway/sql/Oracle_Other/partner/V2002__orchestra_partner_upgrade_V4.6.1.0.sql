-- *********************************************************************
-- Create Database Script
-- *********************************************************************
-- Change Log: /opt/liquibase/data/orchestra_4.6.1.0_partner.xml
-- Ran at: 3/17/17 9:56 AM
-- Liquibase version: 2.0.5
-- *********************************************************************

-- Changeset /opt/liquibase/data/orchestra_4.6.1.0_partner.xml::partner-4.6.1.0-01::akn::(Checksum: 6:5f2f623f782769cb7f1853a43eef3e42)
ALTER TABLE ORC_PARTNER ADD PAR_PARTNER_MODIFIED INTEGER DEFAULT '0' NOT NULL;

COMMIT;

