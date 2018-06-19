Insert into QRTZ_LOCKS
   (LOCK_NAME)
 Values
   ('TRIGGER_ACCESS');
Insert into QRTZ_LOCKS
   (LOCK_NAME)
 Values
   ('JOB_ACCESS');
Insert into QRTZ_LOCKS
   (LOCK_NAME)
 Values
   ('CALENDAR_ACCESS');
Insert into QRTZ_LOCKS
   (LOCK_NAME)
 Values
   ('STATE_ACCESS');
Insert into QRTZ_LOCKS
   (LOCK_NAME)
 Values
   ('MISFIRE_ACCESS');
COMMIT;

