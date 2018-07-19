-------- Create-script for Oracle -------------------------
CREATE TABLE orc_lta_message_list (
  MLI_IDENTIFIER varchar(255) NOT NULL,
  MLI_ARCHIVE_TIME TIMESTAMP DEFAULT NULL,
  MES_ARCHIVE_INFO varchar(255) DEFAULT NULL
) ;

ALTER TABLE orc_lta_message_list ADD CONSTRAINT PK_ORC_LTA_MSG_LST PRIMARY KEY (MLI_IDENTIFIER);
CALL sysproc.admin_cmd ('REORG TABLE orc_lta_message_list');

CREATE INDEX IDX_LTA_PROCESS_BUS_EVENT ON orc_lta_process_bus_event (LPB_PROCESSID);
CALL sysproc.admin_cmd ('REORG TABLE orc_lta_process_bus_event');

CREATE INDEX IDX_LTA_MSG_LIST_DATE ON orc_lta_message_list (MLI_ARCHIVE_TIME);
CALL sysproc.admin_cmd ('REORG TABLE orc_lta_message_list');