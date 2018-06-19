
BEGIN
dbms_stats.delete_column_stats(
ownname=>'ORCHESTRA', tabname=>'ORC_PROCESS_STATE', colname=>'PRS_PROCESS_ID', col_stat_type=>'HISTOGRAM');
END;
/

BEGIN
dbms_stats.set_table_prefs('ORCHESTRA', 'ORC_PROCESS_STATE','METHOD_OPT', 'FOR ALL COLUMNS SIZE AUTO, FOR COLUMNS SIZE 1 PRS_PROCESS_ID');
END;
/

BEGIN
dbms_stats.delete_column_stats(
ownname=>'ORCHESTRA', tabname=>'ORC_PROCESS_BUS_EVENT', colname=>'PBE_PROCESSID', col_stat_type=>'HISTOGRAM');
END;
/

BEGIN
dbms_stats.set_table_prefs('ORCHESTRA', 'ORC_PROCESS_BUS_EVENT','METHOD_OPT', 'FOR ALL COLUMNS SIZE AUTO, FOR COLUMNS SIZE 1 PBE_PROCESSID');
END;
/

BEGIN
dbms_stats.delete_column_stats(
ownname=>'ORCHESTRA', tabname=>'ORC_PROCESS_RUNTIME_STATE', colname=>'PRS_PROCESS', col_stat_type=>'HISTOGRAM');
END;
/

BEGIN
dbms_stats.set_table_prefs('ORCHESTRA', 'ORC_PROCESS_RUNTIME_STATE','METHOD_OPT', 'FOR ALL COLUMNS SIZE AUTO, FOR COLUMNS SIZE 1 PRS_PROCESS');
END;
/

BEGIN
dbms_stats.delete_column_stats(
ownname=>'ORCHESTRA', tabname=>'ORC_PROCESS_EXT_BUSINESS_KEYS', colname=>'PEK_PROCESS_ID', col_stat_type=>'HISTOGRAM');
END;
/

BEGIN
dbms_stats.set_table_prefs('ORCHESTRA', 'ORC_PROCESS_EXT_BUSINESS_KEYS','METHOD_OPT', 'FOR ALL COLUMNS SIZE AUTO, FOR COLUMNS SIZE 1 PEK_PROCESS_ID');
END;
/

BEGIN
dbms_stats.delete_column_stats(
ownname=>'ORCHESTRA', tabname=>'ORC_EVENT_PROCESS', colname=>'EVT_PROCESS', col_stat_type=>'HISTOGRAM');
END;
/

BEGIN
dbms_stats.set_table_prefs('ORCHESTRA', 'ORC_EVENT_PROCESS','METHOD_OPT', 'FOR ALL COLUMNS SIZE AUTO, FOR COLUMNS SIZE 1 EVT_PROCESS');
END;
/

BEGIN
dbms_stats.delete_column_stats(
ownname=>'ORCHESTRA', tabname=>'ORC_EVENT_PROCESS_TOKEN', colname=>'EVT_PROCESS', col_stat_type=>'HISTOGRAM');
END;
/

BEGIN
dbms_stats.set_table_prefs('ORCHESTRA', 'ORC_EVENT_PROCESS_TOKEN','METHOD_OPT', 'FOR ALL COLUMNS SIZE AUTO, FOR COLUMNS SIZE 1 EVT_PROCESS');
END;
/

BEGIN
dbms_stats.delete_column_stats(
ownname=>'ORCHESTRA', tabname=>'ORC_EVT_PROCESS_VARIABLES', colname=>'EVV_PROCESS_ID', col_stat_type=>'HISTOGRAM');
END;
/

BEGIN
dbms_stats.set_table_prefs('ORCHESTRA', 'ORC_EVT_PROCESS_VARIABLES','METHOD_OPT', 'FOR ALL COLUMNS SIZE AUTO, FOR COLUMNS SIZE 1 EVV_PROCESS_ID');
END;
/

BEGIN
dbms_stats.delete_column_stats(
ownname=>'ORCHESTRA', tabname=>'ORC_EVT_LOCAL_VARIABLES', colname=>'EVV_PROCESS_ID', col_stat_type=>'HISTOGRAM');
END;
/

BEGIN
dbms_stats.set_table_prefs('ORCHESTRA', 'ORC_EVT_LOCAL_VARIABLES','METHOD_OPT', 'FOR ALL COLUMNS SIZE AUTO, FOR COLUMNS SIZE 1 EVV_PROCESS_ID');
END;
/
