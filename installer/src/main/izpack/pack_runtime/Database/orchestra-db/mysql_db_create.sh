#!/bin/bash

# Functions
ok_without_drop() { echo -e '\e[32m'$1'\e[m'; } # Green
ok_with_drop() { echo -e '\e[32m'$1'\e[m'; } # Green

EXPECTED_ARGS=3
E_BADARGS=65
MYSQL=`which mysql`

Q0="DROP DATABASE $1;"
Q1="DROP USER $2@localhost;"
Q2="CREATE DATABASE IF NOT EXISTS $1;"
Q3="CREATE USER '$2'@'localhost' IDENTIFIED BY '$3';"
Q4="GRANT ALL PRIVILEGES ON $1.* TO '$2'@'localhost';"
Q5="FLUSH PRIVILEGES;"
SQL_WITH_DROP="${Q0}${Q1}${Q2}${Q3}${Q4}${Q5}"
SQL_WITHOUT_DROP="${Q2}${Q3}${Q4}${Q5}"

 
if [ $# -ne $EXPECTED_ARGS ]
then
  echo "Usage: $0 dbname dbuser dbpass"
  exit $E_BADARGS
fi


RESULT=`mysqlshow --user=root --password=admin ORC| grep -v Wildcard | grep -o ORC`
if [ "$RESULT" == "ORC" ]; then
    echo "FOUND"
    $MYSQL -uroot -p -e "$SQL_WITH_DROP"
    ok_with_drop "Recreate Database $1 and user $2 created with a password $3"
else
    echo "NOT FOUND"
    $MYSQL -uroot -p -e "$SQL_WITHOUT_DROP"
    ok_without_drop "Database $1 and user $2 created with a password $3"
fi

