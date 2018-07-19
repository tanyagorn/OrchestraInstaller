CREATE TABLE JBPM_EXCEPTIONHANDLER

(
  ID_                  bigint Not null Auto_Increment Primary key,
  EXCEPTIONCLASSNAME_  VARCHAR(4000),
  TYPE_                char(1),
  GRAPHELEMENT_        bigint,
  PROCESSDEFINITION_   bigint,
  GRAPHELEMENTINDEX_   bigint,
  NODE_                bigint,
  TRANSITION_          bigint,
  TASK_                bigint
)ENGINE= innodb;


CREATE TABLE JBPM_ID_GROUP
(
  ID_      bigint Not null Auto_Increment Primary key,
  CLASS_   char(1)                         NOT NULL,
  NAME_    varchar(255),
  TYPE_    varchar(255),
  PARENT_  bigint
)ENGINE= innodb;


CREATE TABLE JBPM_ID_PERMISSIONS
(
  ENTITY_  bigint Not null Auto_Increment Primary key,
  CLASS_   varchar(255),
  NAME_    varchar(255),
  ACTION_  varchar(255)
)ENGINE= innodb;


CREATE TABLE JBPM_ID_USER
(
  ID_        bigint Not null Auto_Increment Primary key,
  CLASS_     char(1)                       NOT NULL,
  NAME_      varchar(255),
  EMAIL_     varchar(255),
  PASSWORD_  varchar(255)
)ENGINE= innodb;


CREATE TABLE JBPM_MESSAGE
(
  ID_              bigint Not null Auto_Increment Primary key,
  CLASS_           char(1)                 NOT NULL,
  DESTINATION_     varchar(255),
  EXCEPTION_       VARCHAR(4000),
  ISSUSPENDED_     boolean,
  TOKEN_           bigint,
  TEXT_            varchar(255),
  ACTION_          bigint,
  NODE_            bigint,
  TRANSITIONNAME_  varchar(255),
  TASKINSTANCE_    bigint
)ENGINE= innodb;


CREATE TABLE JBPM_TIMER
(
  ID_                bigint Not null Auto_Increment Primary key,
  NAME_              varchar(255),
  DUEDATE_           DATETIME,
  REPEAT_            varchar(255),
  TRANSITIONNAME_    varchar(255),
  EXCEPTION_         VARCHAR(4000),
  ISSUSPENDED_       boolean,
  ACTION_            bigint,
  TOKEN_             bigint,
  PROCESSINSTANCE_   bigint,
  TASKINSTANCE_      bigint,
  GRAPHELEMENTTYPE_  varchar(255),
  GRAPHELEMENT_      bigint
)ENGINE= innodb;


CREATE TABLE JBPM_ID_MEMBERSHIP
(
  ID_     bigint Not null Auto_Increment Primary key,
  CLASS_  char(1)                          NOT NULL,
  NAME_   varchar(255),
  ROLE_   varchar(255),
  USER_   bigint,
  GROUP_  bigint
)ENGINE= innodb;


/* This object may not be sorted properly in the script due to cirular references */
CREATE TABLE JBPM_ACTION
(
  ID_                     bigint Not null Auto_Increment Primary key,
  CLASS                   char(1)          NOT NULL,
  NAME_                   varchar(255),
  ISPROPAGATIONALLOWED_   boolean,
  ACTIONEXPRESSION_       varchar(255),
  ISASYNC_                boolean,
  REFERENCEDACTION_       bigint,
  ACTIONDELEGATION_       bigint,
  EVENT_                  bigint,
  PROCESSDEFINITION_      bigint,
  EXPRESSION_             VARCHAR(4000),
  TIMERNAME_              varchar(255),
  DUEDATE_                varchar(255),
  REPEAT_                 varchar(255),
  TRANSITIONNAME_         varchar(255),
  TIMERACTION_            bigint,
  EVENTINDEX_             bigint,
  EXCEPTIONHANDLER_       bigint,
  EXCEPTIONHANDLERINDEX_  bigint
)ENGINE= innodb;


/* This object may not be sorted properly in the script due to cirular references */
CREATE TABLE JBPM_BYTEARRAY
(
  ID_              bigint Not null Auto_Increment Primary key,
  NAME_            varchar(255),
  FILEDEFINITION_  bigint
)ENGINE= innodb;


/* This object may not be sorted properly in the script due to cirular references */
CREATE TABLE JBPM_BYTEBLOCK
(
  PROCESSFILE_  bigint Not null ,
  BYTES_        BLOB,
  INDEX_        bigint                      NOT NULL
)ENGINE= innodb;


/* This object may not be sorted properly in the script due to cirular references */
CREATE TABLE JBPM_COMMENT
(
  ID_                 bigint Not null Auto_Increment Primary key,
  VERSION_            bigint                NOT NULL,
  ACTORID_            varchar(255),
  TIME_               DATETIME,
  MESSAGE_            VARCHAR(4000),
  TOKEN_              bigint,
  TASKINSTANCE_       bigint,
  TOKENINDEX_         bigint,
  TASKINSTANCEINDEX_  bigint
)ENGINE= innodb;


/* This object may not be sorted properly in the script due to cirular references */
CREATE TABLE JBPM_DECISIONCONDITIONS
(
  DECISION_        bigint Not null Auto_Increment Primary key,
  TRANSITIONNAME_  varchar(255),
  EXPRESSION_      varchar(255),
  INDEX_           bigint                   NOT NULL
)ENGINE= innodb;


/* This object may not be sorted properly in the script due to cirular references */
CREATE TABLE JBPM_DELEGATION
(
  ID_                 bigint Not null Auto_Increment Primary key,
  CLASSNAME_          varchar(4000),
  CONFIGURATION_      varchar(4000),
  CONFIGTYPE_         varchar(255),
  PROCESSDEFINITION_  bigint
)ENGINE= innodb;


/* This object may not be sorted properly in the script due to cirular references */
CREATE TABLE JBPM_EVENT
(
  ID_                 bigint Not null Auto_Increment Primary key,
  EVENTTYPE_          varchar(255),
  TYPE_               char(1),
  GRAPHELEMENT_       bigint,
  PROCESSDEFINITION_  bigint,
  NODE_               bigint,
  TRANSITION_         bigint,
  TASK_               bigint
)ENGINE= innodb;


/* This object may not be sorted properly in the script due to cirular references */
CREATE TABLE JBPM_JOB
(
  ID_                bigint Not null Auto_Increment Primary key,
  CLASS_             char(1)               NOT NULL,
  VERSION_           bigint                 NOT NULL,
  DUEDATE_           DATETIME,
  PROCESSINSTANCE_   bigint,
  TOKEN_             bigint,
  TASKINSTANCE_      bigint,
  ISSUSPENDED_       boolean,
  ISEXCLUSIVE_       boolean,
  LOCKOWNER_         varchar(255),
  LOCKTIME_          DATETIME,
  EXCEPTION_         varchar(4000),
  RETRIES_           bigint,
  NAME_              varchar(255),
  REPEAT_            varchar(255),
  TRANSITIONNAME_    varchar(255),
  ACTION_            bigint,
  GRAPHELEMENTTYPE_  varchar(255),
  GRAPHELEMENT_      bigint,
  NODE_              bigint
)ENGINE= innodb;


/* This object may not be sorted properly in the script due to cirular references */
CREATE TABLE JBPM_LOG
(
  ID_                bigint Not null Auto_Increment Primary key,
  CLASS_             char(1)               NOT NULL,
  INDEX_             bigint,
  DATE_              DATETIME,
  TOKEN_             bigint,
  PARENT_            bigint,
  MESSAGE_           varchar(4000),
  EXCEPTION_         varchar(4000),
  ACTION_            bigint,
  NODE_              bigint,
  ENTER_             DATETIME,
  LEAVE_             DATETIME,
  DURATION_          bigint,
  NEWLONGVALUE_      bigint,
  TRANSITION_        bigint,
  CHILD_             bigint,
  SOURCENODE_        bigint,
  DESTINATIONNODE_   bigint,
  VARIABLEINSTANCE_  bigint,
  OLDBYTEARRAY_      bigint,
  NEWBYTEARRAY_      bigint,
  OLDDATEVALUE_      DATETIME,
  NEWDATEVALUE_      DATETIME,
  OLDDOUBLEVALUE_    FLOAT,
  NEWDOUBLEVALUE_    FLOAT,
  OLDLONGIDCLASS_    varchar(255),
  OLDLONGIDVALUE_    bigint,
  NEWLONGIDCLASS_    varchar(255),
  NEWLONGIDVALUE_    bigint,
  OLDSTRINGIDCLASS_  varchar(255),
  OLDSTRINGIDVALUE_  varchar(255),
  NEWSTRINGIDCLASS_  varchar(255),
  NEWSTRINGIDVALUE_  varchar(255),
  OLDLONGVALUE_      bigint,
  OLDSTRINGVALUE_    varchar(4000),
  NEWSTRINGVALUE_    varchar(4000),
  TASKINSTANCE_      bigint,
  TASKACTORID_       varchar(255),
  TASKOLDACTORID_    varchar(255),
  SWIMLANEINSTANCE_  bigint
)ENGINE= innodb;


/* This object may not be sorted properly in the script due to cirular references */
CREATE TABLE JBPM_MODULEDEFINITION
(
  ID_                 bigint Not null Auto_Increment Primary key,
  CLASS_              char(1)              NOT NULL,
  NAME_               varchar(4000),
  PROCESSDEFINITION_  bigint,
  STARTTASK_          bigint
)ENGINE= innodb;


/* This object may not be sorted properly in the script due to cirular references */
CREATE TABLE JBPM_MODULEINSTANCE
(
  ID_                  bigint Not null Auto_Increment Primary key,
  CLASS_               char(1)             NOT NULL,
  VERSION_             bigint               NOT NULL,
  PROCESSINSTANCE_     bigint,
  TASKMGMTDEFINITION_  bigint,
  NAME_                varchar(255)
)ENGINE= innodb;


/* This object may not be sorted properly in the script due to cirular references */
CREATE TABLE JBPM_NODE
(
  ID_                    bigint Not null Auto_Increment Primary key,
  CLASS_                 char(1)           NOT NULL,
  NAME_                  varchar(255),
  DESCRIPTION_           varchar(4000),
  PROCESSDEFINITION_     bigint,
  ISASYNC_               boolean,
  ISASYNCEXCL_           boolean,
  ACTION_                bigint,
  SUPERSTATE_            bigint,
  SUBPROCNAME_           varchar(255),
  SUBPROCESSDEFINITION_  bigint,
  DECISIONEXPRESSION_    varchar(255),
  DECISIONDELEGATION     bigint,
  SCRIPT_                bigint,
  SIGNAL_                bigint,
  CREATETASKS_           bigint,
  ENDTASKS_              bigint,
  NODECOLLECTIONINDEX_   bigint
)ENGINE= innodb;


/* This object may not be sorted properly in the script due to cirular references */
CREATE TABLE JBPM_POOLEDACTOR
(
  ID_                bigint Not null Auto_Increment Primary key,
  VERSION_           bigint                 NOT NULL,
  ACTORID_           varchar(255),
  SWIMLANEINSTANCE_  bigint
)ENGINE= innodb;


/* This object may not be sorted properly in the script due to cirular references */
CREATE TABLE JBPM_PROCESSDEFINITION
(
  ID_                     bigint Not null Auto_Increment Primary key,
  CLASS_                  char(1)          NOT NULL,
  NAME_                   varchar(255),
  DESCRIPTION_            varchar(4000),
  VERSION_                bigint,
  ISTERMINATIONIMPLICIT_  boolean,
  STARTSTATE_             bigint
)ENGINE= innodb;


/* This object may not be sorted properly in the script due to cirular references */
CREATE TABLE JBPM_PROCESSINSTANCE
(
  ID_                 bigint Not null Auto_Increment Primary key,
  VERSION_            bigint                NOT NULL,
  KEY_                varchar(255),
  START_              DATETIME,
  END_                DATETIME,
  ISSUSPENDED_        boolean,
  PROCESSDEFINITION_  bigint,
  ROOTTOKEN_          bigint,
  SUPERPROCESSTOKEN_  bigint
)ENGINE= innodb;


/* This object may not be sorted properly in the script due to cirular references */
CREATE TABLE JBPM_RUNTIMEACTION
(
  ID_                    bigint Not null Auto_Increment Primary key,
  VERSION_               bigint             NOT NULL,
  EVENTTYPE_             varchar(255),
  TYPE_                  char(1),
  GRAPHELEMENT_          bigint,
  PROCESSINSTANCE_       bigint,
  ACTION_                bigint,
  PROCESSINSTANCEINDEX_  bigint
)ENGINE= innodb;


/* This object may not be sorted properly in the script due to cirular references */
CREATE TABLE JBPM_SWIMLANE
(
  ID_                      bigint Not null Auto_Increment Primary key,
  NAME_                    varchar(255),
  ACTORIDEXPRESSION_       varchar(255),
  POOLEDACTORSEXPRESSION_  varchar(255),
  ASSIGNMENTDELEGATION_    bigint,
  TASKMGMTDEFINITION_      bigint
)ENGINE= innodb;


/* This object may not be sorted properly in the script due to cirular references */
CREATE TABLE JBPM_SWIMLANEINSTANCE
(
  ID_                bigint Not null Auto_Increment Primary key,
  VERSION_           bigint                 NOT NULL,
  NAME_              varchar(255),
  ACTORID_           varchar(255),
  SWIMLANE_          bigint,
  TASKMGMTINSTANCE_  bigint
)ENGINE= innodb;


/* This object may not be sorted properly in the script due to cirular references */
CREATE TABLE JBPM_TASK
(
  ID_                      bigint Not null Auto_Increment Primary key,
  NAME_                    varchar(255),
  DESCRIPTION_             varchar(4000),
  PROCESSDEFINITION_       bigint,
  ISBLOCKING_              boolean,
  ISSIGNALLING_            boolean,
  CONDITION_               varchar(255),
  DUEDATE_                 varchar(255),
  PRIORITY_                bigint,
  ACTORIDEXPRESSION_       varchar(255),
  POOLEDACTORSEXPRESSION_  varchar(255),
  TASKMGMTDEFINITION_      bigint,
  TASKNODE_                bigint,
  STARTSTATE_              bigint,
  ASSIGNMENTDELEGATION_    bigint,
  SWIMLANE_                bigint,
  TASKCONTROLLER_          bigint
)ENGINE= innodb;


/* This object may not be sorted properly in the script due to cirular references */
CREATE TABLE JBPM_TASKACTORPOOL
(
  TASKINSTANCE_  bigint                     NOT NULL,
  POOLEDACTOR_   bigint                     NOT NULL
)ENGINE= innodb;


/* This object may not be sorted properly in the script due to cirular references */
CREATE TABLE JBPM_TASKCONTROLLER
(
  ID_                        bigint Not null Auto_Increment Primary key,
  TASKCONTROLLERDELEGATION_  bigint
)ENGINE= innodb;


/* This object may not be sorted properly in the script due to cirular references */
CREATE TABLE JBPM_TASKINSTANCE
(
  ID_                bigint Not null Auto_Increment Primary key,
  CLASS_             char(1)               NOT NULL,
  VERSION_           bigint                 NOT NULL,
  NAME_              varchar(255),
  DESCRIPTION_       varchar(4000),
  ACTORID_           varchar(255),
  CREATE_            DATETIME,
  START_             DATETIME,
  END_               DATETIME,
  DUEDATE_           DATETIME,
  PRIORITY_          bigint,
  ISCANCELLED_       boolean,
  ISSUSPENDED_       boolean,
  ISOPEN_            boolean,
  ISSIGNALLING_      boolean,
  ISBLOCKING_        boolean,
  TASK_              bigint,
  TOKEN_             bigint,
  PROCINST_          bigint,
  SWIMLANINSTANCE_   bigint,
  TASKMGMTINSTANCE_  bigint
)ENGINE= innodb;


/* This object may not be sorted properly in the script due to cirular references */
CREATE TABLE JBPM_TOKEN
(
  ID_                        bigint Not null Auto_Increment Primary key,
  VERSION_                   bigint         NOT NULL,
  NAME_                      varchar(255),
  START_                     DATETIME,
  END_                       DATETIME,
  NODEENTER_                 DATETIME,
  NEXTLOGINDEX_              bigint,
  ISABLETOREACTIVATEPARENT_  boolean,
  ISTERMINATIONIMPLICIT_     boolean,
  ISSUSPENDED_               boolean,
  LOCK_                      varchar(255),
  NODE_                      bigint,
  PROCESSINSTANCE_           bigint,
  PARENT_                    bigint,
  SUBPROCESSINSTANCE_        bigint
)ENGINE= innodb;


/* This object may not be sorted properly in the script due to cirular references */
CREATE TABLE JBPM_TOKENVARIABLEMAP
(
  ID_               bigint Not null Auto_Increment Primary key,
  VERSION_          bigint                  NOT NULL,
  TOKEN_            bigint,
  CONTEXTINSTANCE_  bigint
)ENGINE= innodb;


/* This object may not be sorted properly in the script due to cirular references */
CREATE TABLE JBPM_TRANSITION
(
  ID_                 bigint Not null Auto_Increment Primary key,
  NAME_               varchar(255),
  DESCRIPTION_        varchar(4000),
  PROCESSDEFINITION_  bigint,
  FROM_               bigint,
  TO_                 bigint,
  CONDITION_          varchar(255),
  FROMINDEX_          bigint
)ENGINE= innodb;


/* This object may not be sorted properly in the script due to cirular references */
CREATE TABLE JBPM_VARIABLEACCESS
(
  ID_              bigint Not null Auto_Increment Primary key,
  VARIABLENAME_    varchar(255),
  ACCESS_          varchar(255),
  MAPPEDNAME_      varchar(255),
  SCRIPT_          bigint,
  PROCESSSTATE_    bigint,
  TASKCONTROLLER_  bigint,
  INDEX_           bigint
)ENGINE= innodb;


/* This object may not be sorted properly in the script due to cirular references */
CREATE TABLE JBPM_VARIABLEINSTANCE
(
  ID_                bigint Not null Auto_Increment Primary key,
  CLASS_             char(1)               NOT NULL,
  VERSION_           bigint                 NOT NULL,
  NAME_              varchar(255),
  CONVERTER_         char(1),
  TOKEN_             bigint,
  TOKENVARIABLEMAP_  bigint,
  PROCESSINSTANCE_   bigint,
  BYTEARRAYVALUE_    bigint,
  DATEVALUE_         DATETIME,
  DOUBLEVALUE_       FLOAT,
  LONGIDCLASS_       varchar(255),
  LONGVALUE_         bigint,
  STRINGIDCLASS_     varchar(255),
  STRINGVALUE_       varchar(4000),
  TASKINSTANCE_      bigint
)ENGINE= innodb;


/* This object may not be sorted properly in the script due to cirular references */
CREATE INDEX IDX_ACTION_ACTNDL ON JBPM_ACTION
(ACTIONDELEGATION_) ;


/* This object may not be sorted properly in the script due to cirular references */
CREATE INDEX IDX_ACTION_PROCDF ON JBPM_ACTION
(PROCESSDEFINITION_) ;


/* This object may not be sorted properly in the script due to cirular references */
CREATE INDEX IDX_ACTION_EVENT ON JBPM_ACTION
(EVENT_) ;


/* This object may not be sorted properly in the script due to cirular references */
CREATE INDEX IDX_COMMENT_TSK ON JBPM_COMMENT
(TASKINSTANCE_) ;


/* This object may not be sorted properly in the script due to cirular references */
CREATE INDEX IDX_COMMENT_TOKEN ON JBPM_COMMENT
(TOKEN_) ;


/* This object may not be sorted properly in the script due to cirular references */
CREATE INDEX IDX_DELEG_PRCD ON JBPM_DELEGATION
(PROCESSDEFINITION_) ;


/* This object may not be sorted properly in the script due to cirular references */
CREATE INDEX IDX_JOB_TSKINST ON JBPM_JOB
(TASKINSTANCE_) ;


/* This object may not be sorted properly in the script due to cirular references */
CREATE INDEX IDX_JOB_TOKEN ON JBPM_JOB
(TOKEN_) ;


/* This object may not be sorted properly in the script due to cirular references */
CREATE INDEX IDX_JOB_PRINST ON JBPM_JOB
(PROCESSINSTANCE_) ;


/* This object may not be sorted properly in the script due to cirular references */
CREATE INDEX IDX_MODDEF_PROCDF ON JBPM_MODULEDEFINITION
(PROCESSDEFINITION_) ;


/* This object may not be sorted properly in the script due to cirular references */
CREATE INDEX IDX_MODINST_PRINST ON JBPM_MODULEINSTANCE
(PROCESSINSTANCE_) ;


/* This object may not be sorted properly in the script due to cirular references */
CREATE INDEX IDX_PSTATE_SBPRCDEF ON JBPM_NODE
(SUBPROCESSDEFINITION_) ;


/* This object may not be sorted properly in the script due to cirular references */
CREATE INDEX IDX_NODE_PROCDEF ON JBPM_NODE
(PROCESSDEFINITION_) ;


/* This object may not be sorted properly in the script due to cirular references */
CREATE INDEX IDX_NODE_ACTION ON JBPM_NODE
(ACTION_) ;


/* This object may not be sorted properly in the script due to cirular references */
CREATE INDEX IDX_NODE_SUPRSTATE ON JBPM_NODE
(SUPERSTATE_) ;


/* This object may not be sorted properly in the script due to cirular references */
CREATE INDEX IDX_TSKINST_SWLANE ON JBPM_POOLEDACTOR
(SWIMLANEINSTANCE_) ;


/* This object may not be sorted properly in the script due to cirular references */
CREATE INDEX IDX_PLDACTR_ACTID ON JBPM_POOLEDACTOR
(ACTORID_) ;


/* This object may not be sorted properly in the script due to cirular references */
CREATE INDEX IDX_PROCDEF_STRTST ON JBPM_PROCESSDEFINITION
(STARTSTATE_) ;


/* This object may not be sorted properly in the script due to cirular references */
CREATE INDEX IDX_PROCIN_SPROCTK ON JBPM_PROCESSINSTANCE
(SUPERPROCESSTOKEN_) ;


/* This object may not be sorted properly in the script due to cirular references */
CREATE INDEX IDX_PROCIN_ROOTTK ON JBPM_PROCESSINSTANCE
(ROOTTOKEN_) ;


/* This object may not be sorted properly in the script due to cirular references */
CREATE INDEX IDX_PROCIN_PROCDEF ON JBPM_PROCESSINSTANCE
(PROCESSDEFINITION_) ;


/* This object may not be sorted properly in the script due to cirular references */
CREATE INDEX IDX_PROCIN_KEY ON JBPM_PROCESSINSTANCE
(KEY_) ;


/* This object may not be sorted properly in the script due to cirular references */
CREATE INDEX IDX_RTACTN_ACTION ON JBPM_RUNTIMEACTION
(ACTION_) ;


/* This object may not be sorted properly in the script due to cirular references */
CREATE INDEX IDX_RTACTN_PRCINST ON JBPM_RUNTIMEACTION
(PROCESSINSTANCE_) ;


/* This object may not be sorted properly in the script due to cirular references */
CREATE INDEX IDX_SWIMLINST_SL ON JBPM_SWIMLANEINSTANCE
(SWIMLANE_) ;


/* This object may not be sorted properly in the script due to cirular references */
CREATE INDEX IDX_TASK_PROCDEF ON JBPM_TASK
(PROCESSDEFINITION_) ;


/* This object may not be sorted properly in the script due to cirular references */
CREATE INDEX IDX_TASK_TSKNODE ON JBPM_TASK
(TASKNODE_) ;


/* This object may not be sorted properly in the script due to cirular references */
CREATE INDEX IDX_TASK_TASKMGTDF ON JBPM_TASK
(TASKMGMTDEFINITION_) ;


/* This object may not be sorted properly in the script due to cirular references */
CREATE INDEX IDX_TSKINST_TMINST ON JBPM_TASKINSTANCE
(TASKMGMTINSTANCE_) ;


/* This object may not be sorted properly in the script due to cirular references */
CREATE INDEX IDX_TSKINST_SLINST ON JBPM_TASKINSTANCE
(SWIMLANINSTANCE_) ;


/* This object may not be sorted properly in the script due to cirular references */
CREATE INDEX IDX_TASKINST_TOKN ON JBPM_TASKINSTANCE
(TOKEN_) ;


/* This object may not be sorted properly in the script due to cirular references */
CREATE INDEX IDX_TASK_ACTORID ON JBPM_TASKINSTANCE
(ACTORID_) ;


/* This object may not be sorted properly in the script due to cirular references */
CREATE INDEX IDX_TASKINST_TSK ON JBPM_TASKINSTANCE
(TASK_, PROCINST_) ;


/* This object may not be sorted properly in the script due to cirular references */
CREATE INDEX IDX_TOKEN_PARENT ON JBPM_TOKEN
(PARENT_) ;


/* This object may not be sorted properly in the script due to cirular references */
CREATE INDEX IDX_TOKEN_PROCIN ON JBPM_TOKEN
(PROCESSINSTANCE_) ;


/* This object may not be sorted properly in the script due to cirular references */
CREATE INDEX IDX_TOKEN_NODE ON JBPM_TOKEN
(NODE_) ;


/* This object may not be sorted properly in the script due to cirular references */
CREATE INDEX IDX_TOKEN_SUBPI ON JBPM_TOKEN
(SUBPROCESSINSTANCE_) ;


/* This object may not be sorted properly in the script due to cirular references */
CREATE INDEX IDX_TKVVARMP_TOKEN ON JBPM_TOKENVARIABLEMAP
(TOKEN_) ;


/* This object may not be sorted properly in the script due to cirular references */
CREATE INDEX IDX_TKVARMAP_CTXT ON JBPM_TOKENVARIABLEMAP
(CONTEXTINSTANCE_) ;


/* This object may not be sorted properly in the script due to cirular references */
CREATE INDEX IDX_TRANS_PROCDEF ON JBPM_TRANSITION
(PROCESSDEFINITION_) ;


/* This object may not be sorted properly in the script due to cirular references */
CREATE INDEX IDX_TRANSIT_FROM ON JBPM_TRANSITION
(FROM_) ;


/* This object may not be sorted properly in the script due to cirular references */
CREATE INDEX IDX_TRANSIT_TO ON JBPM_TRANSITION
(TO_) ;


/* This object may not be sorted properly in the script due to cirular references */
CREATE INDEX IDX_VARINST_TK ON JBPM_VARIABLEINSTANCE
(TOKEN_) ;


/* This object may not be sorted properly in the script due to cirular references */
CREATE INDEX IDX_VARINST_TKVARMP ON JBPM_VARIABLEINSTANCE
(TOKENVARIABLEMAP_) ;


/* This object may not be sorted properly in the script due to cirular references */
CREATE INDEX IDX_VARINST_PRCINS ON JBPM_VARIABLEINSTANCE
(PROCESSINSTANCE_) ;



ALTER TABLE JBPM_TASKACTORPOOL ADD 
  PRIMARY KEY
 (TASKINSTANCE_, POOLEDACTOR_);


ALTER TABLE JBPM_ID_GROUP ADD 
  CONSTRAINT FK_ID_GRP_PARENT 
 FOREIGN KEY (PARENT_) 
 REFERENCES JBPM_ID_GROUP (ID_);


ALTER TABLE JBPM_ID_MEMBERSHIP ADD 
  CONSTRAINT FK_ID_MEMSHIP_GRP 
 FOREIGN KEY (GROUP_) 
 REFERENCES JBPM_ID_GROUP (ID_);

ALTER TABLE JBPM_ID_MEMBERSHIP ADD 
  CONSTRAINT FK_ID_MEMSHIP_USR 
 FOREIGN KEY (USER_) 
 REFERENCES JBPM_ID_USER (ID_);


ALTER TABLE JBPM_ACTION ADD 
  CONSTRAINT FK_ACTION_ACTNDEL 
 FOREIGN KEY (ACTIONDELEGATION_) 
 REFERENCES JBPM_DELEGATION (ID_);

ALTER TABLE JBPM_ACTION ADD 
  CONSTRAINT FK_ACTION_EVENT 
 FOREIGN KEY (EVENT_) 
 REFERENCES JBPM_EVENT (ID_);

ALTER TABLE JBPM_ACTION ADD 
  CONSTRAINT FK_ACTION_EXPTHDL 
 FOREIGN KEY (EXCEPTIONHANDLER_) 
 REFERENCES JBPM_EXCEPTIONHANDLER (ID_);

ALTER TABLE JBPM_ACTION ADD 
  CONSTRAINT FK_ACTION_PROCDEF 
 FOREIGN KEY (PROCESSDEFINITION_) 
 REFERENCES JBPM_PROCESSDEFINITION (ID_);

ALTER TABLE JBPM_ACTION ADD 
  CONSTRAINT FK_ACTION_REFACT 
 FOREIGN KEY (REFERENCEDACTION_) 
 REFERENCES JBPM_ACTION (ID_);

ALTER TABLE JBPM_ACTION ADD 
  CONSTRAINT FK_CRTETIMERACT_TA 
 FOREIGN KEY (TIMERACTION_) 
 REFERENCES JBPM_ACTION (ID_);


ALTER TABLE JBPM_BYTEARRAY ADD 
  CONSTRAINT FK_BYTEARR_FILDEF 
 FOREIGN KEY (FILEDEFINITION_) 
 REFERENCES JBPM_MODULEDEFINITION (ID_);


ALTER TABLE JBPM_BYTEBLOCK ADD 
  CONSTRAINT FK_BYTEBLOCK_FILE 
 FOREIGN KEY (PROCESSFILE_) 
 REFERENCES JBPM_BYTEARRAY (ID_);


ALTER TABLE JBPM_COMMENT ADD 
  CONSTRAINT FK_COMMENT_TOKEN 
 FOREIGN KEY (TOKEN_) 
 REFERENCES JBPM_TOKEN (ID_);

ALTER TABLE JBPM_COMMENT ADD 
  CONSTRAINT FK_COMMENT_TSK 
 FOREIGN KEY (TASKINSTANCE_) 
 REFERENCES JBPM_TASKINSTANCE (ID_);


ALTER TABLE JBPM_DECISIONCONDITIONS ADD 
  CONSTRAINT FK_DECCOND_DEC 
 FOREIGN KEY (DECISION_) 
 REFERENCES JBPM_NODE (ID_);


ALTER TABLE JBPM_DELEGATION ADD 
  CONSTRAINT FK_DELEGATION_PRCD 
 FOREIGN KEY (PROCESSDEFINITION_) 
 REFERENCES JBPM_PROCESSDEFINITION (ID_);


ALTER TABLE JBPM_EVENT ADD 
  CONSTRAINT FK_EVENT_NODE 
 FOREIGN KEY (NODE_) 
 REFERENCES JBPM_NODE (ID_);

ALTER TABLE JBPM_EVENT ADD 
  CONSTRAINT FK_EVENT_PROCDEF 
 FOREIGN KEY (PROCESSDEFINITION_) 
 REFERENCES JBPM_PROCESSDEFINITION (ID_);

ALTER TABLE JBPM_EVENT ADD 
  CONSTRAINT FK_EVENT_TASK 
 FOREIGN KEY (TASK_) 
 REFERENCES JBPM_TASK (ID_);

ALTER TABLE JBPM_EVENT ADD 
  CONSTRAINT FK_EVENT_TRANS 
 FOREIGN KEY (TRANSITION_) 
 REFERENCES JBPM_TRANSITION (ID_);


ALTER TABLE JBPM_JOB ADD
  CONSTRAINT FK_JOB_ACTION
 FOREIGN KEY (ACTION_) 
 REFERENCES JBPM_ACTION (ID_);

ALTER TABLE JBPM_JOB ADD 
  CONSTRAINT FK_JOB_NODE 
 FOREIGN KEY (NODE_) 
 REFERENCES JBPM_NODE (ID_);

ALTER TABLE JBPM_JOB ADD 
  CONSTRAINT FK_JOB_PRINST 
 FOREIGN KEY (PROCESSINSTANCE_) 
 REFERENCES JBPM_PROCESSINSTANCE (ID_);

ALTER TABLE JBPM_JOB ADD 
  CONSTRAINT FK_JOB_TOKEN 
 FOREIGN KEY (TOKEN_) 
 REFERENCES JBPM_TOKEN (ID_);

ALTER TABLE JBPM_JOB ADD 
  CONSTRAINT FK_JOB_TSKINST 
 FOREIGN KEY (TASKINSTANCE_) 
 REFERENCES JBPM_TASKINSTANCE (ID_);


ALTER TABLE JBPM_LOG ADD 
  CONSTRAINT FK_LOG_ACTION
 FOREIGN KEY (ACTION_) 
 REFERENCES JBPM_ACTION (ID_);

ALTER TABLE JBPM_LOG ADD 
  CONSTRAINT FK_LOG_CHILDTOKEN 
 FOREIGN KEY (CHILD_) 
 REFERENCES JBPM_TOKEN (ID_);

ALTER TABLE JBPM_LOG ADD 
  CONSTRAINT FK_LOG_DESTNODE 
 FOREIGN KEY (DESTINATIONNODE_) 
 REFERENCES JBPM_NODE (ID_);

ALTER TABLE JBPM_LOG ADD 
  CONSTRAINT FK_LOG_NEWBYTES 
 FOREIGN KEY (NEWBYTEARRAY_) 
 REFERENCES JBPM_BYTEARRAY (ID_);

ALTER TABLE JBPM_LOG ADD 
  CONSTRAINT FK_LOG_NODE 
 FOREIGN KEY (NODE_) 
 REFERENCES JBPM_NODE (ID_);

ALTER TABLE JBPM_LOG ADD 
  CONSTRAINT FK_LOG_OLDBYTES 
 FOREIGN KEY (OLDBYTEARRAY_) 
 REFERENCES JBPM_BYTEARRAY (ID_);

ALTER TABLE JBPM_LOG ADD 
  CONSTRAINT FK_LOG_PARENT 
 FOREIGN KEY (PARENT_) 
 REFERENCES JBPM_LOG (ID_);

ALTER TABLE JBPM_LOG ADD 
  CONSTRAINT FK_LOG_SOURCENODE 
 FOREIGN KEY (SOURCENODE_) 
 REFERENCES JBPM_NODE (ID_);

ALTER TABLE JBPM_LOG ADD 
  CONSTRAINT FK_LOG_SWIMINST 
 FOREIGN KEY (SWIMLANEINSTANCE_) 
 REFERENCES JBPM_SWIMLANEINSTANCE (ID_);

ALTER TABLE JBPM_LOG ADD 
  CONSTRAINT FK_LOG_TASKINST 
 FOREIGN KEY (TASKINSTANCE_) 
 REFERENCES JBPM_TASKINSTANCE (ID_);

ALTER TABLE JBPM_LOG ADD 
  CONSTRAINT FK_LOG_TOKEN 
 FOREIGN KEY (TOKEN_) 
 REFERENCES JBPM_TOKEN (ID_);

ALTER TABLE JBPM_LOG ADD 
  CONSTRAINT FK_LOG_TRANSITION
 FOREIGN KEY (TRANSITION_) 
 REFERENCES JBPM_TRANSITION (ID_);

ALTER TABLE JBPM_LOG ADD 
  CONSTRAINT FK_LOG_VARINST 
 FOREIGN KEY (VARIABLEINSTANCE_) 
 REFERENCES JBPM_VARIABLEINSTANCE (ID_);


ALTER TABLE JBPM_MODULEDEFINITION ADD 
  CONSTRAINT FK_MODDEF_PROCDEF 
 FOREIGN KEY (PROCESSDEFINITION_) 
 REFERENCES JBPM_PROCESSDEFINITION (ID_);

ALTER TABLE JBPM_MODULEDEFINITION ADD 
  CONSTRAINT FK_TSKDEF_START 
 FOREIGN KEY (STARTTASK_) 
 REFERENCES JBPM_TASK (ID_);


ALTER TABLE JBPM_MODULEINSTANCE ADD 
  CONSTRAINT FK_MODINST_PRCINST 
 FOREIGN KEY (PROCESSINSTANCE_) 
 REFERENCES JBPM_PROCESSINSTANCE (ID_);

ALTER TABLE JBPM_MODULEINSTANCE ADD 
  CONSTRAINT FK_TASKMGTINST_TMD 
 FOREIGN KEY (TASKMGMTDEFINITION_) 
 REFERENCES JBPM_MODULEDEFINITION (ID_);


ALTER TABLE JBPM_NODE ADD 
  CONSTRAINT FK_DECISION_DELEG 
 FOREIGN KEY (DECISIONDELEGATION) 
 REFERENCES JBPM_DELEGATION (ID_);

ALTER TABLE JBPM_NODE ADD 
  CONSTRAINT FK_NODE_ACTION
 FOREIGN KEY (ACTION_) 
 REFERENCES JBPM_ACTION (ID_);

ALTER TABLE JBPM_NODE ADD 
  CONSTRAINT FK_NODE_PROCDEF 
 FOREIGN KEY (PROCESSDEFINITION_) 
 REFERENCES JBPM_PROCESSDEFINITION (ID_);

ALTER TABLE JBPM_NODE ADD 
  CONSTRAINT FK_NODE_SCRIPT 
 FOREIGN KEY (SCRIPT_) 
 REFERENCES JBPM_ACTION (ID_);

ALTER TABLE JBPM_NODE ADD 
  CONSTRAINT FK_NODE_SUPERSTATE 
 FOREIGN KEY (SUPERSTATE_) 
 REFERENCES JBPM_NODE (ID_);

ALTER TABLE JBPM_NODE ADD 
  CONSTRAINT FK_PROCST_SBPRCDEF 
 FOREIGN KEY (SUBPROCESSDEFINITION_) 
 REFERENCES JBPM_PROCESSDEFINITION (ID_);


ALTER TABLE JBPM_POOLEDACTOR ADD 
  CONSTRAINT FK_POOLEDACTOR_SLI 
 FOREIGN KEY (SWIMLANEINSTANCE_) 
 REFERENCES JBPM_SWIMLANEINSTANCE (ID_);


ALTER TABLE JBPM_PROCESSDEFINITION ADD 
  CONSTRAINT FK_PROCDEF_STRTSTA 
 FOREIGN KEY (STARTSTATE_) 
 REFERENCES JBPM_NODE (ID_);


ALTER TABLE JBPM_PROCESSINSTANCE ADD 
  CONSTRAINT FK_PROCIN_PROCDEF 
 FOREIGN KEY (PROCESSDEFINITION_) 
 REFERENCES JBPM_PROCESSDEFINITION (ID_);

ALTER TABLE JBPM_PROCESSINSTANCE ADD 
  CONSTRAINT FK_PROCIN_ROOTTKN 
 FOREIGN KEY (ROOTTOKEN_) 
 REFERENCES JBPM_TOKEN (ID_);

ALTER TABLE JBPM_PROCESSINSTANCE ADD 
  CONSTRAINT FK_PROCIN_SPROCTKN 
 FOREIGN KEY (SUPERPROCESSTOKEN_) 
 REFERENCES JBPM_TOKEN (ID_);


ALTER TABLE JBPM_RUNTIMEACTION ADD 
  CONSTRAINT FK_RTACTN_ACTION
 FOREIGN KEY (ACTION_) 
 REFERENCES JBPM_ACTION (ID_);

ALTER TABLE JBPM_RUNTIMEACTION ADD 
  CONSTRAINT FK_RTACTN_PROCINST 
 FOREIGN KEY (PROCESSINSTANCE_) 
 REFERENCES JBPM_PROCESSINSTANCE (ID_);


ALTER TABLE JBPM_SWIMLANE ADD 
  CONSTRAINT FK_SWL_ASSDEL 
 FOREIGN KEY (ASSIGNMENTDELEGATION_) 
 REFERENCES JBPM_DELEGATION (ID_);

ALTER TABLE JBPM_SWIMLANE ADD 
  CONSTRAINT FK_SWL_TSKMGMTDEF 
 FOREIGN KEY (TASKMGMTDEFINITION_) 
 REFERENCES JBPM_MODULEDEFINITION (ID_);


ALTER TABLE JBPM_SWIMLANEINSTANCE ADD 
  CONSTRAINT FK_SWIMLANEINST_SL 
 FOREIGN KEY (SWIMLANE_) 
 REFERENCES JBPM_SWIMLANE (ID_);

ALTER TABLE JBPM_SWIMLANEINSTANCE ADD 
  CONSTRAINT FK_SWIMLANEINST_TM 
 FOREIGN KEY (TASKMGMTINSTANCE_) 
 REFERENCES JBPM_MODULEINSTANCE (ID_);


ALTER TABLE JBPM_TASK ADD 
  CONSTRAINT FK_TASK_ASSDEL 
 FOREIGN KEY (ASSIGNMENTDELEGATION_) 
 REFERENCES JBPM_DELEGATION (ID_);

ALTER TABLE JBPM_TASK ADD 
  CONSTRAINT FK_TASK_PROCDEF 
 FOREIGN KEY (PROCESSDEFINITION_) 
 REFERENCES JBPM_PROCESSDEFINITION (ID_);

ALTER TABLE JBPM_TASK ADD 
  CONSTRAINT FK_TASK_STARTST 
 FOREIGN KEY (STARTSTATE_) 
 REFERENCES JBPM_NODE (ID_);

ALTER TABLE JBPM_TASK ADD 
  CONSTRAINT FK_TASK_SWIMLANE 
 FOREIGN KEY (SWIMLANE_) 
 REFERENCES JBPM_SWIMLANE (ID_);

ALTER TABLE JBPM_TASK ADD 
  CONSTRAINT FK_TASK_TASKMGTDEF 
 FOREIGN KEY (TASKMGMTDEFINITION_) 
 REFERENCES JBPM_MODULEDEFINITION (ID_);

ALTER TABLE JBPM_TASK ADD 
  CONSTRAINT FK_TASK_TASKNODE 
 FOREIGN KEY (TASKNODE_) 
 REFERENCES JBPM_NODE (ID_);

ALTER TABLE JBPM_TASK ADD 
  CONSTRAINT FK_TSK_TSKCTRL 
 FOREIGN KEY (TASKCONTROLLER_) 
 REFERENCES JBPM_TASKCONTROLLER (ID_);


ALTER TABLE JBPM_TASKACTORPOOL ADD 
  CONSTRAINT FK_TASKACTPL_TSKI 
 FOREIGN KEY (TASKINSTANCE_) 
 REFERENCES JBPM_TASKINSTANCE (ID_);

ALTER TABLE JBPM_TASKACTORPOOL ADD 
  CONSTRAINT FK_TSKACTPOL_PLACT 
 FOREIGN KEY (POOLEDACTOR_) 
 REFERENCES JBPM_POOLEDACTOR (ID_);


ALTER TABLE JBPM_TASKCONTROLLER ADD 
  CONSTRAINT FK_TSKCTRL_DELEG 
 FOREIGN KEY (TASKCONTROLLERDELEGATION_) 
 REFERENCES JBPM_DELEGATION (ID_);


ALTER TABLE JBPM_TASKINSTANCE ADD 
  CONSTRAINT FK_TASKINST_SLINST 
 FOREIGN KEY (SWIMLANINSTANCE_) 
 REFERENCES JBPM_SWIMLANEINSTANCE (ID_);

ALTER TABLE JBPM_TASKINSTANCE ADD 
  CONSTRAINT FK_TASKINST_TASK 
 FOREIGN KEY (TASK_) 
 REFERENCES JBPM_TASK (ID_);

ALTER TABLE JBPM_TASKINSTANCE ADD 
  CONSTRAINT FK_TASKINST_TMINST 
 FOREIGN KEY (TASKMGMTINSTANCE_) 
 REFERENCES JBPM_MODULEINSTANCE (ID_);

ALTER TABLE JBPM_TASKINSTANCE ADD 
  CONSTRAINT FK_TASKINST_TOKEN 
 FOREIGN KEY (TOKEN_) 
 REFERENCES JBPM_TOKEN (ID_);

ALTER TABLE JBPM_TASKINSTANCE ADD 
  CONSTRAINT FK_TSKINS_PRCINS 
 FOREIGN KEY (PROCINST_) 
 REFERENCES JBPM_PROCESSINSTANCE (ID_);


ALTER TABLE JBPM_TOKEN ADD 
  CONSTRAINT FK_TOKEN_NODE 
 FOREIGN KEY (NODE_) 
 REFERENCES JBPM_NODE (ID_);

ALTER TABLE JBPM_TOKEN ADD 
  CONSTRAINT FK_TOKEN_PARENT 
 FOREIGN KEY (PARENT_) 
 REFERENCES JBPM_TOKEN (ID_);

ALTER TABLE JBPM_TOKEN ADD 
  CONSTRAINT FK_TOKEN_PROCINST 
 FOREIGN KEY (PROCESSINSTANCE_) 
 REFERENCES JBPM_PROCESSINSTANCE (ID_);

ALTER TABLE JBPM_TOKEN ADD 
  CONSTRAINT FK_TOKEN_SUBPI 
 FOREIGN KEY (SUBPROCESSINSTANCE_) 
 REFERENCES JBPM_PROCESSINSTANCE (ID_);


ALTER TABLE JBPM_TOKENVARIABLEMAP ADD 
  CONSTRAINT FK_TKVARMAP_CTXT 
 FOREIGN KEY (CONTEXTINSTANCE_) 
 REFERENCES JBPM_MODULEINSTANCE (ID_);

ALTER TABLE JBPM_TOKENVARIABLEMAP ADD 
  CONSTRAINT FK_TKVARMAP_TOKEN 
 FOREIGN KEY (TOKEN_) 
 REFERENCES JBPM_TOKEN (ID_);


ALTER TABLE JBPM_TRANSITION ADD 
  CONSTRAINT FK_TRANSITION_FROM 
 FOREIGN KEY (FROM_) 
 REFERENCES JBPM_NODE (ID_);

ALTER TABLE JBPM_TRANSITION ADD 
  CONSTRAINT FK_TRANSITION_TO 
 FOREIGN KEY (TO_) 
 REFERENCES JBPM_NODE (ID_);

ALTER TABLE JBPM_TRANSITION ADD 
  CONSTRAINT FK_TRANS_PROCDEF 
 FOREIGN KEY (PROCESSDEFINITION_) 
 REFERENCES JBPM_PROCESSDEFINITION (ID_);


ALTER TABLE JBPM_VARIABLEACCESS ADD 
  CONSTRAINT FK_VARACC_PROCST 
 FOREIGN KEY (PROCESSSTATE_) 
 REFERENCES JBPM_NODE (ID_);

ALTER TABLE JBPM_VARIABLEACCESS ADD 
  CONSTRAINT FK_VARACC_SCRIPT
 FOREIGN KEY (SCRIPT_) 
 REFERENCES JBPM_ACTION (ID_);

ALTER TABLE JBPM_VARIABLEACCESS ADD 
  CONSTRAINT FK_VARACC_TSKCTRL 
 FOREIGN KEY (TASKCONTROLLER_) 
 REFERENCES JBPM_TASKCONTROLLER (ID_);


ALTER TABLE JBPM_VARIABLEINSTANCE ADD 
  CONSTRAINT FK_BYTEINST_ARRAY 
 FOREIGN KEY (BYTEARRAYVALUE_) 
 REFERENCES JBPM_BYTEARRAY (ID_);

ALTER TABLE JBPM_VARIABLEINSTANCE ADD 
  CONSTRAINT FK_VARINST_PRCINST 
 FOREIGN KEY (PROCESSINSTANCE_) 
 REFERENCES JBPM_PROCESSINSTANCE (ID_);

ALTER TABLE JBPM_VARIABLEINSTANCE ADD 
  CONSTRAINT FK_VARINST_TK 
 FOREIGN KEY (TOKEN_) 
 REFERENCES JBPM_TOKEN (ID_);

ALTER TABLE JBPM_VARIABLEINSTANCE ADD 
  CONSTRAINT FK_VARINST_TKVARMP 
 FOREIGN KEY (TOKENVARIABLEMAP_) 
 REFERENCES JBPM_TOKENVARIABLEMAP (ID_);

ALTER TABLE JBPM_VARIABLEINSTANCE ADD 
  CONSTRAINT FK_VAR_TSKINST 
 FOREIGN KEY (TASKINSTANCE_) 
 REFERENCES JBPM_TASKINSTANCE (ID_);

commit;


