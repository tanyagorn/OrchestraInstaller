CALL sysproc.admin_cmd ('REORG TABLE orc_adapter_state');
CALL sysproc.admin_cmd ('REORG TABLE orc_archive');
CALL sysproc.admin_cmd ('REORG TABLE orc_channel');
CALL sysproc.admin_cmd ('REORG TABLE orc_cluster_environment');
CALL sysproc.admin_cmd ('REORG TABLE orc_cluster_lock');
CALL sysproc.admin_cmd ('REORG TABLE orc_cluster_lock_state');
CALL sysproc.admin_cmd ('REORG TABLE orc_content_mapping');
CALL sysproc.admin_cmd ('REORG TABLE orc_content_type');
CALL sysproc.admin_cmd ('REORG TABLE orc_dbs_page');


CALL sysproc.admin_cmd ('REORG TABLE orc_esb_router');
CALL sysproc.admin_cmd ('REORG TABLE orc_esb_signal_state');
CALL sysproc.admin_cmd ('REORG TABLE orc_esb_tcp_cell');
CALL sysproc.admin_cmd ('REORG TABLE orc_esb_topic_state');
CALL sysproc.admin_cmd ('REORG TABLE orc_event');

CALL sysproc.admin_cmd ('REORG TABLE orc_event_error_context');
CALL sysproc.admin_cmd ('REORG TABLE orc_event_process');
CALL sysproc.admin_cmd ('REORG TABLE orc_event_process_token');
CALL sysproc.admin_cmd ('REORG TABLE orc_event_scenario_context');

CALL sysproc.admin_cmd ('REORG TABLE orc_event_system');
CALL sysproc.admin_cmd ('REORG TABLE orc_evt_local_variables');
CALL sysproc.admin_cmd ('REORG TABLE orc_evt_process_variables');

CALL sysproc.admin_cmd ('REORG TABLE orc_ext_archive');
CALL sysproc.admin_cmd ('REORG TABLE orc_ext_archive_error');
CALL sysproc.admin_cmd ('REORG TABLE orc_global_transaction');
CALL sysproc.admin_cmd ('REORG TABLE orc_java_class');

CALL sysproc.admin_cmd ('REORG TABLE orc_kpi_dim_value');
CALL sysproc.admin_cmd ('REORG TABLE orc_kpi_instance');
CALL sysproc.admin_cmd ('REORG TABLE orc_kpi_value');
CALL sysproc.admin_cmd ('REORG TABLE orc_landscape');
CALL sysproc.admin_cmd ('REORG TABLE orc_lta_message');
CALL sysproc.admin_cmd ('REORG TABLE orc_lta_process_bus_event');
CALL sysproc.admin_cmd ('REORG TABLE orc_lta_process_ext_bsns_keys');
CALL sysproc.admin_cmd ('REORG TABLE orc_lta_process_overview');
CALL sysproc.admin_cmd ('REORG TABLE orc_lta_process_state');
CALL sysproc.admin_cmd ('REORG TABLE orc_message');
CALL sysproc.admin_cmd ('REORG TABLE orc_message_data');
CALL sysproc.admin_cmd ('REORG TABLE orc_message_interface');
CALL sysproc.admin_cmd ('REORG TABLE orc_message_list');
CALL sysproc.admin_cmd ('REORG TABLE orc_message_list_entry');
CALL sysproc.admin_cmd ('REORG TABLE orc_message_list_entry_prop');
CALL sysproc.admin_cmd ('REORG TABLE orc_message_list_index');
CALL sysproc.admin_cmd ('REORG TABLE orc_message_mapping');
CALL sysproc.admin_cmd ('REORG TABLE orc_message_properties');
CALL sysproc.admin_cmd ('REORG TABLE orc_message_referers');
CALL sysproc.admin_cmd ('REORG TABLE orc_message_type');
CALL sysproc.admin_cmd ('REORG TABLE orc_monitor_nodes');
CALL sysproc.admin_cmd ('REORG TABLE orc_monitor_settings');
CALL sysproc.admin_cmd ('REORG TABLE orc_monitor_tablesettings');
CALL sysproc.admin_cmd ('REORG TABLE orc_process_arbort');
CALL sysproc.admin_cmd ('REORG TABLE orc_process_bus_event');
CALL sysproc.admin_cmd ('REORG TABLE orc_process_execution');
CALL sysproc.admin_cmd ('REORG TABLE orc_process_ext_business_keys');
CALL sysproc.admin_cmd ('REORG TABLE orc_process_fifo_schedule');
CALL sysproc.admin_cmd ('REORG TABLE orc_process_mode');
CALL sysproc.admin_cmd ('REORG TABLE orc_process_modells');
CALL sysproc.admin_cmd ('REORG TABLE orc_process_modells_hist');
CALL sysproc.admin_cmd ('REORG TABLE orc_process_overview');
CALL sysproc.admin_cmd ('REORG TABLE orc_process_runtime_state');
CALL sysproc.admin_cmd ('REORG TABLE orc_process_scenario');
CALL sysproc.admin_cmd ('REORG TABLE orc_process_scenario_history');
CALL sysproc.admin_cmd ('REORG TABLE orc_process_state');
CALL sysproc.admin_cmd ('REORG TABLE orc_process_token_state');
CALL sysproc.admin_cmd ('REORG TABLE orc_process_wait_list');
CALL sysproc.admin_cmd ('REORG TABLE orc_processinstance_state');
CALL sysproc.admin_cmd ('REORG TABLE orc_prs_description');
CALL sysproc.admin_cmd ('REORG TABLE orc_prt_partnerconfig');
CALL sysproc.admin_cmd ('REORG TABLE orc_queue_topic_state');
CALL sysproc.admin_cmd ('REORG TABLE orc_recovery_data');
CALL sysproc.admin_cmd ('REORG TABLE orc_sec_credential_v2');

CALL sysproc.admin_cmd ('REORG TABLE orc_sec_group_roles_v2');
CALL sysproc.admin_cmd ('REORG TABLE orc_sec_group_v2');
CALL sysproc.admin_cmd ('REORG TABLE orc_sec_keystore_v2');

CALL sysproc.admin_cmd ('REORG TABLE orc_sec_role_v2');
CALL sysproc.admin_cmd ('REORG TABLE orc_sec_truststore_v2');

CALL sysproc.admin_cmd ('REORG TABLE orc_sec_user_auth_methods_v2');
CALL sysproc.admin_cmd ('REORG TABLE orc_sec_user_certificate');
CALL sysproc.admin_cmd ('REORG TABLE orc_sec_user_group_v2');
CALL sysproc.admin_cmd ('REORG TABLE orc_sec_user_pkcs12');

CALL sysproc.admin_cmd ('REORG TABLE orc_sec_user_roles_v2');
CALL sysproc.admin_cmd ('REORG TABLE orc_sec_user_ssh');
CALL sysproc.admin_cmd ('REORG TABLE orc_sec_user_state');
CALL sysproc.admin_cmd ('REORG TABLE orc_sequence_counter');
CALL sysproc.admin_cmd ('REORG TABLE orc_server_settings');

CALL sysproc.admin_cmd ('REORG TABLE orc_svc_declaration');
CALL sysproc.admin_cmd ('REORG TABLE orc_svc_provider');
CALL sysproc.admin_cmd ('REORG TABLE orc_timing_data');
CALL sysproc.admin_cmd ('REORG TABLE orc_topic_queue');
CALL sysproc.admin_cmd ('REORG TABLE orc_transaction');
CALL sysproc.admin_cmd ('REORG TABLE orc_transaction_branch');
CALL sysproc.admin_cmd ('REORG TABLE orc_transaction_log_entry');
CALL sysproc.admin_cmd ('REORG TABLE orc_user_pwd_table');
CALL sysproc.admin_cmd ('REORG TABLE orc_userscenariomap');
CALL sysproc.admin_cmd ('REORG TABLE orc_work_queue');
CALL sysproc.admin_cmd ('REORG TABLE orc_xml_schema');
CALL sysproc.admin_cmd ('REORG TABLE qrtz_blob_triggers');
CALL sysproc.admin_cmd ('REORG TABLE qrtz_calendars');
CALL sysproc.admin_cmd ('REORG TABLE qrtz_cron_triggers');
CALL sysproc.admin_cmd ('REORG TABLE qrtz_fired_triggers');
CALL sysproc.admin_cmd ('REORG TABLE qrtz_job_details');
CALL sysproc.admin_cmd ('REORG TABLE qrtz_job_listeners');
CALL sysproc.admin_cmd ('REORG TABLE qrtz_locks');
CALL sysproc.admin_cmd ('REORG TABLE qrtz_paused_trigger_grps');
CALL sysproc.admin_cmd ('REORG TABLE qrtz_scheduler_state');
CALL sysproc.admin_cmd ('REORG TABLE qrtz_simple_triggers');
CALL sysproc.admin_cmd ('REORG TABLE qrtz_trigger_listeners');
CALL sysproc.admin_cmd ('REORG TABLE qrtz_triggers');
