MySQL
- deprecated Tabellen wurden entfernt (JBPM-Tabllen, ORC_SEC_USER, ORC_EVENT_ACTIONS, ...)
- Tabellen und Spalten werden nun in Großbuchstaben angelegt (-> Parameter lower_case_table_names ist nicht mehr notwendig)
- Views werden mit dem Zusatz "SQL SECURITY INVOKER" angelegt
- wegen MySQL 5.7 wurde TIMESTAMP zu TIMESTAMP NULL
  - im Skript 50_V4.4.0.0_upgrade.sql wurde CURRENT_TIMESTAMP eingebaut:
    ALTER TABLE `ORC_PROCESS_STATE` MODIFY `PRS_CREATE_TIME` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;
  - im Skript 40_V4.3.4.0_upgrade.sql wurde NOT NULL zu NULL geändert:
    CREATE TABLE ORC_TRANSACTION (
       TRA_CREATE_DATE TIMESTAMP NULL,
    -> wird vom Code her mit aktuellem Zeitstempel befüllt
- um für MySQL 5.5 abwärtskompatibel zu bleiben, muss als Datentyp TIMESTAMP verwendet werden wenn ein Default-Wert gesetzt werden soll. Der Typ Datetime ist hier leider nicht zulässig!
- Skript '_drop tables orc.sql' erstellt

MSSQLServer
- deprecated Tabellen wurden entfernt (JBPM-Tabllen, ORC_SEC_USER, ORC_EVENT_ACTIONS, ...)
- Skript '_drop tables orc.sql' angepasst

Oracle
- deprecated Tabellen wurden entfernt (JBPM-Tabllen, ORC_SEC_USER, ORC_EVENT_ACTIONS, ...)
- der nicht mehr unterstützte Spaltentyp LongRAW wurde durch Blob ersetzt (IN-0001121)
- Skript '_drop tables orc.sql' erstellt

DB2
- deprecated Tabellen wurden entfernt (JBPM-Tabllen, ORC_SEC_USER, ORC_EVENT_ACTIONS, ...)
- Skript '_drop tables orc.sql' erstellt
- Readme_db2.txt angepasst für Linux
