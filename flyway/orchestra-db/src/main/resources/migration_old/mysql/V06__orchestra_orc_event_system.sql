
Insert into ORC_EVENT_SOURCE
   (ESO_SOURCE, ESO_DESCRIPTION)
 Values
   (0, 'Undefined');
Insert into ORC_EVENT_SOURCE
   (ESO_SOURCE, ESO_DESCRIPTION)
 Values
   (1, 'MessageStore');
Insert into ORC_EVENT_SOURCE
   (ESO_SOURCE, ESO_DESCRIPTION)
 Values
   (2, 'ProcessEngine');
Insert into ORC_EVENT_SOURCE
   (ESO_SOURCE, ESO_DESCRIPTION)
 Values
   (3, 'CommunicationEngine');
Insert into ORC_EVENT_SOURCE
   (ESO_SOURCE, ESO_DESCRIPTION)
 Values
   (4, 'Channel');
Insert into ORC_EVENT_SOURCE
   (ESO_SOURCE, ESO_DESCRIPTION)
 Values
   (5, 'TimerService');
Insert into ORC_EVENT_SOURCE
   (ESO_SOURCE, ESO_DESCRIPTION)
 Values
   (6, 'Secuity');
Insert into ORC_EVENT_SOURCE
   (ESO_SOURCE, ESO_DESCRIPTION)
 Values
   (7, 'Queue');
Insert into ORC_EVENT_SOURCE
   (ESO_SOURCE, ESO_DESCRIPTION)
 Values
   (8, 'MessageDispatcher');
Insert into ORC_EVENT_SOURCE
   (ESO_SOURCE, ESO_DESCRIPTION)
 Values
   (9, 'MappingEngine');
COMMIT;

Insert into ORC_EVENT_ACTIONS
   (EAC_SOURCE, EAC_ACTION, EAC_DESCRIPTION)
 Values
   (1, 0, 'createMessage');
Insert into ORC_EVENT_ACTIONS
   (EAC_SOURCE, EAC_ACTION, EAC_DESCRIPTION)
 Values
   (2, 0, 'deployProcessModell');
Insert into ORC_EVENT_ACTIONS
   (EAC_SOURCE, EAC_ACTION, EAC_DESCRIPTION)
 Values
   (2, 1, 'unDeployProcessModell');
Insert into ORC_EVENT_ACTIONS
   (EAC_SOURCE, EAC_ACTION, EAC_DESCRIPTION)
 Values
   (2, 2, 'createProcess');
Insert into ORC_EVENT_ACTIONS
   (EAC_SOURCE, EAC_ACTION, EAC_DESCRIPTION)
 Values
   (2, 3, 'finishProcess');
Insert into ORC_EVENT_ACTIONS
   (EAC_SOURCE, EAC_ACTION, EAC_DESCRIPTION)
 Values
   (2, 4, 'onEnterActivity');
Insert into ORC_EVENT_ACTIONS
   (EAC_SOURCE, EAC_ACTION, EAC_DESCRIPTION)
 Values
   (2, 5, 'onLeaveActivity');
Insert into ORC_EVENT_ACTIONS
   (EAC_SOURCE, EAC_ACTION, EAC_DESCRIPTION)
 Values
   (2, 6, 'installProcessModell');
Insert into ORC_EVENT_ACTIONS
   (EAC_SOURCE, EAC_ACTION, EAC_DESCRIPTION)
 Values
   (2, 7, 'onCreateToken');
Insert into ORC_EVENT_ACTIONS
   (EAC_SOURCE, EAC_ACTION, EAC_DESCRIPTION)
 Values
   (2, 8, 'onFinishToken');
Insert into ORC_EVENT_ACTIONS
   (EAC_SOURCE, EAC_ACTION, EAC_DESCRIPTION)
 Values
   (6, 2, 'Access denied');
Insert into ORC_EVENT_ACTIONS
   (EAC_SOURCE, EAC_ACTION, EAC_DESCRIPTION)
 Values
   (2, 9, 'onAbortProcess');
Insert into ORC_EVENT_ACTIONS
   (EAC_SOURCE, EAC_ACTION, EAC_DESCRIPTION)
 Values
   (9, 0, 'error in mapping');
Insert into ORC_EVENT_ACTIONS
   (EAC_SOURCE, EAC_ACTION, EAC_DESCRIPTION)
 Values
   (3, 0, 'Adapter error');
Insert into ORC_EVENT_ACTIONS
   (EAC_SOURCE, EAC_ACTION, EAC_DESCRIPTION)
 Values
   (6, 0, 'Login');
Insert into ORC_EVENT_ACTIONS
   (EAC_SOURCE, EAC_ACTION, EAC_DESCRIPTION)
 Values
   (6, 1, 'Logoff');
Insert into ORC_EVENT_ACTIONS
   (EAC_SOURCE, EAC_ACTION, EAC_DESCRIPTION)
 Values
   (2, 10, 'onNeedManualRecovery');
Insert into ORC_EVENT_ACTIONS
   (EAC_SOURCE, EAC_ACTION, EAC_DESCRIPTION)
 Values
   (2, 11, 'onRecover');
Insert into ORC_EVENT_ACTIONS
   (EAC_SOURCE, EAC_ACTION, EAC_DESCRIPTION)
 Values
   (2, 12, 'onSkip');
Insert into ORC_EVENT_ACTIONS
   (EAC_SOURCE, EAC_ACTION, EAC_DESCRIPTION)
 Values
   (0, 0, 'undefined');
COMMIT;

