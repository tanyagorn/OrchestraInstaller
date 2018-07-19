/* Update Script MYSQL f�r V4.3.3.15 */
ALTER TABLE ORC_PROCESS_ARBORT
 CHANGE PRA_CHILD_PROCESS PRA_PROCESSINSTANCE VARCHAR(255),  
 ADD PRA_PROCSSMODELL VARCHAR(255) AFTER PRA_PARENT_TOKEN;

create view ORC_PROCESS_STATE_BUSINESS_KEY as select * from ORC_PROCESS_STATE, ORC_PROCESS_EXT_BUSINESS_KEYS where PEK_PROCESS_ID = PRS_PROCESS_ID;

CREATE INDEX IDX_ORC_PROCESS_STATE_1 ON ORC_PROCESS_STATE
(PRS_SCENARIO_ID,PRS_STATE);

CREATE INDEX IDX_ORC_PROCESS_STATE_2 ON ORC_PROCESS_STATE
(PRS_SCENARIO_ID,PRS_MODELL_ID);

CREATE INDEX IDX_ORC_PROCESS_EXT_BK ON ORC_PROCESS_EXT_BUSINESS_KEYS
(PEK_BUSINESS_KEY_NAME,PEK_BUSINESS_KEY);

COMMIT;