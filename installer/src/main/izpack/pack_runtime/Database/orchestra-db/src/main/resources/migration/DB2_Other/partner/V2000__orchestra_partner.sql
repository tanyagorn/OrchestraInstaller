
CREATE TABLE ORC_PARTNER 
(
	PAR_ID 					INTEGER NOT NULL, 
	PAR_NAME 				VARCHAR(255), 
	PAR_DESCRIPTION 		VARCHAR(255), 
	PAR_SCENARIO_DATA 		blob, 
	PAR_TARGET_IDENTIFIER 	VARCHAR(255), 
	PAR_IGNORE_MISSING_BO 	INTEGER, 
	PAR_PARTNER_ART 		VARCHAR(255),
	PAR_PARTNER_ART_ID 		VARCHAR(255), 
	PRIMARY KEY (PAR_ID)
);

CREATE TABLE ORC_PARTNERART_MAPPING 
(
	PMA_ID 					INTEGER NOT NULL, 
	PMA_TECHNICAL_ELEMENT 	VARCHAR(255), 
	PSC_PARTNERART_ID 		VARCHAR(255), 
	PRIMARY KEY (PMA_ID)
);

CREATE TABLE ORC_PARTNERART_MAPPING_EXPR 
(
	PME_DEMA_ID 			INTEGER NOT NULL, 
	PAM_TARGET 				VARCHAR(255), 
	PAB_EXPR 				VARCHAR(255), 
	PAB_LANG 				VARCHAR(255), 
	PAB_DIRECTION 			INTEGER
);

CREATE TABLE ORC_PARTNERART_NAMESPACE 
(
	PNA_DEMA_ID 			INTEGER NOT NULL, 
	PNA_PRFIX 				VARCHAR(255), 
	PNA_URI 				VARCHAR(255)
);
CREATE TABLE ORC_PARTNER_ABONEMENT 
(
	PAB_ID 					INTEGER NOT NULL, 
	PAB_TYPE 				VARCHAR(255) NOT NULL, 
	PAB_TECHNICAL_ELEMENT 	VARCHAR(255), 
	PAB_NAME 				VARCHAR(255), 
	PAB_DESCRIPITION 		VARCHAR(255), 
	PAB_FILTER_EXPR_LANG 	VARCHAR(255), 
	PAB_FILTER_EXPR 		VARCHAR(255), 
	PAB_PARTNER_ID 			INTEGER, 
	PRIMARY KEY (PAB_ID)
);

CREATE TABLE ORC_PARTNER_ABO_MAPPING 
(
	PAM_ABO_ID 				INTEGER NOT NULL, 
	PAM_TARGET 				VARCHAR(255), 
	PAB_EXPR 				VARCHAR(255), 
	PAB_LANG 				VARCHAR(255), 
	PAB_DIRECTION 			INTEGER
);

CREATE TABLE ORC_PARTNER_BLACKLIST 
(
	BLA_PARTNER_ID 			INTEGER NOT NULL, 
	BLA_OBJECT_ID 			INTEGER NOT NULL
);

CREATE TABLE ORC_PARTNER_BUSINESS_OBJECT 
(
	BOB_ID 					INTEGER NOT NULL, 
	BOB_NAME 				VARCHAR(255), 
	BOB_DESCRIPTION 		VARCHAR(255), 
	PRIMARY KEY (BOB_ID)
);

CREATE TABLE ORC_PARTNER_NAMESPACE 
(
	PNA_PAR_ID 				INTEGER NOT NULL, 
	PNA_PRFIX 				VARCHAR(255), 
	PNA_URI 				VARCHAR(255)
);

CREATE TABLE ORC_PARTNER_SCENARIO 
(	
	PSC_IDENTIFIER 			VARCHAR(255) NOT NULL, 
	PSC_NAME 				VARCHAR(255), 
	PSC_DESCRIPTION 		VARCHAR(255), 
	PSC_DATA 				blob, 
	PRIMARY KEY (PSC_IDENTIFIER)
);

CREATE TABLE ORC_PARTNER_WHITELIST 
(
	WHI_ABONEMENT_ID 		INTEGER NOT NULL, 
	WHIE_OBJECT_ID 			INTEGER NOT NULL
);

CREATE TABLE ORC_PARTNER_MAP_MAPPING
(
  PNA_PAR_ID  NUMERIC(19)                        NOT NULL,
  PNA_SOURCE  VARCHAR(255),
  PNA_TARGET  VARCHAR(255),
  PNA_INDEX   NUMERIC(10)                        NOT NULL
);

ALTER TABLE ORC_PARTNER_MAP_MAPPING ADD PRIMARY KEY (PNA_PAR_ID, PNA_INDEX);

CREATE TABLE ORC_PARTNER_MAP_GROUP
(
  PNG_ID                 NUMERIC(19)             NOT NULL,
  PAB_TECHNICAL_ELEMENT  VARCHAR(255),
  PAB_NAME               VARCHAR(255),
  PAB_PASS_ON_MISS       NUMERIC(1),
  PNG_PARTNER_ID         NUMERIC(19)
);

ALTER TABLE ORC_PARTNER_MAP_GROUP ADD PRIMARY KEY (PNG_ID);

COMMIT;