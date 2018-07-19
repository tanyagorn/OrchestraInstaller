






alter table ORC_SEC_USER_AUTH_METHODS_V2 
  add constraint PK_SEC_USER_AUTH_METH2 
  primary key (OAM_USER_ID, OAM_METHOD);

alter table ORC_SEC_USER_ROLES_V2
  add constraint PK_SEC_USER_ROLS2 
  primary key (OUR_USER_ID, OUR_ROLE_ID);

alter table ORC_SEC_USER_GROUP_V2
  add constraint PK_SEC_USER_GRPS2
  primary key (OUG_USER_ID, OUG_GROUP_ID);

alter table ORC_SEC_GROUP_ROLES_V2
  add constraint PK_SEC_GROUP_ROLS2
  primary key (OGR_GROUP_ID, OGR_ROLE_ID);
