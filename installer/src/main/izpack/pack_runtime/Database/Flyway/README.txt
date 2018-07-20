1. Please configure conf/flyway.conf file with your DB connection string and target DB scripts.
2. If necessary, add JDBC driver for your DB in drivers directory
3. Execute "flyway.cmd clean" for cleaning DB Schema (only for the first time)
4. Execute "flyway.cmd migrate" for migrating DB Schema to the last version