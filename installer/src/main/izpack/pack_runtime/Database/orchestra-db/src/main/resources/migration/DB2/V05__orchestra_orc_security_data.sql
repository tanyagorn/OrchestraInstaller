Insert into ORC_SEC_CREDENTIAL_V2
   (OSC_SCENARIO, OSC_IDENTIFIER, OSC_TYPE, OSC_NAME, OSC_DESC, 
    OSC_EXT_PROVIDER, OSC_UNIQUE_ID)
 Values
   ('RUNTIME', 'admin', 'internal', 'Administrator', 'Orchestra Administrator', 
    NULL, 'RUNTIME:admin');
Insert into ORC_SEC_CREDENTIAL_V2
   (OSC_SCENARIO, OSC_IDENTIFIER, OSC_TYPE, OSC_NAME, OSC_DESC, 
    OSC_EXT_PROVIDER, OSC_UNIQUE_ID)
 Values
   ('RUNTIME', 'Monitor', 'internal', 'Monitor', 'Monitoring user', 
    NULL, 'RUNTIME:Monitor');
COMMIT;

Insert into ORC_SEC_GROUP_ROLES_V2
   (OGR_GROUP_ID, OGR_ROLE_ID)
 Values
   ('RUNTIME:Adapter', 'AdapterMonitor');
Insert into ORC_SEC_GROUP_ROLES_V2
   (OGR_GROUP_ID, OGR_ROLE_ID)
 Values
   ('RUNTIME:Adapter', 'AdapterManagement');
Insert into ORC_SEC_GROUP_ROLES_V2
   (OGR_GROUP_ID, OGR_ROLE_ID)
 Values
   ('RUNTIME:Landscape', 'LandscapeAdmin');
Insert into ORC_SEC_GROUP_ROLES_V2
   (OGR_GROUP_ID, OGR_ROLE_ID)
 Values
   ('RUNTIME:Landscape', 'LandscapeView');
Insert into ORC_SEC_GROUP_ROLES_V2
   (OGR_GROUP_ID, OGR_ROLE_ID)
 Values
   ('RUNTIME:Landscape', 'LandscapeUpdate');
Insert into ORC_SEC_GROUP_ROLES_V2
   (OGR_GROUP_ID, OGR_ROLE_ID)
 Values
   ('RUNTIME:Monitor', 'MonitorLog');
Insert into ORC_SEC_GROUP_ROLES_V2
   (OGR_GROUP_ID, OGR_ROLE_ID)
 Values
   ('RUNTIME:Monitor', 'MonitorProcess');
Insert into ORC_SEC_GROUP_ROLES_V2
   (OGR_GROUP_ID, OGR_ROLE_ID)
 Values
   ('RUNTIME:Monitor', 'ShowMessageData');
Insert into ORC_SEC_GROUP_ROLES_V2
   (OGR_GROUP_ID, OGR_ROLE_ID)
 Values
   ('RUNTIME:Deployment', 'deploy');
Insert into ORC_SEC_GROUP_ROLES_V2
   (OGR_GROUP_ID, OGR_ROLE_ID)
 Values
   ('RUNTIME:Deployment', 'undeploy');
Insert into ORC_SEC_GROUP_ROLES_V2
   (OGR_GROUP_ID, OGR_ROLE_ID)
 Values
   ('RUNTIME:Deployment', 'redeploy');
Insert into ORC_SEC_GROUP_ROLES_V2
   (OGR_GROUP_ID, OGR_ROLE_ID)
 Values
   ('RUNTIME:Deployment', 'list');
COMMIT;

Insert into ORC_SEC_GROUP_V2
   (OSG_SCENARIO, OSG_IDENTIFIER, OSG_DESC)
 Values
   ('RUNTIME', 'RUNTIME:Adapter', NULL);
Insert into ORC_SEC_GROUP_V2
   (OSG_SCENARIO, OSG_IDENTIFIER, OSG_DESC)
 Values
   ('RUNTIME', 'RUNTIME:Landscape', NULL);
Insert into ORC_SEC_GROUP_V2
   (OSG_SCENARIO, OSG_IDENTIFIER, OSG_DESC)
 Values
   ('RUNTIME', 'RUNTIME:Monitor', NULL);
Insert into ORC_SEC_GROUP_V2
   (OSG_SCENARIO, OSG_IDENTIFIER, OSG_DESC)
 Values
   ('RUNTIME', 'RUNTIME:Deployment', NULL);
COMMIT;

Insert into ORC_SEC_ROLE_V2
   (OSR_SCENARIO, OSR_IDENTIFIER, OSR_DESC)
 Values
   ('RUNTIME', 'RUNTIME:SystemEvents.View', NULL);
Insert into ORC_SEC_ROLE_V2
   (OSR_SCENARIO, OSR_IDENTIFIER, OSR_DESC)
 Values
   ('RUNTIME', 'RUNTIME:SystemEvents.Delete', NULL);
Insert into ORC_SEC_ROLE_V2
   (OSR_SCENARIO, OSR_IDENTIFIER, OSR_DESC)
 Values
   ('RUNTIME', 'RUNTIME:AdapterMonitor', NULL);
Insert into ORC_SEC_ROLE_V2
   (OSR_SCENARIO, OSR_IDENTIFIER, OSR_DESC)
 Values
   ('RUNTIME', 'RUNTIME:AdapterManagement', NULL);
Insert into ORC_SEC_ROLE_V2
   (OSR_SCENARIO, OSR_IDENTIFIER, OSR_DESC)
 Values
   ('RUNTIME', 'RUNTIME:LandscapeAdmin', NULL);
Insert into ORC_SEC_ROLE_V2
   (OSR_SCENARIO, OSR_IDENTIFIER, OSR_DESC)
 Values
   ('RUNTIME', 'RUNTIME:LandscapeView', NULL);
Insert into ORC_SEC_ROLE_V2
   (OSR_SCENARIO, OSR_IDENTIFIER, OSR_DESC)
 Values
   ('RUNTIME', 'RUNTIME:LandscapeUpdate', NULL);
Insert into ORC_SEC_ROLE_V2
   (OSR_SCENARIO, OSR_IDENTIFIER, OSR_DESC)
 Values
   ('RUNTIME', 'RUNTIME:MonitorLog', NULL);
Insert into ORC_SEC_ROLE_V2
   (OSR_SCENARIO, OSR_IDENTIFIER, OSR_DESC)
 Values
   ('RUNTIME', 'RUNTIME:MonitorProcess', NULL);
Insert into ORC_SEC_ROLE_V2
   (OSR_SCENARIO, OSR_IDENTIFIER, OSR_DESC)
 Values
   ('RUNTIME', 'RUNTIME:ShowMessageData', NULL);
Insert into ORC_SEC_ROLE_V2
   (OSR_SCENARIO, OSR_IDENTIFIER, OSR_DESC)
 Values
   ('RUNTIME', 'RUNTIME:DelProcessLog', NULL);
Insert into ORC_SEC_ROLE_V2
   (OSR_SCENARIO, OSR_IDENTIFIER, OSR_DESC)
 Values
   ('RUNTIME', 'RUNTIME:AdminUser', NULL);
Insert into ORC_SEC_ROLE_V2
   (OSR_SCENARIO, OSR_IDENTIFIER, OSR_DESC)
 Values
   ('RUNTIME', 'RUNTIME:deploy', NULL);
Insert into ORC_SEC_ROLE_V2
   (OSR_SCENARIO, OSR_IDENTIFIER, OSR_DESC)
 Values
   ('RUNTIME', 'RUNTIME:undeploy', NULL);
Insert into ORC_SEC_ROLE_V2
   (OSR_SCENARIO, OSR_IDENTIFIER, OSR_DESC)
 Values
   ('RUNTIME', 'RUNTIME:redeploy', NULL);
Insert into ORC_SEC_ROLE_V2
   (OSR_SCENARIO, OSR_IDENTIFIER, OSR_DESC)
 Values
   ('RUNTIME', 'RUNTIME:list', NULL);
Insert into ORC_SEC_ROLE_V2
   (OSR_SCENARIO, OSR_IDENTIFIER, OSR_DESC)
 Values
   ('RUNTIME', 'RUNTIME:Runtime.Start', NULL);
Insert into ORC_SEC_ROLE_V2
   (OSR_SCENARIO, OSR_IDENTIFIER, OSR_DESC)
 Values
   ('RUNTIME', 'RUNTIME:Runtime.Stop', NULL);
COMMIT;

Insert into ORC_SEC_USER_AUTH_METHODS_V2
   (OAM_USER_ID, OAM_METHOD)
 Values
   ('RUNTIME:Monitor', 'Password');
Insert into ORC_SEC_USER_AUTH_METHODS_V2
   (OAM_USER_ID, OAM_METHOD)
 Values
   ('RUNTIME:admin', 'Password');
COMMIT;

Insert into ORC_SEC_USER_GROUP_V2
   (OUG_USER_ID, OUG_GROUP_ID)
 Values
   ('RUNTIME:admin', 'Adapter');
Insert into ORC_SEC_USER_GROUP_V2
   (OUG_USER_ID, OUG_GROUP_ID)
 Values
   ('RUNTIME:admin', 'Landscape');
Insert into ORC_SEC_USER_GROUP_V2
   (OUG_USER_ID, OUG_GROUP_ID)
 Values
   ('RUNTIME:admin', 'Monitor');
Insert into ORC_SEC_USER_GROUP_V2
   (OUG_USER_ID, OUG_GROUP_ID)
 Values
   ('RUNTIME:admin', 'Deployment');
Insert into ORC_SEC_USER_GROUP_V2
   (OUG_USER_ID, OUG_GROUP_ID)
 Values
   ('RUNTIME:Monitor', 'Monitor');
COMMIT;

Insert into ORC_SEC_USER_ROLES_V2
   (OUR_USER_ID, OUR_ROLE_ID)
 Values
   ('RUNTIME:admin', 'DelProcessLog');
Insert into ORC_SEC_USER_ROLES_V2
   (OUR_USER_ID, OUR_ROLE_ID)
 Values
   ('RUNTIME:admin', 'MonitorLog');
Insert into ORC_SEC_USER_ROLES_V2
   (OUR_USER_ID, OUR_ROLE_ID)
 Values
   ('RUNTIME:admin', 'MonitorProcess');
Insert into ORC_SEC_USER_ROLES_V2
   (OUR_USER_ID, OUR_ROLE_ID)
 Values
   ('RUNTIME:admin', 'ShowMessageData');
Insert into ORC_SEC_USER_ROLES_V2
   (OUR_USER_ID, OUR_ROLE_ID)
 Values
   ('RUNTIME:admin', 'SystemEvents.View');
Insert into ORC_SEC_USER_ROLES_V2
   (OUR_USER_ID, OUR_ROLE_ID)
 Values
   ('RUNTIME:admin', 'AdminUser');
Insert into ORC_SEC_USER_ROLES_V2
   (OUR_USER_ID, OUR_ROLE_ID)
 Values
   ('RUNTIME:admin', 'undeploy');
Insert into ORC_SEC_USER_ROLES_V2
   (OUR_USER_ID, OUR_ROLE_ID)
 Values
   ('RUNTIME:admin', 'SystemEvents.Delete');
Insert into ORC_SEC_USER_ROLES_V2
   (OUR_USER_ID, OUR_ROLE_ID)
 Values
   ('RUNTIME:admin', 'deploy');
Insert into ORC_SEC_USER_ROLES_V2
   (OUR_USER_ID, OUR_ROLE_ID)
 Values
   ('RUNTIME:admin', 'redeploy');
Insert into ORC_SEC_USER_ROLES_V2
   (OUR_USER_ID, OUR_ROLE_ID)
 Values
   ('RUNTIME:admin', 'LandscapeAdmin');
Insert into ORC_SEC_USER_ROLES_V2
   (OUR_USER_ID, OUR_ROLE_ID)
 Values
   ('RUNTIME:admin', 'LandscapeView');
Insert into ORC_SEC_USER_ROLES_V2
   (OUR_USER_ID, OUR_ROLE_ID)
 Values
   ('RUNTIME:admin', 'LandscapeUpdate');
Insert into ORC_SEC_USER_ROLES_V2
   (OUR_USER_ID, OUR_ROLE_ID)
 Values
   ('RUNTIME:admin', 'Runtime.Start');
Insert into ORC_SEC_USER_ROLES_V2
   (OUR_USER_ID, OUR_ROLE_ID)
 Values
   ('RUNTIME:admin', 'AdapterMonitor');
Insert into ORC_SEC_USER_ROLES_V2
   (OUR_USER_ID, OUR_ROLE_ID)
 Values
   ('RUNTIME:admin', 'Runtime.Stop');
Insert into ORC_SEC_USER_ROLES_V2
   (OUR_USER_ID, OUR_ROLE_ID)
 Values
   ('RUNTIME:admin', 'list');
Insert into ORC_SEC_USER_ROLES_V2
   (OUR_USER_ID, OUR_ROLE_ID)
 Values
   ('RUNTIME:admin', 'AdapterManagement');
Insert into ORC_SEC_USER_ROLES_V2
   (OUR_USER_ID, OUR_ROLE_ID)
 Values
   ('RUNTIME:Monitor', 'MonitorLog');
Insert into ORC_SEC_USER_ROLES_V2
   (OUR_USER_ID, OUR_ROLE_ID)
 Values
   ('RUNTIME:Monitor', 'MonitorProcess');
Insert into ORC_SEC_USER_ROLES_V2
   (OUR_USER_ID, OUR_ROLE_ID)
 Values
   ('RUNTIME:Monitor', 'ShowMessageData');
Insert into ORC_SEC_USER_ROLES_V2
   (OUR_USER_ID, OUR_ROLE_ID)
 Values
   ('RUNTIME:Monitor', 'Monitor');
COMMIT;

Insert into ORC_USER_PWD_TABLE
   (OUP_USER_ID, OUP_PASSWORD, OUP_SCENARIO)
 Values
   ('RUNTIME:admin', '0008514b4f4d545455480006636b6677786b00000008f9a5ab9f2ce271b5', NULL);
Insert into ORC_USER_PWD_TABLE
   (OUP_USER_ID, OUP_PASSWORD, OUP_SCENARIO)
 Values
   ('RUNTIME:Monitor', '00084e524c554746595500067a7263656b77000000081c9863a918d125b3', NULL);
COMMIT;

Insert into ORC_SEC_USER_STATE
   (UST_USER_ID, USR_LOGON_TRIES, USR_LAST_LOGIN, USR_STATE)
 Values
   ('RUNTIME:admin', 0, null, 0);
Insert into ORC_SEC_USER_STATE
   (UST_USER_ID, USR_LOGON_TRIES, USR_LAST_LOGIN, USR_STATE)
 Values
   ('RUNTIME:Monitor', 0, NULL, 0);
COMMIT;

