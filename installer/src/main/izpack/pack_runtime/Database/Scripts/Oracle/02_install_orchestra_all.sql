
WHENEVER SQLERROR EXIT ROLLBACK

SPOOL Install_Orchestra_Oracle.log

/* 1. define a path_variable for your SQL_scripts_storage : Define scriptpath = '<path>'
   2. execute the sql_scripts: @"&<pathvariable>\script.sql"   */ 
prompt defining path variable scriptfolder ...
define scriptfolder = 'C:\Orchestra\Datenbank\Oracle'



prompt execute 03_orchestra_orc.sql ...
@@"&scriptfolder\03_orchestra_orc.sql"
prompt execute 04_orchestra_quartz.sql ...
@@"&scriptfolder\04_orchestra_quartz.sql"
prompt execute 05_orchestra_orc_security_data.sql ...
@@"&scriptfolder\05_orchestra_orc_security_data.sql"


prompt execute 07_orchestra_sequence.sql ...
@@"&scriptfolder\07_orchestra_sequence.sql"
prompt execute 08_orchestra_quartz_data.sql ...
@@"&scriptfolder\08_orchestra_quartz_data.sql"
prompt execute 09_orchestra_orc_message.sql ...
@@"&scriptfolder\09_orchestra_orc_message.sql"
prompt execute 10_orchestra_orc_process_scenario.sql ...
@@"&scriptfolder\10_orchestra_orc_process_scenario.sql"
prompt execute 11_orchestra_orc_xml_schema.sql ...
@@"&scriptfolder\11_orchestra_orc_xml_schema.sql"
prompt execute 12_orc_process_scenario.sql ...
@@"&scriptfolder\12_orc_process_scenario.sql"


prompt execute 14_V4.0.6.0_upgrade.sql ...
@@"&scriptfolder\14_V4.0.6.0_upgrade.sql"
prompt execute 15_V4.0.7.0_upgrade.sql ...
@@"&scriptfolder\15_V4.0.7.0_upgrade.sql"
prompt execute 16_V4.0.8.0_upgrade.sql ...
@@"&scriptfolder\16_V4.0.8.0_upgrade.sql"
prompt execute 17_V4.0.9.0_upgrade.sql ...
@@"&scriptfolder\17_V4.0.9.0_upgrade.sql"
prompt execute 18_V4.1.1.1_upgrade.sql ...
@@"&scriptfolder\18_V4.1.1.1_upgrade.sql"
prompt execute 19_V4.1.2.0_upgrade.sql ...
@@"&scriptfolder\19_V4.1.2.0_upgrade.sql"


prompt execute 21_V4.2.0.0_upgrade.sql ...
@@"&scriptfolder\21_V4.2.0.0_upgrade.sql"
prompt execute 22_V4.3.0.1_upgrade.sql ...
@@"&scriptfolder\22_V4.3.0.1_upgrade.sql"
prompt execute 23_V4.3.0.7_upgrade.sql ...
@@"&scriptfolder\23_V4.3.0.7_upgrade.sql"
prompt execute 24_V4.3.0.8_upgrade.sql ...
@@"&scriptfolder\24_V4.3.0.8_upgrade.sql"
prompt execute 25_V4.3.1.1_upgrade.sql ...
@@"&scriptfolder\25_V4.3.1.1_upgrade.sql"
prompt execute 26_V4.3.2.0_upgrade.sql ...
@@"&scriptfolder\26_V4.3.2.0_upgrade.sql"
prompt execute 27_V4.3.2.1_upgrade.sql ...
@@"&scriptfolder\27_V4.3.2.1_upgrade.sql"
prompt execute 28_V4.3.2.5_upgrade.sql ...
@@"&scriptfolder\28_V4.3.2.5_upgrade.sql"
prompt execute 29_V4.3.2.7_upgrade.sql ...
@@"&scriptfolder\29_V4.3.2.7_upgrade.sql"
prompt execute 30_V4.3.3.0_upgrade.sql ...
@@"&scriptfolder\30_V4.3.3.0_upgrade.sql"
prompt execute 31_V4.3.3.5_upgrade.sql ...
@@"&scriptfolder\31_V4.3.3.5_upgrade.sql"
prompt execute 35_0_V4.3.3.14_upgrade.sql ...
@@"&scriptfolder\35_0_V4.3.3.14_upgrade.sql"
prompt execute 35_1_V4.3.3.15_upgrade.sql ...
@@"&scriptfolder\35_1_V4.3.3.15_upgrade.sql"
prompt execute 36_V4.3.3.16_upgrade.sql ...
@@"&scriptfolder\36_V4.3.3.16_upgrade.sql"
prompt execute 40_V4.3.4.0_upgrade.sql ...
@@"&scriptfolder\40_V4.3.4.0_upgrade.sql"
prompt execute 42_V4.3.4.5_upgrade.sql ...
@@"&scriptfolder\42_V4.3.4.5_upgrade.sql"
prompt execute 44_V4.3.4.9_upgrade.sql ...
@@"&scriptfolder\44_V4.3.4.9_upgrade.sql"
prompt execute 45_V4.3.4.11_upgrade.sql ...
@@"&scriptfolder\45_V4.3.4.11_upgrade.sql"
prompt execute 46_V4.3.4.15_upgrade.sql ...
@@"&scriptfolder\46_V4.3.4.15_upgrade.sql"
prompt execute 50_V4.4.0.0_upgrade.sql ...
@@"&scriptfolder\50_V4.4.0.0_upgrade.sql"
prompt execute 51_V4.4.0.1_upgrade.sql ...
@@"&scriptfolder\51_V4.4.0.1_upgrade.sql"
prompt execute 52_V4.4.0.2_upgrade.sql ...
@@"&scriptfolder\52_V4.4.0.2_upgrade.sql"
prompt execute 53_V4.4.0.3_upgrade.sql ...
@@"&scriptfolder\53_V4.4.0.3_upgrade.sql"
prompt execute 54_V4.4.0.6_upgrade.sql ...
@@"&scriptfolder\54_V4.4.0.6_upgrade.sql"
prompt execute 56_V4.4.0.9_upgrade.sql ...
@@"&scriptfolder\56_V4.4.0.9_upgrade.sql"
prompt execute 57_V4.4.1.0_upgrade.sql ...
@@"&scriptfolder\57_V4.4.1.0_upgrade.sql"
prompt execute 58_V4.4.2.0_upgrade.sql ...
@@"&scriptfolder\58_V4.4.2.0_upgrade.sql"
prompt execute 59_V4.4.3.0_upgrade.sql ...
@@"&scriptfolder\59_V4.4.3.0_upgrade.sql"
prompt execute 60_V4.4.3.1_upgrade.sql ...
@@"&scriptfolder\60_V4.4.3.1_upgrade.sql"

prompt execute 70_V4.5.0.0_upgrade.sql ...
@@"&scriptfolder\70_V4.5.0.0_upgrade.sql"
prompt execute 71_V4.5.1.0_upgrade.sql ...
@@"&scriptfolder\71_V4.5.1.0_upgrade.sql"
prompt execute 72_V4.5.2.0_upgrade.sql ...
@@"&scriptfolder\72_V4.5.2.0_upgrade.sql"
prompt execute 73_V4.5.3.0_upgrade.sql ...
@@"&scriptfolder\73_V4.5.3.0_upgrade.sql"

prompt execute 74_V4.5.4.0_upgrade.sql ...
@@"&scriptfolder\74_V4.5.4.0_upgrade.sql"
prompt execute 75_V4.5.5.0_upgrade.sql ...
@@"&scriptfolder\75_V4.5.5.0_upgrade.sql"
prompt execute 76_V4.5.6.0_upgrade.sql ...
@@"&scriptfolder\76_V4.5.6.0_upgrade.sql"
prompt execute 77_V4.5.7.0_upgrade.sql ...
@@"&scriptfolder\77_V4.5.7.0_upgrade.sql"

/* ## activate only if orchestra cluster is used! ## */
/*
prompt execute 78_V4.5.7.0_upgrade_cluster.sql ...
@@"&scriptfolder\78_V4.5.7.0_upgrade_cluster.sql"
*/

prompt execute 85_V4.6.0.0_upgrade.sql ...
@@"&scriptfolder\85_V4.6.0.0_upgrade.sql"

/* ## activate only if orchestra cluster is used! ## */
/*
prompt execute 86_V4.6.0.0_upgrade_cluster.sql ...
@@"&scriptfolder\86_V4.6.0.0_upgrade_cluster.sql"
*/

prompt execute 89_V4.7.0.0_upgrade.sql ...
@@"&scriptfolder\89_V4.7.0.0_upgrade.sql"

/* ## activate only if orchestra cluster is used! ## */
/*
prompt execute 90_V4.7.0.0_upgrade_cluster.sql ...
@@"&scriptfolder\90_V4.7.0.0_upgrade_cluster.sql"
*/

prompt execute 91_V4.7.3.0_upgrade.sql ...
@@"&scriptfolder\91_V4.7.3.0_upgrade.sql"

/*
prompt execute 99_orchestra_partner.sql ...
@@"&scriptfolder\99_orchestra_partner.sql"
@@"&scriptfolder\99_01_orchestra_partner_upgrade_V4.5.0.0.sql"
@@"&scriptfolder\99_02_orchestra_partner_upgrade_V4.6.1.0.sql"
*/

SPOOL OFF
