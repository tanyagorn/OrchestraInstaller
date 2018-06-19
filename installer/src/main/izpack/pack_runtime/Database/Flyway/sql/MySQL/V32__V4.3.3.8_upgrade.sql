
/*
In MySQL the default value of the second timestamp column (in this case PRS_END_TIME) is 0000-00-00 00:00:00
Therefore in the Orchestra Monitor sometimes the error "Cannot execute query" arose, when one tried to view process instances.
The log file then containted the following Hibernate error message: Cannot convert value '0000-00-00 00:00:00' from column 4 to TIMESTAMP.

Caveat: The rules for default values for timestamp columns in MySQL are weird! See the mySQL reference.
*/

ALTER TABLE ORC_PROCESS_STATE MODIFY PRS_END_TIME TIMESTAMP NULL;

commit;
