Orchestra mit Oracle

Das Script 00_sys_tablespace.sql legt die Tablespaces an.
Die Pfade f�r diese Tablespaces muessen evtl. angepasst werden.

Die Scripte "00_sys_tablespace.sql" und "01_sys_create_schema.sql"
m�ssen als User "system" ausgef�hrt werden.

Das Script "02_install_orchestra_all.sql" muss als User "orchestra" 
ausgef�hrt werden.
Es ruft alle anderen Scripte auf und erzeugt eine Log-Datei. 

