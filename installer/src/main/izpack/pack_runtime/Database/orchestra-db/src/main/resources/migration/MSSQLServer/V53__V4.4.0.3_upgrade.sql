-- *********************************************************************
-- Create Database Script
-- *********************************************************************
-- Change Log: data/orchestra_4.4.0.3.xml
-- Ran at: 03.06.13 11:55
-- Liquibase version: UNKNOWN
-- *********************************************************************


-- Changeset data/orchestra_4.4.0.3.xml::change-4.4.0.3-01::wli::(Checksum: 6:d196dc59550e605df3cf9e3093a3ae93)
CREATE INDEX IDX_LTA_PROCESS_BUS_EVENT ON [ORC_LTA_PROCESS_BUS_EVENT]([LPB_PROCESSID]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS = OFF)
GO

-- Changeset data/orchestra_4.4.0.3.xml::change-4.4.0.3-02::wli::(Checksum: 6:9f6bd3ee1c7875a513731ba2734cc1a9)
CREATE TABLE [ORC_LTA_MESSAGE_LIST] ([MLI_IDENTIFIER] VARCHAR(256) NOT NULL, [MLI_ARCHIVE_TIME] datetime, [MES_ARCHIVE_INFO] VARCHAR(255))
GO

-- Changeset data/orchestra_4.4.0.3.xml::change-4.4.0.3-03::wli::(Checksum: 6:9becdca51dd5ca8f12764c7e46853b22)
ALTER TABLE [ORC_LTA_MESSAGE_LIST] ADD CONSTRAINT [PK_LTA_MESSAGE_LIST] PRIMARY KEY ([MLI_IDENTIFIER]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS = OFF)
GO

-- Changeset data/orchestra_4.4.0.3.xml::change-4.4.0.3-04::wli::(Checksum: 6:1f55188e1599bd73c0648f7807df1f35)
CREATE INDEX IDX_LTA_MSG_LIST_DATE ON [ORC_LTA_MESSAGE_LIST]([MLI_ARCHIVE_TIME]) WITH (ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS = OFF)
GO

