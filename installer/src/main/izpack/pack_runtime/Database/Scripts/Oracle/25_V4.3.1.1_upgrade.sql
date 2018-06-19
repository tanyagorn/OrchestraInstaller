

CREATE INDEX IDX_ORC_MSG_LIST_ID ON ORC_MESSAGE_LIST (MLI_ID);

CREATE INDEX IDX_ORC_MSG_LIST_AREA_IDENT ON ORC_MESSAGE_LIST (MLI_AREA, MLI_IDENTIFIER);


CREATE INDEX IDX_ORC_MSG_LISTENT_MSGREF ON ORC_MESSAGE_LIST_ENTRY (MLE_MESSAGE_REF);

CREATE INDEX IDX_ORC_MSG_LISTENT_ID_REFER ON ORC_MESSAGE_LIST_ENTRY (MLE_ID, MLE_REFERENCE);

CREATE INDEX IDX_ORC_MSG_LISTENT_ID_MSGREF ON ORC_MESSAGE_LIST_ENTRY (MLE_ID, MLE_MESSAGE_REF);


CREATE INDEX IDX_ORC_MSG_LISTPRP_ID_REF_KEY ON ORC_MESSAGE_LIST_ENTRY_PROP (MLP_ID, MLP_REFERENCE, MLP_KEY);

CREATE INDEX IDX_ORC_MSG_LISTPRP_ID_KEY_VAL ON ORC_MESSAGE_LIST_ENTRY_PROP (MLP_ID, MLP_KEY, MLP_VALUE);


CREATE INDEX IDX_ORC_MSG_LISTIN_ID_IDX ON ORC_MESSAGE_LIST_INDEX (MLI_ID, MLI_INDEX);

CREATE INDEX IDX_ORC_MSG_LISTIN_ID_REF ON ORC_MESSAGE_LIST_INDEX (MLI_ID, MLI_REFERENCE);



CREATE INDEX IDX_ORC_BUSINESS_TRANSACTION2 ON ORC_BUSINESS_TRANSACTION (OBT_OWNER, OBT_TA_IDENTIFIER);
