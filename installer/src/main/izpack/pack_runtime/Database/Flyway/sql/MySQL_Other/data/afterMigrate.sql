-- NOTE: Do not change the name of this script file since it is a hook used for callback in flyway

-- Data to be inserted after migration is done
insert into ORC_SEC_USER_ROLES_V2(OUR_USER_ID,OUR_ROLE_ID) values('RUNTIME:admin','Cell.Admin');
insert into ORC_SEC_USER_ROLES_V2(OUR_USER_ID,OUR_ROLE_ID) values('RUNTIME:admin','Recompute.LTA.Statistic');
insert into ORC_SEC_USER_ROLES_V2(OUR_USER_ID,OUR_ROLE_ID) values('RUNTIME:admin','Recompute.Process.Overview');
insert into ORC_SEC_USER_ROLES_V2(OUR_USER_ID,OUR_ROLE_ID) values('RUNTIME:admin','Remote.Administrator');