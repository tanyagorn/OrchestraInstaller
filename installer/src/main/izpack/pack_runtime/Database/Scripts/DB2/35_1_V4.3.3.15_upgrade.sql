-- Update Script DB2 f�r V4.3.3.15 ----
-- Renaming a Column ---
-- Create a temporay copy of orginal table
CREATE TABLE TMP_ORC_PROCESS_ARBORT  
(
  PRA_PARENT_PROCESS VARCHAR(255),
  PRA_CHILD_PROCESS VARCHAR(255),
  PRA_PARENT_TOKEN VARCHAR(255)
);
-- Export Data to Temp_Table
INSERT INTO TMP_ORC_PROCESS_ARBORT 
	SELECT * FROM ORC_PROCESS_ARBORT;
-- Drop the orginal Table
DROP TABLE ORC_PROCESS_ARBORT;  
-- Recreate the Table
CREATE TABLE ORC_PROCESS_ARBORT  
(
  PRA_PARENT_PROCESS VARCHAR(255),
  PRA_PROCESSINSTANCE VARCHAR(255),
  PRA_PARENT_TOKEN VARCHAR(255)  
);
-- Import Data from Temp_Table
INSERT INTO ORC_PROCESS_ARBORT 
	SELECT * FROM TMP_ORC_PROCESS_ARBORT;
-- Drop TMP-Table
DROP TABLE TMP_ORC_PROCESS_ARBORT;
-- Recreate Indexes
CREATE INDEX IDX_ORC_PROC_ABORT_CHILD_PROC ON ORC_PROCESS_ARBORT (PRA_PROCESSINSTANCE);
-- Add Column
ALTER TABLE ORC_PROCESS_ARBORT ADD PRA_PROCSSMODELL VARCHAR(255);

COMMIT;

CREATE VIEW ORC_PROCESS_STATE_BUSINESS_KEY
	AS SELECT * FROM 
		ORC_PROCESS_STATE,
		ORC_PROCESS_EXT_BUSINESS_KEYS
	WHERE PEK_PROCESS_ID = PRS_PROCESS_ID;

CREATE INDEX IDX_ORC_PROCESS_STATE_1 ON ORC_PROCESS_STATE(PRS_SCENARIO_ID,PRS_STATE);

CREATE INDEX IDX_ORC_PROCESS_STATE_2 ON ORC_PROCESS_STATE(PRS_SCENARIO_ID,PRS_MODELL_ID);

CREATE INDEX IDX_ORC_PROCESS_EXT_BK ON ORC_PROCESS_EXT_BUSINESS_KEYS(PEK_BUSINESS_KEY_NAME,PEK_BUSINESS_KEY);

COMMIT;
