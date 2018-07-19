-- *********************************************************************
-- Create Database Script
-- *********************************************************************
-- Change Log: /opt/liquibase/data/orchestra_4.4.0.8.xml
-- Ran at: 11.07.13 15:35
-- Liquibase version: UNKNOWN
-- *********************************************************************

-- Changeset /opt/liquibase/data/orchestra_4.4.0.8.xml::change-4.4.0.8-01::akn::(Checksum: 6:6f48c445cb3471e52229648eb3f496fc)
INSERT INTO [ORC_SEC_ROLE_V2] ([OSR_SCENARIO], [OSR_IDENTIFIER], [OSR_DESC]) VALUES ('RUNTIME', 'RUNTIME:RestartProcess', 'Restart of process instances')
GO

INSERT INTO [ORC_SEC_USER_ROLES_V2] ([OUR_USER_ID], [OUR_ROLE_ID]) VALUES ('RUNTIME:admin', 'RestartProcess')
GO

