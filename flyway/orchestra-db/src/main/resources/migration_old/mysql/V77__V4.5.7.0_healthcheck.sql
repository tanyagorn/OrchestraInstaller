create table orc_healthcheck(
hc_ID int NOT NULL PRIMARY KEY,
name varchar(40),
content BLOB,
enabled Bool);

create table orc_hc_resultlist(
hc_ID int NOT NULL ,
ex_id int NOT NULL,
startTime date,
endTime date,
result BLOB,
constraint pk_resultList Primary key(hc_id, ex_id),
Foreign key(hc_ID) references orc_healthcheck(hc_ID)
);



insert into orc_sec_role_v2 values('RUNTIME', 'RUNTIME:HealthCheckUser', 'Is just allowed to execute the HealthCheck');
insert into orc_sec_role_v2 values('RUNTIME', 'RUNTIME:HealthCheckAdmin', 'Is allowed to edit the HealthCheck');

insert into orc_sec_user_roles_v2 values ('RUNTIME:Monitor' , 'HealthCheckUser');
insert into orc_sec_user_roles_v2 values ('RUNTIME:admin' , 'HealthCheckUser');
insert into orc_sec_user_roles_v2 values ('RUNTIME:admin' , 'HealthCheckAdmin');

insert into orc_monitor_tablesettings values('RUNTIME:admin', 'HealthCheckTable' , 0,30,20000,2,1,'y,y,y,y,y,y');

insert into orc_monitor_tablesettings values('RUNTIME:admin', 'CheckHistory' , 1,20,20000,0,1,'y,y,y,y');

insert into orc_monitor_tablesettings values('RUNTIME:admin', 'HcExecutionHistory' , 1,20,20000,0,1,'y,y,y,y,y');