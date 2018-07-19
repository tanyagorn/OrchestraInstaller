/* MS SQL Script 44 (V4.3.4.9) */


CREATE INDEX IDX_EVENT_PROCESS_DATE ON ORC_EVENT_PROCESS(EVT_DATE) WITH (ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF);

/* set the state information to finished for all processes that are completed or aborted and marked for restart */

update orc_process_runtime_state 
   set PRS_STATE = 1 
 where PRS_STATE = 2
   and PRS_PROCESS in ( select PRS_PROCESS_ID from orc_process_state where PRS_STATE = 3 or PRS_STATE = 9 );

GO
		   
/* delete all runtime_state_information that has no associated monitor information */

delete from orc_process_runtime_state 
 where not exists ( select 1 from orc_process_state where PRS_PROCESS_ID = PRS_PROCESS );

GO

