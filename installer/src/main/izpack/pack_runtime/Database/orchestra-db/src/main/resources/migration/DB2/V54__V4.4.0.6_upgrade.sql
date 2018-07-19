-- *********************************************************************
-- Create Database Script
-- *********************************************************************
-- Change Log: /opt/liquibase/data/orchestra_4.4.0.6.xml
-- Ran at: 03.07.13 16:08
-- Liquibase version: UNKNOWN
-- *********************************************************************

-- Changeset /opt/liquibase/data/orchestra_4.4.0.6.xml::change-4.4.0.6-01::wli::(Checksum: 6:b42dbae2be8e079571c2c4c3cebd572c)
ALTER TABLE ORC_MONITOR_NODES ADD OMN_INSTANCENAME varchar(255);
CALL sysproc.admin_cmd ('REORG TABLE ORC_MONITOR_NODES');

UPDATE ORC_MONITOR_NODES SET OMN_GROUPNAME = 'Monitor', OMN_INSTANCENAME = OMN_NAME;

DELETE FROM ORC_MONITOR_NODES  WHERE OMN_LOCAL is not null;

-- Changeset /opt/liquibase/data/orchestra_4.4.0.6.xml::change-4.4.0.6-02::wli::(Checksum: 6:97eec20f5082d0b318a7518ab7cf7e83)
DELETE FROM ORC_MESSAGE_REFERERS  WHERE MRE_REF_TYPE = 1 or MRE_REF_TYPE = 4;

-- Changeset /opt/liquibase/data/orchestra_4.4.0.6.xml::change-4.4.0.6-03::wli::(Checksum: 6:d32bd77f33b36e09704e983fa5fcd6a1)
UPDATE ORC_QUEUE_TOPIC_STATE SET QTS_IDENTIFIER = replace(QTS_IDENTIFIER, ':Channel}', '}Channel:'), QTS_OWNER = replace(QTS_OWNER, ':Channel', '') WHERE QTS_OWNER like '%:Channel';

