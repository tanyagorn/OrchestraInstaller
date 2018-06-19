create table ORC_PARTNER 
(
	PAR_ID 					number(19) not null, 
	PAR_NAME 				varchar2(255), 
	PAR_DESCRIPTION 		varchar2(255), 
	PAR_SCENARIO_DATA 		blob, 
	PAR_TARGET_IDENTIFIER 	varchar2(255), 
	PAR_IGNORE_MISSING_BO 	number(1,0), 
	PAR_PARTNER_ART 		varchar2(255),
	PAR_PARTNER_ART_ID 		varchar2(255), 
	primary key (PAR_ID)
);

create table ORC_PARTNERART_MAPPING 
(
	PMA_ID 					number(19) not null, 
	PMA_TECHNICAL_ELEMENT 	varchar2(255), 
	PSC_PARTNERART_ID 		varchar2(255), 
	primary key (PMA_ID)
);

create table ORC_PARTNERART_MAPPING_EXPR 
(
	PME_DEMA_ID 			number(19) not null, 
	PAM_TARGET 				varchar2(255), 
	PAB_EXPR 				varchar2(255), 
	PAB_LANG 				varchar2(255), 
	PAB_DIRECTION 			number(1,0)
);

create table ORC_PARTNERART_NAMESPACE 
(
	PNA_DEMA_ID 			number(19) not null, 
	PNA_PRFIX 				varchar2(255), 
	PNA_URI 				varchar2(255)
);
create table ORC_PARTNER_ABONEMENT 
(
	PAB_ID 					number(19) not null, 
	PAB_TYPE 				varchar2(255) not null, 
	PAB_TECHNICAL_ELEMENT 	varchar2(255), 
	PAB_NAME 				varchar2(255), 
	PAB_DESCRIPITION 		varchar2(255), 
	PAB_FILTER_EXPR_LANG 	varchar2(255), 
	PAB_FILTER_EXPR 		varchar2(255), 
	PAB_PARTNER_ID 			number(19,0), 
	primary key (PAB_ID)
);

create table ORC_PARTNER_ABO_MAPPING 
(
	PAM_ABO_ID 				number(19) not null, 
	PAM_TARGET 				varchar2(255), 
	PAB_EXPR 				varchar2(255), 
	PAB_LANG 				varchar2(255), 
	PAB_DIRECTION 			number(1,0)
);

create table ORC_PARTNER_BLACKLIST 
(
	BLA_PARTNER_ID 			number(19) not null, 
	BLA_OBJECT_ID 			number(19) not null
);

create table ORC_PARTNER_BUSINESS_OBJECT 
(
	BOB_ID 					number(19) not null, 
	BOB_NAME 				varchar2(255), 
	BOB_DESCRIPTION 		varchar2(255), 
	primary key (BOB_ID)
);

create table ORC_PARTNER_NAMESPACE 
(
	PNA_PAR_ID 				number(19) not null, 
	PNA_PRFIX 				varchar2(255), 
	PNA_URI 				varchar2(255)
);

create table ORC_PARTNER_SCENARIO 
(	
	PSC_IDENTIFIER 			varchar2(255) not null, 
	PSC_NAME 				varchar2(255), 
	PSC_DESCRIPTION 		varchar2(255), 
	PSC_DATA 				blob, 
	primary key (PSC_IDENTIFIER)
);

create table ORC_PARTNER_WHITELIST 
(
	WHI_ABONEMENT_ID 		number(19) not null, 
	WHIE_OBJECT_ID 			number(19) not null
);

CREATE TABLE ORC_PARTNER_MAP_MAPPING
(
  PNA_PAR_ID  NUMBER(19)                        NOT NULL,
  PNA_SOURCE  VARCHAR2(255 BYTE),
  PNA_TARGET  VARCHAR2(255 BYTE),
  PNA_INDEX   NUMBER(10)                        NOT NULL
);

ALTER TABLE ORC_PARTNER_MAP_MAPPING ADD (
  PRIMARY KEY
 (PNA_PAR_ID, PNA_INDEX));

CREATE TABLE ORC_PARTNER_MAP_GROUP
(
  PNG_ID                 NUMBER(19)             NOT NULL,
  PAB_TECHNICAL_ELEMENT  VARCHAR2(255 BYTE),
  PAB_NAME               VARCHAR2(255 BYTE),
  PAB_PASS_ON_MISS       NUMBER(1),
  PNG_PARTNER_ID         NUMBER(19)
);

ALTER TABLE ORC_PARTNER_MAP_GROUP ADD (
  PRIMARY KEY
 (PNG_ID));

COMMIT;