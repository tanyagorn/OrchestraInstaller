
CREATE INDEX IDX_ORC_MESSAGE_CREATED_AT ON ORC_MESSAGE (MES_CREATED_AT);

CREATE INDEX IDX_ORC_EVT_LOCAL_VAR_VALUE ON ORC_EVT_LOCAL_VARIABLES (EVV_VALUE);

CREATE INDEX IDX_ORC_EVT_PROCESS_VAR_VALUE ON ORC_EVT_PROCESS_VARIABLES (EVV_VALUE);

CREATE INDEX IDX_PROCESS_FIFO_SCHEDULE_ID on ORC_PROCESS_FIFO_SCHEDULE (PFS_ID);

CREATE INDEX IDX_PROCESS_FIFO_SCHED_REF_ID on ORC_PROCESS_FIFO_SCHEDULE (PFS_MODELL_REFERENCE, PFS_ID);

GO
