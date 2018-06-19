/* RUN THIS SCRIPT FROM MYSQL COMMAND LINE  */
/* 1. replace <db> with your databasename
   2. replace C:\Orchestra\Database\Scripts
   2. run the script   */ 

use ORC
tee log_sql_orc.txt


\. C:\Orchestra\Database\Scripts\MySQL\03_orchestra_orc.sql
\. C:\Orchestra\Database\Scripts\MySQL\04_orchestra_quartz.sql
\. C:\Orchestra\Database\Scripts\MySQL\05_orchestra_orc_security_data.sql

\. C:\Orchestra\Database\Scripts\MySQL\08_orchestra_quartz_data.sql
\. C:\Orchestra\Database\Scripts\MySQL\09_orchestra_orc_message.sql
\. C:\Orchestra\Database\Scripts\MySQL\10_orchestra_orc_process_scenario.sql
\. C:\Orchestra\Database\Scripts\MySQL\11_orchestra_orc_xml_schema.sql
\. C:\Orchestra\Database\Scripts\MySQL\12_orc_process_scenario.sql

\. C:\Orchestra\Database\Scripts\MySQL\14_V4.0.6.0_upgrade.sql
\. C:\Orchestra\Database\Scripts\MySQL\15_V4.0.7.0_upgrade.sql
\. C:\Orchestra\Database\Scripts\MySQL\16_V4.0.8.0_upgrade.sql
\. C:\Orchestra\Database\Scripts\MySQL\17_V4.0.9.0_upgrade.sql
\. C:\Orchestra\Database\Scripts\MySQL\18_V4.1.1.1_upgrade.sql
\. C:\Orchestra\Database\Scripts\MySQL\19_V4.1.2.0_upgrade.sql

\. C:\Orchestra\Database\Scripts\MySQL\21_V4.2.0.0_upgrade.sql
\. C:\Orchestra\Database\Scripts\MySQL\22_V4.3.0.1_upgrade.sql
\. C:\Orchestra\Database\Scripts\MySQL\23_V4.3.0.7_upgrade.sql
\. C:\Orchestra\Database\Scripts\MySQL\24_V4.3.0.8_upgrade.sql
\. C:\Orchestra\Database\Scripts\MySQL\25_V4.3.1.1_upgrade.sql
\. C:\Orchestra\Database\Scripts\MySQL\26_V4.3.2.0_upgrade.sql
\. C:\Orchestra\Database\Scripts\MySQL\27_V4.3.2.1_upgrade.sql
\. C:\Orchestra\Database\Scripts\MySQL\28_V4.3.2.5_upgrade.sql
\. C:\Orchestra\Database\Scripts\MySQL\29_V4.3.2.7_upgrade.sql
\. C:\Orchestra\Database\Scripts\MySQL\30_V4.3.3.0_upgrade.sql
\. C:\Orchestra\Database\Scripts\MySQL\31_V4.3.3.5_upgrade.sql
\. C:\Orchestra\Database\Scripts\MySQL\32_V4.3.3.8_upgrade.sql
\. C:\Orchestra\Database\Scripts\MySQL\33_V4.3.3.10_upgrade.sql
\. C:\Orchestra\Database\Scripts\MySQL\34_V4.3.3.13_upgrade.sql
\. C:\Orchestra\Database\Scripts\MySQL\35_0_V4.3.3.14_upgrade.sql
\. C:\Orchestra\Database\Scripts\MySQL\35_1_V4.3.3.15_upgrade.sql
\. C:\Orchestra\Database\Scripts\MySQL\36_V4.3.3.16_upgrade.sql
\. C:\Orchestra\Database\Scripts\MySQL\40_V4.3.4.0_upgrade.sql
\. C:\Orchestra\Database\Scripts\MySQL\42_V4.3.4.5_upgrade.sql
\. C:\Orchestra\Database\Scripts\MySQL\44_V4.3.4.9_upgrade.sql
\. C:\Orchestra\Database\Scripts\MySQL\45_V4.3.4.11_upgrade.sql
\. C:\Orchestra\Database\Scripts\MySQL\46_V4.3.4.15_upgrade.sql
\. C:\Orchestra\Database\Scripts\MySQL\47_V4.3.4.18_upgrade.sql
\. C:\Orchestra\Database\Scripts\MySQL\50_V4.4.0.0_upgrade.sql
\. C:\Orchestra\Database\Scripts\MySQL\51_V4.4.0.1_upgrade.sql
\. C:\Orchestra\Database\Scripts\MySQL\52_V4.4.0.2_upgrade.sql
\. C:\Orchestra\Database\Scripts\MySQL\53_V4.4.0.3_upgrade.sql
\. C:\Orchestra\Database\Scripts\MySQL\54_V4.4.0.6_upgrade.sql
\. C:\Orchestra\Database\Scripts\MySQL\56_V4.4.0.9_upgrade.sql
\. C:\Orchestra\Database\Scripts\MySQL\57_V4.4.1.0_upgrade.sql
\. C:\Orchestra\Database\Scripts\MySQL\58_V4.4.2.0_upgrade.sql
\. C:\Orchestra\Database\Scripts\MySQL\59_V4.4.3.0_upgrade.sql
\. C:\Orchestra\Database\Scripts\MySQL\60_V4.4.3.1_upgrade.sql

\. C:\Orchestra\Database\Scripts\MySQL\70_V4.5.0.0_upgrade.sql
\. C:\Orchestra\Database\Scripts\MySQL\71_V4.5.1.0_upgrade.sql
\. C:\Orchestra\Database\Scripts\MySQL\72_V4.5.2.0_upgrade.sql
\. C:\Orchestra\Database\Scripts\MySQL\73_V4.5.3.0_upgrade.sql
\. C:\Orchestra\Database\Scripts\MySQL\74_V4.5.4.0_upgrade.sql
\. C:\Orchestra\Database\Scripts\MySQL\75_V4.5.5.0_upgrade.sql
\. C:\Orchestra\Database\Scripts\MySQL\76_V4.5.6.0_upgrade.sql
\. C:\Orchestra\Database\Scripts\MySQL\77_V4.5.7.0_upgrade.sql

/* ## activate only if orchestra cluster is used! ## */
/*
\. C:\Orchestra\Database\Scripts\MySQL\78_V4.5.7.0_upgrade_cluster.sql
*/

\. C:\Orchestra\Database\Scripts\MySQL\85_V4.6.0.0_upgrade.sql

/* ## activate only if orchestra cluster is used! ## */
/*
\. C:\Orchestra\Database\Scripts\MySQL\86_V4.6.0.0_upgrade_cluster.sql
*/

\. C:\Orchestra\Database\Scripts\MySQL\89_V4.7.0.0_upgrade.sql

/* ## activate only if orchestra cluster is used! ## */
/*
\. C:\Orchestra\Database\Scripts\MySQL\90_V4.7.0.0_upgrade_cluster.sql
*/

\. C:\Orchestra\Database\Scripts\MySQL\91_V4.7.3.0_upgrade.sql


/* -- ## activate if orchestra partner management is used! ##
\. C:\Orchestra\Database\Scripts\MySQL\99_orchestra_partner.sql
\. C:\Orchestra\Database\Scripts\MySQL\99_01_orchestra_partner_upgrade_V4.5.0.0.sql
\. C:\Orchestra\Database\Scripts\MySQL\99_02_orchestra_partner_upgrade_V4.6.1.0.sql
*/
