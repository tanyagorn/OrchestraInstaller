Orchestra mit Oracle

Das Script 00_sys_tablespace.sql legt die Tablespaces an.
Die Pfade für diese Tablespaces muessen evtl. angepasst werden.

Die Scripte "00_sys_tablespace.sql" und "01_sys_create_schema.sql"
müssen als User "system" ausgeführt werden.

Das Script "02_install_orchestra_all.sql" muss als User "orchestra" 
ausgeführt werden.
Es ruft alle anderen Scripte auf und erzeugt eine Log-Datei. 

