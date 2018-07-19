/* MySQL - Script 44 (V4.3.4.9) */

CREATE INDEX IDX_EVENT_PROCESS_DATE ON ORC_EVENT_PROCESS(EVT_DATE);

/* set the state information to finished for all processes that are completed or aborted and marked for restart */

update ORC_PROCESS_RUNTIME_STATE 
   set PRS_STATE = 1 
 where PRS_STATE = 2
   and PRS_PROCESS in ( select PRS_PROCESS_ID from ORC_PROCESS_STATE where PRS_STATE = 3 or PRS_STATE = 9 );
		   
/* delete all runtime_state_information that has no associated monitor information */

delete from ORC_PROCESS_RUNTIME_STATE 
 where not exists ( select 1 from ORC_PROCESS_STATE where PRS_PROCESS_ID = PRS_PROCESS );

COMMIT;
