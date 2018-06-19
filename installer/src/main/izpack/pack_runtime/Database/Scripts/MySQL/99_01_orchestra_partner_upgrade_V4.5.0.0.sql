--  *********************************************************************
--  Create Database Script
--  *********************************************************************
--  Change Log: /opt/liquibase/data/orchestra_master_4.5.0.0_partner.xml
--  Ran at: 28.04.14 10:44
--  Liquibase version: 2.0.5
--  *********************************************************************

--  Changeset /opt/liquibase/data/orchestra_master_4.5.0.0_partner.xml::partner-4.5.0.0-01::akn::(Checksum: 6:87034a77bb502afb778d227b0891896c)
ALTER TABLE ORC_PARTNER ADD PAR_PARTNER_REVISION VARCHAR(255);

ALTER TABLE ORC_PARTNER_SCENARIO ADD PSC_REVISION_ID VARCHAR(255);

