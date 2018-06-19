-- execute skript 01_sys_create_schema_orchestra.sql first to create database and user!

-- 1. open SQL Server Management Studio
-- 2. open a new query
-- 3. activate the SQLCMD Mode (menu Query - SQLCMD Mode)
-- 4. set this to path where the sql files are located
:setvar SolutionDir "C:\temp\mssqlserver\"

USE [ORCHESTRA]
GO


:!! echo $(SolutionDir)03_orchestra_orc.sql
:r $(SolutionDir)03_orchestra_orc.sql
go

:!! echo $(SolutionDir)04_orchestra_quartz.sql
:r $(SolutionDir)04_orchestra_quartz.sql
go

:!! echo $(SolutionDir)05_orchestra_orc_security_data.sql
:r $(SolutionDir)05_orchestra_orc_security_data.sql
go









:!! echo $(SolutionDir)08_orchestra_quartz_data.sql
:r $(SolutionDir)08_orchestra_quartz_data.sql
go

:!! echo $(SolutionDir)09_orchestra_orc_message.sql
:r $(SolutionDir)09_orchestra_orc_message.sql
go

:!! echo $(SolutionDir)10_orchestra_orc_process_scenario.sql
:r $(SolutionDir)10_orchestra_orc_process_scenario.sql
go

:!! echo $(SolutionDir)11_orchestra_orc_xml_schema.sql
:r $(SolutionDir)11_orchestra_orc_xml_schema.sql
go

:!! echo $(SolutionDir)12_orc_process_scenario.sql
:r $(SolutionDir)12_orc_process_scenario.sql
go





:!! echo $(SolutionDir)14_V4.0.6.0_upgrade.sql
:r $(SolutionDir)14_V4.0.6.0_upgrade.sql
go

:!! echo $(SolutionDir)15_V4.0.7.0_upgrade.sql
:r $(SolutionDir)15_V4.0.7.0_upgrade.sql
go

:!! echo $(SolutionDir)16_V4.0.8.0_upgrade.sql
:r $(SolutionDir)16_V4.0.8.0_upgrade.sql
go

:!! echo $(SolutionDir)17_V4.0.9.0_upgrade.sql
:r $(SolutionDir)17_V4.0.9.0_upgrade.sql
go

:!! echo $(SolutionDir)18_V4.1.1.1_upgrade.sql
:r $(SolutionDir)18_V4.1.1.1_upgrade.sql
go

:!! echo $(SolutionDir)19_V4.1.2.0_upgrade.sql
:r $(SolutionDir)19_V4.1.2.0_upgrade.sql
go





:!! echo $(SolutionDir)21_V4.2.0.0_upgrade.sql
:r $(SolutionDir)21_V4.2.0.0_upgrade.sql
go

:!! echo $(SolutionDir)22_V4.3.0.1_upgrade.sql
:r $(SolutionDir)22_V4.3.0.1_upgrade.sql
go

:!! echo $(SolutionDir)23_V4.3.0.7_upgrade.sql
:r $(SolutionDir)23_V4.3.0.7_upgrade.sql
go

:!! echo $(SolutionDir)24_V4.3.0.8_upgrade.sql
:r $(SolutionDir)24_V4.3.0.8_upgrade.sql
go

:!! echo $(SolutionDir)25_V4.3.1.1_upgrade.sql
:r $(SolutionDir)25_V4.3.1.1_upgrade.sql
go

:!! echo $(SolutionDir)26_V4.3.2.0_upgrade.sql
:r $(SolutionDir)26_V4.3.2.0_upgrade.sql
go

:!! echo $(SolutionDir)27_V4.3.2.1_upgrade.sql
:r $(SolutionDir)27_V4.3.2.1_upgrade.sql
go

:!! echo $(SolutionDir)28_V4.3.2.5_upgrade.sql
:r $(SolutionDir)28_V4.3.2.5_upgrade.sql
go

:!! echo $(SolutionDir)29_V4.3.2.7_upgrade.sql
:r $(SolutionDir)29_V4.3.2.7_upgrade.sql
go

:!! echo $(SolutionDir)30_V4.3.3.0_upgrade.sql
:r $(SolutionDir)30_V4.3.3.0_upgrade.sql
go

:!! echo $(SolutionDir)31_V4.3.3.5_upgrade.sql
:r $(SolutionDir)31_V4.3.3.5_upgrade.sql
go

:!! echo $(SolutionDir)32_V4.3.3.8_upgrade.sql
:r $(SolutionDir)32_V4.3.3.8_upgrade.sql
go

:!! echo $(SolutionDir)33_V4.3.3.11_upgrade.sql
:r $(SolutionDir)33_V4.3.3.11_upgrade.sql
go

:!! echo $(SolutionDir)35_0_V4.3.3.14_upgrade.sql
:r $(SolutionDir)35_0_V4.3.3.14_upgrade.sql
go

:!! echo $(SolutionDir)35_1_V4.3.3.15_upgrade.sql
:r $(SolutionDir)35_1_V4.3.3.15_upgrade.sql
go

:!! echo $(SolutionDir)35_2_V4.3.3.15_upgrade.sql
:r $(SolutionDir)35_2_V4.3.3.15_upgrade.sql
go

:!! echo $(SolutionDir)36_V4.3.3.16_upgrade.sql
:r $(SolutionDir)36_V4.3.3.16_upgrade.sql
go

:!! echo $(SolutionDir)40_V4.3.4.0_upgrade.sql
:r $(SolutionDir)40_V4.3.4.0_upgrade.sql
go

:!! echo $(SolutionDir)41_V4.3.4.4_upgrade.sql
:r $(SolutionDir)41_V4.3.4.4_upgrade.sql
go

:!! echo $(SolutionDir)42_V4.3.4.5_upgrade.sql
:r $(SolutionDir)42_V4.3.4.5_upgrade.sql
go

:!! echo $(SolutionDir)43_V4.3.4.6_upgrade.sql
:r $(SolutionDir)43_V4.3.4.6_upgrade.sql
go

:!! echo $(SolutionDir)44_V4.3.4.9_upgrade.sql
:r $(SolutionDir)44_V4.3.4.9_upgrade.sql
go

:!! echo $(SolutionDir)45_V4.3.4.11_upgrade.sql
:r $(SolutionDir)45_V4.3.4.11_upgrade.sql
go

:!! echo $(SolutionDir)46_V4.3.4.15_upgrade.sql
:r $(SolutionDir)46_V4.3.4.15_upgrade.sql
go

:!! echo $(SolutionDir)47_V4.3.4.21_upgrade.sql
:r $(SolutionDir)47_V4.3.4.21_upgrade.sql
go

:!! echo $(SolutionDir)50_V4.4.0.0_upgrade.sql
:r $(SolutionDir)50_V4.4.0.0_upgrade.sql
go

:!! echo $(SolutionDir)51_V4.4.0.1_upgrade.sql
:r $(SolutionDir)51_V4.4.0.1_upgrade.sql
go

:!! echo $(SolutionDir)52_V4.4.0.2_upgrade.sql
:r $(SolutionDir)52_V4.4.0.2_upgrade.sql
go

:!! echo $(SolutionDir)53_V4.4.0.3_upgrade.sql
:r $(SolutionDir)53_V4.4.0.3_upgrade.sql
go

:!! echo $(SolutionDir)54_V4.4.0.6_upgrade.sql
:r $(SolutionDir)54_V4.4.0.6_upgrade.sql
go

:!! echo $(SolutionDir)55_V4.4.0.8_upgrade.sql
:r $(SolutionDir)55_V4.4.0.8_upgrade.sql
go

:!! echo $(SolutionDir)56_V4.4.0.9_upgrade.sql
:r $(SolutionDir)56_V4.4.0.9_upgrade.sql
go

:!! echo $(SolutionDir)57_V4.4.1.0_upgrade.sql
:r $(SolutionDir)57_V4.4.1.0_upgrade.sql
go

:!! echo $(SolutionDir)58_V4.4.2.0_upgrade.sql
:r $(SolutionDir)58_V4.4.2.0_upgrade.sql
go

:!! echo $(SolutionDir)59_V4.4.3.0_upgrade.sql
:r $(SolutionDir)59_V4.4.3.0_upgrade.sql
go

:!! echo $(SolutionDir)60_V4.4.3.1_upgrade.sql
:r $(SolutionDir)60_V4.4.3.1_upgrade.sql
go

:!! echo $(SolutionDir)70_V4.5.0.0_upgrade.sql
:r $(SolutionDir)70_V4.5.0.0_upgrade.sql
go

:!! echo $(SolutionDir)71_V4.5.1.0_upgrade.sql
:r $(SolutionDir)71_V4.5.1.0_upgrade.sql
go

:!! echo $(SolutionDir)72_V4.5.2.0_upgrade.sql
:r $(SolutionDir)72_V4.5.2.0_upgrade.sql
go


:!! echo $(SolutionDir)73_V4.5.3.0_upgrade.sql
:r $(SolutionDir)73_V4.5.3.0_upgrade.sql
go

:!! echo $(SolutionDir)74_V4.5.4.0_upgrade.sql
:r $(SolutionDir)74_V4.5.4.0_upgrade.sql
go

:!! echo $(SolutionDir)75_V4.5.5.0_upgrade.sql
:r $(SolutionDir)75_V4.5.5.0_upgrade.sql
go

:!! echo $(SolutionDir)76_V4.5.6.0_upgrade.sql
:r $(SolutionDir)76_V4.5.6.0_upgrade.sql
go

:!! echo $(SolutionDir)77_V4.5.7.0_upgrade.sql
:r $(SolutionDir)77_V4.5.7.0_upgrade.sql
go

-- ## activate only if orchestra cluster is used! ##
-- :!! echo $(SolutionDir)78_V4.5.7.0_upgrade_cluster.sql
-- :r $(SolutionDir)78_V4.5.7.0_upgrade_cluster.sql
-- go

:!! echo $(SolutionDir)85_V4.6.0.0_upgrade.sql
:r $(SolutionDir)85_V4.6.0.0_upgrade.sql
go

-- ## activate only if orchestra cluster is used! ##
-- :!! echo $(SolutionDir)86_V4.6.0.0_upgrade_cluster.sql
-- :r $(SolutionDir)86_V4.6.0.0_upgrade_cluster.sql
-- go

:!! echo $(SolutionDir)89_V4.7.0.0_upgrade.sql
:r $(SolutionDir)89_V4.7.0.0_upgrade.sql
go

-- ## activate only if orchestra cluster is used! ##
-- :!! echo $(SolutionDir)90_V4.7.0.0_upgrade_cluster.sql
-- :r $(SolutionDir)90_V4.7.0.0_upgrade_cluster.sql
-- go

:!! echo $(SolutionDir)91_V4.7.3.0_upgrade.sql
:r $(SolutionDir)91_V4.7.3.0_upgrade.sql
go

-- ## activate if orchestra partner management is used! ##
-- :!! echo $(SolutionDir)99_orchestra_partner.sql
-- :r $(SolutionDir)99_orchestra_partner.sql
-- go

-- :!! echo $(SolutionDir)99_01_orchestra_partner_upgrade_V4.5.0.0.sql
-- :r $(SolutionDir)99_01_orchestra_partner_upgrade_V4.5.0.0.sql
-- go

-- :!! echo $(SolutionDir)99_02_orchestra_partner_upgrade_V4.6.1.0.sql
-- :r $(SolutionDir)99_02_orchestra_partner_upgrade_V4.6.1.0.sql
-- go
