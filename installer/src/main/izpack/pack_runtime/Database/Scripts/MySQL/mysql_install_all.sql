/* RUN THIS SCRIPT FROM MYSQL COMMAND LINE  */
/* 1. replace <db> with your databasename
   2. replace %INSTALL_PATH\Database\Scripts
   2. run the script   */ 

use %DATABASE_NAME
tee log_sql_orc.txt


\. %FILE_PATH%03_orchestra_orc.sql
\. %FILE_PATH%04_orchestra_quartz.sql
\. %FILE_PATH%05_orchestra_orc_security_data.sql

\. %FILE_PATH%08_orchestra_quartz_data.sql
\. %FILE_PATH%09_orchestra_orc_message.sql
\. %FILE_PATH%10_orchestra_orc_process_scenario.sql
\. %FILE_PATH%11_orchestra_orc_xml_schema.sql
\. %FILE_PATH%12_orc_process_scenario.sql

\. %FILE_PATH%14_V4.0.6.0_upgrade.sql
\. %FILE_PATH%15_V4.0.7.0_upgrade.sql
\. %FILE_PATH%16_V4.0.8.0_upgrade.sql
\. %FILE_PATH%17_V4.0.9.0_upgrade.sql
\. %FILE_PATH%18_V4.1.1.1_upgrade.sql
\. %FILE_PATH%19_V4.1.2.0_upgrade.sql

\. %FILE_PATH%21_V4.2.0.0_upgrade.sql
\. %FILE_PATH%22_V4.3.0.1_upgrade.sql
\. %FILE_PATH%23_V4.3.0.7_upgrade.sql
\. %FILE_PATH%24_V4.3.0.8_upgrade.sql
\. %FILE_PATH%25_V4.3.1.1_upgrade.sql
\. %FILE_PATH%26_V4.3.2.0_upgrade.sql
\. %FILE_PATH%27_V4.3.2.1_upgrade.sql
\. %FILE_PATH%28_V4.3.2.5_upgrade.sql
\. %FILE_PATH%29_V4.3.2.7_upgrade.sql
\. %FILE_PATH%30_V4.3.3.0_upgrade.sql
\. %FILE_PATH%31_V4.3.3.5_upgrade.sql
\. %FILE_PATH%32_V4.3.3.8_upgrade.sql
\. %FILE_PATH%33_V4.3.3.10_upgrade.sql
\. %FILE_PATH%34_V4.3.3.13_upgrade.sql
\. %FILE_PATH%35_0_V4.3.3.14_upgrade.sql
\. %FILE_PATH%35_1_V4.3.3.15_upgrade.sql
\. %FILE_PATH%36_V4.3.3.16_upgrade.sql
\. %FILE_PATH%40_V4.3.4.0_upgrade.sql
\. %FILE_PATH%42_V4.3.4.5_upgrade.sql
\. %FILE_PATH%44_V4.3.4.9_upgrade.sql
\. %FILE_PATH%45_V4.3.4.11_upgrade.sql
\. %FILE_PATH%46_V4.3.4.15_upgrade.sql
\. %FILE_PATH%47_V4.3.4.18_upgrade.sql
\. %FILE_PATH%50_V4.4.0.0_upgrade.sql
\. %FILE_PATH%51_V4.4.0.1_upgrade.sql
\. %FILE_PATH%52_V4.4.0.2_upgrade.sql
\. %FILE_PATH%53_V4.4.0.3_upgrade.sql
\. %FILE_PATH%54_V4.4.0.6_upgrade.sql
\. %FILE_PATH%56_V4.4.0.9_upgrade.sql
\. %FILE_PATH%57_V4.4.1.0_upgrade.sql
\. %FILE_PATH%58_V4.4.2.0_upgrade.sql
\. %FILE_PATH%59_V4.4.3.0_upgrade.sql
\. %FILE_PATH%60_V4.4.3.1_upgrade.sql

\. %FILE_PATH%70_V4.5.0.0_upgrade.sql
\. %FILE_PATH%71_V4.5.1.0_upgrade.sql
\. %FILE_PATH%72_V4.5.2.0_upgrade.sql
\. %FILE_PATH%73_V4.5.3.0_upgrade.sql
\. %FILE_PATH%74_V4.5.4.0_upgrade.sql
\. %FILE_PATH%75_V4.5.5.0_upgrade.sql
\. %FILE_PATH%76_V4.5.6.0_upgrade.sql
\. %FILE_PATH%77_V4.5.7.0_upgrade.sql

/* ## activate only if orchestra cluster is used! ## */
/*
\. %FILE_PATH%78_V4.5.7.0_upgrade_cluster.sql
*/

\. %FILE_PATH%85_V4.6.0.0_upgrade.sql

/* ## activate only if orchestra cluster is used! ## */
/*
\. %FILE_PATH%86_V4.6.0.0_upgrade_cluster.sql
*/

\. %FILE_PATH%89_V4.7.0.0_upgrade.sql

/* ## activate only if orchestra cluster is used! ## */
/*
\. %FILE_PATH%90_V4.7.0.0_upgrade_cluster.sql
*/

\. %FILE_PATH%91_V4.7.3.0_upgrade.sql


/* -- ## activate if orchestra partner management is used! ##
\. %FILE_PATH%99_orchestra_partner.sql
\. %FILE_PATH%99_01_orchestra_partner_upgrade_V4.5.0.0.sql
\. %FILE_PATH%99_02_orchestra_partner_upgrade_V4.6.1.0.sql
*/
